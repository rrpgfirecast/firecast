require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmJogadores()
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
    obj:setName("frmJogadores");
    obj:setAlign("client");


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
    obj.xpAllPopup:setParent(obj);
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
    obj.poAllPopup:setParent(obj);
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
    obj.poSetTarget:setParent(obj);
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
    obj.phAllPopup:setParent(obj);
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
    obj.scrollBox1:setParent(obj);
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

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclXpAll:append();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
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

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclPoAll:append();
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
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

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclPoSet:append();
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
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

    obj._e_event6 = obj.button7:addEventListener("onClick",
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

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclSelector:append();
        end, obj);

    obj._e_event8 = obj.button9:addEventListener("onClick",
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

    obj._e_event9 = obj.button10:addEventListener("onClick",
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

    obj._e_event10 = obj.button11:addEventListener("onClick",
        function (_)
            findPopup("xpAllPopup");
        end, obj);

    obj._e_event11 = obj.button12:addEventListener("onClick",
        function (_)
            findPopup("poAllPopup");
        end, obj);

    obj._e_event12 = obj.button13:addEventListener("onClick",
        function (_)
            findPopup("poSetTarget");
        end, obj);

    obj._e_event13 = obj.button14:addEventListener("onClick",
        function (_)
            findPopup("phAllPopup");
        end, obj);

    obj._e_event14 = obj.rclSelector:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            					return utils.compareStringPtBr(nodeA.login, nodeB.login);
        end, obj);

    obj._e_event15 = obj.rclSelector:addEventListener("onSelect",
        function (_)
            local node = self.rclSelector.selectedNode;
            						self.boxDetalhesDoItem.node = node; 
            						self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event16 = obj.rclSelector:addEventListener("onEndEnumeration",
        function (_)
            if self.rclSelector.selectedNode == nil and sheet ~= nil then
            				        local nodes = ndb.getChildNodes(sheet.listaDeJogadores);               
            
            				        if #nodes > 0 then
            				            self.rclSelector.selectedNode = nodes[1];
            				        end;
            				    end;
        end, obj);

    obj._e_event17 = obj.button15:addEventListener("onClick",
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

    obj._e_event18 = obj.dataLink1:addEventListener("onChange",
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

    obj._e_event19 = obj.rclExperience:addEventListener("onCompare",
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

    obj._e_event20 = obj.button16:addEventListener("onClick",
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

    obj._e_event21 = obj.rclDinheiro:addEventListener("onCompare",
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

    obj._e_event22 = obj.dataLink2:addEventListener("onChange",
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

    obj._e_event23 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    function obj:_releaseEvents()
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.phAllPopup ~= nil then self.phAllPopup:destroy(); self.phAllPopup = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.rclExperience ~= nil then self.rclExperience:destroy(); self.rclExperience = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.xpAllPopup ~= nil then self.xpAllPopup:destroy(); self.xpAllPopup = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rclXpAll ~= nil then self.rclXpAll:destroy(); self.rclXpAll = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rclPoSet ~= nil then self.rclPoSet:destroy(); self.rclPoSet = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rclDinheiro ~= nil then self.rclDinheiro:destroy(); self.rclDinheiro = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.poSetTarget ~= nil then self.poSetTarget:destroy(); self.poSetTarget = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.poAllPopup ~= nil then self.poAllPopup:destroy(); self.poAllPopup = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.rclPoAll ~= nil then self.rclPoAll:destroy(); self.rclPoAll = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmJogadores()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmJogadores();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmJogadores = {
    newEditor = newfrmJogadores, 
    new = newfrmJogadores, 
    name = "frmJogadores", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmJogadores = _frmJogadores;
Firecast.registrarForm(_frmJogadores);

return _frmJogadores;
