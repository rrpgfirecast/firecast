require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMB2e()
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
    obj:setName("frmMB2e");
    obj:setFormType("sheetTemplate");
    obj:setDataType("datatype.mb.2.5.gustavo.muller");
    obj:setTitle("Mighty Blade 2e");
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


		local function recalcArmadura()
			if self ~= nil and sheet ~= nil then
				-- ADICIONA FORÇA/AGILIDADE
				local defesaNova = 5;
				defesaNova = defesaNova + math.max((sheet.forca or 0), (sheet.agilidade or 0));

				-- ADICIONA BÔNUS
				defesaNova = defesaNova + (sheet.defesaBonus or 0);
				
				-- ADICIONA BÔNUS DE ARMADURAS
				local bonusArmadura = 0;
				local armaduras = NDB.getChildNodes(sheet.armaduras);
				
				for i = 1, #armaduras, 1 do								
					bonusArmadura = bonusArmadura + (armaduras[i].defesaArmadura or 0);
				end;
				
				-- LIMITA O BÔNUS DE ARMADURA PARA 4.
				bonusArmadura = math.min(bonusArmadura, 4);
				
				defesaNova = defesaNova + bonusArmadura;
				
				-- SETA A DEFESA NOVA CALCULADA
				sheet.defesa = defesaNova;
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
    obj.flowPart1:setMinWidth(450);
    obj.flowPart1:setMaxWidth(450);
    obj.flowPart1:setHeight(200);
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
    obj.baseField1:setMaxWidth(233);
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
    obj.edtbaseField1:setFontSize(17);

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
    obj.baseField2:setMaxWidth(233);
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
    obj.edtbaseField2:setFontSize(17);

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
			


    obj.baseField3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField3:setParent(obj.flowLayout2);
    obj.baseField3:setHeight(50);
    obj.baseField3:setMinScaledWidth(100);
    obj.baseField3:setMinWidth(150);
    obj.baseField3:setMaxWidth(233);
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
    obj.edtbaseField3:setFontSize(17);

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
    obj.baseField4:setMaxWidth(233);
    obj.baseField4:setMaxScaledWidth(233);
    obj.baseField4:setAvoidScale(true);
    obj.baseField4:setName("baseField4");
    obj.baseField4:setMargins({left=0, right=1, top=0});

    obj.edtbaseField4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField4:setParent(obj.baseField4);
    obj.edtbaseField4:setName("edtbaseField4");
    obj.edtbaseField4:setAlign("top");
    obj.edtbaseField4:setField("nivel");
    obj.edtbaseField4:setTransparent(true);
    obj.edtbaseField4:setFontSize(17);

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
			


    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowLayout2);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("exp1");
    obj.checkBox1:setName("checkBox1");
    obj.checkBox1:setFontSize(13);

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.flowLayout2);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setField("exp2");
    obj.checkBox2:setName("checkBox2");
    obj.checkBox2:setFontSize(13);

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.flowLayout2);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setField("exp3");
    obj.checkBox3:setName("checkBox3");
    obj.checkBox3:setFontSize(13);

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.flowLayout2);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setField("exp4");
    obj.checkBox4:setName("checkBox4");
    obj.checkBox4:setFontSize(13);

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.flowLayout2);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setField("exp5");
    obj.checkBox5:setName("checkBox5");
    obj.checkBox5:setFontSize(13);

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.flowLayout2);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setField("exp6");
    obj.checkBox6:setName("checkBox6");
    obj.checkBox6:setFontSize(13);

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.flowLayout2);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setField("exp7");
    obj.checkBox7:setName("checkBox7");
    obj.checkBox7:setFontSize(13);

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.flowLayout2);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setField("exp8");
    obj.checkBox8:setName("checkBox8");
    obj.checkBox8:setFontSize(13);

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.flowLayout2);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setField("exp9");
    obj.checkBox9:setName("checkBox9");
    obj.checkBox9:setFontSize(13);

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.flowLayout2);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setField("exp10");
    obj.checkBox10:setName("checkBox10");
    obj.checkBox10:setFontSize(13);

    obj.baseField5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField5:setParent(obj.flowLayout2);
    obj.baseField5:setHeight(50);
    obj.baseField5:setMinScaledWidth(100);
    obj.baseField5:setMinWidth(150);
    obj.baseField5:setMaxWidth(450);
    obj.baseField5:setMaxScaledWidth(450);
    obj.baseField5:setAvoidScale(true);
    obj.baseField5:setName("baseField5");
    obj.baseField5:setMargins({left=0, right=1, top=0});

    obj.edtbaseField5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField5:setParent(obj.baseField5);
    obj.edtbaseField5:setName("edtbaseField5");
    obj.edtbaseField5:setAlign("top");
    obj.edtbaseField5:setField("motivacao");
    obj.edtbaseField5:setTransparent(true);
    obj.edtbaseField5:setFontSize(17);

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
    obj.labbaseField5:setText("MOTIVAÇÃO");
    obj.labbaseField5:setVertTextAlign("leading");
    obj.labbaseField5:setWordWrap(true);
    obj.labbaseField5:setTextTrimming("none");
    obj.labbaseField5:setFontSize(13);


				self.baseField5:setHeight(self.edtbaseField5:getHeight() + self.labbaseField5:getHeight() + self.linbaseField5:getHeight());
			


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
    obj.labresourceField1Max:setText("VIDA MÁXIMA");
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
    obj.labresourceField2Max:setText("MANA MÁXIMA");
    obj.labresourceField2Max:setVertTextAlign("leading");
    obj.labresourceField2Max:setWordWrap(true);
    obj.labresourceField2Max:setTextTrimming("none");
    obj.labresourceField2Max:setFontSize(13);

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout4);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.defenseField1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField1:setParent(obj.flowLayout4);
    obj.defenseField1:setHeight(50);
    obj.defenseField1:setMinScaledWidth(100);
    obj.defenseField1:setMinWidth(25);
    obj.defenseField1:setMaxWidth(100);
    obj.defenseField1:setMaxScaledWidth(100);
    obj.defenseField1:setAvoidScale(true);
    obj.defenseField1:setName("defenseField1");
    obj.defenseField1:setMargins({left=0, right=1, top=12});

    obj.edtdefenseField1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField1:setParent(obj.defenseField1);
    obj.edtdefenseField1:setName("edtdefenseField1");
    obj.edtdefenseField1:setAlign("top");
    obj.edtdefenseField1:setField("defesaBonus");
    obj.edtdefenseField1:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField1, "fontStyle",  "");
    obj.edtdefenseField1:setHorzTextAlign("center");
    obj.edtdefenseField1:setFontSize(25);
    obj.edtdefenseField1:setCanFocus(true);

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
    obj.labdefenseField1:setText("DEFESA BÔNUS");
    obj.labdefenseField1:setHorzTextAlign("center");
    obj.labdefenseField1:setVertTextAlign("leading");
    obj.labdefenseField1:setWordWrap(true);
    obj.labdefenseField1:setTextTrimming("none");
    obj.labdefenseField1:setFontSize(13);
    lfm_setPropAsString(obj.labdefenseField1, "fontStyle",  "");


				self.defenseField1:setHeight(self.edtdefenseField1:getHeight() + self.labdefenseField1:getHeight() + self.lindefenseField1:getHeight());
			


    obj.defenseField2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.defenseField2:setParent(obj.flowLayout4);
    obj.defenseField2:setHeight(50);
    obj.defenseField2:setMinScaledWidth(100);
    obj.defenseField2:setMinWidth(25);
    obj.defenseField2:setMaxWidth(100);
    obj.defenseField2:setMaxScaledWidth(100);
    obj.defenseField2:setAvoidScale(true);
    obj.defenseField2:setName("defenseField2");
    obj.defenseField2:setMargins({left=0, right=1, top=12});

    obj.edtdefenseField2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtdefenseField2:setParent(obj.defenseField2);
    obj.edtdefenseField2:setName("edtdefenseField2");
    obj.edtdefenseField2:setAlign("top");
    obj.edtdefenseField2:setField("defesa");
    obj.edtdefenseField2:setTransparent(true);
    lfm_setPropAsString(obj.edtdefenseField2, "fontStyle",  "bold");
    obj.edtdefenseField2:setHorzTextAlign("center");
    obj.edtdefenseField2:setFontSize(25);
    obj.edtdefenseField2:setCanFocus(false);

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
    obj.labdefenseField2:setText("DEFESA");
    obj.labdefenseField2:setHorzTextAlign("center");
    obj.labdefenseField2:setVertTextAlign("leading");
    obj.labdefenseField2:setWordWrap(true);
    obj.labdefenseField2:setTextTrimming("none");
    obj.labdefenseField2:setFontSize(13);
    lfm_setPropAsString(obj.labdefenseField2, "fontStyle",  "bold");


				self.defenseField2:setHeight(self.edtdefenseField2:getHeight() + self.labdefenseField2:getHeight() + self.lindefenseField2:getHeight());
			


    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout1);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flowLayout1);
    obj.dataLink5:setField("vida");
    obj.dataLink5:setDefaultValue("60");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowLayout1);
    obj.dataLink6:setField("mana");
    obj.dataLink6:setDefaultValue("60");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowLayout1);
    obj.dataLink7:setField("defesaBonus");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout1);
    obj.dataLink8:setField("forca");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.flowLayout1);
    obj.dataLink9:setField("agilidade");
    obj.dataLink9:setName("dataLink9");

    obj.popFundo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popFundo:setParent(obj.flowLayout1);
    obj.popFundo:setName("popFundo");
    obj.popFundo:setWidth(375);
    obj.popFundo:setHeight(360);
    obj.popFundo:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popFundo, "autoScopeNode",  "true");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.popFundo);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxControlsPerLine(2);
    obj.flowLayout5:setMargins({bottom=4});
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setName("flowLayout5");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowLayout5);
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
    obj.fundoPreview:setParent(obj.flowLayout5);
    obj.fundoPreview:setName("fundoPreview");
    obj.fundoPreview:setWidth(320);
    obj.fundoPreview:setHeight(180);
    obj.fundoPreview:setAlign("top");
    obj.fundoPreview:setStyle("autoFit");
    obj.fundoPreview:setMargins({top=10});

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.flowLayout5);
    obj.label10:setAlign("top");
    obj.label10:setText("URL Customizada:");
    obj.label10:setWidth(200);
    obj.label10:setHeight(30);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");
    obj.label10:setFontSize(20);

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.flowLayout5);
    obj.edit13:setAlign("top");
    obj.edit13:setField("fundoPreviewURLCustomizada");
    obj.edit13:setWidth(200);
    obj.edit13:setHeight(30);
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(20);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.flowLayout5);
    obj.button5:setAlign("top");
    obj.button5:setText("Aplicar");
    obj.button5:setWidth(200);
    obj.button5:setHeight(30);
    obj.button5:setMargins({top=10});
    obj.button5:setName("button5");
    obj.button5:setFontSize(15);

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.flowLayout5);
    obj.button6:setAlign("top");
    obj.button6:setText("Aplicar URL");
    obj.button6:setWidth(200);
    obj.button6:setHeight(30);
    obj.button6:setName("button6");
    obj.button6:setFontSize(15);

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowLayout5);
    obj.dataLink10:setField("fundoPreviewCombobox");
    obj.dataLink10:setName("dataLink10");

    obj.popHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.flowLayout1);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(340);
    obj.popHabilidade:setHeight(340);
    obj.popHabilidade:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHabilidade, "autoScopeNode",  "false");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.popHabilidade);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxControlsPerLine(2);
    obj.flowLayout6:setMargins({bottom=4});
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout6);
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

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout6);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout6);
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
    obj.flowPart5:setParent(obj.flowLayout6);
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
    obj.flowPart6:setParent(obj.flowLayout6);
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
    obj.flowPart7:setParent(obj.flowLayout6);
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

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowLayout1);
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMaxControlsPerLine(1);
    obj.flowLayout7:setWidth(400);
    obj.flowLayout7:setVertAlign("leading");
    obj.flowLayout7:setName("flowLayout7");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout7);
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
    obj.label17:setText("PROFICIÊNCIAS");
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

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.flowPart8);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("proficiencias");
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setFontSize(17);

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowLayout7);
    obj.flowLayout8:setMinWidth(400);
    obj.flowLayout8:setMaxWidth(400);
    obj.flowLayout8:setAlign("top");
    obj.flowLayout8:setHorzAlign("leading");
    obj.flowLayout8:setVertAlign("leading");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setLineSpacing(10);
    obj.flowLayout8:setAvoidScale(true);
    obj.flowLayout8:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowLayout8:setMargins({left=5, top=5, right=5, bottom=5});
    obj.flowLayout8:setName("flowLayout8");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.flowLayout8);
    obj.button7:setText("Nova Habilidade");
    obj.button7:setWidth(150);
    obj.button7:setHeight(30);
    obj.button7:setName("button7");
    obj.button7:setFontSize(15);

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout8);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.rclHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidades:setParent(obj.flowLayout8);
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

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.popArma);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxControlsPerLine(2);
    obj.flowLayout9:setMargins({bottom=4});
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setName("flowLayout9");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout9);
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
    obj.flowPart10:setParent(obj.flowLayout9);
    obj.flowPart10:setMinWidth(30);
    obj.flowPart10:setMaxWidth(400);
    obj.flowPart10:setHeight(40);
    obj.flowPart10:setName("flowPart10");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.flowPart10);
    obj.label19:setAlign("top");
    obj.label19:setFontSize(12);
    obj.label19:setText("GRUPO");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setWordWrap(true);
    obj.label19:setTextTrimming("none");
    obj.label19:setAutoSize(true);
    obj.label19:setName("label19");

    obj.popInfoFieldgrupoArma = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldgrupoArma:setParent(obj.flowPart10);
    obj.popInfoFieldgrupoArma:setName("popInfoFieldgrupoArma");
    obj.popInfoFieldgrupoArma:setAlign("client");
    obj.popInfoFieldgrupoArma:setField("grupoArma");
    obj.popInfoFieldgrupoArma:setHorzTextAlign("center");
    obj.popInfoFieldgrupoArma:setFontSize(15);
    obj.popInfoFieldgrupoArma:setType("text");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout9);
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
    obj.flowPart12:setParent(obj.flowLayout9);
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
    obj.flowPart13:setParent(obj.flowLayout9);
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
    obj.flowPart14:setParent(obj.flowLayout9);
    obj.flowPart14:setMinWidth(30);
    obj.flowPart14:setMaxWidth(400);
    obj.flowPart14:setHeight(40);
    obj.flowPart14:setName("flowPart14");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart14);
    obj.label23:setAlign("top");
    obj.label23:setFontSize(12);
    obj.label23:setText("ALCANCE");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setWordWrap(true);
    obj.label23:setTextTrimming("none");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.popInfoFieldalcanceArma = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldalcanceArma:setParent(obj.flowPart14);
    obj.popInfoFieldalcanceArma:setName("popInfoFieldalcanceArma");
    obj.popInfoFieldalcanceArma:setAlign("client");
    obj.popInfoFieldalcanceArma:setField("alcanceArma");
    obj.popInfoFieldalcanceArma:setHorzTextAlign("center");
    obj.popInfoFieldalcanceArma:setFontSize(15);
    obj.popInfoFieldalcanceArma:setType("text");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout9);
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

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popArma);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("descricao");
    obj.textEditor3:setFontSize(15);
    obj.textEditor3:setName("textEditor3");

    obj.popArmadura = GUI.fromHandle(_obj_newObject("popup"));
    obj.popArmadura:setParent(obj.flowLayout1);
    obj.popArmadura:setName("popArmadura");
    obj.popArmadura:setWidth(275);
    obj.popArmadura:setHeight(300);
    obj.popArmadura:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popArmadura, "autoScopeNode",  "false");

    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.popArmadura);
    obj.flowLayout10:setAlign("top");
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setMaxControlsPerLine(2);
    obj.flowLayout10:setMargins({bottom=4});
    obj.flowLayout10:setHorzAlign("center");
    obj.flowLayout10:setName("flowLayout10");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout10);
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
    obj.flowPart17:setParent(obj.flowLayout10);
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
    obj.flowPart18:setParent(obj.flowLayout10);
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
    obj.flowPart19:setParent(obj.flowLayout10);
    obj.flowPart19:setMinWidth(30);
    obj.flowPart19:setMaxWidth(400);
    obj.flowPart19:setHeight(40);
    obj.flowPart19:setName("flowPart19");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart19);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(12);
    obj.label29:setText("AGILIDADE MÁXIMA");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.popInfoFieldagilidadeMaximaArmadura = GUI.fromHandle(_obj_newObject("edit"));
    obj.popInfoFieldagilidadeMaximaArmadura:setParent(obj.flowPart19);
    obj.popInfoFieldagilidadeMaximaArmadura:setName("popInfoFieldagilidadeMaximaArmadura");
    obj.popInfoFieldagilidadeMaximaArmadura:setAlign("client");
    obj.popInfoFieldagilidadeMaximaArmadura:setField("agilidadeMaximaArmadura");
    obj.popInfoFieldagilidadeMaximaArmadura:setHorzTextAlign("center");
    obj.popInfoFieldagilidadeMaximaArmadura:setFontSize(15);
    obj.popInfoFieldagilidadeMaximaArmadura:setType("text");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout10);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.flowLayout10);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setText("Isolante Mágico");
    obj.checkBox11:setField("isolanteMagicoArmadura");
    obj.checkBox11:setHeight(20);
    obj.checkBox11:setWidth(130);
    obj.checkBox11:setName("checkBox11");
    obj.checkBox11:setFontSize(13);

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.flowLayout10);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setText("Escudo");
    obj.checkBox12:setField("escudoArmadura");
    obj.checkBox12:setHeight(20);
    obj.checkBox12:setWidth(130);
    obj.checkBox12:setName("checkBox12");
    obj.checkBox12:setFontSize(13);

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

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.popArmadura);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("descricao");
    obj.textEditor4:setFontSize(15);
    obj.textEditor4:setName("textEditor4");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.popArmadura);
    obj.label31:setAlign("bottom");
    obj.label31:setFontSize(10.5);
    obj.label31:setText("*A soma da armadura com escudo não pode exceder +4.");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.popArmadura);
    obj.dataLink11:setField("defesaArmadura");
    obj.dataLink11:setName("dataLink11");

    obj.popItem = GUI.fromHandle(_obj_newObject("popup"));
    obj.popItem:setParent(obj.flowLayout1);
    obj.popItem:setName("popItem");
    obj.popItem:setWidth(275);
    obj.popItem:setHeight(300);
    obj.popItem:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popItem, "autoScopeNode",  "false");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.popItem);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(12);
    obj.label32:setText("CUSTO");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.popItem);
    obj.edit14:setAlign("top");
    obj.edit14:setField("custoItem");
    obj.edit14:setFontSize(15);
    obj.edit14:setHeight(25);
    obj.edit14:setMargins({bottom=5});
    obj.edit14:setName("edit14");

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

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.popItem);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("descricaoItem");
    obj.textEditor5:setFontSize(15);
    obj.textEditor5:setName("textEditor5");

    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowLayout1);
    obj.flowLayout11:setMinWidth(400);
    obj.flowLayout11:setMaxWidth(525);
    obj.flowLayout11:setAlign("top");
    obj.flowLayout11:setHorzAlign("leading");
    obj.flowLayout11:setVertAlign("leading");
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setLineSpacing(10);
    obj.flowLayout11:setAvoidScale(true);
    obj.flowLayout11:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowLayout11:setMargins({left=5, top=5, right=5, bottom=5});
    obj.flowLayout11:setName("flowLayout11");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout11);
    obj.flowPart20:setMinWidth(30);
    obj.flowPart20:setMaxWidth(500);
    obj.flowPart20:setName("flowPart20");

    obj.labequipmentHeader1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labequipmentHeader1:setParent(obj.flowPart20);
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
    obj.linequipmentHeader1:setParent(obj.flowPart20);
    obj.linequipmentHeader1:setName("linequipmentHeader1");
    obj.linequipmentHeader1:setAlign("top");
    obj.linequipmentHeader1:setStrokeColor("#FFFFFF50");
    obj.linequipmentHeader1:setStrokeSize(1);
    obj.linequipmentHeader1:setHeight(1);

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.flowPart20);
    obj.button8:setText("Nova Arma");
    obj.button8:setAlign("left");
    obj.button8:setWidth(150);
    obj.button8:setHeight(30);
    obj.button8:setMargins({left=0, right=5, top=0});
    obj.button8:setName("button8");
    obj.button8:setFontSize(15);

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout11);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.rclArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.flowLayout11);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("armas");
    obj.rclArmas:setTemplateForm("frmArma");
    obj.rclArmas:setAutoHeight(true);
    obj.rclArmas:setWidth(1300);

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout11);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout11);
    obj.flowPart21:setMinWidth(30);
    obj.flowPart21:setMaxWidth(500);
    obj.flowPart21:setName("flowPart21");

    obj.labequipmentHeader2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labequipmentHeader2:setParent(obj.flowPart21);
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
    obj.linequipmentHeader2:setParent(obj.flowPart21);
    obj.linequipmentHeader2:setName("linequipmentHeader2");
    obj.linequipmentHeader2:setAlign("top");
    obj.linequipmentHeader2:setStrokeColor("#FFFFFF50");
    obj.linequipmentHeader2:setStrokeSize(1);
    obj.linequipmentHeader2:setHeight(1);

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.flowPart21);
    obj.button9:setText("Nova Armadura");
    obj.button9:setAlign("left");
    obj.button9:setWidth(150);
    obj.button9:setHeight(30);
    obj.button9:setMargins({left=0, right=5, top=0});
    obj.button9:setName("button9");
    obj.button9:setFontSize(15);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.flowPart21);
    obj.image3:setSRC("/model/images/coin.png");
    obj.image3:setAlign("right");
    obj.image3:setWidth(20);
    obj.image3:setHeight(20);
    obj.image3:setMargins({left=0, right=10, top=0});
    obj.image3:setName("image3");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.flowPart21);
    obj.edit15:setField("moedas");
    obj.edit15:setAlign("right");
    obj.edit15:setWidth(100);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setFontSize(20);

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout11);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.rclArmaduras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArmaduras:setParent(obj.flowLayout11);
    obj.rclArmaduras:setName("rclArmaduras");
    obj.rclArmaduras:setField("armaduras");
    obj.rclArmaduras:setTemplateForm("frmArmadura");
    obj.rclArmaduras:setAutoHeight(true);
    obj.rclArmaduras:setWidth(1300);

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout11);
    obj.flowPart22:setMinWidth(30);
    obj.flowPart22:setMaxWidth(500);
    obj.flowPart22:setName("flowPart22");

    obj.labequipmentHeader3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labequipmentHeader3:setParent(obj.flowPart22);
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
    obj.linequipmentHeader3:setParent(obj.flowPart22);
    obj.linequipmentHeader3:setName("linequipmentHeader3");
    obj.linequipmentHeader3:setAlign("top");
    obj.linequipmentHeader3:setStrokeColor("#FFFFFF50");
    obj.linequipmentHeader3:setStrokeSize(1);
    obj.linequipmentHeader3:setHeight(1);

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.flowPart22);
    obj.button10:setText("Novo Item");
    obj.button10:setAlign("left");
    obj.button10:setWidth(150);
    obj.button10:setHeight(30);
    obj.button10:setMargins({left=0, right=5, top=0});
    obj.button10:setName("button10");
    obj.button10:setFontSize(15);

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout11);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.rclItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclItens:setParent(obj.flowLayout11);
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

    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.scrollBox2);
    obj.flowLayout12:setAlign("top");
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setHorzAlign("center");
    obj.flowLayout12:setMargins({left=20, right=20, top=20, bottom=20});
    obj.flowLayout12:setMaxControlsPerLine(3);
    obj.flowLayout12:setAvoidScale(true);
    obj.flowLayout12:setName("flowLayout12");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.flowLayout12);
    obj.image4:setSRC("/model/images/logo.png");
    obj.image4:setWidth(277);
    obj.image4:setHeight(146);
    obj.image4:setMargins({left=0, right=25, top=0});
    obj.image4:setName("image4");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout12);
    obj.flowPart23:setMinWidth(450);
    obj.flowPart23:setMaxWidth(450);
    obj.flowPart23:setHeight(200);
    obj.flowPart23:setVertAlign("center");
    obj.flowPart23:setMargins({left=0, right=20, top=0});
    obj.flowPart23:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart23:setName("flowPart23");

    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowPart23);
    obj.flowLayout13:setWidth(600);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setAlign("client");
    obj.flowLayout13:setLineSpacing(10);
    obj.flowLayout13:setAvoidScale(true);
    obj.flowLayout13:setName("flowLayout13");

    obj.baseField6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField6:setParent(obj.flowLayout13);
    obj.baseField6:setHeight(50);
    obj.baseField6:setMinScaledWidth(100);
    obj.baseField6:setMinWidth(150);
    obj.baseField6:setMaxWidth(233);
    obj.baseField6:setMaxScaledWidth(233);
    obj.baseField6:setAvoidScale(true);
    obj.baseField6:setName("baseField6");
    obj.baseField6:setMargins({left=0, right=1, top=0});

    obj.edtbaseField6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField6:setParent(obj.baseField6);
    obj.edtbaseField6:setName("edtbaseField6");
    obj.edtbaseField6:setAlign("top");
    obj.edtbaseField6:setField("idade");
    obj.edtbaseField6:setTransparent(true);
    obj.edtbaseField6:setFontSize(17);

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
    obj.labbaseField6:setText("IDADE");
    obj.labbaseField6:setVertTextAlign("leading");
    obj.labbaseField6:setWordWrap(true);
    obj.labbaseField6:setTextTrimming("none");
    obj.labbaseField6:setFontSize(13);


				self.baseField6:setHeight(self.edtbaseField6:getHeight() + self.labbaseField6:getHeight() + self.linbaseField6:getHeight());
			


    obj.baseField7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField7:setParent(obj.flowLayout13);
    obj.baseField7:setHeight(50);
    obj.baseField7:setMinScaledWidth(100);
    obj.baseField7:setMinWidth(150);
    obj.baseField7:setMaxWidth(233);
    obj.baseField7:setMaxScaledWidth(233);
    obj.baseField7:setAvoidScale(true);
    obj.baseField7:setName("baseField7");
    obj.baseField7:setMargins({left=0, right=1, top=0});

    obj.edtbaseField7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField7:setParent(obj.baseField7);
    obj.edtbaseField7:setName("edtbaseField7");
    obj.edtbaseField7:setAlign("top");
    obj.edtbaseField7:setField("altura");
    obj.edtbaseField7:setTransparent(true);
    obj.edtbaseField7:setFontSize(17);

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
    obj.labbaseField7:setText("ALTURA");
    obj.labbaseField7:setVertTextAlign("leading");
    obj.labbaseField7:setWordWrap(true);
    obj.labbaseField7:setTextTrimming("none");
    obj.labbaseField7:setFontSize(13);


				self.baseField7:setHeight(self.edtbaseField7:getHeight() + self.labbaseField7:getHeight() + self.linbaseField7:getHeight());
			


    obj.baseField8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField8:setParent(obj.flowLayout13);
    obj.baseField8:setHeight(50);
    obj.baseField8:setMinScaledWidth(100);
    obj.baseField8:setMinWidth(150);
    obj.baseField8:setMaxWidth(233);
    obj.baseField8:setMaxScaledWidth(233);
    obj.baseField8:setAvoidScale(true);
    obj.baseField8:setName("baseField8");
    obj.baseField8:setMargins({left=0, right=1, top=0});

    obj.edtbaseField8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField8:setParent(obj.baseField8);
    obj.edtbaseField8:setName("edtbaseField8");
    obj.edtbaseField8:setAlign("top");
    obj.edtbaseField8:setField("peso");
    obj.edtbaseField8:setTransparent(true);
    obj.edtbaseField8:setFontSize(17);

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
    obj.labbaseField8:setText("PESO");
    obj.labbaseField8:setVertTextAlign("leading");
    obj.labbaseField8:setWordWrap(true);
    obj.labbaseField8:setTextTrimming("none");
    obj.labbaseField8:setFontSize(13);


				self.baseField8:setHeight(self.edtbaseField8:getHeight() + self.labbaseField8:getHeight() + self.linbaseField8:getHeight());
			


    obj.baseField9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField9:setParent(obj.flowLayout13);
    obj.baseField9:setHeight(50);
    obj.baseField9:setMinScaledWidth(100);
    obj.baseField9:setMinWidth(150);
    obj.baseField9:setMaxWidth(233);
    obj.baseField9:setMaxScaledWidth(233);
    obj.baseField9:setAvoidScale(true);
    obj.baseField9:setName("baseField9");
    obj.baseField9:setMargins({left=0, right=1, top=0});

    obj.edtbaseField9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField9:setParent(obj.baseField9);
    obj.edtbaseField9:setName("edtbaseField9");
    obj.edtbaseField9:setAlign("top");
    obj.edtbaseField9:setField("olhos");
    obj.edtbaseField9:setTransparent(true);
    obj.edtbaseField9:setFontSize(17);

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
    obj.labbaseField9:setText("OLHOS");
    obj.labbaseField9:setVertTextAlign("leading");
    obj.labbaseField9:setWordWrap(true);
    obj.labbaseField9:setTextTrimming("none");
    obj.labbaseField9:setFontSize(13);


				self.baseField9:setHeight(self.edtbaseField9:getHeight() + self.labbaseField9:getHeight() + self.linbaseField9:getHeight());
			


    obj.baseField10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField10:setParent(obj.flowLayout13);
    obj.baseField10:setHeight(50);
    obj.baseField10:setMinScaledWidth(100);
    obj.baseField10:setMinWidth(150);
    obj.baseField10:setMaxWidth(233);
    obj.baseField10:setMaxScaledWidth(233);
    obj.baseField10:setAvoidScale(true);
    obj.baseField10:setName("baseField10");
    obj.baseField10:setMargins({left=0, right=1, top=0});

    obj.edtbaseField10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField10:setParent(obj.baseField10);
    obj.edtbaseField10:setName("edtbaseField10");
    obj.edtbaseField10:setAlign("top");
    obj.edtbaseField10:setField("pele");
    obj.edtbaseField10:setTransparent(true);
    obj.edtbaseField10:setFontSize(17);

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
    obj.labbaseField10:setText("PELE");
    obj.labbaseField10:setVertTextAlign("leading");
    obj.labbaseField10:setWordWrap(true);
    obj.labbaseField10:setTextTrimming("none");
    obj.labbaseField10:setFontSize(13);


				self.baseField10:setHeight(self.edtbaseField10:getHeight() + self.labbaseField10:getHeight() + self.linbaseField10:getHeight());
			


    obj.baseField11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.baseField11:setParent(obj.flowLayout13);
    obj.baseField11:setHeight(50);
    obj.baseField11:setMinScaledWidth(100);
    obj.baseField11:setMinWidth(150);
    obj.baseField11:setMaxWidth(233);
    obj.baseField11:setMaxScaledWidth(233);
    obj.baseField11:setAvoidScale(true);
    obj.baseField11:setName("baseField11");
    obj.baseField11:setMargins({left=0, right=1, top=0});

    obj.edtbaseField11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtbaseField11:setParent(obj.baseField11);
    obj.edtbaseField11:setName("edtbaseField11");
    obj.edtbaseField11:setAlign("top");
    obj.edtbaseField11:setField("cabelo");
    obj.edtbaseField11:setTransparent(true);
    obj.edtbaseField11:setFontSize(17);

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
    obj.labbaseField11:setText("CABELO");
    obj.labbaseField11:setVertTextAlign("leading");
    obj.labbaseField11:setWordWrap(true);
    obj.labbaseField11:setTextTrimming("none");
    obj.labbaseField11:setFontSize(13);


				self.baseField11:setHeight(self.edtbaseField11:getHeight() + self.labbaseField11:getHeight() + self.linbaseField11:getHeight());
			


    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout12);
    obj.flowPart24:setMinWidth(195);
    obj.flowPart24:setMaxWidth(195);
    obj.flowPart24:setHeight(240);
    obj.flowPart24:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart24:setName("flowPart24");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.flowPart24);
    obj.edit16:setAlign("top");
    obj.edit16:setField("nomeFaccao");
    obj.edit16:setMargins({bottom=5});
    obj.edit16:setFontSize(16);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.flowPart24);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setStrokeColor("#FFFFFF50");
    obj.horzLine2:setStrokeSize(1);
    obj.horzLine2:setHeight(1);
    obj.horzLine2:setName("horzLine2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.flowPart24);
    obj.rectangle3:setWidth(176);
    obj.rectangle3:setHeight(176);
    obj.rectangle3:setColor("#404040");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setName("rectangle3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setLeft(3);
    obj.rectangle4:setTop(3);
    obj.rectangle4:setWidth(170);
    obj.rectangle4:setHeight(170);
    obj.rectangle4:setColor("#323232");
    obj.rectangle4:setName("rectangle4");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle4);
    obj.label34:setAlign("client");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setVertTextAlign("center");
    obj.label34:setFontSize(15);
    obj.label34:setText("<Facção>");
    obj.label34:setName("label34");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle4);
    obj.image5:setField("imagemFaccao");
    obj.image5:setAlign("client");
    obj.image5:setEditable(true);
    obj.image5:setStyle("autoFit");
    obj.image5:setName("image5");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout12);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.flowLayout14 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout14:setParent(obj.flowLayout12);
    obj.flowLayout14:setMinWidth(200);
    obj.flowLayout14:setMaxWidth(600);
    obj.flowLayout14:setAutoHeight(true);
    obj.flowLayout14:setMaxControlsPerLine(2);
    obj.flowLayout14:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowLayout14:setName("flowLayout14");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout14);
    obj.flowPart25:setMinWidth(125);
    obj.flowPart25:setMaxWidth(300);
    obj.flowPart25:setHeight(160);
    obj.flowPart25:setMargins({top=15, right=7});
    obj.flowPart25:setName("flowPart25");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.flowPart25);
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
    obj.horzLine3:setParent(obj.flowPart25);
    obj.horzLine3:setAlign("top");
    obj.horzLine3:setStrokeColor("#FFFFFF50");
    obj.horzLine3:setStrokeSize(1);
    obj.horzLine3:setHeight(1);
    obj.horzLine3:setName("horzLine3");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.flowPart25);
    obj.textEditor6:setField("caracteristicas");
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setName("textEditor6");
    obj.textEditor6:setFontSize(17);

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout14);
    obj.flowPart26:setMinWidth(125);
    obj.flowPart26:setMaxWidth(300);
    obj.flowPart26:setHeight(160);
    obj.flowPart26:setMargins({top=15, right=7});
    obj.flowPart26:setName("flowPart26");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.flowPart26);
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
    obj.horzLine4:setParent(obj.flowPart26);
    obj.horzLine4:setAlign("top");
    obj.horzLine4:setStrokeColor("#FFFFFF50");
    obj.horzLine4:setStrokeSize(1);
    obj.horzLine4:setHeight(1);
    obj.horzLine4:setName("horzLine4");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.flowPart26);
    obj.textEditor7:setField("tracosDePersonalidade");
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setName("textEditor7");
    obj.textEditor7:setFontSize(17);

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout14);
    obj.flowPart27:setMinWidth(125);
    obj.flowPart27:setMaxWidth(300);
    obj.flowPart27:setHeight(160);
    obj.flowPart27:setMargins({top=15, right=7});
    obj.flowPart27:setName("flowPart27");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.flowPart27);
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
    obj.horzLine5:setParent(obj.flowPart27);
    obj.horzLine5:setAlign("top");
    obj.horzLine5:setStrokeColor("#FFFFFF50");
    obj.horzLine5:setStrokeSize(1);
    obj.horzLine5:setHeight(1);
    obj.horzLine5:setName("horzLine5");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.flowPart27);
    obj.textEditor8:setField("ideais");
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setName("textEditor8");
    obj.textEditor8:setFontSize(17);

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout14);
    obj.flowPart28:setMinWidth(125);
    obj.flowPart28:setMaxWidth(300);
    obj.flowPart28:setHeight(160);
    obj.flowPart28:setMargins({top=15, right=7});
    obj.flowPart28:setName("flowPart28");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.flowPart28);
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
    obj.horzLine6:setParent(obj.flowPart28);
    obj.horzLine6:setAlign("top");
    obj.horzLine6:setStrokeColor("#FFFFFF50");
    obj.horzLine6:setStrokeSize(1);
    obj.horzLine6:setHeight(1);
    obj.horzLine6:setName("horzLine6");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.flowPart28);
    obj.textEditor9:setField("vinculos");
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setName("textEditor9");
    obj.textEditor9:setFontSize(17);

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout14);
    obj.flowPart29:setMinWidth(125);
    obj.flowPart29:setMaxWidth(300);
    obj.flowPart29:setHeight(160);
    obj.flowPart29:setMargins({top=15, right=7});
    obj.flowPart29:setName("flowPart29");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.flowPart29);
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
    obj.horzLine7:setParent(obj.flowPart29);
    obj.horzLine7:setAlign("top");
    obj.horzLine7:setStrokeColor("#FFFFFF50");
    obj.horzLine7:setStrokeSize(1);
    obj.horzLine7:setHeight(1);
    obj.horzLine7:setName("horzLine7");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.flowPart29);
    obj.textEditor10:setField("fraquezas");
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setName("textEditor10");
    obj.textEditor10:setFontSize(17);

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout14);
    obj.flowPart30:setMinWidth(125);
    obj.flowPart30:setMaxWidth(300);
    obj.flowPart30:setHeight(160);
    obj.flowPart30:setMargins({top=15, right=7});
    obj.flowPart30:setName("flowPart30");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.flowPart30);
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
    obj.horzLine8:setParent(obj.flowPart30);
    obj.horzLine8:setAlign("top");
    obj.horzLine8:setStrokeColor("#FFFFFF50");
    obj.horzLine8:setStrokeSize(1);
    obj.horzLine8:setHeight(1);
    obj.horzLine8:setName("horzLine8");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.flowPart30);
    obj.textEditor11:setField("idiomas");
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setName("textEditor11");
    obj.textEditor11:setFontSize(17);

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout12);
    obj.flowPart31:setMinWidth(200);
    obj.flowPart31:setMaxWidth(500);
    obj.flowPart31:setHeight(510);
    obj.flowPart31:setAlign("right");
    obj.flowPart31:setVertAlign("trailing");
    obj.flowPart31:setFrameStyle("/model/frames/panel1/frame.xml");
    obj.flowPart31:setName("flowPart31");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.flowPart31);
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
    obj.horzLine9:setParent(obj.flowPart31);
    obj.horzLine9:setAlign("top");
    obj.horzLine9:setStrokeColor("#FFFFFF50");
    obj.horzLine9:setStrokeSize(1);
    obj.horzLine9:setHeight(1);
    obj.horzLine9:setName("horzLine9");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.flowPart31);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("historia");
    obj.textEditor12:setWidth(500);
    obj.textEditor12:setHeight(400);
    obj.textEditor12:setName("textEditor12");
    obj.textEditor12:setFontSize(17);

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.flowPart31);
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

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.tab3);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setFontColor("white");
    obj.textEditor13:setFontSize(17);
    obj.textEditor13:setField("anotacoesPersonagem");
    obj.textEditor13:setName("textEditor13");

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
            if oldValue == nil and (sheet.vidaMax or nil) == nil then
            							sheet.vidaMax = newValue;
            						elseif newValue == nil then
            							sheet.vidaMax = nil;
            						elseif newValue > sheet.vidaMax then
            							sheet.vidaMax = newValue;
            						end;
        end, obj);

    obj._e_event15 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if oldValue == nil and (sheet.manaMax or nil) == nil then
            							sheet.manaMax = newValue;
            						elseif newValue == nil then
            							sheet.manaMax = nil;
            						elseif newValue > sheet.manaMax then
            							sheet.manaMax = newValue;
            						end;
        end, obj);

    obj._e_event16 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event17 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event18 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event19 = obj.button5:addEventListener("onClick",
        function (_)
            if sheet.fundoPreviewCombobox ~= nil and sheet.fundoPreviewCombobox ~= "" then
            									self.imagemFundo.src = self.fundoPreview.src;
            									self.imagemFundoCaracteristicas.src = self.fundoPreview.src;
            										
            									sheet.backgroundCustomURL = self.fundoPreview.src;
            								end;
            							
            								self.popFundo:close();
        end, obj);

    obj._e_event20 = obj.button6:addEventListener("onClick",
        function (_)
            if sheet.fundoPreviewURLCustomizada ~= nil and sheet.fundoPreviewURLCustomizada ~= "" then
            									self.imagemFundo.src = sheet.fundoPreviewURLCustomizada;
            									self.imagemFundoCaracteristicas.src = sheet.fundoPreviewURLCustomizada;
            									
            									sheet.backgroundCustomURL = sheet.fundoPreviewURLCustomizada;
            								end;
            							
            								self.popFundo:close();
        end, obj);

    obj._e_event21 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.fundoPreview.src = "/model/images/backgrounds/" .. (sheet.fundoPreviewCombobox or "default") .. ".jpg";
        end, obj);

    obj._e_event22 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclHabilidades:append();
        end, obj);

    obj._e_event23 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            recalcArmadura();
        end, obj);

    obj._e_event24 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclArmas:append();
        end, obj);

    obj._e_event25 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclArmaduras:append();
        end, obj);

    obj._e_event26 = obj.rclArmaduras:addEventListener("onItemRemoved",
        function (_, node, form)
            recalcArmadura();
        end, obj);

    obj._e_event27 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclItens:append();
        end, obj);

    function obj:_releaseEvents()
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
        if self.horzLine7 ~= nil then self.horzLine7:destroy(); self.horzLine7 = nil; end;
        if self.baseField5 ~= nil then self.baseField5:destroy(); self.baseField5 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.popInfoFieldgrupoArma ~= nil then self.popInfoFieldgrupoArma:destroy(); self.popInfoFieldgrupoArma = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.edtbaseField9 ~= nil then self.edtbaseField9:destroy(); self.edtbaseField9 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.linbaseField11 ~= nil then self.linbaseField11:destroy(); self.linbaseField11 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.lindefenseField2 ~= nil then self.lindefenseField2:destroy(); self.lindefenseField2 = nil; end;
        if self.defenseField1 ~= nil then self.defenseField1:destroy(); self.defenseField1 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.baseField7 ~= nil then self.baseField7:destroy(); self.baseField7 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.rclHabilidades ~= nil then self.rclHabilidades:destroy(); self.rclHabilidades = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.popInfoFieldfnArmadura ~= nil then self.popInfoFieldfnArmadura:destroy(); self.popInfoFieldfnArmadura = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.trocarFundo ~= nil then self.trocarFundo:destroy(); self.trocarFundo = nil; end;
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
        if self.labbaseField9 ~= nil then self.labbaseField9:destroy(); self.labbaseField9 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.popInfoFielddificuldadeHab ~= nil then self.popInfoFielddificuldadeHab:destroy(); self.popInfoFielddificuldadeHab = nil; end;
        if self.linbaseField5 ~= nil then self.linbaseField5:destroy(); self.linbaseField5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.popInfoFieldmanaHab ~= nil then self.popInfoFieldmanaHab:destroy(); self.popInfoFieldmanaHab = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edtresourceField1Max ~= nil then self.edtresourceField1Max:destroy(); self.edtresourceField1Max = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.linresourceField2 ~= nil then self.linresourceField2:destroy(); self.linresourceField2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.linresourceField1Max ~= nil then self.linresourceField1Max:destroy(); self.linresourceField1Max = nil; end;
        if self.imagemFundoCaracteristicas ~= nil then self.imagemFundoCaracteristicas:destroy(); self.imagemFundoCaracteristicas = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edtbaseField3 ~= nil then self.edtbaseField3:destroy(); self.edtbaseField3 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.linbaseField9 ~= nil then self.linbaseField9:destroy(); self.linbaseField9 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.linbaseField7 ~= nil then self.linbaseField7:destroy(); self.linbaseField7 = nil; end;
        if self.baseField10 ~= nil then self.baseField10:destroy(); self.baseField10 = nil; end;
        if self.edtdefenseField1 ~= nil then self.edtdefenseField1:destroy(); self.edtdefenseField1 = nil; end;
        if self.popInfoFieldduracaoHab ~= nil then self.popInfoFieldduracaoHab:destroy(); self.popInfoFieldduracaoHab = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edtresourceField1 ~= nil then self.edtresourceField1:destroy(); self.edtresourceField1 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.flowLayout14 ~= nil then self.flowLayout14:destroy(); self.flowLayout14 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.baseField9 ~= nil then self.baseField9:destroy(); self.baseField9 = nil; end;
        if self.labbaseField10 ~= nil then self.labbaseField10:destroy(); self.labbaseField10 = nil; end;
        if self.popInfoFieldtipoArma ~= nil then self.popInfoFieldtipoArma:destroy(); self.popInfoFieldtipoArma = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.baseField1 ~= nil then self.baseField1:destroy(); self.baseField1 = nil; end;
        if self.baseField3 ~= nil then self.baseField3:destroy(); self.baseField3 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edtbaseField11 ~= nil then self.edtbaseField11:destroy(); self.edtbaseField11 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.baseField8 ~= nil then self.baseField8:destroy(); self.baseField8 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.labresourceField2 ~= nil then self.labresourceField2:destroy(); self.labresourceField2 = nil; end;
        if self.popInfoFieldcustoArmadura ~= nil then self.popInfoFieldcustoArmadura:destroy(); self.popInfoFieldcustoArmadura = nil; end;
        if self.edtresourceField2Max ~= nil then self.edtresourceField2Max:destroy(); self.edtresourceField2Max = nil; end;
        if self.popInfoFieldalcanceArma ~= nil then self.popInfoFieldalcanceArma:destroy(); self.popInfoFieldalcanceArma = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.horzLine3 ~= nil then self.horzLine3:destroy(); self.horzLine3 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edtbaseField4 ~= nil then self.edtbaseField4:destroy(); self.edtbaseField4 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.labequipmentHeader1 ~= nil then self.labequipmentHeader1:destroy(); self.labequipmentHeader1 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.linequipmentHeader2 ~= nil then self.linequipmentHeader2:destroy(); self.linequipmentHeader2 = nil; end;
        if self.linequipmentHeader3 ~= nil then self.linequipmentHeader3:destroy(); self.linequipmentHeader3 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.linbaseField10 ~= nil then self.linbaseField10:destroy(); self.linbaseField10 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.pagPrincipal ~= nil then self.pagPrincipal:destroy(); self.pagPrincipal = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.popInfoFieldtipoHab ~= nil then self.popInfoFieldtipoHab:destroy(); self.popInfoFieldtipoHab = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.labbaseField11 ~= nil then self.labbaseField11:destroy(); self.labbaseField11 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.linbaseField6 ~= nil then self.linbaseField6:destroy(); self.linbaseField6 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.linbaseField4 ~= nil then self.linbaseField4:destroy(); self.linbaseField4 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.linequipmentHeader1 ~= nil then self.linequipmentHeader1:destroy(); self.linequipmentHeader1 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.horzLine8 ~= nil then self.horzLine8:destroy(); self.horzLine8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.edtdefenseField2 ~= nil then self.edtdefenseField2:destroy(); self.edtdefenseField2 = nil; end;
        if self.labbaseField5 ~= nil then self.labbaseField5:destroy(); self.labbaseField5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.horzLine5 ~= nil then self.horzLine5:destroy(); self.horzLine5 = nil; end;
        if self.labbaseField7 ~= nil then self.labbaseField7:destroy(); self.labbaseField7 = nil; end;
        if self.popInfoFieldfnArma ~= nil then self.popInfoFieldfnArma:destroy(); self.popInfoFieldfnArma = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.popArma ~= nil then self.popArma:destroy(); self.popArma = nil; end;
        if self.popInfoFieldalcanceHab ~= nil then self.popInfoFieldalcanceHab:destroy(); self.popInfoFieldalcanceHab = nil; end;
        if self.baseField6 ~= nil then self.baseField6:destroy(); self.baseField6 = nil; end;
        if self.edtbaseField6 ~= nil then self.edtbaseField6:destroy(); self.edtbaseField6 = nil; end;
        if self.labbaseField8 ~= nil then self.labbaseField8:destroy(); self.labbaseField8 = nil; end;
        if self.linresourceField1 ~= nil then self.linresourceField1:destroy(); self.linresourceField1 = nil; end;
        if self.baseField4 ~= nil then self.baseField4:destroy(); self.baseField4 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.labresourceField2Max ~= nil then self.labresourceField2Max:destroy(); self.labresourceField2Max = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edtbaseField8 ~= nil then self.edtbaseField8:destroy(); self.edtbaseField8 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.resourceField2 ~= nil then self.resourceField2:destroy(); self.resourceField2 = nil; end;
        if self.horzLine9 ~= nil then self.horzLine9:destroy(); self.horzLine9 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.popInfoFieldcustoArma ~= nil then self.popInfoFieldcustoArma:destroy(); self.popInfoFieldcustoArma = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.labbaseField3 ~= nil then self.labbaseField3:destroy(); self.labbaseField3 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.labequipmentHeader3 ~= nil then self.labequipmentHeader3:destroy(); self.labequipmentHeader3 = nil; end;
        if self.popItem ~= nil then self.popItem:destroy(); self.popItem = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.labbaseField2 ~= nil then self.labbaseField2:destroy(); self.labbaseField2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.popInfoFieldagilidadeMaximaArmadura ~= nil then self.popInfoFieldagilidadeMaximaArmadura:destroy(); self.popInfoFieldagilidadeMaximaArmadura = nil; end;
        if self.edtbaseField1 ~= nil then self.edtbaseField1:destroy(); self.edtbaseField1 = nil; end;
        if self.labresourceField1Max ~= nil then self.labresourceField1Max:destroy(); self.labresourceField1Max = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.labbaseField4 ~= nil then self.labbaseField4:destroy(); self.labbaseField4 = nil; end;
        if self.edtbaseField5 ~= nil then self.edtbaseField5:destroy(); self.edtbaseField5 = nil; end;
        if self.fundoPreview ~= nil then self.fundoPreview:destroy(); self.fundoPreview = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.labbaseField6 ~= nil then self.labbaseField6:destroy(); self.labbaseField6 = nil; end;
        if self.linbaseField3 ~= nil then self.linbaseField3:destroy(); self.linbaseField3 = nil; end;
        if self.lindefenseField1 ~= nil then self.lindefenseField1:destroy(); self.lindefenseField1 = nil; end;
        if self.edtbaseField7 ~= nil then self.edtbaseField7:destroy(); self.edtbaseField7 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.linbaseField8 ~= nil then self.linbaseField8:destroy(); self.linbaseField8 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.edtbaseField10 ~= nil then self.edtbaseField10:destroy(); self.edtbaseField10 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.popInfoFielddefesaArmadura ~= nil then self.popInfoFielddefesaArmadura:destroy(); self.popInfoFielddefesaArmadura = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.baseField11 ~= nil then self.baseField11:destroy(); self.baseField11 = nil; end;
        if self.edtbaseField2 ~= nil then self.edtbaseField2:destroy(); self.edtbaseField2 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.linresourceField2Max ~= nil then self.linresourceField2Max:destroy(); self.linresourceField2Max = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.popWeaponAttribute ~= nil then self.popWeaponAttribute:destroy(); self.popWeaponAttribute = nil; end;
        if self.horzLine4 ~= nil then self.horzLine4:destroy(); self.horzLine4 = nil; end;
        if self.labdefenseField2 ~= nil then self.labdefenseField2:destroy(); self.labdefenseField2 = nil; end;
        if self.popInfoFielddanoArma ~= nil then self.popInfoFielddanoArma:destroy(); self.popInfoFielddanoArma = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.imagemFundo ~= nil then self.imagemFundo:destroy(); self.imagemFundo = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.labbaseField1 ~= nil then self.labbaseField1:destroy(); self.labbaseField1 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.labresourceField1 ~= nil then self.labresourceField1:destroy(); self.labresourceField1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.defenseField2 ~= nil then self.defenseField2:destroy(); self.defenseField2 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.popFundo ~= nil then self.popFundo:destroy(); self.popFundo = nil; end;
        if self.linbaseField2 ~= nil then self.linbaseField2:destroy(); self.linbaseField2 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.horzLine6 ~= nil then self.horzLine6:destroy(); self.horzLine6 = nil; end;
        if self.popArmadura ~= nil then self.popArmadura:destroy(); self.popArmadura = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.labequipmentHeader2 ~= nil then self.labequipmentHeader2:destroy(); self.labequipmentHeader2 = nil; end;
        if self.edtresourceField2 ~= nil then self.edtresourceField2:destroy(); self.edtresourceField2 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.formFicha ~= nil then self.formFicha:destroy(); self.formFicha = nil; end;
        if self.linbaseField1 ~= nil then self.linbaseField1:destroy(); self.linbaseField1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMB2e()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMB2e();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMB2e = {
    newEditor = newfrmMB2e, 
    new = newfrmMB2e, 
    name = "frmMB2e", 
    dataType = "datatype.mb.2.5.gustavo.muller", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Mighty Blade 2e", 
    description=""};

frmMB2e = _frmMB2e;
Firecast.registrarForm(_frmMB2e);
Firecast.registrarDataType(_frmMB2e);

return _frmMB2e;
