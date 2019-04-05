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
    obj.rectangle1:setWidth(305);
    obj.rectangle1:setHeight(305);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(0);
    obj.image1:setTop(1);
    obj.image1:setWidth(303);
    obj.image1:setHeight(303);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(310);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(600);
    obj.rectangle2:setHeight(60);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setTop(5);
    obj.label1:setWidth(75);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setLeft(80);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(75);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Aptidão");
    obj.label2:setName("label2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle2);
    obj.comboBox1:setLeft(80);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("aptidao");
    obj.comboBox1:setItems({'Alquimista', 'Arcanista', 'Caçador', 'Cavaleiro', 'Monge', 'Necromante', 'Xamã', 'Atirador', 'Cigano', 'Hoplita', 'Ronin', 'Executor'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9','10','11','12'});
    obj.comboBox1:setName("comboBox1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setLeft(225);
    obj.label3:setTop(5);
    obj.label3:setWidth(75);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Nível");
    obj.label3:setName("label3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setLeft(300);
    obj.rectangle3:setTop(5);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(300);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setField("nivel");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle2);
    obj.label5:setLeft(225);
    obj.label5:setTop(30);
    obj.label5:setWidth(75);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Rank");
    obj.label5:setName("label5");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle2);
    obj.rectangle4:setLeft(300);
    obj.rectangle4:setTop(30);
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setLeft(300);
    obj.label6:setTop(30);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setField("rank");
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle2);
    obj.label7:setLeft(345);
    obj.label7:setTop(5);
    obj.label7:setWidth(100);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("Experiência");
    obj.label7:setName("label7");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle2);
    obj.edit2:setLeft(440);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("experiencia");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle2);
    obj.label8:setLeft(345);
    obj.label8:setTop(30);
    obj.label8:setWidth(100);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("Progresso");
    obj.label8:setName("label8");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle2);
    obj.edit3:setLeft(440);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("progresso");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle2);
    obj.label9:setLeft(480);
    obj.label9:setTop(5);
    obj.label9:setWidth(75);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setText("Mergo");
    obj.label9:setName("label9");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle2);
    obj.edit4:setLeft(545);
    obj.edit4:setTop(5);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("mergo");
    obj.edit4:setName("edit4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle2);
    obj.label10:setLeft(480);
    obj.label10:setTop(30);
    obj.label10:setWidth(75);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Aruman");
    obj.label10:setName("label10");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle2);
    obj.edit5:setLeft(545);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("pecas");
    obj.edit5:setName("edit5");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setField("nivel");
    obj.dataLink1:setName("dataLink1");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(310);
    obj.rectangle5:setTop(65);
    obj.rectangle5:setWidth(285);
    obj.rectangle5:setHeight(240);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle5);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(285);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("Atributos Básicos");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle5);
    obj.label12:setLeft(75);
    obj.label12:setTop(30);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("Natural");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle5);
    obj.label13:setLeft(125);
    obj.label13:setTop(30);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("Adicional");
    obj.label13:setFontSize(11);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle5);
    obj.label14:setLeft(175);
    obj.label14:setTop(30);
    obj.label14:setWidth(50);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("Total");
    obj.label14:setFontSize(11);
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle5);
    obj.label15:setLeft(225);
    obj.label15:setTop(30);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Perícia");
    obj.label15:setFontSize(11);
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle5);
    obj.label16:setLeft(0);
    obj.label16:setTop(55);
    obj.label16:setWidth(75);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("Agilidade");
    obj.label16:setFontSize(13);
    obj.label16:setName("label16");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle5);
    obj.edit6:setLeft(75);
    obj.edit6:setTop(55);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("agilidade_nivel");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle5);
    obj.edit7:setLeft(125);
    obj.edit7:setTop(55);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("agilidade_outros");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setLeft(175);
    obj.rectangle6:setTop(55);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle5);
    obj.label17:setLeft(175);
    obj.label17:setTop(55);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setField("agilidade_total");
    obj.label17:setName("label17");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.rectangle5);
    obj.rectangle7:setLeft(225);
    obj.rectangle7:setTop(55);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle5);
    obj.label18:setLeft(225);
    obj.label18:setTop(55);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setField("agilidade_pericia");
    obj.label18:setName("label18");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle5);
    obj.dataLink2:setFields({'agilidade_nivel', 'agilidade_outros'});
    obj.dataLink2:setName("dataLink2");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle5);
    obj.label19:setLeft(0);
    obj.label19:setTop(80);
    obj.label19:setWidth(75);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Corpo-a-Corpo");
    obj.label19:setFontSize(10);
    obj.label19:setName("label19");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle5);
    obj.edit8:setLeft(75);
    obj.edit8:setTop(80);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("cac_nivel");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle5);
    obj.edit9:setLeft(125);
    obj.edit9:setTop(80);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("cac_outros");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle5);
    obj.rectangle8:setLeft(175);
    obj.rectangle8:setTop(80);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle5);
    obj.label20:setLeft(175);
    obj.label20:setTop(80);
    obj.label20:setWidth(50);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setField("cac_total");
    obj.label20:setName("label20");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.rectangle5);
    obj.rectangle9:setLeft(225);
    obj.rectangle9:setTop(80);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle5);
    obj.label21:setLeft(225);
    obj.label21:setTop(80);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setField("cac_pericia");
    obj.label21:setName("label21");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle5);
    obj.dataLink3:setFields({'cac_nivel', 'cac_outros'});
    obj.dataLink3:setName("dataLink3");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle5);
    obj.label22:setLeft(0);
    obj.label22:setTop(105);
    obj.label22:setWidth(75);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setText("Destreza");
    obj.label22:setFontSize(13);
    obj.label22:setName("label22");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle5);
    obj.edit10:setLeft(75);
    obj.edit10:setTop(105);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("manuseio_nivel");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.rectangle5);
    obj.edit11:setLeft(125);
    obj.edit11:setTop(105);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("manuseio_outros");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle5);
    obj.rectangle10:setLeft(175);
    obj.rectangle10:setTop(105);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle5);
    obj.label23:setLeft(175);
    obj.label23:setTop(105);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setField("manuseio_total");
    obj.label23:setName("label23");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.rectangle5);
    obj.rectangle11:setLeft(225);
    obj.rectangle11:setTop(105);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle5);
    obj.label24:setLeft(225);
    obj.label24:setTop(105);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setField("manuseio_pericia");
    obj.label24:setName("label24");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle5);
    obj.dataLink4:setFields({'manuseio_nivel', 'manuseio_outros'});
    obj.dataLink4:setName("dataLink4");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle5);
    obj.label25:setLeft(0);
    obj.label25:setTop(130);
    obj.label25:setWidth(75);
    obj.label25:setHeight(25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setText("Precisão");
    obj.label25:setFontSize(13);
    obj.label25:setName("label25");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.rectangle5);
    obj.edit12:setLeft(75);
    obj.edit12:setTop(130);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("pontaria_nivel");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.rectangle5);
    obj.edit13:setLeft(125);
    obj.edit13:setTop(130);
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setField("pontaria_outros");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle5);
    obj.rectangle12:setLeft(175);
    obj.rectangle12:setTop(130);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle5);
    obj.label26:setLeft(175);
    obj.label26:setTop(130);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setField("pontaria_total");
    obj.label26:setName("label26");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.rectangle5);
    obj.rectangle13:setLeft(225);
    obj.rectangle13:setTop(130);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle5);
    obj.label27:setLeft(225);
    obj.label27:setTop(130);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setField("pontaria_pericia");
    obj.label27:setName("label27");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle5);
    obj.dataLink5:setFields({'pontaria_nivel', 'pontaria_outros'});
    obj.dataLink5:setName("dataLink5");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle5);
    obj.label28:setLeft(0);
    obj.label28:setTop(155);
    obj.label28:setWidth(75);
    obj.label28:setHeight(25);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setText("Paranormalidade");
    obj.label28:setFontSize(9);
    obj.label28:setName("label28");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.rectangle5);
    obj.edit14:setLeft(75);
    obj.edit14:setTop(155);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("paranormalidade_nivel");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.rectangle5);
    obj.edit15:setLeft(125);
    obj.edit15:setTop(155);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("paranormalidade_outros");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle5);
    obj.rectangle14:setLeft(175);
    obj.rectangle14:setTop(155);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle5);
    obj.label29:setLeft(175);
    obj.label29:setTop(155);
    obj.label29:setWidth(50);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setField("paranormalidade_total");
    obj.label29:setName("label29");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.rectangle5);
    obj.rectangle15:setLeft(225);
    obj.rectangle15:setTop(155);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle5);
    obj.label30:setLeft(225);
    obj.label30:setTop(155);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setField("paranormalidade_pericia");
    obj.label30:setName("label30");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle5);
    obj.dataLink6:setFields({'paranormalidade_nivel', 'paranormalidade_outros'});
    obj.dataLink6:setName("dataLink6");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle5);
    obj.label31:setLeft(0);
    obj.label31:setTop(180);
    obj.label31:setWidth(75);
    obj.label31:setHeight(25);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("Sorte");
    obj.label31:setFontSize(13);
    obj.label31:setName("label31");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.rectangle5);
    obj.edit16:setLeft(75);
    obj.edit16:setTop(180);
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setField("sorte_nivel");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.rectangle5);
    obj.edit17:setLeft(125);
    obj.edit17:setTop(180);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("sorte_outros");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle5);
    obj.rectangle16:setLeft(175);
    obj.rectangle16:setTop(180);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle5);
    obj.label32:setLeft(175);
    obj.label32:setTop(180);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setField("sorte_total");
    obj.label32:setName("label32");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle5);
    obj.rectangle17:setLeft(225);
    obj.rectangle17:setTop(180);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle5);
    obj.label33:setLeft(225);
    obj.label33:setTop(180);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setField("sorte_pericia");
    obj.label33:setName("label33");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle5);
    obj.dataLink7:setFields({'sorte_nivel', 'sorte_outros'});
    obj.dataLink7:setName("dataLink7");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle5);
    obj.rectangle18:setLeft(15);
    obj.rectangle18:setTop(210);
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.atr_max = GUI.fromHandle(_obj_newObject("label"));
    obj.atr_max:setParent(obj.rectangle5);
    obj.atr_max:setLeft(15);
    obj.atr_max:setTop(210);
    obj.atr_max:setWidth(50);
    obj.atr_max:setHeight(25);
    obj.atr_max:setHorzTextAlign("center");
    obj.atr_max:setField("atr_max");
    obj.atr_max:setName("atr_max");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle5);
    obj.rectangle19:setLeft(75);
    obj.rectangle19:setTop(210);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle5);
    obj.label34:setLeft(75);
    obj.label34:setTop(210);
    obj.label34:setWidth(50);
    obj.label34:setHeight(25);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setField("sum_nivel");
    obj.label34:setName("label34");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle5);
    obj.dataLink8:setFields({'atr_max','sum_nivel'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle5);
    obj.dataLink9:setFields({'agilidade_nivel', 'cac_nivel', 'manuseio_nivel', 'pontaria_nivel', 'paranormalidade_nivel', 'sorte_nivel'});
    obj.dataLink9:setName("dataLink9");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.scrollBox1);
    obj.rectangle20:setLeft(600);
    obj.rectangle20:setTop(65);
    obj.rectangle20:setWidth(310);
    obj.rectangle20:setHeight(105);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle20);
    obj.label35:setLeft(105);
    obj.label35:setTop(0);
    obj.label35:setWidth(50);
    obj.label35:setHeight(20);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setText("Natural");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle20);
    obj.label36:setLeft(155);
    obj.label36:setTop(0);
    obj.label36:setWidth(75);
    obj.label36:setHeight(20);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setText("Adicional");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle20);
    obj.label37:setLeft(230);
    obj.label37:setTop(0);
    obj.label37:setWidth(75);
    obj.label37:setHeight(20);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setText("Total");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle20);
    obj.label38:setLeft(5);
    obj.label38:setTop(25);
    obj.label38:setWidth(100);
    obj.label38:setHeight(25);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setText("Vida");
    obj.label38:setName("label38");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle20);
    obj.rectangle21:setLeft(105);
    obj.rectangle21:setTop(25);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle20);
    obj.label39:setLeft(105);
    obj.label39:setTop(25);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setField("vidaBase");
    obj.label39:setName("label39");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.rectangle20);
    obj.edit18:setLeft(155);
    obj.edit18:setTop(25);
    obj.edit18:setWidth(75);
    obj.edit18:setHeight(25);
    obj.edit18:setField("vidaCompensacao");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle20);
    obj.rectangle22:setLeft(230);
    obj.rectangle22:setTop(25);
    obj.rectangle22:setWidth(75);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle20);
    obj.label40:setLeft(230);
    obj.label40:setTop(25);
    obj.label40:setWidth(75);
    obj.label40:setHeight(25);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setField("vidaAtual");
    obj.label40:setName("label40");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle20);
    obj.dataLink10:setFields({'vidaBase','vidaCompensacao'});
    obj.dataLink10:setName("dataLink10");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle20);
    obj.label41:setLeft(5);
    obj.label41:setTop(50);
    obj.label41:setWidth(100);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setText("Fadiga");
    obj.label41:setName("label41");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle20);
    obj.rectangle23:setLeft(105);
    obj.rectangle23:setTop(50);
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle20);
    obj.label42:setLeft(105);
    obj.label42:setTop(50);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setField("fadigaBase");
    obj.label42:setName("label42");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.rectangle20);
    obj.edit19:setLeft(155);
    obj.edit19:setTop(50);
    obj.edit19:setWidth(75);
    obj.edit19:setHeight(25);
    obj.edit19:setField("fadigaCompensacao");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.rectangle20);
    obj.rectangle24:setLeft(230);
    obj.rectangle24:setTop(50);
    obj.rectangle24:setWidth(75);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle20);
    obj.label43:setLeft(230);
    obj.label43:setTop(50);
    obj.label43:setWidth(75);
    obj.label43:setHeight(25);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setField("fadigaAtual");
    obj.label43:setName("label43");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle20);
    obj.dataLink11:setFields({'fadigaBase','fadigaCompensacao'});
    obj.dataLink11:setName("dataLink11");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle20);
    obj.label44:setLeft(5);
    obj.label44:setTop(75);
    obj.label44:setWidth(100);
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setText("Imersão");
    obj.label44:setName("label44");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle20);
    obj.rectangle25:setLeft(105);
    obj.rectangle25:setTop(75);
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle20);
    obj.label45:setLeft(105);
    obj.label45:setTop(75);
    obj.label45:setWidth(50);
    obj.label45:setHeight(25);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setField("imersaoBase");
    obj.label45:setName("label45");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.rectangle20);
    obj.edit20:setLeft(155);
    obj.edit20:setTop(75);
    obj.edit20:setWidth(75);
    obj.edit20:setHeight(25);
    obj.edit20:setField("imersaoCompensacao");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle20);
    obj.rectangle26:setLeft(230);
    obj.rectangle26:setTop(75);
    obj.rectangle26:setWidth(75);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle20);
    obj.label46:setLeft(230);
    obj.label46:setTop(75);
    obj.label46:setWidth(75);
    obj.label46:setHeight(25);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setField("imersaoAtual");
    obj.label46:setName("label46");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle20);
    obj.dataLink12:setFields({'imersaoBase','imersaoCompensacao'});
    obj.dataLink12:setName("dataLink12");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.scrollBox1);
    obj.rectangle27:setLeft(600);
    obj.rectangle27:setTop(175);
    obj.rectangle27:setWidth(310);
    obj.rectangle27:setHeight(130);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle27);
    obj.label47:setLeft(0);
    obj.label47:setTop(0);
    obj.label47:setWidth(310);
    obj.label47:setHeight(20);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setText("Atributos Avançados");
    obj.label47:setName("label47");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle27);
    obj.label48:setLeft(5);
    obj.label48:setTop(25);
    obj.label48:setWidth(100);
    obj.label48:setHeight(25);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setText("Benção I");
    obj.label48:setName("label48");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.rectangle27);
    obj.edit21:setLeft(105);
    obj.edit21:setTop(25);
    obj.edit21:setWidth(200);
    obj.edit21:setHeight(25);
    obj.edit21:setField("bencao1");
    obj.edit21:setName("edit21");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle27);
    obj.label49:setLeft(5);
    obj.label49:setTop(50);
    obj.label49:setWidth(100);
    obj.label49:setHeight(25);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setText("Benção II");
    obj.label49:setName("label49");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.rectangle27);
    obj.edit22:setLeft(105);
    obj.edit22:setTop(50);
    obj.edit22:setWidth(200);
    obj.edit22:setHeight(25);
    obj.edit22:setField("bencao2");
    obj.edit22:setName("edit22");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle27);
    obj.label50:setLeft(5);
    obj.label50:setTop(75);
    obj.label50:setWidth(100);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setText("Ultimato");
    obj.label50:setName("label50");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.rectangle27);
    obj.edit23:setLeft(105);
    obj.edit23:setTop(75);
    obj.edit23:setWidth(200);
    obj.edit23:setHeight(25);
    obj.edit23:setField("ultimato");
    obj.edit23:setName("edit23");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle27);
    obj.label51:setLeft(5);
    obj.label51:setTop(100);
    obj.label51:setWidth(100);
    obj.label51:setHeight(25);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setText("Privilégio");
    obj.label51:setName("label51");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.rectangle27);
    obj.edit24:setLeft(105);
    obj.edit24:setTop(100);
    obj.edit24:setWidth(200);
    obj.edit24:setHeight(25);
    obj.edit24:setField("privilegio");
    obj.edit24:setName("edit24");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.scrollBox1);
    obj.rectangle28:setLeft(915);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(310);
    obj.rectangle28:setHeight(680);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle28);
    obj.label52:setLeft(0);
    obj.label52:setTop(5);
    obj.label52:setWidth(310);
    obj.label52:setHeight(20);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setText("Status de Combate");
    obj.label52:setName("label52");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle28);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(25);
    obj.layout1:setWidth(155);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout1);
    obj.label53:setLeft(0);
    obj.label53:setTop(0);
    obj.label53:setWidth(100);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setText("Dano Base");
    obj.label53:setName("label53");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout1);
    obj.edit25:setLeft(90);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(60);
    obj.edit25:setHeight(25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setField("resistenciadanoBase");
    obj.edit25:setName("edit25");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle28);
    obj.layout2:setLeft(155);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(155);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout2);
    obj.label54:setLeft(0);
    obj.label54:setTop(0);
    obj.label54:setWidth(100);
    obj.label54:setHeight(25);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setText("Bloqueio");
    obj.label54:setName("label54");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout2);
    obj.edit26:setLeft(90);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(60);
    obj.edit26:setHeight(25);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setField("resistenciabloqueio");
    obj.edit26:setName("edit26");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle28);
    obj.label55:setLeft(105);
    obj.label55:setTop(50);
    obj.label55:setWidth(50);
    obj.label55:setHeight(20);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("Natural");
    obj.label55:setName("label55");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle28);
    obj.label56:setLeft(155);
    obj.label56:setTop(50);
    obj.label56:setWidth(75);
    obj.label56:setHeight(20);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setText("Adicional");
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle28);
    obj.label57:setLeft(230);
    obj.label57:setTop(50);
    obj.label57:setWidth(75);
    obj.label57:setHeight(20);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Total");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle28);
    obj.label58:setLeft(5);
    obj.label58:setTop(75);
    obj.label58:setWidth(100);
    obj.label58:setHeight(25);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setText("Reg. de Vida");
    obj.label58:setName("label58");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.rectangle28);
    obj.rectangle29:setLeft(105);
    obj.rectangle29:setTop(75);
    obj.rectangle29:setWidth(50);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle28);
    obj.label59:setLeft(105);
    obj.label59:setTop(75);
    obj.label59:setWidth(50);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setField("regVidaBase");
    obj.label59:setName("label59");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.rectangle28);
    obj.edit27:setLeft(155);
    obj.edit27:setTop(75);
    obj.edit27:setWidth(75);
    obj.edit27:setHeight(25);
    obj.edit27:setField("regVidaAdicional");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.rectangle28);
    obj.rectangle30:setLeft(230);
    obj.rectangle30:setTop(75);
    obj.rectangle30:setWidth(75);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle28);
    obj.label60:setLeft(230);
    obj.label60:setTop(75);
    obj.label60:setWidth(75);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setField("regVidaTotal");
    obj.label60:setName("label60");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle28);
    obj.dataLink13:setFields({'regVidaBase','regVidaAdicional'});
    obj.dataLink13:setName("dataLink13");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle28);
    obj.label61:setLeft(5);
    obj.label61:setTop(100);
    obj.label61:setWidth(100);
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setText("Reg. de Fadiga");
    obj.label61:setName("label61");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.rectangle28);
    obj.rectangle31:setLeft(105);
    obj.rectangle31:setTop(100);
    obj.rectangle31:setWidth(50);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle28);
    obj.label62:setLeft(105);
    obj.label62:setTop(100);
    obj.label62:setWidth(50);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setField("regFadigaBase");
    obj.label62:setName("label62");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle28);
    obj.edit28:setLeft(155);
    obj.edit28:setTop(100);
    obj.edit28:setWidth(75);
    obj.edit28:setHeight(25);
    obj.edit28:setField("regFadigaAdicional");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.rectangle28);
    obj.rectangle32:setLeft(230);
    obj.rectangle32:setTop(100);
    obj.rectangle32:setWidth(75);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle28);
    obj.label63:setLeft(230);
    obj.label63:setTop(100);
    obj.label63:setWidth(75);
    obj.label63:setHeight(25);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setField("regFadigaTotal");
    obj.label63:setName("label63");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle28);
    obj.dataLink14:setFields({'regFadigaBase','regFadigaAdicional'});
    obj.dataLink14:setName("dataLink14");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle28);
    obj.label64:setLeft(5);
    obj.label64:setTop(125);
    obj.label64:setWidth(100);
    obj.label64:setHeight(25);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setText("Iniciativa");
    obj.label64:setName("label64");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.rectangle28);
    obj.rectangle33:setLeft(105);
    obj.rectangle33:setTop(125);
    obj.rectangle33:setWidth(50);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle28);
    obj.label65:setLeft(105);
    obj.label65:setTop(125);
    obj.label65:setWidth(50);
    obj.label65:setHeight(25);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setField("iniciativaBase");
    obj.label65:setName("label65");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle28);
    obj.edit29:setLeft(155);
    obj.edit29:setTop(125);
    obj.edit29:setWidth(37.5);
    obj.edit29:setHeight(25);
    obj.edit29:setField("iniciativaAdicional1");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle28);
    obj.edit30:setLeft(192.5);
    obj.edit30:setTop(125);
    obj.edit30:setWidth(37.5);
    obj.edit30:setHeight(25);
    obj.edit30:setField("iniciativaAdicional2");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.rectangle28);
    obj.rectangle34:setLeft(230);
    obj.rectangle34:setTop(125);
    obj.rectangle34:setWidth(75);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle28);
    obj.label66:setLeft(230);
    obj.label66:setTop(125);
    obj.label66:setWidth(75);
    obj.label66:setHeight(25);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setField("iniciativaTotal");
    obj.label66:setName("label66");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle28);
    obj.dataLink15:setFields({'iniciativaBase1','iniciativaAdicional1','iniciativaBase2','iniciativaAdicional2'});
    obj.dataLink15:setName("dataLink15");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle28);
    obj.label67:setLeft(5);
    obj.label67:setTop(150);
    obj.label67:setWidth(100);
    obj.label67:setHeight(25);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setText("Crítico");
    obj.label67:setName("label67");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.rectangle28);
    obj.rectangle35:setLeft(105);
    obj.rectangle35:setTop(150);
    obj.rectangle35:setWidth(50);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle28);
    obj.label68:setLeft(105);
    obj.label68:setTop(150);
    obj.label68:setWidth(50);
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setField("criticoBase");
    obj.label68:setName("label68");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle28);
    obj.edit31:setLeft(155);
    obj.edit31:setTop(150);
    obj.edit31:setWidth(37.5);
    obj.edit31:setHeight(25);
    obj.edit31:setField("criticoAdicional1");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle28);
    obj.edit32:setLeft(192.5);
    obj.edit32:setTop(150);
    obj.edit32:setWidth(37.5);
    obj.edit32:setHeight(25);
    obj.edit32:setField("criticoAdicional2");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.rectangle28);
    obj.rectangle36:setLeft(230);
    obj.rectangle36:setTop(150);
    obj.rectangle36:setWidth(75);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle28);
    obj.label69:setLeft(230);
    obj.label69:setTop(150);
    obj.label69:setWidth(75);
    obj.label69:setHeight(25);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setField("criticoTotal");
    obj.label69:setName("label69");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle28);
    obj.dataLink16:setFields({'criticoBase1','criticoAdicional1','criticoBase2','criticoAdicional2'});
    obj.dataLink16:setName("dataLink16");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle28);
    obj.label70:setLeft(5);
    obj.label70:setTop(175);
    obj.label70:setWidth(100);
    obj.label70:setHeight(25);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setText("Negação");
    obj.label70:setName("label70");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.rectangle28);
    obj.rectangle37:setLeft(105);
    obj.rectangle37:setTop(175);
    obj.rectangle37:setWidth(50);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle28);
    obj.label71:setLeft(105);
    obj.label71:setTop(175);
    obj.label71:setWidth(50);
    obj.label71:setHeight(25);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setField("negacaoBase");
    obj.label71:setName("label71");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle28);
    obj.edit33:setLeft(155);
    obj.edit33:setTop(175);
    obj.edit33:setWidth(75);
    obj.edit33:setHeight(25);
    obj.edit33:setField("negacaoAdicional");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.rectangle28);
    obj.rectangle38:setLeft(230);
    obj.rectangle38:setTop(175);
    obj.rectangle38:setWidth(75);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle28);
    obj.label72:setLeft(230);
    obj.label72:setTop(175);
    obj.label72:setWidth(75);
    obj.label72:setHeight(25);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setField("negacaoTotal");
    obj.label72:setName("label72");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle28);
    obj.dataLink17:setFields({'negacaoBase','negacaoAdicional'});
    obj.dataLink17:setName("dataLink17");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle28);
    obj.label73:setLeft(5);
    obj.label73:setTop(200);
    obj.label73:setWidth(100);
    obj.label73:setHeight(25);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setText("Conjuração");
    obj.label73:setName("label73");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.rectangle28);
    obj.rectangle39:setLeft(105);
    obj.rectangle39:setTop(200);
    obj.rectangle39:setWidth(50);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle28);
    obj.label74:setLeft(105);
    obj.label74:setTop(200);
    obj.label74:setWidth(50);
    obj.label74:setHeight(25);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setField("conjuracaoBase");
    obj.label74:setName("label74");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle28);
    obj.edit34:setLeft(155);
    obj.edit34:setTop(200);
    obj.edit34:setWidth(75);
    obj.edit34:setHeight(25);
    obj.edit34:setField("conjuracaoAdicional");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.rectangle28);
    obj.rectangle40:setLeft(230);
    obj.rectangle40:setTop(200);
    obj.rectangle40:setWidth(75);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle28);
    obj.label75:setLeft(230);
    obj.label75:setTop(200);
    obj.label75:setWidth(75);
    obj.label75:setHeight(25);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setField("conjuracaoTotal");
    obj.label75:setName("label75");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.rectangle28);
    obj.dataLink18:setFields({'conjuracaoBase','conjuracaoAdicional'});
    obj.dataLink18:setName("dataLink18");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.rectangle28);
    obj.label76:setLeft(5);
    obj.label76:setTop(230);
    obj.label76:setWidth(300);
    obj.label76:setHeight(20);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setText("Redutores");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle28);
    obj.label77:setLeft(5);
    obj.label77:setTop(250);
    obj.label77:setWidth(100);
    obj.label77:setHeight(25);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setText("Físico");
    obj.label77:setName("label77");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.rectangle28);
    obj.rectangle41:setLeft(105);
    obj.rectangle41:setTop(250);
    obj.rectangle41:setWidth(50);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle28);
    obj.label78:setLeft(105);
    obj.label78:setTop(250);
    obj.label78:setWidth(50);
    obj.label78:setHeight(25);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setField("fisicoBase");
    obj.label78:setName("label78");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle28);
    obj.edit35:setLeft(155);
    obj.edit35:setTop(250);
    obj.edit35:setWidth(37.5);
    obj.edit35:setHeight(25);
    obj.edit35:setField("fisicoAdicional1");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle28);
    obj.edit36:setLeft(192.5);
    obj.edit36:setTop(250);
    obj.edit36:setWidth(37.5);
    obj.edit36:setHeight(25);
    obj.edit36:setField("fisicoAdicional2");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.rectangle28);
    obj.rectangle42:setLeft(230);
    obj.rectangle42:setTop(250);
    obj.rectangle42:setWidth(75);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle28);
    obj.label79:setLeft(230);
    obj.label79:setTop(250);
    obj.label79:setWidth(75);
    obj.label79:setHeight(25);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setField("fisicoTotal");
    obj.label79:setName("label79");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.rectangle28);
    obj.dataLink19:setFields({'fisicoBase1','fisicoAdicional1','fisicoBase2','fisicoAdicional2'});
    obj.dataLink19:setName("dataLink19");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.rectangle28);
    obj.label80:setLeft(5);
    obj.label80:setTop(275);
    obj.label80:setWidth(100);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setText("Paranormal");
    obj.label80:setName("label80");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.rectangle28);
    obj.rectangle43:setLeft(105);
    obj.rectangle43:setTop(275);
    obj.rectangle43:setWidth(50);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.rectangle28);
    obj.label81:setLeft(105);
    obj.label81:setTop(275);
    obj.label81:setWidth(50);
    obj.label81:setHeight(25);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setField("paranormalBase");
    obj.label81:setName("label81");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle28);
    obj.edit37:setLeft(155);
    obj.edit37:setTop(275);
    obj.edit37:setWidth(37.5);
    obj.edit37:setHeight(25);
    obj.edit37:setField("paranormalAdicional1");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle28);
    obj.edit38:setLeft(192.5);
    obj.edit38:setTop(275);
    obj.edit38:setWidth(37.5);
    obj.edit38:setHeight(25);
    obj.edit38:setField("paranormalAdicional2");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.rectangle28);
    obj.rectangle44:setLeft(230);
    obj.rectangle44:setTop(275);
    obj.rectangle44:setWidth(75);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.rectangle28);
    obj.label82:setLeft(230);
    obj.label82:setTop(275);
    obj.label82:setWidth(75);
    obj.label82:setHeight(25);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setField("paranormalTotal");
    obj.label82:setName("label82");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.rectangle28);
    obj.dataLink20:setFields({'paranormalBase1','paranormalAdicional1','paranormalBase2','paranormalAdicional2'});
    obj.dataLink20:setName("dataLink20");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle28);
    obj.label83:setLeft(5);
    obj.label83:setTop(300);
    obj.label83:setWidth(100);
    obj.label83:setHeight(25);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setText("Projétil");
    obj.label83:setName("label83");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.rectangle28);
    obj.rectangle45:setLeft(105);
    obj.rectangle45:setTop(300);
    obj.rectangle45:setWidth(50);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle28);
    obj.label84:setLeft(105);
    obj.label84:setTop(300);
    obj.label84:setWidth(50);
    obj.label84:setHeight(25);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setField("projetilBase");
    obj.label84:setName("label84");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle28);
    obj.edit39:setLeft(155);
    obj.edit39:setTop(300);
    obj.edit39:setWidth(37.5);
    obj.edit39:setHeight(25);
    obj.edit39:setField("projetilAdicional1");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.rectangle28);
    obj.edit40:setLeft(192.5);
    obj.edit40:setTop(300);
    obj.edit40:setWidth(37.5);
    obj.edit40:setHeight(25);
    obj.edit40:setField("projetilAdicional2");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.rectangle28);
    obj.rectangle46:setLeft(230);
    obj.rectangle46:setTop(300);
    obj.rectangle46:setWidth(75);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle28);
    obj.label85:setLeft(230);
    obj.label85:setTop(300);
    obj.label85:setWidth(75);
    obj.label85:setHeight(25);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setField("projetilTotal");
    obj.label85:setName("label85");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.rectangle28);
    obj.dataLink21:setFields({'projetilBase1','projetilAdicional1','projetilBase2','projetilAdicional2'});
    obj.dataLink21:setName("dataLink21");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle28);
    obj.label86:setLeft(5);
    obj.label86:setTop(325);
    obj.label86:setWidth(100);
    obj.label86:setHeight(25);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setText("Corrosivo");
    obj.label86:setName("label86");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.rectangle28);
    obj.rectangle47:setLeft(105);
    obj.rectangle47:setTop(325);
    obj.rectangle47:setWidth(50);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle28);
    obj.label87:setLeft(105);
    obj.label87:setTop(325);
    obj.label87:setWidth(50);
    obj.label87:setHeight(25);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setField("corrosivoBase");
    obj.label87:setName("label87");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.rectangle28);
    obj.edit41:setLeft(155);
    obj.edit41:setTop(325);
    obj.edit41:setWidth(37.5);
    obj.edit41:setHeight(25);
    obj.edit41:setField("corrosivoAdicional1");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.rectangle28);
    obj.edit42:setLeft(192.5);
    obj.edit42:setTop(325);
    obj.edit42:setWidth(37.5);
    obj.edit42:setHeight(25);
    obj.edit42:setField("corrosivoAdicional2");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.rectangle28);
    obj.rectangle48:setLeft(230);
    obj.rectangle48:setTop(325);
    obj.rectangle48:setWidth(75);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle28);
    obj.label88:setLeft(230);
    obj.label88:setTop(325);
    obj.label88:setWidth(75);
    obj.label88:setHeight(25);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setField("corrosivoTotal");
    obj.label88:setName("label88");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.rectangle28);
    obj.dataLink22:setFields({'corrosivoBase1','corrosivoAdicional1','corrosivoBase2','corrosivoAdicional2'});
    obj.dataLink22:setName("dataLink22");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle28);
    obj.label89:setLeft(5);
    obj.label89:setTop(355);
    obj.label89:setWidth(300);
    obj.label89:setHeight(20);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setText("Resistências");
    obj.label89:setName("label89");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.rectangle28);
    obj.label90:setLeft(5);
    obj.label90:setTop(375);
    obj.label90:setWidth(100);
    obj.label90:setHeight(25);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setText("Desaceleração");
    obj.label90:setName("label90");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.rectangle28);
    obj.rectangle49:setLeft(105);
    obj.rectangle49:setTop(375);
    obj.rectangle49:setWidth(50);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.rectangle28);
    obj.label91:setLeft(105);
    obj.label91:setTop(375);
    obj.label91:setWidth(50);
    obj.label91:setHeight(25);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setField("desaceleracaoBase");
    obj.label91:setName("label91");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.rectangle28);
    obj.edit43:setLeft(155);
    obj.edit43:setTop(375);
    obj.edit43:setWidth(75);
    obj.edit43:setHeight(25);
    obj.edit43:setField("desaceleracaoAdicional");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.rectangle28);
    obj.rectangle50:setLeft(230);
    obj.rectangle50:setTop(375);
    obj.rectangle50:setWidth(75);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle28);
    obj.label92:setLeft(230);
    obj.label92:setTop(375);
    obj.label92:setWidth(75);
    obj.label92:setHeight(25);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setField("desaceleracaoTotal");
    obj.label92:setName("label92");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.rectangle28);
    obj.dataLink23:setFields({'desaceleracaoBase','desaceleracaoAdicional'});
    obj.dataLink23:setName("dataLink23");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.rectangle28);
    obj.label93:setLeft(5);
    obj.label93:setTop(400);
    obj.label93:setWidth(100);
    obj.label93:setHeight(25);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setText("Sangramento");
    obj.label93:setName("label93");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.rectangle28);
    obj.rectangle51:setLeft(105);
    obj.rectangle51:setTop(400);
    obj.rectangle51:setWidth(50);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.rectangle28);
    obj.label94:setLeft(105);
    obj.label94:setTop(400);
    obj.label94:setWidth(50);
    obj.label94:setHeight(25);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setField("sangramentoBase");
    obj.label94:setName("label94");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.rectangle28);
    obj.edit44:setLeft(155);
    obj.edit44:setTop(400);
    obj.edit44:setWidth(75);
    obj.edit44:setHeight(25);
    obj.edit44:setField("sangramentoAdicional");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.rectangle28);
    obj.rectangle52:setLeft(230);
    obj.rectangle52:setTop(400);
    obj.rectangle52:setWidth(75);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle28);
    obj.label95:setLeft(230);
    obj.label95:setTop(400);
    obj.label95:setWidth(75);
    obj.label95:setHeight(25);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setField("sangramentoTotal");
    obj.label95:setName("label95");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.rectangle28);
    obj.dataLink24:setFields({'sangramentoBase','sangramentoAdicional'});
    obj.dataLink24:setName("dataLink24");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.rectangle28);
    obj.label96:setLeft(5);
    obj.label96:setTop(425);
    obj.label96:setWidth(100);
    obj.label96:setHeight(25);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setText("Impelimento");
    obj.label96:setName("label96");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.rectangle28);
    obj.rectangle53:setLeft(105);
    obj.rectangle53:setTop(425);
    obj.rectangle53:setWidth(50);
    obj.rectangle53:setHeight(25);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle28);
    obj.label97:setLeft(105);
    obj.label97:setTop(425);
    obj.label97:setWidth(50);
    obj.label97:setHeight(25);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setField("impelimentoBase");
    obj.label97:setName("label97");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.rectangle28);
    obj.edit45:setLeft(155);
    obj.edit45:setTop(425);
    obj.edit45:setWidth(75);
    obj.edit45:setHeight(25);
    obj.edit45:setField("impelimentoAdicional");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.rectangle28);
    obj.rectangle54:setLeft(230);
    obj.rectangle54:setTop(425);
    obj.rectangle54:setWidth(75);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.rectangle28);
    obj.label98:setLeft(230);
    obj.label98:setTop(425);
    obj.label98:setWidth(75);
    obj.label98:setHeight(25);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setField("impelimentoTotal");
    obj.label98:setName("label98");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.rectangle28);
    obj.dataLink25:setFields({'impelimentoBase','impelimentoAdicional'});
    obj.dataLink25:setName("dataLink25");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle28);
    obj.label99:setLeft(5);
    obj.label99:setTop(450);
    obj.label99:setWidth(100);
    obj.label99:setHeight(25);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setText("Imobilização");
    obj.label99:setName("label99");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.rectangle28);
    obj.rectangle55:setLeft(105);
    obj.rectangle55:setTop(450);
    obj.rectangle55:setWidth(50);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.rectangle28);
    obj.label100:setLeft(105);
    obj.label100:setTop(450);
    obj.label100:setWidth(50);
    obj.label100:setHeight(25);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setField("imobilizacaoBase");
    obj.label100:setName("label100");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.rectangle28);
    obj.edit46:setLeft(155);
    obj.edit46:setTop(450);
    obj.edit46:setWidth(75);
    obj.edit46:setHeight(25);
    obj.edit46:setField("imobilizacaoAdicional");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.rectangle28);
    obj.rectangle56:setLeft(230);
    obj.rectangle56:setTop(450);
    obj.rectangle56:setWidth(75);
    obj.rectangle56:setHeight(25);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.rectangle28);
    obj.label101:setLeft(230);
    obj.label101:setTop(450);
    obj.label101:setWidth(75);
    obj.label101:setHeight(25);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setField("imobilizacaoTotal");
    obj.label101:setName("label101");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.rectangle28);
    obj.dataLink26:setFields({'imobilizacaoBase','imobilizacaoAdicional'});
    obj.dataLink26:setName("dataLink26");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.rectangle28);
    obj.label102:setLeft(5);
    obj.label102:setTop(475);
    obj.label102:setWidth(100);
    obj.label102:setHeight(25);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setText("Fratura");
    obj.label102:setName("label102");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.rectangle28);
    obj.rectangle57:setLeft(105);
    obj.rectangle57:setTop(475);
    obj.rectangle57:setWidth(50);
    obj.rectangle57:setHeight(25);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.rectangle28);
    obj.label103:setLeft(105);
    obj.label103:setTop(475);
    obj.label103:setWidth(50);
    obj.label103:setHeight(25);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setField("fraturaBase");
    obj.label103:setName("label103");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.rectangle28);
    obj.edit47:setLeft(155);
    obj.edit47:setTop(475);
    obj.edit47:setWidth(75);
    obj.edit47:setHeight(25);
    obj.edit47:setField("fraturaAdicional");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.rectangle28);
    obj.rectangle58:setLeft(230);
    obj.rectangle58:setTop(475);
    obj.rectangle58:setWidth(75);
    obj.rectangle58:setHeight(25);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.rectangle28);
    obj.label104:setLeft(230);
    obj.label104:setTop(475);
    obj.label104:setWidth(75);
    obj.label104:setHeight(25);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setField("fraturaTotal");
    obj.label104:setName("label104");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.rectangle28);
    obj.dataLink27:setFields({'fraturaBase','fraturaAdicional'});
    obj.dataLink27:setName("dataLink27");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.rectangle28);
    obj.label105:setLeft(5);
    obj.label105:setTop(500);
    obj.label105:setWidth(100);
    obj.label105:setHeight(25);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setText("Fragilização");
    obj.label105:setName("label105");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.rectangle28);
    obj.rectangle59:setLeft(105);
    obj.rectangle59:setTop(500);
    obj.rectangle59:setWidth(50);
    obj.rectangle59:setHeight(25);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.rectangle28);
    obj.label106:setLeft(105);
    obj.label106:setTop(500);
    obj.label106:setWidth(50);
    obj.label106:setHeight(25);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setField("fragilizacaoBase");
    obj.label106:setName("label106");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.rectangle28);
    obj.edit48:setLeft(155);
    obj.edit48:setTop(500);
    obj.edit48:setWidth(75);
    obj.edit48:setHeight(25);
    obj.edit48:setField("fragilizacaoAdicional");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.rectangle28);
    obj.rectangle60:setLeft(230);
    obj.rectangle60:setTop(500);
    obj.rectangle60:setWidth(75);
    obj.rectangle60:setHeight(25);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle28);
    obj.label107:setLeft(230);
    obj.label107:setTop(500);
    obj.label107:setWidth(75);
    obj.label107:setHeight(25);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setField("fragilizacaoTotal");
    obj.label107:setName("label107");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.rectangle28);
    obj.dataLink28:setFields({'fragilizacaoBase','fragilizacaoAdicional'});
    obj.dataLink28:setName("dataLink28");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.rectangle28);
    obj.label108:setLeft(5);
    obj.label108:setTop(525);
    obj.label108:setWidth(100);
    obj.label108:setHeight(25);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setText("Envenenamento");
    obj.label108:setName("label108");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.rectangle28);
    obj.rectangle61:setLeft(105);
    obj.rectangle61:setTop(525);
    obj.rectangle61:setWidth(50);
    obj.rectangle61:setHeight(25);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.rectangle28);
    obj.label109:setLeft(105);
    obj.label109:setTop(525);
    obj.label109:setWidth(50);
    obj.label109:setHeight(25);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setField("envenenamentoBase");
    obj.label109:setName("label109");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.rectangle28);
    obj.edit49:setLeft(155);
    obj.edit49:setTop(525);
    obj.edit49:setWidth(75);
    obj.edit49:setHeight(25);
    obj.edit49:setField("envenenamentoAdicional");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setType("number");
    obj.edit49:setName("edit49");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.rectangle28);
    obj.rectangle62:setLeft(230);
    obj.rectangle62:setTop(525);
    obj.rectangle62:setWidth(75);
    obj.rectangle62:setHeight(25);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.rectangle28);
    obj.label110:setLeft(230);
    obj.label110:setTop(525);
    obj.label110:setWidth(75);
    obj.label110:setHeight(25);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setField("envenenamentoTotal");
    obj.label110:setName("label110");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.rectangle28);
    obj.dataLink29:setFields({'envenenamentoBase','envenenamentoAdicional'});
    obj.dataLink29:setName("dataLink29");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle28);
    obj.label111:setLeft(5);
    obj.label111:setTop(550);
    obj.label111:setWidth(100);
    obj.label111:setHeight(25);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setText("Incendiado");
    obj.label111:setName("label111");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.rectangle28);
    obj.rectangle63:setLeft(105);
    obj.rectangle63:setTop(550);
    obj.rectangle63:setWidth(50);
    obj.rectangle63:setHeight(25);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle28);
    obj.label112:setLeft(105);
    obj.label112:setTop(550);
    obj.label112:setWidth(50);
    obj.label112:setHeight(25);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setField("incendiadoBase");
    obj.label112:setName("label112");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.rectangle28);
    obj.edit50:setLeft(155);
    obj.edit50:setTop(550);
    obj.edit50:setWidth(75);
    obj.edit50:setHeight(25);
    obj.edit50:setField("incendiadoAdicional");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.rectangle28);
    obj.rectangle64:setLeft(230);
    obj.rectangle64:setTop(550);
    obj.rectangle64:setWidth(75);
    obj.rectangle64:setHeight(25);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle28);
    obj.label113:setLeft(230);
    obj.label113:setTop(550);
    obj.label113:setWidth(75);
    obj.label113:setHeight(25);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setField("incendiadoTotal");
    obj.label113:setName("label113");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.rectangle28);
    obj.dataLink30:setFields({'incendiadoBase','incendiadoAdicional'});
    obj.dataLink30:setName("dataLink30");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle28);
    obj.label114:setLeft(5);
    obj.label114:setTop(575);
    obj.label114:setWidth(100);
    obj.label114:setHeight(25);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setText("Aturdido");
    obj.label114:setName("label114");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.rectangle28);
    obj.rectangle65:setLeft(105);
    obj.rectangle65:setTop(575);
    obj.rectangle65:setWidth(50);
    obj.rectangle65:setHeight(25);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.rectangle28);
    obj.label115:setLeft(105);
    obj.label115:setTop(575);
    obj.label115:setWidth(50);
    obj.label115:setHeight(25);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setField("atordoamentoBase");
    obj.label115:setName("label115");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.rectangle28);
    obj.edit51:setLeft(155);
    obj.edit51:setTop(575);
    obj.edit51:setWidth(75);
    obj.edit51:setHeight(25);
    obj.edit51:setField("atordoamentoAdicional");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setType("number");
    obj.edit51:setName("edit51");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.rectangle28);
    obj.rectangle66:setLeft(230);
    obj.rectangle66:setTop(575);
    obj.rectangle66:setWidth(75);
    obj.rectangle66:setHeight(25);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.rectangle28);
    obj.label116:setLeft(230);
    obj.label116:setTop(575);
    obj.label116:setWidth(75);
    obj.label116:setHeight(25);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setField("atordoamentoTotal");
    obj.label116:setName("label116");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.rectangle28);
    obj.dataLink31:setFields({'atordoamentoBase','atordoamentoAdicional'});
    obj.dataLink31:setName("dataLink31");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle28);
    obj.label117:setLeft(5);
    obj.label117:setTop(600);
    obj.label117:setWidth(100);
    obj.label117:setHeight(25);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setText("Paralisação");
    obj.label117:setName("label117");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.rectangle28);
    obj.rectangle67:setLeft(105);
    obj.rectangle67:setTop(600);
    obj.rectangle67:setWidth(50);
    obj.rectangle67:setHeight(25);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle28);
    obj.label118:setLeft(105);
    obj.label118:setTop(600);
    obj.label118:setWidth(50);
    obj.label118:setHeight(25);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setField("paralisacaoBase");
    obj.label118:setName("label118");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.rectangle28);
    obj.edit52:setLeft(155);
    obj.edit52:setTop(600);
    obj.edit52:setWidth(75);
    obj.edit52:setHeight(25);
    obj.edit52:setField("paralisacaoAdicional");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.rectangle28);
    obj.rectangle68:setLeft(230);
    obj.rectangle68:setTop(600);
    obj.rectangle68:setWidth(75);
    obj.rectangle68:setHeight(25);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle28);
    obj.label119:setLeft(230);
    obj.label119:setTop(600);
    obj.label119:setWidth(75);
    obj.label119:setHeight(25);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setField("paralisacaoTotal");
    obj.label119:setName("label119");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.rectangle28);
    obj.dataLink32:setFields({'paralisacaoBase','paralisacaoAdicional'});
    obj.dataLink32:setName("dataLink32");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle28);
    obj.label120:setLeft(5);
    obj.label120:setTop(625);
    obj.label120:setWidth(100);
    obj.label120:setHeight(25);
    obj.label120:setHorzTextAlign("center");
    obj.label120:setText("Provocação");
    obj.label120:setName("label120");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.rectangle28);
    obj.rectangle69:setLeft(105);
    obj.rectangle69:setTop(625);
    obj.rectangle69:setWidth(50);
    obj.rectangle69:setHeight(25);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle28);
    obj.label121:setLeft(105);
    obj.label121:setTop(625);
    obj.label121:setWidth(50);
    obj.label121:setHeight(25);
    obj.label121:setHorzTextAlign("center");
    obj.label121:setField("provocacaoBase");
    obj.label121:setName("label121");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.rectangle28);
    obj.edit53:setLeft(155);
    obj.edit53:setTop(625);
    obj.edit53:setWidth(75);
    obj.edit53:setHeight(25);
    obj.edit53:setField("provocacaoAdicional");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setType("number");
    obj.edit53:setName("edit53");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.rectangle28);
    obj.rectangle70:setLeft(230);
    obj.rectangle70:setTop(625);
    obj.rectangle70:setWidth(75);
    obj.rectangle70:setHeight(25);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle28);
    obj.label122:setLeft(230);
    obj.label122:setTop(625);
    obj.label122:setWidth(75);
    obj.label122:setHeight(25);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setField("provocacaoTotal");
    obj.label122:setName("label122");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.rectangle28);
    obj.dataLink33:setFields({'provocacaoBase','provocacaoAdicional'});
    obj.dataLink33:setName("dataLink33");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle28);
    obj.label123:setLeft(5);
    obj.label123:setTop(650);
    obj.label123:setWidth(100);
    obj.label123:setHeight(25);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setText("Silenciamento");
    obj.label123:setName("label123");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.rectangle28);
    obj.rectangle71:setLeft(105);
    obj.rectangle71:setTop(650);
    obj.rectangle71:setWidth(50);
    obj.rectangle71:setHeight(25);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.rectangle28);
    obj.label124:setLeft(105);
    obj.label124:setTop(650);
    obj.label124:setWidth(50);
    obj.label124:setHeight(25);
    obj.label124:setHorzTextAlign("center");
    obj.label124:setField("silenciadoBase");
    obj.label124:setName("label124");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.rectangle28);
    obj.edit54:setLeft(155);
    obj.edit54:setTop(650);
    obj.edit54:setWidth(75);
    obj.edit54:setHeight(25);
    obj.edit54:setField("silenciadoAdicional");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.rectangle28);
    obj.rectangle72:setLeft(230);
    obj.rectangle72:setTop(650);
    obj.rectangle72:setWidth(75);
    obj.rectangle72:setHeight(25);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle28);
    obj.label125:setLeft(230);
    obj.label125:setTop(650);
    obj.label125:setWidth(75);
    obj.label125:setHeight(25);
    obj.label125:setHorzTextAlign("center");
    obj.label125:setField("silenciadoTotal");
    obj.label125:setName("label125");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.rectangle28);
    obj.dataLink34:setFields({'silenciadoBase','silenciadoAdicional'});
    obj.dataLink34:setName("dataLink34");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.rectangle28);
    obj.dataLink35:setFields({'nivel', 'cac_total', 'paranormalidade_total', 'agilidade_total', 'sorte_total', 'manuseio_total', 'pontaria_total'});
    obj.dataLink35:setName("dataLink35");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.scrollBox1);
    obj.rectangle73:setLeft(0);
    obj.rectangle73:setTop(310);
    obj.rectangle73:setWidth(910);
    obj.rectangle73:setHeight(370);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.rectangle73);
    obj.label126:setLeft(0);
    obj.label126:setTop(5);
    obj.label126:setWidth(460);
    obj.label126:setHeight(25);
    obj.label126:setHorzTextAlign("trailing");
    obj.label126:setText("Habilidades");
    obj.label126:setName("label126");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.rectangle73);
    obj.label127:setLeft(690);
    obj.label127:setTop(5);
    obj.label127:setWidth(75);
    obj.label127:setHeight(25);
    obj.label127:setHorzTextAlign("center");
    obj.label127:setText("Dificuldade");
    obj.label127:setFontSize(11);
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.rectangle73);
    obj.label128:setLeft(765);
    obj.label128:setTop(5);
    obj.label128:setWidth(75);
    obj.label128:setHeight(25);
    obj.label128:setHorzTextAlign("center");
    obj.label128:setText("Custo");
    obj.label128:setFontSize(11);
    obj.label128:setName("label128");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.rectangle73);
    obj.label129:setLeft(840);
    obj.label129:setTop(5);
    obj.label129:setWidth(50);
    obj.label129:setHeight(25);
    obj.label129:setHorzTextAlign("center");
    obj.label129:setText("Estágio");
    obj.label129:setFontSize(11);
    obj.label129:setName("label129");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.rectangle73);
    obj.rectangle74:setLeft(460);
    obj.rectangle74:setTop(5);
    obj.rectangle74:setWidth(50);
    obj.rectangle74:setHeight(25);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.rectangle73);
    obj.label130:setLeft(460);
    obj.label130:setTop(5);
    obj.label130:setWidth(50);
    obj.label130:setHeight(25);
    obj.label130:setHorzTextAlign("center");
    obj.label130:setField("habilidadesNivel");
    obj.label130:setName("label130");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.rectangle73);
    obj.rectangle75:setLeft(510);
    obj.rectangle75:setTop(5);
    obj.rectangle75:setWidth(50);
    obj.rectangle75:setHeight(25);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.habilidadesDisponivel = GUI.fromHandle(_obj_newObject("label"));
    obj.habilidadesDisponivel:setParent(obj.rectangle73);
    obj.habilidadesDisponivel:setLeft(510);
    obj.habilidadesDisponivel:setTop(5);
    obj.habilidadesDisponivel:setWidth(50);
    obj.habilidadesDisponivel:setHeight(25);
    obj.habilidadesDisponivel:setHorzTextAlign("center");
    obj.habilidadesDisponivel:setField("habilidadesDisponivel");
    obj.habilidadesDisponivel:setName("habilidadesDisponivel");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.rectangle73);
    obj.dataLink36:setFields({'habilidadesNivel','habilidadesDisponivel'});
    obj.dataLink36:setName("dataLink36");

    obj.rclHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidades:setParent(obj.rectangle73);
    obj.rclHabilidades:setLeft(5);
    obj.rclHabilidades:setTop(30);
    obj.rclHabilidades:setWidth(900);
    obj.rclHabilidades:setHeight(335);
    obj.rclHabilidades:setName("rclHabilidades");
    obj.rclHabilidades:setField("listaDeHabilidades");
    obj.rclHabilidades:setTemplateForm("frmAbilities");
    obj.rclHabilidades:setLayout("vertical");
    obj.rclHabilidades:setMinQt(5);

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

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.scrollBox2);
    obj.rectangle76:setLeft(0);
    obj.rectangle76:setTop(0);
    obj.rectangle76:setWidth(895);
    obj.rectangle76:setHeight(110);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.rectangle76);
    obj.label131:setLeft(0);
    obj.label131:setTop(5);
    obj.label131:setWidth(895);
    obj.label131:setHeight(25);
    obj.label131:setHorzTextAlign("center");
    obj.label131:setText("Equipados");
    obj.label131:setName("label131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.rectangle76);
    obj.label132:setLeft(5);
    obj.label132:setTop(30);
    obj.label132:setWidth(95);
    obj.label132:setHeight(20);
    obj.label132:setText("Arma");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.rectangle76);
    obj.edit55:setLeft(100);
    obj.edit55:setTop(30);
    obj.edit55:setWidth(200);
    obj.edit55:setHeight(25);
    obj.edit55:setField("equip_arma");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setName("edit55");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.rectangle76);
    obj.edit56:setLeft(300);
    obj.edit56:setTop(30);
    obj.edit56:setWidth(590);
    obj.edit56:setHeight(25);
    obj.edit56:setField("equip_arma_desc");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setName("edit56");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle76);
    obj.label133:setLeft(5);
    obj.label133:setTop(55);
    obj.label133:setWidth(95);
    obj.label133:setHeight(20);
    obj.label133:setText("Equipamento");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.rectangle76);
    obj.edit57:setLeft(100);
    obj.edit57:setTop(55);
    obj.edit57:setWidth(200);
    obj.edit57:setHeight(25);
    obj.edit57:setField("equip_equipamento");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setName("edit57");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.rectangle76);
    obj.edit58:setLeft(300);
    obj.edit58:setTop(55);
    obj.edit58:setWidth(590);
    obj.edit58:setHeight(25);
    obj.edit58:setField("equip_equipamento_desc");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setName("edit58");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.rectangle76);
    obj.label134:setLeft(5);
    obj.label134:setTop(80);
    obj.label134:setWidth(95);
    obj.label134:setHeight(20);
    obj.label134:setText("Vestimenta");
    obj.label134:setHorzTextAlign("center");
    obj.label134:setName("label134");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.rectangle76);
    obj.edit59:setLeft(100);
    obj.edit59:setTop(80);
    obj.edit59:setWidth(200);
    obj.edit59:setHeight(25);
    obj.edit59:setField("equip_vestimenta");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setName("edit59");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.rectangle76);
    obj.edit60:setLeft(300);
    obj.edit60:setTop(80);
    obj.edit60:setWidth(590);
    obj.edit60:setHeight(25);
    obj.edit60:setField("equip_vestimenta_desc");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setName("edit60");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.scrollBox2);
    obj.rectangle77:setLeft(900);
    obj.rectangle77:setTop(0);
    obj.rectangle77:setWidth(310);
    obj.rectangle77:setHeight(110);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle77);
    obj.label135:setLeft(0);
    obj.label135:setTop(5);
    obj.label135:setWidth(310);
    obj.label135:setHeight(25);
    obj.label135:setHorzTextAlign("center");
    obj.label135:setText("Armazenamento");
    obj.label135:setName("label135");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle77);
    obj.comboBox2:setLeft(5);
    obj.comboBox2:setTop(30);
    obj.comboBox2:setWidth(300);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("armazenamento1");
    obj.comboBox2:setItems({'', 'Coldre', 'Bolsa Grande'});
    obj.comboBox2:setValues({'0','4','6'});
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle77);
    obj.comboBox3:setLeft(5);
    obj.comboBox3:setTop(55);
    obj.comboBox3:setWidth(300);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("armazenamento2");
    obj.comboBox3:setItems({'', 'Coldre', 'Bolsa Grande'});
    obj.comboBox3:setValues({'0','4','6'});
    obj.comboBox3:setName("comboBox3");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.rectangle77);
    obj.comboBox4:setLeft(5);
    obj.comboBox4:setTop(80);
    obj.comboBox4:setWidth(300);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("armazenamento3");
    obj.comboBox4:setItems({'+0', '+1', '+2', '+3', '+4', '+5', '+6'});
    obj.comboBox4:setValues({'0','1','2','3','4','5','6'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.rectangle77);
    obj.dataLink37:setFields({'armazenamento1','armazenamento2','armazenamento3'});
    obj.dataLink37:setName("dataLink37");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.scrollBox2);
    obj.rectangle78:setLeft(0);
    obj.rectangle78:setTop(115);
    obj.rectangle78:setWidth(1210);
    obj.rectangle78:setHeight(555);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.rectangle78);
    obj.label136:setLeft(5);
    obj.label136:setTop(5);
    obj.label136:setWidth(200);
    obj.label136:setHeight(25);
    obj.label136:setHorzTextAlign("center");
    obj.label136:setText("Nome");
    obj.label136:setName("label136");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.rectangle78);
    obj.label137:setLeft(205);
    obj.label137:setTop(5);
    obj.label137:setWidth(700);
    obj.label137:setHeight(25);
    obj.label137:setHorzTextAlign("center");
    obj.label137:setText("Efeito");
    obj.label137:setName("label137");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.rectangle78);
    obj.label138:setLeft(905);
    obj.label138:setTop(5);
    obj.label138:setWidth(150);
    obj.label138:setHeight(25);
    obj.label138:setHorzTextAlign("center");
    obj.label138:setText("Tipo");
    obj.label138:setName("label138");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.rectangle78);
    obj.label139:setLeft(1055);
    obj.label139:setTop(5);
    obj.label139:setWidth(50);
    obj.label139:setHeight(25);
    obj.label139:setHorzTextAlign("center");
    obj.label139:setText("Qtd");
    obj.label139:setName("label139");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.rectangle78);
    obj.label140:setLeft(1105);
    obj.label140:setTop(5);
    obj.label140:setWidth(50);
    obj.label140:setHeight(25);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setText("Max");
    obj.label140:setName("label140");

    obj.rclInventario = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclInventario:setParent(obj.rectangle78);
    obj.rclInventario:setLeft(5);
    obj.rclInventario:setTop(30);
    obj.rclInventario:setWidth(1200);
    obj.rclInventario:setHeight(520);
    obj.rclInventario:setName("rclInventario");
    obj.rclInventario:setField("listaDeItens");
    obj.rclInventario:setTemplateForm("frmItem");
    obj.rclInventario:setLayout("vertical");
    obj.rclInventario:setMinQt(10);

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

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.scrollBox3);
    obj.rectangle79:setLeft(0);
    obj.rectangle79:setTop(0);
    obj.rectangle79:setWidth(1205);
    obj.rectangle79:setHeight(105);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setName("rectangle79");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.rectangle79);
    obj.label141:setLeft(3);
    obj.label141:setTop(1);
    obj.label141:setWidth(100);
    obj.label141:setHeight(20);
    obj.label141:setText("DESCRIÇÃO");
    obj.label141:setName("label141");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.rectangle79);
    obj.label142:setLeft(10);
    obj.label142:setTop(25);
    obj.label142:setWidth(90);
    obj.label142:setHeight(20);
    obj.label142:setText("TAMANHO");
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.rectangle79);
    obj.edit61:setLeft(100);
    obj.edit61:setTop(25);
    obj.edit61:setWidth(200);
    obj.edit61:setHeight(25);
    obj.edit61:setField("tamanho");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setName("edit61");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.rectangle79);
    obj.label143:setLeft(10);
    obj.label143:setTop(50);
    obj.label143:setWidth(90);
    obj.label143:setHeight(20);
    obj.label143:setText("ALTURA");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.rectangle79);
    obj.edit62:setLeft(100);
    obj.edit62:setTop(50);
    obj.edit62:setWidth(200);
    obj.edit62:setHeight(25);
    obj.edit62:setField("altura");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setName("edit62");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.rectangle79);
    obj.label144:setLeft(10);
    obj.label144:setTop(75);
    obj.label144:setWidth(90);
    obj.label144:setHeight(20);
    obj.label144:setText("PESO");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.rectangle79);
    obj.edit63:setLeft(100);
    obj.edit63:setTop(75);
    obj.edit63:setWidth(200);
    obj.edit63:setHeight(25);
    obj.edit63:setField("peso");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setName("edit63");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.rectangle79);
    obj.label145:setLeft(310);
    obj.label145:setTop(25);
    obj.label145:setWidth(90);
    obj.label145:setHeight(20);
    obj.label145:setText("IDADE");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.rectangle79);
    obj.edit64:setLeft(400);
    obj.edit64:setTop(25);
    obj.edit64:setWidth(200);
    obj.edit64:setHeight(25);
    obj.edit64:setField("idade");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setName("edit64");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.rectangle79);
    obj.label146:setLeft(310);
    obj.label146:setTop(50);
    obj.label146:setWidth(90);
    obj.label146:setHeight(20);
    obj.label146:setText("SEXO");
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.rectangle79);
    obj.edit65:setLeft(400);
    obj.edit65:setTop(50);
    obj.edit65:setWidth(200);
    obj.edit65:setHeight(25);
    obj.edit65:setField("sexo");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setName("edit65");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.rectangle79);
    obj.label147:setLeft(310);
    obj.label147:setTop(75);
    obj.label147:setWidth(90);
    obj.label147:setHeight(20);
    obj.label147:setText("OUTROS");
    obj.label147:setHorzTextAlign("center");
    obj.label147:setName("label147");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.rectangle79);
    obj.edit66:setLeft(400);
    obj.edit66:setTop(75);
    obj.edit66:setWidth(200);
    obj.edit66:setHeight(25);
    obj.edit66:setField("aparenciaOutros");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setName("edit66");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.rectangle79);
    obj.label148:setLeft(610);
    obj.label148:setTop(25);
    obj.label148:setWidth(90);
    obj.label148:setHeight(20);
    obj.label148:setText("OLHOS");
    obj.label148:setHorzTextAlign("center");
    obj.label148:setName("label148");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.rectangle79);
    obj.edit67:setLeft(700);
    obj.edit67:setTop(25);
    obj.edit67:setWidth(200);
    obj.edit67:setHeight(25);
    obj.edit67:setField("aparenciaOlhos");
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setName("edit67");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.rectangle79);
    obj.label149:setLeft(610);
    obj.label149:setTop(50);
    obj.label149:setWidth(90);
    obj.label149:setHeight(20);
    obj.label149:setText("PELE");
    obj.label149:setHorzTextAlign("center");
    obj.label149:setName("label149");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.rectangle79);
    obj.edit68:setLeft(700);
    obj.edit68:setTop(50);
    obj.edit68:setWidth(200);
    obj.edit68:setHeight(25);
    obj.edit68:setField("pele");
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setName("edit68");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.rectangle79);
    obj.label150:setLeft(610);
    obj.label150:setTop(75);
    obj.label150:setWidth(90);
    obj.label150:setHeight(20);
    obj.label150:setText("CABELO");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.rectangle79);
    obj.edit69:setLeft(700);
    obj.edit69:setTop(75);
    obj.edit69:setWidth(200);
    obj.edit69:setHeight(25);
    obj.edit69:setField("cabelo");
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setName("edit69");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.rectangle79);
    obj.label151:setLeft(910);
    obj.label151:setTop(25);
    obj.label151:setWidth(90);
    obj.label151:setHeight(20);
    obj.label151:setText("TATOO");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.rectangle79);
    obj.edit70:setLeft(1000);
    obj.edit70:setTop(25);
    obj.edit70:setWidth(200);
    obj.edit70:setHeight(25);
    obj.edit70:setField("plano");
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setName("edit70");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.rectangle79);
    obj.label152:setLeft(910);
    obj.label152:setTop(50);
    obj.label152:setWidth(90);
    obj.label152:setHeight(20);
    obj.label152:setText("CICATRIZES");
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.rectangle79);
    obj.edit71:setLeft(1000);
    obj.edit71:setTop(50);
    obj.edit71:setWidth(200);
    obj.edit71:setHeight(25);
    obj.edit71:setField("regiao");
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setName("edit71");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.rectangle79);
    obj.label153:setLeft(910);
    obj.label153:setTop(75);
    obj.label153:setWidth(90);
    obj.label153:setHeight(20);
    obj.label153:setText("ETNIA");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.rectangle79);
    obj.edit72:setLeft(1000);
    obj.edit72:setTop(75);
    obj.edit72:setWidth(200);
    obj.edit72:setHeight(25);
    obj.edit72:setField("reino");
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setName("edit72");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox3);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(110);
    obj.layout3:setWidth(375);
    obj.layout3:setHeight(255);
    obj.layout3:setName("layout3");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout3);
    obj.rectangle80:setAlign("client");
    obj.rectangle80:setColor("black");
    obj.rectangle80:setName("rectangle80");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout3);
    obj.label154:setLeft(5);
    obj.label154:setTop(1);
    obj.label154:setWidth(150);
    obj.label154:setHeight(20);
    obj.label154:setText("CARACTERÍSTICAS");
    obj.label154:setName("label154");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout3);
    obj.label155:setLeft(5);
    obj.label155:setTop(25);
    obj.label155:setWidth(150);
    obj.label155:setHeight(20);
    obj.label155:setText("Carisma");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout3);
    obj.edit73:setLeft(155);
    obj.edit73:setTop(25);
    obj.edit73:setWidth(30);
    obj.edit73:setHeight(25);
    obj.edit73:setField("carac_p_1");
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setType("number");
    obj.edit73:setName("edit73");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout3);
    obj.label156:setLeft(190);
    obj.label156:setTop(25);
    obj.label156:setWidth(150);
    obj.label156:setHeight(20);
    obj.label156:setText("Timidez");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout3);
    obj.rectangle81:setLeft(340);
    obj.rectangle81:setTop(25);
    obj.rectangle81:setWidth(30);
    obj.rectangle81:setHeight(25);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout3);
    obj.label157:setLeft(340);
    obj.label157:setTop(25);
    obj.label157:setWidth(30);
    obj.label157:setHeight(25);
    obj.label157:setHorzTextAlign("center");
    obj.label157:setField("carac_n_1");
    obj.label157:setName("label157");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout3);
    obj.dataLink38:setField("carac_n_1");
    obj.dataLink38:setDefaultValue("20");
    obj.dataLink38:setName("dataLink38");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout3);
    obj.dataLink39:setField("carac_p_1");
    obj.dataLink39:setName("dataLink39");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout3);
    obj.label158:setLeft(5);
    obj.label158:setTop(50);
    obj.label158:setWidth(150);
    obj.label158:setHeight(20);
    obj.label158:setText("Charme");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout3);
    obj.edit74:setLeft(155);
    obj.edit74:setTop(50);
    obj.edit74:setWidth(30);
    obj.edit74:setHeight(25);
    obj.edit74:setField("carac_p_2");
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setType("number");
    obj.edit74:setName("edit74");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout3);
    obj.label159:setLeft(190);
    obj.label159:setTop(50);
    obj.label159:setWidth(150);
    obj.label159:setHeight(20);
    obj.label159:setText("Inconveniente");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout3);
    obj.rectangle82:setLeft(340);
    obj.rectangle82:setTop(50);
    obj.rectangle82:setWidth(30);
    obj.rectangle82:setHeight(25);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout3);
    obj.label160:setLeft(340);
    obj.label160:setTop(50);
    obj.label160:setWidth(30);
    obj.label160:setHeight(25);
    obj.label160:setHorzTextAlign("center");
    obj.label160:setField("carac_n_2");
    obj.label160:setName("label160");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout3);
    obj.dataLink40:setField("carac_n_2");
    obj.dataLink40:setDefaultValue("20");
    obj.dataLink40:setName("dataLink40");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout3);
    obj.dataLink41:setField("carac_p_2");
    obj.dataLink41:setName("dataLink41");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout3);
    obj.label161:setLeft(5);
    obj.label161:setTop(75);
    obj.label161:setWidth(150);
    obj.label161:setHeight(20);
    obj.label161:setText("Intelecto");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout3);
    obj.edit75:setLeft(155);
    obj.edit75:setTop(75);
    obj.edit75:setWidth(30);
    obj.edit75:setHeight(25);
    obj.edit75:setField("carac_p_3");
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setType("number");
    obj.edit75:setName("edit75");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout3);
    obj.label162:setLeft(190);
    obj.label162:setTop(75);
    obj.label162:setWidth(150);
    obj.label162:setHeight(20);
    obj.label162:setText("Ignorância");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout3);
    obj.rectangle83:setLeft(340);
    obj.rectangle83:setTop(75);
    obj.rectangle83:setWidth(30);
    obj.rectangle83:setHeight(25);
    obj.rectangle83:setColor("black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout3);
    obj.label163:setLeft(340);
    obj.label163:setTop(75);
    obj.label163:setWidth(30);
    obj.label163:setHeight(25);
    obj.label163:setHorzTextAlign("center");
    obj.label163:setField("carac_n_3");
    obj.label163:setName("label163");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout3);
    obj.dataLink42:setField("carac_n_3");
    obj.dataLink42:setDefaultValue("20");
    obj.dataLink42:setName("dataLink42");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout3);
    obj.dataLink43:setField("carac_p_3");
    obj.dataLink43:setName("dataLink43");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout3);
    obj.label164:setLeft(5);
    obj.label164:setTop(100);
    obj.label164:setWidth(150);
    obj.label164:setHeight(20);
    obj.label164:setText("Discernimento");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout3);
    obj.edit76:setLeft(155);
    obj.edit76:setTop(100);
    obj.edit76:setWidth(30);
    obj.edit76:setHeight(25);
    obj.edit76:setField("carac_p_4");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setType("number");
    obj.edit76:setName("edit76");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout3);
    obj.label165:setLeft(190);
    obj.label165:setTop(100);
    obj.label165:setWidth(150);
    obj.label165:setHeight(20);
    obj.label165:setText("Desconfiança");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout3);
    obj.rectangle84:setLeft(340);
    obj.rectangle84:setTop(100);
    obj.rectangle84:setWidth(30);
    obj.rectangle84:setHeight(25);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout3);
    obj.label166:setLeft(340);
    obj.label166:setTop(100);
    obj.label166:setWidth(30);
    obj.label166:setHeight(25);
    obj.label166:setHorzTextAlign("center");
    obj.label166:setField("carac_n_4");
    obj.label166:setName("label166");

    obj.dataLink44 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout3);
    obj.dataLink44:setField("carac_n_4");
    obj.dataLink44:setDefaultValue("20");
    obj.dataLink44:setName("dataLink44");

    obj.dataLink45 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout3);
    obj.dataLink45:setField("carac_p_4");
    obj.dataLink45:setName("dataLink45");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout3);
    obj.label167:setLeft(5);
    obj.label167:setTop(125);
    obj.label167:setWidth(150);
    obj.label167:setHeight(20);
    obj.label167:setText("Percepção,");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout3);
    obj.edit77:setLeft(155);
    obj.edit77:setTop(125);
    obj.edit77:setWidth(30);
    obj.edit77:setHeight(25);
    obj.edit77:setField("carac_p_5");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setType("number");
    obj.edit77:setName("edit77");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout3);
    obj.label168:setLeft(190);
    obj.label168:setTop(125);
    obj.label168:setWidth(150);
    obj.label168:setHeight(20);
    obj.label168:setText("Desatento,");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setName("label168");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout3);
    obj.rectangle85:setLeft(340);
    obj.rectangle85:setTop(125);
    obj.rectangle85:setWidth(30);
    obj.rectangle85:setHeight(25);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout3);
    obj.label169:setLeft(340);
    obj.label169:setTop(125);
    obj.label169:setWidth(30);
    obj.label169:setHeight(25);
    obj.label169:setHorzTextAlign("center");
    obj.label169:setField("carac_n_5");
    obj.label169:setName("label169");

    obj.dataLink46 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout3);
    obj.dataLink46:setField("carac_n_5");
    obj.dataLink46:setDefaultValue("20");
    obj.dataLink46:setName("dataLink46");

    obj.dataLink47 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout3);
    obj.dataLink47:setField("carac_p_5");
    obj.dataLink47:setName("dataLink47");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.layout3);
    obj.label170:setLeft(5);
    obj.label170:setTop(150);
    obj.label170:setWidth(150);
    obj.label170:setHeight(20);
    obj.label170:setText("Intimidação");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setName("label170");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout3);
    obj.edit78:setLeft(155);
    obj.edit78:setTop(150);
    obj.edit78:setWidth(30);
    obj.edit78:setHeight(25);
    obj.edit78:setField("carac_p_6");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setType("number");
    obj.edit78:setName("edit78");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.layout3);
    obj.label171:setLeft(190);
    obj.label171:setTop(150);
    obj.label171:setWidth(150);
    obj.label171:setHeight(20);
    obj.label171:setText("Indiferença");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setName("label171");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout3);
    obj.rectangle86:setLeft(340);
    obj.rectangle86:setTop(150);
    obj.rectangle86:setWidth(30);
    obj.rectangle86:setHeight(25);
    obj.rectangle86:setColor("black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.layout3);
    obj.label172:setLeft(340);
    obj.label172:setTop(150);
    obj.label172:setWidth(30);
    obj.label172:setHeight(25);
    obj.label172:setHorzTextAlign("center");
    obj.label172:setField("carac_n_6");
    obj.label172:setName("label172");

    obj.dataLink48 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout3);
    obj.dataLink48:setField("carac_n_6");
    obj.dataLink48:setDefaultValue("20");
    obj.dataLink48:setName("dataLink48");

    obj.dataLink49 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout3);
    obj.dataLink49:setField("carac_p_6");
    obj.dataLink49:setName("dataLink49");

    obj.label173 = GUI.fromHandle(_obj_newObject("label"));
    obj.label173:setParent(obj.layout3);
    obj.label173:setLeft(5);
    obj.label173:setTop(175);
    obj.label173:setWidth(150);
    obj.label173:setHeight(20);
    obj.label173:setText("Boa Memória");
    obj.label173:setHorzTextAlign("center");
    obj.label173:setName("label173");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout3);
    obj.edit79:setLeft(155);
    obj.edit79:setTop(175);
    obj.edit79:setWidth(30);
    obj.edit79:setHeight(25);
    obj.edit79:setField("carac_p_7");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setType("number");
    obj.edit79:setName("edit79");

    obj.label174 = GUI.fromHandle(_obj_newObject("label"));
    obj.label174:setParent(obj.layout3);
    obj.label174:setLeft(190);
    obj.label174:setTop(175);
    obj.label174:setWidth(150);
    obj.label174:setHeight(20);
    obj.label174:setText("Esquecido");
    obj.label174:setHorzTextAlign("center");
    obj.label174:setName("label174");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout3);
    obj.rectangle87:setLeft(340);
    obj.rectangle87:setTop(175);
    obj.rectangle87:setWidth(30);
    obj.rectangle87:setHeight(25);
    obj.rectangle87:setColor("black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.label175 = GUI.fromHandle(_obj_newObject("label"));
    obj.label175:setParent(obj.layout3);
    obj.label175:setLeft(340);
    obj.label175:setTop(175);
    obj.label175:setWidth(30);
    obj.label175:setHeight(25);
    obj.label175:setHorzTextAlign("center");
    obj.label175:setField("carac_n_7");
    obj.label175:setName("label175");

    obj.dataLink50 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout3);
    obj.dataLink50:setField("carac_n_7");
    obj.dataLink50:setDefaultValue("20");
    obj.dataLink50:setName("dataLink50");

    obj.dataLink51 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout3);
    obj.dataLink51:setField("carac_p_7");
    obj.dataLink51:setName("dataLink51");

    obj.label176 = GUI.fromHandle(_obj_newObject("label"));
    obj.label176:setParent(obj.layout3);
    obj.label176:setLeft(5);
    obj.label176:setTop(200);
    obj.label176:setWidth(150);
    obj.label176:setHeight(20);
    obj.label176:setText("Fleuma");
    obj.label176:setHorzTextAlign("center");
    obj.label176:setName("label176");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout3);
    obj.edit80:setLeft(155);
    obj.edit80:setTop(200);
    obj.edit80:setWidth(30);
    obj.edit80:setHeight(25);
    obj.edit80:setField("carac_p_8");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setType("number");
    obj.edit80:setName("edit80");

    obj.label177 = GUI.fromHandle(_obj_newObject("label"));
    obj.label177:setParent(obj.layout3);
    obj.label177:setLeft(190);
    obj.label177:setTop(200);
    obj.label177:setWidth(150);
    obj.label177:setHeight(20);
    obj.label177:setText("Irritado");
    obj.label177:setHorzTextAlign("center");
    obj.label177:setName("label177");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout3);
    obj.rectangle88:setLeft(340);
    obj.rectangle88:setTop(200);
    obj.rectangle88:setWidth(30);
    obj.rectangle88:setHeight(25);
    obj.rectangle88:setColor("black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.label178 = GUI.fromHandle(_obj_newObject("label"));
    obj.label178:setParent(obj.layout3);
    obj.label178:setLeft(340);
    obj.label178:setTop(200);
    obj.label178:setWidth(30);
    obj.label178:setHeight(25);
    obj.label178:setHorzTextAlign("center");
    obj.label178:setField("carac_n_8");
    obj.label178:setName("label178");

    obj.dataLink52 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout3);
    obj.dataLink52:setField("carac_n_8");
    obj.dataLink52:setDefaultValue("20");
    obj.dataLink52:setName("dataLink52");

    obj.dataLink53 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout3);
    obj.dataLink53:setField("carac_p_8");
    obj.dataLink53:setName("dataLink53");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout3);
    obj.rectangle89:setLeft(155);
    obj.rectangle89:setTop(225);
    obj.rectangle89:setWidth(30);
    obj.rectangle89:setHeight(25);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.label179 = GUI.fromHandle(_obj_newObject("label"));
    obj.label179:setParent(obj.layout3);
    obj.label179:setLeft(155);
    obj.label179:setTop(225);
    obj.label179:setWidth(30);
    obj.label179:setHeight(25);
    obj.label179:setHorzTextAlign("center");
    obj.label179:setField("carac_gasto");
    obj.label179:setName("label179");

    obj.rectangle90 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout3);
    obj.rectangle90:setLeft(185);
    obj.rectangle90:setTop(225);
    obj.rectangle90:setWidth(30);
    obj.rectangle90:setHeight(25);
    obj.rectangle90:setColor("black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.carac_total = GUI.fromHandle(_obj_newObject("label"));
    obj.carac_total:setParent(obj.layout3);
    obj.carac_total:setLeft(185);
    obj.carac_total:setTop(225);
    obj.carac_total:setWidth(30);
    obj.carac_total:setHeight(25);
    obj.carac_total:setHorzTextAlign("center");
    obj.carac_total:setField("carac_total");
    obj.carac_total:setFontColor("green");
    obj.carac_total:setName("carac_total");

    obj.dataLink54 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout3);
    obj.dataLink54:setFields({'carac_p_1','carac_p_2','carac_p_3','carac_p_4','carac_p_5','carac_p_6','carac_p_7','carac_p_8'});
    obj.dataLink54:setName("dataLink54");

    obj.dataLink55 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout3);
    obj.dataLink55:setFields({'carac_gasto','carac_total'});
    obj.dataLink55:setName("dataLink55");

    obj.rectangle91 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.scrollBox3);
    obj.rectangle91:setLeft(0);
    obj.rectangle91:setTop(370);
    obj.rectangle91:setWidth(375);
    obj.rectangle91:setHeight(35);
    obj.rectangle91:setColor("black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.label180 = GUI.fromHandle(_obj_newObject("label"));
    obj.label180:setParent(obj.rectangle91);
    obj.label180:setLeft(55);
    obj.label180:setTop(5);
    obj.label180:setWidth(100);
    obj.label180:setHeight(25);
    obj.label180:setText("Carma");
    obj.label180:setName("label180");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.rectangle91);
    obj.comboBox5:setLeft(110);
    obj.comboBox5:setTop(5);
    obj.comboBox5:setWidth(200);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("carma");
    obj.comboBox5:setItems({'Divino 2','Divino 1','Humano','Demoníaco 1','Demoníaco 2'});
    obj.comboBox5:setName("comboBox5");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox3);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(410);
    obj.layout4:setWidth(375);
    obj.layout4:setHeight(195);
    obj.layout4:setName("layout4");

    obj.rectangle92 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout4);
    obj.rectangle92:setAlign("client");
    obj.rectangle92:setColor("black");
    obj.rectangle92:setName("rectangle92");

    obj.label181 = GUI.fromHandle(_obj_newObject("label"));
    obj.label181:setParent(obj.layout4);
    obj.label181:setLeft(5);
    obj.label181:setTop(1);
    obj.label181:setWidth(100);
    obj.label181:setHeight(20);
    obj.label181:setText("PERSONALIDADE");
    obj.label181:setName("label181");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout4);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(365);
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setField("personalidade");
    obj.textEditor1:setName("textEditor1");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox3);
    obj.layout5:setLeft(380);
    obj.layout5:setTop(110);
    obj.layout5:setWidth(825);
    obj.layout5:setHeight(495);
    obj.layout5:setName("layout5");

    obj.rectangle93 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout5);
    obj.rectangle93:setAlign("client");
    obj.rectangle93:setColor("black");
    obj.rectangle93:setName("rectangle93");

    obj.label182 = GUI.fromHandle(_obj_newObject("label"));
    obj.label182:setParent(obj.layout5);
    obj.label182:setLeft(5);
    obj.label182:setTop(1);
    obj.label182:setWidth(100);
    obj.label182:setHeight(20);
    obj.label182:setText("PRE-MORTEM");
    obj.label182:setName("label182");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout5);
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

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox4);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(0);
    obj.layout6:setWidth(400);
    obj.layout6:setHeight(580);
    obj.layout6:setName("layout6");

    obj.rectangle94 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout6);
    obj.rectangle94:setLeft(0);
    obj.rectangle94:setTop(0);
    obj.rectangle94:setWidth(400);
    obj.rectangle94:setHeight(580);
    obj.rectangle94:setColor("black");
    obj.rectangle94:setXradius(5);
    obj.rectangle94:setYradius(15);
    obj.rectangle94:setCornerType("round");
    obj.rectangle94:setName("rectangle94");

    obj.label183 = GUI.fromHandle(_obj_newObject("label"));
    obj.label183:setParent(obj.layout6);
    obj.label183:setLeft(0);
    obj.label183:setTop(0);
    obj.label183:setWidth(400);
    obj.label183:setHeight(20);
    obj.label183:setText("Anotações Gerais");
    obj.label183:setHorzTextAlign("center");
    obj.label183:setName("label183");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout6);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(540);
    obj.textEditor2:setField("anotacoes1");
    obj.textEditor2:setName("textEditor2");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox4);
    obj.layout7:setLeft(410);
    obj.layout7:setTop(0);
    obj.layout7:setWidth(400);
    obj.layout7:setHeight(580);
    obj.layout7:setName("layout7");

    obj.rectangle95 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout7);
    obj.rectangle95:setLeft(0);
    obj.rectangle95:setTop(0);
    obj.rectangle95:setWidth(400);
    obj.rectangle95:setHeight(580);
    obj.rectangle95:setColor("black");
    obj.rectangle95:setXradius(5);
    obj.rectangle95:setYradius(15);
    obj.rectangle95:setCornerType("round");
    obj.rectangle95:setName("rectangle95");

    obj.label184 = GUI.fromHandle(_obj_newObject("label"));
    obj.label184:setParent(obj.layout7);
    obj.label184:setLeft(0);
    obj.label184:setTop(0);
    obj.label184:setWidth(400);
    obj.label184:setHeight(20);
    obj.label184:setText("Tarefas");
    obj.label184:setHorzTextAlign("center");
    obj.label184:setName("label184");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout7);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(540);
    obj.textEditor3:setField("anotacoes2");
    obj.textEditor3:setName("textEditor3");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox4);
    obj.layout8:setLeft(820);
    obj.layout8:setTop(0);
    obj.layout8:setWidth(400);
    obj.layout8:setHeight(580);
    obj.layout8:setName("layout8");

    obj.rectangle96 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout8);
    obj.rectangle96:setLeft(0);
    obj.rectangle96:setTop(0);
    obj.rectangle96:setWidth(400);
    obj.rectangle96:setHeight(580);
    obj.rectangle96:setColor("black");
    obj.rectangle96:setXradius(5);
    obj.rectangle96:setYradius(15);
    obj.rectangle96:setCornerType("round");
    obj.rectangle96:setName("rectangle96");

    obj.label185 = GUI.fromHandle(_obj_newObject("label"));
    obj.label185:setParent(obj.layout8);
    obj.label185:setLeft(0);
    obj.label185:setTop(0);
    obj.label185:setWidth(400);
    obj.label185:setHeight(20);
    obj.label185:setText("Diário da Irmandade");
    obj.label185:setHorzTextAlign("center");
    obj.label185:setName("label185");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout8);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(540);
    obj.textEditor4:setField("anotacoes3");
    obj.textEditor4:setName("textEditor4");

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

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox5);
    obj.layout9:setLeft(850);
    obj.layout9:setTop(0);
    obj.layout9:setWidth(200);
    obj.layout9:setHeight(160);
    obj.layout9:setName("layout9");

    obj.rectangle97 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout9);
    obj.rectangle97:setAlign("client");
    obj.rectangle97:setColor("black");
    obj.rectangle97:setXradius(5);
    obj.rectangle97:setYradius(15);
    obj.rectangle97:setCornerType("round");
    obj.rectangle97:setName("rectangle97");

    obj.label186 = GUI.fromHandle(_obj_newObject("label"));
    obj.label186:setParent(obj.layout9);
    obj.label186:setLeft(0);
    obj.label186:setTop(10);
    obj.label186:setWidth(200);
    obj.label186:setHeight(20);
    obj.label186:setText("Programado por: ");
    obj.label186:setHorzTextAlign("center");
    obj.label186:setName("label186");

    obj.label187 = GUI.fromHandle(_obj_newObject("label"));
    obj.label187:setParent(obj.layout9);
    obj.label187:setLeft(0);
    obj.label187:setTop(35);
    obj.label187:setWidth(200);
    obj.label187:setHeight(20);
    obj.label187:setText("Vinny (Ambesek)");
    obj.label187:setHorzTextAlign("center");
    obj.label187:setName("label187");

    obj.label188 = GUI.fromHandle(_obj_newObject("label"));
    obj.label188:setParent(obj.layout9);
    obj.label188:setLeft(0);
    obj.label188:setTop(60);
    obj.label188:setWidth(200);
    obj.label188:setHeight(20);
    obj.label188:setText("Consultor: Yagorok");
    obj.label188:setHorzTextAlign("center");
    obj.label188:setName("label188");

    obj.label189 = GUI.fromHandle(_obj_newObject("label"));
    obj.label189:setParent(obj.scrollBox5);
    obj.label189:setLeft(555);
    obj.label189:setTop(275);
    obj.label189:setWidth(200);
    obj.label189:setHeight(20);
    obj.label189:setText("Versão Atual: ");
    obj.label189:setHorzTextAlign("center");
    obj.label189:setField("versionInstalled");
    obj.label189:setName("label189");

    obj.label190 = GUI.fromHandle(_obj_newObject("label"));
    obj.label190:setParent(obj.scrollBox5);
    obj.label190:setLeft(555);
    obj.label190:setTop(300);
    obj.label190:setWidth(200);
    obj.label190:setHeight(20);
    obj.label190:setText("Sua Versão: ");
    obj.label190:setHorzTextAlign("center");
    obj.label190:setField("versionDownloaded");
    obj.label190:setName("label190");

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

    obj.label191 = GUI.fromHandle(_obj_newObject("label"));
    obj.label191:setParent(obj.scrollBox5);
    obj.label191:setLeft(555);
    obj.label191:setTop(400);
    obj.label191:setWidth(200);
    obj.label191:setHeight(20);
    obj.label191:setText("Conheça as Mesas:");
    obj.label191:setName("label191");

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
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true",
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
                                Dialogs.choose("Há uma nova versão (" .. info.version .. ") desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true');
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

    obj._e_event1 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event2 = obj.edit2:addEventListener("onChange",
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
            					sheet.vidaBase = 140 + (nivel * 20);
            					sheet.fadigaBase = 90 + (nivel * 10);
            					sheet.imersaoBase = 10 + (nivel * 5);
            					sheet.atr_max = 42 + (nivel * 6);
            					sheet.habilidadesDisponivel = math.min(nivel*2 + 1, 15);
            					sheet.carac_total = 47 + nivel;
        end, obj);

    obj._e_event5 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.agilidade_nivel) or 0) + 
            								(tonumber(sheet.agilidade_outros) or 0);
            				sheet.agilidade_total = total;
            				sheet.agilidade_pericia = math.floor(total/4);
        end, obj);

    obj._e_event6 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.cac_nivel) or 0) + 
            								(tonumber(sheet.cac_outros) or 0);
            				sheet.cac_total = total;
            				sheet.cac_pericia = math.floor(total/4);
        end, obj);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.manuseio_nivel) or 0) + 
            								(tonumber(sheet.manuseio_outros) or 0);
            				sheet.manuseio_total = total;
            				sheet.manuseio_pericia = math.floor(total/4);
        end, obj);

    obj._e_event8 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.pontaria_nivel) or 0) + 
            								(tonumber(sheet.pontaria_outros) or 0);
            				sheet.pontaria_total = total;
            				sheet.pontaria_pericia = math.floor(total/4);
        end, obj);

    obj._e_event9 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.paranormalidade_nivel) or 0) + 
            								(tonumber(sheet.paranormalidade_outros) or 0);
            				sheet.paranormalidade_total = total;
            				sheet.paranormalidade_pericia = math.floor(total/4);
        end, obj);

    obj._e_event10 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local total = 	(tonumber(sheet.sorte_nivel) or 0) + 
            								(tonumber(sheet.sorte_outros) or 0);
            				sheet.sorte_total = total;
            				sheet.sorte_pericia = math.floor(total/4);
        end, obj);

    obj._e_event11 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					
            					local max = tonumber(sheet.atr_max) or 0;
            					local gastos = tonumber(sheet.sum_nivel) or 0;
            					if max > gastos then
            						self.atr_max.fontColor = "#00FF00";
            					elseif max < gastos then
            						self.atr_max.fontColor = "#FF0000";
            					else
            						self.atr_max.fontColor = "#FFFFFF";
            					end;
        end, obj);

    obj._e_event12 = obj.dataLink9:addEventListener("onChange",
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

    obj._e_event13 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local vida = 	(tonumber(sheet.vidaBase) or 0) + 
            									(tonumber(sheet.vidaCompensacao) or 0);
            				sheet.vidaAtual = vida;
        end, obj);

    obj._e_event14 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fadiga = 	(tonumber(sheet.fadigaBase) or 0) + 
            									(tonumber(sheet.fadigaCompensacao) or 0);
            				sheet.fadigaAtual = fadiga;
        end, obj);

    obj._e_event15 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local imersao = 	(tonumber(sheet.imersaoBase) or 0) + 
            									(tonumber(sheet.imersaoCompensacao) or 0);
            				sheet.imersaoAtual = imersao;
        end, obj);

    obj._e_event16 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local regVida = 	(tonumber(sheet.regVidaBase) or 0) + 
            									(tonumber(sheet.regVidaAdicional) or 0);
            				sheet.regVidaTotal = regVida .. "pt";
        end, obj);

    obj._e_event17 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local regFadiga = 	(tonumber(sheet.regFadigaBase) or 0) + 
            									(tonumber(sheet.regFadigaAdicional) or 0);
            				sheet.regFadigaTotal = regFadiga .. "pt";
        end, obj);

    obj._e_event18 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local iniciativa1 = 	(tonumber(sheet.iniciativaBase1) or 0) + 
            									(tonumber(sheet.iniciativaAdicional1) or 0);
            				local iniciativa2 = 	(tonumber(sheet.iniciativaBase2) or 0) + 
            									(tonumber(sheet.iniciativaAdicional2) or 0);
            				sheet.iniciativaTotal = iniciativa1 .. "d6+" .. iniciativa2 .. "";
        end, obj);

    obj._e_event19 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local critico1 = 	(tonumber(sheet.criticoBase1) or 0) + 
            									(tonumber(sheet.criticoAdicional1) or 0);
            				local critico2 = 	(tonumber(sheet.criticoBase2) or 0) + 
            									(tonumber(sheet.criticoAdicional2) or 0);
            				sheet.criticoTotal = critico1 .. "|" .. critico2 .. "%";
        end, obj);

    obj._e_event20 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local negacao = 	(tonumber(sheet.negacaoBase) or 0) + 
            									(tonumber(sheet.negacaoAdicional) or 0);
            				sheet.negacaoTotal = negacao .. "%";
        end, obj);

    obj._e_event21 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local conjuracao = 	(tonumber(sheet.conjuracaoBase) or 0) + 
            									(tonumber(sheet.conjuracaoAdicional) or 0);
            				sheet.conjuracaoTotal = conjuracao .. "";
        end, obj);

    obj._e_event22 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fisico1 = 	(tonumber(sheet.fisicoBase1) or 0) + 
            									(tonumber(sheet.fisicoAdicional1) or 0);
            				local fisico2 = 	(tonumber(sheet.fisicoBase2) or 0) + 
            									(tonumber(sheet.fisicoAdicional2) or 0);
            				sheet.fisicoTotal = fisico1 .. "%+" .. fisico2 .. "";
        end, obj);

    obj._e_event23 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local paranormal1 = 	(tonumber(sheet.paranormalBase1) or 0) + 
            									(tonumber(sheet.paranormalAdicional1) or 0);
            				local paranormal2 = 	(tonumber(sheet.paranormalBase2) or 0) + 
            									(tonumber(sheet.paranormalAdicional2) or 0);
            				sheet.paranormalTotal = paranormal1 .. "%+" .. paranormal2 .. "";
        end, obj);

    obj._e_event24 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local projetil1 = 	(tonumber(sheet.projetilBase1) or 0) + 
            									(tonumber(sheet.projetilAdicional1) or 0);
            				local projetil2 = 	(tonumber(sheet.projetilBase2) or 0) + 
            									(tonumber(sheet.projetilAdicional2) or 0);
            				sheet.projetilTotal = projetil1 .. "%+" .. projetil2 .. "";
        end, obj);

    obj._e_event25 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local corrosivo1 = 	(tonumber(sheet.corrosivoBase1) or 0) + 
            									(tonumber(sheet.corrosivoAdicional1) or 0);
            				local corrosivo2 = 	(tonumber(sheet.corrosivoBase2) or 0) + 
            									(tonumber(sheet.corrosivoAdicional2) or 0);
            				sheet.corrosivoTotal = corrosivo1 .. "%+" .. corrosivo2 .. "";
        end, obj);

    obj._e_event26 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local desaceleracao = 	(tonumber(sheet.desaceleracaoBase) or 0) + 
            									(tonumber(sheet.desaceleracaoAdicional) or 0);
            				sheet.desaceleracaoTotal = desaceleracao .. "%";
        end, obj);

    obj._e_event27 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local sangramento = 	(tonumber(sheet.sangramentoBase) or 0) + 
            									(tonumber(sheet.sangramentoAdicional) or 0);
            				sheet.sangramentoTotal = sangramento .. "%";
        end, obj);

    obj._e_event28 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local impelimento = 	(tonumber(sheet.impelimentoBase) or 0) + 
            									(tonumber(sheet.impelimentoAdicional) or 0);
            				sheet.impelimentoTotal = impelimento .. "%";
        end, obj);

    obj._e_event29 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local imobilizacao = 	(tonumber(sheet.imobilizacaoBase) or 0) + 
            									(tonumber(sheet.imobilizacaoAdicional) or 0);
            				sheet.imobilizacaoTotal = imobilizacao .. "%";
        end, obj);

    obj._e_event30 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fratura = 	(tonumber(sheet.fraturaBase) or 0) + 
            									(tonumber(sheet.fraturaAdicional) or 0);
            				sheet.fraturaTotal = fratura .. "%";
        end, obj);

    obj._e_event31 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local fragilizacao = 	(tonumber(sheet.fragilizacaoBase) or 0) + 
            									(tonumber(sheet.fragilizacaoAdicional) or 0);
            				sheet.fragilizacaoTotal = fragilizacao .. "%";
        end, obj);

    obj._e_event32 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local envenenamento = 	(tonumber(sheet.envenenamentoBase) or 0) + 
            									(tonumber(sheet.envenenamentoAdicional) or 0);
            				sheet.envenenamentoTotal = envenenamento .. "%";
        end, obj);

    obj._e_event33 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local incendiado = 	(tonumber(sheet.incendiadoBase) or 0) + 
            									(tonumber(sheet.incendiadoAdicional) or 0);
            				sheet.incendiadoTotal = incendiado .. "%";
        end, obj);

    obj._e_event34 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local atordoamento = 	(tonumber(sheet.atordoamentoBase) or 0) + 
            									(tonumber(sheet.atordoamentoAdicional) or 0);
            				sheet.atordoamentoTotal = atordoamento .. "%";
        end, obj);

    obj._e_event35 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local paralisacao = 	(tonumber(sheet.paralisacaoBase) or 0) + 
            									(tonumber(sheet.paralisacaoAdicional) or 0);
            				sheet.paralisacaoTotal = paralisacao .. "%";
        end, obj);

    obj._e_event36 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local provocacao = 	(tonumber(sheet.provocacaoBase) or 0) + 
            									(tonumber(sheet.provocacaoAdicional) or 0);
            				sheet.provocacaoTotal = provocacao .. "%";
        end, obj);

    obj._e_event37 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local silenciado = 	(tonumber(sheet.silenciadoBase) or 0) + 
            									(tonumber(sheet.silenciadoAdicional) or 0);
            				sheet.silenciadoTotal = silenciado .. "%";
        end, obj);

    obj._e_event38 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local cac = (tonumber(sheet.cac_total) or 0);
            					local paranormalidade = (tonumber(sheet.paranormalidade_total) or 0);
            					local agilidade = (tonumber(sheet.agilidade_total) or 0);
            					local sorte = (tonumber(sheet.sorte_total) or 0);
            					local destreza = (tonumber(sheet.manuseio_total) or 0);
            					local precisao = (tonumber(sheet.pontaria_total) or 0);
            
            					sheet.regVidaBase = 8 + math.floor(cac/4)*5;
            
            					sheet.regFadigaBase = 5 + math.floor(paranormalidade/4)*3;
            
            					sheet.iniciativaBase = 4 + math.floor(agilidade/6);
            					sheet.iniciativaBase1 = 4 + math.floor(agilidade/6);
            					sheet.iniciativaBase2 = 0;
            
            					sheet.criticoBase1 = 1 + math.floor(sorte/4);
            					sheet.criticoBase2 = 50 + math.floor(destreza/6)*25;
            					sheet.criticoBase = sheet.criticoBase1 .. "|" .. sheet.criticoBase2;
            
            					sheet.negacaoBase = math.floor(precisao/4)*10;
            
            					sheet.conjuracaoBase = math.floor(destreza/4);
            
            					-- REDUTORES
            
            					sheet.fisicoBase = math.floor(cac/4)*5;
            					sheet.fisicoBase1 = sheet.fisicoBase;
            					sheet.fisicoBase2 = 0;
            
            					sheet.paranormalBase = math.floor(paranormalidade/4)*5;
            					sheet.paranormalBase1 = sheet.paranormalBase;
            					sheet.paranormalBase2 = 0;
            
            					sheet.projetilBase = math.floor(sorte/4)*5;
            					sheet.projetilBase1 = sheet.projetilBase;
            					sheet.projetilBase2 = 0;
            					
            					sheet.corrosivoBase = 0;
            					sheet.corrosivoBase1 = sheet.corrosivoBase;
            					sheet.corrosivoBase2 = 0;
            
            					-- RESISTENCIAS
            
            					sheet.desaceleracaoBase = math.floor(cac/4)*5;
            					sheet.sangramentoBase = math.floor(cac/4)*5;
            					sheet.impelimentoBase = math.floor(cac/4)*5;
            					sheet.imobilizacaoBase = math.floor(cac/4)*5;
            					sheet.fraturaBase = math.floor(cac/4)*5;
            					sheet.fragilizacaoBase = math.floor(cac/4)*5;
            					sheet.envenenamentoBase = math.floor(paranormalidade/4)*5;
            					sheet.incendiadoBase = math.floor(paranormalidade/4)*5;
            					sheet.atordoamentoBase = math.floor(paranormalidade/4)*5;
            					sheet.paralisacaoBase = math.floor(paranormalidade/4)*5;
            					sheet.provocacaoBase = math.floor(paranormalidade/4)*5;
            					sheet.silenciadoBase = math.floor(paranormalidade/4)*5;
        end, obj);

    obj._e_event39 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = tonumber(sheet.habilidadesNivel) or 0;
            					local total = tonumber(sheet.habilidadesDisponivel) or 0;
            
            					if gasto > total then
            						self.habilidadesDisponivel.fontColor = "#FF0000";
            					elseif gasto==total then
            						self.habilidadesDisponivel.fontColor = "#FFFFFF";
            					else 
            						self.habilidadesDisponivel.fontColor = "#00FF00";
            					end;
        end, obj);

    obj._e_event40 = obj.rclHabilidades:addEventListener("onEndEnumeration",
        function (_)
            if sheet== nil then return end;
            					
            					local objetos = NDB.getChildNodes(sheet.listaDeHabilidades);
            					if objetos[1].nivel == nil then
            						objetos[1].nivel = 1;
            					end;
        end, obj);

    obj._e_event41 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local armazenamento1 = (tonumber(sheet.armazenamento1) or 0);
            					local armazenamento2 = (tonumber(sheet.armazenamento2) or 0);
            					local armazenamento3 = (tonumber(sheet.armazenamento3) or 0);
            					local tamanho = 10 + armazenamento1 + armazenamento2 + armazenamento3;
            					sheet.inventarioTamanho = tamanho;
            					self.rclInventario.minQt = tamanho;
            
            					local objetos = NDB.getChildNodes(sheet.listaDeItens);
            
            					if #objetos > tamanho then
            						local excesso = #objetos - tamanho;
            						showMessage("Você possui " .. excesso .. " itens além do limite.");
            					end;
        end, obj);

    obj._e_event42 = obj.dataLink39:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				local p = tonumber(sheet.carac_p_1) or 0;
            				sheet.carac_n_1 = 20 - p;
        end, obj);

    obj._e_event43 = obj.dataLink41:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				local p = tonumber(sheet.carac_p_2) or 0;
            				sheet.carac_n_2 = 20 - p;
        end, obj);

    obj._e_event44 = obj.dataLink43:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				local p = tonumber(sheet.carac_p_3) or 0;
            				sheet.carac_n_3 = 20 - p;
        end, obj);

    obj._e_event45 = obj.dataLink45:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				local p = tonumber(sheet.carac_p_4) or 0;
            				sheet.carac_n_4 = 20 - p;
        end, obj);

    obj._e_event46 = obj.dataLink47:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				local p = tonumber(sheet.carac_p_5) or 0;
            				sheet.carac_n_5 = 20 - p;
        end, obj);

    obj._e_event47 = obj.dataLink49:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				local p = tonumber(sheet.carac_p_6) or 0;
            				sheet.carac_n_6 = 20 - p;
        end, obj);

    obj._e_event48 = obj.dataLink51:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				local p = tonumber(sheet.carac_p_7) or 0;
            				sheet.carac_n_7 = 20 - p;
        end, obj);

    obj._e_event49 = obj.dataLink53:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				local p = tonumber(sheet.carac_p_8) or 0;
            				sheet.carac_n_8 = 20 - p;
        end, obj);

    obj._e_event50 = obj.dataLink54:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = (tonumber(sheet.carac_p_1) or 0) +
            									(tonumber(sheet.carac_p_2) or 0) +
            									(tonumber(sheet.carac_p_3) or 0) +
            									(tonumber(sheet.carac_p_4) or 0) +
            									(tonumber(sheet.carac_p_5) or 0) +
            									(tonumber(sheet.carac_p_6) or 0) +
            									(tonumber(sheet.carac_p_7) or 0) +
            									(tonumber(sheet.carac_p_8) or 0);
            					sheet.carac_gasto = gasto;
        end, obj);

    obj._e_event51 = obj.dataLink55:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            					local gasto = tonumber(sheet.carac_gasto) or 0;
            					local total = tonumber(sheet.carac_total) or 0;
            
            					if gasto > total then
            						self.carac_total.fontColor = "#FF0000";
            					elseif gasto==total then
            						self.carac_total.fontColor = "#FFFFFF";
            					else 
            						self.carac_total.fontColor = "#00FF00";
            					end;
        end, obj);

    obj._e_event52 = obj.button1:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/README.md')
        end, obj);

    obj._e_event53 = obj.button2:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20The%20Maze/output/Ficha%20The%20Maze.rpk?raw=true')
        end, obj);

    obj._e_event54 = obj.button3:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event55 = obj.button4:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=130746');
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.label186 ~= nil then self.label186:destroy(); self.label186 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.atr_max ~= nil then self.atr_max:destroy(); self.atr_max = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.label176 ~= nil then self.label176:destroy(); self.label176 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label184 ~= nil then self.label184:destroy(); self.label184 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label185 ~= nil then self.label185:destroy(); self.label185 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.frmBase ~= nil then self.frmBase:destroy(); self.frmBase = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.label181 ~= nil then self.label181:destroy(); self.label181 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label175 ~= nil then self.label175:destroy(); self.label175 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label188 ~= nil then self.label188:destroy(); self.label188 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label177 ~= nil then self.label177:destroy(); self.label177 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.rclHabilidades ~= nil then self.rclHabilidades:destroy(); self.rclHabilidades = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.frmInventory ~= nil then self.frmInventory:destroy(); self.frmInventory = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label190 ~= nil then self.label190:destroy(); self.label190 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.rclInventario ~= nil then self.rclInventario:destroy(); self.rclInventario = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.label191 ~= nil then self.label191:destroy(); self.label191 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.label182 ~= nil then self.label182:destroy(); self.label182 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.habilidadesDisponivel ~= nil then self.habilidadesDisponivel:destroy(); self.habilidadesDisponivel = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.label178 ~= nil then self.label178:destroy(); self.label178 = nil; end;
        if self.label179 ~= nil then self.label179:destroy(); self.label179 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label174 ~= nil then self.label174:destroy(); self.label174 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.carac_total ~= nil then self.carac_total:destroy(); self.carac_total = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label173 ~= nil then self.label173:destroy(); self.label173 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label189 ~= nil then self.label189:destroy(); self.label189 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.label180 ~= nil then self.label180:destroy(); self.label180 = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label187 ~= nil then self.label187:destroy(); self.label187 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label183 ~= nil then self.label183:destroy(); self.label183 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
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
