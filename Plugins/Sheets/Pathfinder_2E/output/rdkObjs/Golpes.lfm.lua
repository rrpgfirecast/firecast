require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGolpes()
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
    obj:setName("frmGolpes");
    obj:setHeight(80);
    obj:setWidth(380);


		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse golpe?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;
	    


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(368);
    obj.rectangle1:setHeight(77);
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("Gray");
    obj.rectangle1:setStrokeSize(3);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setMargins({left=6, right=6, top=6, bottom=6});
    obj.rectangle1:setName("rectangle1");

    obj.nomeGolpeExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeGolpeExLabel:setParent(obj.rectangle1);
    obj.nomeGolpeExLabel:setLeft(0);
    obj.nomeGolpeExLabel:setTop(0);
    obj.nomeGolpeExLabel:setWidth(131);
    obj.nomeGolpeExLabel:setHeight(25);
    obj.nomeGolpeExLabel:setColor("transparent");
    obj.nomeGolpeExLabel:setStrokeColor("Gray");
    obj.nomeGolpeExLabel:setStrokeSize(1);
    obj.nomeGolpeExLabel:setName("nomeGolpeExLabel");
    obj.nomeGolpeExLabel:setVisible(true);
    obj.nomeGolpeExLabel:setCornerType("round");
    obj.nomeGolpeExLabel:setXradius(5);
    obj.nomeGolpeExLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.nomeGolpeExLabel);
    obj.label1:setWidth(131);
    obj.label1:setHeight(25);
    obj.label1:setField("nomeGolpeEx");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Gray");
    obj.label1:setName("label1");

    obj.nomeGolpeExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeGolpeExEdit:setParent(obj.rectangle1);
    obj.nomeGolpeExEdit:setField("nomeGolpeEx");
    obj.nomeGolpeExEdit:setLeft(0);
    obj.nomeGolpeExEdit:setTop(0);
    obj.nomeGolpeExEdit:setWidth(131);
    obj.nomeGolpeExEdit:setHeight(25);
    obj.nomeGolpeExEdit:setName("nomeGolpeExEdit");
    obj.nomeGolpeExEdit:setVisible(false);
    obj.nomeGolpeExEdit:setFontSize(16);

    obj.atrGolpeExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.atrGolpeExLabel:setParent(obj.rectangle1);
    obj.atrGolpeExLabel:setLeft(131);
    obj.atrGolpeExLabel:setTop(0);
    obj.atrGolpeExLabel:setWidth(55);
    obj.atrGolpeExLabel:setHeight(25);
    obj.atrGolpeExLabel:setColor("transparent");
    obj.atrGolpeExLabel:setStrokeColor("Gray");
    obj.atrGolpeExLabel:setStrokeSize(1);
    obj.atrGolpeExLabel:setName("atrGolpeExLabel");
    obj.atrGolpeExLabel:setVisible(true);
    obj.atrGolpeExLabel:setCornerType("round");
    obj.atrGolpeExLabel:setXradius(5);
    obj.atrGolpeExLabel:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.atrGolpeExLabel);
    obj.label2:setWidth(55);
    obj.label2:setHeight(25);
    obj.label2:setField("atrGolpeEx");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Gray");
    obj.label2:setName("label2");

    obj.atrGolpeExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.atrGolpeExEdit:setParent(obj.rectangle1);
    obj.atrGolpeExEdit:setField("atrGolpeEx");
    obj.atrGolpeExEdit:setLeft(131);
    obj.atrGolpeExEdit:setTop(0);
    obj.atrGolpeExEdit:setWidth(55);
    obj.atrGolpeExEdit:setHeight(25);
    obj.atrGolpeExEdit:setName("atrGolpeExEdit");
    obj.atrGolpeExEdit:setVisible(false);
    obj.atrGolpeExEdit:setFontSize(16);

    obj.profGolpeExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.profGolpeExLabel:setParent(obj.rectangle1);
    obj.profGolpeExLabel:setLeft(186);
    obj.profGolpeExLabel:setTop(0);
    obj.profGolpeExLabel:setWidth(55);
    obj.profGolpeExLabel:setHeight(25);
    obj.profGolpeExLabel:setColor("transparent");
    obj.profGolpeExLabel:setStrokeColor("Gray");
    obj.profGolpeExLabel:setStrokeSize(1);
    obj.profGolpeExLabel:setName("profGolpeExLabel");
    obj.profGolpeExLabel:setVisible(true);
    obj.profGolpeExLabel:setCornerType("round");
    obj.profGolpeExLabel:setXradius(5);
    obj.profGolpeExLabel:setYradius(5);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.profGolpeExLabel);
    obj.label3:setWidth(55);
    obj.label3:setHeight(25);
    obj.label3:setField("profGolpeEx");
    obj.label3:setFontSize(16);
    obj.label3:setVertTextAlign("center");
    obj.label3:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("Gray");
    obj.label3:setName("label3");

    obj.profGolpeExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.profGolpeExEdit:setParent(obj.rectangle1);
    obj.profGolpeExEdit:setField("profGolpeEx");
    obj.profGolpeExEdit:setLeft(186);
    obj.profGolpeExEdit:setTop(0);
    obj.profGolpeExEdit:setWidth(55);
    obj.profGolpeExEdit:setHeight(25);
    obj.profGolpeExEdit:setName("profGolpeExEdit");
    obj.profGolpeExEdit:setVisible(false);
    obj.profGolpeExEdit:setFontSize(16);

    obj.outrosGolpeExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.outrosGolpeExLabel:setParent(obj.rectangle1);
    obj.outrosGolpeExLabel:setLeft(241);
    obj.outrosGolpeExLabel:setTop(0);
    obj.outrosGolpeExLabel:setWidth(55);
    obj.outrosGolpeExLabel:setHeight(25);
    obj.outrosGolpeExLabel:setColor("transparent");
    obj.outrosGolpeExLabel:setStrokeColor("Gray");
    obj.outrosGolpeExLabel:setStrokeSize(1);
    obj.outrosGolpeExLabel:setName("outrosGolpeExLabel");
    obj.outrosGolpeExLabel:setVisible(true);
    obj.outrosGolpeExLabel:setCornerType("round");
    obj.outrosGolpeExLabel:setXradius(5);
    obj.outrosGolpeExLabel:setYradius(5);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.outrosGolpeExLabel);
    obj.label4:setWidth(55);
    obj.label4:setHeight(25);
    obj.label4:setField("outrosGolpeEx");
    obj.label4:setFontSize(16);
    obj.label4:setVertTextAlign("center");
    obj.label4:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("Gray");
    obj.label4:setName("label4");

    obj.outrosGolpeExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.outrosGolpeExEdit:setParent(obj.rectangle1);
    obj.outrosGolpeExEdit:setField("outrosGolpeEx");
    obj.outrosGolpeExEdit:setLeft(241);
    obj.outrosGolpeExEdit:setTop(0);
    obj.outrosGolpeExEdit:setWidth(55);
    obj.outrosGolpeExEdit:setHeight(25);
    obj.outrosGolpeExEdit:setName("outrosGolpeExEdit");
    obj.outrosGolpeExEdit:setVisible(false);
    obj.outrosGolpeExEdit:setFontSize(16);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(296);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(72);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("Gray");
    obj.rectangle2:setStrokeSize(3);
    obj.rectangle2:setVisible(true);
    obj.rectangle2:setOpacity(1);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setName("rectangle2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setWidth(72);
    obj.label5:setHeight(25);
    obj.label5:setField("bonusGolpeEx");
    obj.label5:setFontSize(16);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontColor("Gray");
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(0);
    obj.button1:setTop(25);
    obj.button1:setWidth(55);
    obj.button1:setHeight(25);
    obj.button1:setText("Dano");
    obj.button1:setFontFamily("Stencil");
    obj.button1:setName("button1");

    obj.danoGolpeExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.danoGolpeExLabel:setParent(obj.rectangle1);
    obj.danoGolpeExLabel:setLeft(55);
    obj.danoGolpeExLabel:setTop(25);
    obj.danoGolpeExLabel:setWidth(83);
    obj.danoGolpeExLabel:setHeight(25);
    obj.danoGolpeExLabel:setColor("transparent");
    obj.danoGolpeExLabel:setStrokeColor("Gray");
    obj.danoGolpeExLabel:setStrokeSize(1);
    obj.danoGolpeExLabel:setName("danoGolpeExLabel");
    obj.danoGolpeExLabel:setVisible(true);
    obj.danoGolpeExLabel:setCornerType("round");
    obj.danoGolpeExLabel:setXradius(5);
    obj.danoGolpeExLabel:setYradius(5);

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.danoGolpeExLabel);
    obj.label6:setWidth(83);
    obj.label6:setHeight(25);
    obj.label6:setField("danoGolpeEx");
    obj.label6:setFontSize(16);
    obj.label6:setVertTextAlign("center");
    obj.label6:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontColor("Gray");
    obj.label6:setName("label6");

    obj.danoGolpeExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.danoGolpeExEdit:setParent(obj.rectangle1);
    obj.danoGolpeExEdit:setField("danoGolpeEx");
    obj.danoGolpeExEdit:setLeft(55);
    obj.danoGolpeExEdit:setTop(25);
    obj.danoGolpeExEdit:setWidth(83);
    obj.danoGolpeExEdit:setHeight(25);
    obj.danoGolpeExEdit:setName("danoGolpeExEdit");
    obj.danoGolpeExEdit:setVisible(false);
    obj.danoGolpeExEdit:setFontSize(16);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setLeft(138);
    obj.rectangle3:setTop(25);
    obj.rectangle3:setWidth(40);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("transparent");
    obj.rectangle3:setStrokeColor("Gray");
    obj.rectangle3:setStrokeSize(2);
    obj.rectangle3:setCornerType("innerRound");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setName("rectangle3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle3);
    obj.label7:setVertTextAlign("center");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setWidth(40);
    obj.label7:setHeight(25);
    obj.label7:setText("Pen");
    obj.label7:setFontColor("Gray");
    obj.label7:setFontFamily("Stencil");
    obj.label7:setName("label7");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(178);
    obj.button2:setTop(26);
    obj.button2:setWidth(40);
    obj.button2:setHeight(23);
    obj.button2:setText("2º");
    obj.button2:setName("button2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setHorzTextAlign("trailing");
    obj.comboBox1:setLeft(218);
    obj.comboBox1:setTop(25);
    obj.comboBox1:setWidth(55);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("penSegundoEx");
    obj.comboBox1:setItems({'0', '-1', '-2', '-3', '-4', '-5', '-6', '-7', '-8', '-9', '-10'});
    obj.comboBox1:setValues({'0', '-1', '-2', '-3', '-4', '-5', '-6', '-7', '-8', '-9', '-10'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(273);
    obj.button3:setTop(26);
    obj.button3:setWidth(40);
    obj.button3:setHeight(23);
    obj.button3:setText("3º");
    obj.button3:setName("button3");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle1);
    obj.comboBox2:setVertTextAlign("center");
    obj.comboBox2:setHorzTextAlign("trailing");
    obj.comboBox2:setLeft(313);
    obj.comboBox2:setTop(25);
    obj.comboBox2:setWidth(55);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("penTerceiroEx");
    obj.comboBox2:setItems({'0', '-1', '-2', '-3', '-4', '-5', '-6', '-7', '-8', '-9', '-10'});
    obj.comboBox2:setValues({'0', '-1', '-2', '-3', '-4', '-5', '-6', '-7', '-8', '-9', '-10'});
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setName("comboBox2");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle1);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(50);
    obj.rectangle4:setWidth(55);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("transparent");
    obj.rectangle4:setStrokeColor("Gray");
    obj.rectangle4:setStrokeSize(2);
    obj.rectangle4:setCornerType("innerRound");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setName("rectangle4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle4);
    obj.label8:setVertTextAlign("center");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setWidth(55);
    obj.label8:setHeight(25);
    obj.label8:setText("Traços");
    obj.label8:setFontColor("Gray");
    obj.label8:setFontFamily("Stencil");
    obj.label8:setName("label8");

    obj.tracosGolpeExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.tracosGolpeExLabel:setParent(obj.rectangle1);
    obj.tracosGolpeExLabel:setLeft(55);
    obj.tracosGolpeExLabel:setTop(50);
    obj.tracosGolpeExLabel:setWidth(232);
    obj.tracosGolpeExLabel:setHeight(25);
    obj.tracosGolpeExLabel:setColor("transparent");
    obj.tracosGolpeExLabel:setStrokeColor("Gray");
    obj.tracosGolpeExLabel:setStrokeSize(1);
    obj.tracosGolpeExLabel:setName("tracosGolpeExLabel");
    obj.tracosGolpeExLabel:setVisible(true);
    obj.tracosGolpeExLabel:setCornerType("round");
    obj.tracosGolpeExLabel:setXradius(5);
    obj.tracosGolpeExLabel:setYradius(5);

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.tracosGolpeExLabel);
    obj.label9:setWidth(232);
    obj.label9:setHeight(25);
    obj.label9:setField("tracosGolpeEx");
    obj.label9:setFontSize(16);
    obj.label9:setVertTextAlign("center");
    obj.label9:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setFontColor("Gray");
    obj.label9:setName("label9");

    obj.tracosGolpeExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.tracosGolpeExEdit:setParent(obj.rectangle1);
    obj.tracosGolpeExEdit:setField("tracosGolpeEx");
    obj.tracosGolpeExEdit:setLeft(55);
    obj.tracosGolpeExEdit:setTop(50);
    obj.tracosGolpeExEdit:setWidth(232);
    obj.tracosGolpeExEdit:setHeight(25);
    obj.tracosGolpeExEdit:setName("tracosGolpeExEdit");
    obj.tracosGolpeExEdit:setVisible(false);
    obj.tracosGolpeExEdit:setFontSize(16);

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle1);
    obj.comboBox3:setVertTextAlign("center");
    obj.comboBox3:setHorzTextAlign("trailing");
    obj.comboBox3:setLeft(287);
    obj.comboBox3:setTop(50);
    obj.comboBox3:setWidth(55);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("tipoDanoEx");
    obj.comboBox3:setItems({'Cn', 'Ct', 'Pf'});
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setName("comboBox3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(342);
    obj.button4:setTop(51);
    obj.button4:setWidth(23);
    obj.button4:setHeight(23);
    obj.button4:setText("X");
    obj.button4:setName("button4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setFields({'atrGolpeEx', 'profGolpeEx', 'outrosGolpeEx'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setField("bonusGolpeEx");
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.nomeGolpeExLabel:addEventListener("onClick",
        function (_)
            self.nomeGolpeExLabel.visible = false;
                            self.nomeGolpeExEdit.visible = true;
                            self.nomeGolpeExEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.nomeGolpeExEdit:addEventListener("onExit",
        function (_)
            self.nomeGolpeExLabel.visible = true;
                            self.nomeGolpeExEdit.visible = false;
        end, obj);

    obj._e_event2 = obj.atrGolpeExLabel:addEventListener("onClick",
        function (_)
            self.atrGolpeExLabel.visible = false;
                            self.atrGolpeExEdit.visible = true;
                            self.atrGolpeExEdit:setFocus();
        end, obj);

    obj._e_event3 = obj.atrGolpeExEdit:addEventListener("onExit",
        function (_)
            self.atrGolpeExLabel.visible = true;
                            self.atrGolpeExEdit.visible = false;
        end, obj);

    obj._e_event4 = obj.profGolpeExLabel:addEventListener("onClick",
        function (_)
            self.profGolpeExLabel.visible = false;
                            self.profGolpeExEdit.visible = true;
                            self.profGolpeExEdit:setFocus();
        end, obj);

    obj._e_event5 = obj.profGolpeExEdit:addEventListener("onExit",
        function (_)
            self.profGolpeExLabel.visible = true;
                            self.profGolpeExEdit.visible = false;
        end, obj);

    obj._e_event6 = obj.outrosGolpeExLabel:addEventListener("onClick",
        function (_)
            self.outrosGolpeExLabel.visible = false;
                            self.outrosGolpeExEdit.visible = true;
                            self.outrosGolpeExEdit:setFocus();
        end, obj);

    obj._e_event7 = obj.outrosGolpeExEdit:addEventListener("onExit",
        function (_)
            self.outrosGolpeExLabel.visible = true;
                            self.outrosGolpeExEdit.visible = false;
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet.danoGolpeEx == nil then
                                showMessage("O ataque não possui dano.");
                            elseif sheet.bonusGolpeEx ~= nil then
                                local mod = tonumber(sheet.bonusGolpeEx);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local dano = Firecast.interpretarRolagem(sheet.danoGolpeEx);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpeEx or "Ataque"),
                                    function(rolado)
                                        mesa.activeChat:rolarDados(dano, "Primeiro Dano de " .. (sheet.nomeGolpeEx or "Ataque"))
                                    end);
                            elseif sheet.bonusGolpeEx == nil then
                                local rolagem = Firecast.interpretarRolagem("1d20");
                                local dano = Firecast.interpretarRolagem(sheet.danoGolpeEx);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpeEx or "Ataque"),
                                    function(rolado)
                                        mesa.activeChat:rolarDados(dano, "Primeiro Dano de " .. (sheet.nomeGolpeEx or "Ataque"))
                                    end);
                            end;
        end, obj);

    obj._e_event9 = obj.danoGolpeExLabel:addEventListener("onClick",
        function (_)
            self.danoGolpeExLabel.visible = false;
                            self.danoGolpeExEdit.visible = true;
                            self.danoGolpeExEdit:setFocus();
        end, obj);

    obj._e_event10 = obj.danoGolpeExEdit:addEventListener("onExit",
        function (_)
            self.danoGolpeExLabel.visible = true;
                            self.danoGolpeExEdit.visible = false;
        end, obj);

    obj._e_event11 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet.danoGolpeEx == nil then
                                showMessage("O ataque não possui dano.");
                            elseif sheet.bonusGolpeEx ~= nil then
                                local mod = tonumber(sheet.bonusGolpeEx) + tonumber(sheet.penSegundoEx);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local dano = Firecast.interpretarRolagem(sheet.danoGolpeEx);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpeEx or "Ataque"),
                                    function(rolado)
                                        mesa.activeChat:rolarDados(dano, "Segundo Dano de " .. (sheet.nomeGolpeEx or "Ataque"))
                                    end);
                            elseif sheet.bonusGolpeEx == nil then
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. (tonumber(sheet.penSegundoEx) or 0));
                                local dano = Firecast.interpretarRolagem(sheet.danoGolpeEx);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpeEx or "Ataque"),
                                    function(rolado)
                                        mesa.activeChat:rolarDados(dano, "Segundo Dano de " .. (sheet.nomeGolpeEx or "Ataque"))
                                    end);
                            end;
        end, obj);

    obj._e_event12 = obj.button3:addEventListener("onClick",
        function (_)
            if sheet.danoGolpeEx == nil then
                                showMessage("O ataque não possui dano.");
                            elseif sheet.bonusGolpeEx ~= nil then
                                local mod = tonumber(sheet.bonusGolpeEx) + tonumber(sheet.penTerceiroEx);
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                                local dano = Firecast.interpretarRolagem(sheet.danoGolpeEx);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpeEx or "Ataque"),
                                    function(rolado)
                                        mesa.activeChat:rolarDados(dano, "Terceiro Dano de " .. (sheet.nomeGolpeEx or "Ataque"))
                                    end);
                            elseif sheet.bonusGolpeEx == nil then
                                local rolagem = Firecast.interpretarRolagem("1d20 + " .. (tonumber(sheet.penTerceiroEx) or 0));
                                local dano = Firecast.interpretarRolagem(sheet.danoGolpeEx);
                                local mesa = Firecast.getMesaDe(sheet);
                                mesa.activeChat:rolarDados(rolagem, (sheet.nomeGolpeEx or "Ataque"),
                                    function(rolado)
                                        mesa.activeChat:rolarDados(dano, "Terceiro Dano de " .. (sheet.nomeGolpeEx or "Ataque"))
                                    end);
                            end;
        end, obj);

    obj._e_event13 = obj.tracosGolpeExLabel:addEventListener("onClick",
        function (_)
            self.tracosGolpeExLabel.visible = false;
                            self.tracosGolpeExEdit.visible = true;
                            self.tracosGolpeExEdit:setFocus();
        end, obj);

    obj._e_event14 = obj.tracosGolpeExEdit:addEventListener("onExit",
        function (_)
            self.tracosGolpeExLabel.visible = true;
                            self.tracosGolpeExEdit.visible = false;
        end, obj);

    obj._e_event15 = obj.button4:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event16 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                               if (tonumber(sheet.profGolpeEx) or 0) > 0 then
                                   sheet.bonusGolpeEx = (tonumber(sheet.atrGolpeEx) or 0)+
                                                   (tonumber(sheet.profGolpeEx) or 0)+
                                                   (tonumber(sheet.outrosGolpeEx) or 0);
                               else
                                   sheet.bonusGolpeEx = (tonumber(sheet.atrGolpeEx) or 0) + (tonumber(sheet.outrosGolpeEx) or 0);
                               end;
        end, obj);

    obj._e_event17 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                            local mod = (tonumber(sheet.bonusGolpeEx or 0));
                            if (mod >= 0) then
                                sheet.bonusGolpeEx = "+" .. mod;
                            else
                                sheet.bonusGolpeEx = mod;
                            end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.outrosGolpeExLabel ~= nil then self.outrosGolpeExLabel:destroy(); self.outrosGolpeExLabel = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.tracosGolpeExLabel ~= nil then self.tracosGolpeExLabel:destroy(); self.tracosGolpeExLabel = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.danoGolpeExEdit ~= nil then self.danoGolpeExEdit:destroy(); self.danoGolpeExEdit = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.nomeGolpeExLabel ~= nil then self.nomeGolpeExLabel:destroy(); self.nomeGolpeExLabel = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.profGolpeExEdit ~= nil then self.profGolpeExEdit:destroy(); self.profGolpeExEdit = nil; end;
        if self.danoGolpeExLabel ~= nil then self.danoGolpeExLabel:destroy(); self.danoGolpeExLabel = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.outrosGolpeExEdit ~= nil then self.outrosGolpeExEdit:destroy(); self.outrosGolpeExEdit = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.nomeGolpeExEdit ~= nil then self.nomeGolpeExEdit:destroy(); self.nomeGolpeExEdit = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.atrGolpeExEdit ~= nil then self.atrGolpeExEdit:destroy(); self.atrGolpeExEdit = nil; end;
        if self.tracosGolpeExEdit ~= nil then self.tracosGolpeExEdit:destroy(); self.tracosGolpeExEdit = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.profGolpeExLabel ~= nil then self.profGolpeExLabel:destroy(); self.profGolpeExLabel = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.atrGolpeExLabel ~= nil then self.atrGolpeExLabel:destroy(); self.atrGolpeExLabel = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGolpes()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGolpes();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGolpes = {
    newEditor = newfrmGolpes, 
    new = newfrmGolpes, 
    name = "frmGolpes", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGolpes = _frmGolpes;
Firecast.registrarForm(_frmGolpes);

return _frmGolpes;
