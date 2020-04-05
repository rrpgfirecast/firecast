require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmHabilidades()
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
    obj:setName("frmHabilidades");
    obj:setAlign("client");

    obj.popHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj);
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
    obj.label2:setText("Obtido");
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

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart3);
    obj.label3:setAlign("top");
    obj.label3:setFontSize(10);
    obj.label3:setText("Página");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setTextTrimming("none");
    obj.label3:setAutoSize(true);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("paginaHabilidade");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontSize(12);
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(180);
    obj.flowPart4:setMaxWidth(200);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart4);
    obj.label4:setAlign("top");
    obj.label4:setFontSize(10);
    obj.label4:setText("Livro");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setWordWrap(true);
    obj.label4:setTextTrimming("none");
    obj.label4:setAutoSize(true);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("livroHabilidade");
    obj.edit4:setFontSize(12);
    obj.edit4:setName("edit4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.flowLayout1);
    obj.dataLink1:setField("nivelHabilidade");
    obj.dataLink1:setName("dataLink1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popHabilidade);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.BarPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.BarPopup:setParent(obj);
    obj.BarPopup:setName("BarPopup");
    obj.BarPopup:setWidth(140);
    obj.BarPopup:setHeight(66);
    obj.BarPopup:setBackOpacity(0);
    obj.BarPopup:setMargins({left=4, right=4, top=4, bottom=4});
    lfm_setPropAsString(obj.BarPopup, "autoScopeNode",  "false");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.BarPopup);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("white");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setName("rectangle1");

    obj.PopupBarColor = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.PopupBarColor:setParent(obj.rectangle1);
    obj.PopupBarColor:setAlign("client");
    obj.PopupBarColor:setName("PopupBarColor");
    obj.PopupBarColor:setColor("#808080");
    obj.PopupBarColor:setXradius(5);
    obj.PopupBarColor:setYradius(5);
    obj.PopupBarColor:setOpacity(0.9);

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.PopupBarColor);
    obj.label5:setFontColor("black");
    obj.label5:setMargins({left=6, top=2});
    obj.label5:setAlign("top");
    obj.label5:setText("Valor");
    obj.label5:setField("AtributoBarrinha");
    obj.label5:setFontSize(12);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setTextTrimming("character");
    obj.label5:setName("label5");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.PopupBarColor);
    obj.layout1:setAlign("client");
    obj.layout1:setMargins({top=2, left=4});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(18);
    obj.layout2:setName("layout2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setFontColor("black");
    obj.label6:setAlign("left");
    obj.label6:setText("Atual:  ");
    obj.label6:setHorzTextAlign("trailing");
    obj.label6:setWidth(34);
    obj.label6:setMargins({right=2});
    obj.label6:setFontSize(12);
    obj.label6:setName("label6");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setMargins({left=2});
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setTransparent(false);
    obj.comboBox1:setWidth(40);
    obj.comboBox1:setField("ModificadorBarrinha");
    obj.comboBox1:setItems({'=', '+', '-'});
    obj.comboBox1:setValues({'igual', 'mais', 'menos'});
    obj.comboBox1:setValue("igual");
    obj.comboBox1:setName("comboBox1");

    obj.currentBarValue = GUI.fromHandle(_obj_newObject("edit"));
    obj.currentBarValue:setParent(obj.layout2);
    obj.currentBarValue:setFontColor("white");
    obj.currentBarValue:setMargins({left=2, right=4});
    obj.currentBarValue:setType("number");
    obj.currentBarValue:setAlign("client");
    obj.currentBarValue:setField("ValorMudadoAtualBarrinha");
    obj.currentBarValue:setName("currentBarValue");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(18);
    obj.layout3:setName("layout3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setFontColor("black");
    obj.label7:setAlign("left");
    obj.label7:setText("Max:  ");
    obj.label7:setHorzTextAlign("trailing");
    obj.label7:setWidth(34);
    obj.label7:setMargins({right=2});
    obj.label7:setFontSize(12);
    obj.label7:setName("label7");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout3);
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setMargins({left=2});
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setTransparent(false);
    obj.comboBox2:setWidth(40);
    obj.comboBox2:setField("ModificadorBarrinhaMax");
    obj.comboBox2:setItems({'=', '+', '-'});
    obj.comboBox2:setValues({'igual', 'mais', 'menos'});
    obj.comboBox2:setValue("igual");
    obj.comboBox2:setName("comboBox2");

    obj.maxBarValue = GUI.fromHandle(_obj_newObject("edit"));
    obj.maxBarValue:setParent(obj.layout3);
    obj.maxBarValue:setFontColor("white");
    obj.maxBarValue:setMargins({left=2, right=4});
    obj.maxBarValue:setType("number");
    obj.maxBarValue:setAlign("client");
    obj.maxBarValue:setField("ValorMudadoMaxBarrinha");
    obj.maxBarValue:setName("maxBarValue");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox1);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxColumns(3);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setOrientation("vertical");
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.campoDosTalentosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosTalentosPart:setParent(obj.flowLayout2);
    obj.campoDosTalentosPart:setMinWidth(300);
    obj.campoDosTalentosPart:setMaxWidth(600);
    obj.campoDosTalentosPart:setHeight(25);
    obj.campoDosTalentosPart:setMinScaledWidth(280);
    obj.campoDosTalentosPart:setName("campoDosTalentosPart");
    obj.campoDosTalentosPart:setAdjustHeightToLine(false);
    obj.campoDosTalentosPart:setMargins({left=5});


					rawset(self.campoDosTalentosPart, "_recalcHeight", 					
						function ()
							self.campoDosTalentosPart.height = self.campoDosTalentos.height + 25;
						end);
				


    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.campoDosTalentosPart);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout4);
    obj.button1:setText("+");
    obj.button1:setAlign("left");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setText("TALENTOS");
    obj.label8:setAlign("left");
    obj.label8:setWidth(225);
    obj.label8:setMargins({left=5});
    obj.label8:setName("label8");

    obj.campoDosTalentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosTalentos:setParent(obj.campoDosTalentosPart);
    obj.campoDosTalentos:setName("campoDosTalentos");
    obj.campoDosTalentos:setField("campoDosTalentos");
    obj.campoDosTalentos:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDosTalentos:setAlign("top");
    obj.campoDosTalentos:setLayout("vertical");
    obj.campoDosTalentos:setAutoHeight(true);
    obj.campoDosTalentos:setHitTest(false);
    obj.campoDosTalentos:setMinQt(1);

    obj.campoDosOutrosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosOutrosPart:setParent(obj.flowLayout2);
    obj.campoDosOutrosPart:setMinWidth(300);
    obj.campoDosOutrosPart:setMaxWidth(600);
    obj.campoDosOutrosPart:setHeight(25);
    obj.campoDosOutrosPart:setMinScaledWidth(280);
    obj.campoDosOutrosPart:setName("campoDosOutrosPart");
    obj.campoDosOutrosPart:setAdjustHeightToLine(false);
    obj.campoDosOutrosPart:setMargins({left=5});


					rawset(self.campoDosOutrosPart, "_recalcHeight", 					
						function ()
							self.campoDosOutrosPart.height = self.campoDosOutros.height + 25;
						end);
				


    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.campoDosOutrosPart);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout5);
    obj.button2:setText("+");
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setName("button2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout5);
    obj.label9:setText("OUTROS");
    obj.label9:setAlign("left");
    obj.label9:setWidth(225);
    obj.label9:setMargins({left=5});
    obj.label9:setName("label9");

    obj.campoDosOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosOutros:setParent(obj.campoDosOutrosPart);
    obj.campoDosOutros:setName("campoDosOutros");
    obj.campoDosOutros:setField("campoDosOutros");
    obj.campoDosOutros:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDosOutros:setAlign("top");
    obj.campoDosOutros:setLayout("vertical");
    obj.campoDosOutros:setAutoHeight(true);
    obj.campoDosOutros:setHitTest(false);
    obj.campoDosOutros:setMinQt(1);

    obj.campoDasRacasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasRacasPart:setParent(obj.flowLayout2);
    obj.campoDasRacasPart:setMinWidth(300);
    obj.campoDasRacasPart:setMaxWidth(600);
    obj.campoDasRacasPart:setHeight(25);
    obj.campoDasRacasPart:setMinScaledWidth(280);
    obj.campoDasRacasPart:setName("campoDasRacasPart");
    obj.campoDasRacasPart:setAdjustHeightToLine(false);
    obj.campoDasRacasPart:setMargins({left=5});


					rawset(self.campoDasRacasPart, "_recalcHeight", 					
						function ()
							self.campoDasRacasPart.height = self.campoDasRacas.height + 25;
						end);
				


    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.campoDasRacasPart);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout6);
    obj.button3:setText("+");
    obj.button3:setAlign("left");
    obj.button3:setWidth(30);
    obj.button3:setName("button3");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout6);
    obj.label10:setText("CARACTERISTICAS RACIAIS");
    obj.label10:setAlign("left");
    obj.label10:setWidth(225);
    obj.label10:setMargins({left=5});
    obj.label10:setName("label10");

    obj.campoDasRacas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasRacas:setParent(obj.campoDasRacasPart);
    obj.campoDasRacas:setName("campoDasRacas");
    obj.campoDasRacas:setField("campoDasRacas");
    obj.campoDasRacas:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDasRacas:setAlign("top");
    obj.campoDasRacas:setLayout("vertical");
    obj.campoDasRacas:setAutoHeight(true);
    obj.campoDasRacas:setHitTest(false);
    obj.campoDasRacas:setMinQt(1);

    obj.campoDasCaracteristicasClassePart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasCaracteristicasClassePart:setParent(obj.flowLayout2);
    obj.campoDasCaracteristicasClassePart:setMinWidth(300);
    obj.campoDasCaracteristicasClassePart:setMaxWidth(600);
    obj.campoDasCaracteristicasClassePart:setHeight(25);
    obj.campoDasCaracteristicasClassePart:setMinScaledWidth(280);
    obj.campoDasCaracteristicasClassePart:setName("campoDasCaracteristicasClassePart");
    obj.campoDasCaracteristicasClassePart:setAdjustHeightToLine(false);
    obj.campoDasCaracteristicasClassePart:setMargins({left=5});


					rawset(self.campoDasCaracteristicasClassePart, "_recalcHeight", 					
						function ()
							self.campoDasCaracteristicasClassePart.height = self.campoDasCaracteristicasClasse.height + 25;
						end);
				


    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.campoDasCaracteristicasClassePart);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout7);
    obj.button4:setText("+");
    obj.button4:setAlign("left");
    obj.button4:setWidth(30);
    obj.button4:setName("button4");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setText("CARACTERISTICAS DE CLASSE");
    obj.label11:setAlign("left");
    obj.label11:setWidth(225);
    obj.label11:setMargins({left=5});
    obj.label11:setName("label11");

    obj.campoDasCaracteristicasClasse = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasCaracteristicasClasse:setParent(obj.campoDasCaracteristicasClassePart);
    obj.campoDasCaracteristicasClasse:setName("campoDasCaracteristicasClasse");
    obj.campoDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.campoDasCaracteristicasClasse:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.campoDasCaracteristicasClasse:setAlign("top");
    obj.campoDasCaracteristicasClasse:setLayout("vertical");
    obj.campoDasCaracteristicasClasse:setAutoHeight(true);
    obj.campoDasCaracteristicasClasse:setHitTest(false);
    obj.campoDasCaracteristicasClasse:setMinQt(1);

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local rcl = self:findControlByName("rclListaDosTalentos");
            						if rcl~= nil then
            							rcl:sort();
            						end;
            						local rcl = self:findControlByName("rclListaDasProezas");
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

    obj._e_event1 = obj.BarPopup:addEventListener("onClose",
        function (_, canceled)
            setTimeout( function()
            				if (self.BarPopup.scopeNode.ModificadorBarrinha == "igual") then
            					self.BarPopup.scopeNode.ValorTempAtualBarrinha = tonumber(self.BarPopup.scopeNode.ValorMudadoAtualBarrinha or 0);
            				elseif (self.BarPopup.scopeNode.ModificadorBarrinha == "mais") then
            					self.BarPopup.scopeNode.ValorTempAtualBarrinha = tonumber(self.BarPopup.scopeNode.ValorTempAtualBarrinha or 0) + tonumber(self.BarPopup.scopeNode.ValorMudadoAtualBarrinha or 0);
            				elseif (self.BarPopup.scopeNode.ModificadorBarrinha == "menos") then
            					self.BarPopup.scopeNode.ValorTempAtualBarrinha = tonumber(self.BarPopup.scopeNode.ValorTempAtualBarrinha or 0) - tonumber(self.BarPopup.scopeNode.ValorMudadoAtualBarrinha or 0);
            				end;
            				
            				if (self.BarPopup.scopeNode.ModificadorBarrinhaMax == "igual") then
            					self.BarPopup.scopeNode.ValorTempMaxBarrinha = tonumber(self.BarPopup.scopeNode.ValorMudadoMaxBarrinha or 0);
            				elseif (self.BarPopup.scopeNode.ModificadorBarrinhaMax == "mais") then
            					self.BarPopup.scopeNode.ValorTempMaxBarrinha = tonumber(self.BarPopup.scopeNode.ValorTempMaxBarrinha or 0) + tonumber(self.BarPopup.scopeNode.ValorMudadoMaxBarrinha or 0);
            				elseif (self.BarPopup.scopeNode.ModificadorBarrinhaMax == "menos") then
            					self.BarPopup.scopeNode.ValorTempMaxBarrinha = tonumber(self.BarPopup.scopeNode.ValorTempMaxBarrinha or 0) - tonumber(self.BarPopup.scopeNode.ValorMudadoMaxBarrinha or 0);
            				end;
            				
            				local barrinhapc = 0
            				local barrinhapcmax = 0
            				local porcentagem = 0
            				local porcentagemmax = 0
            
            				barrinhapc = (self.BarPopup.scopeNode.ValorTempAtualBarrinha - (self.BarPopup.scopeNode.BarrinhaValor or 0));
            				barrinhapcmax = (self.BarPopup.scopeNode.ValorTempMaxBarrinha - (self.BarPopup.scopeNode.BarrinhaValorMax or 0));
            				self.BarPopup.scopeNode.BarrinhaValor = self.BarPopup.scopeNode.ValorTempAtualBarrinha;
            				self.BarPopup.scopeNode.BarrinhaValorMax = self.BarPopup.scopeNode.ValorTempMaxBarrinha;
            				
            				if ((barrinhapc ~= 0) or (barrinhapcmax ~= 0)) then
            					local nome = self.BarPopup.scopeNode.AtributoBarrinha or "Equipamento";
            					local personagem = sheet.nome or "nome";
            					local text = "[§K2]" .. nome .. "[§K3] de [§K2]" .. personagem.. "[§K3]: ";
            					local valor = barrinhapc;
            					local valormax = barrinhapcmax;
            					
            					if tonumber(barrinhapc) >= 0 then
            						valor = "+" .. tostring(barrinhapc);
            					end;
            					if tonumber(barrinhapcmax) >= 0 then
            						valormax = "+" .. tostring(barrinhapcmax);
            					end;
            					
            					if tonumber(valormax) == 0 then
            						text = text .. valor;
            					else
            						text = text .. valor .. "/" .. valormax;
            					end;
            					
            					local mesaDoPersonagem = Firecast.getMesaDe(sheet);
            					if mesaDoPersonagem ~= nil then
            						   mesaDoPersonagem.activeChat:enviarMensagem(text);
            					end;
            				end;
            			end, 100);
        end, obj);

    obj._e_event2 = obj.currentBarValue:addEventListener("onKeyDown",
        function (_, event)
            local oenter = (event.keyCode == 13)
            								if oenter then
            									self.BarPopup:close();
            								end;
        end, obj);

    obj._e_event3 = obj.maxBarValue:addEventListener("onKeyDown",
        function (_, event)
            local oenter = (event.keyCode == 13);
            								if oenter then
            									self.BarPopup:close();
            								end;
        end, obj);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (_)
            self.campoDosTalentos:append();
        end, obj);

    obj._e_event5 = obj.campoDosTalentos:addEventListener("onResize",
        function (_)
            self.campoDosTalentosPart._recalcHeight();
        end, obj);

    obj._e_event6 = obj.campoDosTalentos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event7 = obj.button2:addEventListener("onClick",
        function (_)
            self.campoDosOutros:append();
        end, obj);

    obj._e_event8 = obj.campoDosOutros:addEventListener("onResize",
        function (_)
            self.campoDosOutrosPart._recalcHeight();
        end, obj);

    obj._e_event9 = obj.campoDosOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event10 = obj.button3:addEventListener("onClick",
        function (_)
            self.campoDasRacas:append();
        end, obj);

    obj._e_event11 = obj.campoDasRacas:addEventListener("onResize",
        function (_)
            self.campoDasRacasPart._recalcHeight();
        end, obj);

    obj._e_event12 = obj.campoDasRacas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event13 = obj.button4:addEventListener("onClick",
        function (_)
            self.campoDasCaracteristicasClasse:append();
        end, obj);

    obj._e_event14 = obj.campoDasCaracteristicasClasse:addEventListener("onResize",
        function (_)
            self.campoDasCaracteristicasClassePart._recalcHeight();
        end, obj);

    obj._e_event15 = obj.campoDasCaracteristicasClasse:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.campoDasRacasPart ~= nil then self.campoDasRacasPart:destroy(); self.campoDasRacasPart = nil; end;
        if self.campoDasCaracteristicasClassePart ~= nil then self.campoDasCaracteristicasClassePart:destroy(); self.campoDasCaracteristicasClassePart = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.campoDosTalentos ~= nil then self.campoDosTalentos:destroy(); self.campoDosTalentos = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.campoDosTalentosPart ~= nil then self.campoDosTalentosPart:destroy(); self.campoDosTalentosPart = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.BarPopup ~= nil then self.BarPopup:destroy(); self.BarPopup = nil; end;
        if self.currentBarValue ~= nil then self.currentBarValue:destroy(); self.currentBarValue = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.campoDosOutrosPart ~= nil then self.campoDosOutrosPart:destroy(); self.campoDosOutrosPart = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.campoDasRacas ~= nil then self.campoDasRacas:destroy(); self.campoDasRacas = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.campoDasCaracteristicasClasse ~= nil then self.campoDasCaracteristicasClasse:destroy(); self.campoDasCaracteristicasClasse = nil; end;
        if self.PopupBarColor ~= nil then self.PopupBarColor:destroy(); self.PopupBarColor = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.maxBarValue ~= nil then self.maxBarValue:destroy(); self.maxBarValue = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.campoDosOutros ~= nil then self.campoDosOutros:destroy(); self.campoDosOutros = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmHabilidades()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmHabilidades();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmHabilidades = {
    newEditor = newfrmHabilidades, 
    new = newfrmHabilidades, 
    name = "frmHabilidades", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmHabilidades = _frmHabilidades;
Firecast.registrarForm(_frmHabilidades);

return _frmHabilidades;
