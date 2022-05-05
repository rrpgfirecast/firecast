require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGoT()
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
    obj:setDataType("thirteen.GoT");
    obj:setTitle("Game of Thrones");
    obj:setName("frmGoT");
    obj:setTheme("dark");


	local function calcExp()
		local SomaXP = 0;
		tbGrad = {(sheet.grad01 or 2), (sheet.grad02 or 2), (sheet.grad03 or 2), (sheet.grad04 or 2), (sheet.grad05 or 2), (sheet.grad06 or 2), (sheet.grad07 or 2), (sheet.grad08 or 2), (sheet.grad09 or 2), (sheet.grad10 or 2), 
		(sheet.grad11 or 2), (sheet.grad12 or 2), (sheet.grad13 or 2), (sheet.grad14 or 2), (sheet.grad15 or 2), (sheet.grad16 or 2), (sheet.grad17 or 2), (sheet.grad18 or 2), (sheet.grad19 or 2)};
		
		for i = 1, #tbGrad do
			if(tbGrad[i] == 1) then SomaXP = SomaXP - 50;
			elseif(tbGrad[i] == 2) then SomaXP = SomaXP + 0;
			elseif(tbGrad[i] == 3) then SomaXP = SomaXP + 10;
			elseif(tbGrad[i] > 3) then SomaXP = SomaXP + ((30 * (tbGrad[i] - 3)) +10); end;
		end;
		
		local Corrida = string.match((sheet.spec03 or ""), "Corrida%s(%d+)B");
		if(Corrida == nil) then Corrida = string.match((sheet.spec03 or ""), "(%d+)B%sCorrida"); end;
		if(Corrida == nil) then Corrida = string.match((sheet.spec03 or ""), "(%d+)B%scorrida"); end;
		if(Corrida == nil) then Corrida = string.match((sheet.spec03 or ""), "corrida%s(%d+)B"); end;
		if (Corrida == nil) then Corrida = 0; 
		else Corrida = string.match(Corrida, "(%d+)"); end;
		
		sheet.dado13 = string.format("%02d", tbGrad[2] + tbGrad[13] + tbGrad[17]);
		sheet.dado14 = string.format("%02d", tbGrad[1] + tbGrad[3] + tbGrad[13]);
		sheet.dado15 = string.format("%02d", tbGrad[19] * 3);
		sheet.dado16 = string.format("%02d", tbGrad[18] * 3);
		sheet.dado17 = string.format("%02d",4 + math.floor(tonumber(Corrida) / 2)) .. "m";
		sheet.dado18 = string.format("%02d", tonumber(string.match((sheet.dado17 or ""), "%d%d")) * 4) .. "m";
		
		sheet.somaExp = "EXP: " .. string.format("%03d", SomaXP) .. " pts.";
	end;
	
		local function TrocarAba(a)
			if(a == 'D') then
				if(self.layFrente:isVisible()) then
					self.layFrente.visible = false;
					self.layBG.visible = true;
					self.layFrente:needRepaint();
					self.layBG:needRepaint();
					
				elseif(self.layBG:isVisible()) then
					self.layBG.visible = false;
					self.layNote.visible = true;
					self.layBG:needRepaint();
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
					
				elseif(self.layBG:isVisible()) then
					self.layBG.visible = false;
					self.layFrente.visible = true;
					self.layBG:needRepaint();
					self.layFrente:needRepaint();
					
				elseif(self.layNote:isVisible()) then
					self.layNote.visible = false;
					self.layBG.visible = true;
					self.layNote:needRepaint();
					self.layBG:needRepaint();
				end;		
			end;
		end;
	



    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setName("image1");
    obj.image1:setAlign("client");
    obj.image1:setStyle("autoFit");
    obj.image1:setURL("/images/fundo.png");

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
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setOrientation("horizontal");
    obj.flowLayout1:setMargins({top=20, right=20, bottom=20, left=20});
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(110);
    obj.flowPart1:setHeight(1900);
    obj.flowPart1:setName("flowPart1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.flowPart1);
    obj.image2:setMargins({right=10});
    obj.image2:setURL("/images/arrow-l.png");
    obj.image2:setStyle("proportional");
    obj.image2:setAlign("client");
    obj.image2:setCursor("handPoint");
    obj.image2:setHitTest(true);
    obj.image2:setName("image2");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(400);
    obj.flowPart2:setMaxWidth(1000);
    obj.flowPart2:setHeight(1900);
    obj.flowPart2:setMargins({bottom=20});
    obj.flowPart2:setName("flowPart2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart2);
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("#a7754d");
    obj.rectangle1:setStrokeSize(3);
    obj.rectangle1:setAlign("client");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("#a7754d");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setMargins({top=5, right=5, bottom=5, left=5});
    obj.rectangle2:setPadding({top=10, right=10, bottom=10, left=10});

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#e2bc8f");
    obj.rectangle3:setName("rectangle3");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle2);
    obj.layout2:setAlign("client");
    obj.layout2:setFrameStyle("/frames/framePapiro.xml");
    obj.layout2:setName("layout2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout2);
    obj.image3:setURL("/images/corner-top-left.png");
    obj.image3:setStyle("proportional");
    obj.image3:setHeight(200);
    obj.image3:setWidth(200);
    lfm_setPropAsString(obj.image3, "anchors",  "top left");
    obj.image3:setTop(10);
    obj.image3:setLeft(10);
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout2);
    obj.image4:setURL("/images/corner-top-right.png");
    obj.image4:setStyle("proportional");
    obj.image4:setHeight(200);
    obj.image4:setWidth(200);
    lfm_setPropAsString(obj.image4, "anchors",  "top right");
    obj.image4:setTop(10);
    obj.image4:setRight(10);
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout2);
    obj.image5:setURL("/images/corner-bot-left.png");
    obj.image5:setStyle("proportional");
    obj.image5:setHeight(200);
    obj.image5:setWidth(200);
    lfm_setPropAsString(obj.image5, "anchors",  "bottom left");
    obj.image5:setBottom(10);
    obj.image5:setLeft(10);
    obj.image5:setName("image5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout2);
    obj.image6:setURL("/images/corner-bot-right.png");
    obj.image6:setStyle("proportional");
    obj.image6:setHeight(200);
    obj.image6:setWidth(200);
    lfm_setPropAsString(obj.image6, "anchors",  "bottom right");
    obj.image6:setBottom(10);
    obj.image6:setRight(10);
    obj.image6:setName("image6");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.layout2);
    obj.image7:setURL("/images/shields.png");
    obj.image7:setStyle("proportional");
    obj.image7:setHeight(40);
    obj.image7:setWidth(200);
    obj.image7:setAlign("bottom");
    obj.image7:setMargins({bottom=30});
    obj.image7:setName("image7");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(300);
    obj.layout3:setName("layout3");

    obj.layFrente = GUI.fromHandle(_obj_newObject("layout"));
    obj.layFrente:setParent(obj.layout2);
    obj.layFrente:setAlign("client");
    obj.layFrente:setName("layFrente");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.layFrente);
    obj.flowLayout2:setHeight(300);
    obj.flowLayout2:setMaxControlsPerLine(3);
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setOrientation("horizontal");
    obj.flowLayout2:setMargins({top=30, bottom=20});

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setMinWidth(720);
    obj.flowPart3:setAlign("top");
    obj.flowPart3:setHeight(45);
    obj.flowPart3:setName("flowPart3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart3);
    obj.label1:setText("DADOS PESSOAIS");
    obj.label1:setMargins({left=20});
    obj.label1:setFontSize(30);
    obj.label1:setHeight(45);
    obj.label1:setAlign("top");
    obj.label1:setVertTextAlign("leading");
    obj.label1:setName("label1");
    obj.label1:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("black");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout2);
    obj.flowPart4:setMinWidth(220);
    obj.flowPart4:setHeight(25);
    obj.flowPart4:setMargins({right=10, left=10});
    obj.flowPart4:setName("flowPart4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart4);
    obj.label2:setAlign("left");
    obj.label2:setText("Nome:");
    obj.label2:setWidth(48);
    obj.label2:setName("label2");
    obj.label2:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("black");
    obj.label2:setHeight(25);
    obj.label2:setFontSize(15);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart4);
    obj.edit1:setAlign("client");
    obj.edit1:setField("dado01");
    obj.edit1:setHint("Nome");
    obj.edit1:setName("edit1");
    obj.edit1:setFontFamily("Palatino Linotype");
    obj.edit1:setFontColor("#573c27");
    obj.edit1:setHeight(25);
    obj.edit1:setFontSize(15);
    obj.edit1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.flowPart4);
    obj.dataLink1:setField("dado01");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout2);
    obj.flowPart5:setMinWidth(220);
    obj.flowPart5:setHeight(25);
    obj.flowPart5:setMargins({right=10, left=10});
    obj.flowPart5:setName("flowPart5");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart5);
    obj.label3:setAlign("left");
    obj.label3:setText("Casa:");
    obj.label3:setWidth(38);
    obj.label3:setName("label3");
    obj.label3:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("black");
    obj.label3:setHeight(25);
    obj.label3:setFontSize(15);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart5);
    obj.edit2:setAlign("client");
    obj.edit2:setField("dado02");
    obj.edit2:setHint("Casa");
    obj.edit2:setName("edit2");
    obj.edit2:setFontFamily("Palatino Linotype");
    obj.edit2:setFontColor("#573c27");
    obj.edit2:setHeight(25);
    obj.edit2:setFontSize(15);
    obj.edit2:setTransparent(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flowPart5);
    obj.dataLink2:setField("dado02");
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setName("dataLink2");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout2);
    obj.flowPart6:setMinWidth(220);
    obj.flowPart6:setHeight(25);
    obj.flowPart6:setMargins({right=10, left=10});
    obj.flowPart6:setName("flowPart6");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart6);
    obj.label4:setAlign("left");
    obj.label4:setText("Armadura:");
    obj.label4:setWidth(75);
    obj.label4:setName("label4");
    obj.label4:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("black");
    obj.label4:setHeight(25);
    obj.label4:setFontSize(15);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart6);
    obj.edit3:setAlign("client");
    obj.edit3:setField("dado03");
    obj.edit3:setHint("Armadura");
    obj.edit3:setName("edit3");
    obj.edit3:setFontFamily("Palatino Linotype");
    obj.edit3:setFontColor("#573c27");
    obj.edit3:setHeight(25);
    obj.edit3:setFontSize(15);
    obj.edit3:setTransparent(true);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.flowPart6);
    obj.dataLink3:setField("dado03");
    obj.dataLink3:setDefaultValue("—");
    obj.dataLink3:setName("dataLink3");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout2);
    obj.flowPart7:setMinWidth(220);
    obj.flowPart7:setHeight(25);
    obj.flowPart7:setMargins({right=10, left=10});
    obj.flowPart7:setName("flowPart7");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart7);
    obj.label5:setAlign("left");
    obj.label5:setText("Sexo:");
    obj.label5:setWidth(38);
    obj.label5:setName("label5");
    obj.label5:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontColor("black");
    obj.label5:setHeight(25);
    obj.label5:setFontSize(15);

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart7);
    obj.edit4:setAlign("client");
    obj.edit4:setField("dado04");
    obj.edit4:setHint("Sexo");
    obj.edit4:setName("edit4");
    obj.edit4:setFontFamily("Palatino Linotype");
    obj.edit4:setFontColor("#573c27");
    obj.edit4:setHeight(25);
    obj.edit4:setFontSize(15);
    obj.edit4:setTransparent(true);

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowPart7);
    obj.dataLink4:setField("dado04");
    obj.dataLink4:setDefaultValue("—");
    obj.dataLink4:setName("dataLink4");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout2);
    obj.flowPart8:setMinWidth(220);
    obj.flowPart8:setHeight(25);
    obj.flowPart8:setMargins({right=10, left=10});
    obj.flowPart8:setName("flowPart8");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart8);
    obj.label6:setAlign("left");
    obj.label6:setText("Idade:");
    obj.label6:setWidth(45);
    obj.label6:setName("label6");
    obj.label6:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontColor("black");
    obj.label6:setHeight(25);
    obj.label6:setFontSize(15);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart8);
    obj.edit5:setAlign("client");
    obj.edit5:setField("dado05");
    obj.edit5:setHint("Idade");
    obj.edit5:setName("edit5");
    obj.edit5:setFontFamily("Palatino Linotype");
    obj.edit5:setFontColor("#573c27");
    obj.edit5:setHeight(25);
    obj.edit5:setFontSize(15);
    obj.edit5:setTransparent(true);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flowPart8);
    obj.dataLink5:setField("dado05");
    obj.dataLink5:setDefaultValue("—");
    obj.dataLink5:setName("dataLink5");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setMinWidth(220);
    obj.flowPart9:setHeight(25);
    obj.flowPart9:setMargins({right=10, left=10});
    obj.flowPart9:setName("flowPart9");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowPart9);
    obj.label7:setAlign("left");
    obj.label7:setText("Valor de Armadura:");
    obj.label7:setWidth(135);
    obj.label7:setName("label7");
    obj.label7:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setFontColor("black");
    obj.label7:setHeight(25);
    obj.label7:setFontSize(15);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart9);
    obj.edit6:setAlign("client");
    obj.edit6:setField("dado06");
    obj.edit6:setHint("Valor de Armadura");
    obj.edit6:setName("edit6");
    obj.edit6:setFontFamily("Palatino Linotype");
    obj.edit6:setFontColor("#573c27");
    obj.edit6:setHeight(25);
    obj.edit6:setFontSize(15);
    obj.edit6:setTransparent(true);

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowPart9);
    obj.dataLink6:setField("dado06");
    obj.dataLink6:setDefaultValue("—");
    obj.dataLink6:setName("dataLink6");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout2);
    obj.flowPart10:setMinWidth(220);
    obj.flowPart10:setHeight(25);
    obj.flowPart10:setMargins({right=10, left=10});
    obj.flowPart10:setName("flowPart10");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowPart10);
    obj.label8:setAlign("left");
    obj.label8:setText("Virtude:");
    obj.label8:setWidth(58);
    obj.label8:setName("label8");
    obj.label8:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setFontColor("black");
    obj.label8:setHeight(25);
    obj.label8:setFontSize(15);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart10);
    obj.edit7:setAlign("client");
    obj.edit7:setField("dado07");
    obj.edit7:setHint("Virtude");
    obj.edit7:setName("edit7");
    obj.edit7:setFontFamily("Palatino Linotype");
    obj.edit7:setFontColor("#573c27");
    obj.edit7:setHeight(25);
    obj.edit7:setFontSize(15);
    obj.edit7:setTransparent(true);

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowPart10);
    obj.dataLink7:setField("dado07");
    obj.dataLink7:setDefaultValue("—");
    obj.dataLink7:setName("dataLink7");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout2);
    obj.flowPart11:setMinWidth(220);
    obj.flowPart11:setHeight(25);
    obj.flowPart11:setMargins({right=10, left=10});
    obj.flowPart11:setName("flowPart11");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowPart11);
    obj.label9:setAlign("left");
    obj.label9:setText("Vício:");
    obj.label9:setWidth(43);
    obj.label9:setName("label9");
    obj.label9:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setFontColor("black");
    obj.label9:setHeight(25);
    obj.label9:setFontSize(15);

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowPart11);
    obj.edit8:setAlign("client");
    obj.edit8:setField("dado08");
    obj.edit8:setHint("Vício");
    obj.edit8:setName("edit8");
    obj.edit8:setFontFamily("Palatino Linotype");
    obj.edit8:setFontColor("#573c27");
    obj.edit8:setHeight(25);
    obj.edit8:setFontSize(15);
    obj.edit8:setTransparent(true);

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowPart11);
    obj.dataLink8:setField("dado08");
    obj.dataLink8:setDefaultValue("—");
    obj.dataLink8:setName("dataLink8");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout2);
    obj.flowPart12:setMinWidth(220);
    obj.flowPart12:setHeight(25);
    obj.flowPart12:setMargins({right=10, left=10});
    obj.flowPart12:setName("flowPart12");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowPart12);
    obj.label10:setAlign("left");
    obj.label10:setText("Penalidade de Agilidade:");
    obj.label10:setWidth(172);
    obj.label10:setName("label10");
    obj.label10:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setFontColor("black");
    obj.label10:setHeight(25);
    obj.label10:setFontSize(15);

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowPart12);
    obj.edit9:setAlign("client");
    obj.edit9:setField("dado09");
    obj.edit9:setHint("Penalidade de Agilidade");
    obj.edit9:setName("edit9");
    obj.edit9:setFontFamily("Palatino Linotype");
    obj.edit9:setFontColor("#573c27");
    obj.edit9:setHeight(25);
    obj.edit9:setFontSize(15);
    obj.edit9:setTransparent(true);

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.flowPart12);
    obj.dataLink9:setField("dado09");
    obj.dataLink9:setDefaultValue("—");
    obj.dataLink9:setName("dataLink9");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout2);
    obj.flowPart13:setMinWidth(220);
    obj.flowPart13:setHeight(25);
    obj.flowPart13:setMargins({right=10, left=10});
    obj.flowPart13:setName("flowPart13");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart13);
    obj.label11:setAlign("left");
    obj.label11:setText("Objetivo:");
    obj.label11:setWidth(67);
    obj.label11:setName("label11");
    obj.label11:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setFontColor("black");
    obj.label11:setHeight(25);
    obj.label11:setFontSize(15);

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowPart13);
    obj.edit10:setAlign("client");
    obj.edit10:setField("dado10");
    obj.edit10:setHint("Objetivo");
    obj.edit10:setName("edit10");
    obj.edit10:setFontFamily("Palatino Linotype");
    obj.edit10:setFontColor("#573c27");
    obj.edit10:setHeight(25);
    obj.edit10:setFontSize(15);
    obj.edit10:setTransparent(true);

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowPart13);
    obj.dataLink10:setField("dado10");
    obj.dataLink10:setDefaultValue("—");
    obj.dataLink10:setName("dataLink10");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setMinWidth(220);
    obj.flowPart14:setHeight(25);
    obj.flowPart14:setMargins({right=10, left=10});
    obj.flowPart14:setName("flowPart14");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart14);
    obj.label12:setAlign("left");
    obj.label12:setText("Motivação:");
    obj.label12:setWidth(78);
    obj.label12:setName("label12");
    obj.label12:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setFontColor("black");
    obj.label12:setHeight(25);
    obj.label12:setFontSize(15);

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowPart14);
    obj.edit11:setAlign("client");
    obj.edit11:setField("dado11");
    obj.edit11:setHint("Motivação");
    obj.edit11:setName("edit11");
    obj.edit11:setFontFamily("Palatino Linotype");
    obj.edit11:setFontColor("#573c27");
    obj.edit11:setHeight(25);
    obj.edit11:setFontSize(15);
    obj.edit11:setTransparent(true);

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.flowPart14);
    obj.dataLink11:setField("dado11");
    obj.dataLink11:setDefaultValue("—");
    obj.dataLink11:setName("dataLink11");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(220);
    obj.flowPart15:setHeight(25);
    obj.flowPart15:setMargins({right=10, left=10});
    obj.flowPart15:setName("flowPart15");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart15);
    obj.label13:setAlign("left");
    obj.label13:setText("Volume:");
    obj.label13:setWidth(60);
    obj.label13:setName("label13");
    obj.label13:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setFontColor("black");
    obj.label13:setHeight(25);
    obj.label13:setFontSize(15);

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowPart15);
    obj.edit12:setAlign("client");
    obj.edit12:setField("dado12");
    obj.edit12:setHint("Volume");
    obj.edit12:setName("edit12");
    obj.edit12:setFontFamily("Palatino Linotype");
    obj.edit12:setFontColor("#573c27");
    obj.edit12:setHeight(25);
    obj.edit12:setFontSize(15);
    obj.edit12:setTransparent(true);

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.flowPart15);
    obj.dataLink12:setField("dado12");
    obj.dataLink12:setDefaultValue("—");
    obj.dataLink12:setName("dataLink12");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout2);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(720);
    obj.flowPart16:setAlign("top");
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setName("flowPart16");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout2);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(220);
    obj.flowPart17:setHeight(25);
    obj.flowPart17:setMargins({right=10, left=10});
    obj.flowPart17:setName("flowPart17");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart17);
    obj.label14:setAlign("left");
    obj.label14:setText("Defesa em Intriga:");
    obj.label14:setWidth(130);
    obj.label14:setHitTest(true);
    obj.label14:setHint("Astúcia + Percepção + Status");
    obj.label14:setName("label14");
    obj.label14:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setFontColor("black");
    obj.label14:setHeight(25);
    obj.label14:setFontSize(15);

    obj.dado13 = GUI.fromHandle(_obj_newObject("label"));
    obj.dado13:setParent(obj.flowPart17);
    obj.dado13:setAlign("client");
    obj.dado13:setName("dado13");
    obj.dado13:setFontColor("#a7754d");
    obj.dado13:setFontFamily("Georgia");
    obj.dado13:setField("dado13");
    obj.dado13:setHitTest(true);
    obj.dado13:setHint("Astúcia + Percepção + Status");
    lfm_setPropAsString(obj.dado13, "fontStyle",  "bold");
    obj.dado13:setHeight(25);
    obj.dado13:setFontSize(15);

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.flowPart17);
    obj.dataLink13:setField("dado13");
    obj.dataLink13:setDefaultValue("0");
    obj.dataLink13:setName("dataLink13");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setMinWidth(220);
    obj.flowPart18:setHeight(25);
    obj.flowPart18:setMargins({right=10, left=10});
    obj.flowPart18:setName("flowPart18");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart18);
    obj.label15:setAlign("left");
    obj.label15:setText("Defesa em Combate:");
    obj.label15:setWidth(145);
    obj.label15:setHitTest(true);
    obj.label15:setHint("Agilidade + Atletismo + Percepção");
    obj.label15:setName("label15");
    obj.label15:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label15, "fontStyle",  "bold");
    obj.label15:setFontColor("black");
    obj.label15:setHeight(25);
    obj.label15:setFontSize(15);

    obj.dado14 = GUI.fromHandle(_obj_newObject("label"));
    obj.dado14:setParent(obj.flowPart18);
    obj.dado14:setAlign("client");
    obj.dado14:setName("dado14");
    obj.dado14:setFontColor("#a7754d");
    obj.dado14:setFontFamily("Georgia");
    obj.dado14:setField("dado14");
    obj.dado14:setHitTest(true);
    obj.dado14:setHint("Agilidade + Atletismo + Percepção");
    lfm_setPropAsString(obj.dado14, "fontStyle",  "bold");
    obj.dado14:setHeight(25);
    obj.dado14:setFontSize(15);

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.flowPart18);
    obj.dataLink14:setField("dado14");
    obj.dataLink14:setDefaultValue("0");
    obj.dataLink14:setName("dataLink14");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setMinWidth(220);
    obj.flowPart19:setHeight(25);
    obj.flowPart19:setMargins({right=10, left=10});
    obj.flowPart19:setName("flowPart19");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.flowPart19);
    obj.label16:setAlign("left");
    obj.label16:setText("Compostura:");
    obj.label16:setWidth(92);
    obj.label16:setHitTest(true);
    obj.label16:setHint("Vontade x 3");
    obj.label16:setName("label16");
    obj.label16:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label16, "fontStyle",  "bold");
    obj.label16:setFontColor("black");
    obj.label16:setHeight(25);
    obj.label16:setFontSize(15);

    obj.dado15 = GUI.fromHandle(_obj_newObject("label"));
    obj.dado15:setParent(obj.flowPart19);
    obj.dado15:setAlign("client");
    obj.dado15:setName("dado15");
    obj.dado15:setFontColor("#a7754d");
    obj.dado15:setFontFamily("Georgia");
    obj.dado15:setField("dado15");
    obj.dado15:setHitTest(true);
    obj.dado15:setHint("Vontade x 3");
    lfm_setPropAsString(obj.dado15, "fontStyle",  "bold");
    obj.dado15:setHeight(25);
    obj.dado15:setFontSize(15);

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.flowPart19);
    obj.dataLink15:setField("dado15");
    obj.dataLink15:setDefaultValue("0");
    obj.dataLink15:setName("dataLink15");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setMinWidth(220);
    obj.flowPart20:setHeight(25);
    obj.flowPart20:setMargins({right=10, left=10});
    obj.flowPart20:setName("flowPart20");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart20);
    obj.label17:setAlign("left");
    obj.label17:setText("Saúde:");
    obj.label17:setWidth(50);
    obj.label17:setHitTest(true);
    obj.label17:setHint("Vigor x 3");
    obj.label17:setName("label17");
    obj.label17:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label17, "fontStyle",  "bold");
    obj.label17:setFontColor("black");
    obj.label17:setHeight(25);
    obj.label17:setFontSize(15);

    obj.dado16 = GUI.fromHandle(_obj_newObject("label"));
    obj.dado16:setParent(obj.flowPart20);
    obj.dado16:setAlign("client");
    obj.dado16:setName("dado16");
    obj.dado16:setFontColor("#a7754d");
    obj.dado16:setFontFamily("Georgia");
    obj.dado16:setField("dado16");
    obj.dado16:setHitTest(true);
    obj.dado16:setHint("Vigor x 3");
    lfm_setPropAsString(obj.dado16, "fontStyle",  "bold");
    obj.dado16:setHeight(25);
    obj.dado16:setFontSize(15);

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.flowPart20);
    obj.dataLink16:setField("dado16");
    obj.dataLink16:setDefaultValue("0");
    obj.dataLink16:setName("dataLink16");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setMinWidth(220);
    obj.flowPart21:setHeight(25);
    obj.flowPart21:setMargins({right=10, left=10});
    obj.flowPart21:setName("flowPart21");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart21);
    obj.label18:setAlign("left");
    obj.label18:setText("Movimento:");
    obj.label18:setWidth(87);
    obj.label18:setHitTest(true);
    obj.label18:setHint("4m + 1m/2B em Corrida");
    obj.label18:setName("label18");
    obj.label18:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setFontColor("black");
    obj.label18:setHeight(25);
    obj.label18:setFontSize(15);

    obj.dado17 = GUI.fromHandle(_obj_newObject("label"));
    obj.dado17:setParent(obj.flowPart21);
    obj.dado17:setAlign("client");
    obj.dado17:setName("dado17");
    obj.dado17:setFontColor("#a7754d");
    obj.dado17:setFontFamily("Georgia");
    obj.dado17:setField("dado17");
    obj.dado17:setHitTest(true);
    obj.dado17:setHint("4m + 1m/2B em Corrida");
    lfm_setPropAsString(obj.dado17, "fontStyle",  "bold");
    obj.dado17:setHeight(25);
    obj.dado17:setFontSize(15);

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.flowPart21);
    obj.dataLink17:setField("dado17");
    obj.dataLink17:setDefaultValue("0");
    obj.dataLink17:setName("dataLink17");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setMinWidth(220);
    obj.flowPart22:setHeight(25);
    obj.flowPart22:setMargins({right=10, left=10});
    obj.flowPart22:setName("flowPart22");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart22);
    obj.label19:setAlign("left");
    obj.label19:setText("Corrida:");
    obj.label19:setWidth(60);
    obj.label19:setHitTest(true);
    obj.label19:setHint("Movimento x 4");
    obj.label19:setName("label19");
    obj.label19:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setFontColor("black");
    obj.label19:setHeight(25);
    obj.label19:setFontSize(15);

    obj.dado18 = GUI.fromHandle(_obj_newObject("label"));
    obj.dado18:setParent(obj.flowPart22);
    obj.dado18:setAlign("client");
    obj.dado18:setName("dado18");
    obj.dado18:setFontColor("#a7754d");
    obj.dado18:setFontFamily("Georgia");
    obj.dado18:setField("dado18");
    obj.dado18:setHitTest(true);
    obj.dado18:setHint("Movimento x 4");
    lfm_setPropAsString(obj.dado18, "fontStyle",  "bold");
    obj.dado18:setHeight(25);
    obj.dado18:setFontSize(15);

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.flowPart22);
    obj.dataLink18:setField("dado18");
    obj.dataLink18:setDefaultValue("0");
    obj.dataLink18:setName("dataLink18");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout2);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout2);
    obj.flowPart23:setMinWidth(700);
    obj.flowPart23:setAlign("top");
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart23);
    obj.horzLine1:setMargins({top=10, left=10});
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#a7754d");
    obj.horzLine1:setAlign("top");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout2);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout2);
    obj.flowPart24:setMinWidth(220);
    obj.flowPart24:setHeight(60);
    obj.flowPart24:setMargins({right=10, left=10});
    obj.flowPart24:setName("flowPart24");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart24);
    obj.label20:setAlign("top");
    obj.label20:setText("FERIMENTOS");
    obj.label20:setFontSize(10);
    obj.label20:setName("label20");
    obj.label20:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setFontColor("black");
    obj.label20:setHeight(25);

    obj.nomeCheckFerimentos_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckFerimentos_01:setParent(obj.flowPart24);
    obj.nomeCheckFerimentos_01:setField("fldCheckFerimentos_01");
    obj.nomeCheckFerimentos_01:setName("nomeCheckFerimentos_01");
    obj.nomeCheckFerimentos_01:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckFerimentos_01:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckFerimentos_01:setHeight(24);
    obj.nomeCheckFerimentos_01:setWidth(24);
    obj.nomeCheckFerimentos_01:setAlign("left");
    obj.nomeCheckFerimentos_01:setMargins({right=3});
    obj.nomeCheckFerimentos_01:setAutoChange(false);

    obj.nomeCheckFerimentos_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckFerimentos_02:setParent(obj.flowPart24);
    obj.nomeCheckFerimentos_02:setField("fldCheckFerimentos_02");
    obj.nomeCheckFerimentos_02:setName("nomeCheckFerimentos_02");
    obj.nomeCheckFerimentos_02:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckFerimentos_02:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckFerimentos_02:setHeight(24);
    obj.nomeCheckFerimentos_02:setWidth(24);
    obj.nomeCheckFerimentos_02:setAlign("left");
    obj.nomeCheckFerimentos_02:setMargins({right=3});
    obj.nomeCheckFerimentos_02:setAutoChange(false);

    obj.nomeCheckFerimentos_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckFerimentos_03:setParent(obj.flowPart24);
    obj.nomeCheckFerimentos_03:setField("fldCheckFerimentos_03");
    obj.nomeCheckFerimentos_03:setName("nomeCheckFerimentos_03");
    obj.nomeCheckFerimentos_03:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckFerimentos_03:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckFerimentos_03:setHeight(24);
    obj.nomeCheckFerimentos_03:setWidth(24);
    obj.nomeCheckFerimentos_03:setAlign("left");
    obj.nomeCheckFerimentos_03:setMargins({right=3});
    obj.nomeCheckFerimentos_03:setAutoChange(false);

    obj.nomeCheckFerimentos_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckFerimentos_04:setParent(obj.flowPart24);
    obj.nomeCheckFerimentos_04:setField("fldCheckFerimentos_04");
    obj.nomeCheckFerimentos_04:setName("nomeCheckFerimentos_04");
    obj.nomeCheckFerimentos_04:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckFerimentos_04:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckFerimentos_04:setHeight(24);
    obj.nomeCheckFerimentos_04:setWidth(24);
    obj.nomeCheckFerimentos_04:setAlign("left");
    obj.nomeCheckFerimentos_04:setMargins({right=3});
    obj.nomeCheckFerimentos_04:setAutoChange(false);

    obj.nomeCheckFerimentos_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckFerimentos_05:setParent(obj.flowPart24);
    obj.nomeCheckFerimentos_05:setField("fldCheckFerimentos_05");
    obj.nomeCheckFerimentos_05:setName("nomeCheckFerimentos_05");
    obj.nomeCheckFerimentos_05:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckFerimentos_05:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckFerimentos_05:setHeight(24);
    obj.nomeCheckFerimentos_05:setWidth(24);
    obj.nomeCheckFerimentos_05:setAlign("left");
    obj.nomeCheckFerimentos_05:setMargins({right=3});
    obj.nomeCheckFerimentos_05:setAutoChange(false);

    obj.nomeCheckFerimentos_06 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckFerimentos_06:setParent(obj.flowPart24);
    obj.nomeCheckFerimentos_06:setField("fldCheckFerimentos_06");
    obj.nomeCheckFerimentos_06:setName("nomeCheckFerimentos_06");
    obj.nomeCheckFerimentos_06:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckFerimentos_06:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckFerimentos_06:setHeight(24);
    obj.nomeCheckFerimentos_06:setWidth(24);
    obj.nomeCheckFerimentos_06:setAlign("left");
    obj.nomeCheckFerimentos_06:setMargins({right=3});
    obj.nomeCheckFerimentos_06:setAutoChange(false);

    obj.nomeCheckFerimentos_07 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckFerimentos_07:setParent(obj.flowPart24);
    obj.nomeCheckFerimentos_07:setField("fldCheckFerimentos_07");
    obj.nomeCheckFerimentos_07:setName("nomeCheckFerimentos_07");
    obj.nomeCheckFerimentos_07:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckFerimentos_07:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckFerimentos_07:setHeight(24);
    obj.nomeCheckFerimentos_07:setWidth(24);
    obj.nomeCheckFerimentos_07:setAlign("left");
    obj.nomeCheckFerimentos_07:setMargins({right=3});
    obj.nomeCheckFerimentos_07:setAutoChange(false);

    obj.nomeCheckFerimentos_08 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckFerimentos_08:setParent(obj.flowPart24);
    obj.nomeCheckFerimentos_08:setField("fldCheckFerimentos_08");
    obj.nomeCheckFerimentos_08:setName("nomeCheckFerimentos_08");
    obj.nomeCheckFerimentos_08:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckFerimentos_08:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckFerimentos_08:setHeight(24);
    obj.nomeCheckFerimentos_08:setWidth(24);
    obj.nomeCheckFerimentos_08:setAlign("left");
    obj.nomeCheckFerimentos_08:setMargins({right=3});
    obj.nomeCheckFerimentos_08:setAutoChange(false);

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout2);
    obj.flowPart25:setMinWidth(220);
    obj.flowPart25:setHeight(60);
    obj.flowPart25:setMargins({right=10, left=10});
    obj.flowPart25:setName("flowPart25");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart25);
    obj.label21:setAlign("top");
    obj.label21:setText("LESÕES");
    obj.label21:setFontSize(10);
    obj.label21:setName("label21");
    obj.label21:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setFontColor("black");
    obj.label21:setHeight(25);

    obj.nomeCheckLesoes_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLesoes_01:setParent(obj.flowPart25);
    obj.nomeCheckLesoes_01:setField("fldCheckLesoes_01");
    obj.nomeCheckLesoes_01:setName("nomeCheckLesoes_01");
    obj.nomeCheckLesoes_01:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckLesoes_01:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckLesoes_01:setHeight(24);
    obj.nomeCheckLesoes_01:setWidth(24);
    obj.nomeCheckLesoes_01:setAlign("left");
    obj.nomeCheckLesoes_01:setMargins({right=3});
    obj.nomeCheckLesoes_01:setAutoChange(false);

    obj.nomeCheckLesoes_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLesoes_02:setParent(obj.flowPart25);
    obj.nomeCheckLesoes_02:setField("fldCheckLesoes_02");
    obj.nomeCheckLesoes_02:setName("nomeCheckLesoes_02");
    obj.nomeCheckLesoes_02:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckLesoes_02:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckLesoes_02:setHeight(24);
    obj.nomeCheckLesoes_02:setWidth(24);
    obj.nomeCheckLesoes_02:setAlign("left");
    obj.nomeCheckLesoes_02:setMargins({right=3});
    obj.nomeCheckLesoes_02:setAutoChange(false);

    obj.nomeCheckLesoes_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLesoes_03:setParent(obj.flowPart25);
    obj.nomeCheckLesoes_03:setField("fldCheckLesoes_03");
    obj.nomeCheckLesoes_03:setName("nomeCheckLesoes_03");
    obj.nomeCheckLesoes_03:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckLesoes_03:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckLesoes_03:setHeight(24);
    obj.nomeCheckLesoes_03:setWidth(24);
    obj.nomeCheckLesoes_03:setAlign("left");
    obj.nomeCheckLesoes_03:setMargins({right=3});
    obj.nomeCheckLesoes_03:setAutoChange(false);

    obj.nomeCheckLesoes_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLesoes_04:setParent(obj.flowPart25);
    obj.nomeCheckLesoes_04:setField("fldCheckLesoes_04");
    obj.nomeCheckLesoes_04:setName("nomeCheckLesoes_04");
    obj.nomeCheckLesoes_04:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckLesoes_04:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckLesoes_04:setHeight(24);
    obj.nomeCheckLesoes_04:setWidth(24);
    obj.nomeCheckLesoes_04:setAlign("left");
    obj.nomeCheckLesoes_04:setMargins({right=3});
    obj.nomeCheckLesoes_04:setAutoChange(false);

    obj.nomeCheckLesoes_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLesoes_05:setParent(obj.flowPart25);
    obj.nomeCheckLesoes_05:setField("fldCheckLesoes_05");
    obj.nomeCheckLesoes_05:setName("nomeCheckLesoes_05");
    obj.nomeCheckLesoes_05:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckLesoes_05:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckLesoes_05:setHeight(24);
    obj.nomeCheckLesoes_05:setWidth(24);
    obj.nomeCheckLesoes_05:setAlign("left");
    obj.nomeCheckLesoes_05:setMargins({right=3});
    obj.nomeCheckLesoes_05:setAutoChange(false);

    obj.nomeCheckLesoes_06 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLesoes_06:setParent(obj.flowPart25);
    obj.nomeCheckLesoes_06:setField("fldCheckLesoes_06");
    obj.nomeCheckLesoes_06:setName("nomeCheckLesoes_06");
    obj.nomeCheckLesoes_06:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckLesoes_06:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckLesoes_06:setHeight(24);
    obj.nomeCheckLesoes_06:setWidth(24);
    obj.nomeCheckLesoes_06:setAlign("left");
    obj.nomeCheckLesoes_06:setMargins({right=3});
    obj.nomeCheckLesoes_06:setAutoChange(false);

    obj.nomeCheckLesoes_07 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLesoes_07:setParent(obj.flowPart25);
    obj.nomeCheckLesoes_07:setField("fldCheckLesoes_07");
    obj.nomeCheckLesoes_07:setName("nomeCheckLesoes_07");
    obj.nomeCheckLesoes_07:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckLesoes_07:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckLesoes_07:setHeight(24);
    obj.nomeCheckLesoes_07:setWidth(24);
    obj.nomeCheckLesoes_07:setAlign("left");
    obj.nomeCheckLesoes_07:setMargins({right=3});
    obj.nomeCheckLesoes_07:setAutoChange(false);

    obj.nomeCheckLesoes_08 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckLesoes_08:setParent(obj.flowPart25);
    obj.nomeCheckLesoes_08:setField("fldCheckLesoes_08");
    obj.nomeCheckLesoes_08:setName("nomeCheckLesoes_08");
    obj.nomeCheckLesoes_08:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckLesoes_08:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckLesoes_08:setHeight(24);
    obj.nomeCheckLesoes_08:setWidth(24);
    obj.nomeCheckLesoes_08:setAlign("left");
    obj.nomeCheckLesoes_08:setMargins({right=3});
    obj.nomeCheckLesoes_08:setAutoChange(false);

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout2);
    obj.flowPart26:setMinWidth(220);
    obj.flowPart26:setHeight(60);
    obj.flowPart26:setMargins({right=10, left=10});
    obj.flowPart26:setName("flowPart26");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart26);
    obj.label22:setAlign("top");
    obj.label22:setText("DESTINO");
    obj.label22:setFontSize(10);
    obj.label22:setName("label22");
    obj.label22:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label22, "fontStyle",  "bold");
    obj.label22:setFontColor("black");
    obj.label22:setHeight(25);

    obj.nomeCheckDESTINO_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDESTINO_01:setParent(obj.flowPart26);
    obj.nomeCheckDESTINO_01:setField("fldCheckDESTINO_01");
    obj.nomeCheckDESTINO_01:setName("nomeCheckDESTINO_01");
    obj.nomeCheckDESTINO_01:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckDESTINO_01:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckDESTINO_01:setHeight(24);
    obj.nomeCheckDESTINO_01:setWidth(24);
    obj.nomeCheckDESTINO_01:setAlign("left");
    obj.nomeCheckDESTINO_01:setMargins({right=3});
    obj.nomeCheckDESTINO_01:setAutoChange(false);

    obj.nomeCheckDESTINO_02 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDESTINO_02:setParent(obj.flowPart26);
    obj.nomeCheckDESTINO_02:setField("fldCheckDESTINO_02");
    obj.nomeCheckDESTINO_02:setName("nomeCheckDESTINO_02");
    obj.nomeCheckDESTINO_02:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckDESTINO_02:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckDESTINO_02:setHeight(24);
    obj.nomeCheckDESTINO_02:setWidth(24);
    obj.nomeCheckDESTINO_02:setAlign("left");
    obj.nomeCheckDESTINO_02:setMargins({right=3});
    obj.nomeCheckDESTINO_02:setAutoChange(false);

    obj.nomeCheckDESTINO_03 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDESTINO_03:setParent(obj.flowPart26);
    obj.nomeCheckDESTINO_03:setField("fldCheckDESTINO_03");
    obj.nomeCheckDESTINO_03:setName("nomeCheckDESTINO_03");
    obj.nomeCheckDESTINO_03:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckDESTINO_03:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckDESTINO_03:setHeight(24);
    obj.nomeCheckDESTINO_03:setWidth(24);
    obj.nomeCheckDESTINO_03:setAlign("left");
    obj.nomeCheckDESTINO_03:setMargins({right=3});
    obj.nomeCheckDESTINO_03:setAutoChange(false);

    obj.nomeCheckDESTINO_04 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDESTINO_04:setParent(obj.flowPart26);
    obj.nomeCheckDESTINO_04:setField("fldCheckDESTINO_04");
    obj.nomeCheckDESTINO_04:setName("nomeCheckDESTINO_04");
    obj.nomeCheckDESTINO_04:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckDESTINO_04:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckDESTINO_04:setHeight(24);
    obj.nomeCheckDESTINO_04:setWidth(24);
    obj.nomeCheckDESTINO_04:setAlign("left");
    obj.nomeCheckDESTINO_04:setMargins({right=3});
    obj.nomeCheckDESTINO_04:setAutoChange(false);

    obj.nomeCheckDESTINO_05 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDESTINO_05:setParent(obj.flowPart26);
    obj.nomeCheckDESTINO_05:setField("fldCheckDESTINO_05");
    obj.nomeCheckDESTINO_05:setName("nomeCheckDESTINO_05");
    obj.nomeCheckDESTINO_05:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckDESTINO_05:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckDESTINO_05:setHeight(24);
    obj.nomeCheckDESTINO_05:setWidth(24);
    obj.nomeCheckDESTINO_05:setAlign("left");
    obj.nomeCheckDESTINO_05:setMargins({right=3});
    obj.nomeCheckDESTINO_05:setAutoChange(false);

    obj.nomeCheckDESTINO_06 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDESTINO_06:setParent(obj.flowPart26);
    obj.nomeCheckDESTINO_06:setField("fldCheckDESTINO_06");
    obj.nomeCheckDESTINO_06:setName("nomeCheckDESTINO_06");
    obj.nomeCheckDESTINO_06:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckDESTINO_06:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckDESTINO_06:setHeight(24);
    obj.nomeCheckDESTINO_06:setWidth(24);
    obj.nomeCheckDESTINO_06:setAlign("left");
    obj.nomeCheckDESTINO_06:setMargins({right=3});
    obj.nomeCheckDESTINO_06:setAutoChange(false);

    obj.nomeCheckDESTINO_07 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDESTINO_07:setParent(obj.flowPart26);
    obj.nomeCheckDESTINO_07:setField("fldCheckDESTINO_07");
    obj.nomeCheckDESTINO_07:setName("nomeCheckDESTINO_07");
    obj.nomeCheckDESTINO_07:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckDESTINO_07:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckDESTINO_07:setHeight(24);
    obj.nomeCheckDESTINO_07:setWidth(24);
    obj.nomeCheckDESTINO_07:setAlign("left");
    obj.nomeCheckDESTINO_07:setMargins({right=3});
    obj.nomeCheckDESTINO_07:setAutoChange(false);

    obj.nomeCheckDESTINO_08 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheckDESTINO_08:setParent(obj.flowPart26);
    obj.nomeCheckDESTINO_08:setField("fldCheckDESTINO_08");
    obj.nomeCheckDESTINO_08:setName("nomeCheckDESTINO_08");
    obj.nomeCheckDESTINO_08:setImageChecked("/images/checkBoxAtvo.png");
    obj.nomeCheckDESTINO_08:setImageUnchecked("/images/checkBoxDesa.png");
    obj.nomeCheckDESTINO_08:setHeight(24);
    obj.nomeCheckDESTINO_08:setWidth(24);
    obj.nomeCheckDESTINO_08:setAlign("left");
    obj.nomeCheckDESTINO_08:setMargins({right=3});
    obj.nomeCheckDESTINO_08:setAutoChange(false);

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.layFrente);
    obj.image8:setAlign("top");
    obj.image8:setURL("/images/divisor.png");
    obj.image8:setStyle("proportional");
    obj.image8:setHeight(30);
    obj.image8:setName("image8");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.layFrente);
    obj.flowLayout3:setHeight(615);
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setOrientation("horizontal");
    obj.flowLayout3:setMaxControlsPerLine(1);
    obj.flowLayout3:setMargins({top=30, bottom=20});

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout3);
    obj.flowPart27:setMinWidth(680);
    obj.flowPart27:setAlign("top");
    obj.flowPart27:setHeight(45);
    obj.flowPart27:setName("flowPart27");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart27);
    obj.label23:setText("HABILIDADES");
    obj.label23:setFontSize(30);
    obj.label23:setAlign("top");
    obj.label23:setName("label23");
    obj.label23:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label23, "fontStyle",  "bold");
    obj.label23:setFontColor("black");
    obj.label23:setHeight(25);

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout3);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout3);
    obj.flowPart28:setMinWidth(680);
    obj.flowPart28:setAlign("top");
    obj.flowPart28:setHeight(35);
    obj.flowPart28:setName("flowPart28");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart28);
    obj.label24:setText("GRAD.");
    obj.label24:setFontColor("#a7754d");
    obj.label24:setAlign("left");
    obj.label24:setWidth(70);
    obj.label24:setName("label24");
    obj.label24:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label24, "fontStyle",  "bold");
    obj.label24:setHeight(25);
    obj.label24:setFontSize(15);

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart28);
    obj.label25:setText("NOME DA HABILIDADE");
    obj.label25:setFontColor("#a7754d");
    obj.label25:setAlign("left");
    obj.label25:setWidth(210);
    obj.label25:setName("label25");
    obj.label25:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label25, "fontStyle",  "bold");
    obj.label25:setHeight(25);
    obj.label25:setFontSize(15);

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart28);
    obj.label26:setText("ESPECIALIDADES");
    obj.label26:setFontColor("#a7754d");
    obj.label26:setAlign("left");
    obj.label26:setWidth(400);
    obj.label26:setName("label26");
    obj.label26:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label26, "fontStyle",  "bold");
    obj.label26:setHeight(25);
    obj.label26:setFontSize(15);

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout3);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout3);
    obj.flowPart29:setMinWidth(680);
    obj.flowPart29:setAlign("top");
    obj.flowPart29:setHeight(25);
    obj.flowPart29:setName("flowPart29");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowPart29);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setOrientation("horizontal");
    obj.flowLayout4:setMaxControlsPerLine(3);
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout4);
    obj.flowPart30:setMinWidth(70);
    obj.flowPart30:setHeight(25);
    obj.flowPart30:setName("flowPart30");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart30);
    obj.label27:setFontColor("#a7754d");
    obj.label27:setAlign("left");
    obj.label27:setWidth(15);
    obj.label27:setText("❮");
    obj.label27:setHitTest(true);
    obj.label27:setHint("Agilidade");
    obj.label27:setCursor("handPoint");
    obj.label27:setName("label27");
    obj.label27:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label27, "fontStyle",  "bold");
    obj.label27:setHeight(25);
    obj.label27:setFontSize(15);

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowPart30);
    obj.edit13:setField("grad01");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setHint("Agilidade");
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(20);
    obj.edit13:setType("number");
    obj.edit13:setMin(1);
    obj.edit13:setMax(99);
    obj.edit13:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit13, "fontStyle",  "bold");
    obj.edit13:setName("edit13");
    obj.edit13:setFontColor("#573c27");
    obj.edit13:setHeight(25);
    obj.edit13:setFontSize(15);
    obj.edit13:setTransparent(true);

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart30);
    obj.label28:setFontColor("#a7754d");
    obj.label28:setAlign("left");
    obj.label28:setWidth(15);
    obj.label28:setHorzTextAlign("trailing");
    obj.label28:setText("❯");
    obj.label28:setHitTest(true);
    obj.label28:setCursor("handPoint");
    obj.label28:setHint("Agilidade");
    obj.label28:setName("label28");
    obj.label28:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label28, "fontStyle",  "bold");
    obj.label28:setHeight(25);
    obj.label28:setFontSize(15);

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.flowPart30);
    obj.dataLink19:setField("grad01");
    obj.dataLink19:setDefaultValue("2");
    obj.dataLink19:setName("dataLink19");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout4);
    obj.flowPart31:setMinWidth(200);
    obj.flowPart31:setHeight(25);
    obj.flowPart31:setName("flowPart31");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart31);
    obj.label29:setAlign("client");
    obj.label29:setText("Agilidade");
    obj.label29:setName("label29");
    obj.label29:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label29, "fontStyle",  "bold");
    obj.label29:setFontColor("black");
    obj.label29:setHeight(25);
    obj.label29:setFontSize(15);

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout4);
    obj.flowPart32:setMinWidth(400);
    obj.flowPart32:setHeight(25);
    obj.flowPart32:setMargins({left=10});
    obj.flowPart32:setName("flowPart32");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.flowPart32);
    obj.edit14:setField("spec01");
    obj.edit14:setAlign("client");
    lfm_setPropAsString(obj.edit14, "fontStyle",  "italic");
    obj.edit14:setName("edit14");
    obj.edit14:setFontFamily("Palatino Linotype");
    obj.edit14:setFontColor("#573c27");
    obj.edit14:setHeight(25);
    obj.edit14:setFontSize(15);
    obj.edit14:setTransparent(true);

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.flowPart32);
    obj.dataLink20:setField("spec01");
    obj.dataLink20:setDefaultValue("—");
    obj.dataLink20:setName("dataLink20");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout3);
    obj.flowPart33:setMinWidth(680);
    obj.flowPart33:setAlign("top");
    obj.flowPart33:setHeight(25);
    obj.flowPart33:setName("flowPart33");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowPart33);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setOrientation("horizontal");
    obj.flowLayout5:setMaxControlsPerLine(3);
    obj.flowLayout5:setName("flowLayout5");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout5);
    obj.flowPart34:setMinWidth(70);
    obj.flowPart34:setHeight(25);
    obj.flowPart34:setName("flowPart34");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart34);
    obj.label30:setFontColor("#a7754d");
    obj.label30:setAlign("left");
    obj.label30:setWidth(15);
    obj.label30:setText("❮");
    obj.label30:setHitTest(true);
    obj.label30:setHint("Astúcia");
    obj.label30:setCursor("handPoint");
    obj.label30:setName("label30");
    obj.label30:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label30, "fontStyle",  "bold");
    obj.label30:setHeight(25);
    obj.label30:setFontSize(15);

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart34);
    obj.edit15:setField("grad02");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setHint("Astúcia");
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(20);
    obj.edit15:setType("number");
    obj.edit15:setMin(1);
    obj.edit15:setMax(99);
    obj.edit15:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit15, "fontStyle",  "bold");
    obj.edit15:setName("edit15");
    obj.edit15:setFontColor("#573c27");
    obj.edit15:setHeight(25);
    obj.edit15:setFontSize(15);
    obj.edit15:setTransparent(true);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart34);
    obj.label31:setFontColor("#a7754d");
    obj.label31:setAlign("left");
    obj.label31:setWidth(15);
    obj.label31:setHorzTextAlign("trailing");
    obj.label31:setText("❯");
    obj.label31:setHitTest(true);
    obj.label31:setCursor("handPoint");
    obj.label31:setHint("Astúcia");
    obj.label31:setName("label31");
    obj.label31:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setHeight(25);
    obj.label31:setFontSize(15);

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.flowPart34);
    obj.dataLink21:setField("grad02");
    obj.dataLink21:setDefaultValue("2");
    obj.dataLink21:setName("dataLink21");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout5);
    obj.flowPart35:setMinWidth(200);
    obj.flowPart35:setHeight(25);
    obj.flowPart35:setName("flowPart35");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart35);
    obj.label32:setAlign("client");
    obj.label32:setText("Astúcia");
    obj.label32:setName("label32");
    obj.label32:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label32, "fontStyle",  "bold");
    obj.label32:setFontColor("black");
    obj.label32:setHeight(25);
    obj.label32:setFontSize(15);

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout5);
    obj.flowPart36:setMinWidth(400);
    obj.flowPart36:setHeight(25);
    obj.flowPart36:setMargins({left=10});
    obj.flowPart36:setName("flowPart36");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart36);
    obj.edit16:setField("spec02");
    obj.edit16:setAlign("client");
    lfm_setPropAsString(obj.edit16, "fontStyle",  "italic");
    obj.edit16:setName("edit16");
    obj.edit16:setFontFamily("Palatino Linotype");
    obj.edit16:setFontColor("#573c27");
    obj.edit16:setHeight(25);
    obj.edit16:setFontSize(15);
    obj.edit16:setTransparent(true);

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.flowPart36);
    obj.dataLink22:setField("spec02");
    obj.dataLink22:setDefaultValue("—");
    obj.dataLink22:setName("dataLink22");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout3);
    obj.flowPart37:setMinWidth(680);
    obj.flowPart37:setAlign("top");
    obj.flowPart37:setHeight(25);
    obj.flowPart37:setName("flowPart37");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowPart37);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setOrientation("horizontal");
    obj.flowLayout6:setMaxControlsPerLine(3);
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout6);
    obj.flowPart38:setMinWidth(70);
    obj.flowPart38:setHeight(25);
    obj.flowPart38:setName("flowPart38");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart38);
    obj.label33:setFontColor("#a7754d");
    obj.label33:setAlign("left");
    obj.label33:setWidth(15);
    obj.label33:setText("❮");
    obj.label33:setHitTest(true);
    obj.label33:setHint("Atletismo");
    obj.label33:setCursor("handPoint");
    obj.label33:setName("label33");
    obj.label33:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label33, "fontStyle",  "bold");
    obj.label33:setHeight(25);
    obj.label33:setFontSize(15);

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.flowPart38);
    obj.edit17:setField("grad03");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setHint("Atletismo");
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(20);
    obj.edit17:setType("number");
    obj.edit17:setMin(1);
    obj.edit17:setMax(99);
    obj.edit17:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit17, "fontStyle",  "bold");
    obj.edit17:setName("edit17");
    obj.edit17:setFontColor("#573c27");
    obj.edit17:setHeight(25);
    obj.edit17:setFontSize(15);
    obj.edit17:setTransparent(true);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart38);
    obj.label34:setFontColor("#a7754d");
    obj.label34:setAlign("left");
    obj.label34:setWidth(15);
    obj.label34:setHorzTextAlign("trailing");
    obj.label34:setText("❯");
    obj.label34:setHitTest(true);
    obj.label34:setCursor("handPoint");
    obj.label34:setHint("Atletismo");
    obj.label34:setName("label34");
    obj.label34:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label34, "fontStyle",  "bold");
    obj.label34:setHeight(25);
    obj.label34:setFontSize(15);

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.flowPart38);
    obj.dataLink23:setField("grad03");
    obj.dataLink23:setDefaultValue("2");
    obj.dataLink23:setName("dataLink23");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout6);
    obj.flowPart39:setMinWidth(200);
    obj.flowPart39:setHeight(25);
    obj.flowPart39:setName("flowPart39");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart39);
    obj.label35:setAlign("client");
    obj.label35:setText("Atletismo");
    obj.label35:setName("label35");
    obj.label35:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label35, "fontStyle",  "bold");
    obj.label35:setFontColor("black");
    obj.label35:setHeight(25);
    obj.label35:setFontSize(15);

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout6);
    obj.flowPart40:setMinWidth(400);
    obj.flowPart40:setHeight(25);
    obj.flowPart40:setMargins({left=10});
    obj.flowPart40:setName("flowPart40");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.flowPart40);
    obj.edit18:setField("spec03");
    obj.edit18:setAlign("client");
    lfm_setPropAsString(obj.edit18, "fontStyle",  "italic");
    obj.edit18:setName("edit18");
    obj.edit18:setFontFamily("Palatino Linotype");
    obj.edit18:setFontColor("#573c27");
    obj.edit18:setHeight(25);
    obj.edit18:setFontSize(15);
    obj.edit18:setTransparent(true);

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.flowPart40);
    obj.dataLink24:setField("spec03");
    obj.dataLink24:setDefaultValue("—");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.flowLayout3);
    obj.dataLink25:setField("spec03");
    obj.dataLink25:setName("dataLink25");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout3);
    obj.flowPart41:setMinWidth(680);
    obj.flowPart41:setAlign("top");
    obj.flowPart41:setHeight(25);
    obj.flowPart41:setName("flowPart41");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowPart41);
    obj.flowLayout7:setAlign("top");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setOrientation("horizontal");
    obj.flowLayout7:setMaxControlsPerLine(3);
    obj.flowLayout7:setName("flowLayout7");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout7);
    obj.flowPart42:setMinWidth(70);
    obj.flowPart42:setHeight(25);
    obj.flowPart42:setName("flowPart42");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart42);
    obj.label36:setFontColor("#a7754d");
    obj.label36:setAlign("left");
    obj.label36:setWidth(15);
    obj.label36:setText("❮");
    obj.label36:setHitTest(true);
    obj.label36:setHint("Conhecimento");
    obj.label36:setCursor("handPoint");
    obj.label36:setName("label36");
    obj.label36:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label36, "fontStyle",  "bold");
    obj.label36:setHeight(25);
    obj.label36:setFontSize(15);

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.flowPart42);
    obj.edit19:setField("grad04");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setHint("Conhecimento");
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(20);
    obj.edit19:setType("number");
    obj.edit19:setMin(1);
    obj.edit19:setMax(99);
    obj.edit19:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit19, "fontStyle",  "bold");
    obj.edit19:setName("edit19");
    obj.edit19:setFontColor("#573c27");
    obj.edit19:setHeight(25);
    obj.edit19:setFontSize(15);
    obj.edit19:setTransparent(true);

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart42);
    obj.label37:setFontColor("#a7754d");
    obj.label37:setAlign("left");
    obj.label37:setWidth(15);
    obj.label37:setHorzTextAlign("trailing");
    obj.label37:setText("❯");
    obj.label37:setHitTest(true);
    obj.label37:setCursor("handPoint");
    obj.label37:setHint("Conhecimento");
    obj.label37:setName("label37");
    obj.label37:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label37, "fontStyle",  "bold");
    obj.label37:setHeight(25);
    obj.label37:setFontSize(15);

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.flowPart42);
    obj.dataLink26:setField("grad04");
    obj.dataLink26:setDefaultValue("2");
    obj.dataLink26:setName("dataLink26");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout7);
    obj.flowPart43:setMinWidth(200);
    obj.flowPart43:setHeight(25);
    obj.flowPart43:setName("flowPart43");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart43);
    obj.label38:setAlign("client");
    obj.label38:setText("Conhecimento");
    obj.label38:setName("label38");
    obj.label38:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label38, "fontStyle",  "bold");
    obj.label38:setFontColor("black");
    obj.label38:setHeight(25);
    obj.label38:setFontSize(15);

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout7);
    obj.flowPart44:setMinWidth(400);
    obj.flowPart44:setHeight(25);
    obj.flowPart44:setMargins({left=10});
    obj.flowPart44:setName("flowPart44");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.flowPart44);
    obj.edit20:setField("spec04");
    obj.edit20:setAlign("client");
    lfm_setPropAsString(obj.edit20, "fontStyle",  "italic");
    obj.edit20:setName("edit20");
    obj.edit20:setFontFamily("Palatino Linotype");
    obj.edit20:setFontColor("#573c27");
    obj.edit20:setHeight(25);
    obj.edit20:setFontSize(15);
    obj.edit20:setTransparent(true);

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.flowPart44);
    obj.dataLink27:setField("spec04");
    obj.dataLink27:setDefaultValue("—");
    obj.dataLink27:setName("dataLink27");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout3);
    obj.flowPart45:setMinWidth(680);
    obj.flowPart45:setAlign("top");
    obj.flowPart45:setHeight(25);
    obj.flowPart45:setName("flowPart45");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowPart45);
    obj.flowLayout8:setAlign("top");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setHorzAlign("center");
    obj.flowLayout8:setOrientation("horizontal");
    obj.flowLayout8:setMaxControlsPerLine(3);
    obj.flowLayout8:setName("flowLayout8");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout8);
    obj.flowPart46:setMinWidth(70);
    obj.flowPart46:setHeight(25);
    obj.flowPart46:setName("flowPart46");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart46);
    obj.label39:setFontColor("#a7754d");
    obj.label39:setAlign("left");
    obj.label39:setWidth(15);
    obj.label39:setText("❮");
    obj.label39:setHitTest(true);
    obj.label39:setHint("Cura");
    obj.label39:setCursor("handPoint");
    obj.label39:setName("label39");
    obj.label39:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setHeight(25);
    obj.label39:setFontSize(15);

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.flowPart46);
    obj.edit21:setField("grad05");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setHint("Cura");
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(20);
    obj.edit21:setType("number");
    obj.edit21:setMin(1);
    obj.edit21:setMax(99);
    obj.edit21:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit21, "fontStyle",  "bold");
    obj.edit21:setName("edit21");
    obj.edit21:setFontColor("#573c27");
    obj.edit21:setHeight(25);
    obj.edit21:setFontSize(15);
    obj.edit21:setTransparent(true);

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart46);
    obj.label40:setFontColor("#a7754d");
    obj.label40:setAlign("left");
    obj.label40:setWidth(15);
    obj.label40:setHorzTextAlign("trailing");
    obj.label40:setText("❯");
    obj.label40:setHitTest(true);
    obj.label40:setCursor("handPoint");
    obj.label40:setHint("Cura");
    obj.label40:setName("label40");
    obj.label40:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label40, "fontStyle",  "bold");
    obj.label40:setHeight(25);
    obj.label40:setFontSize(15);

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.flowPart46);
    obj.dataLink28:setField("grad05");
    obj.dataLink28:setDefaultValue("2");
    obj.dataLink28:setName("dataLink28");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout8);
    obj.flowPart47:setMinWidth(200);
    obj.flowPart47:setHeight(25);
    obj.flowPart47:setName("flowPart47");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart47);
    obj.label41:setAlign("client");
    obj.label41:setText("Cura");
    obj.label41:setName("label41");
    obj.label41:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setFontColor("black");
    obj.label41:setHeight(25);
    obj.label41:setFontSize(15);

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout8);
    obj.flowPart48:setMinWidth(400);
    obj.flowPart48:setHeight(25);
    obj.flowPart48:setMargins({left=10});
    obj.flowPart48:setName("flowPart48");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart48);
    obj.edit22:setField("spec05");
    obj.edit22:setAlign("client");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "italic");
    obj.edit22:setName("edit22");
    obj.edit22:setFontFamily("Palatino Linotype");
    obj.edit22:setFontColor("#573c27");
    obj.edit22:setHeight(25);
    obj.edit22:setFontSize(15);
    obj.edit22:setTransparent(true);

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.flowPart48);
    obj.dataLink29:setField("spec05");
    obj.dataLink29:setDefaultValue("—");
    obj.dataLink29:setName("dataLink29");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout3);
    obj.flowPart49:setMinWidth(680);
    obj.flowPart49:setAlign("top");
    obj.flowPart49:setHeight(25);
    obj.flowPart49:setName("flowPart49");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowPart49);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setOrientation("horizontal");
    obj.flowLayout9:setMaxControlsPerLine(3);
    obj.flowLayout9:setName("flowLayout9");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout9);
    obj.flowPart50:setMinWidth(70);
    obj.flowPart50:setHeight(25);
    obj.flowPart50:setName("flowPart50");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart50);
    obj.label42:setFontColor("#a7754d");
    obj.label42:setAlign("left");
    obj.label42:setWidth(15);
    obj.label42:setText("❮");
    obj.label42:setHitTest(true);
    obj.label42:setHint("Enganação");
    obj.label42:setCursor("handPoint");
    obj.label42:setName("label42");
    obj.label42:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setHeight(25);
    obj.label42:setFontSize(15);

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart50);
    obj.edit23:setField("grad06");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setHint("Enganação");
    obj.edit23:setAlign("left");
    obj.edit23:setWidth(20);
    obj.edit23:setType("number");
    obj.edit23:setMin(1);
    obj.edit23:setMax(99);
    obj.edit23:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit23, "fontStyle",  "bold");
    obj.edit23:setName("edit23");
    obj.edit23:setFontColor("#573c27");
    obj.edit23:setHeight(25);
    obj.edit23:setFontSize(15);
    obj.edit23:setTransparent(true);

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart50);
    obj.label43:setFontColor("#a7754d");
    obj.label43:setAlign("left");
    obj.label43:setWidth(15);
    obj.label43:setHorzTextAlign("trailing");
    obj.label43:setText("❯");
    obj.label43:setHitTest(true);
    obj.label43:setCursor("handPoint");
    obj.label43:setHint("Enganação");
    obj.label43:setName("label43");
    obj.label43:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setHeight(25);
    obj.label43:setFontSize(15);

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.flowPart50);
    obj.dataLink30:setField("grad06");
    obj.dataLink30:setDefaultValue("2");
    obj.dataLink30:setName("dataLink30");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout9);
    obj.flowPart51:setMinWidth(200);
    obj.flowPart51:setHeight(25);
    obj.flowPart51:setName("flowPart51");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart51);
    obj.label44:setAlign("client");
    obj.label44:setText("Enganação");
    obj.label44:setName("label44");
    obj.label44:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label44, "fontStyle",  "bold");
    obj.label44:setFontColor("black");
    obj.label44:setHeight(25);
    obj.label44:setFontSize(15);

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout9);
    obj.flowPart52:setMinWidth(400);
    obj.flowPart52:setHeight(25);
    obj.flowPart52:setMargins({left=10});
    obj.flowPart52:setName("flowPart52");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart52);
    obj.edit24:setField("spec06");
    obj.edit24:setAlign("client");
    lfm_setPropAsString(obj.edit24, "fontStyle",  "italic");
    obj.edit24:setName("edit24");
    obj.edit24:setFontFamily("Palatino Linotype");
    obj.edit24:setFontColor("#573c27");
    obj.edit24:setHeight(25);
    obj.edit24:setFontSize(15);
    obj.edit24:setTransparent(true);

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.flowPart52);
    obj.dataLink31:setField("spec06");
    obj.dataLink31:setDefaultValue("—");
    obj.dataLink31:setName("dataLink31");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout3);
    obj.flowPart53:setMinWidth(680);
    obj.flowPart53:setAlign("top");
    obj.flowPart53:setHeight(25);
    obj.flowPart53:setName("flowPart53");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowPart53);
    obj.flowLayout10:setAlign("top");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setOrientation("horizontal");
    obj.flowLayout10:setMaxControlsPerLine(3);
    obj.flowLayout10:setName("flowLayout10");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout10);
    obj.flowPart54:setMinWidth(70);
    obj.flowPart54:setHeight(25);
    obj.flowPart54:setName("flowPart54");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart54);
    obj.label45:setFontColor("#a7754d");
    obj.label45:setAlign("left");
    obj.label45:setWidth(15);
    obj.label45:setText("❮");
    obj.label45:setHitTest(true);
    obj.label45:setHint("Furtividade");
    obj.label45:setCursor("handPoint");
    obj.label45:setName("label45");
    obj.label45:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setHeight(25);
    obj.label45:setFontSize(15);

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart54);
    obj.edit25:setField("grad07");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setHint("Furtividade");
    obj.edit25:setAlign("left");
    obj.edit25:setWidth(20);
    obj.edit25:setType("number");
    obj.edit25:setMin(1);
    obj.edit25:setMax(99);
    obj.edit25:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit25, "fontStyle",  "bold");
    obj.edit25:setName("edit25");
    obj.edit25:setFontColor("#573c27");
    obj.edit25:setHeight(25);
    obj.edit25:setFontSize(15);
    obj.edit25:setTransparent(true);

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart54);
    obj.label46:setFontColor("#a7754d");
    obj.label46:setAlign("left");
    obj.label46:setWidth(15);
    obj.label46:setHorzTextAlign("trailing");
    obj.label46:setText("❯");
    obj.label46:setHitTest(true);
    obj.label46:setCursor("handPoint");
    obj.label46:setHint("Furtividade");
    obj.label46:setName("label46");
    obj.label46:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label46, "fontStyle",  "bold");
    obj.label46:setHeight(25);
    obj.label46:setFontSize(15);

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.flowPart54);
    obj.dataLink32:setField("grad07");
    obj.dataLink32:setDefaultValue("2");
    obj.dataLink32:setName("dataLink32");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout10);
    obj.flowPart55:setMinWidth(200);
    obj.flowPart55:setHeight(25);
    obj.flowPart55:setName("flowPart55");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart55);
    obj.label47:setAlign("client");
    obj.label47:setText("Furtividade");
    obj.label47:setName("label47");
    obj.label47:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label47, "fontStyle",  "bold");
    obj.label47:setFontColor("black");
    obj.label47:setHeight(25);
    obj.label47:setFontSize(15);

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout10);
    obj.flowPart56:setMinWidth(400);
    obj.flowPart56:setHeight(25);
    obj.flowPart56:setMargins({left=10});
    obj.flowPart56:setName("flowPart56");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart56);
    obj.edit26:setField("spec07");
    obj.edit26:setAlign("client");
    lfm_setPropAsString(obj.edit26, "fontStyle",  "italic");
    obj.edit26:setName("edit26");
    obj.edit26:setFontFamily("Palatino Linotype");
    obj.edit26:setFontColor("#573c27");
    obj.edit26:setHeight(25);
    obj.edit26:setFontSize(15);
    obj.edit26:setTransparent(true);

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.flowPart56);
    obj.dataLink33:setField("spec07");
    obj.dataLink33:setDefaultValue("—");
    obj.dataLink33:setName("dataLink33");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout3);
    obj.flowPart57:setMinWidth(680);
    obj.flowPart57:setAlign("top");
    obj.flowPart57:setHeight(25);
    obj.flowPart57:setName("flowPart57");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowPart57);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setOrientation("horizontal");
    obj.flowLayout11:setMaxControlsPerLine(3);
    obj.flowLayout11:setName("flowLayout11");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout11);
    obj.flowPart58:setMinWidth(70);
    obj.flowPart58:setHeight(25);
    obj.flowPart58:setName("flowPart58");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart58);
    obj.label48:setFontColor("#a7754d");
    obj.label48:setAlign("left");
    obj.label48:setWidth(15);
    obj.label48:setText("❮");
    obj.label48:setHitTest(true);
    obj.label48:setHint("Guerra");
    obj.label48:setCursor("handPoint");
    obj.label48:setName("label48");
    obj.label48:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label48, "fontStyle",  "bold");
    obj.label48:setHeight(25);
    obj.label48:setFontSize(15);

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart58);
    obj.edit27:setField("grad08");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setHint("Guerra");
    obj.edit27:setAlign("left");
    obj.edit27:setWidth(20);
    obj.edit27:setType("number");
    obj.edit27:setMin(1);
    obj.edit27:setMax(99);
    obj.edit27:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit27, "fontStyle",  "bold");
    obj.edit27:setName("edit27");
    obj.edit27:setFontColor("#573c27");
    obj.edit27:setHeight(25);
    obj.edit27:setFontSize(15);
    obj.edit27:setTransparent(true);

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart58);
    obj.label49:setFontColor("#a7754d");
    obj.label49:setAlign("left");
    obj.label49:setWidth(15);
    obj.label49:setHorzTextAlign("trailing");
    obj.label49:setText("❯");
    obj.label49:setHitTest(true);
    obj.label49:setCursor("handPoint");
    obj.label49:setHint("Guerra");
    obj.label49:setName("label49");
    obj.label49:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label49, "fontStyle",  "bold");
    obj.label49:setHeight(25);
    obj.label49:setFontSize(15);

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.flowPart58);
    obj.dataLink34:setField("grad08");
    obj.dataLink34:setDefaultValue("2");
    obj.dataLink34:setName("dataLink34");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout11);
    obj.flowPart59:setMinWidth(200);
    obj.flowPart59:setHeight(25);
    obj.flowPart59:setName("flowPart59");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart59);
    obj.label50:setAlign("client");
    obj.label50:setText("Guerra");
    obj.label50:setName("label50");
    obj.label50:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label50, "fontStyle",  "bold");
    obj.label50:setFontColor("black");
    obj.label50:setHeight(25);
    obj.label50:setFontSize(15);

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout11);
    obj.flowPart60:setMinWidth(400);
    obj.flowPart60:setHeight(25);
    obj.flowPart60:setMargins({left=10});
    obj.flowPart60:setName("flowPart60");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart60);
    obj.edit28:setField("spec08");
    obj.edit28:setAlign("client");
    lfm_setPropAsString(obj.edit28, "fontStyle",  "italic");
    obj.edit28:setName("edit28");
    obj.edit28:setFontFamily("Palatino Linotype");
    obj.edit28:setFontColor("#573c27");
    obj.edit28:setHeight(25);
    obj.edit28:setFontSize(15);
    obj.edit28:setTransparent(true);

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.flowPart60);
    obj.dataLink35:setField("spec08");
    obj.dataLink35:setDefaultValue("—");
    obj.dataLink35:setName("dataLink35");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout3);
    obj.flowPart61:setMinWidth(680);
    obj.flowPart61:setAlign("top");
    obj.flowPart61:setHeight(25);
    obj.flowPart61:setName("flowPart61");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.flowPart61);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setOrientation("horizontal");
    obj.flowLayout12:setMaxControlsPerLine(3);
    obj.flowLayout12:setName("flowLayout12");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout12);
    obj.flowPart62:setMinWidth(70);
    obj.flowPart62:setHeight(25);
    obj.flowPart62:setName("flowPart62");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart62);
    obj.label51:setFontColor("#a7754d");
    obj.label51:setAlign("left");
    obj.label51:setWidth(15);
    obj.label51:setText("❮");
    obj.label51:setHitTest(true);
    obj.label51:setHint("Idioma");
    obj.label51:setCursor("handPoint");
    obj.label51:setName("label51");
    obj.label51:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label51, "fontStyle",  "bold");
    obj.label51:setHeight(25);
    obj.label51:setFontSize(15);

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart62);
    obj.edit29:setField("grad09");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setHint("Idioma");
    obj.edit29:setAlign("left");
    obj.edit29:setWidth(20);
    obj.edit29:setType("number");
    obj.edit29:setMin(1);
    obj.edit29:setMax(99);
    obj.edit29:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit29, "fontStyle",  "bold");
    obj.edit29:setName("edit29");
    obj.edit29:setFontColor("#573c27");
    obj.edit29:setHeight(25);
    obj.edit29:setFontSize(15);
    obj.edit29:setTransparent(true);

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart62);
    obj.label52:setFontColor("#a7754d");
    obj.label52:setAlign("left");
    obj.label52:setWidth(15);
    obj.label52:setHorzTextAlign("trailing");
    obj.label52:setText("❯");
    obj.label52:setHitTest(true);
    obj.label52:setCursor("handPoint");
    obj.label52:setHint("Idioma");
    obj.label52:setName("label52");
    obj.label52:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label52, "fontStyle",  "bold");
    obj.label52:setHeight(25);
    obj.label52:setFontSize(15);

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.flowPart62);
    obj.dataLink36:setField("grad09");
    obj.dataLink36:setDefaultValue("2");
    obj.dataLink36:setName("dataLink36");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout12);
    obj.flowPart63:setMinWidth(200);
    obj.flowPart63:setHeight(25);
    obj.flowPart63:setName("flowPart63");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart63);
    obj.label53:setAlign("client");
    obj.label53:setText("Idioma");
    obj.label53:setName("label53");
    obj.label53:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label53, "fontStyle",  "bold");
    obj.label53:setFontColor("black");
    obj.label53:setHeight(25);
    obj.label53:setFontSize(15);

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout12);
    obj.flowPart64:setMinWidth(400);
    obj.flowPart64:setHeight(25);
    obj.flowPart64:setMargins({left=10});
    obj.flowPart64:setName("flowPart64");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart64);
    obj.edit30:setField("spec09");
    obj.edit30:setAlign("client");
    lfm_setPropAsString(obj.edit30, "fontStyle",  "italic");
    obj.edit30:setName("edit30");
    obj.edit30:setFontFamily("Palatino Linotype");
    obj.edit30:setFontColor("#573c27");
    obj.edit30:setHeight(25);
    obj.edit30:setFontSize(15);
    obj.edit30:setTransparent(true);

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.flowPart64);
    obj.dataLink37:setField("spec09");
    obj.dataLink37:setDefaultValue("—");
    obj.dataLink37:setName("dataLink37");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout3);
    obj.flowPart65:setMinWidth(680);
    obj.flowPart65:setAlign("top");
    obj.flowPart65:setHeight(25);
    obj.flowPart65:setName("flowPart65");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowPart65);
    obj.flowLayout13:setAlign("top");
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setHorzAlign("center");
    obj.flowLayout13:setOrientation("horizontal");
    obj.flowLayout13:setMaxControlsPerLine(3);
    obj.flowLayout13:setName("flowLayout13");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout13);
    obj.flowPart66:setMinWidth(70);
    obj.flowPart66:setHeight(25);
    obj.flowPart66:setName("flowPart66");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart66);
    obj.label54:setFontColor("#a7754d");
    obj.label54:setAlign("left");
    obj.label54:setWidth(15);
    obj.label54:setText("❮");
    obj.label54:setHitTest(true);
    obj.label54:setHint("Ladinagem");
    obj.label54:setCursor("handPoint");
    obj.label54:setName("label54");
    obj.label54:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label54, "fontStyle",  "bold");
    obj.label54:setHeight(25);
    obj.label54:setFontSize(15);

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart66);
    obj.edit31:setField("grad10");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setHint("Ladinagem");
    obj.edit31:setAlign("left");
    obj.edit31:setWidth(20);
    obj.edit31:setType("number");
    obj.edit31:setMin(1);
    obj.edit31:setMax(99);
    obj.edit31:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit31, "fontStyle",  "bold");
    obj.edit31:setName("edit31");
    obj.edit31:setFontColor("#573c27");
    obj.edit31:setHeight(25);
    obj.edit31:setFontSize(15);
    obj.edit31:setTransparent(true);

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart66);
    obj.label55:setFontColor("#a7754d");
    obj.label55:setAlign("left");
    obj.label55:setWidth(15);
    obj.label55:setHorzTextAlign("trailing");
    obj.label55:setText("❯");
    obj.label55:setHitTest(true);
    obj.label55:setCursor("handPoint");
    obj.label55:setHint("Ladinagem");
    obj.label55:setName("label55");
    obj.label55:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label55, "fontStyle",  "bold");
    obj.label55:setHeight(25);
    obj.label55:setFontSize(15);

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.flowPart66);
    obj.dataLink38:setField("grad10");
    obj.dataLink38:setDefaultValue("2");
    obj.dataLink38:setName("dataLink38");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout13);
    obj.flowPart67:setMinWidth(200);
    obj.flowPart67:setHeight(25);
    obj.flowPart67:setName("flowPart67");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart67);
    obj.label56:setAlign("client");
    obj.label56:setText("Ladinagem");
    obj.label56:setName("label56");
    obj.label56:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label56, "fontStyle",  "bold");
    obj.label56:setFontColor("black");
    obj.label56:setHeight(25);
    obj.label56:setFontSize(15);

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout13);
    obj.flowPart68:setMinWidth(400);
    obj.flowPart68:setHeight(25);
    obj.flowPart68:setMargins({left=10});
    obj.flowPart68:setName("flowPart68");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart68);
    obj.edit32:setField("spec10");
    obj.edit32:setAlign("client");
    lfm_setPropAsString(obj.edit32, "fontStyle",  "italic");
    obj.edit32:setName("edit32");
    obj.edit32:setFontFamily("Palatino Linotype");
    obj.edit32:setFontColor("#573c27");
    obj.edit32:setHeight(25);
    obj.edit32:setFontSize(15);
    obj.edit32:setTransparent(true);

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.flowPart68);
    obj.dataLink39:setField("spec10");
    obj.dataLink39:setDefaultValue("—");
    obj.dataLink39:setName("dataLink39");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout3);
    obj.flowPart69:setMinWidth(680);
    obj.flowPart69:setAlign("top");
    obj.flowPart69:setHeight(25);
    obj.flowPart69:setName("flowPart69");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.flowPart69);
    obj.flowLayout14:setAlign("top");
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setOrientation("horizontal");
    obj.flowLayout14:setMaxControlsPerLine(3);
    obj.flowLayout14:setName("flowLayout14");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout14);
    obj.flowPart70:setMinWidth(70);
    obj.flowPart70:setHeight(25);
    obj.flowPart70:setName("flowPart70");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart70);
    obj.label57:setFontColor("#a7754d");
    obj.label57:setAlign("left");
    obj.label57:setWidth(15);
    obj.label57:setText("❮");
    obj.label57:setHitTest(true);
    obj.label57:setHint("Lidar com Animais");
    obj.label57:setCursor("handPoint");
    obj.label57:setName("label57");
    obj.label57:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setHeight(25);
    obj.label57:setFontSize(15);

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart70);
    obj.edit33:setField("grad11");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setHint("Lidar com Animais");
    obj.edit33:setAlign("left");
    obj.edit33:setWidth(20);
    obj.edit33:setType("number");
    obj.edit33:setMin(1);
    obj.edit33:setMax(99);
    obj.edit33:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit33, "fontStyle",  "bold");
    obj.edit33:setName("edit33");
    obj.edit33:setFontColor("#573c27");
    obj.edit33:setHeight(25);
    obj.edit33:setFontSize(15);
    obj.edit33:setTransparent(true);

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart70);
    obj.label58:setFontColor("#a7754d");
    obj.label58:setAlign("left");
    obj.label58:setWidth(15);
    obj.label58:setHorzTextAlign("trailing");
    obj.label58:setText("❯");
    obj.label58:setHitTest(true);
    obj.label58:setCursor("handPoint");
    obj.label58:setHint("Lidar com Animais");
    obj.label58:setName("label58");
    obj.label58:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label58, "fontStyle",  "bold");
    obj.label58:setHeight(25);
    obj.label58:setFontSize(15);

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.flowPart70);
    obj.dataLink40:setField("grad11");
    obj.dataLink40:setDefaultValue("2");
    obj.dataLink40:setName("dataLink40");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout14);
    obj.flowPart71:setMinWidth(200);
    obj.flowPart71:setHeight(25);
    obj.flowPart71:setName("flowPart71");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart71);
    obj.label59:setAlign("client");
    obj.label59:setText("Lidar com Animais");
    obj.label59:setName("label59");
    obj.label59:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label59, "fontStyle",  "bold");
    obj.label59:setFontColor("black");
    obj.label59:setHeight(25);
    obj.label59:setFontSize(15);

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout14);
    obj.flowPart72:setMinWidth(400);
    obj.flowPart72:setHeight(25);
    obj.flowPart72:setMargins({left=10});
    obj.flowPart72:setName("flowPart72");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart72);
    obj.edit34:setField("spec11");
    obj.edit34:setAlign("client");
    lfm_setPropAsString(obj.edit34, "fontStyle",  "italic");
    obj.edit34:setName("edit34");
    obj.edit34:setFontFamily("Palatino Linotype");
    obj.edit34:setFontColor("#573c27");
    obj.edit34:setHeight(25);
    obj.edit34:setFontSize(15);
    obj.edit34:setTransparent(true);

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.flowPart72);
    obj.dataLink41:setField("spec11");
    obj.dataLink41:setDefaultValue("—");
    obj.dataLink41:setName("dataLink41");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout3);
    obj.flowPart73:setMinWidth(680);
    obj.flowPart73:setAlign("top");
    obj.flowPart73:setHeight(25);
    obj.flowPart73:setName("flowPart73");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.flowPart73);
    obj.flowLayout15:setAlign("top");
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setHorzAlign("center");
    obj.flowLayout15:setOrientation("horizontal");
    obj.flowLayout15:setMaxControlsPerLine(3);
    obj.flowLayout15:setName("flowLayout15");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout15);
    obj.flowPart74:setMinWidth(70);
    obj.flowPart74:setHeight(25);
    obj.flowPart74:setName("flowPart74");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart74);
    obj.label60:setFontColor("#a7754d");
    obj.label60:setAlign("left");
    obj.label60:setWidth(15);
    obj.label60:setText("❮");
    obj.label60:setHitTest(true);
    obj.label60:setHint("Luta");
    obj.label60:setCursor("handPoint");
    obj.label60:setName("label60");
    obj.label60:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label60, "fontStyle",  "bold");
    obj.label60:setHeight(25);
    obj.label60:setFontSize(15);

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart74);
    obj.edit35:setField("grad12");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setHint("Luta");
    obj.edit35:setAlign("left");
    obj.edit35:setWidth(20);
    obj.edit35:setType("number");
    obj.edit35:setMin(1);
    obj.edit35:setMax(99);
    obj.edit35:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit35, "fontStyle",  "bold");
    obj.edit35:setName("edit35");
    obj.edit35:setFontColor("#573c27");
    obj.edit35:setHeight(25);
    obj.edit35:setFontSize(15);
    obj.edit35:setTransparent(true);

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart74);
    obj.label61:setFontColor("#a7754d");
    obj.label61:setAlign("left");
    obj.label61:setWidth(15);
    obj.label61:setHorzTextAlign("trailing");
    obj.label61:setText("❯");
    obj.label61:setHitTest(true);
    obj.label61:setCursor("handPoint");
    obj.label61:setHint("Luta");
    obj.label61:setName("label61");
    obj.label61:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label61, "fontStyle",  "bold");
    obj.label61:setHeight(25);
    obj.label61:setFontSize(15);

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.flowPart74);
    obj.dataLink42:setField("grad12");
    obj.dataLink42:setDefaultValue("2");
    obj.dataLink42:setName("dataLink42");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout15);
    obj.flowPart75:setMinWidth(200);
    obj.flowPart75:setHeight(25);
    obj.flowPart75:setName("flowPart75");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart75);
    obj.label62:setAlign("client");
    obj.label62:setText("Luta");
    obj.label62:setName("label62");
    obj.label62:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label62, "fontStyle",  "bold");
    obj.label62:setFontColor("black");
    obj.label62:setHeight(25);
    obj.label62:setFontSize(15);

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout15);
    obj.flowPart76:setMinWidth(400);
    obj.flowPart76:setHeight(25);
    obj.flowPart76:setMargins({left=10});
    obj.flowPart76:setName("flowPart76");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart76);
    obj.edit36:setField("spec12");
    obj.edit36:setAlign("client");
    lfm_setPropAsString(obj.edit36, "fontStyle",  "italic");
    obj.edit36:setName("edit36");
    obj.edit36:setFontFamily("Palatino Linotype");
    obj.edit36:setFontColor("#573c27");
    obj.edit36:setHeight(25);
    obj.edit36:setFontSize(15);
    obj.edit36:setTransparent(true);

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.flowPart76);
    obj.dataLink43:setField("spec12");
    obj.dataLink43:setDefaultValue("—");
    obj.dataLink43:setName("dataLink43");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout3);
    obj.flowPart77:setMinWidth(680);
    obj.flowPart77:setAlign("top");
    obj.flowPart77:setHeight(25);
    obj.flowPart77:setName("flowPart77");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.flowPart77);
    obj.flowLayout16:setAlign("top");
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setHorzAlign("center");
    obj.flowLayout16:setOrientation("horizontal");
    obj.flowLayout16:setMaxControlsPerLine(3);
    obj.flowLayout16:setName("flowLayout16");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout16);
    obj.flowPart78:setMinWidth(70);
    obj.flowPart78:setHeight(25);
    obj.flowPart78:setName("flowPart78");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart78);
    obj.label63:setFontColor("#a7754d");
    obj.label63:setAlign("left");
    obj.label63:setWidth(15);
    obj.label63:setText("❮");
    obj.label63:setHitTest(true);
    obj.label63:setHint("Percepção");
    obj.label63:setCursor("handPoint");
    obj.label63:setName("label63");
    obj.label63:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label63, "fontStyle",  "bold");
    obj.label63:setHeight(25);
    obj.label63:setFontSize(15);

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart78);
    obj.edit37:setField("grad13");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setHint("Percepção");
    obj.edit37:setAlign("left");
    obj.edit37:setWidth(20);
    obj.edit37:setType("number");
    obj.edit37:setMin(1);
    obj.edit37:setMax(99);
    obj.edit37:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit37, "fontStyle",  "bold");
    obj.edit37:setName("edit37");
    obj.edit37:setFontColor("#573c27");
    obj.edit37:setHeight(25);
    obj.edit37:setFontSize(15);
    obj.edit37:setTransparent(true);

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart78);
    obj.label64:setFontColor("#a7754d");
    obj.label64:setAlign("left");
    obj.label64:setWidth(15);
    obj.label64:setHorzTextAlign("trailing");
    obj.label64:setText("❯");
    obj.label64:setHitTest(true);
    obj.label64:setCursor("handPoint");
    obj.label64:setHint("Percepção");
    obj.label64:setName("label64");
    obj.label64:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label64, "fontStyle",  "bold");
    obj.label64:setHeight(25);
    obj.label64:setFontSize(15);

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.flowPart78);
    obj.dataLink44:setField("grad13");
    obj.dataLink44:setDefaultValue("2");
    obj.dataLink44:setName("dataLink44");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout16);
    obj.flowPart79:setMinWidth(200);
    obj.flowPart79:setHeight(25);
    obj.flowPart79:setName("flowPart79");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart79);
    obj.label65:setAlign("client");
    obj.label65:setText("Percepção");
    obj.label65:setName("label65");
    obj.label65:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label65, "fontStyle",  "bold");
    obj.label65:setFontColor("black");
    obj.label65:setHeight(25);
    obj.label65:setFontSize(15);

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout16);
    obj.flowPart80:setMinWidth(400);
    obj.flowPart80:setHeight(25);
    obj.flowPart80:setMargins({left=10});
    obj.flowPart80:setName("flowPart80");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart80);
    obj.edit38:setField("spec13");
    obj.edit38:setAlign("client");
    lfm_setPropAsString(obj.edit38, "fontStyle",  "italic");
    obj.edit38:setName("edit38");
    obj.edit38:setFontFamily("Palatino Linotype");
    obj.edit38:setFontColor("#573c27");
    obj.edit38:setHeight(25);
    obj.edit38:setFontSize(15);
    obj.edit38:setTransparent(true);

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.flowPart80);
    obj.dataLink45:setField("spec13");
    obj.dataLink45:setDefaultValue("—");
    obj.dataLink45:setName("dataLink45");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout3);
    obj.flowPart81:setMinWidth(680);
    obj.flowPart81:setAlign("top");
    obj.flowPart81:setHeight(25);
    obj.flowPart81:setName("flowPart81");

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowPart81);
    obj.flowLayout17:setAlign("top");
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setHorzAlign("center");
    obj.flowLayout17:setOrientation("horizontal");
    obj.flowLayout17:setMaxControlsPerLine(3);
    obj.flowLayout17:setName("flowLayout17");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout17);
    obj.flowPart82:setMinWidth(70);
    obj.flowPart82:setHeight(25);
    obj.flowPart82:setName("flowPart82");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart82);
    obj.label66:setFontColor("#a7754d");
    obj.label66:setAlign("left");
    obj.label66:setWidth(15);
    obj.label66:setText("❮");
    obj.label66:setHitTest(true);
    obj.label66:setHint("Persuasão");
    obj.label66:setCursor("handPoint");
    obj.label66:setName("label66");
    obj.label66:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label66, "fontStyle",  "bold");
    obj.label66:setHeight(25);
    obj.label66:setFontSize(15);

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart82);
    obj.edit39:setField("grad14");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setHint("Persuasão");
    obj.edit39:setAlign("left");
    obj.edit39:setWidth(20);
    obj.edit39:setType("number");
    obj.edit39:setMin(1);
    obj.edit39:setMax(99);
    obj.edit39:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit39, "fontStyle",  "bold");
    obj.edit39:setName("edit39");
    obj.edit39:setFontColor("#573c27");
    obj.edit39:setHeight(25);
    obj.edit39:setFontSize(15);
    obj.edit39:setTransparent(true);

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart82);
    obj.label67:setFontColor("#a7754d");
    obj.label67:setAlign("left");
    obj.label67:setWidth(15);
    obj.label67:setHorzTextAlign("trailing");
    obj.label67:setText("❯");
    obj.label67:setHitTest(true);
    obj.label67:setCursor("handPoint");
    obj.label67:setHint("Persuasão");
    obj.label67:setName("label67");
    obj.label67:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label67, "fontStyle",  "bold");
    obj.label67:setHeight(25);
    obj.label67:setFontSize(15);

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.flowPart82);
    obj.dataLink46:setField("grad14");
    obj.dataLink46:setDefaultValue("2");
    obj.dataLink46:setName("dataLink46");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout17);
    obj.flowPart83:setMinWidth(200);
    obj.flowPart83:setHeight(25);
    obj.flowPart83:setName("flowPart83");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart83);
    obj.label68:setAlign("client");
    obj.label68:setText("Persuasão");
    obj.label68:setName("label68");
    obj.label68:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setFontColor("black");
    obj.label68:setHeight(25);
    obj.label68:setFontSize(15);

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout17);
    obj.flowPart84:setMinWidth(400);
    obj.flowPart84:setHeight(25);
    obj.flowPart84:setMargins({left=10});
    obj.flowPart84:setName("flowPart84");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart84);
    obj.edit40:setField("spec14");
    obj.edit40:setAlign("client");
    lfm_setPropAsString(obj.edit40, "fontStyle",  "italic");
    obj.edit40:setName("edit40");
    obj.edit40:setFontFamily("Palatino Linotype");
    obj.edit40:setFontColor("#573c27");
    obj.edit40:setHeight(25);
    obj.edit40:setFontSize(15);
    obj.edit40:setTransparent(true);

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.flowPart84);
    obj.dataLink47:setField("spec14");
    obj.dataLink47:setDefaultValue("—");
    obj.dataLink47:setName("dataLink47");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout3);
    obj.flowPart85:setMinWidth(680);
    obj.flowPart85:setAlign("top");
    obj.flowPart85:setHeight(25);
    obj.flowPart85:setName("flowPart85");

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowPart85);
    obj.flowLayout18:setAlign("top");
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setHorzAlign("center");
    obj.flowLayout18:setOrientation("horizontal");
    obj.flowLayout18:setMaxControlsPerLine(3);
    obj.flowLayout18:setName("flowLayout18");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout18);
    obj.flowPart86:setMinWidth(70);
    obj.flowPart86:setHeight(25);
    obj.flowPart86:setName("flowPart86");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart86);
    obj.label69:setFontColor("#a7754d");
    obj.label69:setAlign("left");
    obj.label69:setWidth(15);
    obj.label69:setText("❮");
    obj.label69:setHitTest(true);
    obj.label69:setHint("Pontaria");
    obj.label69:setCursor("handPoint");
    obj.label69:setName("label69");
    obj.label69:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label69, "fontStyle",  "bold");
    obj.label69:setHeight(25);
    obj.label69:setFontSize(15);

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart86);
    obj.edit41:setField("grad15");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setHint("Pontaria");
    obj.edit41:setAlign("left");
    obj.edit41:setWidth(20);
    obj.edit41:setType("number");
    obj.edit41:setMin(1);
    obj.edit41:setMax(99);
    obj.edit41:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit41, "fontStyle",  "bold");
    obj.edit41:setName("edit41");
    obj.edit41:setFontColor("#573c27");
    obj.edit41:setHeight(25);
    obj.edit41:setFontSize(15);
    obj.edit41:setTransparent(true);

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart86);
    obj.label70:setFontColor("#a7754d");
    obj.label70:setAlign("left");
    obj.label70:setWidth(15);
    obj.label70:setHorzTextAlign("trailing");
    obj.label70:setText("❯");
    obj.label70:setHitTest(true);
    obj.label70:setCursor("handPoint");
    obj.label70:setHint("Pontaria");
    obj.label70:setName("label70");
    obj.label70:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label70, "fontStyle",  "bold");
    obj.label70:setHeight(25);
    obj.label70:setFontSize(15);

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.flowPart86);
    obj.dataLink48:setField("grad15");
    obj.dataLink48:setDefaultValue("2");
    obj.dataLink48:setName("dataLink48");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout18);
    obj.flowPart87:setMinWidth(200);
    obj.flowPart87:setHeight(25);
    obj.flowPart87:setName("flowPart87");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart87);
    obj.label71:setAlign("client");
    obj.label71:setText("Pontaria");
    obj.label71:setName("label71");
    obj.label71:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label71, "fontStyle",  "bold");
    obj.label71:setFontColor("black");
    obj.label71:setHeight(25);
    obj.label71:setFontSize(15);

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout18);
    obj.flowPart88:setMinWidth(400);
    obj.flowPart88:setHeight(25);
    obj.flowPart88:setMargins({left=10});
    obj.flowPart88:setName("flowPart88");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart88);
    obj.edit42:setField("spec15");
    obj.edit42:setAlign("client");
    lfm_setPropAsString(obj.edit42, "fontStyle",  "italic");
    obj.edit42:setName("edit42");
    obj.edit42:setFontFamily("Palatino Linotype");
    obj.edit42:setFontColor("#573c27");
    obj.edit42:setHeight(25);
    obj.edit42:setFontSize(15);
    obj.edit42:setTransparent(true);

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.flowPart88);
    obj.dataLink49:setField("spec15");
    obj.dataLink49:setDefaultValue("—");
    obj.dataLink49:setName("dataLink49");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout3);
    obj.flowPart89:setMinWidth(680);
    obj.flowPart89:setAlign("top");
    obj.flowPart89:setHeight(25);
    obj.flowPart89:setName("flowPart89");

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.flowPart89);
    obj.flowLayout19:setAlign("top");
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setHorzAlign("center");
    obj.flowLayout19:setOrientation("horizontal");
    obj.flowLayout19:setMaxControlsPerLine(3);
    obj.flowLayout19:setName("flowLayout19");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout19);
    obj.flowPart90:setMinWidth(70);
    obj.flowPart90:setHeight(25);
    obj.flowPart90:setName("flowPart90");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowPart90);
    obj.label72:setFontColor("#a7754d");
    obj.label72:setAlign("left");
    obj.label72:setWidth(15);
    obj.label72:setText("❮");
    obj.label72:setHitTest(true);
    obj.label72:setHint("Sobrevivência");
    obj.label72:setCursor("handPoint");
    obj.label72:setName("label72");
    obj.label72:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label72, "fontStyle",  "bold");
    obj.label72:setHeight(25);
    obj.label72:setFontSize(15);

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart90);
    obj.edit43:setField("grad16");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setHint("Sobrevivência");
    obj.edit43:setAlign("left");
    obj.edit43:setWidth(20);
    obj.edit43:setType("number");
    obj.edit43:setMin(1);
    obj.edit43:setMax(99);
    obj.edit43:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit43, "fontStyle",  "bold");
    obj.edit43:setName("edit43");
    obj.edit43:setFontColor("#573c27");
    obj.edit43:setHeight(25);
    obj.edit43:setFontSize(15);
    obj.edit43:setTransparent(true);

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowPart90);
    obj.label73:setFontColor("#a7754d");
    obj.label73:setAlign("left");
    obj.label73:setWidth(15);
    obj.label73:setHorzTextAlign("trailing");
    obj.label73:setText("❯");
    obj.label73:setHitTest(true);
    obj.label73:setCursor("handPoint");
    obj.label73:setHint("Sobrevivência");
    obj.label73:setName("label73");
    obj.label73:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label73, "fontStyle",  "bold");
    obj.label73:setHeight(25);
    obj.label73:setFontSize(15);

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.flowPart90);
    obj.dataLink50:setField("grad16");
    obj.dataLink50:setDefaultValue("2");
    obj.dataLink50:setName("dataLink50");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout19);
    obj.flowPart91:setMinWidth(200);
    obj.flowPart91:setHeight(25);
    obj.flowPart91:setName("flowPart91");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.flowPart91);
    obj.label74:setAlign("client");
    obj.label74:setText("Sobrevivência");
    obj.label74:setName("label74");
    obj.label74:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label74, "fontStyle",  "bold");
    obj.label74:setFontColor("black");
    obj.label74:setHeight(25);
    obj.label74:setFontSize(15);

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout19);
    obj.flowPart92:setMinWidth(400);
    obj.flowPart92:setHeight(25);
    obj.flowPart92:setMargins({left=10});
    obj.flowPart92:setName("flowPart92");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart92);
    obj.edit44:setField("spec16");
    obj.edit44:setAlign("client");
    lfm_setPropAsString(obj.edit44, "fontStyle",  "italic");
    obj.edit44:setName("edit44");
    obj.edit44:setFontFamily("Palatino Linotype");
    obj.edit44:setFontColor("#573c27");
    obj.edit44:setHeight(25);
    obj.edit44:setFontSize(15);
    obj.edit44:setTransparent(true);

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.flowPart92);
    obj.dataLink51:setField("spec16");
    obj.dataLink51:setDefaultValue("—");
    obj.dataLink51:setName("dataLink51");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout3);
    obj.flowPart93:setMinWidth(680);
    obj.flowPart93:setAlign("top");
    obj.flowPart93:setHeight(25);
    obj.flowPart93:setName("flowPart93");

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowPart93);
    obj.flowLayout20:setAlign("top");
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setHorzAlign("center");
    obj.flowLayout20:setOrientation("horizontal");
    obj.flowLayout20:setMaxControlsPerLine(3);
    obj.flowLayout20:setName("flowLayout20");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout20);
    obj.flowPart94:setMinWidth(70);
    obj.flowPart94:setHeight(25);
    obj.flowPart94:setName("flowPart94");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowPart94);
    obj.label75:setFontColor("#a7754d");
    obj.label75:setAlign("left");
    obj.label75:setWidth(15);
    obj.label75:setText("❮");
    obj.label75:setHitTest(true);
    obj.label75:setHint("Status");
    obj.label75:setCursor("handPoint");
    obj.label75:setName("label75");
    obj.label75:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label75, "fontStyle",  "bold");
    obj.label75:setHeight(25);
    obj.label75:setFontSize(15);

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart94);
    obj.edit45:setField("grad17");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setHint("Status");
    obj.edit45:setAlign("left");
    obj.edit45:setWidth(20);
    obj.edit45:setType("number");
    obj.edit45:setMin(1);
    obj.edit45:setMax(99);
    obj.edit45:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit45, "fontStyle",  "bold");
    obj.edit45:setName("edit45");
    obj.edit45:setFontColor("#573c27");
    obj.edit45:setHeight(25);
    obj.edit45:setFontSize(15);
    obj.edit45:setTransparent(true);

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowPart94);
    obj.label76:setFontColor("#a7754d");
    obj.label76:setAlign("left");
    obj.label76:setWidth(15);
    obj.label76:setHorzTextAlign("trailing");
    obj.label76:setText("❯");
    obj.label76:setHitTest(true);
    obj.label76:setCursor("handPoint");
    obj.label76:setHint("Status");
    obj.label76:setName("label76");
    obj.label76:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label76, "fontStyle",  "bold");
    obj.label76:setHeight(25);
    obj.label76:setFontSize(15);

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.flowPart94);
    obj.dataLink52:setField("grad17");
    obj.dataLink52:setDefaultValue("2");
    obj.dataLink52:setName("dataLink52");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout20);
    obj.flowPart95:setMinWidth(200);
    obj.flowPart95:setHeight(25);
    obj.flowPart95:setName("flowPart95");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart95);
    obj.label77:setAlign("client");
    obj.label77:setText("Status");
    obj.label77:setName("label77");
    obj.label77:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label77, "fontStyle",  "bold");
    obj.label77:setFontColor("black");
    obj.label77:setHeight(25);
    obj.label77:setFontSize(15);

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout20);
    obj.flowPart96:setMinWidth(400);
    obj.flowPart96:setHeight(25);
    obj.flowPart96:setMargins({left=10});
    obj.flowPart96:setName("flowPart96");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart96);
    obj.edit46:setField("spec17");
    obj.edit46:setAlign("client");
    lfm_setPropAsString(obj.edit46, "fontStyle",  "italic");
    obj.edit46:setName("edit46");
    obj.edit46:setFontFamily("Palatino Linotype");
    obj.edit46:setFontColor("#573c27");
    obj.edit46:setHeight(25);
    obj.edit46:setFontSize(15);
    obj.edit46:setTransparent(true);

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.flowPart96);
    obj.dataLink53:setField("spec17");
    obj.dataLink53:setDefaultValue("—");
    obj.dataLink53:setName("dataLink53");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout3);
    obj.flowPart97:setMinWidth(680);
    obj.flowPart97:setAlign("top");
    obj.flowPart97:setHeight(25);
    obj.flowPart97:setName("flowPart97");

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.flowPart97);
    obj.flowLayout21:setAlign("top");
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setHorzAlign("center");
    obj.flowLayout21:setOrientation("horizontal");
    obj.flowLayout21:setMaxControlsPerLine(3);
    obj.flowLayout21:setName("flowLayout21");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout21);
    obj.flowPart98:setMinWidth(70);
    obj.flowPart98:setHeight(25);
    obj.flowPart98:setName("flowPart98");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.flowPart98);
    obj.label78:setFontColor("#a7754d");
    obj.label78:setAlign("left");
    obj.label78:setWidth(15);
    obj.label78:setText("❮");
    obj.label78:setHitTest(true);
    obj.label78:setHint("Vigor");
    obj.label78:setCursor("handPoint");
    obj.label78:setName("label78");
    obj.label78:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label78, "fontStyle",  "bold");
    obj.label78:setHeight(25);
    obj.label78:setFontSize(15);

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart98);
    obj.edit47:setField("grad18");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setHint("Vigor");
    obj.edit47:setAlign("left");
    obj.edit47:setWidth(20);
    obj.edit47:setType("number");
    obj.edit47:setMin(1);
    obj.edit47:setMax(99);
    obj.edit47:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit47, "fontStyle",  "bold");
    obj.edit47:setName("edit47");
    obj.edit47:setFontColor("#573c27");
    obj.edit47:setHeight(25);
    obj.edit47:setFontSize(15);
    obj.edit47:setTransparent(true);

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowPart98);
    obj.label79:setFontColor("#a7754d");
    obj.label79:setAlign("left");
    obj.label79:setWidth(15);
    obj.label79:setHorzTextAlign("trailing");
    obj.label79:setText("❯");
    obj.label79:setHitTest(true);
    obj.label79:setCursor("handPoint");
    obj.label79:setHint("Vigor");
    obj.label79:setName("label79");
    obj.label79:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label79, "fontStyle",  "bold");
    obj.label79:setHeight(25);
    obj.label79:setFontSize(15);

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.flowPart98);
    obj.dataLink54:setField("grad18");
    obj.dataLink54:setDefaultValue("2");
    obj.dataLink54:setName("dataLink54");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout21);
    obj.flowPart99:setMinWidth(200);
    obj.flowPart99:setHeight(25);
    obj.flowPart99:setName("flowPart99");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowPart99);
    obj.label80:setAlign("client");
    obj.label80:setText("Vigor");
    obj.label80:setName("label80");
    obj.label80:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label80, "fontStyle",  "bold");
    obj.label80:setFontColor("black");
    obj.label80:setHeight(25);
    obj.label80:setFontSize(15);

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout21);
    obj.flowPart100:setMinWidth(400);
    obj.flowPart100:setHeight(25);
    obj.flowPart100:setMargins({left=10});
    obj.flowPart100:setName("flowPart100");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart100);
    obj.edit48:setField("spec18");
    obj.edit48:setAlign("client");
    lfm_setPropAsString(obj.edit48, "fontStyle",  "italic");
    obj.edit48:setName("edit48");
    obj.edit48:setFontFamily("Palatino Linotype");
    obj.edit48:setFontColor("#573c27");
    obj.edit48:setHeight(25);
    obj.edit48:setFontSize(15);
    obj.edit48:setTransparent(true);

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.flowPart100);
    obj.dataLink55:setField("spec18");
    obj.dataLink55:setDefaultValue("—");
    obj.dataLink55:setName("dataLink55");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout3);
    obj.flowPart101:setMinWidth(680);
    obj.flowPart101:setAlign("top");
    obj.flowPart101:setHeight(25);
    obj.flowPart101:setName("flowPart101");

    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowPart101);
    obj.flowLayout22:setAlign("top");
    obj.flowLayout22:setAutoHeight(true);
    obj.flowLayout22:setHorzAlign("center");
    obj.flowLayout22:setOrientation("horizontal");
    obj.flowLayout22:setMaxControlsPerLine(3);
    obj.flowLayout22:setName("flowLayout22");

    obj.flowPart102 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart102:setParent(obj.flowLayout22);
    obj.flowPart102:setMinWidth(70);
    obj.flowPart102:setHeight(25);
    obj.flowPart102:setName("flowPart102");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart102);
    obj.label81:setFontColor("#a7754d");
    obj.label81:setAlign("left");
    obj.label81:setWidth(15);
    obj.label81:setText("❮");
    obj.label81:setHitTest(true);
    obj.label81:setHint("Vontade");
    obj.label81:setCursor("handPoint");
    obj.label81:setName("label81");
    obj.label81:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label81, "fontStyle",  "bold");
    obj.label81:setHeight(25);
    obj.label81:setFontSize(15);

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart102);
    obj.edit49:setField("grad19");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setHint("Vontade");
    obj.edit49:setAlign("left");
    obj.edit49:setWidth(20);
    obj.edit49:setType("number");
    obj.edit49:setMin(1);
    obj.edit49:setMax(99);
    obj.edit49:setFontFamily("Georgia");
    lfm_setPropAsString(obj.edit49, "fontStyle",  "bold");
    obj.edit49:setName("edit49");
    obj.edit49:setFontColor("#573c27");
    obj.edit49:setHeight(25);
    obj.edit49:setFontSize(15);
    obj.edit49:setTransparent(true);

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowPart102);
    obj.label82:setFontColor("#a7754d");
    obj.label82:setAlign("left");
    obj.label82:setWidth(15);
    obj.label82:setHorzTextAlign("trailing");
    obj.label82:setText("❯");
    obj.label82:setHitTest(true);
    obj.label82:setCursor("handPoint");
    obj.label82:setHint("Vontade");
    obj.label82:setName("label82");
    obj.label82:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label82, "fontStyle",  "bold");
    obj.label82:setHeight(25);
    obj.label82:setFontSize(15);

    obj.dataLink56 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.flowPart102);
    obj.dataLink56:setField("grad19");
    obj.dataLink56:setDefaultValue("2");
    obj.dataLink56:setName("dataLink56");

    obj.flowPart103 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart103:setParent(obj.flowLayout22);
    obj.flowPart103:setMinWidth(200);
    obj.flowPart103:setHeight(25);
    obj.flowPart103:setName("flowPart103");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart103);
    obj.label83:setAlign("client");
    obj.label83:setText("Vontade");
    obj.label83:setName("label83");
    obj.label83:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label83, "fontStyle",  "bold");
    obj.label83:setFontColor("black");
    obj.label83:setHeight(25);
    obj.label83:setFontSize(15);

    obj.flowPart104 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart104:setParent(obj.flowLayout22);
    obj.flowPart104:setMinWidth(400);
    obj.flowPart104:setHeight(25);
    obj.flowPart104:setMargins({left=10});
    obj.flowPart104:setName("flowPart104");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart104);
    obj.edit50:setField("spec19");
    obj.edit50:setAlign("client");
    lfm_setPropAsString(obj.edit50, "fontStyle",  "italic");
    obj.edit50:setName("edit50");
    obj.edit50:setFontFamily("Palatino Linotype");
    obj.edit50:setFontColor("#573c27");
    obj.edit50:setHeight(25);
    obj.edit50:setFontSize(15);
    obj.edit50:setTransparent(true);

    obj.dataLink57 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.flowPart104);
    obj.dataLink57:setField("spec19");
    obj.dataLink57:setDefaultValue("—");
    obj.dataLink57:setName("dataLink57");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout3);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.flowPart105 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart105:setParent(obj.flowLayout3);
    obj.flowPart105:setMinWidth(680);
    obj.flowPart105:setAlign("top");
    obj.flowPart105:setHeight(45);
    obj.flowPart105:setMargins({top=10});
    obj.flowPart105:setName("flowPart105");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart105);
    obj.horzLine2:setName("horzLine2");
    obj.horzLine2:setStrokeColor("#a7754d");
    obj.horzLine2:setAlign("top");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowPart105);
    obj.label84:setAlign("right");
    obj.label84:setHeight(35);
    obj.label84:setHorzTextAlign("trailing");
    obj.label84:setField("somaExp");
    obj.label84:setFontFamily("Georgia");
    obj.label84:setMargins({top=10});
    obj.label84:setFontColor("#573c27");
    obj.label84:setName("label84");
    lfm_setPropAsString(obj.label84, "fontStyle",  "bold");
    obj.label84:setFontSize(15);

    obj.dataLink58 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.flowPart105);
    obj.dataLink58:setField("somaExp");
    obj.dataLink58:setDefaultValue("EXP: 000");
    obj.dataLink58:setName("dataLink58");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.layFrente);
    obj.image9:setAlign("top");
    obj.image9:setURL("/images/divisor.png");
    obj.image9:setStyle("proportional");
    obj.image9:setHeight(30);
    obj.image9:setName("image9");

    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.layFrente);
    obj.flowLayout23:setHeight(615);
    obj.flowLayout23:setName("flowLayout23");
    obj.flowLayout23:setAlign("top");
    obj.flowLayout23:setHorzAlign("center");
    obj.flowLayout23:setOrientation("horizontal");
    obj.flowLayout23:setMaxControlsPerLine(1);
    obj.flowLayout23:setMargins({top=30, bottom=20});

    obj.flowPart106 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart106:setParent(obj.flowLayout23);
    obj.flowPart106:setMinWidth(680);
    obj.flowPart106:setAlign("top");
    obj.flowPart106:setHeight(45);
    obj.flowPart106:setName("flowPart106");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart106);
    obj.label85:setText("VANTAGENS");
    obj.label85:setFontSize(30);
    obj.label85:setAlign("top");
    obj.label85:setName("label85");
    obj.label85:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label85, "fontStyle",  "bold");
    obj.label85:setFontColor("black");
    obj.label85:setHeight(25);

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout23);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart107 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart107:setParent(obj.flowLayout23);
    obj.flowPart107:setMinWidth(680);
    obj.flowPart107:setAlign("top");
    obj.flowPart107:setHeight(35);
    obj.flowPart107:setName("flowPart107");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowPart107);
    obj.label86:setMargins({left=70});
    obj.label86:setText("NOME DA VANTAGEM");
    obj.label86:setFontColor("#a7754d");
    obj.label86:setAlign("left");
    obj.label86:setWidth(310);
    obj.label86:setName("label86");
    obj.label86:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label86, "fontStyle",  "bold");
    obj.label86:setHeight(25);
    obj.label86:setFontSize(15);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart107);
    obj.label87:setText("TIPO DE VANTAGEM");
    obj.label87:setFontColor("#a7754d");
    obj.label87:setAlign("left");
    obj.label87:setWidth(200);
    obj.label87:setName("label87");
    obj.label87:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label87, "fontStyle",  "bold");
    obj.label87:setHeight(25);
    obj.label87:setFontSize(15);

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout23);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.flowPart108 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart108:setParent(obj.flowLayout23);
    obj.flowPart108:setMinWidth(680);
    obj.flowPart108:setAlign("top");
    obj.flowPart108:setHeight(570);
    obj.flowPart108:setName("flowPart108");

    obj.rclVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclVantagens:setParent(obj.flowPart108);
    obj.rclVantagens:setWidth(680);
    obj.rclVantagens:setAlign("client");
    obj.rclVantagens:setMinQt(1);
    obj.rclVantagens:setLayout("vertical");
    obj.rclVantagens:setName("rclVantagens");
    obj.rclVantagens:setField("fldVantagens");
    obj.rclVantagens:setTemplateForm("vantagens");
    obj.rclVantagens:setHeight(570);

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.flowPart108);
    obj.layout4:setAlign("right");
    obj.layout4:setWidth(25);
    obj.layout4:setName("layout4");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout4);
    obj.button1:setHeight(25);
    obj.button1:setText("🞦");
    obj.button1:setWidth(25);
    obj.button1:setHint("Nova Vantagem");
    obj.button1:setName("button1");

    obj.layBG = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBG:setParent(obj.layout2);
    obj.layBG:setAlign("client");
    obj.layBG:setName("layBG");
    obj.layBG:setVisible(false);

    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.layBG);
    obj.flowLayout24:setHeight(645);
    obj.flowLayout24:setMaxControlsPerLine(3);
    obj.flowLayout24:setName("flowLayout24");
    obj.flowLayout24:setAlign("top");
    obj.flowLayout24:setHorzAlign("center");
    obj.flowLayout24:setOrientation("horizontal");
    obj.flowLayout24:setMargins({top=30, bottom=20});

    obj.flowPart109 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart109:setParent(obj.flowLayout24);
    obj.flowPart109:setMinWidth(335);
    obj.flowPart109:setAlign("top");
    obj.flowPart109:setHeight(45);
    obj.flowPart109:setMargins({right=5});
    obj.flowPart109:setName("flowPart109");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.flowPart109);
    obj.label88:setText("APARÊNCIA");
    obj.label88:setFontSize(30);
    obj.label88:setHeight(45);
    obj.label88:setAlign("top");
    obj.label88:setVertTextAlign("leading");
    obj.label88:setName("label88");
    obj.label88:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label88, "fontStyle",  "bold");
    obj.label88:setFontColor("black");

    obj.flowPart110 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart110:setParent(obj.flowLayout24);
    obj.flowPart110:setMinWidth(335);
    obj.flowPart110:setAlign("top");
    obj.flowPart110:setHeight(45);
    obj.flowPart110:setMargins({left=5});
    obj.flowPart110:setName("flowPart110");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.flowPart110);
    obj.label89:setText("HISTÓRIA");
    obj.label89:setFontSize(30);
    obj.label89:setHeight(45);
    obj.label89:setAlign("top");
    obj.label89:setVertTextAlign("leading");
    obj.label89:setName("label89");
    obj.label89:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label89, "fontStyle",  "bold");
    obj.label89:setFontColor("black");

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout24);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.flowPart111 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart111:setParent(obj.flowLayout24);
    obj.flowPart111:setMinWidth(400);
    obj.flowPart111:setHeight(600);
    obj.flowPart111:setMargins({right=5});
    obj.flowPart111:setName("flowPart111");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.flowPart111);
    obj.image10:setStyle("autoFit");
    obj.image10:setHeight(511);
    obj.image10:setWidth(325);
    obj.image10:setTop(40);
    obj.image10:setLeft(49);
    obj.image10:setEditable(true);
    obj.image10:setField("fldFotoPJ");
    obj.image10:setHint("Alterar Aparência");
    obj.image10:setName("image10");

    obj.dataLink59 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.flowPart111);
    obj.dataLink59:setField("fldFotoPJ");
    obj.dataLink59:setDefaultValue("/images/PJ.png");
    obj.dataLink59:setName("dataLink59");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.flowPart111);
    obj.image11:setWidth(400);
    obj.image11:setHeight(600);
    obj.image11:setURL("/images/framePic.png");
    obj.image11:setStyle("proportional");
    obj.image11:setTop(-20);
    obj.image11:setName("image11");

    obj.flowPart112 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart112:setParent(obj.flowLayout24);
    obj.flowPart112:setMinWidth(335);
    obj.flowPart112:setHeight(600);
    obj.flowPart112:setMargins({left=5});
    obj.flowPart112:setName("flowPart112");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowPart112);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("HistoriaPJ");
    obj.textEditor1:setMargins({top=10, bottom=30});
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setFontFamily("Palatino Linotype");
    obj.textEditor1:setFontColor("#573c27");
    obj.textEditor1:setFontSize(14);
    obj.textEditor1:setTransparent(true);

    obj.dataLink60 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.flowPart112);
    obj.dataLink60:setField("HistoriaPJ");
    obj.dataLink60:setDefaultValue("Escreva aqui.");
    obj.dataLink60:setName("dataLink60");

    obj.flowPart113 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart113:setParent(obj.flowLayout24);
    obj.flowPart113:setMinWidth(70);
    obj.flowPart113:setHeight(503);
    obj.flowPart113:setName("flowPart113");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.layBG);
    obj.image12:setAlign("top");
    obj.image12:setURL("/images/divisor.png");
    obj.image12:setStyle("proportional");
    obj.image12:setHeight(30);
    obj.image12:setName("image12");

    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.layBG);
    obj.flowLayout25:setHeight(695);
    obj.flowLayout25:setName("flowLayout25");
    obj.flowLayout25:setAlign("top");
    obj.flowLayout25:setHorzAlign("center");
    obj.flowLayout25:setOrientation("horizontal");
    obj.flowLayout25:setMaxControlsPerLine(1);
    obj.flowLayout25:setMargins({top=30, bottom=20});

    obj.flowPart114 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart114:setParent(obj.flowLayout25);
    obj.flowPart114:setMinWidth(680);
    obj.flowPart114:setAlign("top");
    obj.flowPart114:setHeight(45);
    obj.flowPart114:setName("flowPart114");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.flowPart114);
    obj.label90:setText("EQUIPAMENTOS");
    obj.label90:setFontSize(30);
    obj.label90:setAlign("top");
    obj.label90:setName("label90");
    obj.label90:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label90, "fontStyle",  "bold");
    obj.label90:setFontColor("black");
    obj.label90:setHeight(25);

    obj.flowLineBreak12 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout25);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.flowPart115 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart115:setParent(obj.flowLayout25);
    obj.flowPart115:setMinWidth(680);
    obj.flowPart115:setAlign("top");
    obj.flowPart115:setHeight(25);
    obj.flowPart115:setName("flowPart115");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.flowPart115);
    obj.label91:setAlign("left");
    obj.label91:setText("DINHEIRO:");
    obj.label91:setWidth(90);
    obj.label91:setName("label91");
    obj.label91:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label91, "fontStyle",  "bold");
    obj.label91:setFontColor("black");
    obj.label91:setHeight(25);
    obj.label91:setFontSize(15);

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart115);
    obj.edit51:setField("Dinheiro");
    obj.edit51:setAlign("client");
    obj.edit51:setName("edit51");
    obj.edit51:setFontFamily("Palatino Linotype");
    obj.edit51:setFontColor("#573c27");
    obj.edit51:setHeight(25);
    obj.edit51:setFontSize(15);
    obj.edit51:setTransparent(true);

    obj.dataLink61 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.flowPart115);
    obj.dataLink61:setField("Dinheiro");
    obj.dataLink61:setDefaultValue("—");
    obj.dataLink61:setName("dataLink61");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.flowPart115);
    obj.layout5:setAlign("right");
    obj.layout5:setWidth(25);
    obj.layout5:setName("layout5");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout5);
    obj.button2:setHeight(25);
    obj.button2:setText("🞦");
    obj.button2:setWidth(25);
    obj.button2:setHint("Novo Equipamento");
    obj.button2:setName("button2");

    obj.flowLineBreak13 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak13:setParent(obj.flowLayout25);
    obj.flowLineBreak13:setName("flowLineBreak13");

    obj.flowPart116 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart116:setParent(obj.flowLayout25);
    obj.flowPart116:setMinWidth(680);
    obj.flowPart116:setAlign("top");
    obj.flowPart116:setHeight(30);
    obj.flowPart116:setName("flowPart116");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart116);
    obj.horzLine3:setMargins({top=15});
    obj.horzLine3:setName("horzLine3");
    obj.horzLine3:setStrokeColor("#a7754d");
    obj.horzLine3:setAlign("top");

    obj.flowLineBreak14 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak14:setParent(obj.flowLayout25);
    obj.flowLineBreak14:setName("flowLineBreak14");

    obj.flowPart117 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart117:setParent(obj.flowLayout25);
    obj.flowPart117:setMinWidth(680);
    obj.flowPart117:setAlign("top");
    obj.flowPart117:setHeight(35);
    obj.flowPart117:setName("flowPart117");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.flowPart117);
    obj.label92:setMargins({left=70});
    obj.label92:setText("EQUIPAMENTO");
    obj.label92:setFontColor("#a7754d");
    obj.label92:setAlign("left");
    obj.label92:setWidth(150);
    obj.label92:setName("label92");
    obj.label92:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label92, "fontStyle",  "bold");
    obj.label92:setHeight(25);
    obj.label92:setFontSize(15);

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.flowPart117);
    obj.label93:setText("QT.");
    obj.label93:setFontColor("#a7754d");
    obj.label93:setAlign("left");
    obj.label93:setWidth(30);
    obj.label93:setName("label93");
    obj.label93:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label93, "fontStyle",  "bold");
    obj.label93:setHeight(25);
    obj.label93:setFontSize(15);

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.flowPart117);
    obj.label94:setText("PREÇO");
    obj.label94:setFontColor("#a7754d");
    obj.label94:setAlign("left");
    obj.label94:setWidth(110);
    obj.label94:setName("label94");
    obj.label94:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label94, "fontStyle",  "bold");
    obj.label94:setHeight(25);
    obj.label94:setFontSize(15);

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.flowPart117);
    obj.label95:setMargins({left=50});
    obj.label95:setText("EQUIPAMENTO");
    obj.label95:setFontColor("#a7754d");
    obj.label95:setAlign("left");
    obj.label95:setWidth(150);
    obj.label95:setName("label95");
    obj.label95:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label95, "fontStyle",  "bold");
    obj.label95:setHeight(25);
    obj.label95:setFontSize(15);

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.flowPart117);
    obj.label96:setText("QT.");
    obj.label96:setFontColor("#a7754d");
    obj.label96:setAlign("left");
    obj.label96:setWidth(30);
    obj.label96:setName("label96");
    obj.label96:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setHeight(25);
    obj.label96:setFontSize(15);

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.flowPart117);
    obj.label97:setText("PREÇO");
    obj.label97:setFontColor("#a7754d");
    obj.label97:setAlign("left");
    obj.label97:setWidth(110);
    obj.label97:setName("label97");
    obj.label97:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label97, "fontStyle",  "bold");
    obj.label97:setHeight(25);
    obj.label97:setFontSize(15);

    obj.flowLineBreak15 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak15:setParent(obj.flowLayout25);
    obj.flowLineBreak15:setName("flowLineBreak15");

    obj.flowPart118 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart118:setParent(obj.flowLayout25);
    obj.flowPart118:setMinWidth(680);
    obj.flowPart118:setAlign("top");
    obj.flowPart118:setHeight(590);
    obj.flowPart118:setName("flowPart118");

    obj.rclEquips = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquips:setParent(obj.flowPart118);
    obj.rclEquips:setWidth(680);
    obj.rclEquips:setAlign("client");
    obj.rclEquips:setMinQt(1);
    obj.rclEquips:setLayout("horizontalTiles");
    obj.rclEquips:setName("rclEquips");
    obj.rclEquips:setField("fldEquips");
    obj.rclEquips:setTemplateForm("equips");
    obj.rclEquips:setAutoHeight(true);

    obj.layNote = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNote:setParent(obj.layout2);
    obj.layNote:setAlign("client");
    obj.layNote:setName("layNote");
    obj.layNote:setVisible(false);

    obj.flowLayout26 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout26:setParent(obj.layNote);
    obj.flowLayout26:setHeight(1400);
    obj.flowLayout26:setName("flowLayout26");
    obj.flowLayout26:setAlign("top");
    obj.flowLayout26:setHorzAlign("center");
    obj.flowLayout26:setOrientation("horizontal");
    obj.flowLayout26:setMaxControlsPerLine(1);
    obj.flowLayout26:setMargins({top=30, bottom=20});

    obj.flowPart119 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart119:setParent(obj.flowLayout26);
    obj.flowPart119:setMinWidth(680);
    obj.flowPart119:setAlign("top");
    obj.flowPart119:setHeight(45);
    obj.flowPart119:setName("flowPart119");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.flowPart119);
    obj.label98:setText("ANOTAÇÕES");
    obj.label98:setFontSize(30);
    obj.label98:setHeight(45);
    obj.label98:setAlign("top");
    obj.label98:setVertTextAlign("leading");
    obj.label98:setName("label98");
    obj.label98:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label98, "fontStyle",  "bold");
    obj.label98:setFontColor("black");

    obj.flowLineBreak16 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak16:setParent(obj.flowLayout26);
    obj.flowLineBreak16:setName("flowLineBreak16");

    obj.flowPart120 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart120:setParent(obj.flowLayout26);
    obj.flowPart120:setMinWidth(680);
    obj.flowPart120:setAlign("top");
    obj.flowPart120:setHeight(1400);
    obj.flowPart120:setMargins({bottom=30});
    obj.flowPart120:setName("flowPart120");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.flowPart120);
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "transparent");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "#573c27");
    obj.richEdit1:setField("Anotacoes");
    obj.richEdit1:setName("richEdit1");

    obj.flowPart121 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart121:setParent(obj.flowLayout1);
    obj.flowPart121:setMinWidth(50);
    obj.flowPart121:setMaxWidth(110);
    obj.flowPart121:setHeight(1900);
    obj.flowPart121:setName("flowPart121");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.flowPart121);
    obj.image13:setMargins({left=10});
    obj.image13:setURL("/images/arrow-r.png");
    obj.image13:setStyle("proportional");
    obj.image13:setAlign("client");
    obj.image13:setCursor("handPoint");
    obj.image13:setHitTest(true);
    obj.image13:setName("image13");

    obj.flowLayout27 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout27:setParent(obj.scrollBox1);
    lfm_setPropAsString(obj.flowLayout27, "anchors",  "left top right");
    obj.flowLayout27:setAutoHeight(true);
    obj.flowLayout27:setHorzAlign("center");
    obj.flowLayout27:setOrientation("horizontal");
    obj.flowLayout27:setName("flowLayout27");

    obj.flowPart122 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart122:setParent(obj.flowLayout27);
    obj.flowPart122:setWidth(450);
    obj.flowPart122:setHeight(370);
    obj.flowPart122:setName("flowPart122");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.flowPart122);
    obj.image14:setURL("/images/banneret.png");
    obj.image14:setStyle("proportional");
    obj.image14:setHeight(370);
    obj.image14:setWidth(450);
    obj.image14:setName("image14");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.flowPart122);
    obj.image15:setURL("/images/logo.png");
    obj.image15:setStyle("proportional");
    obj.image15:setHeight(350);
    obj.image15:setWidth(450);
    obj.image15:setName("image15");

    obj._e_event0 = obj.image2:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; TrocarAba('E');
        end, obj);

    obj._e_event1 = obj.nomeCheckFerimentos_01:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckFerimentos_01 = not sheet.fldCheckFerimentos_01;
            										
            										if(sheet.fldCheckFerimentos_02) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = false; 
            											sheet.fldCheckFerimentos_03 = false; 
            											sheet.fldCheckFerimentos_04 = false; 
            											sheet.fldCheckFerimentos_05 = false; 
            											sheet.fldCheckFerimentos_06 = false; 
            											sheet.fldCheckFerimentos_07 = false; 
            											sheet.fldCheckFerimentos_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event2 = obj.nomeCheckFerimentos_02:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckFerimentos_02 = not sheet.fldCheckFerimentos_02;
            										
            										if(sheet.fldCheckFerimentos_02) then 
            											sheet.fldCheckFerimentos_01 = true; 
            										else 
            											sheet.fldCheckFerimentos_01 = false;
            										end;
            										
            										if(sheet.fldCheckFerimentos_03) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = false; 
            											sheet.fldCheckFerimentos_04 = false; 
            											sheet.fldCheckFerimentos_05 = false;
            											sheet.fldCheckFerimentos_06 = false; 
            											sheet.fldCheckFerimentos_07 = false; 
            											sheet.fldCheckFerimentos_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event3 = obj.nomeCheckFerimentos_03:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckFerimentos_03 = not sheet.fldCheckFerimentos_03;
            										
            										if(sheet.fldCheckFerimentos_03) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            										else 
            											sheet.fldCheckFerimentos_01 = false; 
            											sheet.fldCheckFerimentos_02 = false; 
            										end;
            										
            										if(sheet.fldCheckFerimentos_04) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = false; 
            											sheet.fldCheckFerimentos_05 = false;
            											sheet.fldCheckFerimentos_06 = false; 
            											sheet.fldCheckFerimentos_07 = false; 
            											sheet.fldCheckFerimentos_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event4 = obj.nomeCheckFerimentos_04:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckFerimentos_04 = not sheet.fldCheckFerimentos_04;
            										
            										if(sheet.fldCheckFerimentos_04) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            										else 
            											sheet.fldCheckFerimentos_01 = false; 
            											sheet.fldCheckFerimentos_02 = false; 
            											sheet.fldCheckFerimentos_03 = false; 
            										end;
            										
            										if(sheet.fldCheckFerimentos_05) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = true; 
            											sheet.fldCheckFerimentos_05 = false; 
            											sheet.fldCheckFerimentos_06 = false; 
            											sheet.fldCheckFerimentos_07 = false; 
            											sheet.fldCheckFerimentos_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event5 = obj.nomeCheckFerimentos_05:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckFerimentos_05 = not sheet.fldCheckFerimentos_05;
            										
            										if(sheet.fldCheckFerimentos_05) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = true; 
            										else 
            											sheet.fldCheckFerimentos_01 = false; 
            											sheet.fldCheckFerimentos_02 = false; 
            											sheet.fldCheckFerimentos_03 = false; 
            											sheet.fldCheckFerimentos_04 = false; 
            										end;
            										
            										if(sheet.fldCheckFerimentos_06) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = true; 
            											sheet.fldCheckFerimentos_05 = true; 
            											sheet.fldCheckFerimentos_06 = false; 
            											sheet.fldCheckFerimentos_07 = false; 
            											sheet.fldCheckFerimentos_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event6 = obj.nomeCheckFerimentos_06:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckFerimentos_06 = not sheet.fldCheckFerimentos_06;
            										
            										if(sheet.fldCheckFerimentos_06) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = true; 
            											sheet.fldCheckFerimentos_05 = true; 
            										else 
            											sheet.fldCheckFerimentos_01 = false; 
            											sheet.fldCheckFerimentos_02 = false; 
            											sheet.fldCheckFerimentos_03 = false; 
            											sheet.fldCheckFerimentos_04 = false; 
            											sheet.fldCheckFerimentos_05 = false; 
            										end;
            										
            										if(sheet.fldCheckFerimentos_07) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = true; 
            											sheet.fldCheckFerimentos_05 = true; 
            											sheet.fldCheckFerimentos_06 = true; 
            											sheet.fldCheckFerimentos_07 = false; 
            											sheet.fldCheckFerimentos_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event7 = obj.nomeCheckFerimentos_07:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckFerimentos_07 = not sheet.fldCheckFerimentos_07;
            										
            										if(sheet.fldCheckFerimentos_07) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = true; 
            											sheet.fldCheckFerimentos_05 = true; 
            											sheet.fldCheckFerimentos_06 = true; 
            										else 
            											sheet.fldCheckFerimentos_01 = false; 
            											sheet.fldCheckFerimentos_02 = false; 
            											sheet.fldCheckFerimentos_03 = false; 
            											sheet.fldCheckFerimentos_04 = false; 
            											sheet.fldCheckFerimentos_05 = false; 
            											sheet.fldCheckFerimentos_06 = false; 
            										end;
            										
            										if(sheet.fldCheckFerimentos_08) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = true; 
            											sheet.fldCheckFerimentos_05 = true; 
            											sheet.fldCheckFerimentos_06 = true; 
            											sheet.fldCheckFerimentos_07 = true; 
            											sheet.fldCheckFerimentos_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event8 = obj.nomeCheckFerimentos_08:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckFerimentos_08 = not sheet.fldCheckFerimentos_08;
            										
            										if(sheet.fldCheckFerimentos_08) then 
            											sheet.fldCheckFerimentos_01 = true; 
            											sheet.fldCheckFerimentos_02 = true; 
            											sheet.fldCheckFerimentos_03 = true; 
            											sheet.fldCheckFerimentos_04 = true; 
            											sheet.fldCheckFerimentos_05 = true; 
            											sheet.fldCheckFerimentos_06 = true; 
            											sheet.fldCheckFerimentos_07 = true; 
            										else 
            											sheet.fldCheckFerimentos_01 = false; 
            											sheet.fldCheckFerimentos_02 = false; 
            											sheet.fldCheckFerimentos_03 = false; 
            											sheet.fldCheckFerimentos_04 = false; 
            											sheet.fldCheckFerimentos_05 = false; 
            											sheet.fldCheckFerimentos_06 = false; 
            											sheet.fldCheckFerimentos_07 = false; 
            										end;
            									
        end, obj);

    obj._e_event9 = obj.nomeCheckLesoes_01:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckLesoes_01 = not sheet.fldCheckLesoes_01;
            										
            										if(sheet.fldCheckLesoes_02) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = false; 
            											sheet.fldCheckLesoes_03 = false; 
            											sheet.fldCheckLesoes_04 = false; 
            											sheet.fldCheckLesoes_05 = false; 
            											sheet.fldCheckLesoes_06 = false; 
            											sheet.fldCheckLesoes_07 = false; 
            											sheet.fldCheckLesoes_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event10 = obj.nomeCheckLesoes_02:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckLesoes_02 = not sheet.fldCheckLesoes_02;
            										
            										if(sheet.fldCheckLesoes_02) then 
            											sheet.fldCheckLesoes_01 = true; 
            										else 
            											sheet.fldCheckLesoes_01 = false;
            										end;
            										
            										if(sheet.fldCheckLesoes_03) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = false; 
            											sheet.fldCheckLesoes_04 = false; 
            											sheet.fldCheckLesoes_05 = false;
            											sheet.fldCheckLesoes_06 = false; 
            											sheet.fldCheckLesoes_07 = false; 
            											sheet.fldCheckLesoes_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event11 = obj.nomeCheckLesoes_03:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckLesoes_03 = not sheet.fldCheckLesoes_03;
            										
            										if(sheet.fldCheckLesoes_03) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            										else 
            											sheet.fldCheckLesoes_01 = false; 
            											sheet.fldCheckLesoes_02 = false; 
            										end;
            										
            										if(sheet.fldCheckLesoes_04) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = false; 
            											sheet.fldCheckLesoes_05 = false;
            											sheet.fldCheckLesoes_06 = false; 
            											sheet.fldCheckLesoes_07 = false; 
            											sheet.fldCheckLesoes_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event12 = obj.nomeCheckLesoes_04:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckLesoes_04 = not sheet.fldCheckLesoes_04;
            										
            										if(sheet.fldCheckLesoes_04) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            										else 
            											sheet.fldCheckLesoes_01 = false; 
            											sheet.fldCheckLesoes_02 = false; 
            											sheet.fldCheckLesoes_03 = false; 
            										end;
            										
            										if(sheet.fldCheckLesoes_05) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = true; 
            											sheet.fldCheckLesoes_05 = false; 
            											sheet.fldCheckLesoes_06 = false; 
            											sheet.fldCheckLesoes_07 = false; 
            											sheet.fldCheckLesoes_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event13 = obj.nomeCheckLesoes_05:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckLesoes_05 = not sheet.fldCheckLesoes_05;
            										
            										if(sheet.fldCheckLesoes_05) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = true; 
            										else 
            											sheet.fldCheckLesoes_01 = false; 
            											sheet.fldCheckLesoes_02 = false; 
            											sheet.fldCheckLesoes_03 = false; 
            											sheet.fldCheckLesoes_04 = false; 
            										end;
            										
            										if(sheet.fldCheckLesoes_06) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = true; 
            											sheet.fldCheckLesoes_05 = true; 
            											sheet.fldCheckLesoes_06 = false; 
            											sheet.fldCheckLesoes_07 = false; 
            											sheet.fldCheckLesoes_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event14 = obj.nomeCheckLesoes_06:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckLesoes_06 = not sheet.fldCheckLesoes_06;
            										
            										if(sheet.fldCheckLesoes_06) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = true; 
            											sheet.fldCheckLesoes_05 = true; 
            										else 
            											sheet.fldCheckLesoes_01 = false; 
            											sheet.fldCheckLesoes_02 = false; 
            											sheet.fldCheckLesoes_03 = false; 
            											sheet.fldCheckLesoes_04 = false; 
            											sheet.fldCheckLesoes_05 = false; 
            										end;
            										
            										if(sheet.fldCheckLesoes_07) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = true; 
            											sheet.fldCheckLesoes_05 = true; 
            											sheet.fldCheckLesoes_06 = true; 
            											sheet.fldCheckLesoes_07 = false; 
            											sheet.fldCheckLesoes_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event15 = obj.nomeCheckLesoes_07:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckLesoes_07 = not sheet.fldCheckLesoes_07;
            										
            										if(sheet.fldCheckLesoes_07) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = true; 
            											sheet.fldCheckLesoes_05 = true; 
            											sheet.fldCheckLesoes_06 = true; 
            										else 
            											sheet.fldCheckLesoes_01 = false; 
            											sheet.fldCheckLesoes_02 = false; 
            											sheet.fldCheckLesoes_03 = false; 
            											sheet.fldCheckLesoes_04 = false; 
            											sheet.fldCheckLesoes_05 = false; 
            											sheet.fldCheckLesoes_06 = false; 
            										end;
            										
            										if(sheet.fldCheckLesoes_08) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = true; 
            											sheet.fldCheckLesoes_05 = true; 
            											sheet.fldCheckLesoes_06 = true; 
            											sheet.fldCheckLesoes_07 = true; 
            											sheet.fldCheckLesoes_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event16 = obj.nomeCheckLesoes_08:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckLesoes_08 = not sheet.fldCheckLesoes_08;
            										
            										if(sheet.fldCheckLesoes_08) then 
            											sheet.fldCheckLesoes_01 = true; 
            											sheet.fldCheckLesoes_02 = true; 
            											sheet.fldCheckLesoes_03 = true; 
            											sheet.fldCheckLesoes_04 = true; 
            											sheet.fldCheckLesoes_05 = true; 
            											sheet.fldCheckLesoes_06 = true; 
            											sheet.fldCheckLesoes_07 = true; 
            										else 
            											sheet.fldCheckLesoes_01 = false; 
            											sheet.fldCheckLesoes_02 = false; 
            											sheet.fldCheckLesoes_03 = false; 
            											sheet.fldCheckLesoes_04 = false; 
            											sheet.fldCheckLesoes_05 = false; 
            											sheet.fldCheckLesoes_06 = false; 
            											sheet.fldCheckLesoes_07 = false; 
            										end;
            									
        end, obj);

    obj._e_event17 = obj.nomeCheckDESTINO_01:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckDESTINO_01 = not sheet.fldCheckDESTINO_01;
            										
            										if(sheet.fldCheckDESTINO_02) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = false; 
            											sheet.fldCheckDESTINO_03 = false; 
            											sheet.fldCheckDESTINO_04 = false; 
            											sheet.fldCheckDESTINO_05 = false; 
            											sheet.fldCheckDESTINO_06 = false; 
            											sheet.fldCheckDESTINO_07 = false; 
            											sheet.fldCheckDESTINO_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event18 = obj.nomeCheckDESTINO_02:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckDESTINO_02 = not sheet.fldCheckDESTINO_02;
            										
            										if(sheet.fldCheckDESTINO_02) then 
            											sheet.fldCheckDESTINO_01 = true; 
            										else 
            											sheet.fldCheckDESTINO_01 = false;
            										end;
            										
            										if(sheet.fldCheckDESTINO_03) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = false; 
            											sheet.fldCheckDESTINO_04 = false; 
            											sheet.fldCheckDESTINO_05 = false;
            											sheet.fldCheckDESTINO_06 = false; 
            											sheet.fldCheckDESTINO_07 = false; 
            											sheet.fldCheckDESTINO_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event19 = obj.nomeCheckDESTINO_03:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckDESTINO_03 = not sheet.fldCheckDESTINO_03;
            										
            										if(sheet.fldCheckDESTINO_03) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            										else 
            											sheet.fldCheckDESTINO_01 = false; 
            											sheet.fldCheckDESTINO_02 = false; 
            										end;
            										
            										if(sheet.fldCheckDESTINO_04) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = false; 
            											sheet.fldCheckDESTINO_05 = false;
            											sheet.fldCheckDESTINO_06 = false; 
            											sheet.fldCheckDESTINO_07 = false; 
            											sheet.fldCheckDESTINO_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event20 = obj.nomeCheckDESTINO_04:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckDESTINO_04 = not sheet.fldCheckDESTINO_04;
            										
            										if(sheet.fldCheckDESTINO_04) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            										else 
            											sheet.fldCheckDESTINO_01 = false; 
            											sheet.fldCheckDESTINO_02 = false; 
            											sheet.fldCheckDESTINO_03 = false; 
            										end;
            										
            										if(sheet.fldCheckDESTINO_05) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = true; 
            											sheet.fldCheckDESTINO_05 = false; 
            											sheet.fldCheckDESTINO_06 = false; 
            											sheet.fldCheckDESTINO_07 = false; 
            											sheet.fldCheckDESTINO_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event21 = obj.nomeCheckDESTINO_05:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckDESTINO_05 = not sheet.fldCheckDESTINO_05;
            										
            										if(sheet.fldCheckDESTINO_05) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = true; 
            										else 
            											sheet.fldCheckDESTINO_01 = false; 
            											sheet.fldCheckDESTINO_02 = false; 
            											sheet.fldCheckDESTINO_03 = false; 
            											sheet.fldCheckDESTINO_04 = false; 
            										end;
            										
            										if(sheet.fldCheckDESTINO_06) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = true; 
            											sheet.fldCheckDESTINO_05 = true; 
            											sheet.fldCheckDESTINO_06 = false; 
            											sheet.fldCheckDESTINO_07 = false; 
            											sheet.fldCheckDESTINO_08 = false;  
            										end;
            									
        end, obj);

    obj._e_event22 = obj.nomeCheckDESTINO_06:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckDESTINO_06 = not sheet.fldCheckDESTINO_06;
            										
            										if(sheet.fldCheckDESTINO_06) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = true; 
            											sheet.fldCheckDESTINO_05 = true; 
            										else 
            											sheet.fldCheckDESTINO_01 = false; 
            											sheet.fldCheckDESTINO_02 = false; 
            											sheet.fldCheckDESTINO_03 = false; 
            											sheet.fldCheckDESTINO_04 = false; 
            											sheet.fldCheckDESTINO_05 = false; 
            										end;
            										
            										if(sheet.fldCheckDESTINO_07) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = true; 
            											sheet.fldCheckDESTINO_05 = true; 
            											sheet.fldCheckDESTINO_06 = true; 
            											sheet.fldCheckDESTINO_07 = false; 
            											sheet.fldCheckDESTINO_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event23 = obj.nomeCheckDESTINO_07:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckDESTINO_07 = not sheet.fldCheckDESTINO_07;
            										
            										if(sheet.fldCheckDESTINO_07) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = true; 
            											sheet.fldCheckDESTINO_05 = true; 
            											sheet.fldCheckDESTINO_06 = true; 
            										else 
            											sheet.fldCheckDESTINO_01 = false; 
            											sheet.fldCheckDESTINO_02 = false; 
            											sheet.fldCheckDESTINO_03 = false; 
            											sheet.fldCheckDESTINO_04 = false; 
            											sheet.fldCheckDESTINO_05 = false; 
            											sheet.fldCheckDESTINO_06 = false; 
            										end;
            										
            										if(sheet.fldCheckDESTINO_08) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = true; 
            											sheet.fldCheckDESTINO_05 = true; 
            											sheet.fldCheckDESTINO_06 = true; 
            											sheet.fldCheckDESTINO_07 = true; 
            											sheet.fldCheckDESTINO_08 = false; 
            										end;
            									
        end, obj);

    obj._e_event24 = obj.nomeCheckDESTINO_08:addEventListener("onClick",
        function (_)
            
            										sheet.fldCheckDESTINO_08 = not sheet.fldCheckDESTINO_08;
            										
            										if(sheet.fldCheckDESTINO_08) then 
            											sheet.fldCheckDESTINO_01 = true; 
            											sheet.fldCheckDESTINO_02 = true; 
            											sheet.fldCheckDESTINO_03 = true; 
            											sheet.fldCheckDESTINO_04 = true; 
            											sheet.fldCheckDESTINO_05 = true; 
            											sheet.fldCheckDESTINO_06 = true; 
            											sheet.fldCheckDESTINO_07 = true; 
            										else 
            											sheet.fldCheckDESTINO_01 = false; 
            											sheet.fldCheckDESTINO_02 = false; 
            											sheet.fldCheckDESTINO_03 = false; 
            											sheet.fldCheckDESTINO_04 = false; 
            											sheet.fldCheckDESTINO_05 = false; 
            											sheet.fldCheckDESTINO_06 = false; 
            											sheet.fldCheckDESTINO_07 = false; 
            										end;
            									
        end, obj);

    obj._e_event25 = obj.label27:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad01 > 1) then sheet.grad01 = sheet.grad01 - 1; end;
        end, obj);

    obj._e_event26 = obj.edit13:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event27 = obj.label28:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad01 = sheet.grad01 + 1;
        end, obj);

    obj._e_event28 = obj.label30:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad02 > 1) then sheet.grad02 = sheet.grad02 - 1; end;
        end, obj);

    obj._e_event29 = obj.edit15:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event30 = obj.label31:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad02 = sheet.grad02 + 1;
        end, obj);

    obj._e_event31 = obj.label33:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad03 > 1) then sheet.grad03 = sheet.grad03 - 1; end;
        end, obj);

    obj._e_event32 = obj.edit17:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event33 = obj.label34:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad03 = sheet.grad03 + 1;
        end, obj);

    obj._e_event34 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event35 = obj.label36:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad04 > 1) then sheet.grad04 = sheet.grad04 - 1; end;
        end, obj);

    obj._e_event36 = obj.edit19:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event37 = obj.label37:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad04 = sheet.grad04 + 1;
        end, obj);

    obj._e_event38 = obj.label39:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad05 > 1) then sheet.grad05 = sheet.grad05 - 1; end;
        end, obj);

    obj._e_event39 = obj.edit21:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event40 = obj.label40:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad05 = sheet.grad05 + 1;
        end, obj);

    obj._e_event41 = obj.label42:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad06 > 1) then sheet.grad06 = sheet.grad06 - 1; end;
        end, obj);

    obj._e_event42 = obj.edit23:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event43 = obj.label43:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad06 = sheet.grad06 + 1;
        end, obj);

    obj._e_event44 = obj.label45:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad07 > 1) then sheet.grad07 = sheet.grad07 - 1; end;
        end, obj);

    obj._e_event45 = obj.edit25:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event46 = obj.label46:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad07 = sheet.grad07 + 1;
        end, obj);

    obj._e_event47 = obj.label48:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad08 > 1) then sheet.grad08 = sheet.grad08 - 1; end;
        end, obj);

    obj._e_event48 = obj.edit27:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event49 = obj.label49:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad08 = sheet.grad08 + 1;
        end, obj);

    obj._e_event50 = obj.label51:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad09 > 1) then sheet.grad09 = sheet.grad09 - 1; end;
        end, obj);

    obj._e_event51 = obj.edit29:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event52 = obj.label52:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad09 = sheet.grad09 + 1;
        end, obj);

    obj._e_event53 = obj.label54:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad10 > 1) then sheet.grad10 = sheet.grad10 - 1; end;
        end, obj);

    obj._e_event54 = obj.edit31:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event55 = obj.label55:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad10 = sheet.grad10 + 1;
        end, obj);

    obj._e_event56 = obj.label57:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad11 > 1) then sheet.grad11 = sheet.grad11 - 1; end;
        end, obj);

    obj._e_event57 = obj.edit33:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event58 = obj.label58:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad11 = sheet.grad11 + 1;
        end, obj);

    obj._e_event59 = obj.label60:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad12 > 1) then sheet.grad12 = sheet.grad12 - 1; end;
        end, obj);

    obj._e_event60 = obj.edit35:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event61 = obj.label61:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad12 = sheet.grad12 + 1;
        end, obj);

    obj._e_event62 = obj.label63:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad13 > 1) then sheet.grad13 = sheet.grad13 - 1; end;
        end, obj);

    obj._e_event63 = obj.edit37:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event64 = obj.label64:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad13 = sheet.grad13 + 1;
        end, obj);

    obj._e_event65 = obj.label66:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad14 > 1) then sheet.grad14 = sheet.grad14 - 1; end;
        end, obj);

    obj._e_event66 = obj.edit39:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event67 = obj.label67:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad14 = sheet.grad14 + 1;
        end, obj);

    obj._e_event68 = obj.label69:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad15 > 1) then sheet.grad15 = sheet.grad15 - 1; end;
        end, obj);

    obj._e_event69 = obj.edit41:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event70 = obj.label70:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad15 = sheet.grad15 + 1;
        end, obj);

    obj._e_event71 = obj.label72:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad16 > 1) then sheet.grad16 = sheet.grad16 - 1; end;
        end, obj);

    obj._e_event72 = obj.edit43:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event73 = obj.label73:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad16 = sheet.grad16 + 1;
        end, obj);

    obj._e_event74 = obj.label75:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad17 > 1) then sheet.grad17 = sheet.grad17 - 1; end;
        end, obj);

    obj._e_event75 = obj.edit45:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event76 = obj.label76:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad17 = sheet.grad17 + 1;
        end, obj);

    obj._e_event77 = obj.label78:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad18 > 1) then sheet.grad18 = sheet.grad18 - 1; end;
        end, obj);

    obj._e_event78 = obj.edit47:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event79 = obj.label79:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad18 = sheet.grad18 + 1;
        end, obj);

    obj._e_event80 = obj.label81:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; if(sheet.grad19 > 1) then sheet.grad19 = sheet.grad19 - 1; end;
        end, obj);

    obj._e_event81 = obj.edit49:addEventListener("onChange",
        function (_)
            if(sheet==nil) then return; end; calcExp();
        end, obj);

    obj._e_event82 = obj.label82:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; sheet.grad19 = sheet.grad19 + 1;
        end, obj);

    obj._e_event83 = obj.rclVantagens:addEventListener("onSelect",
        function (_)
            self.rclVantagens:sort();
        end, obj);

    obj._e_event84 = obj.rclVantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomeVant, nodeB.nomeVant);
        end, obj);

    obj._e_event85 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclVantagens:append();
        end, obj);

    obj._e_event86 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclEquips:append();
        end, obj);

    obj._e_event87 = obj.rclEquips:addEventListener("onSelect",
        function (_)
            self.rclEquips:sort();
        end, obj);

    obj._e_event88 = obj.rclEquips:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nomeEquip, nodeB.nomeEquip);
        end, obj);

    obj._e_event89 = obj.image13:addEventListener("onClick",
        function (_)
            if(sheet==nil) then return; end; TrocarAba('D');
        end, obj);

    function obj:_releaseEvents()
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

        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.nomeCheckDESTINO_04 ~= nil then self.nomeCheckDESTINO_04:destroy(); self.nomeCheckDESTINO_04 = nil; end;
        if self.flowPart121 ~= nil then self.flowPart121:destroy(); self.flowPart121 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.nomeCheckFerimentos_01 ~= nil then self.nomeCheckFerimentos_01:destroy(); self.nomeCheckFerimentos_01 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flowPart106 ~= nil then self.flowPart106:destroy(); self.flowPart106 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.nomeCheckLesoes_04 ~= nil then self.nomeCheckLesoes_04:destroy(); self.nomeCheckLesoes_04 = nil; end;
        if self.dado14 ~= nil then self.dado14:destroy(); self.dado14 = nil; end;
        if self.nomeCheckLesoes_07 ~= nil then self.nomeCheckLesoes_07:destroy(); self.nomeCheckLesoes_07 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.rclEquips ~= nil then self.rclEquips:destroy(); self.rclEquips = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.flowPart107 ~= nil then self.flowPart107:destroy(); self.flowPart107 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.flowPart103 ~= nil then self.flowPart103:destroy(); self.flowPart103 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.nomeCheckDESTINO_06 ~= nil then self.nomeCheckDESTINO_06:destroy(); self.nomeCheckDESTINO_06 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.nomeCheckLesoes_01 ~= nil then self.nomeCheckLesoes_01:destroy(); self.nomeCheckLesoes_01 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.nomeCheckFerimentos_03 ~= nil then self.nomeCheckFerimentos_03:destroy(); self.nomeCheckFerimentos_03 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.nomeCheckFerimentos_07 ~= nil then self.nomeCheckFerimentos_07:destroy(); self.nomeCheckFerimentos_07 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.flowPart104 ~= nil then self.flowPart104:destroy(); self.flowPart104 = nil; end;
        if self.flowPart113 ~= nil then self.flowPart113:destroy(); self.flowPart113 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.nomeCheckDESTINO_02 ~= nil then self.nomeCheckDESTINO_02:destroy(); self.nomeCheckDESTINO_02 = nil; end;
        if self.flowPart122 ~= nil then self.flowPart122:destroy(); self.flowPart122 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.nomeCheckLesoes_08 ~= nil then self.nomeCheckLesoes_08:destroy(); self.nomeCheckLesoes_08 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.flowPart102 ~= nil then self.flowPart102:destroy(); self.flowPart102 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.flowPart118 ~= nil then self.flowPart118:destroy(); self.flowPart118 = nil; end;
        if self.flowPart116 ~= nil then self.flowPart116:destroy(); self.flowPart116 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.nomeCheckFerimentos_05 ~= nil then self.nomeCheckFerimentos_05:destroy(); self.nomeCheckFerimentos_05 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.dado15 ~= nil then self.dado15:destroy(); self.dado15 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.flowLayout26 ~= nil then self.flowLayout26:destroy(); self.flowLayout26 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowLineBreak16 ~= nil then self.flowLineBreak16:destroy(); self.flowLineBreak16 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.flowPart110 ~= nil then self.flowPart110:destroy(); self.flowPart110 = nil; end;
        if self.flowLineBreak13 ~= nil then self.flowLineBreak13:destroy(); self.flowLineBreak13 = nil; end;
        if self.flowLineBreak14 ~= nil then self.flowLineBreak14:destroy(); self.flowLineBreak14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.flowLayout27 ~= nil then self.flowLayout27:destroy(); self.flowLayout27 = nil; end;
        if self.nomeCheckDESTINO_08 ~= nil then self.nomeCheckDESTINO_08:destroy(); self.nomeCheckDESTINO_08 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.dado18 ~= nil then self.dado18:destroy(); self.dado18 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.dado13 ~= nil then self.dado13:destroy(); self.dado13 = nil; end;
        if self.dado17 ~= nil then self.dado17:destroy(); self.dado17 = nil; end;
        if self.nomeCheckFerimentos_04 ~= nil then self.nomeCheckFerimentos_04:destroy(); self.nomeCheckFerimentos_04 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.flowPart108 ~= nil then self.flowPart108:destroy(); self.flowPart108 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.nomeCheckDESTINO_05 ~= nil then self.nomeCheckDESTINO_05:destroy(); self.nomeCheckDESTINO_05 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.nomeCheckDESTINO_07 ~= nil then self.nomeCheckDESTINO_07:destroy(); self.nomeCheckDESTINO_07 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.nomeCheckFerimentos_02 ~= nil then self.nomeCheckFerimentos_02:destroy(); self.nomeCheckFerimentos_02 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.nomeCheckFerimentos_08 ~= nil then self.nomeCheckFerimentos_08:destroy(); self.nomeCheckFerimentos_08 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.nomeCheckDESTINO_01 ~= nil then self.nomeCheckDESTINO_01:destroy(); self.nomeCheckDESTINO_01 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.flowPart105 ~= nil then self.flowPart105:destroy(); self.flowPart105 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.flowLineBreak15 ~= nil then self.flowLineBreak15:destroy(); self.flowLineBreak15 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layBG ~= nil then self.layBG:destroy(); self.layBG = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.nomeCheckFerimentos_06 ~= nil then self.nomeCheckFerimentos_06:destroy(); self.nomeCheckFerimentos_06 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.flowPart120 ~= nil then self.flowPart120:destroy(); self.flowPart120 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.flowPart117 ~= nil then self.flowPart117:destroy(); self.flowPart117 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.layNote ~= nil then self.layNote:destroy(); self.layNote = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.flowPart109 ~= nil then self.flowPart109:destroy(); self.flowPart109 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.nomeCheckLesoes_03 ~= nil then self.nomeCheckLesoes_03:destroy(); self.nomeCheckLesoes_03 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.nomeCheckLesoes_06 ~= nil then self.nomeCheckLesoes_06:destroy(); self.nomeCheckLesoes_06 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.dado16 ~= nil then self.dado16:destroy(); self.dado16 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.flowPart114 ~= nil then self.flowPart114:destroy(); self.flowPart114 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.rclVantagens ~= nil then self.rclVantagens:destroy(); self.rclVantagens = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.nomeCheckLesoes_05 ~= nil then self.nomeCheckLesoes_05:destroy(); self.nomeCheckLesoes_05 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.flowPart111 ~= nil then self.flowPart111:destroy(); self.flowPart111 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.nomeCheckDESTINO_03 ~= nil then self.nomeCheckDESTINO_03:destroy(); self.nomeCheckDESTINO_03 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.layFrente ~= nil then self.layFrente:destroy(); self.layFrente = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.flowPart115 ~= nil then self.flowPart115:destroy(); self.flowPart115 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.flowPart119 ~= nil then self.flowPart119:destroy(); self.flowPart119 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.flowPart112 ~= nil then self.flowPart112:destroy(); self.flowPart112 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.nomeCheckLesoes_02 ~= nil then self.nomeCheckLesoes_02:destroy(); self.nomeCheckLesoes_02 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGoT()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGoT();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGoT = {
    newEditor = newfrmGoT, 
    new = newfrmGoT, 
    name = "frmGoT", 
    dataType = "thirteen.GoT", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Game of Thrones", 
    description=""};

frmGoT = _frmGoT;
Firecast.registrarForm(_frmGoT);
Firecast.registrarDataType(_frmGoT);

return _frmGoT;
