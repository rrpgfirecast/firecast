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

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmJogadores);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(240);
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Adicionar");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox1);
    obj.button2:setLeft(25);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("V");
    obj.button2:setHint("Dá voz a todos jogadores da lista, retira +Jogador dos outros e ativa mesa moderada. ");
    obj.button2:setName("button2");

    obj.rclSelector = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector:setParent(obj.scrollBox1);
    obj.rclSelector:setLeft(0);
    obj.rclSelector:setTop(25);
    obj.rclSelector:setWidth(240);
    obj.rclSelector:setHeight(575);
    obj.rclSelector:setName("rclSelector");
    obj.rclSelector:setField("listaDeJogadores");
    obj.rclSelector:setTemplateForm("frmDataScopeSelectionForm");
    obj.rclSelector:setLayout("vertical");
    obj.rclSelector:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.scrollBox1);
    obj.boxDetalhesDoItem:setLeft(250);
    obj.boxDetalhesDoItem:setTop(0);
    obj.boxDetalhesDoItem:setWidth(1000);
    obj.boxDetalhesDoItem:setHeight(600);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoItem);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.boxDetalhesDoItem);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(5);
    obj.layout1:setWidth(990);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(70);
    obj.label1:setHeight(20);
    obj.label1:setText("Login");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(70);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setField("login");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(200);
    obj.label2:setTop(5);
    obj.label2:setWidth(70);
    obj.label2:setHeight(20);
    obj.label2:setText("Personagem");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(12);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setLeft(275);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setField("personagem");
    obj.edit2:setName("edit2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.boxDetalhesDoItem);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(30);
    obj.layout2:setWidth(170);
    obj.layout2:setHeight(300);
    obj.layout2:setName("layout2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout2);
    obj.button3:setLeft(0);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button3:setName("button3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(10);
    obj.label3:setTop(5);
    obj.label3:setWidth(70);
    obj.label3:setHeight(20);
    obj.label3:setText("XP");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(70);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(100);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(70);
    obj.label4:setTop(0);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setField("XP");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setField("XP");
    obj.dataLink1:setName("dataLink1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(0);
    obj.label5:setTop(30);
    obj.label5:setWidth(35);
    obj.label5:setHeight(20);
    obj.label5:setText("NEP");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(35);
    obj.rectangle4:setTop(25);
    obj.rectangle4:setWidth(25);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(35);
    obj.label6:setTop(25);
    obj.label6:setWidth(25);
    obj.label6:setHeight(25);
    obj.label6:setField("nep");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setLeft(70);
    obj.rectangle5:setTop(25);
    obj.rectangle5:setWidth(100);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(70);
    obj.label7:setTop(25);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setField("alvo");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout2);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(50);
    obj.rectangle6:setWidth(170);
    obj.rectangle6:setHeight(250);
    obj.rectangle6:setColor("#191919");
    obj.rectangle6:setName("rectangle6");

    obj.rclExperience = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclExperience:setParent(obj.layout2);
    obj.rclExperience:setLeft(0);
    obj.rclExperience:setTop(50);
    obj.rclExperience:setWidth(170);
    obj.rclExperience:setHeight(250);
    obj.rclExperience:setName("rclExperience");
    obj.rclExperience:setField("listaDeExperiencia");
    obj.rclExperience:setTemplateForm("frmRecordListFormExperience");
    obj.rclExperience:setLayout("vertical");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.boxDetalhesDoItem);
    obj.layout3:setLeft(210);
    obj.layout3:setTop(30);
    obj.layout3:setWidth(170);
    obj.layout3:setHeight(300);
    obj.layout3:setName("layout3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout3);
    obj.button4:setLeft(0);
    obj.button4:setTop(0);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("+");
    obj.button4:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button4:setName("button4");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(10);
    obj.label8:setTop(5);
    obj.label8:setWidth(70);
    obj.label8:setHeight(20);
    obj.label8:setText("PO");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setLeft(70);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(100);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(70);
    obj.label9:setTop(0);
    obj.label9:setWidth(100);
    obj.label9:setHeight(25);
    obj.label9:setField("PO");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout3);
    obj.rectangle8:setLeft(0);
    obj.rectangle8:setTop(25);
    obj.rectangle8:setWidth(170);
    obj.rectangle8:setHeight(275);
    obj.rectangle8:setColor("#191919");
    obj.rectangle8:setName("rectangle8");

    obj.rclDinheiro = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDinheiro:setParent(obj.layout3);
    obj.rclDinheiro:setLeft(0);
    obj.rclDinheiro:setTop(25);
    obj.rclDinheiro:setWidth(170);
    obj.rclDinheiro:setHeight(275);
    obj.rclDinheiro:setName("rclDinheiro");
    obj.rclDinheiro:setField("listaDeDinheiro");
    obj.rclDinheiro:setTemplateForm("frmRecordListFormDinheiro");
    obj.rclDinheiro:setLayout("vertical");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.boxDetalhesDoItem);
    obj.rectangle9:setLeft(405);
    obj.rectangle9:setTop(30);
    obj.rectangle9:setWidth(310);
    obj.rectangle9:setHeight(185);
    obj.rectangle9:setColor("#212121");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle9);
    obj.label10:setLeft(5);
    obj.label10:setTop(5);
    obj.label10:setWidth(150);
    obj.label10:setHeight(25);
    obj.label10:setText("Presença");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle9);
    obj.label11:setLeft(5);
    obj.label11:setTop(30);
    obj.label11:setWidth(150);
    obj.label11:setHeight(25);
    obj.label11:setText("Atraso Justificado");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle9);
    obj.label12:setLeft(5);
    obj.label12:setTop(55);
    obj.label12:setWidth(150);
    obj.label12:setHeight(25);
    obj.label12:setText("Atraso");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle9);
    obj.label13:setLeft(5);
    obj.label13:setTop(80);
    obj.label13:setWidth(150);
    obj.label13:setHeight(25);
    obj.label13:setText("Falta Justificada");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle9);
    obj.label14:setLeft(5);
    obj.label14:setTop(105);
    obj.label14:setWidth(150);
    obj.label14:setHeight(25);
    obj.label14:setText("Falta");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle9);
    obj.label15:setLeft(5);
    obj.label15:setTop(130);
    obj.label15:setWidth(150);
    obj.label15:setHeight(25);
    obj.label15:setText("Uso");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle9);
    obj.label16:setLeft(5);
    obj.label16:setTop(155);
    obj.label16:setWidth(150);
    obj.label16:setHeight(25);
    obj.label16:setText("Desperdicio");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle9);
    obj.edit3:setLeft(155);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("presenca");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle9);
    obj.edit4:setLeft(155);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("atrasoJustificado");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle9);
    obj.edit5:setLeft(155);
    obj.edit5:setTop(55);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("atraso");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle9);
    obj.edit6:setLeft(155);
    obj.edit6:setTop(80);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("faltaJustificada");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle9);
    obj.edit7:setLeft(155);
    obj.edit7:setTop(105);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("falta");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle9);
    obj.edit8:setLeft(155);
    obj.edit8:setTop(130);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("usos");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle9);
    obj.edit9:setLeft(155);
    obj.edit9:setTop(155);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("desperdicio");
    obj.edit9:setName("edit9");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle9);
    obj.rectangle10:setLeft(205);
    obj.rectangle10:setTop(5);
    obj.rectangle10:setWidth(100);
    obj.rectangle10:setHeight(150);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle9);
    obj.label17:setLeft(205);
    obj.label17:setTop(35);
    obj.label17:setWidth(100);
    obj.label17:setHeight(25);
    obj.label17:setText("PH");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(30);
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle9);
    obj.label18:setLeft(205);
    obj.label18:setTop(70);
    obj.label18:setWidth(100);
    obj.label18:setHeight(25);
    obj.label18:setField("ph");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontSize(30);
    obj.label18:setName("label18");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle9);
    obj.horzLine1:setLeft(230);
    obj.horzLine1:setTop(105);
    obj.horzLine1:setWidth(50);
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle9);
    obj.label19:setLeft(205);
    obj.label19:setTop(105);
    obj.label19:setWidth(100);
    obj.label19:setHeight(25);
    obj.label19:setField("pontos");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle9);
    obj.dataLink2:setFields({'presenca', 'atrasoJustificado', 'atraso', 'falta', 'usos', 'desperdicio'});
    obj.dataLink2:setName("dataLink2");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.boxDetalhesDoItem);
    obj.rectangle11:setLeft(405);
    obj.rectangle11:setTop(225);
    obj.rectangle11:setWidth(310);
    obj.rectangle11:setHeight(310);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle11);
    obj.label20:setLeft(0);
    obj.label20:setTop(145);
    obj.label20:setWidth(310);
    obj.label20:setHeight(20);
    obj.label20:setText("Avatar");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle11);
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

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmGerenciador02);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.popClima = GUI.fromHandle(_obj_newObject("popup"));
    obj.popClima:setParent(obj.scrollBox2);
    obj.popClima:setName("popClima");
    obj.popClima:setWidth(200);
    obj.popClima:setHeight(100);
    obj.popClima:setBackOpacity(0.4);

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popClima);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(70);
    obj.flowPart1:setMaxWidth(70);
    obj.flowPart1:setHeight(15);
    obj.flowPart1:setName("flowPart1");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.flowPart1);
    obj.label21:setAlign("top");
    obj.label21:setFontSize(10);
    obj.label21:setText("Temperatura");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setWordWrap(true);
    obj.label21:setTextTrimming("none");
    obj.label21:setAutoSize(true);
    obj.label21:setName("label21");

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
    obj.comboBox1:setItems({'Glacial', 'Frio', 'Temperado', 'Morno', 'Quente', 'Infernal'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(70);
    obj.flowPart3:setMaxWidth(70);
    obj.flowPart3:setHeight(15);
    obj.flowPart3:setName("flowPart3");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.flowPart3);
    obj.label22:setAlign("top");
    obj.label22:setFontSize(10);
    obj.label22:setText("Precipitação");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setWordWrap(true);
    obj.label22:setTextTrimming("none");
    obj.label22:setAutoSize(true);
    obj.label22:setName("label22");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(100);
    obj.flowPart4:setMaxWidth(150);
    obj.flowPart4:setHeight(20);
    obj.flowPart4:setName("flowPart4");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.flowPart4);
    obj.comboBox2:setAlign("top");
    obj.comboBox2:setFontSize(10);
    obj.comboBox2:setField("chuvas");
    obj.comboBox2:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante'});
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setName("comboBox2");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout1);
    obj.flowPart5:setMinWidth(70);
    obj.flowPart5:setMaxWidth(70);
    obj.flowPart5:setHeight(15);
    obj.flowPart5:setName("flowPart5");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.flowPart5);
    obj.label23:setAlign("top");
    obj.label23:setFontSize(10);
    obj.label23:setText("Areia");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setWordWrap(true);
    obj.label23:setTextTrimming("none");
    obj.label23:setAutoSize(true);
    obj.label23:setName("label23");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout1);
    obj.flowPart6:setMinWidth(100);
    obj.flowPart6:setMaxWidth(150);
    obj.flowPart6:setHeight(20);
    obj.flowPart6:setName("flowPart6");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.flowPart6);
    obj.comboBox3:setAlign("top");
    obj.comboBox3:setFontSize(10);
    obj.comboBox3:setField("areia");
    obj.comboBox3:setItems({'Nenhuma', 'Pouca', 'Razoável', 'Muita', 'Constante'});
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setName("comboBox3");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout1);
    obj.flowPart7:setMinWidth(70);
    obj.flowPart7:setMaxWidth(70);
    obj.flowPart7:setHeight(15);
    obj.flowPart7:setName("flowPart7");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.flowPart7);
    obj.label24:setAlign("top");
    obj.label24:setFontSize(10);
    obj.label24:setText("Ventos");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setWordWrap(true);
    obj.label24:setTextTrimming("none");
    obj.label24:setAutoSize(true);
    obj.label24:setName("label24");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout1);
    obj.flowPart8:setMinWidth(100);
    obj.flowPart8:setMaxWidth(150);
    obj.flowPart8:setHeight(20);
    obj.flowPart8:setName("flowPart8");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.flowPart8);
    obj.comboBox4:setAlign("top");
    obj.comboBox4:setFontSize(10);
    obj.comboBox4:setField("ventos");
    obj.comboBox4:setItems({'Nenhum', 'Pouco', 'Razoável', 'Muito', 'Constante'});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");

    obj.popCelestial = GUI.fromHandle(_obj_newObject("popup"));
    obj.popCelestial:setParent(obj.scrollBox2);
    obj.popCelestial:setName("popCelestial");
    obj.popCelestial:setWidth(200);
    obj.popCelestial:setHeight(190);
    obj.popCelestial:setBackOpacity(0.4);

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popCelestial);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(2);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout2);
    obj.flowPart9:setMinWidth(100);
    obj.flowPart9:setMaxWidth(150);
    obj.flowPart9:setHeight(15);
    obj.flowPart9:setName("flowPart9");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.flowPart9);
    obj.label25:setAlign("top");
    obj.label25:setFontSize(10);
    obj.label25:setText("Eventos Celestes");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setWordWrap(true);
    obj.label25:setTextTrimming("none");
    obj.label25:setAutoSize(true);
    obj.label25:setName("label25");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout2);
    obj.flowPart10:setMinWidth(70);
    obj.flowPart10:setMaxWidth(70);
    obj.flowPart10:setHeight(15);
    obj.flowPart10:setName("flowPart10");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.flowPart10);
    obj.label26:setAlign("top");
    obj.label26:setFontSize(10);
    obj.label26:setText("Sobrenatural");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setWordWrap(true);
    obj.label26:setTextTrimming("none");
    obj.label26:setAutoSize(true);
    obj.label26:setName("label26");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout2);
    obj.flowPart11:setMinWidth(100);
    obj.flowPart11:setMaxWidth(150);
    obj.flowPart11:setHeight(20);
    obj.flowPart11:setName("flowPart11");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.flowPart11);
    obj.comboBox5:setAlign("top");
    obj.comboBox5:setFontSize(10);
    obj.comboBox5:setField("sobrentural");
    obj.comboBox5:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox5:setHorzTextAlign("center");
    obj.comboBox5:setName("comboBox5");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout2);
    obj.flowPart12:setMinWidth(70);
    obj.flowPart12:setMaxWidth(70);
    obj.flowPart12:setHeight(15);
    obj.flowPart12:setName("flowPart12");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.flowPart12);
    obj.label27:setAlign("top");
    obj.label27:setFontSize(10);
    obj.label27:setText("Aurora");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setWordWrap(true);
    obj.label27:setTextTrimming("none");
    obj.label27:setAutoSize(true);
    obj.label27:setName("label27");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout2);
    obj.flowPart13:setMinWidth(100);
    obj.flowPart13:setMaxWidth(150);
    obj.flowPart13:setHeight(20);
    obj.flowPart13:setName("flowPart13");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.flowPart13);
    obj.comboBox6:setAlign("top");
    obj.comboBox6:setFontSize(10);
    obj.comboBox6:setField("auroras");
    obj.comboBox6:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox6:setHorzTextAlign("center");
    obj.comboBox6:setName("comboBox6");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout2);
    obj.flowPart14:setMinWidth(70);
    obj.flowPart14:setMaxWidth(70);
    obj.flowPart14:setHeight(15);
    obj.flowPart14:setName("flowPart14");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.flowPart14);
    obj.label28:setAlign("top");
    obj.label28:setFontSize(10);
    obj.label28:setText("Cometas");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setWordWrap(true);
    obj.label28:setTextTrimming("none");
    obj.label28:setAutoSize(true);
    obj.label28:setName("label28");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout2);
    obj.flowPart15:setMinWidth(100);
    obj.flowPart15:setMaxWidth(150);
    obj.flowPart15:setHeight(20);
    obj.flowPart15:setName("flowPart15");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.flowPart15);
    obj.comboBox7:setAlign("top");
    obj.comboBox7:setFontSize(10);
    obj.comboBox7:setField("cometas");
    obj.comboBox7:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox7:setHorzTextAlign("center");
    obj.comboBox7:setName("comboBox7");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout2);
    obj.flowPart16:setMinWidth(70);
    obj.flowPart16:setMaxWidth(70);
    obj.flowPart16:setHeight(15);
    obj.flowPart16:setName("flowPart16");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.flowPart16);
    obj.label29:setAlign("top");
    obj.label29:setFontSize(10);
    obj.label29:setText("Estrela Cadente");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setWordWrap(true);
    obj.label29:setTextTrimming("none");
    obj.label29:setAutoSize(true);
    obj.label29:setName("label29");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout2);
    obj.flowPart17:setMinWidth(100);
    obj.flowPart17:setMaxWidth(150);
    obj.flowPart17:setHeight(20);
    obj.flowPart17:setName("flowPart17");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.flowPart17);
    obj.comboBox8:setAlign("top");
    obj.comboBox8:setFontSize(10);
    obj.comboBox8:setField("cadentes");
    obj.comboBox8:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox8:setHorzTextAlign("center");
    obj.comboBox8:setName("comboBox8");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout2);
    obj.flowPart18:setMinWidth(70);
    obj.flowPart18:setMaxWidth(70);
    obj.flowPart18:setHeight(15);
    obj.flowPart18:setName("flowPart18");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.flowPart18);
    obj.label30:setAlign("top");
    obj.label30:setFontSize(10);
    obj.label30:setText("Eclipse Lunar");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setWordWrap(true);
    obj.label30:setTextTrimming("none");
    obj.label30:setAutoSize(true);
    obj.label30:setName("label30");

    obj.flowPart19 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart19:setParent(obj.flowLayout2);
    obj.flowPart19:setMinWidth(100);
    obj.flowPart19:setMaxWidth(150);
    obj.flowPart19:setHeight(20);
    obj.flowPart19:setName("flowPart19");

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.flowPart19);
    obj.comboBox9:setAlign("top");
    obj.comboBox9:setFontSize(10);
    obj.comboBox9:setField("lunar");
    obj.comboBox9:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox9:setHorzTextAlign("center");
    obj.comboBox9:setName("comboBox9");

    obj.flowPart20 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart20:setParent(obj.flowLayout2);
    obj.flowPart20:setMinWidth(70);
    obj.flowPart20:setMaxWidth(70);
    obj.flowPart20:setHeight(15);
    obj.flowPart20:setName("flowPart20");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.flowPart20);
    obj.label31:setAlign("top");
    obj.label31:setFontSize(10);
    obj.label31:setText("Eclipse Solar");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setWordWrap(true);
    obj.label31:setTextTrimming("none");
    obj.label31:setAutoSize(true);
    obj.label31:setName("label31");

    obj.flowPart21 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart21:setParent(obj.flowLayout2);
    obj.flowPart21:setMinWidth(100);
    obj.flowPart21:setMaxWidth(150);
    obj.flowPart21:setHeight(20);
    obj.flowPart21:setName("flowPart21");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.flowPart21);
    obj.comboBox10:setAlign("top");
    obj.comboBox10:setFontSize(10);
    obj.comboBox10:setField("solar");
    obj.comboBox10:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox10:setHorzTextAlign("center");
    obj.comboBox10:setName("comboBox10");

    obj.flowPart22 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart22:setParent(obj.flowLayout2);
    obj.flowPart22:setMinWidth(70);
    obj.flowPart22:setMaxWidth(70);
    obj.flowPart22:setHeight(15);
    obj.flowPart22:setName("flowPart22");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.flowPart22);
    obj.label32:setAlign("top");
    obj.label32:setFontSize(10);
    obj.label32:setText("Meteoros");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setWordWrap(true);
    obj.label32:setTextTrimming("none");
    obj.label32:setAutoSize(true);
    obj.label32:setName("label32");

    obj.flowPart23 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart23:setParent(obj.flowLayout2);
    obj.flowPart23:setMinWidth(100);
    obj.flowPart23:setMaxWidth(150);
    obj.flowPart23:setHeight(20);
    obj.flowPart23:setName("flowPart23");

    obj.comboBox11 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox11:setParent(obj.flowPart23);
    obj.comboBox11:setAlign("top");
    obj.comboBox11:setFontSize(10);
    obj.comboBox11:setField("meteoros");
    obj.comboBox11:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox11:setHorzTextAlign("center");
    obj.comboBox11:setName("comboBox11");

    obj.flowPart24 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart24:setParent(obj.flowLayout2);
    obj.flowPart24:setMinWidth(70);
    obj.flowPart24:setMaxWidth(70);
    obj.flowPart24:setHeight(15);
    obj.flowPart24:setName("flowPart24");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.flowPart24);
    obj.label33:setAlign("top");
    obj.label33:setFontSize(10);
    obj.label33:setText("Terremotos");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setWordWrap(true);
    obj.label33:setTextTrimming("none");
    obj.label33:setAutoSize(true);
    obj.label33:setName("label33");

    obj.flowPart25 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart25:setParent(obj.flowLayout2);
    obj.flowPart25:setMinWidth(100);
    obj.flowPart25:setMaxWidth(150);
    obj.flowPart25:setHeight(20);
    obj.flowPart25:setName("flowPart25");

    obj.comboBox12 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox12:setParent(obj.flowPart25);
    obj.comboBox12:setAlign("top");
    obj.comboBox12:setFontSize(10);
    obj.comboBox12:setField("terremotos");
    obj.comboBox12:setItems({'Nenhum', 'Raro', 'Incomum', 'Comum', 'Constante'});
    obj.comboBox12:setHorzTextAlign("center");
    obj.comboBox12:setName("comboBox12");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox2);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(1020);
    obj.layout4:setHeight(345);
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(0);
    obj.layout5:setWidth(250);
    obj.layout5:setHeight(345);
    obj.layout5:setName("layout5");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout5);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setName("rectangle12");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout5);
    obj.label34:setWidth(250);
    obj.label34:setHeight(20);
    obj.label34:setText("MESES");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(25);
    obj.layout6:setWidth(250);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout6);
    obj.button5:setLeft(10);
    obj.button5:setTop(0);
    obj.button5:setWidth(25);
    obj.button5:setHeight(25);
    obj.button5:setText("+");
    obj.button5:setHint("Novo");
    obj.button5:setName("button5");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout6);
    obj.label35:setLeft(115);
    obj.label35:setTop(0);
    obj.label35:setWidth(40);
    obj.label35:setHeight(25);
    obj.label35:setText("Total");
    obj.label35:setHitTest(true);
    obj.label35:setHint("Quantos dias dura o ano.");
    obj.label35:setName("label35");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout6);
    obj.rectangle13:setLeft(165);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(35);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.dias = GUI.fromHandle(_obj_newObject("label"));
    obj.dias:setParent(obj.layout6);
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

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout5);
    obj.label36:setLeft(6);
    obj.label36:setTop(50);
    obj.label36:setWidth(30);
    obj.label36:setHeight(25);
    obj.label36:setText("Nº");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setHitTest(true);
    obj.label36:setHint("Qual a ordem dos meses?");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout5);
    obj.label37:setLeft(45);
    obj.label37:setTop(50);
    obj.label37:setWidth(110);
    obj.label37:setHeight(25);
    obj.label37:setText("Nome");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout5);
    obj.label38:setLeft(155);
    obj.label38:setTop(50);
    obj.label38:setWidth(55);
    obj.label38:setHeight(25);
    obj.label38:setText("Duração");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setHitTest(true);
    obj.label38:setHint("Quantos dias dura esse mês.");
    obj.label38:setName("label38");

    obj.rclMeses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMeses:setParent(obj.layout5);
    obj.rclMeses:setLeft(5);
    obj.rclMeses:setTop(80);
    obj.rclMeses:setWidth(240);
    obj.rclMeses:setHeight(260);
    obj.rclMeses:setName("rclMeses");
    obj.rclMeses:setField("listaMeses");
    obj.rclMeses:setTemplateForm("frmGerenciador02_MES");
    obj.rclMeses:setLayout("vertical");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout5);
    obj.dataLink3:setFields({'duracaoEstacao', 'dias'});
    obj.dataLink3:setName("dataLink3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7:setLeft(255);
    obj.layout7:setTop(0);
    obj.layout7:setWidth(250);
    obj.layout7:setHeight(345);
    obj.layout7:setName("layout7");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout7);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("Black");
    obj.rectangle14:setName("rectangle14");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout7);
    obj.label39:setWidth(250);
    obj.label39:setHeight(20);
    obj.label39:setText("DIAS DA SEMANA");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(25);
    obj.layout8:setWidth(250);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout8);
    obj.button6:setLeft(10);
    obj.button6:setTop(0);
    obj.button6:setWidth(25);
    obj.button6:setHeight(25);
    obj.button6:setText("+");
    obj.button6:setHint("Novo");
    obj.button6:setName("button6");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout8);
    obj.label40:setLeft(125);
    obj.label40:setTop(0);
    obj.label40:setWidth(40);
    obj.label40:setHeight(25);
    obj.label40:setText("Desvio");
    obj.label40:setHitTest(true);
    obj.label40:setHint("O ano 1 começa em quem dia da semana?");
    obj.label40:setName("label40");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout8);
    obj.edit10:setLeft(165);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(35);
    obj.edit10:setHeight(25);
    obj.edit10:setField("desvioSemana");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout7);
    obj.label41:setLeft(6);
    obj.label41:setTop(50);
    obj.label41:setWidth(30);
    obj.label41:setHeight(25);
    obj.label41:setText("Nº");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setHitTest(true);
    obj.label41:setHint("Qual a ordem dos dias da semana?");
    obj.label41:setName("label41");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout7);
    obj.label42:setLeft(35);
    obj.label42:setTop(50);
    obj.label42:setWidth(165);
    obj.label42:setHeight(25);
    obj.label42:setText("Nome");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.rclSemana = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSemana:setParent(obj.layout7);
    obj.rclSemana:setLeft(5);
    obj.rclSemana:setTop(80);
    obj.rclSemana:setWidth(240);
    obj.rclSemana:setHeight(260);
    obj.rclSemana:setName("rclSemana");
    obj.rclSemana:setField("listaSemana");
    obj.rclSemana:setTemplateForm("frmGerenciador02_SEMANA");
    obj.rclSemana:setLayout("vertical");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout4);
    obj.layout9:setLeft(510);
    obj.layout9:setTop(0);
    obj.layout9:setWidth(250);
    obj.layout9:setHeight(345);
    obj.layout9:setName("layout9");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout9);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("Black");
    obj.rectangle15:setName("rectangle15");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout9);
    obj.label43:setWidth(250);
    obj.label43:setHeight(20);
    obj.label43:setText("LUAS");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setLeft(0);
    obj.layout10:setTop(25);
    obj.layout10:setWidth(250);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout10);
    obj.button7:setLeft(10);
    obj.button7:setTop(0);
    obj.button7:setWidth(25);
    obj.button7:setHeight(25);
    obj.button7:setText("+");
    obj.button7:setHint("Novo");
    obj.button7:setName("button7");

    obj.celestialBt = GUI.fromHandle(_obj_newObject("button"));
    obj.celestialBt:setParent(obj.layout10);
    obj.celestialBt:setLeft(35);
    obj.celestialBt:setTop(0);
    obj.celestialBt:setWidth(25);
    obj.celestialBt:setHeight(25);
    obj.celestialBt:setText("i");
    obj.celestialBt:setName("celestialBt");
    obj.celestialBt:setHint("Eventos Celestiais");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout9);
    obj.label44:setLeft(15);
    obj.label44:setTop(50);
    obj.label44:setWidth(110);
    obj.label44:setHeight(25);
    obj.label44:setText("Nome");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout9);
    obj.label45:setLeft(120);
    obj.label45:setTop(50);
    obj.label45:setWidth(55);
    obj.label45:setHeight(25);
    obj.label45:setText("Ciclo");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setHitTest(true);
    obj.label45:setHint("Quantos dias leva o ciclo lunar?");
    obj.label45:setName("label45");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout9);
    obj.label46:setLeft(155);
    obj.label46:setTop(50);
    obj.label46:setWidth(55);
    obj.label46:setHeight(25);
    obj.label46:setText("Desvio");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setHitTest(true);
    obj.label46:setHint("No ano 1 em que dia começa o ciclo lunar (lua cheia)?");
    obj.label46:setName("label46");

    obj.rclLuas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclLuas:setParent(obj.layout9);
    obj.rclLuas:setLeft(5);
    obj.rclLuas:setTop(80);
    obj.rclLuas:setWidth(240);
    obj.rclLuas:setHeight(260);
    obj.rclLuas:setName("rclLuas");
    obj.rclLuas:setField("listaLuas");
    obj.rclLuas:setTemplateForm("frmGerenciador02_LUA");
    obj.rclLuas:setLayout("vertical");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout4);
    obj.layout11:setLeft(765);
    obj.layout11:setTop(0);
    obj.layout11:setWidth(250);
    obj.layout11:setHeight(345);
    obj.layout11:setName("layout11");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout11);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("Black");
    obj.rectangle16:setName("rectangle16");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout11);
    obj.label47:setWidth(250);
    obj.label47:setHeight(20);
    obj.label47:setText("ESTAÇÕES");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(25);
    obj.layout12:setWidth(250);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout12);
    obj.button8:setLeft(10);
    obj.button8:setTop(0);
    obj.button8:setWidth(25);
    obj.button8:setHeight(25);
    obj.button8:setText("+");
    obj.button8:setHint("Novo");
    obj.button8:setName("button8");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout12);
    obj.label48:setLeft(125);
    obj.label48:setTop(0);
    obj.label48:setWidth(40);
    obj.label48:setHeight(25);
    obj.label48:setText("Desvio");
    obj.label48:setHitTest(true);
    obj.label48:setHint("Em que dia do ano começa a primeira estação?");
    obj.label48:setName("label48");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout12);
    obj.edit11:setLeft(165);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(35);
    obj.edit11:setHeight(25);
    obj.edit11:setField("desvioEstacao");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout11);
    obj.label49:setLeft(6);
    obj.label49:setTop(50);
    obj.label49:setWidth(30);
    obj.label49:setHeight(25);
    obj.label49:setText("Nº");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setHitTest(true);
    obj.label49:setHint("Qual a ordem das estações?");
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout11);
    obj.label50:setLeft(45);
    obj.label50:setTop(50);
    obj.label50:setWidth(85);
    obj.label50:setHeight(25);
    obj.label50:setText("Nome");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout11);
    obj.label51:setLeft(130);
    obj.label51:setTop(50);
    obj.label51:setWidth(55);
    obj.label51:setHeight(25);
    obj.label51:setText("Duração");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setHitTest(true);
    obj.label51:setHint("Quantos dias dura essa estação?");
    obj.label51:setName("label51");

    obj.rclEstacoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEstacoes:setParent(obj.layout11);
    obj.rclEstacoes:setLeft(5);
    obj.rclEstacoes:setTop(80);
    obj.rclEstacoes:setWidth(240);
    obj.rclEstacoes:setHeight(260);
    obj.rclEstacoes:setName("rclEstacoes");
    obj.rclEstacoes:setField("listaEstacoes");
    obj.rclEstacoes:setTemplateForm("frmGerenciador02_ESTACAO");
    obj.rclEstacoes:setLayout("vertical");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox2);
    obj.layout13:setLeft(1020);
    obj.layout13:setTop(0);
    obj.layout13:setWidth(210);
    obj.layout13:setHeight(345);
    obj.layout13:setName("layout13");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout13);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("Black");
    obj.rectangle17:setName("rectangle17");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout13);
    obj.label52:setLeft(5);
    obj.label52:setTop(5);
    obj.label52:setWidth(30);
    obj.label52:setHeight(25);
    obj.label52:setText("Dia");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setLeft(5);
    obj.edit12:setTop(30);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setField("dia");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout13);
    obj.label53:setLeft(35);
    obj.label53:setTop(5);
    obj.label53:setWidth(30);
    obj.label53:setHeight(25);
    obj.label53:setText("Mês");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setLeft(35);
    obj.edit13:setTop(30);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setField("mes");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout13);
    obj.label54:setLeft(65);
    obj.label54:setTop(5);
    obj.label54:setWidth(40);
    obj.label54:setHeight(25);
    obj.label54:setText("Ano");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout13);
    obj.edit14:setLeft(65);
    obj.edit14:setTop(30);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setField("ano");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout13);
    obj.label55:setLeft(105);
    obj.label55:setTop(5);
    obj.label55:setWidth(100);
    obj.label55:setHeight(25);
    obj.label55:setText("Era");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout13);
    obj.edit15:setLeft(105);
    obj.edit15:setTop(30);
    obj.edit15:setWidth(100);
    obj.edit15:setHeight(25);
    obj.edit15:setField("era");
    obj.edit15:setName("edit15");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout13);
    obj.button9:setLeft(5);
    obj.button9:setTop(55);
    obj.button9:setWidth(100);
    obj.button9:setHeight(25);
    obj.button9:setText("Avançar");
    obj.button9:setHint("Avança X dias no Calandario.");
    obj.button9:setName("button9");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout13);
    obj.edit16:setLeft(105);
    obj.edit16:setTop(55);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("add");
    obj.edit16:setName("edit16");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout13);
    obj.label56:setLeft(160);
    obj.label56:setTop(55);
    obj.label56:setWidth(45);
    obj.label56:setHeight(25);
    obj.label56:setText("Dias");
    obj.label56:setName("label56");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout13);
    obj.dataLink4:setField("add");
    obj.dataLink4:setDefaultValue("1");
    obj.dataLink4:setName("dataLink4");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout13);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(80);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("data");
    obj.textEditor1:setName("textEditor1");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(180);
    obj.layout14:setWidth(200);
    obj.layout14:setHeight(155);
    obj.layout14:setName("layout14");

    obj.dataLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.dataLabel:setParent(obj.layout14);
    obj.dataLabel:setLeft(0);
    obj.dataLabel:setTop(0);
    obj.dataLabel:setWidth(200);
    obj.dataLabel:setHeight(20);
    obj.dataLabel:setField("dataLabel");
    obj.dataLabel:setName("dataLabel");
    obj.dataLabel:setFontSize(10);

    obj.estacaoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.estacaoLabel:setParent(obj.layout14);
    obj.estacaoLabel:setLeft(0);
    obj.estacaoLabel:setTop(20);
    obj.estacaoLabel:setWidth(200);
    obj.estacaoLabel:setHeight(20);
    obj.estacaoLabel:setField("estacaoLabel");
    obj.estacaoLabel:setName("estacaoLabel");
    obj.estacaoLabel:setFontSize(10);

    obj.temperaturaLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.temperaturaLabel:setParent(obj.layout14);
    obj.temperaturaLabel:setLeft(0);
    obj.temperaturaLabel:setTop(40);
    obj.temperaturaLabel:setWidth(200);
    obj.temperaturaLabel:setHeight(20);
    obj.temperaturaLabel:setField("temperaturaLabel");
    obj.temperaturaLabel:setName("temperaturaLabel");
    obj.temperaturaLabel:setFontSize(10);
    obj.temperaturaLabel:setHitTest(true);

    obj.precipitacaoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.precipitacaoLabel:setParent(obj.layout14);
    obj.precipitacaoLabel:setLeft(0);
    obj.precipitacaoLabel:setTop(60);
    obj.precipitacaoLabel:setWidth(200);
    obj.precipitacaoLabel:setHeight(20);
    obj.precipitacaoLabel:setField("precipitacaoLabel");
    obj.precipitacaoLabel:setName("precipitacaoLabel");
    obj.precipitacaoLabel:setFontSize(10);
    obj.precipitacaoLabel:setHitTest(true);

    obj.ventoLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.ventoLabel:setParent(obj.layout14);
    obj.ventoLabel:setLeft(0);
    obj.ventoLabel:setTop(80);
    obj.ventoLabel:setWidth(200);
    obj.ventoLabel:setHeight(20);
    obj.ventoLabel:setField("ventoLabel");
    obj.ventoLabel:setName("ventoLabel");
    obj.ventoLabel:setFontSize(10);
    obj.ventoLabel:setHitTest(true);

    obj.luasLabel = GUI.fromHandle(_obj_newObject("label"));
    obj.luasLabel:setParent(obj.layout14);
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
    obj.eventosLabel:setParent(obj.layout14);
    obj.eventosLabel:setLeft(0);
    obj.eventosLabel:setTop(135);
    obj.eventosLabel:setWidth(200);
    obj.eventosLabel:setHeight(20);
    obj.eventosLabel:setField("eventosLabel");
    obj.eventosLabel:setName("eventosLabel");
    obj.eventosLabel:setFontSize(10);
    obj.eventosLabel:setHitTest(true);

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout13);
    obj.dataLink5:setFields({'dia', 'mes', 'ano', 'dias', 'duracaoEstacao', 'desvioSemana', 'desvioEstacao'});
    obj.dataLink5:setName("dataLink5");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("NPCs");
    obj.tab3:setName("tab3");

    obj.Listade_NPC_Dock = GUI.fromHandle(_obj_newObject("form"));
    obj.Listade_NPC_Dock:setParent(obj.tab3);
    obj.Listade_NPC_Dock:setName("Listade_NPC_Dock");
    obj.Listade_NPC_Dock:setAlign("client");
    obj.Listade_NPC_Dock:setTheme("dark");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.Listade_NPC_Dock);
    obj.dataLink6:setField("CorIndex");
    obj.dataLink6:setDefaultValue("0");
    obj.dataLink6:setName("dataLink6");


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
	


    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.Listade_NPC_Dock);
    obj.layout15:setAlign("client");
    obj.layout15:setVisible(false);
    obj.layout15:setName("layout15");

    obj.Config = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.Config:setParent(obj.layout15);
    obj.Config:setTitle("Configuração de Barrinhas");
    obj.Config:setName("Config");
    obj.Config:setWidth(406);
    obj.Config:setHeight(190);

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.Config);
    obj.label57:setAlign("top");
    obj.label57:setHeight(18);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Configurações de Barrinhas");
    lfm_setPropAsString(obj.label57, "fontStyle",  "bold");
    obj.label57:setFontColor("white");
    obj.label57:setName("label57");

    obj.dcsTituloEAbas = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsTituloEAbas:setParent(obj.Config);
    obj.dcsTituloEAbas:setName("dcsTituloEAbas");
    obj.dcsTituloEAbas:setAlign("top");
    obj.dcsTituloEAbas:setHeight(18);
    obj.dcsTituloEAbas:setMargins({top=4});

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.dcsTituloEAbas);
    obj.label58:setLeft(5);
    obj.label58:setFontSize(12);
    obj.label58:setAutoSize(true);
    obj.label58:setText("Título da Aba:");
    obj.label58:setName("label58");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.dcsTituloEAbas);
    obj.edit17:setLeft(85);
    obj.edit17:setHeight(18);
    obj.edit17:setFontColor("white");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setFontSize(12);
    obj.edit17:setWidth(108);
    obj.edit17:setField("NomeDaOpcao");
    obj.edit17:setName("edit17");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.dcsTituloEAbas);
    obj.label59:setLeft(210);
    obj.label59:setFontSize(12);
    obj.label59:setAutoSize(true);
    obj.label59:setText("Organização:");
    obj.label59:setMargins({left=12});
    obj.label59:setName("label59");

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

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.Config);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(18);
    obj.layout16:setMargins({top=4});
    obj.layout16:setName("layout16");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout16);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(64);
    obj.layout17:setName("layout17");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout16);
    obj.label60:setAlign("left");
    obj.label60:setFontSize(12);
    obj.label60:setWidth(108);
    obj.label60:setText("Nome da Barrinha");
    obj.label60:setMargins({left=4});
    obj.label60:setName("label60");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout16);
    obj.label61:setAlign("left");
    obj.label61:setFontSize(12);
    obj.label61:setWidth(26);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setText("Cor");
    obj.label61:setMargins({left=4});
    obj.label61:setName("label61");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout16);
    obj.label62:setAlign("left");
    obj.label62:setFontSize(12);
    obj.label62:setWidth(82);
    obj.label62:setText("Visibilidade");
    obj.label62:setMargins({left=4});
    obj.label62:setName("label62");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout16);
    obj.label63:setAlign("left");
    obj.label63:setFontSize(12);
    obj.label63:setWidth(108);
    obj.label63:setText("Tipo de Números");
    obj.label63:setMargins({left=4});
    obj.label63:setName("label63");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.Config);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(18);
    obj.layout18:setMargins({top=4});
    obj.layout18:setName("layout18");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout18);
    obj.label64:setAlign("left");
    obj.label64:setFontSize(12);
    obj.label64:setText("Barrinha 1:");
    obj.label64:setHorzTextAlign("trailing");
    obj.label64:setWidth(64);
    obj.label64:setName("label64");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout18);
    obj.edit18:setAlign("left");
    obj.edit18:setFontSize(12);
    obj.edit18:setWidth(108);
    obj.edit18:setVertTextAlign("trailing");
    obj.edit18:setField("NomeBarrinha1");
    obj.edit18:setText("Barrinha 1");
    obj.edit18:setMargins({left=4});
    obj.edit18:setName("edit18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(26);
    obj.layout19:setMargins({left=4});
    obj.layout19:setName("layout19");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout19);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("white");
    obj.rectangle18:setHitTest(true);
    obj.rectangle18:setMargins({left=4, right=4});
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle18);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle19:setHitTest(true);
    obj.rectangle19:setName("rectangle19");

    obj.CorBarrinha1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.rectangle19);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("#808080");
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha1:setHitTest(true);

    obj.comboBox14 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox14:setParent(obj.layout18);
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
    obj.comboBox15:setParent(obj.layout18);
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

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout18);
    obj.dataLink7:setField("CorBarrinha1");
    obj.dataLink7:setDefaultValue("#808080");
    obj.dataLink7:setName("dataLink7");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.Config);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(18);
    obj.layout20:setMargins({top=4});
    obj.layout20:setName("layout20");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout20);
    obj.label65:setAlign("left");
    obj.label65:setFontSize(12);
    obj.label65:setText("Barrinha 1:");
    obj.label65:setHorzTextAlign("trailing");
    obj.label65:setWidth(64);
    obj.label65:setName("label65");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout20);
    obj.edit19:setAlign("left");
    obj.edit19:setFontSize(12);
    obj.edit19:setWidth(108);
    obj.edit19:setVertTextAlign("trailing");
    obj.edit19:setField("NomeBarrinha2");
    obj.edit19:setText("Barrinha 2");
    obj.edit19:setMargins({left=4});
    obj.edit19:setName("edit19");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(26);
    obj.layout21:setMargins({left=4});
    obj.layout21:setName("layout21");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout21);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("white");
    obj.rectangle20:setHitTest(true);
    obj.rectangle20:setMargins({left=4, right=4});
    obj.rectangle20:setName("rectangle20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle20);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle21:setHitTest(true);
    obj.rectangle21:setName("rectangle21");

    obj.CorBarrinha2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.rectangle21);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("#808080");
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha2:setHitTest(true);

    obj.comboBox16 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox16:setParent(obj.layout20);
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
    obj.comboBox17:setParent(obj.layout20);
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

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout20);
    obj.dataLink8:setField("CorBarrinha2");
    obj.dataLink8:setDefaultValue("#808080");
    obj.dataLink8:setName("dataLink8");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.Config);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(18);
    obj.layout22:setMargins({top=4});
    obj.layout22:setName("layout22");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout22);
    obj.label66:setAlign("left");
    obj.label66:setFontSize(12);
    obj.label66:setText("Barrinha 1:");
    obj.label66:setHorzTextAlign("trailing");
    obj.label66:setWidth(64);
    obj.label66:setName("label66");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout22);
    obj.edit20:setAlign("left");
    obj.edit20:setFontSize(12);
    obj.edit20:setWidth(108);
    obj.edit20:setVertTextAlign("trailing");
    obj.edit20:setField("NomeBarrinha3");
    obj.edit20:setText("Barrinha 3");
    obj.edit20:setMargins({left=4});
    obj.edit20:setName("edit20");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(26);
    obj.layout23:setMargins({left=4});
    obj.layout23:setName("layout23");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout23);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("white");
    obj.rectangle22:setHitTest(true);
    obj.rectangle22:setMargins({left=4, right=4});
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle22);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle23:setHitTest(true);
    obj.rectangle23:setName("rectangle23");

    obj.CorBarrinha3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.rectangle23);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("#808080");
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha3:setHitTest(true);

    obj.comboBox18 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox18:setParent(obj.layout22);
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
    obj.comboBox19:setParent(obj.layout22);
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

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout22);
    obj.dataLink9:setField("CorBarrinha3");
    obj.dataLink9:setDefaultValue("#808080");
    obj.dataLink9:setName("dataLink9");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.Config);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(18);
    obj.layout24:setMargins({top=4});
    obj.layout24:setName("layout24");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout24);
    obj.label67:setAlign("left");
    obj.label67:setFontSize(12);
    obj.label67:setText("Barrinha 1:");
    obj.label67:setHorzTextAlign("trailing");
    obj.label67:setWidth(64);
    obj.label67:setName("label67");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout24);
    obj.edit21:setAlign("left");
    obj.edit21:setFontSize(12);
    obj.edit21:setWidth(108);
    obj.edit21:setVertTextAlign("trailing");
    obj.edit21:setField("NomeBarrinha4");
    obj.edit21:setText("Barrinha 4");
    obj.edit21:setMargins({left=4});
    obj.edit21:setName("edit21");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(26);
    obj.layout25:setMargins({left=4});
    obj.layout25:setName("layout25");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout25);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("white");
    obj.rectangle24:setHitTest(true);
    obj.rectangle24:setMargins({left=4, right=4});
    obj.rectangle24:setName("rectangle24");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle24);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle25:setHitTest(true);
    obj.rectangle25:setName("rectangle25");

    obj.CorBarrinha4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha4:setParent(obj.rectangle25);
    obj.CorBarrinha4:setName("CorBarrinha4");
    obj.CorBarrinha4:setColor("#808080");
    obj.CorBarrinha4:setAlign("client");
    obj.CorBarrinha4:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha4:setHitTest(true);

    obj.comboBox20 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox20:setParent(obj.layout24);
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
    obj.comboBox21:setParent(obj.layout24);
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

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout24);
    obj.dataLink10:setField("CorBarrinha4");
    obj.dataLink10:setDefaultValue("#808080");
    obj.dataLink10:setName("dataLink10");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.Config);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(24);
    obj.layout26:setMargins({top=8});
    obj.layout26:setName("layout26");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout26);
    obj.checkBox1:setMargins({left=4});
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setField("EnviarNoChat");
    obj.checkBox1:setWidth(180);
    obj.checkBox1:setFontSize(12);
    obj.checkBox1:setText("Enviar alterações ao chat");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout26);
    obj.dataLink11:setField("EnviarNoChat");
    obj.dataLink11:setDefaultValue("false");
    obj.dataLink11:setName("dataLink11");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout26);
    obj.button10:setAlign("right");
    obj.button10:setWidth(80);
    obj.button10:setText("OK!");
    obj.button10:setMargins({right=8});
    obj.button10:setName("button10");

    obj.SelectCor = GUI.fromHandle(_obj_newObject("popup"));
    obj.SelectCor:setParent(obj.Config);
    obj.SelectCor:setName("SelectCor");
    obj.SelectCor:setWidth(192);
    obj.SelectCor:setHeight(100);

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.SelectCor);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(24);
    obj.layout27:setName("layout27");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout27);
    obj.label68:setAlign("client");
    obj.label68:setText("Selecione a Cor:");
    obj.label68:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label68, "fontStyle",  "bold");
    obj.label68:setName("label68");

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

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.Selected);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("white");
    obj.rectangle26:setName("rectangle26");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.rectangle26);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle27:setName("rectangle27");

    obj.Flow = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.Flow:setParent(obj.Nha);
    obj.Flow:setName("Flow");
    obj.Flow:setAlign("client");
    obj.Flow:setOrientation("horizontal");
    obj.Flow:setMaxControlsPerLine(8);
    obj.Flow:setHitTest(true);
    obj.Flow:setCanFocus(true);

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.Flow);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(20);
    obj.layout28:setHeight(20);
    obj.layout28:setHitTest(true);
    obj.layout28:setName("layout28");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout28);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle28:setHitTest(true);
    obj.rectangle28:setColor("#acacac");
    obj.rectangle28:setName("rectangle28");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.Flow);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(20);
    obj.layout29:setHeight(20);
    obj.layout29:setHitTest(true);
    obj.layout29:setName("layout29");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout29);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle29:setHitTest(true);
    obj.rectangle29:setColor("#5959ff");
    obj.rectangle29:setName("rectangle29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.Flow);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(20);
    obj.layout30:setHeight(20);
    obj.layout30:setHitTest(true);
    obj.layout30:setName("layout30");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout30);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle30:setHitTest(true);
    obj.rectangle30:setColor("#59ff59");
    obj.rectangle30:setName("rectangle30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.Flow);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(20);
    obj.layout31:setHeight(20);
    obj.layout31:setHitTest(true);
    obj.layout31:setName("layout31");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout31);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle31:setHitTest(true);
    obj.rectangle31:setColor("#ff5959");
    obj.rectangle31:setName("rectangle31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.Flow);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(20);
    obj.layout32:setHeight(20);
    obj.layout32:setHitTest(true);
    obj.layout32:setName("layout32");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout32);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle32:setHitTest(true);
    obj.rectangle32:setColor("#ff59ff");
    obj.rectangle32:setName("rectangle32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.Flow);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(20);
    obj.layout33:setHeight(20);
    obj.layout33:setHitTest(true);
    obj.layout33:setName("layout33");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout33);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle33:setHitTest(true);
    obj.rectangle33:setColor("#ffac59");
    obj.rectangle33:setName("rectangle33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.Flow);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(20);
    obj.layout34:setHeight(20);
    obj.layout34:setHitTest(true);
    obj.layout34:setName("layout34");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout34);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle34:setHitTest(true);
    obj.rectangle34:setColor("#ffff59");
    obj.rectangle34:setName("rectangle34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.Flow);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(20);
    obj.layout35:setHeight(20);
    obj.layout35:setHitTest(true);
    obj.layout35:setName("layout35");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout35);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle35:setHitTest(true);
    obj.rectangle35:setColor("#59ffff");
    obj.rectangle35:setName("rectangle35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.Flow);
    obj.layout36:setAlign("left");
    obj.layout36:setWidth(20);
    obj.layout36:setHeight(20);
    obj.layout36:setHitTest(true);
    obj.layout36:setName("layout36");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout36);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle36:setHitTest(true);
    obj.rectangle36:setColor("#ffd159");
    obj.rectangle36:setName("rectangle36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.Flow);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(20);
    obj.layout37:setHeight(20);
    obj.layout37:setHitTest(true);
    obj.layout37:setName("layout37");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout37);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle37:setHitTest(true);
    obj.rectangle37:setColor("#5990ff");
    obj.rectangle37:setName("rectangle37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.Flow);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(20);
    obj.layout38:setHeight(20);
    obj.layout38:setHitTest(true);
    obj.layout38:setName("layout38");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout38);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle38:setHitTest(true);
    obj.rectangle38:setColor("#f4c264");
    obj.rectangle38:setName("rectangle38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.Flow);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(20);
    obj.layout39:setHeight(20);
    obj.layout39:setHitTest(true);
    obj.layout39:setName("layout39");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout39);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle39:setHitTest(true);
    obj.rectangle39:setColor("#de7a7a");
    obj.rectangle39:setName("rectangle39");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.Flow);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(20);
    obj.layout40:setHeight(20);
    obj.layout40:setHitTest(true);
    obj.layout40:setName("layout40");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout40);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle40:setHitTest(true);
    obj.rectangle40:setColor("#cb83d6");
    obj.rectangle40:setName("rectangle40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.Flow);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(20);
    obj.layout41:setHeight(20);
    obj.layout41:setHitTest(true);
    obj.layout41:setName("layout41");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout41);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle41:setHitTest(true);
    obj.rectangle41:setColor("#f3658a");
    obj.rectangle41:setName("rectangle41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.Flow);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(20);
    obj.layout42:setHeight(20);
    obj.layout42:setHitTest(true);
    obj.layout42:setName("layout42");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout42);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle42:setHitTest(true);
    obj.rectangle42:setColor("#8cecb3");
    obj.rectangle42:setName("rectangle42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.Flow);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(20);
    obj.layout43:setHeight(20);
    obj.layout43:setHitTest(true);
    obj.layout43:setName("layout43");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout43);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle43:setHitTest(true);
    obj.rectangle43:setColor("#ed846b");
    obj.rectangle43:setName("rectangle43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.SelectCor);
    obj.layout44:setAlign("bottom");
    obj.layout44:setHeight(24);
    obj.layout44:setName("layout44");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout44);
    obj.button11:setAlign("right");
    obj.button11:setText("OK!");
    obj.button11:setMargins({right=4});
    obj.button11:setName("button11");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.Listade_NPC_Dock);
    obj.rectangle44:setColor("#0f0f0f");
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setPadding({top=4, left=4});
    obj.rectangle44:setName("rectangle44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle44);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(24);
    obj.layout45:setName("layout45");

    obj.NovaAbadeNPCs = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovaAbadeNPCs:setParent(obj.layout45);
    obj.NovaAbadeNPCs:setMargins({left=4});
    obj.NovaAbadeNPCs:setAlign("left");
    obj.NovaAbadeNPCs:setWidth(24);
    obj.NovaAbadeNPCs:setName("NovaAbadeNPCs");
    obj.NovaAbadeNPCs:setImageChecked("/GerenciadorDeCampanha/images/addlista.png");
    obj.NovaAbadeNPCs:setImageUnchecked("/GerenciadorDeCampanha/images/addlista.png");

    obj.comboBoxFalsa = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.comboBoxFalsa:setParent(obj.layout45);
    obj.comboBoxFalsa:setAlign("left");
    obj.comboBoxFalsa:setMargins({left=8});
    obj.comboBoxFalsa:setName("comboBoxFalsa");
    obj.comboBoxFalsa:setWidth(128);
    obj.comboBoxFalsa:setHeight(20);
    obj.comboBoxFalsa:setHitTest(true);

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.comboBoxFalsa);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("#333333");
    obj.rectangle45:setXradius(2);
    obj.rectangle45:setYradius(2);
    obj.rectangle45:setHitTest(true);
    obj.rectangle45:setName("rectangle45");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle45);
    obj.label69:setFontColor("white");
    obj.label69:setAlign("client");
    obj.label69:setMargins({left=8});
    obj.label69:setVertTextAlign("center");
    obj.label69:setText("Opções");
    obj.label69:setField("NomeDaOpcao");
    obj.label69:setHitTest(true);
    obj.label69:setName("label69");

    obj.path1 = GUI.fromHandle(_obj_newObject("path"));
    obj.path1:setParent(obj.rectangle45);
    obj.path1:setAlign("right");
    obj.path1:setWidth(16);
    obj.path1:setMargins({right=6, left=6, top=8, bottom=8});
    obj.path1:setColor("orange");
    obj.path1:setPathData("M 100 100 L 300 100 L 200 300 z");
    obj.path1:setName("path1");

    obj.dcsMain = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsMain:setParent(obj.rectangle44);
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

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.ListaDeNPCs);
    obj.layout46:setVisible(false);
    obj.layout46:setName("layout46");

    obj.dropDownFalso2 = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.dropDownFalso2:setParent(obj.layout46);
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

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.ListaDeNPCs);
    obj.rectangle46:setColor("#0f0f0f");
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setName("rectangle46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle46);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(24);
    obj.layout47:setMargins({top=4, left=2});
    obj.layout47:setName("layout47");

    obj.Configurar = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Configurar:setParent(obj.layout47);
    obj.Configurar:setMargins({left=4});
    obj.Configurar:setAlign("left");
    obj.Configurar:setWidth(24);
    obj.Configurar:setHint("Configurações da Lista");
    obj.Configurar:setName("Configurar");
    obj.Configurar:setImageChecked("/GerenciadorDeCampanha/images/config.png");
    obj.Configurar:setImageUnchecked("/GerenciadorDeCampanha/images/config.png");

    obj.NovoNPC = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovoNPC:setParent(obj.layout47);
    obj.NovoNPC:setMargins({left=4});
    obj.NovoNPC:setAlign("left");
    obj.NovoNPC:setWidth(24);
    obj.NovoNPC:setHint("Adicionar novo NPC");
    obj.NovoNPC:setName("NovoNPC");
    obj.NovoNPC:setImageChecked("/GerenciadorDeCampanha/images/addnpc.png");
    obj.NovoNPC:setImageUnchecked("/GerenciadorDeCampanha/images/addnpc.png");

    obj.Organizar = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Organizar:setParent(obj.layout47);
    obj.Organizar:setMargins({left=4});
    obj.Organizar:setAlign("left");
    obj.Organizar:setWidth(24);
    obj.Organizar:setHint("Ordenar Lista de NPCs");
    obj.Organizar:setName("Organizar");
    obj.Organizar:setImageChecked("/GerenciadorDeCampanha/images/organize.png");
    obj.Organizar:setImageUnchecked("/GerenciadorDeCampanha/images/organize.png");

    obj.MainClient = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.MainClient:setParent(obj.rectangle46);
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

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle46);
    obj.layout48:setAlign("bottom");
    obj.layout48:setHeight(32);
    obj.layout48:setName("layout48");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout48);
    obj.label70:setAlign("right");
    lfm_setPropAsString(obj.label70, "fontStyle",  "italic");
    obj.label70:setFontSize(12);
    obj.label70:setOpacity(0.8);
    obj.label70:setAutoSize(true);
    obj.label70:setText("Criado por Mia\nEditado por Ambesek");
    obj.label70:setName("label70");


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

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.Listade_NPC_Dock);
    obj.dataLink12:setField("opcaoEscolhida");
    obj.dataLink12:setDefaultValue("Opções");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.Listade_NPC_Dock);
    obj.dataLink13:setFields({'VisibBarrinha1', 'VisibBarrinha2', 'VisibBarrinha3', 'VisibBarrinha4'});
    obj.dataLink13:setDefaultValues({'a', 'a', 'a', 'a'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.Listade_NPC_Dock);
    obj.dataLink14:setFields({'NumerosBarrinha1', 'NumerosBarrinha2', 'NumerosBarrinha3', 'NumerosBarrinha4'});
    obj.dataLink14:setDefaultValues({'x', 'x', 'x', 'x'});
    obj.dataLink14:setName("dataLink14");

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

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.frmCombatTracker);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(16);
    obj.layout49:setPadding({left=2, right=2});
    obj.layout49:setName("layout49");
    obj.layout49:setMargins({left=2, right=2});

    obj.layHeader0 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layHeader0:setParent(obj.layout49);
    obj.layHeader0:setName("layHeader0");
    obj.layHeader0:setWidth(23);
    obj.layHeader0:setAlign("left");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout49);
    obj.label71:setText(" Teste   Nome");
    obj.label71:setName("label71");
    obj.label71:setFontSize(11);
    obj.label71:setMargins({left=3});
    obj.label71:setWidth(28);
    obj.label71:setAlign("client");

    obj.layRightAlinedTitle = GUI.fromHandle(_obj_newObject("layout"));
    obj.layRightAlinedTitle:setParent(obj.layout49);
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

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layTrackerBottom);
    obj.button12:setText("Próx. turno");
    obj.button12:setFontSize(11);
    obj.button12:setWidth(70);
    obj.button12:setAlign("left");
    obj.button12:setName("button12");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layTrackerBottom);
    obj.layout50:setAlign("right");
    obj.layout50:setWidth(68);
    obj.layout50:setName("layout50");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout50);
    obj.label72:setAlign("left");
    obj.label72:setAutoSize(true);
    obj.label72:setText("Rodada");
    obj.label72:setWordWrap(false);
    obj.label72:setFontSize(11);
    obj.label72:setName("label72");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout50);
    obj.edit22:setField("rodada");
    obj.edit22:setAlign("client");
    obj.edit22:setType("number");
    obj.edit22:setMin(0);
    obj.edit22:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit22, "fontStyle",  "bold");
    obj.edit22:setName("edit22");


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

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.scrollBox5);
    obj.rectangle47:setLeft(0);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(830);
    obj.rectangle47:setHeight(20);
    obj.rectangle47:setColor("Black");
    obj.rectangle47:setName("rectangle47");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle47);
    obj.label73:setLeft(0);
    obj.label73:setTop(0);
    obj.label73:setWidth(830);
    obj.label73:setHeight(20);
    obj.label73:setText("LISTA DE AVENTURAS");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.rectangle47);
    obj.button13:setLeft(0);
    obj.button13:setTop(0);
    obj.button13:setWidth(20);
    obj.button13:setHeight(20);
    obj.button13:setText("+");
    obj.button13:setHint("Nova Aventura");
    obj.button13:setName("button13");

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

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.scrollBox5);
    obj.rectangle48:setLeft(835);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(310);
    obj.rectangle48:setHeight(615);
    obj.rectangle48:setColor("Black");
    obj.rectangle48:setName("rectangle48");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle48);
    obj.label74:setLeft(5);
    obj.label74:setTop(5);
    obj.label74:setWidth(310);
    obj.label74:setHeight(25);
    obj.label74:setText("SESSÕES");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle48);
    obj.label75:setLeft(5);
    obj.label75:setTop(30);
    obj.label75:setWidth(30);
    obj.label75:setHeight(25);
    obj.label75:setText("Nº");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle48);
    obj.label76:setLeft(35);
    obj.label76:setTop(30);
    obj.label76:setWidth(80);
    obj.label76:setHeight(25);
    obj.label76:setText("Data");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle48);
    obj.label77:setLeft(165);
    obj.label77:setTop(30);
    obj.label77:setWidth(100);
    obj.label77:setHeight(25);
    obj.label77:setText("Log");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.rectangle48);
    obj.button14:setLeft(265);
    obj.button14:setTop(5);
    obj.button14:setWidth(25);
    obj.button14:setHeight(25);
    obj.button14:setText("+");
    obj.button14:setHint("Novo");
    obj.button14:setName("button14");

    obj.rclSessoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSessoes:setParent(obj.rectangle48);
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

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.scrollBox7);
    obj.rectangle49:setLeft(0);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(1210);
    obj.rectangle49:setHeight(20);
    obj.rectangle49:setColor("Black");
    obj.rectangle49:setName("rectangle49");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle49);
    obj.label78:setLeft(0);
    obj.label78:setTop(0);
    obj.label78:setWidth(1210);
    obj.label78:setHeight(20);
    obj.label78:setText("PAGINA EXCLUSIVA DO MESTRE");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.rectangle49);
    obj.button15:setLeft(0);
    obj.button15:setTop(0);
    obj.button15:setWidth(50);
    obj.button15:setHeight(20);
    obj.button15:setText("Exibir");
    obj.button15:setHint("Exibe as Anotações do Mestre.");
    obj.button15:setName("button15");

    obj.a1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.a1:setParent(obj.scrollBox7);
    obj.a1:setLeft(0);
    obj.a1:setTop(0);
    obj.a1:setWidth(400);
    obj.a1:setHeight(605);
    obj.a1:setName("a1");
    obj.a1:setVisible(false);

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.a1);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setName("rectangle50");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.a1);
    obj.label79:setLeft(0);
    obj.label79:setTop(0);
    obj.label79:setWidth(400);
    obj.label79:setHeight(20);
    obj.label79:setText("ANOTAÇÕES");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

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

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.a2);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setName("rectangle51");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.a2);
    obj.label80:setLeft(0);
    obj.label80:setTop(0);
    obj.label80:setWidth(400);
    obj.label80:setHeight(20);
    obj.label80:setText("ANOTAÇÕES");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

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

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.a3);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.a3);
    obj.label81:setLeft(0);
    obj.label81:setTop(0);
    obj.label81:setWidth(400);
    obj.label81:setHeight(20);
    obj.label81:setText("ANOTAÇÕES");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

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

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox8);
    obj.layout51:setLeft(620);
    obj.layout51:setTop(10);
    obj.layout51:setWidth(200);
    obj.layout51:setHeight(170);
    obj.layout51:setName("layout51");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout51);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(15);
    obj.rectangle53:setYradius(15);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout51);
    obj.label82:setLeft(0);
    obj.label82:setTop(10);
    obj.label82:setWidth(200);
    obj.label82:setHeight(20);
    obj.label82:setText("Programador: Vinny (Ambesek)");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout51);
    obj.label83:setLeft(0);
    obj.label83:setTop(35);
    obj.label83:setWidth(200);
    obj.label83:setHeight(20);
    obj.label83:setText("Arte: Nefer (Nefertyne)");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout51);
    obj.label84:setLeft(0);
    obj.label84:setTop(60);
    obj.label84:setWidth(200);
    obj.label84:setHeight(20);
    obj.label84:setText("Lista de NPCs: Mia");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout51);
    obj.label85:setLeft(0);
    obj.label85:setTop(85);
    obj.label85:setWidth(200);
    obj.label85:setHeight(20);
    obj.label85:setText("Iniciativas: Alysson");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout51);
    obj.label86:setLeft(0);
    obj.label86:setTop(120);
    obj.label86:setWidth(200);
    obj.label86:setHeight(20);
    obj.label86:setText("Ficha feita para a mesa: ");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout51);
    obj.label87:setLeft(0);
    obj.label87:setTop(145);
    obj.label87:setWidth(200);
    obj.label87:setHeight(20);
    obj.label87:setText("RPGmeister");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.scrollBox8);
    obj.label88:setLeft(630);
    obj.label88:setTop(400);
    obj.label88:setWidth(200);
    obj.label88:setHeight(20);
    obj.label88:setText("SUA VERSÃO:");
    obj.label88:setField("versionInstalled");
    obj.label88:setName("label88");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.scrollBox8);
    obj.label89:setLeft(630);
    obj.label89:setTop(430);
    obj.label89:setWidth(200);
    obj.label89:setHeight(20);
    obj.label89:setText("VERSÃO ATUAL:");
    obj.label89:setField("versionDownloaded");
    obj.label89:setName("label89");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.scrollBox8);
    obj.button16:setLeft(620);
    obj.button16:setTop(475);
    obj.button16:setWidth(100);
    obj.button16:setText("Change Log");
    obj.button16:setName("button16");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.scrollBox8);
    obj.button17:setLeft(730);
    obj.button17:setTop(475);
    obj.button17:setWidth(100);
    obj.button17:setText("Atualizar");
    obj.button17:setName("button17");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.scrollBox8);
    obj.button18:setLeft(840);
    obj.button18:setTop(475);
    obj.button18:setWidth(100);
    obj.button18:setText("Tutorial");
    obj.button18:setName("button18");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.scrollBox8);
    obj.label90:setLeft(620);
    obj.label90:setTop(525);
    obj.label90:setWidth(120);
    obj.label90:setHeight(20);
    obj.label90:setText("CONHEÇA A MESA:");
    obj.label90:setName("label90");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.scrollBox8);
    obj.button19:setLeft(740);
    obj.button19:setTop(525);
    obj.button19:setWidth(100);
    obj.button19:setText("RPGmeister");
    obj.button19:setName("button19");

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
            self.rclSelector:append();
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
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

    obj._e_event3 = obj.rclSelector:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				return utils.compareStringPtBr(nodeA.login, nodeB.login);
        end, obj);

    obj._e_event4 = obj.rclSelector:addEventListener("onSelect",
        function (_)
            local node = self.rclSelector.selectedNode;
            					self.boxDetalhesDoItem.node = node; 
            					self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event5 = obj.rclSelector:addEventListener("onEndEnumeration",
        function (_)
            if self.rclSelector.selectedNode == nil and sheet ~= nil then
            			        local nodes = ndb.getChildNodes(sheet.listaDeJogadores);               
            
            			        if #nodes > 0 then
            			            self.rclSelector.selectedNode = nodes[1];
            			        end;
            			    end;
        end, obj);

    obj._e_event6 = obj.button3:addEventListener("onClick",
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

    obj._e_event7 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = self.boxDetalhesDoItem.node.XP or "0";
            						mod = string.gsub(mod, "%.", "");
            						mod = (tonumber(mod) or 0);
            						local mod2 = 0;
            						local mod3 = 0;
            						while mod>=mod2 do
            							mod3 = mod3+1;
            							mod2 = mod2 + mod3*1000;
            						end
            						
            						while true do  
            							mod2, k = string.gsub(mod2, "^(-?%d+)(%d%d%d)", '%1,%2')
            							if (k==0) then
            							  break
            							end
            						end
            						mod2 = string.gsub(mod2, ",", ".");
            						
            						self.boxDetalhesDoItem.node.nep = mod3;
            						self.boxDetalhesDoItem.node.alvo = mod2;
        end, obj);

    obj._e_event8 = obj.rclExperience:addEventListener("onCompare",
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

    obj._e_event9 = obj.button4:addEventListener("onClick",
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

    obj._e_event10 = obj.rclDinheiro:addEventListener("onCompare",
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

    obj._e_event11 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local mod = (tonumber(self.boxDetalhesDoItem.node.presenca) or 0)*4 + 
            										(tonumber(self.boxDetalhesDoItem.node.atrasoJustificado) or 0)*2 + 
            										(tonumber(self.boxDetalhesDoItem.node.atraso) or 0)*1 -   
            										(tonumber(self.boxDetalhesDoItem.node.falta) or 0)*10 -  
            										(tonumber(self.boxDetalhesDoItem.node.usos) or 0)*10 - 
            										(tonumber(self.boxDetalhesDoItem.node.desperdicio) or 0);
            						self.boxDetalhesDoItem.node.pontos = mod;								
            						self.boxDetalhesDoItem.node.ph = math.max(math.floor(mod/10), 0);
            
            						if mod > 40 then
            							self.boxDetalhesDoItem.node.desperdicio = (tonumber(self.boxDetalhesDoItem.node.desperdicio) or 0) + (mod - 40);
            						end;
        end, obj);

    obj._e_event12 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event13 = obj.button5:addEventListener("onClick",
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

    obj._e_event14 = obj.rclMeses:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event15 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            							if sheet.dias ~= sheet.duracaoEstacao then
            								self.dias.fontColor = "red";
            							else
            								self.dias.fontColor = "white";
            							end;
            						end;
        end, obj);

    obj._e_event16 = obj.button6:addEventListener("onClick",
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

    obj._e_event17 = obj.rclSemana:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                        return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                        return 1;
            		                else   
            		                        return 0;
            		                end;
        end, obj);

    obj._e_event18 = obj.button7:addEventListener("onClick",
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

    obj._e_event19 = obj.celestialBt:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popCelestial");
            							
            							if pop ~= nil then
            								pop:setNodeObject(self.sheet);
            								pop:showPopupEx("bottomCenter", self.celestialBt);
            							else
            								showMessage("Ops, bug.. nao encontrei o popup de eventos celestiais para exibir");
            							end;
        end, obj);

    obj._e_event20 = obj.button8:addEventListener("onClick",
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

    obj._e_event21 = obj.rclEstacoes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 0) < (tonumber(nodeB.ordem) or 0) then
            		                    return -1;
            		                elseif (tonumber(nodeA.ordem) or 0) > (tonumber(nodeB.ordem) or 0) then
            		                    return 1;
            		                else   
            		                    return 0;
            		                end;
        end, obj);

    obj._e_event22 = obj.button9:addEventListener("onClick",
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

    obj._e_event23 = obj.dataLink5:addEventListener("onChange",
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
            
            						local temperatures;
            						local temperaturesVar;
            						local variances = {1, 2, 3, 4, 5};
            						local selected = 5;
            						if estacoes[estacao].temperatura == "Infernal" then
            							temperatures = {31, 35, 41, 49, 57};
            							temperaturesVar = {4, 6, 8, 8, 8};
            						elseif estacoes[estacao].temperatura == "Quente" then
            							temperatures = {25, 27, 29, 33, 39};
            							temperaturesVar = {2, 2, 4, 6, 6};
            						elseif estacoes[estacao].temperatura == "Morno" then
            							temperatures = {20, 22, 24, 26, 30};
            							temperaturesVar = {3, 2, 2, 4, 6};
            						elseif estacoes[estacao].temperatura == "Frio" then
            							temperatures = {-31, -23, -15, -7, 1};
            							temperaturesVar = {8, 8, 8, 8, 8};
            						elseif estacoes[estacao].temperatura == "Glacial" then
            							temperatures = {-46, -36, -26, -16, -6};
            							temperaturesVar = {10, 10, 10, 10, 10};
            						else
            							temperatures = {10, 14, 18, 22, 26};
            							temperaturesVar = {4, 4, 4, 4, 4};
            						end;
            
            						local sensacao = "";
            						local dice1 = math.random(1, 100);
            						if dice1 <= 5 then
            							selected = 1;
            							sensacao = "muito mais frio que o normal"
            						elseif dice1 <= 25 then
            							selected = 2;
            							sensacao = "mais frio que o normal"
            						elseif dice1 <= 75 then
            							selected = 3;
            							sensacao = "com a temperatura padrão"
            						elseif dice1 <= 95 then
            							selected = 4;
            							sensacao = "mais quente que o normal"
            						else
            							selected = 5;
            							sensacao = "muito mais quente que o normal"
            						end;
            
            						local dice2 = math.random(1, temperaturesVar[selected]);
            						local baseTemp = temperatures[selected] + dice2;
            
            						local dice3 = math.random(1, 100);
            						if dice3 <= 5 then
            							selected = 1;
            						elseif dice3 <= 25 then
            							selected = 2;
            						elseif dice3 <= 75 then
            							selected = 3;
            						elseif dice3 <= 95 then
            							selected = 4;
            						else
            							selected = 5;
            						end;
            
            						minTemp = 0 - variances[selected];
            						maxTemp = 0 + variances[selected];
            
            						-- defining rain
            
            						local intensidade;
            						local nevoa = false;
            						local intensidadeChance;
            						if estacoes[estacao].chuvas == "Nenhuma" then
            							intensidadeChance = {100, 101, 101, 101, 101, 101};
            						elseif estacoes[estacao].chuvas == "Razoável" then
            							intensidadeChance = {80, 86, 92, 97, 99, 100};
            						elseif estacoes[estacao].chuvas == "Muita" then
            							intensidadeChance = {60, 70, 83, 92, 97, 100};
            						elseif estacoes[estacao].chuvas == "Constante" then
            							intensidadeChance = {0, 10, 45, 80, 95, 100};
            						else
            							intensidadeChance = {90, 93, 96, 99, 100, 101};
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
            
            						local ventosChance;
            						local ventos;
            						local ventosVelocidade;
            
            						if estacoes[estacao].ventos == "Nenhum" then
            							ventosChance = {100, 101, 101, 101, 101, 101, 101, 101};
            						elseif estacoes[estacao].ventos == "Razoável" then
            							ventosChance = {0, 70, 85, 95, 99, 100, 101, 101};
            						elseif estacoes[estacao].ventos == "Muito" then
            							ventosChance = {0, 50, 70, 80, 90, 95, 99, 100};
            						elseif estacoes[estacao].ventos == "Constante" then
            							ventosChance = {0, 25, 50, 65, 80, 90, 98, 100};
            						else
            							ventosChance = {0, 89, 99, 100, 101, 101, 101, 101};
            						end;
            
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
            
            						-- Defining sand
            
            						local areia = false;
            						if estacoes[estacao].areia == "Pouca" and intensidade == 1 and ventos >= 6 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Razoável" and intensidade == 1 and ventos >= 5 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Muita" and intensidade == 1 and ventos >= 4 then
            							areia = true;
            						elseif estacoes[estacao].areia == "Constante" and intensidade == 1 and ventos >= 3 then
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
            
            							local diaCiclo = (tempo+desvio) % ciclo;
            							if diaCiclo == 0 then
            								diaCiclo = ciclo;
            							end;
            
            							local porcentagemCiclo = diaCiclo / ciclo;
            
            							if luas[i].luas == nil then
            								luas[i].luas = "Lua";
            							end;
            
            							if porcentagemCiclo <= 0.125 then
            								luasInfo = luasInfo .. luas[i].luas .. " cheia";
            								luasLabel = luasLabel .. luas[i].luas .. " (cheia)";
            							elseif porcentagemCiclo <= 0.25 then
            								luasInfo = luasInfo .. luas[i].luas .. " em minguante convexo";
            								luasLabel = luasLabel .. luas[i].luas .. " (minguante convexo)";
            							elseif porcentagemCiclo <= 0.375 then
            								luasInfo = luasInfo .. luas[i].luas .. " em quarto minguante";
            								luasLabel = luasLabel .. luas[i].luas .. " (quarto minguante)";
            							elseif porcentagemCiclo <= 0.5 then
            								luasInfo = luasInfo .. luas[i].luas .. " em minguante concavo";
            								luasLabel = luasLabel .. luas[i].luas .. " (minguante concavo)";
            							elseif porcentagemCiclo <= 0.625 then
            								luasInfo = luasInfo .. luas[i].luas .. " em lua nova";
            								luasLabel = luasLabel .. luas[i].luas .. " (lua nova)";
            							elseif porcentagemCiclo <= 0.75 then
            								luasInfo = luasInfo .. luas[i].luas .. " em crescente concavo";
            								luasLabel = luasLabel .. luas[i].luas .. " (crescente concavo)";
            							elseif porcentagemCiclo <= 0.875 then
            								luasInfo = luasInfo .. luas[i].luas .. " em quarto crescente";
            								luasLabel = luasLabel .. luas[i].luas .. " (quarto crescente)";
            							else
            								luasInfo = luasInfo .. luas[i].luas .. " em crescente convexo";
            								luasLabel = luasLabel .. luas[i].luas .. " (crescente convexo)";
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
            						local eventType = {sheet.sobrentural, sheet.auroras, sheet.cometas, sheet.cadentes, sheet.lunar, sheet.solar, sheet.meteoros, sheet.terremotos};
            
            						for i = 1, 8, 1 do 
            							if eventType[i] == "Raro" then
            								eventChance[i] = eventChance[i-1] + 1;
            							elseif eventType[i] == "Incomum" then
            								eventChance[i] = eventChance[i-1] + 3;
            							elseif eventType[i] == "Comum" then
            								eventChance[i] = eventChance[i-1] + 7;
            							elseif eventType[i] == "Constante" then
            								eventChance[i] = eventChance[i-1] + 14;
            							else
            								eventChance[i] = eventChance[i-1];
            							end;
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
            
            						-- finalazing
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
            						sheet.temperaturaLabel = "Temperatura: " .. minTemp .. "º C - " .. maxTemp .. "º C";
            
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
            								if subEvent <= 3 then
            									data = data .. "Durante a noite, um eclipse lunar penumbral ocorre. A lua fica vermelha, deixando tudo com uma aparencia avermelhada. "
            									sheet.eventosLabel = "Eventos: Lua de Sangue."
            								else
            									data = data .. "Durante a noite, um eclipse lunar ocorre. Deixando tudo escuro. "
            									sheet.eventosLabel = "Eventos: Eclipse Lunar."
            								end;
            							elseif event == 6 then
            								if subEvent <= 3 then
            									data = data .. "Durante o dia, um eclipse solar anular ocorre. O sol fica coberto por uma mancha negra, mas era possivel ver o circulo de fogo em volta da mancha. "
            									sheet.eventosLabel = "Eventos: Eclipse Solar Anular."
            								else
            									data = data .. "Durante o dia, um eclipse solar ocorre. Deixando tudo escuro por alguns minutos. "
            									sheet.eventosLabel = "Eventos: Eclipse Solar."
            								end;
            							elseif event == 7 then
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

    obj._e_event24 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Selected.left = 20 * (tonumber(sheet.CorIndex or 0) % 8);
            			self.Selected.top = 20 * math.floor(tonumber(sheet.CorIndex or 0) / 8);
        end, obj);

    obj._e_event25 = obj.rectangle18:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            					sheet.CorIndex = sheet.IndexBarrinha1;
            					sheet.ColorString = sheet.CorBarrinha1;
            					self.SelectCor:show();
        end, obj);

    obj._e_event26 = obj.rectangle19:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            							sheet.CorIndex = sheet.IndexBarrinha1;
            							sheet.ColorString = sheet.CorBarrinha1;
            							self.SelectCor:show();
        end, obj);

    obj._e_event27 = obj.CorBarrinha1:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            								sheet.CorIndex = sheet.IndexBarrinha1;
            								sheet.ColorString = sheet.CorBarrinha1;
            								self.SelectCor:show();
        end, obj);

    obj._e_event28 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha1.color = sheet.CorBarrinha1;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha1 = sheet.CorBarrinha1;
            				end;
        end, obj);

    obj._e_event29 = obj.rectangle20:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            					sheet.CorIndex = sheet.IndexBarrinha2;
            					sheet.ColorString = sheet.CorBarrinha2;
            					self.SelectCor:show();
        end, obj);

    obj._e_event30 = obj.rectangle21:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            							sheet.CorIndex = sheet.IndexBarrinha2;
            							sheet.ColorString = sheet.CorBarrinha2;
            							self.SelectCor:show();
        end, obj);

    obj._e_event31 = obj.CorBarrinha2:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            								sheet.CorIndex = sheet.IndexBarrinha2;
            								sheet.ColorString = sheet.CorBarrinha2;
            								self.SelectCor:show();
        end, obj);

    obj._e_event32 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha2.color = sheet.CorBarrinha2;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha2 = sheet.CorBarrinha2;
            				end;
        end, obj);

    obj._e_event33 = obj.rectangle22:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            					sheet.CorIndex = sheet.IndexBarrinha3;
            					sheet.ColorString = sheet.CorBarrinha3;
            					self.SelectCor:show();
        end, obj);

    obj._e_event34 = obj.rectangle23:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            							sheet.CorIndex = sheet.IndexBarrinha3;
            							sheet.ColorString = sheet.CorBarrinha3;
            							self.SelectCor:show();
        end, obj);

    obj._e_event35 = obj.CorBarrinha3:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            								sheet.CorIndex = sheet.IndexBarrinha3;
            								sheet.ColorString = sheet.CorBarrinha3;
            								self.SelectCor:show();
        end, obj);

    obj._e_event36 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha3.color = sheet.CorBarrinha3;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha3 = sheet.CorBarrinha3;
            				end;
        end, obj);

    obj._e_event37 = obj.rectangle24:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            					sheet.CorIndex = sheet.IndexBarrinha4;
            					sheet.ColorString = sheet.CorBarrinha4;
            					self.SelectCor:show();
        end, obj);

    obj._e_event38 = obj.rectangle25:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            							sheet.CorIndex = sheet.IndexBarrinha4;
            							sheet.ColorString = sheet.CorBarrinha4;
            							self.SelectCor:show();
        end, obj);

    obj._e_event39 = obj.CorBarrinha4:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            								sheet.CorIndex = sheet.IndexBarrinha4;
            								sheet.ColorString = sheet.CorBarrinha4;
            								self.SelectCor:show();
        end, obj);

    obj._e_event40 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha4.color = sheet.CorBarrinha4;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha4 = sheet.CorBarrinha4;
            				end;
        end, obj);

    obj._e_event41 = obj.button10:addEventListener("onClick",
        function (_)
            self.Config:close();
        end, obj);

    obj._e_event42 = obj.layout28:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "0";
            				sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event43 = obj.rectangle28:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "0";
            					sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event44 = obj.layout29:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "1";
            				sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event45 = obj.rectangle29:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "1";
            					sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event46 = obj.layout30:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "2";
            				sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event47 = obj.rectangle30:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "2";
            					sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event48 = obj.layout31:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "3";
            				sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event49 = obj.rectangle31:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "3";
            					sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event50 = obj.layout32:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "4";
            				sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event51 = obj.rectangle32:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "4";
            					sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event52 = obj.layout33:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "5";
            				sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event53 = obj.rectangle33:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "5";
            					sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event54 = obj.layout34:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "6";
            				sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event55 = obj.rectangle34:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "6";
            					sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event56 = obj.layout35:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "7";
            				sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event57 = obj.rectangle35:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "7";
            					sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event58 = obj.layout36:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "8";
            				sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event59 = obj.rectangle36:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "8";
            					sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event60 = obj.layout37:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "9";
            				sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event61 = obj.rectangle37:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "9";
            					sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event62 = obj.layout38:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "10";
            				sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event63 = obj.rectangle38:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "10";
            					sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event64 = obj.layout39:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "11";
            				sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event65 = obj.rectangle39:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "11";
            					sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event66 = obj.layout40:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "12";
            				sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event67 = obj.rectangle40:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "12";
            					sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event68 = obj.layout41:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "13";
            				sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event69 = obj.rectangle41:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "13";
            					sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event70 = obj.layout42:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "14";
            				sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event71 = obj.rectangle42:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "14";
            					sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event72 = obj.layout43:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "15";
            				sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event73 = obj.rectangle43:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "15";
            					sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event74 = obj.button11:addEventListener("onClick",
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

    obj._e_event75 = obj.NovaAbadeNPCs:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						node = self.opcoesFalsas:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event76 = obj.rectangle45:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event77 = obj.label69:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event78 = obj.path1:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            							 self:autoCalcular();
        end, obj);

    obj._e_event79 = obj.ListaDeNPCs:addEventListener("onShow",
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

    obj._e_event80 = obj.opcoesFalsas2:addEventListener("onSelect",
        function (_)
            local node = self.opcoesFalsas2.selectedNode;
            						 setTimeout(function()
            							if node ~= nil then
            								self.recordNode.scopeNode.opcaoEscolhida2 = node.NomeDaOpcao;
            							end;
            						 end,10);
        end, obj);

    obj._e_event81 = obj.opcoesFalsas2:addEventListener("onCompare",
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

    obj._e_event82 = obj.rectangle46:addEventListener("onResize",
        function (_)
            if self.width >= 270 then
            				self.rclListaDeNPC.width = self.width;
            			else
            				self.rclListaDeNPC.width = 270;
            			end;
        end, obj);

    obj._e_event83 = obj.Configurar:addEventListener("onClick",
        function (_)
            if DonoMestre() then
            						self.Config.scopeNode = sheet;
            						self.Config:show();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event84 = obj.NovoNPC:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						node = self.rclListaDeNPC:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event85 = obj.Organizar:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						self.rclListaDeNPC:sort();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event86 = obj.rclListaDeNPC:addEventListener("onBeginEnumeration",
        function (_)
        end, obj);

    obj._e_event87 = obj.rclListaDeNPC:addEventListener("onItemAdded",
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

    obj._e_event88 = obj.rclListaDeNPC:addEventListener("onCompare",
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

    obj._e_event89 = obj.opcoesFalsas:addEventListener("onSelect",
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

    obj._e_event90 = obj.opcoesFalsas:addEventListener("onBeginEnumeration",
        function (_)
            if sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            						if #nodes == 0 then
            							local node = self.opcoesFalsas:append();
            							node.NomeDaOpcao = "Principal";
            						end;
            					end;
        end, obj);

    obj._e_event91 = obj.opcoesFalsas:addEventListener("onEndEnumeration",
        function (_)
            local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            					if self.dcsMain.scopeNode == nil then
            						self.dcsMain.scopeNode = nodes[1];
            						self.dcsTituloEAbas.scopeNode = nodes[1];
            						self.comboBoxFalsa.scopeNode = nodes[1];
            					end;
        end, obj);

    obj._e_event92 = obj.dataLink12:addEventListener("onChange",
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

    obj._e_event93 = obj.dataLink13:addEventListener("onChange",
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

    obj._e_event94 = obj.dataLink14:addEventListener("onChange",
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

    obj._e_event95 = obj.btnAddAtor:addEventListener("onClick",
        function (_)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					shoMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				self:criarNovoAtor();
        end, obj);

    obj._e_event96 = obj.btnRoll:addEventListener("onClick",
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
            					shoMessage("Apenas para usuarios Gold!");
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

    obj._e_event97 = obj.btnAddAll:addEventListener("onClick",
        function (_)
            local jogadores = rrpg.getMesaDe(sheet).jogadores;
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					shoMessage("Apenas para usuarios Gold!");
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

    obj._e_event98 = obj.btnLimpar:addEventListener("onClick",
        function (_)
            self:limpar();
        end, obj);

    obj._e_event99 = obj.rclAtores:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return self:compareNodes(nodeA, nodeB);
        end, obj);

    obj._e_event100 = obj.button12:addEventListener("onClick",
        function (_)
            self:proximoTurno();
        end, obj);

    obj._e_event101 = obj.button13:addEventListener("onClick",
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

    obj._e_event102 = obj.rclAventuras:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                return 1;
            		            elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                return -1;
            		            else   
            		                return 0;
            		            end;
        end, obj);

    obj._e_event103 = obj.button14:addEventListener("onClick",
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

    obj._e_event104 = obj.rclSessoes:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                return 1;
            		            elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                return -1;
            		            else   
            		                return 0;
            		            end;
        end, obj);

    obj._e_event105 = obj.button15:addEventListener("onClick",
        function (_)
            secret();
        end, obj);

    obj._e_event106 = obj.button16:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/tree/master/Plugins/Sheets/Gerenciador%20de%20Campanha')
        end, obj);

    obj._e_event107 = obj.button17:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Gerenciador%20de%20Campanha/output/Gerenciador%20de%20Campanha.rpk?raw=true')
        end, obj);

    obj._e_event108 = obj.button18:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://www.dropbox.com/s/3eodkgih3aq6hfz/Tutorial.docx?dl=0')
        end, obj);

    obj._e_event109 = obj.button19:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    function obj:_releaseEvents()
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dcsMain ~= nil then self.dcsMain:destroy(); self.dcsMain = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.rclExperience ~= nil then self.rclExperience:destroy(); self.rclExperience = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.comboBox20 ~= nil then self.comboBox20:destroy(); self.comboBox20 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.rclSemana ~= nil then self.rclSemana:destroy(); self.rclSemana = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.flowPart25 ~= nil then self.flowPart25:destroy(); self.flowPart25 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.flowPart19 ~= nil then self.flowPart19:destroy(); self.flowPart19 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layTopTracker ~= nil then self.layTopTracker:destroy(); self.layTopTracker = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.celestialBt ~= nil then self.celestialBt:destroy(); self.celestialBt = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.comboBox11 ~= nil then self.comboBox11:destroy(); self.comboBox11 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.labTitFoF ~= nil then self.labTitFoF:destroy(); self.labTitFoF = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.flowPart22 ~= nil then self.flowPart22:destroy(); self.flowPart22 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.comboBoxFalsa ~= nil then self.comboBoxFalsa:destroy(); self.comboBoxFalsa = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.rclDinheiro ~= nil then self.rclDinheiro:destroy(); self.rclDinheiro = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.SelectCor ~= nil then self.SelectCor:destroy(); self.SelectCor = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.btnAddAtor ~= nil then self.btnAddAtor:destroy(); self.btnAddAtor = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.comboBox15 ~= nil then self.comboBox15:destroy(); self.comboBox15 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.labTitIniciativa ~= nil then self.labTitIniciativa:destroy(); self.labTitIniciativa = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rclEstacoes ~= nil then self.rclEstacoes:destroy(); self.rclEstacoes = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.rclListaDeNPC ~= nil then self.rclListaDeNPC:destroy(); self.rclListaDeNPC = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.dropDownFalso2 ~= nil then self.dropDownFalso2:destroy(); self.dropDownFalso2 = nil; end;
        if self.popCelestial ~= nil then self.popCelestial:destroy(); self.popCelestial = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.luasLabel ~= nil then self.luasLabel:destroy(); self.luasLabel = nil; end;
        if self.rclAtores ~= nil then self.rclAtores:destroy(); self.rclAtores = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.MainClient ~= nil then self.MainClient:destroy(); self.MainClient = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.a3 ~= nil then self.a3:destroy(); self.a3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox21 ~= nil then self.comboBox21:destroy(); self.comboBox21 = nil; end;
        if self.NovoNPC ~= nil then self.NovoNPC:destroy(); self.NovoNPC = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rclLuas ~= nil then self.rclLuas:destroy(); self.rclLuas = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layHeader0 ~= nil then self.layHeader0:destroy(); self.layHeader0 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.opcoesFalsas ~= nil then self.opcoesFalsas:destroy(); self.opcoesFalsas = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
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
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.flowPart24 ~= nil then self.flowPart24:destroy(); self.flowPart24 = nil; end;
        if self.ListaDeNPCs ~= nil then self.ListaDeNPCs:destroy(); self.ListaDeNPCs = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.precipitacaoLabel ~= nil then self.precipitacaoLabel:destroy(); self.precipitacaoLabel = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.comboBox17 ~= nil then self.comboBox17:destroy(); self.comboBox17 = nil; end;
        if self.layRightAlinedTitle ~= nil then self.layRightAlinedTitle:destroy(); self.layRightAlinedTitle = nil; end;
        if self.dataLabel ~= nil then self.dataLabel:destroy(); self.dataLabel = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox13 ~= nil then self.comboBox13:destroy(); self.comboBox13 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.popClima ~= nil then self.popClima:destroy(); self.popClima = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.Nha ~= nil then self.Nha:destroy(); self.Nha = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.path1 ~= nil then self.path1:destroy(); self.path1 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.frmFichaRPGmeister11_svg ~= nil then self.frmFichaRPGmeister11_svg:destroy(); self.frmFichaRPGmeister11_svg = nil; end;
        if self.Organizar ~= nil then self.Organizar:destroy(); self.Organizar = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.comboBox12 ~= nil then self.comboBox12:destroy(); self.comboBox12 = nil; end;
        if self.btnLimpar ~= nil then self.btnLimpar:destroy(); self.btnLimpar = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.CorBarrinha4 ~= nil then self.CorBarrinha4:destroy(); self.CorBarrinha4 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.rclMeses ~= nil then self.rclMeses:destroy(); self.rclMeses = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.btnAddAll ~= nil then self.btnAddAll:destroy(); self.btnAddAll = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.flowPart20 ~= nil then self.flowPart20:destroy(); self.flowPart20 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox14 ~= nil then self.comboBox14:destroy(); self.comboBox14 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.a1 ~= nil then self.a1:destroy(); self.a1 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
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
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.recordNode ~= nil then self.recordNode:destroy(); self.recordNode = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.flowPart23 ~= nil then self.flowPart23:destroy(); self.flowPart23 = nil; end;
        if self.ventoLabel ~= nil then self.ventoLabel:destroy(); self.ventoLabel = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.opcoesFalsas2 ~= nil then self.opcoesFalsas2:destroy(); self.opcoesFalsas2 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.btnRoll ~= nil then self.btnRoll:destroy(); self.btnRoll = nil; end;
        if self.Listade_NPC_Dock ~= nil then self.Listade_NPC_Dock:destroy(); self.Listade_NPC_Dock = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.NovaAbadeNPCs ~= nil then self.NovaAbadeNPCs:destroy(); self.NovaAbadeNPCs = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.frmCombatTracker ~= nil then self.frmCombatTracker:destroy(); self.frmCombatTracker = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.frmFichaRPGmeister10_svg ~= nil then self.frmFichaRPGmeister10_svg:destroy(); self.frmFichaRPGmeister10_svg = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.eventosLabel ~= nil then self.eventosLabel:destroy(); self.eventosLabel = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.a2 ~= nil then self.a2:destroy(); self.a2 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.Configurar ~= nil then self.Configurar:destroy(); self.Configurar = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.dropDownFalso ~= nil then self.dropDownFalso:destroy(); self.dropDownFalso = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.frmGerenciador03 ~= nil then self.frmGerenciador03:destroy(); self.frmGerenciador03 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.frmJogadores ~= nil then self.frmJogadores:destroy(); self.frmJogadores = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.Config ~= nil then self.Config:destroy(); self.Config = nil; end;
        if self.comboBox16 ~= nil then self.comboBox16:destroy(); self.comboBox16 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.comboBox19 ~= nil then self.comboBox19:destroy(); self.comboBox19 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.rclAventuras ~= nil then self.rclAventuras:destroy(); self.rclAventuras = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
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
