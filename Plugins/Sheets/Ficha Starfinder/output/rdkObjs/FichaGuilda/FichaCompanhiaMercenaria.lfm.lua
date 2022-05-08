require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaContrato()
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
    obj:setName("frmFichaContrato");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Starfinder.CompanhiaMercenaria");
    obj:setTitle("Ficha Starfinder (Companhia de Mercenarios)");
    obj:setAlign("client");
    obj:setTheme("dark");


        local function isNewVersion(installed, downloaded)
            local installedVersion = {};
            local installedIndex = 0;
            for i in string.gmatch(installed, "[^%.]+") do
                installedIndex = installedIndex +1;
                installedVersion[installedIndex] = i;
            end

            local downloadedVersion = {};
            local downloadedIndex = 0;
            for i in string.gmatch(downloaded, "[^%.]+") do
                downloadedIndex = downloadedIndex +1;
                downloadedVersion[downloadedIndex] = i;
            end

            for i=1, math.min(installedIndex, downloadedIndex), 1 do 
                if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
                    return false;
                elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
                    return true;
                end;
            end;

            if downloadedIndex > installedIndex then
                return true;
            else
                return false;
            end;
        end;
        local function findPopup(myPop)
            local pop = self:findControlByName(myPop);
                
            if pop ~= nil and sheet ~= nil then
                pop:setNodeObject(sheet);
                pop:showPopupEx("center", self);
            elseif pop == nil then
                showMessage("Ops, bug.. nao encontrei o popup para exibir");
            end;                
        end;
        


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Companhia");
    obj.tab1:setName("tab1");

    obj.frmGuild = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGuild:setParent(obj.tab1);
    obj.frmGuild:setName("frmGuild");
    obj.frmGuild:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGuild);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(35);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(300);
    obj.layout1:setMargins({right=5});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(100);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(300);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setWidth(100);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Tendência");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setAlign("client");
    obj.edit2:setField("tendencia");
    obj.edit2:setName("edit2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(150);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setAlign("left");
    obj.label3:setWidth(100);
    obj.label3:setText("Reputação");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle2:setName("rectangle2");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setAlign("client");
    obj.label4:setField("reputacao");
    obj.label4:setName("label4");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(300);
    obj.layout4:setMargins({top=5});
    obj.layout4:setName("layout4");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(300);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setMargins({right=5});
    obj.rectangle3:setName("rectangle3");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle3);
    obj.image1:setAlign("client");
    obj.image1:setField("emblema");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(450);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setMargins({right=5});
    obj.rectangle4:setName("rectangle4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle4);
    obj.label5:setAlign("top");
    obj.label5:setHeight(25);
    obj.label5:setText("Base");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle4);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("base");
    obj.textEditor1:setMargins({bottom=5,left=5,right=5});
    obj.textEditor1:setName("textEditor1");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout4);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(450);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setMargins({right=5});
    obj.rectangle5:setName("rectangle5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle5);
    obj.label6:setAlign("top");
    obj.label6:setHeight(25);
    obj.label6:setText("Descrição");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle5);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setMargins({bottom=5,left=5,right=5});
    obj.textEditor2:setName("textEditor2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Contratos");
    obj.tab2:setName("tab2");

    obj.frmContract = GUI.fromHandle(_obj_newObject("form"));
    obj.frmContract:setParent(obj.tab2);
    obj.frmContract:setName("frmContract");
    obj.frmContract:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmContract);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox2);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxColumns(2);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.rclContratosAbertosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclContratosAbertosPart:setParent(obj.flowLayout1);
    obj.rclContratosAbertosPart:setMinWidth(300);
    obj.rclContratosAbertosPart:setMaxWidth(600);
    obj.rclContratosAbertosPart:setHeight(25);
    obj.rclContratosAbertosPart:setMinScaledWidth(280);
    obj.rclContratosAbertosPart:setName("rclContratosAbertosPart");
    obj.rclContratosAbertosPart:setAdjustHeightToLine(false);
    obj.rclContratosAbertosPart:setMargins({left=5});
    obj.rclContratosAbertosPart:setAvoidScale(true);


                    rawset(self.rclContratosAbertosPart, "_recalcHeight",                    
                        function ()
                            self.rclContratosAbertosPart.height = self.rclContratosAbertos.height + 25;
                        end);
                


    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rclContratosAbertosPart);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout5);
    obj.button1:setText("+");
    obj.button1:setAlign("left");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setText("ABERTOS");
    obj.label7:setAlign("left");
    obj.label7:setWidth(225);
    obj.label7:setMargins({left=5});
    obj.label7:setName("label7");

    obj.rclContratosAbertos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclContratosAbertos:setParent(obj.rclContratosAbertosPart);
    obj.rclContratosAbertos:setName("rclContratosAbertos");
    obj.rclContratosAbertos:setField("rclContratosAbertos");
    obj.rclContratosAbertos:setTemplateForm("frmContractItem");
    obj.rclContratosAbertos:setAlign("top");
    obj.rclContratosAbertos:setLayout("vertical");
    obj.rclContratosAbertos:setAutoHeight(true);
    obj.rclContratosAbertos:setHitTest(false);
    obj.rclContratosAbertos:setMinQt(0);

    obj.rclContratosPrivadosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclContratosPrivadosPart:setParent(obj.flowLayout1);
    obj.rclContratosPrivadosPart:setMinWidth(300);
    obj.rclContratosPrivadosPart:setMaxWidth(600);
    obj.rclContratosPrivadosPart:setHeight(25);
    obj.rclContratosPrivadosPart:setMinScaledWidth(280);
    obj.rclContratosPrivadosPart:setName("rclContratosPrivadosPart");
    obj.rclContratosPrivadosPart:setAdjustHeightToLine(false);
    obj.rclContratosPrivadosPart:setMargins({left=5});
    obj.rclContratosPrivadosPart:setAvoidScale(true);


                    rawset(self.rclContratosPrivadosPart, "_recalcHeight",                    
                        function ()
                            self.rclContratosPrivadosPart.height = self.rclContratosPrivados.height + 25;
                        end);
                


    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rclContratosPrivadosPart);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout6);
    obj.button2:setText("+");
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setName("button2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout6);
    obj.label8:setText("PRIVADOS");
    obj.label8:setAlign("left");
    obj.label8:setWidth(225);
    obj.label8:setMargins({left=5});
    obj.label8:setName("label8");

    obj.rclContratosPrivados = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclContratosPrivados:setParent(obj.rclContratosPrivadosPart);
    obj.rclContratosPrivados:setName("rclContratosPrivados");
    obj.rclContratosPrivados:setField("rclContratosPrivados");
    obj.rclContratosPrivados:setTemplateForm("frmContractItem");
    obj.rclContratosPrivados:setAlign("top");
    obj.rclContratosPrivados:setLayout("vertical");
    obj.rclContratosPrivados:setAutoHeight(true);
    obj.rclContratosPrivados:setHitTest(false);
    obj.rclContratosPrivados:setMinQt(0);

    obj.rclContratosFechadosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclContratosFechadosPart:setParent(obj.flowLayout1);
    obj.rclContratosFechadosPart:setMinWidth(300);
    obj.rclContratosFechadosPart:setMaxWidth(600);
    obj.rclContratosFechadosPart:setHeight(25);
    obj.rclContratosFechadosPart:setMinScaledWidth(280);
    obj.rclContratosFechadosPart:setName("rclContratosFechadosPart");
    obj.rclContratosFechadosPart:setAdjustHeightToLine(false);
    obj.rclContratosFechadosPart:setMargins({left=5});
    obj.rclContratosFechadosPart:setAvoidScale(true);


                    rawset(self.rclContratosFechadosPart, "_recalcHeight",                    
                        function ()
                            self.rclContratosFechadosPart.height = self.rclContratosFechados.height + 25;
                        end);
                


    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rclContratosFechadosPart);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout7);
    obj.button3:setText("+");
    obj.button3:setAlign("left");
    obj.button3:setWidth(30);
    obj.button3:setName("button3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout7);
    obj.label9:setText("FECHADOS");
    obj.label9:setAlign("left");
    obj.label9:setWidth(225);
    obj.label9:setMargins({left=5});
    obj.label9:setName("label9");

    obj.rclContratosFechados = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclContratosFechados:setParent(obj.rclContratosFechadosPart);
    obj.rclContratosFechados:setName("rclContratosFechados");
    obj.rclContratosFechados:setField("rclContratosFechados");
    obj.rclContratosFechados:setTemplateForm("frmContractItemClosed");
    obj.rclContratosFechados:setAlign("top");
    obj.rclContratosFechados:setLayout("vertical");
    obj.rclContratosFechados:setAutoHeight(true);
    obj.rclContratosFechados:setHitTest(false);
    obj.rclContratosFechados:setMinQt(0);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Contratantes");
    obj.tab3:setName("tab3");

    obj.frmContractor = GUI.fromHandle(_obj_newObject("form"));
    obj.frmContractor:setParent(obj.tab3);
    obj.frmContractor:setName("frmContractor");
    obj.frmContractor:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmContractor);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox3);
    obj.button4:setText("Novo");
    obj.button4:setAlign("top");
    obj.button4:setHeight(30);
    obj.button4:setName("button4");

    obj.rclContractor = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclContractor:setParent(obj.scrollBox3);
    obj.rclContractor:setName("rclContractor");
    obj.rclContractor:setField("rclContractor");
    obj.rclContractor:setTemplateForm("frmContractorItem");
    obj.rclContractor:setAlign("top");
    obj.rclContractor:setLayout("verticalTiles");
    obj.rclContractor:setAutoHeight(true);
    obj.rclContractor:setHitTest(false);
    obj.rclContractor:setMinQt(0);

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Inventario");
    obj.tab4:setName("tab4");

    obj.frmInventory = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInventory:setParent(obj.tab4);
    obj.frmInventory:setName("frmInventory");
    obj.frmInventory:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmInventory);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox4);
    obj.rectangle6:setAlign("top");
    obj.rectangle6:setHeight(35);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle6:setName("rectangle6");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle6);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(300);
    obj.layout8:setMargins({right=5});
    obj.layout8:setName("layout8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setAlign("left");
    obj.label10:setWidth(100);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Creditos");
    obj.label10:setName("label10");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("client");
    obj.layout9:setName("layout9");

    obj.creditosLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.creditosLabel:setParent(obj.layout9);
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

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.creditosLabel);
    obj.label11:setAlign("client");
    obj.label11:setField("creditos");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(11);
    lfm_setPropAsString(obj.label11, "formatFloat",  ",0.## C");
    obj.label11:setName("label11");

    obj.creditosEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.creditosEdit:setParent(obj.layout9);
    obj.creditosEdit:setField("creditos");
    obj.creditosEdit:setAlign("client");
    obj.creditosEdit:setType("float");
    obj.creditosEdit:setFontSize(11);
    obj.creditosEdit:setName("creditosEdit");
    obj.creditosEdit:setVisible(false);

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle6);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(300);
    obj.layout10:setMargins({right=5});
    obj.layout10:setName("layout10");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12:setAlign("left");
    obj.label12:setWidth(100);
    obj.label12:setText("Ativos");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout10);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle7:setName("rectangle7");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle7);
    obj.label13:setAlign("client");
    obj.label13:setField("recursosGastos");
    lfm_setPropAsString(obj.label13, "formatFloat",  ",0.## C");
    obj.label13:setName("label13");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle6);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(300);
    obj.layout11:setMargins({right=5});
    obj.layout11:setName("layout11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setAlign("left");
    obj.label14:setWidth(100);
    obj.label14:setText("Caixa");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout11);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle8:setName("rectangle8");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle8);
    obj.label15:setAlign("client");
    obj.label15:setField("recursosLivres");
    lfm_setPropAsString(obj.label15, "formatFloat",  ",0.## C");
    obj.label15:setName("label15");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.scrollBox4);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxColumns(3);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setOrientation("vertical");
    obj.flowLayout2:setAvoidScale(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.rclInventarioNavesPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclInventarioNavesPart:setParent(obj.flowLayout2);
    obj.rclInventarioNavesPart:setMinWidth(300);
    obj.rclInventarioNavesPart:setMaxWidth(600);
    obj.rclInventarioNavesPart:setHeight(25);
    obj.rclInventarioNavesPart:setMinScaledWidth(280);
    obj.rclInventarioNavesPart:setName("rclInventarioNavesPart");
    obj.rclInventarioNavesPart:setAdjustHeightToLine(false);
    obj.rclInventarioNavesPart:setMargins({left=5});
    obj.rclInventarioNavesPart:setAvoidScale(true);


                    rawset(self.rclInventarioNavesPart, "_recalcHeight",                    
                        function ()
                            self.rclInventarioNavesPart.height = self.rclInventarioNaves.height + 25;
                        end);
                


    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rclInventarioNavesPart);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout12);
    obj.button5:setText("+");
    obj.button5:setAlign("left");
    obj.button5:setWidth(30);
    obj.button5:setName("button5");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout12);
    obj.label16:setText("NAVES");
    obj.label16:setAlign("left");
    obj.label16:setWidth(225);
    obj.label16:setMargins({left=5});
    obj.label16:setName("label16");

    obj.rclInventarioNaves = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventarioNaves:setParent(obj.rclInventarioNavesPart);
    obj.rclInventarioNaves:setName("rclInventarioNaves");
    obj.rclInventarioNaves:setField("rclInventarioNaves");
    obj.rclInventarioNaves:setTemplateForm("frmInventaryItem");
    obj.rclInventarioNaves:setAlign("top");
    obj.rclInventarioNaves:setLayout("vertical");
    obj.rclInventarioNaves:setAutoHeight(true);
    obj.rclInventarioNaves:setHitTest(false);
    obj.rclInventarioNaves:setMinQt(0);

    obj.rclInventarioMechasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclInventarioMechasPart:setParent(obj.flowLayout2);
    obj.rclInventarioMechasPart:setMinWidth(300);
    obj.rclInventarioMechasPart:setMaxWidth(600);
    obj.rclInventarioMechasPart:setHeight(25);
    obj.rclInventarioMechasPart:setMinScaledWidth(280);
    obj.rclInventarioMechasPart:setName("rclInventarioMechasPart");
    obj.rclInventarioMechasPart:setAdjustHeightToLine(false);
    obj.rclInventarioMechasPart:setMargins({left=5});
    obj.rclInventarioMechasPart:setAvoidScale(true);


                    rawset(self.rclInventarioMechasPart, "_recalcHeight",                    
                        function ()
                            self.rclInventarioMechasPart.height = self.rclInventarioMechas.height + 25;
                        end);
                


    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rclInventarioMechasPart);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout13);
    obj.button6:setText("+");
    obj.button6:setAlign("left");
    obj.button6:setWidth(30);
    obj.button6:setName("button6");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout13);
    obj.label17:setText("MECHAS");
    obj.label17:setAlign("left");
    obj.label17:setWidth(225);
    obj.label17:setMargins({left=5});
    obj.label17:setName("label17");

    obj.rclInventarioMechas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventarioMechas:setParent(obj.rclInventarioMechasPart);
    obj.rclInventarioMechas:setName("rclInventarioMechas");
    obj.rclInventarioMechas:setField("rclInventarioMechas");
    obj.rclInventarioMechas:setTemplateForm("frmInventaryItem");
    obj.rclInventarioMechas:setAlign("top");
    obj.rclInventarioMechas:setLayout("vertical");
    obj.rclInventarioMechas:setAutoHeight(true);
    obj.rclInventarioMechas:setHitTest(false);
    obj.rclInventarioMechas:setMinQt(0);

    obj.rclInventarioVeiculosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclInventarioVeiculosPart:setParent(obj.flowLayout2);
    obj.rclInventarioVeiculosPart:setMinWidth(300);
    obj.rclInventarioVeiculosPart:setMaxWidth(600);
    obj.rclInventarioVeiculosPart:setHeight(25);
    obj.rclInventarioVeiculosPart:setMinScaledWidth(280);
    obj.rclInventarioVeiculosPart:setName("rclInventarioVeiculosPart");
    obj.rclInventarioVeiculosPart:setAdjustHeightToLine(false);
    obj.rclInventarioVeiculosPart:setMargins({left=5});
    obj.rclInventarioVeiculosPart:setAvoidScale(true);


                    rawset(self.rclInventarioVeiculosPart, "_recalcHeight",                    
                        function ()
                            self.rclInventarioVeiculosPart.height = self.rclInventarioVeiculos.height + 25;
                        end);
                


    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rclInventarioVeiculosPart);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout14);
    obj.button7:setText("+");
    obj.button7:setAlign("left");
    obj.button7:setWidth(30);
    obj.button7:setName("button7");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout14);
    obj.label18:setText("VEICULOS");
    obj.label18:setAlign("left");
    obj.label18:setWidth(225);
    obj.label18:setMargins({left=5});
    obj.label18:setName("label18");

    obj.rclInventarioVeiculos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventarioVeiculos:setParent(obj.rclInventarioVeiculosPart);
    obj.rclInventarioVeiculos:setName("rclInventarioVeiculos");
    obj.rclInventarioVeiculos:setField("rclInventarioVeiculos");
    obj.rclInventarioVeiculos:setTemplateForm("frmInventaryItem");
    obj.rclInventarioVeiculos:setAlign("top");
    obj.rclInventarioVeiculos:setLayout("vertical");
    obj.rclInventarioVeiculos:setAutoHeight(true);
    obj.rclInventarioVeiculos:setHitTest(false);
    obj.rclInventarioVeiculos:setMinQt(0);

    obj.rclInventarioEquipamentosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclInventarioEquipamentosPart:setParent(obj.flowLayout2);
    obj.rclInventarioEquipamentosPart:setMinWidth(300);
    obj.rclInventarioEquipamentosPart:setMaxWidth(600);
    obj.rclInventarioEquipamentosPart:setHeight(25);
    obj.rclInventarioEquipamentosPart:setMinScaledWidth(280);
    obj.rclInventarioEquipamentosPart:setName("rclInventarioEquipamentosPart");
    obj.rclInventarioEquipamentosPart:setAdjustHeightToLine(false);
    obj.rclInventarioEquipamentosPart:setMargins({left=5});
    obj.rclInventarioEquipamentosPart:setAvoidScale(true);


                    rawset(self.rclInventarioEquipamentosPart, "_recalcHeight",                    
                        function ()
                            self.rclInventarioEquipamentosPart.height = self.rclInventarioEquipamentos.height + 25;
                        end);
                


    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rclInventarioEquipamentosPart);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout15);
    obj.button8:setText("+");
    obj.button8:setAlign("left");
    obj.button8:setWidth(30);
    obj.button8:setName("button8");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout15);
    obj.label19:setText("EQUIPAMENTOS");
    obj.label19:setAlign("left");
    obj.label19:setWidth(225);
    obj.label19:setMargins({left=5});
    obj.label19:setName("label19");

    obj.rclInventarioEquipamentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventarioEquipamentos:setParent(obj.rclInventarioEquipamentosPart);
    obj.rclInventarioEquipamentos:setName("rclInventarioEquipamentos");
    obj.rclInventarioEquipamentos:setField("rclInventarioEquipamentos");
    obj.rclInventarioEquipamentos:setTemplateForm("frmInventaryItem");
    obj.rclInventarioEquipamentos:setAlign("top");
    obj.rclInventarioEquipamentos:setLayout("vertical");
    obj.rclInventarioEquipamentos:setAutoHeight(true);
    obj.rclInventarioEquipamentos:setHitTest(false);
    obj.rclInventarioEquipamentos:setMinQt(0);

    obj.rclInventarioArmasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclInventarioArmasPart:setParent(obj.flowLayout2);
    obj.rclInventarioArmasPart:setMinWidth(300);
    obj.rclInventarioArmasPart:setMaxWidth(600);
    obj.rclInventarioArmasPart:setHeight(25);
    obj.rclInventarioArmasPart:setMinScaledWidth(280);
    obj.rclInventarioArmasPart:setName("rclInventarioArmasPart");
    obj.rclInventarioArmasPart:setAdjustHeightToLine(false);
    obj.rclInventarioArmasPart:setMargins({left=5});
    obj.rclInventarioArmasPart:setAvoidScale(true);


                    rawset(self.rclInventarioArmasPart, "_recalcHeight",                    
                        function ()
                            self.rclInventarioArmasPart.height = self.rclInventarioArmas.height + 25;
                        end);
                


    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rclInventarioArmasPart);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout16);
    obj.button9:setText("+");
    obj.button9:setAlign("left");
    obj.button9:setWidth(30);
    obj.button9:setName("button9");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout16);
    obj.label20:setText("ARMAS");
    obj.label20:setAlign("left");
    obj.label20:setWidth(225);
    obj.label20:setMargins({left=5});
    obj.label20:setName("label20");

    obj.rclInventarioArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventarioArmas:setParent(obj.rclInventarioArmasPart);
    obj.rclInventarioArmas:setName("rclInventarioArmas");
    obj.rclInventarioArmas:setField("rclInventarioArmas");
    obj.rclInventarioArmas:setTemplateForm("frmInventaryItem");
    obj.rclInventarioArmas:setAlign("top");
    obj.rclInventarioArmas:setLayout("vertical");
    obj.rclInventarioArmas:setAutoHeight(true);
    obj.rclInventarioArmas:setHitTest(false);
    obj.rclInventarioArmas:setMinQt(0);

    obj.rclInventarioMunicaoPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclInventarioMunicaoPart:setParent(obj.flowLayout2);
    obj.rclInventarioMunicaoPart:setMinWidth(300);
    obj.rclInventarioMunicaoPart:setMaxWidth(600);
    obj.rclInventarioMunicaoPart:setHeight(25);
    obj.rclInventarioMunicaoPart:setMinScaledWidth(280);
    obj.rclInventarioMunicaoPart:setName("rclInventarioMunicaoPart");
    obj.rclInventarioMunicaoPart:setAdjustHeightToLine(false);
    obj.rclInventarioMunicaoPart:setMargins({left=5});
    obj.rclInventarioMunicaoPart:setAvoidScale(true);


                    rawset(self.rclInventarioMunicaoPart, "_recalcHeight",                    
                        function ()
                            self.rclInventarioMunicaoPart.height = self.rclInventarioMunicao.height + 25;
                        end);
                


    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rclInventarioMunicaoPart);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout17);
    obj.button10:setText("+");
    obj.button10:setAlign("left");
    obj.button10:setWidth(30);
    obj.button10:setName("button10");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout17);
    obj.label21:setText("MUNIÇÃO");
    obj.label21:setAlign("left");
    obj.label21:setWidth(225);
    obj.label21:setMargins({left=5});
    obj.label21:setName("label21");

    obj.rclInventarioMunicao = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventarioMunicao:setParent(obj.rclInventarioMunicaoPart);
    obj.rclInventarioMunicao:setName("rclInventarioMunicao");
    obj.rclInventarioMunicao:setField("rclInventarioMunicao");
    obj.rclInventarioMunicao:setTemplateForm("frmInventaryItem");
    obj.rclInventarioMunicao:setAlign("top");
    obj.rclInventarioMunicao:setLayout("vertical");
    obj.rclInventarioMunicao:setAutoHeight(true);
    obj.rclInventarioMunicao:setHitTest(false);
    obj.rclInventarioMunicao:setMinQt(0);

    obj.rclInventarioPecasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclInventarioPecasPart:setParent(obj.flowLayout2);
    obj.rclInventarioPecasPart:setMinWidth(300);
    obj.rclInventarioPecasPart:setMaxWidth(600);
    obj.rclInventarioPecasPart:setHeight(25);
    obj.rclInventarioPecasPart:setMinScaledWidth(280);
    obj.rclInventarioPecasPart:setName("rclInventarioPecasPart");
    obj.rclInventarioPecasPart:setAdjustHeightToLine(false);
    obj.rclInventarioPecasPart:setMargins({left=5});
    obj.rclInventarioPecasPart:setAvoidScale(true);


                    rawset(self.rclInventarioPecasPart, "_recalcHeight",                    
                        function ()
                            self.rclInventarioPecasPart.height = self.rclInventarioPecas.height + 25;
                        end);
                


    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rclInventarioPecasPart);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout18);
    obj.button11:setText("+");
    obj.button11:setAlign("left");
    obj.button11:setWidth(30);
    obj.button11:setName("button11");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout18);
    obj.label22:setText("PEÇAS");
    obj.label22:setAlign("left");
    obj.label22:setWidth(225);
    obj.label22:setMargins({left=5});
    obj.label22:setName("label22");

    obj.rclInventarioPecas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventarioPecas:setParent(obj.rclInventarioPecasPart);
    obj.rclInventarioPecas:setName("rclInventarioPecas");
    obj.rclInventarioPecas:setField("rclInventarioPecas");
    obj.rclInventarioPecas:setTemplateForm("frmInventaryItem");
    obj.rclInventarioPecas:setAlign("top");
    obj.rclInventarioPecas:setLayout("vertical");
    obj.rclInventarioPecas:setAutoHeight(true);
    obj.rclInventarioPecas:setHitTest(false);
    obj.rclInventarioPecas:setMinQt(0);

    obj.rclInventarioOutrosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.rclInventarioOutrosPart:setParent(obj.flowLayout2);
    obj.rclInventarioOutrosPart:setMinWidth(300);
    obj.rclInventarioOutrosPart:setMaxWidth(600);
    obj.rclInventarioOutrosPart:setHeight(25);
    obj.rclInventarioOutrosPart:setMinScaledWidth(280);
    obj.rclInventarioOutrosPart:setName("rclInventarioOutrosPart");
    obj.rclInventarioOutrosPart:setAdjustHeightToLine(false);
    obj.rclInventarioOutrosPart:setMargins({left=5});
    obj.rclInventarioOutrosPart:setAvoidScale(true);


                    rawset(self.rclInventarioOutrosPart, "_recalcHeight",                    
                        function ()
                            self.rclInventarioOutrosPart.height = self.rclInventarioOutros.height + 25;
                        end);
                


    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rclInventarioOutrosPart);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout19);
    obj.button12:setText("+");
    obj.button12:setAlign("left");
    obj.button12:setWidth(30);
    obj.button12:setName("button12");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout19);
    obj.label23:setText("OUTROS");
    obj.label23:setAlign("left");
    obj.label23:setWidth(225);
    obj.label23:setMargins({left=5});
    obj.label23:setName("label23");

    obj.rclInventarioOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventarioOutros:setParent(obj.rclInventarioOutrosPart);
    obj.rclInventarioOutros:setName("rclInventarioOutros");
    obj.rclInventarioOutros:setField("rclInventarioOutros");
    obj.rclInventarioOutros:setTemplateForm("frmInventaryItem");
    obj.rclInventarioOutros:setAlign("top");
    obj.rclInventarioOutros:setLayout("vertical");
    obj.rclInventarioOutros:setAutoHeight(true);
    obj.rclInventarioOutros:setHitTest(false);
    obj.rclInventarioOutros:setMinQt(0);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.frmInventory);
    obj.dataLink1:setFields({'creditos','recursosGastos'});
    obj.dataLink1:setName("dataLink1");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmFichaRPGmeister10_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab5);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");

		
		local function fullResize()
			local height = self.notes.height / 3;
			
			self.anotacoes1.height = height-25;
			self.anotacoes1Part.height = height;
			self.anotacoes2.height = height-25;
			self.anotacoes2Part.height = height;
			self.anotacoes3.height = height-25;
			self.anotacoes3Part.height = height;
			self.anotacoes4.height = height-25;
			self.anotacoes4Part.height = height;
			self.anotacoes5.height = height-25;
			self.anotacoes5Part.height = height;
			self.anotacoes6.height = height-25;
			self.anotacoes6Part.height = height;
			self.anotacoes7.height = height-25;
			self.anotacoes7Part.height = height;
			self.anotacoes8.height = height-25;
			self.anotacoes8Part.height = height;
			self.anotacoes9.height = height-25;
			self.anotacoes9Part.height = height;
		end;
	


    obj.notes = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.notes:setParent(obj.frmFichaRPGmeister10_svg);
    obj.notes:setAlign("client");
    obj.notes:setName("notes");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.notes);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxColumns(3);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setOrientation("vertical");
    obj.flowLayout3:setAvoidScale(true);
    obj.flowLayout3:setName("flowLayout3");

    obj.anotacoes1Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes1Part:setParent(obj.flowLayout3);
    obj.anotacoes1Part:setMinWidth(300);
    obj.anotacoes1Part:setMaxWidth(600);
    obj.anotacoes1Part:setMinScaledWidth(280);
    obj.anotacoes1Part:setName("anotacoes1Part");
    obj.anotacoes1Part:setAdjustHeightToLine(false);
    obj.anotacoes1Part:setMargins({left=5});

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.anotacoes1Part);
    obj.label24:setAlign("top");
    obj.label24:setHeight(25);
    obj.label24:setText("ANOTAÇÕES");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.anotacoes1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes1:setParent(obj.anotacoes1Part);
    obj.anotacoes1:setAlign("top");
    obj.anotacoes1:setField("anotacoes1");
    obj.anotacoes1:setHeight(52);
    obj.anotacoes1:setName("anotacoes1");

    obj.anotacoes2Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes2Part:setParent(obj.flowLayout3);
    obj.anotacoes2Part:setMinWidth(300);
    obj.anotacoes2Part:setMaxWidth(600);
    obj.anotacoes2Part:setMinScaledWidth(280);
    obj.anotacoes2Part:setName("anotacoes2Part");
    obj.anotacoes2Part:setAdjustHeightToLine(false);
    obj.anotacoes2Part:setMargins({left=5});

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.anotacoes2Part);
    obj.label25:setAlign("top");
    obj.label25:setHeight(25);
    obj.label25:setText("ANOTAÇÕES");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.anotacoes2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes2:setParent(obj.anotacoes2Part);
    obj.anotacoes2:setAlign("top");
    obj.anotacoes2:setField("anotacoes2");
    obj.anotacoes2:setHeight(52);
    obj.anotacoes2:setName("anotacoes2");

    obj.anotacoes3Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes3Part:setParent(obj.flowLayout3);
    obj.anotacoes3Part:setMinWidth(300);
    obj.anotacoes3Part:setMaxWidth(600);
    obj.anotacoes3Part:setMinScaledWidth(280);
    obj.anotacoes3Part:setName("anotacoes3Part");
    obj.anotacoes3Part:setAdjustHeightToLine(false);
    obj.anotacoes3Part:setMargins({left=5});

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.anotacoes3Part);
    obj.label26:setAlign("top");
    obj.label26:setHeight(25);
    obj.label26:setText("ANOTAÇÕES");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.anotacoes3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes3:setParent(obj.anotacoes3Part);
    obj.anotacoes3:setAlign("top");
    obj.anotacoes3:setField("anotacoes3");
    obj.anotacoes3:setHeight(52);
    obj.anotacoes3:setName("anotacoes3");

    obj.anotacoes4Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes4Part:setParent(obj.flowLayout3);
    obj.anotacoes4Part:setMinWidth(300);
    obj.anotacoes4Part:setMaxWidth(600);
    obj.anotacoes4Part:setMinScaledWidth(280);
    obj.anotacoes4Part:setName("anotacoes4Part");
    obj.anotacoes4Part:setAdjustHeightToLine(false);
    obj.anotacoes4Part:setMargins({left=5});

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.anotacoes4Part);
    obj.label27:setAlign("top");
    obj.label27:setHeight(25);
    obj.label27:setText("ANOTAÇÕES");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.anotacoes4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes4:setParent(obj.anotacoes4Part);
    obj.anotacoes4:setAlign("top");
    obj.anotacoes4:setField("anotacoes4");
    obj.anotacoes4:setHeight(52);
    obj.anotacoes4:setName("anotacoes4");

    obj.anotacoes5Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes5Part:setParent(obj.flowLayout3);
    obj.anotacoes5Part:setMinWidth(300);
    obj.anotacoes5Part:setMaxWidth(600);
    obj.anotacoes5Part:setMinScaledWidth(280);
    obj.anotacoes5Part:setName("anotacoes5Part");
    obj.anotacoes5Part:setAdjustHeightToLine(false);
    obj.anotacoes5Part:setMargins({left=5});

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.anotacoes5Part);
    obj.label28:setAlign("top");
    obj.label28:setHeight(25);
    obj.label28:setText("ANOTAÇÕES");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.anotacoes5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes5:setParent(obj.anotacoes5Part);
    obj.anotacoes5:setAlign("top");
    obj.anotacoes5:setField("anotacoes5");
    obj.anotacoes5:setHeight(52);
    obj.anotacoes5:setName("anotacoes5");

    obj.anotacoes6Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes6Part:setParent(obj.flowLayout3);
    obj.anotacoes6Part:setMinWidth(300);
    obj.anotacoes6Part:setMaxWidth(600);
    obj.anotacoes6Part:setMinScaledWidth(280);
    obj.anotacoes6Part:setName("anotacoes6Part");
    obj.anotacoes6Part:setAdjustHeightToLine(false);
    obj.anotacoes6Part:setMargins({left=5});

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.anotacoes6Part);
    obj.label29:setAlign("top");
    obj.label29:setHeight(25);
    obj.label29:setText("ANOTAÇÕES");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.anotacoes6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes6:setParent(obj.anotacoes6Part);
    obj.anotacoes6:setAlign("top");
    obj.anotacoes6:setField("anotacoes6");
    obj.anotacoes6:setHeight(52);
    obj.anotacoes6:setName("anotacoes6");

    obj.anotacoes7Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes7Part:setParent(obj.flowLayout3);
    obj.anotacoes7Part:setMinWidth(300);
    obj.anotacoes7Part:setMaxWidth(600);
    obj.anotacoes7Part:setMinScaledWidth(280);
    obj.anotacoes7Part:setName("anotacoes7Part");
    obj.anotacoes7Part:setAdjustHeightToLine(false);
    obj.anotacoes7Part:setMargins({left=5});

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.anotacoes7Part);
    obj.label30:setAlign("top");
    obj.label30:setHeight(25);
    obj.label30:setText("ANOTAÇÕES");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.anotacoes7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes7:setParent(obj.anotacoes7Part);
    obj.anotacoes7:setAlign("top");
    obj.anotacoes7:setField("anotacoes7");
    obj.anotacoes7:setHeight(52);
    obj.anotacoes7:setName("anotacoes7");

    obj.anotacoes8Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes8Part:setParent(obj.flowLayout3);
    obj.anotacoes8Part:setMinWidth(300);
    obj.anotacoes8Part:setMaxWidth(600);
    obj.anotacoes8Part:setMinScaledWidth(280);
    obj.anotacoes8Part:setName("anotacoes8Part");
    obj.anotacoes8Part:setAdjustHeightToLine(false);
    obj.anotacoes8Part:setMargins({left=5});

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.anotacoes8Part);
    obj.label31:setAlign("top");
    obj.label31:setHeight(25);
    obj.label31:setText("ANOTAÇÕES");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.anotacoes8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes8:setParent(obj.anotacoes8Part);
    obj.anotacoes8:setAlign("top");
    obj.anotacoes8:setField("anotacoes8");
    obj.anotacoes8:setHeight(52);
    obj.anotacoes8:setName("anotacoes8");

    obj.anotacoes9Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes9Part:setParent(obj.flowLayout3);
    obj.anotacoes9Part:setMinWidth(300);
    obj.anotacoes9Part:setMaxWidth(600);
    obj.anotacoes9Part:setMinScaledWidth(280);
    obj.anotacoes9Part:setName("anotacoes9Part");
    obj.anotacoes9Part:setAdjustHeightToLine(false);
    obj.anotacoes9Part:setMargins({left=5});

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.anotacoes9Part);
    obj.label32:setAlign("top");
    obj.label32:setHeight(25);
    obj.label32:setText("ANOTAÇÕES");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.anotacoes9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes9:setParent(obj.anotacoes9Part);
    obj.anotacoes9:setAlign("top");
    obj.anotacoes9:setField("anotacoes9");
    obj.anotacoes9:setHeight(52);
    obj.anotacoes9:setName("anotacoes9");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmFichaRPGmeister11_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab6);
    obj.frmFichaRPGmeister11_svg:setName("frmFichaRPGmeister11_svg");
    obj.frmFichaRPGmeister11_svg:setAlign("client");
    obj.frmFichaRPGmeister11_svg:setTheme("dark");


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				if node:getClassName() == "recordList" then
					children = rclKids(node);
					--write(children[1]:getClassName());

					children = rclKids(children[1]);
				end;
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
			end;

			function rclKids(rcl)
				local ret = {};
				local i;
				local childCount = _obj_getProp(rcl.handle, "ChildrenCount");
				local child;
				local childHandle;
				local idxDest = 1;
					
				for i = 0, childCount - 1, 1 do
					childHandle = _gui_getChild(rcl.handle, i);
					
					if (childHandle ~= nil) then							
						child = gui.fromHandle(childHandle);
						
						if (type(child) == "table") then							
							ret[idxDest] = child;
							idxDest = idxDest + 1;
						end
					end;	
				end
				
				return ret;
			end;

			local function findAllControls()
				local controlsList = {self};
				recursiveFindControls(self, controlsList);
				
				return controlsList;
			end;

			local function filterByClass(className, controls)
				local controlsFromClass = {};

				for i=1, #controls, 1 do
					if controls[i]:getClassName() == className then
						controlsFromClass[#controlsFromClass + 1] = controls[i];
					end;
				end;

				return controlsFromClass;
			end;

			local function findClass(className)
				local controls = findAllControls();
				return filterByClass(className, controls);
			end;

		


    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmFichaRPGmeister11_svg);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox5);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(600);
    obj.image2:setHeight(600);
    obj.image2:setSRC("images/RPGmeister.jpg");
    obj.image2:setStyle("stretch");
    obj.image2:setOptimize(true);
    obj.image2:setName("image2");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox5);
    obj.layout20:setLeft(620);
    obj.layout20:setTop(10);
    obj.layout20:setWidth(200);
    obj.layout20:setHeight(220);
    obj.layout20:setName("layout20");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout20);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(15);
    obj.rectangle9:setYradius(15);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setName("rectangle9");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout20);
    obj.label33:setLeft(0);
    obj.label33:setTop(10);
    obj.label33:setWidth(200);
    obj.label33:setHeight(20);
    obj.label33:setText("Programador: Vinny (Ambesek)");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout20);
    obj.label34:setLeft(0);
    obj.label34:setTop(170);
    obj.label34:setWidth(200);
    obj.label34:setHeight(20);
    obj.label34:setText("Ficha feita para a mesa: ");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout20);
    obj.label35:setLeft(0);
    obj.label35:setTop(195);
    obj.label35:setWidth(200);
    obj.label35:setHeight(20);
    obj.label35:setText("StarTech");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox5);
    obj.layout21:setLeft(620);
    obj.layout21:setTop(240);
    obj.layout21:setWidth(200);
    obj.layout21:setHeight(150);
    obj.layout21:setName("layout21");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout21);
    obj.rectangle10:setLeft(0);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(200);
    obj.rectangle10:setHeight(150);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout21);
    obj.label36:setLeft(0);
    obj.label36:setTop(10);
    obj.label36:setWidth(80);
    obj.label36:setHeight(20);
    obj.label36:setText("Tema:");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout21);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout21);
    obj.dataLink2:setField("theme");
    obj.dataLink2:setDefaultValue("Escuro");
    obj.dataLink2:setName("dataLink2");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout21);
    obj.label37:setLeft(0);
    obj.label37:setTop(35);
    obj.label37:setWidth(90);
    obj.label37:setHeight(20);
    obj.label37:setText("Cores: ");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout21);
    obj.label38:setLeft(0);
    obj.label38:setTop(60);
    obj.label38:setWidth(90);
    obj.label38:setHeight(20);
    obj.label38:setText("Fundo ");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout21);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout21);
    obj.dataLink3:setField("colorBackground");
    obj.dataLink3:setDefaultValue("#000000");
    obj.dataLink3:setName("dataLink3");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout21);
    obj.label39:setLeft(0);
    obj.label39:setTop(85);
    obj.label39:setWidth(90);
    obj.label39:setHeight(20);
    obj.label39:setText("Linhas ");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout21);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout21);
    obj.dataLink4:setField("colorStroke");
    obj.dataLink4:setDefaultValue("#FFFFFF");
    obj.dataLink4:setName("dataLink4");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout21);
    obj.label40:setLeft(0);
    obj.label40:setTop(110);
    obj.label40:setWidth(90);
    obj.label40:setHeight(20);
    obj.label40:setText("Fonte ");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout21);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout21);
    obj.dataLink5:setField("colorFont");
    obj.dataLink5:setDefaultValue("#FFFFFF");
    obj.dataLink5:setName("dataLink5");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox5);
    obj.layout22:setLeft(830);
    obj.layout22:setTop(0);
    obj.layout22:setWidth(400);
    obj.layout22:setHeight(350);
    obj.layout22:setName("layout22");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout22);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout22);
    obj.label41:setLeft(0);
    obj.label41:setTop(0);
    obj.label41:setWidth(400);
    obj.label41:setHeight(20);
    obj.label41:setText("ANOTAÇÕES DO MESTRE");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout22);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(320);
    obj.textEditor3:setField("anotacoes_do_mestre");
    obj.textEditor3:setName("textEditor3");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.scrollBox5);
    obj.label42:setLeft(630);
    obj.label42:setTop(400);
    obj.label42:setWidth(200);
    obj.label42:setHeight(20);
    obj.label42:setText("SUA VERSÃO:");
    obj.label42:setField("versionInstalled");
    obj.label42:setName("label42");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.scrollBox5);
    obj.label43:setLeft(630);
    obj.label43:setTop(420);
    obj.label43:setWidth(200);
    obj.label43:setHeight(20);
    obj.label43:setText("VERSÃO ATUAL:");
    obj.label43:setField("versionDownloaded");
    obj.label43:setName("label43");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox5);
    obj.checkBox1:setLeft(620);
    obj.checkBox1:setTop(440);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox5);
    obj.button13:setLeft(620);
    obj.button13:setTop(475);
    obj.button13:setWidth(100);
    obj.button13:setText("Change Log");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.scrollBox5);
    obj.button14:setLeft(730);
    obj.button14:setTop(475);
    obj.button14:setWidth(100);
    obj.button14:setText("Atualizar");
    obj.button14:setName("button14");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.scrollBox5);
    obj.label44:setLeft(620);
    obj.label44:setTop(525);
    obj.label44:setWidth(120);
    obj.label44:setHeight(20);
    obj.label44:setText("CONHEÇA A MESA:");
    obj.label44:setFontSize(11);
    obj.label44:setName("label44");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.scrollBox5);
    obj.button15:setLeft(730);
    obj.button15:setTop(525);
    obj.button15:setWidth(100);
    obj.button15:setText("RPGmeister");
    obj.button15:setName("button15");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox5);
    obj.button16:setLeft(840);
    obj.button16:setTop(525);
    obj.button16:setWidth(100);
    obj.button16:setText("StarTech");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.scrollBox5);
    obj.button17:setLeft(730);
    obj.button17:setTop(550);
    obj.button17:setWidth(100);
    obj.button17:setHeight(20);
    obj.button17:setText("Exportar Ficha");
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.scrollBox5);
    obj.button18:setLeft(840);
    obj.button18:setTop(550);
    obj.button18:setWidth(100);
    obj.button18:setHeight(20);
    obj.button18:setText("Importar Ficha");
    obj.button18:setName("button18");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true",
                        function(stream, contentType)
                            local info = Firecast.Plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = Firecast.Plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão(" .. info.version .. ") da Ficha Starfinder. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            --showMessage(errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end,
                        "checkForModification");
        end, obj);

    obj._e_event1 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.emblema);
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclContratosAbertos:append();
        end, obj);

    obj._e_event3 = obj.rclContratosAbertos:addEventListener("onResize",
        function (_)
            self.rclContratosAbertosPart._recalcHeight();
        end, obj);

    obj._e_event4 = obj.rclContratosAbertos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclContratosPrivados:append();
        end, obj);

    obj._e_event6 = obj.rclContratosPrivados:addEventListener("onResize",
        function (_)
            self.rclContratosPrivadosPart._recalcHeight();
        end, obj);

    obj._e_event7 = obj.rclContratosPrivados:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event8 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclContratosFechados:append();
        end, obj);

    obj._e_event9 = obj.rclContratosFechados:addEventListener("onResize",
        function (_)
            self.rclContratosFechadosPart._recalcHeight();
        end, obj);

    obj._e_event10 = obj.rclContratosFechados:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event11 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclContractor:append();
        end, obj);

    obj._e_event12 = obj.rclContractor:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
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

    obj._e_event15 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclInventarioNaves:append();
        end, obj);

    obj._e_event16 = obj.rclInventarioNaves:addEventListener("onResize",
        function (_)
            self.rclInventarioNavesPart._recalcHeight();
        end, obj);

    obj._e_event17 = obj.rclInventarioNaves:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event18 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclInventarioMechas:append();
        end, obj);

    obj._e_event19 = obj.rclInventarioMechas:addEventListener("onResize",
        function (_)
            self.rclInventarioMechasPart._recalcHeight();
        end, obj);

    obj._e_event20 = obj.rclInventarioMechas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event21 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclInventarioVeiculos:append();
        end, obj);

    obj._e_event22 = obj.rclInventarioVeiculos:addEventListener("onResize",
        function (_)
            self.rclInventarioVeiculosPart._recalcHeight();
        end, obj);

    obj._e_event23 = obj.rclInventarioVeiculos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event24 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclInventarioEquipamentos:append();
        end, obj);

    obj._e_event25 = obj.rclInventarioEquipamentos:addEventListener("onResize",
        function (_)
            self.rclInventarioEquipamentosPart._recalcHeight();
        end, obj);

    obj._e_event26 = obj.rclInventarioEquipamentos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event27 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclInventarioArmas:append();
        end, obj);

    obj._e_event28 = obj.rclInventarioArmas:addEventListener("onResize",
        function (_)
            self.rclInventarioArmasPart._recalcHeight();
        end, obj);

    obj._e_event29 = obj.rclInventarioArmas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event30 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclInventarioMunicao:append();
        end, obj);

    obj._e_event31 = obj.rclInventarioMunicao:addEventListener("onResize",
        function (_)
            self.rclInventarioMunicaoPart._recalcHeight();
        end, obj);

    obj._e_event32 = obj.rclInventarioMunicao:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event33 = obj.button11:addEventListener("onClick",
        function (_)
            self.rclInventarioPecas:append();
        end, obj);

    obj._e_event34 = obj.rclInventarioPecas:addEventListener("onResize",
        function (_)
            self.rclInventarioPecasPart._recalcHeight();
        end, obj);

    obj._e_event35 = obj.rclInventarioPecas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event36 = obj.button12:addEventListener("onClick",
        function (_)
            self.rclInventarioOutros:append();
        end, obj);

    obj._e_event37 = obj.rclInventarioOutros:addEventListener("onResize",
        function (_)
            self.rclInventarioOutrosPart._recalcHeight();
        end, obj);

    obj._e_event38 = obj.rclInventarioOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Jogue contratos invisiveis pro fim
                                local vis = ((tonumber(nodeB.visibilidade) or 1) - (tonumber(nodeA.visibilidade) or 1));
                                if vis~=0 then return vis end
            
                                -- Ordene por dificuldade
                                local dif = ((tonumber(nodeA.dificuldade) or 0) - (tonumber(nodeB.dificuldade) or 0));
                                if dif~=0 then return dif end
            
                                -- Ordene por nome
                                return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event39 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            			local cred = (tonumber(sheet.creditos) or 0);
            			local gast = (tonumber(sheet.recursosGastos) or 0);
            
            			sheet.recursosLivres = cred - gast
        end, obj);

    obj._e_event40 = obj.notes:addEventListener("onResize",
        function (_)
            fullResize()
        end, obj);

    obj._e_event41 = obj.anotacoes1:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event42 = obj.anotacoes1:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event43 = obj.anotacoes1:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event44 = obj.anotacoes1:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event45 = obj.anotacoes2:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event46 = obj.anotacoes2:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event47 = obj.anotacoes2:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event48 = obj.anotacoes2:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event49 = obj.anotacoes3:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event50 = obj.anotacoes3:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event51 = obj.anotacoes3:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event52 = obj.anotacoes3:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event53 = obj.anotacoes4:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event54 = obj.anotacoes4:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event55 = obj.anotacoes4:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event56 = obj.anotacoes4:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event57 = obj.anotacoes5:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event58 = obj.anotacoes5:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event59 = obj.anotacoes5:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event60 = obj.anotacoes5:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event61 = obj.anotacoes6:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event62 = obj.anotacoes6:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event63 = obj.anotacoes6:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event64 = obj.anotacoes6:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event65 = obj.anotacoes7:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event66 = obj.anotacoes7:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event67 = obj.anotacoes7:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event68 = obj.anotacoes7:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event69 = obj.anotacoes8:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event70 = obj.anotacoes8:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event71 = obj.anotacoes8:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event72 = obj.anotacoes8:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event73 = obj.anotacoes9:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event74 = obj.anotacoes9:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event75 = obj.anotacoes9:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event76 = obj.anotacoes9:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event77 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local theme = sheet.theme;
            					if theme == "Claro" then
            						theme = "light";
            					else
            						theme = "dark";
            					end;
            
            					local forms = findClass("form");
            
            					for i=1, #forms, 1 do 
            						forms[i].theme = theme;
            					end;
        end, obj);

    obj._e_event78 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event79 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            		            local horzLines = findClass("horzLine");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
            					for i=1, #horzLines, 1 do 
            						horzLines[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event80 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local fontColor = sheet.colorFont or "#FFFFFF";
            
            					local controls = findAllControls();
            					
            					local edits = filterByClass("edit", controls);
            					for i=1, #edits, 1 do 
            						edits[i].fontColor = fontColor;
            					end;
            
            					local labels = filterByClass("label", controls);
            					for i=1, #labels, 1 do 
            						labels[i].fontColor = fontColor;
            					end;
            
            					local comboBoxs = filterByClass("comboBox", controls);
            					for i=1, #comboBoxs, 1 do 
            						comboBoxs[i].fontColor = fontColor;
            					end;
            
            					local textEditors = filterByClass("textEditor", controls);
            					for i=1, #textEditors, 1 do 
            						textEditors[i].fontColor = fontColor;
            					end;
            
            					local checkBoxs = filterByClass("checkBox", controls);
            					for i=1, #checkBoxs, 1 do 
            						checkBoxs[i].fontColor = fontColor;
            					end;
            
            					local buttons = filterByClass("button", controls);
            					for i=1, #buttons, 1 do 
            						buttons[i].fontColor = fontColor;
            					end;
        end, obj);

    obj._e_event81 = obj.button13:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/README.md')
        end, obj);

    obj._e_event82 = obj.button14:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Starfinder/output/Ficha%20Starfinder.rpk?raw=true')
        end, obj);

    obj._e_event83 = obj.button15:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event84 = obj.button16:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=195975');
        end, obj);

    obj._e_event85 = obj.button17:addEventListener("onClick",
        function (_)
            local xml = NDB.exportXML(sheet);
            
            				local export = {};
            				local bytes = Utils.binaryEncode(export, "utf8", xml);
            
            				local stream = Utils.newMemoryStream();
            				local bytes = stream:write(export);
            
            				Dialogs.saveFile("Salvar Ficha como XML", stream, "ficha.xml", "application/xml",
            					function()
            						stream:close();
            						showMessage("Ficha Exportada.");
            					end);
        end, obj);

    obj._e_event86 = obj.button18:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            					function(arquivos)
            						local arq = arquivos[1];
            
            						local import = {};
            						local bytes = arq.stream:read(import, arq.stream.size);
            
            						local xml = Utils.binaryDecode(import, "utf8");
            
            						NDB.importXML(sheet, xml);
            					end);
        end, obj);

    function obj:_releaseEvents()
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

        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rclContratosPrivados ~= nil then self.rclContratosPrivados:destroy(); self.rclContratosPrivados = nil; end;
        if self.rclInventarioArmas ~= nil then self.rclInventarioArmas:destroy(); self.rclInventarioArmas = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.frmContractor ~= nil then self.frmContractor:destroy(); self.frmContractor = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.rclInventarioMunicao ~= nil then self.rclInventarioMunicao:destroy(); self.rclInventarioMunicao = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.anotacoes7Part ~= nil then self.anotacoes7Part:destroy(); self.anotacoes7Part = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rclInventarioArmasPart ~= nil then self.rclInventarioArmasPart:destroy(); self.rclInventarioArmasPart = nil; end;
        if self.anotacoes3Part ~= nil then self.anotacoes3Part:destroy(); self.anotacoes3Part = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.creditosEdit ~= nil then self.creditosEdit:destroy(); self.creditosEdit = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rclContratosAbertosPart ~= nil then self.rclContratosAbertosPart:destroy(); self.rclContratosAbertosPart = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.rclInventarioMechasPart ~= nil then self.rclInventarioMechasPart:destroy(); self.rclInventarioMechasPart = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.rclInventarioMechas ~= nil then self.rclInventarioMechas:destroy(); self.rclInventarioMechas = nil; end;
        if self.rclContratosFechados ~= nil then self.rclContratosFechados:destroy(); self.rclContratosFechados = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.anotacoes2 ~= nil then self.anotacoes2:destroy(); self.anotacoes2 = nil; end;
        if self.rclContratosPrivadosPart ~= nil then self.rclContratosPrivadosPart:destroy(); self.rclContratosPrivadosPart = nil; end;
        if self.anotacoes5 ~= nil then self.anotacoes5:destroy(); self.anotacoes5 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.anotacoes9 ~= nil then self.anotacoes9:destroy(); self.anotacoes9 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.anotacoes6Part ~= nil then self.anotacoes6Part:destroy(); self.anotacoes6Part = nil; end;
        if self.anotacoes8Part ~= nil then self.anotacoes8Part:destroy(); self.anotacoes8Part = nil; end;
        if self.rclInventarioNaves ~= nil then self.rclInventarioNaves:destroy(); self.rclInventarioNaves = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.anotacoes4Part ~= nil then self.anotacoes4Part:destroy(); self.anotacoes4Part = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.rclInventarioVeiculosPart ~= nil then self.rclInventarioVeiculosPart:destroy(); self.rclInventarioVeiculosPart = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.anotacoes1Part ~= nil then self.anotacoes1Part:destroy(); self.anotacoes1Part = nil; end;
        if self.rclInventarioNavesPart ~= nil then self.rclInventarioNavesPart:destroy(); self.rclInventarioNavesPart = nil; end;
        if self.anotacoes9Part ~= nil then self.anotacoes9Part:destroy(); self.anotacoes9Part = nil; end;
        if self.anotacoes8 ~= nil then self.anotacoes8:destroy(); self.anotacoes8 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.anotacoes1 ~= nil then self.anotacoes1:destroy(); self.anotacoes1 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.anotacoes6 ~= nil then self.anotacoes6:destroy(); self.anotacoes6 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.anotacoes4 ~= nil then self.anotacoes4:destroy(); self.anotacoes4 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.frmContract ~= nil then self.frmContract:destroy(); self.frmContract = nil; end;
        if self.rclContratosAbertos ~= nil then self.rclContratosAbertos:destroy(); self.rclContratosAbertos = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.rclInventarioPecas ~= nil then self.rclInventarioPecas:destroy(); self.rclInventarioPecas = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.frmGuild ~= nil then self.frmGuild:destroy(); self.frmGuild = nil; end;
        if self.anotacoes2Part ~= nil then self.anotacoes2Part:destroy(); self.anotacoes2Part = nil; end;
        if self.anotacoes5Part ~= nil then self.anotacoes5Part:destroy(); self.anotacoes5Part = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.rclInventarioEquipamentos ~= nil then self.rclInventarioEquipamentos:destroy(); self.rclInventarioEquipamentos = nil; end;
        if self.creditosLabel ~= nil then self.creditosLabel:destroy(); self.creditosLabel = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rclInventarioOutros ~= nil then self.rclInventarioOutros:destroy(); self.rclInventarioOutros = nil; end;
        if self.anotacoes3 ~= nil then self.anotacoes3:destroy(); self.anotacoes3 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rclInventarioEquipamentosPart ~= nil then self.rclInventarioEquipamentosPart:destroy(); self.rclInventarioEquipamentosPart = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.rclContractor ~= nil then self.rclContractor:destroy(); self.rclContractor = nil; end;
        if self.rclInventarioMunicaoPart ~= nil then self.rclInventarioMunicaoPart:destroy(); self.rclInventarioMunicaoPart = nil; end;
        if self.rclInventarioPecasPart ~= nil then self.rclInventarioPecasPart:destroy(); self.rclInventarioPecasPart = nil; end;
        if self.rclInventarioOutrosPart ~= nil then self.rclInventarioOutrosPart:destroy(); self.rclInventarioOutrosPart = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.anotacoes7 ~= nil then self.anotacoes7:destroy(); self.anotacoes7 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.notes ~= nil then self.notes:destroy(); self.notes = nil; end;
        if self.rclInventarioVeiculos ~= nil then self.rclInventarioVeiculos:destroy(); self.rclInventarioVeiculos = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rclContratosFechadosPart ~= nil then self.rclContratosFechadosPart:destroy(); self.rclContratosFechadosPart = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaContrato()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaContrato();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaContrato = {
    newEditor = newfrmFichaContrato, 
    new = newfrmFichaContrato, 
    name = "frmFichaContrato", 
    dataType = "Ambesek.Starfinder.CompanhiaMercenaria", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Starfinder (Companhia de Mercenarios)", 
    description=""};

frmFichaContrato = _frmFichaContrato;
Firecast.registrarForm(_frmFichaContrato);
Firecast.registrarDataType(_frmFichaContrato);

return _frmFichaContrato;
