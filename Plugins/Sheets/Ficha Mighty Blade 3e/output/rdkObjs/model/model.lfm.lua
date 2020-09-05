require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMB3e()
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
    obj:setName("frmMB3e");
    obj:setFormType("sheetTemplate");
    obj:setDataType("datatype.mb.3.4.1.gustavo.muller");
    obj:setTitle("Mighty Blade 3e");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.pagPrincipal = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.pagPrincipal:setParent(obj);
    obj.pagPrincipal:setAlign("client");
    obj.pagPrincipal:setName("pagPrincipal");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.pagPrincipal);
    obj.tab1:setTitle("Frente");
    obj.tab1:setName("tab1");

    obj.formFicha = GUI.fromHandle(_obj_newObject("form"));
    obj.formFicha:setParent(obj.tab1);
    obj.formFicha:setName("formFicha");
    obj.formFicha:setAlign("client");
    obj.formFicha:setTheme("dark");


		local function recalcBloqueio()
			if self ~= nil and sheet ~= nil then
				local bloqNovo = 5;
				bloqNovo = bloqNovo + (sheet.forca or 0);
				bloqNovo = bloqNovo + (sheet.bloqueioBonus or 0);
				
				local bonusBloqueio = 0;
				local armaduras = NDB.getChildNodes(sheet.armaduras);
				
				for i = 1, #armaduras, 1 do								
					bonusBloqueio = bonusBloqueio + (armaduras[i].defesaArmadura or 0);
				end;			
				
				bloqNovo = bloqNovo + bonusBloqueio;
				
				if bloqNovo ~= 0 then
					sheet.bloqueio = bloqNovo;
				else
					sheet.bloqueio = "";
				end;
			end;
		end;
		
		local function recalcEsquiva()
			if self ~= nil and sheet ~= nil then
				local esquivaNova = 5;
				esquivaNova = esquivaNova + (sheet.agilidade or 0);
				esquivaNova = esquivaNova + (sheet.esquivaBonus or 0);
				
				local bonusEsquiva = 0;
				local armaduras = NDB.getChildNodes(sheet.armaduras);
				
				for i = 1, #armaduras, 1 do
					-- Escudos não adicionam esquiva
					if not armaduras[i].escudoArmadura then
						bonusEsquiva = bonusEsquiva + (armaduras[i].defesaArmadura or 0);
					end;
				end;
				
				esquivaNova = esquivaNova + bonusEsquiva;
				
				if esquivaNova ~= 0 then
					sheet.esquiva = esquivaNova;
				else
					sheet.esquiva = "";
				end;
			end;
		end;
		
		local function recalcDeterminacao()
			if self ~= nil and sheet ~= nil then
				local determinacaoNova = 8;
				determinacaoNova = determinacaoNova + math.max((sheet.inteligencia or 0), (sheet.vontade or 0));
				determinacaoNova = determinacaoNova + (sheet.determinacaoBonus or 0);			
				
				if determinacaoNova ~= 0 then
					sheet.determinacao = determinacaoNova;
				else
					sheet.determinacao = "";
				end;
			end;
		end;
		
		local function recalcArmadura()
			recalcBloqueio();
			recalcEsquiva();
			recalcDeterminacao();
		end;
		
		local function recalcCarga()
			if self ~= nil and sheet ~= nil then
				local forcaToCalculateCarga = (sheet.forca or 0) + (sheet.cargaBonus or 0);
				
				if forcaToCalculateCarga ~= 0 then
					sheet.cargaBasica = forcaToCalculateCarga * 7;
					sheet.cargaPesada = forcaToCalculateCarga * 7 * 5;
					sheet.cargaMaxima = forcaToCalculateCarga * 7 * 10;
				else
					sheet.cargaBasica = "";
					sheet.cargaPesada = "";
					sheet.cargaMaxima = "";
				end;
			end;
		end;
		
		local function hasHeavyArmor()
			local armaduras = NDB.getChildNodes(sheet.armaduras);
		
			for i = 1, #armaduras, 1 do			
				if armaduras[i].pesadaArmadura then
					return true;
				end;
			end;
			
			return false;
		end;
		
		local function hasRigidArmor()
			local armaduras = NDB.getChildNodes(sheet.armaduras);
		
			for i = 1, #armaduras, 1 do			
				if armaduras[i].rigidaArmadura then
					return true;
				end;
			end;
			
			return false;
		end;
		
		local function recalcDeslocAndCorrida()
			if self ~= nil and sheet ~= nil then
				local agilityToCalculateDesloc = (sheet.agilidade or 0);
				local agilityToCalculateCorrida = (sheet.agilidade or 0);
				
				if agilityToCalculateDesloc ~= 0 then
					sheet.deslocamento = math.floor(agilityToCalculateDesloc/2) + 5 + (sheet.deslocamentoBonus or 0);
				else
					sheet.deslocamento = "";
				end;
				
				if agilityToCalculateCorrida ~= 0 then
					local multiplicadorCorrida = 4;
				
					if hasHeavyArmor() then
						multiplicadorCorrida = 3;
					end;
					
					if hasRigidArmor() then
						multiplicadorCorrida = 2;
					end;
					
					sheet.corrida = ((math.floor(agilityToCalculateCorrida/2) + 5) * multiplicadorCorrida) + (sheet.corridaBonus or 0);
				else
					sheet.corrida = "";
				end;
			end;
		end;
	
		local function recalcCargaInventario()
			if self ~= nil and sheet ~= nil then
				local pesoFinal = 0;
				
				local armas = NDB.getChildNodes(sheet.armas);
				local armaduras = NDB.getChildNodes(sheet.armaduras);
				local itens = NDB.getChildNodes(sheet.itens);
					
				for i = 1, #armas, 1 do
					pesoFinal = pesoFinal + (armas[i].pesoArma or 0);
				end;
					
				for i = 1, #armaduras, 1 do
					pesoFinal = pesoFinal + (armaduras[i].pesoArmadura or 0);
				end;
					
				for i = 1, #itens, 1 do
					pesoFinal = pesoFinal + (itens[i].pesoItem or 0);
				end;
					
				if pesoFinal ~= 0 then
					sheet.weight = pesoFinal;
				else
					sheet.weight = "";
				end;				
			end;
		end;
	


    obj.imagemFundo = GUI.fromHandle(_obj_newObject("image"));
    obj.imagemFundo:setParent(obj.formFicha);
    obj.imagemFundo:setName("imagemFundo");
    obj.imagemFundo:setAlign("client");
    obj.imagemFundo:setStyle("autoFit");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.imagemFundo);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.trocarFundo = GUI.fromHandle(_obj_newObject("button"));
    obj.trocarFundo:setParent(obj.scrollBox1);
    obj.trocarFundo:setName("trocarFundo");
    obj.trocarFundo:setText("Trocar Fundo");
    obj.trocarFundo:setHeight(30);
    obj.trocarFundo:setWidth(120);
    obj.trocarFundo:setFontSize(15);

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setMargins({left=20, right=20, top=20, bottom=20});
    obj.flowLayout1:setMaxControlsPerLine(3);
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.flowLayout1);
    obj.image1:setSRC("/model/images/logo.png");
    obj.image1:setWidth(277);
    obj.image1:setHeight(146);
    obj.image1:setMargins({left=0, right=20, top=0});
    obj.image1:setName("image1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(600);
    obj.flowPart1:setMaxWidth(600);
    obj.flowPart1:setHeight(210);
    obj.flowPart1:setVertAlign("center");
    obj.flowPart1:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart1:setMargins({left=5, top=5, right=5, bottom=5});
    obj.flowPart1:setName("flowPart1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowPart1);
    obj.flowLayout2:setWidth(600);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setAlign("client");
    obj.flowLayout2:setLineSpacing(10);
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.baseField1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField1:setParent(obj.flowLayout2);
    obj.baseField1:setHeight(50);
    obj.baseField1:setMinScaledWidth(100);
    obj.baseField1:setMinWidth(150);
    obj.baseField1:setMaxWidth(300);
    obj.baseField1:setMaxScaledWidth(233);
    obj.baseField1:setAvoidScale(true);
    obj.baseField1:setName("baseField1");
    obj.baseField1:setMargins({left=0, right=1, top=0});

    obj.edtbaseField1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField1:setParent(obj.baseField1);
    obj.edtbaseField1:setName("edtbaseField1");
    obj.edtbaseField1:setAlign("top");
    obj.edtbaseField1:setField("personagem");
    obj.edtbaseField1:setTransparent(true);
    obj.edtbaseField1:setFontSize(19);

    obj.linbaseField1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField1:setParent(obj.baseField1);
    obj.linbaseField1:setName("linbaseField1");
    obj.linbaseField1:setAlign("top");
    obj.linbaseField1:setStrokeColor("#FFFFFF50");
    obj.linbaseField1:setStrokeSize(1);

    obj.labbaseField1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField1:setParent(obj.baseField1);
    obj.labbaseField1:setName("labbaseField1");
    obj.labbaseField1:setAlign("top");
    obj.labbaseField1:setText("PERSONAGEM");
    obj.labbaseField1:setVertTextAlign("leading");
    obj.labbaseField1:setWordWrap(true);
    obj.labbaseField1:setTextTrimming("none");
    obj.labbaseField1:setFontSize(13);


				self.baseField1:setHeight(self.edtbaseField1:getHeight() + self.labbaseField1:getHeight() + self.linbaseField1:getHeight());
			


    obj.baseField2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField2:setParent(obj.flowLayout2);
    obj.baseField2:setHeight(50);
    obj.baseField2:setMinScaledWidth(100);
    obj.baseField2:setMinWidth(150);
    obj.baseField2:setMaxWidth(300);
    obj.baseField2:setMaxScaledWidth(233);
    obj.baseField2:setAvoidScale(true);
    obj.baseField2:setName("baseField2");
    obj.baseField2:setMargins({left=0, right=1, top=0});

    obj.edtbaseField2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField2:setParent(obj.baseField2);
    obj.edtbaseField2:setName("edtbaseField2");
    obj.edtbaseField2:setAlign("top");
    obj.edtbaseField2:setField("jogador");
    obj.edtbaseField2:setTransparent(true);
    obj.edtbaseField2:setFontSize(19);

    obj.linbaseField2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField2:setParent(obj.baseField2);
    obj.linbaseField2:setName("linbaseField2");
    obj.linbaseField2:setAlign("top");
    obj.linbaseField2:setStrokeColor("#FFFFFF50");
    obj.linbaseField2:setStrokeSize(1);

    obj.labbaseField2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField2:setParent(obj.baseField2);
    obj.labbaseField2:setName("labbaseField2");
    obj.labbaseField2:setAlign("top");
    obj.labbaseField2:setText("JOGADOR");
    obj.labbaseField2:setVertTextAlign("leading");
    obj.labbaseField2:setWordWrap(true);
    obj.labbaseField2:setTextTrimming("none");
    obj.labbaseField2:setFontSize(13);


				self.baseField2:setHeight(self.edtbaseField2:getHeight() + self.labbaseField2:getHeight() + self.linbaseField2:getHeight());
			


    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.baseField3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField3:setParent(obj.flowLayout2);
    obj.baseField3:setHeight(50);
    obj.baseField3:setMinScaledWidth(100);
    obj.baseField3:setMinWidth(150);
    obj.baseField3:setMaxWidth(300);
    obj.baseField3:setMaxScaledWidth(233);
    obj.baseField3:setAvoidScale(true);
    obj.baseField3:setName("baseField3");
    obj.baseField3:setMargins({left=0, right=1, top=0});

    obj.edtbaseField3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField3:setParent(obj.baseField3);
    obj.edtbaseField3:setName("edtbaseField3");
    obj.edtbaseField3:setAlign("top");
    obj.edtbaseField3:setField("racaClasse");
    obj.edtbaseField3:setTransparent(true);
    obj.edtbaseField3:setFontSize(19);

    obj.linbaseField3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField3:setParent(obj.baseField3);
    obj.linbaseField3:setName("linbaseField3");
    obj.linbaseField3:setAlign("top");
    obj.linbaseField3:setStrokeColor("#FFFFFF50");
    obj.linbaseField3:setStrokeSize(1);

    obj.labbaseField3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField3:setParent(obj.baseField3);
    obj.labbaseField3:setName("labbaseField3");
    obj.labbaseField3:setAlign("top");
    obj.labbaseField3:setText("RAÇA/CLASSE");
    obj.labbaseField3:setVertTextAlign("leading");
    obj.labbaseField3:setWordWrap(true);
    obj.labbaseField3:setTextTrimming("none");
    obj.labbaseField3:setFontSize(13);


				self.baseField3:setHeight(self.edtbaseField3:getHeight() + self.labbaseField3:getHeight() + self.linbaseField3:getHeight());
			


    obj.baseField4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField4:setParent(obj.flowLayout2);
    obj.baseField4:setHeight(50);
    obj.baseField4:setMinScaledWidth(50);
    obj.baseField4:setMinWidth(50);
    obj.baseField4:setMaxWidth(50);
    obj.baseField4:setMaxScaledWidth(50);
    obj.baseField4:setAvoidScale(true);
    obj.baseField4:setName("baseField4");
    obj.baseField4:setMargins({left=0, right=1, top=0});

    obj.edtbaseField4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField4:setParent(obj.baseField4);
    obj.edtbaseField4:setName("edtbaseField4");
    obj.edtbaseField4:setAlign("top");
    obj.edtbaseField4:setField("nivel");
    obj.edtbaseField4:setTransparent(true);
    obj.edtbaseField4:setFontSize(19);

    obj.linbaseField4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField4:setParent(obj.baseField4);
    obj.linbaseField4:setName("linbaseField4");
    obj.linbaseField4:setAlign("top");
    obj.linbaseField4:setStrokeColor("#FFFFFF50");
    obj.linbaseField4:setStrokeSize(1);

    obj.labbaseField4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField4:setParent(obj.baseField4);
    obj.labbaseField4:setName("labbaseField4");
    obj.labbaseField4:setAlign("top");
    obj.labbaseField4:setText("NÍVEL");
    obj.labbaseField4:setVertTextAlign("leading");
    obj.labbaseField4:setWordWrap(true);
    obj.labbaseField4:setTextTrimming("none");
    obj.labbaseField4:setFontSize(13);


				self.baseField4:setHeight(self.edtbaseField4:getHeight() + self.labbaseField4:getHeight() + self.linbaseField4:getHeight());
			


    obj.baseField5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField5:setParent(obj.flowLayout2);
    obj.baseField5:setHeight(50);
    obj.baseField5:setMinScaledWidth(50);
    obj.baseField5:setMinWidth(50);
    obj.baseField5:setMaxWidth(50);
    obj.baseField5:setMaxScaledWidth(50);
    obj.baseField5:setAvoidScale(true);
    obj.baseField5:setName("baseField5");
    obj.baseField5:setMargins({left=0, right=1, top=0});

    obj.edtbaseField5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField5:setParent(obj.baseField5);
    obj.edtbaseField5:setName("edtbaseField5");
    obj.edtbaseField5:setAlign("top");
    obj.edtbaseField5:setField("EXP");
    obj.edtbaseField5:setTransparent(true);
    obj.edtbaseField5:setFontSize(19);

    obj.linbaseField5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField5:setParent(obj.baseField5);
    obj.linbaseField5:setName("linbaseField5");
    obj.linbaseField5:setAlign("top");
    obj.linbaseField5:setStrokeColor("#FFFFFF50");
    obj.linbaseField5:setStrokeSize(1);

    obj.labbaseField5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField5:setParent(obj.baseField5);
    obj.labbaseField5:setName("labbaseField5");
    obj.labbaseField5:setAlign("top");
    obj.labbaseField5:setText("EXP");
    obj.labbaseField5:setVertTextAlign("leading");
    obj.labbaseField5:setWordWrap(true);
    obj.labbaseField5:setTextTrimming("none");
    obj.labbaseField5:setFontSize(13);


				self.baseField5:setHeight(self.edtbaseField5:getHeight() + self.labbaseField5:getHeight() + self.linbaseField5:getHeight());
			


    obj.baseField6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField6:setParent(obj.flowLayout2);
    obj.baseField6:setHeight(50);
    obj.baseField6:setMinScaledWidth(100);
    obj.baseField6:setMinWidth(150);
    obj.baseField6:setMaxWidth(450);
    obj.baseField6:setMaxScaledWidth(450);
    obj.baseField6:setAvoidScale(true);
    obj.baseField6:setName("baseField6");
    obj.baseField6:setMargins({left=0, right=1, top=0});

    obj.edtbaseField6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField6:setParent(obj.baseField6);
    obj.edtbaseField6:setName("edtbaseField6");
    obj.edtbaseField6:setAlign("top");
    obj.edtbaseField6:setField("antecedenteCaminho");
    obj.edtbaseField6:setTransparent(true);
    obj.edtbaseField6:setFontSize(19);

    obj.linbaseField6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField6:setParent(obj.baseField6);
    obj.linbaseField6:setName("linbaseField6");
    obj.linbaseField6:setAlign("top");
    obj.linbaseField6:setStrokeColor("#FFFFFF50");
    obj.linbaseField6:setStrokeSize(1);

    obj.labbaseField6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField6:setParent(obj.baseField6);
    obj.labbaseField6:setName("labbaseField6");
    obj.labbaseField6:setAlign("top");
    obj.labbaseField6:setText("ANTECEDENTE/CAMINHO");
    obj.labbaseField6:setVertTextAlign("leading");
    obj.labbaseField6:setWordWrap(true);
    obj.labbaseField6:setTextTrimming("none");
    obj.labbaseField6:setFontSize(13);


				self.baseField6:setHeight(self.edtbaseField6:getHeight() + self.labbaseField6:getHeight() + self.linbaseField6:getHeight());
			


    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout2);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.baseField7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField7:setParent(obj.flowLayout2);
    obj.baseField7:setHeight(50);
    obj.baseField7:setMinScaledWidth(100);
    obj.baseField7:setMinWidth(150);
    obj.baseField7:setMaxWidth(600);
    obj.baseField7:setMaxScaledWidth(600);
    obj.baseField7:setAvoidScale(true);
    obj.baseField7:setName("baseField7");
    obj.baseField7:setMargins({left=0, right=1, top=0});

    obj.edtbaseField7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField7:setParent(obj.baseField7);
    obj.edtbaseField7:setName("edtbaseField7");
    obj.edtbaseField7:setAlign("top");
    obj.edtbaseField7:setField("motivacao");
    obj.edtbaseField7:setTransparent(true);
    obj.edtbaseField7:setFontSize(19);

    obj.linbaseField7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField7:setParent(obj.baseField7);
    obj.linbaseField7:setName("linbaseField7");
    obj.linbaseField7:setAlign("top");
    obj.linbaseField7:setStrokeColor("#FFFFFF50");
    obj.linbaseField7:setStrokeSize(1);

    obj.labbaseField7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField7:setParent(obj.baseField7);
    obj.labbaseField7:setName("labbaseField7");
    obj.labbaseField7:setAlign("top");
    obj.labbaseField7:setText("MOTIVAÇÃO");
    obj.labbaseField7:setVertTextAlign("leading");
    obj.labbaseField7:setWordWrap(true);
    obj.labbaseField7:setTextTrimming("none");
    obj.labbaseField7:setFontSize(13);


				self.baseField7:setHeight(self.edtbaseField7:getHeight() + self.labbaseField7:getHeight() + self.linbaseField7:getHeight());
			


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowLayout1);
    obj.rectangle1:setWidth(176);
    obj.rectangle1:setHeight(176);
    obj.rectangle1:setColor("#404040");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setMargins({left=15, right=0, top=0});
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(3);
    obj.rectangle2:setTop(3);
    obj.rectangle2:setWidth(170);
    obj.rectangle2:setHeight(170);
    obj.rectangle2:setColor("#323232");
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setAlign("client");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setVertTextAlign("center");
    obj.label1:setFontSize(15);
    obj.label1:setText("<Personagem>");
    obj.label1:setName("label1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle2);
    obj.image2:setField("imagemPersonagem");
    obj.image2:setAlign("client");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flowLayout1);
    obj.flowLayout3:setMinWidth(575);
    obj.flowLayout3:setMaxWidth(575);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setAlign("left");
    obj.flowLayout3:setMaxControlsPerLine(6);
    obj.flowLayout3:setLineSpacing(10);
    obj.flowLayout3:setAvoidScale(true);
    obj.flowLayout3:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowLayout3:setMargins({left=5, top=5, right=5, bottom=5});
    obj.flowLayout3:setName("flowLayout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowLayout3);
    obj.label2:setText("Força:");
    obj.label2:setHeight(30);
    obj.label2:setName("label2");
    obj.label2:setFontSize(20);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout3);
    obj.edit1:setField("forcaPreCalc");
    obj.edit1:setWidth(150);
    obj.edit1:setMargins({left=0, right=5, top=0});
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(20);

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowLayout3);
    obj.edit2:setField("forca");
    obj.edit2:setWidth(40);
    obj.edit2:setMargins({left=0, right=15, top=0});
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setReadOnly(true);
    obj.edit2:setCanFocus(false);
    obj.edit2:setCursor("handPoint");
    obj.edit2:setFontSize(22);
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowLayout3);
    obj.label3:setText("Dados:");
    obj.label3:setWidth(65);
    obj.label3:setMargins({left=0, right=5, top=0});
    obj.label3:setName("label3");
    obj.label3:setFontSize(20);

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowLayout3);
    obj.edit3:setField("forcaDadoBonus");
    obj.edit3:setWidth(40);
    obj.edit3:setMargins({left=0, right=10, top=0});
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(20);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout3);
    obj.button1:setText("Rolar");
    obj.button1:setHeight(30);
    obj.button1:setName("button1");
    obj.button1:setFontSize(15);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.flowLayout3);
    obj.dataLink1:setField("forcaPreCalc");
    obj.dataLink1:setName("dataLink1");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowLayout3);
    obj.label4:setText("Agilidade:");
    obj.label4:setHeight(30);
    obj.label4:setName("label4");
    obj.label4:setFontSize(20);

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowLayout3);
    obj.edit4:setField("agilidadePreCalc");
    obj.edit4:setWidth(150);
    obj.edit4:setMargins({left=0, right=5, top=0});
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(20);

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowLayout3);
    obj.edit5:setField("agilidade");
    obj.edit5:setWidth(40);
    obj.edit5:setMargins({left=0, right=15, top=0});
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setReadOnly(true);
    obj.edit5:setCanFocus(false);
    obj.edit5:setCursor("handPoint");
    obj.edit5:setFontSize(22);
    obj.edit5:setName("edit5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowLayout3);
    obj.label5:setText("Dados:");
    obj.label5:setWidth(65);
    obj.label5:setMargins({left=0, right=5, top=0});
    obj.label5:setName("label5");
    obj.label5:setFontSize(20);

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowLayout3);
    obj.edit6:setField("agilidadeDadoBonus");
    obj.edit6:setWidth(40);
    obj.edit6:setMargins({left=0, right=10, top=0});
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(20);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout3);
    obj.button2:setText("Rolar");
    obj.button2:setHeight(30);
    obj.button2:setName("button2");
    obj.button2:setFontSize(15);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.flowLayout3);
    obj.dataLink2:setField("agilidadePreCalc");
    obj.dataLink2:setName("dataLink2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowLayout3);
    obj.label6:setText("Inteligência:");
    obj.label6:setHeight(30);
    obj.label6:setName("label6");
    obj.label6:setFontSize(20);

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowLayout3);
    obj.edit7:setField("inteligenciaPreCalc");
    obj.edit7:setWidth(150);
    obj.edit7:setMargins({left=0, right=5, top=0});
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(20);

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.flowLayout3);
    obj.edit8:setField("inteligencia");
    obj.edit8:setWidth(40);
    obj.edit8:setMargins({left=0, right=15, top=0});
    lfm_setPropAsString(obj.edit8, "fontStyle",  "bold");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setReadOnly(true);
    obj.edit8:setCanFocus(false);
    obj.edit8:setCursor("handPoint");
    obj.edit8:setFontSize(22);
    obj.edit8:setName("edit8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.flowLayout3);
    obj.label7:setText("Dados:");
    obj.label7:setWidth(65);
    obj.label7:setMargins({left=0, right=5, top=0});
    obj.label7:setName("label7");
    obj.label7:setFontSize(20);

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.flowLayout3);
    obj.edit9:setField("inteligenciaDadoBonus");
    obj.edit9:setWidth(40);
    obj.edit9:setMargins({left=0, right=10, top=0});
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");
    obj.edit9:setFontSize(20);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout3);
    obj.button3:setText("Rolar");
    obj.button3:setHeight(30);
    obj.button3:setName("button3");
    obj.button3:setFontSize(15);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.flowLayout3);
    obj.dataLink3:setField("inteligenciaPreCalc");
    obj.dataLink3:setName("dataLink3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.flowLayout3);
    obj.label8:setText("Vontade:");
    obj.label8:setHeight(30);
    obj.label8:setName("label8");
    obj.label8:setFontSize(20);

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.flowLayout3);
    obj.edit10:setField("vontadePreCalc");
    obj.edit10:setWidth(150);
    obj.edit10:setMargins({left=0, right=5, top=0});
    obj.edit10:setName("edit10");
    obj.edit10:setFontSize(20);

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.flowLayout3);
    obj.edit11:setField("vontade");
    obj.edit11:setWidth(40);
    obj.edit11:setMargins({left=0, right=15, top=0});
    lfm_setPropAsString(obj.edit11, "fontStyle",  "bold");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setReadOnly(true);
    obj.edit11:setCanFocus(false);
    obj.edit11:setCursor("handPoint");
    obj.edit11:setFontSize(22);
    obj.edit11:setName("edit11");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.flowLayout3);
    obj.label9:setText("Dados:");
    obj.label9:setWidth(65);
    obj.label9:setMargins({left=0, right=5, top=0});
    obj.label9:setName("label9");
    obj.label9:setFontSize(20);

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.flowLayout3);
    obj.edit12:setField("vontadeDadoBonus");
    obj.edit12:setWidth(40);
    obj.edit12:setMargins({left=0, right=10, top=0});
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");
    obj.edit12:setFontSize(20);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowLayout3);
    obj.button4:setText("Rolar");
    obj.button4:setHeight(30);
    obj.button4:setName("button4");
    obj.button4:setFontSize(15);

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowLayout3);
    obj.dataLink4:setField("vontadePreCalc");
    obj.dataLink4:setName("dataLink4");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(200);
    obj.flowPart2:setMaxWidth(350);
    obj.flowPart2:setHeight(200);
    obj.flowPart2:setVertAlign("center");
    obj.flowPart2:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart2:setMargins({left=5, top=5, right=5, bottom=5});
    obj.flowPart2:setName("flowPart2");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowPart2);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setAlign("client");
    obj.flowLayout4:setLineSpacing(10);
    obj.flowLayout4:setAvoidScale(true);
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setName("flowLayout4");

    obj.resourceField1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.resourceField1:setParent(obj.flowLayout4);
    obj.resourceField1:setHeight(100);
    obj.resourceField1:setMinScaledWidth(200);
    obj.resourceField1:setMinWidth(60);
    obj.resourceField1:setMaxWidth(150);
    obj.resourceField1:setAvoidScale(true);
    obj.resourceField1:setName("resourceField1");
    obj.resourceField1:setMargins({left=0, right=1, top=0});

    obj.edtresourceField1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtresourceField1:setParent(obj.resourceField1);
    obj.edtresourceField1:setName("edtresourceField1");
    obj.edtresourceField1:setField("vida");
    obj.edtresourceField1:setAlign("top");
    obj.edtresourceField1:setTransparent(true);
    obj.edtresourceField1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edtresourceField1, "fontStyle",  "bold");
    obj.edtresourceField1:setFontSize(25);
    obj.edtresourceField1:setType("number");

    obj.linresourceField1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linresourceField1:setParent(obj.resourceField1);
    obj.linresourceField1:setName("linresourceField1");
    obj.linresourceField1:setAlign("top");
    obj.linresourceField1:setStrokeColor("#FFFFFF50");
    obj.linresourceField1:setStrokeSize(1);

    obj.labresourceField1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labresourceField1:setParent(obj.resourceField1);
    obj.labresourceField1:setName("labresourceField1");
    obj.labresourceField1:setAlign("top");
    obj.labresourceField1:setText("VIDA");
    obj.labresourceField1:setVertTextAlign("leading");
    obj.labresourceField1:setWordWrap(true);
    obj.labresourceField1:setTextTrimming("none");
    obj.labresourceField1:setFontSize(13);
    lfm_setPropAsString(obj.labresourceField1, "fontStyle",  "bold");

    obj.edtresourceField1Max = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtresourceField1Max:setParent(obj.resourceField1);
    obj.edtresourceField1Max:setName("edtresourceField1Max");
    obj.edtresourceField1Max:setField("vidaMax");
    obj.edtresourceField1Max:setAlign("top");
    obj.edtresourceField1Max:setTransparent(true);
    obj.edtresourceField1Max:setHorzTextAlign("center");
    obj.edtresourceField1Max:setFontSize(25);
    obj.edtresourceField1Max:setType("number");

    obj.linresourceField1Max = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linresourceField1Max:setParent(obj.resourceField1);
    obj.linresourceField1Max:setName("linresourceField1Max");
    obj.linresourceField1Max:setAlign("top");
    obj.linresourceField1Max:setStrokeColor("#FFFFFF50");
    obj.linresourceField1Max:setStrokeSize(1);

    obj.labresourceField1Max = GUI.fromHandle(_obj_newObject("label"));
    obj.labresourceField1Max:setParent(obj.resourceField1);
    obj.labresourceField1Max:setName("labresourceField1Max");
    obj.labresourceField1Max:setAlign("top");
    obj.labresourceField1Max:setText("VIDA MÁX.");
    obj.labresourceField1Max:setVertTextAlign("leading");
    obj.labresourceField1Max:setWordWrap(true);
    obj.labresourceField1Max:setTextTrimming("none");
    obj.labresourceField1Max:setFontSize(13);

    obj.resourceField2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.resourceField2:setParent(obj.flowLayout4);
    obj.resourceField2:setHeight(100);
    obj.resourceField2:setMinScaledWidth(200);
    obj.resourceField2:setMinWidth(60);
    obj.resourceField2:setMaxWidth(150);
    obj.resourceField2:setAvoidScale(true);
    obj.resourceField2:setName("resourceField2");
    obj.resourceField2:setMargins({left=0, right=1, top=0});

    obj.edtresourceField2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtresourceField2:setParent(obj.resourceField2);
    obj.edtresourceField2:setName("edtresourceField2");
    obj.edtresourceField2:setField("mana");
    obj.edtresourceField2:setAlign("top");
    obj.edtresourceField2:setTransparent(true);
    obj.edtresourceField2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edtresourceField2, "fontStyle",  "bold");
    obj.edtresourceField2:setFontSize(25);
    obj.edtresourceField2:setType("number");

    obj.linresourceField2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linresourceField2:setParent(obj.resourceField2);
    obj.linresourceField2:setName("linresourceField2");
    obj.linresourceField2:setAlign("top");
    obj.linresourceField2:setStrokeColor("#FFFFFF50");
    obj.linresourceField2:setStrokeSize(1);

    obj.labresourceField2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labresourceField2:setParent(obj.resourceField2);
    obj.labresourceField2:setName("labresourceField2");
    obj.labresourceField2:setAlign("top");
    obj.labresourceField2:setText("MANA");
    obj.labresourceField2:setVertTextAlign("leading");
    obj.labresourceField2:setWordWrap(true);
    obj.labresourceField2:setTextTrimming("none");
    obj.labresourceField2:setFontSize(13);
    lfm_setPropAsString(obj.labresourceField2, "fontStyle",  "bold");

    obj.edtresourceField2Max = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtresourceField2Max:setParent(obj.resourceField2);
    obj.edtresourceField2Max:setName("edtresourceField2Max");
    obj.edtresourceField2Max:setField("manaMax");
    obj.edtresourceField2Max:setAlign("top");
    obj.edtresourceField2Max:setTransparent(true);
    obj.edtresourceField2Max:setHorzTextAlign("center");
    obj.edtresourceField2Max:setFontSize(25);
    obj.edtresourceField2Max:setType("number");

    obj.linresourceField2Max = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linresourceField2Max:setParent(obj.resourceField2);
    obj.linresourceField2Max:setName("linresourceField2Max");
    obj.linresourceField2Max:setAlign("top");
    obj.linresourceField2Max:setStrokeColor("#FFFFFF50");
    obj.linresourceField2Max:setStrokeSize(1);

    obj.labresourceField2Max = GUI.fromHandle(_obj_newObject("label"));
    obj.labresourceField2Max:setParent(obj.resourceField2);
    obj.labresourceField2Max:setName("labresourceField2Max");
    obj.labresourceField2Max:setAlign("top");
    obj.labresourceField2Max:setText("MANA MÁX.");
    obj.labresourceField2Max:setVertTextAlign("leading");
    obj.labresourceField2Max:setWordWrap(true);
    obj.labresourceField2Max:setTextTrimming("none");
    obj.labresourceField2Max:setFontSize(13);

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowLayout4);
    obj.flowLayout5:setWidth(140);
    obj.flowLayout5:setHeight(110);
    obj.flowLayout5:setAlign("client");
    obj.flowLayout5:setAvoidScale(true);
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setMaxControlsPerLine(2);
    obj.flowLayout5:setName("flowLayout5");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowLayout5);
    obj.rectangle3:setWidth(110);
    obj.rectangle3:setHeight(50);
    obj.rectangle3:setColor("#1f1f1f");
    obj.rectangle3:setStrokeColor("#828282");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setAlign("left");
    lfm_setPropAsString(obj.rectangle3, "sides",  "top right left");
    obj.rectangle3:setName("rectangle3");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.rectangle3);
    obj.flowLayout6:setAlign("client");
    obj.flowLayout6:setMargins({left=5});
    obj.flowLayout6:setName("flowLayout6");

    obj.defenseField1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField1:setParent(obj.flowLayout6);
    obj.defenseField1:setHeight(50);
    obj.defenseField1:setMinScaledWidth(100);
    obj.defenseField1:setMinWidth(25);
    obj.defenseField1:setMaxWidth(55);
    obj.defenseField1:setMaxScaledWidth(55);
    obj.defenseField1:setAvoidScale(true);
    obj.defenseField1:setName("defenseField1");
    obj.defenseField1:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField1:setParent(obj.defenseField1);
    obj.edtdefenseField1:setName("edtdefenseField1");
    obj.edtdefenseField1:setAlign("top");
    obj.edtdefenseField1:setField("deslocamento");
    obj.edtdefenseField1:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField1, "fontStyle",  "bold");
    obj.edtdefenseField1:setHorzTextAlign("center");
    obj.edtdefenseField1:setFontSize(25);
    obj.edtdefenseField1:setCanFocus(false);
    obj.edtdefenseField1:setType("number");

    obj.lindefenseField1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField1:setParent(obj.defenseField1);
    obj.lindefenseField1:setName("lindefenseField1");
    obj.lindefenseField1:setAlign("top");
    obj.lindefenseField1:setStrokeColor("#FFFFFF50");
    obj.lindefenseField1:setStrokeSize(1);

    obj.labdefenseField1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField1:setParent(obj.defenseField1);
    obj.labdefenseField1:setName("labdefenseField1");
    obj.labdefenseField1:setAlign("top");
    obj.labdefenseField1:setText("DESL.");
    obj.labdefenseField1:setHorzTextAlign("center");
    obj.labdefenseField1:setVertTextAlign("leading");
    obj.labdefenseField1:setWordWrap(true);
    obj.labdefenseField1:setTextTrimming("none");
    obj.labdefenseField1:setFontSize(12);
    lfm_setPropAsString(obj.labdefenseField1, "fontStyle",  "bold");


				self.defenseField1:setHeight(self.edtdefenseField1:getHeight() + self.labdefenseField1:getHeight() + self.lindefenseField1:getHeight());
			


    obj.defenseField2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField2:setParent(obj.flowLayout6);
    obj.defenseField2:setHeight(50);
    obj.defenseField2:setMinScaledWidth(100);
    obj.defenseField2:setMinWidth(25);
    obj.defenseField2:setMaxWidth(45);
    obj.defenseField2:setMaxScaledWidth(45);
    obj.defenseField2:setAvoidScale(true);
    obj.defenseField2:setName("defenseField2");
    obj.defenseField2:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField2:setParent(obj.defenseField2);
    obj.edtdefenseField2:setName("edtdefenseField2");
    obj.edtdefenseField2:setAlign("top");
    obj.edtdefenseField2:setField("deslocamentoBonus");
    obj.edtdefenseField2:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField2, "fontStyle",  "");
    obj.edtdefenseField2:setHorzTextAlign("center");
    obj.edtdefenseField2:setFontSize(18);
    obj.edtdefenseField2:setCanFocus(true);
    obj.edtdefenseField2:setType("number");

    obj.lindefenseField2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField2:setParent(obj.defenseField2);
    obj.lindefenseField2:setName("lindefenseField2");
    obj.lindefenseField2:setAlign("top");
    obj.lindefenseField2:setStrokeColor("#FFFFFF50");
    obj.lindefenseField2:setStrokeSize(1);

    obj.labdefenseField2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField2:setParent(obj.defenseField2);
    obj.labdefenseField2:setName("labdefenseField2");
    obj.labdefenseField2:setAlign("top");
    obj.labdefenseField2:setText("MOD");
    obj.labdefenseField2:setHorzTextAlign("center");
    obj.labdefenseField2:setVertTextAlign("leading");
    obj.labdefenseField2:setWordWrap(true);
    obj.labdefenseField2:setTextTrimming("none");
    obj.labdefenseField2:setFontSize(11);
    lfm_setPropAsString(obj.labdefenseField2, "fontStyle",  "");


				self.defenseField2:setHeight(self.edtdefenseField2:getHeight() + self.labdefenseField2:getHeight() + self.lindefenseField2:getHeight());
			


    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.flowLayout5);
    obj.rectangle4:setWidth(110);
    obj.rectangle4:setHeight(50);
    obj.rectangle4:setColor("#1f1f1f");
    obj.rectangle4:setStrokeColor("#828282");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setAlign("left");
    lfm_setPropAsString(obj.rectangle4, "sides",  "right left bottom");
    obj.rectangle4:setName("rectangle4");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.rectangle4);
    obj.flowLayout7:setAlign("client");
    obj.flowLayout7:setMargins({left=5});
    obj.flowLayout7:setName("flowLayout7");

    obj.defenseField3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField3:setParent(obj.flowLayout7);
    obj.defenseField3:setHeight(50);
    obj.defenseField3:setMinScaledWidth(100);
    obj.defenseField3:setMinWidth(25);
    obj.defenseField3:setMaxWidth(55);
    obj.defenseField3:setMaxScaledWidth(55);
    obj.defenseField3:setAvoidScale(true);
    obj.defenseField3:setName("defenseField3");
    obj.defenseField3:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField3:setParent(obj.defenseField3);
    obj.edtdefenseField3:setName("edtdefenseField3");
    obj.edtdefenseField3:setAlign("top");
    obj.edtdefenseField3:setField("corrida");
    obj.edtdefenseField3:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField3, "fontStyle",  "bold");
    obj.edtdefenseField3:setHorzTextAlign("center");
    obj.edtdefenseField3:setFontSize(25);
    obj.edtdefenseField3:setCanFocus(false);
    obj.edtdefenseField3:setType("number");

    obj.lindefenseField3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField3:setParent(obj.defenseField3);
    obj.lindefenseField3:setName("lindefenseField3");
    obj.lindefenseField3:setAlign("top");
    obj.lindefenseField3:setStrokeColor("#FFFFFF50");
    obj.lindefenseField3:setStrokeSize(1);

    obj.labdefenseField3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField3:setParent(obj.defenseField3);
    obj.labdefenseField3:setName("labdefenseField3");
    obj.labdefenseField3:setAlign("top");
    obj.labdefenseField3:setText("CORRIDA");
    obj.labdefenseField3:setHorzTextAlign("center");
    obj.labdefenseField3:setVertTextAlign("leading");
    obj.labdefenseField3:setWordWrap(true);
    obj.labdefenseField3:setTextTrimming("none");
    obj.labdefenseField3:setFontSize(12);
    lfm_setPropAsString(obj.labdefenseField3, "fontStyle",  "bold");


				self.defenseField3:setHeight(self.edtdefenseField3:getHeight() + self.labdefenseField3:getHeight() + self.lindefenseField3:getHeight());
			


    obj.defenseField4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField4:setParent(obj.flowLayout7);
    obj.defenseField4:setHeight(50);
    obj.defenseField4:setMinScaledWidth(100);
    obj.defenseField4:setMinWidth(25);
    obj.defenseField4:setMaxWidth(45);
    obj.defenseField4:setMaxScaledWidth(45);
    obj.defenseField4:setAvoidScale(true);
    obj.defenseField4:setName("defenseField4");
    obj.defenseField4:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField4:setParent(obj.defenseField4);
    obj.edtdefenseField4:setName("edtdefenseField4");
    obj.edtdefenseField4:setAlign("top");
    obj.edtdefenseField4:setField("corridaBonus");
    obj.edtdefenseField4:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField4, "fontStyle",  "");
    obj.edtdefenseField4:setHorzTextAlign("center");
    obj.edtdefenseField4:setFontSize(18);
    obj.edtdefenseField4:setCanFocus(true);
    obj.edtdefenseField4:setType("number");

    obj.lindefenseField4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField4:setParent(obj.defenseField4);
    obj.lindefenseField4:setName("lindefenseField4");
    obj.lindefenseField4:setAlign("top");
    obj.lindefenseField4:setStrokeColor("#FFFFFF50");
    obj.lindefenseField4:setStrokeSize(1);

    obj.labdefenseField4 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField4:setParent(obj.defenseField4);
    obj.labdefenseField4:setName("labdefenseField4");
    obj.labdefenseField4:setAlign("top");
    obj.labdefenseField4:setText("MOD");
    obj.labdefenseField4:setHorzTextAlign("center");
    obj.labdefenseField4:setVertTextAlign("leading");
    obj.labdefenseField4:setWordWrap(true);
    obj.labdefenseField4:setTextTrimming("none");
    obj.labdefenseField4:setFontSize(11);
    lfm_setPropAsString(obj.labdefenseField4, "fontStyle",  "");


				self.defenseField4:setHeight(self.edtdefenseField4:getHeight() + self.labdefenseField4:getHeight() + self.lindefenseField4:getHeight());
			


    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flowLayout5);
    obj.dataLink5:setField("deslocamentoBonus");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowLayout5);
    obj.dataLink6:setField("corridaBonus");
    obj.dataLink6:setName("dataLink6");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout4);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.flowLayout4);
    obj.rectangle5:setWidth(110);
    obj.rectangle5:setHeight(50);
    obj.rectangle5:setColor("#1f1f1f");
    obj.rectangle5:setStrokeColor("#828282");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setName("rectangle5");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.rectangle5);
    obj.flowLayout8:setAlign("client");
    obj.flowLayout8:setName("flowLayout8");

    obj.defenseField5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField5:setParent(obj.flowLayout8);
    obj.defenseField5:setHeight(50);
    obj.defenseField5:setMinScaledWidth(100);
    obj.defenseField5:setMinWidth(25);
    obj.defenseField5:setMaxWidth(100);
    obj.defenseField5:setMaxScaledWidth(100);
    obj.defenseField5:setAvoidScale(true);
    obj.defenseField5:setName("defenseField5");
    obj.defenseField5:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField5:setParent(obj.defenseField5);
    obj.edtdefenseField5:setName("edtdefenseField5");
    obj.edtdefenseField5:setAlign("top");
    obj.edtdefenseField5:setField("bloqueio");
    obj.edtdefenseField5:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField5, "fontStyle",  "bold");
    obj.edtdefenseField5:setHorzTextAlign("center");
    obj.edtdefenseField5:setFontSize(25);
    obj.edtdefenseField5:setCanFocus(false);
    obj.edtdefenseField5:setType("number");

    obj.lindefenseField5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField5:setParent(obj.defenseField5);
    obj.lindefenseField5:setName("lindefenseField5");
    obj.lindefenseField5:setAlign("top");
    obj.lindefenseField5:setStrokeColor("#FFFFFF50");
    obj.lindefenseField5:setStrokeSize(1);

    obj.labdefenseField5 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField5:setParent(obj.defenseField5);
    obj.labdefenseField5:setName("labdefenseField5");
    obj.labdefenseField5:setAlign("top");
    obj.labdefenseField5:setText("BLOQ.");
    obj.labdefenseField5:setHorzTextAlign("center");
    obj.labdefenseField5:setVertTextAlign("leading");
    obj.labdefenseField5:setWordWrap(true);
    obj.labdefenseField5:setTextTrimming("none");
    obj.labdefenseField5:setFontSize(13);
    lfm_setPropAsString(obj.labdefenseField5, "fontStyle",  "bold");


				self.defenseField5:setHeight(self.edtdefenseField5:getHeight() + self.labdefenseField5:getHeight() + self.lindefenseField5:getHeight());
			


    obj.defenseField6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField6:setParent(obj.flowLayout8);
    obj.defenseField6:setHeight(50);
    obj.defenseField6:setMinScaledWidth(100);
    obj.defenseField6:setMinWidth(25);
    obj.defenseField6:setMaxWidth(45);
    obj.defenseField6:setMaxScaledWidth(45);
    obj.defenseField6:setAvoidScale(true);
    obj.defenseField6:setName("defenseField6");
    obj.defenseField6:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField6:setParent(obj.defenseField6);
    obj.edtdefenseField6:setName("edtdefenseField6");
    obj.edtdefenseField6:setAlign("top");
    obj.edtdefenseField6:setField("bloqueioBonus");
    obj.edtdefenseField6:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField6, "fontStyle",  "");
    obj.edtdefenseField6:setHorzTextAlign("center");
    obj.edtdefenseField6:setFontSize(18);
    obj.edtdefenseField6:setCanFocus(true);
    obj.edtdefenseField6:setType("number");

    obj.lindefenseField6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField6:setParent(obj.defenseField6);
    obj.lindefenseField6:setName("lindefenseField6");
    obj.lindefenseField6:setAlign("top");
    obj.lindefenseField6:setStrokeColor("#FFFFFF50");
    obj.lindefenseField6:setStrokeSize(1);

    obj.labdefenseField6 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField6:setParent(obj.defenseField6);
    obj.labdefenseField6:setName("labdefenseField6");
    obj.labdefenseField6:setAlign("top");
    obj.labdefenseField6:setText("MOD");
    obj.labdefenseField6:setHorzTextAlign("center");
    obj.labdefenseField6:setVertTextAlign("leading");
    obj.labdefenseField6:setWordWrap(true);
    obj.labdefenseField6:setTextTrimming("none");
    obj.labdefenseField6:setFontSize(11);
    lfm_setPropAsString(obj.labdefenseField6, "fontStyle",  "");


				self.defenseField6:setHeight(self.edtdefenseField6:getHeight() + self.labdefenseField6:getHeight() + self.lindefenseField6:getHeight());
			


    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.flowLayout4);
    obj.rectangle6:setWidth(110);
    obj.rectangle6:setHeight(50);
    obj.rectangle6:setColor("#1f1f1f");
    obj.rectangle6:setStrokeColor("#828282");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setName("rectangle6");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.rectangle6);
    obj.flowLayout9:setAlign("client");
    obj.flowLayout9:setName("flowLayout9");

    obj.defenseField7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField7:setParent(obj.flowLayout9);
    obj.defenseField7:setHeight(50);
    obj.defenseField7:setMinScaledWidth(100);
    obj.defenseField7:setMinWidth(25);
    obj.defenseField7:setMaxWidth(100);
    obj.defenseField7:setMaxScaledWidth(100);
    obj.defenseField7:setAvoidScale(true);
    obj.defenseField7:setName("defenseField7");
    obj.defenseField7:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField7:setParent(obj.defenseField7);
    obj.edtdefenseField7:setName("edtdefenseField7");
    obj.edtdefenseField7:setAlign("top");
    obj.edtdefenseField7:setField("esquiva");
    obj.edtdefenseField7:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField7, "fontStyle",  "bold");
    obj.edtdefenseField7:setHorzTextAlign("center");
    obj.edtdefenseField7:setFontSize(25);
    obj.edtdefenseField7:setCanFocus(false);
    obj.edtdefenseField7:setType("number");

    obj.lindefenseField7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField7:setParent(obj.defenseField7);
    obj.lindefenseField7:setName("lindefenseField7");
    obj.lindefenseField7:setAlign("top");
    obj.lindefenseField7:setStrokeColor("#FFFFFF50");
    obj.lindefenseField7:setStrokeSize(1);

    obj.labdefenseField7 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField7:setParent(obj.defenseField7);
    obj.labdefenseField7:setName("labdefenseField7");
    obj.labdefenseField7:setAlign("top");
    obj.labdefenseField7:setText("ESQ.");
    obj.labdefenseField7:setHorzTextAlign("center");
    obj.labdefenseField7:setVertTextAlign("leading");
    obj.labdefenseField7:setWordWrap(true);
    obj.labdefenseField7:setTextTrimming("none");
    obj.labdefenseField7:setFontSize(13);
    lfm_setPropAsString(obj.labdefenseField7, "fontStyle",  "bold");


				self.defenseField7:setHeight(self.edtdefenseField7:getHeight() + self.labdefenseField7:getHeight() + self.lindefenseField7:getHeight());
			


    obj.defenseField8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField8:setParent(obj.flowLayout9);
    obj.defenseField8:setHeight(50);
    obj.defenseField8:setMinScaledWidth(100);
    obj.defenseField8:setMinWidth(25);
    obj.defenseField8:setMaxWidth(45);
    obj.defenseField8:setMaxScaledWidth(45);
    obj.defenseField8:setAvoidScale(true);
    obj.defenseField8:setName("defenseField8");
    obj.defenseField8:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField8:setParent(obj.defenseField8);
    obj.edtdefenseField8:setName("edtdefenseField8");
    obj.edtdefenseField8:setAlign("top");
    obj.edtdefenseField8:setField("esquivaBonus");
    obj.edtdefenseField8:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField8, "fontStyle",  "");
    obj.edtdefenseField8:setHorzTextAlign("center");
    obj.edtdefenseField8:setFontSize(18);
    obj.edtdefenseField8:setCanFocus(true);
    obj.edtdefenseField8:setType("number");

    obj.lindefenseField8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField8:setParent(obj.defenseField8);
    obj.lindefenseField8:setName("lindefenseField8");
    obj.lindefenseField8:setAlign("top");
    obj.lindefenseField8:setStrokeColor("#FFFFFF50");
    obj.lindefenseField8:setStrokeSize(1);

    obj.labdefenseField8 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField8:setParent(obj.defenseField8);
    obj.labdefenseField8:setName("labdefenseField8");
    obj.labdefenseField8:setAlign("top");
    obj.labdefenseField8:setText("MOD");
    obj.labdefenseField8:setHorzTextAlign("center");
    obj.labdefenseField8:setVertTextAlign("leading");
    obj.labdefenseField8:setWordWrap(true);
    obj.labdefenseField8:setTextTrimming("none");
    obj.labdefenseField8:setFontSize(11);
    lfm_setPropAsString(obj.labdefenseField8, "fontStyle",  "");


				self.defenseField8:setHeight(self.edtdefenseField8:getHeight() + self.labdefenseField8:getHeight() + self.lindefenseField8:getHeight());
			


    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.flowLayout4);
    obj.rectangle7:setWidth(110);
    obj.rectangle7:setHeight(50);
    obj.rectangle7:setColor("#1f1f1f");
    obj.rectangle7:setStrokeColor("#828282");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setName("rectangle7");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.rectangle7);
    obj.flowLayout10:setAlign("client");
    obj.flowLayout10:setName("flowLayout10");

    obj.defenseField9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField9:setParent(obj.flowLayout10);
    obj.defenseField9:setHeight(50);
    obj.defenseField9:setMinScaledWidth(100);
    obj.defenseField9:setMinWidth(25);
    obj.defenseField9:setMaxWidth(100);
    obj.defenseField9:setMaxScaledWidth(100);
    obj.defenseField9:setAvoidScale(true);
    obj.defenseField9:setName("defenseField9");
    obj.defenseField9:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField9:setParent(obj.defenseField9);
    obj.edtdefenseField9:setName("edtdefenseField9");
    obj.edtdefenseField9:setAlign("top");
    obj.edtdefenseField9:setField("determinacao");
    obj.edtdefenseField9:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField9, "fontStyle",  "bold");
    obj.edtdefenseField9:setHorzTextAlign("center");
    obj.edtdefenseField9:setFontSize(25);
    obj.edtdefenseField9:setCanFocus(false);
    obj.edtdefenseField9:setType("number");

    obj.lindefenseField9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField9:setParent(obj.defenseField9);
    obj.lindefenseField9:setName("lindefenseField9");
    obj.lindefenseField9:setAlign("top");
    obj.lindefenseField9:setStrokeColor("#FFFFFF50");
    obj.lindefenseField9:setStrokeSize(1);

    obj.labdefenseField9 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField9:setParent(obj.defenseField9);
    obj.labdefenseField9:setName("labdefenseField9");
    obj.labdefenseField9:setAlign("top");
    obj.labdefenseField9:setText("DET.");
    obj.labdefenseField9:setHorzTextAlign("center");
    obj.labdefenseField9:setVertTextAlign("leading");
    obj.labdefenseField9:setWordWrap(true);
    obj.labdefenseField9:setTextTrimming("none");
    obj.labdefenseField9:setFontSize(13);
    lfm_setPropAsString(obj.labdefenseField9, "fontStyle",  "bold");


				self.defenseField9:setHeight(self.edtdefenseField9:getHeight() + self.labdefenseField9:getHeight() + self.lindefenseField9:getHeight());
			


    obj.defenseField10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField10:setParent(obj.flowLayout10);
    obj.defenseField10:setHeight(50);
    obj.defenseField10:setMinScaledWidth(100);
    obj.defenseField10:setMinWidth(25);
    obj.defenseField10:setMaxWidth(45);
    obj.defenseField10:setMaxScaledWidth(45);
    obj.defenseField10:setAvoidScale(true);
    obj.defenseField10:setName("defenseField10");
    obj.defenseField10:setMargins({left=0, right=1, top=0});

    obj.edtdefenseField10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField10:setParent(obj.defenseField10);
    obj.edtdefenseField10:setName("edtdefenseField10");
    obj.edtdefenseField10:setAlign("top");
    obj.edtdefenseField10:setField("determinacaoBonus");
    obj.edtdefenseField10:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField10, "fontStyle",  "");
    obj.edtdefenseField10:setHorzTextAlign("center");
    obj.edtdefenseField10:setFontSize(18);
    obj.edtdefenseField10:setCanFocus(true);
    obj.edtdefenseField10:setType("number");

    obj.lindefenseField10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField10:setParent(obj.defenseField10);
    obj.lindefenseField10:setName("lindefenseField10");
    obj.lindefenseField10:setAlign("top");
    obj.lindefenseField10:setStrokeColor("#FFFFFF50");
    obj.lindefenseField10:setStrokeSize(1);

    obj.labdefenseField10 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField10:setParent(obj.defenseField10);
    obj.labdefenseField10:setName("labdefenseField10");
    obj.labdefenseField10:setAlign("top");
    obj.labdefenseField10:setText("MOD");
    obj.labdefenseField10:setHorzTextAlign("center");
    obj.labdefenseField10:setVertTextAlign("leading");
    obj.labdefenseField10:setWordWrap(true);
    obj.labdefenseField10:setTextTrimming("none");
    obj.labdefenseField10:setFontSize(11);
    lfm_setPropAsString(obj.labdefenseField10, "fontStyle",  "");


				self.defenseField10:setHeight(self.edtdefenseField10:getHeight() + self.labdefenseField10:getHeight() + self.lindefenseField10:getHeight());
			


    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout1);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowLayout1);
    obj.dataLink7:setField("vida");
    obj.dataLink7:setDefaultValue("60");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout1);
    obj.dataLink8:setField("mana");
    obj.dataLink8:setDefaultValue("60");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.flowLayout1);
    obj.dataLink9:setField("bloqueioBonus");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowLayout1);
    obj.dataLink10:setField("esquivaBonus");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.flowLayout1);
    obj.dataLink11:setField("determinacaoBonus");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.flowLayout1);
    obj.dataLink12:setField("forca");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.flowLayout1);
    obj.dataLink13:setField("agilidade");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.flowLayout1);
    obj.dataLink14:setField("inteligencia");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.flowLayout1);
    obj.dataLink15:setField("vontade");
    obj.dataLink15:setName("dataLink15");

    obj.popFundo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popFundo:setParent(obj.flowLayout1);
    obj.popFundo:setName("popFundo");
    obj.popFundo:setWidth(375);
    obj.popFundo:setHeight(360);
    obj.popFundo:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popFundo, "autoScopeNode",  "true");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.popFundo);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setMaxControlsPerLine(2);
    obj.flowLayout11:setMargins({bottom=4});
    obj.flowLayout11:setHorzAlign("center");
    obj.flowLayout11:setName("flowLayout11");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowLayout11);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setItems({'Padrão', 'Montanhas 1', 'Montanhas 2', 'Montanhas 3', 'Pico Congelado 1', 'Pico Congelado 2', 'Pico Congelado 3',
						'Praia 1', 'Praia 2', 'Praia 3', 'Floresta 1', 'Floresta 2', 'Floresta 3', 'Deserto 1', 'Deserto 2', 'Deserto 3'});
    obj.comboBox1:setValues({'default', 'mountains1', 'mountains2', 'mountains3', 'snowpeaks1', 'snowpeaks2', 'snowpeaks3',
						'beach1', 'beach2', 'beach3', 'forest1', 'forest2', 'forest3', 'desert1', 'desert2', 'desert3'});
    obj.comboBox1:setField("fundoPreviewCombobox");
    obj.comboBox1:setValue("default");
    obj.comboBox1:setWidth(200);
    obj.comboBox1:setHeight(30);
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontSize(15);

    obj.fundoPreview = GUI.fromHandle(_obj_newObject("image"));
    obj.fundoPreview:setParent(obj.flowLayout11);
    obj.fundoPreview:setName("fundoPreview");
    obj.fundoPreview:setWidth(320);
    obj.fundoPreview:setHeight(180);
    obj.fundoPreview:setAlign("top");
    obj.fundoPreview:setStyle("autoFit");
    obj.fundoPreview:setMargins({top=10});

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowLayout11);
    obj.label10:setAlign("top");
    obj.label10:setText("URL Customizada:");
    obj.label10:setWidth(200);
    obj.label10:setHeight(30);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");
    obj.label10:setFontSize(20);

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowLayout11);
    obj.edit13:setAlign("top");
    obj.edit13:setField("fundoPreviewURLCustomizada");
    obj.edit13:setWidth(200);
    obj.edit13:setHeight(30);
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(20);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowLayout11);
    obj.button5:setAlign("top");
    obj.button5:setText("Aplicar");
    obj.button5:setWidth(200);
    obj.button5:setHeight(30);
    obj.button5:setMargins({top=10});
    obj.button5:setName("button5");
    obj.button5:setFontSize(15);

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowLayout11);
    obj.button6:setAlign("top");
    obj.button6:setText("Aplicar URL");
    obj.button6:setWidth(200);
    obj.button6:setHeight(30);
    obj.button6:setName("button6");
    obj.button6:setFontSize(15);

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.flowLayout11);
    obj.dataLink16:setField("fundoPreviewCombobox");
    obj.dataLink16:setName("dataLink16");

    obj.popHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.flowLayout1);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(340);
    obj.popHabilidade:setHeight(340);
    obj.popHabilidade:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHabilidade, "autoScopeNode",  "false");

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.popHabilidade);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setMaxControlsPerLine(2);
    obj.flowLayout12:setMargins({bottom=4});
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setName("flowLayout12");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout12);
    obj.flowPart3:setMinWidth(30);
    obj.flowPart3:setMaxWidth(400);
    obj.flowPart3:setHeight(40);
    obj.flowPart3:setName("flowPart3");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.flowPart3);
    obj.label11:setAlign("top");
    obj.label11:setFontSize(12);
    obj.label11:setText("TIPO");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setWordWrap(true);
    obj.label11:setTextTrimming("none");
    obj.label11:setAutoSize(true);
    obj.label11:setName("label11");

    obj.popInfoFieldtipoHab = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldtipoHab:setParent(obj.flowPart3);
    obj.popInfoFieldtipoHab:setName("popInfoFieldtipoHab");
    obj.popInfoFieldtipoHab:setAlign("client");
    obj.popInfoFieldtipoHab:setField("tipoHab");
    obj.popInfoFieldtipoHab:setHorzTextAlign("center");
    obj.popInfoFieldtipoHab:setFontSize(15);
    obj.popInfoFieldtipoHab:setType("text");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout12);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout12);
    obj.flowPart4:setMinWidth(30);
    obj.flowPart4:setMaxWidth(400);
    obj.flowPart4:setHeight(40);
    obj.flowPart4:setName("flowPart4");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.flowPart4);
    obj.label12:setAlign("top");
    obj.label12:setFontSize(12);
    obj.label12:setText("MANA");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setWordWrap(true);
    obj.label12:setTextTrimming("none");
    obj.label12:setAutoSize(true);
    obj.label12:setName("label12");

    obj.popInfoFieldmanaHab = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldmanaHab:setParent(obj.flowPart4);
    obj.popInfoFieldmanaHab:setName("popInfoFieldmanaHab");
    obj.popInfoFieldmanaHab:setAlign("client");
    obj.popInfoFieldmanaHab:setField("manaHab");
    obj.popInfoFieldmanaHab:setHorzTextAlign("center");
    obj.popInfoFieldmanaHab:setFontSize(15);
    obj.popInfoFieldmanaHab:setType("text");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout12);
    obj.flowPart5:setMinWidth(30);
    obj.flowPart5:setMaxWidth(400);
    obj.flowPart5:setHeight(40);
    obj.flowPart5:setName("flowPart5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.flowPart5);
    obj.label13:setAlign("top");
    obj.label13:setFontSize(12);
    obj.label13:setText("DIFICULDADE");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setWordWrap(true);
    obj.label13:setTextTrimming("none");
    obj.label13:setAutoSize(true);
    obj.label13:setName("label13");

    obj.popInfoFielddificuldadeHab = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFielddificuldadeHab:setParent(obj.flowPart5);
    obj.popInfoFielddificuldadeHab:setName("popInfoFielddificuldadeHab");
    obj.popInfoFielddificuldadeHab:setAlign("client");
    obj.popInfoFielddificuldadeHab:setField("dificuldadeHab");
    obj.popInfoFielddificuldadeHab:setHorzTextAlign("center");
    obj.popInfoFielddificuldadeHab:setFontSize(15);
    obj.popInfoFielddificuldadeHab:setType("text");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout12);
    obj.flowPart6:setMinWidth(30);
    obj.flowPart6:setMaxWidth(400);
    obj.flowPart6:setHeight(40);
    obj.flowPart6:setName("flowPart6");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.flowPart6);
    obj.label14:setAlign("top");
    obj.label14:setFontSize(12);
    obj.label14:setText("ALCANCE");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setWordWrap(true);
    obj.label14:setTextTrimming("none");
    obj.label14:setAutoSize(true);
    obj.label14:setName("label14");

    obj.popInfoFieldalcanceHab = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldalcanceHab:setParent(obj.flowPart6);
    obj.popInfoFieldalcanceHab:setName("popInfoFieldalcanceHab");
    obj.popInfoFieldalcanceHab:setAlign("client");
    obj.popInfoFieldalcanceHab:setField("alcanceHab");
    obj.popInfoFieldalcanceHab:setHorzTextAlign("center");
    obj.popInfoFieldalcanceHab:setFontSize(15);
    obj.popInfoFieldalcanceHab:setType("text");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout12);
    obj.flowPart7:setMinWidth(30);
    obj.flowPart7:setMaxWidth(400);
    obj.flowPart7:setHeight(40);
    obj.flowPart7:setName("flowPart7");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.flowPart7);
    obj.label15:setAlign("top");
    obj.label15:setFontSize(12);
    obj.label15:setText("DURAÇÃO");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setWordWrap(true);
    obj.label15:setTextTrimming("none");
    obj.label15:setAutoSize(true);
    obj.label15:setName("label15");

    obj.popInfoFieldduracaoHab = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldduracaoHab:setParent(obj.flowPart7);
    obj.popInfoFieldduracaoHab:setName("popInfoFieldduracaoHab");
    obj.popInfoFieldduracaoHab:setAlign("client");
    obj.popInfoFieldduracaoHab:setField("duracaoHab");
    obj.popInfoFieldduracaoHab:setHorzTextAlign("center");
    obj.popInfoFieldduracaoHab:setFontSize(15);
    obj.popInfoFieldduracaoHab:setType("text");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.popHabilidade);
    obj.label16:setAlign("top");
    obj.label16:setFontSize(12);
    obj.label16:setText("DESCRIÇÃO");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setWordWrap(true);
    obj.label16:setTextTrimming("none");
    obj.label16:setAutoSize(true);
    obj.label16:setName("label16");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popHabilidade);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setFontSize(15);
    obj.textEditor1:setName("textEditor1");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowLayout1);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setMaxControlsPerLine(1);
    obj.flowLayout13:setWidth(400);
    obj.flowLayout13:setVertAlign("leading");
    obj.flowLayout13:setName("flowLayout13");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout13);
    obj.flowPart8:setMinWidth(400);
    obj.flowPart8:setMaxWidth(400);
    obj.flowPart8:setHeight(125);
    obj.flowPart8:setAlign("top");
    obj.flowPart8:setAvoidScale(true);
    obj.flowPart8:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart8:setName("flowPart8");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.flowPart8);
    obj.label17:setHeight(20);
    obj.label17:setAlign("top");
    obj.label17:setText("CARGA");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setVertTextAlign("leading");
    obj.label17:setWordWrap(true);
    obj.label17:setTextTrimming("none");
    obj.label17:setFontSize(13);
    obj.label17:setName("label17");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowPart8);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setStrokeColor("#FFFFFF50");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setHeight(1);
    obj.horzLine1:setName("horzLine1");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.flowPart8);
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setAlign("client");
    obj.flowLayout14:setLineSpacing(10);
    obj.flowLayout14:setAvoidScale(true);
    obj.flowLayout14:setHorzAlign("center");
    obj.flowLayout14:setName("flowLayout14");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.flowLayout14);
    obj.rectangle8:setWidth(90);
    obj.rectangle8:setHeight(70);
    obj.rectangle8:setColor("#1f1f1f");
    obj.rectangle8:setStrokeColor("#828282");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setName("rectangle8");

    obj.flowLayout15 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout15:setParent(obj.rectangle8);
    obj.flowLayout15:setAlign("client");
    obj.flowLayout15:setMargins({left=5, right=5});
    obj.flowLayout15:setName("flowLayout15");

    obj.defenseField12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField12:setParent(obj.flowLayout15);
    obj.defenseField12:setHeight(50);
    obj.defenseField12:setMinScaledWidth(100);
    obj.defenseField12:setMinWidth(25);
    obj.defenseField12:setMaxWidth(100);
    obj.defenseField12:setMaxScaledWidth(100);
    obj.defenseField12:setAvoidScale(true);
    obj.defenseField12:setName("defenseField12");
    obj.defenseField12:setMargins({left=0, right=1, top=16});

    obj.edtdefenseField12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField12:setParent(obj.defenseField12);
    obj.edtdefenseField12:setName("edtdefenseField12");
    obj.edtdefenseField12:setAlign("top");
    obj.edtdefenseField12:setField("cargaBasica");
    obj.edtdefenseField12:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField12, "fontStyle",  "bold");
    obj.edtdefenseField12:setHorzTextAlign("center");
    obj.edtdefenseField12:setFontSize(25);
    obj.edtdefenseField12:setCanFocus(false);
    obj.edtdefenseField12:setType("number");

    obj.lindefenseField12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField12:setParent(obj.defenseField12);
    obj.lindefenseField12:setName("lindefenseField12");
    obj.lindefenseField12:setAlign("top");
    obj.lindefenseField12:setStrokeColor("#FFFFFF50");
    obj.lindefenseField12:setStrokeSize(1);

    obj.labdefenseField12 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField12:setParent(obj.defenseField12);
    obj.labdefenseField12:setName("labdefenseField12");
    obj.labdefenseField12:setAlign("top");
    obj.labdefenseField12:setText("BÁSICA");
    obj.labdefenseField12:setHorzTextAlign("center");
    obj.labdefenseField12:setVertTextAlign("leading");
    obj.labdefenseField12:setWordWrap(true);
    obj.labdefenseField12:setTextTrimming("none");
    obj.labdefenseField12:setFontSize(14);
    lfm_setPropAsString(obj.labdefenseField12, "fontStyle",  "bold");


				self.defenseField12:setHeight(self.edtdefenseField12:getHeight() + self.labdefenseField12:getHeight() + self.lindefenseField12:getHeight());
			


    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.flowLayout14);
    obj.rectangle9:setWidth(90);
    obj.rectangle9:setHeight(70);
    obj.rectangle9:setColor("#1f1f1f");
    obj.rectangle9:setStrokeColor("#828282");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setName("rectangle9");

    obj.flowLayout16 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout16:setParent(obj.rectangle9);
    obj.flowLayout16:setAlign("client");
    obj.flowLayout16:setMargins({left=5, right=5});
    obj.flowLayout16:setName("flowLayout16");

    obj.defenseField13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField13:setParent(obj.flowLayout16);
    obj.defenseField13:setHeight(50);
    obj.defenseField13:setMinScaledWidth(100);
    obj.defenseField13:setMinWidth(25);
    obj.defenseField13:setMaxWidth(100);
    obj.defenseField13:setMaxScaledWidth(100);
    obj.defenseField13:setAvoidScale(true);
    obj.defenseField13:setName("defenseField13");
    obj.defenseField13:setMargins({left=0, right=1, top=16});

    obj.edtdefenseField13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField13:setParent(obj.defenseField13);
    obj.edtdefenseField13:setName("edtdefenseField13");
    obj.edtdefenseField13:setAlign("top");
    obj.edtdefenseField13:setField("cargaPesada");
    obj.edtdefenseField13:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField13, "fontStyle",  "bold");
    obj.edtdefenseField13:setHorzTextAlign("center");
    obj.edtdefenseField13:setFontSize(25);
    obj.edtdefenseField13:setCanFocus(false);
    obj.edtdefenseField13:setType("number");

    obj.lindefenseField13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField13:setParent(obj.defenseField13);
    obj.lindefenseField13:setName("lindefenseField13");
    obj.lindefenseField13:setAlign("top");
    obj.lindefenseField13:setStrokeColor("#FFFFFF50");
    obj.lindefenseField13:setStrokeSize(1);

    obj.labdefenseField13 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField13:setParent(obj.defenseField13);
    obj.labdefenseField13:setName("labdefenseField13");
    obj.labdefenseField13:setAlign("top");
    obj.labdefenseField13:setText("PESADA");
    obj.labdefenseField13:setHorzTextAlign("center");
    obj.labdefenseField13:setVertTextAlign("leading");
    obj.labdefenseField13:setWordWrap(true);
    obj.labdefenseField13:setTextTrimming("none");
    obj.labdefenseField13:setFontSize(14);
    lfm_setPropAsString(obj.labdefenseField13, "fontStyle",  "bold");


				self.defenseField13:setHeight(self.edtdefenseField13:getHeight() + self.labdefenseField13:getHeight() + self.lindefenseField13:getHeight());
			


    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.flowLayout14);
    obj.rectangle10:setWidth(90);
    obj.rectangle10:setHeight(70);
    obj.rectangle10:setColor("#1f1f1f");
    obj.rectangle10:setStrokeColor("#828282");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setMargins({right=10});
    obj.rectangle10:setName("rectangle10");

    obj.flowLayout17 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout17:setParent(obj.rectangle10);
    obj.flowLayout17:setAlign("client");
    obj.flowLayout17:setMargins({left=5, right=5});
    obj.flowLayout17:setName("flowLayout17");

    obj.defenseField14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField14:setParent(obj.flowLayout17);
    obj.defenseField14:setHeight(50);
    obj.defenseField14:setMinScaledWidth(100);
    obj.defenseField14:setMinWidth(25);
    obj.defenseField14:setMaxWidth(100);
    obj.defenseField14:setMaxScaledWidth(100);
    obj.defenseField14:setAvoidScale(true);
    obj.defenseField14:setName("defenseField14");
    obj.defenseField14:setMargins({left=0, right=1, top=16});

    obj.edtdefenseField14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField14:setParent(obj.defenseField14);
    obj.edtdefenseField14:setName("edtdefenseField14");
    obj.edtdefenseField14:setAlign("top");
    obj.edtdefenseField14:setField("cargaMaxima");
    obj.edtdefenseField14:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField14, "fontStyle",  "bold");
    obj.edtdefenseField14:setHorzTextAlign("center");
    obj.edtdefenseField14:setFontSize(25);
    obj.edtdefenseField14:setCanFocus(false);
    obj.edtdefenseField14:setType("number");

    obj.lindefenseField14 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField14:setParent(obj.defenseField14);
    obj.lindefenseField14:setName("lindefenseField14");
    obj.lindefenseField14:setAlign("top");
    obj.lindefenseField14:setStrokeColor("#FFFFFF50");
    obj.lindefenseField14:setStrokeSize(1);

    obj.labdefenseField14 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField14:setParent(obj.defenseField14);
    obj.labdefenseField14:setName("labdefenseField14");
    obj.labdefenseField14:setAlign("top");
    obj.labdefenseField14:setText("MÁXIMA");
    obj.labdefenseField14:setHorzTextAlign("center");
    obj.labdefenseField14:setVertTextAlign("leading");
    obj.labdefenseField14:setWordWrap(true);
    obj.labdefenseField14:setTextTrimming("none");
    obj.labdefenseField14:setFontSize(14);
    lfm_setPropAsString(obj.labdefenseField14, "fontStyle",  "bold");


				self.defenseField14:setHeight(self.edtdefenseField14:getHeight() + self.labdefenseField14:getHeight() + self.lindefenseField14:getHeight());
			


    obj.defenseField11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField11:setParent(obj.flowLayout14);
    obj.defenseField11:setHeight(50);
    obj.defenseField11:setMinScaledWidth(100);
    obj.defenseField11:setMinWidth(25);
    obj.defenseField11:setMaxWidth(100);
    obj.defenseField11:setMaxScaledWidth(100);
    obj.defenseField11:setAvoidScale(true);
    obj.defenseField11:setName("defenseField11");
    obj.defenseField11:setMargins({left=0, right=1, top=16});

    obj.edtdefenseField11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField11:setParent(obj.defenseField11);
    obj.edtdefenseField11:setName("edtdefenseField11");
    obj.edtdefenseField11:setAlign("top");
    obj.edtdefenseField11:setField("cargaBonus");
    obj.edtdefenseField11:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField11, "fontStyle",  "");
    obj.edtdefenseField11:setHorzTextAlign("center");
    obj.edtdefenseField11:setFontSize(18);
    obj.edtdefenseField11:setCanFocus(true);
    obj.edtdefenseField11:setType("number");

    obj.lindefenseField11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.lindefenseField11:setParent(obj.defenseField11);
    obj.lindefenseField11:setName("lindefenseField11");
    obj.lindefenseField11:setAlign("top");
    obj.lindefenseField11:setStrokeColor("#FFFFFF50");
    obj.lindefenseField11:setStrokeSize(1);

    obj.labdefenseField11 = GUI.fromHandle(_obj_newObject("label"));
    obj.labdefenseField11:setParent(obj.defenseField11);
    obj.labdefenseField11:setName("labdefenseField11");
    obj.labdefenseField11:setAlign("top");
    obj.labdefenseField11:setText("MOD (FORÇA)");
    obj.labdefenseField11:setHorzTextAlign("center");
    obj.labdefenseField11:setVertTextAlign("leading");
    obj.labdefenseField11:setWordWrap(true);
    obj.labdefenseField11:setTextTrimming("none");
    obj.labdefenseField11:setFontSize(11);
    lfm_setPropAsString(obj.labdefenseField11, "fontStyle",  "");


				self.defenseField11:setHeight(self.edtdefenseField11:getHeight() + self.labdefenseField11:getHeight() + self.lindefenseField11:getHeight());
			


    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.flowLayout13);
    obj.dataLink17:setField("cargaBonus");
    obj.dataLink17:setName("dataLink17");

    obj.flowLayout18 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout18:setParent(obj.flowLayout13);
    obj.flowLayout18:setMinWidth(400);
    obj.flowLayout18:setMaxWidth(400);
    obj.flowLayout18:setAlign("top");
    obj.flowLayout18:setHorzAlign("leading");
    obj.flowLayout18:setVertAlign("leading");
    obj.flowLayout18:setAutoHeight(true);
    obj.flowLayout18:setLineSpacing(10);
    obj.flowLayout18:setAvoidScale(true);
    obj.flowLayout18:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowLayout18:setMargins({left=5, top=5, right=5, bottom=5});
    obj.flowLayout18:setName("flowLayout18");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowLayout18);
    obj.button7:setText("Nova Habilidade");
    obj.button7:setWidth(150);
    obj.button7:setHeight(30);
    obj.button7:setName("button7");
    obj.button7:setFontSize(15);

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout18);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.rclHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidades:setParent(obj.flowLayout18);
    obj.rclHabilidades:setName("rclHabilidades");
    obj.rclHabilidades:setField("habilidades");
    obj.rclHabilidades:setTemplateForm("frmHabilidade");
    obj.rclHabilidades:setAutoHeight(true);
    obj.rclHabilidades:setWidth(1200);

    obj.popArma = GUI.fromHandle(_obj_newObject("popup"));
    obj.popArma:setParent(obj.flowLayout1);
    obj.popArma:setName("popArma");
    obj.popArma:setWidth(275);
    obj.popArma:setHeight(300);
    obj.popArma:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popArma, "autoScopeNode",  "false");

    obj.flowLayout19 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout19:setParent(obj.popArma);
    obj.flowLayout19:setAlign("top");
    obj.flowLayout19:setAutoHeight(true);
    obj.flowLayout19:setMaxControlsPerLine(2);
    obj.flowLayout19:setMargins({bottom=4});
    obj.flowLayout19:setHorzAlign("center");
    obj.flowLayout19:setName("flowLayout19");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout19);
    obj.flowPart9:setMinWidth(30);
    obj.flowPart9:setMaxWidth(400);
    obj.flowPart9:setHeight(40);
    obj.flowPart9:setName("flowPart9");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.flowPart9);
    obj.label18:setAlign("top");
    obj.label18:setFontSize(12);
    obj.label18:setText("TIPO");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setWordWrap(true);
    obj.label18:setTextTrimming("none");
    obj.label18:setAutoSize(true);
    obj.label18:setName("label18");

    obj.popInfoFieldtipoArma = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldtipoArma:setParent(obj.flowPart9);
    obj.popInfoFieldtipoArma:setName("popInfoFieldtipoArma");
    obj.popInfoFieldtipoArma:setAlign("client");
    obj.popInfoFieldtipoArma:setField("tipoArma");
    obj.popInfoFieldtipoArma:setHorzTextAlign("center");
    obj.popInfoFieldtipoArma:setFontSize(15);
    obj.popInfoFieldtipoArma:setType("text");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout19);
    obj.flowPart10:setMinWidth(30);
    obj.flowPart10:setMaxWidth(400);
    obj.flowPart10:setHeight(40);
    obj.flowPart10:setName("flowPart10");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart10);
    obj.label19:setAlign("top");
    obj.label19:setFontSize(12);
    obj.label19:setText("PESO");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setWordWrap(true);
    obj.label19:setTextTrimming("none");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.popInfoFieldpesoArma = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldpesoArma:setParent(obj.flowPart10);
    obj.popInfoFieldpesoArma:setName("popInfoFieldpesoArma");
    obj.popInfoFieldpesoArma:setAlign("client");
    obj.popInfoFieldpesoArma:setField("pesoArma");
    obj.popInfoFieldpesoArma:setHorzTextAlign("center");
    obj.popInfoFieldpesoArma:setFontSize(15);
    obj.popInfoFieldpesoArma:setType("float");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout19);
    obj.flowPart11:setMinWidth(30);
    obj.flowPart11:setMaxWidth(400);
    obj.flowPart11:setHeight(40);
    obj.flowPart11:setName("flowPart11");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.flowPart11);
    obj.label20:setAlign("top");
    obj.label20:setFontSize(12);
    obj.label20:setText("CUSTO");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setWordWrap(true);
    obj.label20:setTextTrimming("none");
    obj.label20:setAutoSize(true);
    obj.label20:setName("label20");

    obj.popInfoFieldcustoArma = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldcustoArma:setParent(obj.flowPart11);
    obj.popInfoFieldcustoArma:setName("popInfoFieldcustoArma");
    obj.popInfoFieldcustoArma:setAlign("client");
    obj.popInfoFieldcustoArma:setField("custoArma");
    obj.popInfoFieldcustoArma:setHorzTextAlign("center");
    obj.popInfoFieldcustoArma:setFontSize(15);
    obj.popInfoFieldcustoArma:setType("text");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout19);
    obj.flowPart12:setMinWidth(30);
    obj.flowPart12:setMaxWidth(400);
    obj.flowPart12:setHeight(40);
    obj.flowPart12:setName("flowPart12");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart12);
    obj.label21:setAlign("top");
    obj.label21:setFontSize(12);
    obj.label21:setText("DANO");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWordWrap(true);
    obj.label21:setTextTrimming("none");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

    obj.popInfoFielddanoArma = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFielddanoArma:setParent(obj.flowPart12);
    obj.popInfoFielddanoArma:setName("popInfoFielddanoArma");
    obj.popInfoFielddanoArma:setAlign("client");
    obj.popInfoFielddanoArma:setField("danoArma");
    obj.popInfoFielddanoArma:setHorzTextAlign("center");
    obj.popInfoFielddanoArma:setFontSize(15);
    obj.popInfoFielddanoArma:setType("text");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout19);
    obj.flowPart13:setMinWidth(30);
    obj.flowPart13:setMaxWidth(400);
    obj.flowPart13:setHeight(40);
    obj.flowPart13:setName("flowPart13");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart13);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(12);
    obj.label22:setText("FN");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.popInfoFieldfnArma = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldfnArma:setParent(obj.flowPart13);
    obj.popInfoFieldfnArma:setName("popInfoFieldfnArma");
    obj.popInfoFieldfnArma:setAlign("client");
    obj.popInfoFieldfnArma:setField("fnArma");
    obj.popInfoFieldfnArma:setHorzTextAlign("center");
    obj.popInfoFieldfnArma:setFontSize(15);
    obj.popInfoFieldfnArma:setType("text");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout19);
    obj.flowPart14:setMinWidth(30);
    obj.flowPart14:setMaxWidth(400);
    obj.flowPart14:setHeight(40);
    obj.flowPart14:setName("flowPart14");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart14);
    obj.label23:setAlign("top");
    obj.label23:setFontSize(12);
    obj.label23:setText("DISTÂNCIA");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setWordWrap(true);
    obj.label23:setTextTrimming("none");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.popInfoFielddistanciaArma = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFielddistanciaArma:setParent(obj.flowPart14);
    obj.popInfoFielddistanciaArma:setName("popInfoFielddistanciaArma");
    obj.popInfoFielddistanciaArma:setAlign("client");
    obj.popInfoFielddistanciaArma:setField("distanciaArma");
    obj.popInfoFielddistanciaArma:setHorzTextAlign("center");
    obj.popInfoFielddistanciaArma:setFontSize(15);
    obj.popInfoFielddistanciaArma:setType("text");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout19);
    obj.flowPart15:setMinWidth(30);
    obj.flowPart15:setMaxWidth(400);
    obj.flowPart15:setHeight(40);
    obj.flowPart15:setName("flowPart15");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart15);
    obj.label24:setAlign("top");
    obj.label24:setFontSize(12);
    obj.label24:setText("ATRIBUTO");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.popWeaponAttribute = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.popWeaponAttribute:setParent(obj.flowPart15);
    obj.popWeaponAttribute:setName("popWeaponAttribute");
    obj.popWeaponAttribute:setAlign("client");
    obj.popWeaponAttribute:setField("atributoArma");
    obj.popWeaponAttribute:setItems({'Força', 'Agilidade', 'Inteligência', 'Vontade'});
    obj.popWeaponAttribute:setValues({'forca', 'agilidade', 'inteligencia', 'vontade'});
    obj.popWeaponAttribute:setValue("forca");
    obj.popWeaponAttribute:setFontSize(15);

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.popArma);
    obj.dataLink18:setField("pesoArma");
    obj.dataLink18:setName("dataLink18");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.popArma);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(12);
    obj.label25:setText("OBSERVAÇÃO");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setWordWrap(true);
    obj.label25:setTextTrimming("none");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popArma);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setFontSize(15);
    obj.textEditor2:setName("textEditor2");

    obj.popArmadura = GUI.fromHandle(_obj_newObject("popup"));
    obj.popArmadura:setParent(obj.flowLayout1);
    obj.popArmadura:setName("popArmadura");
    obj.popArmadura:setWidth(275);
    obj.popArmadura:setHeight(275);
    obj.popArmadura:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popArmadura, "autoScopeNode",  "false");

    obj.flowLayout20 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout20:setParent(obj.popArmadura);
    obj.flowLayout20:setAlign("top");
    obj.flowLayout20:setAutoHeight(true);
    obj.flowLayout20:setMaxControlsPerLine(2);
    obj.flowLayout20:setHorzAlign("center");
    obj.flowLayout20:setName("flowLayout20");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout20);
    obj.flowPart16:setMinWidth(30);
    obj.flowPart16:setMaxWidth(400);
    obj.flowPart16:setHeight(40);
    obj.flowPart16:setName("flowPart16");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart16);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(12);
    obj.label26:setText("CUSTO");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.popInfoFieldcustoArmadura = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldcustoArmadura:setParent(obj.flowPart16);
    obj.popInfoFieldcustoArmadura:setName("popInfoFieldcustoArmadura");
    obj.popInfoFieldcustoArmadura:setAlign("client");
    obj.popInfoFieldcustoArmadura:setField("custoArmadura");
    obj.popInfoFieldcustoArmadura:setHorzTextAlign("center");
    obj.popInfoFieldcustoArmadura:setFontSize(15);
    obj.popInfoFieldcustoArmadura:setType("text");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout20);
    obj.flowPart17:setMinWidth(30);
    obj.flowPart17:setMaxWidth(400);
    obj.flowPart17:setHeight(40);
    obj.flowPart17:setName("flowPart17");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart17);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(12);
    obj.label27:setText("DEFESA");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.popInfoFielddefesaArmadura = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFielddefesaArmadura:setParent(obj.flowPart17);
    obj.popInfoFielddefesaArmadura:setName("popInfoFielddefesaArmadura");
    obj.popInfoFielddefesaArmadura:setAlign("client");
    obj.popInfoFielddefesaArmadura:setField("defesaArmadura");
    obj.popInfoFielddefesaArmadura:setHorzTextAlign("center");
    obj.popInfoFielddefesaArmadura:setFontSize(15);
    obj.popInfoFielddefesaArmadura:setType("number");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout20);
    obj.flowPart18:setMinWidth(30);
    obj.flowPart18:setMaxWidth(400);
    obj.flowPart18:setHeight(40);
    obj.flowPart18:setName("flowPart18");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart18);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(12);
    obj.label28:setText("FN");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.popInfoFieldfnArmadura = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldfnArmadura:setParent(obj.flowPart18);
    obj.popInfoFieldfnArmadura:setName("popInfoFieldfnArmadura");
    obj.popInfoFieldfnArmadura:setAlign("client");
    obj.popInfoFieldfnArmadura:setField("fnArmadura");
    obj.popInfoFieldfnArmadura:setHorzTextAlign("center");
    obj.popInfoFieldfnArmadura:setFontSize(15);
    obj.popInfoFieldfnArmadura:setType("text");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout20);
    obj.flowPart19:setMinWidth(30);
    obj.flowPart19:setMaxWidth(400);
    obj.flowPart19:setHeight(40);
    obj.flowPart19:setName("flowPart19");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart19);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(12);
    obj.label29:setText("PESO");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.popInfoFieldpesoArmadura = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldpesoArmadura:setParent(obj.flowPart19);
    obj.popInfoFieldpesoArmadura:setName("popInfoFieldpesoArmadura");
    obj.popInfoFieldpesoArmadura:setAlign("client");
    obj.popInfoFieldpesoArmadura:setField("pesoArmadura");
    obj.popInfoFieldpesoArmadura:setHorzTextAlign("center");
    obj.popInfoFieldpesoArmadura:setFontSize(15);
    obj.popInfoFieldpesoArmadura:setType("float");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout20);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout20);
    obj.flowPart20:setMinWidth(275);
    obj.flowPart20:setMaxWidth(275);
    obj.flowPart20:setName("flowPart20");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowPart20);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setText("Pesada");
    obj.checkBox1:setField("pesadaArmadura");
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setWidth(70);
    obj.checkBox1:setName("checkBox1");
    obj.checkBox1:setFontSize(13);

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowPart20);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setText("Rígida");
    obj.checkBox2:setField("rigidaArmadura");
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setWidth(70);
    obj.checkBox2:setName("checkBox2");
    obj.checkBox2:setFontSize(13);

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowPart20);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setText("Escudo");
    obj.checkBox3:setField("escudoArmadura");
    obj.checkBox3:setHeight(20);
    obj.checkBox3:setWidth(70);
    obj.checkBox3:setName("checkBox3");
    obj.checkBox3:setFontSize(13);

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.flowPart20);
    obj.dataLink19:setField("pesadaArmadura");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.flowPart20);
    obj.dataLink20:setField("rigidaArmadura");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.flowPart20);
    obj.dataLink21:setField("escudoArmadura");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.flowPart20);
    obj.dataLink22:setField("pesoArmadura");
    obj.dataLink22:setName("dataLink22");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.popArmadura);
    obj.label30:setAlign("top");
    obj.label30:setFontSize(12);
    obj.label30:setText("OBSERVAÇÃO");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWordWrap(true);
    obj.label30:setTextTrimming("none");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popArmadura);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("descricao");
    obj.textEditor3:setFontSize(15);
    obj.textEditor3:setName("textEditor3");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.popArmadura);
    obj.dataLink23:setField("defesaArmadura");
    obj.dataLink23:setName("dataLink23");

    obj.popItem = GUI.fromHandle(_obj_newObject("popup"));
    obj.popItem:setParent(obj.flowLayout1);
    obj.popItem:setName("popItem");
    obj.popItem:setWidth(275);
    obj.popItem:setHeight(300);
    obj.popItem:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popItem, "autoScopeNode",  "false");

    obj.flowLayout21 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout21:setParent(obj.popItem);
    obj.flowLayout21:setAlign("top");
    obj.flowLayout21:setAutoHeight(true);
    obj.flowLayout21:setMaxControlsPerLine(2);
    obj.flowLayout21:setMargins({bottom=4});
    obj.flowLayout21:setHorzAlign("center");
    obj.flowLayout21:setName("flowLayout21");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout21);
    obj.flowPart21:setMinWidth(30);
    obj.flowPart21:setMaxWidth(400);
    obj.flowPart21:setHeight(40);
    obj.flowPart21:setName("flowPart21");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart21);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(12);
    obj.label31:setText("CUSTO");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.popInfoFieldcustoItem = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldcustoItem:setParent(obj.flowPart21);
    obj.popInfoFieldcustoItem:setName("popInfoFieldcustoItem");
    obj.popInfoFieldcustoItem:setAlign("client");
    obj.popInfoFieldcustoItem:setField("custoItem");
    obj.popInfoFieldcustoItem:setHorzTextAlign("center");
    obj.popInfoFieldcustoItem:setFontSize(15);
    obj.popInfoFieldcustoItem:setType("text");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout21);
    obj.flowPart22:setMinWidth(30);
    obj.flowPart22:setMaxWidth(400);
    obj.flowPart22:setHeight(40);
    obj.flowPart22:setName("flowPart22");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart22);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(12);
    obj.label32:setText("PESO");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.popInfoFieldpesoItem = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldpesoItem:setParent(obj.flowPart22);
    obj.popInfoFieldpesoItem:setName("popInfoFieldpesoItem");
    obj.popInfoFieldpesoItem:setAlign("client");
    obj.popInfoFieldpesoItem:setField("pesoItem");
    obj.popInfoFieldpesoItem:setHorzTextAlign("center");
    obj.popInfoFieldpesoItem:setFontSize(15);
    obj.popInfoFieldpesoItem:setType("float");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.popItem);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(12);
    obj.label33:setText("DESCRIÇÃO");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.popItem);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("descricaoItem");
    obj.textEditor4:setFontSize(15);
    obj.textEditor4:setName("textEditor4");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.popItem);
    obj.dataLink24:setField("pesoItem");
    obj.dataLink24:setName("dataLink24");

    obj.flowLayout22 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout22:setParent(obj.flowLayout1);
    obj.flowLayout22:setMinWidth(400);
    obj.flowLayout22:setMaxWidth(525);
    obj.flowLayout22:setAlign("top");
    obj.flowLayout22:setHorzAlign("leading");
    obj.flowLayout22:setVertAlign("leading");
    obj.flowLayout22:setAutoHeight(true);
    obj.flowLayout22:setLineSpacing(10);
    obj.flowLayout22:setAvoidScale(true);
    obj.flowLayout22:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowLayout22:setMargins({left=5, top=5, right=5, bottom=5});
    obj.flowLayout22:setName("flowLayout22");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout22);
    obj.flowPart23:setMinWidth(30);
    obj.flowPart23:setMaxWidth(500);
    obj.flowPart23:setName("flowPart23");

    obj.labequipmentHeader1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labequipmentHeader1:setParent(obj.flowPart23);
    obj.labequipmentHeader1:setName("labequipmentHeader1");
    obj.labequipmentHeader1:setHeight(20);
    obj.labequipmentHeader1:setAlign("top");
    obj.labequipmentHeader1:setText("ARMAS");
    obj.labequipmentHeader1:setHorzTextAlign("center");
    obj.labequipmentHeader1:setVertTextAlign("leading");
    obj.labequipmentHeader1:setWordWrap(true);
    obj.labequipmentHeader1:setTextTrimming("none");
    obj.labequipmentHeader1:setFontSize(13);

    obj.linequipmentHeader1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linequipmentHeader1:setParent(obj.flowPart23);
    obj.linequipmentHeader1:setName("linequipmentHeader1");
    obj.linequipmentHeader1:setAlign("top");
    obj.linequipmentHeader1:setStrokeColor("#FFFFFF50");
    obj.linequipmentHeader1:setStrokeSize(1);
    obj.linequipmentHeader1:setHeight(1);

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowPart23);
    obj.button8:setText("Nova Arma");
    obj.button8:setAlign("left");
    obj.button8:setWidth(150);
    obj.button8:setHeight(30);
    obj.button8:setMargins({left=0, right=5, top=0});
    obj.button8:setName("button8");
    obj.button8:setFontSize(15);

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout22);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.rclArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.flowLayout22);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("armas");
    obj.rclArmas:setTemplateForm("frmArma");
    obj.rclArmas:setAutoHeight(true);
    obj.rclArmas:setWidth(1300);

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout22);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout22);
    obj.flowPart24:setMinWidth(30);
    obj.flowPart24:setMaxWidth(500);
    obj.flowPart24:setName("flowPart24");

    obj.labequipmentHeader2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labequipmentHeader2:setParent(obj.flowPart24);
    obj.labequipmentHeader2:setName("labequipmentHeader2");
    obj.labequipmentHeader2:setHeight(20);
    obj.labequipmentHeader2:setAlign("top");
    obj.labequipmentHeader2:setText("ARMADURAS");
    obj.labequipmentHeader2:setHorzTextAlign("center");
    obj.labequipmentHeader2:setVertTextAlign("leading");
    obj.labequipmentHeader2:setWordWrap(true);
    obj.labequipmentHeader2:setTextTrimming("none");
    obj.labequipmentHeader2:setFontSize(13);

    obj.linequipmentHeader2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linequipmentHeader2:setParent(obj.flowPart24);
    obj.linequipmentHeader2:setName("linequipmentHeader2");
    obj.linequipmentHeader2:setAlign("top");
    obj.linequipmentHeader2:setStrokeColor("#FFFFFF50");
    obj.linequipmentHeader2:setStrokeSize(1);
    obj.linequipmentHeader2:setHeight(1);

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.flowPart24);
    obj.button9:setText("Nova Armadura");
    obj.button9:setAlign("left");
    obj.button9:setWidth(150);
    obj.button9:setHeight(30);
    obj.button9:setMargins({left=0, right=5, top=0});
    obj.button9:setName("button9");
    obj.button9:setFontSize(15);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart24);
    obj.layout1:setAlign("right");
    obj.layout1:setWidth(130);
    obj.layout1:setMargins({left=0, right=10, top=0});
    obj.layout1:setName("layout1");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.layout1);
    obj.image3:setSRC("/model/images/weight.png");
    obj.image3:setAlign("right");
    obj.image3:setWidth(20);
    obj.image3:setHeight(20);
    obj.image3:setMargins({left=0, right=10, top=0});
    obj.image3:setName("image3");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout1);
    obj.edit14:setField("weight");
    obj.edit14:setAlign("right");
    obj.edit14:setWidth(100);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setCanFocus(false);
    obj.edit14:setName("edit14");
    obj.edit14:setFontSize(20);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.flowPart24);
    obj.layout2:setAlign("right");
    obj.layout2:setWidth(130);
    obj.layout2:setName("layout2");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout2);
    obj.image4:setSRC("/model/images/coin.png");
    obj.image4:setAlign("left");
    obj.image4:setWidth(20);
    obj.image4:setHeight(20);
    obj.image4:setMargins({left=0, right=10, top=0});
    obj.image4:setName("image4");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout2);
    obj.edit15:setField("moedas");
    obj.edit15:setAlign("right");
    obj.edit15:setWidth(100);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setFontSize(20);

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout22);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.rclArmaduras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmaduras:setParent(obj.flowLayout22);
    obj.rclArmaduras:setName("rclArmaduras");
    obj.rclArmaduras:setField("armaduras");
    obj.rclArmaduras:setTemplateForm("frmArmadura");
    obj.rclArmaduras:setAutoHeight(true);
    obj.rclArmaduras:setWidth(1300);

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout22);
    obj.flowPart25:setMinWidth(30);
    obj.flowPart25:setMaxWidth(500);
    obj.flowPart25:setName("flowPart25");

    obj.labequipmentHeader3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labequipmentHeader3:setParent(obj.flowPart25);
    obj.labequipmentHeader3:setName("labequipmentHeader3");
    obj.labequipmentHeader3:setHeight(20);
    obj.labequipmentHeader3:setAlign("top");
    obj.labequipmentHeader3:setText("ITENS");
    obj.labequipmentHeader3:setHorzTextAlign("center");
    obj.labequipmentHeader3:setVertTextAlign("leading");
    obj.labequipmentHeader3:setWordWrap(true);
    obj.labequipmentHeader3:setTextTrimming("none");
    obj.labequipmentHeader3:setFontSize(13);

    obj.linequipmentHeader3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linequipmentHeader3:setParent(obj.flowPart25);
    obj.linequipmentHeader3:setName("linequipmentHeader3");
    obj.linequipmentHeader3:setAlign("top");
    obj.linequipmentHeader3:setStrokeColor("#FFFFFF50");
    obj.linequipmentHeader3:setStrokeSize(1);
    obj.linequipmentHeader3:setHeight(1);

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.flowPart25);
    obj.button10:setText("Novo Item");
    obj.button10:setAlign("left");
    obj.button10:setWidth(150);
    obj.button10:setHeight(30);
    obj.button10:setMargins({left=0, right=5, top=0});
    obj.button10:setName("button10");
    obj.button10:setFontSize(15);

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout22);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.rclItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens:setParent(obj.flowLayout22);
    obj.rclItens:setName("rclItens");
    obj.rclItens:setField("itens");
    obj.rclItens:setTemplateForm("frmItem");
    obj.rclItens:setAutoHeight(true);
    obj.rclItens:setWidth(1300);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.pagPrincipal);
    obj.tab2:setTitle("Características");
    obj.tab2:setName("tab2");

    obj.formVerso = GUI.fromHandle(_obj_newObject("form"));
    obj.formVerso:setParent(obj.tab2);
    obj.formVerso:setName("formVerso");
    obj.formVerso:setAlign("client");
    obj.formVerso:setTheme("dark");

    obj.imagemFundoCaracteristicas = GUI.fromHandle(_obj_newObject("image"));
    obj.imagemFundoCaracteristicas:setParent(obj.formVerso);
    obj.imagemFundoCaracteristicas:setName("imagemFundoCaracteristicas");
    obj.imagemFundoCaracteristicas:setAlign("client");
    obj.imagemFundoCaracteristicas:setStyle("autoFit");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.imagemFundoCaracteristicas);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flowLayout23 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout23:setParent(obj.scrollBox2);
    obj.flowLayout23:setAlign("top");
    obj.flowLayout23:setAutoHeight(true);
    obj.flowLayout23:setHorzAlign("center");
    obj.flowLayout23:setMargins({left=20, right=20, top=20, bottom=20});
    obj.flowLayout23:setMaxControlsPerLine(3);
    obj.flowLayout23:setAvoidScale(true);
    obj.flowLayout23:setName("flowLayout23");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.flowLayout23);
    obj.image5:setSRC("/model/images/logo.png");
    obj.image5:setWidth(277);
    obj.image5:setHeight(146);
    obj.image5:setMargins({left=0, right=25, top=0});
    obj.image5:setName("image5");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout23);
    obj.flowPart26:setMinWidth(450);
    obj.flowPart26:setMaxWidth(450);
    obj.flowPart26:setHeight(200);
    obj.flowPart26:setVertAlign("center");
    obj.flowPart26:setMargins({left=0, right=20, top=0});
    obj.flowPart26:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart26:setName("flowPart26");

    obj.flowLayout24 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout24:setParent(obj.flowPart26);
    obj.flowLayout24:setWidth(600);
    obj.flowLayout24:setAutoHeight(true);
    obj.flowLayout24:setAlign("client");
    obj.flowLayout24:setLineSpacing(10);
    obj.flowLayout24:setAvoidScale(true);
    obj.flowLayout24:setName("flowLayout24");

    obj.baseField8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField8:setParent(obj.flowLayout24);
    obj.baseField8:setHeight(50);
    obj.baseField8:setMinScaledWidth(100);
    obj.baseField8:setMinWidth(150);
    obj.baseField8:setMaxWidth(300);
    obj.baseField8:setMaxScaledWidth(233);
    obj.baseField8:setAvoidScale(true);
    obj.baseField8:setName("baseField8");
    obj.baseField8:setMargins({left=0, right=1, top=0});

    obj.edtbaseField8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField8:setParent(obj.baseField8);
    obj.edtbaseField8:setName("edtbaseField8");
    obj.edtbaseField8:setAlign("top");
    obj.edtbaseField8:setField("idade");
    obj.edtbaseField8:setTransparent(true);
    obj.edtbaseField8:setFontSize(19);

    obj.linbaseField8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField8:setParent(obj.baseField8);
    obj.linbaseField8:setName("linbaseField8");
    obj.linbaseField8:setAlign("top");
    obj.linbaseField8:setStrokeColor("#FFFFFF50");
    obj.linbaseField8:setStrokeSize(1);

    obj.labbaseField8 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField8:setParent(obj.baseField8);
    obj.labbaseField8:setName("labbaseField8");
    obj.labbaseField8:setAlign("top");
    obj.labbaseField8:setText("IDADE");
    obj.labbaseField8:setVertTextAlign("leading");
    obj.labbaseField8:setWordWrap(true);
    obj.labbaseField8:setTextTrimming("none");
    obj.labbaseField8:setFontSize(13);


				self.baseField8:setHeight(self.edtbaseField8:getHeight() + self.labbaseField8:getHeight() + self.linbaseField8:getHeight());
			


    obj.baseField9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField9:setParent(obj.flowLayout24);
    obj.baseField9:setHeight(50);
    obj.baseField9:setMinScaledWidth(100);
    obj.baseField9:setMinWidth(150);
    obj.baseField9:setMaxWidth(300);
    obj.baseField9:setMaxScaledWidth(233);
    obj.baseField9:setAvoidScale(true);
    obj.baseField9:setName("baseField9");
    obj.baseField9:setMargins({left=0, right=1, top=0});

    obj.edtbaseField9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField9:setParent(obj.baseField9);
    obj.edtbaseField9:setName("edtbaseField9");
    obj.edtbaseField9:setAlign("top");
    obj.edtbaseField9:setField("altura");
    obj.edtbaseField9:setTransparent(true);
    obj.edtbaseField9:setFontSize(19);

    obj.linbaseField9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField9:setParent(obj.baseField9);
    obj.linbaseField9:setName("linbaseField9");
    obj.linbaseField9:setAlign("top");
    obj.linbaseField9:setStrokeColor("#FFFFFF50");
    obj.linbaseField9:setStrokeSize(1);

    obj.labbaseField9 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField9:setParent(obj.baseField9);
    obj.labbaseField9:setName("labbaseField9");
    obj.labbaseField9:setAlign("top");
    obj.labbaseField9:setText("ALTURA");
    obj.labbaseField9:setVertTextAlign("leading");
    obj.labbaseField9:setWordWrap(true);
    obj.labbaseField9:setTextTrimming("none");
    obj.labbaseField9:setFontSize(13);


				self.baseField9:setHeight(self.edtbaseField9:getHeight() + self.labbaseField9:getHeight() + self.linbaseField9:getHeight());
			


    obj.baseField10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField10:setParent(obj.flowLayout24);
    obj.baseField10:setHeight(50);
    obj.baseField10:setMinScaledWidth(100);
    obj.baseField10:setMinWidth(150);
    obj.baseField10:setMaxWidth(300);
    obj.baseField10:setMaxScaledWidth(233);
    obj.baseField10:setAvoidScale(true);
    obj.baseField10:setName("baseField10");
    obj.baseField10:setMargins({left=0, right=1, top=0});

    obj.edtbaseField10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField10:setParent(obj.baseField10);
    obj.edtbaseField10:setName("edtbaseField10");
    obj.edtbaseField10:setAlign("top");
    obj.edtbaseField10:setField("peso");
    obj.edtbaseField10:setTransparent(true);
    obj.edtbaseField10:setFontSize(19);

    obj.linbaseField10 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField10:setParent(obj.baseField10);
    obj.linbaseField10:setName("linbaseField10");
    obj.linbaseField10:setAlign("top");
    obj.linbaseField10:setStrokeColor("#FFFFFF50");
    obj.linbaseField10:setStrokeSize(1);

    obj.labbaseField10 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField10:setParent(obj.baseField10);
    obj.labbaseField10:setName("labbaseField10");
    obj.labbaseField10:setAlign("top");
    obj.labbaseField10:setText("PESO");
    obj.labbaseField10:setVertTextAlign("leading");
    obj.labbaseField10:setWordWrap(true);
    obj.labbaseField10:setTextTrimming("none");
    obj.labbaseField10:setFontSize(13);


				self.baseField10:setHeight(self.edtbaseField10:getHeight() + self.labbaseField10:getHeight() + self.linbaseField10:getHeight());
			


    obj.baseField11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField11:setParent(obj.flowLayout24);
    obj.baseField11:setHeight(50);
    obj.baseField11:setMinScaledWidth(100);
    obj.baseField11:setMinWidth(150);
    obj.baseField11:setMaxWidth(300);
    obj.baseField11:setMaxScaledWidth(233);
    obj.baseField11:setAvoidScale(true);
    obj.baseField11:setName("baseField11");
    obj.baseField11:setMargins({left=0, right=1, top=0});

    obj.edtbaseField11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField11:setParent(obj.baseField11);
    obj.edtbaseField11:setName("edtbaseField11");
    obj.edtbaseField11:setAlign("top");
    obj.edtbaseField11:setField("olhos");
    obj.edtbaseField11:setTransparent(true);
    obj.edtbaseField11:setFontSize(19);

    obj.linbaseField11 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField11:setParent(obj.baseField11);
    obj.linbaseField11:setName("linbaseField11");
    obj.linbaseField11:setAlign("top");
    obj.linbaseField11:setStrokeColor("#FFFFFF50");
    obj.linbaseField11:setStrokeSize(1);

    obj.labbaseField11 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField11:setParent(obj.baseField11);
    obj.labbaseField11:setName("labbaseField11");
    obj.labbaseField11:setAlign("top");
    obj.labbaseField11:setText("OLHOS");
    obj.labbaseField11:setVertTextAlign("leading");
    obj.labbaseField11:setWordWrap(true);
    obj.labbaseField11:setTextTrimming("none");
    obj.labbaseField11:setFontSize(13);


				self.baseField11:setHeight(self.edtbaseField11:getHeight() + self.labbaseField11:getHeight() + self.linbaseField11:getHeight());
			


    obj.baseField12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField12:setParent(obj.flowLayout24);
    obj.baseField12:setHeight(50);
    obj.baseField12:setMinScaledWidth(100);
    obj.baseField12:setMinWidth(150);
    obj.baseField12:setMaxWidth(300);
    obj.baseField12:setMaxScaledWidth(233);
    obj.baseField12:setAvoidScale(true);
    obj.baseField12:setName("baseField12");
    obj.baseField12:setMargins({left=0, right=1, top=0});

    obj.edtbaseField12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField12:setParent(obj.baseField12);
    obj.edtbaseField12:setName("edtbaseField12");
    obj.edtbaseField12:setAlign("top");
    obj.edtbaseField12:setField("pele");
    obj.edtbaseField12:setTransparent(true);
    obj.edtbaseField12:setFontSize(19);

    obj.linbaseField12 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField12:setParent(obj.baseField12);
    obj.linbaseField12:setName("linbaseField12");
    obj.linbaseField12:setAlign("top");
    obj.linbaseField12:setStrokeColor("#FFFFFF50");
    obj.linbaseField12:setStrokeSize(1);

    obj.labbaseField12 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField12:setParent(obj.baseField12);
    obj.labbaseField12:setName("labbaseField12");
    obj.labbaseField12:setAlign("top");
    obj.labbaseField12:setText("PELE");
    obj.labbaseField12:setVertTextAlign("leading");
    obj.labbaseField12:setWordWrap(true);
    obj.labbaseField12:setTextTrimming("none");
    obj.labbaseField12:setFontSize(13);


				self.baseField12:setHeight(self.edtbaseField12:getHeight() + self.labbaseField12:getHeight() + self.linbaseField12:getHeight());
			


    obj.baseField13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField13:setParent(obj.flowLayout24);
    obj.baseField13:setHeight(50);
    obj.baseField13:setMinScaledWidth(100);
    obj.baseField13:setMinWidth(150);
    obj.baseField13:setMaxWidth(300);
    obj.baseField13:setMaxScaledWidth(233);
    obj.baseField13:setAvoidScale(true);
    obj.baseField13:setName("baseField13");
    obj.baseField13:setMargins({left=0, right=1, top=0});

    obj.edtbaseField13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField13:setParent(obj.baseField13);
    obj.edtbaseField13:setName("edtbaseField13");
    obj.edtbaseField13:setAlign("top");
    obj.edtbaseField13:setField("cabelo");
    obj.edtbaseField13:setTransparent(true);
    obj.edtbaseField13:setFontSize(19);

    obj.linbaseField13 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.linbaseField13:setParent(obj.baseField13);
    obj.linbaseField13:setName("linbaseField13");
    obj.linbaseField13:setAlign("top");
    obj.linbaseField13:setStrokeColor("#FFFFFF50");
    obj.linbaseField13:setStrokeSize(1);

    obj.labbaseField13 = GUI.fromHandle(_obj_newObject("label"));
    obj.labbaseField13:setParent(obj.baseField13);
    obj.labbaseField13:setName("labbaseField13");
    obj.labbaseField13:setAlign("top");
    obj.labbaseField13:setText("CABELO");
    obj.labbaseField13:setVertTextAlign("leading");
    obj.labbaseField13:setWordWrap(true);
    obj.labbaseField13:setTextTrimming("none");
    obj.labbaseField13:setFontSize(13);


				self.baseField13:setHeight(self.edtbaseField13:getHeight() + self.labbaseField13:getHeight() + self.linbaseField13:getHeight());
			


    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout23);
    obj.flowPart27:setMinWidth(195);
    obj.flowPart27:setMaxWidth(195);
    obj.flowPart27:setHeight(240);
    obj.flowPart27:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart27:setName("flowPart27");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart27);
    obj.edit16:setAlign("top");
    obj.edit16:setField("nomeFaccao");
    obj.edit16:setMargins({bottom=5});
    obj.edit16:setFontSize(16);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart27);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setStrokeColor("#FFFFFF50");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setHeight(1);
    obj.horzLine2:setName("horzLine2");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.flowPart27);
    obj.rectangle11:setWidth(176);
    obj.rectangle11:setHeight(176);
    obj.rectangle11:setColor("#404040");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setName("rectangle11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle11);
    obj.rectangle12:setLeft(3);
    obj.rectangle12:setTop(3);
    obj.rectangle12:setWidth(170);
    obj.rectangle12:setHeight(170);
    obj.rectangle12:setColor("#323232");
    obj.rectangle12:setName("rectangle12");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle12);
    obj.label34:setAlign("client");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setVertTextAlign("center");
    obj.label34:setFontSize(15);
    obj.label34:setText("<Facção>");
    obj.label34:setName("label34");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.rectangle12);
    obj.image6:setField("imagemFaccao");
    obj.image6:setAlign("client");
    obj.image6:setEditable(true);
    obj.image6:setStyle("autoFit");
    obj.image6:setName("image6");

    obj.flowLineBreak12 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak12:setParent(obj.flowLayout23);
    obj.flowLineBreak12:setName("flowLineBreak12");

    obj.flowLayout25 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout25:setParent(obj.flowLayout23);
    obj.flowLayout25:setMinWidth(200);
    obj.flowLayout25:setMaxWidth(600);
    obj.flowLayout25:setAutoHeight(true);
    obj.flowLayout25:setMaxControlsPerLine(2);
    obj.flowLayout25:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowLayout25:setName("flowLayout25");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout25);
    obj.flowPart28:setMinWidth(125);
    obj.flowPart28:setMaxWidth(300);
    obj.flowPart28:setHeight(160);
    obj.flowPart28:setMargins({top=15, right=7});
    obj.flowPart28:setName("flowPart28");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart28);
    obj.label35:setHeight(20);
    obj.label35:setAlign("top");
    obj.label35:setText("CARACTERÍSTICAS");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setVertTextAlign("leading");
    obj.label35:setWordWrap(true);
    obj.label35:setTextTrimming("none");
    obj.label35:setFontSize(13);
    obj.label35:setName("label35");

    obj.horzLine3 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine3:setParent(obj.flowPart28);
    obj.horzLine3:setAlign("top");
    obj.horzLine3:setStrokeColor("#FFFFFF50");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setHeight(1);
    obj.horzLine3:setName("horzLine3");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.flowPart28);
    obj.textEditor5:setField("caracteristicas");
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setName("textEditor5");
    obj.textEditor5:setFontSize(17);

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout25);
    obj.flowPart29:setMinWidth(125);
    obj.flowPart29:setMaxWidth(300);
    obj.flowPart29:setHeight(160);
    obj.flowPart29:setMargins({top=15, right=7});
    obj.flowPart29:setName("flowPart29");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart29);
    obj.label36:setHeight(20);
    obj.label36:setAlign("top");
    obj.label36:setText("TRAÇOS DE PERSONALIDADE");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setVertTextAlign("leading");
    obj.label36:setWordWrap(true);
    obj.label36:setTextTrimming("none");
    obj.label36:setFontSize(13);
    obj.label36:setName("label36");

    obj.horzLine4 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine4:setParent(obj.flowPart29);
    obj.horzLine4:setAlign("top");
    obj.horzLine4:setStrokeColor("#FFFFFF50");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setHeight(1);
    obj.horzLine4:setName("horzLine4");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.flowPart29);
    obj.textEditor6:setField("tracosDePersonalidade");
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setName("textEditor6");
    obj.textEditor6:setFontSize(17);

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout25);
    obj.flowPart30:setMinWidth(125);
    obj.flowPart30:setMaxWidth(300);
    obj.flowPart30:setHeight(160);
    obj.flowPart30:setMargins({top=15, right=7});
    obj.flowPart30:setName("flowPart30");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart30);
    obj.label37:setHeight(20);
    obj.label37:setAlign("top");
    obj.label37:setText("IDEAIS");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setVertTextAlign("leading");
    obj.label37:setWordWrap(true);
    obj.label37:setTextTrimming("none");
    obj.label37:setFontSize(13);
    obj.label37:setName("label37");

    obj.horzLine5 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine5:setParent(obj.flowPart30);
    obj.horzLine5:setAlign("top");
    obj.horzLine5:setStrokeColor("#FFFFFF50");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setHeight(1);
    obj.horzLine5:setName("horzLine5");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.flowPart30);
    obj.textEditor7:setField("ideais");
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setName("textEditor7");
    obj.textEditor7:setFontSize(17);

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout25);
    obj.flowPart31:setMinWidth(125);
    obj.flowPart31:setMaxWidth(300);
    obj.flowPart31:setHeight(160);
    obj.flowPart31:setMargins({top=15, right=7});
    obj.flowPart31:setName("flowPart31");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart31);
    obj.label38:setHeight(20);
    obj.label38:setAlign("top");
    obj.label38:setText("VÍNCULOS");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setVertTextAlign("leading");
    obj.label38:setWordWrap(true);
    obj.label38:setTextTrimming("none");
    obj.label38:setFontSize(13);
    obj.label38:setName("label38");

    obj.horzLine6 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine6:setParent(obj.flowPart31);
    obj.horzLine6:setAlign("top");
    obj.horzLine6:setStrokeColor("#FFFFFF50");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setHeight(1);
    obj.horzLine6:setName("horzLine6");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.flowPart31);
    obj.textEditor8:setField("vinculos");
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setName("textEditor8");
    obj.textEditor8:setFontSize(17);

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout25);
    obj.flowPart32:setMinWidth(125);
    obj.flowPart32:setMaxWidth(300);
    obj.flowPart32:setHeight(160);
    obj.flowPart32:setMargins({top=15, right=7});
    obj.flowPart32:setName("flowPart32");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart32);
    obj.label39:setHeight(20);
    obj.label39:setAlign("top");
    obj.label39:setText("FRAQUEZAS");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setVertTextAlign("leading");
    obj.label39:setWordWrap(true);
    obj.label39:setTextTrimming("none");
    obj.label39:setFontSize(13);
    obj.label39:setName("label39");

    obj.horzLine7 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine7:setParent(obj.flowPart32);
    obj.horzLine7:setAlign("top");
    obj.horzLine7:setStrokeColor("#FFFFFF50");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setHeight(1);
    obj.horzLine7:setName("horzLine7");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.flowPart32);
    obj.textEditor9:setField("fraquezas");
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setName("textEditor9");
    obj.textEditor9:setFontSize(17);

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout25);
    obj.flowPart33:setMinWidth(125);
    obj.flowPart33:setMaxWidth(300);
    obj.flowPart33:setHeight(160);
    obj.flowPart33:setMargins({top=15, right=7});
    obj.flowPart33:setName("flowPart33");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart33);
    obj.label40:setHeight(20);
    obj.label40:setAlign("top");
    obj.label40:setText("IDIOMAS");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setVertTextAlign("leading");
    obj.label40:setWordWrap(true);
    obj.label40:setTextTrimming("none");
    obj.label40:setFontSize(13);
    obj.label40:setName("label40");

    obj.horzLine8 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine8:setParent(obj.flowPart33);
    obj.horzLine8:setAlign("top");
    obj.horzLine8:setStrokeColor("#FFFFFF50");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setHeight(1);
    obj.horzLine8:setName("horzLine8");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.flowPart33);
    obj.textEditor10:setField("idiomas");
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setName("textEditor10");
    obj.textEditor10:setFontSize(17);

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout23);
    obj.flowPart34:setMinWidth(200);
    obj.flowPart34:setMaxWidth(500);
    obj.flowPart34:setHeight(510);
    obj.flowPart34:setAlign("right");
    obj.flowPart34:setVertAlign("trailing");
    obj.flowPart34:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart34:setName("flowPart34");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart34);
    obj.label41:setHeight(20);
    obj.label41:setAlign("top");
    obj.label41:setText("HISTÓRIA");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setVertTextAlign("leading");
    obj.label41:setWordWrap(true);
    obj.label41:setTextTrimming("none");
    obj.label41:setFontSize(13);
    obj.label41:setName("label41");

    obj.horzLine9 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine9:setParent(obj.flowPart34);
    obj.horzLine9:setAlign("top");
    obj.horzLine9:setStrokeColor("#FFFFFF50");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setHeight(1);
    obj.horzLine9:setName("horzLine9");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.flowPart34);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("historia");
    obj.textEditor11:setWidth(500);
    obj.textEditor11:setHeight(400);
    obj.textEditor11:setName("textEditor11");
    obj.textEditor11:setFontSize(17);

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart34);
    obj.label42:setAlign("bottom");
    obj.label42:setText("Ficha feita por: Gustavo Müller (PericlesDaFarofa)");
    obj.label42:setFontSize(12);
    lfm_setPropAsString(obj.label42, "fontStyle",  "italic");
    obj.label42:setWidth(300);
    obj.label42:setMargins({top=5});
    obj.label42:setName("label42");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.pagPrincipal);
    obj.tab3:setTitle("Anotações");
    obj.tab3:setName("tab3");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.tab3);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setFontColor("white");
    obj.textEditor12:setFontSize(17);
    obj.textEditor12:setField("anotacoesPersonagem");
    obj.textEditor12:setName("textEditor12");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            recalcArmadura();
            		
            		if sheet.backgroundCustomURL ~= nil then
            			self.imagemFundo.src = sheet.backgroundCustomURL;
            			self.imagemFundoCaracteristicas.src = sheet.backgroundCustomURL;
            		else
            			self.imagemFundo.src = "/model/images/backgrounds/default.jpg";
            			self.imagemFundoCaracteristicas.src = "/model/images/backgrounds/default.jpg";
            		end;
        end, obj);

    obj._e_event1 = obj.trocarFundo:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popFundo");
            					local popControle = self:findControlByName("trocarFundo");
            					
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:show("bottomCenter", popControle);
            					else
            						showMessage("Não foi encontrada a janela de seleção de fundos.");
            					end;
        end, obj);

    obj._e_event2 = obj.edit2:addEventListener("onClick",
        function (_)
            
            			local minhaMesa = Firecast.getMesaDe(sheet);
            			local chat = minhaMesa.chat;
            			local rolagem = 2 + (sheet.forcaDadoBonus or 0) .. 'd6';
            			
            			if sheet.forca ~= nil and sheet.forca ~= 0 then
            				rolagem = rolagem .. ' + ' .. sheet.forca;
            			end;
            				
            			chat:rolarDados(rolagem, 'Força');
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (_)
            
            			local minhaMesa = Firecast.getMesaDe(sheet);
            			local chat = minhaMesa.chat;
            			local rolagem = 2 + (sheet.forcaDadoBonus or 0) .. 'd6';
            			
            			if sheet.forca ~= nil and sheet.forca ~= 0 then
            				rolagem = rolagem .. ' + ' .. sheet.forca;
            			end;
            				
            			chat:rolarDados(rolagem, 'Força');
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            
            			local expr = newValue or 0;
            			local getValue = assert(load('return ' .. expr));
            			local result = getValue();
            			
            			if result == 0 then
            				sheet.forca = '';
            			else
            				sheet.forca = result;
            			end;
        end, obj);

    obj._e_event5 = obj.edit5:addEventListener("onClick",
        function (_)
            
            			local minhaMesa = Firecast.getMesaDe(sheet);
            			local chat = minhaMesa.chat;
            			local rolagem = 2 + (sheet.agilidadeDadoBonus or 0) .. 'd6';
            			
            			if sheet.agilidade ~= nil and sheet.agilidade ~= 0 then
            				rolagem = rolagem .. ' + ' .. sheet.agilidade;
            			end;
            				
            			chat:rolarDados(rolagem, 'Agilidade');
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (_)
            
            			local minhaMesa = Firecast.getMesaDe(sheet);
            			local chat = minhaMesa.chat;
            			local rolagem = 2 + (sheet.agilidadeDadoBonus or 0) .. 'd6';
            			
            			if sheet.agilidade ~= nil and sheet.agilidade ~= 0 then
            				rolagem = rolagem .. ' + ' .. sheet.agilidade;
            			end;
            				
            			chat:rolarDados(rolagem, 'Agilidade');
        end, obj);

    obj._e_event7 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            
            			local expr = newValue or 0;
            			local getValue = assert(load('return ' .. expr));
            			local result = getValue();
            			
            			if result == 0 then
            				sheet.agilidade = '';
            			else
            				sheet.agilidade = result;
            			end;
        end, obj);

    obj._e_event8 = obj.edit8:addEventListener("onClick",
        function (_)
            
            			local minhaMesa = Firecast.getMesaDe(sheet);
            			local chat = minhaMesa.chat;
            			local rolagem = 2 + (sheet.inteligenciaDadoBonus or 0) .. 'd6';
            			
            			if sheet.inteligencia ~= nil and sheet.inteligencia ~= 0 then
            				rolagem = rolagem .. ' + ' .. sheet.inteligencia;
            			end;
            				
            			chat:rolarDados(rolagem, 'Inteligência');
        end, obj);

    obj._e_event9 = obj.button3:addEventListener("onClick",
        function (_)
            
            			local minhaMesa = Firecast.getMesaDe(sheet);
            			local chat = minhaMesa.chat;
            			local rolagem = 2 + (sheet.inteligenciaDadoBonus or 0) .. 'd6';
            			
            			if sheet.inteligencia ~= nil and sheet.inteligencia ~= 0 then
            				rolagem = rolagem .. ' + ' .. sheet.inteligencia;
            			end;
            				
            			chat:rolarDados(rolagem, 'Inteligência');
        end, obj);

    obj._e_event10 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            
            			local expr = newValue or 0;
            			local getValue = assert(load('return ' .. expr));
            			local result = getValue();
            			
            			if result == 0 then
            				sheet.inteligencia = '';
            			else
            				sheet.inteligencia = result;
            			end;
        end, obj);

    obj._e_event11 = obj.edit11:addEventListener("onClick",
        function (_)
            
            			local minhaMesa = Firecast.getMesaDe(sheet);
            			local chat = minhaMesa.chat;
            			local rolagem = 2 + (sheet.vontadeDadoBonus or 0) .. 'd6';
            			
            			if sheet.vontade ~= nil and sheet.vontade ~= 0 then
            				rolagem = rolagem .. ' + ' .. sheet.vontade;
            			end;
            				
            			chat:rolarDados(rolagem, 'Vontade');
        end, obj);

    obj._e_event12 = obj.button4:addEventListener("onClick",
        function (_)
            
            			local minhaMesa = Firecast.getMesaDe(sheet);
            			local chat = minhaMesa.chat;
            			local rolagem = 2 + (sheet.vontadeDadoBonus or 0) .. 'd6';
            			
            			if sheet.vontade ~= nil and sheet.vontade ~= 0 then
            				rolagem = rolagem .. ' + ' .. sheet.vontade;
            			end;
            				
            			chat:rolarDados(rolagem, 'Vontade');
        end, obj);

    obj._e_event13 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            
            			local expr = newValue or 0;
            			local getValue = assert(load('return ' .. expr));
            			local result = getValue();
            			
            			if result == 0 then
            				sheet.vontade = '';
            			else
            				sheet.vontade = result;
            			end;
        end, obj);

    obj._e_event14 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcDeslocAndCorrida();
        end, obj);

    obj._e_event15 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcDeslocAndCorrida();
        end, obj);

    obj._e_event16 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if oldValue == nil and (sheet.vidaMax or nil) == nil then
            							sheet.vidaMax = newValue;
            						elseif newValue == nil then
            							sheet.vidaMax = nil;
            						elseif newValue > sheet.vidaMax then
            							sheet.vidaMax = newValue;
            						end;
        end, obj);

    obj._e_event17 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if oldValue == nil and (sheet.manaMax or nil) == nil then
            							sheet.manaMax = newValue;
            						elseif newValue == nil then
            							sheet.manaMax = nil;
            						elseif newValue > sheet.manaMax then
            							sheet.manaMax = newValue;
            						end;
        end, obj);

    obj._e_event18 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event19 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event20 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event21 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
            						recalcCarga();
        end, obj);

    obj._e_event22 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
            						recalcDeslocAndCorrida();
        end, obj);

    obj._e_event23 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event24 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event25 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet.fundoPreviewCombobox ~= nil and sheet.fundoPreviewCombobox ~= "" then
            									self.imagemFundo.src = self.fundoPreview.src;
            									self.imagemFundoCaracteristicas.src = self.fundoPreview.src;
            										
            									sheet.backgroundCustomURL = self.fundoPreview.src;
            								end;
            							
            								self.popFundo:close();
        end, obj);

    obj._e_event26 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet.fundoPreviewURLCustomizada ~= nil and sheet.fundoPreviewURLCustomizada ~= "" then
            									self.imagemFundo.src = sheet.fundoPreviewURLCustomizada;
            									self.imagemFundoCaracteristicas.src = sheet.fundoPreviewURLCustomizada;
            									
            									sheet.backgroundCustomURL = sheet.fundoPreviewURLCustomizada;
            								end;
            							
            								self.popFundo:close();
        end, obj);

    obj._e_event27 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.fundoPreview.src = "/model/images/backgrounds/" .. (sheet.fundoPreviewCombobox or "default") .. ".jpg";
        end, obj);

    obj._e_event28 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcCarga();
        end, obj);

    obj._e_event29 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclHabilidades:append();
        end, obj);

    obj._e_event30 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcCargaInventario();
        end, obj);

    obj._e_event31 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcDeslocAndCorrida();
        end, obj);

    obj._e_event32 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcDeslocAndCorrida();
        end, obj);

    obj._e_event33 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event34 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcCargaInventario();
        end, obj);

    obj._e_event35 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event36 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcCargaInventario();
        end, obj);

    obj._e_event37 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclArmas:append();
        end, obj);

    obj._e_event38 = obj.rclArmas:addEventListener("onItemRemoved",
        function (_, node, form)
            recalcCargaInventario();
        end, obj);

    obj._e_event39 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclArmaduras:append();
        end, obj);

    obj._e_event40 = obj.rclArmaduras:addEventListener("onItemRemoved",
        function (_, node, form)
            recalcArmadura(); recalcCargaInventario(); recalcDeslocAndCorrida();
        end, obj);

    obj._e_event41 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclItens:append();
        end, obj);

    obj._e_event42 = obj.rclItens:addEventListener("onItemRemoved",
        function (_, node, form)
            recalcCargaInventario();
        end, obj);

    function obj:_releaseEvents()
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

        if self.edtdefenseField3 ~= nil then self.edtdefenseField3:destroy(); self.edtdefenseField3 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowLayout22 ~= nil then self.flowLayout22:destroy(); self.flowLayout22 = nil; end;
        if self.flowLayout24 ~= nil then self.flowLayout24:destroy(); self.flowLayout24 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.defenseField11 ~= nil then self.defenseField11:destroy(); self.defenseField11 = nil; end;
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.baseField5 ~= nil then self.baseField5:destroy(); self.baseField5 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.labdefenseField12 ~= nil then self.labdefenseField12:destroy(); self.labdefenseField12 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.flowLayout19 ~= nil then self.flowLayout19:destroy(); self.flowLayout19 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.lindefenseField7 ~= nil then self.lindefenseField7:destroy(); self.lindefenseField7 = nil; end;
        if self.edtbaseField9 ~= nil then self.edtbaseField9:destroy(); self.edtbaseField9 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.defenseField9 ~= nil then self.defenseField9:destroy(); self.defenseField9 = nil; end;
        if self.linbaseField11 ~= nil then self.linbaseField11:destroy(); self.linbaseField11 = nil; end;
        if self.linbaseField12 ~= nil then self.linbaseField12:destroy(); self.linbaseField12 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.labdefenseField5 ~= nil then self.labdefenseField5:destroy(); self.labdefenseField5 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.labbaseField12 ~= nil then self.labbaseField12:destroy(); self.labbaseField12 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.lindefenseField2 ~= nil then self.lindefenseField2:destroy(); self.lindefenseField2 = nil; end;
        if self.defenseField1 ~= nil then self.defenseField1:destroy(); self.defenseField1 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.baseField7 ~= nil then self.baseField7:destroy(); self.baseField7 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.lindefenseField4 ~= nil then self.lindefenseField4:destroy(); self.lindefenseField4 = nil; end;
        if self.rclHabilidades ~= nil then self.rclHabilidades:destroy(); self.rclHabilidades = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.popInfoFieldfnArmadura ~= nil then self.popInfoFieldfnArmadura:destroy(); self.popInfoFieldfnArmadura = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.trocarFundo ~= nil then self.trocarFundo:destroy(); self.trocarFundo = nil; end;
        if self.flowLayout16 ~= nil then self.flowLayout16:destroy(); self.flowLayout16 = nil; end;
        if self.rclItens ~= nil then self.rclItens:destroy(); self.rclItens = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.baseField2 ~= nil then self.baseField2:destroy(); self.baseField2 = nil; end;
        if self.formVerso ~= nil then self.formVerso:destroy(); self.formVerso = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.labdefenseField1 ~= nil then self.labdefenseField1:destroy(); self.labdefenseField1 = nil; end;
        if self.resourceField1 ~= nil then self.resourceField1:destroy(); self.resourceField1 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.rclArmaduras ~= nil then self.rclArmaduras:destroy(); self.rclArmaduras = nil; end;
        if self.edtbaseField13 ~= nil then self.edtbaseField13:destroy(); self.edtbaseField13 = nil; end;
        if self.edtdefenseField6 ~= nil then self.edtdefenseField6:destroy(); self.edtdefenseField6 = nil; end;
        if self.labbaseField9 ~= nil then self.labbaseField9:destroy(); self.labbaseField9 = nil; end;
        if self.popInfoFielddificuldadeHab ~= nil then self.popInfoFielddificuldadeHab:destroy(); self.popInfoFielddificuldadeHab = nil; end;
        if self.linbaseField5 ~= nil then self.linbaseField5:destroy(); self.linbaseField5 = nil; end;
        if self.edtdefenseField13 ~= nil then self.edtdefenseField13:destroy(); self.edtdefenseField13 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.popInfoFieldmanaHab ~= nil then self.popInfoFieldmanaHab:destroy(); self.popInfoFieldmanaHab = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowLayout23 ~= nil then self.flowLayout23:destroy(); self.flowLayout23 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edtresourceField1Max ~= nil then self.edtresourceField1Max:destroy(); self.edtresourceField1Max = nil; end;
        if self.baseField13 ~= nil then self.baseField13:destroy(); self.baseField13 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.labdefenseField4 ~= nil then self.labdefenseField4:destroy(); self.labdefenseField4 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.popInfoFielddistanciaArma ~= nil then self.popInfoFielddistanciaArma:destroy(); self.popInfoFielddistanciaArma = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.linresourceField2 ~= nil then self.linresourceField2:destroy(); self.linresourceField2 = nil; end;
        if self.labdefenseField8 ~= nil then self.labdefenseField8:destroy(); self.labdefenseField8 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.linresourceField1Max ~= nil then self.linresourceField1Max:destroy(); self.linresourceField1Max = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.popInfoFieldcustoItem ~= nil then self.popInfoFieldcustoItem:destroy(); self.popInfoFieldcustoItem = nil; end;
        if self.imagemFundoCaracteristicas ~= nil then self.imagemFundoCaracteristicas:destroy(); self.imagemFundoCaracteristicas = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edtbaseField3 ~= nil then self.edtbaseField3:destroy(); self.edtbaseField3 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.linbaseField9 ~= nil then self.linbaseField9:destroy(); self.linbaseField9 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.lindefenseField12 ~= nil then self.lindefenseField12:destroy(); self.lindefenseField12 = nil; end;
        if self.linbaseField7 ~= nil then self.linbaseField7:destroy(); self.linbaseField7 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.baseField10 ~= nil then self.baseField10:destroy(); self.baseField10 = nil; end;
        if self.edtdefenseField1 ~= nil then self.edtdefenseField1:destroy(); self.edtdefenseField1 = nil; end;
        if self.popInfoFieldduracaoHab ~= nil then self.popInfoFieldduracaoHab:destroy(); self.popInfoFieldduracaoHab = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edtresourceField1 ~= nil then self.edtresourceField1:destroy(); self.edtresourceField1 = nil; end;
        if self.defenseField14 ~= nil then self.defenseField14:destroy(); self.defenseField14 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.defenseField3 ~= nil then self.defenseField3:destroy(); self.defenseField3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.baseField9 ~= nil then self.baseField9:destroy(); self.baseField9 = nil; end;
        if self.popInfoFieldtipoArma ~= nil then self.popInfoFieldtipoArma:destroy(); self.popInfoFieldtipoArma = nil; end;
        if self.lindefenseField5 ~= nil then self.lindefenseField5:destroy(); self.lindefenseField5 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.labbaseField10 ~= nil then self.labbaseField10:destroy(); self.labbaseField10 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.lindefenseField6 ~= nil then self.lindefenseField6:destroy(); self.lindefenseField6 = nil; end;
        if self.baseField1 ~= nil then self.baseField1:destroy(); self.baseField1 = nil; end;
        if self.baseField3 ~= nil then self.baseField3:destroy(); self.baseField3 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edtdefenseField11 ~= nil then self.edtdefenseField11:destroy(); self.edtdefenseField11 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.baseField8 ~= nil then self.baseField8:destroy(); self.baseField8 = nil; end;
        if self.edtbaseField11 ~= nil then self.edtbaseField11:destroy(); self.edtbaseField11 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.labresourceField2 ~= nil then self.labresourceField2:destroy(); self.labresourceField2 = nil; end;
        if self.lindefenseField13 ~= nil then self.lindefenseField13:destroy(); self.lindefenseField13 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.popInfoFieldcustoArmadura ~= nil then self.popInfoFieldcustoArmadura:destroy(); self.popInfoFieldcustoArmadura = nil; end;
        if self.defenseField7 ~= nil then self.defenseField7:destroy(); self.defenseField7 = nil; end;
        if self.edtresourceField2Max ~= nil then self.edtresourceField2Max:destroy(); self.edtresourceField2Max = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.labdefenseField13 ~= nil then self.labdefenseField13:destroy(); self.labdefenseField13 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.defenseField4 ~= nil then self.defenseField4:destroy(); self.defenseField4 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edtdefenseField7 ~= nil then self.edtdefenseField7:destroy(); self.edtdefenseField7 = nil; end;
        if self.flowLineBreak12 ~= nil then self.flowLineBreak12:destroy(); self.flowLineBreak12 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.lindefenseField14 ~= nil then self.lindefenseField14:destroy(); self.lindefenseField14 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.labdefenseField9 ~= nil then self.labdefenseField9:destroy(); self.labdefenseField9 = nil; end;
        if self.linbaseField13 ~= nil then self.linbaseField13:destroy(); self.linbaseField13 = nil; end;
        if self.defenseField12 ~= nil then self.defenseField12:destroy(); self.defenseField12 = nil; end;
        if self.edtbaseField4 ~= nil then self.edtbaseField4:destroy(); self.edtbaseField4 = nil; end;
        if self.labequipmentHeader1 ~= nil then self.labequipmentHeader1:destroy(); self.labequipmentHeader1 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.linequipmentHeader2 ~= nil then self.linequipmentHeader2:destroy(); self.linequipmentHeader2 = nil; end;
        if self.edtdefenseField4 ~= nil then self.edtdefenseField4:destroy(); self.edtdefenseField4 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.linequipmentHeader3 ~= nil then self.linequipmentHeader3:destroy(); self.linequipmentHeader3 = nil; end;
        if self.linbaseField10 ~= nil then self.linbaseField10:destroy(); self.linbaseField10 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.pagPrincipal ~= nil then self.pagPrincipal:destroy(); self.pagPrincipal = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.popInfoFieldtipoHab ~= nil then self.popInfoFieldtipoHab:destroy(); self.popInfoFieldtipoHab = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.labbaseField11 ~= nil then self.labbaseField11:destroy(); self.labbaseField11 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.linbaseField6 ~= nil then self.linbaseField6:destroy(); self.linbaseField6 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.linbaseField4 ~= nil then self.linbaseField4:destroy(); self.linbaseField4 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.flowLayout18 ~= nil then self.flowLayout18:destroy(); self.flowLayout18 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edtdefenseField8 ~= nil then self.edtdefenseField8:destroy(); self.edtdefenseField8 = nil; end;
        if self.flowLayout15 ~= nil then self.flowLayout15:destroy(); self.flowLayout15 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.lindefenseField9 ~= nil then self.lindefenseField9:destroy(); self.lindefenseField9 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.defenseField10 ~= nil then self.defenseField10:destroy(); self.defenseField10 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.defenseField13 ~= nil then self.defenseField13:destroy(); self.defenseField13 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.linequipmentHeader1 ~= nil then self.linequipmentHeader1:destroy(); self.linequipmentHeader1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edtdefenseField10 ~= nil then self.edtdefenseField10:destroy(); self.edtdefenseField10 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edtbaseField12 ~= nil then self.edtbaseField12:destroy(); self.edtbaseField12 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edtdefenseField5 ~= nil then self.edtdefenseField5:destroy(); self.edtdefenseField5 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.popInfoFieldpesoItem ~= nil then self.popInfoFieldpesoItem:destroy(); self.popInfoFieldpesoItem = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edtdefenseField2 ~= nil then self.edtdefenseField2:destroy(); self.edtdefenseField2 = nil; end;
        if self.flowLayout20 ~= nil then self.flowLayout20:destroy(); self.flowLayout20 = nil; end;
        if self.labbaseField5 ~= nil then self.labbaseField5:destroy(); self.labbaseField5 = nil; end;
        if self.labdefenseField11 ~= nil then self.labdefenseField11:destroy(); self.labdefenseField11 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.flowLayout25 ~= nil then self.flowLayout25:destroy(); self.flowLayout25 = nil; end;
        if self.labbaseField7 ~= nil then self.labbaseField7:destroy(); self.labbaseField7 = nil; end;
        if self.popInfoFieldfnArma ~= nil then self.popInfoFieldfnArma:destroy(); self.popInfoFieldfnArma = nil; end;
        if self.baseField6 ~= nil then self.baseField6:destroy(); self.baseField6 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.popArma ~= nil then self.popArma:destroy(); self.popArma = nil; end;
        if self.popInfoFieldalcanceHab ~= nil then self.popInfoFieldalcanceHab:destroy(); self.popInfoFieldalcanceHab = nil; end;
        if self.labbaseField8 ~= nil then self.labbaseField8:destroy(); self.labbaseField8 = nil; end;
        if self.edtbaseField6 ~= nil then self.edtbaseField6:destroy(); self.edtbaseField6 = nil; end;
        if self.labdefenseField6 ~= nil then self.labdefenseField6:destroy(); self.labdefenseField6 = nil; end;
        if self.linresourceField1 ~= nil then self.linresourceField1:destroy(); self.linresourceField1 = nil; end;
        if self.baseField4 ~= nil then self.baseField4:destroy(); self.baseField4 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.labresourceField2Max ~= nil then self.labresourceField2Max:destroy(); self.labresourceField2Max = nil; end;
        if self.lindefenseField8 ~= nil then self.lindefenseField8:destroy(); self.lindefenseField8 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowLayout17 ~= nil then self.flowLayout17:destroy(); self.flowLayout17 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edtbaseField8 ~= nil then self.edtbaseField8:destroy(); self.edtbaseField8 = nil; end;
        if self.resourceField2 ~= nil then self.resourceField2:destroy(); self.resourceField2 = nil; end;
        if self.popInfoFieldpesoArma ~= nil then self.popInfoFieldpesoArma:destroy(); self.popInfoFieldpesoArma = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.lindefenseField11 ~= nil then self.lindefenseField11:destroy(); self.lindefenseField11 = nil; end;
        if self.popInfoFieldcustoArma ~= nil then self.popInfoFieldcustoArma:destroy(); self.popInfoFieldcustoArma = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.flowLayout21 ~= nil then self.flowLayout21:destroy(); self.flowLayout21 = nil; end;
        if self.lindefenseField3 ~= nil then self.lindefenseField3:destroy(); self.lindefenseField3 = nil; end;
        if self.labbaseField3 ~= nil then self.labbaseField3:destroy(); self.labbaseField3 = nil; end;
        if self.popInfoFieldpesoArmadura ~= nil then self.popInfoFieldpesoArmadura:destroy(); self.popInfoFieldpesoArmadura = nil; end;
        if self.edtdefenseField9 ~= nil then self.edtdefenseField9:destroy(); self.edtdefenseField9 = nil; end;
        if self.baseField12 ~= nil then self.baseField12:destroy(); self.baseField12 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.labdefenseField3 ~= nil then self.labdefenseField3:destroy(); self.labdefenseField3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.popItem ~= nil then self.popItem:destroy(); self.popItem = nil; end;
        if self.labequipmentHeader3 ~= nil then self.labequipmentHeader3:destroy(); self.labequipmentHeader3 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.labdefenseField7 ~= nil then self.labdefenseField7:destroy(); self.labdefenseField7 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.labbaseField13 ~= nil then self.labbaseField13:destroy(); self.labbaseField13 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.labbaseField2 ~= nil then self.labbaseField2:destroy(); self.labbaseField2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.labbaseField6 ~= nil then self.labbaseField6:destroy(); self.labbaseField6 = nil; end;
        if self.edtbaseField1 ~= nil then self.edtbaseField1:destroy(); self.edtbaseField1 = nil; end;
        if self.labresourceField1Max ~= nil then self.labresourceField1Max:destroy(); self.labresourceField1Max = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.labbaseField4 ~= nil then self.labbaseField4:destroy(); self.labbaseField4 = nil; end;
        if self.edtbaseField5 ~= nil then self.edtbaseField5:destroy(); self.edtbaseField5 = nil; end;
        if self.fundoPreview ~= nil then self.fundoPreview:destroy(); self.fundoPreview = nil; end;
        if self.edtbaseField7 ~= nil then self.edtbaseField7:destroy(); self.edtbaseField7 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.linbaseField3 ~= nil then self.linbaseField3:destroy(); self.linbaseField3 = nil; end;
        if self.lindefenseField1 ~= nil then self.lindefenseField1:destroy(); self.lindefenseField1 = nil; end;
        if self.edtdefenseField14 ~= nil then self.edtdefenseField14:destroy(); self.edtdefenseField14 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.linbaseField8 ~= nil then self.linbaseField8:destroy(); self.linbaseField8 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.popInfoFielddefesaArmadura ~= nil then self.popInfoFielddefesaArmadura:destroy(); self.popInfoFielddefesaArmadura = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.edtbaseField10 ~= nil then self.edtbaseField10:destroy(); self.edtbaseField10 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.defenseField8 ~= nil then self.defenseField8:destroy(); self.defenseField8 = nil; end;
        if self.edtbaseField2 ~= nil then self.edtbaseField2:destroy(); self.edtbaseField2 = nil; end;
        if self.labdefenseField14 ~= nil then self.labdefenseField14:destroy(); self.labdefenseField14 = nil; end;
        if self.linresourceField2Max ~= nil then self.linresourceField2Max:destroy(); self.linresourceField2Max = nil; end;
        if self.defenseField5 ~= nil then self.defenseField5:destroy(); self.defenseField5 = nil; end;
        if self.lindefenseField10 ~= nil then self.lindefenseField10:destroy(); self.lindefenseField10 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.baseField11 ~= nil then self.baseField11:destroy(); self.baseField11 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.popWeaponAttribute ~= nil then self.popWeaponAttribute:destroy(); self.popWeaponAttribute = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.labdefenseField2 ~= nil then self.labdefenseField2:destroy(); self.labdefenseField2 = nil; end;
        if self.edtdefenseField12 ~= nil then self.edtdefenseField12:destroy(); self.edtdefenseField12 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.labdefenseField10 ~= nil then self.labdefenseField10:destroy(); self.labdefenseField10 = nil; end;
        if self.imagemFundo ~= nil then self.imagemFundo:destroy(); self.imagemFundo = nil; end;
        if self.popInfoFielddanoArma ~= nil then self.popInfoFielddanoArma:destroy(); self.popInfoFielddanoArma = nil; end;
        if self.labbaseField1 ~= nil then self.labbaseField1:destroy(); self.labbaseField1 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.labresourceField1 ~= nil then self.labresourceField1:destroy(); self.labresourceField1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.defenseField2 ~= nil then self.defenseField2:destroy(); self.defenseField2 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.popFundo ~= nil then self.popFundo:destroy(); self.popFundo = nil; end;
        if self.linbaseField2 ~= nil then self.linbaseField2:destroy(); self.linbaseField2 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.defenseField6 ~= nil then self.defenseField6:destroy(); self.defenseField6 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.popArmadura ~= nil then self.popArmadura:destroy(); self.popArmadura = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.labequipmentHeader2 ~= nil then self.labequipmentHeader2:destroy(); self.labequipmentHeader2 = nil; end;
        if self.edtresourceField2 ~= nil then self.edtresourceField2:destroy(); self.edtresourceField2 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.formFicha ~= nil then self.formFicha:destroy(); self.formFicha = nil; end;
        if self.linbaseField1 ~= nil then self.linbaseField1:destroy(); self.linbaseField1 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMB3e()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMB3e();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMB3e = {
    newEditor = newfrmMB3e, 
    new = newfrmMB3e, 
    name = "frmMB3e", 
    dataType = "datatype.mb.3.4.1.gustavo.muller", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Mighty Blade 3e", 
    description=""};

frmMB3e = _frmMB3e;
Firecast.registrarForm(_frmMB3e);
Firecast.registrarDataType(_frmMB3e);

return _frmMB3e;
