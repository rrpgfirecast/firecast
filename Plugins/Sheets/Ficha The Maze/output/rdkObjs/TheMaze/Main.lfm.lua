require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMain()
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
    obj:setName("frmMain");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.TheMaze");
    obj:setTitle("Ficha The Maze");
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
    obj.tab1:setTitle("Status Básicos");
    obj.tab1:setName("tab1");

    obj.frmBase = GUI.fromHandle(_obj_newObject("form"));
    obj.frmBase:setParent(obj.tab1);
    obj.frmBase:setName("frmBase");
    obj.frmBase:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmBase);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(60);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(105);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(255);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Nível");
    obj.label2:setName("label2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(355);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(355);
    obj.label3:setTop(5);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setField("nivel");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(405);
    obj.label4:setTop(5);
    obj.label4:setWidth(100);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Experiência");
    obj.label4:setName("label4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(505);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("experiencia");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setTop(30);
    obj.label5:setWidth(100);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Aptidão");
    obj.label5:setName("label5");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(105);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("aptidao");
    obj.comboBox1:setItems({'Alquimista', 'Arcanista', 'Caçador', 'Cavaleiro', 'Monge', 'Necromante', 'Xamã'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.comboBox1:setName("comboBox1");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(255);
    obj.label6:setTop(30);
    obj.label6:setWidth(100);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("Rank");
    obj.label6:setName("label6");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setLeft(355);
    obj.rectangle3:setTop(30);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(355);
    obj.label7:setTop(30);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setField("rank");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(405);
    obj.label8:setTop(30);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("Progresso");
    obj.label8:setName("label8");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(505);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("progresso");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("nivel");
    obj.dataLink1:setName("dataLink1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(65);
    obj.rectangle4:setWidth(310);
    obj.rectangle4:setHeight(85);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle4);
    obj.label9:setLeft(105);
    obj.label9:setTop(5);
    obj.label9:setWidth(75);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("Naturais");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle4);
    obj.label10:setLeft(180);
    obj.label10:setTop(5);
    obj.label10:setWidth(75);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Adicional");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle4);
    obj.label11:setLeft(255);
    obj.label11:setTop(5);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("Atual");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle4);
    obj.label12:setLeft(5);
    obj.label12:setTop(30);
    obj.label12:setWidth(100);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("Vida");
    obj.label12:setName("label12");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.rectangle4);
    obj.rectangle5:setLeft(105);
    obj.rectangle5:setTop(30);
    obj.rectangle5:setWidth(75);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle4);
    obj.label13:setLeft(105);
    obj.label13:setTop(30);
    obj.label13:setWidth(75);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setField("vidaBase");
    obj.label13:setName("label13");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle4);
    obj.edit4:setLeft(180);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(75);
    obj.edit4:setHeight(25);
    obj.edit4:setField("vidaCompensacao");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle4);
    obj.rectangle6:setLeft(255);
    obj.rectangle6:setTop(30);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle4);
    obj.label14:setLeft(255);
    obj.label14:setTop(30);
    obj.label14:setWidth(50);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setField("vidaAtual");
    obj.label14:setName("label14");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle4);
    obj.dataLink2:setFields({'vidaBase','vidaCompensacao'});
    obj.dataLink2:setName("dataLink2");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle4);
    obj.label15:setLeft(5);
    obj.label15:setTop(55);
    obj.label15:setWidth(100);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Fadiga");
    obj.label15:setName("label15");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle4);
    obj.rectangle7:setLeft(105);
    obj.rectangle7:setTop(55);
    obj.rectangle7:setWidth(75);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle4);
    obj.label16:setLeft(105);
    obj.label16:setTop(55);
    obj.label16:setWidth(75);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setField("fadigaBase");
    obj.label16:setName("label16");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle4);
    obj.edit5:setLeft(180);
    obj.edit5:setTop(55);
    obj.edit5:setWidth(75);
    obj.edit5:setHeight(25);
    obj.edit5:setField("fadigaCompensacao");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle4);
    obj.rectangle8:setLeft(255);
    obj.rectangle8:setTop(55);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle4);
    obj.label17:setLeft(255);
    obj.label17:setTop(55);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setField("fadigaAtual");
    obj.label17:setName("label17");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle4);
    obj.dataLink3:setFields({'fadigaBase','fadigaCompensacao'});
    obj.dataLink3:setName("dataLink3");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox1);
    obj.rectangle9:setLeft(0);
    obj.rectangle9:setTop(155);
    obj.rectangle9:setWidth(310);
    obj.rectangle9:setHeight(35);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle9);
    obj.label18:setLeft(5);
    obj.label18:setTop(5);
    obj.label18:setWidth(150);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("Peças de Aruman");
    obj.label18:setFontSize(13);
    obj.label18:setName("label18");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle9);
    obj.edit6:setLeft(155);
    obj.edit6:setTop(5);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("pecas");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox1);
    obj.rectangle10:setLeft(0);
    obj.rectangle10:setTop(195);
    obj.rectangle10:setWidth(310);
    obj.rectangle10:setHeight(35);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle10);
    obj.label19:setLeft(10);
    obj.label19:setTop(5);
    obj.label19:setWidth(310);
    obj.label19:setHeight(25);
    obj.label19:setText("Carma");
    obj.label19:setName("label19");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle10);
    obj.comboBox2:setLeft(65);
    obj.comboBox2:setTop(5);
    obj.comboBox2:setWidth(200);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("carma");
    obj.comboBox2:setItems({'Divino 2','Divino 1','Humano','Demoníaco 1','Demoníaco 2'});
    obj.comboBox2:setName("comboBox2");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.scrollBox1);
    obj.rectangle11:setLeft(0);
    obj.rectangle11:setTop(235);
    obj.rectangle11:setWidth(310);
    obj.rectangle11:setHeight(85);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle11);
    obj.label20:setLeft(0);
    obj.label20:setTop(5);
    obj.label20:setWidth(310);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setText("Bençãos e Sentinelas");
    obj.label20:setName("label20");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle11);
    obj.edit7:setLeft(5);
    obj.edit7:setTop(30);
    obj.edit7:setWidth(300);
    obj.edit7:setHeight(25);
    obj.edit7:setField("bencao1");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle11);
    obj.edit8:setLeft(5);
    obj.edit8:setTop(55);
    obj.edit8:setWidth(300);
    obj.edit8:setHeight(25);
    obj.edit8:setField("bencao2");
    obj.edit8:setName("edit8");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.scrollBox1);
    obj.rectangle12:setLeft(0);
    obj.rectangle12:setTop(325);
    obj.rectangle12:setWidth(310);
    obj.rectangle12:setHeight(355);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle12);
    obj.label21:setLeft(0);
    obj.label21:setTop(5);
    obj.label21:setWidth(310);
    obj.label21:setHeight(20);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setText("Resistência");
    obj.label21:setName("label21");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle12);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(25);
    obj.layout1:setWidth(155);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout1);
    obj.label22:setLeft(0);
    obj.label22:setTop(0);
    obj.label22:setWidth(100);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("Física");
    obj.label22:setName("label22");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setLeft(100);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setField("resistenciaFisica");
    obj.edit9:setName("edit9");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle12);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(50);
    obj.layout2:setWidth(155);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout2);
    obj.label23:setLeft(0);
    obj.label23:setTop(0);
    obj.label23:setWidth(100);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setText("Desaceleração");
    obj.label23:setName("label23");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout2);
    obj.edit10:setLeft(100);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setField("resistenciaDesaceleracao");
    obj.edit10:setName("edit10");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle12);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(75);
    obj.layout3:setWidth(155);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout3);
    obj.label24:setLeft(0);
    obj.label24:setTop(0);
    obj.label24:setWidth(100);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setText("Sangramento");
    obj.label24:setName("label24");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout3);
    obj.edit11:setLeft(100);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setField("resistenciaSangramento");
    obj.edit11:setName("edit11");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle12);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(100);
    obj.layout4:setWidth(155);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout4);
    obj.label25:setLeft(0);
    obj.label25:setTop(0);
    obj.label25:setWidth(100);
    obj.label25:setHeight(25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Impelimento");
    obj.label25:setName("label25");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout4);
    obj.edit12:setLeft(100);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setField("resistenciaImpelimento");
    obj.edit12:setName("edit12");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle12);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(125);
    obj.layout5:setWidth(155);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout5);
    obj.label26:setLeft(0);
    obj.label26:setTop(0);
    obj.label26:setWidth(100);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setText("Imobilização");
    obj.label26:setName("label26");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout5);
    obj.edit13:setLeft(100);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setField("resistenciaImobilizacao");
    obj.edit13:setName("edit13");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle12);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(150);
    obj.layout6:setWidth(155);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout6);
    obj.label27:setLeft(0);
    obj.label27:setTop(0);
    obj.label27:setWidth(100);
    obj.label27:setHeight(25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setText("Fratura");
    obj.label27:setName("label27");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout6);
    obj.edit14:setLeft(100);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setField("resistenciaFratura");
    obj.edit14:setName("edit14");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle12);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(175);
    obj.layout7:setWidth(155);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout7);
    obj.label28:setLeft(0);
    obj.label28:setTop(0);
    obj.label28:setWidth(100);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setText("Fragilização");
    obj.label28:setName("label28");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout7);
    obj.edit15:setLeft(100);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setField("resistenciaFragilizacao");
    obj.edit15:setName("edit15");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle12);
    obj.layout8:setLeft(155);
    obj.layout8:setTop(25);
    obj.layout8:setWidth(155);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout8);
    obj.label29:setLeft(0);
    obj.label29:setTop(0);
    obj.label29:setWidth(100);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setText("Paranormal");
    obj.label29:setName("label29");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout8);
    obj.edit16:setLeft(100);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setField("resistenciaParanormal");
    obj.edit16:setName("edit16");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle12);
    obj.layout9:setLeft(155);
    obj.layout9:setTop(50);
    obj.layout9:setWidth(155);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout9);
    obj.label30:setLeft(0);
    obj.label30:setTop(0);
    obj.label30:setWidth(100);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setText("Envenenamento");
    obj.label30:setName("label30");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout9);
    obj.edit17:setLeft(100);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setField("resistenciaEnvenenamento");
    obj.edit17:setName("edit17");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle12);
    obj.layout10:setLeft(155);
    obj.layout10:setTop(75);
    obj.layout10:setWidth(155);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout10);
    obj.label31:setLeft(0);
    obj.label31:setTop(0);
    obj.label31:setWidth(100);
    obj.label31:setHeight(25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("Incendiado");
    obj.label31:setName("label31");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout10);
    obj.edit18:setLeft(100);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setField("resistenciaIncendiado");
    obj.edit18:setName("edit18");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle12);
    obj.layout11:setLeft(155);
    obj.layout11:setTop(100);
    obj.layout11:setWidth(155);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout11);
    obj.label32:setLeft(0);
    obj.label32:setTop(0);
    obj.label32:setWidth(100);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setText("Atordoamento");
    obj.label32:setName("label32");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout11);
    obj.edit19:setLeft(100);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setField("resistenciaAtordoamento");
    obj.edit19:setName("edit19");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle12);
    obj.layout12:setLeft(155);
    obj.layout12:setTop(125);
    obj.layout12:setWidth(155);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout12);
    obj.label33:setLeft(0);
    obj.label33:setTop(0);
    obj.label33:setWidth(100);
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setText("Paralisação");
    obj.label33:setName("label33");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout12);
    obj.edit20:setLeft(100);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("resistenciaParalisacao");
    obj.edit20:setName("edit20");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle12);
    obj.layout13:setLeft(155);
    obj.layout13:setTop(150);
    obj.layout13:setWidth(155);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout13);
    obj.label34:setLeft(0);
    obj.label34:setTop(0);
    obj.label34:setWidth(100);
    obj.label34:setHeight(25);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setText("Provocação");
    obj.label34:setName("label34");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout13);
    obj.edit21:setLeft(100);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setField("resistenciaProvocacao");
    obj.edit21:setName("edit21");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle12);
    obj.layout14:setLeft(155);
    obj.layout14:setTop(175);
    obj.layout14:setWidth(155);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout14);
    obj.label35:setLeft(0);
    obj.label35:setTop(0);
    obj.label35:setWidth(100);
    obj.label35:setHeight(25);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setText("Silenciado");
    obj.label35:setName("label35");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout14);
    obj.edit22:setLeft(100);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setField("resistenciaSilenciado");
    obj.edit22:setName("edit22");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle12);
    obj.label36:setLeft(0);
    obj.label36:setTop(200);
    obj.label36:setWidth(310);
    obj.label36:setHeight(20);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setText("Benefícios");
    obj.label36:setName("label36");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle12);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(225);
    obj.layout15:setWidth(155);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout15);
    obj.label37:setLeft(0);
    obj.label37:setTop(0);
    obj.label37:setWidth(100);
    obj.label37:setHeight(25);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setText("Reg. de Vida");
    obj.label37:setName("label37");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout15);
    obj.edit23:setLeft(100);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setField("beneficioRegVida");
    obj.edit23:setName("edit23");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle12);
    obj.layout16:setLeft(0);
    obj.layout16:setTop(250);
    obj.layout16:setWidth(155);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout16);
    obj.label38:setLeft(0);
    obj.label38:setTop(0);
    obj.label38:setWidth(100);
    obj.label38:setHeight(25);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setText("Reg. de Fadiga");
    obj.label38:setName("label38");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout16);
    obj.edit24:setLeft(100);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setField("beneficioRegFadiga");
    obj.edit24:setName("edit24");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle12);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(275);
    obj.layout17:setWidth(155);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout17);
    obj.label39:setLeft(0);
    obj.label39:setTop(0);
    obj.label39:setWidth(100);
    obj.label39:setHeight(25);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setText("Crítico");
    obj.label39:setName("label39");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout17);
    obj.edit25:setLeft(100);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(50);
    obj.edit25:setHeight(25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setField("beneficioConjuração");
    obj.edit25:setName("edit25");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle12);
    obj.layout18:setLeft(155);
    obj.layout18:setTop(225);
    obj.layout18:setWidth(155);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout18);
    obj.label40:setLeft(0);
    obj.label40:setTop(0);
    obj.label40:setWidth(100);
    obj.label40:setHeight(25);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setText("Ampliação");
    obj.label40:setName("label40");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout18);
    obj.edit26:setLeft(100);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(25);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setField("beneficioAmpliacao");
    obj.edit26:setName("edit26");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle12);
    obj.layout19:setLeft(155);
    obj.layout19:setTop(250);
    obj.layout19:setWidth(155);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout19);
    obj.label41:setLeft(0);
    obj.label41:setTop(0);
    obj.label41:setWidth(100);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setText("Negação");
    obj.label41:setName("label41");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout19);
    obj.edit27:setLeft(100);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setField("beneficioNegacao");
    obj.edit27:setName("edit27");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle12);
    obj.layout20:setLeft(155);
    obj.layout20:setTop(275);
    obj.layout20:setWidth(155);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout20);
    obj.label42:setLeft(0);
    obj.label42:setTop(0);
    obj.label42:setWidth(100);
    obj.label42:setHeight(25);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setText("Esquiva");
    obj.label42:setName("label42");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout20);
    obj.edit28:setLeft(100);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(50);
    obj.edit28:setHeight(25);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setField("beneficioEsquiva");
    obj.edit28:setName("edit28");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle12);
    obj.label43:setLeft(0);
    obj.label43:setTop(300);
    obj.label43:setWidth(310);
    obj.label43:setHeight(20);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setText("Redutores");
    obj.label43:setName("label43");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle12);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(325);
    obj.layout21:setWidth(75);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout21);
    obj.label44:setLeft(0);
    obj.label44:setTop(0);
    obj.label44:setWidth(50);
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setText("Físi.");
    obj.label44:setName("label44");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout21);
    obj.edit29:setLeft(50);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(25);
    obj.edit29:setHeight(25);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setField("redutorFisico");
    obj.edit29:setName("edit29");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle12);
    obj.layout22:setLeft(80);
    obj.layout22:setTop(325);
    obj.layout22:setWidth(75);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout22);
    obj.label45:setLeft(0);
    obj.label45:setTop(0);
    obj.label45:setWidth(50);
    obj.label45:setHeight(25);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setText("Para.");
    obj.label45:setName("label45");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout22);
    obj.edit30:setLeft(50);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(25);
    obj.edit30:setHeight(25);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setField("redutorParanormal");
    obj.edit30:setName("edit30");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle12);
    obj.layout23:setLeft(155);
    obj.layout23:setTop(325);
    obj.layout23:setWidth(75);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout23);
    obj.label46:setLeft(0);
    obj.label46:setTop(0);
    obj.label46:setWidth(50);
    obj.label46:setHeight(25);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setText("Corr.");
    obj.label46:setName("label46");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout23);
    obj.edit31:setLeft(50);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(25);
    obj.edit31:setHeight(25);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setField("redutorCorrosivo");
    obj.edit31:setName("edit31");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle12);
    obj.layout24:setLeft(230);
    obj.layout24:setTop(325);
    obj.layout24:setWidth(75);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout24);
    obj.label47:setLeft(0);
    obj.label47:setTop(0);
    obj.label47:setWidth(50);
    obj.label47:setHeight(25);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setText("Proj.");
    obj.label47:setName("label47");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout24);
    obj.edit32:setLeft(50);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(25);
    obj.edit32:setHeight(25);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setField("redutorProjetil");
    obj.edit32:setName("edit32");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.scrollBox1);
    obj.rectangle13:setLeft(315);
    obj.rectangle13:setTop(65);
    obj.rectangle13:setWidth(285);
    obj.rectangle13:setHeight(240);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle13);
    obj.label48:setLeft(0);
    obj.label48:setTop(5);
    obj.label48:setWidth(285);
    obj.label48:setHeight(25);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setText("Atributos");
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle13);
    obj.label49:setLeft(75);
    obj.label49:setTop(30);
    obj.label49:setWidth(50);
    obj.label49:setHeight(25);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setText("Total");
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle13);
    obj.label50:setLeft(125);
    obj.label50:setTop(30);
    obj.label50:setWidth(50);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("Perícia");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle13);
    obj.label51:setLeft(175);
    obj.label51:setTop(30);
    obj.label51:setWidth(50);
    obj.label51:setHeight(25);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setText("Nível");
    obj.label51:setName("label51");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle13);
    obj.label52:setLeft(225);
    obj.label52:setTop(30);
    obj.label52:setWidth(50);
    obj.label52:setHeight(25);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("Adicional");
    obj.label52:setFontSize(11);
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle13);
    obj.label53:setLeft(0);
    obj.label53:setTop(55);
    obj.label53:setWidth(75);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("Agilidade");
    obj.label53:setFontSize(13);
    obj.label53:setName("label53");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle13);
    obj.rectangle14:setLeft(75);
    obj.rectangle14:setTop(55);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle13);
    obj.label54:setLeft(75);
    obj.label54:setTop(55);
    obj.label54:setWidth(50);
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setField("agilidade_total");
    obj.label54:setName("label54");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle13);
    obj.rectangle15:setLeft(125);
    obj.rectangle15:setTop(55);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle13);
    obj.label55:setLeft(125);
    obj.label55:setTop(55);
    obj.label55:setWidth(50);
    obj.label55:setHeight(25);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setField("agilidade_inicial");
    obj.label55:setName("label55");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle13);
    obj.edit33:setLeft(175);
    obj.edit33:setTop(55);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(25);
    obj.edit33:setField("agilidade_nivel");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle13);
    obj.edit34:setLeft(225);
    obj.edit34:setTop(55);
    obj.edit34:setWidth(50);
    obj.edit34:setHeight(25);
    obj.edit34:setField("agilidade_outros");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle13);
    obj.dataLink4:setFields({'agilidade_inicial', 'agilidade_nivel', 'agilidade_outros'});
    obj.dataLink4:setName("dataLink4");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle13);
    obj.label56:setLeft(0);
    obj.label56:setTop(80);
    obj.label56:setWidth(75);
    obj.label56:setHeight(25);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setText("Corpo-a-Corpo");
    obj.label56:setFontSize(10);
    obj.label56:setName("label56");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle13);
    obj.rectangle16:setLeft(75);
    obj.rectangle16:setTop(80);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle13);
    obj.label57:setLeft(75);
    obj.label57:setTop(80);
    obj.label57:setWidth(50);
    obj.label57:setHeight(25);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setField("cac_total");
    obj.label57:setName("label57");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle13);
    obj.rectangle17:setLeft(125);
    obj.rectangle17:setTop(80);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle13);
    obj.label58:setLeft(125);
    obj.label58:setTop(80);
    obj.label58:setWidth(50);
    obj.label58:setHeight(25);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setField("cac_inicial");
    obj.label58:setName("label58");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle13);
    obj.edit35:setLeft(175);
    obj.edit35:setTop(80);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("cac_nivel");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle13);
    obj.edit36:setLeft(225);
    obj.edit36:setTop(80);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("cac_outros");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle13);
    obj.dataLink5:setFields({'cac_inicial', 'cac_nivel', 'cac_outros'});
    obj.dataLink5:setName("dataLink5");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle13);
    obj.label59:setLeft(0);
    obj.label59:setTop(105);
    obj.label59:setWidth(75);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setText("Manuseio");
    obj.label59:setFontSize(13);
    obj.label59:setName("label59");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle13);
    obj.rectangle18:setLeft(75);
    obj.rectangle18:setTop(105);
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle13);
    obj.label60:setLeft(75);
    obj.label60:setTop(105);
    obj.label60:setWidth(50);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setField("manuseio_total");
    obj.label60:setName("label60");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle13);
    obj.rectangle19:setLeft(125);
    obj.rectangle19:setTop(105);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle13);
    obj.label61:setLeft(125);
    obj.label61:setTop(105);
    obj.label61:setWidth(50);
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setField("manuseio_inicial");
    obj.label61:setName("label61");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle13);
    obj.edit37:setLeft(175);
    obj.edit37:setTop(105);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(25);
    obj.edit37:setField("manuseio_nivel");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle13);
    obj.edit38:setLeft(225);
    obj.edit38:setTop(105);
    obj.edit38:setWidth(50);
    obj.edit38:setHeight(25);
    obj.edit38:setField("manuseio_outros");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle13);
    obj.dataLink6:setFields({'manuseio_inicial', 'manuseio_nivel', 'manuseio_outros'});
    obj.dataLink6:setName("dataLink6");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle13);
    obj.label62:setLeft(0);
    obj.label62:setTop(130);
    obj.label62:setWidth(75);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setText("Pontaria");
    obj.label62:setFontSize(13);
    obj.label62:setName("label62");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.rectangle13);
    obj.rectangle20:setLeft(75);
    obj.rectangle20:setTop(130);
    obj.rectangle20:setWidth(50);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle13);
    obj.label63:setLeft(75);
    obj.label63:setTop(130);
    obj.label63:setWidth(50);
    obj.label63:setHeight(25);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setField("pontaria_total");
    obj.label63:setName("label63");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle13);
    obj.rectangle21:setLeft(125);
    obj.rectangle21:setTop(130);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle13);
    obj.label64:setLeft(125);
    obj.label64:setTop(130);
    obj.label64:setWidth(50);
    obj.label64:setHeight(25);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setField("pontaria_inicial");
    obj.label64:setName("label64");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle13);
    obj.edit39:setLeft(175);
    obj.edit39:setTop(130);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("pontaria_nivel");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle13);
    obj.edit40:setLeft(225);
    obj.edit40:setTop(130);
    obj.edit40:setWidth(50);
    obj.edit40:setHeight(25);
    obj.edit40:setField("pontaria_outros");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle13);
    obj.dataLink7:setFields({'pontaria_inicial', 'pontaria_nivel', 'pontaria_outros'});
    obj.dataLink7:setName("dataLink7");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle13);
    obj.label65:setLeft(0);
    obj.label65:setTop(155);
    obj.label65:setWidth(75);
    obj.label65:setHeight(25);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setText("Paranormalidade");
    obj.label65:setFontSize(9);
    obj.label65:setName("label65");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle13);
    obj.rectangle22:setLeft(75);
    obj.rectangle22:setTop(155);
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle13);
    obj.label66:setLeft(75);
    obj.label66:setTop(155);
    obj.label66:setWidth(50);
    obj.label66:setHeight(25);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setField("paranormalidade_total");
    obj.label66:setName("label66");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle13);
    obj.rectangle23:setLeft(125);
    obj.rectangle23:setTop(155);
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle13);
    obj.label67:setLeft(125);
    obj.label67:setTop(155);
    obj.label67:setWidth(50);
    obj.label67:setHeight(25);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setField("paranormalidade_inicial");
    obj.label67:setName("label67");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle13);
    obj.edit41:setLeft(175);
    obj.edit41:setTop(155);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(25);
    obj.edit41:setField("paranormalidade_nivel");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle13);
    obj.edit42:setLeft(225);
    obj.edit42:setTop(155);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("paranormalidade_outros");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle13);
    obj.dataLink8:setFields({'paranormalidade_inicial', 'paranormalidade_nivel', 'paranormalidade_outros'});
    obj.dataLink8:setName("dataLink8");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle13);
    obj.label68:setLeft(0);
    obj.label68:setTop(180);
    obj.label68:setWidth(75);
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setText("Sorte");
    obj.label68:setFontSize(13);
    obj.label68:setName("label68");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle13);
    obj.rectangle24:setLeft(75);
    obj.rectangle24:setTop(180);
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle13);
    obj.label69:setLeft(75);
    obj.label69:setTop(180);
    obj.label69:setWidth(50);
    obj.label69:setHeight(25);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setField("sorte_total");
    obj.label69:setName("label69");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle13);
    obj.rectangle25:setLeft(125);
    obj.rectangle25:setTop(180);
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle13);
    obj.label70:setLeft(125);
    obj.label70:setTop(180);
    obj.label70:setWidth(50);
    obj.label70:setHeight(25);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setField("sorte_inicial");
    obj.label70:setName("label70");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle13);
    obj.edit43:setLeft(175);
    obj.edit43:setTop(180);
    obj.edit43:setWidth(50);
    obj.edit43:setHeight(25);
    obj.edit43:setField("sorte_nivel");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle13);
    obj.edit44:setLeft(225);
    obj.edit44:setTop(180);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setField("sorte_outros");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle13);
    obj.dataLink9:setFields({'sorte_inicial', 'sorte_nivel', 'sorte_outros'});
    obj.dataLink9:setName("dataLink9");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle13);
    obj.rectangle26:setLeft(15);
    obj.rectangle26:setTop(210);
    obj.rectangle26:setWidth(50);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.atr_max = GUI.fromHandle(_obj_newObject("label"));
    obj.atr_max:setParent(obj.rectangle13);
    obj.atr_max:setLeft(15);
    obj.atr_max:setTop(210);
    obj.atr_max:setWidth(50);
    obj.atr_max:setHeight(25);
    obj.atr_max:setHorzTextAlign("center");
    obj.atr_max:setField("atr_max");
    obj.atr_max:setName("atr_max");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.rectangle13);
    obj.rectangle27:setLeft(75);
    obj.rectangle27:setTop(210);
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle13);
    obj.label71:setLeft(75);
    obj.label71:setTop(210);
    obj.label71:setWidth(50);
    obj.label71:setHeight(25);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setField("sum_total");
    obj.label71:setName("label71");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.rectangle13);
    obj.rectangle28:setLeft(125);
    obj.rectangle28:setTop(210);
    obj.rectangle28:setWidth(50);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle13);
    obj.label72:setLeft(125);
    obj.label72:setTop(210);
    obj.label72:setWidth(50);
    obj.label72:setHeight(25);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setField("sum_inicial");
    obj.label72:setName("label72");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.rectangle13);
    obj.rectangle29:setLeft(175);
    obj.rectangle29:setTop(210);
    obj.rectangle29:setWidth(50);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle13);
    obj.label73:setLeft(175);
    obj.label73:setTop(210);
    obj.label73:setWidth(50);
    obj.label73:setHeight(25);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setField("sum_nivel");
    obj.label73:setName("label73");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle13);
    obj.dataLink10:setFields({'atr_max','sum_total'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle13);
    obj.dataLink11:setFields({'cac_total'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle13);
    obj.dataLink12:setFields({'paranormalidade_total'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle13);
    obj.dataLink13:setFields({'sum_inicial', 'sum_nivel'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle13);
    obj.dataLink14:setFields({'agilidade_inicial', 'cac_inicial', 'manuseio_inicial', 'pontaria_inicial', 'paranormalidade_inicial', 'sorte_inicial'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle13);
    obj.dataLink15:setFields({'agilidade_nivel', 'cac_nivel', 'manuseio_nivel', 'pontaria_nivel', 'paranormalidade_nivel', 'sorte_nivel'});
    obj.dataLink15:setName("dataLink15");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.scrollBox1);
    obj.rectangle30:setLeft(315);
    obj.rectangle30:setTop(310);
    obj.rectangle30:setWidth(910);
    obj.rectangle30:setHeight(370);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle30);
    obj.label74:setLeft(0);
    obj.label74:setTop(5);
    obj.label74:setWidth(460);
    obj.label74:setHeight(25);
    obj.label74:setHorzTextAlign("trailing");
    obj.label74:setText("Habilidades");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle30);
    obj.label75:setLeft(0);
    obj.label75:setTop(5);
    obj.label75:setWidth(870);
    obj.label75:setHeight(25);
    obj.label75:setHorzTextAlign("trailing");
    obj.label75:setText("Estágio");
    obj.label75:setFontSize(11);
    obj.label75:setName("label75");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.rectangle30);
    obj.rectangle31:setLeft(460);
    obj.rectangle31:setTop(5);
    obj.rectangle31:setWidth(50);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle30);
    obj.label76:setLeft(460);
    obj.label76:setTop(5);
    obj.label76:setWidth(50);
    obj.label76:setHeight(25);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setField("habilidadesNivel");
    obj.label76:setName("label76");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.rectangle30);
    obj.rectangle32:setLeft(510);
    obj.rectangle32:setTop(5);
    obj.rectangle32:setWidth(50);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle30);
    obj.label77:setLeft(510);
    obj.label77:setTop(5);
    obj.label77:setWidth(50);
    obj.label77:setHeight(25);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setField("habilidadesDisponivel");
    obj.label77:setName("label77");

    obj.rclHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidades:setParent(obj.rectangle30);
    obj.rclHabilidades:setLeft(5);
    obj.rclHabilidades:setTop(30);
    obj.rclHabilidades:setWidth(900);
    obj.rclHabilidades:setHeight(335);
    obj.rclHabilidades:setName("rclHabilidades");
    obj.rclHabilidades:setField("listaDeHabilidades");
    obj.rclHabilidades:setTemplateForm("frmAbilities");
    obj.rclHabilidades:setLayout("vertical");
    obj.rclHabilidades:setMinQt(5);

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.scrollBox1);
    obj.rectangle33:setLeft(605);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(305);
    obj.rectangle33:setHeight(305);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(606);
    obj.image1:setTop(1);
    obj.image1:setWidth(303);
    obj.image1:setHeight(303);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.scrollBox1);
    obj.rectangle34:setLeft(915);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(310);
    obj.rectangle34:setHeight(195);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle34);
    obj.label78:setLeft(0);
    obj.label78:setTop(5);
    obj.label78:setWidth(310);
    obj.label78:setHeight(25);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setText("Ultimato");
    obj.label78:setName("label78");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle34);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(300);
    obj.textEditor1:setHeight(160);
    obj.textEditor1:setField("ultimato");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.scrollBox1);
    obj.rectangle35:setLeft(915);
    obj.rectangle35:setTop(200);
    obj.rectangle35:setWidth(310);
    obj.rectangle35:setHeight(105);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle35);
    obj.label79:setLeft(0);
    obj.label79:setTop(5);
    obj.label79:setWidth(310);
    obj.label79:setHeight(25);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setText("Privilégio");
    obj.label79:setName("label79");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle35);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setWidth(300);
    obj.textEditor2:setHeight(70);
    obj.textEditor2:setField("privilegio");
    obj.textEditor2:setName("textEditor2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Inventário");
    obj.tab2:setName("tab2");

    obj.frmInventory = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInventory:setParent(obj.tab2);
    obj.frmInventory:setName("frmInventory");
    obj.frmInventory:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmInventory);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.scrollBox2);
    obj.rectangle36:setColor("#FF000000");
    obj.rectangle36:setWidth(1363);
    obj.rectangle36:setHeight(686);
    obj.rectangle36:setName("rectangle36");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.scrollBox2);
    obj.rectangle37:setLeft(0);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(1210);
    obj.rectangle37:setHeight(555);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle37);
    obj.label80:setLeft(5);
    obj.label80:setTop(5);
    obj.label80:setWidth(200);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setText("Nome");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.rectangle37);
    obj.label81:setLeft(205);
    obj.label81:setTop(5);
    obj.label81:setWidth(700);
    obj.label81:setHeight(25);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setText("Efeito");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.rectangle37);
    obj.label82:setLeft(905);
    obj.label82:setTop(5);
    obj.label82:setWidth(150);
    obj.label82:setHeight(25);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setText("Tipo");
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle37);
    obj.label83:setLeft(1055);
    obj.label83:setTop(5);
    obj.label83:setWidth(50);
    obj.label83:setHeight(25);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setText("Qtd");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle37);
    obj.label84:setLeft(1105);
    obj.label84:setTop(5);
    obj.label84:setWidth(50);
    obj.label84:setHeight(25);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setText("Max");
    obj.label84:setName("label84");

    obj.rclInventario = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventario:setParent(obj.rectangle37);
    obj.rclInventario:setLeft(5);
    obj.rclInventario:setTop(30);
    obj.rclInventario:setWidth(1200);
    obj.rclInventario:setHeight(520);
    obj.rclInventario:setName("rclInventario");
    obj.rclInventario:setField("listaDeItens");
    obj.rclInventario:setTemplateForm("frmItem");
    obj.rclInventario:setLayout("vertical");
    obj.rclInventario:setMinQt(8);

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.scrollBox2);
    obj.rectangle38:setLeft(0);
    obj.rectangle38:setTop(560);
    obj.rectangle38:setWidth(310);
    obj.rectangle38:setHeight(110);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle38);
    obj.label85:setLeft(0);
    obj.label85:setTop(5);
    obj.label85:setWidth(310);
    obj.label85:setHeight(25);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setText("Armazenamento");
    obj.label85:setName("label85");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle38);
    obj.comboBox3:setLeft(5);
    obj.comboBox3:setTop(30);
    obj.comboBox3:setWidth(300);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("armazenamento1");
    obj.comboBox3:setItems({'', 'Coldre', 'Bolsa Grande'});
    obj.comboBox3:setValues({'0','4','6'});
    obj.comboBox3:setName("comboBox3");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle38);
    obj.comboBox4:setLeft(5);
    obj.comboBox4:setTop(55);
    obj.comboBox4:setWidth(300);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("armazenamento2");
    obj.comboBox4:setItems({'', 'Coldre', 'Bolsa Grande'});
    obj.comboBox4:setValues({'0','4','6'});
    obj.comboBox4:setName("comboBox4");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle38);
    obj.comboBox5:setLeft(5);
    obj.comboBox5:setTop(80);
    obj.comboBox5:setWidth(300);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("armazenamento3");
    obj.comboBox5:setItems({'+0', '+1', '+2', '+3', '+4', '+5', '+6'});
    obj.comboBox5:setValues({'0','1','2','3','4','5','6'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle38);
    obj.dataLink16:setFields({'armazenamento1','armazenamento2','armazenamento3'});
    obj.dataLink16:setName("dataLink16");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Descrição");
    obj.tab3:setName("tab3");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab3);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmTemplateDescription);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.scrollBox3);
    obj.rectangle39:setLeft(0);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(1205);
    obj.rectangle39:setHeight(105);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setName("rectangle39");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle39);
    obj.label86:setLeft(3);
    obj.label86:setTop(1);
    obj.label86:setWidth(100);
    obj.label86:setHeight(20);
    obj.label86:setText("DESCRIÇÃO");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle39);
    obj.label87:setLeft(10);
    obj.label87:setTop(25);
    obj.label87:setWidth(90);
    obj.label87:setHeight(20);
    obj.label87:setText("TAMANHO");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle39);
    obj.edit45:setLeft(100);
    obj.edit45:setTop(25);
    obj.edit45:setWidth(200);
    obj.edit45:setHeight(25);
    obj.edit45:setField("tamanho");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setName("edit45");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle39);
    obj.label88:setLeft(10);
    obj.label88:setTop(50);
    obj.label88:setWidth(90);
    obj.label88:setHeight(20);
    obj.label88:setText("ALTURA");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle39);
    obj.edit46:setLeft(100);
    obj.edit46:setTop(50);
    obj.edit46:setWidth(200);
    obj.edit46:setHeight(25);
    obj.edit46:setField("altura");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setName("edit46");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle39);
    obj.label89:setLeft(10);
    obj.label89:setTop(75);
    obj.label89:setWidth(90);
    obj.label89:setHeight(20);
    obj.label89:setText("PESO");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle39);
    obj.edit47:setLeft(100);
    obj.edit47:setTop(75);
    obj.edit47:setWidth(200);
    obj.edit47:setHeight(25);
    obj.edit47:setField("peso");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setName("edit47");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.rectangle39);
    obj.label90:setLeft(310);
    obj.label90:setTop(25);
    obj.label90:setWidth(90);
    obj.label90:setHeight(20);
    obj.label90:setText("IDADE");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle39);
    obj.edit48:setLeft(400);
    obj.edit48:setTop(25);
    obj.edit48:setWidth(200);
    obj.edit48:setHeight(25);
    obj.edit48:setField("idade");
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setName("edit48");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.rectangle39);
    obj.label91:setLeft(310);
    obj.label91:setTop(50);
    obj.label91:setWidth(90);
    obj.label91:setHeight(20);
    obj.label91:setText("SEXO");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.rectangle39);
    obj.edit49:setLeft(400);
    obj.edit49:setTop(50);
    obj.edit49:setWidth(200);
    obj.edit49:setHeight(25);
    obj.edit49:setField("sexo");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setName("edit49");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle39);
    obj.label92:setLeft(310);
    obj.label92:setTop(75);
    obj.label92:setWidth(90);
    obj.label92:setHeight(20);
    obj.label92:setText("OUTROS");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.rectangle39);
    obj.edit50:setLeft(400);
    obj.edit50:setTop(75);
    obj.edit50:setWidth(200);
    obj.edit50:setHeight(25);
    obj.edit50:setField("aparenciaOutros");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setName("edit50");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.rectangle39);
    obj.label93:setLeft(610);
    obj.label93:setTop(25);
    obj.label93:setWidth(90);
    obj.label93:setHeight(20);
    obj.label93:setText("OLHOS");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.rectangle39);
    obj.edit51:setLeft(700);
    obj.edit51:setTop(25);
    obj.edit51:setWidth(200);
    obj.edit51:setHeight(25);
    obj.edit51:setField("aparenciaOlhos");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setName("edit51");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.rectangle39);
    obj.label94:setLeft(610);
    obj.label94:setTop(50);
    obj.label94:setWidth(90);
    obj.label94:setHeight(20);
    obj.label94:setText("PELE");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.rectangle39);
    obj.edit52:setLeft(700);
    obj.edit52:setTop(50);
    obj.edit52:setWidth(200);
    obj.edit52:setHeight(25);
    obj.edit52:setField("pele");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setName("edit52");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle39);
    obj.label95:setLeft(610);
    obj.label95:setTop(75);
    obj.label95:setWidth(90);
    obj.label95:setHeight(20);
    obj.label95:setText("CABELO");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.rectangle39);
    obj.edit53:setLeft(700);
    obj.edit53:setTop(75);
    obj.edit53:setWidth(200);
    obj.edit53:setHeight(25);
    obj.edit53:setField("cabelo");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setName("edit53");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.rectangle39);
    obj.label96:setLeft(910);
    obj.label96:setTop(25);
    obj.label96:setWidth(90);
    obj.label96:setHeight(20);
    obj.label96:setText("TATOO");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.rectangle39);
    obj.edit54:setLeft(1000);
    obj.edit54:setTop(25);
    obj.edit54:setWidth(200);
    obj.edit54:setHeight(25);
    obj.edit54:setField("plano");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setName("edit54");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle39);
    obj.label97:setLeft(910);
    obj.label97:setTop(50);
    obj.label97:setWidth(90);
    obj.label97:setHeight(20);
    obj.label97:setText("CICATRIZES");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.rectangle39);
    obj.edit55:setLeft(1000);
    obj.edit55:setTop(50);
    obj.edit55:setWidth(200);
    obj.edit55:setHeight(25);
    obj.edit55:setField("regiao");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setName("edit55");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle39);
    obj.label98:setLeft(910);
    obj.label98:setTop(75);
    obj.label98:setWidth(90);
    obj.label98:setHeight(20);
    obj.label98:setText("ETNIA");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.rectangle39);
    obj.edit56:setLeft(1000);
    obj.edit56:setTop(75);
    obj.edit56:setWidth(200);
    obj.edit56:setHeight(25);
    obj.edit56:setField("reino");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setName("edit56");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox3);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(110);
    obj.layout25:setWidth(375);
    obj.layout25:setHeight(240);
    obj.layout25:setName("layout25");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout25);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setName("rectangle40");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout25);
    obj.label99:setLeft(5);
    obj.label99:setTop(1);
    obj.label99:setWidth(100);
    obj.label99:setHeight(20);
    obj.label99:setText("CARACTERÍSTICAS");
    obj.label99:setName("label99");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout25);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(365);
    obj.textEditor3:setHeight(210);
    obj.textEditor3:setField("aparencia");
    obj.textEditor3:setName("textEditor3");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox3);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(355);
    obj.layout26:setWidth(375);
    obj.layout26:setHeight(250);
    obj.layout26:setName("layout26");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout26);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setName("rectangle41");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout26);
    obj.label100:setLeft(5);
    obj.label100:setTop(1);
    obj.label100:setWidth(100);
    obj.label100:setHeight(20);
    obj.label100:setText("PERSONALIDADE");
    obj.label100:setName("label100");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout26);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(365);
    obj.textEditor4:setHeight(220);
    obj.textEditor4:setField("personalidade");
    obj.textEditor4:setName("textEditor4");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox3);
    obj.layout27:setLeft(380);
    obj.layout27:setTop(110);
    obj.layout27:setWidth(825);
    obj.layout27:setHeight(495);
    obj.layout27:setName("layout27");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout27);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout27);
    obj.label101:setLeft(5);
    obj.label101:setTop(1);
    obj.label101:setWidth(100);
    obj.label101:setHeight(20);
    obj.label101:setText("PRE-MORTEM");
    obj.label101:setName("label101");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout27);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Anotações");
    obj.tab4:setName("tab4");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab4);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmTemplateNotes);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox4);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(0);
    obj.layout28:setWidth(400);
    obj.layout28:setHeight(580);
    obj.layout28:setName("layout28");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout28);
    obj.rectangle43:setLeft(0);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(400);
    obj.rectangle43:setHeight(580);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(15);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout28);
    obj.label102:setLeft(0);
    obj.label102:setTop(0);
    obj.label102:setWidth(400);
    obj.label102:setHeight(20);
    obj.label102:setText("Anotações Gerais");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout28);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(540);
    obj.textEditor5:setField("anotacoes1");
    obj.textEditor5:setName("textEditor5");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox4);
    obj.layout29:setLeft(410);
    obj.layout29:setTop(0);
    obj.layout29:setWidth(400);
    obj.layout29:setHeight(580);
    obj.layout29:setName("layout29");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout29);
    obj.rectangle44:setLeft(0);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(400);
    obj.rectangle44:setHeight(580);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(5);
    obj.rectangle44:setYradius(15);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout29);
    obj.label103:setLeft(0);
    obj.label103:setTop(0);
    obj.label103:setWidth(400);
    obj.label103:setHeight(20);
    obj.label103:setText("Tarefas");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout29);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(540);
    obj.textEditor6:setField("anotacoes2");
    obj.textEditor6:setName("textEditor6");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox4);
    obj.layout30:setLeft(820);
    obj.layout30:setTop(0);
    obj.layout30:setWidth(400);
    obj.layout30:setHeight(580);
    obj.layout30:setName("layout30");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout30);
    obj.rectangle45:setLeft(0);
    obj.rectangle45:setTop(0);
    obj.rectangle45:setWidth(400);
    obj.rectangle45:setHeight(580);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setXradius(5);
    obj.rectangle45:setYradius(15);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout30);
    obj.label104:setLeft(0);
    obj.label104:setTop(0);
    obj.label104:setWidth(400);
    obj.label104:setHeight(20);
    obj.label104:setText("Diário da Irmandade");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout30);
    obj.textEditor7:setLeft(10);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(380);
    obj.textEditor7:setHeight(540);
    obj.textEditor7:setField("anotacoes3");
    obj.textEditor7:setName("textEditor7");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Creditos");
    obj.tab5:setName("tab5");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab5);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateCreditos);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox5);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(500);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("logo");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox5);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/TheMaze/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox5);
    obj.layout31:setLeft(850);
    obj.layout31:setTop(0);
    obj.layout31:setWidth(200);
    obj.layout31:setHeight(160);
    obj.layout31:setName("layout31");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout31);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setXradius(5);
    obj.rectangle46:setYradius(15);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout31);
    obj.label105:setLeft(0);
    obj.label105:setTop(10);
    obj.label105:setWidth(200);
    obj.label105:setHeight(20);
    obj.label105:setText("Programado por: ");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout31);
    obj.label106:setLeft(0);
    obj.label106:setTop(35);
    obj.label106:setWidth(200);
    obj.label106:setHeight(20);
    obj.label106:setText("Vinny (Ambesek)");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout31);
    obj.label107:setLeft(0);
    obj.label107:setTop(60);
    obj.label107:setWidth(200);
    obj.label107:setHeight(20);
    obj.label107:setText("Consultor: Yagorok");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.scrollBox5);
    obj.label108:setLeft(555);
    obj.label108:setTop(275);
    obj.label108:setWidth(200);
    obj.label108:setHeight(20);
    obj.label108:setText("Versão Atual: ");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setField("versionInstalled");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.scrollBox5);
    obj.label109:setLeft(555);
    obj.label109:setTop(300);
    obj.label109:setWidth(200);
    obj.label109:setHeight(20);
    obj.label109:setText("Sua Versão: ");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setField("versionDownloaded");
    obj.label109:setName("label109");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox5);
    obj.checkBox1:setLeft(555);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox5);
    obj.button1:setLeft(555);
    obj.button1:setTop(350);
    obj.button1:setWidth(100);
    obj.button1:setText("Change Log");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.scrollBox5);
    obj.button2:setLeft(667);
    obj.button2:setTop(350);
    obj.button2:setWidth(100);
    obj.button2:setText("Atualizar");
    obj.button2:setName("button2");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.scrollBox5);
    obj.label110:setLeft(555);
    obj.label110:setTop(400);
    obj.label110:setWidth(200);
    obj.label110:setHeight(20);
    obj.label110:setText("Conheça as Mesas:");
    obj.label110:setName("label110");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox5);
    obj.button3:setLeft(555);
    obj.button3:setTop(425);
    obj.button3:setWidth(100);
    obj.button3:setText("RPGmeister");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox5);
    obj.button4:setLeft(667);
    obj.button4:setTop(425);
    obj.button4:setWidth(125);
    obj.button4:setText("RPG The Maze");
    obj.button4:setName("button4");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true",
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
                                Dialogs.choose("Há uma nova versão (" .. info.version .. ") desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true');
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
                        end, "checkForModification");
        end, obj);

    obj._e_event1 = obj.edit2:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            					local mod = (tonumber(sheet.experiencia) or 0);
            					local mod2 = 0;
            					local mod3 = 0;
            					while mod>=mod2 do
            						mod3 = mod3+1;
            						mod2 = mod2 + mod3*5;
            					end
            
            					sheet.nivel = mod3;
        end, obj);

    obj._e_event2 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            
            					-- Alquimista
            					if sheet.aptidao == "1" then
            						sheet.agilidade_inicial = 1;
            						sheet.cac_inicial = 1;
            						sheet.manuseio_inicial = 4;
            						sheet.pontaria_inicial = 2;
            						sheet.paranormalidade_inicial = 2;
            						sheet.sorte_inicial = 3;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						if habilidades[1].habilidade == nil then
            							habilidades[1].habilidade = [[Optimização (Passiva)
            	Estágio 1-3: Itens Consumíveis têm seus efeitos ampliados a cada Estágio desta Habilidade. 
            	Estágio 2: Recebe mais do mesmo Item do tipo Consumível. 
            	Estágio 3: Equipamentos concedem 20% a mais de Resistência.]]
            						end;
            						if habilidades[2].habilidade == nil then
            							habilidades[2].habilidade = [[Círculo de Alquimia (Instantânea)
            	Estágio 1: Cria uma área que concede Vigor ao Personagem sobre ela (1-6pt + 1pt p/ Rodada). 
            	Estágio 2-3(+1): Copia a última Habilidade usada por um Aliado no Círculo (+ efeito). 
            	Estágio 3(+1): Receber Dano no Círculo restitui parte da Fadiga gasta na Rodada (+ efeito).]]
            						end;
            						if habilidades[3].habilidade == nil then
            							habilidades[3].habilidade = [[As Três Etapas
            	Estágio 1: Mistura Itens Consumíveis para lhes dar novos efeitos (1pt). 
            	Estágio 2: A mistura de Itens libera Dano Paranormal em área no processo (2pt). 
            	Estágio 3: Fundir Itens iguais concede a versão Superior que pode ser guardado (1pt).]]
            						end;
            						if habilidades[4].habilidade == nil then
            							habilidades[4].habilidade = [[Colecionador (Passiva)
            	Estágio 1: Aprimora o estaque de Itens iguais. 
            	Estágio 2: Recebe Itens extras de Drops. 
            	Estágio 3: Melhora as chances no texte de Drop. ]]
            						end;
            						if habilidades[5].habilidade == nil then
            							habilidades[5].habilidade = [[Transmutação
            	Estágio 1-3: Modifica a Arma que empunha para outra do mesmo tipo (1pt p/ Rodada). 
            	Estágio 2(+1): Pode usar Transmutação na Arma do Aliado no Círculo (+ efeito). 
            	Estágio 3(+1): Usa mais Fadiga para conceder Aprimoramentos à Arma (xpt). ]]
            						end;
            					
            					-- Arcanista
            					elseif sheet.aptidao=="2" then
            						sheet.agilidade_inicial = 1;
            						sheet.cac_inicial = 1;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 3;
            						sheet.paranormalidade_inicial = 4;
            						sheet.sorte_inicial = 2;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						if habilidades[1].habilidade == nil then
            							habilidades[1].habilidade = [[6º Sentido (Passiva):
            	Estágio 1-3: Ganha 2 pontos de Fadiga máximos a cada Estágio desta Habilidade.
            	Estágio 2: Concede bônus de Conjuração.
            	Estágio 3: Habilidades do Arcanista causam Dano Paranormal aumentado.]]
            						end;
            						if habilidades[2].habilidade == nil then
            							habilidades[2].habilidade = [[Aura Protetora (Instantânea):
            	Estágio 1: Concede uma Aura a um Personagem que nega Dano recebido (1pt).
            	Estágio 2(+1): Cria mais Auras Protetoras na mesma Ação (máx. 3pt).
            	Estágio 3(+1): Aumenta a força das Aura Protetoras (+ efeito)(máx. 3pt p/ Aura).]]
            						end;
            						if habilidades[3].habilidade == nil then
            							habilidades[3].habilidade = [[Símbolo Arcano:
            	Estágio 1: Concede uma marca de energia Paranormal a um Personagem (1pt p/ estaque)(máx. 3pt).
            	Estágio 2(+1): A marca concede bônus de Conjuração e Ampliação ao portador (+ efeito).
            	Estágio 3(+1): A marca concede Imunidade ao portador (+ efeito).]]
            						end;
            						if habilidades[4].habilidade == nil then
            							habilidades[4].habilidade = [[Essência Paranormal (Passiva):
            	Estágio 1: Concede Amplificação.
            	Estágio 2: Concede Negação passiva além de causar Negação escalável a cada Habilidade no mesmo Inimigo.
            	Estágio 3: Concede Regeneração de Fadiga baseado no Nível do Personagem.]]
            						end;
            						if habilidades[5].habilidade == nil then
            							habilidades[5].habilidade = [[Conjuração Telecinética:
            	Estágio 1: Usa Telecinese para flutuar um Inimigo ou um objeto (1pt p/ Rodada).
            	Estágio 2(+1): Telecinese Paralisa Inimigos e causa Dano Paranormal (2pt p/ Inimigo).
            	Estágio 3(+2): Gastar mais Fadiga aumenta o Dano Paranormal da Telecinese (+ efeito)(máx. 3pt p/ Telecinese).]]
            						end;
            					
            					-- Caçador
            					elseif sheet.aptidao=="3" then
            						sheet.agilidade_inicial = 3;
            						sheet.cac_inicial = 1;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 4;
            						sheet.paranormalidade_inicial = 1;
            						sheet.sorte_inicial = 2;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						if habilidades[1].habilidade == nil then
            							habilidades[1].habilidade = [[Focus (Passiva)
            	Estágio 1: O Caçador tem passivamente 40% de resistência a Desaceleração e Imobilização. 
            	Estágio 1-3: Concede aumento da chance de Esquiva a cada Estágio desta Habilidade.
            	Estágio 3: Concede passivamente Dano ampliado para lançamentos de Pontaria.]]
            						end;
            						if habilidades[2].habilidade == nil then
            							habilidades[2].habilidade = [[Armadilha
            	Estágio 1: Em modo Furtivo posiciona até duas Armadilhas em campo (1 Mat.).
            	Estágio 2-3(+1): Causa Atordoamento e Desaceleração em Inimigos que ativarem uma Armadilha (+ efeito).
            	Estágio 3(+1): Confecciona Armadilhas mais fortes usando mais Materiais (+ efeito)(máx. 3 Mat. p/ Armadilha).]]
            						end;
            						if habilidades[3].habilidade == nil then
            							habilidades[3].habilidade = [[Veterano na Caçada (Passiva)
            	Estágio 1: Materiais para Armadilha não consomem espaço no Inventário.
            	Estágio 1-3: A cada Estágio melhora a técnica de Arrombamento.
            	Estágio 3: Amplifica os efeitos do modo Furtivo.]]
            						end;
            						if habilidades[4].habilidade == nil then
            							habilidades[4].habilidade = [[Furtividade (Instantânea)
            	Estágio 1: Entra em modo Furtivo se não for alvo de ataques (1pt p/ Rodada).
            	Estágio 2(+1): Entrar em modo Furtivo não consome a Ação (+ efeito).
            	Estágio 3(+1): Entrar em modo Furtivo retira Desaceleração, Paralização, Imobilização e Atordoamento (+ efeito)(2pt).]]
            						end;
            						if habilidades[5].habilidade == nil then
            							habilidades[5].habilidade = [[Letalidade Silenciosa
            	Estágio 1: Em modo Furtivo utiliza um ataque de Dano Físico elevado se estiver atrás do Inimigo (2pt).
            	Estágio 2(+1): Se esta Habilidade derrotar o Inimigo seu custo de Fadiga é restituído (+ efeito)
            	Estágio 3(+1): Se esta Habilidade derrotar o Inimigo Caçador não sai do modo Furtivo (+ efeito).]]
            						end;
            
            					-- Cavaleiro
            					elseif sheet.aptidao=="4" then
            						sheet.agilidade_inicial = 3;
            						sheet.cac_inicial = 4;
            						sheet.manuseio_inicial = 1;
            						sheet.pontaria_inicial = 2;
            						sheet.paranormalidade_inicial = 1;
            						sheet.sorte_inicial = 2;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						if habilidades[1].habilidade == nil then
            							habilidades[1].habilidade = [[Constituição (Passiva)
            	Estágio 1: É Imune à Paralisação, Impelimento e Atordoamento proveniente de ataques Físicos.
            	Estágio 1-3: Concede aumento de Resistência Física a cada Estágio desta Habilidade.
            	Estágio 3: Concede passivamente Dano ampliado para lançamentos de Corpo-a-Corpo.]]
            						end;
            						if habilidades[2].habilidade == nil then
            							habilidades[2].habilidade = [[Brado de Glória
            	Estágio 1: Provoca Inimigos Físicos em campo e recebe redução de Dano Físico (2pt).
            	Estágio 2(+1): Concede Vigor de Corpo-a-Corpo contra Inimigos Provocados (+ efeito).
            	Estágio 3(+1): Enquanto houver Inimigos Provocados pelo Brado de Glória, concede Amplificação (+ efeito).]]
            						end;
            						if habilidades[3].habilidade == nil then
            							habilidades[3].habilidade = [[Força Destrutiva
            	Estágio 1: Aplica um golpe com Dano Físico elevado (1pt).
            	Estágio 2(+1): Pode concentrar mais Dano em Força Destrutiva (+ efeito)(máx. 3pt).
            	Estágio 3(+1): Esta Habilidade causa Paralisação e Fratura ao alvo (+ efeito).]]
            						end;
            						if habilidades[4].habilidade == nil then
            							habilidades[4].habilidade = [[Mestre da Batalha (Passiva)
            	Estágio 1: Concede Regeneração de Vida baseado no Nível do Personagem. 
            	Estágio 2: Crítico de Corpo-a-Corpo causa ainda mais Dano Físico. 
            	Estágio 3: Cavaleiro não pode perder mais de 30% da sua Vida máxima em uma Rodada. ]]
            						end;
            						if habilidades[5].habilidade == nil then
            							habilidades[5].habilidade = [[Defesa Inabalável (Instantânea)
            	Estágio 1: Concede um teste que reduz muito o Dano Físico recebido (1pt).
            	Estágio 2: Defesa não consome a Ação. (+ efeito).
            	Estágio 3: Concede Contra-Ataque após a Defesa. (+efeito).]]
            						end;
            						
            					-- Monge
            					elseif sheet.aptidao=="5" then
            						sheet.agilidade_inicial = 4;
            						sheet.cac_inicial = 3;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 1;
            						sheet.paranormalidade_inicial = 2;
            						sheet.sorte_inicial = 1;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						if habilidades[1].habilidade == nil then
            							habilidades[1].habilidade = [[Taijutsu (Passiva)
            	Estágio 1: Pode atacar sem usar Armas (2 de Dano Físico)(sem Dano Crítico). 
            	Estágio 1-3: Aumenta a chance de Crítico para o lançamento de CaC a cada Estágio desta Habilidade.
            	Estágio 3: Consome menos Ação para dar Bloqueio.]]
            						end;
            						if habilidades[2].habilidade == nil then
            							habilidades[2].habilidade = [[O Estilo Secreto 
            	Estágio 1: Acerto Crítico de Taijutsu concede chance de usar Taijutsu novamente (1pt). 
            	Estágio 2-3(+1): O número de repetições desta Habilidade é o mesmo de seu Estágio (1pt p/ repetição). 
            	Estágio 3: Acerto Crítico da Palma do Dragão e do Estilo do Leopardo ativam o Estilo Secreto (+efeito). ]]
            						end;
            						if habilidades[3].habilidade == nil then
            							habilidades[3].habilidade = [[Chacra (Passiva)
            	Estágio 1: Ataques do Monge causam Impelimento escalável a cada golpe no mesmo Inimigo. 
            	Estágio 2: Concede Taijutsu Sacerdotal (Paranormalidade também ativa o Estilo Secreto). 
            	Estágio 3: Causar três vezes Dano a um Inimigo, na mesma Rodada, o deixa Silenciado. ]]
            						end;
            						if habilidades[4].habilidade == nil then
            							habilidades[4].habilidade = [[A Palma do Dragão (Instantânea)
            	Estágio 1: Causa todo Dano Físico recebido na Rodada em Dano a um Inimigo + Dano do Taijutsu (2pt). 
            	Estágio 2(+1): Palma do Dragão como Contra-Ataque não consome a Ação (+ efeito). 
            	Estágio 3(+1): Reverte Status Anormais recebidos no ataque Inimigo (+efeito). ]]
            						end;
            						if habilidades[5].habilidade == nil then
            							habilidades[5].habilidade = [[O Estilo do Leopardo
            	Estágio 1: Ataca dois Inimigos com o Dano do Taijutsu (1pt). 
            	Estágio 2(+1): Pode encadear mais Inimigos , porém, o lançamento fica mais difícil a cada golpe (1pt p/ repetição). 
            	Estágio 3(+1): Depois de atacar três Inimigos pode atacar novamente o primeiro o deixando Fragilizado (+ efeito). ]]
            						end;
            					
            					-- Necromante
            					elseif sheet.aptidao=="6" then
            						sheet.agilidade_inicial = 1;
            						sheet.cac_inicial = 1;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 3;
            						sheet.paranormalidade_inicial = 4;
            						sheet.sorte_inicial = 2;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						if habilidades[1].habilidade == nil then
            							habilidades[1].habilidade = [[Profanador Sanguinolento (Passiva) 
            	Estágio 1: Ataques e Habilidades do Necromante causam Dano do tipo Corrosivo, caso queira.
            	Estágio 1-3: Concede 10% de resistência a Status Anormais a cada Estágio desta Habilidade.
            	Estágio 3: Inimigos com Sangramento e Envenenamento recebem Dano ampliado do Necromante. ]]
            						end;
            						if habilidades[2].habilidade == nil then
            							habilidades[2].habilidade = [[Reanimação
            	Estágio 1: Reanima um Inimigo Inconsciente ao seu favor na Batalha (x pontos de Vida + 1 ponto de Vida p/ Rodada).
            	Estágio 2(+1): Ordena o Inimigo reanimado a utilizar uma Habilidade sua, porém, ele morre em seguida (1-3pt).
            	Estágio 3(+1): Reanima mais Inimigos Inconscientes em campo (+ efeito)(x pontos de Vida p/ Inimigo).]]
            						end;
            						if habilidades[3].habilidade == nil then
            							habilidades[3].habilidade = [[Exército de Almas (Instantânea) 
            	Estágio 1: Invoca a alma dos Inimigos Inconscientes no campo para atacar adversários ou defender a si e Aliados (2pt).
            	Estágio 2(+1): Dependendo da quantidade de almas atacantes causa Status Anormais variados aos alvos (+ efeito)
            	Estágio 3(+1): Exército de Almas não consome a Ação  (+ efeito).]]
            						end;
            						if habilidades[4].habilidade == nil then
            							habilidades[4].habilidade = [[Hemodominus
            	Estágio 1: Absorve parte da Vida de um Inimigo do tipo Físico em campo (1pt).
            	Estágio 2: Inimigos atingidos pelo Hemodominus recebem Sangramento (+efeito).
            	Estágio 3: Pode aumentar a quantidade de absorção de Vida (máx. 3pt).]]
            						end;
            						if habilidades[5].habilidade == nil then
            							habilidades[5].habilidade = [[Senhor da Morte (Passiva)
            	Estágio 1: Concede Negação baseada no Nível do Personagem.
            	Estágio 2: Concede aumento dos efeitos causados pelos Status Anormais aplicados pelas Habilidades do Necromante.
            	Estágio 3: Concede Regeneração de Vida e Fadiga (não regenera caso esteja usando "Reanimação").]]
            						end;
            						
            					-- Xamã
            					elseif sheet.aptidao=="7" then
            						sheet.agilidade_inicial = 2;
            						sheet.cac_inicial = 3;
            						sheet.manuseio_inicial = 2;
            						sheet.pontaria_inicial = 2;
            						sheet.paranormalidade_inicial = 3;
            						sheet.sorte_inicial = 1;
            						local habilidades = ndb.getChildNodes(sheet.listaDeHabilidades);
            						if habilidades[1].habilidade == nil then
            							habilidades[1].habilidade = [[Tatuagem Rúnica (Passiva) 
            	Estágio 1: Pode usar todos os pontos do Atributo nos testes de Resistência.
            	Estágio 2: Sobre efeito de Status Anormais Xamã ganha redução de Dano aumentado.
            	Estágio 1-3: Ganha 3 pontos de Vida máximos a cada Estágio desta Habilidade.
            						]]end;
            						if habilidades[2].habilidade == nil then
            							habilidades[2].habilidade = [[Oração Ancestral (Instantânea) 
            	Estágio 1: Concede Vigor a Aliados, mas Xamã fica Atordoado (xpt + 1pt p/ Rodada).
            	Estágio 2(+1): Aliados com Vigor desta Habilidade recebem redução de Dano aumentado (+ efeito).
            	Estágio 3(+1): Aliados com Vigor desta Habilidade recebem Resistência a Status Anormais aumentado (+ efeito).]]
            						end;
            						if habilidades[3].habilidade == nil then
            							habilidades[3].habilidade = [[O Voo Sagrado do Condor
            	Estágio 1: Colide contra um Inimigo o Paralisando e Provocando os demais (1pt).
            	Estágio 2(+1): Inimigos Provocados ficam Atordoados para ataques sobre o Xamã (+ efeito).
            	Estágio 3(+1): O Inimigo colidido pelo Xamã perde Tenacidade, Aceleração e recebe Desaceleração (+ efeito).]]
            						end;
            						if habilidades[4].habilidade == nil then
            							habilidades[4].habilidade = [[O Chamado dos Espíritos (Passiva) 
            	Estágio 1: Inimigos derrotados com ajuda de Oração Ancestral curam um pouco da Vida do Xamã.
            	Estágio 2: Curas excedentes desta Habilidade curam Aliados ao invés do Xamã.
            	Estágio 3: A cura desta Habilidade remove Status Anormais.]]
            						end;
            						if habilidades[5].habilidade == nil then
            							habilidades[5].habilidade = [[Chama Violeta
            	Estágio 1: Cura um pouco da Vida de um Aliado (1pt).
            	Estágio 2(+1): Aumenta a quantidade de Cura ou a quantidade de Aliados curados (máx. 3pt).
            	Estágio 3(+1): Chama Violeta concede Ampliação (+ efeito).]]
            						end;
            						
            					end;
        end, obj);

    obj._e_event3 = obj.edit3:addEventListener("onChange",
        function (_)
            if sheet==nil then return end;
            					local mod = (tonumber(sheet.progresso) or 0);
            					local mod2 = 0;
            					local mod3 = 0;
            					while mod>=mod2 do
            						mod3 = mod3+1;
            						mod2 = mod2 + mod3*5;
            					end
            
            					sheet.rank = mod3;
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local nivel = (tonumber(sheet.nivel) or 0);
            					sheet.vidaBase = 5 + (nivel * 3);
            					sheet.fadigaBase = 1 + (nivel * 2);
            					sheet.atr_max = 64 + (nivel * 3);
            					sheet.habilidadesDisponivel = math.min((nivel * 2) + 1, 15);
        end, obj);

    obj._e_event5 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local vida = 	(tonumber(sheet.vidaBase) or 0) + 
            									(tonumber(sheet.vidaCompensacao) or 0);
            					sheet.vidaAtual = vida;
        end, obj);

    obj._e_event6 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local fadiga = 	(tonumber(sheet.fadigaBase) or 0) + 
            									(tonumber(sheet.fadigaCompensacao) or 0);
            					sheet.fadigaAtual = fadiga;
        end, obj);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.agilidade_inicial) or 0) + 
            								(tonumber(sheet.agilidade_nivel) or 0) + 
            								(tonumber(sheet.agilidade_outros) or 0);
            				sheet.agilidade_total = total;
        end, obj);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.cac_inicial) or 0) + 
            								(tonumber(sheet.cac_nivel) or 0) + 
            								(tonumber(sheet.cac_outros) or 0);
            				sheet.cac_total = total;
        end, obj);

    obj._e_event9 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.manuseio_inicial) or 0) + 
            								(tonumber(sheet.manuseio_nivel) or 0) + 
            								(tonumber(sheet.manuseio_outros) or 0);
            				sheet.manuseio_total = total;
        end, obj);

    obj._e_event10 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.pontaria_inicial) or 0) + 
            								(tonumber(sheet.pontaria_nivel) or 0) + 
            								(tonumber(sheet.pontaria_outros) or 0);
            				sheet.pontaria_total = total;
        end, obj);

    obj._e_event11 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.paranormalidade_inicial) or 0) + 
            								(tonumber(sheet.paranormalidade_nivel) or 0) + 
            								(tonumber(sheet.paranormalidade_outros) or 0);
            				sheet.paranormalidade_total = total;
        end, obj);

    obj._e_event12 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.sorte_inicial) or 0) + 
            								(tonumber(sheet.sorte_nivel) or 0) + 
            								(tonumber(sheet.sorte_outros) or 0);
            				sheet.sorte_total = total;
        end, obj);

    obj._e_event13 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					
            					local max = tonumber(sheet.atr_max) or 0;
            					local gastos = tonumber(sheet.sum_total) or 0;
            					if max > gastos then
            						self.atr_max.fontColor = "#00FF00";
            					elseif max < gastos then
            						self.atr_max.fontColor = "#FF0000";
            					else
            						self.atr_max.fontColor = "#FFFFFF";
            					end;
        end, obj);

    obj._e_event14 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local res = (tonumber(sheet.cac_total) or 0);
            					res = math.floor(res/2);
        end, obj);

    obj._e_event15 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local res = (tonumber(sheet.paranormalidade_total) or 0);
            					res = math.floor(res/2);
        end, obj);

    obj._e_event16 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local sum = (tonumber(sheet.sum_inicial) or 0) + 
            								(tonumber(sheet.sum_nivel) or 0);
            					sheet.sum_total = sum;
        end, obj);

    obj._e_event17 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local sum = 	(tonumber(sheet.agilidade_inicial) or 0) + 
            									(tonumber(sheet.cac_inicial) or 0) + 
            									(tonumber(sheet.manuseio_inicial) or 0) + 
            									(tonumber(sheet.pontaria_inicial) or 0) + 
            									(tonumber(sheet.paranormalidade_inicial) or 0) + 
            									(tonumber(sheet.sorte_inicial) or 0);
            					sheet.sum_inicial = sum;
        end, obj);

    obj._e_event18 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local sum = 	(tonumber(sheet.agilidade_nivel) or 0) + 
            									(tonumber(sheet.cac_nivel) or 0) + 
            									(tonumber(sheet.manuseio_nivel) or 0) + 
            									(tonumber(sheet.pontaria_nivel) or 0) + 
            									(tonumber(sheet.paranormalidade_nivel) or 0) + 
            									(tonumber(sheet.sorte_nivel) or 0);
            					sheet.sum_nivel = sum;
        end, obj);

    obj._e_event19 = obj.rclHabilidades:addEventListener("onEndEnumeration",
        function (_)
            if sheet== nil then return end;
            				
            				local objetos = ndb.getChildNodes(sheet.listaDeHabilidades);
            				if objetos[1].nivel == nil then
            					objetos[1].nivel = 1;
            				end;
        end, obj);

    obj._e_event20 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event21 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local armazenamento1 = (tonumber(sheet.armazenamento1) or 0);
            					local armazenamento2 = (tonumber(sheet.armazenamento2) or 0);
            					local armazenamento3 = (tonumber(sheet.armazenamento3) or 0);
            					local tamanho = 8 + armazenamento1 + armazenamento2 + armazenamento3;
            					sheet.inventarioTamanho = tamanho;
            					self.rclInventario.minQt = tamanho;
            
            					local objetos = ndb.getChildNodes(sheet.listaDeItens);
            
            					if #objetos > tamanho then
            						local excesso = #objetos - tamanho;
            						showMessage("Você possui " .. excesso .. " itens além do limite.");
            					end;
        end, obj);

    obj._e_event22 = obj.button1:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/README.md')
        end, obj);

    obj._e_event23 = obj.button2:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true')
        end, obj);

    obj._e_event24 = obj.button3:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event25 = obj.button4:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=130746');
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.rclHabilidades ~= nil then self.rclHabilidades:destroy(); self.rclHabilidades = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.atr_max ~= nil then self.atr_max:destroy(); self.atr_max = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rclInventario ~= nil then self.rclInventario:destroy(); self.rclInventario = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.frmBase ~= nil then self.frmBase:destroy(); self.frmBase = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMain()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMain();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMain = {
    newEditor = newfrmMain, 
    new = newfrmMain, 
    name = "frmMain", 
    dataType = "Ambesek.Nefertyne.TheMaze", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha The Maze", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);
Firecast.registrarDataType(_frmMain);

return _frmMain;
