require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmOurFichaL5R4e()
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
    obj:setDataType("L5R_4e_Otimizado");
    obj:setTitle("L5R 4e (Otimizado)");
    obj:setName("frmOurFichaL5R4e");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'lastroTerra', 'extraFerimentos', 'BHealth', 'earth', 'PWound'});
    obj.dataLink1:setDefaultValues({'2', '0'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'QHealer', 'nivelSb', 'stamina'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'ferimentos', 'earth', 'PWound', 'BHealth', 'lastroTerra', 'LEsco'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'maisSab', 'earth', 'air', 'water', 'fire', 'void', 'countSum'});
    obj.dataLink4:setDefaultValue("0");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("sabedoria");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setFields({'Escoriado', 'Machucado', 'Ferido', 'SerFerido', 'Incapacitado', 'Abatido', 'LPThold', 'SotEarth'});
    obj.dataLink6:setDefaultValues({'+3', '+5', '+10', '+15', '+20', '+40'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'willpower', 'stamina'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'strength', 'perception'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'agility', 'intelligence'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'awareness', 'reflexes'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'addRolaIni', 'addMantemIni', 'reflexes', 'nivelSb'});
    obj.dataLink11:setDefaultValues({'0', '0'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setFields({'bonusNA', 'reflexes'});
    obj.dataLink12:setDefaultValue("0");
    obj.dataLink12:setName("dataLink12");


	local function TrocarAba(a)
		if(a == 'F') then
			self.layFrente.visible = true;
			self.layMecanicas.visible = false;
			self.layMagias.visible = false;
			self.layBG.visible = false;
			self.layNote.visible = false;
		elseif(a == 'M') then
			self.layFrente.visible = false;
			self.layMecanicas.visible = true;
			self.layMagias.visible = false;
			self.layBG.visible = false;
			self.layNote.visible = false;
		elseif(a == 'S') then
			self.layFrente.visible = false;
			self.layMecanicas.visible = false;
			self.layMagias.visible = true;
			self.layBG.visible = false;
			self.layNote.visible = false;
		elseif(a == 'H') then
			self.layFrente.visible = false;
			self.layMecanicas.visible = false;
			self.layMagias.visible = false;
			self.layBG.visible = true;
			self.layNote.visible = false;
		elseif(a == 'A') then
			self.layFrente.visible = false;
			self.layMecanicas.visible = false;
			self.layMagias.visible = false;
			self.layBG.visible = false;
			self.layNote.visible = true;
		end;
	end;



    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setField("URLImagemFundo");
    obj.image1:setAlign("client");
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("/Frames/blur.png");
    obj.image1:setName("image1");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setAlign("top");
    obj.flowPart1:setMinWidth(400);
    obj.flowPart1:setMaxWidth(1000);
    obj.flowPart1:setHeight(1600);
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
    obj.rectangle1:setMargins({top=20, bottom=20});

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

    obj.layFrente = GUI.fromHandle(_obj_newObject("layout"));
    obj.layFrente:setParent(obj.rectangle3);
    obj.layFrente:setName("layFrente");
    obj.layFrente:setAlign("client");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.layFrente);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMinWidth(300);
    obj.flowPart2:setMaxWidth(650);
    obj.flowPart2:setHeight(1600);
    obj.flowPart2:setName("flowPart2");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowPart2);
    obj.rectangle4:setMargins({left=20, right=10, top=20});
    obj.rectangle4:setAlign("top");
    obj.rectangle4:setHeight(30);
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setColor("#212121");
    obj.rectangle4:setName("rectangle4");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle4);
    obj.button1:setText("F R E N T E");
    obj.button1:setName("button1");
    obj.button1:setAlign("left");
    obj.button1:setMargins({right=2});
    obj.button1:setWidth(100);
    obj.button1:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setFontSize(10);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle4);
    obj.button2:setText("M E C Â N I C A S");
    obj.button2:setName("button2");
    obj.button2:setAlign("left");
    obj.button2:setMargins({right=2});
    obj.button2:setWidth(100);
    obj.button2:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button2, "fontStyle",  "bold");
    obj.button2:setFontSize(10);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle4);
    obj.button3:setText("M A G I A S");
    obj.button3:setName("button3");
    obj.button3:setAlign("left");
    obj.button3:setMargins({right=2});
    obj.button3:setWidth(100);
    obj.button3:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button3, "fontStyle",  "bold");
    obj.button3:setFontSize(10);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle4);
    obj.button4:setText("H I S T Ó R I A");
    obj.button4:setName("button4");
    obj.button4:setAlign("left");
    obj.button4:setMargins({right=2});
    obj.button4:setWidth(100);
    obj.button4:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button4, "fontStyle",  "bold");
    obj.button4:setFontSize(10);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.rectangle4);
    obj.button5:setText("A N O T A Ç Õ E S");
    obj.button5:setName("button5");
    obj.button5:setAlign("left");
    obj.button5:setMargins({right=2});
    obj.button5:setWidth(100);
    obj.button5:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button5, "fontStyle",  "bold");
    obj.button5:setFontSize(10);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart2);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({top=10, left=20, bottom=15});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("P E R S O N A G E M");
    obj.label1:setWidth(190);
    obj.label1:setFontSize(20);
    obj.label1:setFontFamily("Constantia");
    obj.label1:setName("label1");
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.layout1);
    obj.horzLine1:setAlign("client");
    obj.horzLine1:setMargins({right=9, top=14});
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setName("horzLine1");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flowPart2);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout3);
    obj.flowPart3:setMaxWidth(350);
    obj.flowPart3:setMinWidth(350);
    obj.flowPart3:setHeight(120);
    obj.flowPart3:setName("flowPart3");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart3);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({left=25});
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setText("Nome:");
    obj.label2:setWidth(40);
    obj.label2:setName("label2");
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontFamily("Cambria");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setField("nomeChar");
    obj.edit1:setAlign("client");
    obj.edit1:setMargins({right=10});
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("#cdcdcd");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setTransparent(true);

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout2);
    obj.dataLink13:setField("nomeChar");
    obj.dataLink13:setDefaultValue("—");
    obj.dataLink13:setName("dataLink13");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.flowPart3);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({left=25});
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setAlign("left");
    obj.label3:setText("Clã:");
    obj.label3:setWidth(25);
    obj.label3:setName("label3");
    obj.label3:setFontColor("white");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontFamily("Cambria");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setField("claChar");
    obj.edit2:setAlign("client");
    obj.edit2:setMargins({right=10});
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("#cdcdcd");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setTransparent(true);

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout3);
    obj.dataLink14:setField("claChar");
    obj.dataLink14:setDefaultValue("—");
    obj.dataLink14:setName("dataLink14");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(30);
    obj.layout4:setMargins({left=25});
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setAlign("left");
    obj.label4:setText("Escola:");
    obj.label4:setWidth(45);
    obj.label4:setName("label4");
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontFamily("Cambria");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setField("escolaChar");
    obj.edit3:setAlign("client");
    obj.edit3:setMargins({right=10});
    obj.edit3:setName("edit3");
    obj.edit3:setFontColor("#cdcdcd");
    obj.edit3:setFontFamily("Cambria");
    obj.edit3:setTransparent(true);

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout4);
    obj.dataLink15:setField("escolaChar");
    obj.dataLink15:setDefaultValue("—");
    obj.dataLink15:setName("dataLink15");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout3);
    obj.flowPart4:setMaxWidth(150);
    obj.flowPart4:setMinWidth(150);
    obj.flowPart4:setHeight(120);
    obj.flowPart4:setName("flowPart4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart4);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(30);
    obj.layout5:setName("layout5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setText("Nível:");
    obj.label5:setAlign("left");
    obj.label5:setWidth(100);
    obj.label5:setName("label5");
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontFamily("Cambria");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout5);
    obj.rectangle5:setLeft(80);
    obj.rectangle5:setTop(2.5);
    obj.rectangle5:setWidth(25);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setXradius(20);
    obj.rectangle5:setYradius(20);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setColor("#101010");
    obj.rectangle5:setName("rectangle5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle5);
    obj.label6:setField("nivelSb");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setAlign("client");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontFamily("Cambria");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle5);
    obj.dataLink16:setField("nivelSb");
    obj.dataLink16:setDefaultValue("0");
    obj.dataLink16:setName("dataLink16");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.flowPart4);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(30);
    obj.layout6:setName("layout6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout6);
    obj.label7:setText("Sabedoria:");
    obj.label7:setAlign("left");
    obj.label7:setWidth(100);
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setFontFamily("Cambria");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setLeft(80);
    obj.rectangle6:setTop(2.5);
    obj.rectangle6:setWidth(25);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setXradius(20);
    obj.rectangle6:setYradius(20);
    obj.rectangle6:setCornerType("round");
    obj.rectangle6:setColor("#101010");
    obj.rectangle6:setName("rectangle6");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle6);
    obj.label8:setField("sabedoria");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setAlign("client");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setFontFamily("Cambria");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle6);
    obj.dataLink17:setField("sabedoria");
    obj.dataLink17:setDefaultValue("0");
    obj.dataLink17:setName("dataLink17");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setFontSize(10.0);
    obj.label9:setText("+");
    obj.label9:setLeft(110);
    obj.label9:setTop(8.5);
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setFontFamily("Cambria");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setLeft(117);
    obj.edit4:setTop(2.5);
    obj.edit4:setFontSize(10.0);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(25);
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setMax(999);
    obj.edit4:setField("maisSab");
    obj.edit4:setName("edit4");
    obj.edit4:setFontColor("#cdcdcd");
    obj.edit4:setFontFamily("Cambria");
    obj.edit4:setTransparent(true);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.flowPart4);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(30);
    obj.layout7:setName("layout7");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout7);
    obj.label10:setText("Experiência:");
    obj.label10:setAlign("left");
    obj.label10:setWidth(80);
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setFontFamily("Cambria");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout7);
    obj.edit5:setField("xpGastar");
    obj.edit5:setAlign("client");
    obj.edit5:setType("number");
    obj.edit5:setMin(0);
    obj.edit5:setMax(999);
    obj.edit5:setName("edit5");
    obj.edit5:setFontColor("#cdcdcd");
    obj.edit5:setFontFamily("Cambria");
    obj.edit5:setTransparent(true);

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout7);
    obj.dataLink18:setField("xpGastar");
    obj.dataLink18:setDefaultValue("0");
    obj.dataLink18:setName("dataLink18");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout3);
    obj.flowPart5:setMaxWidth(150);
    obj.flowPart5:setMinWidth(150);
    obj.flowPart5:setHeight(120);
    obj.flowPart5:setName("flowPart5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowPart5);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(30);
    obj.layout8:setMargins({left=10});
    obj.layout8:setName("layout8");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setAlign("left");
    obj.label11:setText("Honra:");
    obj.label11:setWidth(50);
    obj.label11:setName("label11");
    obj.label11:setFontColor("white");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setFontFamily("Cambria");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setField("honra");
    obj.edit6:setAlign("client");
    obj.edit6:setMargins({right=10});
    obj.edit6:setType("number");
    obj.edit6:setMin(0);
    obj.edit6:setMax(999);
    obj.edit6:setName("edit6");
    obj.edit6:setFontColor("#cdcdcd");
    obj.edit6:setFontFamily("Cambria");
    obj.edit6:setTransparent(true);

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout8);
    obj.dataLink19:setField("honra");
    obj.dataLink19:setDefaultValue("0");
    obj.dataLink19:setName("dataLink19");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowPart5);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(30);
    obj.layout9:setMargins({left=10});
    obj.layout9:setName("layout9");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout9);
    obj.label12:setAlign("left");
    obj.label12:setText("Glória:");
    obj.label12:setWidth(50);
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setFontFamily("Cambria");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setField("gloria");
    obj.edit7:setAlign("client");
    obj.edit7:setMargins({right=10});
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setMax(999);
    obj.edit7:setName("edit7");
    obj.edit7:setFontColor("#cdcdcd");
    obj.edit7:setFontFamily("Cambria");
    obj.edit7:setTransparent(true);

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout9);
    obj.dataLink20:setField("gloria");
    obj.dataLink20:setDefaultValue("0");
    obj.dataLink20:setName("dataLink20");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowPart5);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(30);
    obj.layout10:setMargins({left=10});
    obj.layout10:setName("layout10");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout10);
    obj.label13:setAlign("left");
    obj.label13:setText("Status:");
    obj.label13:setWidth(50);
    obj.label13:setName("label13");
    obj.label13:setFontColor("white");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setFontFamily("Cambria");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout10);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setField("status");
    obj.edit8:setAlign("client");
    obj.edit8:setMargins({right=10});
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setMax(999);
    obj.edit8:setName("edit8");
    obj.edit8:setFontColor("#cdcdcd");
    obj.edit8:setFontFamily("Cambria");
    obj.edit8:setTransparent(true);

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout10);
    obj.dataLink21:setField("status");
    obj.dataLink21:setDefaultValue("0");
    obj.dataLink21:setName("dataLink21");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowPart5);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(30);
    obj.layout11:setMargins({left=10});
    obj.layout11:setName("layout11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setAlign("left");
    obj.label14:setText("Mácula:");
    obj.label14:setWidth(50);
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setFontFamily("Cambria");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout11);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setField("macula");
    obj.edit9:setAlign("client");
    obj.edit9:setMargins({right=10});
    obj.edit9:setType("number");
    obj.edit9:setMin(0);
    obj.edit9:setMax(999);
    obj.edit9:setName("edit9");
    obj.edit9:setFontColor("#cdcdcd");
    obj.edit9:setFontFamily("Cambria");
    obj.edit9:setTransparent(true);

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout11);
    obj.dataLink22:setField("macula");
    obj.dataLink22:setDefaultValue("0");
    obj.dataLink22:setName("dataLink22");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowPart2);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(30);
    obj.layout12:setMargins({top=40, left=20, bottom=15});
    obj.layout12:setName("layout12");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout12);
    obj.label15:setAlign("left");
    obj.label15:setText("A T R I B U T O S");
    obj.label15:setWidth(160);
    obj.label15:setFontSize(20);
    obj.label15:setFontFamily("Constantia");
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout12);
    obj.horzLine2:setAlign("client");
    obj.horzLine2:setMargins({right=9, top=14});
    obj.horzLine2:setStrokeColor("#424242");
    obj.horzLine2:setName("horzLine2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowPart2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(300);
    obj.layout13:setMargins({left=20, right=20});
    obj.layout13:setName("layout13");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout13);
    obj.image2:setAlign("client");
    obj.image2:setSRC("/Frames/rings.png");
    obj.image2:setStyle("proportional");
    obj.image2:setName("image2");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout13);
    obj.label16:setFontSize(16.0);
    obj.label16:setText("Vigor");
    obj.label16:setLeft(100);
    obj.label16:setTop(18);
    obj.label16:setName("label16");
    obj.label16:setFontColor("white");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setFontFamily("Cambria");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout13);
    obj.label17:setFontSize(16.0);
    obj.label17:setText("Vontade");
    obj.label17:setLeft(63);
    obj.label17:setTop(68);
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setFontFamily("Cambria");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout13);
    obj.label18:setFontSize(16.0);
    obj.label18:setText("Força");
    obj.label18:setLeft(60);
    obj.label18:setTop(135);
    obj.label18:setName("label18");
    obj.label18:setFontColor("white");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setFontFamily("Cambria");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout13);
    obj.label19:setFontSize(16.0);
    obj.label19:setText("Percepção");
    obj.label19:setLeft(8);
    obj.label19:setTop(185);
    obj.label19:setName("label19");
    obj.label19:setFontColor("white");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setFontFamily("Cambria");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout13);
    obj.label20:setFontSize(16.0);
    obj.label20:setText("Reflexos");
    obj.label20:setLeft(470);
    obj.label20:setTop(18);
    obj.label20:setName("label20");
    obj.label20:setFontColor("white");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setFontFamily("Cambria");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout13);
    obj.label21:setFontSize(16.0);
    obj.label21:setText("Astúcia");
    obj.label21:setLeft(488);
    obj.label21:setTop(68);
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setFontFamily("Cambria");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout13);
    obj.label22:setFontSize(16.0);
    obj.label22:setText("Agilidade");
    obj.label22:setLeft(508);
    obj.label22:setTop(135);
    obj.label22:setName("label22");
    obj.label22:setFontColor("white");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setFontFamily("Cambria");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout13);
    obj.label23:setFontSize(16.0);
    obj.label23:setText("Inteligência");
    obj.label23:setLeft(523);
    obj.label23:setTop(185);
    obj.label23:setName("label23");
    obj.label23:setFontColor("white");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setFontFamily("Cambria");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout13);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setWidth(30);
    obj.edit10:setFontSize(20.0);
    obj.edit10:setField("stamina");
    obj.edit10:setLeft(153);
    obj.edit10:setTop(16);
    lfm_setPropAsString(obj.edit10, "fontStyle",  "bold");
    obj.edit10:setName("edit10");
    obj.edit10:setFontColor("#cdcdcd");
    obj.edit10:setFontFamily("Cambria");
    obj.edit10:setTransparent(true);

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout13);
    obj.dataLink23:setDefaultValue("2");
    obj.dataLink23:setField("stamina");
    obj.dataLink23:setName("dataLink23");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout13);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setWidth(30);
    obj.edit11:setFontSize(20.0);
    obj.edit11:setField("willpower");
    obj.edit11:setLeft(136);
    obj.edit11:setTop(64);
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setName("edit11");
    obj.edit11:setFontColor("#cdcdcd");
    obj.edit11:setFontFamily("Cambria");
    obj.edit11:setTransparent(true);

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout13);
    obj.dataLink24:setDefaultValue("2");
    obj.dataLink24:setField("willpower");
    obj.dataLink24:setName("dataLink24");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setWidth(30);
    obj.edit12:setFontSize(20.0);
    obj.edit12:setField("strength");
    obj.edit12:setLeft(115);
    obj.edit12:setTop(133);
    lfm_setPropAsString(obj.edit12, "fontStyle",  "bold");
    obj.edit12:setName("edit12");
    obj.edit12:setFontColor("#cdcdcd");
    obj.edit12:setFontFamily("Cambria");
    obj.edit12:setTransparent(true);

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout13);
    obj.dataLink25:setDefaultValue("2");
    obj.dataLink25:setField("strength");
    obj.dataLink25:setName("dataLink25");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setWidth(30);
    obj.edit13:setFontSize(20.0);
    obj.edit13:setField("perception");
    obj.edit13:setLeft(98);
    obj.edit13:setTop(180);
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("#cdcdcd");
    obj.edit13:setFontFamily("Cambria");
    obj.edit13:setTransparent(true);

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout13);
    obj.dataLink26:setDefaultValue("2");
    obj.dataLink26:setField("perception");
    obj.dataLink26:setName("dataLink26");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout13);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setWidth(30);
    obj.edit14:setFontSize(20.0);
    obj.edit14:setField("reflexes");
    obj.edit14:setLeft(428);
    obj.edit14:setTop(16);
    lfm_setPropAsString(obj.edit14, "fontStyle",  "bold");
    obj.edit14:setName("edit14");
    obj.edit14:setFontColor("#cdcdcd");
    obj.edit14:setFontFamily("Cambria");
    obj.edit14:setTransparent(true);

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout13);
    obj.dataLink27:setDefaultValue("2");
    obj.dataLink27:setField("reflexes");
    obj.dataLink27:setName("dataLink27");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout13);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setWidth(30);
    obj.edit15:setFontSize(20.0);
    obj.edit15:setField("awareness");
    obj.edit15:setLeft(445);
    obj.edit15:setTop(64);
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("#cdcdcd");
    obj.edit15:setFontFamily("Cambria");
    obj.edit15:setTransparent(true);

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout13);
    obj.dataLink28:setDefaultValue("2");
    obj.dataLink28:setField("awareness");
    obj.dataLink28:setName("dataLink28");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout13);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setWidth(30);
    obj.edit16:setFontSize(20.0);
    obj.edit16:setField("agility");
    obj.edit16:setLeft(466);
    obj.edit16:setTop(133);
    lfm_setPropAsString(obj.edit16, "fontStyle",  "bold");
    obj.edit16:setName("edit16");
    obj.edit16:setFontColor("#cdcdcd");
    obj.edit16:setFontFamily("Cambria");
    obj.edit16:setTransparent(true);

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout13);
    obj.dataLink29:setDefaultValue("2");
    obj.dataLink29:setField("agility");
    obj.dataLink29:setName("dataLink29");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout13);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setWidth(30);
    obj.edit17:setFontSize(20.0);
    obj.edit17:setField("intelligence");
    obj.edit17:setLeft(483);
    obj.edit17:setTop(180);
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("#cdcdcd");
    obj.edit17:setFontFamily("Cambria");
    obj.edit17:setTransparent(true);

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout13);
    obj.dataLink30:setDefaultValue("2");
    obj.dataLink30:setField("intelligence");
    obj.dataLink30:setName("dataLink30");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout13);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setWidth(30);
    obj.edit18:setFontSize(20.0);
    obj.edit18:setField("void");
    obj.edit18:setLeft(290);
    obj.edit18:setTop(164);
    lfm_setPropAsString(obj.edit18, "fontStyle",  "bold");
    obj.edit18:setName("edit18");
    obj.edit18:setFontColor("#cdcdcd");
    obj.edit18:setFontFamily("Cambria");
    obj.edit18:setTransparent(true);

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout13);
    obj.dataLink31:setDefaultValue("2");
    obj.dataLink31:setField("void");
    obj.dataLink31:setName("dataLink31");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout13);
    obj.label24:setFontSize(20.0);
    obj.label24:setLeft(324);
    obj.label24:setTop(94);
    obj.label24:setHeight(30);
    obj.label24:setField("air");
    obj.label24:setName("label24");
    obj.label24:setFontColor("white");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setFontFamily("Cambria");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout13);
    obj.dataLink32:setDefaultValue("2");
    obj.dataLink32:setField("air");
    obj.dataLink32:setName("dataLink32");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout13);
    obj.label25:setFontSize(20.0);
    obj.label25:setLeft(275);
    obj.label25:setTop(94);
    obj.label25:setHeight(30);
    obj.label25:setField("earth");
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setFontFamily("Cambria");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout13);
    obj.dataLink33:setDefaultValue("2");
    obj.dataLink33:setField("earth");
    obj.dataLink33:setName("dataLink33");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout13);
    obj.label26:setFontSize(20.0);
    obj.label26:setLeft(260);
    obj.label26:setTop(138);
    obj.label26:setHeight(30);
    obj.label26:setField("water");
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setFontFamily("Cambria");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout13);
    obj.dataLink34:setDefaultValue("2");
    obj.dataLink34:setField("water");
    obj.dataLink34:setName("dataLink34");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout13);
    obj.label27:setFontSize(20.0);
    obj.label27:setLeft(339);
    obj.label27:setTop(138);
    obj.label27:setHeight(30);
    obj.label27:setField("fire");
    obj.label27:setName("label27");
    obj.label27:setFontColor("white");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setFontFamily("Cambria");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout13);
    obj.dataLink35:setDefaultValue("2");
    obj.dataLink35:setField("fire");
    obj.dataLink35:setName("dataLink35");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowPart2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(40);
    obj.layout14:setMargins({top=10});
    obj.layout14:setName("layout14");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.layout14);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setHeight(40);
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout4);
    obj.flowPart6:setWidth(160);
    obj.flowPart6:setName("flowPart6");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowPart6);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(20);
    obj.layout15:setName("layout15");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout15);
    obj.radioButton1:setWidth(20);
    obj.radioButton1:setAlign("left");
    obj.radioButton1:setField("VOIDescala");
    obj.radioButton1:setFieldValue("0void");
    obj.radioButton1:setGroupName("VOIDGrupo");
    obj.radioButton1:setChecked(true);
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout15);
    obj.radioButton2:setWidth(20);
    obj.radioButton2:setAlign("left");
    obj.radioButton2:setField("VOIDescala");
    obj.radioButton2:setFieldValue("1void");
    obj.radioButton2:setGroupName("VOIDGrupo");
    obj.radioButton2:setName("radioButton2");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout15);
    obj.radioButton3:setWidth(20);
    obj.radioButton3:setAlign("left");
    obj.radioButton3:setField("VOIDescala");
    obj.radioButton3:setFieldValue("2void");
    obj.radioButton3:setGroupName("VOIDGrupo");
    obj.radioButton3:setName("radioButton3");

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout15);
    obj.radioButton4:setWidth(20);
    obj.radioButton4:setAlign("left");
    obj.radioButton4:setField("VOIDescala");
    obj.radioButton4:setFieldValue("3void");
    obj.radioButton4:setGroupName("VOIDGrupo");
    obj.radioButton4:setName("radioButton4");

    obj.radioButton5 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout15);
    obj.radioButton5:setWidth(20);
    obj.radioButton5:setAlign("left");
    obj.radioButton5:setField("VOIDescala");
    obj.radioButton5:setFieldValue("4void");
    obj.radioButton5:setGroupName("VOIDGrupo");
    obj.radioButton5:setName("radioButton5");

    obj.radioButton6 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout15);
    obj.radioButton6:setWidth(20);
    obj.radioButton6:setAlign("left");
    obj.radioButton6:setField("VOIDescala");
    obj.radioButton6:setFieldValue("5void");
    obj.radioButton6:setGroupName("VOIDGrupo");
    obj.radioButton6:setName("radioButton6");

    obj.radioButton7 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout15);
    obj.radioButton7:setWidth(20);
    obj.radioButton7:setAlign("left");
    obj.radioButton7:setField("VOIDescala");
    obj.radioButton7:setFieldValue("6void");
    obj.radioButton7:setGroupName("VOIDGrupo");
    obj.radioButton7:setName("radioButton7");

    obj.radioButton8 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout15);
    obj.radioButton8:setWidth(20);
    obj.radioButton8:setAlign("left");
    obj.radioButton8:setField("VOIDescala");
    obj.radioButton8:setFieldValue("7void");
    obj.radioButton8:setGroupName("VOIDGrupo");
    obj.radioButton8:setName("radioButton8");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowPart6);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(20);
    obj.layout16:setName("layout16");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout16);
    obj.label28:setText("0");
    obj.label28:setAlign("left");
    obj.label28:setWidth(20);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");
    obj.label28:setFontColor("white");
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setFontFamily("Cambria");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout16);
    obj.label29:setText("1");
    obj.label29:setAlign("left");
    obj.label29:setWidth(20);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");
    obj.label29:setFontColor("white");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setFontFamily("Cambria");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout16);
    obj.label30:setText("2");
    obj.label30:setAlign("left");
    obj.label30:setWidth(20);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");
    obj.label30:setFontColor("white");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setFontFamily("Cambria");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout16);
    obj.label31:setText("3");
    obj.label31:setAlign("left");
    obj.label31:setWidth(20);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setFontFamily("Cambria");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout16);
    obj.label32:setText("4");
    obj.label32:setAlign("left");
    obj.label32:setWidth(20);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setFontFamily("Cambria");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout16);
    obj.label33:setText("5");
    obj.label33:setAlign("left");
    obj.label33:setWidth(20);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");
    obj.label33:setFontColor("white");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setFontFamily("Cambria");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout16);
    obj.label34:setText("6");
    obj.label34:setAlign("left");
    obj.label34:setWidth(20);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");
    obj.label34:setFontColor("white");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setFontFamily("Cambria");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout16);
    obj.label35:setText("7");
    obj.label35:setAlign("left");
    obj.label35:setWidth(20);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");
    obj.label35:setFontColor("white");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setFontFamily("Cambria");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowPart2);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(30);
    obj.layout17:setMargins({top=40, left=20, bottom=15});
    obj.layout17:setName("layout17");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout17);
    obj.label36:setAlign("left");
    obj.label36:setText("P E R Í C I A S");
    obj.label36:setWidth(130);
    obj.label36:setFontSize(20);
    obj.label36:setFontFamily("Constantia");
    obj.label36:setName("label36");
    obj.label36:setFontColor("white");
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout17);
    obj.horzLine3:setAlign("client");
    obj.horzLine3:setMargins({right=9, top=14});
    obj.horzLine3:setStrokeColor("#424242");
    obj.horzLine3:setName("horzLine3");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowPart2);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(1000);
    obj.layout18:setName("layout18");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout18);
    obj.rectangle7:setMargins({left=25, right=17});
    obj.rectangle7:setAlign("top");
    obj.rectangle7:setHeight(30);
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setColor("#212121");
    obj.rectangle7:setName("rectangle7");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle7);
    obj.label37:setAlign("left");
    obj.label37:setWidth(214);
    obj.label37:setText("PERÍCIAS");
    obj.label37:setMargins({left=5});
    obj.label37:setName("label37");
    obj.label37:setFontColor("white");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setFontFamily("Cambria");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle7);
    obj.label38:setAlign("left");
    obj.label38:setWidth(75);
    obj.label38:setText("TIPOS");
    obj.label38:setName("label38");
    obj.label38:setFontColor("white");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setFontFamily("Cambria");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle7);
    obj.label39:setAlign("left");
    obj.label39:setWidth(52);
    obj.label39:setText("RANK");
    obj.label39:setName("label39");
    obj.label39:setFontColor("white");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setFontFamily("Cambria");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle7);
    obj.label40:setAlign("left");
    obj.label40:setWidth(90);
    obj.label40:setText("ATRIBUTO");
    obj.label40:setName("label40");
    obj.label40:setFontColor("white");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setFontFamily("Cambria");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle7);
    obj.label41:setAlign("left");
    obj.label41:setWidth(105);
    obj.label41:setText("ROLAGEM");
    obj.label41:setName("label41");
    obj.label41:setFontColor("white");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setFontFamily("Cambria");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle7);
    obj.button6:setAlign("right");
    obj.button6:setWidth(30);
    obj.button6:setText("🞦");
    obj.button6:setHint("Nova Perícia");
    obj.button6:setName("button6");

    obj.rclSkills = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSkills:setParent(obj.layout18);
    obj.rclSkills:setAlign("top");
    obj.rclSkills:setName("rclSkills");
    obj.rclSkills:setField("pericias");
    obj.rclSkills:setTemplateForm("templateSkills");
    obj.rclSkills:setLeft(5);
    obj.rclSkills:setHeight(720);
    obj.rclSkills:setMinQt(7);

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout2);
    obj.flowPart7:setMinWidth(100);
    obj.flowPart7:setMaxWidth(350);
    obj.flowPart7:setHeight(1600);
    obj.flowPart7:setName("flowPart7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowPart7);
    obj.rectangle8:setWidth(300);
    obj.rectangle8:setHeight(1530);
    obj.rectangle8:setColor("#202020");
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowPart7);
    obj.rectangle9:setWidth(320);
    obj.rectangle9:setHeight(1530);
    obj.rectangle9:setColor("#202020");
    obj.rectangle9:setXradius(20);
    obj.rectangle9:setYradius(20);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setName("rectangle9");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flowPart7);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(30);
    obj.layout19:setMargins({top=60, left=20, bottom=15});
    obj.layout19:setName("layout19");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout19);
    obj.label42:setAlign("left");
    obj.label42:setText("I N I C I A T I V A");
    obj.label42:setWidth(160);
    obj.label42:setFontSize(20);
    obj.label42:setFontFamily("Constantia");
    obj.label42:setName("label42");
    obj.label42:setFontColor("white");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout19);
    obj.horzLine4:setAlign("client");
    obj.horzLine4:setMargins({right=20, top=14});
    obj.horzLine4:setStrokeColor("#424242");
    obj.horzLine4:setName("horzLine4");

    obj.btnImagemFundo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImagemFundo:setParent(obj.flowPart7);
    obj.btnImagemFundo:setName("btnImagemFundo");
    obj.btnImagemFundo:setLeft(270);
    obj.btnImagemFundo:setTop(20);
    obj.btnImagemFundo:setText("⚙");
    obj.btnImagemFundo:setHeight(30);
    obj.btnImagemFundo:setWidth(30);

    obj.popImagemFundo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popImagemFundo:setParent(obj.flowPart7);
    obj.popImagemFundo:setName("popImagemFundo");
    obj.popImagemFundo:setWidth(260);
    obj.popImagemFundo:setHeight(80);
    obj.popImagemFundo:setBackOpacity(0);
    obj.popImagemFundo:setDrawContainer(false);

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.popImagemFundo);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("#353535");
    obj.rectangle10:setPadding({top=10, left=10, bottom=10, right=10});
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setName("rectangle10");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle10);
    obj.label43:setAlign("top");
    obj.label43:setText("I M A G E M  D E  F U N D O");
    obj.label43:setMargins({bottom=5});
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setFontFamily("Constantia");
    obj.label43:setName("label43");
    obj.label43:setFontColor("white");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.rectangle10);
    obj.horzLine5:setAlign("top");
    obj.horzLine5:setMargins({bottom=5});
    obj.horzLine5:setStrokeColor("#424242");
    obj.horzLine5:setName("horzLine5");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle10);
    obj.edit19:setAlign("client");
    obj.edit19:setPadding({top=10, left=10, bottom=10, right=10});
    obj.edit19:setTransparent(false);
    obj.edit19:setField("URLImagemFundo");
    obj.edit19:setWidth(240);
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("#cdcdcd");
    obj.edit19:setFontFamily("Cambria");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flowPart7);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(120);
    obj.layout20:setMargins({left=20});
    obj.layout20:setName("layout20");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(30);
    obj.layout21:setName("layout21");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout21);
    obj.rectangle11:setTop(2.5);
    obj.rectangle11:setLeft(0);
    obj.rectangle11:setWidth(25);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setXradius(20);
    obj.rectangle11:setYradius(20);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle11);
    obj.label44:setField("nivelSb");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setAlign("client");
    obj.label44:setName("label44");
    obj.label44:setFontColor("white");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setFontFamily("Cambria");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout21);
    obj.label45:setAlign("left");
    obj.label45:setText("Nível");
    obj.label45:setWidth(155);
    obj.label45:setMargins({left=35});
    obj.label45:setName("label45");
    obj.label45:setFontColor("white");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setFontFamily("Cambria");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(30);
    obj.layout22:setName("layout22");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout22);
    obj.rectangle12:setTop(2.5);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setWidth(25);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setXradius(20);
    obj.rectangle12:setYradius(20);
    obj.rectangle12:setCornerType("round");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle12);
    obj.label46:setField("reflexes");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setAlign("client");
    obj.label46:setName("label46");
    obj.label46:setFontColor("white");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setFontFamily("Cambria");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout22);
    obj.label47:setAlign("left");
    obj.label47:setText("Reflexos");
    obj.label47:setWidth(155);
    obj.label47:setMargins({left=35});
    obj.label47:setName("label47");
    obj.label47:setFontColor("white");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setFontFamily("Cambria");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout20);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(30);
    obj.layout23:setName("layout23");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout23);
    obj.label48:setAlign("left");
    obj.label48:setText("Modificadores:");
    obj.label48:setWidth(100);
    obj.label48:setName("label48");
    obj.label48:setFontColor("white");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setFontFamily("Cambria");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout23);
    obj.label49:setAlign("left");
    obj.label49:setText("+");
    obj.label49:setHorzTextAlign("trailing");
    obj.label49:setWidth(15);
    obj.label49:setName("label49");
    obj.label49:setFontColor("white");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setFontFamily("Cambria");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout23);
    obj.edit20:setAlign("left");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setWidth(25);
    obj.edit20:setType("number");
    obj.edit20:setField("addRolaIni");
    obj.edit20:setName("edit20");
    obj.edit20:setFontColor("#cdcdcd");
    obj.edit20:setFontFamily("Cambria");
    obj.edit20:setTransparent(true);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout23);
    obj.label50:setAlign("left");
    obj.label50:setText("k");
    obj.label50:setWidth(15);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");
    obj.label50:setFontColor("white");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setFontFamily("Cambria");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout23);
    obj.edit21:setAlign("left");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setWidth(25);
    obj.edit21:setType("number");
    obj.edit21:setField("addMantemIni");
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("#cdcdcd");
    obj.edit21:setFontFamily("Cambria");
    obj.edit21:setTransparent(true);

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout23);
    obj.label51:setAlign("left");
    obj.label51:setText("+");
    obj.label51:setWidth(10);
    obj.label51:setName("label51");
    obj.label51:setFontColor("white");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setFontFamily("Cambria");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout23);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(25);
    obj.edit22:setType("number");
    obj.edit22:setField("addMod");
    obj.edit22:setName("edit22");
    obj.edit22:setFontColor("#cdcdcd");
    obj.edit22:setFontFamily("Cambria");
    obj.edit22:setTransparent(true);

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout23);
    obj.dataLink36:setDefaultValue("0");
    obj.dataLink36:setField("addMod");
    obj.dataLink36:setName("dataLink36");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout20);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(30);
    obj.layout24:setName("layout24");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout24);
    obj.label52:setAlign("left");
    obj.label52:setText("Iniciativa Atual:");
    obj.label52:setWidth(115);
    obj.label52:setName("label52");
    obj.label52:setFontColor("white");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setFontFamily("Cambria");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout24);
    obj.label53:setAlign("left");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setWidth(25);
    obj.label53:setField("rolaIni");
    obj.label53:setName("label53");
    obj.label53:setFontColor("white");
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setFontFamily("Cambria");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout24);
    obj.label54:setAlign("left");
    obj.label54:setText("k");
    obj.label54:setWidth(15);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");
    obj.label54:setFontColor("white");
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setFontFamily("Cambria");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout24);
    obj.label55:setAlign("left");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setWidth(25);
    obj.label55:setField("mantemIni");
    obj.label55:setName("label55");
    obj.label55:setFontColor("white");
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setFontFamily("Cambria");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout24);
    obj.label56:setAlign("left");
    obj.label56:setText("+");
    obj.label56:setWidth(10);
    obj.label56:setName("label56");
    obj.label56:setFontColor("white");
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setFontFamily("Cambria");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout24);
    obj.label57:setAlign("left");
    obj.label57:setWidth(25);
    obj.label57:setField("addMod");
    obj.label57:setName("label57");
    obj.label57:setFontColor("white");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setFontFamily("Cambria");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flowPart7);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(30);
    obj.layout25:setMargins({top=40, left=20, bottom=15});
    obj.layout25:setName("layout25");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout25);
    obj.label58:setAlign("left");
    obj.label58:setText("A R M A D U R A");
    obj.label58:setWidth(160);
    obj.label58:setFontSize(20);
    obj.label58:setFontFamily("Constantia");
    obj.label58:setName("label58");
    obj.label58:setFontColor("white");
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout25);
    obj.horzLine6:setAlign("client");
    obj.horzLine6:setMargins({right=20, top=14});
    obj.horzLine6:setStrokeColor("#424242");
    obj.horzLine6:setName("horzLine6");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowPart7);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(350);
    obj.layout26:setMargins({left=20});
    obj.layout26:setName("layout26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(30);
    obj.layout27:setName("layout27");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout27);
    obj.label59:setAlign("left");
    obj.label59:setText("Tipo:");
    obj.label59:setWidth(80);
    obj.label59:setName("label59");
    obj.label59:setFontColor("white");
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setFontFamily("Cambria");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout27);
    obj.edit23:setAlign("client");
    obj.edit23:setField("tipoArmadura");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("#cdcdcd");
    obj.edit23:setFontFamily("Cambria");
    obj.edit23:setTransparent(true);

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout27);
    obj.dataLink37:setField("tipoArmadura");
    obj.dataLink37:setDefaultValue("—");
    obj.dataLink37:setName("dataLink37");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout26);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(30);
    obj.layout28:setName("layout28");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout28);
    obj.label60:setAlign("left");
    obj.label60:setText("Bônus:");
    obj.label60:setWidth(80);
    obj.label60:setName("label60");
    obj.label60:setFontColor("white");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setFontFamily("Cambria");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout28);
    obj.edit24:setAlign("client");
    obj.edit24:setField("bonusNA");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");
    obj.edit24:setFontColor("#cdcdcd");
    obj.edit24:setFontFamily("Cambria");
    obj.edit24:setTransparent(true);

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout28);
    obj.dataLink38:setField("bonusNA");
    obj.dataLink38:setDefaultValue("0");
    obj.dataLink38:setName("dataLink38");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout26);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(30);
    obj.layout29:setName("layout29");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout29);
    obj.label61:setAlign("left");
    obj.label61:setText("Redução:");
    obj.label61:setWidth(80);
    obj.label61:setName("label61");
    obj.label61:setFontColor("white");
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setFontFamily("Cambria");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout29);
    obj.edit25:setAlign("client");
    obj.edit25:setField("Reducao");
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("#cdcdcd");
    obj.edit25:setFontFamily("Cambria");
    obj.edit25:setTransparent(true);

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout29);
    obj.dataLink39:setField("Reducao");
    obj.dataLink39:setDefaultValue("0");
    obj.dataLink39:setName("dataLink39");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout26);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(30);
    obj.layout30:setName("layout30");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout30);
    obj.label62:setAlign("left");
    obj.label62:setText("NA Atual:");
    obj.label62:setWidth(80);
    obj.label62:setName("label62");
    obj.label62:setFontColor("white");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setFontFamily("Cambria");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout30);
    obj.label63:setAlign("left");
    obj.label63:setField("NA");
    obj.label63:setName("label63");
    obj.label63:setFontColor("white");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setFontFamily("Cambria");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.flowPart7);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(30);
    obj.layout31:setMargins({top=40, left=20, bottom=15});
    obj.layout31:setName("layout31");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout31);
    obj.label64:setAlign("left");
    obj.label64:setText("F E R I M E N T O S");
    obj.label64:setWidth(180);
    obj.label64:setFontSize(20);
    obj.label64:setFontFamily("Constantia");
    obj.label64:setName("label64");
    obj.label64:setFontColor("white");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout31);
    obj.horzLine7:setAlign("client");
    obj.horzLine7:setMargins({right=20, top=14});
    obj.horzLine7:setStrokeColor("#424242");
    obj.horzLine7:setName("horzLine7");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.flowPart7);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(430);
    obj.layout32:setMargins({left=20, right=20});
    obj.layout32:setName("layout32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(400);
    obj.layout33:setName("layout33");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout33);
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setHeight(30);
    obj.rectangle13:setXradius(5);
    obj.rectangle13:setYradius(5);
    obj.rectangle13:setCornerType("round");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle13);
    obj.label65:setAlign("left");
    obj.label65:setText("NÍVEL");
    obj.label65:setWidth(97);
    obj.label65:setMargins({left=5});
    obj.label65:setName("label65");
    obj.label65:setFontColor("white");
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setFontFamily("Cambria");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle13);
    obj.label66:setAlign("left");
    obj.label66:setText("PEN.");
    obj.label66:setWidth(50);
    obj.label66:setName("label66");
    obj.label66:setFontColor("white");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setFontFamily("Cambria");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle13);
    obj.label67:setAlign("left");
    obj.label67:setText("FERIMENTOS");
    obj.label67:setWidth(80);
    obj.label67:setName("label67");
    obj.label67:setFontColor("white");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setFontFamily("Cambria");

    obj.btnFeri = GUI.fromHandle(_obj_newObject("button"));
    obj.btnFeri:setParent(obj.rectangle13);
    obj.btnFeri:setName("btnFeri");
    obj.btnFeri:setAlign("right");
    obj.btnFeri:setText("𝐢");
    obj.btnFeri:setWidth(30);

    obj.popFerimentos = GUI.fromHandle(_obj_newObject("popup"));
    obj.popFerimentos:setParent(obj.rectangle13);
    obj.popFerimentos:setName("popFerimentos");
    obj.popFerimentos:setWidth(260);
    obj.popFerimentos:setHeight(280);
    obj.popFerimentos:setBackOpacity(0);
    obj.popFerimentos:setDrawContainer(false);

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.popFerimentos);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("#353535");
    obj.rectangle14:setPadding({top=10, left=10, bottom=10, right=10});
    obj.rectangle14:setXradius(10);
    obj.rectangle14:setYradius(10);
    obj.rectangle14:setCornerType("bevel");
    obj.rectangle14:setName("rectangle14");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle14);
    obj.label68:setAlign("top");
    obj.label68:setText("C O N F I G U R A Ç Õ E S");
    obj.label68:setMargins({bottom=5});
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setFontFamily("Constantia");
    obj.label68:setName("label68");
    obj.label68:setFontColor("white");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.rectangle14);
    obj.horzLine8:setAlign("top");
    obj.horzLine8:setMargins({bottom=5});
    obj.horzLine8:setStrokeColor("#424242");
    obj.horzLine8:setName("horzLine8");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle14);
    obj.checkBox1:setAlign("top");
    obj.checkBox1:setHeight(30);
    obj.checkBox1:setText("Permanent Wound");
    obj.checkBox1:setField("PWound");
    obj.checkBox1:setName("checkBox1");
    obj.checkBox1:setFontColor("white");
    obj.checkBox1:setFontFamily("Cambria");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectangle14);
    obj.checkBox2:setAlign("top");
    obj.checkBox2:setHeight(30);
    obj.checkBox2:setText("Bad Health");
    obj.checkBox2:setField("BHealth");
    obj.checkBox2:setName("checkBox2");
    obj.checkBox2:setFontColor("white");
    obj.checkBox2:setFontFamily("Cambria");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectangle14);
    obj.checkBox3:setAlign("top");
    obj.checkBox3:setHeight(30);
    obj.checkBox3:setText("Low Pain Threshold");
    obj.checkBox3:setField("LPThold");
    obj.checkBox3:setName("checkBox3");
    obj.checkBox3:setFontColor("white");
    obj.checkBox3:setFontFamily("Cambria");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectangle14);
    obj.checkBox4:setAlign("top");
    obj.checkBox4:setHeight(30);
    obj.checkBox4:setText("Strength of the Earth");
    obj.checkBox4:setField("SotEarth");
    obj.checkBox4:setName("checkBox4");
    obj.checkBox4:setFontColor("white");
    obj.checkBox4:setFontFamily("Cambria");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.rectangle14);
    obj.checkBox5:setAlign("top");
    obj.checkBox5:setHeight(30);
    obj.checkBox5:setText("Quick Healer");
    obj.checkBox5:setField("QHealer");
    obj.checkBox5:setName("checkBox5");
    obj.checkBox5:setFontColor("white");
    obj.checkBox5:setFontFamily("Cambria");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle14);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(30);
    obj.layout34:setMargins({top=15});
    obj.layout34:setName("layout34");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout34);
    obj.label69:setAlign("left");
    obj.label69:setWidth(190);
    obj.label69:setText("Multiplicador do Anel de Terra:");
    obj.label69:setName("label69");
    obj.label69:setFontColor("white");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setFontFamily("Cambria");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout34);
    obj.edit26:setField("lastroTerra");
    obj.edit26:setAlign("client");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");
    obj.edit26:setFontColor("#cdcdcd");
    obj.edit26:setFontFamily("Cambria");
    obj.edit26:setTransparent(true);

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout34);
    obj.dataLink40:setField("lastroTerra");
    obj.dataLink40:setDefaultValue("2");
    obj.dataLink40:setName("dataLink40");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle14);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(30);
    obj.layout35:setName("layout35");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout35);
    obj.label70:setAlign("left");
    obj.label70:setWidth(190);
    obj.label70:setText("Ferimentos a mais por nível:");
    obj.label70:setName("label70");
    obj.label70:setFontColor("white");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setFontFamily("Cambria");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout35);
    obj.edit27:setField("extraFerimentos");
    obj.edit27:setAlign("client");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("#cdcdcd");
    obj.edit27:setFontFamily("Cambria");
    obj.edit27:setTransparent(true);

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout35);
    obj.dataLink41:setField("extraFerimentos");
    obj.dataLink41:setDefaultValue("0");
    obj.dataLink41:setName("dataLink41");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout33);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(30);
    obj.layout36:setName("layout36");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout36);
    obj.label71:setAlign("left");
    obj.label71:setWidth(100);
    obj.label71:setText("Saudável");
    obj.label71:setMargins({left=5});
    obj.label71:setName("label71");
    obj.label71:setFontColor("white");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setFontFamily("Cambria");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout36);
    obj.label72:setAlign("left");
    obj.label72:setText("+0");
    obj.label72:setWidth(50);
    obj.label72:setName("label72");
    obj.label72:setFontColor("white");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setFontFamily("Cambria");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout36);
    obj.label73:setAlign("left");
    obj.label73:setFontSize(16.0);
    obj.label73:setField("FSaud");
    obj.label73:setWidth(35);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");
    obj.label73:setFontColor("white");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setFontFamily("Cambria");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout36);
    obj.label74:setAlign("left");
    obj.label74:setText("de");
    lfm_setPropAsString(obj.label74, "fontStyle",  "");
    obj.label74:setFontColor("#959595");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setWidth(40);
    obj.label74:setName("label74");
    obj.label74:setFontFamily("Cambria");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout36);
    obj.label75:setAlign("left");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setFontSize(16.0);
    obj.label75:setField("Saud");
    obj.label75:setWidth(30);
    obj.label75:setName("label75");
    obj.label75:setFontColor("white");
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setFontFamily("Cambria");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout36);
    obj.label76:setHorzTextAlign("trailing");
    obj.label76:setFontSize(12.0);
    lfm_setPropAsString(obj.label76, "fontStyle",  "");
    obj.label76:setFontColor("#959595");
    obj.label76:setTop(15);
    obj.label76:setLeft(157);
    obj.label76:setField("LSaud");
    obj.label76:setName("label76");
    obj.label76:setFontFamily("Cambria");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout33);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(30);
    obj.layout37:setName("layout37");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout37);
    obj.label77:setAlign("left");
    obj.label77:setWidth(100);
    obj.label77:setText("Escoriado");
    obj.label77:setMargins({left=5});
    obj.label77:setName("label77");
    obj.label77:setFontColor("white");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setFontFamily("Cambria");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout37);
    obj.label78:setAlign("left");
    obj.label78:setField("Escoriado");
    obj.label78:setWidth(50);
    obj.label78:setName("label78");
    obj.label78:setFontColor("white");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setFontFamily("Cambria");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout37);
    obj.label79:setAlign("left");
    obj.label79:setFontSize(16.0);
    obj.label79:setField("FEsco");
    obj.label79:setWidth(35);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");
    obj.label79:setFontColor("white");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setFontFamily("Cambria");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout37);
    obj.label80:setAlign("left");
    obj.label80:setText("de");
    lfm_setPropAsString(obj.label80, "fontStyle",  "");
    obj.label80:setFontColor("#959595");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setWidth(40);
    obj.label80:setName("label80");
    obj.label80:setFontFamily("Cambria");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout37);
    obj.label81:setAlign("left");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setFontSize(16.0);
    obj.label81:setField("Esco");
    obj.label81:setWidth(30);
    obj.label81:setName("label81");
    obj.label81:setFontColor("white");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setFontFamily("Cambria");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout37);
    obj.label82:setHorzTextAlign("trailing");
    obj.label82:setFontSize(12.0);
    lfm_setPropAsString(obj.label82, "fontStyle",  "");
    obj.label82:setFontColor("#959595");
    obj.label82:setTop(15);
    obj.label82:setLeft(157);
    obj.label82:setField("LEsco");
    obj.label82:setName("label82");
    obj.label82:setFontFamily("Cambria");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout33);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(30);
    obj.layout38:setName("layout38");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout38);
    obj.label83:setAlign("left");
    obj.label83:setWidth(100);
    obj.label83:setText("Machucado");
    obj.label83:setMargins({left=5});
    obj.label83:setName("label83");
    obj.label83:setFontColor("white");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setFontFamily("Cambria");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout38);
    obj.label84:setAlign("left");
    obj.label84:setField("Machucado");
    obj.label84:setWidth(50);
    obj.label84:setName("label84");
    obj.label84:setFontColor("white");
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setFontFamily("Cambria");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout38);
    obj.label85:setAlign("left");
    obj.label85:setFontSize(16.0);
    obj.label85:setField("FMach");
    obj.label85:setWidth(35);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");
    obj.label85:setFontColor("white");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setFontFamily("Cambria");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout38);
    obj.label86:setAlign("left");
    obj.label86:setText("de");
    lfm_setPropAsString(obj.label86, "fontStyle",  "");
    obj.label86:setFontColor("#959595");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setWidth(40);
    obj.label86:setName("label86");
    obj.label86:setFontFamily("Cambria");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout38);
    obj.label87:setAlign("left");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setFontSize(16.0);
    obj.label87:setField("Mach");
    obj.label87:setWidth(30);
    obj.label87:setName("label87");
    obj.label87:setFontColor("white");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setFontFamily("Cambria");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout38);
    obj.label88:setHorzTextAlign("trailing");
    obj.label88:setFontSize(12.0);
    lfm_setPropAsString(obj.label88, "fontStyle",  "");
    obj.label88:setFontColor("#959595");
    obj.label88:setTop(15);
    obj.label88:setLeft(157);
    obj.label88:setField("LMach");
    obj.label88:setName("label88");
    obj.label88:setFontFamily("Cambria");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout33);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(30);
    obj.layout39:setName("layout39");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout39);
    obj.label89:setAlign("left");
    obj.label89:setWidth(100);
    obj.label89:setText("Ferido");
    obj.label89:setMargins({left=5});
    obj.label89:setName("label89");
    obj.label89:setFontColor("white");
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setFontFamily("Cambria");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout39);
    obj.label90:setAlign("left");
    obj.label90:setField("Ferido");
    obj.label90:setWidth(50);
    obj.label90:setName("label90");
    obj.label90:setFontColor("white");
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setFontFamily("Cambria");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout39);
    obj.label91:setAlign("left");
    obj.label91:setFontSize(16.0);
    obj.label91:setField("FFeri");
    obj.label91:setWidth(35);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");
    obj.label91:setFontColor("white");
    lfm_setPropAsString(obj.label91, "fontStyle",  "bold");
    obj.label91:setFontFamily("Cambria");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout39);
    obj.label92:setAlign("left");
    obj.label92:setText("de");
    lfm_setPropAsString(obj.label92, "fontStyle",  "");
    obj.label92:setFontColor("#959595");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setWidth(40);
    obj.label92:setName("label92");
    obj.label92:setFontFamily("Cambria");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout39);
    obj.label93:setAlign("left");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setFontSize(16.0);
    obj.label93:setField("Feri");
    obj.label93:setWidth(30);
    obj.label93:setName("label93");
    obj.label93:setFontColor("white");
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setFontFamily("Cambria");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout39);
    obj.label94:setHorzTextAlign("trailing");
    obj.label94:setFontSize(12.0);
    lfm_setPropAsString(obj.label94, "fontStyle",  "");
    obj.label94:setFontColor("#959595");
    obj.label94:setTop(15);
    obj.label94:setLeft(157);
    obj.label94:setField("LFeri");
    obj.label94:setName("label94");
    obj.label94:setFontFamily("Cambria");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout33);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(30);
    obj.layout40:setName("layout40");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout40);
    obj.label95:setAlign("left");
    obj.label95:setWidth(100);
    obj.label95:setText("Ser. Ferido");
    obj.label95:setMargins({left=5});
    obj.label95:setName("label95");
    obj.label95:setFontColor("white");
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setFontFamily("Cambria");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout40);
    obj.label96:setAlign("left");
    obj.label96:setField("SerFerido");
    obj.label96:setWidth(50);
    obj.label96:setName("label96");
    obj.label96:setFontColor("white");
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setFontFamily("Cambria");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout40);
    obj.label97:setAlign("left");
    obj.label97:setFontSize(16.0);
    obj.label97:setField("FSeri");
    obj.label97:setWidth(35);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");
    obj.label97:setFontColor("white");
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setFontFamily("Cambria");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout40);
    obj.label98:setAlign("left");
    obj.label98:setText("de");
    lfm_setPropAsString(obj.label98, "fontStyle",  "");
    obj.label98:setFontColor("#959595");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setWidth(40);
    obj.label98:setName("label98");
    obj.label98:setFontFamily("Cambria");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout40);
    obj.label99:setAlign("left");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setFontSize(16.0);
    obj.label99:setField("Seri");
    obj.label99:setWidth(30);
    obj.label99:setName("label99");
    obj.label99:setFontColor("white");
    lfm_setPropAsString(obj.label99, "fontStyle",  "bold");
    obj.label99:setFontFamily("Cambria");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout40);
    obj.label100:setHorzTextAlign("trailing");
    obj.label100:setFontSize(12.0);
    lfm_setPropAsString(obj.label100, "fontStyle",  "");
    obj.label100:setFontColor("#959595");
    obj.label100:setTop(15);
    obj.label100:setLeft(157);
    obj.label100:setField("LSeri");
    obj.label100:setName("label100");
    obj.label100:setFontFamily("Cambria");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout33);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(30);
    obj.layout41:setName("layout41");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout41);
    obj.label101:setAlign("left");
    obj.label101:setWidth(100);
    obj.label101:setText("Incapacitado");
    obj.label101:setMargins({left=5});
    obj.label101:setName("label101");
    obj.label101:setFontColor("white");
    lfm_setPropAsString(obj.label101, "fontStyle",  "bold");
    obj.label101:setFontFamily("Cambria");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout41);
    obj.label102:setAlign("left");
    obj.label102:setField("Incapacitado");
    obj.label102:setWidth(50);
    obj.label102:setName("label102");
    obj.label102:setFontColor("white");
    lfm_setPropAsString(obj.label102, "fontStyle",  "bold");
    obj.label102:setFontFamily("Cambria");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout41);
    obj.label103:setAlign("left");
    obj.label103:setFontSize(16.0);
    obj.label103:setField("FInca");
    obj.label103:setWidth(35);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");
    obj.label103:setFontColor("white");
    lfm_setPropAsString(obj.label103, "fontStyle",  "bold");
    obj.label103:setFontFamily("Cambria");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout41);
    obj.label104:setAlign("left");
    obj.label104:setText("de");
    lfm_setPropAsString(obj.label104, "fontStyle",  "");
    obj.label104:setFontColor("#959595");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setWidth(40);
    obj.label104:setName("label104");
    obj.label104:setFontFamily("Cambria");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout41);
    obj.label105:setAlign("left");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setFontSize(16.0);
    obj.label105:setField("Inca");
    obj.label105:setWidth(30);
    obj.label105:setName("label105");
    obj.label105:setFontColor("white");
    lfm_setPropAsString(obj.label105, "fontStyle",  "bold");
    obj.label105:setFontFamily("Cambria");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout41);
    obj.label106:setHorzTextAlign("trailing");
    obj.label106:setFontSize(12.0);
    lfm_setPropAsString(obj.label106, "fontStyle",  "");
    obj.label106:setFontColor("#959595");
    obj.label106:setTop(15);
    obj.label106:setLeft(157);
    obj.label106:setField("LInca");
    obj.label106:setName("label106");
    obj.label106:setFontFamily("Cambria");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout33);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(30);
    obj.layout42:setName("layout42");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout42);
    obj.label107:setAlign("left");
    obj.label107:setWidth(100);
    obj.label107:setText("Abatido");
    obj.label107:setMargins({left=5});
    obj.label107:setName("label107");
    obj.label107:setFontColor("white");
    lfm_setPropAsString(obj.label107, "fontStyle",  "bold");
    obj.label107:setFontFamily("Cambria");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout42);
    obj.label108:setAlign("left");
    obj.label108:setField("Abatido");
    obj.label108:setWidth(50);
    obj.label108:setName("label108");
    obj.label108:setFontColor("white");
    lfm_setPropAsString(obj.label108, "fontStyle",  "bold");
    obj.label108:setFontFamily("Cambria");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout42);
    obj.label109:setAlign("left");
    obj.label109:setFontSize(16.0);
    obj.label109:setField("FAbat");
    obj.label109:setWidth(35);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");
    obj.label109:setFontColor("white");
    lfm_setPropAsString(obj.label109, "fontStyle",  "bold");
    obj.label109:setFontFamily("Cambria");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout42);
    obj.label110:setAlign("left");
    obj.label110:setText("de");
    lfm_setPropAsString(obj.label110, "fontStyle",  "");
    obj.label110:setFontColor("#959595");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setWidth(40);
    obj.label110:setName("label110");
    obj.label110:setFontFamily("Cambria");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout42);
    obj.label111:setAlign("left");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setFontSize(16.0);
    obj.label111:setField("Abat");
    obj.label111:setWidth(30);
    obj.label111:setName("label111");
    obj.label111:setFontColor("white");
    lfm_setPropAsString(obj.label111, "fontStyle",  "bold");
    obj.label111:setFontFamily("Cambria");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout42);
    obj.label112:setHorzTextAlign("trailing");
    obj.label112:setFontSize(12.0);
    lfm_setPropAsString(obj.label112, "fontStyle",  "");
    obj.label112:setFontColor("#959595");
    obj.label112:setTop(15);
    obj.label112:setLeft(157);
    obj.label112:setField("LAbat");
    obj.label112:setName("label112");
    obj.label112:setFontFamily("Cambria");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout33);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(30);
    obj.layout43:setName("layout43");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout43);
    obj.label113:setAlign("left");
    obj.label113:setWidth(100);
    obj.label113:setText("Inconsciente");
    obj.label113:setMargins({left=5});
    obj.label113:setName("label113");
    obj.label113:setFontColor("white");
    lfm_setPropAsString(obj.label113, "fontStyle",  "bold");
    obj.label113:setFontFamily("Cambria");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout43);
    obj.label114:setAlign("left");
    obj.label114:setText("X");
    obj.label114:setWidth(50);
    obj.label114:setName("label114");
    obj.label114:setFontColor("white");
    lfm_setPropAsString(obj.label114, "fontStyle",  "bold");
    obj.label114:setFontFamily("Cambria");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout43);
    obj.label115:setAlign("left");
    obj.label115:setFontSize(16.0);
    obj.label115:setField("FInco");
    obj.label115:setWidth(35);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");
    obj.label115:setFontColor("white");
    lfm_setPropAsString(obj.label115, "fontStyle",  "bold");
    obj.label115:setFontFamily("Cambria");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout43);
    obj.label116:setAlign("left");
    obj.label116:setText("de");
    lfm_setPropAsString(obj.label116, "fontStyle",  "");
    obj.label116:setFontColor("#959595");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setWidth(40);
    obj.label116:setName("label116");
    obj.label116:setFontFamily("Cambria");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout43);
    obj.label117:setAlign("left");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setFontSize(16.0);
    obj.label117:setField("Inco");
    obj.label117:setWidth(30);
    obj.label117:setName("label117");
    obj.label117:setFontColor("white");
    lfm_setPropAsString(obj.label117, "fontStyle",  "bold");
    obj.label117:setFontFamily("Cambria");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout43);
    obj.label118:setHorzTextAlign("trailing");
    obj.label118:setFontSize(12.0);
    lfm_setPropAsString(obj.label118, "fontStyle",  "");
    obj.label118:setFontColor("#959595");
    obj.label118:setTop(15);
    obj.label118:setLeft(157);
    obj.label118:setField("LInco");
    obj.label118:setName("label118");
    obj.label118:setFontFamily("Cambria");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout33);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(30);
    obj.layout44:setMargins({top=20});
    obj.layout44:setName("layout44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout44);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(145);
    obj.layout45:setName("layout45");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout45);
    obj.label119:setAlign("left");
    obj.label119:setText("Ferimentos:");
    obj.label119:setWidth(75);
    obj.label119:setMargins({left=5});
    obj.label119:setName("label119");
    obj.label119:setFontColor("white");
    lfm_setPropAsString(obj.label119, "fontStyle",  "bold");
    obj.label119:setFontFamily("Cambria");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout45);
    obj.edit28:setAlign("client");
    obj.edit28:setField("ferimentos");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");
    obj.edit28:setFontColor("#cdcdcd");
    obj.edit28:setFontFamily("Cambria");
    obj.edit28:setTransparent(true);

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout45);
    obj.dataLink42:setDefaultValue("0");
    obj.dataLink42:setField("ferimentos");
    obj.dataLink42:setName("dataLink42");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout44);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(160);
    obj.layout46:setName("layout46");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout46);
    obj.label120:setAlign("left");
    obj.label120:setText("Regeneração:");
    obj.label120:setWidth(85);
    obj.label120:setName("label120");
    obj.label120:setFontColor("white");
    lfm_setPropAsString(obj.label120, "fontStyle",  "bold");
    obj.label120:setFontFamily("Cambria");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout46);
    obj.label121:setAlign("left");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setField("RecuFerimento");
    obj.label121:setWidth(20);
    obj.label121:setName("label121");
    obj.label121:setFontColor("white");
    lfm_setPropAsString(obj.label121, "fontStyle",  "bold");
    obj.label121:setFontFamily("Cambria");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout46);
    obj.label122:setAlign("left");
    lfm_setPropAsString(obj.label122, "fontStyle",  "");
    obj.label122:setText("/ dia");
    obj.label122:setName("label122");
    obj.label122:setFontColor("white");
    obj.label122:setFontFamily("Cambria");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flowPart7);
    obj.image3:setURL("/Frames/logo.png");
    obj.image3:setHeight(135);
    obj.image3:setStyle("proportional");
    obj.image3:setAlign("bottom");
    obj.image3:setMargins({bottom=80});
    obj.image3:setName("image3");

    obj.layMecanicas = GUI.fromHandle(_obj_newObject("layout"));
    obj.layMecanicas:setParent(obj.rectangle3);
    obj.layMecanicas:setName("layMecanicas");
    obj.layMecanicas:setAlign("client");
    obj.layMecanicas:setVisible(false);

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.layMecanicas);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");

    obj.fpEsquerdaMec = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpEsquerdaMec:setParent(obj.flowLayout5);
    obj.fpEsquerdaMec:setName("fpEsquerdaMec");
    obj.fpEsquerdaMec:setMinWidth(300);
    obj.fpEsquerdaMec:setMaxWidth(650);
    obj.fpEsquerdaMec:setHeight(1500);
    obj.fpEsquerdaMec:setVertAlign("leading");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.fpEsquerdaMec);
    obj.rectangle15:setMargins({left=20, right=10, top=20});
    obj.rectangle15:setAlign("top");
    obj.rectangle15:setHeight(30);
    obj.rectangle15:setXradius(5);
    obj.rectangle15:setYradius(5);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setColor("#212121");
    obj.rectangle15:setName("rectangle15");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle15);
    obj.button7:setText("F R E N T E");
    obj.button7:setName("button7");
    obj.button7:setAlign("left");
    obj.button7:setMargins({right=2});
    obj.button7:setWidth(100);
    obj.button7:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button7, "fontStyle",  "bold");
    obj.button7:setFontSize(10);

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.rectangle15);
    obj.button8:setText("M E C Â N I C A S");
    obj.button8:setName("button8");
    obj.button8:setAlign("left");
    obj.button8:setMargins({right=2});
    obj.button8:setWidth(100);
    obj.button8:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button8, "fontStyle",  "bold");
    obj.button8:setFontSize(10);

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.rectangle15);
    obj.button9:setText("M A G I A S");
    obj.button9:setName("button9");
    obj.button9:setAlign("left");
    obj.button9:setMargins({right=2});
    obj.button9:setWidth(100);
    obj.button9:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button9, "fontStyle",  "bold");
    obj.button9:setFontSize(10);

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.rectangle15);
    obj.button10:setText("H I S T Ó R I A");
    obj.button10:setName("button10");
    obj.button10:setAlign("left");
    obj.button10:setMargins({right=2});
    obj.button10:setWidth(100);
    obj.button10:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button10, "fontStyle",  "bold");
    obj.button10:setFontSize(10);

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.rectangle15);
    obj.button11:setText("A N O T A Ç Õ E S");
    obj.button11:setName("button11");
    obj.button11:setAlign("left");
    obj.button11:setMargins({right=2});
    obj.button11:setWidth(100);
    obj.button11:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button11, "fontStyle",  "bold");
    obj.button11:setFontSize(10);

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.fpEsquerdaMec);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(30);
    obj.layout47:setMargins({top=10, left=20, bottom=15});
    obj.layout47:setName("layout47");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout47);
    obj.label123:setAlign("left");
    obj.label123:setText("V A N T A G E N S");
    obj.label123:setWidth(163);
    obj.label123:setFontSize(20);
    obj.label123:setFontFamily("Constantia");
    obj.label123:setName("label123");
    obj.label123:setFontColor("white");
    lfm_setPropAsString(obj.label123, "fontStyle",  "bold");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout47);
    obj.horzLine9:setAlign("client");
    obj.horzLine9:setMargins({right=9, top=14});
    obj.horzLine9:setStrokeColor("#424242");
    obj.horzLine9:setName("horzLine9");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.fpEsquerdaMec);
    obj.rectangle16:setAlign("top");
    obj.rectangle16:setHeight(30);
    obj.rectangle16:setXradius(5);
    obj.rectangle16:setYradius(5);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setColor("#212121");
    obj.rectangle16:setMargins({left=20, right=10});
    obj.rectangle16:setName("rectangle16");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle16);
    obj.label124:setAlign("left");
    obj.label124:setWidth(466);
    obj.label124:setText("NOME DAS VANTAGENS");
    obj.label124:setMargins({left=5});
    obj.label124:setName("label124");
    obj.label124:setFontColor("white");
    lfm_setPropAsString(obj.label124, "fontStyle",  "bold");
    obj.label124:setFontFamily("Cambria");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle16);
    obj.label125:setAlign("left");
    obj.label125:setWidth(72);
    obj.label125:setText("TIPO");
    obj.label125:setName("label125");
    obj.label125:setFontColor("white");
    lfm_setPropAsString(obj.label125, "fontStyle",  "bold");
    obj.label125:setFontFamily("Cambria");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.rectangle16);
    obj.label126:setAlign("left");
    obj.label126:setText("CUSTO");
    obj.label126:setName("label126");
    obj.label126:setFontColor("white");
    lfm_setPropAsString(obj.label126, "fontStyle",  "bold");
    obj.label126:setFontFamily("Cambria");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.rectangle16);
    obj.button12:setAlign("right");
    obj.button12:setText("🞦");
    obj.button12:setWidth(30);
    obj.button12:setName("button12");

    obj.rclVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclVantagens:setParent(obj.fpEsquerdaMec);
    obj.rclVantagens:setName("rclVantagens");
    obj.rclVantagens:setField("vantagens");
    obj.rclVantagens:setTemplateForm("templateVantagens");
    obj.rclVantagens:setAlign("top");
    obj.rclVantagens:setAutoHeight(true);
    obj.rclVantagens:setMargins({left=20, right=10});

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.fpEsquerdaMec);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(30);
    obj.layout48:setMargins({top=40, left=20, bottom=15});
    obj.layout48:setName("layout48");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout48);
    obj.label127:setAlign("left");
    obj.label127:setText("D E S V A N T A G E N S");
    obj.label127:setWidth(215);
    obj.label127:setFontSize(20);
    obj.label127:setFontFamily("Constantia");
    obj.label127:setName("label127");
    obj.label127:setFontColor("white");
    lfm_setPropAsString(obj.label127, "fontStyle",  "bold");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout48);
    obj.horzLine10:setAlign("client");
    obj.horzLine10:setMargins({right=9, top=14});
    obj.horzLine10:setStrokeColor("#424242");
    obj.horzLine10:setName("horzLine10");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.fpEsquerdaMec);
    obj.rectangle17:setAlign("top");
    obj.rectangle17:setHeight(30);
    obj.rectangle17:setXradius(5);
    obj.rectangle17:setYradius(5);
    obj.rectangle17:setCornerType("round");
    obj.rectangle17:setColor("#212121");
    obj.rectangle17:setMargins({left=20, right=10});
    obj.rectangle17:setName("rectangle17");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.rectangle17);
    obj.label128:setAlign("left");
    obj.label128:setWidth(466);
    obj.label128:setText("NOME DAS DESVANTAGENS");
    obj.label128:setMargins({left=5});
    obj.label128:setName("label128");
    obj.label128:setFontColor("white");
    lfm_setPropAsString(obj.label128, "fontStyle",  "bold");
    obj.label128:setFontFamily("Cambria");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.rectangle17);
    obj.label129:setAlign("left");
    obj.label129:setWidth(72);
    obj.label129:setText("TIPO");
    obj.label129:setName("label129");
    obj.label129:setFontColor("white");
    lfm_setPropAsString(obj.label129, "fontStyle",  "bold");
    obj.label129:setFontFamily("Cambria");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.rectangle17);
    obj.label130:setAlign("left");
    obj.label130:setText("CUSTO");
    obj.label130:setName("label130");
    obj.label130:setFontColor("white");
    lfm_setPropAsString(obj.label130, "fontStyle",  "bold");
    obj.label130:setFontFamily("Cambria");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle17);
    obj.button13:setAlign("right");
    obj.button13:setText("🞦");
    obj.button13:setWidth(30);
    obj.button13:setName("button13");

    obj.rclDesVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDesVantagens:setParent(obj.fpEsquerdaMec);
    obj.rclDesVantagens:setName("rclDesVantagens");
    obj.rclDesVantagens:setField("desvantagens");
    obj.rclDesVantagens:setTemplateForm("templateDesVantagens");
    obj.rclDesVantagens:setAlign("top");
    obj.rclDesVantagens:setAutoHeight(true);
    obj.rclDesVantagens:setMargins({left=20, right=10});

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.fpEsquerdaMec);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(30);
    obj.layout49:setMargins({top=40, left=20, bottom=15});
    obj.layout49:setName("layout49");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout49);
    obj.label131:setAlign("left");
    obj.label131:setText("T É C N I C A S");
    obj.label131:setWidth(137);
    obj.label131:setFontSize(20);
    obj.label131:setFontFamily("Constantia");
    obj.label131:setName("label131");
    obj.label131:setFontColor("white");
    lfm_setPropAsString(obj.label131, "fontStyle",  "bold");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout49);
    obj.horzLine11:setAlign("client");
    obj.horzLine11:setMargins({right=9, top=14});
    obj.horzLine11:setStrokeColor("#424242");
    obj.horzLine11:setName("horzLine11");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.fpEsquerdaMec);
    obj.rectangle18:setAlign("top");
    obj.rectangle18:setHeight(30);
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(5);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setColor("#212121");
    obj.rectangle18:setMargins({left=20, right=10});
    obj.rectangle18:setName("rectangle18");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.rectangle18);
    obj.label132:setAlign("left");
    obj.label132:setText("NOME");
    obj.label132:setMargins({left=5});
    obj.label132:setWidth(280);
    obj.label132:setName("label132");
    obj.label132:setFontColor("white");
    lfm_setPropAsString(obj.label132, "fontStyle",  "bold");
    obj.label132:setFontFamily("Cambria");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle18);
    obj.label133:setAlign("left");
    obj.label133:setText("NV.");
    obj.label133:setWidth(27);
    obj.label133:setName("label133");
    obj.label133:setFontColor("white");
    lfm_setPropAsString(obj.label133, "fontStyle",  "bold");
    obj.label133:setFontFamily("Cambria");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.rectangle18);
    obj.label134:setAlign("left");
    obj.label134:setText("AFINIDADE");
    obj.label134:setWidth(82);
    obj.label134:setName("label134");
    obj.label134:setFontColor("white");
    lfm_setPropAsString(obj.label134, "fontStyle",  "bold");
    obj.label134:setFontFamily("Cambria");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle18);
    obj.label135:setAlign("left");
    obj.label135:setText("DEFICIÊNCIA");
    obj.label135:setName("label135");
    obj.label135:setFontColor("white");
    lfm_setPropAsString(obj.label135, "fontStyle",  "bold");
    obj.label135:setFontFamily("Cambria");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle18);
    obj.button14:setAlign("right");
    obj.button14:setText("🞦");
    obj.button14:setWidth(30);
    obj.button14:setName("button14");

    obj.rclTecnicas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTecnicas:setParent(obj.fpEsquerdaMec);
    obj.rclTecnicas:setName("rclTecnicas");
    obj.rclTecnicas:setField("tecnicas");
    obj.rclTecnicas:setTemplateForm("templateTecnicas");
    obj.rclTecnicas:setMinQt(1);
    obj.rclTecnicas:setAlign("top");
    obj.rclTecnicas:setAutoHeight(true);
    obj.rclTecnicas:setMargins({left=20, right=10});

    obj.fpDireitaMec = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fpDireitaMec:setParent(obj.flowLayout5);
    obj.fpDireitaMec:setName("fpDireitaMec");
    obj.fpDireitaMec:setMinWidth(100);
    obj.fpDireitaMec:setMaxWidth(350);
    obj.fpDireitaMec:setHeight(1600);

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.fpDireitaMec);
    obj.rectangle19:setWidth(300);
    obj.rectangle19:setHeight(1530);
    obj.rectangle19:setColor("#202020");
    obj.rectangle19:setName("rectangle19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.fpDireitaMec);
    obj.rectangle20:setWidth(320);
    obj.rectangle20:setHeight(1530);
    obj.rectangle20:setColor("#202020");
    obj.rectangle20:setXradius(20);
    obj.rectangle20:setYradius(20);
    obj.rectangle20:setCornerType("bevel");
    obj.rectangle20:setName("rectangle20");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.fpDireitaMec);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(30);
    obj.layout50:setMargins({top=60, left=20, bottom=15});
    obj.layout50:setName("layout50");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout50);
    obj.label136:setAlign("left");
    obj.label136:setText("K A T A S   🙵   K I H O S");
    obj.label136:setWidth(220);
    obj.label136:setFontSize(20);
    obj.label136:setFontFamily("Constantia");
    obj.label136:setName("label136");
    obj.label136:setFontColor("white");
    lfm_setPropAsString(obj.label136, "fontStyle",  "bold");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout50);
    obj.horzLine12:setAlign("client");
    obj.horzLine12:setMargins({right=20, top=14});
    obj.horzLine12:setStrokeColor("#424242");
    obj.horzLine12:setName("horzLine12");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.fpDireitaMec);
    obj.rectangle21:setAlign("top");
    obj.rectangle21:setHeight(30);
    obj.rectangle21:setXradius(5);
    obj.rectangle21:setYradius(5);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setColor("black");
    obj.rectangle21:setMargins({left=10, right=20});
    obj.rectangle21:setName("rectangle21");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.rectangle21);
    obj.label137:setAlign("left");
    obj.label137:setText("NOME");
    obj.label137:setMargins({left=5});
    obj.label137:setWidth(195);
    obj.label137:setName("label137");
    obj.label137:setFontColor("white");
    lfm_setPropAsString(obj.label137, "fontStyle",  "bold");
    obj.label137:setFontFamily("Cambria");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.rectangle21);
    obj.label138:setAlign("left");
    obj.label138:setText("NV.");
    obj.label138:setName("label138");
    obj.label138:setFontColor("white");
    lfm_setPropAsString(obj.label138, "fontStyle",  "bold");
    obj.label138:setFontFamily("Cambria");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle21);
    obj.button15:setAlign("right");
    obj.button15:setText("🞦");
    obj.button15:setWidth(30);
    obj.button15:setName("button15");

    obj.rclKata = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclKata:setParent(obj.fpDireitaMec);
    obj.rclKata:setName("rclKata");
    obj.rclKata:setField("kata");
    obj.rclKata:setTemplateForm("templateKata");
    obj.rclKata:setAlign("top");
    obj.rclKata:setAutoHeight(true);
    obj.rclKata:setMargins({left=10, right=20});

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.fpDireitaMec);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(30);
    obj.layout51:setMargins({top=40, left=20, bottom=15});
    obj.layout51:setName("layout51");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout51);
    obj.label139:setAlign("left");
    obj.label139:setText("A R M A S");
    obj.label139:setWidth(100);
    obj.label139:setFontSize(20);
    obj.label139:setFontFamily("Constantia");
    obj.label139:setName("label139");
    obj.label139:setFontColor("white");
    lfm_setPropAsString(obj.label139, "fontStyle",  "bold");

    obj.horzLine13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine13:setParent(obj.layout51);
    obj.horzLine13:setAlign("client");
    obj.horzLine13:setMargins({right=20, top=14});
    obj.horzLine13:setStrokeColor("#424242");
    obj.horzLine13:setName("horzLine13");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.fpDireitaMec);
    obj.rectangle22:setAlign("top");
    obj.rectangle22:setHeight(30);
    obj.rectangle22:setXradius(5);
    obj.rectangle22:setYradius(5);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setMargins({left=10, right=20});
    obj.rectangle22:setName("rectangle22");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.rectangle22);
    obj.label140:setAlign("left");
    obj.label140:setText("NOME DAS ARMAS");
    obj.label140:setWidth(200);
    obj.label140:setMargins({left=5});
    obj.label140:setName("label140");
    obj.label140:setFontColor("white");
    lfm_setPropAsString(obj.label140, "fontStyle",  "bold");
    obj.label140:setFontFamily("Cambria");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.rectangle22);
    obj.button16:setAlign("right");
    obj.button16:setText("🞦");
    obj.button16:setWidth(30);
    obj.button16:setName("button16");

    obj.rclArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.fpDireitaMec);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("armas");
    obj.rclArmas:setTemplateForm("templateArmas");
    obj.rclArmas:setAlign("top");
    obj.rclArmas:setAutoHeight(true);
    obj.rclArmas:setMargins({left=10, right=20});

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.fpDireitaMec);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(30);
    obj.layout52:setMargins({top=40, left=20, bottom=15});
    obj.layout52:setName("layout52");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout52);
    obj.label141:setAlign("left");
    obj.label141:setText("I N V E N T Á R I O");
    obj.label141:setWidth(180);
    obj.label141:setFontSize(20);
    obj.label141:setFontFamily("Constantia");
    obj.label141:setName("label141");
    obj.label141:setFontColor("white");
    lfm_setPropAsString(obj.label141, "fontStyle",  "bold");

    obj.horzLine14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine14:setParent(obj.layout52);
    obj.horzLine14:setAlign("client");
    obj.horzLine14:setMargins({right=20, top=14});
    obj.horzLine14:setStrokeColor("#424242");
    obj.horzLine14:setName("horzLine14");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.fpDireitaMec);
    obj.rectangle23:setAlign("top");
    obj.rectangle23:setHeight(30);
    obj.rectangle23:setXradius(5);
    obj.rectangle23:setYradius(5);
    obj.rectangle23:setCornerType("round");
    obj.rectangle23:setColor("black");
    obj.rectangle23:setMargins({left=10, right=20});
    obj.rectangle23:setName("rectangle23");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.rectangle23);
    obj.label142:setAlign("left");
    obj.label142:setText("Koku:");
    obj.label142:setMargins({left=5});
    obj.label142:setWidth(40);
    obj.label142:setName("label142");
    obj.label142:setFontColor("white");
    lfm_setPropAsString(obj.label142, "fontStyle",  "bold");
    obj.label142:setFontFamily("Cambria");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle23);
    obj.edit29:setAlign("left");
    obj.edit29:setField("koku");
    obj.edit29:setWidth(55);
    obj.edit29:setType("number");
    obj.edit29:setMargins({right=2});
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("#cdcdcd");
    obj.edit29:setFontFamily("Cambria");
    obj.edit29:setTransparent(true);

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.rectangle23);
    obj.dataLink43:setDefaultValue("0");
    obj.dataLink43:setField("koku");
    obj.dataLink43:setName("dataLink43");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.rectangle23);
    obj.label143:setAlign("left");
    obj.label143:setText("Bu:");
    obj.label143:setWidth(40);
    obj.label143:setName("label143");
    obj.label143:setFontColor("white");
    lfm_setPropAsString(obj.label143, "fontStyle",  "bold");
    obj.label143:setFontFamily("Cambria");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle23);
    obj.edit30:setAlign("left");
    obj.edit30:setField("bu");
    obj.edit30:setWidth(55);
    obj.edit30:setType("number");
    obj.edit30:setMargins({right=2});
    obj.edit30:setName("edit30");
    obj.edit30:setFontColor("#cdcdcd");
    obj.edit30:setFontFamily("Cambria");
    obj.edit30:setTransparent(true);

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.rectangle23);
    obj.dataLink44:setDefaultValue("0");
    obj.dataLink44:setField("bu");
    obj.dataLink44:setName("dataLink44");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.rectangle23);
    obj.label144:setAlign("left");
    obj.label144:setText("Zeni:");
    obj.label144:setWidth(40);
    obj.label144:setName("label144");
    obj.label144:setFontColor("white");
    lfm_setPropAsString(obj.label144, "fontStyle",  "bold");
    obj.label144:setFontFamily("Cambria");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle23);
    obj.edit31:setAlign("left");
    obj.edit31:setField("zeni");
    obj.edit31:setWidth(55);
    obj.edit31:setType("number");
    obj.edit31:setMargins({right=2});
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("#cdcdcd");
    obj.edit31:setFontFamily("Cambria");
    obj.edit31:setTransparent(true);

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.rectangle23);
    obj.dataLink45:setDefaultValue("0");
    obj.dataLink45:setField("zeni");
    obj.dataLink45:setName("dataLink45");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.fpDireitaMec);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setMargins({left=10, top=10, right=20, bottom=50});
    obj.rectangle24:setColor("#272727");
    obj.rectangle24:setXradius(5);
    obj.rectangle24:setYradius(5);
    obj.rectangle24:setCornerType("round");
    obj.rectangle24:setName("rectangle24");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle24);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setMargins({left=5, top=5, right=5, bottom=5});
    obj.textEditor1:setField("inventario");
    obj.textEditor1:setFontColor("#cdcdcd");
    obj.textEditor1:setFontFamily("Cambria");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.fpDireitaMec);
    obj.image4:setURL("/Frames/logo.png");
    obj.image4:setHeight(135);
    obj.image4:setStyle("proportional");
    obj.image4:setAlign("bottom");
    obj.image4:setMargins({bottom=80});
    obj.image4:setName("image4");

    obj.layMagias = GUI.fromHandle(_obj_newObject("layout"));
    obj.layMagias:setParent(obj.rectangle3);
    obj.layMagias:setName("layMagias");
    obj.layMagias:setAlign("client");
    obj.layMagias:setVisible(false);

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layMagias);
    obj.rectangle25:setMargins({left=20, right=10, top=20});
    obj.rectangle25:setAlign("top");
    obj.rectangle25:setHeight(30);
    obj.rectangle25:setXradius(5);
    obj.rectangle25:setYradius(5);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setColor("#212121");
    obj.rectangle25:setName("rectangle25");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.rectangle25);
    obj.button17:setText("F R E N T E");
    obj.button17:setName("button17");
    obj.button17:setAlign("left");
    obj.button17:setMargins({right=2});
    obj.button17:setWidth(100);
    obj.button17:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button17, "fontStyle",  "bold");
    obj.button17:setFontSize(10);

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.rectangle25);
    obj.button18:setText("M E C Â N I C A S");
    obj.button18:setName("button18");
    obj.button18:setAlign("left");
    obj.button18:setMargins({right=2});
    obj.button18:setWidth(100);
    obj.button18:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button18, "fontStyle",  "bold");
    obj.button18:setFontSize(10);

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.rectangle25);
    obj.button19:setText("M A G I A S");
    obj.button19:setName("button19");
    obj.button19:setAlign("left");
    obj.button19:setMargins({right=2});
    obj.button19:setWidth(100);
    obj.button19:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button19, "fontStyle",  "bold");
    obj.button19:setFontSize(10);

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.rectangle25);
    obj.button20:setText("H I S T Ó R I A");
    obj.button20:setName("button20");
    obj.button20:setAlign("left");
    obj.button20:setMargins({right=2});
    obj.button20:setWidth(100);
    obj.button20:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button20, "fontStyle",  "bold");
    obj.button20:setFontSize(10);

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.rectangle25);
    obj.button21:setText("A N O T A Ç Õ E S");
    obj.button21:setName("button21");
    obj.button21:setAlign("left");
    obj.button21:setMargins({right=2});
    obj.button21:setWidth(100);
    obj.button21:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button21, "fontStyle",  "bold");
    obj.button21:setFontSize(10);

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layMagias);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(30);
    obj.layout53:setMargins({top=10, left=20, bottom=15});
    obj.layout53:setName("layout53");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout53);
    obj.label145:setAlign("left");
    obj.label145:setText("L I S T A   D E   M A G I A S");
    obj.label145:setWidth(245);
    obj.label145:setFontSize(20);
    obj.label145:setFontFamily("Constantia");
    obj.label145:setName("label145");
    obj.label145:setFontColor("white");
    lfm_setPropAsString(obj.label145, "fontStyle",  "bold");

    obj.horzLine15 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine15:setParent(obj.layout53);
    obj.horzLine15:setAlign("client");
    obj.horzLine15:setMargins({right=20, top=14});
    obj.horzLine15:setStrokeColor("#424242");
    obj.horzLine15:setName("horzLine15");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layMagias);
    obj.rectangle26:setAlign("top");
    obj.rectangle26:setHeight(30);
    obj.rectangle26:setXradius(5);
    obj.rectangle26:setYradius(5);
    obj.rectangle26:setCornerType("round");
    obj.rectangle26:setColor("#212121");
    obj.rectangle26:setMargins({left=20, right=20});
    obj.rectangle26:setName("rectangle26");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle26);
    obj.layout54:setWidth(185);
    obj.layout54:setAlign("left");
    obj.layout54:setMargins({left=5});
    obj.layout54:setName("layout54");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout54);
    obj.image5:setAlign("left");
    obj.image5:setStyle("proportional");
    obj.image5:setWidth(25);
    obj.image5:setSRC("/Frames/miniAguaI.png");
    obj.image5:setMargins({right=7, top=2.5, bottom=2.5});
    obj.image5:setName("image5");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout54);
    obj.label146:setAlign("left");
    obj.label146:setText("ÁGUA:");
    obj.label146:setMargins({right=2});
    obj.label146:setWidth(38);
    obj.label146:setName("label146");
    obj.label146:setFontColor("white");
    lfm_setPropAsString(obj.label146, "fontStyle",  "bold");
    obj.label146:setFontFamily("Cambria");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout54);
    obj.edit32:setField("slotAgua");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setWidth(25);
    obj.edit32:setAlign("left");
    obj.edit32:setName("edit32");
    obj.edit32:setFontColor("#cdcdcd");
    obj.edit32:setFontFamily("Cambria");
    obj.edit32:setTransparent(true);

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout54);
    obj.dataLink46:setDefaultValue("0");
    obj.dataLink46:setField("slotAgua");
    obj.dataLink46:setName("dataLink46");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout54);
    obj.label147:setAlign("left");
    obj.label147:setWidth(10);
    obj.label147:setText("/");
    obj.label147:setName("label147");
    obj.label147:setFontColor("white");
    lfm_setPropAsString(obj.label147, "fontStyle",  "bold");
    obj.label147:setFontFamily("Cambria");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout54);
    obj.label148:setAlign("left");
    obj.label148:setWidth(25);
    obj.label148:setField("water");
    obj.label148:setName("label148");
    obj.label148:setFontColor("white");
    lfm_setPropAsString(obj.label148, "fontStyle",  "bold");
    obj.label148:setFontFamily("Cambria");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle26);
    obj.layout55:setWidth(185);
    obj.layout55:setAlign("left");
    obj.layout55:setName("layout55");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout55);
    obj.image6:setAlign("left");
    obj.image6:setStyle("proportional");
    obj.image6:setWidth(25);
    obj.image6:setSRC("/Frames/miniArI.png");
    obj.image6:setMargins({right=7, top=2.5, bottom=2.5});
    obj.image6:setName("image6");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout55);
    obj.label149:setAlign("left");
    obj.label149:setText("AR:");
    obj.label149:setMargins({right=2});
    obj.label149:setWidth(25);
    obj.label149:setName("label149");
    obj.label149:setFontColor("white");
    lfm_setPropAsString(obj.label149, "fontStyle",  "bold");
    obj.label149:setFontFamily("Cambria");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout55);
    obj.edit33:setField("slotAr");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setWidth(25);
    obj.edit33:setAlign("left");
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("#cdcdcd");
    obj.edit33:setFontFamily("Cambria");
    obj.edit33:setTransparent(true);

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout55);
    obj.dataLink47:setDefaultValue("0");
    obj.dataLink47:setField("slotAr");
    obj.dataLink47:setName("dataLink47");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout55);
    obj.label150:setAlign("left");
    obj.label150:setWidth(10);
    obj.label150:setText("/");
    obj.label150:setName("label150");
    obj.label150:setFontColor("white");
    lfm_setPropAsString(obj.label150, "fontStyle",  "bold");
    obj.label150:setFontFamily("Cambria");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout55);
    obj.label151:setAlign("left");
    obj.label151:setWidth(25);
    obj.label151:setField("air");
    obj.label151:setName("label151");
    obj.label151:setFontColor("white");
    lfm_setPropAsString(obj.label151, "fontStyle",  "bold");
    obj.label151:setFontFamily("Cambria");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle26);
    obj.layout56:setWidth(185);
    obj.layout56:setAlign("left");
    obj.layout56:setName("layout56");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout56);
    obj.image7:setAlign("left");
    obj.image7:setStyle("proportional");
    obj.image7:setWidth(25);
    obj.image7:setSRC("/Frames/miniFogoI.png");
    obj.image7:setMargins({right=7, top=2.5, bottom=2.5});
    obj.image7:setName("image7");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout56);
    obj.label152:setAlign("left");
    obj.label152:setText("FOGO:");
    obj.label152:setMargins({right=2});
    obj.label152:setWidth(38);
    obj.label152:setName("label152");
    obj.label152:setFontColor("white");
    lfm_setPropAsString(obj.label152, "fontStyle",  "bold");
    obj.label152:setFontFamily("Cambria");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout56);
    obj.edit34:setField("slotFogo");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setWidth(25);
    obj.edit34:setAlign("left");
    obj.edit34:setName("edit34");
    obj.edit34:setFontColor("#cdcdcd");
    obj.edit34:setFontFamily("Cambria");
    obj.edit34:setTransparent(true);

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout56);
    obj.dataLink48:setDefaultValue("0");
    obj.dataLink48:setField("slotFogo");
    obj.dataLink48:setName("dataLink48");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout56);
    obj.label153:setAlign("left");
    obj.label153:setWidth(10);
    obj.label153:setText("/");
    obj.label153:setName("label153");
    obj.label153:setFontColor("white");
    lfm_setPropAsString(obj.label153, "fontStyle",  "bold");
    obj.label153:setFontFamily("Cambria");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout56);
    obj.label154:setAlign("left");
    obj.label154:setWidth(25);
    obj.label154:setField("fire");
    obj.label154:setName("label154");
    obj.label154:setFontColor("white");
    lfm_setPropAsString(obj.label154, "fontStyle",  "bold");
    obj.label154:setFontFamily("Cambria");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle26);
    obj.layout57:setWidth(185);
    obj.layout57:setAlign("left");
    obj.layout57:setName("layout57");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layout57);
    obj.image8:setAlign("left");
    obj.image8:setStyle("proportional");
    obj.image8:setWidth(25);
    obj.image8:setSRC("/Frames/miniTerraI.png");
    obj.image8:setMargins({right=7, top=2.5, bottom=2.5});
    obj.image8:setName("image8");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout57);
    obj.label155:setAlign("left");
    obj.label155:setText("TERRA:");
    obj.label155:setMargins({right=2});
    obj.label155:setWidth(50);
    obj.label155:setName("label155");
    obj.label155:setFontColor("white");
    lfm_setPropAsString(obj.label155, "fontStyle",  "bold");
    obj.label155:setFontFamily("Cambria");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout57);
    obj.edit35:setField("slotTerra");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setWidth(25);
    obj.edit35:setAlign("left");
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("#cdcdcd");
    obj.edit35:setFontFamily("Cambria");
    obj.edit35:setTransparent(true);

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout57);
    obj.dataLink49:setDefaultValue("0");
    obj.dataLink49:setField("slotTerra");
    obj.dataLink49:setName("dataLink49");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout57);
    obj.label156:setAlign("left");
    obj.label156:setWidth(10);
    obj.label156:setText("/");
    obj.label156:setName("label156");
    obj.label156:setFontColor("white");
    lfm_setPropAsString(obj.label156, "fontStyle",  "bold");
    obj.label156:setFontFamily("Cambria");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout57);
    obj.label157:setAlign("left");
    obj.label157:setWidth(25);
    obj.label157:setField("earth");
    obj.label157:setName("label157");
    obj.label157:setFontColor("white");
    lfm_setPropAsString(obj.label157, "fontStyle",  "bold");
    obj.label157:setFontFamily("Cambria");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle26);
    obj.layout58:setWidth(185);
    obj.layout58:setAlign("left");
    obj.layout58:setName("layout58");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layout58);
    obj.image9:setAlign("left");
    obj.image9:setStyle("proportional");
    obj.image9:setWidth(25);
    obj.image9:setSRC("/Frames/miniVazioI.png");
    obj.image9:setMargins({right=7, top=2.5, bottom=2.5});
    obj.image9:setName("image9");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout58);
    obj.label158:setAlign("left");
    obj.label158:setText("VAZIO:");
    obj.label158:setMargins({right=2});
    obj.label158:setWidth(43);
    obj.label158:setName("label158");
    obj.label158:setFontColor("white");
    lfm_setPropAsString(obj.label158, "fontStyle",  "bold");
    obj.label158:setFontFamily("Cambria");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout58);
    obj.edit36:setField("slotVazio");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setWidth(25);
    obj.edit36:setAlign("left");
    obj.edit36:setName("edit36");
    obj.edit36:setFontColor("#cdcdcd");
    obj.edit36:setFontFamily("Cambria");
    obj.edit36:setTransparent(true);

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout58);
    obj.dataLink50:setDefaultValue("0");
    obj.dataLink50:setField("slotVazio");
    obj.dataLink50:setName("dataLink50");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout58);
    obj.label159:setAlign("left");
    obj.label159:setWidth(10);
    obj.label159:setText("/");
    obj.label159:setName("label159");
    obj.label159:setFontColor("white");
    lfm_setPropAsString(obj.label159, "fontStyle",  "bold");
    obj.label159:setFontFamily("Cambria");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout58);
    obj.label160:setAlign("left");
    obj.label160:setWidth(25);
    obj.label160:setField("void");
    obj.label160:setName("label160");
    obj.label160:setFontColor("white");
    lfm_setPropAsString(obj.label160, "fontStyle",  "bold");
    obj.label160:setFontFamily("Cambria");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.rectangle26);
    obj.button22:setAlign("right");
    obj.button22:setText("🞦");
    obj.button22:setWidth(30);
    obj.button22:setName("button22");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.layMagias);
    obj.rclMagias:setAlign("client");
    obj.rclMagias:setLayout("horizontalTiles");
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("magias");
    obj.rclMagias:setTemplateForm("templateMagias");
    obj.rclMagias:setMargins({left = 15, right = 15, top = 5, bottom = 15});

    obj.layBG = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBG:setParent(obj.rectangle3);
    obj.layBG:setName("layBG");
    obj.layBG:setAlign("client");
    obj.layBG:setVisible(false);

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.layBG);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout6);
    obj.flowPart8:setMinWidth(300);
    obj.flowPart8:setMaxWidth(650);
    obj.flowPart8:setHeight(1600);
    obj.flowPart8:setName("flowPart8");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.flowPart8);
    obj.rectangle27:setMargins({left=20, right=10, top=20});
    obj.rectangle27:setAlign("top");
    obj.rectangle27:setHeight(30);
    obj.rectangle27:setXradius(5);
    obj.rectangle27:setYradius(5);
    obj.rectangle27:setCornerType("round");
    obj.rectangle27:setColor("#212121");
    obj.rectangle27:setName("rectangle27");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.rectangle27);
    obj.button23:setText("F R E N T E");
    obj.button23:setName("button23");
    obj.button23:setAlign("left");
    obj.button23:setMargins({right=2});
    obj.button23:setWidth(100);
    obj.button23:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button23, "fontStyle",  "bold");
    obj.button23:setFontSize(10);

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.rectangle27);
    obj.button24:setText("M E C Â N I C A S");
    obj.button24:setName("button24");
    obj.button24:setAlign("left");
    obj.button24:setMargins({right=2});
    obj.button24:setWidth(100);
    obj.button24:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button24, "fontStyle",  "bold");
    obj.button24:setFontSize(10);

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.rectangle27);
    obj.button25:setText("M A G I A S");
    obj.button25:setName("button25");
    obj.button25:setAlign("left");
    obj.button25:setMargins({right=2});
    obj.button25:setWidth(100);
    obj.button25:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button25, "fontStyle",  "bold");
    obj.button25:setFontSize(10);

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.rectangle27);
    obj.button26:setText("H I S T Ó R I A");
    obj.button26:setName("button26");
    obj.button26:setAlign("left");
    obj.button26:setMargins({right=2});
    obj.button26:setWidth(100);
    obj.button26:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button26, "fontStyle",  "bold");
    obj.button26:setFontSize(10);

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.rectangle27);
    obj.button27:setText("A N O T A Ç Õ E S");
    obj.button27:setName("button27");
    obj.button27:setAlign("left");
    obj.button27:setMargins({right=2});
    obj.button27:setWidth(100);
    obj.button27:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button27, "fontStyle",  "bold");
    obj.button27:setFontSize(10);

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.flowPart8);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(30);
    obj.layout59:setMargins({top=10, left=20, bottom=15});
    obj.layout59:setName("layout59");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout59);
    obj.label161:setAlign("left");
    obj.label161:setText("H I S T Ó R I A");
    obj.label161:setWidth(150);
    obj.label161:setFontSize(20);
    obj.label161:setFontFamily("Constantia");
    obj.label161:setName("label161");
    obj.label161:setFontColor("white");
    lfm_setPropAsString(obj.label161, "fontStyle",  "bold");

    obj.horzLine16 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine16:setParent(obj.layout59);
    obj.horzLine16:setAlign("client");
    obj.horzLine16:setMargins({right=20, top=14});
    obj.horzLine16:setStrokeColor("#424242");
    obj.horzLine16:setName("horzLine16");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.flowPart8);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#272727");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setMargins({left=20, right=10, bottom=100});
    obj.richEdit1:setName("richEdit1");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout6);
    obj.flowPart9:setMinWidth(100);
    obj.flowPart9:setMaxWidth(350);
    obj.flowPart9:setHeight(1600);
    obj.flowPart9:setName("flowPart9");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.flowPart9);
    obj.rectangle28:setWidth(300);
    obj.rectangle28:setHeight(1530);
    obj.rectangle28:setColor("#202020");
    obj.rectangle28:setName("rectangle28");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.flowPart9);
    obj.rectangle29:setWidth(320);
    obj.rectangle29:setHeight(1530);
    obj.rectangle29:setColor("#202020");
    obj.rectangle29:setXradius(20);
    obj.rectangle29:setYradius(20);
    obj.rectangle29:setCornerType("bevel");
    obj.rectangle29:setName("rectangle29");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.flowPart9);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(30);
    obj.layout60:setMargins({top=60, left=20, bottom=15});
    obj.layout60:setName("layout60");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout60);
    obj.label162:setAlign("left");
    obj.label162:setText("A P A R Ê N C I A");
    obj.label162:setWidth(160);
    obj.label162:setFontSize(20);
    obj.label162:setFontFamily("Constantia");
    obj.label162:setName("label162");
    obj.label162:setFontColor("white");
    lfm_setPropAsString(obj.label162, "fontStyle",  "bold");

    obj.horzLine17 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine17:setParent(obj.layout60);
    obj.horzLine17:setAlign("client");
    obj.horzLine17:setMargins({right=20, top=14});
    obj.horzLine17:setStrokeColor("#424242");
    obj.horzLine17:setName("horzLine17");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.flowPart9);
    obj.image10:setURL("/Frames/avatar.jpg");
    obj.image10:setStyle("autoFit");
    obj.image10:setEditable(true);
    obj.image10:setWidth(289);
    obj.image10:setHeight(500);
    obj.image10:setTop(105);
    obj.image10:setLeft(10.5);
    obj.image10:setName("image10");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.flowPart9);
    obj.layout61:setAlign("top");
    obj.layout61:setFrameStyle("/Frames/frameFundo.xml");
    obj.layout61:setMargins({left=10, right=20});
    obj.layout61:setHeight(500);
    obj.layout61:setName("layout61");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.flowPart9);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(30);
    obj.layout62:setMargins({top=40, left=20, bottom=15});
    obj.layout62:setName("layout62");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout62);
    obj.label163:setAlign("left");
    obj.label163:setText("2 0   P E R G U N T A S");
    obj.label163:setWidth(205);
    obj.label163:setFontSize(20);
    obj.label163:setFontFamily("Constantia");
    obj.label163:setName("label163");
    obj.label163:setFontColor("white");
    lfm_setPropAsString(obj.label163, "fontStyle",  "bold");

    obj.horzLine18 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine18:setParent(obj.layout62);
    obj.horzLine18:setAlign("client");
    obj.horzLine18:setMargins({right=20, top=14});
    obj.horzLine18:setStrokeColor("#424242");
    obj.horzLine18:setName("horzLine18");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.flowPart9);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setMargins({left=10, top=10, right=20, bottom=50});
    obj.rectangle30:setColor("#272727");
    obj.rectangle30:setXradius(5);
    obj.rectangle30:setYradius(5);
    obj.rectangle30:setCornerType("round");
    obj.rectangle30:setName("rectangle30");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle30);
    obj.textEditor2:setField("20questoes");
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setMargins({left=5, top=5, right=5, bottom=5});
    obj.textEditor2:setFontColor("#cdcdcd");
    obj.textEditor2:setFontFamily("Cambria");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.flowPart9);
    obj.image11:setURL("/Frames/logo.png");
    obj.image11:setHeight(135);
    obj.image11:setStyle("proportional");
    obj.image11:setAlign("bottom");
    obj.image11:setMargins({bottom=80});
    obj.image11:setName("image11");

    obj.layNote = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNote:setParent(obj.rectangle3);
    obj.layNote:setName("layNote");
    obj.layNote:setAlign("client");
    obj.layNote:setVisible(false);

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layNote);
    obj.rectangle31:setMargins({left=20, right=10, top=20});
    obj.rectangle31:setAlign("top");
    obj.rectangle31:setHeight(30);
    obj.rectangle31:setXradius(5);
    obj.rectangle31:setYradius(5);
    obj.rectangle31:setCornerType("round");
    obj.rectangle31:setColor("#212121");
    obj.rectangle31:setName("rectangle31");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.rectangle31);
    obj.button28:setText("F R E N T E");
    obj.button28:setName("button28");
    obj.button28:setAlign("left");
    obj.button28:setMargins({right=2});
    obj.button28:setWidth(100);
    obj.button28:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button28, "fontStyle",  "bold");
    obj.button28:setFontSize(10);

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.rectangle31);
    obj.button29:setText("M E C Â N I C A S");
    obj.button29:setName("button29");
    obj.button29:setAlign("left");
    obj.button29:setMargins({right=2});
    obj.button29:setWidth(100);
    obj.button29:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button29, "fontStyle",  "bold");
    obj.button29:setFontSize(10);

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.rectangle31);
    obj.button30:setText("M A G I A S");
    obj.button30:setName("button30");
    obj.button30:setAlign("left");
    obj.button30:setMargins({right=2});
    obj.button30:setWidth(100);
    obj.button30:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button30, "fontStyle",  "bold");
    obj.button30:setFontSize(10);

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.rectangle31);
    obj.button31:setText("H I S T Ó R I A");
    obj.button31:setName("button31");
    obj.button31:setAlign("left");
    obj.button31:setMargins({right=2});
    obj.button31:setWidth(100);
    obj.button31:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button31, "fontStyle",  "bold");
    obj.button31:setFontSize(10);

    obj.button32 = GUI.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.rectangle31);
    obj.button32:setText("A N O T A Ç Õ E S");
    obj.button32:setName("button32");
    obj.button32:setAlign("left");
    obj.button32:setMargins({right=2});
    obj.button32:setWidth(100);
    obj.button32:setFontFamily("Constantia");
    lfm_setPropAsString(obj.button32, "fontStyle",  "bold");
    obj.button32:setFontSize(10);

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layNote);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(30);
    obj.layout63:setMargins({top=10, left=20, bottom=15});
    obj.layout63:setName("layout63");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout63);
    obj.label164:setAlign("left");
    obj.label164:setText("A N O T A Ç Õ E S");
    obj.label164:setWidth(190);
    obj.label164:setFontSize(20);
    obj.label164:setFontFamily("Constantia");
    obj.label164:setName("label164");
    obj.label164:setFontColor("white");
    lfm_setPropAsString(obj.label164, "fontStyle",  "bold");

    obj.horzLine19 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine19:setParent(obj.layout63);
    obj.horzLine19:setAlign("client");
    obj.horzLine19:setMargins({right=20, top=14});
    obj.horzLine19:setStrokeColor("#424242");
    obj.horzLine19:setName("horzLine19");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layNote);
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setField("anotacao");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#272727");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setMargins({left=20, right=20, bottom=40});
    obj.richEdit2:setName("richEdit2");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj);
    obj.layout64:setAlign("client");
    obj.layout64:setFrameStyle("/Frames/frameFundo.xml");
    obj.layout64:setName("layout64");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.earth ~= nil) then
            					local terr = sheet.earth;
            					local lastro = sheet.lastroTerra;
            					local extra = sheet.extraFerimentos;
            
            					if (sheet.BHealth == true) then
            							terr = terr - 1;
            					end;
            
            					local terra = (terr) * (lastro) + extra;
            
            					sheet.Saud = terr*5;
            					sheet.Esco = terra;
            					sheet.Mach = terra;
            					sheet.Feri = terra;
            					sheet.Seri = terra;
            					sheet.Inca = terra;
            					sheet.Abat = terra;
            					sheet.Inco = terra;
            
            					sheet.LSaud = terr*5;
            
            					if (sheet.PWound == true) then
            							sheet.LSaud = 0;
            					end;
            
            					sheet.LEsco = sheet.LSaud+terra;
            					sheet.LMach = sheet.LEsco+terra;
            					sheet.LFeri = sheet.LMach+terra;
            					sheet.LSeri = sheet.LFeri+terra;
            					sheet.LInca = sheet.LSeri+terra;
            					sheet.LAbat = sheet.LInca+terra;
            					sheet.LInco = sheet.LAbat+terra;
            					
            			end
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.stamina ~= nil) and (sheet.nivelSb ~= nil) then
            
            			local RecuFerimento = sheet.stamina * 2 + sheet.nivelSb;
            					if (sheet.QHealer == true) then
            					RecuFerimento = (sheet.stamina + 2) * 2 + sheet.nivelSb;
            					end;
            
            			sheet.RecuFerimento = RecuFerimento;
            			end
        end, obj);

    obj._e_event2 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.earth ~= nil) then
            					local ferimentos = (tonumber(sheet.ferimentos) or 0);
            					local lastro = sheet.lastroTerra;
            					local extra = sheet.extraFerimentos;
            
            					if sheet.PWound == true then
            							ferimentos = ferimentos + sheet.Saud;
            					end;
            
            					local terr = sheet.earth;
            
            					if (sheet.BHealth == true) then
            							terr = terr - 1;
            					end;
            
            					local terra = (terr) * (lastro) + extra;
            
            					local FSaud = ferimentos;
            
            					if FSaud >= sheet.Saud then
            							sheet.FSaud = sheet.Saud;
            					else
            							sheet.FSaud = FSaud;
            					end;
            
            					local FEsco = FSaud - terr*5;
            
            					if FEsco >= sheet.Esco then
            							sheet.FEsco = sheet.Esco;
            					else
            							sheet.FEsco = FEsco;
            					end;
            
            					local FMach = FEsco - terra;
            
            					if FMach >= sheet.Mach then
            							sheet.FMach = sheet.Mach;
            					else
            							sheet.FMach = FMach;
            					end;
            
            					local FFeri = FMach - terra;
            
            					if FFeri >= sheet.Feri then
            							sheet.FFeri = sheet.Feri;
            					else
            							sheet.FFeri = FFeri;
            					end;
            
            					local FSeri = FFeri - terra;
            
            					if FSeri >= sheet.Seri then
            							sheet.FSeri = sheet.Seri;
            					else
            							sheet.FSeri = FSeri;
            					end;
            
            					local FInca = FSeri - terra;
            
            					if FInca >= sheet.Inca then
            							sheet.FInca = sheet.Inca;
            					else
            							sheet.FInca = FInca;
            					end;
            
            					local FAbat = FInca - terra;
            
            					if FAbat >= sheet.Abat then
            							sheet.FAbat = sheet.Abat;
            					else
            							sheet.FAbat = FAbat;
            					end;
            
            					local FInco = FAbat - terra;
            							sheet.FInco = FInco;
            
            					if FSaud < 0 then
            							sheet.FSaud = 0;
            					end;
            
            					if (FEsco < 0) then
            							sheet.FEsco = 0;
            					end;
            
            					if (ferimentos < sheet.Saud) then
            							sheet.FEsco = 0;
            					end;
            
            					if (FMach < 0) or (ferimentos < sheet.Esco) then
            							sheet.FMach = 0;
            					end;
            
            					if (FFeri < 0) or (ferimentos < sheet.Mach) then
            							sheet.FFeri = 0;
            					end;
            
            					if (FSeri < 0) or (ferimentos < sheet.Feri) then
            							sheet.FSeri = 0;
            					end;
            
            					if (FInca < 0) or (ferimentos < sheet.Seri) then
            							sheet.FInca = 0;
            					end;
            
            					if (FAbat < 0) or (ferimentos < sheet.Inca) then
            							sheet.FAbat = 0;
            					end;
            
            					if (FInco < 0) or (ferimentos < sheet.Abat) then
            							sheet.FInco = 0;
            					end
            
            			end
        end, obj);

    obj._e_event3 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.earth ~= nil and sheet.air ~= nil and sheet.water ~= nil and sheet.fire ~= nil and sheet.void ~= nil and sheet.maisSab ~= nil) then
            			local countSum = (tonumber(sheet.countSum) or 0);
            
            
            					sheet.sabedoria = math.floor(sheet.earth + sheet.air + sheet.water + sheet.fire + sheet.void)*10 + sheet.maisSab + countSum;
            			end
        end, obj);

    obj._e_event4 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.sabedoria ~= nil) then
            					local sabedoria = tonumber(sheet.sabedoria);                      
            					local uwu;          
            
            					uwu = math.floor((sabedoria - 150) / 25);
            					
            							if 0 > uwu then
            									uwu = -1;
            							end;
            
            					sheet.nivelSb = uwu + 2;
            			end
        end, obj);

    obj._e_event5 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local Escoriado = 3;
            			local Machucado = 5;
            			local Ferido = 10;
            			local SerFerido = 15;
            			local Incapacitado = 20;
            			local Abatido = 40;
            			
            			if (sheet.LPThold == true) then    
            					Escoriado = Escoriado + 5;
            					Machucado = Machucado + 5;
            					Ferido = Ferido + 5;
            					SerFerido = SerFerido + 5;
            					Incapacitado = Incapacitado + 5;
            					Abatido = Abatido + 5;
            			end
            
            			if (sheet.SotEarth == true) then    
            					Escoriado = Escoriado - 3;
            					Machucado = Machucado - 3;
            					Ferido = Ferido - 3;
            					SerFerido = SerFerido - 3;
            					Incapacitado = Incapacitado - 3;
            					Abatido = Abatido - 3;
            			end
            
            			sheet.Escoriado = "+" .. tostring(Escoriado);
            			sheet.Machucado = "+" .. tostring(Machucado);
            			sheet.Ferido = "+" .. tostring(Ferido);
            			sheet.SerFerido = "+" .. tostring(SerFerido);
            			sheet.Incapacitado = "+" .. tostring(Incapacitado);
            			sheet.Abatido = "+" .. tostring(Abatido);
        end, obj);

    obj._e_event6 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.willpower and sheet.stamina ~= nil) then
            					local willpower = tonumber(sheet.willpower);                      
            					local stamina = tonumber(sheet.stamina);    
            
            					if willpower < stamina then
            							sheet.earth = willpower;
            					else
            							sheet.earth = stamina;
            					end;
            
            			end
        end, obj);

    obj._e_event7 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.strength and sheet.perception ~= nil) then
            					local strength = tonumber(sheet.strength);                      
            					local perception = tonumber(sheet.perception);    
            
            					if strength < perception then
            							sheet.water = strength;
            					else
            							sheet.water = perception;
            					end;
            
            			end
        end, obj);

    obj._e_event8 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.agility and sheet.intelligence ~= nil) then
            					local agility = tonumber(sheet.agility);                      
            					local intelligence = tonumber(sheet.intelligence);    
            
            					if agility < intelligence then
            							sheet.fire = agility;
            					else
            							sheet.fire = intelligence;
            					end;
            
            			end
        end, obj);

    obj._e_event9 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.reflexes and sheet.awareness ~= nil) then
            					local reflexes = tonumber(sheet.reflexes);                      
            					local awareness = tonumber(sheet.awareness);    
            
            					if reflexes < awareness then
            							sheet.air = reflexes;
            					else
            							sheet.air = awareness;
            					end;
            
            			end
        end, obj);

    obj._e_event10 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.nivelSb and sheet.addRolaIni ~= nil and sheet.addMantemIni ~= nil) then
            					local reflexes = tonumber(sheet.reflexes);                      
            					local nivelSb = tonumber(sheet.nivelSb);  
            					local addMantemIni = tonumber(sheet.addMantemIni);
            					local addRolaIni = tonumber(sheet.addRolaIni);
            
            					sheet.RolaIni = math.floor(reflexes+nivelSb+addRolaIni);
            					sheet.MantemIni = math.floor(reflexes+addMantemIni);
            
            			end
        end, obj);

    obj._e_event11 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.bonusNA and sheet.reflexes ~= nil) then
            					sheet.NA = math.floor(5*sheet.reflexes)+5+sheet.bonusNA;
            			end
        end, obj);

    obj._e_event12 = obj.button1:addEventListener("onClick",
        function (_)
            TrocarAba('F');
        end, obj);

    obj._e_event13 = obj.button2:addEventListener("onClick",
        function (_)
            TrocarAba('M');
        end, obj);

    obj._e_event14 = obj.button3:addEventListener("onClick",
        function (_)
            TrocarAba('S');
        end, obj);

    obj._e_event15 = obj.button4:addEventListener("onClick",
        function (_)
            TrocarAba('H');
        end, obj);

    obj._e_event16 = obj.button5:addEventListener("onClick",
        function (_)
            TrocarAba('A');
        end, obj);

    obj._e_event17 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclSkills:append();
        end, obj);

    obj._e_event18 = obj.rclSkills:addEventListener("onSelect",
        function (_)
            self.rclSkills:sort();
        end, obj);

    obj._e_event19 = obj.rclSkills:addEventListener("onItemAdded",
        function (_, node, form)
            self.rclSkills:sort();
        end, obj);

    obj._e_event20 = obj.rclSkills:addEventListener("onItemRemoved",
        function (_, node, form)
            self.rclSkills:sort();
        end, obj);

    obj._e_event21 = obj.rclSkills:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if((nodeA.MarcadorSkillEscola or false) == false and (nodeB.MarcadorSkillEscola or false) == true) then
            														return 1;
            													elseif((nodeA.MarcadorSkillEscola or false) == true and (nodeB.MarcadorSkillEscola or false) == false) then
            														return -1;
            													else
            														return Utils.compareStringPtBr(nodeA.nomeSkill, nodeB.nomeSkill);
            													end;
        end, obj);

    obj._e_event22 = obj.btnImagemFundo:addEventListener("onClick",
        function (_)
            self.popImagemFundo:show('left', self.btnImagemFundo);
        end, obj);

    obj._e_event23 = obj.btnFeri:addEventListener("onClick",
        function (_)
            self.popFerimentos:show('left', self.btnFeri);
        end, obj);

    obj._e_event24 = obj.button7:addEventListener("onClick",
        function (_)
            TrocarAba('F');
        end, obj);

    obj._e_event25 = obj.button8:addEventListener("onClick",
        function (_)
            TrocarAba('M');
        end, obj);

    obj._e_event26 = obj.button9:addEventListener("onClick",
        function (_)
            TrocarAba('S');
        end, obj);

    obj._e_event27 = obj.button10:addEventListener("onClick",
        function (_)
            TrocarAba('H');
        end, obj);

    obj._e_event28 = obj.button11:addEventListener("onClick",
        function (_)
            TrocarAba('A');
        end, obj);

    obj._e_event29 = obj.button12:addEventListener("onClick",
        function (_)
            self.rclVantagens:append(); self.fpEsquerdaMec:needRepaint();
        end, obj);

    obj._e_event30 = obj.rclVantagens:addEventListener("onSelect",
        function (_)
            self.rclVantagens:sort();
        end, obj);

    obj._e_event31 = obj.rclVantagens:addEventListener("onItemRemoved",
        function (_, node, form)
            self.fpEsquerdaMec:needRepaint();
        end, obj);

    obj._e_event32 = obj.rclVantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.aqq, nodeB.aqq);
        end, obj);

    obj._e_event33 = obj.button13:addEventListener("onClick",
        function (_)
            self.rclDesVantagens:append(); self.fpEsquerdaMec:needRepaint();
        end, obj);

    obj._e_event34 = obj.rclDesVantagens:addEventListener("onSelect",
        function (_)
            self.rclDesVantagens:sort();
        end, obj);

    obj._e_event35 = obj.rclDesVantagens:addEventListener("onItemRemoved",
        function (_, node, form)
            self.fpEsquerdaMec:needRepaint();
        end, obj);

    obj._e_event36 = obj.rclDesVantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.aqq, nodeB.aqq);
        end, obj);

    obj._e_event37 = obj.button14:addEventListener("onClick",
        function (_)
            self.rclTecnicas:append(); self.fpEsquerdaMec:needRepaint();
        end, obj);

    obj._e_event38 = obj.rclTecnicas:addEventListener("onItemRemoved",
        function (_, node, form)
            self.fpEsquerdaMec:needRepaint();
        end, obj);

    obj._e_event39 = obj.button15:addEventListener("onClick",
        function (_)
            self.rclKata:append(); self.fpDireitaMec:needRepaint();
        end, obj);

    obj._e_event40 = obj.rclKata:addEventListener("onItemRemoved",
        function (_, node, form)
            self.fpDireitaMec:needRepaint();
        end, obj);

    obj._e_event41 = obj.button16:addEventListener("onClick",
        function (_)
            self.rclArmas:append(); self.fpDireitaMec:needRepaint();
        end, obj);

    obj._e_event42 = obj.rclArmas:addEventListener("onItemRemoved",
        function (_, node, form)
            self.fpDireitaMec:needRepaint();
        end, obj);

    obj._e_event43 = obj.button17:addEventListener("onClick",
        function (_)
            TrocarAba('F');
        end, obj);

    obj._e_event44 = obj.button18:addEventListener("onClick",
        function (_)
            TrocarAba('M');
        end, obj);

    obj._e_event45 = obj.button19:addEventListener("onClick",
        function (_)
            TrocarAba('S');
        end, obj);

    obj._e_event46 = obj.button20:addEventListener("onClick",
        function (_)
            TrocarAba('H');
        end, obj);

    obj._e_event47 = obj.button21:addEventListener("onClick",
        function (_)
            TrocarAba('A');
        end, obj);

    obj._e_event48 = obj.button22:addEventListener("onClick",
        function (_)
            self.rclMagias:append();
        end, obj);

    obj._e_event49 = obj.rclMagias:addEventListener("onSelect",
        function (_)
            self.rclMagias:sort();
        end, obj);

    obj._e_event50 = obj.rclMagias:addEventListener("onItemAdded",
        function (_, node, form)
            self.rclMagias:sort();
        end, obj);

    obj._e_event51 = obj.rclMagias:addEventListener("onItemRemoved",
        function (_, node, form)
            self.rclMagias:sort();
        end, obj);

    obj._e_event52 = obj.rclMagias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if(nodeA.elemMagia == nodeB.elemMagia) then
            										
            											if (nodeA.lvlMagia or 0) > (nodeB.lvlMagia or 0) then
            													return 1;
            											elseif (nodeA.lvlMagia or 0) < (nodeB.lvlMagia or 0) then
            													return -1;
            											else   
            													return Utils.compareStringPtBr(nodeA.nomeMagia, nodeB.nomeMagia);
            											end;
            										
            										elseif(nodeA.elemMagia == "Water" and 
            										(nodeB.elemMagia == "Air" or nodeB.elemMagia == "Fire" or nodeB.elemMagia == "Earth" or nodeB.elemMagia == "Void" or nodeB.elemMagia == "Universal")) then
            											return -1;
            										elseif(nodeA.elemMagia == "Air" and 
            										(nodeB.elemMagia == "Fire" or nodeB.elemMagia == "Earth" or nodeB.elemMagia == "Void" or nodeB.elemMagia == "Universal")) then
            											return -1;
            										elseif(nodeA.elemMagia == "Fire" and 
            										(nodeB.elemMagia == "Earth" or nodeB.elemMagia == "Void" or nodeB.elemMagia == "Universal")) then
            											return -1;
            										elseif(nodeA.elemMagia == "Earth" and 
            										(nodeB.elemMagia == "Void" or nodeB.elemMagia == "Universal")) then
            											return -1;
            										elseif(nodeA.elemMagia == "Void" and 
            										(nodeB.elemMagia == "Universal")) then
            											return -1;
            										elseif(nodeA.elemMagia == "Universal" and 
            										(nodeB.elemMagia == "Water" or nodeB.elemMagia == "Air" or nodeB.elemMagia == "Fire" or nodeB.elemMagia == "Earth" or nodeB.elemMagia == "Void")) then
            											return 1;
            										elseif(nodeA.elemMagia == "Void" and 
            										(nodeB.elemMagia == "Water" or nodeB.elemMagia == "Air" or nodeB.elemMagia == "Fire" or nodeB.elemMagia == "Earth")) then
            											return 1;
            										elseif(nodeA.elemMagia == "Earth" and 
            										(nodeB.elemMagia == "Water" or nodeB.elemMagia == "Air" or nodeB.elemMagia == "Fire")) then
            											return 1;
            										elseif(nodeA.elemMagia == "Fire" and 
            										(nodeB.elemMagia == "Water" or nodeB.elemMagia == "Air")) then
            											return 1;
            										elseif(nodeA.elemMagia == "Air" and 
            										(nodeB.elemMagia == "Water")) then
            											return 1;
            										end;
        end, obj);

    obj._e_event53 = obj.button23:addEventListener("onClick",
        function (_)
            TrocarAba('F');
        end, obj);

    obj._e_event54 = obj.button24:addEventListener("onClick",
        function (_)
            TrocarAba('M');
        end, obj);

    obj._e_event55 = obj.button25:addEventListener("onClick",
        function (_)
            TrocarAba('S');
        end, obj);

    obj._e_event56 = obj.button26:addEventListener("onClick",
        function (_)
            TrocarAba('H');
        end, obj);

    obj._e_event57 = obj.button27:addEventListener("onClick",
        function (_)
            TrocarAba('A');
        end, obj);

    obj._e_event58 = obj.button28:addEventListener("onClick",
        function (_)
            TrocarAba('F');
        end, obj);

    obj._e_event59 = obj.button29:addEventListener("onClick",
        function (_)
            TrocarAba('M');
        end, obj);

    obj._e_event60 = obj.button30:addEventListener("onClick",
        function (_)
            TrocarAba('S');
        end, obj);

    obj._e_event61 = obj.button31:addEventListener("onClick",
        function (_)
            TrocarAba('H');
        end, obj);

    obj._e_event62 = obj.button32:addEventListener("onClick",
        function (_)
            TrocarAba('A');
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.horzLine14 ~= nil then self.horzLine14:destroy(); self.horzLine14 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.btnFeri ~= nil then self.btnFeri:destroy(); self.btnFeri = nil; end;
        if self.layMecanicas ~= nil then self.layMecanicas:destroy(); self.layMecanicas = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.horzLine19 ~= nil then self.horzLine19:destroy(); self.horzLine19 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.rclTecnicas ~= nil then self.rclTecnicas:destroy(); self.rclTecnicas = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.btnImagemFundo ~= nil then self.btnImagemFundo:destroy(); self.btnImagemFundo = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.popImagemFundo ~= nil then self.popImagemFundo:destroy(); self.popImagemFundo = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.fpDireitaMec ~= nil then self.fpDireitaMec:destroy(); self.fpDireitaMec = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.popFerimentos ~= nil then self.popFerimentos:destroy(); self.popFerimentos = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.layMagias ~= nil then self.layMagias:destroy(); self.layMagias = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.rclDesVantagens ~= nil then self.rclDesVantagens:destroy(); self.rclDesVantagens = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.layBG ~= nil then self.layBG:destroy(); self.layBG = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.rclKata ~= nil then self.rclKata:destroy(); self.rclKata = nil; end;
        if self.rclSkills ~= nil then self.rclSkills:destroy(); self.rclSkills = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.horzLine16 ~= nil then self.horzLine16:destroy(); self.horzLine16 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.layNote ~= nil then self.layNote:destroy(); self.layNote = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine17 ~= nil then self.horzLine17:destroy(); self.horzLine17 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.rclVantagens ~= nil then self.rclVantagens:destroy(); self.rclVantagens = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.fpEsquerdaMec ~= nil then self.fpEsquerdaMec:destroy(); self.fpEsquerdaMec = nil; end;
        if self.horzLine18 ~= nil then self.horzLine18:destroy(); self.horzLine18 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.horzLine15 ~= nil then self.horzLine15:destroy(); self.horzLine15 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layFrente ~= nil then self.layFrente:destroy(); self.layFrente = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.horzLine13 ~= nil then self.horzLine13:destroy(); self.horzLine13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmOurFichaL5R4e()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmOurFichaL5R4e();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmOurFichaL5R4e = {
    newEditor = newfrmOurFichaL5R4e, 
    new = newfrmOurFichaL5R4e, 
    name = "frmOurFichaL5R4e", 
    dataType = "L5R_4e_Otimizado", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "L5R 4e (Otimizado)", 
    description=""};

frmOurFichaL5R4e = _frmOurFichaL5R4e;
Firecast.registrarForm(_frmOurFichaL5R4e);
Firecast.registrarDataType(_frmOurFichaL5R4e);

return _frmOurFichaL5R4e;
