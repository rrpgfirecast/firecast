require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmScion2e()
    local obj = GUI.fromHandle(_obj_newObject("form"));
    local self = obj;
    local sheet = nil;

    rawset(obj, "_oldSetNodeObjectFunction", obj.setNodeObject);

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
    obj:setDataType("thirteen.Scion2e");
    obj:setTitle("Scion 2e");
    obj:setName("frmScion2e");
    obj:setTheme("dark");







	personagem = {
    atributos = {
        forca = 0,
        destreza = 0,
        vigor = 0,
        carisma = 0,
        manipulacao = 0,
        autocontrole = 0,
        inteligencia = 0,
        raciocinio = 0,
        determinacao = 0
    },

    habilidades = {
        academia = 0,
        armas_de_fogo = 0,
        atletismo = 0,
        briga = 0,
        ciencia = 0,
        conducao = 0,
        cultura = 0,
        empatia = 0,
        integridade = 0,
        lideranca = 0,
        medicina = 0,
        ocultismo = 0,
        persuasao = 0,
        sobrevivencia = 0,
        subterfugio = 0,
        tecnologia = 0
		}
	}
	
	local function sumBools(a, b, c, d, e)
		local soma = 0

		if a then soma = soma + 1 end
		if b then soma = soma + 1 end
		if c then soma = soma + 1 end
		if d then soma = soma + 1 end
		if e then soma = soma + 1 end

		return soma
	end
	
	local function calcMachucados()
		if sumBools(sheet.fldCheck03_01, sheet.fldCheck03_02, sheet.fldCheck03_03, sheet.fldCheck03_04, sheet.fldCheck03_05) < 3 then 
			self.flPart_Machucado04.visible = false
			self.flPart_Machucado05.visible = false
			
		elseif sumBools(sheet.fldCheck03_01, sheet.fldCheck03_02, sheet.fldCheck03_03, sheet.fldCheck03_04, sheet.fldCheck03_05) < 5 then
			self.flPart_Machucado04.visible = true
			self.flPart_Machucado05.visible = false
			
		elseif sumBools(sheet.fldCheck03_01, sheet.fldCheck03_02, sheet.fldCheck03_03, sheet.fldCheck03_04, sheet.fldCheck03_05) == 5 then
			self.flPart_Machucado04.visible = true
			self.flPart_Machucado05.visible = true
			
		end
		self.flLayVida:needRealign()
		self.idFundo:needRepaint()
	end
	
	local function rolagemDefesa()
		local v1 = personagem.atributos.vigor
		local v2 = personagem.atributos.autocontrole
		local v3 = personagem.atributos.determinacao

		return math.max(v1, v2, v3)
	end
	
	local function rolagemMovimento()
		local atributo = math.max(personagem.atributos.forca, personagem.atributos.destreza)
		local habilidade = personagem.habilidades.atletismo

		return atributo + habilidade
	end

	local function CalcPontos()
		
		personagem = {
		atributos = {
			forca = sumBools(sheet.fldCheck01_01, sheet.fldCheck01_02, sheet.fldCheck01_03, sheet.fldCheck01_04, sheet.fldCheck01_05),
			destreza = sumBools(sheet.fldCheck02_01, sheet.fldCheck02_02, sheet.fldCheck02_03, sheet.fldCheck02_04, sheet.fldCheck02_05),
			vigor = sumBools(sheet.fldCheck03_01, sheet.fldCheck03_02, sheet.fldCheck03_03, sheet.fldCheck03_04, sheet.fldCheck03_05),
			carisma = sumBools(sheet.fldCheck04_01, sheet.fldCheck04_02, sheet.fldCheck04_03, sheet.fldCheck04_04, sheet.fldCheck04_05),
			manipulacao = sumBools(sheet.fldCheck05_01, sheet.fldCheck05_02, sheet.fldCheck05_03, sheet.fldCheck05_04, sheet.fldCheck05_05),
			autocontrole = sumBools(sheet.fldCheck06_01, sheet.fldCheck06_02, sheet.fldCheck06_03, sheet.fldCheck06_04, sheet.fldCheck06_05),
			inteligencia = sumBools(sheet.fldCheck07_01, sheet.fldCheck07_02, sheet.fldCheck07_03, sheet.fldCheck07_04, sheet.fldCheck07_05),
			raciocinio = sumBools(sheet.fldCheck08_01, sheet.fldCheck08_02, sheet.fldCheck08_03, sheet.fldCheck08_04, sheet.fldCheck08_05),
			determinacao = sumBools(sheet.fldCheck09_01, sheet.fldCheck09_02, sheet.fldCheck09_03, sheet.fldCheck09_04, sheet.fldCheck09_05)
		},

		habilidades = {
			academia = sumBools(sheet.fldCheck10_01, sheet.fldCheck10_02, sheet.fldCheck10_03, sheet.fldCheck10_04, sheet.fldCheck10_05),
			armas_de_fogo = sumBools(sheet.fldCheck11_01, sheet.fldCheck11_02, sheet.fldCheck11_03, sheet.fldCheck11_04, sheet.fldCheck11_05),
			atletismo = sumBools(sheet.fldCheck12_01, sheet.fldCheck12_02, sheet.fldCheck12_03, sheet.fldCheck12_04, sheet.fldCheck12_05),
			briga = sumBools(sheet.fldCheck13_01, sheet.fldCheck13_02, sheet.fldCheck13_03, sheet.fldCheck13_04, sheet.fldCheck13_05),
			ciencia = sumBools(sheet.fldCheck14_01, sheet.fldCheck14_02, sheet.fldCheck14_03, sheet.fldCheck14_04, sheet.fldCheck14_05),
			conducao = sumBools(sheet.fldCheck15_01, sheet.fldCheck15_02, sheet.fldCheck15_03, sheet.fldCheck15_04, sheet.fldCheck15_05),
			cultura = sumBools(sheet.fldCheck16_01, sheet.fldCheck16_02, sheet.fldCheck16_03, sheet.fldCheck16_04, sheet.fldCheck16_05),
			empatia = sumBools(sheet.fldCheck17_01, sheet.fldCheck17_02, sheet.fldCheck17_03, sheet.fldCheck17_04, sheet.fldCheck17_05),
			integridade = sumBools(sheet.fldCheck18_01, sheet.fldCheck18_02, sheet.fldCheck18_03, sheet.fldCheck18_04, sheet.fldCheck18_05),
			lideranca = sumBools(sheet.fldCheck19_01, sheet.fldCheck19_02, sheet.fldCheck19_03, sheet.fldCheck19_04, sheet.fldCheck19_05),
			medicina = sumBools(sheet.fldCheck20_01, sheet.fldCheck20_02, sheet.fldCheck20_03, sheet.fldCheck20_04, sheet.fldCheck20_05),
			ocultismo = sumBools(sheet.fldCheck21_01, sheet.fldCheck21_02, sheet.fldCheck21_03, sheet.fldCheck21_04, sheet.fldCheck21_05),
			persuasao = sumBools(sheet.fldCheck22_01, sheet.fldCheck22_02, sheet.fldCheck22_03, sheet.fldCheck22_04, sheet.fldCheck22_05),
			sobrevivencia = sumBools(sheet.fldCheck23_01, sheet.fldCheck23_02, sheet.fldCheck23_03, sheet.fldCheck23_04, sheet.fldCheck23_05),
			subterfugio = sumBools(sheet.fldCheck24_01, sheet.fldCheck24_02, sheet.fldCheck24_03, sheet.fldCheck24_04, sheet.fldCheck24_05),
			tecnologia = sumBools(sheet.fldCheck25_01, sheet.fldCheck25_02, sheet.fldCheck25_03, sheet.fldCheck25_04, sheet.fldCheck25_05)
			}
		}

		sheet.rollDefesa = rolagemDefesa()
		sheet.rollMovimento = rolagemMovimento()
		calcMachucados()
		
		self.flLayVida:needRealign()
		self.idFundo:needRepaint()
	end

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

    obj.idImgFundo = GUI.fromHandle(_obj_newObject("image"));
    obj.idImgFundo:setParent(obj);
    obj.idImgFundo:setName("idImgFundo");
    obj.idImgFundo:setField("URLImagemFundo");
    obj.idImgFundo:setAlign("client");
    obj.idImgFundo:setStyle("autoFit");
    obj.idImgFundo:setSRC("");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("URLImagemFundo");
    obj.dataLink1:setDefaultValue("/images/bg.png");
    obj.dataLink1:setName("dataLink1");

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
    obj.flowPart1:setHeight(1920);
    obj.flowPart1:setMinWidth(30);
    obj.flowPart1:setMaxWidth(50);
    obj.flowPart1:setName("flowPart1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.flowPart1);
    obj.image1:setAlign("client");
    obj.image1:setStyle("proportional");
    obj.image1:setURL("/images/left-arrow.png");
    obj.image1:setHitTest(true);
    obj.image1:setCursor("handPoint");
    obj.image1:setHint("Trocar de Aba");
    obj.image1:setName("image1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setAlign("top");
    obj.flowPart2:setHeight(1920);
    obj.flowPart2:setMinWidth(400);
    obj.flowPart2:setMaxWidth(1000);
    obj.flowPart2:setName("flowPart2");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowPart2);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setAlign("top");
    obj.flowPart3:setHeight(1920);
    obj.flowPart3:setMinWidth(400);
    obj.flowPart3:setMaxWidth(1000);
    obj.flowPart3:setName("flowPart3");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart3);
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

    obj.idFundo = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.idFundo:setParent(obj.rectangle2);
    obj.idFundo:setName("idFundo");
    obj.idFundo:setAlign("client");
    obj.idFundo:setColor("#272727");
    obj.idFundo:setXradius(20);
    obj.idFundo:setYradius(20);
    obj.idFundo:setCornerType("bevel");
    obj.idFundo:setMargins({top=10, right=10, bottom=10, left=10});

    obj.layFrente = GUI.fromHandle(_obj_newObject("layout"));
    obj.layFrente:setParent(obj.idFundo);
    obj.layFrente:setName("layFrente");
    obj.layFrente:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.layFrente);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.btnImagemFundo = GUI.fromHandle(_obj_newObject("button"));
    obj.btnImagemFundo:setParent(obj.scrollBox2);
    obj.btnImagemFundo:setName("btnImagemFundo");
    obj.btnImagemFundo:setLeft(880);
    obj.btnImagemFundo:setTop(20);
    obj.btnImagemFundo:setText("⚙");
    obj.btnImagemFundo:setHeight(30);
    obj.btnImagemFundo:setWidth(30);

    obj.popImagemFundo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popImagemFundo:setParent(obj.scrollBox2);
    obj.popImagemFundo:setName("popImagemFundo");
    obj.popImagemFundo:setWidth(300);
    obj.popImagemFundo:setHeight(100);
    obj.popImagemFundo:setBackOpacity(0);
    obj.popImagemFundo:setDrawContainer(false);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.popImagemFundo);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#353535");
    obj.rectangle3:setPadding({top=10, left=10, bottom=10, right=10});
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setName("rectangle3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle3);
    obj.label1:setAlign("top");
    obj.label1:setText("I M A G E M  D E  F U N D O");
    obj.label1:setMargins({bottom=5, top=10});
    lfm_setPropAsString(obj.label1, "fontStyle", "bold");
    obj.label1:setFontFamily("Constantia");
    obj.label1:setName("label1");
    obj.label1:setFontSize(14);
    obj.label1:setFontColor("white");
    obj.label1:setTextTrimming("character");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle3);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({bottom=5});
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setName("horzLine1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle3);
    obj.edit1:setAlign("client");
    obj.edit1:setPadding({top=10, left=10, bottom=10, right=10});
    obj.edit1:setTransparent(false);
    obj.edit1:setField("URLImagemFundo");
    obj.edit1:setWidth(240);
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("#cdcdcd");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox2);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(1050);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(90);
    obj.layout3:setName("layout3");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.layout3);
    obj.image2:setAlign("top");
    obj.image2:setStyle("proportional");
    obj.image2:setHeight(50);
    obj.image2:setURL("/images/logo.png");
    obj.image2:setMargins({top=20});
    obj.image2:setName("image2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(90);
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(310);
    obj.layout5:setPadding({left=20, right=20});
    obj.layout5:setName("layout5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(35);
    obj.layout6:setName("layout6");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout6);
    obj.label2:setAlign("left");
    obj.label2:setWidth(45);
    obj.label2:setText("Nome: ");
    obj.label2:setName("label2");
    obj.label2:setFontSize(14);
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle", "bold");
    obj.label2:setTextTrimming("character");
    obj.label2:setFontFamily("Constantia");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout6);
    obj.edit2:setAlign("client");
    obj.edit2:setField("fldNome");
    obj.edit2:setName("edit2");
    obj.edit2:setFontSize(14);
    obj.edit2:setFontColor("#cdcdcd");
    obj.edit2:setTextTrimming("character");
    obj.edit2:setFontFamily("Constantia");
    obj.edit2:setTransparent(true);

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout5);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(35);
    obj.layout7:setName("layout7");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout7);
    obj.label3:setAlign("left");
    obj.label3:setWidth(57);
    obj.label3:setText("Jogador: ");
    obj.label3:setName("label3");
    obj.label3:setFontSize(14);
    obj.label3:setFontColor("white");
    lfm_setPropAsString(obj.label3, "fontStyle", "bold");
    obj.label3:setTextTrimming("character");
    obj.label3:setFontFamily("Constantia");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout7);
    obj.edit3:setAlign("client");
    obj.edit3:setField("fldJogador");
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(14);
    obj.edit3:setFontColor("#cdcdcd");
    obj.edit3:setTextTrimming("character");
    obj.edit3:setFontFamily("Constantia");
    obj.edit3:setTransparent(true);

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout4);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(310);
    obj.layout8:setPadding({left=20, right=20});
    obj.layout8:setName("layout8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(35);
    obj.layout9:setName("layout9");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout9);
    obj.label4:setAlign("left");
    obj.label4:setWidth(60);
    obj.label4:setText("Panteão: ");
    obj.label4:setName("label4");
    obj.label4:setFontSize(14);
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle", "bold");
    obj.label4:setTextTrimming("character");
    obj.label4:setFontFamily("Constantia");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout9);
    obj.edit4:setAlign("client");
    obj.edit4:setField("fldPanteao");
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(14);
    obj.edit4:setFontColor("#cdcdcd");
    obj.edit4:setTextTrimming("character");
    obj.edit4:setFontFamily("Constantia");
    obj.edit4:setTransparent(true);

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout8);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(35);
    obj.layout10:setName("layout10");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout10);
    obj.label5:setAlign("left");
    obj.label5:setWidth(105);
    obj.label5:setText("Parente Divino: ");
    obj.label5:setName("label5");
    obj.label5:setFontSize(14);
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle", "bold");
    obj.label5:setTextTrimming("character");
    obj.label5:setFontFamily("Constantia");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout10);
    obj.edit5:setAlign("client");
    obj.edit5:setField("fldPaDivino");
    obj.edit5:setName("edit5");
    obj.edit5:setFontSize(14);
    obj.edit5:setFontColor("#cdcdcd");
    obj.edit5:setTextTrimming("character");
    obj.edit5:setFontFamily("Constantia");
    obj.edit5:setTransparent(true);

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout4);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(310);
    obj.layout11:setPadding({left=20, right=20});
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(35);
    obj.layout12:setName("layout12");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout12);
    obj.label6:setAlign("left");
    obj.label6:setWidth(43);
    obj.label6:setText("Idade: ");
    obj.label6:setName("label6");
    obj.label6:setFontSize(14);
    obj.label6:setFontColor("white");
    lfm_setPropAsString(obj.label6, "fontStyle", "bold");
    obj.label6:setTextTrimming("character");
    obj.label6:setFontFamily("Constantia");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout12);
    obj.edit6:setAlign("client");
    obj.edit6:setField("fldIdade");
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(14);
    obj.edit6:setFontColor("#cdcdcd");
    obj.edit6:setTextTrimming("character");
    obj.edit6:setFontFamily("Constantia");
    obj.edit6:setTransparent(true);

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(35);
    obj.layout13:setName("layout13");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout13);
    obj.label7:setAlign("left");
    obj.label7:setWidth(58);
    obj.label7:setText("Crônica: ");
    obj.label7:setName("label7");
    obj.label7:setFontSize(14);
    obj.label7:setFontColor("white");
    lfm_setPropAsString(obj.label7, "fontStyle", "bold");
    obj.label7:setTextTrimming("character");
    obj.label7:setFontFamily("Constantia");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout13);
    obj.edit7:setAlign("client");
    obj.edit7:setField("fldCronica");
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(14);
    obj.edit7:setFontColor("#cdcdcd");
    obj.edit7:setTextTrimming("character");
    obj.edit7:setFontFamily("Constantia");
    obj.edit7:setTransparent(true);

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(215);
    obj.layout14:setPadding({left=20, right=20});
    obj.layout14:setName("layout14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(30);
    obj.layout15:setWidth(425);
    obj.layout15:setName("layout15");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.layout15);
    obj.horzLine2:setAlign("client");
    obj.horzLine2:setMargins({top=14});
    obj.horzLine2:setStrokeColor("#424242");
    obj.horzLine2:setName("horzLine2");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout15);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setMargins({right=275, left=275});
    obj.rectangle4:setColor("#272727");
    obj.rectangle4:setName("rectangle4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout15);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("S A Ú D E   🙵   F E R I M E N T O S");
    obj.label8:setFontSize(20);
    obj.label8:setFontFamily("Constantia");
    obj.label8:setAlign("client");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");
    lfm_setPropAsString(obj.label8, "fontStyle", "bold");
    obj.label8:setTextTrimming("character");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(20);
    obj.layout16:setName("layout16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(165);
    obj.layout17:setName("layout17");

    obj.flLayVida = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flLayVida:setParent(obj.layout17);
    obj.flLayVida:setPadding({right=40});
    obj.flLayVida:setName("flLayVida");
    obj.flLayVida:setAutoHeight(true);
    obj.flLayVida:setAlign("left");
    obj.flLayVida:setWidth(620);
    obj.flLayVida:setOrientation("vertical");
    obj.flLayVida:setMaxControlsPerLine(2);
    obj.flLayVida:setHorzAlign("justify");

    obj.flPart_Machucado01 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flPart_Machucado01:setParent(obj.flLayVida);
    obj.flPart_Machucado01:setName("flPart_Machucado01");
    obj.flPart_Machucado01:setHeight(35);
    obj.flPart_Machucado01:setWidth(270);
    obj.flPart_Machucado01:setMinWidth(270);
    obj.flPart_Machucado01:setMargins({bottom=3});

    obj.rectVidMachucado01 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectVidMachucado01:setParent(obj.flPart_Machucado01);
    obj.rectVidMachucado01:setName("rectVidMachucado01");
    obj.rectVidMachucado01:setAlign("client");
    obj.rectVidMachucado01:setColor("#272727");
    obj.rectVidMachucado01:setXradius(5);
    obj.rectVidMachucado01:setYradius(5);
    obj.rectVidMachucado01:setCornerType("bevel");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectVidMachucado01);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setField("chcBVidMachucado01");
    obj.checkBox1:setWidth(25);
    obj.checkBox1:setMargins({left=5});
    obj.checkBox1:setName("checkBox1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectVidMachucado01);
    obj.dataLink2:setField("chcBVidMachucado01");
    obj.dataLink2:setDefaultValue("false");
    obj.dataLink2:setName("dataLink2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectVidMachucado01);
    obj.label9:setAlign("left");
    obj.label9:setWidth(85);
    obj.label9:setText("Machucado: ");
    obj.label9:setName("label9");
    obj.label9:setFontSize(14);
    obj.label9:setFontColor("white");
    lfm_setPropAsString(obj.label9, "fontStyle", "bold");
    obj.label9:setTextTrimming("character");
    obj.label9:setFontFamily("Constantia");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectVidMachucado01);
    obj.edit8:setAlign("client");
    obj.edit8:setField("fld_Edit-Machucado01");
    obj.edit8:setName("edit8");
    obj.edit8:setFontSize(14);
    obj.edit8:setFontColor("#cdcdcd");
    obj.edit8:setTextTrimming("character");
    obj.edit8:setFontFamily("Constantia");
    obj.edit8:setTransparent(true);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectVidMachucado01);
    obj.dataLink3:setField("fld_Edit-Machucado01");
    obj.dataLink3:setDefaultValue("—");
    obj.dataLink3:setName("dataLink3");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectVidMachucado01);
    obj.label10:setAlign("right");
    obj.label10:setWidth(30);
    obj.label10:setText("-01");
    obj.label10:setName("label10");
    obj.label10:setFontSize(14);
    obj.label10:setFontColor("white");
    lfm_setPropAsString(obj.label10, "fontStyle", "bold");
    obj.label10:setTextTrimming("character");
    obj.label10:setFontFamily("Constantia");

    obj.flPart_Machucado02 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flPart_Machucado02:setParent(obj.flLayVida);
    obj.flPart_Machucado02:setName("flPart_Machucado02");
    obj.flPart_Machucado02:setHeight(35);
    obj.flPart_Machucado02:setWidth(270);
    obj.flPart_Machucado02:setMinWidth(270);
    obj.flPart_Machucado02:setMargins({bottom=3});

    obj.rectVidMachucado02 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectVidMachucado02:setParent(obj.flPart_Machucado02);
    obj.rectVidMachucado02:setName("rectVidMachucado02");
    obj.rectVidMachucado02:setAlign("client");
    obj.rectVidMachucado02:setColor("#272727");
    obj.rectVidMachucado02:setXradius(5);
    obj.rectVidMachucado02:setYradius(5);
    obj.rectVidMachucado02:setCornerType("bevel");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.rectVidMachucado02);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setField("chcBVidMachucado02");
    obj.checkBox2:setWidth(25);
    obj.checkBox2:setMargins({left=5});
    obj.checkBox2:setName("checkBox2");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectVidMachucado02);
    obj.dataLink4:setField("chcBVidMachucado02");
    obj.dataLink4:setDefaultValue("false");
    obj.dataLink4:setName("dataLink4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectVidMachucado02);
    obj.label11:setAlign("left");
    obj.label11:setWidth(85);
    obj.label11:setText("Machucado: ");
    obj.label11:setName("label11");
    obj.label11:setFontSize(14);
    obj.label11:setFontColor("white");
    lfm_setPropAsString(obj.label11, "fontStyle", "bold");
    obj.label11:setTextTrimming("character");
    obj.label11:setFontFamily("Constantia");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectVidMachucado02);
    obj.edit9:setAlign("client");
    obj.edit9:setField("fld_Edit-Machucado02");
    obj.edit9:setName("edit9");
    obj.edit9:setFontSize(14);
    obj.edit9:setFontColor("#cdcdcd");
    obj.edit9:setTextTrimming("character");
    obj.edit9:setFontFamily("Constantia");
    obj.edit9:setTransparent(true);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectVidMachucado02);
    obj.dataLink5:setField("fld_Edit-Machucado02");
    obj.dataLink5:setDefaultValue("—");
    obj.dataLink5:setName("dataLink5");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectVidMachucado02);
    obj.label12:setAlign("right");
    obj.label12:setWidth(30);
    obj.label12:setText("-01");
    obj.label12:setName("label12");
    obj.label12:setFontSize(14);
    obj.label12:setFontColor("white");
    lfm_setPropAsString(obj.label12, "fontStyle", "bold");
    obj.label12:setTextTrimming("character");
    obj.label12:setFontFamily("Constantia");

    obj.flPart_Machucado03 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flPart_Machucado03:setParent(obj.flLayVida);
    obj.flPart_Machucado03:setName("flPart_Machucado03");
    obj.flPart_Machucado03:setHeight(35);
    obj.flPart_Machucado03:setWidth(270);
    obj.flPart_Machucado03:setMinWidth(270);
    obj.flPart_Machucado03:setMargins({bottom=3});

    obj.rectVidMachucado03 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectVidMachucado03:setParent(obj.flPart_Machucado03);
    obj.rectVidMachucado03:setName("rectVidMachucado03");
    obj.rectVidMachucado03:setAlign("client");
    obj.rectVidMachucado03:setColor("#272727");
    obj.rectVidMachucado03:setXradius(5);
    obj.rectVidMachucado03:setYradius(5);
    obj.rectVidMachucado03:setCornerType("bevel");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.rectVidMachucado03);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setField("chcBVidMachucado03");
    obj.checkBox3:setWidth(25);
    obj.checkBox3:setMargins({left=5});
    obj.checkBox3:setName("checkBox3");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectVidMachucado03);
    obj.dataLink6:setField("chcBVidMachucado03");
    obj.dataLink6:setDefaultValue("false");
    obj.dataLink6:setName("dataLink6");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectVidMachucado03);
    obj.label13:setAlign("left");
    obj.label13:setWidth(85);
    obj.label13:setText("Machucado: ");
    obj.label13:setName("label13");
    obj.label13:setFontSize(14);
    obj.label13:setFontColor("white");
    lfm_setPropAsString(obj.label13, "fontStyle", "bold");
    obj.label13:setTextTrimming("character");
    obj.label13:setFontFamily("Constantia");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectVidMachucado03);
    obj.edit10:setAlign("client");
    obj.edit10:setField("fld_Edit-Machucado03");
    obj.edit10:setName("edit10");
    obj.edit10:setFontSize(14);
    obj.edit10:setFontColor("#cdcdcd");
    obj.edit10:setTextTrimming("character");
    obj.edit10:setFontFamily("Constantia");
    obj.edit10:setTransparent(true);

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectVidMachucado03);
    obj.dataLink7:setField("fld_Edit-Machucado03");
    obj.dataLink7:setDefaultValue("—");
    obj.dataLink7:setName("dataLink7");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectVidMachucado03);
    obj.label14:setAlign("right");
    obj.label14:setWidth(30);
    obj.label14:setText("-01");
    obj.label14:setName("label14");
    obj.label14:setFontSize(14);
    obj.label14:setFontColor("white");
    lfm_setPropAsString(obj.label14, "fontStyle", "bold");
    obj.label14:setTextTrimming("character");
    obj.label14:setFontFamily("Constantia");

    obj.flPart_Machucado04 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flPart_Machucado04:setParent(obj.flLayVida);
    obj.flPart_Machucado04:setName("flPart_Machucado04");
    obj.flPart_Machucado04:setHeight(35);
    obj.flPart_Machucado04:setWidth(270);
    obj.flPart_Machucado04:setMinWidth(270);
    obj.flPart_Machucado04:setMargins({bottom=3});

    obj.rectVidMachucado04 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectVidMachucado04:setParent(obj.flPart_Machucado04);
    obj.rectVidMachucado04:setName("rectVidMachucado04");
    obj.rectVidMachucado04:setAlign("client");
    obj.rectVidMachucado04:setColor("#272727");
    obj.rectVidMachucado04:setXradius(5);
    obj.rectVidMachucado04:setYradius(5);
    obj.rectVidMachucado04:setCornerType("bevel");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.rectVidMachucado04);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setField("chcBVidMachucado04");
    obj.checkBox4:setWidth(25);
    obj.checkBox4:setMargins({left=5});
    obj.checkBox4:setName("checkBox4");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectVidMachucado04);
    obj.dataLink8:setField("chcBVidMachucado04");
    obj.dataLink8:setDefaultValue("false");
    obj.dataLink8:setName("dataLink8");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectVidMachucado04);
    obj.label15:setAlign("left");
    obj.label15:setWidth(85);
    obj.label15:setText("Machucado: ");
    obj.label15:setName("label15");
    obj.label15:setFontSize(14);
    obj.label15:setFontColor("white");
    lfm_setPropAsString(obj.label15, "fontStyle", "bold");
    obj.label15:setTextTrimming("character");
    obj.label15:setFontFamily("Constantia");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectVidMachucado04);
    obj.edit11:setAlign("client");
    obj.edit11:setField("fld_Edit-Machucado04");
    obj.edit11:setName("edit11");
    obj.edit11:setFontSize(14);
    obj.edit11:setFontColor("#cdcdcd");
    obj.edit11:setTextTrimming("character");
    obj.edit11:setFontFamily("Constantia");
    obj.edit11:setTransparent(true);

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectVidMachucado04);
    obj.dataLink9:setField("fld_Edit-Machucado04");
    obj.dataLink9:setDefaultValue("—");
    obj.dataLink9:setName("dataLink9");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectVidMachucado04);
    obj.label16:setAlign("right");
    obj.label16:setWidth(30);
    obj.label16:setText("-01");
    obj.label16:setName("label16");
    obj.label16:setFontSize(14);
    obj.label16:setFontColor("white");
    lfm_setPropAsString(obj.label16, "fontStyle", "bold");
    obj.label16:setTextTrimming("character");
    obj.label16:setFontFamily("Constantia");

    obj.flPart_Machucado05 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flPart_Machucado05:setParent(obj.flLayVida);
    obj.flPart_Machucado05:setName("flPart_Machucado05");
    obj.flPart_Machucado05:setHeight(35);
    obj.flPart_Machucado05:setWidth(270);
    obj.flPart_Machucado05:setMinWidth(270);
    obj.flPart_Machucado05:setMargins({bottom=3});

    obj.rectVidMachucado05 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectVidMachucado05:setParent(obj.flPart_Machucado05);
    obj.rectVidMachucado05:setName("rectVidMachucado05");
    obj.rectVidMachucado05:setAlign("client");
    obj.rectVidMachucado05:setColor("#272727");
    obj.rectVidMachucado05:setXradius(5);
    obj.rectVidMachucado05:setYradius(5);
    obj.rectVidMachucado05:setCornerType("bevel");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.rectVidMachucado05);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setField("chcBVidMachucado05");
    obj.checkBox5:setWidth(25);
    obj.checkBox5:setMargins({left=5});
    obj.checkBox5:setName("checkBox5");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectVidMachucado05);
    obj.dataLink10:setField("chcBVidMachucado05");
    obj.dataLink10:setDefaultValue("false");
    obj.dataLink10:setName("dataLink10");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectVidMachucado05);
    obj.label17:setAlign("left");
    obj.label17:setWidth(85);
    obj.label17:setText("Machucado: ");
    obj.label17:setName("label17");
    obj.label17:setFontSize(14);
    obj.label17:setFontColor("white");
    lfm_setPropAsString(obj.label17, "fontStyle", "bold");
    obj.label17:setTextTrimming("character");
    obj.label17:setFontFamily("Constantia");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectVidMachucado05);
    obj.edit12:setAlign("client");
    obj.edit12:setField("fld_Edit-Machucado05");
    obj.edit12:setName("edit12");
    obj.edit12:setFontSize(14);
    obj.edit12:setFontColor("#cdcdcd");
    obj.edit12:setTextTrimming("character");
    obj.edit12:setFontFamily("Constantia");
    obj.edit12:setTransparent(true);

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectVidMachucado05);
    obj.dataLink11:setField("fld_Edit-Machucado05");
    obj.dataLink11:setDefaultValue("—");
    obj.dataLink11:setName("dataLink11");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectVidMachucado05);
    obj.label18:setAlign("right");
    obj.label18:setWidth(30);
    obj.label18:setText("-01");
    obj.label18:setName("label18");
    obj.label18:setFontSize(14);
    obj.label18:setFontColor("white");
    lfm_setPropAsString(obj.label18, "fontStyle", "bold");
    obj.label18:setTextTrimming("character");
    obj.label18:setFontFamily("Constantia");

    obj.flPart_Machucado06 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flPart_Machucado06:setParent(obj.flLayVida);
    obj.flPart_Machucado06:setName("flPart_Machucado06");
    obj.flPart_Machucado06:setHeight(35);
    obj.flPart_Machucado06:setWidth(270);
    obj.flPart_Machucado06:setMinWidth(270);
    obj.flPart_Machucado06:setMargins({bottom=3});

    obj.rectVidMachucado06 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectVidMachucado06:setParent(obj.flPart_Machucado06);
    obj.rectVidMachucado06:setName("rectVidMachucado06");
    obj.rectVidMachucado06:setAlign("client");
    obj.rectVidMachucado06:setColor("#272727");
    obj.rectVidMachucado06:setXradius(5);
    obj.rectVidMachucado06:setYradius(5);
    obj.rectVidMachucado06:setCornerType("bevel");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.rectVidMachucado06);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setField("chcBVidMachucado06");
    obj.checkBox6:setWidth(25);
    obj.checkBox6:setMargins({left=5});
    obj.checkBox6:setName("checkBox6");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectVidMachucado06);
    obj.dataLink12:setField("chcBVidMachucado06");
    obj.dataLink12:setDefaultValue("false");
    obj.dataLink12:setName("dataLink12");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectVidMachucado06);
    obj.label19:setAlign("left");
    obj.label19:setWidth(85);
    obj.label19:setText("Ferimento: ");
    obj.label19:setName("label19");
    obj.label19:setFontSize(14);
    obj.label19:setFontColor("white");
    lfm_setPropAsString(obj.label19, "fontStyle", "bold");
    obj.label19:setTextTrimming("character");
    obj.label19:setFontFamily("Constantia");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectVidMachucado06);
    obj.edit13:setAlign("client");
    obj.edit13:setField("fld_Edit-Machucado06");
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(14);
    obj.edit13:setFontColor("#cdcdcd");
    obj.edit13:setTextTrimming("character");
    obj.edit13:setFontFamily("Constantia");
    obj.edit13:setTransparent(true);

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectVidMachucado06);
    obj.dataLink13:setField("fld_Edit-Machucado06");
    obj.dataLink13:setDefaultValue("—");
    obj.dataLink13:setName("dataLink13");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectVidMachucado06);
    obj.label20:setAlign("right");
    obj.label20:setWidth(30);
    obj.label20:setText("-02");
    obj.label20:setName("label20");
    obj.label20:setFontSize(14);
    obj.label20:setFontColor("white");
    lfm_setPropAsString(obj.label20, "fontStyle", "bold");
    obj.label20:setTextTrimming("character");
    obj.label20:setFontFamily("Constantia");

    obj.flPart_Machucado07 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flPart_Machucado07:setParent(obj.flLayVida);
    obj.flPart_Machucado07:setName("flPart_Machucado07");
    obj.flPart_Machucado07:setHeight(35);
    obj.flPart_Machucado07:setWidth(270);
    obj.flPart_Machucado07:setMinWidth(270);
    obj.flPart_Machucado07:setMargins({bottom=3});

    obj.rectVidMachucado07 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectVidMachucado07:setParent(obj.flPart_Machucado07);
    obj.rectVidMachucado07:setName("rectVidMachucado07");
    obj.rectVidMachucado07:setAlign("client");
    obj.rectVidMachucado07:setColor("#272727");
    obj.rectVidMachucado07:setXradius(5);
    obj.rectVidMachucado07:setYradius(5);
    obj.rectVidMachucado07:setCornerType("bevel");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.rectVidMachucado07);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setField("chcBVidMachucado07");
    obj.checkBox7:setWidth(25);
    obj.checkBox7:setMargins({left=5});
    obj.checkBox7:setName("checkBox7");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectVidMachucado07);
    obj.dataLink14:setField("chcBVidMachucado07");
    obj.dataLink14:setDefaultValue("false");
    obj.dataLink14:setName("dataLink14");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectVidMachucado07);
    obj.label21:setAlign("left");
    obj.label21:setWidth(85);
    obj.label21:setText("Mutilação: ");
    obj.label21:setName("label21");
    obj.label21:setFontSize(14);
    obj.label21:setFontColor("white");
    lfm_setPropAsString(obj.label21, "fontStyle", "bold");
    obj.label21:setTextTrimming("character");
    obj.label21:setFontFamily("Constantia");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectVidMachucado07);
    obj.edit14:setAlign("client");
    obj.edit14:setField("fld_Edit-Machucado07");
    obj.edit14:setName("edit14");
    obj.edit14:setFontSize(14);
    obj.edit14:setFontColor("#cdcdcd");
    obj.edit14:setTextTrimming("character");
    obj.edit14:setFontFamily("Constantia");
    obj.edit14:setTransparent(true);

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectVidMachucado07);
    obj.dataLink15:setField("fld_Edit-Machucado07");
    obj.dataLink15:setDefaultValue("—");
    obj.dataLink15:setName("dataLink15");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectVidMachucado07);
    obj.label22:setAlign("right");
    obj.label22:setWidth(30);
    obj.label22:setText("-04");
    obj.label22:setName("label22");
    obj.label22:setFontSize(14);
    obj.label22:setFontColor("white");
    lfm_setPropAsString(obj.label22, "fontStyle", "bold");
    obj.label22:setTextTrimming("character");
    obj.label22:setFontFamily("Constantia");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flLayVida);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setWidth(270);
    obj.flowPart4:setMinWidth(270);
    obj.flowPart4:setMargins({bottom=3});
    obj.flowPart4:setName("flowPart4");

    obj.rectVidInconsciente = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectVidInconsciente:setParent(obj.flowPart4);
    obj.rectVidInconsciente:setName("rectVidInconsciente");
    obj.rectVidInconsciente:setAlign("client");
    obj.rectVidInconsciente:setColor("#272727");
    obj.rectVidInconsciente:setXradius(5);
    obj.rectVidInconsciente:setYradius(5);
    obj.rectVidInconsciente:setCornerType("bevel");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.rectVidInconsciente);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setField("chcBVidInconsciente");
    obj.checkBox8:setWidth(25);
    obj.checkBox8:setMargins({left=5});
    obj.checkBox8:setName("checkBox8");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectVidInconsciente);
    obj.dataLink16:setField("chcBVidInconsciente");
    obj.dataLink16:setDefaultValue("false");
    obj.dataLink16:setName("dataLink16");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectVidInconsciente);
    obj.label23:setAlign("left");
    obj.label23:setWidth(100);
    obj.label23:setText("Inconsciente");
    obj.label23:setName("label23");
    obj.label23:setFontSize(14);
    obj.label23:setFontColor("white");
    lfm_setPropAsString(obj.label23, "fontStyle", "bold");
    obj.label23:setTextTrimming("character");
    obj.label23:setFontFamily("Constantia");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout17);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(310);
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(35);
    obj.layout19:setMargins({bottom=3});
    obj.layout19:setName("layout19");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout19);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(35);
    obj.rectangle5:setHeight(35);
    obj.rectangle5:setColor("#202020");
    obj.rectangle5:setMargins({right=15});
    obj.rectangle5:setXradius(15);
    obj.rectangle5:setYradius(15);
    obj.rectangle5:setCornerType("bevel");
    obj.rectangle5:setName("rectangle5");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle5);
    obj.label24:setField("rollDefesa");
    obj.label24:setAlign("client");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setVertTextAlign("center");
    obj.label24:setMargins({bottom=5});
    obj.label24:setName("label24");
    obj.label24:setFontSize(14);
    obj.label24:setFontColor("white");
    lfm_setPropAsString(obj.label24, "fontStyle", "bold");
    obj.label24:setTextTrimming("character");
    obj.label24:setFontFamily("Constantia");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle5);
    obj.dataLink17:setField("rollDefesa");
    obj.dataLink17:setDefaultValue("0");
    obj.dataLink17:setName("dataLink17");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout19);
    obj.label25:setAlign("left");
    obj.label25:setWidth(200);
    obj.label25:setHorzTextAlign("leading");
    obj.label25:setText("R O L A G E M   D E   D E F E S A");
    obj.label25:setName("label25");
    obj.label25:setFontSize(10);
    obj.label25:setFontColor("white");
    obj.label25:setTextTrimming("character");
    obj.label25:setFontFamily("Constantia");
    lfm_setPropAsString(obj.label25, "fontStyle", "bold");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout18);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(35);
    obj.layout20:setMargins({bottom=3});
    obj.layout20:setName("layout20");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout20);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(35);
    obj.rectangle6:setHeight(35);
    obj.rectangle6:setColor("#202020");
    obj.rectangle6:setMargins({right=15});
    obj.rectangle6:setXradius(15);
    obj.rectangle6:setYradius(15);
    obj.rectangle6:setCornerType("bevel");
    obj.rectangle6:setName("rectangle6");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle6);
    obj.label26:setField("rollMovimento");
    obj.label26:setAlign("client");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setVertTextAlign("center");
    obj.label26:setMargins({bottom=5});
    obj.label26:setName("label26");
    obj.label26:setFontSize(14);
    obj.label26:setFontColor("white");
    lfm_setPropAsString(obj.label26, "fontStyle", "bold");
    obj.label26:setTextTrimming("character");
    obj.label26:setFontFamily("Constantia");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.rectangle6);
    obj.dataLink18:setField("rollMovimento");
    obj.dataLink18:setDefaultValue("0");
    obj.dataLink18:setName("dataLink18");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout20);
    obj.label27:setAlign("left");
    obj.label27:setWidth(200);
    obj.label27:setHorzTextAlign("leading");
    obj.label27:setText("R O L A G E M   D E   M O V I M E N T O");
    obj.label27:setName("label27");
    obj.label27:setFontSize(10);
    obj.label27:setFontColor("white");
    obj.label27:setTextTrimming("character");
    obj.label27:setFontFamily("Constantia");
    lfm_setPropAsString(obj.label27, "fontStyle", "bold");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout2);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(50);
    obj.layout21:setPadding({left=20, right=20});
    obj.layout21:setName("layout21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(30);
    obj.layout22:setWidth(425);
    obj.layout22:setName("layout22");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.layout22);
    obj.horzLine3:setAlign("client");
    obj.horzLine3:setMargins({top=14});
    obj.horzLine3:setStrokeColor("#424242");
    obj.horzLine3:setName("horzLine3");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout22);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setMargins({right=350, left=350});
    obj.rectangle7:setColor("#272727");
    obj.rectangle7:setName("rectangle7");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout22);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setText("A T R I B U T O S");
    obj.label28:setFontSize(20);
    obj.label28:setFontFamily("Constantia");
    obj.label28:setAlign("client");
    obj.label28:setName("label28");
    obj.label28:setFontColor("white");
    lfm_setPropAsString(obj.label28, "fontStyle", "bold");
    obj.label28:setTextTrimming("character");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout2);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(260);
    obj.layout23:setName("layout23");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(310);
    obj.layout24:setPadding({left=20, right=20});
    obj.layout24:setName("layout24");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setHeight(165);
    obj.layout25:setAlign("top");
    obj.layout25:setMargins({bottom=20});
    obj.layout25:setName("layout25");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout25);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("#2d2d2d");
    obj.rectangle8:setPadding({top=15, left=25, bottom=15, right=25});
    obj.rectangle8:setXradius(5);
    obj.rectangle8:setYradius(5);
    obj.rectangle8:setCornerType("bevel");
    obj.rectangle8:setName("rectangle8");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.rectangle8);
    obj.flowLayout3:setOrientation("vertical");
    obj.flowLayout3:setAlign("client");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxColumns(1);
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout3);
    obj.flowPart5:setMargins({bottom=5});
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMinWidth(220);
    obj.flowPart5:setMaxWidth(550);
    obj.flowPart5:setHeight(25);

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart5);
    obj.label29:setText("F Í S I C O");
    obj.label29:setName("label29");
    obj.label29:setFontSize(10);
    obj.label29:setFontColor("white");
    obj.label29:setTextTrimming("character");
    obj.label29:setFontFamily("Constantia");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setAlign("top");
    lfm_setPropAsString(obj.label29, "fontStyle", "bold");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout3);
    obj.flowPart6:setMargins({bottom=10});
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMinWidth(220);
    obj.flowPart6:setMaxWidth(550);
    obj.flowPart6:setHeight(25);

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart6);
    obj.label30:setAlign("left");
    obj.label30:setWidth(100);
    obj.label30:setText("Força");
    obj.label30:setName("label30");
    obj.label30:setFontSize(14);
    obj.label30:setFontColor("white");
    lfm_setPropAsString(obj.label30, "fontStyle", "bold");
    obj.label30:setTextTrimming("character");
    obj.label30:setFontFamily("Constantia");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowPart6);
    obj.layout26:setAlign("client");
    obj.layout26:setName("layout26");

    obj.nomeCheck01_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck01_01:setParent(obj.layout26);
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
    obj.nomeCheck01_02:setParent(obj.layout26);
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
    obj.nomeCheck01_03:setParent(obj.layout26);
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
    obj.nomeCheck01_04:setParent(obj.layout26);
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
    obj.nomeCheck01_05:setParent(obj.layout26);
    obj.nomeCheck01_05:setField("fldCheck01_05");
    obj.nomeCheck01_05:setName("nomeCheck01_05");
    obj.nomeCheck01_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck01_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck01_05:setHeight(25);
    obj.nomeCheck01_05:setWidth(14);
    obj.nomeCheck01_05:setAlign("right");
    obj.nomeCheck01_05:setMargins({left=3});
    obj.nomeCheck01_05:setAutoChange(false);

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout3);
    obj.flowPart7:setMargins({bottom=10});
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMinWidth(220);
    obj.flowPart7:setMaxWidth(550);
    obj.flowPart7:setHeight(25);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart7);
    obj.label31:setAlign("left");
    obj.label31:setWidth(100);
    obj.label31:setText("Destreza");
    obj.label31:setName("label31");
    obj.label31:setFontSize(14);
    obj.label31:setFontColor("white");
    lfm_setPropAsString(obj.label31, "fontStyle", "bold");
    obj.label31:setTextTrimming("character");
    obj.label31:setFontFamily("Constantia");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowPart7);
    obj.layout27:setAlign("client");
    obj.layout27:setName("layout27");

    obj.nomeCheck02_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck02_01:setParent(obj.layout27);
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
    obj.nomeCheck02_02:setParent(obj.layout27);
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
    obj.nomeCheck02_03:setParent(obj.layout27);
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
    obj.nomeCheck02_04:setParent(obj.layout27);
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
    obj.nomeCheck02_05:setParent(obj.layout27);
    obj.nomeCheck02_05:setField("fldCheck02_05");
    obj.nomeCheck02_05:setName("nomeCheck02_05");
    obj.nomeCheck02_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck02_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck02_05:setHeight(25);
    obj.nomeCheck02_05:setWidth(14);
    obj.nomeCheck02_05:setAlign("right");
    obj.nomeCheck02_05:setMargins({left=3});
    obj.nomeCheck02_05:setAutoChange(false);

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout3);
    obj.flowPart8:setMargins({bottom=10});
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMinWidth(220);
    obj.flowPart8:setMaxWidth(550);
    obj.flowPart8:setHeight(25);

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart8);
    obj.label32:setAlign("left");
    obj.label32:setWidth(100);
    obj.label32:setText("Vigor");
    obj.label32:setName("label32");
    obj.label32:setFontSize(14);
    obj.label32:setFontColor("white");
    lfm_setPropAsString(obj.label32, "fontStyle", "bold");
    obj.label32:setTextTrimming("character");
    obj.label32:setFontFamily("Constantia");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flowPart8);
    obj.layout28:setAlign("client");
    obj.layout28:setName("layout28");

    obj.nomeCheck03_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck03_01:setParent(obj.layout28);
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
    obj.nomeCheck03_02:setParent(obj.layout28);
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
    obj.nomeCheck03_03:setParent(obj.layout28);
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
    obj.nomeCheck03_04:setParent(obj.layout28);
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
    obj.nomeCheck03_05:setParent(obj.layout28);
    obj.nomeCheck03_05:setField("fldCheck03_05");
    obj.nomeCheck03_05:setName("nomeCheck03_05");
    obj.nomeCheck03_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck03_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck03_05:setHeight(25);
    obj.nomeCheck03_05:setWidth(14);
    obj.nomeCheck03_05:setAlign("right");
    obj.nomeCheck03_05:setMargins({left=3});
    obj.nomeCheck03_05:setAutoChange(false);

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout24);
    obj.layout29:setHeight(55);
    obj.layout29:setAlign("top");
    obj.layout29:setName("layout29");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.layout29);
    obj.flowLayout4:setOrientation("vertical");
    obj.flowLayout4:setAlign("client");
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxColumns(1);
    obj.flowLayout4:setName("flowLayout4");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowLayout4);
    obj.label33:setText("L E N D A");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setMargins({bottom=10});
    obj.label33:setName("label33");
    obj.label33:setFontSize(10);
    obj.label33:setFontColor("white");
    obj.label33:setTextTrimming("character");
    obj.label33:setFontFamily("Constantia");
    obj.label33:setAlign("top");
    lfm_setPropAsString(obj.label33, "fontStyle", "bold");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout4);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMinWidth(220);
    obj.flowPart9:setMaxWidth(550);
    obj.flowPart9:setHeight(25);
    obj.flowPart9:setMargins({left=20, right=20, bottom=10});

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowPart9);
    obj.flowLayout5:setAlign("client");
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowLayout5);
    obj.layout30:setWidth(14);
    obj.layout30:setHeight(25);
    obj.layout30:setMargins({right=3});
    obj.layout30:setName("layout30");

    obj.checkMulVit_Des_01_Leg = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_01_Leg:setParent(obj.layout30);
    obj.checkMulVit_Des_01_Leg:setName("checkMulVit_Des_01_Leg");
    obj.checkMulVit_Des_01_Leg:setWidth(14);
    obj.checkMulVit_Des_01_Leg:setHeight(25);
    obj.checkMulVit_Des_01_Leg:setField("checkMulVit_Des_01_Leg");
    obj.checkMulVit_Des_01_Leg:setStyle("proportional");
    obj.checkMulVit_Des_01_Leg:setVisible(true);
    obj.checkMulVit_Des_01_Leg:setHitTest(true);
    obj.checkMulVit_Des_01_Leg:setCursor("handPoint");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout30);
    obj.dataLink19:setField("checkMulVit_Des_01_Leg");
    obj.dataLink19:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink19:setName("dataLink19");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.flowLayout5);
    obj.layout31:setWidth(14);
    obj.layout31:setHeight(25);
    obj.layout31:setMargins({right=3});
    obj.layout31:setName("layout31");

    obj.checkMulVit_Des_02_Leg = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_02_Leg:setParent(obj.layout31);
    obj.checkMulVit_Des_02_Leg:setName("checkMulVit_Des_02_Leg");
    obj.checkMulVit_Des_02_Leg:setWidth(14);
    obj.checkMulVit_Des_02_Leg:setHeight(25);
    obj.checkMulVit_Des_02_Leg:setField("checkMulVit_Des_02_Leg");
    obj.checkMulVit_Des_02_Leg:setStyle("proportional");
    obj.checkMulVit_Des_02_Leg:setVisible(true);
    obj.checkMulVit_Des_02_Leg:setHitTest(true);
    obj.checkMulVit_Des_02_Leg:setCursor("handPoint");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout31);
    obj.dataLink20:setField("checkMulVit_Des_02_Leg");
    obj.dataLink20:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink20:setName("dataLink20");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.flowLayout5);
    obj.layout32:setWidth(14);
    obj.layout32:setHeight(25);
    obj.layout32:setMargins({right=3});
    obj.layout32:setName("layout32");

    obj.checkMulVit_Des_03_Leg = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_03_Leg:setParent(obj.layout32);
    obj.checkMulVit_Des_03_Leg:setName("checkMulVit_Des_03_Leg");
    obj.checkMulVit_Des_03_Leg:setWidth(14);
    obj.checkMulVit_Des_03_Leg:setHeight(25);
    obj.checkMulVit_Des_03_Leg:setField("checkMulVit_Des_03_Leg");
    obj.checkMulVit_Des_03_Leg:setStyle("proportional");
    obj.checkMulVit_Des_03_Leg:setVisible(true);
    obj.checkMulVit_Des_03_Leg:setHitTest(true);
    obj.checkMulVit_Des_03_Leg:setCursor("handPoint");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout32);
    obj.dataLink21:setField("checkMulVit_Des_03_Leg");
    obj.dataLink21:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink21:setName("dataLink21");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.flowLayout5);
    obj.layout33:setWidth(14);
    obj.layout33:setHeight(25);
    obj.layout33:setMargins({right=3});
    obj.layout33:setName("layout33");

    obj.checkMulVit_Des_04_Leg = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_04_Leg:setParent(obj.layout33);
    obj.checkMulVit_Des_04_Leg:setName("checkMulVit_Des_04_Leg");
    obj.checkMulVit_Des_04_Leg:setWidth(14);
    obj.checkMulVit_Des_04_Leg:setHeight(25);
    obj.checkMulVit_Des_04_Leg:setField("checkMulVit_Des_04_Leg");
    obj.checkMulVit_Des_04_Leg:setStyle("proportional");
    obj.checkMulVit_Des_04_Leg:setVisible(true);
    obj.checkMulVit_Des_04_Leg:setHitTest(true);
    obj.checkMulVit_Des_04_Leg:setCursor("handPoint");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout33);
    obj.dataLink22:setField("checkMulVit_Des_04_Leg");
    obj.dataLink22:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink22:setName("dataLink22");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.flowLayout5);
    obj.layout34:setWidth(14);
    obj.layout34:setHeight(25);
    obj.layout34:setMargins({});
    obj.layout34:setName("layout34");

    obj.checkMulVit_Des_05_Leg = GUI.fromHandle(_obj_newObject("image"));
    obj.checkMulVit_Des_05_Leg:setParent(obj.layout34);
    obj.checkMulVit_Des_05_Leg:setName("checkMulVit_Des_05_Leg");
    obj.checkMulVit_Des_05_Leg:setWidth(14);
    obj.checkMulVit_Des_05_Leg:setHeight(25);
    obj.checkMulVit_Des_05_Leg:setField("checkMulVit_Des_05_Leg");
    obj.checkMulVit_Des_05_Leg:setStyle("proportional");
    obj.checkMulVit_Des_05_Leg:setVisible(true);
    obj.checkMulVit_Des_05_Leg:setHitTest(true);
    obj.checkMulVit_Des_05_Leg:setCursor("handPoint");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout34);
    obj.dataLink23:setField("checkMulVit_Des_05_Leg");
    obj.dataLink23:setDefaultValue("/images/checkBoxDes.png");
    obj.dataLink23:setName("dataLink23");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout23);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(310);
    obj.layout35:setPadding({left=20, right=20});
    obj.layout35:setName("layout35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout35);
    obj.layout36:setHeight(165);
    obj.layout36:setAlign("top");
    obj.layout36:setMargins({bottom=20});
    obj.layout36:setName("layout36");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout36);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("#2d2d2d");
    obj.rectangle9:setPadding({top=15, left=25, bottom=15, right=25});
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(5);
    obj.rectangle9:setCornerType("bevel");
    obj.rectangle9:setName("rectangle9");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.rectangle9);
    obj.flowLayout6:setOrientation("vertical");
    obj.flowLayout6:setAlign("client");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxColumns(1);
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout6);
    obj.flowPart10:setMargins({bottom=5});
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setMinWidth(220);
    obj.flowPart10:setMaxWidth(550);
    obj.flowPart10:setHeight(25);

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.flowPart10);
    obj.label34:setText("S O C I A L");
    obj.label34:setName("label34");
    obj.label34:setFontSize(10);
    obj.label34:setFontColor("white");
    obj.label34:setTextTrimming("character");
    obj.label34:setFontFamily("Constantia");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setAlign("top");
    lfm_setPropAsString(obj.label34, "fontStyle", "bold");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout6);
    obj.flowPart11:setMargins({bottom=10});
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setMinWidth(220);
    obj.flowPart11:setMaxWidth(550);
    obj.flowPart11:setHeight(25);

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart11);
    obj.label35:setAlign("left");
    obj.label35:setWidth(100);
    obj.label35:setText("Carisma");
    obj.label35:setName("label35");
    obj.label35:setFontSize(14);
    obj.label35:setFontColor("white");
    lfm_setPropAsString(obj.label35, "fontStyle", "bold");
    obj.label35:setTextTrimming("character");
    obj.label35:setFontFamily("Constantia");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.flowPart11);
    obj.layout37:setAlign("client");
    obj.layout37:setName("layout37");

    obj.nomeCheck04_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck04_01:setParent(obj.layout37);
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
    obj.nomeCheck04_02:setParent(obj.layout37);
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
    obj.nomeCheck04_03:setParent(obj.layout37);
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
    obj.nomeCheck04_04:setParent(obj.layout37);
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
    obj.nomeCheck04_05:setParent(obj.layout37);
    obj.nomeCheck04_05:setField("fldCheck04_05");
    obj.nomeCheck04_05:setName("nomeCheck04_05");
    obj.nomeCheck04_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck04_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck04_05:setHeight(25);
    obj.nomeCheck04_05:setWidth(14);
    obj.nomeCheck04_05:setAlign("right");
    obj.nomeCheck04_05:setMargins({left=3});
    obj.nomeCheck04_05:setAutoChange(false);

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout6);
    obj.flowPart12:setMargins({bottom=10});
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setMinWidth(220);
    obj.flowPart12:setMaxWidth(550);
    obj.flowPart12:setHeight(25);

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart12);
    obj.label36:setAlign("left");
    obj.label36:setWidth(100);
    obj.label36:setText("Manipulação");
    obj.label36:setName("label36");
    obj.label36:setFontSize(14);
    obj.label36:setFontColor("white");
    lfm_setPropAsString(obj.label36, "fontStyle", "bold");
    obj.label36:setTextTrimming("character");
    obj.label36:setFontFamily("Constantia");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.flowPart12);
    obj.layout38:setAlign("client");
    obj.layout38:setName("layout38");

    obj.nomeCheck05_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck05_01:setParent(obj.layout38);
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
    obj.nomeCheck05_02:setParent(obj.layout38);
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
    obj.nomeCheck05_03:setParent(obj.layout38);
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
    obj.nomeCheck05_04:setParent(obj.layout38);
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
    obj.nomeCheck05_05:setParent(obj.layout38);
    obj.nomeCheck05_05:setField("fldCheck05_05");
    obj.nomeCheck05_05:setName("nomeCheck05_05");
    obj.nomeCheck05_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck05_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck05_05:setHeight(25);
    obj.nomeCheck05_05:setWidth(14);
    obj.nomeCheck05_05:setAlign("right");
    obj.nomeCheck05_05:setMargins({left=3});
    obj.nomeCheck05_05:setAutoChange(false);

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout6);
    obj.flowPart13:setMargins({bottom=10});
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setMinWidth(220);
    obj.flowPart13:setMaxWidth(550);
    obj.flowPart13:setHeight(25);

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart13);
    obj.label37:setAlign("left");
    obj.label37:setWidth(100);
    obj.label37:setText("Autocontrole");
    obj.label37:setName("label37");
    obj.label37:setFontSize(14);
    obj.label37:setFontColor("white");
    lfm_setPropAsString(obj.label37, "fontStyle", "bold");
    obj.label37:setTextTrimming("character");
    obj.label37:setFontFamily("Constantia");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.flowPart13);
    obj.layout39:setAlign("client");
    obj.layout39:setName("layout39");

    obj.nomeCheck06_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck06_01:setParent(obj.layout39);
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
    obj.nomeCheck06_02:setParent(obj.layout39);
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
    obj.nomeCheck06_03:setParent(obj.layout39);
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
    obj.nomeCheck06_04:setParent(obj.layout39);
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
    obj.nomeCheck06_05:setParent(obj.layout39);
    obj.nomeCheck06_05:setField("fldCheck06_05");
    obj.nomeCheck06_05:setName("nomeCheck06_05");
    obj.nomeCheck06_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck06_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck06_05:setHeight(25);
    obj.nomeCheck06_05:setWidth(14);
    obj.nomeCheck06_05:setAlign("right");
    obj.nomeCheck06_05:setMargins({left=3});
    obj.nomeCheck06_05:setAutoChange(false);

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout35);
    obj.layout40:setHeight(45);
    obj.layout40:setAlign("top");
    obj.layout40:setName("layout40");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.layout40);
    obj.flowLayout7:setOrientation("vertical");
    obj.flowLayout7:setAlign("client");
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMaxColumns(1);
    obj.flowLayout7:setName("flowLayout7");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowLayout7);
    obj.label38:setText("I M P U L S O");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setMargins({bottom=10});
    obj.label38:setName("label38");
    obj.label38:setFontSize(10);
    obj.label38:setFontColor("white");
    obj.label38:setTextTrimming("character");
    obj.label38:setFontFamily("Constantia");
    obj.label38:setAlign("top");
    lfm_setPropAsString(obj.label38, "fontStyle", "bold");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout7);
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setMinWidth(220);
    obj.flowPart14:setMaxWidth(550);
    obj.flowPart14:setHeight(25);
    obj.flowPart14:setMargins({left=20, right=20, bottom=10});

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowPart14);
    obj.flowLayout8:setHorzAlign("center");
    obj.flowLayout8:setMargins({bottom=5});
    obj.flowLayout8:setAlign("client");
    obj.flowLayout8:setOrientation("horizontal");
    obj.flowLayout8:setName("flowLayout8");

    obj.checkImp_01_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_01_Imp:setParent(obj.flowLayout8);
    obj.checkImp_01_Imp:setMargins({right=3});
    obj.checkImp_01_Imp:setName("checkImp_01_Imp");
    obj.checkImp_01_Imp:setField("fldCheckImp_01");
    obj.checkImp_01_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_01_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_01_Imp:setHeight(25);
    obj.checkImp_01_Imp:setWidth(14);
    obj.checkImp_01_Imp:setAlign("right");
    obj.checkImp_01_Imp:setAutoChange(false);

    obj.checkImp_02_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_02_Imp:setParent(obj.flowLayout8);
    obj.checkImp_02_Imp:setMargins({right=3});
    obj.checkImp_02_Imp:setName("checkImp_02_Imp");
    obj.checkImp_02_Imp:setField("fldCheckImp_02");
    obj.checkImp_02_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_02_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_02_Imp:setHeight(25);
    obj.checkImp_02_Imp:setWidth(14);
    obj.checkImp_02_Imp:setAlign("right");
    obj.checkImp_02_Imp:setAutoChange(false);

    obj.checkImp_03_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_03_Imp:setParent(obj.flowLayout8);
    obj.checkImp_03_Imp:setMargins({right=3});
    obj.checkImp_03_Imp:setName("checkImp_03_Imp");
    obj.checkImp_03_Imp:setField("fldCheckImp_03");
    obj.checkImp_03_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_03_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_03_Imp:setHeight(25);
    obj.checkImp_03_Imp:setWidth(14);
    obj.checkImp_03_Imp:setAlign("right");
    obj.checkImp_03_Imp:setAutoChange(false);

    obj.checkImp_04_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_04_Imp:setParent(obj.flowLayout8);
    obj.checkImp_04_Imp:setMargins({right=3});
    obj.checkImp_04_Imp:setName("checkImp_04_Imp");
    obj.checkImp_04_Imp:setField("fldCheckImp_04");
    obj.checkImp_04_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_04_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_04_Imp:setHeight(25);
    obj.checkImp_04_Imp:setWidth(14);
    obj.checkImp_04_Imp:setAlign("right");
    obj.checkImp_04_Imp:setAutoChange(false);

    obj.checkImp_05_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_05_Imp:setParent(obj.flowLayout8);
    obj.checkImp_05_Imp:setMargins({right=3});
    obj.checkImp_05_Imp:setName("checkImp_05_Imp");
    obj.checkImp_05_Imp:setField("fldCheckImp_05");
    obj.checkImp_05_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_05_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_05_Imp:setHeight(25);
    obj.checkImp_05_Imp:setWidth(14);
    obj.checkImp_05_Imp:setAlign("right");
    obj.checkImp_05_Imp:setAutoChange(false);

    obj.checkImp_06_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_06_Imp:setParent(obj.flowLayout8);
    obj.checkImp_06_Imp:setMargins({right=3});
    obj.checkImp_06_Imp:setName("checkImp_06_Imp");
    obj.checkImp_06_Imp:setField("fldCheckImp_06");
    obj.checkImp_06_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_06_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_06_Imp:setHeight(25);
    obj.checkImp_06_Imp:setWidth(14);
    obj.checkImp_06_Imp:setAlign("right");
    obj.checkImp_06_Imp:setAutoChange(false);

    obj.checkImp_07_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_07_Imp:setParent(obj.flowLayout8);
    obj.checkImp_07_Imp:setMargins({right=3});
    obj.checkImp_07_Imp:setName("checkImp_07_Imp");
    obj.checkImp_07_Imp:setField("fldCheckImp_07");
    obj.checkImp_07_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_07_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_07_Imp:setHeight(25);
    obj.checkImp_07_Imp:setWidth(14);
    obj.checkImp_07_Imp:setAlign("right");
    obj.checkImp_07_Imp:setAutoChange(false);

    obj.checkImp_08_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_08_Imp:setParent(obj.flowLayout8);
    obj.checkImp_08_Imp:setMargins({right=3});
    obj.checkImp_08_Imp:setName("checkImp_08_Imp");
    obj.checkImp_08_Imp:setField("fldCheckImp_08");
    obj.checkImp_08_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_08_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_08_Imp:setHeight(25);
    obj.checkImp_08_Imp:setWidth(14);
    obj.checkImp_08_Imp:setAlign("right");
    obj.checkImp_08_Imp:setAutoChange(false);

    obj.checkImp_09_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_09_Imp:setParent(obj.flowLayout8);
    obj.checkImp_09_Imp:setMargins({right=3});
    obj.checkImp_09_Imp:setName("checkImp_09_Imp");
    obj.checkImp_09_Imp:setField("fldCheckImp_09");
    obj.checkImp_09_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_09_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_09_Imp:setHeight(25);
    obj.checkImp_09_Imp:setWidth(14);
    obj.checkImp_09_Imp:setAlign("right");
    obj.checkImp_09_Imp:setAutoChange(false);

    obj.checkImp_10_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_10_Imp:setParent(obj.flowLayout8);
    obj.checkImp_10_Imp:setMargins({right=3});
    obj.checkImp_10_Imp:setName("checkImp_10_Imp");
    obj.checkImp_10_Imp:setField("fldCheckImp_10");
    obj.checkImp_10_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_10_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_10_Imp:setHeight(25);
    obj.checkImp_10_Imp:setWidth(14);
    obj.checkImp_10_Imp:setAlign("right");
    obj.checkImp_10_Imp:setAutoChange(false);

    obj.checkImp_11_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_11_Imp:setParent(obj.flowLayout8);
    obj.checkImp_11_Imp:setMargins({right=3});
    obj.checkImp_11_Imp:setName("checkImp_11_Imp");
    obj.checkImp_11_Imp:setField("fldCheckImp_11");
    obj.checkImp_11_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_11_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_11_Imp:setHeight(25);
    obj.checkImp_11_Imp:setWidth(14);
    obj.checkImp_11_Imp:setAlign("right");
    obj.checkImp_11_Imp:setAutoChange(false);

    obj.checkImp_12_Imp = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkImp_12_Imp:setParent(obj.flowLayout8);
    obj.checkImp_12_Imp:setMargins();
    obj.checkImp_12_Imp:setName("checkImp_12_Imp");
    obj.checkImp_12_Imp:setField("fldCheckImp_12");
    obj.checkImp_12_Imp:setImageChecked("/images/checkBoxAtv.png");
    obj.checkImp_12_Imp:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkImp_12_Imp:setHeight(25);
    obj.checkImp_12_Imp:setWidth(14);
    obj.checkImp_12_Imp:setAlign("right");
    obj.checkImp_12_Imp:setAutoChange(false);

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout23);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(310);
    obj.layout41:setPadding({left=20, right=20});
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setHeight(165);
    obj.layout42:setAlign("top");
    obj.layout42:setMargins({bottom=20});
    obj.layout42:setName("layout42");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout42);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("#2d2d2d");
    obj.rectangle10:setPadding({top=15, left=25, bottom=15, right=25});
    obj.rectangle10:setXradius(5);
    obj.rectangle10:setYradius(5);
    obj.rectangle10:setCornerType("bevel");
    obj.rectangle10:setName("rectangle10");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.rectangle10);
    obj.flowLayout9:setOrientation("vertical");
    obj.flowLayout9:setAlign("client");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxColumns(1);
    obj.flowLayout9:setName("flowLayout9");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout9);
    obj.flowPart15:setMargins({bottom=5});
    obj.flowPart15:setName("flowPart15");
    obj.flowPart15:setMinWidth(220);
    obj.flowPart15:setMaxWidth(550);
    obj.flowPart15:setHeight(25);

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart15);
    obj.label39:setText("M E N T A L");
    obj.label39:setName("label39");
    obj.label39:setFontSize(10);
    obj.label39:setFontColor("white");
    obj.label39:setTextTrimming("character");
    obj.label39:setFontFamily("Constantia");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setAlign("top");
    lfm_setPropAsString(obj.label39, "fontStyle", "bold");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout9);
    obj.flowPart16:setMargins({bottom=10});
    obj.flowPart16:setName("flowPart16");
    obj.flowPart16:setMinWidth(220);
    obj.flowPart16:setMaxWidth(550);
    obj.flowPart16:setHeight(25);

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart16);
    obj.label40:setAlign("left");
    obj.label40:setWidth(100);
    obj.label40:setText("Inteligência");
    obj.label40:setName("label40");
    obj.label40:setFontSize(14);
    obj.label40:setFontColor("white");
    lfm_setPropAsString(obj.label40, "fontStyle", "bold");
    obj.label40:setTextTrimming("character");
    obj.label40:setFontFamily("Constantia");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.flowPart16);
    obj.layout43:setAlign("client");
    obj.layout43:setName("layout43");

    obj.nomeCheck07_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck07_01:setParent(obj.layout43);
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
    obj.nomeCheck07_02:setParent(obj.layout43);
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
    obj.nomeCheck07_03:setParent(obj.layout43);
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
    obj.nomeCheck07_04:setParent(obj.layout43);
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
    obj.nomeCheck07_05:setParent(obj.layout43);
    obj.nomeCheck07_05:setField("fldCheck07_05");
    obj.nomeCheck07_05:setName("nomeCheck07_05");
    obj.nomeCheck07_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck07_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck07_05:setHeight(25);
    obj.nomeCheck07_05:setWidth(14);
    obj.nomeCheck07_05:setAlign("right");
    obj.nomeCheck07_05:setMargins({left=3});
    obj.nomeCheck07_05:setAutoChange(false);

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout9);
    obj.flowPart17:setMargins({bottom=10});
    obj.flowPart17:setName("flowPart17");
    obj.flowPart17:setMinWidth(220);
    obj.flowPart17:setMaxWidth(550);
    obj.flowPart17:setHeight(25);

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart17);
    obj.label41:setAlign("left");
    obj.label41:setWidth(100);
    obj.label41:setText("Raciocínio");
    obj.label41:setName("label41");
    obj.label41:setFontSize(14);
    obj.label41:setFontColor("white");
    lfm_setPropAsString(obj.label41, "fontStyle", "bold");
    obj.label41:setTextTrimming("character");
    obj.label41:setFontFamily("Constantia");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.flowPart17);
    obj.layout44:setAlign("client");
    obj.layout44:setName("layout44");

    obj.nomeCheck08_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck08_01:setParent(obj.layout44);
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
    obj.nomeCheck08_02:setParent(obj.layout44);
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
    obj.nomeCheck08_03:setParent(obj.layout44);
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
    obj.nomeCheck08_04:setParent(obj.layout44);
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
    obj.nomeCheck08_05:setParent(obj.layout44);
    obj.nomeCheck08_05:setField("fldCheck08_05");
    obj.nomeCheck08_05:setName("nomeCheck08_05");
    obj.nomeCheck08_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck08_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck08_05:setHeight(25);
    obj.nomeCheck08_05:setWidth(14);
    obj.nomeCheck08_05:setAlign("right");
    obj.nomeCheck08_05:setMargins({left=3});
    obj.nomeCheck08_05:setAutoChange(false);

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout9);
    obj.flowPart18:setMargins({bottom=10});
    obj.flowPart18:setName("flowPart18");
    obj.flowPart18:setMinWidth(220);
    obj.flowPart18:setMaxWidth(550);
    obj.flowPart18:setHeight(25);

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart18);
    obj.label42:setAlign("left");
    obj.label42:setWidth(100);
    obj.label42:setText("Determinação");
    obj.label42:setName("label42");
    obj.label42:setFontSize(14);
    obj.label42:setFontColor("white");
    lfm_setPropAsString(obj.label42, "fontStyle", "bold");
    obj.label42:setTextTrimming("character");
    obj.label42:setFontFamily("Constantia");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.flowPart18);
    obj.layout45:setAlign("client");
    obj.layout45:setName("layout45");

    obj.nomeCheck09_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck09_01:setParent(obj.layout45);
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
    obj.nomeCheck09_02:setParent(obj.layout45);
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
    obj.nomeCheck09_03:setParent(obj.layout45);
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
    obj.nomeCheck09_04:setParent(obj.layout45);
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
    obj.nomeCheck09_05:setParent(obj.layout45);
    obj.nomeCheck09_05:setField("fldCheck09_05");
    obj.nomeCheck09_05:setName("nomeCheck09_05");
    obj.nomeCheck09_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck09_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck09_05:setHeight(25);
    obj.nomeCheck09_05:setWidth(14);
    obj.nomeCheck09_05:setAlign("right");
    obj.nomeCheck09_05:setMargins({left=3});
    obj.nomeCheck09_05:setAutoChange(false);

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout41);
    obj.layout46:setHeight(55);
    obj.layout46:setAlign("top");
    obj.layout46:setName("layout46");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.layout46);
    obj.flowLayout10:setOrientation("vertical");
    obj.flowLayout10:setAlign("client");
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxColumns(1);
    obj.flowLayout10:setName("flowLayout10");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowLayout10);
    obj.label43:setText("V I R T U D E S");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setMargins({bottom=10});
    obj.label43:setName("label43");
    obj.label43:setFontSize(10);
    obj.label43:setFontColor("white");
    obj.label43:setTextTrimming("character");
    obj.label43:setFontFamily("Constantia");
    obj.label43:setAlign("top");
    lfm_setPropAsString(obj.label43, "fontStyle", "bold");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout10);
    obj.flowPart19:setMargins({bottom=5});
    obj.flowPart19:setMinWidth(310);
    obj.flowPart19:setMaxWidth(310);
    obj.flowPart19:setName("flowPart19");
    obj.flowPart19:setHeight(25);

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowPart19);
    obj.flowLayout11:setAlign("client");
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setName("flowLayout11");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowLayout11);
    obj.edit15:setField("Virtude1");
    obj.edit15:setName("edit15");
    obj.edit15:setFontSize(14);
    obj.edit15:setFontColor("#ffffff");
    obj.edit15:setTextTrimming("character");
    obj.edit15:setFontFamily("Constantia");
    obj.edit15:setTransparent(true);
    obj.edit15:setWidth(92);
    lfm_setPropAsString(obj.edit15, "fontStyle", "italic");
    obj.edit15:setTextPrompt("\"Virtude\"");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.flowLayout11);
    obj.dataLink24:setField("Virtude1");
    obj.dataLink24:setDefaultValue("Virtude 01");
    obj.dataLink24:setName("dataLink24");

    obj.checkVir_01_Vir = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkVir_01_Vir:setParent(obj.flowLayout11);
    obj.checkVir_01_Vir:setName("checkVir_01_Vir");
    obj.checkVir_01_Vir:setField("fldCheckVir_01");
    obj.checkVir_01_Vir:setImageChecked("/images/checkBoxAtv.png");
    obj.checkVir_01_Vir:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkVir_01_Vir:setHeight(25);
    obj.checkVir_01_Vir:setWidth(14);
    obj.checkVir_01_Vir:setAlign("right");
    obj.checkVir_01_Vir:setMargins({left=3});
    obj.checkVir_01_Vir:setAutoChange(false);

    obj.checkVir_02_Vir = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkVir_02_Vir:setParent(obj.flowLayout11);
    obj.checkVir_02_Vir:setName("checkVir_02_Vir");
    obj.checkVir_02_Vir:setField("fldCheckVir_02");
    obj.checkVir_02_Vir:setImageChecked("/images/checkBoxAtv.png");
    obj.checkVir_02_Vir:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkVir_02_Vir:setHeight(25);
    obj.checkVir_02_Vir:setWidth(14);
    obj.checkVir_02_Vir:setAlign("right");
    obj.checkVir_02_Vir:setMargins({left=3});
    obj.checkVir_02_Vir:setAutoChange(false);

    obj.checkVir_03_Vir = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkVir_03_Vir:setParent(obj.flowLayout11);
    obj.checkVir_03_Vir:setName("checkVir_03_Vir");
    obj.checkVir_03_Vir:setField("fldCheckVir_03");
    obj.checkVir_03_Vir:setChecked(true);
    obj.checkVir_03_Vir:setImageChecked("/images/checkBoxAtv.png");
    obj.checkVir_03_Vir:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkVir_03_Vir:setHeight(25);
    obj.checkVir_03_Vir:setWidth(14);
    obj.checkVir_03_Vir:setAlign("right");
    obj.checkVir_03_Vir:setMargins({left=3});
    obj.checkVir_03_Vir:setAutoChange(false);

    obj.checkVir_04_Vir = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkVir_04_Vir:setParent(obj.flowLayout11);
    obj.checkVir_04_Vir:setName("checkVir_04_Vir");
    obj.checkVir_04_Vir:setField("fldCheckVir_04");
    obj.checkVir_04_Vir:setImageChecked("/images/checkBoxAtv.png");
    obj.checkVir_04_Vir:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkVir_04_Vir:setHeight(25);
    obj.checkVir_04_Vir:setWidth(14);
    obj.checkVir_04_Vir:setAlign("right");
    obj.checkVir_04_Vir:setMargins({left=3});
    obj.checkVir_04_Vir:setAutoChange(false);

    obj.checkVir_05_Vir = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.checkVir_05_Vir:setParent(obj.flowLayout11);
    obj.checkVir_05_Vir:setMargins({left=3, right=3});
    obj.checkVir_05_Vir:setName("checkVir_05_Vir");
    obj.checkVir_05_Vir:setField("fldCheckVir_05");
    obj.checkVir_05_Vir:setImageChecked("/images/checkBoxAtv.png");
    obj.checkVir_05_Vir:setImageUnchecked("/images/checkBoxDes.png");
    obj.checkVir_05_Vir:setHeight(25);
    obj.checkVir_05_Vir:setWidth(14);
    obj.checkVir_05_Vir:setAlign("right");
    obj.checkVir_05_Vir:setAutoChange(false);

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowLayout11);
    obj.edit16:setHorzTextAlign("trailing");
    obj.edit16:setField("Virtude2");
    obj.edit16:setName("edit16");
    obj.edit16:setFontSize(14);
    obj.edit16:setFontColor("#ffffff");
    obj.edit16:setTextTrimming("character");
    obj.edit16:setFontFamily("Constantia");
    obj.edit16:setTransparent(true);
    obj.edit16:setWidth(92);
    lfm_setPropAsString(obj.edit16, "fontStyle", "italic");
    obj.edit16:setTextPrompt("\"Virtude\"");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.flowLayout11);
    obj.dataLink25:setField("Virtude2");
    obj.dataLink25:setDefaultValue("Virtude 02");
    obj.dataLink25:setName("dataLink25");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout2);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(50);
    obj.layout47:setPadding({left=20, right=20});
    obj.layout47:setName("layout47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(30);
    obj.layout48:setWidth(425);
    obj.layout48:setName("layout48");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.layout48);
    obj.horzLine4:setAlign("client");
    obj.horzLine4:setMargins({top=14});
    obj.horzLine4:setStrokeColor("#424242");
    obj.horzLine4:setName("horzLine4");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout48);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setMargins({right=335, left=335});
    obj.rectangle11:setColor("#272727");
    obj.rectangle11:setName("rectangle11");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout48);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setText("H A B I L I D A D E S");
    obj.label44:setFontSize(20);
    obj.label44:setFontFamily("Constantia");
    obj.label44:setAlign("client");
    obj.label44:setName("label44");
    obj.label44:setFontColor("white");
    lfm_setPropAsString(obj.label44, "fontStyle", "bold");
    obj.label44:setTextTrimming("character");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout2);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(270);
    obj.layout49:setName("layout49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(465);
    obj.layout50:setName("layout50");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.layout50);
    obj.flowPart20:setHeight(237);
    obj.flowPart20:setMargins({bottom=20});
    obj.flowPart20:setAlign("client");
    obj.flowPart20:setName("flowPart20");
    obj.flowPart20:setMinWidth(220);
    obj.flowPart20:setMaxWidth(550);

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.flowPart20);
    obj.flowLayout12:setOrientation("vertical");
    obj.flowLayout12:setAlign("client");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMaxColumns(1);
    obj.flowLayout12:setName("flowLayout12");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout12);
    obj.flowPart21:setMargins({bottom=5});
    obj.flowPart21:setAlign("client");
    obj.flowPart21:setName("flowPart21");
    obj.flowPart21:setMinWidth(220);
    obj.flowPart21:setMaxWidth(550);
    obj.flowPart21:setHeight(25);

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.flowPart21);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("#2d2d2d");
    obj.rectangle12:setName("rectangle12");

    obj.nomeCheckB10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB10:setParent(obj.rectangle12);
    obj.nomeCheckB10:setName("nomeCheckB10");
    obj.nomeCheckB10:setField("fldCheckB10");
    obj.nomeCheckB10:setWidth(25);
    obj.nomeCheckB10:setAlign("left");
    obj.nomeCheckB10:setMargins({top=3, left=20});

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle12);
    obj.label45:setAlign("left");
    obj.label45:setWidth(100);
    obj.label45:setText("Academia");
    obj.label45:setName("label45");
    obj.label45:setFontSize(14);
    obj.label45:setFontColor("white");
    lfm_setPropAsString(obj.label45, "fontStyle", "bold");
    obj.label45:setTextTrimming("character");
    obj.label45:setFontFamily("Constantia");

    obj.nomeBut10 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut10:setParent(obj.rectangle12);
    obj.nomeBut10:setName("nomeBut10");
    obj.nomeBut10:setText("𝐢");
    obj.nomeBut10:setWidth(22);
    obj.nomeBut10:setHeight(22);
    obj.nomeBut10:setTop(2);
    obj.nomeBut10:setLeft(150);
    obj.nomeBut10:setFontColor("#272727");

    obj.nomeBut10B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut10B:setParent(obj.rectangle12);
    obj.nomeBut10B:setName("nomeBut10B");
    obj.nomeBut10B:setText("𝐢");
    obj.nomeBut10B:setWidth(22);
    obj.nomeBut10B:setHeight(22);
    obj.nomeBut10B:setTop(2);
    obj.nomeBut10B:setLeft(150);
    obj.nomeBut10B:setFontColor("white");
    obj.nomeBut10B:setVisible(false);

    obj.popUp_10 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_10:setParent(obj.rectangle12);
    obj.popUp_10:setName("popUp_10");
    obj.popUp_10:setWidth(200);
    obj.popUp_10:setHeight(100);
    obj.popUp_10:setBackOpacity(0);
    obj.popUp_10:setDrawContainer(false);

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.popUp_10);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("#0e0e0e");
    obj.rectangle13:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle13:setXradius(5);
    obj.rectangle13:setYradius(5);
    obj.rectangle13:setCornerType("bevel");
    obj.rectangle13:setName("rectangle13");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle13);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("#0e0e0e");
    obj.rectangle14:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle14:setXradius(3);
    obj.rectangle14:setYradius(3);
    obj.rectangle14:setStrokeColor("#272727");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setCornerType("bevel");
    obj.rectangle14:setName("rectangle14");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle14);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setField("fldEnfase10");
    obj.textEditor1:setFontFamily("Constantia");
    obj.textEditor1:setFontSize(13);
    obj.textEditor1:setName("textEditor1");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.rectangle14);
    obj.dataLink26:setField("fldEnfase10");
    obj.dataLink26:setDefaultValue("Ênfases");
    obj.dataLink26:setName("dataLink26");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle12);
    obj.layout51:setAlign("client");
    obj.layout51:setName("layout51");

    obj.nomeCheck10_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck10_01:setParent(obj.layout51);
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
    obj.nomeCheck10_02:setParent(obj.layout51);
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
    obj.nomeCheck10_03:setParent(obj.layout51);
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
    obj.nomeCheck10_04:setParent(obj.layout51);
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
    obj.nomeCheck10_05:setParent(obj.layout51);
    obj.nomeCheck10_05:setField("fldCheck10_05");
    obj.nomeCheck10_05:setName("nomeCheck10_05");
    obj.nomeCheck10_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck10_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck10_05:setHeight(25);
    obj.nomeCheck10_05:setWidth(14);
    obj.nomeCheck10_05:setAlign("right");
    obj.nomeCheck10_05:setMargins({left=3});
    obj.nomeCheck10_05:setAutoChange(false);

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle12);
    obj.label46:setAlign("right");
    obj.label46:setWidth(20);
    obj.label46:setText(" ");
    obj.label46:setName("label46");
    obj.label46:setFontSize(14);
    obj.label46:setFontColor("white");
    lfm_setPropAsString(obj.label46, "fontStyle", "bold");
    obj.label46:setTextTrimming("character");
    obj.label46:setFontFamily("Constantia");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout12);
    obj.flowPart22:setMargins({bottom=5});
    obj.flowPart22:setAlign("client");
    obj.flowPart22:setName("flowPart22");
    obj.flowPart22:setMinWidth(220);
    obj.flowPart22:setMaxWidth(550);
    obj.flowPart22:setHeight(25);

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.flowPart22);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("#2d2d2d");
    obj.rectangle15:setName("rectangle15");

    obj.nomeCheckB11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB11:setParent(obj.rectangle15);
    obj.nomeCheckB11:setName("nomeCheckB11");
    obj.nomeCheckB11:setField("fldCheckB11");
    obj.nomeCheckB11:setWidth(25);
    obj.nomeCheckB11:setAlign("left");
    obj.nomeCheckB11:setMargins({top=3, left=20});

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle15);
    obj.label47:setAlign("left");
    obj.label47:setWidth(100);
    obj.label47:setText("Armas de Fogo");
    obj.label47:setName("label47");
    obj.label47:setFontSize(14);
    obj.label47:setFontColor("white");
    lfm_setPropAsString(obj.label47, "fontStyle", "bold");
    obj.label47:setTextTrimming("character");
    obj.label47:setFontFamily("Constantia");

    obj.nomeBut11 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut11:setParent(obj.rectangle15);
    obj.nomeBut11:setName("nomeBut11");
    obj.nomeBut11:setText("𝐢");
    obj.nomeBut11:setWidth(22);
    obj.nomeBut11:setHeight(22);
    obj.nomeBut11:setTop(2);
    obj.nomeBut11:setLeft(150);
    obj.nomeBut11:setFontColor("#272727");

    obj.nomeBut11B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut11B:setParent(obj.rectangle15);
    obj.nomeBut11B:setName("nomeBut11B");
    obj.nomeBut11B:setText("𝐢");
    obj.nomeBut11B:setWidth(22);
    obj.nomeBut11B:setHeight(22);
    obj.nomeBut11B:setTop(2);
    obj.nomeBut11B:setLeft(150);
    obj.nomeBut11B:setFontColor("white");
    obj.nomeBut11B:setVisible(false);

    obj.popUp_11 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_11:setParent(obj.rectangle15);
    obj.popUp_11:setName("popUp_11");
    obj.popUp_11:setWidth(200);
    obj.popUp_11:setHeight(100);
    obj.popUp_11:setBackOpacity(0);
    obj.popUp_11:setDrawContainer(false);

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.popUp_11);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("#0e0e0e");
    obj.rectangle16:setPadding({top=5, left=0, bottom=5, right=0});
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

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle17);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setField("fldEnfase11");
    obj.textEditor2:setFontFamily("Constantia");
    obj.textEditor2:setFontSize(13);
    obj.textEditor2:setName("textEditor2");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.rectangle17);
    obj.dataLink27:setField("fldEnfase11");
    obj.dataLink27:setDefaultValue("Ênfases");
    obj.dataLink27:setName("dataLink27");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle15);
    obj.layout52:setAlign("client");
    obj.layout52:setName("layout52");

    obj.nomeCheck11_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck11_01:setParent(obj.layout52);
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
    obj.nomeCheck11_02:setParent(obj.layout52);
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
    obj.nomeCheck11_03:setParent(obj.layout52);
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
    obj.nomeCheck11_04:setParent(obj.layout52);
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
    obj.nomeCheck11_05:setParent(obj.layout52);
    obj.nomeCheck11_05:setField("fldCheck11_05");
    obj.nomeCheck11_05:setName("nomeCheck11_05");
    obj.nomeCheck11_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck11_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck11_05:setHeight(25);
    obj.nomeCheck11_05:setWidth(14);
    obj.nomeCheck11_05:setAlign("right");
    obj.nomeCheck11_05:setMargins({left=3});
    obj.nomeCheck11_05:setAutoChange(false);

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle15);
    obj.label48:setAlign("right");
    obj.label48:setWidth(20);
    obj.label48:setText(" ");
    obj.label48:setName("label48");
    obj.label48:setFontSize(14);
    obj.label48:setFontColor("white");
    lfm_setPropAsString(obj.label48, "fontStyle", "bold");
    obj.label48:setTextTrimming("character");
    obj.label48:setFontFamily("Constantia");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout12);
    obj.flowPart23:setMargins({bottom=5});
    obj.flowPart23:setAlign("client");
    obj.flowPart23:setName("flowPart23");
    obj.flowPart23:setMinWidth(220);
    obj.flowPart23:setMaxWidth(550);
    obj.flowPart23:setHeight(25);

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.flowPart23);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("#2d2d2d");
    obj.rectangle18:setName("rectangle18");

    obj.nomeCheckB12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB12:setParent(obj.rectangle18);
    obj.nomeCheckB12:setName("nomeCheckB12");
    obj.nomeCheckB12:setField("fldCheckB12");
    obj.nomeCheckB12:setWidth(25);
    obj.nomeCheckB12:setAlign("left");
    obj.nomeCheckB12:setMargins({top=3, left=20});

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle18);
    obj.label49:setAlign("left");
    obj.label49:setWidth(100);
    obj.label49:setText("Atletismo");
    obj.label49:setName("label49");
    obj.label49:setFontSize(14);
    obj.label49:setFontColor("white");
    lfm_setPropAsString(obj.label49, "fontStyle", "bold");
    obj.label49:setTextTrimming("character");
    obj.label49:setFontFamily("Constantia");

    obj.nomeBut12 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut12:setParent(obj.rectangle18);
    obj.nomeBut12:setName("nomeBut12");
    obj.nomeBut12:setText("𝐢");
    obj.nomeBut12:setWidth(22);
    obj.nomeBut12:setHeight(22);
    obj.nomeBut12:setTop(2);
    obj.nomeBut12:setLeft(150);
    obj.nomeBut12:setFontColor("#272727");

    obj.nomeBut12B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut12B:setParent(obj.rectangle18);
    obj.nomeBut12B:setName("nomeBut12B");
    obj.nomeBut12B:setText("𝐢");
    obj.nomeBut12B:setWidth(22);
    obj.nomeBut12B:setHeight(22);
    obj.nomeBut12B:setTop(2);
    obj.nomeBut12B:setLeft(150);
    obj.nomeBut12B:setFontColor("white");
    obj.nomeBut12B:setVisible(false);

    obj.popUp_12 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_12:setParent(obj.rectangle18);
    obj.popUp_12:setName("popUp_12");
    obj.popUp_12:setWidth(200);
    obj.popUp_12:setHeight(100);
    obj.popUp_12:setBackOpacity(0);
    obj.popUp_12:setDrawContainer(false);

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.popUp_12);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("#0e0e0e");
    obj.rectangle19:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle19:setXradius(5);
    obj.rectangle19:setYradius(5);
    obj.rectangle19:setCornerType("bevel");
    obj.rectangle19:setName("rectangle19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.rectangle19);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("#0e0e0e");
    obj.rectangle20:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle20:setXradius(3);
    obj.rectangle20:setYradius(3);
    obj.rectangle20:setStrokeColor("#272727");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setCornerType("bevel");
    obj.rectangle20:setName("rectangle20");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle20);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setField("fldEnfase12");
    obj.textEditor3:setFontFamily("Constantia");
    obj.textEditor3:setFontSize(13);
    obj.textEditor3:setName("textEditor3");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.rectangle20);
    obj.dataLink28:setField("fldEnfase12");
    obj.dataLink28:setDefaultValue("Ênfases");
    obj.dataLink28:setName("dataLink28");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle18);
    obj.layout53:setAlign("client");
    obj.layout53:setName("layout53");

    obj.nomeCheck12_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck12_01:setParent(obj.layout53);
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
    obj.nomeCheck12_02:setParent(obj.layout53);
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
    obj.nomeCheck12_03:setParent(obj.layout53);
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
    obj.nomeCheck12_04:setParent(obj.layout53);
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
    obj.nomeCheck12_05:setParent(obj.layout53);
    obj.nomeCheck12_05:setField("fldCheck12_05");
    obj.nomeCheck12_05:setName("nomeCheck12_05");
    obj.nomeCheck12_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck12_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck12_05:setHeight(25);
    obj.nomeCheck12_05:setWidth(14);
    obj.nomeCheck12_05:setAlign("right");
    obj.nomeCheck12_05:setMargins({left=3});
    obj.nomeCheck12_05:setAutoChange(false);

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle18);
    obj.label50:setAlign("right");
    obj.label50:setWidth(20);
    obj.label50:setText(" ");
    obj.label50:setName("label50");
    obj.label50:setFontSize(14);
    obj.label50:setFontColor("white");
    lfm_setPropAsString(obj.label50, "fontStyle", "bold");
    obj.label50:setTextTrimming("character");
    obj.label50:setFontFamily("Constantia");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout12);
    obj.flowPart24:setMargins({bottom=5});
    obj.flowPart24:setAlign("client");
    obj.flowPart24:setName("flowPart24");
    obj.flowPart24:setMinWidth(220);
    obj.flowPart24:setMaxWidth(550);
    obj.flowPart24:setHeight(25);

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.flowPart24);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("#2d2d2d");
    obj.rectangle21:setName("rectangle21");

    obj.nomeCheckB13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB13:setParent(obj.rectangle21);
    obj.nomeCheckB13:setName("nomeCheckB13");
    obj.nomeCheckB13:setField("fldCheckB13");
    obj.nomeCheckB13:setWidth(25);
    obj.nomeCheckB13:setAlign("left");
    obj.nomeCheckB13:setMargins({top=3, left=20});

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle21);
    obj.label51:setAlign("left");
    obj.label51:setWidth(100);
    obj.label51:setText("Briga");
    obj.label51:setName("label51");
    obj.label51:setFontSize(14);
    obj.label51:setFontColor("white");
    lfm_setPropAsString(obj.label51, "fontStyle", "bold");
    obj.label51:setTextTrimming("character");
    obj.label51:setFontFamily("Constantia");

    obj.nomeBut13 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut13:setParent(obj.rectangle21);
    obj.nomeBut13:setName("nomeBut13");
    obj.nomeBut13:setText("𝐢");
    obj.nomeBut13:setWidth(22);
    obj.nomeBut13:setHeight(22);
    obj.nomeBut13:setTop(2);
    obj.nomeBut13:setLeft(150);
    obj.nomeBut13:setFontColor("#272727");

    obj.nomeBut13B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut13B:setParent(obj.rectangle21);
    obj.nomeBut13B:setName("nomeBut13B");
    obj.nomeBut13B:setText("𝐢");
    obj.nomeBut13B:setWidth(22);
    obj.nomeBut13B:setHeight(22);
    obj.nomeBut13B:setTop(2);
    obj.nomeBut13B:setLeft(150);
    obj.nomeBut13B:setFontColor("white");
    obj.nomeBut13B:setVisible(false);

    obj.popUp_13 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_13:setParent(obj.rectangle21);
    obj.popUp_13:setName("popUp_13");
    obj.popUp_13:setWidth(200);
    obj.popUp_13:setHeight(100);
    obj.popUp_13:setBackOpacity(0);
    obj.popUp_13:setDrawContainer(false);

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.popUp_13);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("#0e0e0e");
    obj.rectangle22:setPadding({top=5, left=0, bottom=5, right=0});
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

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle23);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setTransparent(true);
    obj.textEditor4:setField("fldEnfase13");
    obj.textEditor4:setFontFamily("Constantia");
    obj.textEditor4:setFontSize(13);
    obj.textEditor4:setName("textEditor4");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.rectangle23);
    obj.dataLink29:setField("fldEnfase13");
    obj.dataLink29:setDefaultValue("Ênfases");
    obj.dataLink29:setName("dataLink29");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle21);
    obj.layout54:setAlign("client");
    obj.layout54:setName("layout54");

    obj.nomeCheck13_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck13_01:setParent(obj.layout54);
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
    obj.nomeCheck13_02:setParent(obj.layout54);
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
    obj.nomeCheck13_03:setParent(obj.layout54);
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
    obj.nomeCheck13_04:setParent(obj.layout54);
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
    obj.nomeCheck13_05:setParent(obj.layout54);
    obj.nomeCheck13_05:setField("fldCheck13_05");
    obj.nomeCheck13_05:setName("nomeCheck13_05");
    obj.nomeCheck13_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck13_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck13_05:setHeight(25);
    obj.nomeCheck13_05:setWidth(14);
    obj.nomeCheck13_05:setAlign("right");
    obj.nomeCheck13_05:setMargins({left=3});
    obj.nomeCheck13_05:setAutoChange(false);

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle21);
    obj.label52:setAlign("right");
    obj.label52:setWidth(20);
    obj.label52:setText(" ");
    obj.label52:setName("label52");
    obj.label52:setFontSize(14);
    obj.label52:setFontColor("white");
    lfm_setPropAsString(obj.label52, "fontStyle", "bold");
    obj.label52:setTextTrimming("character");
    obj.label52:setFontFamily("Constantia");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout12);
    obj.flowPart25:setMargins({bottom=5});
    obj.flowPart25:setAlign("client");
    obj.flowPart25:setName("flowPart25");
    obj.flowPart25:setMinWidth(220);
    obj.flowPart25:setMaxWidth(550);
    obj.flowPart25:setHeight(25);

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.flowPart25);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("#2d2d2d");
    obj.rectangle24:setName("rectangle24");

    obj.nomeCheckB14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB14:setParent(obj.rectangle24);
    obj.nomeCheckB14:setName("nomeCheckB14");
    obj.nomeCheckB14:setField("fldCheckB14");
    obj.nomeCheckB14:setWidth(25);
    obj.nomeCheckB14:setAlign("left");
    obj.nomeCheckB14:setMargins({top=3, left=20});

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle24);
    obj.label53:setAlign("left");
    obj.label53:setWidth(100);
    obj.label53:setText("Ciência");
    obj.label53:setName("label53");
    obj.label53:setFontSize(14);
    obj.label53:setFontColor("white");
    lfm_setPropAsString(obj.label53, "fontStyle", "bold");
    obj.label53:setTextTrimming("character");
    obj.label53:setFontFamily("Constantia");

    obj.nomeBut14 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut14:setParent(obj.rectangle24);
    obj.nomeBut14:setName("nomeBut14");
    obj.nomeBut14:setText("𝐢");
    obj.nomeBut14:setWidth(22);
    obj.nomeBut14:setHeight(22);
    obj.nomeBut14:setTop(2);
    obj.nomeBut14:setLeft(150);
    obj.nomeBut14:setFontColor("#272727");

    obj.nomeBut14B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut14B:setParent(obj.rectangle24);
    obj.nomeBut14B:setName("nomeBut14B");
    obj.nomeBut14B:setText("𝐢");
    obj.nomeBut14B:setWidth(22);
    obj.nomeBut14B:setHeight(22);
    obj.nomeBut14B:setTop(2);
    obj.nomeBut14B:setLeft(150);
    obj.nomeBut14B:setFontColor("white");
    obj.nomeBut14B:setVisible(false);

    obj.popUp_14 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_14:setParent(obj.rectangle24);
    obj.popUp_14:setName("popUp_14");
    obj.popUp_14:setWidth(200);
    obj.popUp_14:setHeight(100);
    obj.popUp_14:setBackOpacity(0);
    obj.popUp_14:setDrawContainer(false);

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.popUp_14);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("#0e0e0e");
    obj.rectangle25:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle25:setXradius(5);
    obj.rectangle25:setYradius(5);
    obj.rectangle25:setCornerType("bevel");
    obj.rectangle25:setName("rectangle25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle25);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("#0e0e0e");
    obj.rectangle26:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle26:setXradius(3);
    obj.rectangle26:setYradius(3);
    obj.rectangle26:setStrokeColor("#272727");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setCornerType("bevel");
    obj.rectangle26:setName("rectangle26");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle26);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setTransparent(true);
    obj.textEditor5:setField("fldEnfase14");
    obj.textEditor5:setFontFamily("Constantia");
    obj.textEditor5:setFontSize(13);
    obj.textEditor5:setName("textEditor5");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.rectangle26);
    obj.dataLink30:setField("fldEnfase14");
    obj.dataLink30:setDefaultValue("Ênfases");
    obj.dataLink30:setName("dataLink30");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle24);
    obj.layout55:setAlign("client");
    obj.layout55:setName("layout55");

    obj.nomeCheck14_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck14_01:setParent(obj.layout55);
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
    obj.nomeCheck14_02:setParent(obj.layout55);
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
    obj.nomeCheck14_03:setParent(obj.layout55);
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
    obj.nomeCheck14_04:setParent(obj.layout55);
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
    obj.nomeCheck14_05:setParent(obj.layout55);
    obj.nomeCheck14_05:setField("fldCheck14_05");
    obj.nomeCheck14_05:setName("nomeCheck14_05");
    obj.nomeCheck14_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck14_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck14_05:setHeight(25);
    obj.nomeCheck14_05:setWidth(14);
    obj.nomeCheck14_05:setAlign("right");
    obj.nomeCheck14_05:setMargins({left=3});
    obj.nomeCheck14_05:setAutoChange(false);

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle24);
    obj.label54:setAlign("right");
    obj.label54:setWidth(20);
    obj.label54:setText(" ");
    obj.label54:setName("label54");
    obj.label54:setFontSize(14);
    obj.label54:setFontColor("white");
    lfm_setPropAsString(obj.label54, "fontStyle", "bold");
    obj.label54:setTextTrimming("character");
    obj.label54:setFontFamily("Constantia");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout12);
    obj.flowPart26:setMargins({bottom=5});
    obj.flowPart26:setAlign("client");
    obj.flowPart26:setName("flowPart26");
    obj.flowPart26:setMinWidth(220);
    obj.flowPart26:setMaxWidth(550);
    obj.flowPart26:setHeight(25);

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.flowPart26);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("#2d2d2d");
    obj.rectangle27:setName("rectangle27");

    obj.nomeCheckB15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB15:setParent(obj.rectangle27);
    obj.nomeCheckB15:setName("nomeCheckB15");
    obj.nomeCheckB15:setField("fldCheckB15");
    obj.nomeCheckB15:setWidth(25);
    obj.nomeCheckB15:setAlign("left");
    obj.nomeCheckB15:setMargins({top=3, left=20});

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle27);
    obj.label55:setAlign("left");
    obj.label55:setWidth(100);
    obj.label55:setText("Condução");
    obj.label55:setName("label55");
    obj.label55:setFontSize(14);
    obj.label55:setFontColor("white");
    lfm_setPropAsString(obj.label55, "fontStyle", "bold");
    obj.label55:setTextTrimming("character");
    obj.label55:setFontFamily("Constantia");

    obj.nomeBut15 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut15:setParent(obj.rectangle27);
    obj.nomeBut15:setName("nomeBut15");
    obj.nomeBut15:setText("𝐢");
    obj.nomeBut15:setWidth(22);
    obj.nomeBut15:setHeight(22);
    obj.nomeBut15:setTop(2);
    obj.nomeBut15:setLeft(150);
    obj.nomeBut15:setFontColor("#272727");

    obj.nomeBut15B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut15B:setParent(obj.rectangle27);
    obj.nomeBut15B:setName("nomeBut15B");
    obj.nomeBut15B:setText("𝐢");
    obj.nomeBut15B:setWidth(22);
    obj.nomeBut15B:setHeight(22);
    obj.nomeBut15B:setTop(2);
    obj.nomeBut15B:setLeft(150);
    obj.nomeBut15B:setFontColor("white");
    obj.nomeBut15B:setVisible(false);

    obj.popUp_15 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_15:setParent(obj.rectangle27);
    obj.popUp_15:setName("popUp_15");
    obj.popUp_15:setWidth(200);
    obj.popUp_15:setHeight(100);
    obj.popUp_15:setBackOpacity(0);
    obj.popUp_15:setDrawContainer(false);

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.popUp_15);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("#0e0e0e");
    obj.rectangle28:setPadding({top=5, left=0, bottom=5, right=0});
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

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle29);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setTransparent(true);
    obj.textEditor6:setField("fldEnfase15");
    obj.textEditor6:setFontFamily("Constantia");
    obj.textEditor6:setFontSize(13);
    obj.textEditor6:setName("textEditor6");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.rectangle29);
    obj.dataLink31:setField("fldEnfase15");
    obj.dataLink31:setDefaultValue("Ênfases");
    obj.dataLink31:setName("dataLink31");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle27);
    obj.layout56:setAlign("client");
    obj.layout56:setName("layout56");

    obj.nomeCheck15_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck15_01:setParent(obj.layout56);
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
    obj.nomeCheck15_02:setParent(obj.layout56);
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
    obj.nomeCheck15_03:setParent(obj.layout56);
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
    obj.nomeCheck15_04:setParent(obj.layout56);
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
    obj.nomeCheck15_05:setParent(obj.layout56);
    obj.nomeCheck15_05:setField("fldCheck15_05");
    obj.nomeCheck15_05:setName("nomeCheck15_05");
    obj.nomeCheck15_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck15_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck15_05:setHeight(25);
    obj.nomeCheck15_05:setWidth(14);
    obj.nomeCheck15_05:setAlign("right");
    obj.nomeCheck15_05:setMargins({left=3});
    obj.nomeCheck15_05:setAutoChange(false);

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle27);
    obj.label56:setAlign("right");
    obj.label56:setWidth(20);
    obj.label56:setText(" ");
    obj.label56:setName("label56");
    obj.label56:setFontSize(14);
    obj.label56:setFontColor("white");
    lfm_setPropAsString(obj.label56, "fontStyle", "bold");
    obj.label56:setTextTrimming("character");
    obj.label56:setFontFamily("Constantia");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout12);
    obj.flowPart27:setMargins({bottom=5});
    obj.flowPart27:setAlign("client");
    obj.flowPart27:setName("flowPart27");
    obj.flowPart27:setMinWidth(220);
    obj.flowPart27:setMaxWidth(550);
    obj.flowPart27:setHeight(25);

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.flowPart27);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("#2d2d2d");
    obj.rectangle30:setName("rectangle30");

    obj.nomeCheckB16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB16:setParent(obj.rectangle30);
    obj.nomeCheckB16:setName("nomeCheckB16");
    obj.nomeCheckB16:setField("fldCheckB16");
    obj.nomeCheckB16:setWidth(25);
    obj.nomeCheckB16:setAlign("left");
    obj.nomeCheckB16:setMargins({top=3, left=20});

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle30);
    obj.label57:setAlign("left");
    obj.label57:setWidth(100);
    obj.label57:setText("Cultura");
    obj.label57:setName("label57");
    obj.label57:setFontSize(14);
    obj.label57:setFontColor("white");
    lfm_setPropAsString(obj.label57, "fontStyle", "bold");
    obj.label57:setTextTrimming("character");
    obj.label57:setFontFamily("Constantia");

    obj.nomeBut16 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut16:setParent(obj.rectangle30);
    obj.nomeBut16:setName("nomeBut16");
    obj.nomeBut16:setText("𝐢");
    obj.nomeBut16:setWidth(22);
    obj.nomeBut16:setHeight(22);
    obj.nomeBut16:setTop(2);
    obj.nomeBut16:setLeft(150);
    obj.nomeBut16:setFontColor("#272727");

    obj.nomeBut16B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut16B:setParent(obj.rectangle30);
    obj.nomeBut16B:setName("nomeBut16B");
    obj.nomeBut16B:setText("𝐢");
    obj.nomeBut16B:setWidth(22);
    obj.nomeBut16B:setHeight(22);
    obj.nomeBut16B:setTop(2);
    obj.nomeBut16B:setLeft(150);
    obj.nomeBut16B:setFontColor("white");
    obj.nomeBut16B:setVisible(false);

    obj.popUp_16 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_16:setParent(obj.rectangle30);
    obj.popUp_16:setName("popUp_16");
    obj.popUp_16:setWidth(200);
    obj.popUp_16:setHeight(100);
    obj.popUp_16:setBackOpacity(0);
    obj.popUp_16:setDrawContainer(false);

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.popUp_16);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("#0e0e0e");
    obj.rectangle31:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle31:setXradius(5);
    obj.rectangle31:setYradius(5);
    obj.rectangle31:setCornerType("bevel");
    obj.rectangle31:setName("rectangle31");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.rectangle31);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("#0e0e0e");
    obj.rectangle32:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle32:setXradius(3);
    obj.rectangle32:setYradius(3);
    obj.rectangle32:setStrokeColor("#272727");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setCornerType("bevel");
    obj.rectangle32:setName("rectangle32");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle32);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setTransparent(true);
    obj.textEditor7:setField("fldEnfase16");
    obj.textEditor7:setFontFamily("Constantia");
    obj.textEditor7:setFontSize(13);
    obj.textEditor7:setName("textEditor7");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.rectangle32);
    obj.dataLink32:setField("fldEnfase16");
    obj.dataLink32:setDefaultValue("Ênfases");
    obj.dataLink32:setName("dataLink32");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle30);
    obj.layout57:setAlign("client");
    obj.layout57:setName("layout57");

    obj.nomeCheck16_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck16_01:setParent(obj.layout57);
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
    obj.nomeCheck16_02:setParent(obj.layout57);
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
    obj.nomeCheck16_03:setParent(obj.layout57);
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
    obj.nomeCheck16_04:setParent(obj.layout57);
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
    obj.nomeCheck16_05:setParent(obj.layout57);
    obj.nomeCheck16_05:setField("fldCheck16_05");
    obj.nomeCheck16_05:setName("nomeCheck16_05");
    obj.nomeCheck16_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck16_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck16_05:setHeight(25);
    obj.nomeCheck16_05:setWidth(14);
    obj.nomeCheck16_05:setAlign("right");
    obj.nomeCheck16_05:setMargins({left=3});
    obj.nomeCheck16_05:setAutoChange(false);

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle30);
    obj.label58:setAlign("right");
    obj.label58:setWidth(20);
    obj.label58:setText(" ");
    obj.label58:setName("label58");
    obj.label58:setFontSize(14);
    obj.label58:setFontColor("white");
    lfm_setPropAsString(obj.label58, "fontStyle", "bold");
    obj.label58:setTextTrimming("character");
    obj.label58:setFontFamily("Constantia");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout12);
    obj.flowPart28:setMargins({bottom=5});
    obj.flowPart28:setAlign("client");
    obj.flowPart28:setName("flowPart28");
    obj.flowPart28:setMinWidth(220);
    obj.flowPart28:setMaxWidth(550);
    obj.flowPart28:setHeight(25);

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.flowPart28);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("#2d2d2d");
    obj.rectangle33:setName("rectangle33");

    obj.nomeCheckB17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB17:setParent(obj.rectangle33);
    obj.nomeCheckB17:setName("nomeCheckB17");
    obj.nomeCheckB17:setField("fldCheckB17");
    obj.nomeCheckB17:setWidth(25);
    obj.nomeCheckB17:setAlign("left");
    obj.nomeCheckB17:setMargins({top=3, left=20});

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle33);
    obj.label59:setAlign("left");
    obj.label59:setWidth(100);
    obj.label59:setText("Empatia");
    obj.label59:setName("label59");
    obj.label59:setFontSize(14);
    obj.label59:setFontColor("white");
    lfm_setPropAsString(obj.label59, "fontStyle", "bold");
    obj.label59:setTextTrimming("character");
    obj.label59:setFontFamily("Constantia");

    obj.nomeBut17 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut17:setParent(obj.rectangle33);
    obj.nomeBut17:setName("nomeBut17");
    obj.nomeBut17:setText("𝐢");
    obj.nomeBut17:setWidth(22);
    obj.nomeBut17:setHeight(22);
    obj.nomeBut17:setTop(2);
    obj.nomeBut17:setLeft(150);
    obj.nomeBut17:setFontColor("#272727");

    obj.nomeBut17B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut17B:setParent(obj.rectangle33);
    obj.nomeBut17B:setName("nomeBut17B");
    obj.nomeBut17B:setText("𝐢");
    obj.nomeBut17B:setWidth(22);
    obj.nomeBut17B:setHeight(22);
    obj.nomeBut17B:setTop(2);
    obj.nomeBut17B:setLeft(150);
    obj.nomeBut17B:setFontColor("white");
    obj.nomeBut17B:setVisible(false);

    obj.popUp_17 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_17:setParent(obj.rectangle33);
    obj.popUp_17:setName("popUp_17");
    obj.popUp_17:setWidth(200);
    obj.popUp_17:setHeight(100);
    obj.popUp_17:setBackOpacity(0);
    obj.popUp_17:setDrawContainer(false);

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.popUp_17);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("#0e0e0e");
    obj.rectangle34:setPadding({top=5, left=0, bottom=5, right=0});
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

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle35);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setTransparent(true);
    obj.textEditor8:setField("fldEnfase17");
    obj.textEditor8:setFontFamily("Constantia");
    obj.textEditor8:setFontSize(13);
    obj.textEditor8:setName("textEditor8");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.rectangle35);
    obj.dataLink33:setField("fldEnfase17");
    obj.dataLink33:setDefaultValue("Ênfases");
    obj.dataLink33:setName("dataLink33");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle33);
    obj.layout58:setAlign("client");
    obj.layout58:setName("layout58");

    obj.nomeCheck17_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck17_01:setParent(obj.layout58);
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
    obj.nomeCheck17_02:setParent(obj.layout58);
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
    obj.nomeCheck17_03:setParent(obj.layout58);
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
    obj.nomeCheck17_04:setParent(obj.layout58);
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
    obj.nomeCheck17_05:setParent(obj.layout58);
    obj.nomeCheck17_05:setField("fldCheck17_05");
    obj.nomeCheck17_05:setName("nomeCheck17_05");
    obj.nomeCheck17_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck17_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck17_05:setHeight(25);
    obj.nomeCheck17_05:setWidth(14);
    obj.nomeCheck17_05:setAlign("right");
    obj.nomeCheck17_05:setMargins({left=3});
    obj.nomeCheck17_05:setAutoChange(false);

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle33);
    obj.label60:setAlign("right");
    obj.label60:setWidth(20);
    obj.label60:setText(" ");
    obj.label60:setName("label60");
    obj.label60:setFontSize(14);
    obj.label60:setFontColor("white");
    lfm_setPropAsString(obj.label60, "fontStyle", "bold");
    obj.label60:setTextTrimming("character");
    obj.label60:setFontFamily("Constantia");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout49);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(465);
    obj.layout59:setName("layout59");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.layout59);
    obj.flowPart29:setHeight(237);
    obj.flowPart29:setMargins({bottom=20});
    obj.flowPart29:setAlign("client");
    obj.flowPart29:setName("flowPart29");
    obj.flowPart29:setMinWidth(220);
    obj.flowPart29:setMaxWidth(550);

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowPart29);
    obj.flowLayout13:setOrientation("vertical");
    obj.flowLayout13:setAlign("client");
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMaxColumns(1);
    obj.flowLayout13:setName("flowLayout13");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout13);
    obj.flowPart30:setMargins({bottom=5});
    obj.flowPart30:setAlign("client");
    obj.flowPart30:setName("flowPart30");
    obj.flowPart30:setMinWidth(220);
    obj.flowPart30:setMaxWidth(550);
    obj.flowPart30:setHeight(25);

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.flowPart30);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("#2d2d2d");
    obj.rectangle36:setName("rectangle36");

    obj.nomeCheckB18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB18:setParent(obj.rectangle36);
    obj.nomeCheckB18:setName("nomeCheckB18");
    obj.nomeCheckB18:setField("fldCheckB18");
    obj.nomeCheckB18:setWidth(25);
    obj.nomeCheckB18:setAlign("left");
    obj.nomeCheckB18:setMargins({top=3, left=20});

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle36);
    obj.label61:setAlign("left");
    obj.label61:setWidth(100);
    obj.label61:setText("Integridade");
    obj.label61:setName("label61");
    obj.label61:setFontSize(14);
    obj.label61:setFontColor("white");
    lfm_setPropAsString(obj.label61, "fontStyle", "bold");
    obj.label61:setTextTrimming("character");
    obj.label61:setFontFamily("Constantia");

    obj.nomeBut18 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut18:setParent(obj.rectangle36);
    obj.nomeBut18:setName("nomeBut18");
    obj.nomeBut18:setText("𝐢");
    obj.nomeBut18:setWidth(22);
    obj.nomeBut18:setHeight(22);
    obj.nomeBut18:setTop(2);
    obj.nomeBut18:setLeft(150);
    obj.nomeBut18:setFontColor("#272727");

    obj.nomeBut18B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut18B:setParent(obj.rectangle36);
    obj.nomeBut18B:setName("nomeBut18B");
    obj.nomeBut18B:setText("𝐢");
    obj.nomeBut18B:setWidth(22);
    obj.nomeBut18B:setHeight(22);
    obj.nomeBut18B:setTop(2);
    obj.nomeBut18B:setLeft(150);
    obj.nomeBut18B:setFontColor("white");
    obj.nomeBut18B:setVisible(false);

    obj.popUp_18 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_18:setParent(obj.rectangle36);
    obj.popUp_18:setName("popUp_18");
    obj.popUp_18:setWidth(200);
    obj.popUp_18:setHeight(100);
    obj.popUp_18:setBackOpacity(0);
    obj.popUp_18:setDrawContainer(false);

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.popUp_18);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("#0e0e0e");
    obj.rectangle37:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle37:setXradius(5);
    obj.rectangle37:setYradius(5);
    obj.rectangle37:setCornerType("bevel");
    obj.rectangle37:setName("rectangle37");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.rectangle37);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("#0e0e0e");
    obj.rectangle38:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle38:setXradius(3);
    obj.rectangle38:setYradius(3);
    obj.rectangle38:setStrokeColor("#272727");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setCornerType("bevel");
    obj.rectangle38:setName("rectangle38");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle38);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setTransparent(true);
    obj.textEditor9:setField("fldEnfase18");
    obj.textEditor9:setFontFamily("Constantia");
    obj.textEditor9:setFontSize(13);
    obj.textEditor9:setName("textEditor9");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.rectangle38);
    obj.dataLink34:setField("fldEnfase18");
    obj.dataLink34:setDefaultValue("Ênfases");
    obj.dataLink34:setName("dataLink34");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle36);
    obj.layout60:setAlign("client");
    obj.layout60:setName("layout60");

    obj.nomeCheck18_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck18_01:setParent(obj.layout60);
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
    obj.nomeCheck18_02:setParent(obj.layout60);
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
    obj.nomeCheck18_03:setParent(obj.layout60);
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
    obj.nomeCheck18_04:setParent(obj.layout60);
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
    obj.nomeCheck18_05:setParent(obj.layout60);
    obj.nomeCheck18_05:setField("fldCheck18_05");
    obj.nomeCheck18_05:setName("nomeCheck18_05");
    obj.nomeCheck18_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck18_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck18_05:setHeight(25);
    obj.nomeCheck18_05:setWidth(14);
    obj.nomeCheck18_05:setAlign("right");
    obj.nomeCheck18_05:setMargins({left=3});
    obj.nomeCheck18_05:setAutoChange(false);

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle36);
    obj.label62:setAlign("right");
    obj.label62:setWidth(20);
    obj.label62:setText(" ");
    obj.label62:setName("label62");
    obj.label62:setFontSize(14);
    obj.label62:setFontColor("white");
    lfm_setPropAsString(obj.label62, "fontStyle", "bold");
    obj.label62:setTextTrimming("character");
    obj.label62:setFontFamily("Constantia");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout13);
    obj.flowPart31:setMargins({bottom=5});
    obj.flowPart31:setAlign("client");
    obj.flowPart31:setName("flowPart31");
    obj.flowPart31:setMinWidth(220);
    obj.flowPart31:setMaxWidth(550);
    obj.flowPart31:setHeight(25);

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.flowPart31);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("#2d2d2d");
    obj.rectangle39:setName("rectangle39");

    obj.nomeCheckB19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB19:setParent(obj.rectangle39);
    obj.nomeCheckB19:setName("nomeCheckB19");
    obj.nomeCheckB19:setField("fldCheckB19");
    obj.nomeCheckB19:setWidth(25);
    obj.nomeCheckB19:setAlign("left");
    obj.nomeCheckB19:setMargins({top=3, left=20});

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle39);
    obj.label63:setAlign("left");
    obj.label63:setWidth(100);
    obj.label63:setText("Liderança");
    obj.label63:setName("label63");
    obj.label63:setFontSize(14);
    obj.label63:setFontColor("white");
    lfm_setPropAsString(obj.label63, "fontStyle", "bold");
    obj.label63:setTextTrimming("character");
    obj.label63:setFontFamily("Constantia");

    obj.nomeBut19 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut19:setParent(obj.rectangle39);
    obj.nomeBut19:setName("nomeBut19");
    obj.nomeBut19:setText("𝐢");
    obj.nomeBut19:setWidth(22);
    obj.nomeBut19:setHeight(22);
    obj.nomeBut19:setTop(2);
    obj.nomeBut19:setLeft(150);
    obj.nomeBut19:setFontColor("#272727");

    obj.nomeBut19B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut19B:setParent(obj.rectangle39);
    obj.nomeBut19B:setName("nomeBut19B");
    obj.nomeBut19B:setText("𝐢");
    obj.nomeBut19B:setWidth(22);
    obj.nomeBut19B:setHeight(22);
    obj.nomeBut19B:setTop(2);
    obj.nomeBut19B:setLeft(150);
    obj.nomeBut19B:setFontColor("white");
    obj.nomeBut19B:setVisible(false);

    obj.popUp_19 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_19:setParent(obj.rectangle39);
    obj.popUp_19:setName("popUp_19");
    obj.popUp_19:setWidth(200);
    obj.popUp_19:setHeight(100);
    obj.popUp_19:setBackOpacity(0);
    obj.popUp_19:setDrawContainer(false);

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.popUp_19);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("#0e0e0e");
    obj.rectangle40:setPadding({top=5, left=0, bottom=5, right=0});
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

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.rectangle41);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setTransparent(true);
    obj.textEditor10:setField("fldEnfase19");
    obj.textEditor10:setFontFamily("Constantia");
    obj.textEditor10:setFontSize(13);
    obj.textEditor10:setName("textEditor10");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.rectangle41);
    obj.dataLink35:setField("fldEnfase19");
    obj.dataLink35:setDefaultValue("Ênfases");
    obj.dataLink35:setName("dataLink35");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle39);
    obj.layout61:setAlign("client");
    obj.layout61:setName("layout61");

    obj.nomeCheck19_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck19_01:setParent(obj.layout61);
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
    obj.nomeCheck19_02:setParent(obj.layout61);
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
    obj.nomeCheck19_03:setParent(obj.layout61);
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
    obj.nomeCheck19_04:setParent(obj.layout61);
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
    obj.nomeCheck19_05:setParent(obj.layout61);
    obj.nomeCheck19_05:setField("fldCheck19_05");
    obj.nomeCheck19_05:setName("nomeCheck19_05");
    obj.nomeCheck19_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck19_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck19_05:setHeight(25);
    obj.nomeCheck19_05:setWidth(14);
    obj.nomeCheck19_05:setAlign("right");
    obj.nomeCheck19_05:setMargins({left=3});
    obj.nomeCheck19_05:setAutoChange(false);

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle39);
    obj.label64:setAlign("right");
    obj.label64:setWidth(20);
    obj.label64:setText(" ");
    obj.label64:setName("label64");
    obj.label64:setFontSize(14);
    obj.label64:setFontColor("white");
    lfm_setPropAsString(obj.label64, "fontStyle", "bold");
    obj.label64:setTextTrimming("character");
    obj.label64:setFontFamily("Constantia");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout13);
    obj.flowPart32:setMargins({bottom=5});
    obj.flowPart32:setAlign("client");
    obj.flowPart32:setName("flowPart32");
    obj.flowPart32:setMinWidth(220);
    obj.flowPart32:setMaxWidth(550);
    obj.flowPart32:setHeight(25);

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.flowPart32);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("#2d2d2d");
    obj.rectangle42:setName("rectangle42");

    obj.nomeCheckB20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB20:setParent(obj.rectangle42);
    obj.nomeCheckB20:setName("nomeCheckB20");
    obj.nomeCheckB20:setField("fldCheckB20");
    obj.nomeCheckB20:setWidth(25);
    obj.nomeCheckB20:setAlign("left");
    obj.nomeCheckB20:setMargins({top=3, left=20});

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle42);
    obj.label65:setAlign("left");
    obj.label65:setWidth(100);
    obj.label65:setText("Medicina");
    obj.label65:setName("label65");
    obj.label65:setFontSize(14);
    obj.label65:setFontColor("white");
    lfm_setPropAsString(obj.label65, "fontStyle", "bold");
    obj.label65:setTextTrimming("character");
    obj.label65:setFontFamily("Constantia");

    obj.nomeBut20 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut20:setParent(obj.rectangle42);
    obj.nomeBut20:setName("nomeBut20");
    obj.nomeBut20:setText("𝐢");
    obj.nomeBut20:setWidth(22);
    obj.nomeBut20:setHeight(22);
    obj.nomeBut20:setTop(2);
    obj.nomeBut20:setLeft(150);
    obj.nomeBut20:setFontColor("#272727");

    obj.nomeBut20B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut20B:setParent(obj.rectangle42);
    obj.nomeBut20B:setName("nomeBut20B");
    obj.nomeBut20B:setText("𝐢");
    obj.nomeBut20B:setWidth(22);
    obj.nomeBut20B:setHeight(22);
    obj.nomeBut20B:setTop(2);
    obj.nomeBut20B:setLeft(150);
    obj.nomeBut20B:setFontColor("white");
    obj.nomeBut20B:setVisible(false);

    obj.popUp_20 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_20:setParent(obj.rectangle42);
    obj.popUp_20:setName("popUp_20");
    obj.popUp_20:setWidth(200);
    obj.popUp_20:setHeight(100);
    obj.popUp_20:setBackOpacity(0);
    obj.popUp_20:setDrawContainer(false);

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.popUp_20);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("#0e0e0e");
    obj.rectangle43:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(5);
    obj.rectangle43:setCornerType("bevel");
    obj.rectangle43:setName("rectangle43");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.rectangle43);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("#0e0e0e");
    obj.rectangle44:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle44:setXradius(3);
    obj.rectangle44:setYradius(3);
    obj.rectangle44:setStrokeColor("#272727");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setCornerType("bevel");
    obj.rectangle44:setName("rectangle44");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle44);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setTransparent(true);
    obj.textEditor11:setField("fldEnfase20");
    obj.textEditor11:setFontFamily("Constantia");
    obj.textEditor11:setFontSize(13);
    obj.textEditor11:setName("textEditor11");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.rectangle44);
    obj.dataLink36:setField("fldEnfase20");
    obj.dataLink36:setDefaultValue("Ênfases");
    obj.dataLink36:setName("dataLink36");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle42);
    obj.layout62:setAlign("client");
    obj.layout62:setName("layout62");

    obj.nomeCheck20_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck20_01:setParent(obj.layout62);
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
    obj.nomeCheck20_02:setParent(obj.layout62);
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
    obj.nomeCheck20_03:setParent(obj.layout62);
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
    obj.nomeCheck20_04:setParent(obj.layout62);
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
    obj.nomeCheck20_05:setParent(obj.layout62);
    obj.nomeCheck20_05:setField("fldCheck20_05");
    obj.nomeCheck20_05:setName("nomeCheck20_05");
    obj.nomeCheck20_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck20_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck20_05:setHeight(25);
    obj.nomeCheck20_05:setWidth(14);
    obj.nomeCheck20_05:setAlign("right");
    obj.nomeCheck20_05:setMargins({left=3});
    obj.nomeCheck20_05:setAutoChange(false);

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle42);
    obj.label66:setAlign("right");
    obj.label66:setWidth(20);
    obj.label66:setText(" ");
    obj.label66:setName("label66");
    obj.label66:setFontSize(14);
    obj.label66:setFontColor("white");
    lfm_setPropAsString(obj.label66, "fontStyle", "bold");
    obj.label66:setTextTrimming("character");
    obj.label66:setFontFamily("Constantia");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout13);
    obj.flowPart33:setMargins({bottom=5});
    obj.flowPart33:setAlign("client");
    obj.flowPart33:setName("flowPart33");
    obj.flowPart33:setMinWidth(220);
    obj.flowPart33:setMaxWidth(550);
    obj.flowPart33:setHeight(25);

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.flowPart33);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("#2d2d2d");
    obj.rectangle45:setName("rectangle45");

    obj.nomeCheckB21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB21:setParent(obj.rectangle45);
    obj.nomeCheckB21:setName("nomeCheckB21");
    obj.nomeCheckB21:setField("fldCheckB21");
    obj.nomeCheckB21:setWidth(25);
    obj.nomeCheckB21:setAlign("left");
    obj.nomeCheckB21:setMargins({top=3, left=20});

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle45);
    obj.label67:setAlign("left");
    obj.label67:setWidth(100);
    obj.label67:setText("Ocultismo");
    obj.label67:setName("label67");
    obj.label67:setFontSize(14);
    obj.label67:setFontColor("white");
    lfm_setPropAsString(obj.label67, "fontStyle", "bold");
    obj.label67:setTextTrimming("character");
    obj.label67:setFontFamily("Constantia");

    obj.nomeBut21 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut21:setParent(obj.rectangle45);
    obj.nomeBut21:setName("nomeBut21");
    obj.nomeBut21:setText("𝐢");
    obj.nomeBut21:setWidth(22);
    obj.nomeBut21:setHeight(22);
    obj.nomeBut21:setTop(2);
    obj.nomeBut21:setLeft(150);
    obj.nomeBut21:setFontColor("#272727");

    obj.nomeBut21B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut21B:setParent(obj.rectangle45);
    obj.nomeBut21B:setName("nomeBut21B");
    obj.nomeBut21B:setText("𝐢");
    obj.nomeBut21B:setWidth(22);
    obj.nomeBut21B:setHeight(22);
    obj.nomeBut21B:setTop(2);
    obj.nomeBut21B:setLeft(150);
    obj.nomeBut21B:setFontColor("white");
    obj.nomeBut21B:setVisible(false);

    obj.popUp_21 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_21:setParent(obj.rectangle45);
    obj.popUp_21:setName("popUp_21");
    obj.popUp_21:setWidth(200);
    obj.popUp_21:setHeight(100);
    obj.popUp_21:setBackOpacity(0);
    obj.popUp_21:setDrawContainer(false);

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.popUp_21);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("#0e0e0e");
    obj.rectangle46:setPadding({top=5, left=0, bottom=5, right=0});
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

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle47);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setTransparent(true);
    obj.textEditor12:setField("fldEnfase21");
    obj.textEditor12:setFontFamily("Constantia");
    obj.textEditor12:setFontSize(13);
    obj.textEditor12:setName("textEditor12");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.rectangle47);
    obj.dataLink37:setField("fldEnfase21");
    obj.dataLink37:setDefaultValue("Ênfases");
    obj.dataLink37:setName("dataLink37");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle45);
    obj.layout63:setAlign("client");
    obj.layout63:setName("layout63");

    obj.nomeCheck21_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck21_01:setParent(obj.layout63);
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
    obj.nomeCheck21_02:setParent(obj.layout63);
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
    obj.nomeCheck21_03:setParent(obj.layout63);
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
    obj.nomeCheck21_04:setParent(obj.layout63);
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
    obj.nomeCheck21_05:setParent(obj.layout63);
    obj.nomeCheck21_05:setField("fldCheck21_05");
    obj.nomeCheck21_05:setName("nomeCheck21_05");
    obj.nomeCheck21_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck21_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck21_05:setHeight(25);
    obj.nomeCheck21_05:setWidth(14);
    obj.nomeCheck21_05:setAlign("right");
    obj.nomeCheck21_05:setMargins({left=3});
    obj.nomeCheck21_05:setAutoChange(false);

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle45);
    obj.label68:setAlign("right");
    obj.label68:setWidth(20);
    obj.label68:setText(" ");
    obj.label68:setName("label68");
    obj.label68:setFontSize(14);
    obj.label68:setFontColor("white");
    lfm_setPropAsString(obj.label68, "fontStyle", "bold");
    obj.label68:setTextTrimming("character");
    obj.label68:setFontFamily("Constantia");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout13);
    obj.flowPart34:setMargins({bottom=5});
    obj.flowPart34:setAlign("client");
    obj.flowPart34:setName("flowPart34");
    obj.flowPart34:setMinWidth(220);
    obj.flowPart34:setMaxWidth(550);
    obj.flowPart34:setHeight(25);

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.flowPart34);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("#2d2d2d");
    obj.rectangle48:setName("rectangle48");

    obj.nomeCheckB22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB22:setParent(obj.rectangle48);
    obj.nomeCheckB22:setName("nomeCheckB22");
    obj.nomeCheckB22:setField("fldCheckB22");
    obj.nomeCheckB22:setWidth(25);
    obj.nomeCheckB22:setAlign("left");
    obj.nomeCheckB22:setMargins({top=3, left=20});

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle48);
    obj.label69:setAlign("left");
    obj.label69:setWidth(100);
    obj.label69:setText("Persuasão");
    obj.label69:setName("label69");
    obj.label69:setFontSize(14);
    obj.label69:setFontColor("white");
    lfm_setPropAsString(obj.label69, "fontStyle", "bold");
    obj.label69:setTextTrimming("character");
    obj.label69:setFontFamily("Constantia");

    obj.nomeBut22 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut22:setParent(obj.rectangle48);
    obj.nomeBut22:setName("nomeBut22");
    obj.nomeBut22:setText("𝐢");
    obj.nomeBut22:setWidth(22);
    obj.nomeBut22:setHeight(22);
    obj.nomeBut22:setTop(2);
    obj.nomeBut22:setLeft(150);
    obj.nomeBut22:setFontColor("#272727");

    obj.nomeBut22B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut22B:setParent(obj.rectangle48);
    obj.nomeBut22B:setName("nomeBut22B");
    obj.nomeBut22B:setText("𝐢");
    obj.nomeBut22B:setWidth(22);
    obj.nomeBut22B:setHeight(22);
    obj.nomeBut22B:setTop(2);
    obj.nomeBut22B:setLeft(150);
    obj.nomeBut22B:setFontColor("white");
    obj.nomeBut22B:setVisible(false);

    obj.popUp_22 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_22:setParent(obj.rectangle48);
    obj.popUp_22:setName("popUp_22");
    obj.popUp_22:setWidth(200);
    obj.popUp_22:setHeight(100);
    obj.popUp_22:setBackOpacity(0);
    obj.popUp_22:setDrawContainer(false);

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.popUp_22);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("#0e0e0e");
    obj.rectangle49:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(5);
    obj.rectangle49:setCornerType("bevel");
    obj.rectangle49:setName("rectangle49");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.rectangle49);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("#0e0e0e");
    obj.rectangle50:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle50:setXradius(3);
    obj.rectangle50:setYradius(3);
    obj.rectangle50:setStrokeColor("#272727");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setCornerType("bevel");
    obj.rectangle50:setName("rectangle50");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.rectangle50);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setTransparent(true);
    obj.textEditor13:setField("fldEnfase22");
    obj.textEditor13:setFontFamily("Constantia");
    obj.textEditor13:setFontSize(13);
    obj.textEditor13:setName("textEditor13");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.rectangle50);
    obj.dataLink38:setField("fldEnfase22");
    obj.dataLink38:setDefaultValue("Ênfases");
    obj.dataLink38:setName("dataLink38");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle48);
    obj.layout64:setAlign("client");
    obj.layout64:setName("layout64");

    obj.nomeCheck22_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck22_01:setParent(obj.layout64);
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
    obj.nomeCheck22_02:setParent(obj.layout64);
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
    obj.nomeCheck22_03:setParent(obj.layout64);
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
    obj.nomeCheck22_04:setParent(obj.layout64);
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
    obj.nomeCheck22_05:setParent(obj.layout64);
    obj.nomeCheck22_05:setField("fldCheck22_05");
    obj.nomeCheck22_05:setName("nomeCheck22_05");
    obj.nomeCheck22_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck22_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck22_05:setHeight(25);
    obj.nomeCheck22_05:setWidth(14);
    obj.nomeCheck22_05:setAlign("right");
    obj.nomeCheck22_05:setMargins({left=3});
    obj.nomeCheck22_05:setAutoChange(false);

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle48);
    obj.label70:setAlign("right");
    obj.label70:setWidth(20);
    obj.label70:setText(" ");
    obj.label70:setName("label70");
    obj.label70:setFontSize(14);
    obj.label70:setFontColor("white");
    lfm_setPropAsString(obj.label70, "fontStyle", "bold");
    obj.label70:setTextTrimming("character");
    obj.label70:setFontFamily("Constantia");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout13);
    obj.flowPart35:setMargins({bottom=5});
    obj.flowPart35:setAlign("client");
    obj.flowPart35:setName("flowPart35");
    obj.flowPart35:setMinWidth(220);
    obj.flowPart35:setMaxWidth(550);
    obj.flowPart35:setHeight(25);

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.flowPart35);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("#2d2d2d");
    obj.rectangle51:setName("rectangle51");

    obj.nomeCheckB23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB23:setParent(obj.rectangle51);
    obj.nomeCheckB23:setName("nomeCheckB23");
    obj.nomeCheckB23:setField("fldCheckB23");
    obj.nomeCheckB23:setWidth(25);
    obj.nomeCheckB23:setAlign("left");
    obj.nomeCheckB23:setMargins({top=3, left=20});

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle51);
    obj.label71:setAlign("left");
    obj.label71:setWidth(100);
    obj.label71:setText("Sobrevivência");
    obj.label71:setName("label71");
    obj.label71:setFontSize(14);
    obj.label71:setFontColor("white");
    lfm_setPropAsString(obj.label71, "fontStyle", "bold");
    obj.label71:setTextTrimming("character");
    obj.label71:setFontFamily("Constantia");

    obj.nomeBut23 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut23:setParent(obj.rectangle51);
    obj.nomeBut23:setName("nomeBut23");
    obj.nomeBut23:setText("𝐢");
    obj.nomeBut23:setWidth(22);
    obj.nomeBut23:setHeight(22);
    obj.nomeBut23:setTop(2);
    obj.nomeBut23:setLeft(150);
    obj.nomeBut23:setFontColor("#272727");

    obj.nomeBut23B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut23B:setParent(obj.rectangle51);
    obj.nomeBut23B:setName("nomeBut23B");
    obj.nomeBut23B:setText("𝐢");
    obj.nomeBut23B:setWidth(22);
    obj.nomeBut23B:setHeight(22);
    obj.nomeBut23B:setTop(2);
    obj.nomeBut23B:setLeft(150);
    obj.nomeBut23B:setFontColor("white");
    obj.nomeBut23B:setVisible(false);

    obj.popUp_23 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_23:setParent(obj.rectangle51);
    obj.popUp_23:setName("popUp_23");
    obj.popUp_23:setWidth(200);
    obj.popUp_23:setHeight(100);
    obj.popUp_23:setBackOpacity(0);
    obj.popUp_23:setDrawContainer(false);

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.popUp_23);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("#0e0e0e");
    obj.rectangle52:setPadding({top=5, left=0, bottom=5, right=0});
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

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.rectangle53);
    obj.textEditor14:setAlign("client");
    obj.textEditor14:setTransparent(true);
    obj.textEditor14:setField("fldEnfase23");
    obj.textEditor14:setFontFamily("Constantia");
    obj.textEditor14:setFontSize(13);
    obj.textEditor14:setName("textEditor14");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.rectangle53);
    obj.dataLink39:setField("fldEnfase23");
    obj.dataLink39:setDefaultValue("Ênfases");
    obj.dataLink39:setName("dataLink39");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle51);
    obj.layout65:setAlign("client");
    obj.layout65:setName("layout65");

    obj.nomeCheck23_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck23_01:setParent(obj.layout65);
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
    obj.nomeCheck23_02:setParent(obj.layout65);
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
    obj.nomeCheck23_03:setParent(obj.layout65);
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
    obj.nomeCheck23_04:setParent(obj.layout65);
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
    obj.nomeCheck23_05:setParent(obj.layout65);
    obj.nomeCheck23_05:setField("fldCheck23_05");
    obj.nomeCheck23_05:setName("nomeCheck23_05");
    obj.nomeCheck23_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck23_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck23_05:setHeight(25);
    obj.nomeCheck23_05:setWidth(14);
    obj.nomeCheck23_05:setAlign("right");
    obj.nomeCheck23_05:setMargins({left=3});
    obj.nomeCheck23_05:setAutoChange(false);

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle51);
    obj.label72:setAlign("right");
    obj.label72:setWidth(20);
    obj.label72:setText(" ");
    obj.label72:setName("label72");
    obj.label72:setFontSize(14);
    obj.label72:setFontColor("white");
    lfm_setPropAsString(obj.label72, "fontStyle", "bold");
    obj.label72:setTextTrimming("character");
    obj.label72:setFontFamily("Constantia");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout13);
    obj.flowPart36:setMargins({bottom=5});
    obj.flowPart36:setAlign("client");
    obj.flowPart36:setName("flowPart36");
    obj.flowPart36:setMinWidth(220);
    obj.flowPart36:setMaxWidth(550);
    obj.flowPart36:setHeight(25);

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.flowPart36);
    obj.rectangle54:setAlign("client");
    obj.rectangle54:setColor("#2d2d2d");
    obj.rectangle54:setName("rectangle54");

    obj.nomeCheckB24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB24:setParent(obj.rectangle54);
    obj.nomeCheckB24:setName("nomeCheckB24");
    obj.nomeCheckB24:setField("fldCheckB24");
    obj.nomeCheckB24:setWidth(25);
    obj.nomeCheckB24:setAlign("left");
    obj.nomeCheckB24:setMargins({top=3, left=20});

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle54);
    obj.label73:setAlign("left");
    obj.label73:setWidth(100);
    obj.label73:setText("Subterfúgio");
    obj.label73:setName("label73");
    obj.label73:setFontSize(14);
    obj.label73:setFontColor("white");
    lfm_setPropAsString(obj.label73, "fontStyle", "bold");
    obj.label73:setTextTrimming("character");
    obj.label73:setFontFamily("Constantia");

    obj.nomeBut24 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut24:setParent(obj.rectangle54);
    obj.nomeBut24:setName("nomeBut24");
    obj.nomeBut24:setText("𝐢");
    obj.nomeBut24:setWidth(22);
    obj.nomeBut24:setHeight(22);
    obj.nomeBut24:setTop(2);
    obj.nomeBut24:setLeft(150);
    obj.nomeBut24:setFontColor("#272727");

    obj.nomeBut24B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut24B:setParent(obj.rectangle54);
    obj.nomeBut24B:setName("nomeBut24B");
    obj.nomeBut24B:setText("𝐢");
    obj.nomeBut24B:setWidth(22);
    obj.nomeBut24B:setHeight(22);
    obj.nomeBut24B:setTop(2);
    obj.nomeBut24B:setLeft(150);
    obj.nomeBut24B:setFontColor("white");
    obj.nomeBut24B:setVisible(false);

    obj.popUp_24 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_24:setParent(obj.rectangle54);
    obj.popUp_24:setName("popUp_24");
    obj.popUp_24:setWidth(200);
    obj.popUp_24:setHeight(100);
    obj.popUp_24:setBackOpacity(0);
    obj.popUp_24:setDrawContainer(false);

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.popUp_24);
    obj.rectangle55:setAlign("client");
    obj.rectangle55:setColor("#0e0e0e");
    obj.rectangle55:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle55:setXradius(5);
    obj.rectangle55:setYradius(5);
    obj.rectangle55:setCornerType("bevel");
    obj.rectangle55:setName("rectangle55");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.rectangle55);
    obj.rectangle56:setAlign("client");
    obj.rectangle56:setColor("#0e0e0e");
    obj.rectangle56:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle56:setXradius(3);
    obj.rectangle56:setYradius(3);
    obj.rectangle56:setStrokeColor("#272727");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setCornerType("bevel");
    obj.rectangle56:setName("rectangle56");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.rectangle56);
    obj.textEditor15:setAlign("client");
    obj.textEditor15:setTransparent(true);
    obj.textEditor15:setField("fldEnfase24");
    obj.textEditor15:setFontFamily("Constantia");
    obj.textEditor15:setFontSize(13);
    obj.textEditor15:setName("textEditor15");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.rectangle56);
    obj.dataLink40:setField("fldEnfase24");
    obj.dataLink40:setDefaultValue("Ênfases");
    obj.dataLink40:setName("dataLink40");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle54);
    obj.layout66:setAlign("client");
    obj.layout66:setName("layout66");

    obj.nomeCheck24_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck24_01:setParent(obj.layout66);
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
    obj.nomeCheck24_02:setParent(obj.layout66);
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
    obj.nomeCheck24_03:setParent(obj.layout66);
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
    obj.nomeCheck24_04:setParent(obj.layout66);
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
    obj.nomeCheck24_05:setParent(obj.layout66);
    obj.nomeCheck24_05:setField("fldCheck24_05");
    obj.nomeCheck24_05:setName("nomeCheck24_05");
    obj.nomeCheck24_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck24_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck24_05:setHeight(25);
    obj.nomeCheck24_05:setWidth(14);
    obj.nomeCheck24_05:setAlign("right");
    obj.nomeCheck24_05:setMargins({left=3});
    obj.nomeCheck24_05:setAutoChange(false);

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle54);
    obj.label74:setAlign("right");
    obj.label74:setWidth(20);
    obj.label74:setText(" ");
    obj.label74:setName("label74");
    obj.label74:setFontSize(14);
    obj.label74:setFontColor("white");
    lfm_setPropAsString(obj.label74, "fontStyle", "bold");
    obj.label74:setTextTrimming("character");
    obj.label74:setFontFamily("Constantia");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout13);
    obj.flowPart37:setMargins({bottom=5});
    obj.flowPart37:setAlign("client");
    obj.flowPart37:setName("flowPart37");
    obj.flowPart37:setMinWidth(220);
    obj.flowPart37:setMaxWidth(550);
    obj.flowPart37:setHeight(25);

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.flowPart37);
    obj.rectangle57:setAlign("client");
    obj.rectangle57:setColor("#2d2d2d");
    obj.rectangle57:setName("rectangle57");

    obj.nomeCheckB25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCheckB25:setParent(obj.rectangle57);
    obj.nomeCheckB25:setName("nomeCheckB25");
    obj.nomeCheckB25:setField("fldCheckB25");
    obj.nomeCheckB25:setWidth(25);
    obj.nomeCheckB25:setAlign("left");
    obj.nomeCheckB25:setMargins({top=3, left=20});

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle57);
    obj.label75:setAlign("left");
    obj.label75:setWidth(100);
    obj.label75:setText("Tecnologia");
    obj.label75:setName("label75");
    obj.label75:setFontSize(14);
    obj.label75:setFontColor("white");
    lfm_setPropAsString(obj.label75, "fontStyle", "bold");
    obj.label75:setTextTrimming("character");
    obj.label75:setFontFamily("Constantia");

    obj.nomeBut25 = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut25:setParent(obj.rectangle57);
    obj.nomeBut25:setName("nomeBut25");
    obj.nomeBut25:setText("𝐢");
    obj.nomeBut25:setWidth(22);
    obj.nomeBut25:setHeight(22);
    obj.nomeBut25:setTop(2);
    obj.nomeBut25:setLeft(150);
    obj.nomeBut25:setFontColor("#272727");

    obj.nomeBut25B = GUI.fromHandle(_obj_newObject("button"));
    obj.nomeBut25B:setParent(obj.rectangle57);
    obj.nomeBut25B:setName("nomeBut25B");
    obj.nomeBut25B:setText("𝐢");
    obj.nomeBut25B:setWidth(22);
    obj.nomeBut25B:setHeight(22);
    obj.nomeBut25B:setTop(2);
    obj.nomeBut25B:setLeft(150);
    obj.nomeBut25B:setFontColor("white");
    obj.nomeBut25B:setVisible(false);

    obj.popUp_25 = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_25:setParent(obj.rectangle57);
    obj.popUp_25:setName("popUp_25");
    obj.popUp_25:setWidth(200);
    obj.popUp_25:setHeight(100);
    obj.popUp_25:setBackOpacity(0);
    obj.popUp_25:setDrawContainer(false);

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.popUp_25);
    obj.rectangle58:setAlign("client");
    obj.rectangle58:setColor("#0e0e0e");
    obj.rectangle58:setPadding({top=5, left=0, bottom=5, right=0});
    obj.rectangle58:setXradius(5);
    obj.rectangle58:setYradius(5);
    obj.rectangle58:setCornerType("bevel");
    obj.rectangle58:setName("rectangle58");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.rectangle58);
    obj.rectangle59:setAlign("client");
    obj.rectangle59:setColor("#0e0e0e");
    obj.rectangle59:setPadding({top=5, left=5, bottom=5, right=5});
    obj.rectangle59:setXradius(3);
    obj.rectangle59:setYradius(3);
    obj.rectangle59:setStrokeColor("#272727");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setCornerType("bevel");
    obj.rectangle59:setName("rectangle59");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.rectangle59);
    obj.textEditor16:setAlign("client");
    obj.textEditor16:setTransparent(true);
    obj.textEditor16:setField("fldEnfase25");
    obj.textEditor16:setFontFamily("Constantia");
    obj.textEditor16:setFontSize(13);
    obj.textEditor16:setName("textEditor16");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.rectangle59);
    obj.dataLink41:setField("fldEnfase25");
    obj.dataLink41:setDefaultValue("Ênfases");
    obj.dataLink41:setName("dataLink41");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle57);
    obj.layout67:setAlign("client");
    obj.layout67:setName("layout67");

    obj.nomeCheck25_01 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.nomeCheck25_01:setParent(obj.layout67);
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
    obj.nomeCheck25_02:setParent(obj.layout67);
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
    obj.nomeCheck25_03:setParent(obj.layout67);
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
    obj.nomeCheck25_04:setParent(obj.layout67);
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
    obj.nomeCheck25_05:setParent(obj.layout67);
    obj.nomeCheck25_05:setField("fldCheck25_05");
    obj.nomeCheck25_05:setName("nomeCheck25_05");
    obj.nomeCheck25_05:setImageChecked("/images/checkBoxAtv.png");
    obj.nomeCheck25_05:setImageUnchecked("/images/checkBoxDes.png");
    obj.nomeCheck25_05:setHeight(25);
    obj.nomeCheck25_05:setWidth(14);
    obj.nomeCheck25_05:setAlign("right");
    obj.nomeCheck25_05:setMargins({left=3});
    obj.nomeCheck25_05:setAutoChange(false);

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle57);
    obj.label76:setAlign("right");
    obj.label76:setWidth(20);
    obj.label76:setText(" ");
    obj.label76:setName("label76");
    obj.label76:setFontSize(14);
    obj.label76:setFontColor("white");
    lfm_setPropAsString(obj.label76, "fontStyle", "bold");
    obj.label76:setTextTrimming("character");
    obj.label76:setFontFamily("Constantia");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout2);
    obj.layout68:setAlign("top");
    obj.layout68:setName("layout68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout68);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(465);
    obj.layout69:setHeight(30);
    obj.layout69:setPadding({left=20, right=20});
    obj.layout69:setName("layout69");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout69);
    obj.layout70:setAlign("top");
    obj.layout70:setHeight(30);
    obj.layout70:setWidth(425);
    obj.layout70:setName("layout70");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.layout70);
    obj.horzLine5:setAlign("client");
    obj.horzLine5:setMargins({top=14});
    obj.horzLine5:setStrokeColor("#424242");
    obj.horzLine5:setName("horzLine5");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout70);
    obj.rectangle60:setAlign("client");
    obj.rectangle60:setMargins({right=130, left=130});
    obj.rectangle60:setColor("#272727");
    obj.rectangle60:setName("rectangle60");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout70);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setText("C A M I N H O S");
    obj.label77:setFontSize(20);
    obj.label77:setFontFamily("Constantia");
    obj.label77:setAlign("client");
    obj.label77:setName("label77");
    obj.label77:setFontColor("white");
    lfm_setPropAsString(obj.label77, "fontStyle", "bold");
    obj.label77:setTextTrimming("character");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout68);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(465);
    obj.layout71:setHeight(30);
    obj.layout71:setPadding({left=20, right=20});
    obj.layout71:setName("layout71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout71);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(30);
    obj.layout72:setWidth(425);
    obj.layout72:setName("layout72");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.layout72);
    obj.horzLine6:setAlign("client");
    obj.horzLine6:setMargins({top=14});
    obj.horzLine6:setStrokeColor("#424242");
    obj.horzLine6:setName("horzLine6");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout72);
    obj.rectangle61:setAlign("client");
    obj.rectangle61:setMargins({right=155, left=155});
    obj.rectangle61:setColor("#272727");
    obj.rectangle61:setName("rectangle61");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout72);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setText("F E I T O S");
    obj.label78:setFontSize(20);
    obj.label78:setFontFamily("Constantia");
    obj.label78:setAlign("client");
    obj.label78:setName("label78");
    obj.label78:setFontColor("white");
    lfm_setPropAsString(obj.label78, "fontStyle", "bold");
    obj.label78:setTextTrimming("character");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.scrollBox2);
    obj.flowLayout14:setOrientation("vertical");
    lfm_setPropAsString(obj.flowLayout14, "anchors", "top left");
    obj.flowLayout14:setTop(1075);
    obj.flowLayout14:setLeft(0);
    obj.flowLayout14:setWidth(465);
    obj.flowLayout14:setPadding({left=20, right=20});
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxControlsPerLine(1);
    obj.flowLayout14:setName("flowLayout14");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.flowLayout14);
    obj.flowLayout15:setOrientation("vertical");
    obj.flowLayout15:setAlign("top");
    obj.flowLayout15:setAutoHeight(true);
    obj.flowLayout15:setMaxColumns(1);
    obj.flowLayout15:setMargins({bottom=20});
    obj.flowLayout15:setMinWidth(425);
    obj.flowLayout15:setName("flowLayout15");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout15);
    obj.flowPart38:setMargins({bottom=5});
    obj.flowPart38:setAlign("client");
    obj.flowPart38:setName("flowPart38");
    obj.flowPart38:setMinWidth(220);
    obj.flowPart38:setMaxWidth(550);
    obj.flowPart38:setHeight(25);

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.flowPart38);
    obj.rectangle62:setColor("#2d2d2d");
    obj.rectangle62:setAlign("client");
    obj.rectangle62:setName("rectangle62");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle62);
    obj.edit17:setField("fldEditCaminho01");
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(363);
    obj.edit17:setText("Caminho");
    lfm_setPropAsString(obj.edit17, "fontStyle", "italic");
    obj.edit17:setMargins({left=5});
    obj.edit17:setName("edit17");
    obj.edit17:setFontSize(14);
    obj.edit17:setFontColor("#cdcdcd");
    obj.edit17:setTextTrimming("character");
    obj.edit17:setFontFamily("Constantia");
    obj.edit17:setTransparent(true);

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.rectangle62);
    obj.dataLink42:setField("fldEditCaminho01");
    obj.dataLink42:setDefaultValue("Digite seu Caminho");
    obj.dataLink42:setName("dataLink42");

    obj.nomeCam01 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCam01:setParent(obj.rectangle62);
    obj.nomeCam01:setName("nomeCam01");
    obj.nomeCam01:setField("fldCheckBCam01");
    obj.nomeCam01:setWidth(25);
    obj.nomeCam01:setAlign("right");
    obj.nomeCam01:setMargins({top=3});

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout15);
    obj.flowPart39:setMargins({bottom=5});
    obj.flowPart39:setAlign("client");
    obj.flowPart39:setName("flowPart39");
    obj.flowPart39:setMinWidth(220);
    obj.flowPart39:setMaxWidth(550);
    obj.flowPart39:setHeight(25);

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.flowPart39);
    obj.rectangle63:setColor("#2d2d2d");
    obj.rectangle63:setAlign("client");
    obj.rectangle63:setName("rectangle63");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle63);
    obj.edit18:setField("fldEditCaminho02");
    obj.edit18:setAlign("left");
    obj.edit18:setWidth(363);
    obj.edit18:setText("Caminho");
    lfm_setPropAsString(obj.edit18, "fontStyle", "italic");
    obj.edit18:setMargins({left=5});
    obj.edit18:setName("edit18");
    obj.edit18:setFontSize(14);
    obj.edit18:setFontColor("#cdcdcd");
    obj.edit18:setTextTrimming("character");
    obj.edit18:setFontFamily("Constantia");
    obj.edit18:setTransparent(true);

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.rectangle63);
    obj.dataLink43:setField("fldEditCaminho02");
    obj.dataLink43:setDefaultValue("Digite seu Caminho");
    obj.dataLink43:setName("dataLink43");

    obj.nomeCam02 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCam02:setParent(obj.rectangle63);
    obj.nomeCam02:setName("nomeCam02");
    obj.nomeCam02:setField("fldCheckBCam02");
    obj.nomeCam02:setWidth(25);
    obj.nomeCam02:setAlign("right");
    obj.nomeCam02:setMargins({top=3});

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout15);
    obj.flowPart40:setMargins({bottom=5});
    obj.flowPart40:setAlign("client");
    obj.flowPart40:setName("flowPart40");
    obj.flowPart40:setMinWidth(220);
    obj.flowPart40:setMaxWidth(550);
    obj.flowPart40:setHeight(25);

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.flowPart40);
    obj.rectangle64:setColor("#2d2d2d");
    obj.rectangle64:setAlign("client");
    obj.rectangle64:setName("rectangle64");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle64);
    obj.edit19:setField("fldEditCaminho03");
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(363);
    obj.edit19:setText("Caminho");
    lfm_setPropAsString(obj.edit19, "fontStyle", "italic");
    obj.edit19:setMargins({left=5});
    obj.edit19:setName("edit19");
    obj.edit19:setFontSize(14);
    obj.edit19:setFontColor("#cdcdcd");
    obj.edit19:setTextTrimming("character");
    obj.edit19:setFontFamily("Constantia");
    obj.edit19:setTransparent(true);

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.rectangle64);
    obj.dataLink44:setField("fldEditCaminho03");
    obj.dataLink44:setDefaultValue("Digite seu Caminho");
    obj.dataLink44:setName("dataLink44");

    obj.nomeCam03 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeCam03:setParent(obj.rectangle64);
    obj.nomeCam03:setName("nomeCam03");
    obj.nomeCam03:setField("fldCheckBCam03");
    obj.nomeCam03:setWidth(25);
    obj.nomeCam03:setAlign("right");
    obj.nomeCam03:setMargins({top=3});

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.flowLayout14);
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(30);
    obj.layout73:setWidth(425);
    obj.layout73:setName("layout73");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.layout73);
    obj.horzLine7:setAlign("client");
    obj.horzLine7:setMargins({top=14});
    obj.horzLine7:setStrokeColor("#424242");
    obj.horzLine7:setName("horzLine7");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout73);
    obj.rectangle65:setAlign("client");
    obj.rectangle65:setMargins({right=144, left=144});
    obj.rectangle65:setColor("#272727");
    obj.rectangle65:setName("rectangle65");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout73);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setText("L E G A D O S");
    obj.label79:setFontSize(20);
    obj.label79:setFontFamily("Constantia");
    obj.label79:setAlign("client");
    obj.label79:setName("label79");
    obj.label79:setFontColor("white");
    lfm_setPropAsString(obj.label79, "fontStyle", "bold");
    obj.label79:setTextTrimming("character");

    obj.rclLegados = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLegados:setParent(obj.flowLayout14);
    obj.rclLegados:setWidth(425);
    obj.rclLegados:setAlign("top");
    obj.rclLegados:setMinQt(3);
    obj.rclLegados:setLayout("vertical");
    obj.rclLegados:setName("rclLegados");
    obj.rclLegados:setField("fldLegados");
    obj.rclLegados:setTemplateForm("legados");
    obj.rclLegados:setAutoHeight(true);
    obj.rclLegados:setMargins({top=20});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout14);
    obj.button1:setWidth(425);
    obj.button1:setAlign("top");
    obj.button1:setHeight(25);
    obj.button1:setText("🞦");
    obj.button1:setHint("Novo Legado");
    obj.button1:setName("button1");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.flowLayout14);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(20);
    obj.layout74:setName("layout74");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.flowLayout14);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(30);
    obj.layout75:setWidth(425);
    obj.layout75:setName("layout75");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.layout75);
    obj.horzLine8:setAlign("client");
    obj.horzLine8:setMargins({top=14});
    obj.horzLine8:setStrokeColor("#424242");
    obj.horzLine8:setName("horzLine8");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout75);
    obj.rectangle66:setAlign("client");
    obj.rectangle66:setMargins({right=140, left=140});
    obj.rectangle66:setColor("#272727");
    obj.rectangle66:setName("rectangle66");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout75);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setText("T R U Q U E S");
    obj.label80:setFontSize(20);
    obj.label80:setFontFamily("Constantia");
    obj.label80:setAlign("client");
    obj.label80:setName("label80");
    obj.label80:setFontColor("white");
    lfm_setPropAsString(obj.label80, "fontStyle", "bold");
    obj.label80:setTextTrimming("character");

    obj.rclTruques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclTruques:setParent(obj.flowLayout14);
    obj.rclTruques:setWidth(425);
    obj.rclTruques:setAlign("top");
    obj.rclTruques:setMinQt(3);
    obj.rclTruques:setLayout("vertical");
    obj.rclTruques:setName("rclTruques");
    obj.rclTruques:setField("fldTruques");
    obj.rclTruques:setTemplateForm("truques");
    obj.rclTruques:setAutoHeight(true);
    obj.rclTruques:setMargins({top=20});

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout14);
    obj.button2:setWidth(425);
    obj.button2:setAlign("top");
    obj.button2:setHeight(25);
    obj.button2:setText("🞦");
    obj.button2:setHint("Novo Truque");
    obj.button2:setName("button2");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.flowLayout14);
    obj.layout76:setAlign("top");
    obj.layout76:setHeight(40);
    obj.layout76:setName("layout76");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.scrollBox2);
    obj.flowLayout16:setOrientation("vertical");
    lfm_setPropAsString(obj.flowLayout16, "anchors", "top left");
    obj.flowLayout16:setTop(1075);
    obj.flowLayout16:setLeft(485);
    obj.flowLayout16:setWidth(425);
    obj.flowLayout16:setAutoHeight(true);
    obj.flowLayout16:setMaxControlsPerLine(1);
    obj.flowLayout16:setName("flowLayout16");

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.flowLayout16);
    obj.flowLayout17:setWidth(425);
    obj.flowLayout17:setOrientation("vertical");
    obj.flowLayout17:setAlign("top");
    obj.flowLayout17:setAutoHeight(true);
    obj.flowLayout17:setMaxColumns(1);
    obj.flowLayout17:setMargins({bottom=20});
    obj.flowLayout17:setName("flowLayout17");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout17);
    obj.flowPart41:setMargins({bottom=5});
    obj.flowPart41:setAlign("client");
    obj.flowPart41:setName("flowPart41");
    obj.flowPart41:setMinWidth(220);
    obj.flowPart41:setMaxWidth(550);
    obj.flowPart41:setHeight(25);

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart41);
    obj.label81:setAlign("left");
    obj.label81:setWidth(120);
    obj.label81:setText("Pequeno Feito");
    obj.label81:setName("label81");
    obj.label81:setFontSize(14);
    obj.label81:setFontColor("white");
    lfm_setPropAsString(obj.label81, "fontStyle", "bold");
    obj.label81:setTextTrimming("character");
    obj.label81:setFontFamily("Constantia");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.flowPart41);
    obj.rectangle67:setColor("#2d2d2d");
    obj.rectangle67:setAlign("client");
    obj.rectangle67:setMargins({left=5});
    obj.rectangle67:setName("rectangle67");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle67);
    obj.edit20:setField("fldEditFeito01");
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(256);
    obj.edit20:setText("Feito");
    lfm_setPropAsString(obj.edit20, "fontStyle", "italic");
    obj.edit20:setMargins({left=5});
    obj.edit20:setName("edit20");
    obj.edit20:setFontSize(14);
    obj.edit20:setFontColor("#cdcdcd");
    obj.edit20:setTextTrimming("character");
    obj.edit20:setFontFamily("Constantia");
    obj.edit20:setTransparent(true);

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.rectangle67);
    obj.dataLink45:setField("fldEditFeito01");
    obj.dataLink45:setDefaultValue("Digite seu Objetivo");
    obj.dataLink45:setName("dataLink45");

    obj.nomeFei01 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeFei01:setParent(obj.rectangle67);
    obj.nomeFei01:setName("nomeFei01");
    obj.nomeFei01:setField("fldCheckBFei01");
    obj.nomeFei01:setWidth(25);
    obj.nomeFei01:setAlign("right");
    obj.nomeFei01:setMargins({top=3});

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout17);
    obj.flowPart42:setMargins({bottom=5});
    obj.flowPart42:setAlign("client");
    obj.flowPart42:setName("flowPart42");
    obj.flowPart42:setMinWidth(220);
    obj.flowPart42:setMaxWidth(550);
    obj.flowPart42:setHeight(25);

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowPart42);
    obj.label82:setAlign("left");
    obj.label82:setWidth(120);
    obj.label82:setText("Grande Feito");
    obj.label82:setName("label82");
    obj.label82:setFontSize(14);
    obj.label82:setFontColor("white");
    lfm_setPropAsString(obj.label82, "fontStyle", "bold");
    obj.label82:setTextTrimming("character");
    obj.label82:setFontFamily("Constantia");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.flowPart42);
    obj.rectangle68:setColor("#2d2d2d");
    obj.rectangle68:setAlign("client");
    obj.rectangle68:setMargins({left=5});
    obj.rectangle68:setName("rectangle68");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle68);
    obj.edit21:setField("fldEditFeito02");
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(256);
    obj.edit21:setText("Feito");
    lfm_setPropAsString(obj.edit21, "fontStyle", "italic");
    obj.edit21:setMargins({left=5});
    obj.edit21:setName("edit21");
    obj.edit21:setFontSize(14);
    obj.edit21:setFontColor("#cdcdcd");
    obj.edit21:setTextTrimming("character");
    obj.edit21:setFontFamily("Constantia");
    obj.edit21:setTransparent(true);

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.rectangle68);
    obj.dataLink46:setField("fldEditFeito02");
    obj.dataLink46:setDefaultValue("Digite seu Objetivo");
    obj.dataLink46:setName("dataLink46");

    obj.nomeFei02 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeFei02:setParent(obj.rectangle68);
    obj.nomeFei02:setName("nomeFei02");
    obj.nomeFei02:setField("fldCheckBFei02");
    obj.nomeFei02:setWidth(25);
    obj.nomeFei02:setAlign("right");
    obj.nomeFei02:setMargins({top=3});

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout17);
    obj.flowPart43:setMargins({bottom=5});
    obj.flowPart43:setAlign("client");
    obj.flowPart43:setName("flowPart43");
    obj.flowPart43:setMinWidth(220);
    obj.flowPart43:setMaxWidth(550);
    obj.flowPart43:setHeight(25);

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart43);
    obj.label83:setAlign("left");
    obj.label83:setWidth(120);
    obj.label83:setText("Feito em Grupo");
    obj.label83:setName("label83");
    obj.label83:setFontSize(14);
    obj.label83:setFontColor("white");
    lfm_setPropAsString(obj.label83, "fontStyle", "bold");
    obj.label83:setTextTrimming("character");
    obj.label83:setFontFamily("Constantia");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.flowPart43);
    obj.rectangle69:setColor("#2d2d2d");
    obj.rectangle69:setAlign("client");
    obj.rectangle69:setMargins({left=5});
    obj.rectangle69:setName("rectangle69");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle69);
    obj.edit22:setField("fldEditFeito03");
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(256);
    obj.edit22:setText("Feito");
    lfm_setPropAsString(obj.edit22, "fontStyle", "italic");
    obj.edit22:setMargins({left=5});
    obj.edit22:setName("edit22");
    obj.edit22:setFontSize(14);
    obj.edit22:setFontColor("#cdcdcd");
    obj.edit22:setTextTrimming("character");
    obj.edit22:setFontFamily("Constantia");
    obj.edit22:setTransparent(true);

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.rectangle69);
    obj.dataLink47:setField("fldEditFeito03");
    obj.dataLink47:setDefaultValue("Digite seu Objetivo");
    obj.dataLink47:setName("dataLink47");

    obj.nomeFei03 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.nomeFei03:setParent(obj.rectangle69);
    obj.nomeFei03:setName("nomeFei03");
    obj.nomeFei03:setField("fldCheckBFei03");
    obj.nomeFei03:setWidth(25);
    obj.nomeFei03:setAlign("right");
    obj.nomeFei03:setMargins({top=3});

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.flowLayout16);
    obj.layout77:setAlign("top");
    obj.layout77:setHeight(30);
    obj.layout77:setWidth(425);
    obj.layout77:setName("layout77");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.layout77);
    obj.horzLine9:setAlign("client");
    obj.horzLine9:setMargins({top=14});
    obj.horzLine9:setStrokeColor("#424242");
    obj.horzLine9:setName("horzLine9");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout77);
    obj.rectangle70:setAlign("client");
    obj.rectangle70:setMargins({right=130, left=130});
    obj.rectangle70:setColor("#272727");
    obj.rectangle70:setName("rectangle70");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout77);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setText("H E R A N Ç A S");
    obj.label84:setFontSize(20);
    obj.label84:setFontFamily("Constantia");
    obj.label84:setAlign("client");
    obj.label84:setName("label84");
    obj.label84:setFontColor("white");
    lfm_setPropAsString(obj.label84, "fontStyle", "bold");
    obj.label84:setTextTrimming("character");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.flowLayout16);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(20);
    obj.layout78:setName("layout78");

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowLayout16);
    obj.flowLayout18:setWidth(425);
    obj.flowLayout18:setOrientation("vertical");
    obj.flowLayout18:setAlign("top");
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setMaxColumns(1);
    obj.flowLayout18:setMargins({bottom=0});
    obj.flowLayout18:setName("flowLayout18");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout18);
    obj.flowPart44:setHeight(27);
    obj.flowPart44:setMargins({bottom=5});
    obj.flowPart44:setAlign("client");
    obj.flowPart44:setName("flowPart44");
    obj.flowPart44:setMinWidth(220);
    obj.flowPart44:setMaxWidth(550);

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.flowPart44);
    obj.rectangle71:setColor("#2d2d2d");
    obj.rectangle71:setAlign("client");
    obj.rectangle71:setName("rectangle71");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle71);
    obj.label85:setAlign("left");
    obj.label85:setWidth(108);
    obj.label85:setMargins({left=5});
    obj.label85:setText("Título Lendário:");
    obj.label85:setName("label85");
    obj.label85:setFontSize(14);
    obj.label85:setFontColor("white");
    lfm_setPropAsString(obj.label85, "fontStyle", "bold");
    obj.label85:setTextTrimming("character");
    obj.label85:setFontFamily("Constantia");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle71);
    obj.edit23:setField("fldTitulo");
    obj.edit23:setAlign("client");
    obj.edit23:setText("Título Lendário");
    lfm_setPropAsString(obj.edit23, "fontStyle", "italic");
    obj.edit23:setMargins({left=2});
    obj.edit23:setName("edit23");
    obj.edit23:setFontSize(14);
    obj.edit23:setFontColor("#cdcdcd");
    obj.edit23:setTextTrimming("character");
    obj.edit23:setFontFamily("Constantia");
    obj.edit23:setTransparent(true);

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.rectangle71);
    obj.dataLink48:setField("fldTitulo");
    obj.dataLink48:setDefaultValue("Digite seu Título Lendário");
    obj.dataLink48:setName("dataLink48");

    obj.chbTitulo = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.chbTitulo:setParent(obj.rectangle71);
    obj.chbTitulo:setName("chbTitulo");
    obj.chbTitulo:setField("fldCheckBTitulo");
    obj.chbTitulo:setWidth(25);
    obj.chbTitulo:setAlign("right");
    obj.chbTitulo:setMargins({top=3});

    obj.rclHerancas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHerancas:setParent(obj.flowLayout16);
    obj.rclHerancas:setWidth(425);
    obj.rclHerancas:setAlign("top");
    obj.rclHerancas:setMinQt(1);
    obj.rclHerancas:setLayout("vertical");
    obj.rclHerancas:setName("rclHerancas");
    obj.rclHerancas:setField("fldHerancas");
    obj.rclHerancas:setTemplateForm("herancas");
    obj.rclHerancas:setAutoHeight(true);
    obj.rclHerancas:setMargins({top=3});

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout16);
    obj.button3:setWidth(425);
    obj.button3:setAlign("top");
    obj.button3:setHeight(25);
    obj.button3:setText("🞦");
    obj.button3:setHint("Nova Herança");
    obj.button3:setName("button3");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.flowLayout16);
    obj.layout79:setAlign("top");
    obj.layout79:setHeight(20);
    obj.layout79:setName("layout79");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.flowLayout16);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(30);
    obj.layout80:setWidth(425);
    obj.layout80:setName("layout80");

    obj.horzLine10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine10:setParent(obj.layout80);
    obj.horzLine10:setAlign("client");
    obj.horzLine10:setMargins({top=14});
    obj.horzLine10:setStrokeColor("#424242");
    obj.horzLine10:setName("horzLine10");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout80);
    obj.rectangle72:setAlign("client");
    obj.rectangle72:setMargins({right=60, left=60});
    obj.rectangle72:setColor("#272727");
    obj.rectangle72:setName("rectangle72");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout80);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setText("E S F E R A S   🙵   P O D E R E S");
    obj.label86:setFontSize(20);
    obj.label86:setFontFamily("Constantia");
    obj.label86:setAlign("client");
    obj.label86:setName("label86");
    obj.label86:setFontColor("white");
    lfm_setPropAsString(obj.label86, "fontStyle", "bold");
    obj.label86:setTextTrimming("character");

    obj.rclEsferas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEsferas:setParent(obj.flowLayout16);
    obj.rclEsferas:setWidth(425);
    obj.rclEsferas:setAlign("top");
    obj.rclEsferas:setMinQt(4);
    obj.rclEsferas:setLayout("vertical");
    obj.rclEsferas:setName("rclEsferas");
    obj.rclEsferas:setField("fldEsferas");
    obj.rclEsferas:setTemplateForm("esferas");
    obj.rclEsferas:setAutoHeight(true);
    obj.rclEsferas:setMargins({top=20});

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout16);
    obj.button4:setWidth(425);
    obj.button4:setAlign("top");
    obj.button4:setHeight(25);
    obj.button4:setText("🞦");
    obj.button4:setHint("Nova Esfera ou Poder");
    obj.button4:setName("button4");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.flowLayout16);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(40);
    obj.layout81:setName("layout81");

    obj.layVerso = GUI.fromHandle(_obj_newObject("layout"));
    obj.layVerso:setParent(obj.idFundo);
    obj.layVerso:setName("layVerso");
    obj.layVerso:setAlign("client");
    obj.layVerso:setVisible(false);

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layVerso);
    obj.layout82:setAlign("client");
    obj.layout82:setMargins({right=20, left=20});
    obj.layout82:setName("layout82");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout82);
    obj.layout83:setAlign("top");
    obj.layout83:setHeight(90);
    obj.layout83:setName("layout83");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout83);
    obj.image3:setAlign("top");
    obj.image3:setStyle("proportional");
    obj.image3:setHeight(50);
    obj.image3:setURL("/images/logo.png");
    obj.image3:setMargins({top=20});
    obj.image3:setName("image3");

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.layout82);
    obj.flowLayout19:setAlign("top");
    obj.flowLayout19:setMargins({top=20, bottom=20,});
    obj.flowLayout19:setHeight(440);
    obj.flowLayout19:setName("flowLayout19");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout19);
    obj.flowPart45:setHeight(440);
    obj.flowPart45:setMinWidth(260);
    obj.flowPart45:setMaxWidth(260);
    obj.flowPart45:setName("flowPart45");
    obj.flowPart45:setMargins({left=20, right=20, bottom=10});

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.flowPart45);
    obj.flowLayout20:setOrientation("vertical");
    obj.flowLayout20:setWidth(260);
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setMaxColumns(1);
    obj.flowLayout20:setName("flowLayout20");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout20);
    obj.flowPart46:setMinWidth(260);
    obj.flowPart46:setMaxWidth(260);
    obj.flowPart46:setMargins({bottom=5});
    obj.flowPart46:setName("flowPart46");
    obj.flowPart46:setHeight(25);

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart46);
    obj.label87:setText("A P A R Ê N C I A");
    obj.label87:setName("label87");
    obj.label87:setFontSize(10);
    obj.label87:setFontColor("white");
    obj.label87:setTextTrimming("character");
    obj.label87:setFontFamily("Constantia");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setAlign("top");
    lfm_setPropAsString(obj.label87, "fontStyle", "bold");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.flowLayout20);
    obj.layout84:setAlign("none");
    obj.layout84:setHeight(400);
    obj.layout84:setWidth(260);
    obj.layout84:setName("layout84");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout84);
    obj.image4:setAlign("none");
    obj.image4:setHeight(400);
    obj.image4:setWidth(260);
    obj.image4:setStyle("autoFit");
    obj.image4:setEditable(true);
    obj.image4:setField("fldFotoPJ");
    obj.image4:setHint("Alterar Aparência");
    obj.image4:setName("image4");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout84);
    obj.dataLink49:setField("fldFotoPJ");
    obj.dataLink49:setDefaultValue("/images/scion.png");
    obj.dataLink49:setName("dataLink49");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.layout84);
    obj.image5:setHeight(400);
    obj.image5:setWidth(260);
    obj.image5:setURL("/images/frame.png");
    obj.image5:setStyle("proportional");
    obj.image5:setName("image5");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout19);
    obj.flowPart47:setHeight(440);
    obj.flowPart47:setMinWidth(550);
    obj.flowPart47:setMaxWidth(550);
    obj.flowPart47:setName("flowPart47");
    obj.flowPart47:setMargins({left=20, right=20, bottom=10});

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.flowPart47);
    obj.flowLayout21:setOrientation("vertical");
    obj.flowLayout21:setWidth(550);
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setMaxColumns(1);
    obj.flowLayout21:setName("flowLayout21");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout21);
    obj.flowPart48:setMinWidth(550);
    obj.flowPart48:setMaxWidth(550);
    obj.flowPart48:setMargins({bottom=5});
    obj.flowPart48:setName("flowPart48");
    obj.flowPart48:setHeight(25);

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.flowPart48);
    obj.label88:setText("C O N T A T O S");
    obj.label88:setName("label88");
    obj.label88:setFontSize(10);
    obj.label88:setFontColor("white");
    obj.label88:setTextTrimming("character");
    obj.label88:setFontFamily("Constantia");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setAlign("top");
    lfm_setPropAsString(obj.label88, "fontStyle", "bold");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.flowLayout21);
    obj.rectangle73:setHeight(400);
    obj.rectangle73:setWidth(550);
    obj.rectangle73:setColor("#202020");
    obj.rectangle73:setCornerType("bevel");
    obj.rectangle73:setXradius(10);
    obj.rectangle73:setYradius(10);
    obj.rectangle73:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle73:setName("rectangle73");

    obj.nomeBG = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.nomeBG:setParent(obj.rectangle73);
    obj.nomeBG:setAlign("client");
    obj.nomeBG:setTransparent(true);
    obj.nomeBG:setField("fldBG");
    obj.nomeBG:setName("nomeBG");
    obj.nomeBG:setFontFamily("Constantia");
    obj.nomeBG:setFontSize(13);

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.rectangle73);
    obj.dataLink50:setField("fldBG");
    obj.dataLink50:setDefaultValue("Escreva aqui.");
    obj.dataLink50:setName("dataLink50");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout82);
    obj.layout85:setAlign("top");
    obj.layout85:setHeight(30);
    obj.layout85:setWidth(425);
    obj.layout85:setName("layout85");

    obj.horzLine11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine11:setParent(obj.layout85);
    obj.horzLine11:setAlign("client");
    obj.horzLine11:setMargins({top=14});
    obj.horzLine11:setStrokeColor("#424242");
    obj.horzLine11:setName("horzLine11");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout85);
    obj.rectangle74:setAlign("client");
    obj.rectangle74:setMargins({right=350, left=350});
    obj.rectangle74:setColor("#272727");
    obj.rectangle74:setName("rectangle74");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout85);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setText("H I S T Ó R I A");
    obj.label89:setFontSize(20);
    obj.label89:setFontFamily("Constantia");
    obj.label89:setAlign("client");
    obj.label89:setName("label89");
    obj.label89:setFontColor("white");
    lfm_setPropAsString(obj.label89, "fontStyle", "bold");
    obj.label89:setTextTrimming("character");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout82);
    obj.richEdit1:setField("BG");
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setMargins({top=10, bottom=40});
    obj.richEdit1.backgroundColor = "#272727";
    obj.richEdit1.defaultFontColor = "white";
    obj.richEdit1:setName("richEdit1");

    obj.layNote = GUI.fromHandle(_obj_newObject("layout"));
    obj.layNote:setParent(obj.idFundo);
    obj.layNote:setName("layNote");
    obj.layNote:setAlign("client");
    obj.layNote:setVisible(false);

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layNote);
    obj.layout86:setAlign("client");
    obj.layout86:setMargins({right=20, left=20});
    obj.layout86:setName("layout86");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout86);
    obj.layout87:setAlign("top");
    obj.layout87:setHeight(90);
    obj.layout87:setName("layout87");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.layout87);
    obj.image6:setAlign("top");
    obj.image6:setStyle("proportional");
    obj.image6:setHeight(50);
    obj.image6:setURL("/images/logo.png");
    obj.image6:setMargins({top=20});
    obj.image6:setName("image6");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout86);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(30);
    obj.layout88:setWidth(425);
    obj.layout88:setName("layout88");

    obj.horzLine12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine12:setParent(obj.layout88);
    obj.horzLine12:setAlign("client");
    obj.horzLine12:setMargins({top=14});
    obj.horzLine12:setStrokeColor("#424242");
    obj.horzLine12:setName("horzLine12");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout88);
    obj.rectangle75:setAlign("client");
    obj.rectangle75:setMargins({right=350, left=350});
    obj.rectangle75:setColor("#272727");
    obj.rectangle75:setName("rectangle75");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout88);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setText("A N O T A Ç Õ E S");
    obj.label90:setFontSize(20);
    obj.label90:setFontFamily("Constantia");
    obj.label90:setAlign("client");
    obj.label90:setName("label90");
    obj.label90:setFontColor("white");
    lfm_setPropAsString(obj.label90, "fontStyle", "bold");
    obj.label90:setTextTrimming("character");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.layout86);
    obj.richEdit2:setField("Notes");
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setMargins({top=10, bottom=40});
    obj.richEdit2.backgroundColor = "#272727";
    obj.richEdit2.defaultFontColor = "white";
    obj.richEdit2:setName("richEdit2");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout1);
    obj.flowPart49:setAlign("top");
    obj.flowPart49:setHeight(1920);
    obj.flowPart49:setMinWidth(30);
    obj.flowPart49:setMaxWidth(50);
    obj.flowPart49:setName("flowPart49");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.flowPart49);
    obj.image7:setAlign("client");
    obj.image7:setStyle("proportional");
    obj.image7:setURL("/images/right-arrow.png");
    obj.image7:setHitTest(true);
    obj.image7:setCursor("handPoint");
    obj.image7:setHint("Trocar de Aba");
    obj.image7:setName("image7");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function ()
            CalcPontos()
        end);

    obj._e_event1 = obj.idImgFundo:addEventListener("onResize",
        function ()
            self.idImgFundo:needRepaint();
        end);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (field, oldValue, newValue)
            self.idImgFundo:needRepaint();
        end);

    obj._e_event3 = obj.image1:addEventListener("onClick",
        function (event)
            if(sheet==nil) then return end; TrocarAba('E');
        end);

    obj._e_event4 = obj.btnImagemFundo:addEventListener("onClick",
        function (event)
            self.popImagemFundo:show('left', self.btnImagemFundo);
        end);

    obj._e_event5 = obj.flLayVida:addEventListener("onBeforeLayoutCalc",
        function ()
            calcMachucados()
        end);

    obj._e_event6 = obj.dataLink2:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							
            							if sheet.chcBVidMachucado01 == false then self.rectVidMachucado01.color = '#272727'
            							else self.rectVidMachucado01.color = '#2d2d2d' end;
        end);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							
            							if sheet.chcBVidMachucado02 == false then self.rectVidMachucado02.color = '#272727'
            							else self.rectVidMachucado02.color = '#2d2d2d' end;
        end);

    obj._e_event8 = obj.dataLink6:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							
            							if sheet.chcBVidMachucado03 == false then self.rectVidMachucado03.color = '#272727'
            							else self.rectVidMachucado03.color = '#2d2d2d' end;
        end);

    obj._e_event9 = obj.dataLink8:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							
            							if sheet.chcBVidMachucado04 == false then self.rectVidMachucado04.color = '#272727'
            							else self.rectVidMachucado04.color = '#2d2d2d' end;
        end);

    obj._e_event10 = obj.dataLink10:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							
            							if sheet.chcBVidMachucado05 == false then self.rectVidMachucado05.color = '#272727'
            							else self.rectVidMachucado05.color = '#2d2d2d' end;
        end);

    obj._e_event11 = obj.dataLink12:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							
            							if sheet.chcBVidMachucado06 == false then self.rectVidMachucado06.color = '#272727'
            							else self.rectVidMachucado06.color = '#2d2d2d' end;
        end);

    obj._e_event12 = obj.dataLink14:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							
            							if sheet.chcBVidMachucado07 == false then self.rectVidMachucado07.color = '#272727'
            							else self.rectVidMachucado07.color = '#2d2d2d' end;
        end);

    obj._e_event13 = obj.dataLink16:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            							
            							if sheet.chcBVidInconsciente == false then self.rectVidInconsciente.color = '#272727'
            							else self.rectVidInconsciente.color = '#2d2d2d' end;
        end);

    obj._e_event14 = obj.nomeCheck01_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck01_01 = not sheet.fldCheck01_01;
            				
            				if(sheet.fldCheck01_02) then 
            					sheet.fldCheck01_01 = true; 
            					sheet.fldCheck01_02 = false; 
            					sheet.fldCheck01_03 = false; 
            					sheet.fldCheck01_04 = false; 
            					sheet.fldCheck01_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event15 = obj.nomeCheck01_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event16 = obj.nomeCheck01_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event17 = obj.nomeCheck01_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event18 = obj.nomeCheck01_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event19 = obj.nomeCheck02_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck02_01 = not sheet.fldCheck02_01;
            				
            				if(sheet.fldCheck02_02) then 
            					sheet.fldCheck02_01 = true; 
            					sheet.fldCheck02_02 = false; 
            					sheet.fldCheck02_03 = false; 
            					sheet.fldCheck02_04 = false; 
            					sheet.fldCheck02_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event20 = obj.nomeCheck02_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event21 = obj.nomeCheck02_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event22 = obj.nomeCheck02_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event23 = obj.nomeCheck02_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event24 = obj.nomeCheck03_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck03_01 = not sheet.fldCheck03_01;
            				
            				if(sheet.fldCheck03_02) then 
            					sheet.fldCheck03_01 = true; 
            					sheet.fldCheck03_02 = false; 
            					sheet.fldCheck03_03 = false; 
            					sheet.fldCheck03_04 = false; 
            					sheet.fldCheck03_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event25 = obj.nomeCheck03_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event26 = obj.nomeCheck03_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event27 = obj.nomeCheck03_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event28 = obj.nomeCheck03_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event29 = obj.checkMulVit_Des_01_Leg:addEventListener("onClick",
        function (event)
            
            				if(sheet.checkMulVit_Des_01_Leg == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_01_Leg = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_01_Leg == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_01_Leg = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_01_Leg == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_01_Leg = '/images/checkBoxDes.png';
            				end;
            			
        end);

    obj._e_event30 = obj.checkMulVit_Des_02_Leg:addEventListener("onClick",
        function (event)
            
            				if(sheet.checkMulVit_Des_02_Leg == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_02_Leg = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_02_Leg == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_02_Leg = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_02_Leg == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_02_Leg = '/images/checkBoxDes.png';
            				end;
            			
        end);

    obj._e_event31 = obj.checkMulVit_Des_03_Leg:addEventListener("onClick",
        function (event)
            
            				if(sheet.checkMulVit_Des_03_Leg == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_03_Leg = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_03_Leg == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_03_Leg = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_03_Leg == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_03_Leg = '/images/checkBoxDes.png';
            				end;
            			
        end);

    obj._e_event32 = obj.checkMulVit_Des_04_Leg:addEventListener("onClick",
        function (event)
            
            				if(sheet.checkMulVit_Des_04_Leg == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_04_Leg = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_04_Leg == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_04_Leg = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_04_Leg == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_04_Leg = '/images/checkBoxDes.png';
            				end;
            			
        end);

    obj._e_event33 = obj.checkMulVit_Des_05_Leg:addEventListener("onClick",
        function (event)
            
            				if(sheet.checkMulVit_Des_05_Leg == '/images/checkBoxDes.png') then
            					sheet.checkMulVit_Des_05_Leg = '/images/checkBoxAtv.png';
            				elseif(sheet.checkMulVit_Des_05_Leg == '/images/checkBoxAtv.png') then
            					sheet.checkMulVit_Des_05_Leg = '/images/checkBoxAgr.png';
            				elseif(sheet.checkMulVit_Des_05_Leg == '/images/checkBoxAgr.png') then
            					sheet.checkMulVit_Des_05_Leg = '/images/checkBoxDes.png';
            				end;
            			
        end);

    obj._e_event34 = obj.nomeCheck04_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck04_01 = not sheet.fldCheck04_01;
            				
            				if(sheet.fldCheck04_02) then 
            					sheet.fldCheck04_01 = true; 
            					sheet.fldCheck04_02 = false; 
            					sheet.fldCheck04_03 = false; 
            					sheet.fldCheck04_04 = false; 
            					sheet.fldCheck04_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event35 = obj.nomeCheck04_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event36 = obj.nomeCheck04_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event37 = obj.nomeCheck04_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event38 = obj.nomeCheck04_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event39 = obj.nomeCheck05_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck05_01 = not sheet.fldCheck05_01;
            				
            				if(sheet.fldCheck05_02) then 
            					sheet.fldCheck05_01 = true; 
            					sheet.fldCheck05_02 = false; 
            					sheet.fldCheck05_03 = false; 
            					sheet.fldCheck05_04 = false; 
            					sheet.fldCheck05_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event40 = obj.nomeCheck05_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event41 = obj.nomeCheck05_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event42 = obj.nomeCheck05_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event43 = obj.nomeCheck05_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event44 = obj.nomeCheck06_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck06_01 = not sheet.fldCheck06_01;
            				
            				if(sheet.fldCheck06_02) then 
            					sheet.fldCheck06_01 = true; 
            					sheet.fldCheck06_02 = false; 
            					sheet.fldCheck06_03 = false; 
            					sheet.fldCheck06_04 = false; 
            					sheet.fldCheck06_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event45 = obj.nomeCheck06_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event46 = obj.nomeCheck06_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event47 = obj.nomeCheck06_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event48 = obj.nomeCheck06_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event49 = obj.checkImp_01_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_01 = not sheet.fldCheckImp_01;
            							
            							if(sheet.fldCheckImp_02) then 
            								sheet.fldCheckImp_01 = true; 
            								sheet.fldCheckImp_02 = false; 
            								sheet.fldCheckImp_03 = false; 
            								sheet.fldCheckImp_04 = false; 
            								sheet.fldCheckImp_05 = false; 
            								sheet.fldCheckImp_06 = false; 
            								sheet.fldCheckImp_07 = false; 
            								sheet.fldCheckImp_08 = false; 
            								sheet.fldCheckImp_09 = false; 
            								sheet.fldCheckImp_10 = false; 
            								sheet.fldCheckImp_11 = false; 
            								sheet.fldCheckImp_12 = false; 
            							end;
            						
        end);

    obj._e_event50 = obj.checkImp_02_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_02 = not sheet.fldCheckImp_02;
            							
            							if(sheet.fldCheckImp_02) then 
            								sheet.fldCheckImp_01 = true; 
            							else 
            								sheet.fldCheckImp_01 = false;
            							end;
            							
            							if(sheet.fldCheckImp_03) then 
            								sheet.fldCheckImp_01 = true; 
            								sheet.fldCheckImp_02 = true; 
            								sheet.fldCheckImp_03 = false; 
            								sheet.fldCheckImp_04 = false; 
            								sheet.fldCheckImp_05 = false; 
            								sheet.fldCheckImp_06 = false; 
            								sheet.fldCheckImp_07 = false; 
            								sheet.fldCheckImp_08 = false; 
            								sheet.fldCheckImp_09 = false; 
            								sheet.fldCheckImp_10 = false; 
            								sheet.fldCheckImp_11 = false; 
            								sheet.fldCheckImp_12 = false; 
            							end;
            						
        end);

    obj._e_event51 = obj.checkImp_03_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_03 = not sheet.fldCheckImp_03;
            							
            							if(sheet.fldCheckImp_03) then 
            								sheet.fldCheckImp_01 = true; 
            								sheet.fldCheckImp_02 = true; 
            							else 
            								sheet.fldCheckImp_01 = false; 
            								sheet.fldCheckImp_02 = false; 
            							end;
            							
            							if(sheet.fldCheckImp_04) then 
            								sheet.fldCheckImp_01 = true; 
            								sheet.fldCheckImp_02 = true; 
            								sheet.fldCheckImp_03 = true; 
            								sheet.fldCheckImp_04 = false; 
            								sheet.fldCheckImp_05 = false; 
            								sheet.fldCheckImp_06 = false; 
            								sheet.fldCheckImp_07 = false; 
            								sheet.fldCheckImp_08 = false; 
            								sheet.fldCheckImp_09 = false; 
            								sheet.fldCheckImp_10 = false; 
            								sheet.fldCheckImp_11 = false; 
            								sheet.fldCheckImp_12 = false; 
            							end;
            						
        end);

    obj._e_event52 = obj.checkImp_04_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_04 = not sheet.fldCheckImp_04;
            							
            							if(sheet.fldCheckImp_04) then 
            								sheet.fldCheckImp_01 = true; 
            								sheet.fldCheckImp_02 = true; 
            								sheet.fldCheckImp_03 = true; 
            							else 
            								sheet.fldCheckImp_01 = false; 
            								sheet.fldCheckImp_02 = false; 
            								sheet.fldCheckImp_03 = false; 
            							end;
            							
            							if(sheet.fldCheckImp_05) then 
            								sheet.fldCheckImp_01 = true; 
            								sheet.fldCheckImp_02 = true; 
            								sheet.fldCheckImp_03 = true; 
            								sheet.fldCheckImp_04 = true; 
            								sheet.fldCheckImp_05 = false; 
            								sheet.fldCheckImp_06 = false; 
            								sheet.fldCheckImp_07 = false; 
            								sheet.fldCheckImp_08 = false; 
            								sheet.fldCheckImp_09 = false; 
            								sheet.fldCheckImp_10 = false; 
            								sheet.fldCheckImp_11 = false; 
            								sheet.fldCheckImp_12 = false; 
            							end;
            						
        end);

    obj._e_event53 = obj.checkImp_05_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_05 = not sheet.fldCheckImp_05;
            
            							if(sheet.fldCheckImp_05) then 
            								sheet.fldCheckImp_01 = true; 
            								sheet.fldCheckImp_02 = true; 
            								sheet.fldCheckImp_03 = true; 
            								sheet.fldCheckImp_04 = true; 
            							else 
            								sheet.fldCheckImp_01 = false; 
            								sheet.fldCheckImp_02 = false; 
            								sheet.fldCheckImp_03 = false; 
            								sheet.fldCheckImp_04 = false; 
            							end;
            
            							if(sheet.fldCheckImp_06) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = false;
            								sheet.fldCheckImp_07 = false;
            								sheet.fldCheckImp_08 = false;
            								sheet.fldCheckImp_09 = false;
            								sheet.fldCheckImp_10 = false;
            								sheet.fldCheckImp_11 = false;
            								sheet.fldCheckImp_12 = false;
            							end;
            						
        end);

    obj._e_event54 = obj.checkImp_06_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_06 = not sheet.fldCheckImp_06;
            
            							if(sheet.fldCheckImp_06) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            							else 
            								sheet.fldCheckImp_01 = false;
            								sheet.fldCheckImp_02 = false;
            								sheet.fldCheckImp_03 = false;
            								sheet.fldCheckImp_04 = false;
            								sheet.fldCheckImp_05 = false;
            							end;
            
            							if(sheet.fldCheckImp_07) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = false;
            								sheet.fldCheckImp_08 = false;
            								sheet.fldCheckImp_09 = false;
            								sheet.fldCheckImp_10 = false;
            								sheet.fldCheckImp_11 = false;
            								sheet.fldCheckImp_12 = false;
            							end;
            						
        end);

    obj._e_event55 = obj.checkImp_07_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_07 = not sheet.fldCheckImp_07;
            
            							if(sheet.fldCheckImp_07) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            							else 
            								sheet.fldCheckImp_01 = false;
            								sheet.fldCheckImp_02 = false;
            								sheet.fldCheckImp_03 = false;
            								sheet.fldCheckImp_04 = false;
            								sheet.fldCheckImp_05 = false;
            								sheet.fldCheckImp_06 = false;
            							end;
            
            							if(sheet.fldCheckImp_08) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = false;
            								sheet.fldCheckImp_09 = false;
            								sheet.fldCheckImp_10 = false;
            								sheet.fldCheckImp_11 = false;
            								sheet.fldCheckImp_12 = false;
            							end;
            						
        end);

    obj._e_event56 = obj.checkImp_08_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_08 = not sheet.fldCheckImp_08;
            
            							if(sheet.fldCheckImp_08) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            							else 
            								sheet.fldCheckImp_01 = false;
            								sheet.fldCheckImp_02 = false;
            								sheet.fldCheckImp_03 = false;
            								sheet.fldCheckImp_04 = false;
            								sheet.fldCheckImp_05 = false;
            								sheet.fldCheckImp_06 = false;
            								sheet.fldCheckImp_07 = false;
            							end;
            
            							if(sheet.fldCheckImp_09) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = true;
            								sheet.fldCheckImp_09 = false;
            								sheet.fldCheckImp_10 = false;
            								sheet.fldCheckImp_11 = false;
            								sheet.fldCheckImp_12 = false;
            							end;
            						
        end);

    obj._e_event57 = obj.checkImp_09_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_09 = not sheet.fldCheckImp_09;
            
            							if(sheet.fldCheckImp_09) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = true;
            							else 
            								sheet.fldCheckImp_01 = false;
            								sheet.fldCheckImp_02 = false;
            								sheet.fldCheckImp_03 = false;
            								sheet.fldCheckImp_04 = false;
            								sheet.fldCheckImp_05 = false;
            								sheet.fldCheckImp_06 = false;
            								sheet.fldCheckImp_07 = false;
            								sheet.fldCheckImp_08 = false;
            							end;
            
            							if(sheet.fldCheckImp_10) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = true;
            								sheet.fldCheckImp_09 = true;
            								sheet.fldCheckImp_10 = false;
            								sheet.fldCheckImp_11 = false;
            								sheet.fldCheckImp_12 = false;
            							end;
            						
        end);

    obj._e_event58 = obj.checkImp_10_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_10 = not sheet.fldCheckImp_10;
            
            							if(sheet.fldCheckImp_10) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = true;
            								sheet.fldCheckImp_09 = true;
            							else 
            								sheet.fldCheckImp_01 = false;
            								sheet.fldCheckImp_02 = false;
            								sheet.fldCheckImp_03 = false;
            								sheet.fldCheckImp_04 = false;
            								sheet.fldCheckImp_05 = false;
            								sheet.fldCheckImp_06 = false;
            								sheet.fldCheckImp_07 = false;
            								sheet.fldCheckImp_08 = false;
            								sheet.fldCheckImp_09 = false;
            							end;
            
            							if(sheet.fldCheckImp_11) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = true;
            								sheet.fldCheckImp_09 = true;
            								sheet.fldCheckImp_10 = true;
            								sheet.fldCheckImp_11 = false;
            								sheet.fldCheckImp_12 = false;
            							end;
            						
        end);

    obj._e_event59 = obj.checkImp_11_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_11 = not sheet.fldCheckImp_11;
            
            							if(sheet.fldCheckImp_11) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = true;
            								sheet.fldCheckImp_09 = true;
            								sheet.fldCheckImp_10 = true;
            							else 
            								sheet.fldCheckImp_01 = false;
            								sheet.fldCheckImp_02 = false;
            								sheet.fldCheckImp_03 = false;
            								sheet.fldCheckImp_04 = false;
            								sheet.fldCheckImp_05 = false;
            								sheet.fldCheckImp_06 = false;
            								sheet.fldCheckImp_07 = false;
            								sheet.fldCheckImp_08 = false;
            								sheet.fldCheckImp_09 = false;
            								sheet.fldCheckImp_10 = false;
            							end;
            
            							if(sheet.fldCheckImp_12) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = true;
            								sheet.fldCheckImp_09 = true;
            								sheet.fldCheckImp_10 = true;
            								sheet.fldCheckImp_11 = true;
            								sheet.fldCheckImp_12 = false;
            							end;
            						
        end);

    obj._e_event60 = obj.checkImp_12_Imp:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckImp_12 = not sheet.fldCheckImp_12;
            
            							if(sheet.fldCheckImp_12) then 
            								sheet.fldCheckImp_01 = true;
            								sheet.fldCheckImp_02 = true;
            								sheet.fldCheckImp_03 = true;
            								sheet.fldCheckImp_04 = true;
            								sheet.fldCheckImp_05 = true;
            								sheet.fldCheckImp_06 = true;
            								sheet.fldCheckImp_07 = true;
            								sheet.fldCheckImp_08 = true;
            								sheet.fldCheckImp_09 = true;
            								sheet.fldCheckImp_10 = true;
            								sheet.fldCheckImp_11 = true;
            							else 
            								sheet.fldCheckImp_01 = false;
            								sheet.fldCheckImp_02 = false;
            								sheet.fldCheckImp_03 = false;
            								sheet.fldCheckImp_04 = false;
            								sheet.fldCheckImp_05 = false;
            								sheet.fldCheckImp_06 = false;
            								sheet.fldCheckImp_07 = false;
            								sheet.fldCheckImp_08 = false;
            								sheet.fldCheckImp_09 = false;
            								sheet.fldCheckImp_10 = false;
            								sheet.fldCheckImp_11 = false;
            							end;
            						
        end);

    obj._e_event61 = obj.nomeCheck07_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck07_01 = not sheet.fldCheck07_01;
            				
            				if(sheet.fldCheck07_02) then 
            					sheet.fldCheck07_01 = true; 
            					sheet.fldCheck07_02 = false; 
            					sheet.fldCheck07_03 = false; 
            					sheet.fldCheck07_04 = false; 
            					sheet.fldCheck07_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event62 = obj.nomeCheck07_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event63 = obj.nomeCheck07_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event64 = obj.nomeCheck07_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event65 = obj.nomeCheck07_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event66 = obj.nomeCheck08_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck08_01 = not sheet.fldCheck08_01;
            				
            				if(sheet.fldCheck08_02) then 
            					sheet.fldCheck08_01 = true; 
            					sheet.fldCheck08_02 = false; 
            					sheet.fldCheck08_03 = false; 
            					sheet.fldCheck08_04 = false; 
            					sheet.fldCheck08_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event67 = obj.nomeCheck08_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event68 = obj.nomeCheck08_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event69 = obj.nomeCheck08_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event70 = obj.nomeCheck08_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event71 = obj.nomeCheck09_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck09_01 = not sheet.fldCheck09_01;
            				
            				if(sheet.fldCheck09_02) then 
            					sheet.fldCheck09_01 = true; 
            					sheet.fldCheck09_02 = false; 
            					sheet.fldCheck09_03 = false; 
            					sheet.fldCheck09_04 = false; 
            					sheet.fldCheck09_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event72 = obj.nomeCheck09_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event73 = obj.nomeCheck09_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event74 = obj.nomeCheck09_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event75 = obj.nomeCheck09_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event76 = obj.checkVir_01_Vir:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckVir_01 = true;
            							
            							sheet.fldCheckVir_02 = true;
            							sheet.fldCheckVir_03 = true;
            							sheet.fldCheckVir_04 = false;
            							sheet.fldCheckVir_05 = false;
            						
        end);

    obj._e_event77 = obj.checkVir_02_Vir:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckVir_02 = true;
            							
            							sheet.fldCheckVir_01 = false;
            							sheet.fldCheckVir_03 = true;
            							sheet.fldCheckVir_04 = false;
            							sheet.fldCheckVir_05 = false;
            						
        end);

    obj._e_event78 = obj.checkVir_03_Vir:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckVir_03 = true;
            							
            							sheet.fldCheckVir_01 = false;
            							sheet.fldCheckVir_02 = false;
            							sheet.fldCheckVir_04 = false;
            							sheet.fldCheckVir_05 = false;
            						
        end);

    obj._e_event79 = obj.checkVir_04_Vir:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckVir_04 = true;
            							
            							sheet.fldCheckVir_01 = false;
            							sheet.fldCheckVir_02 = false;
            							sheet.fldCheckVir_03 = true;
            							sheet.fldCheckVir_05 = false;
            						
        end);

    obj._e_event80 = obj.checkVir_05_Vir:addEventListener("onClick",
        function (event)
            
            							sheet.fldCheckVir_05 = true;
            							
            							sheet.fldCheckVir_01 = false;
            							sheet.fldCheckVir_02 = false;
            							sheet.fldCheckVir_03 = true;
            							sheet.fldCheckVir_04 = true;
            						
        end);

    obj._e_event81 = obj.nomeBut10:addEventListener("onClick",
        function (event)
            self.popUp_10:show('right', self.nomeBut10);
        end);

    obj._e_event82 = obj.nomeBut10B:addEventListener("onClick",
        function (event)
            self.popUp_10:show('right', self.nomeBut10);
        end);

    obj._e_event83 = obj.dataLink26:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase10 == nil or sheet.fldEnfase10 == "Ênfases") then
            										self.nomeBut10.visible = true;
            										self.nomeBut10B.visible = false;
            									else
            										self.nomeBut10B.visible = true;
            										self.nomeBut10.visible = false;
            									end;
        end);

    obj._e_event84 = obj.nomeCheck10_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck10_01 = not sheet.fldCheck10_01;
            				
            				if(sheet.fldCheck10_02) then 
            					sheet.fldCheck10_01 = true; 
            					sheet.fldCheck10_02 = false; 
            					sheet.fldCheck10_03 = false; 
            					sheet.fldCheck10_04 = false; 
            					sheet.fldCheck10_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event85 = obj.nomeCheck10_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event86 = obj.nomeCheck10_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event87 = obj.nomeCheck10_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event88 = obj.nomeCheck10_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event89 = obj.nomeBut11:addEventListener("onClick",
        function (event)
            self.popUp_11:show('right', self.nomeBut11);
        end);

    obj._e_event90 = obj.nomeBut11B:addEventListener("onClick",
        function (event)
            self.popUp_11:show('right', self.nomeBut11);
        end);

    obj._e_event91 = obj.dataLink27:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase11 == nil or sheet.fldEnfase11 == "Ênfases") then
            										self.nomeBut11.visible = true;
            										self.nomeBut11B.visible = false;
            									else
            										self.nomeBut11B.visible = true;
            										self.nomeBut11.visible = false;
            									end;
        end);

    obj._e_event92 = obj.nomeCheck11_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck11_01 = not sheet.fldCheck11_01;
            				
            				if(sheet.fldCheck11_02) then 
            					sheet.fldCheck11_01 = true; 
            					sheet.fldCheck11_02 = false; 
            					sheet.fldCheck11_03 = false; 
            					sheet.fldCheck11_04 = false; 
            					sheet.fldCheck11_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event93 = obj.nomeCheck11_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event94 = obj.nomeCheck11_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event95 = obj.nomeCheck11_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event96 = obj.nomeCheck11_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event97 = obj.nomeBut12:addEventListener("onClick",
        function (event)
            self.popUp_12:show('right', self.nomeBut12);
        end);

    obj._e_event98 = obj.nomeBut12B:addEventListener("onClick",
        function (event)
            self.popUp_12:show('right', self.nomeBut12);
        end);

    obj._e_event99 = obj.dataLink28:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase12 == nil or sheet.fldEnfase12 == "Ênfases") then
            										self.nomeBut12.visible = true;
            										self.nomeBut12B.visible = false;
            									else
            										self.nomeBut12B.visible = true;
            										self.nomeBut12.visible = false;
            									end;
        end);

    obj._e_event100 = obj.nomeCheck12_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck12_01 = not sheet.fldCheck12_01;
            				
            				if(sheet.fldCheck12_02) then 
            					sheet.fldCheck12_01 = true; 
            					sheet.fldCheck12_02 = false; 
            					sheet.fldCheck12_03 = false; 
            					sheet.fldCheck12_04 = false; 
            					sheet.fldCheck12_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event101 = obj.nomeCheck12_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event102 = obj.nomeCheck12_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event103 = obj.nomeCheck12_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event104 = obj.nomeCheck12_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event105 = obj.nomeBut13:addEventListener("onClick",
        function (event)
            self.popUp_13:show('right', self.nomeBut13);
        end);

    obj._e_event106 = obj.nomeBut13B:addEventListener("onClick",
        function (event)
            self.popUp_13:show('right', self.nomeBut13);
        end);

    obj._e_event107 = obj.dataLink29:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase13 == nil or sheet.fldEnfase13 == "Ênfases") then
            										self.nomeBut13.visible = true;
            										self.nomeBut13B.visible = false;
            									else
            										self.nomeBut13B.visible = true;
            										self.nomeBut13.visible = false;
            									end;
        end);

    obj._e_event108 = obj.nomeCheck13_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck13_01 = not sheet.fldCheck13_01;
            				
            				if(sheet.fldCheck13_02) then 
            					sheet.fldCheck13_01 = true; 
            					sheet.fldCheck13_02 = false; 
            					sheet.fldCheck13_03 = false; 
            					sheet.fldCheck13_04 = false; 
            					sheet.fldCheck13_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event109 = obj.nomeCheck13_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event110 = obj.nomeCheck13_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event111 = obj.nomeCheck13_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event112 = obj.nomeCheck13_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event113 = obj.nomeBut14:addEventListener("onClick",
        function (event)
            self.popUp_14:show('right', self.nomeBut14);
        end);

    obj._e_event114 = obj.nomeBut14B:addEventListener("onClick",
        function (event)
            self.popUp_14:show('right', self.nomeBut14);
        end);

    obj._e_event115 = obj.dataLink30:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase14 == nil or sheet.fldEnfase14 == "Ênfases") then
            										self.nomeBut14.visible = true;
            										self.nomeBut14B.visible = false;
            									else
            										self.nomeBut14B.visible = true;
            										self.nomeBut14.visible = false;
            									end;
        end);

    obj._e_event116 = obj.nomeCheck14_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck14_01 = not sheet.fldCheck14_01;
            				
            				if(sheet.fldCheck14_02) then 
            					sheet.fldCheck14_01 = true; 
            					sheet.fldCheck14_02 = false; 
            					sheet.fldCheck14_03 = false; 
            					sheet.fldCheck14_04 = false; 
            					sheet.fldCheck14_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event117 = obj.nomeCheck14_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event118 = obj.nomeCheck14_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event119 = obj.nomeCheck14_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event120 = obj.nomeCheck14_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event121 = obj.nomeBut15:addEventListener("onClick",
        function (event)
            self.popUp_15:show('right', self.nomeBut15);
        end);

    obj._e_event122 = obj.nomeBut15B:addEventListener("onClick",
        function (event)
            self.popUp_15:show('right', self.nomeBut15);
        end);

    obj._e_event123 = obj.dataLink31:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase15 == nil or sheet.fldEnfase15 == "Ênfases") then
            										self.nomeBut15.visible = true;
            										self.nomeBut15B.visible = false;
            									else
            										self.nomeBut15B.visible = true;
            										self.nomeBut15.visible = false;
            									end;
        end);

    obj._e_event124 = obj.nomeCheck15_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck15_01 = not sheet.fldCheck15_01;
            				
            				if(sheet.fldCheck15_02) then 
            					sheet.fldCheck15_01 = true; 
            					sheet.fldCheck15_02 = false; 
            					sheet.fldCheck15_03 = false; 
            					sheet.fldCheck15_04 = false; 
            					sheet.fldCheck15_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event125 = obj.nomeCheck15_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event126 = obj.nomeCheck15_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event127 = obj.nomeCheck15_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event128 = obj.nomeCheck15_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event129 = obj.nomeBut16:addEventListener("onClick",
        function (event)
            self.popUp_16:show('right', self.nomeBut16);
        end);

    obj._e_event130 = obj.nomeBut16B:addEventListener("onClick",
        function (event)
            self.popUp_16:show('right', self.nomeBut16);
        end);

    obj._e_event131 = obj.dataLink32:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase16 == nil or sheet.fldEnfase16 == "Ênfases") then
            										self.nomeBut16.visible = true;
            										self.nomeBut16B.visible = false;
            									else
            										self.nomeBut16B.visible = true;
            										self.nomeBut16.visible = false;
            									end;
        end);

    obj._e_event132 = obj.nomeCheck16_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck16_01 = not sheet.fldCheck16_01;
            				
            				if(sheet.fldCheck16_02) then 
            					sheet.fldCheck16_01 = true; 
            					sheet.fldCheck16_02 = false; 
            					sheet.fldCheck16_03 = false; 
            					sheet.fldCheck16_04 = false; 
            					sheet.fldCheck16_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event133 = obj.nomeCheck16_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event134 = obj.nomeCheck16_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event135 = obj.nomeCheck16_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event136 = obj.nomeCheck16_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event137 = obj.nomeBut17:addEventListener("onClick",
        function (event)
            self.popUp_17:show('right', self.nomeBut17);
        end);

    obj._e_event138 = obj.nomeBut17B:addEventListener("onClick",
        function (event)
            self.popUp_17:show('right', self.nomeBut17);
        end);

    obj._e_event139 = obj.dataLink33:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase17 == nil or sheet.fldEnfase17 == "Ênfases") then
            										self.nomeBut17.visible = true;
            										self.nomeBut17B.visible = false;
            									else
            										self.nomeBut17B.visible = true;
            										self.nomeBut17.visible = false;
            									end;
        end);

    obj._e_event140 = obj.nomeCheck17_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck17_01 = not sheet.fldCheck17_01;
            				
            				if(sheet.fldCheck17_02) then 
            					sheet.fldCheck17_01 = true; 
            					sheet.fldCheck17_02 = false; 
            					sheet.fldCheck17_03 = false; 
            					sheet.fldCheck17_04 = false; 
            					sheet.fldCheck17_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event141 = obj.nomeCheck17_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event142 = obj.nomeCheck17_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event143 = obj.nomeCheck17_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event144 = obj.nomeCheck17_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event145 = obj.nomeBut18:addEventListener("onClick",
        function (event)
            self.popUp_18:show('right', self.nomeBut18);
        end);

    obj._e_event146 = obj.nomeBut18B:addEventListener("onClick",
        function (event)
            self.popUp_18:show('right', self.nomeBut18);
        end);

    obj._e_event147 = obj.dataLink34:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase18 == nil or sheet.fldEnfase18 == "Ênfases") then
            										self.nomeBut18.visible = true;
            										self.nomeBut18B.visible = false;
            									else
            										self.nomeBut18B.visible = true;
            										self.nomeBut18.visible = false;
            									end;
        end);

    obj._e_event148 = obj.nomeCheck18_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck18_01 = not sheet.fldCheck18_01;
            				
            				if(sheet.fldCheck18_02) then 
            					sheet.fldCheck18_01 = true; 
            					sheet.fldCheck18_02 = false; 
            					sheet.fldCheck18_03 = false; 
            					sheet.fldCheck18_04 = false; 
            					sheet.fldCheck18_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event149 = obj.nomeCheck18_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event150 = obj.nomeCheck18_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event151 = obj.nomeCheck18_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event152 = obj.nomeCheck18_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event153 = obj.nomeBut19:addEventListener("onClick",
        function (event)
            self.popUp_19:show('right', self.nomeBut19);
        end);

    obj._e_event154 = obj.nomeBut19B:addEventListener("onClick",
        function (event)
            self.popUp_19:show('right', self.nomeBut19);
        end);

    obj._e_event155 = obj.dataLink35:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase19 == nil or sheet.fldEnfase19 == "Ênfases") then
            										self.nomeBut19.visible = true;
            										self.nomeBut19B.visible = false;
            									else
            										self.nomeBut19B.visible = true;
            										self.nomeBut19.visible = false;
            									end;
        end);

    obj._e_event156 = obj.nomeCheck19_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck19_01 = not sheet.fldCheck19_01;
            				
            				if(sheet.fldCheck19_02) then 
            					sheet.fldCheck19_01 = true; 
            					sheet.fldCheck19_02 = false; 
            					sheet.fldCheck19_03 = false; 
            					sheet.fldCheck19_04 = false; 
            					sheet.fldCheck19_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event157 = obj.nomeCheck19_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event158 = obj.nomeCheck19_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event159 = obj.nomeCheck19_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event160 = obj.nomeCheck19_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event161 = obj.nomeBut20:addEventListener("onClick",
        function (event)
            self.popUp_20:show('right', self.nomeBut20);
        end);

    obj._e_event162 = obj.nomeBut20B:addEventListener("onClick",
        function (event)
            self.popUp_20:show('right', self.nomeBut20);
        end);

    obj._e_event163 = obj.dataLink36:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase20 == nil or sheet.fldEnfase20 == "Ênfases") then
            										self.nomeBut20.visible = true;
            										self.nomeBut20B.visible = false;
            									else
            										self.nomeBut20B.visible = true;
            										self.nomeBut20.visible = false;
            									end;
        end);

    obj._e_event164 = obj.nomeCheck20_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck20_01 = not sheet.fldCheck20_01;
            				
            				if(sheet.fldCheck20_02) then 
            					sheet.fldCheck20_01 = true; 
            					sheet.fldCheck20_02 = false; 
            					sheet.fldCheck20_03 = false; 
            					sheet.fldCheck20_04 = false; 
            					sheet.fldCheck20_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event165 = obj.nomeCheck20_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event166 = obj.nomeCheck20_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event167 = obj.nomeCheck20_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event168 = obj.nomeCheck20_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event169 = obj.nomeBut21:addEventListener("onClick",
        function (event)
            self.popUp_21:show('right', self.nomeBut21);
        end);

    obj._e_event170 = obj.nomeBut21B:addEventListener("onClick",
        function (event)
            self.popUp_21:show('right', self.nomeBut21);
        end);

    obj._e_event171 = obj.dataLink37:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase21 == nil or sheet.fldEnfase21 == "Ênfases") then
            										self.nomeBut21.visible = true;
            										self.nomeBut21B.visible = false;
            									else
            										self.nomeBut21B.visible = true;
            										self.nomeBut21.visible = false;
            									end;
        end);

    obj._e_event172 = obj.nomeCheck21_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck21_01 = not sheet.fldCheck21_01;
            				
            				if(sheet.fldCheck21_02) then 
            					sheet.fldCheck21_01 = true; 
            					sheet.fldCheck21_02 = false; 
            					sheet.fldCheck21_03 = false; 
            					sheet.fldCheck21_04 = false; 
            					sheet.fldCheck21_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event173 = obj.nomeCheck21_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event174 = obj.nomeCheck21_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event175 = obj.nomeCheck21_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event176 = obj.nomeCheck21_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event177 = obj.nomeBut22:addEventListener("onClick",
        function (event)
            self.popUp_22:show('right', self.nomeBut22);
        end);

    obj._e_event178 = obj.nomeBut22B:addEventListener("onClick",
        function (event)
            self.popUp_22:show('right', self.nomeBut22);
        end);

    obj._e_event179 = obj.dataLink38:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase22 == nil or sheet.fldEnfase22 == "Ênfases") then
            										self.nomeBut22.visible = true;
            										self.nomeBut22B.visible = false;
            									else
            										self.nomeBut22B.visible = true;
            										self.nomeBut22.visible = false;
            									end;
        end);

    obj._e_event180 = obj.nomeCheck22_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck22_01 = not sheet.fldCheck22_01;
            				
            				if(sheet.fldCheck22_02) then 
            					sheet.fldCheck22_01 = true; 
            					sheet.fldCheck22_02 = false; 
            					sheet.fldCheck22_03 = false; 
            					sheet.fldCheck22_04 = false; 
            					sheet.fldCheck22_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event181 = obj.nomeCheck22_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event182 = obj.nomeCheck22_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event183 = obj.nomeCheck22_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event184 = obj.nomeCheck22_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event185 = obj.nomeBut23:addEventListener("onClick",
        function (event)
            self.popUp_23:show('right', self.nomeBut23);
        end);

    obj._e_event186 = obj.nomeBut23B:addEventListener("onClick",
        function (event)
            self.popUp_23:show('right', self.nomeBut23);
        end);

    obj._e_event187 = obj.dataLink39:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase23 == nil or sheet.fldEnfase23 == "Ênfases") then
            										self.nomeBut23.visible = true;
            										self.nomeBut23B.visible = false;
            									else
            										self.nomeBut23B.visible = true;
            										self.nomeBut23.visible = false;
            									end;
        end);

    obj._e_event188 = obj.nomeCheck23_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck23_01 = not sheet.fldCheck23_01;
            				
            				if(sheet.fldCheck23_02) then 
            					sheet.fldCheck23_01 = true; 
            					sheet.fldCheck23_02 = false; 
            					sheet.fldCheck23_03 = false; 
            					sheet.fldCheck23_04 = false; 
            					sheet.fldCheck23_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event189 = obj.nomeCheck23_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event190 = obj.nomeCheck23_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event191 = obj.nomeCheck23_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event192 = obj.nomeCheck23_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event193 = obj.nomeBut24:addEventListener("onClick",
        function (event)
            self.popUp_24:show('right', self.nomeBut24);
        end);

    obj._e_event194 = obj.nomeBut24B:addEventListener("onClick",
        function (event)
            self.popUp_24:show('right', self.nomeBut24);
        end);

    obj._e_event195 = obj.dataLink40:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase24 == nil or sheet.fldEnfase24 == "Ênfases") then
            										self.nomeBut24.visible = true;
            										self.nomeBut24B.visible = false;
            									else
            										self.nomeBut24B.visible = true;
            										self.nomeBut24.visible = false;
            									end;
        end);

    obj._e_event196 = obj.nomeCheck24_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck24_01 = not sheet.fldCheck24_01;
            				
            				if(sheet.fldCheck24_02) then 
            					sheet.fldCheck24_01 = true; 
            					sheet.fldCheck24_02 = false; 
            					sheet.fldCheck24_03 = false; 
            					sheet.fldCheck24_04 = false; 
            					sheet.fldCheck24_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event197 = obj.nomeCheck24_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event198 = obj.nomeCheck24_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event199 = obj.nomeCheck24_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event200 = obj.nomeCheck24_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event201 = obj.nomeBut25:addEventListener("onClick",
        function (event)
            self.popUp_25:show('right', self.nomeBut25);
        end);

    obj._e_event202 = obj.nomeBut25B:addEventListener("onClick",
        function (event)
            self.popUp_25:show('right', self.nomeBut25);
        end);

    obj._e_event203 = obj.dataLink41:addEventListener("onChange",
        function (field, oldValue, newValue)
            if(sheet == nil) then return; end;
            									if(sheet.fldEnfase25 == nil or sheet.fldEnfase25 == "Ênfases") then
            										self.nomeBut25.visible = true;
            										self.nomeBut25B.visible = false;
            									else
            										self.nomeBut25B.visible = true;
            										self.nomeBut25.visible = false;
            									end;
        end);

    obj._e_event204 = obj.nomeCheck25_01:addEventListener("onClick",
        function (event)
             
            				sheet.fldCheck25_01 = not sheet.fldCheck25_01;
            				
            				if(sheet.fldCheck25_02) then 
            					sheet.fldCheck25_01 = true; 
            					sheet.fldCheck25_02 = false; 
            					sheet.fldCheck25_03 = false; 
            					sheet.fldCheck25_04 = false; 
            					sheet.fldCheck25_05 = false; 
            				end;
            				
            				CalcPontos();
            			
        end);

    obj._e_event205 = obj.nomeCheck25_02:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event206 = obj.nomeCheck25_03:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event207 = obj.nomeCheck25_04:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event208 = obj.nomeCheck25_05:addEventListener("onClick",
        function (event)
            
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
            				
            				CalcPontos();
            			
        end);

    obj._e_event209 = obj.rclLegados:addEventListener("onItemRemoved",
        function (node, form)
            self.idFundo:needRepaint();
        end);

    obj._e_event210 = obj.rclLegados:addEventListener("onSelect",
        function ()
            self.rclLegados:sort();
        end);

    obj._e_event211 = obj.rclLegados:addEventListener("onCompare",
        function (nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.fldLegados, nodeB.fldLegados);
        end);

    obj._e_event212 = obj.button1:addEventListener("onClick",
        function (event)
            self.rclLegados:append(); self.idFundo:needRepaint();
        end);

    obj._e_event213 = obj.rclTruques:addEventListener("onItemRemoved",
        function (node, form)
            self.idFundo:needRepaint();
        end);

    obj._e_event214 = obj.rclTruques:addEventListener("onSelect",
        function ()
            self.rclTruques:sort();
        end);

    obj._e_event215 = obj.rclTruques:addEventListener("onCompare",
        function (nodeA, nodeB)
            if nodeA.fldLegado == nodeB.fldLegado then
            															if nodeA.fldGrau == nodeB.fldGrau then
            																return Utils.compareStringPtBr(nodeA.fldTruques, nodeB.fldTruques);
            															else
            																return Utils.compareStringPtBr(nodeA.fldGrau, nodeB.fldGrau);
            															end
            														else
            															return Utils.compareStringPtBr(nodeA.fldLegado, nodeB.fldLegado);
            														end
        end);

    obj._e_event216 = obj.button2:addEventListener("onClick",
        function (event)
            self.rclTruques:append(); self.idFundo:needRepaint();
        end);

    obj._e_event217 = obj.rclHerancas:addEventListener("onItemRemoved",
        function (node, form)
            self.idFundo:needRepaint();
        end);

    obj._e_event218 = obj.rclHerancas:addEventListener("onSelect",
        function ()
            self.rclHerancas:sort();
        end);

    obj._e_event219 = obj.rclHerancas:addEventListener("onCompare",
        function (nodeA, nodeB)
            if nodeA.fldHerTipo == nodeB.fldHerTipo then
            															return Utils.compareStringPtBr(nodeA.fldHerancas, nodeB.fldHerancas);
            														else
            															return Utils.compareStringPtBr(nodeA.fldHerTipo, nodeB.fldHerTipo);
            														end
        end);

    obj._e_event220 = obj.button3:addEventListener("onClick",
        function (event)
            self.rclHerancas:append(); self.idFundo:needRepaint();
        end);

    obj._e_event221 = obj.rclEsferas:addEventListener("onItemRemoved",
        function (node, form)
            self.idFundo:needRepaint();
        end);

    obj._e_event222 = obj.rclEsferas:addEventListener("onSelect",
        function ()
            self.rclEsferas:sort();
        end);

    obj._e_event223 = obj.rclEsferas:addEventListener("onCompare",
        function (nodeA, nodeB)
            if nodeA.fldEsfCategoria == nodeB.fldEsfCategoria then
            															if nodeA.fldEsfTipo == nodeB.fldEsfTipo then
            																return Utils.compareStringPtBr(nodeA.fldEsferas, nodeB.fldEsferas);
            															else
            																return Utils.compareStringPtBr(nodeA.fldEsfTipo, nodeB.fldEsfTipo);
            															end
            														else
            															return Utils.compareStringPtBr(nodeA.fldEsfCategoria, nodeB.fldEsfCategoria);
            														end
        end);

    obj._e_event224 = obj.button4:addEventListener("onClick",
        function (event)
            self.rclEsferas:append(); self.idFundo:needRepaint();
        end);

    obj._e_event225 = obj.image7:addEventListener("onClick",
        function (event)
            if(sheet==nil) then return end; TrocarAba('D');
        end);

    function obj:_releaseEvents()
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
        if self.nomeCheck21_05 ~= nil then self.nomeCheck21_05:destroy(); self.nomeCheck21_05 = nil; end;
        if self.nomeCheck02_01 ~= nil then self.nomeCheck02_01:destroy(); self.nomeCheck02_01 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.nomeBut19 ~= nil then self.nomeBut19:destroy(); self.nomeBut19 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.nomeCheck14_05 ~= nil then self.nomeCheck14_05:destroy(); self.nomeCheck14_05 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.nomeBut12 ~= nil then self.nomeBut12:destroy(); self.nomeBut12 = nil; end;
        if self.nomeCheck13_02 ~= nil then self.nomeCheck13_02:destroy(); self.nomeCheck13_02 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.nomeCheck05_03 ~= nil then self.nomeCheck05_03:destroy(); self.nomeCheck05_03 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.popImagemFundo ~= nil then self.popImagemFundo:destroy(); self.popImagemFundo = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.rectVidMachucado05 ~= nil then self.rectVidMachucado05:destroy(); self.rectVidMachucado05 = nil; end;
        if self.nomeCheck03_04 ~= nil then self.nomeCheck03_04:destroy(); self.nomeCheck03_04 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.nomeCheck17_03 ~= nil then self.nomeCheck17_03:destroy(); self.nomeCheck17_03 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.nomeCheck03_01 ~= nil then self.nomeCheck03_01:destroy(); self.nomeCheck03_01 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rclHerancas ~= nil then self.rclHerancas:destroy(); self.rclHerancas = nil; end;
        if self.flPart_Machucado07 ~= nil then self.flPart_Machucado07:destroy(); self.flPart_Machucado07 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.nomeCheck10_03 ~= nil then self.nomeCheck10_03:destroy(); self.nomeCheck10_03 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.nomeCheckB11 ~= nil then self.nomeCheckB11:destroy(); self.nomeCheckB11 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.checkImp_06_Imp ~= nil then self.checkImp_06_Imp:destroy(); self.checkImp_06_Imp = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.nomeCheck01_04 ~= nil then self.nomeCheck01_04:destroy(); self.nomeCheck01_04 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.nomeCheckB14 ~= nil then self.nomeCheckB14:destroy(); self.nomeCheckB14 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.nomeCheck16_02 ~= nil then self.nomeCheck16_02:destroy(); self.nomeCheck16_02 = nil; end;
        if self.nomeCheck20_05 ~= nil then self.nomeCheck20_05:destroy(); self.nomeCheck20_05 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.nomeCheck01_01 ~= nil then self.nomeCheck01_01:destroy(); self.nomeCheck01_01 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.nomeCheck08_05 ~= nil then self.nomeCheck08_05:destroy(); self.nomeCheck08_05 = nil; end;
        if self.checkVir_05_Vir ~= nil then self.checkVir_05_Vir:destroy(); self.checkVir_05_Vir = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.popUp_23 ~= nil then self.popUp_23:destroy(); self.popUp_23 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.popUp_24 ~= nil then self.popUp_24:destroy(); self.popUp_24 = nil; end;
        if self.nomeBut22 ~= nil then self.nomeBut22:destroy(); self.nomeBut22 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.nomeBut20B ~= nil then self.nomeBut20B:destroy(); self.nomeBut20B = nil; end;
        if self.nomeBut22B ~= nil then self.nomeBut22B:destroy(); self.nomeBut22B = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.nomeCheck04_03 ~= nil then self.nomeCheck04_03:destroy(); self.nomeCheck04_03 = nil; end;
        if self.nomeCheckB23 ~= nil then self.nomeCheckB23:destroy(); self.nomeCheckB23 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.nomeCheck24_01 ~= nil then self.nomeCheck24_01:destroy(); self.nomeCheck24_01 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.nomeCheck19_02 ~= nil then self.nomeCheck19_02:destroy(); self.nomeCheck19_02 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.nomeCheckB24 ~= nil then self.nomeCheckB24:destroy(); self.nomeCheckB24 = nil; end;
        if self.nomeCheck24_04 ~= nil then self.nomeCheck24_04:destroy(); self.nomeCheck24_04 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.checkImp_05_Imp ~= nil then self.checkImp_05_Imp:destroy(); self.checkImp_05_Imp = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.btnImagemFundo ~= nil then self.btnImagemFundo:destroy(); self.btnImagemFundo = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.nomeCheck06_02 ~= nil then self.nomeCheck06_02:destroy(); self.nomeCheck06_02 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.nomeCheck22_04 ~= nil then self.nomeCheck22_04:destroy(); self.nomeCheck22_04 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.nomeFei03 ~= nil then self.nomeFei03:destroy(); self.nomeFei03 = nil; end;
        if self.nomeCheck25_01 ~= nil then self.nomeCheck25_01:destroy(); self.nomeCheck25_01 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.nomeCheck06_05 ~= nil then self.nomeCheck06_05:destroy(); self.nomeCheck06_05 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.nomeCheck09_05 ~= nil then self.nomeCheck09_05:destroy(); self.nomeCheck09_05 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.nomeCheck22_03 ~= nil then self.nomeCheck22_03:destroy(); self.nomeCheck22_03 = nil; end;
        if self.popUp_15 ~= nil then self.popUp_15:destroy(); self.popUp_15 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.nomeCheck09_02 ~= nil then self.nomeCheck09_02:destroy(); self.nomeCheck09_02 = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.popUp_18 ~= nil then self.popUp_18:destroy(); self.popUp_18 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.nomeCheck12_03 ~= nil then self.nomeCheck12_03:destroy(); self.nomeCheck12_03 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.nomeCam03 ~= nil then self.nomeCam03:destroy(); self.nomeCam03 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.nomeCheck02_04 ~= nil then self.nomeCheck02_04:destroy(); self.nomeCheck02_04 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.nomeCheck14_02 ~= nil then self.nomeCheck14_02:destroy(); self.nomeCheck14_02 = nil; end;
        if self.nomeBut17B ~= nil then self.nomeBut17B:destroy(); self.nomeBut17B = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.nomeCheck21_03 ~= nil then self.nomeCheck21_03:destroy(); self.nomeCheck21_03 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.nomeCheck13_05 ~= nil then self.nomeCheck13_05:destroy(); self.nomeCheck13_05 = nil; end;
        if self.nomeBut17 ~= nil then self.nomeBut17:destroy(); self.nomeBut17 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.nomeBut10 ~= nil then self.nomeBut10:destroy(); self.nomeBut10 = nil; end;
        if self.frmTemplates ~= nil then self.frmTemplates:destroy(); self.frmTemplates = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.nomeCheck05_05 ~= nil then self.nomeCheck05_05:destroy(); self.nomeCheck05_05 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.nomeCheckB19 ~= nil then self.nomeCheckB19:destroy(); self.nomeCheckB19 = nil; end;
        if self.rectVidMachucado07 ~= nil then self.rectVidMachucado07:destroy(); self.rectVidMachucado07 = nil; end;
        if self.nomeCheck17_01 ~= nil then self.nomeCheck17_01:destroy(); self.nomeCheck17_01 = nil; end;
        if self.nomeCheck03_02 ~= nil then self.nomeCheck03_02:destroy(); self.nomeCheck03_02 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.flPart_Machucado04 ~= nil then self.flPart_Machucado04:destroy(); self.flPart_Machucado04 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.rectVidMachucado02 ~= nil then self.rectVidMachucado02:destroy(); self.rectVidMachucado02 = nil; end;
        if self.nomeCheck17_04 ~= nil then self.nomeCheck17_04:destroy(); self.nomeCheck17_04 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flPart_Machucado01 ~= nil then self.flPart_Machucado01:destroy(); self.flPart_Machucado01 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.nomeCheckB13 ~= nil then self.nomeCheckB13:destroy(); self.nomeCheckB13 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.nomeBut25B ~= nil then self.nomeBut25B:destroy(); self.nomeBut25B = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.nomeCheckB16 ~= nil then self.nomeCheckB16:destroy(); self.nomeCheckB16 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.nomeCheck20_03 ~= nil then self.nomeCheck20_03:destroy(); self.nomeCheck20_03 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.nomeCheck01_03 ~= nil then self.nomeCheck01_03:destroy(); self.nomeCheck01_03 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.popUp_21 ~= nil then self.popUp_21:destroy(); self.popUp_21 = nil; end;
        if self.nomeBut21 ~= nil then self.nomeBut21:destroy(); self.nomeBut21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.nomeCheck16_05 ~= nil then self.nomeCheck16_05:destroy(); self.nomeCheck16_05 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.nomeCheck08_02 ~= nil then self.nomeCheck08_02:destroy(); self.nomeCheck08_02 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.checkImp_07_Imp ~= nil then self.checkImp_07_Imp:destroy(); self.checkImp_07_Imp = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.nomeCheck04_05 ~= nil then self.nomeCheck04_05:destroy(); self.nomeCheck04_05 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.nomeCheck19_01 ~= nil then self.nomeCheck19_01:destroy(); self.nomeCheck19_01 = nil; end;
        if self.nomeCheckB21 ~= nil then self.nomeCheckB21:destroy(); self.nomeCheckB21 = nil; end;
        if self.horzLine10 ~= nil then self.horzLine10:destroy(); self.horzLine10 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.nomeCheck15_02 ~= nil then self.nomeCheck15_02:destroy(); self.nomeCheck15_02 = nil; end;
        if self.checkMulVit_Des_03_Leg ~= nil then self.checkMulVit_Des_03_Leg:destroy(); self.checkMulVit_Des_03_Leg = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.nomeCheck07_03 ~= nil then self.nomeCheck07_03:destroy(); self.nomeCheck07_03 = nil; end;
        if self.nomeBut21B ~= nil then self.nomeBut21B:destroy(); self.nomeBut21B = nil; end;
        if self.nomeCheck23_05 ~= nil then self.nomeCheck23_05:destroy(); self.nomeCheck23_05 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layVerso ~= nil then self.layVerso:destroy(); self.layVerso = nil; end;
        if self.nomeCheck18_04 ~= nil then self.nomeCheck18_04:destroy(); self.nomeCheck18_04 = nil; end;
        if self.nomeCheck25_02 ~= nil then self.nomeCheck25_02:destroy(); self.nomeCheck25_02 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.nomeCheck07_04 ~= nil then self.nomeCheck07_04:destroy(); self.nomeCheck07_04 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.nomeCheck23_02 ~= nil then self.nomeCheck23_02:destroy(); self.nomeCheck23_02 = nil; end;
        if self.popUp_10 ~= nil then self.popUp_10:destroy(); self.popUp_10 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.nomeFei01 ~= nil then self.nomeFei01:destroy(); self.nomeFei01 = nil; end;
        if self.nomeCheck18_01 ~= nil then self.nomeCheck18_01:destroy(); self.nomeCheck18_01 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.nomeCheck11_05 ~= nil then self.nomeCheck11_05:destroy(); self.nomeCheck11_05 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.rclEsferas ~= nil then self.rclEsferas:destroy(); self.rclEsferas = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.popUp_17 ~= nil then self.popUp_17:destroy(); self.popUp_17 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.nomeCheck12_04 ~= nil then self.nomeCheck12_04:destroy(); self.nomeCheck12_04 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.checkImp_11_Imp ~= nil then self.checkImp_11_Imp:destroy(); self.checkImp_11_Imp = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.nomeCheck12_01 ~= nil then self.nomeCheck12_01:destroy(); self.nomeCheck12_01 = nil; end;
        if self.nomeBut19B ~= nil then self.nomeBut19B:destroy(); self.nomeBut19B = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.nomeCam01 ~= nil then self.nomeCam01:destroy(); self.nomeCam01 = nil; end;
        if self.nomeBut11B ~= nil then self.nomeBut11B:destroy(); self.nomeBut11B = nil; end;
        if self.nomeBut13B ~= nil then self.nomeBut13B:destroy(); self.nomeBut13B = nil; end;
        if self.nomeCheck21_04 ~= nil then self.nomeCheck21_04:destroy(); self.nomeCheck21_04 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.nomeCheck02_02 ~= nil then self.nomeCheck02_02:destroy(); self.nomeCheck02_02 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.checkVir_03_Vir ~= nil then self.checkVir_03_Vir:destroy(); self.checkVir_03_Vir = nil; end;
        if self.nomeBut18 ~= nil then self.nomeBut18:destroy(); self.nomeBut18 = nil; end;
        if self.rclLegados ~= nil then self.rclLegados:destroy(); self.rclLegados = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.nomeCheck14_04 ~= nil then self.nomeCheck14_04:destroy(); self.nomeCheck14_04 = nil; end;
        if self.nomeCheck21_01 ~= nil then self.nomeCheck21_01:destroy(); self.nomeCheck21_01 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.nomeBut15 ~= nil then self.nomeBut15:destroy(); self.nomeBut15 = nil; end;
        if self.nomeCheck13_03 ~= nil then self.nomeCheck13_03:destroy(); self.nomeCheck13_03 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.nomeCheck05_02 ~= nil then self.nomeCheck05_02:destroy(); self.nomeCheck05_02 = nil; end;
        if self.checkMulVit_Des_04_Leg ~= nil then self.checkMulVit_Des_04_Leg:destroy(); self.checkMulVit_Des_04_Leg = nil; end;
        if self.checkImp_08_Imp ~= nil then self.checkImp_08_Imp:destroy(); self.checkImp_08_Imp = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.nomeBut16B ~= nil then self.nomeBut16B:destroy(); self.nomeBut16B = nil; end;
        if self.nomeCheck10_05 ~= nil then self.nomeCheck10_05:destroy(); self.nomeCheck10_05 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.rectVidMachucado01 ~= nil then self.rectVidMachucado01:destroy(); self.rectVidMachucado01 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.nomeBut15B ~= nil then self.nomeBut15B:destroy(); self.nomeBut15B = nil; end;
        if self.flPart_Machucado06 ~= nil then self.flPart_Machucado06:destroy(); self.flPart_Machucado06 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.nomeCheck10_02 ~= nil then self.nomeCheck10_02:destroy(); self.nomeCheck10_02 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.nomeBut23B ~= nil then self.nomeBut23B:destroy(); self.nomeBut23B = nil; end;
        if self.idFundo ~= nil then self.idFundo:destroy(); self.idFundo = nil; end;
        if self.flPart_Machucado03 ~= nil then self.flPart_Machucado03:destroy(); self.flPart_Machucado03 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.checkImp_02_Imp ~= nil then self.checkImp_02_Imp:destroy(); self.checkImp_02_Imp = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.nomeCheckB15 ~= nil then self.nomeCheckB15:destroy(); self.nomeCheckB15 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.popUp_22 ~= nil then self.popUp_22:destroy(); self.popUp_22 = nil; end;
        if self.nomeBut24 ~= nil then self.nomeBut24:destroy(); self.nomeBut24 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.nomeCheck20_01 ~= nil then self.nomeCheck20_01:destroy(); self.nomeCheck20_01 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.nomeCheck08_01 ~= nil then self.nomeCheck08_01:destroy(); self.nomeCheck08_01 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.nomeBut23 ~= nil then self.nomeBut23:destroy(); self.nomeBut23 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.nomeCheck19_04 ~= nil then self.nomeCheck19_04:destroy(); self.nomeCheck19_04 = nil; end;
        if self.nomeCheckB22 ~= nil then self.nomeCheckB22:destroy(); self.nomeCheckB22 = nil; end;
        if self.nomeCheck24_02 ~= nil then self.nomeCheck24_02:destroy(); self.nomeCheck24_02 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.nomeCheck19_03 ~= nil then self.nomeCheck19_03:destroy(); self.nomeCheck19_03 = nil; end;
        if self.nomeCheck24_05 ~= nil then self.nomeCheck24_05:destroy(); self.nomeCheck24_05 = nil; end;
        if self.nomeCheck15_01 ~= nil then self.nomeCheck15_01:destroy(); self.nomeCheck15_01 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.horzLine12 ~= nil then self.horzLine12:destroy(); self.horzLine12 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.nomeCheck15_04 ~= nil then self.nomeCheck15_04:destroy(); self.nomeCheck15_04 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.nomeCheck06_03 ~= nil then self.nomeCheck06_03:destroy(); self.nomeCheck06_03 = nil; end;
        if self.nomeCheck07_01 ~= nil then self.nomeCheck07_01:destroy(); self.nomeCheck07_01 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.nomeCheck22_05 ~= nil then self.nomeCheck22_05:destroy(); self.nomeCheck22_05 = nil; end;
        if self.nomeFei02 ~= nil then self.nomeFei02:destroy(); self.nomeFei02 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.nomeCheck09_04 ~= nil then self.nomeCheck09_04:destroy(); self.nomeCheck09_04 = nil; end;
        if self.nomeBut14B ~= nil then self.nomeBut14B:destroy(); self.nomeBut14B = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.popUp_12 ~= nil then self.popUp_12:destroy(); self.popUp_12 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.nomeCheck18_03 ~= nil then self.nomeCheck18_03:destroy(); self.nomeCheck18_03 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.nomeCheck25_05 ~= nil then self.nomeCheck25_05:destroy(); self.nomeCheck25_05 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.nomeCheck09_01 ~= nil then self.nomeCheck09_01:destroy(); self.nomeCheck09_01 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.popUp_19 ~= nil then self.popUp_19:destroy(); self.popUp_19 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.nomeCheck12_02 ~= nil then self.nomeCheck12_02:destroy(); self.nomeCheck12_02 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.nomeCheck11_02 ~= nil then self.nomeCheck11_02:destroy(); self.nomeCheck11_02 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.nomeCheck02_05 ~= nil then self.nomeCheck02_05:destroy(); self.nomeCheck02_05 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.nomeCheck14_01 ~= nil then self.nomeCheck14_01:destroy(); self.nomeCheck14_01 = nil; end;
        if self.nomeCheck21_02 ~= nil then self.nomeCheck21_02:destroy(); self.nomeCheck21_02 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.nomeBut16 ~= nil then self.nomeBut16:destroy(); self.nomeBut16 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.nomeBut18B ~= nil then self.nomeBut18B:destroy(); self.nomeBut18B = nil; end;
        if self.nomeBut13 ~= nil then self.nomeBut13:destroy(); self.nomeBut13 = nil; end;
        if self.nomeCheck13_01 ~= nil then self.nomeCheck13_01:destroy(); self.nomeCheck13_01 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.nomeBut10B ~= nil then self.nomeBut10B:destroy(); self.nomeBut10B = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.nomeBut12B ~= nil then self.nomeBut12B:destroy(); self.nomeBut12B = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.nomeCheck05_04 ~= nil then self.nomeCheck05_04:destroy(); self.nomeCheck05_04 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.rectVidMachucado04 ~= nil then self.rectVidMachucado04:destroy(); self.rectVidMachucado04 = nil; end;
        if self.nomeCheck03_05 ~= nil then self.nomeCheck03_05:destroy(); self.nomeCheck03_05 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.nomeCheck17_02 ~= nil then self.nomeCheck17_02:destroy(); self.nomeCheck17_02 = nil; end;
        if self.checkImp_04_Imp ~= nil then self.checkImp_04_Imp:destroy(); self.checkImp_04_Imp = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.rectVidMachucado03 ~= nil then self.rectVidMachucado03:destroy(); self.rectVidMachucado03 = nil; end;
        if self.nomeCheck17_05 ~= nil then self.nomeCheck17_05:destroy(); self.nomeCheck17_05 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.checkMulVit_Des_01_Leg ~= nil then self.checkMulVit_Des_01_Leg:destroy(); self.checkMulVit_Des_01_Leg = nil; end;
        if self.nomeCheckB10 ~= nil then self.nomeCheckB10:destroy(); self.nomeCheckB10 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.nomeCheck01_05 ~= nil then self.nomeCheck01_05:destroy(); self.nomeCheck01_05 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.checkVir_01_Vir ~= nil then self.checkVir_01_Vir:destroy(); self.checkVir_01_Vir = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.nomeCheckB17 ~= nil then self.nomeCheckB17:destroy(); self.nomeCheckB17 = nil; end;
        if self.nomeCheck16_03 ~= nil then self.nomeCheck16_03:destroy(); self.nomeCheck16_03 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.nomeCheck20_04 ~= nil then self.nomeCheck20_04:destroy(); self.nomeCheck20_04 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.nomeCheck01_02 ~= nil then self.nomeCheck01_02:destroy(); self.nomeCheck01_02 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.checkVir_04_Vir ~= nil then self.checkVir_04_Vir:destroy(); self.checkVir_04_Vir = nil; end;
        if self.nomeCheck08_04 ~= nil then self.nomeCheck08_04:destroy(); self.nomeCheck08_04 = nil; end;
        if self.checkMulVit_Des_05_Leg ~= nil then self.checkMulVit_Des_05_Leg:destroy(); self.checkMulVit_Des_05_Leg = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.nomeCheck16_04 ~= nil then self.nomeCheck16_04:destroy(); self.nomeCheck16_04 = nil; end;
        if self.popUp_20 ~= nil then self.popUp_20:destroy(); self.popUp_20 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.nomeCheck08_03 ~= nil then self.nomeCheck08_03:destroy(); self.nomeCheck08_03 = nil; end;
        if self.popUp_25 ~= nil then self.popUp_25:destroy(); self.popUp_25 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.nomeCheck04_02 ~= nil then self.nomeCheck04_02:destroy(); self.nomeCheck04_02 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.nomeCheckB20 ~= nil then self.nomeCheckB20:destroy(); self.nomeCheckB20 = nil; end;
        if self.horzLine11 ~= nil then self.horzLine11:destroy(); self.horzLine11 = nil; end;
        if self.checkImp_10_Imp ~= nil then self.checkImp_10_Imp:destroy(); self.checkImp_10_Imp = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.nomeCheck15_03 ~= nil then self.nomeCheck15_03:destroy(); self.nomeCheck15_03 = nil; end;
        if self.nomeCheckB25 ~= nil then self.nomeCheckB25:destroy(); self.nomeCheckB25 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.nomeCheck07_02 ~= nil then self.nomeCheck07_02:destroy(); self.nomeCheck07_02 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.nomeCheck23_04 ~= nil then self.nomeCheck23_04:destroy(); self.nomeCheck23_04 = nil; end;
        if self.nomeBG ~= nil then self.nomeBG:destroy(); self.nomeBG = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.rclTruques ~= nil then self.rclTruques:destroy(); self.rclTruques = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.nomeCheck06_01 ~= nil then self.nomeCheck06_01:destroy(); self.nomeCheck06_01 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.nomeCheck23_01 ~= nil then self.nomeCheck23_01:destroy(); self.nomeCheck23_01 = nil; end;
        if self.popUp_11 ~= nil then self.popUp_11:destroy(); self.popUp_11 = nil; end;
        if self.flLayVida ~= nil then self.flLayVida:destroy(); self.flLayVida = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.layFrente ~= nil then self.layFrente:destroy(); self.layFrente = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.nomeCheck06_04 ~= nil then self.nomeCheck06_04:destroy(); self.nomeCheck06_04 = nil; end;
        if self.checkImp_09_Imp ~= nil then self.checkImp_09_Imp:destroy(); self.checkImp_09_Imp = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.popUp_14 ~= nil then self.popUp_14:destroy(); self.popUp_14 = nil; end;
        if self.nomeCheck22_02 ~= nil then self.nomeCheck22_02:destroy(); self.nomeCheck22_02 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.nomeCheck11_01 ~= nil then self.nomeCheck11_01:destroy(); self.nomeCheck11_01 = nil; end;
        if self.nomeCheck09_03 ~= nil then self.nomeCheck09_03:destroy(); self.nomeCheck09_03 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.nomeCam02 ~= nil then self.nomeCam02:destroy(); self.nomeCam02 = nil; end;
        if self.layNote ~= nil then self.layNote:destroy(); self.layNote = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.idImgFundo ~= nil then self.idImgFundo:destroy(); self.idImgFundo = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.nomeCheck02_03 ~= nil then self.nomeCheck02_03:destroy(); self.nomeCheck02_03 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.nomeCheck14_03 ~= nil then self.nomeCheck14_03:destroy(); self.nomeCheck14_03 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.nomeBut14 ~= nil then self.nomeBut14:destroy(); self.nomeBut14 = nil; end;
        if self.nomeCheck13_04 ~= nil then self.nomeCheck13_04:destroy(); self.nomeCheck13_04 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.checkVir_02_Vir ~= nil then self.checkVir_02_Vir:destroy(); self.checkVir_02_Vir = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.checkMulVit_Des_02_Leg ~= nil then self.checkMulVit_Des_02_Leg:destroy(); self.checkMulVit_Des_02_Leg = nil; end;
        if self.nomeBut11 ~= nil then self.nomeBut11:destroy(); self.nomeBut11 = nil; end;
        if self.checkImp_12_Imp ~= nil then self.checkImp_12_Imp:destroy(); self.checkImp_12_Imp = nil; end;
        if self.nomeCheck05_01 ~= nil then self.nomeCheck05_01:destroy(); self.nomeCheck05_01 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.nomeCheck10_04 ~= nil then self.nomeCheck10_04:destroy(); self.nomeCheck10_04 = nil; end;
        if self.nomeCheckB18 ~= nil then self.nomeCheckB18:destroy(); self.nomeCheckB18 = nil; end;
        if self.rectVidMachucado06 ~= nil then self.rectVidMachucado06:destroy(); self.rectVidMachucado06 = nil; end;
        if self.nomeCheck03_03 ~= nil then self.nomeCheck03_03:destroy(); self.nomeCheck03_03 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.flPart_Machucado05 ~= nil then self.flPart_Machucado05:destroy(); self.flPart_Machucado05 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.nomeCheck10_01 ~= nil then self.nomeCheck10_01:destroy(); self.nomeCheck10_01 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.flPart_Machucado02 ~= nil then self.flPart_Machucado02:destroy(); self.flPart_Machucado02 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.nomeCheckB12 ~= nil then self.nomeCheckB12:destroy(); self.nomeCheckB12 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.nomeBut25 ~= nil then self.nomeBut25:destroy(); self.nomeBut25 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.nomeCheck16_01 ~= nil then self.nomeCheck16_01:destroy(); self.nomeCheck16_01 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.rectVidInconsciente ~= nil then self.rectVidInconsciente:destroy(); self.rectVidInconsciente = nil; end;
        if self.nomeCheck20_02 ~= nil then self.nomeCheck20_02:destroy(); self.nomeCheck20_02 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.nomeBut20 ~= nil then self.nomeBut20:destroy(); self.nomeBut20 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.nomeCheck04_01 ~= nil then self.nomeCheck04_01:destroy(); self.nomeCheck04_01 = nil; end;
        if self.nomeCheck19_05 ~= nil then self.nomeCheck19_05:destroy(); self.nomeCheck19_05 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.nomeCheck24_03 ~= nil then self.nomeCheck24_03:destroy(); self.nomeCheck24_03 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.checkImp_01_Imp ~= nil then self.checkImp_01_Imp:destroy(); self.checkImp_01_Imp = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.nomeCheck04_04 ~= nil then self.nomeCheck04_04:destroy(); self.nomeCheck04_04 = nil; end;
        if self.nomeBut24B ~= nil then self.nomeBut24B:destroy(); self.nomeBut24B = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.chbTitulo ~= nil then self.chbTitulo:destroy(); self.chbTitulo = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.nomeCheck15_05 ~= nil then self.nomeCheck15_05:destroy(); self.nomeCheck15_05 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.nomeCheck18_05 ~= nil then self.nomeCheck18_05:destroy(); self.nomeCheck18_05 = nil; end;
        if self.nomeCheck25_03 ~= nil then self.nomeCheck25_03:destroy(); self.nomeCheck25_03 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.nomeCheck07_05 ~= nil then self.nomeCheck07_05:destroy(); self.nomeCheck07_05 = nil; end;
        if self.checkImp_03_Imp ~= nil then self.checkImp_03_Imp:destroy(); self.checkImp_03_Imp = nil; end;
        if self.nomeCheck22_01 ~= nil then self.nomeCheck22_01:destroy(); self.nomeCheck22_01 = nil; end;
        if self.popUp_13 ~= nil then self.popUp_13:destroy(); self.popUp_13 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.nomeCheck23_03 ~= nil then self.nomeCheck23_03:destroy(); self.nomeCheck23_03 = nil; end;
        if self.nomeCheck18_02 ~= nil then self.nomeCheck18_02:destroy(); self.nomeCheck18_02 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.nomeCheck25_04 ~= nil then self.nomeCheck25_04:destroy(); self.nomeCheck25_04 = nil; end;
        if self.nomeCheck11_04 ~= nil then self.nomeCheck11_04:destroy(); self.nomeCheck11_04 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.popUp_16 ~= nil then self.popUp_16:destroy(); self.popUp_16 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.nomeCheck12_05 ~= nil then self.nomeCheck12_05:destroy(); self.nomeCheck12_05 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.nomeCheck11_03 ~= nil then self.nomeCheck11_03:destroy(); self.nomeCheck11_03 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmScion2e()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmScion2e();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmScion2e = {
    newEditor = newfrmScion2e, 
    new = newfrmScion2e, 
    name = "frmScion2e", 
    dataType = "thirteen.Scion2e", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    cacheMode = "none", 
    title = "Scion 2e", 
    description=""};

frmScion2e = _frmScion2e;
Firecast.registrarForm(_frmScion2e);
Firecast.registrarDataType(_frmScion2e);

return _frmScion2e;
