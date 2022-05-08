require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmContractItemClosed()
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
    obj:setName("frmContractItemClosed");
    obj:setWidth(600);
    obj:setHeight(300);
    obj:setTheme("dark");
    obj:setMargins({top=1});
    obj:setPadding({top=5,bottom=5,left=5,right=5});


		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse contrato?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;
        local function askForClose()
            Dialogs.confirmYesNo("Deseja realmente fechar esse contrato?",
                                 function (confirmado)
                                    if confirmado then
                                        local rcl = self:findControlByName("rclContratosFechados");
                                        if rcl == nil then return end

                                        local item = rcl:append()
                                        if item == nil then return end

                                        NDB.copy(item, sheet)

                                        NDB.deleteNode(sheet);
                                    end;
                                 end);
        end;

        local function toggleCheckbox(name, index)
            if index < 1 or index > 5 then return end 
            if sheet==nil then return end

            local checkbox = sheet[name .. index]

            if checkbox==true and index > 1 then
                sheet[name .. (index-1)] = true
            elseif checkbox==false and index < 5 then
                sheet[name .. (index+1)] = false
            end

            if name=="d" then
                sheet.dificuldade = (sheet.d1 and 1 or 0) + 
                                    (sheet.d2 and 1 or 0) + 
                                    (sheet.d3 and 1 or 0) + 
                                    (sheet.d4 and 1 or 0) + 
                                    (sheet.d5 and 1 or 0);
            end
        end;

        function self:alternarVisibilidade()
            if sheet==nil then return end
            if self.cbxInvisivel.checked then
                NDB.setPermission(sheet, "group", "jogadores", "read", nil);
                NDB.setPermission(sheet, "group", "espectadores", "read", nil);
                sheet.visibilidade = 1
            else
                NDB.setPermission(sheet, "group", "jogadores", "read", "deny");
                NDB.setPermission(sheet, "group", "espectadores", "read", "deny");
                sheet.visibilidade = 0
            end;
        end; 
        function self:atualizarCbxInvisivel()          
            self.cbxInvisivel.checked = NDB.getPermission(sheet, "group", "espectadores", "read") == "deny" or
                                        NDB.getPermission(sheet, "group", "jogadores", "read") == "deny"                                                                                    
             self.cbxInvisivel.enabled = NDB.testPermission(sheet, "writePermissions");
        end;
        


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(100);
    obj.label1:setText("Contrato");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.cbxInvisivel = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxInvisivel:setParent(obj.layout1);
    obj.cbxInvisivel:setName("cbxInvisivel");
    obj.cbxInvisivel:setField("cbxInvisivel");
    obj.cbxInvisivel:setAlign("right");
    obj.cbxInvisivel:setWidth(25);
    obj.cbxInvisivel:setImageChecked("/FichaGuilda/images/invisivel.png");
    obj.cbxInvisivel:setImageUnchecked("/FichaGuilda/images/visivel.png");
    obj.cbxInvisivel:setAutoChange(false);
    obj.cbxInvisivel:setHint("Altera a visibilidade entre somente o mestre e todos. ");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(250);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout2);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("descricao");
    obj.textEditor1:setName("textEditor1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("client");
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setAlign("left");
    obj.label2:setWidth(75);
    obj.label2:setText("Contratante");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setAlign("client");
    obj.edit2:setField("contratante");
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout5);
    obj.label3:setAlign("left");
    obj.label3:setWidth(75);
    obj.label3:setText("Relação");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout5);
    obj.comboBox1:setAlign("client");
    obj.comboBox1:setField("relacao");
    obj.comboBox1:setItems({'Hostil', 'Pouco Amistoso', 'Indiferente', 'Amistoso', 'Prestativo'});
    obj.comboBox1:setName("comboBox1");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout6);
    obj.label4:setAlign("left");
    obj.label4:setWidth(75);
    obj.label4:setText("Reputação");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(80);
    obj.layout7:setName("layout7");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout7);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(16);
    obj.checkBox1:setField("r1");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout7);
    obj.dataLink1:setField("r1");
    obj.dataLink1:setName("dataLink1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout7);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(16);
    obj.checkBox2:setField("r2");
    obj.checkBox2:setName("checkBox2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout7);
    obj.dataLink2:setField("r2");
    obj.dataLink2:setName("dataLink2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout7);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(16);
    obj.checkBox3:setField("r3");
    obj.checkBox3:setName("checkBox3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout7);
    obj.dataLink3:setField("r3");
    obj.dataLink3:setName("dataLink3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout7);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(16);
    obj.checkBox4:setField("r4");
    obj.checkBox4:setName("checkBox4");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout7);
    obj.dataLink4:setField("r4");
    obj.dataLink4:setName("dataLink4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout7);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(16);
    obj.checkBox5:setField("r5");
    obj.checkBox5:setName("checkBox5");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout7);
    obj.dataLink5:setField("r5");
    obj.dataLink5:setName("dataLink5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setAlign("right");
    obj.label5:setWidth(75);
    obj.label5:setText("Dificuldade");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout6);
    obj.layout8:setAlign("right");
    obj.layout8:setWidth(80);
    obj.layout8:setName("layout8");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout8);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(16);
    obj.checkBox6:setField("d1");
    obj.checkBox6:setName("checkBox6");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout8);
    obj.dataLink6:setField("d1");
    obj.dataLink6:setName("dataLink6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout8);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(16);
    obj.checkBox7:setField("d2");
    obj.checkBox7:setName("checkBox7");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout8);
    obj.dataLink7:setField("d2");
    obj.dataLink7:setName("dataLink7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout8);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(16);
    obj.checkBox8:setField("d3");
    obj.checkBox8:setName("checkBox8");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout8);
    obj.dataLink8:setField("d3");
    obj.dataLink8:setName("dataLink8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout8);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(16);
    obj.checkBox9:setField("d4");
    obj.checkBox9:setName("checkBox9");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout8);
    obj.dataLink9:setField("d4");
    obj.dataLink9:setName("dataLink9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout8);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(16);
    obj.checkBox10:setField("d5");
    obj.checkBox10:setName("checkBox10");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout8);
    obj.dataLink10:setField("d5");
    obj.dataLink10:setName("dataLink10");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout3);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(10);
    obj.layout9:setName("layout9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout3);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout10);
    obj.label6:setAlign("left");
    obj.label6:setWidth(75);
    obj.label6:setText("Duração");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout10);
    obj.edit3:setAlign("client");
    obj.edit3:setField("duracao");
    obj.edit3:setName("edit3");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout3);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(10);
    obj.layout11:setName("layout11");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout3);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout12);
    obj.label7:setAlign("left");
    obj.label7:setWidth(75);
    obj.label7:setText("Creditos");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setAlign("client");
    obj.layout13:setName("layout13");

    obj.creditosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.creditosLabel:setParent(obj.layout13);
    obj.creditosLabel:setAlign("client");
    obj.creditosLabel:setColor("black");
    obj.creditosLabel:setStrokeColor("grey");
    obj.creditosLabel:setStrokeSize(1);
    obj.creditosLabel:setName("creditosLabel");
    obj.creditosLabel:setVisible(true);
    obj.creditosLabel:setOpacity(0.75);
    obj.creditosLabel:setCornerType("innerRound");
    obj.creditosLabel:setXradius(5);
    obj.creditosLabel:setYradius(5);

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.creditosLabel);
    obj.label8:setAlign("client");
    obj.label8:setField("creditosTotal");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setFontSize(11);
    lfm_setPropAsString(obj.label8, "formatFloat",  ",0.## C");
    obj.label8:setName("label8");

    obj.creditosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.creditosEdit:setParent(obj.layout13);
    obj.creditosEdit:setField("creditos");
    obj.creditosEdit:setAlign("client");
    obj.creditosEdit:setType("float");
    obj.creditosEdit:setFontSize(11);
    obj.creditosEdit:setName("creditosEdit");
    obj.creditosEdit:setVisible(false);

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout12);
    obj.dataLink11:setFields({'creditos', creditosMult});
    obj.dataLink11:setName("dataLink11");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout12);
    obj.edit4:setAlign("right");
    obj.edit4:setWidth(40);
    obj.edit4:setField("creditosMult");
    obj.edit4:setName("edit4");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout3);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout14);
    obj.label9:setAlign("left");
    obj.label9:setWidth(75);
    obj.label9:setText("Seguro");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setAlign("client");
    obj.layout15:setName("layout15");

    obj.seguroLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.seguroLabel:setParent(obj.layout15);
    obj.seguroLabel:setAlign("client");
    obj.seguroLabel:setColor("black");
    obj.seguroLabel:setStrokeColor("grey");
    obj.seguroLabel:setStrokeSize(1);
    obj.seguroLabel:setName("seguroLabel");
    obj.seguroLabel:setVisible(true);
    obj.seguroLabel:setOpacity(0.75);
    obj.seguroLabel:setCornerType("innerRound");
    obj.seguroLabel:setXradius(5);
    obj.seguroLabel:setYradius(5);

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.seguroLabel);
    obj.label10:setAlign("client");
    obj.label10:setField("seguroTotal");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontSize(11);
    lfm_setPropAsString(obj.label10, "formatFloat",  ",0.## C");
    obj.label10:setName("label10");

    obj.seguroEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.seguroEdit:setParent(obj.layout15);
    obj.seguroEdit:setField("seguro");
    obj.seguroEdit:setAlign("client");
    obj.seguroEdit:setType("float");
    obj.seguroEdit:setFontSize(11);
    obj.seguroEdit:setName("seguroEdit");
    obj.seguroEdit:setVisible(false);

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout14);
    obj.dataLink12:setFields({'seguro', seguroMult});
    obj.dataLink12:setName("dataLink12");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout14);
    obj.edit5:setAlign("right");
    obj.edit5:setWidth(40);
    obj.edit5:setField("seguroMult");
    obj.edit5:setName("edit5");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout3);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout16);
    obj.label11:setAlign("left");
    obj.label11:setWidth(75);
    obj.label11:setText("Espolios");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17:setAlign("client");
    obj.layout17:setName("layout17");

    obj.espoliosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.espoliosLabel:setParent(obj.layout17);
    obj.espoliosLabel:setAlign("client");
    obj.espoliosLabel:setColor("black");
    obj.espoliosLabel:setStrokeColor("grey");
    obj.espoliosLabel:setStrokeSize(1);
    obj.espoliosLabel:setName("espoliosLabel");
    obj.espoliosLabel:setVisible(true);
    obj.espoliosLabel:setOpacity(0.75);
    obj.espoliosLabel:setCornerType("innerRound");
    obj.espoliosLabel:setXradius(5);
    obj.espoliosLabel:setYradius(5);

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.espoliosLabel);
    obj.label12:setAlign("client");
    obj.label12:setField("espoliosTotal");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(11);
    lfm_setPropAsString(obj.label12, "formatFloat",  ",0.## %");
    obj.label12:setName("label12");

    obj.espoliosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.espoliosEdit:setParent(obj.layout17);
    obj.espoliosEdit:setField("espolios");
    obj.espoliosEdit:setAlign("client");
    obj.espoliosEdit:setType("float");
    obj.espoliosEdit:setFontSize(11);
    obj.espoliosEdit:setName("espoliosEdit");
    obj.espoliosEdit:setVisible(false);

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout16);
    obj.dataLink13:setFields({'espolios', espoliosMult});
    obj.dataLink13:setName("dataLink13");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout16);
    obj.edit6:setAlign("right");
    obj.edit6:setWidth(40);
    obj.edit6:setField("espoliosMult");
    obj.edit6:setName("edit6");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout3);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout18);
    obj.label13:setAlign("left");
    obj.label13:setWidth(75);
    obj.label13:setText("Negociação");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout18);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(40);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle2:setName("rectangle2");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle2);
    obj.label14:setAlign("client");
    obj.label14:setField("negociacao");
    obj.label14:setName("label14");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout18);
    obj.dataLink14:setFields({'creditosMult','seguroMult','espoliosMult'});
    obj.dataLink14:setName("dataLink14");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout3);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout19);
    obj.label15:setAlign("left");
    obj.label15:setWidth(75);
    obj.label15:setText("Nota Contratante");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontSize(9);
    obj.label15:setName("label15");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(80);
    obj.layout20:setName("layout20");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout20);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setWidth(16);
    obj.checkBox11:setField("n1");
    obj.checkBox11:setName("checkBox11");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout20);
    obj.dataLink15:setField("n1");
    obj.dataLink15:setName("dataLink15");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout20);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setWidth(16);
    obj.checkBox12:setField("n2");
    obj.checkBox12:setName("checkBox12");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout20);
    obj.dataLink16:setField("n2");
    obj.dataLink16:setName("dataLink16");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout20);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setWidth(16);
    obj.checkBox13:setField("n3");
    obj.checkBox13:setName("checkBox13");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout20);
    obj.dataLink17:setField("n3");
    obj.dataLink17:setName("dataLink17");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout20);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setWidth(16);
    obj.checkBox14:setField("n4");
    obj.checkBox14:setName("checkBox14");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout20);
    obj.dataLink18:setField("n4");
    obj.dataLink18:setName("dataLink18");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout20);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setWidth(16);
    obj.checkBox15:setField("n5");
    obj.checkBox15:setName("checkBox15");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout20);
    obj.dataLink19:setField("n5");
    obj.dataLink19:setName("dataLink19");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout19);
    obj.label16:setAlign("right");
    obj.label16:setWidth(75);
    obj.label16:setText("Avaliação do Time");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(9);
    obj.label16:setName("label16");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout19);
    obj.layout21:setAlign("right");
    obj.layout21:setWidth(80);
    obj.layout21:setName("layout21");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout21);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setWidth(16);
    obj.checkBox16:setField("a1");
    obj.checkBox16:setName("checkBox16");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout21);
    obj.dataLink20:setField("a1");
    obj.dataLink20:setName("dataLink20");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout21);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setWidth(16);
    obj.checkBox17:setField("a2");
    obj.checkBox17:setName("checkBox17");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout21);
    obj.dataLink21:setField("a2");
    obj.dataLink21:setName("dataLink21");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout21);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(16);
    obj.checkBox18:setField("a3");
    obj.checkBox18:setName("checkBox18");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout21);
    obj.dataLink22:setField("a3");
    obj.dataLink22:setName("dataLink22");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout21);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setWidth(16);
    obj.checkBox19:setField("a4");
    obj.checkBox19:setName("checkBox19");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout21);
    obj.dataLink23:setField("a4");
    obj.dataLink23:setName("dataLink23");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout21);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setWidth(16);
    obj.checkBox20:setField("a5");
    obj.checkBox20:setName("checkBox20");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout21);
    obj.dataLink24:setField("a5");
    obj.dataLink24:setName("dataLink24");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout19);
    obj.dataLink25:setFields({'a1', 'a2', 'a3', 'a4', a5});
    obj.dataLink25:setName("dataLink25");

    obj._e_event0 = obj:addEventListener("onScopeNodeChanged",
        function (_)
            if self.observer ~= nil then   
                        self.observer.enabled = false;
                        self.observer = nil;
                    end;
                     
                    if sheet ~= nil then   
                        self.observer = NDB.newObserver(sheet);
                        self.observer.onPermissionListChanged =
                            function(node)                 
                                self:atualizarCbxInvisivel();
                            end;                               
                        self.observer.onFinalPermissionsCouldBeChanged =
                            function(node)
                                self:atualizarCbxInvisivel();
                            end;                               
                        self:atualizarCbxInvisivel();  
                    end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.cbxInvisivel:addEventListener("onClick",
        function (_)
            self:alternarVisibilidade();
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("r",1)
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("r",2)
        end, obj);

    obj._e_event5 = obj.dataLink3:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("r",3)
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("r",4)
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("r",5)
        end, obj);

    obj._e_event8 = obj.dataLink6:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("d",1)
        end, obj);

    obj._e_event9 = obj.dataLink7:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("d",2)
        end, obj);

    obj._e_event10 = obj.dataLink8:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("d",3)
        end, obj);

    obj._e_event11 = obj.dataLink9:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("d",4)
        end, obj);

    obj._e_event12 = obj.dataLink10:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("d",5)
        end, obj);

    obj._e_event13 = obj.creditosLabel:addEventListener("onClick",
        function (_)
            self.creditosLabel.visible = false;
                                self.creditosEdit.visible = true;
                                self.creditosEdit:setFocus();
        end, obj);

    obj._e_event14 = obj.creditosEdit:addEventListener("onExit",
        function (_)
            self.creditosLabel.visible = true;
                                self.creditosEdit.visible = false;
        end, obj);

    obj._e_event15 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            local val = tonumber(sheet.creditos) or 0
                            local mult = tonumber(sheet.creditosMult) or 0
            
                            if "percentage"=="percentage" then
                                sheet.creditosTotal = math.floor(val * (100+mult*1)/100)
                            elseif "percentage"=="direct" then
                                sheet.creditosTotal = val + mult
                            end
        end, obj);

    obj._e_event16 = obj.seguroLabel:addEventListener("onClick",
        function (_)
            self.seguroLabel.visible = false;
                                self.seguroEdit.visible = true;
                                self.seguroEdit:setFocus();
        end, obj);

    obj._e_event17 = obj.seguroEdit:addEventListener("onExit",
        function (_)
            self.seguroLabel.visible = true;
                                self.seguroEdit.visible = false;
        end, obj);

    obj._e_event18 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            local val = tonumber(sheet.seguro) or 0
                            local mult = tonumber(sheet.seguroMult) or 0
            
                            if "percentage"=="percentage" then
                                sheet.seguroTotal = math.floor(val * (100+mult*2)/100)
                            elseif "percentage"=="direct" then
                                sheet.seguroTotal = val + mult
                            end
        end, obj);

    obj._e_event19 = obj.espoliosLabel:addEventListener("onClick",
        function (_)
            self.espoliosLabel.visible = false;
                                self.espoliosEdit.visible = true;
                                self.espoliosEdit:setFocus();
        end, obj);

    obj._e_event20 = obj.espoliosEdit:addEventListener("onExit",
        function (_)
            self.espoliosLabel.visible = true;
                                self.espoliosEdit.visible = false;
        end, obj);

    obj._e_event21 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                            local val = tonumber(sheet.espolios) or 0
                            local mult = tonumber(sheet.espoliosMult) or 0
            
                            if "direct"=="percentage" then
                                sheet.espoliosTotal = math.floor(val * (100+mult*1)/100)
                            elseif "direct"=="direct" then
                                sheet.espoliosTotal = val + mult
                            end
        end, obj);

    obj._e_event22 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
                                    sheet.negociacao =  (tonumber(sheet.creditosMult) or 0) + 
                                                        (tonumber(sheet.seguroMult) or 0) + 
                                                        (tonumber(sheet.espoliosMult) or 0)
        end, obj);

    obj._e_event23 = obj.dataLink15:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("n",1)
        end, obj);

    obj._e_event24 = obj.dataLink16:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("n",2)
        end, obj);

    obj._e_event25 = obj.dataLink17:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("n",3)
        end, obj);

    obj._e_event26 = obj.dataLink18:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("n",4)
        end, obj);

    obj._e_event27 = obj.dataLink19:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("n",5)
        end, obj);

    obj._e_event28 = obj.dataLink20:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("a",1)
        end, obj);

    obj._e_event29 = obj.dataLink21:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("a",2)
        end, obj);

    obj._e_event30 = obj.dataLink22:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("a",3)
        end, obj);

    obj._e_event31 = obj.dataLink23:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("a",4)
        end, obj);

    obj._e_event32 = obj.dataLink24:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            toggleCheckbox("a",5)
        end, obj);

    obj._e_event33 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                    local node = NDB.getRoot(sheet);
            
                                    local contratos = NDB.getChildNodes(node.rclContratosFechados);
                                    if #contratos < 10 then return end
            
                                    local stars = 0
                                    for i=1, #contratos, 1 do
                                        local contrato = contratos[i]
                                        if contrato.a1 then stars = stars + 1 end
                                        if contrato.a2 then stars = stars + 1 end
                                        if contrato.a3 then stars = stars + 1 end
                                        if contrato.a4 then stars = stars + 1 end
                                        if contrato.a5 then stars = stars + 1 end
                                    end
            
                                    local rep = math.floor((stars/#contratos) + 0.5)
                                    node.reputacao = rep .. "*"
        end, obj);

    function obj:_releaseEvents()
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
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.creditosEdit ~= nil then self.creditosEdit:destroy(); self.creditosEdit = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.espoliosLabel ~= nil then self.espoliosLabel:destroy(); self.espoliosLabel = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.seguroEdit ~= nil then self.seguroEdit:destroy(); self.seguroEdit = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.cbxInvisivel ~= nil then self.cbxInvisivel:destroy(); self.cbxInvisivel = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.espoliosEdit ~= nil then self.espoliosEdit:destroy(); self.espoliosEdit = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.creditosLabel ~= nil then self.creditosLabel:destroy(); self.creditosLabel = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.seguroLabel ~= nil then self.seguroLabel:destroy(); self.seguroLabel = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmContractItemClosed()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmContractItemClosed();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmContractItemClosed = {
    newEditor = newfrmContractItemClosed, 
    new = newfrmContractItemClosed, 
    name = "frmContractItemClosed", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmContractItemClosed = _frmContractItemClosed;
Firecast.registrarForm(_frmContractItemClosed);

return _frmContractItemClosed;
