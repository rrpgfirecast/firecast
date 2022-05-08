require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmBibliotecaRPGmeister()
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
    obj:setName("frmBibliotecaRPGmeister");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Gerenciador.RPGmeister");
    obj:setTitle("Gerenciador de Campanha");
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
        


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Jogadores");
    obj.tab1:setName("tab1");

    obj.frmJogadores = GUI.fromHandle(_obj_newObject("form"));
    obj.frmJogadores:setParent(obj.tab1);
    obj.frmJogadores:setName("frmJogadores");
    obj.frmJogadores:setAlign("client");


        local function findPopup(myPop)
            local pop = self:findControlByName(myPop);
                
            if pop ~= nil and sheet ~= nil then
                pop:setNodeObject(sheet);
                pop:showPopupEx("center", self);
            elseif pop == nil then
                showMessage("Ops, bug.. nao encontrei o popup para exibir");
            end;                
        end;
        


    obj.xpAllPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.xpAllPopup:setParent(obj.frmJogadores);
    obj.xpAllPopup:setName("xpAllPopup");
    obj.xpAllPopup:setWidth(175);
    obj.xpAllPopup:setHeight(225);
    obj.xpAllPopup:setBackOpacity(0.4);
    lfm_setPropAsString(obj.xpAllPopup, "autoScopeNode",  "false");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.xpAllPopup);
    obj.label1:setAlign("top");
    obj.label1:setHeight(25);
    obj.label1:setText("Da XP de acordo com o NEP");
    obj.label1:setName("label1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.xpAllPopup);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("left");
    obj.label2:setWidth(75);
    obj.label2:setText("Sessão Nº");
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(50);
    obj.edit1:setField("xpAll_session");
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.xpAllPopup);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setAlign("left");
    obj.label3:setWidth(75);
    obj.label3:setText("XP");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setAlign("left");
    obj.label4:setWidth(50);
    obj.label4:setText("NEP");
    obj.label4:setName("label4");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.xpAllPopup);
    obj.layout3:setAlign("client");
    obj.layout3:setName("layout3");

    obj.rclXpAll = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclXpAll:setParent(obj.layout3);
    obj.rclXpAll:setAlign("client");
    obj.rclXpAll:setName("rclXpAll");
    obj.rclXpAll:setField("rclXpAll");
    obj.rclXpAll:setTemplateForm("frmXpAllForm");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.xpAllPopup);
    obj.button2:setAlign("bottom");
    obj.button2:setHeight(25);
    obj.button2:setText("Adicionar");
    obj.button2:setName("button2");

    obj.poAllPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.poAllPopup:setParent(obj.frmJogadores);
    obj.poAllPopup:setName("poAllPopup");
    obj.poAllPopup:setWidth(175);
    obj.poAllPopup:setHeight(225);
    obj.poAllPopup:setBackOpacity(0.4);
    lfm_setPropAsString(obj.poAllPopup, "autoScopeNode",  "false");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.poAllPopup);
    obj.label5:setAlign("top");
    obj.label5:setHeight(25);
    obj.label5:setText("Da PO de acordo com o NEP");
    obj.label5:setName("label5");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.poAllPopup);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout4);
    obj.label6:setAlign("left");
    obj.label6:setWidth(75);
    obj.label6:setText("Sessão Nº");
    obj.label6:setName("label6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(50);
    obj.edit2:setField("poAll_session");
    obj.edit2:setName("edit2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout4);
    obj.button3:setAlign("right");
    obj.button3:setWidth(25);
    obj.button3:setText("+");
    obj.button3:setName("button3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.poAllPopup);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout5);
    obj.label7:setAlign("left");
    obj.label7:setWidth(75);
    obj.label7:setText("PO");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout5);
    obj.label8:setAlign("left");
    obj.label8:setWidth(50);
    obj.label8:setText("NEP");
    obj.label8:setName("label8");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.poAllPopup);
    obj.layout6:setAlign("client");
    obj.layout6:setName("layout6");

    obj.rclPoAll = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPoAll:setParent(obj.layout6);
    obj.rclPoAll:setAlign("client");
    obj.rclPoAll:setName("rclPoAll");
    obj.rclPoAll:setField("rclPoAll");
    obj.rclPoAll:setTemplateForm("frmXpAllForm");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.poAllPopup);
    obj.button4:setAlign("bottom");
    obj.button4:setHeight(25);
    obj.button4:setText("Adicionar");
    obj.button4:setName("button4");

    obj.poSetTarget = GUI.fromHandle(_obj_newObject("popup"));
    obj.poSetTarget:setParent(obj.frmJogadores);
    obj.poSetTarget:setName("poSetTarget");
    obj.poSetTarget:setWidth(175);
    obj.poSetTarget:setHeight(225);
    obj.poSetTarget:setBackOpacity(0.4);
    lfm_setPropAsString(obj.poSetTarget, "autoScopeNode",  "false");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.poSetTarget);
    obj.label9:setAlign("top");
    obj.label9:setHeight(25);
    obj.label9:setText("Define PO por NEP");
    obj.label9:setName("label9");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.poSetTarget);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout7);
    obj.label10:setAlign("left");
    obj.label10:setWidth(75);
    obj.label10:setText("Sessão Nº");
    obj.label10:setName("label10");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout7);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(50);
    obj.edit3:setField("poSet_session");
    obj.edit3:setName("edit3");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout7);
    obj.button5:setAlign("right");
    obj.button5:setWidth(25);
    obj.button5:setText("+");
    obj.button5:setName("button5");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.poSetTarget);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setAlign("left");
    obj.label11:setWidth(75);
    obj.label11:setText("PO");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setAlign("left");
    obj.label12:setWidth(50);
    obj.label12:setText("NEP");
    obj.label12:setName("label12");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.poSetTarget);
    obj.layout9:setAlign("client");
    obj.layout9:setName("layout9");

    obj.rclPoSet = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPoSet:setParent(obj.layout9);
    obj.rclPoSet:setAlign("client");
    obj.rclPoSet:setName("rclPoSet");
    obj.rclPoSet:setField("rclPoSet");
    obj.rclPoSet:setTemplateForm("frmXpAllForm");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.poSetTarget);
    obj.button6:setAlign("bottom");
    obj.button6:setHeight(25);
    obj.button6:setText("Definir");
    obj.button6:setName("button6");

    obj.phAllPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.phAllPopup:setParent(obj.frmJogadores);
    obj.phAllPopup:setName("phAllPopup");
    obj.phAllPopup:setWidth(225);
    obj.phAllPopup:setHeight(275);
    obj.phAllPopup:setBackOpacity(0.4);
    lfm_setPropAsString(obj.phAllPopup, "autoScopeNode",  "false");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.phAllPopup);
    obj.label13:setAlign("top");
    obj.label13:setHeight(25);
    obj.label13:setText("Da PH a todos jogadores.");
    obj.label13:setName("label13");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.phAllPopup);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setMargins({left=0,top=5});
    obj.rectangle1:setName("rectangle1");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle1);
    obj.label14:setLeft(5);
    obj.label14:setTop(5);
    obj.label14:setWidth(150);
    obj.label14:setHeight(25);
    obj.label14:setText("Presença");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle1);
    obj.label15:setLeft(5);
    obj.label15:setTop(30);
    obj.label15:setWidth(150);
    obj.label15:setHeight(25);
    obj.label15:setText("Atraso Justificado");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle1);
    obj.label16:setLeft(5);
    obj.label16:setTop(55);
    obj.label16:setWidth(150);
    obj.label16:setHeight(25);
    obj.label16:setText("Atraso");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle1);
    obj.label17:setLeft(5);
    obj.label17:setTop(80);
    obj.label17:setWidth(150);
    obj.label17:setHeight(25);
    obj.label17:setText("Falta Justificada");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle1);
    obj.label18:setLeft(5);
    obj.label18:setTop(105);
    obj.label18:setWidth(150);
    obj.label18:setHeight(25);
    obj.label18:setText("Falta");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle1);
    obj.label19:setLeft(5);
    obj.label19:setTop(130);
    obj.label19:setWidth(150);
    obj.label19:setHeight(25);
    obj.label19:setText("Uso");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle1);
    obj.label20:setLeft(5);
    obj.label20:setTop(155);
    obj.label20:setWidth(150);
    obj.label20:setHeight(25);
    obj.label20:setText("Desperdicio");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle1);
    obj.label21:setLeft(5);
    obj.label21:setTop(180);
    obj.label21:setWidth(150);
    obj.label21:setHeight(25);
    obj.label21:setText("Nível");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(155);
    obj.edit4:setTop(5);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("presenca");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(155);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("atrasoJustificado");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(155);
    obj.edit6:setTop(55);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("atraso");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(155);
    obj.edit7:setTop(80);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("faltaJustificada");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(155);
    obj.edit8:setTop(105);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("falta");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(155);
    obj.edit9:setTop(130);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("usos");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(155);
    obj.edit10:setTop(155);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("desperdicio");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle1);
    obj.edit11:setLeft(155);
    obj.edit11:setTop(180);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("nivel");
    obj.edit11:setName("edit11");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.phAllPopup);
    obj.button7:setAlign("bottom");
    obj.button7:setHeight(25);
    obj.button7:setText("Adicionar");
    obj.button7:setMargins({left=0,top=5});
    obj.button7:setName("button7");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmJogadores);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(240);
    obj.rectangle2:setHeight(600);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setMargins({right=5});
    obj.rectangle2:setName("rectangle2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle2);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout10);
    obj.button8:setAlign("left");
    obj.button8:setWidth(80);
    obj.button8:setText("+");
    obj.button8:setHint("Adicionar");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout10);
    obj.button9:setAlign("left");
    obj.button9:setWidth(80);
    obj.button9:setText("+Jogadores");
    obj.button9:setHint("Adiciona todos Jogadores a lista.");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout10);
    obj.button10:setAlign("left");
    obj.button10:setWidth(80);
    obj.button10:setText("Voz");
    obj.button10:setHint("Dá voz a todos jogadores da lista, retira +Jogador dos outros e ativa mesa moderada. ");
    obj.button10:setName("button10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle2);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout11);
    obj.button11:setAlign("left");
    obj.button11:setWidth(60);
    obj.button11:setText("+XP");
    obj.button11:setHint("Da XP a todos jogadores");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout11);
    obj.button12:setAlign("left");
    obj.button12:setWidth(60);
    obj.button12:setText("+PO");
    obj.button12:setHint("Da PO a todos jogadores");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout11);
    obj.button13:setAlign("left");
    obj.button13:setWidth(60);
    obj.button13:setText("[PO]");
    obj.button13:setHint("Faz todos jogadores terem esse valor em PO.");
    obj.button13:setName("button13");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout11);
    obj.button14:setAlign("left");
    obj.button14:setWidth(60);
    obj.button14:setText("+PH");
    obj.button14:setHint("Da PH a todos jogadores");
    obj.button14:setName("button14");

    obj.rclSelector = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector:setParent(obj.rectangle2);
    obj.rclSelector:setAlign("client");
    obj.rclSelector:setName("rclSelector");
    obj.rclSelector:setField("listaDeJogadores");
    obj.rclSelector:setTemplateForm("frmDataScopeSelectionForm");
    obj.rclSelector:setLayout("vertical");
    obj.rclSelector:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox1);
    obj.boxDetalhesDoItem:setAlign("client");
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.boxDetalhesDoItem);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle3);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setMargins({bottom=5});
    obj.layout12:setName("layout12");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout12);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(170);
    obj.layout13:setMargins({left=5,right=35});
    obj.layout13:setName("layout13");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout13);
    obj.label22:setAlign("left");
    obj.label22:setWidth(70);
    obj.label22:setHeight(25);
    obj.label22:setText("Login");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setAlign("right");
    obj.edit12:setWidth(100);
    obj.edit12:setHeight(25);
    obj.edit12:setField("login");
    obj.edit12:setName("edit12");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout12);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(170);
    obj.layout14:setName("layout14");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout14);
    obj.label23:setAlign("left");
    obj.label23:setWidth(70);
    obj.label23:setHeight(25);
    obj.label23:setText("Personagem");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(12);
    obj.label23:setName("label23");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout14);
    obj.edit13:setAlign("right");
    obj.edit13:setWidth(100);
    obj.edit13:setHeight(25);
    obj.edit13:setField("personagem");
    obj.edit13:setName("edit13");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle3);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(170);
    obj.layout15:setMargins({left=5,right=35});
    obj.layout15:setName("layout15");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout15);
    obj.button15:setLeft(0);
    obj.button15:setTop(0);
    obj.button15:setWidth(25);
    obj.button15:setHeight(25);
    obj.button15:setText("+");
    obj.button15:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button15:setName("button15");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout15);
    obj.label24:setLeft(10);
    obj.label24:setTop(5);
    obj.label24:setWidth(70);
    obj.label24:setHeight(20);
    obj.label24:setText("XP");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout15);
    obj.rectangle4:setLeft(70);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(100);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout15);
    obj.label25:setLeft(70);
    obj.label25:setTop(0);
    obj.label25:setWidth(100);
    obj.label25:setHeight(25);
    obj.label25:setField("XP");
    obj.label25:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label25, "formatFloat",  ",0.## XP");
    obj.label25:setName("label25");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout15);
    obj.dataLink1:setField("XP");
    obj.dataLink1:setName("dataLink1");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout15);
    obj.label26:setLeft(0);
    obj.label26:setTop(30);
    obj.label26:setWidth(35);
    obj.label26:setHeight(20);
    obj.label26:setText("NEP");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout15);
    obj.rectangle5:setLeft(35);
    obj.rectangle5:setTop(25);
    obj.rectangle5:setWidth(25);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout15);
    obj.label27:setLeft(35);
    obj.label27:setTop(25);
    obj.label27:setWidth(25);
    obj.label27:setHeight(25);
    obj.label27:setField("nep");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout15);
    obj.rectangle6:setLeft(70);
    obj.rectangle6:setTop(25);
    obj.rectangle6:setWidth(100);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout15);
    obj.label28:setLeft(70);
    obj.label28:setTop(25);
    obj.label28:setWidth(100);
    obj.label28:setHeight(25);
    obj.label28:setField("alvo");
    obj.label28:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label28, "formatFloat",  ",0.## XP");
    obj.label28:setName("label28");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout15);
    obj.rectangle7:setLeft(0);
    obj.rectangle7:setTop(50);
    obj.rectangle7:setWidth(170);
    obj.rectangle7:setHeight(250);
    obj.rectangle7:setColor("#191919");
    obj.rectangle7:setName("rectangle7");

    obj.rclExperience = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclExperience:setParent(obj.layout15);
    obj.rclExperience:setLeft(0);
    obj.rclExperience:setTop(50);
    obj.rclExperience:setWidth(170);
    obj.rclExperience:setHeight(250);
    obj.rclExperience:setName("rclExperience");
    obj.rclExperience:setField("listaDeExperiencia");
    obj.rclExperience:setTemplateForm("frmRecordListFormExperience");
    obj.rclExperience:setLayout("vertical");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle3);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(170);
    obj.layout16:setMargins({left=0,right=30});
    obj.layout16:setName("layout16");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout16);
    obj.button16:setLeft(0);
    obj.button16:setTop(0);
    obj.button16:setWidth(25);
    obj.button16:setHeight(25);
    obj.button16:setText("+");
    obj.button16:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button16:setName("button16");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout16);
    obj.label29:setLeft(10);
    obj.label29:setTop(5);
    obj.label29:setWidth(70);
    obj.label29:setHeight(20);
    obj.label29:setText("PO");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout16);
    obj.rectangle8:setLeft(70);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(100);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout16);
    obj.label30:setLeft(70);
    obj.label30:setTop(0);
    obj.label30:setWidth(100);
    obj.label30:setHeight(25);
    obj.label30:setField("PO");
    obj.label30:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label30, "formatFloat",  ",0.## PO");
    obj.label30:setName("label30");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout16);
    obj.rectangle9:setLeft(0);
    obj.rectangle9:setTop(25);
    obj.rectangle9:setWidth(170);
    obj.rectangle9:setHeight(275);
    obj.rectangle9:setColor("#191919");
    obj.rectangle9:setName("rectangle9");

    obj.rclDinheiro = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDinheiro:setParent(obj.layout16);
    obj.rclDinheiro:setLeft(0);
    obj.rclDinheiro:setTop(25);
    obj.rclDinheiro:setWidth(170);
    obj.rclDinheiro:setHeight(275);
    obj.rclDinheiro:setName("rclDinheiro");
    obj.rclDinheiro:setField("listaDeDinheiro");
    obj.rclDinheiro:setTemplateForm("frmRecordListFormDinheiro");
    obj.rclDinheiro:setLayout("vertical");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle3);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(310);
    obj.layout17:setName("layout17");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout17);
    obj.rectangle10:setAlign("top");
    obj.rectangle10:setHeight(210);
    obj.rectangle10:setColor("#212121");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setMargins({left=0,top=5});
    obj.rectangle10:setName("rectangle10");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle10);
    obj.label31:setLeft(5);
    obj.label31:setTop(5);
    obj.label31:setWidth(150);
    obj.label31:setHeight(25);
    obj.label31:setText("Presença");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle10);
    obj.label32:setLeft(5);
    obj.label32:setTop(30);
    obj.label32:setWidth(150);
    obj.label32:setHeight(25);
    obj.label32:setText("Atraso Justificado");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle10);
    obj.label33:setLeft(5);
    obj.label33:setTop(55);
    obj.label33:setWidth(150);
    obj.label33:setHeight(25);
    obj.label33:setText("Atraso");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle10);
    obj.label34:setLeft(5);
    obj.label34:setTop(80);
    obj.label34:setWidth(150);
    obj.label34:setHeight(25);
    obj.label34:setText("Falta Justificada");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle10);
    obj.label35:setLeft(5);
    obj.label35:setTop(105);
    obj.label35:setWidth(150);
    obj.label35:setHeight(25);
    obj.label35:setText("Falta");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle10);
    obj.label36:setLeft(5);
    obj.label36:setTop(130);
    obj.label36:setWidth(150);
    obj.label36:setHeight(25);
    obj.label36:setText("Uso");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle10);
    obj.label37:setLeft(5);
    obj.label37:setTop(155);
    obj.label37:setWidth(150);
    obj.label37:setHeight(25);
    obj.label37:setText("Desperdicio");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle10);
    obj.label38:setLeft(5);
    obj.label38:setTop(180);
    obj.label38:setWidth(150);
    obj.label38:setHeight(25);
    obj.label38:setText("Nível");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle10);
    obj.edit14:setLeft(155);
    obj.edit14:setTop(5);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("presenca");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle10);
    obj.edit15:setLeft(155);
    obj.edit15:setTop(30);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("atrasoJustificado");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle10);
    obj.edit16:setLeft(155);
    obj.edit16:setTop(55);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("atraso");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle10);
    obj.edit17:setLeft(155);
    obj.edit17:setTop(80);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("faltaJustificada");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle10);
    obj.edit18:setLeft(155);
    obj.edit18:setTop(105);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("falta");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle10);
    obj.edit19:setLeft(155);
    obj.edit19:setTop(130);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setField("usos");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle10);
    obj.edit20:setLeft(155);
    obj.edit20:setTop(155);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("desperdicio");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle10);
    obj.edit21:setLeft(155);
    obj.edit21:setTop(180);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("nivel");
    obj.edit21:setName("edit21");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle10);
    obj.rectangle11:setLeft(205);
    obj.rectangle11:setTop(5);
    obj.rectangle11:setWidth(100);
    obj.rectangle11:setHeight(150);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle10);
    obj.label39:setLeft(205);
    obj.label39:setTop(35);
    obj.label39:setWidth(100);
    obj.label39:setHeight(25);
    obj.label39:setText("PH");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontSize(30);
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle10);
    obj.label40:setLeft(205);
    obj.label40:setTop(70);
    obj.label40:setWidth(100);
    obj.label40:setHeight(25);
    obj.label40:setField("ph");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontSize(30);
    obj.label40:setName("label40");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle10);
    obj.horzLine1:setLeft(230);
    obj.horzLine1:setTop(105);
    obj.horzLine1:setWidth(50);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle10);
    obj.label41:setLeft(205);
    obj.label41:setTop(105);
    obj.label41:setWidth(100);
    obj.label41:setHeight(25);
    obj.label41:setField("pontos");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle10);
    obj.dataLink2:setFields({'presenca', 'atrasoJustificado', 'atraso', 'falta', 'usos', 'desperdicio','nivel'});
    obj.dataLink2:setName("dataLink2");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout17);
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setHeight(310);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setMargins({left=0,top=5});
    obj.rectangle12:setName("rectangle12");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle12);
    obj.label42:setLeft(0);
    obj.label42:setTop(145);
    obj.label42:setWidth(310);
    obj.label42:setHeight(20);
    obj.label42:setText("Avatar");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle12);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setHitTest(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Calendario");
    obj.tab2:setName("tab2");

    obj.frmGerenciador02 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGerenciador02:setParent(obj.tab2);
    obj.frmGerenciador02:setName("frmGerenciador02");
    obj.frmGerenciador02:setAlign("client");
    obj.frmGerenciador02:setTheme("dark");
    obj.frmGerenciador02:setMargins({top=1});


		local function write(str)
            local mesa = Firecast.getMesaDe(sheet);
            if str then
                mesa.activeChat:escrever(str);
            else
                mesa.activeChat:escrever("String nula");
            end;
        end;
		


    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmGerenciador02);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.popClima = GUI.fromHandle(_obj_newObject("popup"));
    obj.popClima:setParent(obj.scrollBox2);
    obj.popClima:setName("popClima");
    obj.popClima:setWidth(240);
    obj.popClima:setHeight(210);
    obj.popClima:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popClima, "autoScopeNode",  "false");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popClima);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(9);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(70);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(15);
    obj.flowPart1:setName("flowPart1");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.flowPart1);
    obj.label43:setAlign("top");
    obj.label43:setFontSize(10);
    obj.label43:setText("Temperatura");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setWordWrap(true);
    obj.label43:setTextTrimming("none");
    obj.label43:setAutoSize(true);
    obj.label43:setHint("");
    obj.label43:setName("label43");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(100);
    obj.flowPart2:setMaxWidth(150);
    obj.flowPart2:setHeight(20);
    obj.flowPart2:setName("flowPart2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowPart2);
    obj.comboBox1:setAlign("top");
    obj.comboBox1:setFontSize(10);
    obj.comboBox1:setField("temperatura");
    obj.comboBox1:setItems({'Glacial', 'Frio', 'Temperado', 'Morno', 'Quente', 'Infernal', 'Personalizado'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout1);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(70);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(15);
    obj.flowPart3:setName("flowPart3");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.flowPart3);
    obj.label44:setAlign("top");
    obj.label44:setFontSize(10);
    obj.label44:setText("Média");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setWordWrap(true);
    obj.label44:setTextTrimming("none");
    obj.label44:setAutoSize(true);
    obj.label44:setHint("Valor base da média de temperatura.");
    obj.label44:setName("label44");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(20);
    obj.flowPart4:setMaxWidth(50);
    obj.flowPart4:setHeight(20);
    obj.flowPart4:setName("flowPart4");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.flowPart4);
    obj.edit22:setAlign("client");
    obj.edit22:setFontSize(10);
    obj.edit22:setField("temperatura_1");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setName("edit22");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(20);
    obj.flowPart5:setMaxWidth(50);
    obj.flowPart5:setHeight(20);
    obj.flowPart5:setName("flowPart5");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.flowPart5);
    obj.edit23:setAlign("client");
    obj.edit23:setFontSize(10);
    obj.edit23:setField("temperatura_2");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setName("edit23");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(20);
    obj.flowPart6:setMaxWidth(50);
    obj.flowPart6:setHeight(20);
    obj.flowPart6:setName("flowPart6");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.flowPart6);
    obj.edit24:setAlign("client");
    obj.edit24:setFontSize(10);
    obj.edit24:setField("temperatura_3");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setName("edit24");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(20);
    obj.flowPart7:setMaxWidth(50);
    obj.flowPart7:setHeight(20);
    obj.flowPart7:setName("flowPart7");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.flowPart7);
    obj.edit25:setAlign("client");
    obj.edit25:setFontSize(10);
    obj.edit25:setField("temperatura_4");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setName("edit25");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(20);
    obj.flowPart8:setMaxWidth(50);
    obj.flowPart8:setHeight(20);
    obj.flowPart8:setName("flowPart8");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.flowPart8);
    obj.edit26:setAlign("client");
    obj.edit26:setFontSize(10);
    obj.edit26:setField("temperatura_5");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setName("edit26");

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout1);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout1);
    obj.flowPart9:setMinWidth(70);
    obj.flowPart9:setMaxWidth(100);
    obj.flowPart9:setHeight(15);
    obj.flowPart9:setName("flowPart9");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.flowPart9);
    obj.label45:setAlign("top");
    obj.label45:setFontSize(10);
    obj.label45:setText("Variancia");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setWordWrap(true);
    obj.label45:setTextTrimming("none");
    obj.label45:setAutoSize(true);
    obj.label45:setHint("Entre 1 e N é adicionado a média do dia aleatoriamente.");
    obj.label45:setName("label45");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setMinWidth(20);
    obj.flowPart10:setMaxWidth(50);
    obj.flowPart10:setHeight(20);
    obj.flowPart10:setName("flowPart10");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.flowPart10);
    obj.edit27:setAlign("client");
    obj.edit27:setFontSize(10);
    obj.edit27:setField("temperaturaVar_1");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setMin(1);
    obj.edit27:setName("edit27");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout1);
    obj.flowPart11:setMinWidth(20);
    obj.flowPart11:setMaxWidth(50);
    obj.flowPart11:setHeight(20);
    obj.flowPart11:setName("flowPart11");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.flowPart11);
    obj.edit28:setAlign("client");
    obj.edit28:setFontSize(10);
    obj.edit28:setField("temperaturaVar_2");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setMin(1);
    obj.edit28:setName("edit28");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout1);
    obj.flowPart12:setMinWidth(20);
    obj.flowPart12:setMaxWidth(50);
    obj.flowPart12:setHeight(20);
    obj.flowPart12:setName("flowPart12");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.flowPart12);
    obj.edit29:setAlign("client");
    obj.edit29:setFontSize(10);
    obj.edit29:setField("temperaturaVar_3");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setMin(1);
    obj.edit29:setName("edit29");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout1);
    obj.flowPart13:setMinWidth(20);
    obj.flowPart13:setMaxWidth(50);
    obj.flowPart13:setHeight(20);
    obj.flowPart13:setName("flowPart13");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.flowPart13);
    obj.edit30:setAlign("client");
    obj.edit30:setFontSize(10);
    obj.edit30:setField("temperaturaVar_4");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setMin(1);
    obj.edit30:setName("edit30");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout1);
    obj.flowPart14:setMinWidth(20);
    obj.flowPart14:setMaxWidth(50);
    obj.flowPart14:setHeight(20);
    obj.flowPart14:setName("flowPart14");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.flowPart14);
    obj.edit31:setAlign("client");
    obj.edit31:setFontSize(10);
    obj.edit31:setField("temperaturaVar_5");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setMin(1);
    obj.edit31:setName("edit31");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout1);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout1);
    obj.flowPart15:setMinWidth(70);
    obj.flowPart15:setMaxWidth(100);
    obj.flowPart15:setHeight(15);
    obj.flowPart15:setName("flowPart15");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.flowPart15);
    obj.label46:setAlign("top");
    obj.label46:setFontSize(10);
    obj.label46:setText("Chance");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setWordWrap(true);
    obj.label46:setTextTrimming("none");
    obj.label46:setAutoSize(true);
    obj.label46:setHint("Chance de usar essa faixa de temperatura. De mais frio que o normal a mais quente que o normal.");
    obj.label46:setName("label46");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout1);
    obj.flowPart16:setMinWidth(20);
    obj.flowPart16:setMaxWidth(50);
    obj.flowPart16:setHeight(20);
    obj.flowPart16:setName("flowPart16");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.flowPart16);
    obj.edit32:setAlign("client");
    obj.edit32:setFontSize(10);
    obj.edit32:setField("temperaturaChance_1");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setMin(0);
    obj.edit32:setName("edit32");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout1);
    obj.flowPart17:setMinWidth(20);
    obj.flowPart17:setMaxWidth(50);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.flowPart17);
    obj.edit33:setAlign("client");
    obj.edit33:setFontSize(10);
    obj.edit33:setField("temperaturaChance_2");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setMin(0);
    obj.edit33:setName("edit33");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout1);
    obj.flowPart18:setMinWidth(20);
    obj.flowPart18:setMaxWidth(50);
    obj.flowPart18:setHeight(20);
    obj.flowPart18:setName("flowPart18");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.flowPart18);
    obj.edit34:setAlign("client");
    obj.edit34:setFontSize(10);
    obj.edit34:setField("temperaturaChance_3");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setType("number");
    obj.edit34:setMin(0);
    obj.edit34:setName("edit34");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout1);
    obj.flowPart19:setMinWidth(20);
    obj.flowPart19:setMaxWidth(50);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.flowPart19);
    obj.edit35:setAlign("client");
    obj.edit35:setFontSize(10);
    obj.edit35:setField("temperaturaChance_4");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setMin(0);
    obj.edit35:setName("edit35");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout1);
    obj.flowPart20:setMinWidth(20);
    obj.flowPart20:setMaxWidth(50);
    obj.flowPart20:setHeight(20);
    obj.flowPart20:setName("flowPart20");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.flowPart20);
    obj.edit36:setAlign("client");
    obj.edit36:setFontSize(10);
    obj.edit36:setField("temperaturaChance_5");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setMin(0);
    obj.edit36:setName("edit36");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout1);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout1);
    obj.flowPart21:setMinWidth(70);
    obj.flowPart21:setMaxWidth(100);
    obj.flowPart21:setHeight(15);
    obj.flowPart21:setName("flowPart21");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.flowPart21);
    obj.label47:setAlign("top");
    obj.label47:setFontSize(10);
    obj.label47:setText("MinMax");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setWordWrap(true);
    obj.label47:setTextTrimming("none");
    obj.label47:setAutoSize(true);
    obj.label47:setHint("Variação de temperatura ao longo do dia em relação a média. Calculando independente da Variancia, usando a Chance. ");
    obj.label47:setName("label47");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout1);
    obj.flowPart22:setMinWidth(20);
    obj.flowPart22:setMaxWidth(50);
    obj.flowPart22:setHeight(20);
    obj.flowPart22:setName("flowPart22");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.flowPart22);
    obj.edit37:setAlign("client");
    obj.edit37:setFontSize(10);
    obj.edit37:setField("temperaturaMM_1");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setMin(1);
    obj.edit37:setName("edit37");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout1);
    obj.flowPart23:setMinWidth(20);
    obj.flowPart23:setMaxWidth(50);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.flowPart23);
    obj.edit38:setAlign("client");
    obj.edit38:setFontSize(10);
    obj.edit38:setField("temperaturaMM_2");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setMin(1);
    obj.edit38:setName("edit38");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout1);
    obj.flowPart24:setMinWidth(20);
    obj.flowPart24:setMaxWidth(50);
    obj.flowPart24:setHeight(20);
    obj.flowPart24:setName("flowPart24");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.flowPart24);
    obj.edit39:setAlign("client");
    obj.edit39:setFontSize(10);
    obj.edit39:setField("temperaturaMM_3");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setMin(1);
    obj.edit39:setName("edit39");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout1);
    obj.flowPart25:setMinWidth(20);
    obj.flowPart25:setMaxWidth(50);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.flowPart25);
    obj.edit40:setAlign("client");
    obj.edit40:setFontSize(10);
    obj.edit40:setField("temperaturaMM_4");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setMin(1);
    obj.edit40:setName("edit40");

    obj.flowPart26 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart26:setParent(obj.flowLayout1);
    obj.flowPart26:setMinWidth(20);
    obj.flowPart26:setMaxWidth(50);
    obj.flowPart26:setHeight(20);
    obj.flowPart26:setName("flowPart26");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.flowPart26);
    obj.edit41:setAlign("client");
    obj.edit41:setFontSize(10);
    obj.edit41:setField("temperaturaMM_5");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setMin(1);
    obj.edit41:setName("edit41");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout1);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.flowPart27 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart27:setParent(obj.flowLayout1);
    obj.flowPart27:setMinWidth(70);
    obj.flowPart27:setMaxWidth(100);
    obj.flowPart27:setHeight(15);
    obj.flowPart27:setName("flowPart27");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.flowPart27);
    obj.label48:setAlign("top");
    obj.label48:setFontSize(10);
    obj.label48:setText("Precipitação");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setWordWrap(true);
    obj.label48:setTextTrimming("none");
    obj.label48:setAutoSize(true);
    obj.label48:setHint("");
    obj.label48:setName("label48");

    obj.flowPart28 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart28:setParent(obj.flowLayout1);
    obj.flowPart28:setMinWidth(100);
    obj.flowPart28:setMaxWidth(150);
    obj.flowPart28:setHeight(20);
    obj.flowPart28:setName("flowPart28");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart28);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setFontSize(10);
    obj.comboBox2:setField("chuvas");
    obj.comboBox2:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante', 'Personalizado'});
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setName("comboBox2");

    obj.flowLineBreak6 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak6:setParent(obj.flowLayout1);
    obj.flowLineBreak6:setName("flowLineBreak6");

    obj.flowPart29 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart29:setParent(obj.flowLayout1);
    obj.flowPart29:setMinWidth(70);
    obj.flowPart29:setMaxWidth(100);
    obj.flowPart29:setHeight(15);
    obj.flowPart29:setName("flowPart29");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.flowPart29);
    obj.label49:setAlign("top");
    obj.label49:setFontSize(10);
    obj.label49:setText("Chance");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setWordWrap(true);
    obj.label49:setTextTrimming("none");
    obj.label49:setAutoSize(true);
    obj.label49:setHint("Chance de clima ensolarado, nublado, chuviscando, chuva, temporal, tempestade.");
    obj.label49:setName("label49");

    obj.flowPart30 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart30:setParent(obj.flowLayout1);
    obj.flowPart30:setMinWidth(20);
    obj.flowPart30:setMaxWidth(50);
    obj.flowPart30:setHeight(20);
    obj.flowPart30:setName("flowPart30");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.flowPart30);
    obj.edit42:setAlign("client");
    obj.edit42:setFontSize(10);
    obj.edit42:setField("chuvaChance_1");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setMin(0);
    obj.edit42:setName("edit42");

    obj.flowPart31 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart31:setParent(obj.flowLayout1);
    obj.flowPart31:setMinWidth(20);
    obj.flowPart31:setMaxWidth(50);
    obj.flowPart31:setHeight(20);
    obj.flowPart31:setName("flowPart31");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.flowPart31);
    obj.edit43:setAlign("client");
    obj.edit43:setFontSize(10);
    obj.edit43:setField("chuvaChance_2");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setType("number");
    obj.edit43:setMin(0);
    obj.edit43:setName("edit43");

    obj.flowPart32 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart32:setParent(obj.flowLayout1);
    obj.flowPart32:setMinWidth(20);
    obj.flowPart32:setMaxWidth(50);
    obj.flowPart32:setHeight(20);
    obj.flowPart32:setName("flowPart32");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart32);
    obj.edit44:setAlign("client");
    obj.edit44:setFontSize(10);
    obj.edit44:setField("chuvaChance_3");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setMin(0);
    obj.edit44:setName("edit44");

    obj.flowPart33 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart33:setParent(obj.flowLayout1);
    obj.flowPart33:setMinWidth(20);
    obj.flowPart33:setMaxWidth(50);
    obj.flowPart33:setHeight(20);
    obj.flowPart33:setName("flowPart33");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart33);
    obj.edit45:setAlign("client");
    obj.edit45:setFontSize(10);
    obj.edit45:setField("chuvaChance_4");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setMin(0);
    obj.edit45:setName("edit45");

    obj.flowPart34 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart34:setParent(obj.flowLayout1);
    obj.flowPart34:setMinWidth(20);
    obj.flowPart34:setMaxWidth(50);
    obj.flowPart34:setHeight(20);
    obj.flowPart34:setName("flowPart34");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart34);
    obj.edit46:setAlign("client");
    obj.edit46:setFontSize(10);
    obj.edit46:setField("chuvaChance_5");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setMin(0);
    obj.edit46:setName("edit46");

    obj.flowPart35 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart35:setParent(obj.flowLayout1);
    obj.flowPart35:setMinWidth(20);
    obj.flowPart35:setMaxWidth(50);
    obj.flowPart35:setHeight(20);
    obj.flowPart35:setName("flowPart35");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart35);
    obj.edit47:setAlign("client");
    obj.edit47:setFontSize(10);
    obj.edit47:setField("chuvaChance_6");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setType("number");
    obj.edit47:setMin(0);
    obj.edit47:setName("edit47");

    obj.flowLineBreak7 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak7:setParent(obj.flowLayout1);
    obj.flowLineBreak7:setName("flowLineBreak7");

    obj.flowPart36 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart36:setParent(obj.flowLayout1);
    obj.flowPart36:setMinWidth(70);
    obj.flowPart36:setMaxWidth(100);
    obj.flowPart36:setHeight(15);
    obj.flowPart36:setName("flowPart36");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.flowPart36);
    obj.label50:setAlign("top");
    obj.label50:setFontSize(10);
    obj.label50:setText("Areia");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setWordWrap(true);
    obj.label50:setTextTrimming("none");
    obj.label50:setAutoSize(true);
    obj.label50:setHint("Força minima do vento para tempestade de areia.");
    obj.label50:setName("label50");

    obj.flowPart37 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart37:setParent(obj.flowLayout1);
    obj.flowPart37:setMinWidth(100);
    obj.flowPart37:setMaxWidth(150);
    obj.flowPart37:setHeight(20);
    obj.flowPart37:setName("flowPart37");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowPart37);
    obj.comboBox3:setAlign("top");
    obj.comboBox3:setFontSize(10);
    obj.comboBox3:setField("areia");
    obj.comboBox3:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante', 'Personalizado'});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setName("comboBox3");

    obj.flowPart38 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart38:setParent(obj.flowLayout1);
    obj.flowPart38:setMinWidth(20);
    obj.flowPart38:setMaxWidth(50);
    obj.flowPart38:setHeight(20);
    obj.flowPart38:setName("flowPart38");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart38);
    obj.edit48:setAlign("client");
    obj.edit48:setFontSize(10);
    obj.edit48:setField("areiaMin");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setMin(1);
    obj.edit48:setName("edit48");

    obj.flowLineBreak8 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak8:setParent(obj.flowLayout1);
    obj.flowLineBreak8:setName("flowLineBreak8");

    obj.flowPart39 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart39:setParent(obj.flowLayout1);
    obj.flowPart39:setMinWidth(70);
    obj.flowPart39:setMaxWidth(100);
    obj.flowPart39:setHeight(15);
    obj.flowPart39:setName("flowPart39");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.flowPart39);
    obj.label51:setAlign("top");
    obj.label51:setFontSize(10);
    obj.label51:setText("Ventos");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setWordWrap(true);
    obj.label51:setTextTrimming("none");
    obj.label51:setAutoSize(true);
    obj.label51:setHint("");
    obj.label51:setName("label51");

    obj.flowPart40 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart40:setParent(obj.flowLayout1);
    obj.flowPart40:setMinWidth(100);
    obj.flowPart40:setMaxWidth(150);
    obj.flowPart40:setHeight(20);
    obj.flowPart40:setName("flowPart40");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.flowPart40);
    obj.comboBox4:setAlign("top");
    obj.comboBox4:setFontSize(10);
    obj.comboBox4:setField("ventos");
    obj.comboBox4:setItems({'Nenhum', 'Pouco', 'Razoável', 'Muito', 'Constante', 'Personalizado'});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");

    obj.flowLineBreak9 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak9:setParent(obj.flowLayout1);
    obj.flowLineBreak9:setName("flowLineBreak9");

    obj.flowPart41 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart41:setParent(obj.flowLayout1);
    obj.flowPart41:setMinWidth(70);
    obj.flowPart41:setMaxWidth(100);
    obj.flowPart41:setHeight(15);
    obj.flowPart41:setName("flowPart41");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.flowPart41);
    obj.label52:setAlign("top");
    obj.label52:setFontSize(10);
    obj.label52:setText("Chance");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setWordWrap(true);
    obj.label52:setTextTrimming("none");
    obj.label52:setAutoSize(true);
    obj.label52:setHint("Chance de cada intensidade dos ventos.");
    obj.label52:setName("label52");

    obj.flowPart42 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart42:setParent(obj.flowLayout1);
    obj.flowPart42:setMinWidth(20);
    obj.flowPart42:setMaxWidth(50);
    obj.flowPart42:setHeight(20);
    obj.flowPart42:setName("flowPart42");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart42);
    obj.edit49:setAlign("client");
    obj.edit49:setFontSize(10);
    obj.edit49:setField("ventosChance_1");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setType("number");
    obj.edit49:setMin(0);
    obj.edit49:setName("edit49");

    obj.flowPart43 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart43:setParent(obj.flowLayout1);
    obj.flowPart43:setMinWidth(20);
    obj.flowPart43:setMaxWidth(50);
    obj.flowPart43:setHeight(20);
    obj.flowPart43:setName("flowPart43");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart43);
    obj.edit50:setAlign("client");
    obj.edit50:setFontSize(10);
    obj.edit50:setField("ventosChance_2");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setType("number");
    obj.edit50:setMin(0);
    obj.edit50:setName("edit50");

    obj.flowPart44 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart44:setParent(obj.flowLayout1);
    obj.flowPart44:setMinWidth(20);
    obj.flowPart44:setMaxWidth(50);
    obj.flowPart44:setHeight(20);
    obj.flowPart44:setName("flowPart44");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart44);
    obj.edit51:setAlign("client");
    obj.edit51:setFontSize(10);
    obj.edit51:setField("ventosChance_3");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setType("number");
    obj.edit51:setMin(0);
    obj.edit51:setName("edit51");

    obj.flowPart45 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart45:setParent(obj.flowLayout1);
    obj.flowPart45:setMinWidth(20);
    obj.flowPart45:setMaxWidth(50);
    obj.flowPart45:setHeight(20);
    obj.flowPart45:setName("flowPart45");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart45);
    obj.edit52:setAlign("client");
    obj.edit52:setFontSize(10);
    obj.edit52:setField("ventosChance_4");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setType("number");
    obj.edit52:setMin(0);
    obj.edit52:setName("edit52");

    obj.flowPart46 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart46:setParent(obj.flowLayout1);
    obj.flowPart46:setMinWidth(20);
    obj.flowPart46:setMaxWidth(50);
    obj.flowPart46:setHeight(20);
    obj.flowPart46:setName("flowPart46");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart46);
    obj.edit53:setAlign("client");
    obj.edit53:setFontSize(10);
    obj.edit53:setField("ventosChance_5");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setType("number");
    obj.edit53:setMin(0);
    obj.edit53:setName("edit53");

    obj.flowPart47 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart47:setParent(obj.flowLayout1);
    obj.flowPart47:setMinWidth(20);
    obj.flowPart47:setMaxWidth(50);
    obj.flowPart47:setHeight(20);
    obj.flowPart47:setName("flowPart47");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart47);
    obj.edit54:setAlign("client");
    obj.edit54:setFontSize(10);
    obj.edit54:setField("ventosChance_6");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setType("number");
    obj.edit54:setMin(0);
    obj.edit54:setName("edit54");

    obj.flowPart48 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart48:setParent(obj.flowLayout1);
    obj.flowPart48:setMinWidth(20);
    obj.flowPart48:setMaxWidth(50);
    obj.flowPart48:setHeight(20);
    obj.flowPart48:setName("flowPart48");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart48);
    obj.edit55:setAlign("client");
    obj.edit55:setFontSize(10);
    obj.edit55:setField("ventosChance_7");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setType("number");
    obj.edit55:setMin(0);
    obj.edit55:setName("edit55");

    obj.flowPart49 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart49:setParent(obj.flowLayout1);
    obj.flowPart49:setMinWidth(20);
    obj.flowPart49:setMaxWidth(50);
    obj.flowPart49:setHeight(20);
    obj.flowPart49:setName("flowPart49");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart49);
    obj.edit56:setAlign("client");
    obj.edit56:setFontSize(10);
    obj.edit56:setField("ventosChance_8");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setType("number");
    obj.edit56:setMin(0);
    obj.edit56:setName("edit56");

    obj.flowLineBreak10 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak10:setParent(obj.flowLayout1);
    obj.flowLineBreak10:setName("flowLineBreak10");

    obj.popCelestial = GUI.fromHandle(_obj_newObject("popup"));
    obj.popCelestial:setParent(obj.scrollBox2);
    obj.popCelestial:setName("popCelestial");
    obj.popCelestial:setWidth(250);
    obj.popCelestial:setHeight(190);
    obj.popCelestial:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popCelestial, "autoScopeNode",  "false");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popCelestial);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(3);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart50 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart50:setParent(obj.flowLayout2);
    obj.flowPart50:setMinWidth(100);
    obj.flowPart50:setMaxWidth(150);
    obj.flowPart50:setHeight(15);
    obj.flowPart50:setName("flowPart50");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.flowPart50);
    obj.label53:setAlign("top");
    obj.label53:setFontSize(10);
    obj.label53:setText("Eventos Celestes");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setWordWrap(true);
    obj.label53:setTextTrimming("none");
    obj.label53:setAutoSize(true);
    obj.label53:setName("label53");

    obj.flowLineBreak11 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak11:setParent(obj.flowLayout2);
    obj.flowLineBreak11:setName("flowLineBreak11");

    obj.flowPart51 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart51:setParent(obj.flowLayout2);
    obj.flowPart51:setMinWidth(70);
    obj.flowPart51:setMaxWidth(100);
    obj.flowPart51:setHeight(15);
    obj.flowPart51:setName("flowPart51");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.flowPart51);
    obj.label54:setAlign("top");
    obj.label54:setFontSize(10);
    obj.label54:setText("Sobrenatural");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setWordWrap(true);
    obj.label54:setTextTrimming("none");
    obj.label54:setAutoSize(true);
    obj.label54:setHint("");
    obj.label54:setName("label54");

    obj.flowPart52 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart52:setParent(obj.flowLayout2);
    obj.flowPart52:setMinWidth(100);
    obj.flowPart52:setMaxWidth(150);
    obj.flowPart52:setHeight(20);
    obj.flowPart52:setName("flowPart52");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.flowPart52);
    obj.comboBox5:setAlign("top");
    obj.comboBox5:setFontSize(10);
    obj.comboBox5:setField("sobrentural");
    obj.comboBox5:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setName("comboBox5");

    obj.flowPart53 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart53:setParent(obj.flowLayout2);
    obj.flowPart53:setMinWidth(20);
    obj.flowPart53:setMaxWidth(50);
    obj.flowPart53:setHeight(20);
    obj.flowPart53:setName("flowPart53");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart53);
    obj.edit57:setAlign("client");
    obj.edit57:setFontSize(10);
    obj.edit57:setField("sobrentural_chance");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setName("edit57");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.flowLayout2);
    obj.dataLink3:setField("sobrentural");
    obj.dataLink3:setName("dataLink3");

    obj.flowPart54 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart54:setParent(obj.flowLayout2);
    obj.flowPart54:setMinWidth(70);
    obj.flowPart54:setMaxWidth(100);
    obj.flowPart54:setHeight(15);
    obj.flowPart54:setName("flowPart54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.flowPart54);
    obj.label55:setAlign("top");
    obj.label55:setFontSize(10);
    obj.label55:setText("Aurora");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setWordWrap(true);
    obj.label55:setTextTrimming("none");
    obj.label55:setAutoSize(true);
    obj.label55:setHint("");
    obj.label55:setName("label55");

    obj.flowPart55 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart55:setParent(obj.flowLayout2);
    obj.flowPart55:setMinWidth(100);
    obj.flowPart55:setMaxWidth(150);
    obj.flowPart55:setHeight(20);
    obj.flowPart55:setName("flowPart55");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.flowPart55);
    obj.comboBox6:setAlign("top");
    obj.comboBox6:setFontSize(10);
    obj.comboBox6:setField("auroras");
    obj.comboBox6:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setName("comboBox6");

    obj.flowPart56 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart56:setParent(obj.flowLayout2);
    obj.flowPart56:setMinWidth(20);
    obj.flowPart56:setMaxWidth(50);
    obj.flowPart56:setHeight(20);
    obj.flowPart56:setName("flowPart56");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart56);
    obj.edit58:setAlign("client");
    obj.edit58:setFontSize(10);
    obj.edit58:setField("auroras_chance");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setName("edit58");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.flowLayout2);
    obj.dataLink4:setField("auroras");
    obj.dataLink4:setName("dataLink4");

    obj.flowPart57 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart57:setParent(obj.flowLayout2);
    obj.flowPart57:setMinWidth(70);
    obj.flowPart57:setMaxWidth(100);
    obj.flowPart57:setHeight(15);
    obj.flowPart57:setName("flowPart57");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.flowPart57);
    obj.label56:setAlign("top");
    obj.label56:setFontSize(10);
    obj.label56:setText("Cometas");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setWordWrap(true);
    obj.label56:setTextTrimming("none");
    obj.label56:setAutoSize(true);
    obj.label56:setHint("");
    obj.label56:setName("label56");

    obj.flowPart58 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart58:setParent(obj.flowLayout2);
    obj.flowPart58:setMinWidth(100);
    obj.flowPart58:setMaxWidth(150);
    obj.flowPart58:setHeight(20);
    obj.flowPart58:setName("flowPart58");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.flowPart58);
    obj.comboBox7:setAlign("top");
    obj.comboBox7:setFontSize(10);
    obj.comboBox7:setField("cometas");
    obj.comboBox7:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setName("comboBox7");

    obj.flowPart59 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart59:setParent(obj.flowLayout2);
    obj.flowPart59:setMinWidth(20);
    obj.flowPart59:setMaxWidth(50);
    obj.flowPart59:setHeight(20);
    obj.flowPart59:setName("flowPart59");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart59);
    obj.edit59:setAlign("client");
    obj.edit59:setFontSize(10);
    obj.edit59:setField("cometas_chance");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setName("edit59");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.flowLayout2);
    obj.dataLink5:setField("cometas");
    obj.dataLink5:setName("dataLink5");

    obj.flowPart60 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart60:setParent(obj.flowLayout2);
    obj.flowPart60:setMinWidth(70);
    obj.flowPart60:setMaxWidth(100);
    obj.flowPart60:setHeight(15);
    obj.flowPart60:setName("flowPart60");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.flowPart60);
    obj.label57:setAlign("top");
    obj.label57:setFontSize(10);
    obj.label57:setText("Estrela Cadente");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setWordWrap(true);
    obj.label57:setTextTrimming("none");
    obj.label57:setAutoSize(true);
    obj.label57:setHint("");
    obj.label57:setName("label57");

    obj.flowPart61 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart61:setParent(obj.flowLayout2);
    obj.flowPart61:setMinWidth(100);
    obj.flowPart61:setMaxWidth(150);
    obj.flowPart61:setHeight(20);
    obj.flowPart61:setName("flowPart61");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.flowPart61);
    obj.comboBox8:setAlign("top");
    obj.comboBox8:setFontSize(10);
    obj.comboBox8:setField("cadentes");
    obj.comboBox8:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setName("comboBox8");

    obj.flowPart62 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart62:setParent(obj.flowLayout2);
    obj.flowPart62:setMinWidth(20);
    obj.flowPart62:setMaxWidth(50);
    obj.flowPart62:setHeight(20);
    obj.flowPart62:setName("flowPart62");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart62);
    obj.edit60:setAlign("client");
    obj.edit60:setFontSize(10);
    obj.edit60:setField("cadentes_chance");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setName("edit60");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.flowLayout2);
    obj.dataLink6:setField("cadentes");
    obj.dataLink6:setName("dataLink6");

    obj.flowPart63 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart63:setParent(obj.flowLayout2);
    obj.flowPart63:setMinWidth(70);
    obj.flowPart63:setMaxWidth(100);
    obj.flowPart63:setHeight(15);
    obj.flowPart63:setName("flowPart63");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart63);
    obj.label58:setAlign("top");
    obj.label58:setFontSize(10);
    obj.label58:setText("Eclipse Lunar");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setWordWrap(true);
    obj.label58:setTextTrimming("none");
    obj.label58:setAutoSize(true);
    obj.label58:setHint("");
    obj.label58:setName("label58");

    obj.flowPart64 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart64:setParent(obj.flowLayout2);
    obj.flowPart64:setMinWidth(100);
    obj.flowPart64:setMaxWidth(150);
    obj.flowPart64:setHeight(20);
    obj.flowPart64:setName("flowPart64");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.flowPart64);
    obj.comboBox9:setAlign("top");
    obj.comboBox9:setFontSize(10);
    obj.comboBox9:setField("lunar");
    obj.comboBox9:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setName("comboBox9");

    obj.flowPart65 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart65:setParent(obj.flowLayout2);
    obj.flowPart65:setMinWidth(20);
    obj.flowPart65:setMaxWidth(50);
    obj.flowPart65:setHeight(20);
    obj.flowPart65:setName("flowPart65");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart65);
    obj.edit61:setAlign("client");
    obj.edit61:setFontSize(10);
    obj.edit61:setField("lunar_chance");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setName("edit61");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.flowLayout2);
    obj.dataLink7:setField("lunar");
    obj.dataLink7:setName("dataLink7");

    obj.flowPart66 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart66:setParent(obj.flowLayout2);
    obj.flowPart66:setMinWidth(70);
    obj.flowPart66:setMaxWidth(100);
    obj.flowPart66:setHeight(15);
    obj.flowPart66:setName("flowPart66");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart66);
    obj.label59:setAlign("top");
    obj.label59:setFontSize(10);
    obj.label59:setText("Eclipse Solar");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setWordWrap(true);
    obj.label59:setTextTrimming("none");
    obj.label59:setAutoSize(true);
    obj.label59:setHint("");
    obj.label59:setName("label59");

    obj.flowPart67 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart67:setParent(obj.flowLayout2);
    obj.flowPart67:setMinWidth(100);
    obj.flowPart67:setMaxWidth(150);
    obj.flowPart67:setHeight(20);
    obj.flowPart67:setName("flowPart67");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.flowPart67);
    obj.comboBox10:setAlign("top");
    obj.comboBox10:setFontSize(10);
    obj.comboBox10:setField("solar");
    obj.comboBox10:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setName("comboBox10");

    obj.flowPart68 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart68:setParent(obj.flowLayout2);
    obj.flowPart68:setMinWidth(20);
    obj.flowPart68:setMaxWidth(50);
    obj.flowPart68:setHeight(20);
    obj.flowPart68:setName("flowPart68");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.flowPart68);
    obj.edit62:setAlign("client");
    obj.edit62:setFontSize(10);
    obj.edit62:setField("solar_chance");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setName("edit62");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.flowLayout2);
    obj.dataLink8:setField("solar");
    obj.dataLink8:setName("dataLink8");

    obj.flowPart69 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart69:setParent(obj.flowLayout2);
    obj.flowPart69:setMinWidth(70);
    obj.flowPart69:setMaxWidth(100);
    obj.flowPart69:setHeight(15);
    obj.flowPart69:setName("flowPart69");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart69);
    obj.label60:setAlign("top");
    obj.label60:setFontSize(10);
    obj.label60:setText("Meteoros");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setWordWrap(true);
    obj.label60:setTextTrimming("none");
    obj.label60:setAutoSize(true);
    obj.label60:setHint("");
    obj.label60:setName("label60");

    obj.flowPart70 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart70:setParent(obj.flowLayout2);
    obj.flowPart70:setMinWidth(100);
    obj.flowPart70:setMaxWidth(150);
    obj.flowPart70:setHeight(20);
    obj.flowPart70:setName("flowPart70");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.flowPart70);
    obj.comboBox11:setAlign("top");
    obj.comboBox11:setFontSize(10);
    obj.comboBox11:setField("meteoros");
    obj.comboBox11:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setName("comboBox11");

    obj.flowPart71 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart71:setParent(obj.flowLayout2);
    obj.flowPart71:setMinWidth(20);
    obj.flowPart71:setMaxWidth(50);
    obj.flowPart71:setHeight(20);
    obj.flowPart71:setName("flowPart71");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.flowPart71);
    obj.edit63:setAlign("client");
    obj.edit63:setFontSize(10);
    obj.edit63:setField("meteoros_chance");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setName("edit63");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.flowLayout2);
    obj.dataLink9:setField("meteoros");
    obj.dataLink9:setName("dataLink9");

    obj.flowPart72 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart72:setParent(obj.flowLayout2);
    obj.flowPart72:setMinWidth(70);
    obj.flowPart72:setMaxWidth(100);
    obj.flowPart72:setHeight(15);
    obj.flowPart72:setName("flowPart72");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart72);
    obj.label61:setAlign("top");
    obj.label61:setFontSize(10);
    obj.label61:setText("Terremotos");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setWordWrap(true);
    obj.label61:setTextTrimming("none");
    obj.label61:setAutoSize(true);
    obj.label61:setHint("");
    obj.label61:setName("label61");

    obj.flowPart73 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart73:setParent(obj.flowLayout2);
    obj.flowPart73:setMinWidth(100);
    obj.flowPart73:setMaxWidth(150);
    obj.flowPart73:setHeight(20);
    obj.flowPart73:setName("flowPart73");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.flowPart73);
    obj.comboBox12:setAlign("top");
    obj.comboBox12:setFontSize(10);
    obj.comboBox12:setField("terremotos");
    obj.comboBox12:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante', 'Personalizado'});
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setName("comboBox12");

    obj.flowPart74 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart74:setParent(obj.flowLayout2);
    obj.flowPart74:setMinWidth(20);
    obj.flowPart74:setMaxWidth(50);
    obj.flowPart74:setHeight(20);
    obj.flowPart74:setName("flowPart74");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.flowPart74);
    obj.edit64:setAlign("client");
    obj.edit64:setFontSize(10);
    obj.edit64:setField("terremotos_chance");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setName("edit64");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.flowLayout2);
    obj.dataLink10:setField("terremotos");
    obj.dataLink10:setName("dataLink10");

    obj.popMoon = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMoon:setParent(obj.scrollBox2);
    obj.popMoon:setName("popMoon");
    obj.popMoon:setWidth(250);
    obj.popMoon:setHeight(190);
    obj.popMoon:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popMoon, "autoScopeNode",  "false");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.popMoon);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxControlsPerLine(3);
    obj.flowLayout3:setMargins({bottom=4});
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setName("flowLayout3");

    obj.flowPart75 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart75:setParent(obj.flowLayout3);
    obj.flowPart75:setMinWidth(100);
    obj.flowPart75:setMaxWidth(150);
    obj.flowPart75:setHeight(15);
    obj.flowPart75:setName("flowPart75");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.flowPart75);
    obj.label62:setAlign("top");
    obj.label62:setFontSize(10);
    obj.label62:setText("Fases da Lua");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setWordWrap(true);
    obj.label62:setTextTrimming("none");
    obj.label62:setAutoSize(true);
    obj.label62:setName("label62");

    obj.flowPart76 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart76:setParent(obj.flowLayout3);
    obj.flowPart76:setMinWidth(100);
    obj.flowPart76:setMaxWidth(150);
    obj.flowPart76:setHeight(15);
    obj.flowPart76:setName("flowPart76");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart76);
    obj.label63:setAlign("top");
    obj.label63:setFontSize(10);
    obj.label63:setText("Nome Alternativo");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setWordWrap(true);
    obj.label63:setTextTrimming("none");
    obj.label63:setAutoSize(true);
    obj.label63:setName("label63");

    obj.flowPart77 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart77:setParent(obj.flowLayout3);
    obj.flowPart77:setMinWidth(20);
    obj.flowPart77:setMaxWidth(50);
    obj.flowPart77:setHeight(15);
    obj.flowPart77:setName("flowPart77");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart77);
    obj.label64:setAlign("top");
    obj.label64:setFontSize(10);
    obj.label64:setText("Dur.");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setWordWrap(true);
    obj.label64:setTextTrimming("none");
    obj.label64:setAutoSize(true);
    obj.label64:setName("label64");

    obj.flowPart78 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart78:setParent(obj.flowLayout3);
    obj.flowPart78:setMinWidth(100);
    obj.flowPart78:setMaxWidth(150);
    obj.flowPart78:setHeight(15);
    obj.flowPart78:setName("flowPart78");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart78);
    obj.label65:setAlign("top");
    obj.label65:setFontSize(10);
    obj.label65:setText("Cheia");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setWordWrap(true);
    obj.label65:setTextTrimming("none");
    obj.label65:setAutoSize(true);
    obj.label65:setName("label65");

    obj.flowPart79 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart79:setParent(obj.flowLayout3);
    obj.flowPart79:setMinWidth(100);
    obj.flowPart79:setMaxWidth(150);
    obj.flowPart79:setHeight(20);
    obj.flowPart79:setName("flowPart79");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.flowPart79);
    obj.edit65:setAlign("client");
    obj.edit65:setFontSize(10);
    obj.edit65:setField("lua_cheia");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setName("edit65");

    obj.flowPart80 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart80:setParent(obj.flowLayout3);
    obj.flowPart80:setMinWidth(20);
    obj.flowPart80:setMaxWidth(50);
    obj.flowPart80:setHeight(20);
    obj.flowPart80:setName("flowPart80");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.flowPart80);
    obj.edit66:setAlign("client");
    obj.edit66:setFontSize(10);
    obj.edit66:setField("lua_cheia_duration");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setName("edit66");

    obj.flowPart81 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart81:setParent(obj.flowLayout3);
    obj.flowPart81:setMinWidth(100);
    obj.flowPart81:setMaxWidth(150);
    obj.flowPart81:setHeight(15);
    obj.flowPart81:setName("flowPart81");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart81);
    obj.label66:setAlign("top");
    obj.label66:setFontSize(10);
    obj.label66:setText("Minguante Convexo");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setWordWrap(true);
    obj.label66:setTextTrimming("none");
    obj.label66:setAutoSize(true);
    obj.label66:setName("label66");

    obj.flowPart82 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart82:setParent(obj.flowLayout3);
    obj.flowPart82:setMinWidth(100);
    obj.flowPart82:setMaxWidth(150);
    obj.flowPart82:setHeight(20);
    obj.flowPart82:setName("flowPart82");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.flowPart82);
    obj.edit67:setAlign("client");
    obj.edit67:setFontSize(10);
    obj.edit67:setField("lua_minguante_convexo");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setName("edit67");

    obj.flowPart83 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart83:setParent(obj.flowLayout3);
    obj.flowPart83:setMinWidth(20);
    obj.flowPart83:setMaxWidth(50);
    obj.flowPart83:setHeight(20);
    obj.flowPart83:setName("flowPart83");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.flowPart83);
    obj.edit68:setAlign("client");
    obj.edit68:setFontSize(10);
    obj.edit68:setField("lua_minguante_convexo_duration");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setName("edit68");

    obj.flowPart84 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart84:setParent(obj.flowLayout3);
    obj.flowPart84:setMinWidth(100);
    obj.flowPart84:setMaxWidth(150);
    obj.flowPart84:setHeight(15);
    obj.flowPart84:setName("flowPart84");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.flowPart84);
    obj.label67:setAlign("top");
    obj.label67:setFontSize(10);
    obj.label67:setText("Quarto Minguante");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setWordWrap(true);
    obj.label67:setTextTrimming("none");
    obj.label67:setAutoSize(true);
    obj.label67:setName("label67");

    obj.flowPart85 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart85:setParent(obj.flowLayout3);
    obj.flowPart85:setMinWidth(100);
    obj.flowPart85:setMaxWidth(150);
    obj.flowPart85:setHeight(20);
    obj.flowPart85:setName("flowPart85");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.flowPart85);
    obj.edit69:setAlign("client");
    obj.edit69:setFontSize(10);
    obj.edit69:setField("lua_quarto_minguante");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setName("edit69");

    obj.flowPart86 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart86:setParent(obj.flowLayout3);
    obj.flowPart86:setMinWidth(20);
    obj.flowPart86:setMaxWidth(50);
    obj.flowPart86:setHeight(20);
    obj.flowPart86:setName("flowPart86");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.flowPart86);
    obj.edit70:setAlign("client");
    obj.edit70:setFontSize(10);
    obj.edit70:setField("lua_quarto_minguante_duration");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setName("edit70");

    obj.flowPart87 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart87:setParent(obj.flowLayout3);
    obj.flowPart87:setMinWidth(100);
    obj.flowPart87:setMaxWidth(150);
    obj.flowPart87:setHeight(15);
    obj.flowPart87:setName("flowPart87");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart87);
    obj.label68:setAlign("top");
    obj.label68:setFontSize(10);
    obj.label68:setText("Minguante Concavo");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setWordWrap(true);
    obj.label68:setTextTrimming("none");
    obj.label68:setAutoSize(true);
    obj.label68:setName("label68");

    obj.flowPart88 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart88:setParent(obj.flowLayout3);
    obj.flowPart88:setMinWidth(100);
    obj.flowPart88:setMaxWidth(150);
    obj.flowPart88:setHeight(20);
    obj.flowPart88:setName("flowPart88");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.flowPart88);
    obj.edit71:setAlign("client");
    obj.edit71:setFontSize(10);
    obj.edit71:setField("lua_minguante_concavo");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setName("edit71");

    obj.flowPart89 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart89:setParent(obj.flowLayout3);
    obj.flowPart89:setMinWidth(20);
    obj.flowPart89:setMaxWidth(50);
    obj.flowPart89:setHeight(20);
    obj.flowPart89:setName("flowPart89");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.flowPart89);
    obj.edit72:setAlign("client");
    obj.edit72:setFontSize(10);
    obj.edit72:setField("lua_minguante_concavo_duration");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setName("edit72");

    obj.flowPart90 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart90:setParent(obj.flowLayout3);
    obj.flowPart90:setMinWidth(100);
    obj.flowPart90:setMaxWidth(150);
    obj.flowPart90:setHeight(15);
    obj.flowPart90:setName("flowPart90");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart90);
    obj.label69:setAlign("top");
    obj.label69:setFontSize(10);
    obj.label69:setText("Lua Nova");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setWordWrap(true);
    obj.label69:setTextTrimming("none");
    obj.label69:setAutoSize(true);
    obj.label69:setName("label69");

    obj.flowPart91 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart91:setParent(obj.flowLayout3);
    obj.flowPart91:setMinWidth(100);
    obj.flowPart91:setMaxWidth(150);
    obj.flowPart91:setHeight(20);
    obj.flowPart91:setName("flowPart91");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.flowPart91);
    obj.edit73:setAlign("client");
    obj.edit73:setFontSize(10);
    obj.edit73:setField("lua_lua_nova");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setName("edit73");

    obj.flowPart92 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart92:setParent(obj.flowLayout3);
    obj.flowPart92:setMinWidth(20);
    obj.flowPart92:setMaxWidth(50);
    obj.flowPart92:setHeight(20);
    obj.flowPart92:setName("flowPart92");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.flowPart92);
    obj.edit74:setAlign("client");
    obj.edit74:setFontSize(10);
    obj.edit74:setField("lua_lua_nova_duration");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setName("edit74");

    obj.flowPart93 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart93:setParent(obj.flowLayout3);
    obj.flowPart93:setMinWidth(100);
    obj.flowPart93:setMaxWidth(150);
    obj.flowPart93:setHeight(15);
    obj.flowPart93:setName("flowPart93");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart93);
    obj.label70:setAlign("top");
    obj.label70:setFontSize(10);
    obj.label70:setText("Crescente Concavo");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setWordWrap(true);
    obj.label70:setTextTrimming("none");
    obj.label70:setAutoSize(true);
    obj.label70:setName("label70");

    obj.flowPart94 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart94:setParent(obj.flowLayout3);
    obj.flowPart94:setMinWidth(100);
    obj.flowPart94:setMaxWidth(150);
    obj.flowPart94:setHeight(20);
    obj.flowPart94:setName("flowPart94");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.flowPart94);
    obj.edit75:setAlign("client");
    obj.edit75:setFontSize(10);
    obj.edit75:setField("lua_crescente_concavo");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setName("edit75");

    obj.flowPart95 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart95:setParent(obj.flowLayout3);
    obj.flowPart95:setMinWidth(20);
    obj.flowPart95:setMaxWidth(50);
    obj.flowPart95:setHeight(20);
    obj.flowPart95:setName("flowPart95");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.flowPart95);
    obj.edit76:setAlign("client");
    obj.edit76:setFontSize(10);
    obj.edit76:setField("lua_crescente_concavo_duration");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setName("edit76");

    obj.flowPart96 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart96:setParent(obj.flowLayout3);
    obj.flowPart96:setMinWidth(100);
    obj.flowPart96:setMaxWidth(150);
    obj.flowPart96:setHeight(15);
    obj.flowPart96:setName("flowPart96");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart96);
    obj.label71:setAlign("top");
    obj.label71:setFontSize(10);
    obj.label71:setText("Quarto Crescente");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setWordWrap(true);
    obj.label71:setTextTrimming("none");
    obj.label71:setAutoSize(true);
    obj.label71:setName("label71");

    obj.flowPart97 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart97:setParent(obj.flowLayout3);
    obj.flowPart97:setMinWidth(100);
    obj.flowPart97:setMaxWidth(150);
    obj.flowPart97:setHeight(20);
    obj.flowPart97:setName("flowPart97");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.flowPart97);
    obj.edit77:setAlign("client");
    obj.edit77:setFontSize(10);
    obj.edit77:setField("lua_quarto_crescente");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setName("edit77");

    obj.flowPart98 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart98:setParent(obj.flowLayout3);
    obj.flowPart98:setMinWidth(20);
    obj.flowPart98:setMaxWidth(50);
    obj.flowPart98:setHeight(20);
    obj.flowPart98:setName("flowPart98");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.flowPart98);
    obj.edit78:setAlign("client");
    obj.edit78:setFontSize(10);
    obj.edit78:setField("lua_quarto_crescente_duration");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setName("edit78");

    obj.flowPart99 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart99:setParent(obj.flowLayout3);
    obj.flowPart99:setMinWidth(100);
    obj.flowPart99:setMaxWidth(150);
    obj.flowPart99:setHeight(15);
    obj.flowPart99:setName("flowPart99");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowPart99);
    obj.label72:setAlign("top");
    obj.label72:setFontSize(10);
    obj.label72:setText("Crescente Convexo");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setWordWrap(true);
    obj.label72:setTextTrimming("none");
    obj.label72:setAutoSize(true);
    obj.label72:setName("label72");

    obj.flowPart100 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart100:setParent(obj.flowLayout3);
    obj.flowPart100:setMinWidth(100);
    obj.flowPart100:setMaxWidth(150);
    obj.flowPart100:setHeight(20);
    obj.flowPart100:setName("flowPart100");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.flowPart100);
    obj.edit79:setAlign("client");
    obj.edit79:setFontSize(10);
    obj.edit79:setField("lua_crescente_convexo");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setName("edit79");

    obj.flowPart101 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart101:setParent(obj.flowLayout3);
    obj.flowPart101:setMinWidth(20);
    obj.flowPart101:setMaxWidth(50);
    obj.flowPart101:setHeight(20);
    obj.flowPart101:setName("flowPart101");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.flowPart101);
    obj.edit80:setAlign("client");
    obj.edit80:setFontSize(10);
    obj.edit80:setField("lua_crescente_convexo_duration");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setName("edit80");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox2);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(345);
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(250);
    obj.layout19:setMargins({right=5});
    obj.layout19:setName("layout19");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout19);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("Black");
    obj.rectangle13:setName("rectangle13");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout19);
    obj.label73:setWidth(250);
    obj.label73:setHeight(20);
    obj.label73:setText("MESES");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(25);
    obj.layout20:setWidth(250);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout20);
    obj.button17:setLeft(10);
    obj.button17:setTop(0);
    obj.button17:setWidth(25);
    obj.button17:setHeight(25);
    obj.button17:setText("+");
    obj.button17:setHint("Novo");
    obj.button17:setName("button17");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout20);
    obj.label74:setLeft(115);
    obj.label74:setTop(0);
    obj.label74:setWidth(40);
    obj.label74:setHeight(25);
    obj.label74:setText("Total");
    obj.label74:setHitTest(true);
    obj.label74:setHint("Quantos dias dura o ano.");
    obj.label74:setName("label74");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout20);
    obj.rectangle14:setLeft(165);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(35);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.dias = GUI.fromHandle(_obj_newObject("label"));
    obj.dias:setParent(obj.layout20);
    obj.dias:setLeft(165);
    obj.dias:setTop(0);
    obj.dias:setWidth(35);
    obj.dias:setHeight(25);
    obj.dias:setField("dias");
    obj.dias:setHorzTextAlign("center");
    obj.dias:setFontSize(12);
    obj.dias:setName("dias");
    obj.dias:setHitTest(true);
    obj.dias:setHint("Se estiver vermelho a duração do ano e das estações está dessincronizada. ");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout19);
    obj.label75:setLeft(6);
    obj.label75:setTop(50);
    obj.label75:setWidth(30);
    obj.label75:setHeight(25);
    obj.label75:setText("Nº");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setHitTest(true);
    obj.label75:setHint("Qual a ordem dos meses?");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout19);
    obj.label76:setLeft(45);
    obj.label76:setTop(50);
    obj.label76:setWidth(110);
    obj.label76:setHeight(25);
    obj.label76:setText("Nome");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout19);
    obj.label77:setLeft(155);
    obj.label77:setTop(50);
    obj.label77:setWidth(55);
    obj.label77:setHeight(25);
    obj.label77:setText("Duração");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setHitTest(true);
    obj.label77:setHint("Quantos dias dura esse mês.");
    obj.label77:setName("label77");

    obj.rclMeses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMeses:setParent(obj.layout19);
    obj.rclMeses:setLeft(5);
    obj.rclMeses:setTop(80);
    obj.rclMeses:setWidth(240);
    obj.rclMeses:setHeight(260);
    obj.rclMeses:setName("rclMeses");
    obj.rclMeses:setField("listaMeses");
    obj.rclMeses:setTemplateForm("frmGerenciador02_MES");
    obj.rclMeses:setLayout("vertical");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout19);
    obj.dataLink11:setFields({'duracaoEstacao', 'dias'});
    obj.dataLink11:setName("dataLink11");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout18);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(250);
    obj.layout21:setMargins({right=5});
    obj.layout21:setName("layout21");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout21);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("Black");
    obj.rectangle15:setName("rectangle15");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout21);
    obj.label78:setWidth(250);
    obj.label78:setHeight(20);
    obj.label78:setText("DIAS DA SEMANA");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(25);
    obj.layout22:setWidth(250);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout22);
    obj.button18:setLeft(10);
    obj.button18:setTop(0);
    obj.button18:setWidth(25);
    obj.button18:setHeight(25);
    obj.button18:setText("+");
    obj.button18:setHint("Novo");
    obj.button18:setName("button18");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout22);
    obj.label79:setLeft(125);
    obj.label79:setTop(0);
    obj.label79:setWidth(40);
    obj.label79:setHeight(25);
    obj.label79:setText("Desvio");
    obj.label79:setHitTest(true);
    obj.label79:setHint("O ano 1 começa em quem dia da semana?");
    obj.label79:setName("label79");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout22);
    obj.edit81:setLeft(165);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(35);
    obj.edit81:setHeight(25);
    obj.edit81:setField("desvioSemana");
    obj.edit81:setType("number");
    obj.edit81:setName("edit81");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout21);
    obj.label80:setLeft(6);
    obj.label80:setTop(50);
    obj.label80:setWidth(30);
    obj.label80:setHeight(25);
    obj.label80:setText("Nº");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setHitTest(true);
    obj.label80:setHint("Qual a ordem dos dias da semana?");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout21);
    obj.label81:setLeft(35);
    obj.label81:setTop(50);
    obj.label81:setWidth(165);
    obj.label81:setHeight(25);
    obj.label81:setText("Nome");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.rclSemana = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSemana:setParent(obj.layout21);
    obj.rclSemana:setLeft(5);
    obj.rclSemana:setTop(80);
    obj.rclSemana:setWidth(240);
    obj.rclSemana:setHeight(260);
    obj.rclSemana:setName("rclSemana");
    obj.rclSemana:setField("listaSemana");
    obj.rclSemana:setTemplateForm("frmGerenciador02_SEMANA");
    obj.rclSemana:setLayout("vertical");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout18);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(275);
    obj.layout23:setMargins({right=5});
    obj.layout23:setName("layout23");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout23);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("Black");
    obj.rectangle16:setName("rectangle16");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout23);
    obj.label82:setWidth(275);
    obj.label82:setHeight(20);
    obj.label82:setText("LUAS");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout23);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(25);
    obj.layout24:setWidth(250);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout24);
    obj.button19:setLeft(10);
    obj.button19:setTop(0);
    obj.button19:setWidth(25);
    obj.button19:setHeight(25);
    obj.button19:setText("+");
    obj.button19:setHint("Novo");
    obj.button19:setName("button19");

    obj.celestialBt = GUI.fromHandle(_obj_newObject("button"));
    obj.celestialBt:setParent(obj.layout24);
    obj.celestialBt:setLeft(35);
    obj.celestialBt:setTop(0);
    obj.celestialBt:setWidth(25);
    obj.celestialBt:setHeight(25);
    obj.celestialBt:setText("i");
    obj.celestialBt:setName("celestialBt");
    obj.celestialBt:setHint("Eventos Celestiais");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout23);
    obj.label83:setLeft(15);
    obj.label83:setTop(50);
    obj.label83:setWidth(110);
    obj.label83:setHeight(25);
    obj.label83:setText("Nome");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout23);
    obj.label84:setLeft(120);
    obj.label84:setTop(50);
    obj.label84:setWidth(55);
    obj.label84:setHeight(25);
    obj.label84:setText("Ciclo");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setHitTest(true);
    obj.label84:setHint("Quantos dias leva o ciclo lunar?");
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout23);
    obj.label85:setLeft(155);
    obj.label85:setTop(50);
    obj.label85:setWidth(55);
    obj.label85:setHeight(25);
    obj.label85:setText("Desvio");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setHitTest(true);
    obj.label85:setHint("No ano 1 em que dia começa o ciclo lunar (lua cheia)?");
    obj.label85:setName("label85");

    obj.rclLuas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLuas:setParent(obj.layout23);
    obj.rclLuas:setLeft(5);
    obj.rclLuas:setTop(80);
    obj.rclLuas:setWidth(265);
    obj.rclLuas:setHeight(260);
    obj.rclLuas:setName("rclLuas");
    obj.rclLuas:setField("listaLuas");
    obj.rclLuas:setTemplateForm("frmGerenciador02_LUA");
    obj.rclLuas:setLayout("vertical");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout18);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(250);
    obj.layout25:setMargins({right=5});
    obj.layout25:setName("layout25");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout25);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("Black");
    obj.rectangle17:setName("rectangle17");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout25);
    obj.label86:setWidth(250);
    obj.label86:setHeight(20);
    obj.label86:setText("ESTAÇÕES");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(25);
    obj.layout26:setWidth(250);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout26);
    obj.button20:setLeft(10);
    obj.button20:setTop(0);
    obj.button20:setWidth(25);
    obj.button20:setHeight(25);
    obj.button20:setText("+");
    obj.button20:setHint("Novo");
    obj.button20:setName("button20");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout26);
    obj.label87:setLeft(125);
    obj.label87:setTop(0);
    obj.label87:setWidth(40);
    obj.label87:setHeight(25);
    obj.label87:setText("Desvio");
    obj.label87:setHitTest(true);
    obj.label87:setHint("Em que dia do ano começa a primeira estação?");
    obj.label87:setName("label87");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout26);
    obj.edit82:setLeft(165);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(35);
    obj.edit82:setHeight(25);
    obj.edit82:setField("desvioEstacao");
    obj.edit82:setType("number");
    obj.edit82:setName("edit82");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout25);
    obj.label88:setLeft(6);
    obj.label88:setTop(50);
    obj.label88:setWidth(30);
    obj.label88:setHeight(25);
    obj.label88:setText("Nº");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setHitTest(true);
    obj.label88:setHint("Qual a ordem das estações?");
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout25);
    obj.label89:setLeft(45);
    obj.label89:setTop(50);
    obj.label89:setWidth(85);
    obj.label89:setHeight(25);
    obj.label89:setText("Nome");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout25);
    obj.label90:setLeft(130);
    obj.label90:setTop(50);
    obj.label90:setWidth(55);
    obj.label90:setHeight(25);
    obj.label90:setText("Duração");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setHitTest(true);
    obj.label90:setHint("Quantos dias dura essa estação?");
    obj.label90:setName("label90");

    obj.rclEstacoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEstacoes:setParent(obj.layout25);
    obj.rclEstacoes:setLeft(5);
    obj.rclEstacoes:setTop(80);
    obj.rclEstacoes:setWidth(240);
    obj.rclEstacoes:setHeight(260);
    obj.rclEstacoes:setName("rclEstacoes");
    obj.rclEstacoes:setField("listaEstacoes");
    obj.rclEstacoes:setTemplateForm("frmGerenciador02_ESTACAO");
    obj.rclEstacoes:setLayout("vertical");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout18);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(210);
    obj.layout27:setMargins({right=5});
    obj.layout27:setName("layout27");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout27);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("Black");
    obj.rectangle18:setName("rectangle18");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout27);
    obj.label91:setLeft(5);
    obj.label91:setTop(5);
    obj.label91:setWidth(30);
    obj.label91:setHeight(25);
    obj.label91:setText("Dia");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout27);
    obj.edit83:setLeft(5);
    obj.edit83:setTop(30);
    obj.edit83:setWidth(30);
    obj.edit83:setHeight(25);
    obj.edit83:setField("dia");
    obj.edit83:setType("number");
    obj.edit83:setName("edit83");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout27);
    obj.label92:setLeft(35);
    obj.label92:setTop(5);
    obj.label92:setWidth(30);
    obj.label92:setHeight(25);
    obj.label92:setText("Mês");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout27);
    obj.edit84:setLeft(35);
    obj.edit84:setTop(30);
    obj.edit84:setWidth(30);
    obj.edit84:setHeight(25);
    obj.edit84:setField("mes");
    obj.edit84:setType("number");
    obj.edit84:setName("edit84");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout27);
    obj.label93:setLeft(65);
    obj.label93:setTop(5);
    obj.label93:setWidth(40);
    obj.label93:setHeight(25);
    obj.label93:setText("Ano");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout27);
    obj.edit85:setLeft(65);
    obj.edit85:setTop(30);
    obj.edit85:setWidth(40);
    obj.edit85:setHeight(25);
    obj.edit85:setField("ano");
    obj.edit85:setType("number");
    obj.edit85:setName("edit85");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout27);
    obj.label94:setLeft(105);
    obj.label94:setTop(5);
    obj.label94:setWidth(100);
    obj.label94:setHeight(25);
    obj.label94:setText("Era");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout27);
    obj.edit86:setLeft(105);
    obj.edit86:setTop(30);
    obj.edit86:setWidth(100);
    obj.edit86:setHeight(25);
    obj.edit86:setField("era");
    obj.edit86:setName("edit86");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout27);
    obj.button21:setLeft(5);
    obj.button21:setTop(55);
    obj.button21:setWidth(100);
    obj.button21:setHeight(25);
    obj.button21:setText("Avançar");
    obj.button21:setHint("Avança X dias no Calandario.");
    obj.button21:setName("button21");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout27);
    obj.edit87:setLeft(105);
    obj.edit87:setTop(55);
    obj.edit87:setWidth(50);
    obj.edit87:setHeight(25);
    obj.edit87:setField("add");
    obj.edit87:setName("edit87");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout27);
    obj.label95:setLeft(160);
    obj.label95:setTop(55);
    obj.label95:setWidth(45);
    obj.label95:setHeight(25);
    obj.label95:setText("Dias");
    obj.label95:setName("label95");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout27);
    obj.dataLink12:setField("add");
    obj.dataLink12:setDefaultValue("1");
    obj.dataLink12:setName("dataLink12");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout27);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(80);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("data");
    obj.textEditor1:setName("textEditor1");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(180);
    obj.layout28:setWidth(200);
    obj.layout28:setHeight(155);
    obj.layout28:setName("layout28");

    obj.dataLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.dataLabel:setParent(obj.layout28);
    obj.dataLabel:setLeft(0);
    obj.dataLabel:setTop(0);
    obj.dataLabel:setWidth(200);
    obj.dataLabel:setHeight(20);
    obj.dataLabel:setField("dataLabel");
    obj.dataLabel:setName("dataLabel");
    obj.dataLabel:setFontSize(10);

    obj.estacaoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.estacaoLabel:setParent(obj.layout28);
    obj.estacaoLabel:setLeft(0);
    obj.estacaoLabel:setTop(20);
    obj.estacaoLabel:setWidth(200);
    obj.estacaoLabel:setHeight(20);
    obj.estacaoLabel:setField("estacaoLabel");
    obj.estacaoLabel:setName("estacaoLabel");
    obj.estacaoLabel:setFontSize(10);

    obj.temperaturaLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.temperaturaLabel:setParent(obj.layout28);
    obj.temperaturaLabel:setLeft(0);
    obj.temperaturaLabel:setTop(40);
    obj.temperaturaLabel:setWidth(200);
    obj.temperaturaLabel:setHeight(20);
    obj.temperaturaLabel:setField("temperaturaLabel");
    obj.temperaturaLabel:setName("temperaturaLabel");
    obj.temperaturaLabel:setFontSize(10);
    obj.temperaturaLabel:setHitTest(true);

    obj.precipitacaoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.precipitacaoLabel:setParent(obj.layout28);
    obj.precipitacaoLabel:setLeft(0);
    obj.precipitacaoLabel:setTop(60);
    obj.precipitacaoLabel:setWidth(200);
    obj.precipitacaoLabel:setHeight(20);
    obj.precipitacaoLabel:setField("precipitacaoLabel");
    obj.precipitacaoLabel:setName("precipitacaoLabel");
    obj.precipitacaoLabel:setFontSize(10);
    obj.precipitacaoLabel:setHitTest(true);

    obj.ventoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.ventoLabel:setParent(obj.layout28);
    obj.ventoLabel:setLeft(0);
    obj.ventoLabel:setTop(80);
    obj.ventoLabel:setWidth(200);
    obj.ventoLabel:setHeight(20);
    obj.ventoLabel:setField("ventoLabel");
    obj.ventoLabel:setName("ventoLabel");
    obj.ventoLabel:setFontSize(10);
    obj.ventoLabel:setHitTest(true);

    obj.luasLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.luasLabel:setParent(obj.layout28);
    obj.luasLabel:setLeft(0);
    obj.luasLabel:setTop(100);
    obj.luasLabel:setWidth(200);
    obj.luasLabel:setHeight(35);
    obj.luasLabel:setField("luasLabel");
    obj.luasLabel:setName("luasLabel");
    obj.luasLabel:setFontSize(10);
    obj.luasLabel:setWordWrap(true);
    obj.luasLabel:setTextTrimming("none");

    obj.eventosLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.eventosLabel:setParent(obj.layout28);
    obj.eventosLabel:setLeft(0);
    obj.eventosLabel:setTop(135);
    obj.eventosLabel:setWidth(200);
    obj.eventosLabel:setHeight(20);
    obj.eventosLabel:setField("eventosLabel");
    obj.eventosLabel:setName("eventosLabel");
    obj.eventosLabel:setFontSize(10);
    obj.eventosLabel:setHitTest(true);

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout27);
    obj.dataLink13:setFields({'dia', 'mes', 'ano', 'dias', 'duracaoEstacao', 'desvioSemana', 'desvioEstacao'});
    obj.dataLink13:setName("dataLink13");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("NPCs");
    obj.tab3:setName("tab3");

    obj.Listade_NPC_Dock = GUI.fromHandle(_obj_newObject("form"));
    obj.Listade_NPC_Dock:setParent(obj.tab3);
    obj.Listade_NPC_Dock:setName("Listade_NPC_Dock");
    obj.Listade_NPC_Dock:setAlign("client");
    obj.Listade_NPC_Dock:setTheme("dark");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.Listade_NPC_Dock);
    obj.dataLink14:setField("CorIndex");
    obj.dataLink14:setDefaultValue("0");
    obj.dataLink14:setName("dataLink14");


		function getOrganizacao()
			return self.dcsMain.scopeNode.TipoOrganizar;
		end;
		
		function MudarNomeDaAba(nome)
			sheet.opcaoEscolhida = nome;
		end;

		function self:autoCalcular()
			local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
			self.dropDownFalso:show(bottomCenter, self.comboBoxFalsa);
			self.dropDownFalso.top = self.dropDownFalso.top + self.comboBoxFalsa.height;
			
			self.dropDownFalso.height = 8 + (24 * #nodes)			 
		end;
		
		function autoFechar()
			self.dropDownFalso:close();
		end;
		
		function safeNodeDeletion(node)
			nodes = ndb.getChildNodes(sheet.opcoesFalsas);
			setTimeout(function()
				if node == self.dcsMain.scopeNode then
					self.opcoesFalsas.selectedNode = nodes[1];
				end;
			end, 10)
			ndb.deleteNode(node);
			self:autoCalcular();
			self.dropDownFalso:close();
		end;
		
		function GetBarrinhaNome(id)
			if sheet ~= nil then
				if id == 1 then
					return (sheet.NomeBarrinha1 or "Barrinha 1");
				elseif id == 2 then
					return (sheet.NomeBarrinha2 or "Barrinha 2");
				elseif id == 3 then
					return (sheet.NomeBarrinha3 or "Barrinha 3");
				elseif id == 4 then
					return (sheet.NomeBarrinha4 or "Barrinha 4");
				end;
			end;
		end;
		
		function GetBarrinhaVisivel(blockoverlay, id)
			if sheet ~= nil then
				if not blockoverlay then
					if id == 1 then
						return (sheet.VisibBarrinha1 == "a");
					elseif id == 2 then
						return (sheet.VisibBarrinha2 == "a");
					elseif id == 3 then
						return (sheet.VisibBarrinha3 == "a");
					elseif id == 4 then
						return (sheet.VisibBarrinha4 == "a");
					end;
				else
					return DonoMestre();
				end;
			end;
		end;
		
		function GetBarrinhaNumeros(id)
			if sheet ~= nil then
				if id == 1 then
					return (sheet.NumerosBarrinha1 == "x");
				elseif id == 2 then
					return (sheet.NumerosBarrinha2 == "x");
				elseif id == 3 then
					return (sheet.NumerosBarrinha3 == "x");
				elseif id == 4 then
					return (sheet.NumerosBarrinha4 == "x");
				end;
			end;
		end;
		
		function GetEnviarChat()
			if sheet ~= nil then
				return sheet.EnviarNoChat;
			end;
		end;
	


    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.Listade_NPC_Dock);
    obj.layout29:setAlign("client");
    obj.layout29:setVisible(false);
    obj.layout29:setName("layout29");

    obj.Config = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.Config:setParent(obj.layout29);
    obj.Config:setTitle("Configuração de Barrinhas");
    obj.Config:setName("Config");
    obj.Config:setWidth(406);
    obj.Config:setHeight(190);

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.Config);
    obj.label96:setAlign("top");
    obj.label96:setHeight(18);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setText("Configurações de Barrinhas");
    lfm_setPropAsString(obj.label96, "fontStyle",  "bold");
    obj.label96:setFontColor("white");
    obj.label96:setName("label96");

    obj.dcsTituloEAbas = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsTituloEAbas:setParent(obj.Config);
    obj.dcsTituloEAbas:setName("dcsTituloEAbas");
    obj.dcsTituloEAbas:setAlign("top");
    obj.dcsTituloEAbas:setHeight(18);
    obj.dcsTituloEAbas:setMargins({top=4});

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.dcsTituloEAbas);
    obj.label97:setLeft(5);
    obj.label97:setFontSize(12);
    obj.label97:setAutoSize(true);
    obj.label97:setText("Título da Aba:");
    obj.label97:setName("label97");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.dcsTituloEAbas);
    obj.edit88:setLeft(85);
    obj.edit88:setHeight(18);
    obj.edit88:setFontColor("white");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setFontSize(12);
    obj.edit88:setWidth(108);
    obj.edit88:setField("NomeDaOpcao");
    obj.edit88:setName("edit88");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.dcsTituloEAbas);
    obj.label98:setLeft(210);
    obj.label98:setFontSize(12);
    obj.label98:setAutoSize(true);
    obj.label98:setText("Organização:");
    obj.label98:setMargins({left=12});
    obj.label98:setName("label98");

    obj.comboBox13 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox13:setParent(obj.dcsTituloEAbas);
    obj.comboBox13:setLeft(292);
    obj.comboBox13:setHeight(18);
    obj.comboBox13:setFontColor("white");
    obj.comboBox13:setFontSize(12);
    obj.comboBox13:setWidth(108);
    obj.comboBox13:setField("TipoOrganizar");
    obj.comboBox13:setItems({'Alfabética', 'Alinhamento'});
    obj.comboBox13:setValues({'Alfa', 'Alin'});
    obj.comboBox13:setName("comboBox13");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.Config);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(18);
    obj.layout30:setMargins({top=4});
    obj.layout30:setName("layout30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(64);
    obj.layout31:setName("layout31");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout30);
    obj.label99:setAlign("left");
    obj.label99:setFontSize(12);
    obj.label99:setWidth(108);
    obj.label99:setText("Nome da Barrinha");
    obj.label99:setMargins({left=4});
    obj.label99:setName("label99");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout30);
    obj.label100:setAlign("left");
    obj.label100:setFontSize(12);
    obj.label100:setWidth(26);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setText("Cor");
    obj.label100:setMargins({left=4});
    obj.label100:setName("label100");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout30);
    obj.label101:setAlign("left");
    obj.label101:setFontSize(12);
    obj.label101:setWidth(82);
    obj.label101:setText("Visibilidade");
    obj.label101:setMargins({left=4});
    obj.label101:setName("label101");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout30);
    obj.label102:setAlign("left");
    obj.label102:setFontSize(12);
    obj.label102:setWidth(108);
    obj.label102:setText("Tipo de Números");
    obj.label102:setMargins({left=4});
    obj.label102:setName("label102");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.Config);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(18);
    obj.layout32:setMargins({top=4});
    obj.layout32:setName("layout32");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout32);
    obj.label103:setAlign("left");
    obj.label103:setFontSize(12);
    obj.label103:setText("Barrinha 1:");
    obj.label103:setHorzTextAlign("trailing");
    obj.label103:setWidth(64);
    obj.label103:setName("label103");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout32);
    obj.edit89:setAlign("left");
    obj.edit89:setFontSize(12);
    obj.edit89:setWidth(108);
    obj.edit89:setVertTextAlign("trailing");
    obj.edit89:setField("NomeBarrinha1");
    obj.edit89:setText("Barrinha 1");
    obj.edit89:setMargins({left=4});
    obj.edit89:setName("edit89");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(26);
    obj.layout33:setMargins({left=4});
    obj.layout33:setName("layout33");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout33);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("white");
    obj.rectangle19:setHitTest(true);
    obj.rectangle19:setMargins({left=4, right=4});
    obj.rectangle19:setName("rectangle19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.rectangle19);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle20:setHitTest(true);
    obj.rectangle20:setName("rectangle20");

    obj.CorBarrinha1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.rectangle20);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("#808080");
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha1:setHitTest(true);

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout32);
    obj.comboBox14:setAlign("left");
    obj.comboBox14:setFontSize(12);
    obj.comboBox14:setWidth(82);
    obj.comboBox14:setText("Visibilidade");
    obj.comboBox14:setFontColor("white");
    obj.comboBox14:setVertTextAlign("trailing");
    obj.comboBox14:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox14:setValues({'a', 'b', 'c'});
    obj.comboBox14:setValue("a");
    obj.comboBox14:setField("VisibBarrinha1");
    obj.comboBox14:setMargins({left=4});
    obj.comboBox14:setName("comboBox14");

    obj.comboBox15 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox15:setParent(obj.layout32);
    obj.comboBox15:setAlign("left");
    obj.comboBox15:setFontSize(12);
    obj.comboBox15:setWidth(104);
    obj.comboBox15:setText("Tipo de Números");
    obj.comboBox15:setVertTextAlign("trailing");
    obj.comboBox15:setFontColor("white");
    obj.comboBox15:setField("NumerosBarrinha1");
    obj.comboBox15:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox15:setValues({'x', 'y'});
    obj.comboBox15:setValue("x");
    obj.comboBox15:setMargins({left=4});
    obj.comboBox15:setName("comboBox15");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout32);
    obj.dataLink15:setField("CorBarrinha1");
    obj.dataLink15:setDefaultValue("#808080");
    obj.dataLink15:setName("dataLink15");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.Config);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(18);
    obj.layout34:setMargins({top=4});
    obj.layout34:setName("layout34");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout34);
    obj.label104:setAlign("left");
    obj.label104:setFontSize(12);
    obj.label104:setText("Barrinha 1:");
    obj.label104:setHorzTextAlign("trailing");
    obj.label104:setWidth(64);
    obj.label104:setName("label104");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout34);
    obj.edit90:setAlign("left");
    obj.edit90:setFontSize(12);
    obj.edit90:setWidth(108);
    obj.edit90:setVertTextAlign("trailing");
    obj.edit90:setField("NomeBarrinha2");
    obj.edit90:setText("Barrinha 2");
    obj.edit90:setMargins({left=4});
    obj.edit90:setName("edit90");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(26);
    obj.layout35:setMargins({left=4});
    obj.layout35:setName("layout35");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout35);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("white");
    obj.rectangle21:setHitTest(true);
    obj.rectangle21:setMargins({left=4, right=4});
    obj.rectangle21:setName("rectangle21");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle21);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle22:setHitTest(true);
    obj.rectangle22:setName("rectangle22");

    obj.CorBarrinha2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.rectangle22);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("#808080");
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha2:setHitTest(true);

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout34);
    obj.comboBox16:setAlign("left");
    obj.comboBox16:setFontSize(12);
    obj.comboBox16:setWidth(82);
    obj.comboBox16:setText("Visibilidade");
    obj.comboBox16:setFontColor("white");
    obj.comboBox16:setVertTextAlign("trailing");
    obj.comboBox16:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox16:setValues({'a', 'b', 'c'});
    obj.comboBox16:setValue("a");
    obj.comboBox16:setField("VisibBarrinha2");
    obj.comboBox16:setMargins({left=4});
    obj.comboBox16:setName("comboBox16");

    obj.comboBox17 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox17:setParent(obj.layout34);
    obj.comboBox17:setAlign("left");
    obj.comboBox17:setFontSize(12);
    obj.comboBox17:setWidth(104);
    obj.comboBox17:setText("Tipo de Números");
    obj.comboBox17:setVertTextAlign("trailing");
    obj.comboBox17:setFontColor("white");
    obj.comboBox17:setField("NumerosBarrinha2");
    obj.comboBox17:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox17:setValues({'x', 'y'});
    obj.comboBox17:setValue("x");
    obj.comboBox17:setMargins({left=4});
    obj.comboBox17:setName("comboBox17");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout34);
    obj.dataLink16:setField("CorBarrinha2");
    obj.dataLink16:setDefaultValue("#808080");
    obj.dataLink16:setName("dataLink16");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.Config);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(18);
    obj.layout36:setMargins({top=4});
    obj.layout36:setName("layout36");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout36);
    obj.label105:setAlign("left");
    obj.label105:setFontSize(12);
    obj.label105:setText("Barrinha 1:");
    obj.label105:setHorzTextAlign("trailing");
    obj.label105:setWidth(64);
    obj.label105:setName("label105");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout36);
    obj.edit91:setAlign("left");
    obj.edit91:setFontSize(12);
    obj.edit91:setWidth(108);
    obj.edit91:setVertTextAlign("trailing");
    obj.edit91:setField("NomeBarrinha3");
    obj.edit91:setText("Barrinha 3");
    obj.edit91:setMargins({left=4});
    obj.edit91:setName("edit91");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(26);
    obj.layout37:setMargins({left=4});
    obj.layout37:setName("layout37");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout37);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("white");
    obj.rectangle23:setHitTest(true);
    obj.rectangle23:setMargins({left=4, right=4});
    obj.rectangle23:setName("rectangle23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle23);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle24:setHitTest(true);
    obj.rectangle24:setName("rectangle24");

    obj.CorBarrinha3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.rectangle24);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("#808080");
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha3:setHitTest(true);

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout36);
    obj.comboBox18:setAlign("left");
    obj.comboBox18:setFontSize(12);
    obj.comboBox18:setWidth(82);
    obj.comboBox18:setText("Visibilidade");
    obj.comboBox18:setFontColor("white");
    obj.comboBox18:setVertTextAlign("trailing");
    obj.comboBox18:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox18:setValues({'a', 'b', 'c'});
    obj.comboBox18:setValue("a");
    obj.comboBox18:setField("VisibBarrinha3");
    obj.comboBox18:setMargins({left=4});
    obj.comboBox18:setName("comboBox18");

    obj.comboBox19 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox19:setParent(obj.layout36);
    obj.comboBox19:setAlign("left");
    obj.comboBox19:setFontSize(12);
    obj.comboBox19:setWidth(104);
    obj.comboBox19:setText("Tipo de Números");
    obj.comboBox19:setVertTextAlign("trailing");
    obj.comboBox19:setFontColor("white");
    obj.comboBox19:setField("NumerosBarrinha3");
    obj.comboBox19:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox19:setValues({'x', 'y'});
    obj.comboBox19:setValue("x");
    obj.comboBox19:setMargins({left=4});
    obj.comboBox19:setName("comboBox19");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout36);
    obj.dataLink17:setField("CorBarrinha3");
    obj.dataLink17:setDefaultValue("#808080");
    obj.dataLink17:setName("dataLink17");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.Config);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(18);
    obj.layout38:setMargins({top=4});
    obj.layout38:setName("layout38");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout38);
    obj.label106:setAlign("left");
    obj.label106:setFontSize(12);
    obj.label106:setText("Barrinha 1:");
    obj.label106:setHorzTextAlign("trailing");
    obj.label106:setWidth(64);
    obj.label106:setName("label106");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout38);
    obj.edit92:setAlign("left");
    obj.edit92:setFontSize(12);
    obj.edit92:setWidth(108);
    obj.edit92:setVertTextAlign("trailing");
    obj.edit92:setField("NomeBarrinha4");
    obj.edit92:setText("Barrinha 4");
    obj.edit92:setMargins({left=4});
    obj.edit92:setName("edit92");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(26);
    obj.layout39:setMargins({left=4});
    obj.layout39:setName("layout39");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout39);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("white");
    obj.rectangle25:setHitTest(true);
    obj.rectangle25:setMargins({left=4, right=4});
    obj.rectangle25:setName("rectangle25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle26:setHitTest(true);
    obj.rectangle26:setName("rectangle26");

    obj.CorBarrinha4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha4:setParent(obj.rectangle26);
    obj.CorBarrinha4:setName("CorBarrinha4");
    obj.CorBarrinha4:setColor("#808080");
    obj.CorBarrinha4:setAlign("client");
    obj.CorBarrinha4:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha4:setHitTest(true);

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout38);
    obj.comboBox20:setAlign("left");
    obj.comboBox20:setFontSize(12);
    obj.comboBox20:setWidth(82);
    obj.comboBox20:setText("Visibilidade");
    obj.comboBox20:setFontColor("white");
    obj.comboBox20:setVertTextAlign("trailing");
    obj.comboBox20:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox20:setValues({'a', 'b', 'c'});
    obj.comboBox20:setValue("a");
    obj.comboBox20:setField("VisibBarrinha4");
    obj.comboBox20:setMargins({left=4});
    obj.comboBox20:setName("comboBox20");

    obj.comboBox21 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox21:setParent(obj.layout38);
    obj.comboBox21:setAlign("left");
    obj.comboBox21:setFontSize(12);
    obj.comboBox21:setWidth(104);
    obj.comboBox21:setText("Tipo de Números");
    obj.comboBox21:setVertTextAlign("trailing");
    obj.comboBox21:setFontColor("white");
    obj.comboBox21:setField("NumerosBarrinha4");
    obj.comboBox21:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox21:setValues({'x', 'y'});
    obj.comboBox21:setValue("x");
    obj.comboBox21:setMargins({left=4});
    obj.comboBox21:setName("comboBox21");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout38);
    obj.dataLink18:setField("CorBarrinha4");
    obj.dataLink18:setDefaultValue("#808080");
    obj.dataLink18:setName("dataLink18");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.Config);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(24);
    obj.layout40:setMargins({top=8});
    obj.layout40:setName("layout40");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout40);
    obj.checkBox1:setMargins({left=4});
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setField("EnviarNoChat");
    obj.checkBox1:setWidth(180);
    obj.checkBox1:setFontSize(12);
    obj.checkBox1:setText("Enviar alterações ao chat");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout40);
    obj.dataLink19:setField("EnviarNoChat");
    obj.dataLink19:setDefaultValue("false");
    obj.dataLink19:setName("dataLink19");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout40);
    obj.button22:setAlign("right");
    obj.button22:setWidth(80);
    obj.button22:setText("OK!");
    obj.button22:setMargins({right=8});
    obj.button22:setName("button22");

    obj.SelectCor = GUI.fromHandle(_obj_newObject("popup"));
    obj.SelectCor:setParent(obj.Config);
    obj.SelectCor:setName("SelectCor");
    obj.SelectCor:setWidth(192);
    obj.SelectCor:setHeight(100);
    lfm_setPropAsString(obj.SelectCor, "autoScopeNode",  "false");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.SelectCor);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(24);
    obj.layout41:setName("layout41");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout41);
    obj.label107:setAlign("client");
    obj.label107:setText("Selecione a Cor:");
    obj.label107:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label107, "fontStyle",  "bold");
    obj.label107:setName("label107");

    obj.Nha = GUI.fromHandle(_obj_newObject("layout"));
    obj.Nha:setParent(obj.SelectCor);
    obj.Nha:setName("Nha");
    obj.Nha:setAlign("client");
    obj.Nha:setMargins({left=10, right=10});
    obj.Nha:setHitTest(true);

    obj.Selected = GUI.fromHandle(_obj_newObject("layout"));
    obj.Selected:setParent(obj.Nha);
    obj.Selected:setAlign("none");
    obj.Selected:setName("Selected");
    obj.Selected:setWidth(20);
    obj.Selected:setHeight(20);

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.Selected);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("white");
    obj.rectangle27:setName("rectangle27");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.rectangle27);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle28:setName("rectangle28");

    obj.Flow = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.Flow:setParent(obj.Nha);
    obj.Flow:setName("Flow");
    obj.Flow:setAlign("client");
    obj.Flow:setOrientation("horizontal");
    obj.Flow:setMaxControlsPerLine(8);
    obj.Flow:setHitTest(true);
    obj.Flow:setCanFocus(true);

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.Flow);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(20);
    obj.layout42:setHeight(20);
    obj.layout42:setHitTest(true);
    obj.layout42:setName("layout42");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout42);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle29:setHitTest(true);
    obj.rectangle29:setColor("#acacac");
    obj.rectangle29:setName("rectangle29");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.Flow);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(20);
    obj.layout43:setHeight(20);
    obj.layout43:setHitTest(true);
    obj.layout43:setName("layout43");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout43);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle30:setHitTest(true);
    obj.rectangle30:setColor("#5959ff");
    obj.rectangle30:setName("rectangle30");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.Flow);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(20);
    obj.layout44:setHeight(20);
    obj.layout44:setHitTest(true);
    obj.layout44:setName("layout44");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout44);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle31:setHitTest(true);
    obj.rectangle31:setColor("#59ff59");
    obj.rectangle31:setName("rectangle31");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.Flow);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(20);
    obj.layout45:setHeight(20);
    obj.layout45:setHitTest(true);
    obj.layout45:setName("layout45");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout45);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle32:setHitTest(true);
    obj.rectangle32:setColor("#ff5959");
    obj.rectangle32:setName("rectangle32");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.Flow);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(20);
    obj.layout46:setHeight(20);
    obj.layout46:setHitTest(true);
    obj.layout46:setName("layout46");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout46);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle33:setHitTest(true);
    obj.rectangle33:setColor("#ff59ff");
    obj.rectangle33:setName("rectangle33");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.Flow);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(20);
    obj.layout47:setHeight(20);
    obj.layout47:setHitTest(true);
    obj.layout47:setName("layout47");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout47);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle34:setHitTest(true);
    obj.rectangle34:setColor("#ffac59");
    obj.rectangle34:setName("rectangle34");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.Flow);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(20);
    obj.layout48:setHeight(20);
    obj.layout48:setHitTest(true);
    obj.layout48:setName("layout48");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout48);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle35:setHitTest(true);
    obj.rectangle35:setColor("#ffff59");
    obj.rectangle35:setName("rectangle35");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.Flow);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(20);
    obj.layout49:setHeight(20);
    obj.layout49:setHitTest(true);
    obj.layout49:setName("layout49");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout49);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle36:setHitTest(true);
    obj.rectangle36:setColor("#59ffff");
    obj.rectangle36:setName("rectangle36");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.Flow);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(20);
    obj.layout50:setHeight(20);
    obj.layout50:setHitTest(true);
    obj.layout50:setName("layout50");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout50);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle37:setHitTest(true);
    obj.rectangle37:setColor("#ffd159");
    obj.rectangle37:setName("rectangle37");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.Flow);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(20);
    obj.layout51:setHeight(20);
    obj.layout51:setHitTest(true);
    obj.layout51:setName("layout51");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout51);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle38:setHitTest(true);
    obj.rectangle38:setColor("#5990ff");
    obj.rectangle38:setName("rectangle38");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.Flow);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(20);
    obj.layout52:setHeight(20);
    obj.layout52:setHitTest(true);
    obj.layout52:setName("layout52");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout52);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle39:setHitTest(true);
    obj.rectangle39:setColor("#f4c264");
    obj.rectangle39:setName("rectangle39");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.Flow);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(20);
    obj.layout53:setHeight(20);
    obj.layout53:setHitTest(true);
    obj.layout53:setName("layout53");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout53);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle40:setHitTest(true);
    obj.rectangle40:setColor("#de7a7a");
    obj.rectangle40:setName("rectangle40");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.Flow);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(20);
    obj.layout54:setHeight(20);
    obj.layout54:setHitTest(true);
    obj.layout54:setName("layout54");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout54);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle41:setHitTest(true);
    obj.rectangle41:setColor("#cb83d6");
    obj.rectangle41:setName("rectangle41");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.Flow);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(20);
    obj.layout55:setHeight(20);
    obj.layout55:setHitTest(true);
    obj.layout55:setName("layout55");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout55);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle42:setHitTest(true);
    obj.rectangle42:setColor("#f3658a");
    obj.rectangle42:setName("rectangle42");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.Flow);
    obj.layout56:setAlign("left");
    obj.layout56:setWidth(20);
    obj.layout56:setHeight(20);
    obj.layout56:setHitTest(true);
    obj.layout56:setName("layout56");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout56);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle43:setHitTest(true);
    obj.rectangle43:setColor("#8cecb3");
    obj.rectangle43:setName("rectangle43");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.Flow);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(20);
    obj.layout57:setHeight(20);
    obj.layout57:setHitTest(true);
    obj.layout57:setName("layout57");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout57);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle44:setHitTest(true);
    obj.rectangle44:setColor("#ed846b");
    obj.rectangle44:setName("rectangle44");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.SelectCor);
    obj.layout58:setAlign("bottom");
    obj.layout58:setHeight(24);
    obj.layout58:setName("layout58");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout58);
    obj.button23:setAlign("right");
    obj.button23:setText("OK!");
    obj.button23:setMargins({right=4});
    obj.button23:setName("button23");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.Listade_NPC_Dock);
    obj.rectangle45:setColor("#0f0f0f");
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setPadding({top=4, left=4});
    obj.rectangle45:setName("rectangle45");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle45);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(24);
    obj.layout59:setName("layout59");

    obj.NovaAbadeNPCs = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovaAbadeNPCs:setParent(obj.layout59);
    obj.NovaAbadeNPCs:setMargins({left=4});
    obj.NovaAbadeNPCs:setAlign("left");
    obj.NovaAbadeNPCs:setWidth(24);
    obj.NovaAbadeNPCs:setName("NovaAbadeNPCs");
    obj.NovaAbadeNPCs:setImageChecked("/GerenciadorDeCampanha/images/addlista.png");
    obj.NovaAbadeNPCs:setImageUnchecked("/GerenciadorDeCampanha/images/addlista.png");

    obj.comboBoxFalsa = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.comboBoxFalsa:setParent(obj.layout59);
    obj.comboBoxFalsa:setAlign("left");
    obj.comboBoxFalsa:setMargins({left=8});
    obj.comboBoxFalsa:setName("comboBoxFalsa");
    obj.comboBoxFalsa:setWidth(128);
    obj.comboBoxFalsa:setHeight(20);
    obj.comboBoxFalsa:setHitTest(true);

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.comboBoxFalsa);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("#333333");
    obj.rectangle46:setXradius(2);
    obj.rectangle46:setYradius(2);
    obj.rectangle46:setHitTest(true);
    obj.rectangle46:setName("rectangle46");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.rectangle46);
    obj.label108:setFontColor("white");
    obj.label108:setAlign("client");
    obj.label108:setMargins({left=8});
    obj.label108:setVertTextAlign("center");
    obj.label108:setText("Opções");
    obj.label108:setField("NomeDaOpcao");
    obj.label108:setHitTest(true);
    obj.label108:setName("label108");

    obj.path1 = GUI.fromHandle(_obj_newObject("path"));
    obj.path1:setParent(obj.rectangle46);
    obj.path1:setAlign("right");
    obj.path1:setWidth(16);
    obj.path1:setMargins({right=6, left=6, top=8, bottom=8});
    obj.path1:setColor("orange");
    obj.path1:setPathData("M 100 100 L 300 100 L 200 300 z");
    obj.path1:setName("path1");

    obj.dcsMain = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsMain:setParent(obj.rectangle45);
    obj.dcsMain:setAlign("client");
    obj.dcsMain:setName("dcsMain");

    obj.ListaDeNPCs = GUI.fromHandle(_obj_newObject("form"));
    obj.ListaDeNPCs:setParent(obj.dcsMain);
    obj.ListaDeNPCs:setName("ListaDeNPCs");
    obj.ListaDeNPCs:setAlign("client");
    obj.ListaDeNPCs:setTheme("dark");


		function InvocarOPopupForm(node)
			self.recordNode.scopeNode = node;
			self.dropDownFalso2.scopeNode = sheet;
			self.dropDownFalso2:show();
		end;
	
		function FecharOPopupForm()
			self.dropDownFalso2:close();
		end;
	
		function autoCalcular()
			jogz2 = {}
			mesaDaFicha = rrpg.getMesaDe(sheet);
				for i = 1, #mesaDaFicha.jogadores, 1 do
					jogz2[i] = mesaDaFicha.jogadores[i].login;
				end;
			self.dropDownFalso2.height = (24 * (#jogz2 + 1))		 
			self.opcoesFalsas2:sort();
		end;
		
		function chamarListaDeJogadores()
			if sheet ~= nil then
				self.opcoesFalsas2:sort();
				local nodes = ndb.getChildNodes(sheet.opcoesFalsas2)
				mesaDaFicha = rrpg.getMesaDe(sheet);
				jogz = {}
				jogz[1] = "Nenhum"
				jogz2 = {}
				for i = 1, #nodes, 1 do
					jogz[i+1] = (nodes[i].NomeDaOpcao or "");
				end;
				for i = 1, #mesaDaFicha.jogadores, 1 do
					jogz2[i] = mesaDaFicha.jogadores[i].login;
				end;
				if jogz2 ~= jogz then
					if #nodes >= 2 then
						for i = #nodes, 1, -1 do
						setTimeout( function()
							ndb.deleteNode(nodes[i])
						end,2)
						end;
					end;
					local node = nil;
						node = self.opcoesFalsas2:append();
					setTimeout( function()
					for i = 1, #jogz2, 1 do
						node = self.opcoesFalsas2:append();
					end;
					end,10)
				else
				end;
				setTimeout( function()
					local nodes2 = ndb.getChildNodes(sheet.opcoesFalsas2)
					for i = 1, #nodes2, 1 do
						if i == 1 then
							nodes2[i].NomeDaOpcao = "Nenhum"
							nodes2[1].CodigoInterno = 1;
						else
							nodes2[i].NomeDaOpcao = jogz2[i-1]
							nodes2[i].CodigoInterno = 2;
							nodes2[i].CodigoInterno = 2;
						end
					end;
					autoCalcular();
				end, 20)
			end
		end;
	


    obj.recordNode = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.recordNode:setParent(obj.ListaDeNPCs);
    obj.recordNode:setName("recordNode");
    obj.recordNode:setVisible(false);

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.ListaDeNPCs);
    obj.layout60:setVisible(false);
    obj.layout60:setName("layout60");

    obj.dropDownFalso2 = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.dropDownFalso2:setParent(obj.layout60);
    obj.dropDownFalso2:setName("dropDownFalso2");
    obj.dropDownFalso2:setTitle("Jogador?");
    obj.dropDownFalso2:setWidth(128);
    obj.dropDownFalso2:setHeight(128);

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.dropDownFalso2);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.opcoesFalsas2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.opcoesFalsas2:setParent(obj.scrollBox3);
    obj.opcoesFalsas2:setMargins({left=8});
    obj.opcoesFalsas2:setVisible(true);
    obj.opcoesFalsas2:setAlign("top");
    obj.opcoesFalsas2:setTemplateForm("OpcaoDaComboboxFalsa2");
    obj.opcoesFalsas2:setField("opcoesFalsas2");
    obj.opcoesFalsas2:setName("opcoesFalsas2");
    obj.opcoesFalsas2:setLayout("verticalTiles");
    obj.opcoesFalsas2:setAutoHeight(true);
    obj.opcoesFalsas2:setSelectable(true);
    obj.opcoesFalsas2:setMinQt(0);

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.ListaDeNPCs);
    obj.rectangle47:setColor("#0f0f0f");
    obj.rectangle47:setAlign("client");
    obj.rectangle47:setName("rectangle47");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle47);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(24);
    obj.layout61:setMargins({top=4, left=2});
    obj.layout61:setName("layout61");

    obj.Configurar = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Configurar:setParent(obj.layout61);
    obj.Configurar:setMargins({left=4});
    obj.Configurar:setAlign("left");
    obj.Configurar:setWidth(24);
    obj.Configurar:setHint("Configurações da Lista");
    obj.Configurar:setName("Configurar");
    obj.Configurar:setImageChecked("/GerenciadorDeCampanha/images/config.png");
    obj.Configurar:setImageUnchecked("/GerenciadorDeCampanha/images/config.png");

    obj.NovoNPC = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovoNPC:setParent(obj.layout61);
    obj.NovoNPC:setMargins({left=4});
    obj.NovoNPC:setAlign("left");
    obj.NovoNPC:setWidth(24);
    obj.NovoNPC:setHint("Adicionar novo NPC");
    obj.NovoNPC:setName("NovoNPC");
    obj.NovoNPC:setImageChecked("/GerenciadorDeCampanha/images/addnpc.png");
    obj.NovoNPC:setImageUnchecked("/GerenciadorDeCampanha/images/addnpc.png");

    obj.Organizar = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Organizar:setParent(obj.layout61);
    obj.Organizar:setMargins({left=4});
    obj.Organizar:setAlign("left");
    obj.Organizar:setWidth(24);
    obj.Organizar:setHint("Ordenar Lista de NPCs");
    obj.Organizar:setName("Organizar");
    obj.Organizar:setImageChecked("/GerenciadorDeCampanha/images/organize.png");
    obj.Organizar:setImageUnchecked("/GerenciadorDeCampanha/images/organize.png");

    obj.MainClient = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.MainClient:setParent(obj.rectangle47);
    obj.MainClient:setName("MainClient");
    obj.MainClient:setAlign("client");
    obj.MainClient:setMargins({top=2});

    obj.rclListaDeNPC = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDeNPC:setParent(obj.MainClient);
    obj.rclListaDeNPC:setName("rclListaDeNPC");
    obj.rclListaDeNPC:setLayout("verticalTiles");
    obj.rclListaDeNPC:setField("campoDosNPC");
    obj.rclListaDeNPC:setTemplateForm("CaixaFichaNPC");
    obj.rclListaDeNPC:setAlign("none");
    obj.rclListaDeNPC:setAutoHeight(true);
    obj.rclListaDeNPC:setSelectable(true);
    obj.rclListaDeNPC:setMinQt(0);

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle47);
    obj.layout62:setAlign("bottom");
    obj.layout62:setHeight(32);
    obj.layout62:setName("layout62");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout62);
    obj.label109:setAlign("right");
    lfm_setPropAsString(obj.label109, "fontStyle",  "italic");
    obj.label109:setFontSize(12);
    obj.label109:setOpacity(0.8);
    obj.label109:setAutoSize(true);
    obj.label109:setText("Criado por Mia\nEditado por Ambesek");
    obj.label109:setName("label109");


			function DEC_HEX(IN)
				local B,K,OUT,I,D = 16,"0123456789ABCDEF","",0
				while IN > 0 do
					I=I+1
					D = (IN % B) + 1
					IN = math.floor(IN/B)
					
					OUT = string.sub(K,D,D) .. OUT
				end
				return OUT
			end;
		
			function DonoMestre(node, foioscript)
				if sheet ~= nil then
					node = (node or sheet);
					foioscript = (foioscript or false)
					local personagem = rrpg.getPersonagemDe(sheet);                                
					
					if (personagem ~= nil) then
						local mesa = personagem.mesa;

						if ndb.testPermission(node, "writePermissions") then               
							return true;
						else
							return false;
					   end;
					else
						
						return ndb.testPermission(node, "writePermissions");
					end; 
				end;
			end;

			function EnviarMudanca(barrinhaid, blockoverlay, nomepers, nome, valor, valormax, pc, pcmax)
				if sheet ~= nil then
					if not blockoverlay then
						publico = GetBarrinhaVisivel(blockoverlay, barrinhaid);
					else
						publico = false
					end;
					porcentagem = not (GetBarrinhaNumeros(barrinhaid));
					nome = tostring(nome or GetBarrinhaNome(barrinhaid));
					
					local text = "[§K2]" .. tostring(nome) .. "[§K3] de [§K2]" .. tostring(nomepers) .. "[§K3]: ";
					
					if tonumber(valor) >= 0 then
						valor = "+" .. tostring(valor);
					end;
					if tonumber(valormax) >= 0 then
						valormax = "+" .. tostring(valormax);
					end;
					if tonumber(pc) >= 0 then
						pc = "+" .. tostring(pc);
					end;
					if tonumber(pcmax) >= 0 then
						pcmax = "+" .. tostring(pcmax);
					end;
					
					if publico then
						if not porcentagem then
							if tonumber(valormax) == 0 then
								text = text .. valor;
							else
								text = text .. valor .. "/" .. valormax;
							end;
						else
							if tonumber(valormax) == 0 then
								text = text .. pc .. "%";
							else
								text = text .. pc .. "%" .. "/" .. pcmax .. "%";
							end;
						end;
					else
						if tonumber(valor) >= 0 then
							valor = "+??";
						else 
							valor = "-??"
						end;
						if tonumber(valormax) >= 0 then
							valormax = "+??";
						else 
							valormax = "-??"
						end;
						
						if not porcentagem then
							if tonumber(valormax) == 0 then
								text = text .. valor;
							else
								text = text .. valor .. "/" .. valormax;
							end;
						else
							if tonumber(valormax) == 0 then
								text = text .. valor .. "%";
							else
								text = text .. valor .. "%" .. "/" .. valormax .. "%";
							end;
						end;
					end;
					
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					if mesaDoPersonagem ~= nil then
						mesaDoPersonagem.activeChat:enviarMensagem(text);
					end;
				end;
			end;
			
			function RequestReload(mode)
				if sheet ~= nil then
					if mode == "begin" then
						self.rclListaDeNPC:beginUpdate();
						self.rclListaDeNPC.visible = false;
					elseif mode == "end" then
						self.rclListaDeNPC.visible = true;
						self.rclListaDeNPC:endUpdate();
					end;
				end;
			end;
		


    obj.dropDownFalso = GUI.fromHandle(_obj_newObject("popup"));
    obj.dropDownFalso:setParent(obj.Listade_NPC_Dock);
    obj.dropDownFalso:setName("dropDownFalso");
    obj.dropDownFalso:setWidth(128);
    obj.dropDownFalso:setHeight(128);
    obj.dropDownFalso:setBackOpacity(0);
    obj.dropDownFalso:setNodeObject({sheet});
    obj.dropDownFalso:setHitTest(true);
    lfm_setPropAsString(obj.dropDownFalso, "autoScopeNode",  "false");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.dropDownFalso);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.opcoesFalsas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.opcoesFalsas:setParent(obj.scrollBox4);
    obj.opcoesFalsas:setVisible(true);
    obj.opcoesFalsas:setAlign("client");
    obj.opcoesFalsas:setTemplateForm("OpcaoDaComboboxFalsa");
    obj.opcoesFalsas:setField("opcoesFalsas");
    obj.opcoesFalsas:setName("opcoesFalsas");
    obj.opcoesFalsas:setLayout("verticalTiles");
    obj.opcoesFalsas:setAutoHeight(true);
    obj.opcoesFalsas:setSelectable(true);
    obj.opcoesFalsas:setMinQt(1);

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.Listade_NPC_Dock);
    obj.dataLink20:setField("opcaoEscolhida");
    obj.dataLink20:setDefaultValue("Opções");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.Listade_NPC_Dock);
    obj.dataLink21:setFields({'VisibBarrinha1', 'VisibBarrinha2', 'VisibBarrinha3', 'VisibBarrinha4'});
    obj.dataLink21:setDefaultValues({'a', 'a', 'a', 'a'});
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.Listade_NPC_Dock);
    obj.dataLink22:setFields({'NumerosBarrinha1', 'NumerosBarrinha2', 'NumerosBarrinha3', 'NumerosBarrinha4'});
    obj.dataLink22:setDefaultValues({'x', 'x', 'x', 'x'});
    obj.dataLink22:setName("dataLink22");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Iniciativas");
    obj.tab4:setName("tab4");

    obj.frmCombatTracker = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCombatTracker:setParent(obj.tab4);
    obj.frmCombatTracker:setName("frmCombatTracker");
    obj.frmCombatTracker:setAlign("client");


		local ATOR_VIEW_STATE_VISIVEL = 0;
		local ATOR_VIEW_STATE_PARC_VISIVEL = 1;
		local ATOR_VIEW_STATE_INVISIVEL = 2;
	
		local function getAtoresNDB()
			if sheet.atores == nil then
				sheet.atores = {};
			end;
			
			return sheet.atores;
		end;	

		local function getAtoresNodes()
			local atores = getAtoresNDB();
			return ndb.getChildNodes(atores);
		end;
		
		function self:souMestre()
			local mesa = rrpg.getMesaDe(sheet);

			if mesa ~= nil then
				local j = mesa.meuJogador;
				
				if j ~= nil then
					return j.isMestre;
				else
					return false;
				end;
			else
				return false;
			end;
		end;
		
		function self:narrar(msg)
			local mesa = rrpg.getMesaDe(sheet);
			
			if mesa ~= nil then
				local chat = mesa.chat;
				
				if chat ~= nil then
					chat:enviarNarracao(msg);
				end;
			end;
		end;
		
		function self:escrever(msg)
			local mesa = rrpg.getMesaDe(sheet);
			
			if mesa ~= nil then
				local chat = mesa.chat;
				
				if chat ~= nil then
					chat:escrever(msg);
				end;
			end;
		end;
		
		function self:getNomeColoridoDe(nodeAtor)
			local corAsNumero;
			local fof = nodeAtor.fof;
			
			if fof == 1 then
				corAsNumero = 3; -- Amigo
			elseif fof == 2 then
				corAsNumero = 8;  -- Neutro
			elseif fof == 3 then
				corAsNumero = 4;  -- Inimigo
			else
				corAsNumero = 14; -- Não definido
			end;	

			return "[§K" .. corAsNumero .. "]" .. nodeAtor.nome;			
		end;
		
		function self:ativarTurnoDe(node)
			if not self:souMestre() then
				return nil;
			end;		
		
			local atores = getAtoresNodes();
			local oldEstavaNaVez = node.vez;
			
			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a ~= node then
					a.vez = false;
				end;
			end;
			
			if node ~= nil then
				node.vez = true;
				self.rclAtores:scrollToNode(node);
			end;
						
			if (type(node.nome) == "string" and node.nome ~= "") and
               (not oldEstavaNaVez)	then
				local headerTralha = "[§K15] >>";
				local footerTralha = "";
				local notificacaoDeTurno = "[§K1]" .. headerTralha .. "[§K1] Turno de " .. self:getNomeColoridoDe(node) .. "[§K1] " .. footerTralha;
			
				if (ndb.getPermission(node, "group", "espectadores", "read") ~= "deny") then			   
					self:narrar(notificacaoDeTurno);
				else					
					self:escrever(notificacaoDeTurno);
				end;
			end;
		end;
		
		local scheduledSort = false;
		
		function self:reordenar()
			self.rclAtores:sort();
			scheduledSort = false;
		end;
		
		function self:agendarReordenacao()
			if not scheduledSort then
				scheduledSort = true;
				
				setTimeout(function()
							  if scheduledSort then
								self:reordenar();
								scheduledSort = false;
							  end;							  
						   end, 200);
			end;
		end;	
		
		function self:compareNodes(nodeA, nodeB)
			local r = (tonumber(nodeB.iniciativa) or 0) - (tonumber(nodeA.iniciativa) or 0);
			
			if r == 0 then
				r = (nodeA._id or 0) - (nodeB._id or 0);
			end;
			
			return r;		
		end;
		
		function self:avancarRelogioDeAtor(ator, relogioAtual, relogioOld)
			if ator.dadosSensiveis ~= nil and ator.dadosSensiveis.efeitos ~= nil then
				local lEfeitos = ndb.getChildNodes(ator.dadosSensiveis.efeitos);
				
				for i = 1, #lEfeitos, 1 do
					local ef = lEfeitos[i];
					local duracao = tonumber(ef.duracao);
										
					if (duracao ~= nil) and (duracao > 0) then
						local duracaoReal = tonumber(ef.duracaoReal);					
					
						if duracaoReal == nil then
							duracaoReal = duracao;
							ef.duracaoReal = duracaoReal;
						end;
						
						local duracaoRealRestante = duracaoReal - (relogioAtual - relogioOld);
						local constanteMargemSuperior = 0.000001;
																		
						if duracaoRealRestante < constanteMargemSuperior then
							local nomeEfeito = ef.descricao;
							ndb.deleteNode(ef);
							
							if nomeEfeito ~= nil and ator.nome ~= nil then
								local fof = ator.fof or 0;
								local enviarNarracao = (ndb.getPermission(ator, "group", "espectadores", "read") ~= "deny") and
								                       (fof ~= 3) and (ator.visibilityState ~= ATOR_VIEW_STATE_PARC_VISIVEL); -- não é inimigo;
													   
								local notificacao = "[§K15] >> [§K1]O efeito [§K7]" .. nomeEfeito .. "[§K1] de " .. self:getNomeColoridoDe(ator) .. "[§K1] chegou ao fim";
								
								if enviarNarracao then
									self:narrar(notificacao);
								else
									self:escrever(notificacao);
								end;
							end;
						else
							ef.duracaoReal = duracaoRealRestante;
							local duracaoRestanteArredondada = math.ceil(duracaoRealRestante - constanteMargemSuperior);							
						
							if duracaoRestanteArredondada ~= duracao then
								ef.duracao = duracaoRestanteArredondada;
							end;
						end;						
						
					end;					
				end;
			end;
		end;
		
		function self:avancarRelogio(rodadas)
			-- esta função avança o relógio do combat tracker, podendo remover automaticamente os efeitos
			-- dos atores
			--  OBS: O parâmetro "rodadas" virá com valor "quebrado", exemplo: 0.5, 0.3, etc..
							
			rodadas = rodadas or 1.0;
			local relogioAtual = tonumber(sheet.relogio) or 0.0;
			local relogioOld = relogioAtual;
			local atores = getAtoresNodes();			
			
			relogioAtual = relogioAtual + rodadas;
			
			for i = 1, #atores, 1 do
				self:avancarRelogioDeAtor(atores[i], relogioAtual, relogioOld);
			end;
						
			sheet.relogio = relogioAtual;
		end;
		
		function self:proximoTurno()
			if not self:souMestre() then
				return;
			end;
		
			local atores = getAtoresNodes();
			local atorComVez = nil;
			local idxAtorComVez = nil;
			local novaRodada = false;
			
			if #atores > 0 then			
				table.sort(atores,
					function(nodeA, nodeB)
						return self:compareNodes(nodeA, nodeB) < 0;
					end);
			
				for i = 1, #atores, 1 do
					local a = atores[i];
					
					if a.vez then
						atorComVez = a;
						idxAtorComVez = i;	
						break;					
					end;
				end;			

				if idxAtorComVez == nil then
					idxAtorComVez = 1;
				else					
					idxAtorComVez = idxAtorComVez + 1;
				end;
				
				if idxAtorComVez < 1 then
					idxAtorComVez = 1;
				elseif idxAtorComVez > #atores then
					idxAtorComVez = 1;
					novaRodada = true;
				end;
				
				self:ativarTurnoDe(atores[idxAtorComVez]);
				
				if novaRodada then
					sheet.rodada = (tonumber(sheet.rodada or 0) or 0) + 1;
				end;
			end;
			
			if tonumber(sheet.rodada) == nil then
				sheet.rodada = 1;
			end;
			
			if #atores > 0 then
				self:avancarRelogio(1 / #atores);
			else
				self:avancarRelogio(1);			
			end;
		end;
		
		function self:tratarNovoAtor(node)
			if node ~= nil then
				local g = (sheet.generator or 0) + 1;
				sheet.generator = g;				
				node._id = g;
			end;
		end;
		
		function self:criarNovoAtor()
			local novoNode = nil;
			ndb.beginUpdate(sheet);
			
			tryFinally(function()
					novoNode = self.rclAtores:append();
					self:tratarNovoAtor(novoNode);
				end,
				
				function()
					ndb.endUpdate(sheet);
				end);
				
			return novoNode;
		end;
		
		function self:limpar()		
			local n = sheet;
			
			dialogs.confirmYesNo("Deseja realmente limpar o Tracker de Combate?",
				function(confirmado)
					if confirmado then
						n.atores = {};
						n.rodada = 1;
						n.relogio = 0;
					end;
				end);
		end;
		
		function self:exibirMenuDoAtor(node, form)
			if self == nil or self.popAtor == nil then return end;
			self.popAtor.node = node;
			self.popAtorForm = form;
			self.popAtor:show("mouseCenter", form);
		end;
		
		function self:scrollToAtor(node)
			self.rclAtores:scrollToNode(node);
		end;

		self.listenersAtivo = false;
		self.listenerHandleChatCommand = nil;
		self.listenerListChatCommands = nil;
			
		local function verificarEstadoMsgEvents()			
			local deveUsarListeners = self.visible and sheet ~= nil;
			local mesaAcoplada = rrpg.getMesaDe(sheet);
			
			if deveUsarListeners and not self.listenersAtivo and mesaAcoplada ~= nil then				
			
				-- ativar listeners
				self.listenersAtivo = true;
				
				self.listenerHandleChatCommand = rrpg.messaging.listen("HandleChatCommand", 
					function(msg)
						if (msg.comando == ">>") and (self:souMestre()) then
							self:proximoTurno();
							msg.response = {handled = true};
						end;					
					end, {mesa = mesaAcoplada});
					
				self.listenerListChatCommands = rrpg.messaging.listen("ListChatCommands", 
					function(msg)
						if self:souMestre() then
							msg.response = {{comando="/>>", descricao="Iniciar o próximo turno (Tracker de Combate)"}};
						end;						
					end, {mesa = mesaAcoplada});					
				
			elseif not deveUsarListeners and self.listenersAtivo then
				-- desativar listeners;				
				self.listenersAtivo = false;
				rrpg.messaging.unlisten(self.listenerHandleChatCommand);
				rrpg.messaging.unlisten(self.listenerListChatCommands);				
				self.listenerHandleChatCommand = nil;
				self.listenerListChatCommands = nil;				
			end
		end;		
			
		self.onScopeNodeChanged = verificarEstadoMsgEvents;							
		self.onShow = verificarEstadoMsgEvents;
		self.onHide = verificarEstadoMsgEvents;
		
		local function dropPersonagemActor(personagem)
			if personagem == nil then
				return;
			end;
		
			local atores = ndb.getChildNodes(getAtoresNDB());
			local atorDoPersonagem = nil;	
		    local chavePer = personagem.codigoInterno;

			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a.chavePer ~= nil and a.chavePer == chavePer then
					atorDoPersonagem = a;
					break;
				end;
			end;
			
			if atorDoPersonagem == nil then
				atorDoPersonagem = self:criarNovoAtor();
				atorDoPersonagem.chavePer = chavePer;				
			end;
			
			atorDoPersonagem.nome = personagem.nome;
			
			if personagem.loginDono ~= "" then			
				atorDoPersonagem.fof = 1;
			else
				atorDoPersonagem.fof = 2;
			end;
			
			return atorDoPersonagem;			
		end;
		
		local function dropJogadorActor(jogador)					
			local mesa = rrpg.getMesaDe(jogador);
			
			if mesa ~= nil then
				local chavePer = jogador.personagemPrincipal;
				local personagem = mesa:findBibliotecaItem(chavePer);
				
				if personagem ~= nil then
					return dropPersonagemActor(personagem);					
				end;							
			end;
		
			local atores = ndb.getChildNodes(getAtoresNDB());
			local atorDoJogador = nil;
			local loginJogador = string.lower(jogador.login);

			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a.login ~= nil and string.lower(a.login) == loginJogador then
					atorDoJogador = a;
					break;
				end;
			end;
			
			if atorDoJogador == nil then
				atorDoJogador = self:criarNovoAtor();
				atorDoJogador.login = loginJogador;				
			end;
			
			atorDoJogador.nome = jogador.nick;
			atorDoJogador.fof = 1;
			
			return atorDoJogador;
		end;
		
		function self.handleStartDrop(drop, x, y, drag)
			drop:addAction('characters',
				function(value)
					for i = 1, #value, 1 do
						dropPersonagemActor(value[i]);
					end
				end);		
		
			drop:addAction('character',
				function(value)
					dropPersonagemActor(value);
				end);		
		
			drop:addAction('players',
				function(value)
					for i = 1, #value, 1 do
						dropJogadorActor(value[i]);
					end
				end);		
		
			drop:addAction('player',
				function(value)
					dropJogadorActor(value);
				end);
		end;
		
		function self:createDraggerForAtor(ator)
			local tracker = self;
		
			return function(drag, x, y)
					  drag:addData('text', tostring(ator.nome));
					  local mesa = rrpg.getMesaDe(tracker);
					  
					  if mesa ~= nil then
						local jogador = mesa:findJogador(tostring(ator.login or ""));
						
						if jogador ~= nil then
							drag:addData('player', jogador);
						end;
						
						local personagem = mesa:findBibliotecaItem(tonumber(ator.chavePer) or -1);
						
						if personagem ~= nil then
							drag:addData('character', personagem);
						end;
					  end;					  
				   end;
		end;
	


    obj.layTopTracker = GUI.fromHandle(_obj_newObject("layout"));
    obj.layTopTracker:setParent(obj.frmCombatTracker);
    obj.layTopTracker:setName("layTopTracker");
    obj.layTopTracker:setAlign("top");
    obj.layTopTracker:setHeight(18);
    obj.layTopTracker:setMargins({left=2, right=2, top=2});

    obj.btnAddAtor = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAddAtor:setParent(obj.layTopTracker);
    obj.btnAddAtor:setName("btnAddAtor");
    obj.btnAddAtor:setText("");
    obj.btnAddAtor:setHint("Adicionar um novo ator ao Tracker");
    obj.btnAddAtor:setWidth(24);
    obj.btnAddAtor:setAlign("left");
    obj.btnAddAtor:setMargins({left=2, right=2});

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.btnAddAtor);
    obj.image2:setAlign("client");
    obj.image2:setSRC("/GerenciadorDeCampanha/images/addIcon.png");
    obj.image2:setName("image2");

    obj.btnRoll = GUI.fromHandle(_obj_newObject("button"));
    obj.btnRoll:setParent(obj.layTopTracker);
    obj.btnRoll:setName("btnRoll");
    obj.btnRoll:setText("R");
    obj.btnRoll:setAlign("left");
    obj.btnRoll:setHint("Faz os testes de iniciativa de todos.");
    obj.btnRoll:setWidth(24);
    obj.btnRoll:setMargins({left=2, right=2});

    obj.btnAddAll = GUI.fromHandle(_obj_newObject("button"));
    obj.btnAddAll:setParent(obj.layTopTracker);
    obj.btnAddAll:setName("btnAddAll");
    obj.btnAddAll:setText("T");
    obj.btnAddAll:setAlign("left");
    obj.btnAddAll:setHint("Adiciona todos com +Jogador a lista.");
    obj.btnAddAll:setWidth(24);
    obj.btnAddAll:setMargins({left=2, right=2});

    obj.btnLimpar = GUI.fromHandle(_obj_newObject("button"));
    obj.btnLimpar:setParent(obj.layTopTracker);
    obj.btnLimpar:setName("btnLimpar");
    obj.btnLimpar:setText("Limpar");
    obj.btnLimpar:setAlign("right");
    obj.btnLimpar:setWidth(60);
    obj.btnLimpar:setMargins({left=2, right=2});

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.frmCombatTracker);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(16);
    obj.layout63:setPadding({left=2, right=2});
    obj.layout63:setName("layout63");
    obj.layout63:setMargins({left=2, right=2});

    obj.layHeader0 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layHeader0:setParent(obj.layout63);
    obj.layHeader0:setName("layHeader0");
    obj.layHeader0:setWidth(23);
    obj.layHeader0:setAlign("left");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout63);
    obj.label110:setText(" Teste   Nome");
    obj.label110:setName("label110");
    obj.label110:setFontSize(11);
    obj.label110:setMargins({left=3});
    obj.label110:setWidth(28);
    obj.label110:setAlign("client");

    obj.layRightAlinedTitle = GUI.fromHandle(_obj_newObject("layout"));
    obj.layRightAlinedTitle:setParent(obj.layout63);
    obj.layRightAlinedTitle:setName("layRightAlinedTitle");
    obj.layRightAlinedTitle:setAlign("right");
    obj.layRightAlinedTitle:setWidth(78);

    obj.labTitIniciativa = GUI.fromHandle(_obj_newObject("label"));
    obj.labTitIniciativa:setParent(obj.layRightAlinedTitle);
    obj.labTitIniciativa:setName("labTitIniciativa");
    obj.labTitIniciativa:setText("Init");
    obj.labTitIniciativa:setHorzTextAlign("center");
    obj.labTitIniciativa:setFontSize(11);
    obj.labTitIniciativa:setMargins({left=3});
    obj.labTitIniciativa:setWidth(28);
    obj.labTitIniciativa:setAlign("left");

    obj.labTitFoF = GUI.fromHandle(_obj_newObject("label"));
    obj.labTitFoF:setParent(obj.layRightAlinedTitle);
    obj.labTitFoF:setName("labTitFoF");
    obj.labTitFoF:setText("A/H");
    obj.labTitFoF:setHorzTextAlign("center");
    obj.labTitFoF:setFontSize(11);
    obj.labTitFoF:setMargins({left=3});
    obj.labTitFoF:setWidth(25);
    obj.labTitFoF:setAlign("left");


		if system.isMobile() then
			self.layTopTracker.height = 32;
			self.btnAddAtor.width = self.layTopTracker.height;
			self.layHeader0.width = 32;
			self.layRightAlinedTitle.width = 108;
			self.layRightAlinedTitle.width = 108;
			self.labTitFoF.width = 32;
			self.labTitIniciativa.width = 32;
		end;
	


    obj.rclAtores = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtores:setParent(obj.frmCombatTracker);
    obj.rclAtores:setName("rclAtores");
    obj.rclAtores:setAlign("client");
    obj.rclAtores:setField("atores");
    obj.rclAtores:setTemplateForm("frmAtorCombatTracker");
    obj.rclAtores:setMargins({top=1});

    obj.layTrackerBottom = GUI.fromHandle(_obj_newObject("layout"));
    obj.layTrackerBottom:setParent(obj.frmCombatTracker);
    obj.layTrackerBottom:setName("layTrackerBottom");
    obj.layTrackerBottom:setAlign("bottom");
    obj.layTrackerBottom:setHeight(28);
    obj.layTrackerBottom:setMargins({top=2, left=2, bottom=2, right=2});

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layTrackerBottom);
    obj.button24:setText("Próx. turno");
    obj.button24:setFontSize(11);
    obj.button24:setWidth(70);
    obj.button24:setAlign("left");
    obj.button24:setName("button24");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layTrackerBottom);
    obj.layout64:setAlign("right");
    obj.layout64:setWidth(68);
    obj.layout64:setName("layout64");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout64);
    obj.label111:setAlign("left");
    obj.label111:setAutoSize(true);
    obj.label111:setText("Rodada");
    obj.label111:setWordWrap(false);
    obj.label111:setFontSize(11);
    obj.label111:setName("label111");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout64);
    obj.edit93:setField("rodada");
    obj.edit93:setAlign("client");
    obj.edit93:setType("number");
    obj.edit93:setMin(0);
    obj.edit93:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit93, "fontStyle",  "bold");
    obj.edit93:setName("edit93");


		if system.isMobile() then
			self.layTrackerBottom.height = 32;
		end;
		
		self.onStartDrop = self.handleStartDrop;
		self.rclAtores.onStartDrop = self.handleStartDrop;
	


    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Aventuras");
    obj.tab5:setName("tab5");

    obj.frmGerenciador03 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGerenciador03:setParent(obj.tab5);
    obj.frmGerenciador03:setName("frmGerenciador03");
    obj.frmGerenciador03:setAlign("client");
    obj.frmGerenciador03:setTheme("dark");
    obj.frmGerenciador03:setMargins({top=1});

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmGerenciador03);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.scrollBox5);
    obj.rectangle48:setLeft(0);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(830);
    obj.rectangle48:setHeight(20);
    obj.rectangle48:setColor("Black");
    obj.rectangle48:setName("rectangle48");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle48);
    obj.label112:setLeft(0);
    obj.label112:setTop(0);
    obj.label112:setWidth(830);
    obj.label112:setHeight(20);
    obj.label112:setText("LISTA DE AVENTURAS");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.rectangle48);
    obj.button25:setLeft(0);
    obj.button25:setTop(0);
    obj.button25:setWidth(20);
    obj.button25:setHeight(20);
    obj.button25:setText("+");
    obj.button25:setHint("Nova Aventura");
    obj.button25:setName("button25");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.scrollBox5);
    obj.scrollBox6:setLeft(0);
    obj.scrollBox6:setTop(20);
    obj.scrollBox6:setWidth(830);
    obj.scrollBox6:setHeight(590);
    obj.scrollBox6:setName("scrollBox6");

    obj.rclAventuras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAventuras:setParent(obj.scrollBox6);
    obj.rclAventuras:setLeft(0);
    obj.rclAventuras:setTop(0);
    obj.rclAventuras:setWidth(810);
    obj.rclAventuras:setHeight(600);
    obj.rclAventuras:setItemHeight(200);
    obj.rclAventuras:setAutoHeight(true);
    obj.rclAventuras:setMinQt(1);
    obj.rclAventuras:setName("rclAventuras");
    obj.rclAventuras:setField("aventuras");
    obj.rclAventuras:setTemplateForm("frmGerenciador03_AVENTURA");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.scrollBox5);
    obj.rectangle49:setLeft(835);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(310);
    obj.rectangle49:setHeight(615);
    obj.rectangle49:setColor("Black");
    obj.rectangle49:setName("rectangle49");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle49);
    obj.label113:setLeft(5);
    obj.label113:setTop(5);
    obj.label113:setWidth(310);
    obj.label113:setHeight(25);
    obj.label113:setText("SESSÕES");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle49);
    obj.label114:setLeft(5);
    obj.label114:setTop(30);
    obj.label114:setWidth(30);
    obj.label114:setHeight(25);
    obj.label114:setText("Nº");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.rectangle49);
    obj.label115:setLeft(35);
    obj.label115:setTop(30);
    obj.label115:setWidth(80);
    obj.label115:setHeight(25);
    obj.label115:setText("Data");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle49);
    obj.label116:setLeft(165);
    obj.label116:setTop(30);
    obj.label116:setWidth(100);
    obj.label116:setHeight(25);
    obj.label116:setText("Log");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.rectangle49);
    obj.button26:setLeft(265);
    obj.button26:setTop(5);
    obj.button26:setWidth(25);
    obj.button26:setHeight(25);
    obj.button26:setText("+");
    obj.button26:setHint("Novo");
    obj.button26:setName("button26");

    obj.rclSessoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSessoes:setParent(obj.rectangle49);
    obj.rclSessoes:setLeft(0);
    obj.rclSessoes:setTop(55);
    obj.rclSessoes:setWidth(310);
    obj.rclSessoes:setHeight(555);
    obj.rclSessoes:setItemHeight(35);
    obj.rclSessoes:setName("rclSessoes");
    obj.rclSessoes:setField("sessoes");
    obj.rclSessoes:setTemplateForm("frmGerenciador01_Sessao");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Anotaçoes");
    obj.tab6:setName("tab6");

    obj.frmFichaRPGmeister10_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister10_svg:setParent(obj.tab6);
    obj.frmFichaRPGmeister10_svg:setName("frmFichaRPGmeister10_svg");
    obj.frmFichaRPGmeister10_svg:setAlign("client");
    obj.frmFichaRPGmeister10_svg:setTheme("dark");
    obj.frmFichaRPGmeister10_svg:setMargins({top=1});

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmFichaRPGmeister10_svg);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.scrollBox7);
    obj.rectangle50:setLeft(0);
    obj.rectangle50:setTop(0);
    obj.rectangle50:setWidth(1210);
    obj.rectangle50:setHeight(20);
    obj.rectangle50:setColor("Black");
    obj.rectangle50:setName("rectangle50");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle50);
    obj.label117:setLeft(0);
    obj.label117:setTop(0);
    obj.label117:setWidth(1210);
    obj.label117:setHeight(20);
    obj.label117:setText("PAGINA EXCLUSIVA DO MESTRE");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.rectangle50);
    obj.button27:setLeft(0);
    obj.button27:setTop(0);
    obj.button27:setWidth(50);
    obj.button27:setHeight(20);
    obj.button27:setText("Exibir");
    obj.button27:setHint("Exibe as Anotações do Mestre.");
    obj.button27:setName("button27");

    obj.a1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.a1:setParent(obj.scrollBox7);
    obj.a1:setLeft(0);
    obj.a1:setTop(0);
    obj.a1:setWidth(400);
    obj.a1:setHeight(605);
    obj.a1:setName("a1");
    obj.a1:setVisible(false);

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.a1);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setName("rectangle51");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.a1);
    obj.label118:setLeft(0);
    obj.label118:setTop(0);
    obj.label118:setWidth(400);
    obj.label118:setHeight(20);
    obj.label118:setText("ANOTAÇÕES");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.a1);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(575);
    obj.textEditor2:setField("anotacoes1");
    obj.textEditor2:setName("textEditor2");

    obj.a2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.a2:setParent(obj.scrollBox7);
    obj.a2:setLeft(405);
    obj.a2:setTop(0);
    obj.a2:setWidth(400);
    obj.a2:setHeight(605);
    obj.a2:setName("a2");
    obj.a2:setVisible(false);

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.a2);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.a2);
    obj.label119:setLeft(0);
    obj.label119:setTop(0);
    obj.label119:setWidth(400);
    obj.label119:setHeight(20);
    obj.label119:setText("ANOTAÇÕES");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.a2);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(575);
    obj.textEditor3:setField("anotacoes2");
    obj.textEditor3:setName("textEditor3");

    obj.a3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.a3:setParent(obj.scrollBox7);
    obj.a3:setLeft(810);
    obj.a3:setTop(0);
    obj.a3:setWidth(400);
    obj.a3:setHeight(605);
    obj.a3:setName("a3");
    obj.a3:setVisible(false);

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.a3);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("black");
    obj.rectangle53:setName("rectangle53");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.a3);
    obj.label120:setLeft(0);
    obj.label120:setTop(0);
    obj.label120:setWidth(400);
    obj.label120:setHeight(20);
    obj.label120:setText("ANOTAÇÕES");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.a3);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(575);
    obj.textEditor4:setField("anotacoes3");
    obj.textEditor4:setName("textEditor4");


			local function secret()
				local mesa = rrpg.getMesaDe(sheet);
				
				if mesa.meuJogador.isMestre then
					self.a1.visible = true;
					self.a2.visible = true;
					self.a3.visible = true;
				else
					self.a1.visible = false;
					self.a2.visible = false;
					self.a3.visible = false;
				end;
			end;
		


    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Creditos");
    obj.tab7:setName("tab7");

    obj.frmFichaRPGmeister11_svg = GUI.fromHandle(_obj_newObject("form"));
    obj.frmFichaRPGmeister11_svg:setParent(obj.tab7);
    obj.frmFichaRPGmeister11_svg:setName("frmFichaRPGmeister11_svg");
    obj.frmFichaRPGmeister11_svg:setAlign("client");
    obj.frmFichaRPGmeister11_svg:setTheme("dark");
    obj.frmFichaRPGmeister11_svg:setMargins({top=1});

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmFichaRPGmeister11_svg);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox8);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(600);
    obj.image3:setHeight(600);
    obj.image3:setSRC("/GerenciadorDeCampanha/images/RPGmeister.jpg");
    obj.image3:setStyle("stretch");
    obj.image3:setOptimize(true);
    obj.image3:setName("image3");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.scrollBox8);
    obj.layout65:setLeft(620);
    obj.layout65:setTop(10);
    obj.layout65:setWidth(200);
    obj.layout65:setHeight(170);
    obj.layout65:setName("layout65");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout65);
    obj.rectangle54:setAlign("client");
    obj.rectangle54:setColor("black");
    obj.rectangle54:setXradius(15);
    obj.rectangle54:setYradius(15);
    obj.rectangle54:setCornerType("round");
    obj.rectangle54:setName("rectangle54");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout65);
    obj.label121:setLeft(0);
    obj.label121:setTop(10);
    obj.label121:setWidth(200);
    obj.label121:setHeight(20);
    obj.label121:setText("Programador: Vinny (Ambesek)");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout65);
    obj.label122:setLeft(0);
    obj.label122:setTop(35);
    obj.label122:setWidth(200);
    obj.label122:setHeight(20);
    obj.label122:setText("Arte: Nefer (Nefertyne)");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout65);
    obj.label123:setLeft(0);
    obj.label123:setTop(60);
    obj.label123:setWidth(200);
    obj.label123:setHeight(20);
    obj.label123:setText("Lista de NPCs: Mia");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout65);
    obj.label124:setLeft(0);
    obj.label124:setTop(85);
    obj.label124:setWidth(200);
    obj.label124:setHeight(20);
    obj.label124:setText("Iniciativas: Alysson");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout65);
    obj.label125:setLeft(0);
    obj.label125:setTop(120);
    obj.label125:setWidth(200);
    obj.label125:setHeight(20);
    obj.label125:setText("Ficha feita para a mesa: ");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout65);
    obj.label126:setLeft(0);
    obj.label126:setTop(145);
    obj.label126:setWidth(200);
    obj.label126:setHeight(20);
    obj.label126:setText("RPGmeister");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.scrollBox8);
    obj.label127:setLeft(630);
    obj.label127:setTop(400);
    obj.label127:setWidth(200);
    obj.label127:setHeight(20);
    obj.label127:setText("SUA VERSÃO:");
    obj.label127:setField("versionInstalled");
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.scrollBox8);
    obj.label128:setLeft(630);
    obj.label128:setTop(430);
    obj.label128:setWidth(200);
    obj.label128:setHeight(20);
    obj.label128:setText("VERSÃO ATUAL:");
    obj.label128:setField("versionDownloaded");
    obj.label128:setName("label128");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.scrollBox8);
    obj.button28:setLeft(620);
    obj.button28:setTop(475);
    obj.button28:setWidth(100);
    obj.button28:setText("Change Log");
    obj.button28:setName("button28");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.scrollBox8);
    obj.button29:setLeft(730);
    obj.button29:setTop(475);
    obj.button29:setWidth(100);
    obj.button29:setText("Atualizar");
    obj.button29:setName("button29");

    obj.button30 = GUI.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.scrollBox8);
    obj.button30:setLeft(840);
    obj.button30:setTop(475);
    obj.button30:setWidth(100);
    obj.button30:setText("Tutorial");
    obj.button30:setName("button30");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.scrollBox8);
    obj.label129:setLeft(620);
    obj.label129:setTop(525);
    obj.label129:setWidth(120);
    obj.label129:setHeight(20);
    obj.label129:setText("CONHEÇA A MESA:");
    obj.label129:setName("label129");

    obj.button31 = GUI.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.scrollBox8);
    obj.button31:setLeft(740);
    obj.button31:setTop(525);
    obj.button31:setWidth(100);
    obj.button31:setText("RPGmeister");
    obj.button31:setName("button31");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Gerenciador%20de%20Campanha/output/Gerenciador%20de%20Campanha.rpk?raw=true",
                        function(stream, contentType)
                            local info = rrpg.plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = rrpg.plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Gerenciador%20de%20Campanha/output/Gerenciador%20de%20Campanha.rpk?raw=true');
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
                        end);
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclXpAll:append();
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            local jogadores = ndb.getChildNodes(sheet.listaDeJogadores);
            					local xps = ndb.getChildNodes(sheet.rclXpAll);
            
            					for i=1, #jogadores, 1 do 
            						local jogador = jogadores[i];
            						self.boxDetalhesDoItem.node = jogador; 
            						self.boxDetalhesDoItem.visible = (jogador ~= nil);
            
            						local nep = jogador.nep
            						local xp = 0
            
            						for j=1, #xps, 1 do
            							if nep == xps[j].nep then
            								xp = xp + xps[j].xp;
            							end
            						end
            
            						if xp ~= 0 then
            							local node = self.rclExperience:append();
            							if node~= nil then 
            								node.contador = sheet.xpAll_session;
            								node.valor = xp;
            							end
            						end
            					end
            
            					sheet.rclXpAll = {}
            					self.xpAllPopup:close();
        end, obj);

    obj._e_event3 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclPoAll:append();
        end, obj);

    obj._e_event4 = obj.button4:addEventListener("onClick",
        function (_)
            local jogadores = ndb.getChildNodes(sheet.listaDeJogadores);
            					local pos = ndb.getChildNodes(sheet.rclPoAll);
            
            					for i=1, #jogadores, 1 do 
            						local jogador = jogadores[i];
            						self.boxDetalhesDoItem.node = jogador; 
            						self.boxDetalhesDoItem.visible = (jogador ~= nil);
            
            						local nep = jogador.nep
            						local po = 0
            
            						for j=1, #pos, 1 do
            							if nep == pos[j].nep then
            								po = po + pos[j].xp;
            							end
            						end
            
            						if po ~= 0 then
            							local node = self.rclDinheiro:append();
            							if node~= nil then 
            								node.contador = sheet.poAll_session;
            								node.valor = po;
            							end
            						end
            					end
            
            					sheet.rclPoAll = {}
            					self.poAllPopup:close();
        end, obj);

    obj._e_event5 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclPoSet:append();
        end, obj);

    obj._e_event6 = obj.button6:addEventListener("onClick",
        function (_)
            local jogadores = ndb.getChildNodes(sheet.listaDeJogadores);
            					local pos = ndb.getChildNodes(sheet.rclPoSet);
            
            					for i=1, #jogadores, 1 do 
            						local jogador = jogadores[i];
            						self.boxDetalhesDoItem.node = jogador; 
            						self.boxDetalhesDoItem.visible = (jogador ~= nil);
            
            						local nep = jogador.nep
            						local po = 0
            
            						for j=1, #pos, 1 do
            							if nep == pos[j].nep then
            								po = pos[j].xp;
            							end
            						end
            
            						local currentPO = tonumber(jogador.PO) or 0
            
            						if po ~= 0 and po > currentPO then
            							local node = self.rclDinheiro:append();
            							if node~= nil then 
            								node.contador = sheet.poSet_session;
            								node.valor = po-currentPO;
            							end
            						end
            					end
            
            					sheet.rclPoSet = {}
            					self.poSetTarget:close();
        end, obj);

    obj._e_event7 = obj.button7:addEventListener("onClick",
        function (_)
            local jogadores = ndb.getChildNodes(sheet.listaDeJogadores);
            
            					for i=1, #jogadores, 1 do 
            						local jogador = jogadores[i];
            						self.boxDetalhesDoItem.node = jogador; 
            						self.boxDetalhesDoItem.visible = (jogador ~= nil);
            
            						jogador.presenca = (tonumber(jogador.presenca) or 0) + (tonumber(sheet.presenca) or 0)
            						jogador.atrasoJustificado = (tonumber(jogador.atrasoJustificado) or 0) + (tonumber(sheet.atrasoJustificado) or 0)
            						jogador.atraso = (tonumber(jogador.atraso) or 0) + (tonumber(sheet.atraso) or 0)
            						jogador.faltaJustificada = (tonumber(jogador.faltaJustificada) or 0) + (tonumber(sheet.faltaJustificada) or 0)
            						jogador.falta = (tonumber(jogador.falta) or 0) + (tonumber(sheet.falta) or 0)
            						jogador.usos = (tonumber(jogador.usos) or 0) + (tonumber(sheet.usos) or 0)
            						jogador.desperdicio = (tonumber(jogador.desperdicio) or 0) + (tonumber(sheet.desperdicio) or 0)
            						jogador.nivel = (tonumber(jogador.nivel) or 0) + (tonumber(sheet.nivel) or 0)
            					end
            
            					sheet.presenca = 0
            					sheet.atrasoJustificado = 0
            					sheet.atraso = 0
            					sheet.faltaJustificada = 0
            					sheet.falta = 0
            					sheet.usos = 0
            					sheet.desperdicio = 0
            					sheet.nivel = 0
            
            					self.phAllPopup:close();
        end, obj);

    obj._e_event8 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclSelector:append();
        end, obj);

    obj._e_event9 = obj.button9:addEventListener("onClick",
        function (_)
            local jogadoresOnline = rrpg.getMesaDe(sheet).jogadores;
            						local jogadores = ndb.getChildNodes(sheet.listaDeJogadores);
            
            						for i=1, #jogadoresOnline, 1 do
            							local jogadorOnline = jogadoresOnline[i]
            							local found = false
            
            							if jogadorOnline.isJogador then
            								for j=1, #jogadores, 1 do
            									local jogador = jogadores[j]
            
            									if jogador.login == jogadorOnline.login then
            										found = true
            										jogador.avatar = jogadorOnline.avatar
            									end
            								end
            
            								if not found then
            									local item = self.rclSelector:append()
            
            									if item ~= nil then
            										self.boxDetalhesDoItem.node = item
            										self.boxDetalhesDoItem.visible = (item ~= nil);
            
            										item.login = jogadorOnline.login
            										item.avatar = jogadorOnline.avatar
            										item.personagem = Utils.removerFmtChat(jogadorOnline.nick)
            									end
            								end
            							end
            						end
        end, obj);

    obj._e_event10 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            							local jogadores = rrpg.getMesaDe(sheet).jogadores;
            							local current = nil;
            							for i = 1, #jogadores, 1 do
            								if jogadores[i].login==rrpg.getCurrentUser().login then
            									current = jogadores[i];
            								end;
            							end;
            							if not current.isMestre then return end;
            
            							local jogadores = ndb.getChildNodes(sheet.listaDeJogadores);
            
            							local jogadoresNome = "";
            							local mesa = rrpg.getMesaDe(sheet);
            							local usuarios = mesa.jogadores;
            
            							mesa:requestSetModerada(true);
            							for i=1, #jogadores, 1 do
            								jogadoresNome = jogadoresNome .. jogadores[i].login .. " ";
            							end;
            
            							for i=1, #usuarios, 1 do 
            								if string.find(jogadoresNome, usuarios[i].login)== nil then
            									if not usuarios[i].isMestre then
            										usuarios[i]:requestSetJogador(false);
            										usuarios[i]:requestSetVoz(false);
            									end
            								else
            									usuarios[i]:requestSetJogador(true);
            									usuarios[i]:requestSetVoz(true);
            								end;
            							end;
            						end;
        end, obj);

    obj._e_event11 = obj.button11:addEventListener("onClick",
        function (_)
            findPopup("xpAllPopup");
        end, obj);

    obj._e_event12 = obj.button12:addEventListener("onClick",
        function (_)
            findPopup("poAllPopup");
        end, obj);

    obj._e_event13 = obj.button13:addEventListener("onClick",
        function (_)
            findPopup("poSetTarget");
        end, obj);

    obj._e_event14 = obj.button14:addEventListener("onClick",
        function (_)
            findPopup("phAllPopup");
        end, obj);

    obj._e_event15 = obj.rclSelector:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            					return utils.compareStringPtBr(nodeA.login, nodeB.login);
        end, obj);

    obj._e_event16 = obj.rclSelector:addEventListener("onSelect",
        function (_)
            local node = self.rclSelector.selectedNode;
            						self.boxDetalhesDoItem.node = node; 
            						self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event17 = obj.rclSelector:addEventListener("onEndEnumeration",
        function (_)
            if self.rclSelector.selectedNode == nil and sheet ~= nil then
            				        local nodes = ndb.getChildNodes(sheet.listaDeJogadores);               
            
            				        if #nodes > 0 then
            				            self.rclSelector.selectedNode = nodes[1];
            				        end;
            				    end;
        end, obj);

    obj._e_event18 = obj.button15:addEventListener("onClick",
        function (_)
            -- Aumenta um contador enquanto adiciona um objeto
            							if self.boxDetalhesDoItem.node~=nil then
            								local objetos = ndb.getChildNodes(self.boxDetalhesDoItem.node.listaDeExperiencia);
            
            								local node = self.rclExperience:append();
            								if node~=nil then
            									local contador = 0;
            									for i=1, #objetos, 1 do
            										local aux = tonumber(objetos[i].contador) or 0;
            										if aux > contador then
            											contador = aux;
            										end;
            									end;
            									node.contador = contador + 1;
            								end;
            
            								self.rclExperience:sort();
            							end;
        end, obj);

    obj._e_event19 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(self.boxDetalhesDoItem.node.XP) or 0);
            							local mod2 = 0;
            							local mod3 = 0;
            							while mod>=mod2 do
            								mod3 = mod3+1;
            								mod2 = mod2 + mod3*1000;
            							end
            							
            							self.boxDetalhesDoItem.node.nep = mod3;
            							self.boxDetalhesDoItem.node.alvo = mod2;
        end, obj);

    obj._e_event20 = obj.rclExperience:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            					        if (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            					            return -1;
            					        elseif (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            					            return 1;
            					        else   
            					            return 0;
            					        end;
        end, obj);

    obj._e_event21 = obj.button16:addEventListener("onClick",
        function (_)
            -- Aumenta um contador enquanto adiciona um objeto
            							if self.boxDetalhesDoItem.node~=nil then
            								local objetos = ndb.getChildNodes(self.boxDetalhesDoItem.node.listaDeDinheiro);
            
            								local node = self.rclDinheiro:append();
            								if node~=nil then
            									local contador = 0;
            									for i=1, #objetos, 1 do
            										local aux = tonumber(objetos[i].contador) or 0;
            										if aux > contador then
            											contador = aux;
            										end;
            									end;
            									node.contador = contador + 1;
            								end;
            
            								self.rclDinheiro:sort();
            							end;
        end, obj);

    obj._e_event22 = obj.rclDinheiro:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            					        if (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            					            return -1;
            					        elseif (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            					            return 1;
            					        else   
            					            return 0;
            					        end;
        end, obj);

    obj._e_event23 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(self.boxDetalhesDoItem.node.presenca) or 0)*4 + 
            												(tonumber(self.boxDetalhesDoItem.node.atrasoJustificado) or 0)*2 + 
            												(tonumber(self.boxDetalhesDoItem.node.atraso) or 0)*1 +
            												(tonumber(self.boxDetalhesDoItem.node.nivel) or 0)*10 -   
            												(tonumber(self.boxDetalhesDoItem.node.falta) or 0)*10 -  
            												(tonumber(self.boxDetalhesDoItem.node.usos) or 0)*10 - 
            												(tonumber(self.boxDetalhesDoItem.node.desperdicio) or 0);
            								self.boxDetalhesDoItem.node.pontos = mod;								
            								self.boxDetalhesDoItem.node.ph = math.max(math.floor(mod/10), 0);
            
            								if mod > 40 then
            									self.boxDetalhesDoItem.node.desperdicio = (tonumber(self.boxDetalhesDoItem.node.desperdicio) or 0) + (mod - 40);
            								end;
        end, obj);

    obj._e_event24 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event25 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						local type = sheet.sobrentural;
            						if type == "Raro" then
            							sheet.sobrentural_chance = 1;
            						elseif type == "Incomum" then
            							sheet.sobrentural_chance = 3;
            						elseif type == "Comum" then
            							sheet.sobrentural_chance = 7;
            						elseif type == "Constante" then
            							sheet.sobrentural_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.sobrentural_chance = 0;
            						end;
        end, obj);

    obj._e_event26 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.auroras;
            						if type == "Raro" then
            							sheet.auroras_chance = 1;
            						elseif type == "Incomum" then
            							sheet.auroras_chance = 3;
            						elseif type == "Comum" then
            							sheet.auroras_chance = 7;
            						elseif type == "Constante" then
            							sheet.auroras_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.auroras_chance = 0;
            						end;
        end, obj);

    obj._e_event27 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.cometas;
            						if type == "Raro" then
            							sheet.cometas_chance = 1;
            						elseif type == "Incomum" then
            							sheet.cometas_chance = 3;
            						elseif type == "Comum" then
            							sheet.cometas_chance = 7;
            						elseif type == "Constante" then
            							sheet.cometas_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.cometas_chance = 0;
            						end;
        end, obj);

    obj._e_event28 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.cadentes;
            						if type == "Raro" then
            							sheet.cadentes_chance = 1;
            						elseif type == "Incomum" then
            							sheet.cadentes_chance = 3;
            						elseif type == "Comum" then
            							sheet.cadentes_chance = 7;
            						elseif type == "Constante" then
            							sheet.cadentes_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.cadentes_chance = 0;
            						end;
        end, obj);

    obj._e_event29 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.lunar;
            						if type == "Raro" then
            							sheet.lunar_chance = 1;
            						elseif type == "Incomum" then
            							sheet.lunar_chance = 3;
            						elseif type == "Comum" then
            							sheet.lunar_chance = 7;
            						elseif type == "Constante" then
            							sheet.lunar_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.lunar_chance = 0;
            						end;
        end, obj);

    obj._e_event30 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.solar;
            						if type == "Raro" then
            							sheet.solar_chance = 1;
            						elseif type == "Incomum" then
            							sheet.solar_chance = 3;
            						elseif type == "Comum" then
            							sheet.solar_chance = 7;
            						elseif type == "Constante" then
            							sheet.solar_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.solar_chance = 0;
            						end;
        end, obj);

    obj._e_event31 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.meteoros;
            						if type == "Raro" then
            							sheet.meteoros_chance = 1;
            						elseif type == "Incomum" then
            							sheet.meteoros_chance = 3;
            						elseif type == "Comum" then
            							sheet.meteoros_chance = 7;
            						elseif type == "Constante" then
            							sheet.meteoros_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.meteoros_chance = 0;
            						end;
        end, obj);

    obj._e_event32 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						
            						local type = sheet.terremotos;
            						if type == "Raro" then
            							sheet.terremotos_chance = 1;
            						elseif type == "Incomum" then
            							sheet.terremotos_chance = 3;
            						elseif type == "Comum" then
            							sheet.terremotos_chance = 7;
            						elseif type == "Constante" then
            							sheet.terremotos_chance = 14;
            						elseif type == "Nenhum" then
            							sheet.terremotos_chance = 0;
            						end;
        end, obj);

    obj._e_event33 = obj.button17:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            								local meses = ndb.getChildNodes(sheet.listaMeses);
            								local num = #meses + 1;
            
            								local node = self.rclMeses:append();
            								if node~=nil then
            									node.ordem = num;
            									node.mes = "Mês " .. num;
            									node.dias = 30;
            								end;
            
            								self.rclMeses:sort();
            							end;
        end, obj);

    obj._e_event34 = obj.rclMeses:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event35 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            							if sheet.dias ~= sheet.duracaoEstacao then
            								self.dias.fontColor = "red";
            							else
            								self.dias.fontColor = "white";
            							end;
            						end;
        end, obj);

    obj._e_event36 = obj.button18:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            								local semana = ndb.getChildNodes(sheet.listaSemana);
            								local num = #semana + 1;
            
            								local node = self.rclSemana:append();
            								if node~=nil then
            									node.ordem = num;
            									node.dia = "Dia " .. num;
            								end;
            
            								self.rclSemana:sort();
            							end;
        end, obj);

    obj._e_event37 = obj.rclSemana:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                        return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                        return 1;
            		                else   
            		                        return 0;
            		                end;
        end, obj);

    obj._e_event38 = obj.button19:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            								local node = self.rclLuas:append();
            								if node~=nil then
            									node.luas = "Lua";
            									node.ciclo = 28;
            									node.desvio = 0;
            								end;
            
            								self.rclLuas:sort();
            							end;
        end, obj);

    obj._e_event39 = obj.celestialBt:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popCelestial");
            							
            							if pop ~= nil then
            								pop:setNodeObject(self.sheet);
            								pop:showPopupEx("bottomCenter", self.celestialBt);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup de eventos celestiais para exibir");
            							end;
        end, obj);

    obj._e_event40 = obj.button20:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            								local estacao = ndb.getChildNodes(sheet.listaEstacoes);
            								local num = #estacao + 1;
            
            								local node = self.rclEstacoes:append();
            								if node~=nil then
            									node.ordem = num;
            									node.estacao = "Estação " .. num;
            									node.dias = 90;
            								end;
            
            								self.rclEstacoes:sort();
            							end;
        end, obj);

    obj._e_event41 = obj.rclEstacoes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event42 = obj.button21:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            							local tempo = tonumber(sheet.tempo) or 1;
            							local add = tonumber(sheet.add) or 1;
            
            							tempo = tempo + add;
            							local tempoRestante = tempo;
            
            							local anoDuracao = tonumber(sheet.dias) or 1;
            							local ano = math.floor((tempo-1) / anoDuracao) + 1;
            							tempoRestante = tempoRestante - ((ano-1) * anoDuracao);
            
            							local meses = ndb.getChildNodes(sheet.listaMeses);
            							local mes = #meses;
            							local mesDuracao = 1;
            							local search = true;
            							local aux = 0;
            							for i=1, #meses, 1 do
            								if tempoRestante <= meses[i].cumulativo and search then
            									search = false;
            									mes = i-1;
            									if i > 1 then
            										aux = meses[i-1].cumulativo;
            									end;
            									tempoRestante = tempoRestante - aux;
            								end;
            							end;
            							if mes == #meses then
            								aux = meses[#meses].cumulativo; 
            								tempoRestante = tempoRestante - aux;
            							end;
            
            							sheet.tempo = tempo;
            							sheet.dia = tempoRestante;
            							sheet.mes = mes;
            							sheet.ano = ano;
            						end;
        end, obj);

    obj._e_event43 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            							-- Reading sheet
            
            							local seed;
            							if sheet.seed == nil then
            								seed = math.random(1, 99999);
            								sheet.seed = seed;
            							else
            								seed = tonumber(sheet.seed) or 0;
            							end;
            
            							local dia = tonumber(sheet.dia) or 1;
            							local mes = tonumber(sheet.mes) or 1;
            							local ano = tonumber(sheet.ano) or 1;
            
            							local anoDuracao = tonumber(sheet.dias) or 1;
            							local duracaoEstacao = tonumber(sheet.duracaoEstacao) or 1;
            
            							local desvioSemana = tonumber(sheet.desvioSemana) or 0;
            							local desvioEstacao = tonumber(sheet.desvioEstacao) or 0;
            
            							local meses = ndb.getChildNodes(sheet.listaMeses);
            							local semana = ndb.getChildNodes(sheet.listaSemana); 
            							local estacoes = ndb.getChildNodes(sheet.listaEstacoes); 
            							local luas = ndb.getChildNodes(sheet.listaLuas); 
            
            							-- processing date
            
            							if meses[mes] == nil or #semana < 1 or #estacoes < 1 then
            								return;
            							end;
            							
            							local nomeMes = "not found";
            							for i=1, #meses, 1 do
            								if meses[i].ordem == mes then
            									nomeMes = meses[i].mes;
            								end;
            							end;
            
            							local diaDoAno = dia + meses[mes].cumulativo;
            							local tempo = diaDoAno + (ano-1) * anoDuracao;
            
            							local diaDaSemana = (tempo + desvioSemana) % #semana;
            							if diaDaSemana == 0 then
            								diaDaSemana = #semana;
            							end;
            							local nomeDiaDaSemana = "not found";
            							for i=1, #semana, 1 do
            								if semana[i].ordem == diaDaSemana then
            									nomeDiaDaSemana = semana[i].dia;
            								end;
            							end;
            
            							-- defining season
            							local estacao = 0;
            							local diaDaEstacao = (tempo - desvioEstacao) % duracaoEstacao;
            							if diaDaEstacao == 0 then
            								diaDaEstacao = duracaoEstacao;
            							end;
            							local estacaoPos = 0;
            							for i=1, #estacoes, 1 do
            								if diaDaEstacao > estacoes[i].cumulativo then
            									estacao = i;
            									estacaoPos = diaDaEstacao - estacoes[i].cumulativo;
            								end
            							end;
            							local estacaoNome = estacoes[estacao].estacao;
            
            							local estacaoEpoca = "fim";
            							local porcEstacao = estacaoPos / (tonumber(estacoes[estacao].dias) or 1);
            							if porcEstacao < 0.33 then
            								estacaoEpoca = "começo";
            							elseif porcEstacao < 0.67 then
            								estacaoEpoca = "meio";
            							end;
            
            							-- defining temperatures
            							math.randomseed(tempo + seed);
            
            							local mimTemp = 0;
            							local maxTemp = 0;
            
            							 -- The average temperature
            							local temperatures = {tonumber(estacoes[estacao].temperatura_1) or 0,tonumber(estacoes[estacao].temperatura_2) or 0,tonumber(estacoes[estacao].temperatura_3) or 0,tonumber(estacoes[estacao].temperatura_4) or 0,tonumber(estacoes[estacao].temperatura_5) or 0};
            
            							 -- The temperature variance
            							local temperaturesVar = {tonumber(estacoes[estacao].temperaturaVar_1) or 1,tonumber(estacoes[estacao].temperaturaVar_2) or 1,tonumber(estacoes[estacao].temperaturaVar_3) or 1,tonumber(estacoes[estacao].temperaturaVar_4) or 1,tonumber(estacoes[estacao].temperaturaVar_5) or 1};
            
            							-- The temperature chance
            							local temperaturesChances = {tonumber(estacoes[estacao].temperaturaChance_1) or 0,tonumber(estacoes[estacao].temperaturaChance_2) or 0,tonumber(estacoes[estacao].temperaturaChance_3) or 0,tonumber(estacoes[estacao].temperaturaChance_4) or 0,tonumber(estacoes[estacao].temperaturaChance_5) or 0};
            							for i=2, 5, 1 do 
            								temperaturesChances[i] = temperaturesChances[i-1] + temperaturesChances[i];
            							end;
            
            							local MinMaxTemps = {tonumber(estacoes[estacao].temperaturaMM_1) or 1,tonumber(estacoes[estacao].temperaturaMM_2) or 1,tonumber(estacoes[estacao].temperaturaMM_3) or 1,tonumber(estacoes[estacao].temperaturaMM_4) or 1,tonumber(estacoes[estacao].temperaturaMM_5) or 1};
            							local selected = 5;
            
            							-- Define temperature range to be used
            							local sensacao = "";
            							local dice1 = math.random(1, 100);
            							if dice1 <= temperaturesChances[1] then
            								selected = 1;
            								sensacao = "muito mais frio que o normal"
            							elseif dice1 <= temperaturesChances[2] then
            								selected = 2;
            								sensacao = "mais frio que o normal"
            							elseif dice1 <= temperaturesChances[3] then
            								selected = 3;
            								sensacao = "com a temperatura padrão"
            							elseif dice1 <= temperaturesChances[4] then
            								selected = 4;
            								sensacao = "mais quente que o normal"
            							else
            								selected = 5;
            								sensacao = "muito mais quente que o normal"
            							end;
            
            							local dice2 = math.random(1, temperaturesVar[selected]);
            							local baseTemp = temperatures[selected] + dice2;
            
            							-- Definine min and max temperature of the day
            							local dice3 = math.random(1, 100);
            							if dice3 <= temperaturesChances[1] then
            								selected = 1;
            							elseif dice3 <= temperaturesChances[2] then
            								selected = 2;
            							elseif dice3 <= temperaturesChances[3] then
            								selected = 3;
            							elseif dice3 <= temperaturesChances[4] then
            								selected = 4;
            							else
            								selected = 5;
            							end;
            
            							minTemp = 0 - MinMaxTemps[selected];
            							maxTemp = 0 + MinMaxTemps[selected];
            
            							-- defining rain
            							local intensidade;
            							local nevoa = false;
            
            							-- Define rain intensity chance
            							local intensidadeChance = {tonumber(estacoes[estacao].chuvaChance_1) or 0,tonumber(estacoes[estacao].chuvaChance_2) or 0,tonumber(estacoes[estacao].chuvaChance_3) or 0,tonumber(estacoes[estacao].chuvaChance_4) or 0,tonumber(estacoes[estacao].chuvaChance_5) or 0,tonumber(estacoes[estacao].chuvaChance_6) or 0};
            							for i=2, 6, 1 do 
            								intensidadeChance[i] = intensidadeChance[i-1] + intensidadeChance[i];
            							end;
            
            							local dice4 = math.random(1, 100);
            							local dice5;
            							if dice4 <= intensidadeChance[1] then
            								intensidade = 1;
            								dice5 = 0;
            							elseif dice4 <= intensidadeChance[2] then
            								intensidade = 2;
            								dice5 = math.random(1, 10);
            							elseif dice4 <= intensidadeChance[3] then
            								intensidade = 3;
            								dice5 = 0 - math.random(1, 3);
            							elseif dice4 <= intensidadeChance[4] then
            								intensidade = 4;
            								dice5 = 0 - math.random(1, 6);
            							elseif dice4 <= intensidadeChance[5] then
            								intensidade = 5;
            								dice5 = 0 - math.random(1, 8);
            							else
            								intensidade = 6;
            								dice5 = 0 - math.random(1, 10);
            							end;
            							baseTemp = baseTemp + dice5;
            
            							local dice6 = math.random(1, 100);
            							if dice6 > intensidadeChance[3] and dice6 <= intensidadeChance[4] then
            								nevoa = true;
            							end;
            
            							-- defining wind
            
            							-- define each wind intensity chance
            							local ventosChance = {tonumber(estacoes[estacao].ventosChance_1) or 0,tonumber(estacoes[estacao].ventosChance_2) or 0,tonumber(estacoes[estacao].ventosChance_3) or 0,tonumber(estacoes[estacao].ventosChance_4) or 0,tonumber(estacoes[estacao].ventosChance_5) or 0,tonumber(estacoes[estacao].ventosChance_6) or 0,tonumber(estacoes[estacao].ventosChance_7) or 0,tonumber(estacoes[estacao].ventosChance_8) or 0};
            							for i=2, 8, 1 do 
            								ventosChance[i] = ventosChance[i-1] + ventosChance[i];
            							end;
            
            							local ventos = 0;
            							local ventosVelocidade;
            
            							local dice7 = math.random(1, 100);
            
            							if dice7 <= ventosChance[1] then
            								ventos = 1;
            								ventosVelocidade = 0;
            								baseTemp = baseTemp + math.random(1, 10);
            							elseif dice7 <= ventosChance[2] then
            								ventos = 2;
            								ventosVelocidade = math.random(1, 16) - 1;
            								if ventosVelocidade == 0 then
            									ventos = 1;
            									baseTemp = baseTemp + math.random(1, 10);
            								end
            							elseif dice7 <= ventosChance[3] then
            								ventos = 3;
            								ventosVelocidade = math.random(1, 15) + 15;
            								baseTemp = baseTemp - math.random(1, 2);
            							elseif dice7 <= ventosChance[4] then
            								ventos = 4;
            								ventosVelocidade = math.random(1, 15) + 30;
            								baseTemp = baseTemp - math.random(1, 3);
            							elseif dice7 <= ventosChance[5] then
            								ventos = 5;
            								ventosVelocidade = math.random(1, 35) + 45;
            								baseTemp = baseTemp - math.random(1, 4);
            							elseif dice7 <= ventosChance[6] then
            								ventos = 6;
            								ventosVelocidade = math.random(1, 40) + 80;
            								baseTemp = baseTemp - math.random(1, 5);
            							elseif dice7 <= ventosChance[7] then
            								ventos = 7;
            								ventosVelocidade = math.random(1, 160) + 120;
            								baseTemp = baseTemp - math.random(1, 6);
            							else
            								ventos = 8;
            								ventosVelocidade = math.random(1, 200) + 280;
            								baseTemp = baseTemp - math.random(1, 8);
            							end;
            
            							-- Defining sandstorm
            
            							local areia = false;
            							local areiaMin = (tonumber(estacoes[estacao].areiaMin) or 9)
            							if intensidade == 1 and ventos >= estacoes[estacao].areiaMin then
            								areia = true;
            							end;
            
            							-- defining moons
            
            							local luasInfo = "";
            							local luasLabel = "";
            							if #luas > 1 then
            								luasInfo = "No céu as luas ";
            								luasLabel = "Luas: ";
            							elseif #luas > 0 then
            								luasInfo = "No céu a lua ";
            								luasLabel = "Lua: ";
            							end;
            							for i=1, #luas, 1 do
            								local ciclo = tonumber(luas[i].ciclo) or 1;
            								local desvio = tonumber(luas[i].desvio) or 0;
            
            								-- define day in the moon cicle
            								local diaCiclo = (tempo+desvio) % ciclo;
            								if diaCiclo == 0 then
            									diaCiclo = ciclo;
            								end;
            
            								local porcentagemCiclo = diaCiclo / ciclo;
            
            								if luas[i].luas == nil then
            									luas[i].luas = "Lua";
            								end;
            
            								-- define percentage of each phase
            								local phases = {0.125,0.25,0.375,0.5,0.625,0.75,0.875,1};
            								local durations = {luas[i].lua_cheia_duration,luas[i].lua_minguante_convexo_duration,luas[i].lua_quarto_minguante_duration,luas[i].lua_minguante_concavo_duration,luas[i].lua_lua_nova_duration,luas[i].lua_crescente_concavo_duration,luas[i].lua_quarto_crescente_duration,luas[i].lua_crescente_convexo_duration};
            								local pos = 0;
            								for j=1, 8, 1 do
            									pos = pos + (tonumber(durations[j]) or math.floor(ciclo/8));
            									phases[j] = (pos / ciclo);
            								end;
            
            								if porcentagemCiclo <= phases[1] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_cheia or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_cheia or "") .. ")";
            								elseif porcentagemCiclo <= phases[2] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_minguante_convexo or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_minguante_convexo or "") .. ")";
            								elseif porcentagemCiclo <= phases[3] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_quarto_minguante or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_quarto_minguante or "") .. ")";
            								elseif porcentagemCiclo <= phases[4] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_minguante_concavo or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_minguante_concavo or "") .. ")";
            								elseif porcentagemCiclo <= phases[5] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_lua_nova or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_lua_nova or "") .. ")";
            								elseif porcentagemCiclo <= phases[6] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_crescente_concavo or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_crescente_concavo or "") .. ")";
            								elseif porcentagemCiclo <= phases[7] then
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_quarto_crescente or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_quarto_crescente or "") .. ")";
            								else
            									luasInfo = luasInfo .. luas[i].luas .. " em " .. (luas[i].lua_crescente_convexo or "");
            									luasLabel = luasLabel .. luas[i].luas .. " (" .. (luas[i].lua_crescente_convexo or "") .. ")";
            								end;
            
            								if i < #luas then
            									luasInfo = luasInfo .. ", ";
            									luasLabel = luasLabel .. ", ";
            								else
            									luasInfo = luasInfo .. ". ";
            									luasLabel = luasLabel .. ". ";
            								end;
            							end;
            							sheet.luasLabel = luasLabel;
            
            							-- defining celestial events
            
            							local eventChance = {};
            							eventChance[0] = 0;
            							local events = {sheet.sobrentural_chance, sheet.auroras_chance, sheet.cometas_chance, sheet.cadentes_chance, sheet.lunar_chance, sheet.solar_chance, sheet.meteoros_chance, sheet.terremotos_chance};
            
            							for i = 1, 8, 1 do 
            								eventChance[i] = eventChance[i-1] + (tonumber(events[i]) or 0);
            							end;
            							
            							local dice8 = math.random(1, 100);
            							local event = 0;
            							local subEvent = math.random(1, 10);
            							if dice8 <= eventChance[1] then
            								event = 1;
            							elseif dice8 <= eventChance[2] then
            								event = 2;
            							elseif dice8 <= eventChance[3] then
            								event = 3;
            							elseif dice8 <= eventChance[4] then
            								event = 4;
            							elseif dice8 <= eventChance[5] then
            								event = 5;
            								if #luas <1 then
            									event = 0;
            								end;
            							elseif dice8 <= eventChance[6] then
            								event = 6;
            							elseif dice8 <= eventChance[7] then
            								event = 7;
            							elseif dice8 <= eventChance[8] then
            								event = 8;
            							end;
            
            							-- finalizing
            							minTemp = minTemp + baseTemp;
            							maxTemp = maxTemp + baseTemp;
            
            							-- saving variables
            							sheet.tempo = tempo;
            							-- sheet.era = tempo;
            
            							-- Cleaning hints
            
            							self.temperaturaLabel.hint="A temperatura atinge seu ponto mais baixo de meia noite e mais alto de meio dia. ";
            							self.precipitacaoLabel.hint="";
            							self.ventoLabel.hint="";
            							self.eventosLabel.hint="";
            
            							-- defining message
            							local data = dia .. " de " .. nomeMes .. " de " .. ano .. "; " .. nomeDiaDaSemana .. ". Era o " .. estacaoEpoca .. " do " .. estacaoNome .. ". Estava " .. sensacao .. " pra época, variando entre " .. minTemp .. "º C e " .. maxTemp .. "º C entre a noite e o dia. ";
            							sheet.dataLabel = dia .. " de " .. nomeMes .. " de " .. ano .. "; " .. nomeDiaDaSemana;
            							sheet.estacaoLabel = estacaoNome .. " (" .. estacaoEpoca .. ")";
            							sheet.temperaturaLabel = "Temperatura: " .. minTemp .. "º C ~ " .. maxTemp .. "º C";
            
            							if minTemp < 5 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Muito Frio: CD15 + 1/teste a cada hora contra 1d6 dano.";
            							elseif minTemp < -15 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Frio Severo: CD15 + 1/teste a cada 10 minutos contra 1d6 dano. Personagem fica fatigado enquanto não recuperar esse dano. ";
            							elseif minTemp < -30 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Frio Extremo: CD15 + 1/teste a cada minuto contra 1d4 dano. Criaturas vestindo armaduras de metal são afetadas por esfriar metais. Personagem fica fatigado enquanto não recuperar esse dano. ";
            							elseif maxTemp > 32 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Muito Quente: CD15 + 1/teste a cada hora contra 1d4 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. ";
            							elseif maxTemp > 43 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Calor Severo: CD15 + 1/teste a cada 10 minutos contra 1d4 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. Personagem fica fatigado enquanto não recuperar esse dano. ";
            							elseif maxTemp > 60 then
            								self.temperaturaLabel.hint = self.temperaturaLabel.hint .. "\n Calor Severo: CD15 + 1/teste a cada minuto contra 1d6 dano. Penalidade de -4 se tiver usando armaduras ou roupas pesadas. riaturas vestindo armaduras de metal são afetadas por esquentar metais. Personagem fica fatigado enquanto não recuperar esse dano. ";
            							end;
            
            							if intensidade > 1 then
            								local precipitacao;
            								local labels;
            								local penalidades;
            								if baseTemp < 0 then
            									precipitacao = {"", "O dia estava nublado. ", "Pequenos flocos de neve caiam lentamente e durante todo o dia. ", "Nevava ao longo do dia, com pequenas e raras pausas. ", "Uma forte nevasca atingia a região cobrindo tudo com neve. ", "Estava caindo uma tempestade de granizo. Grandes pedras de gelo atingiam o chão. "};
            									labels = {"", "Nublado.", "Neve leve.", "Neve.", "Nevasca.", "Granizo."};
            									penalidades = {"", "", "", "Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir, -4 Ataques a distancia. Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. Deslocamento na neve custa 2 quadrados. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. . Deslocamento na neve custa 4 quadrados. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Pedras de gelo que causam 1d8 de dano por minuto caem em todos na região. Deslocamento na neve custa 4 quadrados. "};
            								else
            									precipitacao = {"", "O dia estava nublado. ", "Chuviscava, deixando tudo coberto por uma fina camada de água. ", "Chuvia ao longo do dia, com pequenas e raras pausas. ", "Um temporal atingia a região. ", "Uma forte tempestade atingia a região. Raios e trovões eram ouvidos ao longe. "};
            									labels = {"", "Nublado.", "Chuviscando.", "Chuva.", "Temporal.", "Tempestade."};
            									penalidades = {"", "", "", "Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir, -4 Ataques a distancia. Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. ", "Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir, Impossivel atacar a distancia. Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Raios que causam (1d10)d8 de dano caem aleatoriamente. "};
            								end;
            								data = data .. precipitacao[intensidade];
            								sheet.precipitacaoLabel = "Precipitação: " .. labels[intensidade];
            								self.precipitacaoLabel.hint = penalidades[intensidade];
            							else
            								sheet.precipitacaoLabel = "Precipitação: Nenhuma."
            							end;
            							if nevoa and baseTemp < 20 then
            								data = data .. "Uma forte neblina se espalhava, cobrindo tudo. ";
            								sheet.precipitacaoLabel = sheet.precipitacaoLabel .. " Névoa.";
            								self.precipitacaoLabel.hint = self.precipitacaoLabel.hint .. "\n Neblina obscurece visão além de 1,5m dando camuflagem (20%) a alvos distantes. ";
            							end;
            							if areia then
            								if ventos == 1 then
            									data = data .. "Não ventava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Sem vento."
            								elseif ventos == 2 then
            									data = data .. "Uma leve Brisa de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Brisa (" .. ventosVelocidade .. "Km/h)."
            								elseif ventos == 3 then
            									data = data .. "Um vento Moderado de " .. ventosVelocidade .. "Km/h levantava a areia, criando uma nuvem de poeira. ";
            									sheet.ventoLabel = "Ventos: Moderado (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="50% de chance de apagar chamas desprotegidas. Visibilidade reduzida pela metade, -4 em Observar.";
            								elseif ventos == 4 then
            									data = data .. "Um vento Forte de " .. ventosVelocidade .. "Km/h levantava a areia, criando uma nuvem de poeira. ";
            									sheet.ventoLabel = "Ventos: Forte (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga chamas desprotegidas. Visibilidade reduzida pela metade, -4 em Observar, -2 Ouvir e -2 ataques a distancia.";
            								elseif ventos == 5 then
            									data = data .. "Um vento Severo de " .. ventosVelocidade .. "Km/h levantava a areia criando uma tempestade de areia que cobria tudo. ";
            									sheet.ventoLabel = "Ventos: Severo (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas. Visibilidade reduzida pela metade, -4 em Observar, -4 Ouvir e -4 ataques a distancia.";
            								elseif ventos == 6 then
            									data = data .. "Uma Ventania de " .. ventosVelocidade .. "Km/h cria uma perigosa tempestade de areia. ";
            									sheet.ventoLabel = "Ventos: Ventania (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas. Visibilidade reduzida pela metade, -8 em Observar, -8 Ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. ";
            								elseif ventos == 7 then
            									data = data .. "Um Furação de " .. ventosVelocidade .. "Km/h  se forma, a areia da região segue os fortes ventos criando uma terrivel tempestade de areia. ";
            									sheet.ventoLabel = "Ventos: Furacão (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga todas chamas. Visibilidade reduzida pela metade, -8 em Observar, impossivel ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. Impossivel respirar sem proteção facial e 10xcon rodadas com proteção. ";
            								else
            									data = data .. "Um Tornado de " .. ventosVelocidade .. "Km/h  se forma, a areia da região segue os fortes ventos criando uma terrivel tempestade de areia. ";
            									sheet.ventoLabel = "Ventos: Tornado (" .. ventosVelocidade .. "Km/h) com areia.";
            									self.ventoLabel.hint="Apaga todas chamas. Visibilidade reduzida pela metade, -8 em Observar, impossivel ouvir e impossivel fazer ataques a distancia. 1d3 de dano contusivo por rodada. Impossivel respirar sem proteção facial e 10xcon rodadas com proteção. Fortitude CD30, para evitar ser arrastado por 1d10 rodadas. Tomando 6d6 dano por rodada e depois dano por queda. ";
            								end;
            							else
            								if ventos == 1 then
            									data = data .. "Não ventava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Sem vento.";
            								elseif ventos == 2 then
            									data = data .. "Uma leve Brisa de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Brisa (" .. ventosVelocidade .. "Km/h).";
            								elseif ventos == 3 then
            									data = data .. "Uma vento Moderado " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Moderado (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="50% de chance de apagar chamas desprotegidas. ";
            								elseif ventos == 4 then
            									data = data .. "Uma vento Forte de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Forte (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="Apaga chamas desprotegidas, -2 Ouvir e -2 ataques a distancia.";
            								elseif ventos == 5 then
            									data = data .. "Uma vento Severo de " .. ventosVelocidade .. "Km/h soprava naquele dia. ";
            									sheet.ventoLabel = "Ventos: Severo (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="Apaga chamas desprotegidas e 50% de chance de apagar chamas protegidas, -4 Ouvir e -4 ataques a distancia.";
            								elseif ventos == 6 then
            									data = data .. "Uma Ventania de " .. ventosVelocidade .. "Km/h se formava e arrastava consigo tudo que podia. ";
            									sheet.ventoLabel = "Ventos: Ventania (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="Apaga chamas desprotegidas e 75% de chance de apagar chamas protegidas, -8 Ouvir e impossivel fazer ataques a distancia.";
            								elseif ventos == 7 then
            									data = data .. "Um Furacão se formava com ventos de " .. ventosVelocidade .. "Km/h destruindo por onde passava. ";
            									sheet.ventoLabel = "Ventos: Furacão (" .. ventosVelocidade .. "Km/h).";
            									self.ventoLabel.hint="Apaga todas chamas. Impossivel ouvir e impossivel fazer ataques a distancia. ";
            								else
            									data = data .. "Um Tornado se formava com ventos de " .. ventosVelocidade .. "Km/h destruindo por onde passava. ";
            									sheet.ventoLabel = "Ventos: Tornado (" .. ventosVelocidade .. "Km/h)."
            									self.ventoLabel.hint="Apaga todas chamas. Impossivel ouvir e impossivel fazer ataques a distancia. Fortitude CD30, para evitar ser arrastado por 1d10 rodadas. Tomando 6d6 dano por rodada e depois dano por queda. ";
            								end;
            							end;
            
            							data = data .. luasInfo;
            
            							if event > 0 then
            								if event == 1 then
            									local subEvent = math.random(1, 36);
            									
            									local sobrenatural = {"Toda vez que o vento soprava naquele dia era possivel ouvir estranhos sons trazidos de longe. Não se podia ver a origem daqueles sons nas proximidades. ", "Toda vez que o vento soprava naquele dia todos se sentiam como se ficassem leves e levitassem um pouco. ", "Uma estranha chuva de granizo começa. Cada granizo que toca o chão explode soltando um som como o de um trovão. ", "Durante a noite um estranho fenomeno ocorre. As estrelas do céu começam a cair num chuva de estrelas. Em pouco menos de uma hora todo céu ficava escuro. ", "As nuvens assumem a forma de teias e se espalham pelo céu de forma intricada. ", "Uma estranha nevoa surge pela manhã. Ela era densa e ficava muito difícil de atravessa-la. ", "Em certo ponto do dia diversas rachaduras começam a surgir no céu, causando ondas de choque e estrondos. ", "Todos acordam calmos, incapazes de sentir emoções fortes ou raiva. ", "Uma estranha chuva começa. Cada gota de chuva tinha uma cor diferente e brilhava. Ficando mais dificil de enchergar coisas distantes com precisão por conta de todas cores e brilhos. ", "Uma estranha neve começa a cair. Ela se espalhava mesmo sem vento, e caminhar por ela não deixava pegadas. ", "As nuvens adquirem uma luminosidade natural, como o sol ou a lua. Ficando tudo claro mesmo a noite. ", "Uma estranha chuva começa. Quanto mais vão ficando molhados, mais leves vão se tornando. Após alguns minutos os objetos molhados começam a flutuar. ", "Uma estranha neve começa a cair. Ela fazia um som relaxante e caia lentamente, deixando todos sonolentos. ", "Uma estranha neve começa a cair. Ela era pesada. Quanto mais se acumulava sobre algo mais seu peso ficava evidente. ", "Um estranho vento começa a soprar. Ele entrava mesmo em lugares completamente fechados, como se fosse incorporeo. ", "Grandes nuvens escuras de fumaça surgem no céu. Era possivel ver faiscas e chamas brancas saindo de seu interior. ", "Uma estranha chuva começa a cair. Assim que a água toca algo ela se congela. Cobrindo tudo em gelo. ", "Estranhas nuvens de tempestade negra surgem. Raios a atravessam sem ir em direção ao chão. O barulho dos trovões e do vento forte dificultam a audição. ", "Toda vez que o vento soprava era possivel ouvir os gritos dos mortos. Vozes do além, felizes ou tristes, podiam ser ouvidas em qualquer lugar. ", "Uma estranha tempestade começa. Cada vez que um raio parte o céu uma rachadura se abre, por onde é possivel ver outros mundos. ", "Estranhas nuvens de fumaça surgem no céu. Começa uma chuva estranha que se incendeia ao tocar qualquer coisa. ", "Um estranho vento começa a soprar, sempre vindo pelas costas e empurrando todos para frente. ", "Uma estranha neblina surge. Vez ou outra as pessoas que tentavam atravessa-la se encontram longe de onde estavam, em outro ponto da neblina. ", "O céu fica coberto de luzes douradas, algumas pessoas se sentem inspiradas e mais felizes. ", "Nuvens em forma de monstros surgem no céu. Sempre que o vento empurra uma para perto de outro elas brigam e se despedaçam. ", "Uma estranha chuva de granizo começa. Ao invés de blocos de gelo liso, pedras de gelo cheias de espinhos começam a cair. ", "Uma estranha nevoa vermelha cobre tudo. Dela era possivel ouvir o som de batalhas distantes e o sofrimento dos soldados. ", "O céu estava especialmente limpo. Nenhum sinal de nuvens. Tambem estava especialmente claro, mesmo em lugares de sombra. ", "Uma estranha chuva começa a cair de nuvens negra. Assim que a água escura toca algo ela se congela. Cobrindo tudo em gelo negro. ", "Uma tempestade estranha surge. As nuvens pareciam ter estranhas runas e grande quantidade de energia pode ser sentida emanando delas. ", "Uma estranha neve começa a cair. Ela era acizentada e fazia aqueles que a tocavam se sentirem mal. ", "O céu parece estranho e distorcido, sendo dificil entender sua forma. As nuvens pareciam retorcidas e as luzes pareciam fraquejar como se estivessem falhando. ", "Uma estranha chuva começa. Tudo que ela tocava começava a se dissolver lentamente. ", "Estranhos ventos quentes começam, acompanhados por faiscas e pequenas chamas. ", "Começa a chover de baixo pra cima. Água, de poços, lagos e rios começa a subir. ", "As núvens assumem a forma de engrenagens e começam a se conectar e girar, formando complexos mecanismos. "};
            									
            									local label = {"Vento Sussurrante", "Vento Ágil ", "Granizo Trovão", "Granizo Estrelar", "Nuvens de Teia", "Nevoa Solida", "Ceurremoto", "Calma Psiquica", "Chuva Prismatica", "Neve Fantasma", "Nuvens Brilhantes", "Chuva Levitante", "Neve do Sono", "Neve de Chumbo", "Vento Incorporeo", "Nuvens Incendiarias", "Chuva Congelante", "Tempestade Alucinogena", "Tempestade Fantasma", "Tempestade Planar", "Tempestade de Fogo", "Vento de Cauda", "Nevoa Eterea", "Céu Dourado", "Nuvens Monstro", "Nevasca Atroz", "Nevoa Vermelha", "Claridade Celestial", "Chuva Negra", "Tempestade Arcana", "Nevasca Negra", "Céu Aberrante", "Chuva Ácida", "Sopro Draconico", "Chuva Reversa", "Núvens Mecanicas"};
            
            									local efeitos = {"Qualquer criatura pode mandar uma mensagem ou som pra um local familiar escolhido. 50% de chance de apagar chamas desprotegidas. ", "Personagens podem voar com deslocamento de voo 12m bom, ou 9m se usar armadura media ou superior. 50% de chance de apagar chamas desprotegidas. ", "Causa 1d6 de dano por minuto. Torna testes de ouvir impossiveis. ", "Deixa o céu totalmente escuro. Barulho das estrelas caindo impoe -4 em ouvir. Estrelas voltam ao céu no dia seguinte. ", "Como a magia teia contra criaturas voadoras. ", "Como a magia nevoa solida. ", "Fortitude CD15 pra evitar surdez por uma hora. Fortitude CD15 para evitar 2d6 de dano em criaturas voadoras. ", "Remove todos efeitos de moral, furia, inspirar coragem, ou confusão. Criaturas não conseguem tomar ações violetas, mas podem se defender. ", "-8 em Observar. ", "+4 Furtividade, -4 Observar. Impossivel rastrear pegadas. Custa 2 quadrados para se mover pela neve. ", "Criaturas fracas contra luz do dia são afetadas como se fosse dia. ", "Criatuas molhadas voam subindo 6m por rodada. Chuva apaga chamas desprotegidas e tem 75% de chance de apagar chamas protegidas. -4 em ouvir, observar, e ataques a distancia. ", "Fortidude CD15 a cada hora para não dormir por 1h. -4 Observar, ouvir e ataques a distancia. Deslocamento custa o dobro. ", "Criatuas cobertas pela neve tomam 1d6 de dano por minuto. -8 Observar, ouvir e impossivel atacar a distancia. Apaga chamas desprotegidas e 50% de chance de apagar protegidas. Deslocamento custa o dobro. ", "Nega efeitos contra frio ou calor de roupas. Apenas bloqueado por energia. Apaga todas chamas. ", "Como a magia nuvem incendiaria", "Fortitude CD15 a cada hora. Na primeira falha deslocamento cai pela metade e -1 em ataques, CA e Reflexos. Na segunda falha Sofre de lentidão e penalidade aumenta pra -2. Na terceira falha fica presa em gelo e paralisada. Na quarta falha a criatura morre congelada. ", "-4 Ouvir e Observar. ", "Um personagem que passe 10 minutos chamando um espirito consegue sua atenção por 1d6 rodadas antes dele ser carregado pelo vento. -8 em ouvir, impossivel atacar a distancia. Apaga chamas desprotegidas, 75% de chance de apagar chamas protegidas. ", "Fortitude ou Vontade CD15 para criaturas voadoras não serem tragadas pra um plano aleatorio. ", "1d6 de dano por rodada por fogo. -4 Observar, Ouvir, e impossivel atacar a distancia. ", "Aumenta em 9m todos deslocamentos terrestres e de voo. ", "Vontade CD15 pra não ser teleportado pra lugar aleatorio da neblina a cada movimento. ", "Bonus moral de +1 em ataques e +2 em pericias para criaturas neutras e o dobro pra criaturas boas. ", "", "1d6 de dano por minuto, -4 em ouvir. ", "Vontade CD15 por minuto ou sofrer os efeitos de confusão. ", "+4 Observar, Ouvir, Sentir motivação. Dissipa confusão, medo ou ilusões. ", "Fortitude CD15 pra evitar nível negativo. -4 Observar, Ouvir e ataques a distancia. Apaga chamas desprotegidas e 75% das chamas protegidas. Deslocamento custa o dobro. ", "Aumenta em 1 a CD de todas magias. Aumenta em 1 os níveis de todos conjuradores. ", "Qualquer criatura morta durante a nevasca volta como uma aparição 1d4 rodadas depois. ", "Vontade 18 contra a magia insanidade, dura 1d6 horas. ", "1d6 de dano ácido por minuto. Reduz visibilidade a metade, -4 Observar, ouvir e ataques a distancia. Apaga chamas desprotegidas e 50% das chamas protegidas. ", "50% de chance de incendiar objetos inflamaveis. ", "Reduz visibilidade a metade, -4 Observar, ouvir e ataques a distancia. Apaga chamas desprotegidas e 50% das chamas protegidas. ", ""};
            
            									data = data .. sobrenatural[subEvent];
            									sheet.eventosLabel = "Eventos: " .. label[subEvent] .. ".";
            									self.eventosLabel.hint = efeitos[subEvent];
            								elseif event == 2 then
            									data = data .. "Durante a noite, o céu ficava coberto por uma Aurora. As grandes luzes se espalhavam pelo céu como panos de luz colorida. "
            									sheet.eventosLabel = "Eventos: Aurora."
            								elseif event == 3 then
            									data = data .. "Durante a noite, um cometa é visto atravessando os céus lentamente. Atravessando-o como uma linha de fogo. "
            									sheet.eventosLabel = "Eventos: Cometa."
            								elseif event == 4 then
            									local subEvent = math.random(1, 10);
            									if subEvent <= 7 then
            										data = data .. "Durante a noite, uma estrela cadente é vista cruzando o céu com velocidade. "
            										sheet.eventosLabel = "Eventos: Estrela Cadente."
            									elseif subEvent <= 9 then
            										data = data .. "Durante a noite, algumas estrelas cadentes podem ser vistas cruzando o céu com velocidade. "
            										sheet.eventosLabel = "Eventos: Estrelas Cadentes."
            									else
            										data = data .. "Durante a noite, frequentemente se pode ver estrelas cadentes cruzando o céu com velocidade. "
            										sheet.eventosLabel = "Eventos: Estrelas Cadentes."
            									end;
            								elseif event == 5 then
            									local subEvent = math.random(1, 4);
            									if subEvent <= 3 then
            										data = data .. "Durante a noite, um eclipse lunar penumbral ocorre. A lua fica vermelha, deixando tudo com uma aparencia avermelhada. "
            										sheet.eventosLabel = "Eventos: Lua de Sangue."
            									else
            										data = data .. "Durante a noite, um eclipse lunar ocorre. Deixando tudo escuro. "
            										sheet.eventosLabel = "Eventos: Eclipse Lunar."
            									end;
            								elseif event == 6 then
            									local subEvent = math.random(1, 4);
            									if subEvent <= 3 then
            										data = data .. "Durante o dia, um eclipse solar anular ocorre. O sol fica coberto por uma mancha negra, mas era possivel ver o circulo de fogo em volta da mancha. "
            										sheet.eventosLabel = "Eventos: Eclipse Solar Anular."
            									else
            										data = data .. "Durante o dia, um eclipse solar ocorre. Deixando tudo escuro por alguns minutos. "
            										sheet.eventosLabel = "Eventos: Eclipse Solar."
            									end;
            								elseif event == 7 then
            									local subEvent = math.random(1, 10);
            									if subEvent <= 7 then
            										data = data .. "Durante a noite, uma fraca chuva de meteoros é vista. Algumas vezes era possivel ver pequenos meteoros cruzando o céu. "
            										sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            									elseif subEvent <= 9 then
            										data = data .. "Durante a noite, uma chuva de meteoros é vista. Varias vezes era possivel perceber os pequenos meteoros cruzando o céu. "
            										sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            									else
            										data = data .. "Durante a noite, uma forte chuva de meteoros é vista. Dezenas de meteoros iluminam o céu. "
            										sheet.eventosLabel = "Eventos: Chuva de Meteoros."
            									end;
            								elseif event == 8 then
            									data = data .. "Em certo momento do dia um terremoto começa, fazendo o chão se tremer e derrubando construções e objetos. ";
            									sheet.eventosLabel = "Eventos: Terremoto."
            								end;
            							else
            								sheet.eventosLabel = "Eventos: Nenhum."
            							end;
            							sheet.data = data;
            						end;
        end, obj);

    obj._e_event44 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Selected.left = 20 * (tonumber(sheet.CorIndex or 0) % 8);
            			self.Selected.top = 20 * math.floor(tonumber(sheet.CorIndex or 0) / 8);
        end, obj);

    obj._e_event45 = obj.rectangle19:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            					sheet.CorIndex = sheet.IndexBarrinha1;
            					sheet.ColorString = sheet.CorBarrinha1;
            					self.SelectCor:show();
        end, obj);

    obj._e_event46 = obj.rectangle20:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            							sheet.CorIndex = sheet.IndexBarrinha1;
            							sheet.ColorString = sheet.CorBarrinha1;
            							self.SelectCor:show();
        end, obj);

    obj._e_event47 = obj.CorBarrinha1:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            								sheet.CorIndex = sheet.IndexBarrinha1;
            								sheet.ColorString = sheet.CorBarrinha1;
            								self.SelectCor:show();
        end, obj);

    obj._e_event48 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha1.color = sheet.CorBarrinha1;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha1 = sheet.CorBarrinha1;
            				end;
        end, obj);

    obj._e_event49 = obj.rectangle21:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            					sheet.CorIndex = sheet.IndexBarrinha2;
            					sheet.ColorString = sheet.CorBarrinha2;
            					self.SelectCor:show();
        end, obj);

    obj._e_event50 = obj.rectangle22:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            							sheet.CorIndex = sheet.IndexBarrinha2;
            							sheet.ColorString = sheet.CorBarrinha2;
            							self.SelectCor:show();
        end, obj);

    obj._e_event51 = obj.CorBarrinha2:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            								sheet.CorIndex = sheet.IndexBarrinha2;
            								sheet.ColorString = sheet.CorBarrinha2;
            								self.SelectCor:show();
        end, obj);

    obj._e_event52 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha2.color = sheet.CorBarrinha2;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha2 = sheet.CorBarrinha2;
            				end;
        end, obj);

    obj._e_event53 = obj.rectangle23:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            					sheet.CorIndex = sheet.IndexBarrinha3;
            					sheet.ColorString = sheet.CorBarrinha3;
            					self.SelectCor:show();
        end, obj);

    obj._e_event54 = obj.rectangle24:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            							sheet.CorIndex = sheet.IndexBarrinha3;
            							sheet.ColorString = sheet.CorBarrinha3;
            							self.SelectCor:show();
        end, obj);

    obj._e_event55 = obj.CorBarrinha3:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            								sheet.CorIndex = sheet.IndexBarrinha3;
            								sheet.ColorString = sheet.CorBarrinha3;
            								self.SelectCor:show();
        end, obj);

    obj._e_event56 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha3.color = sheet.CorBarrinha3;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha3 = sheet.CorBarrinha3;
            				end;
        end, obj);

    obj._e_event57 = obj.rectangle25:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            					sheet.CorIndex = sheet.IndexBarrinha4;
            					sheet.ColorString = sheet.CorBarrinha4;
            					self.SelectCor:show();
        end, obj);

    obj._e_event58 = obj.rectangle26:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            							sheet.CorIndex = sheet.IndexBarrinha4;
            							sheet.ColorString = sheet.CorBarrinha4;
            							self.SelectCor:show();
        end, obj);

    obj._e_event59 = obj.CorBarrinha4:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            								sheet.CorIndex = sheet.IndexBarrinha4;
            								sheet.ColorString = sheet.CorBarrinha4;
            								self.SelectCor:show();
        end, obj);

    obj._e_event60 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha4.color = sheet.CorBarrinha4;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha4 = sheet.CorBarrinha4;
            				end;
        end, obj);

    obj._e_event61 = obj.button22:addEventListener("onClick",
        function (_)
            self.Config:close();
        end, obj);

    obj._e_event62 = obj.layout42:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "0";
            				sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event63 = obj.rectangle29:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "0";
            					sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event64 = obj.layout43:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "1";
            				sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event65 = obj.rectangle30:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "1";
            					sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event66 = obj.layout44:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "2";
            				sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event67 = obj.rectangle31:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "2";
            					sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event68 = obj.layout45:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "3";
            				sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event69 = obj.rectangle32:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "3";
            					sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event70 = obj.layout46:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "4";
            				sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event71 = obj.rectangle33:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "4";
            					sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event72 = obj.layout47:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "5";
            				sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event73 = obj.rectangle34:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "5";
            					sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event74 = obj.layout48:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "6";
            				sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event75 = obj.rectangle35:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "6";
            					sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event76 = obj.layout49:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "7";
            				sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event77 = obj.rectangle36:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "7";
            					sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event78 = obj.layout50:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "8";
            				sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event79 = obj.rectangle37:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "8";
            					sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event80 = obj.layout51:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "9";
            				sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event81 = obj.rectangle38:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "9";
            					sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event82 = obj.layout52:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "10";
            				sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event83 = obj.rectangle39:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "10";
            					sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event84 = obj.layout53:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "11";
            				sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event85 = obj.rectangle40:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "11";
            					sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event86 = obj.layout54:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "12";
            				sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event87 = obj.rectangle41:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "12";
            					sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event88 = obj.layout55:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "13";
            				sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event89 = obj.rectangle42:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "13";
            					sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event90 = obj.layout56:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "14";
            				sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event91 = obj.rectangle43:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "14";
            					sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event92 = obj.layout57:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "15";
            				sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event93 = obj.rectangle44:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "15";
            					sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event94 = obj.button23:addEventListener("onClick",
        function (_)
            if sheet.IndexBarrinha == 1 then
            								sheet.IndexBarrinha1 = sheet.CorIndex;
            								sheet.CorBarrinha1 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 2 then
            								sheet.IndexBarrinha2 = sheet.CorIndex;
            								sheet.CorBarrinha2 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 3 then
            								sheet.IndexBarrinha3 = sheet.CorIndex;
            								sheet.CorBarrinha3 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 4 then
            								sheet.IndexBarrinha4 = sheet.CorIndex;
            								sheet.CorBarrinha4 = sheet.ColorString;
            							end;
            							self.SelectCor:close();
        end, obj);

    obj._e_event95 = obj.NovaAbadeNPCs:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						node = self.opcoesFalsas:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event96 = obj.rectangle46:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event97 = obj.label108:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event98 = obj.path1:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            							 self:autoCalcular();
        end, obj);

    obj._e_event99 = obj.ListaDeNPCs:addEventListener("onShow",
        function (_)
            if self.opcoesFalsas2.selectedNode == nil and sheet ~= nil then
            			chamarListaDeJogadores();
            			autoCalcular();
                        local nodes = ndb.getChildNodes(sheet.opcoesFalsas2);               
                        if #nodes > 0 then
                            self.opcoesFalsas2.selectedNode = nodes[1];
                        end;
                    end;
        end, obj);

    obj._e_event100 = obj.opcoesFalsas2:addEventListener("onSelect",
        function (_)
            local node = self.opcoesFalsas2.selectedNode;
            						 setTimeout(function()
            							if node ~= nil then
            								self.recordNode.scopeNode.opcaoEscolhida2 = node.NomeDaOpcao;
            							end;
            						 end,10);
        end, obj);

    obj._e_event101 = obj.opcoesFalsas2:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (nodeA.CodigoInterno == nil) then
            							if (nodeA.NomeDaOpcao == "Nenhum") then
            								nodeA.CodigoInterno = 1;
            							else
            								nodeA.CodigoInterno = 2;
            							end;
            						end;
            						if (nodeB.CodigoInterno == nil) then
            							if (nodeB.NomeDaOpcao == "Nenhum") then
            								nodeB.CodigoInterno = 1;
            							else
            								nodeB.CodigoInterno = 2;
            							end;
            						end;
            					 
            						if nodeB.CodigoInterno > nodeA.CodigoInterno then
            							return -1;
            						elseif not (nodeB.CodigoInterno >= nodeA.CodigoInterno) then
            							return 1;
            						else
            							return 1 * utils.compareStringPtBr(nodeA.NomeDaOpcao, nodeB.NomeDaOpcao);
            						end;
        end, obj);

    obj._e_event102 = obj.rectangle47:addEventListener("onResize",
        function (_)
            if self.width >= 270 then
            				self.rclListaDeNPC.width = self.width;
            			else
            				self.rclListaDeNPC.width = 270;
            			end;
        end, obj);

    obj._e_event103 = obj.Configurar:addEventListener("onClick",
        function (_)
            if DonoMestre() then
            						self.Config.scopeNode = sheet;
            						self.Config:show();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event104 = obj.NovoNPC:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						node = self.rclListaDeNPC:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event105 = obj.Organizar:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						self.rclListaDeNPC:sort();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event106 = obj.rclListaDeNPC:addEventListener("onBeginEnumeration",
        function (_)
        end, obj);

    obj._e_event107 = obj.rclListaDeNPC:addEventListener("onItemAdded",
        function (_, node, form)
            node.CorBarrinha1 = (sheet.CorBarrinha1 or "#808080");
            					node.CorBarrinha2 = (sheet.CorBarrinha2 or "#808080");
            					node.CorBarrinha3 = (sheet.CorBarrinha3 or "#808080");
            					node.CorBarrinha4 = (sheet.CorBarrinha4 or "#808080");
            					form.Barrinha1.color = sheet.CorBarrinha1;
            					form.Barrinha2.color = sheet.CorBarrinha2;
            					form.Barrinha3.color = sheet.CorBarrinha3;
            					form.Barrinha4.color = sheet.CorBarrinha4;
        end, obj);

    obj._e_event108 = obj.rclListaDeNPC:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            org = getOrganizacao();
            					if nodeA.hideNPC and not nodeB.hideNPC then
            						return 1;
            					elseif not nodeA.hideNPC and nodeB.hideNPC then
            						return -1;
            					end;
            					if org == "Alfa" then
            						return utils.compareStringPtBr(nodeA.NomeGrande, nodeB.NomeGrande);
            					else
            						if ((nodeB.alinhamentoNPC or "Padrão") > (nodeA.alinhamentoNPC or "Padrão")) then
            							return -1;
            						elseif (nodeA.alinhamentoNPC or "Padrão") == (nodeB.alinhamentoNPC or "Padrão") then
            							return utils.compareStringPtBr(nodeA.NomePequeno, nodeB.NomePequeno);
            						else
            							return 1;
            						end;
            					end;
        end, obj);

    obj._e_event109 = obj.opcoesFalsas:addEventListener("onSelect",
        function (_)
            local node = self.opcoesFalsas.selectedNode;
            					 setTimeout(function()
            						if node ~= nil then
            							 self.dcsMain.scopeNode = node;
            							 self.dcsTituloEAbas.scopeNode = node;
            							 self.comboBoxFalsa.scopeNode = node;
            						end;
            					 end,10);
            					 self.dropDownFalso:close();
        end, obj);

    obj._e_event110 = obj.opcoesFalsas:addEventListener("onBeginEnumeration",
        function (_)
            if sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            						if #nodes == 0 then
            							local node = self.opcoesFalsas:append();
            							node.NomeDaOpcao = "Principal";
            						end;
            					end;
        end, obj);

    obj._e_event111 = obj.opcoesFalsas:addEventListener("onEndEnumeration",
        function (_)
            local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            					if self.dcsMain.scopeNode == nil then
            						self.dcsMain.scopeNode = nodes[1];
            						self.dcsTituloEAbas.scopeNode = nodes[1];
            						self.comboBoxFalsa.scopeNode = nodes[1];
            					end;
        end, obj);

    obj._e_event112 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet ~= nil then
            				local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            				if #nodes == 0 then
            					local node = self.opcoesFalsas:append();
            				else
            					if self.dcsMain.scopeNode == nil then
            						self.dcsMain.scopeNode = nodes[1];
            						self.dcsTituloEAbas.scopeNode = nodes[1];
            						self.comboBoxFalsa.scopeNode = nodes[1];
            					end;			
            				end;
            			end;
        end, obj);

    obj._e_event113 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local nudes = ndb.getChildNodes(sheet.opcoesFalsas);               
            			for i = 1, #nudes, 1 do
            				local nodes = ndb.getChildNodes(nudes[i].campoDosNPC);       
            				self:beginUpdate();
            				for i = 1,#nodes, 1 do
            					if sheet.VisibBarrinha1 ~= "c" then
            						nodes[i].Barrinha1Invisivel = false;
            					else
            						nodes[i].Barrinha1Invisivel = true;
            					end;
            				
            					if sheet.VisibBarrinha2 ~= "c" then
            						nodes[i].Barrinha2Invisivel = false;
            					else
            						nodes[i].Barrinha2Invisivel = true;
            					end;
            					
            					if sheet.VisibBarrinha3 ~= "c" then
            						nodes[i].Barrinha3Invisivel = false;
            					else
            						nodes[i].Barrinha3Invisivel = true;
            					end;
            					
            					if sheet.VisibBarrinha4 ~= "c" then
            						nodes[i].Barrinha4Invisivel = false;
            					else
            						nodes[i].Barrinha4Invisivel = true;
            					end;
            				end;
            				self:endUpdate();
            			end;
        end, obj);

    obj._e_event114 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local nudes = ndb.getChildNodes(sheet.opcoesFalsas);               
            			for i = 1, #nudes, 1 do
            				local nodes = ndb.getChildNodes(nudes[i].campoDosNPC);    
            				self:beginUpdate();
            				for i = 1,#nodes, 1 do
            				setTimeout( function ()
            					local test = GetBarrinhaNumeros(1);
            					local d0 = (tonumber(nodes[i].Barrinha1ValorMax or 0) == 0)
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha1ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha1 = (nodes[i].Barrinha1Valor or 0) .. "/" .. (nodes[i].Barrinha1ValorMax  or 0);
            						nodes[i].InfoBarrinha1Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha1 = tostring(math.floor((100 * (nodes[i].Barrinha1Valor or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha1Oculto = "??%";
            					end;
            					
            					local test = GetBarrinhaNumeros(2);
            					local d0 = (tonumber(nodes[i].Barrinha2ValorMax or 0) == 0)
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha2ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha2 = (nodes[i].Barrinha2Valor  or 0) .. "/" .. (nodes[i].Barrinha2ValorMax  or 0);
            						nodes[i].InfoBarrinha2Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha2 = tostring(math.floor((100 * (nodes[i].Barrinha2Valor  or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha2Oculto = "??%";
            					end;
            					local test = GetBarrinhaNumeros(3);
            					local d0 = (tonumber(nodes[i].Barrinha3ValorMax or 0) == 0);
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha3ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha3 = (nodes[i].Barrinha3Valor or 0) .. "/" .. (nodes[i].Barrinha3ValorMax  or 0);
            						nodes[i].InfoBarrinha3Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha3 = tostring(math.floor((100 * (nodes[i].Barrinha3Valor or 0) ) / d0)) .. "%";
            						nodes[i].InfoBarrinha3Oculto = "??%";
            					end;
            					local test = GetBarrinhaNumeros(4);
            					local d0 = (tonumber(nodes[i].Barrinha4ValorMax or 0) == 0);
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha4ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha4 = (nodes[i].Barrinha4Valor or 0) .. "/" .. (nodes[i].Barrinha4ValorMax or 0);
            						nodes[i].InfoBarrinha4Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha4 = tostring(math.floor((100 * (nodes[i].Barrinha4Valor or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha4Oculto = "??%";
            					end;
            					end, 100);
            				end;
            				self:endUpdate();
            			end;
        end, obj);

    obj._e_event115 = obj.btnAddAtor:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					showMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				self:criarNovoAtor();
        end, obj);

    obj._e_event116 = obj.btnRoll:addEventListener("onClick",
        function (_)
            local jogadores = rrpg.getMesaDe(sheet).jogadores;
            				local current = nil;
            				for i = 1, #jogadores, 1 do
            					if jogadores[i].login==rrpg.getCurrentUser().login then
            						current = jogadores[i];
            					end;
            				end;
            				if not current.isMestre then return end;
            
            				local nodes = ndb.getChildNodes(sheet.atores);
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					showMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				for i=1, #nodes, 1 do
            					if nodes[i].iniciativaBonus ~= nil then
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. nodes[i].iniciativaBonus);
            
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (nodes[i].nome or "Nome"),
            								function (rolado)
            									nodes[i].iniciativa = rolado.resultado;
            									self.rclAtores:sort();
            								end); 
            					end;
            				end
        end, obj);

    obj._e_event117 = obj.btnAddAll:addEventListener("onClick",
        function (_)
            local jogadores = rrpg.getMesaDe(sheet).jogadores;
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					showMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				for i=1, #jogadores, 1 do
            					if jogadores[i].isJogador then
            						local ator = self:criarNovoAtor();
            						ator.nome = utils.removerFmtChat(jogadores[i].nick)
            						ator.fof = 1;
            					end;
            				end
        end, obj);

    obj._e_event118 = obj.btnLimpar:addEventListener("onClick",
        function (_)
            self:limpar();
        end, obj);

    obj._e_event119 = obj.rclAtores:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return self:compareNodes(nodeA, nodeB);
        end, obj);

    obj._e_event120 = obj.button24:addEventListener("onClick",
        function (_)
            self:proximoTurno();
        end, obj);

    obj._e_event121 = obj.button25:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            						local aventuras = ndb.getChildNodes(sheet.aventuras);
            						local num = #aventuras + 1;
            
            						local node = self.rclAventuras:append();
            						if node~=nil then
            							node.numero = num;
            						end;
            
            						self.rclAventuras:sort();
            					end;
        end, obj);

    obj._e_event122 = obj.rclAventuras:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                return 1;
            		            elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                return -1;
            		            else   
            		                return 0;
            		            end;
        end, obj);

    obj._e_event123 = obj.button26:addEventListener("onClick",
        function (_)
            if sheet~=nil then
            						local sessoes = ndb.getChildNodes(sheet.sessoes);
            						local num = 1;
            
            						if #sessoes > 0 then
            							num = (tonumber(sessoes[#sessoes].numero) or 0) + 1
            						end;
            
            						local node = self.rclSessoes:append();
            						if node~=nil then
            							node.numero = num;
            							node.data = os.date("%d/%m/%Y", os.time());
            						end;
            
            						self.rclSessoes:sort();
            					end;
        end, obj);

    obj._e_event124 = obj.rclSessoes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                return 1;
            		            elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                return -1;
            		            else   
            		                return 0;
            		            end;
        end, obj);

    obj._e_event125 = obj.button27:addEventListener("onClick",
        function (_)
            secret();
        end, obj);

    obj._e_event126 = obj.button28:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/tree/master/Plugins/Sheets/Gerenciador%20de%20Campanha')
        end, obj);

    obj._e_event127 = obj.button29:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Gerenciador%20de%20Campanha/output/Gerenciador%20de%20Campanha.rpk?raw=true')
        end, obj);

    obj._e_event128 = obj.button30:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://www.dropbox.com/s/3eodkgih3aq6hfz/Tutorial.docx?dl=0')
        end, obj);

    obj._e_event129 = obj.button31:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.flowPart100 ~= nil then self.flowPart100:destroy(); self.flowPart100 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.flowPart33 ~= nil then self.flowPart33:destroy(); self.flowPart33 = nil; end;
        if self.dcsMain ~= nil then self.dcsMain:destroy(); self.dcsMain = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.rclExperience ~= nil then self.rclExperience:destroy(); self.rclExperience = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.flowPart32 ~= nil then self.flowPart32:destroy(); self.flowPart32 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.rclSemana ~= nil then self.rclSemana:destroy(); self.rclSemana = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.flowPart66 ~= nil then self.flowPart66:destroy(); self.flowPart66 = nil; end;
        if self.flowPart69 ~= nil then self.flowPart69:destroy(); self.flowPart69 = nil; end;
        if self.flowPart74 ~= nil then self.flowPart74:destroy(); self.flowPart74 = nil; end;
        if self.flowPart76 ~= nil then self.flowPart76:destroy(); self.flowPart76 = nil; end;
        if self.flowPart101 ~= nil then self.flowPart101:destroy(); self.flowPart101 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.flowPart55 ~= nil then self.flowPart55:destroy(); self.flowPart55 = nil; end;
        if self.flowPart95 ~= nil then self.flowPart95:destroy(); self.flowPart95 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.flowPart51 ~= nil then self.flowPart51:destroy(); self.flowPart51 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.flowPart94 ~= nil then self.flowPart94:destroy(); self.flowPart94 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.flowPart79 ~= nil then self.flowPart79:destroy(); self.flowPart79 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.flowPart89 ~= nil then self.flowPart89:destroy(); self.flowPart89 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.flowPart68 ~= nil then self.flowPart68:destroy(); self.flowPart68 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.flowLineBreak6 ~= nil then self.flowLineBreak6:destroy(); self.flowLineBreak6 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layTopTracker ~= nil then self.layTopTracker:destroy(); self.layTopTracker = nil; end;
        if self.flowPart34 ~= nil then self.flowPart34:destroy(); self.flowPart34 = nil; end;
        if self.flowPart54 ~= nil then self.flowPart54:destroy(); self.flowPart54 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.rclXpAll ~= nil then self.rclXpAll:destroy(); self.rclXpAll = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.flowPart53 ~= nil then self.flowPart53:destroy(); self.flowPart53 = nil; end;
        if self.celestialBt ~= nil then self.celestialBt:destroy(); self.celestialBt = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.flowPart43 ~= nil then self.flowPart43:destroy(); self.flowPart43 = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.rclPoSet ~= nil then self.rclPoSet:destroy(); self.rclPoSet = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.flowPart57 ~= nil then self.flowPart57:destroy(); self.flowPart57 = nil; end;
        if self.labTitFoF ~= nil then self.labTitFoF:destroy(); self.labTitFoF = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.comboBoxFalsa ~= nil then self.comboBoxFalsa:destroy(); self.comboBoxFalsa = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.flowPart59 ~= nil then self.flowPart59:destroy(); self.flowPart59 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.flowPart78 ~= nil then self.flowPart78:destroy(); self.flowPart78 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.rclDinheiro ~= nil then self.rclDinheiro:destroy(); self.rclDinheiro = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.flowPart39 ~= nil then self.flowPart39:destroy(); self.flowPart39 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.flowPart60 ~= nil then self.flowPart60:destroy(); self.flowPart60 = nil; end;
        if self.flowPart28 ~= nil then self.flowPart28:destroy(); self.flowPart28 = nil; end;
        if self.SelectCor ~= nil then self.SelectCor:destroy(); self.SelectCor = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.btnAddAtor ~= nil then self.btnAddAtor:destroy(); self.btnAddAtor = nil; end;
        if self.flowPart87 ~= nil then self.flowPart87:destroy(); self.flowPart87 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.rclPoAll ~= nil then self.rclPoAll:destroy(); self.rclPoAll = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.flowPart96 ~= nil then self.flowPart96:destroy(); self.flowPart96 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.flowPart80 ~= nil then self.flowPart80:destroy(); self.flowPart80 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flowPart92 ~= nil then self.flowPart92:destroy(); self.flowPart92 = nil; end;
        if self.flowPart72 ~= nil then self.flowPart72:destroy(); self.flowPart72 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.flowPart40 ~= nil then self.flowPart40:destroy(); self.flowPart40 = nil; end;
        if self.flowPart75 ~= nil then self.flowPart75:destroy(); self.flowPart75 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.flowPart97 ~= nil then self.flowPart97:destroy(); self.flowPart97 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.labTitIniciativa ~= nil then self.labTitIniciativa:destroy(); self.labTitIniciativa = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart48 ~= nil then self.flowPart48:destroy(); self.flowPart48 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rclEstacoes ~= nil then self.rclEstacoes:destroy(); self.rclEstacoes = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.rclListaDeNPC ~= nil then self.rclListaDeNPC:destroy(); self.rclListaDeNPC = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.dropDownFalso2 ~= nil then self.dropDownFalso2:destroy(); self.dropDownFalso2 = nil; end;
        if self.flowPart35 ~= nil then self.flowPart35:destroy(); self.flowPart35 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.popCelestial ~= nil then self.popCelestial:destroy(); self.popCelestial = nil; end;
        if self.flowPart90 ~= nil then self.flowPart90:destroy(); self.flowPart90 = nil; end;
        if self.flowPart91 ~= nil then self.flowPart91:destroy(); self.flowPart91 = nil; end;
        if self.luasLabel ~= nil then self.luasLabel:destroy(); self.luasLabel = nil; end;
        if self.rclAtores ~= nil then self.rclAtores:destroy(); self.rclAtores = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.MainClient ~= nil then self.MainClient:destroy(); self.MainClient = nil; end;
        if self.flowPart93 ~= nil then self.flowPart93:destroy(); self.flowPart93 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.a3 ~= nil then self.a3:destroy(); self.a3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.NovoNPC ~= nil then self.NovoNPC:destroy(); self.NovoNPC = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.rclLuas ~= nil then self.rclLuas:destroy(); self.rclLuas = nil; end;
        if self.flowPart71 ~= nil then self.flowPart71:destroy(); self.flowPart71 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layHeader0 ~= nil then self.layHeader0:destroy(); self.layHeader0 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.opcoesFalsas ~= nil then self.opcoesFalsas:destroy(); self.opcoesFalsas = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.temperaturaLabel ~= nil then self.temperaturaLabel:destroy(); self.temperaturaLabel = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.rclSessoes ~= nil then self.rclSessoes:destroy(); self.rclSessoes = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dcsTituloEAbas ~= nil then self.dcsTituloEAbas:destroy(); self.dcsTituloEAbas = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.Selected ~= nil then self.Selected:destroy(); self.Selected = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.CorBarrinha1 ~= nil then self.CorBarrinha1:destroy(); self.CorBarrinha1 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.Flow ~= nil then self.Flow:destroy(); self.Flow = nil; end;
        if self.flowPart37 ~= nil then self.flowPart37:destroy(); self.flowPart37 = nil; end;
        if self.flowPart45 ~= nil then self.flowPart45:destroy(); self.flowPart45 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.poAllPopup ~= nil then self.poAllPopup:destroy(); self.poAllPopup = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.flowPart85 ~= nil then self.flowPart85:destroy(); self.flowPart85 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.flowPart77 ~= nil then self.flowPart77:destroy(); self.flowPart77 = nil; end;
        if self.ListaDeNPCs ~= nil then self.ListaDeNPCs:destroy(); self.ListaDeNPCs = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.precipitacaoLabel ~= nil then self.precipitacaoLabel:destroy(); self.precipitacaoLabel = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.phAllPopup ~= nil then self.phAllPopup:destroy(); self.phAllPopup = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layRightAlinedTitle ~= nil then self.layRightAlinedTitle:destroy(); self.layRightAlinedTitle = nil; end;
        if self.dataLabel ~= nil then self.dataLabel:destroy(); self.dataLabel = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.flowPart73 ~= nil then self.flowPart73:destroy(); self.flowPart73 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowPart42 ~= nil then self.flowPart42:destroy(); self.flowPart42 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.flowLineBreak7 ~= nil then self.flowLineBreak7:destroy(); self.flowLineBreak7 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.popClima ~= nil then self.popClima:destroy(); self.popClima = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.Nha ~= nil then self.Nha:destroy(); self.Nha = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.path1 ~= nil then self.path1:destroy(); self.path1 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.Organizar ~= nil then self.Organizar:destroy(); self.Organizar = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.flowPart52 ~= nil then self.flowPart52:destroy(); self.flowPart52 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.btnLimpar ~= nil then self.btnLimpar:destroy(); self.btnLimpar = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.flowPart38 ~= nil then self.flowPart38:destroy(); self.flowPart38 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.CorBarrinha4 ~= nil then self.CorBarrinha4:destroy(); self.CorBarrinha4 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.rclMeses ~= nil then self.rclMeses:destroy(); self.rclMeses = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.btnAddAll ~= nil then self.btnAddAll:destroy(); self.btnAddAll = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.flowPart44 ~= nil then self.flowPart44:destroy(); self.flowPart44 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.a1 ~= nil then self.a1:destroy(); self.a1 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.comboBox18 ~= nil then self.comboBox18:destroy(); self.comboBox18 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.estacaoLabel ~= nil then self.estacaoLabel:destroy(); self.estacaoLabel = nil; end;
        if self.CorBarrinha3 ~= nil then self.CorBarrinha3:destroy(); self.CorBarrinha3 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.popMoon ~= nil then self.popMoon:destroy(); self.popMoon = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.flowPart29 ~= nil then self.flowPart29:destroy(); self.flowPart29 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.recordNode ~= nil then self.recordNode:destroy(); self.recordNode = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.flowPart56 ~= nil then self.flowPart56:destroy(); self.flowPart56 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.flowPart26 ~= nil then self.flowPart26:destroy(); self.flowPart26 = nil; end;
        if self.flowLineBreak11 ~= nil then self.flowLineBreak11:destroy(); self.flowLineBreak11 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.ventoLabel ~= nil then self.ventoLabel:destroy(); self.ventoLabel = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.flowPart41 ~= nil then self.flowPart41:destroy(); self.flowPart41 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.poSetTarget ~= nil then self.poSetTarget:destroy(); self.poSetTarget = nil; end;
        if self.flowPart30 ~= nil then self.flowPart30:destroy(); self.flowPart30 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.opcoesFalsas2 ~= nil then self.opcoesFalsas2:destroy(); self.opcoesFalsas2 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.btnRoll ~= nil then self.btnRoll:destroy(); self.btnRoll = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.flowPart88 ~= nil then self.flowPart88:destroy(); self.flowPart88 = nil; end;
        if self.Listade_NPC_Dock ~= nil then self.Listade_NPC_Dock:destroy(); self.Listade_NPC_Dock = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.flowPart99 ~= nil then self.flowPart99:destroy(); self.flowPart99 = nil; end;
        if self.NovaAbadeNPCs ~= nil then self.NovaAbadeNPCs:destroy(); self.NovaAbadeNPCs = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.frmCombatTracker ~= nil then self.frmCombatTracker:destroy(); self.frmCombatTracker = nil; end;
        if self.flowPart62 ~= nil then self.flowPart62:destroy(); self.flowPart62 = nil; end;
        if self.flowPart49 ~= nil then self.flowPart49:destroy(); self.flowPart49 = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.flowLineBreak9 ~= nil then self.flowLineBreak9:destroy(); self.flowLineBreak9 = nil; end;
        if self.eventosLabel ~= nil then self.eventosLabel:destroy(); self.eventosLabel = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.a2 ~= nil then self.a2:destroy(); self.a2 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.flowPart83 ~= nil then self.flowPart83:destroy(); self.flowPart83 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.flowPart46 ~= nil then self.flowPart46:destroy(); self.flowPart46 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.Configurar ~= nil then self.Configurar:destroy(); self.Configurar = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.flowPart50 ~= nil then self.flowPart50:destroy(); self.flowPart50 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.flowPart47 ~= nil then self.flowPart47:destroy(); self.flowPart47 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.flowPart67 ~= nil then self.flowPart67:destroy(); self.flowPart67 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.flowPart31 ~= nil then self.flowPart31:destroy(); self.flowPart31 = nil; end;
        if self.dropDownFalso ~= nil then self.dropDownFalso:destroy(); self.dropDownFalso = nil; end;
        if self.frmGerenciador03 ~= nil then self.frmGerenciador03:destroy(); self.frmGerenciador03 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.frmJogadores ~= nil then self.frmJogadores:destroy(); self.frmJogadores = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.flowPart64 ~= nil then self.flowPart64:destroy(); self.flowPart64 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.xpAllPopup ~= nil then self.xpAllPopup:destroy(); self.xpAllPopup = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.Config ~= nil then self.Config:destroy(); self.Config = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowPart81 ~= nil then self.flowPart81:destroy(); self.flowPart81 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.flowPart98 ~= nil then self.flowPart98:destroy(); self.flowPart98 = nil; end;
        if self.flowPart63 ~= nil then self.flowPart63:destroy(); self.flowPart63 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.flowPart70 ~= nil then self.flowPart70:destroy(); self.flowPart70 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.flowPart36 ~= nil then self.flowPart36:destroy(); self.flowPart36 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.flowPart86 ~= nil then self.flowPart86:destroy(); self.flowPart86 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart82 ~= nil then self.flowPart82:destroy(); self.flowPart82 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.flowLineBreak10 ~= nil then self.flowLineBreak10:destroy(); self.flowLineBreak10 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.flowPart84 ~= nil then self.flowPart84:destroy(); self.flowPart84 = nil; end;
        if self.flowLineBreak8 ~= nil then self.flowLineBreak8:destroy(); self.flowLineBreak8 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.flowPart61 ~= nil then self.flowPart61:destroy(); self.flowPart61 = nil; end;
        if self.flowPart27 ~= nil then self.flowPart27:destroy(); self.flowPart27 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.flowPart58 ~= nil then self.flowPart58:destroy(); self.flowPart58 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.rclAventuras ~= nil then self.rclAventuras:destroy(); self.rclAventuras = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.flowPart65 ~= nil then self.flowPart65:destroy(); self.flowPart65 = nil; end;
        if self.flowPart21 ~= nil then self.flowPart21:destroy(); self.flowPart21 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.frmGerenciador02 ~= nil then self.frmGerenciador02:destroy(); self.frmGerenciador02 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.dias ~= nil then self.dias:destroy(); self.dias = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layTrackerBottom ~= nil then self.layTrackerBottom:destroy(); self.layTrackerBottom = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmBibliotecaRPGmeister()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmBibliotecaRPGmeister();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmBibliotecaRPGmeister = {
    newEditor = newfrmBibliotecaRPGmeister, 
    new = newfrmBibliotecaRPGmeister, 
    name = "frmBibliotecaRPGmeister", 
    dataType = "Ambesek.Gerenciador.RPGmeister", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Gerenciador de Campanha", 
    description=""};

frmBibliotecaRPGmeister = _frmBibliotecaRPGmeister;
Firecast.registrarForm(_frmBibliotecaRPGmeister);
Firecast.registrarDataType(_frmBibliotecaRPGmeister);

return _frmBibliotecaRPGmeister;
