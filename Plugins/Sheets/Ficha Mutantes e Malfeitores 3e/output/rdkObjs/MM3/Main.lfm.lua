require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMM3()
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
    obj:setName("frmMM3");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Mutantes.Malfeitores.3e");
    obj:setTitle("Ficha Mutantes e Malfeitores 3e");
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

        -- DEBUG FUNCTIONS

        local function dump(o)
           if type(o) == 'table' then
              local s = '{ '
              for k,v in pairs(o) do
                 if type(k) ~= 'number' then k = '"'..k..'"' end
                 s = s .. '['..k..'] = ' .. dump(v) .. ','
              end
              return s .. '} '
           else
              return tostring(o)
           end
        end
        
        local function write(str)
            local mesa = Firecast.getMesaDe(sheet);
            if str then
                mesa.activeChat:escrever(str);
            else
                mesa.activeChat:escrever("String nula");
            end;
        end;


        


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
    obj.tab1:setName("tab1");

    obj.frmGeneral = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeneral:setParent(obj.tab1);
    obj.frmGeneral:setName("frmGeneral");
    obj.frmGeneral:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeneral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(35);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setMargins({bottom=5});
    obj.rectangle1:setPadding({top=5,bottom=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(250);
    obj.layout1:setMargins({right=5,left=5});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setText("Herói");
    obj.label1:setWidth(100);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("client");
    obj.edit1:setWidth(50);
    obj.edit1:setField("heroi");
    obj.edit1:setHeight(25);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(350);
    obj.layout2:setMargins({right=5,left=5});
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setText("Identidade");
    obj.label2:setWidth(100);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setAlign("client");
    obj.edit2:setWidth(50);
    obj.edit2:setField("identidade");
    obj.edit2:setHeight(25);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setAlign("right");
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("identidadeTipo");
    obj.comboBox1:setItems({'Secreta', 'Pública'});
    obj.comboBox1:setName("comboBox1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(250);
    obj.layout3:setMargins({right=5,left=5});
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setAlign("left");
    obj.label3:setText("Grupo Afiliado");
    obj.label3:setWidth(100);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setAlign("client");
    obj.edit3:setWidth(50);
    obj.edit3:setField("afiliado");
    obj.edit3:setHeight(25);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(250);
    obj.layout4:setMargins({right=5,left=5});
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setAlign("left");
    obj.label4:setText("Base");
    obj.label4:setWidth(100);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setAlign("client");
    obj.edit4:setWidth(50);
    obj.edit4:setField("baseOp");
    obj.edit4:setHeight(25);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(150);
    obj.layout5:setMargins({right=5,left=5});
    obj.layout5:setName("layout5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setAlign("left");
    obj.label5:setText("Nível de Poder");
    obj.label5:setWidth(100);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setAlign("client");
    obj.edit5:setWidth(50);
    obj.edit5:setField("np");
    obj.edit5:setHeight(25);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(260);
    obj.layout6:setMargins({bottom=5});
    obj.layout6:setPadding({top=5,bottom=5});
    obj.layout6:setName("layout6");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout6);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(250);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setMargins({right=5});
    obj.rectangle2:setName("rectangle2");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle2);
    obj.label6:setAlign("top");
    obj.label6:setHeight(25);
    obj.label6:setText("Atributos");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle2);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setAlign("client");
    obj.label7:setText("");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout7);
    obj.label8:setAlign("right");
    obj.label8:setWidth(40);
    obj.label8:setText("PP");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout7);
    obj.label9:setAlign("right");
    obj.label9:setWidth(40);
    obj.label9:setText("Out");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle2);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setMargins({right=5,left=5});
    obj.layout8:setName("layout8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setAlign("left");
    obj.label10:setText("Força");
    obj.label10:setWidth(100);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout8);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle3);
    obj.label11:setAlign("client");
    obj.label11:setField("forcaTotal");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(12);
    obj.label11:setName("label11");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout8);
    obj.edit6:setAlign("right");
    obj.edit6:setWidth(40);
    obj.edit6:setField("forcaBase");
    obj.edit6:setHeight(25);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setType("number");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setAlign("right");
    obj.edit7:setWidth(40);
    obj.edit7:setField("forcaBonus");
    obj.edit7:setHeight(25);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setFontSize(10);
    obj.edit7:setName("edit7");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setFields({'forcaBase', 'forcaBonus'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle2);
    obj.dataLink2:setFields({'forcaTotal'});
    obj.dataLink2:setName("dataLink2");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle2);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setMargins({right=5,left=5});
    obj.layout9:setName("layout9");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout9);
    obj.label12:setAlign("left");
    obj.label12:setText("Agilidade");
    obj.label12:setWidth(100);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout9);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle4);
    obj.label13:setAlign("client");
    obj.label13:setField("agilidadeTotal");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setFontSize(12);
    obj.label13:setName("label13");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setAlign("right");
    obj.edit8:setWidth(40);
    obj.edit8:setField("agilidadeBase");
    obj.edit8:setHeight(25);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setAlign("right");
    obj.edit9:setWidth(40);
    obj.edit9:setField("agilidadeBonus");
    obj.edit9:setHeight(25);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setFontSize(10);
    obj.edit9:setName("edit9");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle2);
    obj.dataLink3:setFields({'agilidadeBase', 'agilidadeBonus'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle2);
    obj.dataLink4:setFields({'agilidadeTotal'});
    obj.dataLink4:setName("dataLink4");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle2);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setMargins({right=5,left=5});
    obj.layout10:setName("layout10");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout10);
    obj.label14:setAlign("left");
    obj.label14:setText("Luta");
    obj.label14:setWidth(100);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout10);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle5);
    obj.label15:setAlign("client");
    obj.label15:setField("lutaTotal");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontSize(12);
    obj.label15:setName("label15");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout10);
    obj.edit10:setAlign("right");
    obj.edit10:setWidth(40);
    obj.edit10:setField("lutaBase");
    obj.edit10:setHeight(25);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout10);
    obj.edit11:setAlign("right");
    obj.edit11:setWidth(40);
    obj.edit11:setField("lutaBonus");
    obj.edit11:setHeight(25);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setFontSize(10);
    obj.edit11:setName("edit11");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle2);
    obj.dataLink5:setFields({'lutaBase', 'lutaBonus'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle2);
    obj.dataLink6:setFields({'lutaTotal'});
    obj.dataLink6:setName("dataLink6");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle2);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setMargins({right=5,left=5});
    obj.layout11:setName("layout11");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout11);
    obj.label16:setAlign("left");
    obj.label16:setText("Prontidão");
    obj.label16:setWidth(100);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout11);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle6);
    obj.label17:setAlign("client");
    obj.label17:setField("prontidaoTotal");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(12);
    obj.label17:setName("label17");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout11);
    obj.edit12:setAlign("right");
    obj.edit12:setWidth(40);
    obj.edit12:setField("prontidaoBase");
    obj.edit12:setHeight(25);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout11);
    obj.edit13:setAlign("right");
    obj.edit13:setWidth(40);
    obj.edit13:setField("prontidaoBonus");
    obj.edit13:setHeight(25);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setType("number");
    obj.edit13:setFontSize(10);
    obj.edit13:setName("edit13");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle2);
    obj.dataLink7:setFields({'prontidaoBase', 'prontidaoBonus'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle2);
    obj.dataLink8:setFields({'prontidaoTotal'});
    obj.dataLink8:setName("dataLink8");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle2);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setMargins({right=5,left=5});
    obj.layout12:setName("layout12");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout12);
    obj.label18:setAlign("left");
    obj.label18:setText("Vigor");
    obj.label18:setWidth(100);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout12);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle7);
    obj.label19:setAlign("client");
    obj.label19:setField("vigorTotal");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setFontSize(12);
    obj.label19:setName("label19");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout12);
    obj.edit14:setAlign("right");
    obj.edit14:setWidth(40);
    obj.edit14:setField("vigorBase");
    obj.edit14:setHeight(25);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout12);
    obj.edit15:setAlign("right");
    obj.edit15:setWidth(40);
    obj.edit15:setField("vigorBonus");
    obj.edit15:setHeight(25);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setType("number");
    obj.edit15:setFontSize(10);
    obj.edit15:setName("edit15");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle2);
    obj.dataLink9:setFields({'vigorBase', 'vigorBonus'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle2);
    obj.dataLink10:setFields({'vigorTotal'});
    obj.dataLink10:setName("dataLink10");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setMargins({right=5,left=5});
    obj.layout13:setName("layout13");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout13);
    obj.label20:setAlign("left");
    obj.label20:setText("Destreza");
    obj.label20:setWidth(100);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout13);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle8);
    obj.label21:setAlign("client");
    obj.label21:setField("destrezaTotal");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setFontSize(12);
    obj.label21:setName("label21");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout13);
    obj.edit16:setAlign("right");
    obj.edit16:setWidth(40);
    obj.edit16:setField("destrezaBase");
    obj.edit16:setHeight(25);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout13);
    obj.edit17:setAlign("right");
    obj.edit17:setWidth(40);
    obj.edit17:setField("destrezaBonus");
    obj.edit17:setHeight(25);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setType("number");
    obj.edit17:setFontSize(10);
    obj.edit17:setName("edit17");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle2);
    obj.dataLink11:setFields({'destrezaBase', 'destrezaBonus'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle2);
    obj.dataLink12:setFields({'destrezaTotal'});
    obj.dataLink12:setName("dataLink12");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setMargins({right=5,left=5});
    obj.layout14:setName("layout14");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout14);
    obj.label22:setAlign("left");
    obj.label22:setText("Intelecto");
    obj.label22:setWidth(100);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout14);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle9);
    obj.label23:setAlign("client");
    obj.label23:setField("intelectoTotal");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setFontSize(12);
    obj.label23:setName("label23");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout14);
    obj.edit18:setAlign("right");
    obj.edit18:setWidth(40);
    obj.edit18:setField("intelectoBase");
    obj.edit18:setHeight(25);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout14);
    obj.edit19:setAlign("right");
    obj.edit19:setWidth(40);
    obj.edit19:setField("intelectoBonus");
    obj.edit19:setHeight(25);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setType("number");
    obj.edit19:setFontSize(10);
    obj.edit19:setName("edit19");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle2);
    obj.dataLink13:setFields({'intelectoBase', 'intelectoBonus'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.rectangle2);
    obj.dataLink14:setFields({'intelectoTotal'});
    obj.dataLink14:setName("dataLink14");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle2);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setMargins({right=5,left=5});
    obj.layout15:setName("layout15");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout15);
    obj.label24:setAlign("left");
    obj.label24:setText("Presença");
    obj.label24:setWidth(100);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout15);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle10);
    obj.label25:setAlign("client");
    obj.label25:setField("presencaTotal");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setFontSize(12);
    obj.label25:setName("label25");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout15);
    obj.edit20:setAlign("right");
    obj.edit20:setWidth(40);
    obj.edit20:setField("presencaBase");
    obj.edit20:setHeight(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout15);
    obj.edit21:setAlign("right");
    obj.edit21:setWidth(40);
    obj.edit21:setField("presencaBonus");
    obj.edit21:setHeight(25);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setType("number");
    obj.edit21:setFontSize(10);
    obj.edit21:setName("edit21");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.rectangle2);
    obj.dataLink15:setFields({'presencaBase', 'presencaBonus'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.rectangle2);
    obj.dataLink16:setFields({'presencaTotal'});
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.rectangle2);
    obj.dataLink17:setFields({'forcaBase', 'agilidadeBase', 'lutaBase', 'prontidaoBase', 'vigorBase', 'destrezaBase', 'intelectoBase', 'presencaBase'});
    obj.dataLink17:setName("dataLink17");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout6);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(290);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setMargins({right=5});
    obj.rectangle11:setName("rectangle11");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle11);
    obj.label26:setAlign("top");
    obj.label26:setHeight(25);
    obj.label26:setText("Defesas");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle11);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout16);
    obj.label27:setAlign("client");
    obj.label27:setText("");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout16);
    obj.label28:setAlign("right");
    obj.label28:setWidth(40);
    obj.label28:setText("Atr");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout16);
    obj.label29:setAlign("right");
    obj.label29:setWidth(40);
    obj.label29:setText("PP");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout16);
    obj.label30:setAlign("right");
    obj.label30:setWidth(40);
    obj.label30:setText("Out");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle11);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setMargins({right=5,left=5});
    obj.layout17:setName("layout17");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout17);
    obj.label31:setAlign("left");
    obj.label31:setText("Esquiva");
    obj.label31:setWidth(100);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout17);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle12);
    obj.label32:setAlign("client");
    obj.label32:setField("esquivaTotal");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setFontSize(12);
    obj.label32:setName("label32");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout17);
    obj.rectangle13:setAlign("right");
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle13);
    obj.label33:setAlign("client");
    obj.label33:setField("agilidadeTotal");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setFontSize(12);
    obj.label33:setName("label33");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout17);
    obj.edit22:setAlign("right");
    obj.edit22:setWidth(40);
    obj.edit22:setField("esquivaBase");
    obj.edit22:setHeight(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout17);
    obj.edit23:setAlign("right");
    obj.edit23:setWidth(40);
    obj.edit23:setField("esquivaBonus");
    obj.edit23:setHeight(25);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setType("number");
    obj.edit23:setFontSize(10);
    obj.edit23:setName("edit23");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.rectangle11);
    obj.dataLink18:setFields({'esquivaBase', 'esquivaBonus', agilidadeTotal});
    obj.dataLink18:setName("dataLink18");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle11);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setMargins({right=5,left=5});
    obj.layout18:setName("layout18");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout18);
    obj.label34:setAlign("left");
    obj.label34:setText("Aparar");
    obj.label34:setWidth(100);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout18);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle14);
    obj.label35:setAlign("client");
    obj.label35:setField("apararTotal");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setFontSize(12);
    obj.label35:setName("label35");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout18);
    obj.rectangle15:setAlign("right");
    obj.rectangle15:setWidth(40);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle15);
    obj.label36:setAlign("client");
    obj.label36:setField("lutaTotal");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setFontSize(12);
    obj.label36:setName("label36");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout18);
    obj.edit24:setAlign("right");
    obj.edit24:setWidth(40);
    obj.edit24:setField("apararBase");
    obj.edit24:setHeight(25);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout18);
    obj.edit25:setAlign("right");
    obj.edit25:setWidth(40);
    obj.edit25:setField("apararBonus");
    obj.edit25:setHeight(25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setType("number");
    obj.edit25:setFontSize(10);
    obj.edit25:setName("edit25");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.rectangle11);
    obj.dataLink19:setFields({'apararBase', 'apararBonus', lutaTotal});
    obj.dataLink19:setName("dataLink19");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle11);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setMargins({right=5,left=5});
    obj.layout19:setName("layout19");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout19);
    obj.label37:setAlign("left");
    obj.label37:setText("Fortitude");
    obj.label37:setWidth(100);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout19);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle16);
    obj.label38:setAlign("client");
    obj.label38:setField("fortitudeTotal");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setFontSize(12);
    obj.label38:setName("label38");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout19);
    obj.rectangle17:setAlign("right");
    obj.rectangle17:setWidth(40);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle17);
    obj.label39:setAlign("client");
    obj.label39:setField("vigorTotal");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontSize(12);
    obj.label39:setName("label39");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout19);
    obj.edit26:setAlign("right");
    obj.edit26:setWidth(40);
    obj.edit26:setField("fortitudeBase");
    obj.edit26:setHeight(25);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout19);
    obj.edit27:setAlign("right");
    obj.edit27:setWidth(40);
    obj.edit27:setField("fortitudeBonus");
    obj.edit27:setHeight(25);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setType("number");
    obj.edit27:setFontSize(10);
    obj.edit27:setName("edit27");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.rectangle11);
    obj.dataLink20:setFields({'fortitudeBase', 'fortitudeBonus', vigorTotal});
    obj.dataLink20:setName("dataLink20");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle11);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setMargins({right=5,left=5});
    obj.layout20:setName("layout20");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout20);
    obj.label40:setAlign("left");
    obj.label40:setText("Resistência");
    obj.label40:setWidth(100);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout20);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle18);
    obj.label41:setAlign("client");
    obj.label41:setField("resistenciaTotal");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setFontSize(12);
    obj.label41:setName("label41");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout20);
    obj.rectangle19:setAlign("right");
    obj.rectangle19:setWidth(40);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle19);
    obj.label42:setAlign("client");
    obj.label42:setField("vigorTotal");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setFontSize(12);
    obj.label42:setName("label42");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout20);
    obj.edit28:setAlign("right");
    obj.edit28:setWidth(40);
    obj.edit28:setField("resistenciaBase");
    obj.edit28:setHeight(25);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout20);
    obj.edit29:setAlign("right");
    obj.edit29:setWidth(40);
    obj.edit29:setField("resistenciaBonus");
    obj.edit29:setHeight(25);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setType("number");
    obj.edit29:setFontSize(10);
    obj.edit29:setName("edit29");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.rectangle11);
    obj.dataLink21:setFields({'resistenciaBase', 'resistenciaBonus', vigorTotal});
    obj.dataLink21:setName("dataLink21");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle11);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setMargins({right=5,left=5});
    obj.layout21:setName("layout21");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout21);
    obj.label43:setAlign("left");
    obj.label43:setText("Vontade");
    obj.label43:setWidth(100);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout21);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle20);
    obj.label44:setAlign("client");
    obj.label44:setField("vontadeTotal");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setFontSize(12);
    obj.label44:setName("label44");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout21);
    obj.rectangle21:setAlign("right");
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle21);
    obj.label45:setAlign("client");
    obj.label45:setField("prontidaoTotal");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setFontSize(12);
    obj.label45:setName("label45");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout21);
    obj.edit30:setAlign("right");
    obj.edit30:setWidth(40);
    obj.edit30:setField("vontadeBase");
    obj.edit30:setHeight(25);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout21);
    obj.edit31:setAlign("right");
    obj.edit31:setWidth(40);
    obj.edit31:setField("vontadeBonus");
    obj.edit31:setHeight(25);
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setType("number");
    obj.edit31:setFontSize(10);
    obj.edit31:setName("edit31");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.rectangle11);
    obj.dataLink22:setFields({'vontadeBase', 'vontadeBonus', prontidaoTotal});
    obj.dataLink22:setName("dataLink22");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle11);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setMargins({right=5,left=5});
    obj.layout22:setName("layout22");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout22);
    obj.label46:setAlign("left");
    obj.label46:setText("Esquiva+Resistência");
    obj.label46:setWidth(150);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout22);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle22);
    obj.label47:setAlign("client");
    obj.label47:setField("dfERTotal");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontSize(12);
    obj.label47:setName("label47");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout22);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle23);
    obj.label48:setAlign("client");
    obj.label48:setField("npMax");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setFontSize(12);
    obj.label48:setName("label48");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.rectangle11);
    obj.dataLink23:setFields({'esquivaTotal', 'resistenciaTotal'});
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.rectangle11);
    obj.dataLink24:setFields({'np'});
    obj.dataLink24:setName("dataLink24");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle11);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setMargins({right=5,left=5});
    obj.layout23:setName("layout23");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout23);
    obj.label49:setAlign("left");
    obj.label49:setText("Aparar+Resistência");
    obj.label49:setWidth(150);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout23);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(40);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle24);
    obj.label50:setAlign("client");
    obj.label50:setField("dfARTotal");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setFontSize(12);
    obj.label50:setName("label50");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout23);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(40);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle25);
    obj.label51:setAlign("client");
    obj.label51:setField("npMax");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setFontSize(12);
    obj.label51:setName("label51");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.rectangle11);
    obj.dataLink25:setFields({'apararTotal', 'resistenciaTotal'});
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.rectangle11);
    obj.dataLink26:setFields({'np'});
    obj.dataLink26:setName("dataLink26");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle11);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setMargins({right=5,left=5});
    obj.layout24:setName("layout24");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout24);
    obj.label52:setAlign("left");
    obj.label52:setText("Fortitude+Vontade");
    obj.label52:setWidth(150);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout24);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(40);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle26);
    obj.label53:setAlign("client");
    obj.label53:setField("dfFVTotal");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setFontSize(12);
    obj.label53:setName("label53");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout24);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(40);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle27);
    obj.label54:setAlign("client");
    obj.label54:setField("npMax");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setFontSize(12);
    obj.label54:setName("label54");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.rectangle11);
    obj.dataLink27:setFields({'fortitudeTotal', 'vontadeTotal'});
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.rectangle11);
    obj.dataLink28:setFields({'np'});
    obj.dataLink28:setName("dataLink28");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.rectangle11);
    obj.dataLink29:setFields({'esquivaBase', 'apararBase', 'fortitudeBase', 'resistenciaBase', 'vontadeBase'});
    obj.dataLink29:setName("dataLink29");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout6);
    obj.rectangle28:setAlign("left");
    obj.rectangle28:setWidth(250);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setMargins({right=5});
    obj.rectangle28:setName("rectangle28");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle28);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(5);
    obj.layout25:setName("layout25");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle28);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setMargins({right=5,left=5});
    obj.layout26:setName("layout26");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout26);
    obj.label55:setAlign("left");
    obj.label55:setText("Iniciativa");
    obj.label55:setWidth(100);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout26);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle29);
    obj.label56:setAlign("client");
    obj.label56:setField("iniciativaTotal");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setFontSize(12);
    obj.label56:setName("label56");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout26);
    obj.rectangle30:setAlign("right");
    obj.rectangle30:setWidth(40);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle30);
    obj.label57:setAlign("client");
    obj.label57:setField("agilidadeTotal");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setFontSize(12);
    obj.label57:setName("label57");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout26);
    obj.edit32:setAlign("right");
    obj.edit32:setWidth(40);
    obj.edit32:setField("iniciativaBonus");
    obj.edit32:setHeight(25);
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setType("number");
    obj.edit32:setFontSize(10);
    obj.edit32:setName("edit32");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.rectangle28);
    obj.dataLink30:setFields({'iniciativaBonus', 'agilidadeTotal'});
    obj.dataLink30:setName("dataLink30");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle28);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(10);
    obj.layout27:setName("layout27");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle28);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setMargins({right=5,left=5});
    obj.layout28:setName("layout28");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout28);
    obj.label58:setAlign("left");
    obj.label58:setText("Pontos Heroicos");
    obj.label58:setWidth(100);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout28);
    obj.edit33:setAlign("client");
    obj.edit33:setWidth(50);
    obj.edit33:setField("ph");
    obj.edit33:setHeight(25);
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle28);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("anotacoes4");
    obj.textEditor1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.textEditor1:setName("textEditor1");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout6);
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(150);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setMargins({right=5});
    obj.rectangle31:setName("rectangle31");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle31);
    obj.label59:setAlign("top");
    obj.label59:setHeight(25);
    obj.label59:setText("Pontos de Poder");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle31);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setMargins({right=5,left=5});
    obj.layout29:setName("layout29");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout29);
    obj.label60:setAlign("left");
    obj.label60:setText("Total");
    obj.label60:setWidth(100);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout29);
    obj.edit34:setAlign("client");
    obj.edit34:setWidth(50);
    obj.edit34:setField("ppTotal");
    obj.edit34:setHeight(25);
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle31);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setMargins({right=5,left=5});
    obj.layout30:setName("layout30");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout30);
    obj.label61:setAlign("left");
    obj.label61:setText("Gastos");
    obj.label61:setWidth(100);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout30);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle32);
    obj.label62:setAlign("client");
    obj.label62:setField("ppGasto");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setFontSize(12);
    obj.label62:setName("label62");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle31);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(10);
    obj.layout31:setName("layout31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle31);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setMargins({right=5,left=5});
    obj.layout32:setName("layout32");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout32);
    obj.label63:setAlign("left");
    obj.label63:setText("Atributos");
    obj.label63:setWidth(100);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout32);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle33);
    obj.label64:setAlign("client");
    obj.label64:setField("ppAtributo");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setFontSize(12);
    obj.label64:setName("label64");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle31);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setMargins({right=5,left=5});
    obj.layout33:setName("layout33");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout33);
    obj.label65:setAlign("left");
    obj.label65:setText("Poderes");
    obj.label65:setWidth(100);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout33);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle34);
    obj.label66:setAlign("client");
    obj.label66:setField("ppPoderes");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setFontSize(12);
    obj.label66:setName("label66");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle31);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(25);
    obj.layout34:setMargins({right=5,left=5});
    obj.layout34:setName("layout34");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout34);
    obj.label67:setAlign("left");
    obj.label67:setText("Vantagens");
    obj.label67:setWidth(100);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout34);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle35);
    obj.label68:setAlign("client");
    obj.label68:setField("ppVantagens");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setFontSize(12);
    obj.label68:setName("label68");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle31);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(25);
    obj.layout35:setMargins({right=5,left=5});
    obj.layout35:setName("layout35");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout35);
    obj.label69:setAlign("left");
    obj.label69:setText("Perícias");
    obj.label69:setWidth(100);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout35);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle36);
    obj.label70:setAlign("client");
    obj.label70:setField("ppPericias");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setFontSize(12);
    obj.label70:setName("label70");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle31);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setMargins({right=5,left=5});
    obj.layout36:setName("layout36");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout36);
    obj.label71:setAlign("left");
    obj.label71:setText("Defesas");
    obj.label71:setWidth(100);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout36);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle37);
    obj.label72:setAlign("client");
    obj.label72:setField("ppDefesas");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setFontSize(12);
    obj.label72:setName("label72");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.rectangle31);
    obj.dataLink31:setFields({'ppAtributo', 'ppPoderes', 'ppVantagens', 'ppPericias', 'ppDefesas'});
    obj.dataLink31:setName("dataLink31");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout6);
    obj.rectangle38:setAlign("left");
    obj.rectangle38:setWidth(260);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle38);
    obj.label73:setLeft(0);
    obj.label73:setTop(100);
    obj.label73:setWidth(260);
    obj.label73:setHeight(25);
    obj.label73:setText("Avatar");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle38);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox1);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(300);
    obj.layout37:setMargins({bottom=5});
    obj.layout37:setPadding({top=5,bottom=5});
    obj.layout37:setName("layout37");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout37);
    obj.rectangle39:setAlign("left");
    obj.rectangle39:setWidth(600);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setMargins({right=5});
    obj.rectangle39:setName("rectangle39");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle39);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(25);
    obj.layout38:setMargins({top=5});
    obj.layout38:setName("layout38");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout38);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("+");
    obj.button1:setMargins({left=5});
    obj.button1:setName("button1");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout38);
    obj.label74:setAlign("client");
    obj.label74:setText("Ataques");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle39);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout39);
    obj.label75:setAlign("client");
    obj.label75:setText("");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout39);
    obj.label76:setAlign("right");
    obj.label76:setWidth(40);
    obj.label76:setText("Atq");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout39);
    obj.label77:setAlign("right");
    obj.label77:setWidth(40);
    obj.label77:setText("Dano");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout39);
    obj.label78:setAlign("right");
    obj.label78:setWidth(100);
    obj.label78:setText("Efeito");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout39);
    obj.label79:setAlign("right");
    obj.label79:setWidth(115);
    obj.label79:setText("");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.rclAtaques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaques:setParent(obj.rectangle39);
    obj.rclAtaques:setAlign("client");
    obj.rclAtaques:setMargins({left=5,right=5,bottom=5,top=5});
    obj.rclAtaques:setName("rclAtaques");
    obj.rclAtaques:setField("rclAtaques");
    obj.rclAtaques:setTemplateForm("frmAtaqueItem");
    obj.rclAtaques:setLayout("vertical");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout37);
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setWidth(600);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setMargins({right=5});
    obj.rectangle40:setName("rectangle40");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle40);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(25);
    obj.layout40:setMargins({top=5});
    obj.layout40:setName("layout40");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout40);
    obj.button2:setAlign("left");
    obj.button2:setWidth(25);
    obj.button2:setText("+");
    obj.button2:setMargins({left=5});
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout40);
    obj.button3:setAlign("left");
    obj.button3:setWidth(150);
    obj.button3:setText("Add Todas Perícias");
    obj.button3:setName("button3");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout40);
    obj.label80:setAlign("client");
    obj.label80:setText("Perícias");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle40);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout41);
    obj.label81:setAlign("client");
    obj.label81:setText("");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout41);
    obj.label82:setAlign("right");
    obj.label82:setWidth(50);
    obj.label82:setText("Total");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout41);
    obj.label83:setAlign("right");
    obj.label83:setWidth(50);
    obj.label83:setText("");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout41);
    obj.label84:setAlign("right");
    obj.label84:setWidth(50);
    obj.label84:setText("Atr");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout41);
    obj.label85:setAlign("right");
    obj.label85:setWidth(50);
    obj.label85:setText("Grads");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout41);
    obj.label86:setAlign("right");
    obj.label86:setWidth(50);
    obj.label86:setText("Out");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout41);
    obj.label87:setAlign("right");
    obj.label87:setWidth(50);
    obj.label87:setText("Max");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout41);
    obj.label88:setAlign("right");
    obj.label88:setWidth(75);
    obj.label88:setText("");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.rclPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPericias:setParent(obj.rectangle40);
    obj.rclPericias:setAlign("client");
    obj.rclPericias:setMargins({left=5,right=5,bottom=5,top=5});
    obj.rclPericias:setName("rclPericias");
    obj.rclPericias:setField("rclPericias");
    obj.rclPericias:setTemplateForm("frmPericiaItem");
    obj.rclPericias:setLayout("vertical");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Poderes & Vantagens");
    obj.tab2:setName("tab2");

    obj.frmPoderes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPoderes:setParent(obj.tab2);
    obj.frmPoderes:setName("frmPoderes");
    obj.frmPoderes:setAlign("client");

    obj.popPoder = GUI.fromHandle(_obj_newObject("popup"));
    obj.popPoder:setParent(obj.frmPoderes);
    obj.popPoder:setName("popPoder");
    obj.popPoder:setWidth(470);
    obj.popPoder:setHeight(470);
    obj.popPoder:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popPoder, "autoScopeNode",  "false");
    obj.popPoder:setPadding({left=10,right=10,bottom=10,top=10});

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.popPoder);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(50);
    obj.layout42:setMargins({left=5});
    obj.layout42:setName("layout42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(90);
    obj.layout43:setName("layout43");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout43);
    obj.label89:setAlign("top");
    obj.label89:setHeight(25);
    obj.label89:setText("Defesa");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout43);
    obj.comboBox2:setAlign("client");
    obj.comboBox2:setField("defesa");
    obj.comboBox2:setItems({'Esquiva', 'Aparar', 'Fortitude', 'Resistência', 'Vontade', 'Nenhum'});
    obj.comboBox2:setName("comboBox2");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout42);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(90);
    obj.layout44:setName("layout44");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout44);
    obj.label90:setAlign("top");
    obj.label90:setHeight(25);
    obj.label90:setText("Ação");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout44);
    obj.comboBox3:setAlign("client");
    obj.comboBox3:setField("acao");
    obj.comboBox3:setItems({'Livre', 'Reação', 'Movimento', 'Padrão', 'Nenhum'});
    obj.comboBox3:setName("comboBox3");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout42);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(90);
    obj.layout45:setName("layout45");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout45);
    obj.label91:setAlign("top");
    obj.label91:setHeight(25);
    obj.label91:setText("Alcance");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout45);
    obj.edit35:setAlign("client");
    obj.edit35:setField("alcance");
    obj.edit35:setName("edit35");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout42);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(90);
    obj.layout46:setName("layout46");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout46);
    obj.label92:setAlign("top");
    obj.label92:setHeight(25);
    obj.label92:setText("Duração");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout46);
    obj.edit36:setAlign("client");
    obj.edit36:setField("duracao");
    obj.edit36:setName("edit36");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout42);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(90);
    obj.layout47:setName("layout47");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout47);
    obj.label93:setAlign("top");
    obj.label93:setHeight(25);
    obj.label93:setText("Livro");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout47);
    obj.edit37:setAlign("client");
    obj.edit37:setField("livro");
    obj.edit37:setName("edit37");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popPoder);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("efeitos");
    obj.textEditor2:setMargins({left=5,right=5,top=5,bottom=5});
    obj.textEditor2:setName("textEditor2");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.popPoder);
    obj.textEditor3:setAlign("bottom");
    obj.textEditor3:setHeight(100);
    obj.textEditor3:setField("notas");
    obj.textEditor3:setMargins({left=5,right=5,top=0,bottom=5});
    obj.textEditor3:setName("textEditor3");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.popPoder);
    obj.layout48:setAlign("bottom");
    obj.layout48:setHeight(50);
    obj.layout48:setMargins({left=5});
    obj.layout48:setName("layout48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout48);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(75);
    obj.layout49:setName("layout49");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout49);
    obj.label94:setAlign("top");
    obj.label94:setHeight(25);
    obj.label94:setText("Graduações");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout49);
    obj.edit38:setAlign("client");
    obj.edit38:setField("custoGrad");
    obj.edit38:setName("edit38");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout48);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(75);
    obj.layout50:setName("layout50");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout50);
    obj.label95:setAlign("top");
    obj.label95:setHeight(25);
    obj.label95:setText("Extras");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout50);
    obj.edit39:setAlign("client");
    obj.edit39:setField("custoExtra");
    obj.edit39:setName("edit39");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout48);
    obj.layout51:setAlign("left");
    obj.layout51:setWidth(75);
    obj.layout51:setName("layout51");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout51);
    obj.label96:setAlign("top");
    obj.label96:setHeight(25);
    obj.label96:setText("Falhas");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout51);
    obj.edit40:setAlign("client");
    obj.edit40:setField("custoFalha");
    obj.edit40:setName("edit40");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout48);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(75);
    obj.layout52:setName("layout52");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout52);
    obj.label97:setAlign("top");
    obj.label97:setHeight(25);
    obj.label97:setText("Custo");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout52);
    obj.edit41:setAlign("client");
    obj.edit41:setField("custoMult");
    obj.edit41:setName("edit41");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout48);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(75);
    obj.layout53:setName("layout53");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout53);
    obj.label98:setAlign("top");
    obj.label98:setHeight(25);
    obj.label98:setText("Extra Fixo");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout53);
    obj.edit42:setAlign("client");
    obj.edit42:setField("custoExtraFixo");
    obj.edit42:setName("edit42");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout48);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(75);
    obj.layout54:setName("layout54");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout54);
    obj.label99:setAlign("top");
    obj.label99:setHeight(25);
    obj.label99:setText("Falha Fixo");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout54);
    obj.edit43:setAlign("client");
    obj.edit43:setField("custoFalhaFixo");
    obj.edit43:setName("edit43");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmPoderes);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.scrollBox2);
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setWidth(600);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setMargins({right=5});
    obj.rectangle41:setName("rectangle41");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle41);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(25);
    obj.layout55:setMargins({top=5});
    obj.layout55:setName("layout55");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout55);
    obj.button4:setAlign("left");
    obj.button4:setWidth(25);
    obj.button4:setText("+");
    obj.button4:setMargins({left=5});
    obj.button4:setName("button4");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout55);
    obj.label100:setAlign("client");
    obj.label100:setText("Poderes");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle41);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout56);
    obj.label101:setAlign("client");
    obj.label101:setText("");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setAlign("right");
    obj.layout57:setWidth(315);
    obj.layout57:setName("layout57");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout57);
    obj.label102:setAlign("left");
    obj.label102:setWidth(200);
    obj.label102:setText("");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout57);
    obj.label103:setAlign("left");
    obj.label103:setWidth(50);
    obj.label103:setText("Custo");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout57);
    obj.label104:setAlign("right");
    obj.label104:setWidth(70);
    obj.label104:setText("");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.rclPoderes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPoderes:setParent(obj.rectangle41);
    obj.rclPoderes:setAlign("client");
    obj.rclPoderes:setMargins({left=5,right=5,bottom=5,top=5});
    obj.rclPoderes:setName("rclPoderes");
    obj.rclPoderes:setField("rclPoderes");
    obj.rclPoderes:setTemplateForm("frmPoderItem");
    obj.rclPoderes:setLayout("vertical");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.scrollBox2);
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setWidth(600);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setMargins({right=5});
    obj.rectangle42:setName("rectangle42");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle42);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(25);
    obj.layout58:setMargins({top=5});
    obj.layout58:setName("layout58");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout58);
    obj.button5:setAlign("left");
    obj.button5:setWidth(25);
    obj.button5:setText("+");
    obj.button5:setMargins({left=5});
    obj.button5:setName("button5");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout58);
    obj.label105:setAlign("client");
    obj.label105:setText("Vantagens");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle42);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout59);
    obj.label106:setAlign("client");
    obj.label106:setText("");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout59);
    obj.layout60:setAlign("right");
    obj.layout60:setWidth(290);
    obj.layout60:setName("layout60");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout60);
    obj.label107:setAlign("left");
    obj.label107:setWidth(200);
    obj.label107:setText("");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout60);
    obj.label108:setAlign("left");
    obj.label108:setWidth(50);
    obj.label108:setText("Custo");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout60);
    obj.label109:setAlign("right");
    obj.label109:setWidth(45);
    obj.label109:setText("");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.rclVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclVantagens:setParent(obj.rectangle42);
    obj.rclVantagens:setAlign("client");
    obj.rclVantagens:setMargins({left=5,right=5,bottom=5,top=5});
    obj.rclVantagens:setName("rclVantagens");
    obj.rclVantagens:setField("rclVantagens");
    obj.rclVantagens:setTemplateForm("frmVantagemItem");
    obj.rclVantagens:setLayout("vertical");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Equipamentos");
    obj.tab3:setName("tab3");

    obj.frmEquipamentos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmEquipamentos:setParent(obj.tab3);
    obj.frmEquipamentos:setName("frmEquipamentos");
    obj.frmEquipamentos:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmEquipamentos);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.scrollBox3);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(400);
    obj.layout61:setMargins({right=10});
    obj.layout61:setName("layout61");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout61);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("black");
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(15);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.rectangle43);
    obj.label110:setAlign("top");
    obj.label110:setHeight(20);
    obj.label110:setText("Equipamentos");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle43);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("equipamentos");
    obj.textEditor4:setMargins({left=10,right=10,bottom=10});
    obj.textEditor4:setName("textEditor4");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox3);
    obj.layout62:setAlign("left");
    obj.layout62:setWidth(400);
    obj.layout62:setMargins({right=10});
    obj.layout62:setName("layout62");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout62);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(5);
    obj.rectangle44:setYradius(15);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle44);
    obj.label111:setAlign("top");
    obj.label111:setHeight(20);
    obj.label111:setText("Veículos");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle44);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("Veiculos");
    obj.textEditor5:setMargins({left=10,right=10,bottom=10});
    obj.textEditor5:setName("textEditor5");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.scrollBox3);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(400);
    obj.layout63:setMargins({right=10});
    obj.layout63:setName("layout63");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout63);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setXradius(5);
    obj.rectangle45:setYradius(15);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle45);
    obj.label112:setAlign("top");
    obj.label112:setHeight(20);
    obj.label112:setText("Quartel General");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle45);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("quartelGeneral");
    obj.textEditor6:setMargins({left=10,right=10,bottom=10});
    obj.textEditor6:setName("textEditor6");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Descrição");
    obj.tab4:setName("tab4");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab4);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmTemplateDescription);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.scrollBox4);
    obj.rectangle46:setAlign("top");
    obj.rectangle46:setHeight(55);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setMargins({bottom=5});
    obj.rectangle46:setName("rectangle46");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle46);
    obj.label113:setAlign("top");
    obj.label113:setHeight(20);
    obj.label113:setText("DESCRIÇÃO");
    obj.label113:setName("label113");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle46);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout64);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(380);
    obj.layout65:setMargins({right=10});
    obj.layout65:setName("layout65");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout65);
    obj.label114:setAlign("left");
    obj.label114:setWidth(90);
    obj.label114:setText("ORIGEM");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout65);
    obj.edit44:setAlign("left");
    obj.edit44:setWidth(290);
    obj.edit44:setField("nacionalidade");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setName("edit44");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout64);
    obj.layout66:setAlign("left");
    obj.layout66:setWidth(380);
    obj.layout66:setMargins({right=10});
    obj.layout66:setName("layout66");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout66);
    obj.label115:setAlign("left");
    obj.label115:setWidth(90);
    obj.label115:setText("IDADE");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout66);
    obj.edit45:setAlign("left");
    obj.edit45:setWidth(290);
    obj.edit45:setField("idade");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setName("edit45");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout64);
    obj.layout67:setAlign("left");
    obj.layout67:setWidth(380);
    obj.layout67:setMargins({right=10});
    obj.layout67:setName("layout67");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout67);
    obj.label116:setAlign("left");
    obj.label116:setWidth(90);
    obj.label116:setText("GÊNERO");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout67);
    obj.edit46:setAlign("left");
    obj.edit46:setWidth(290);
    obj.edit46:setField("genero");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setName("edit46");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.scrollBox4);
    obj.layout68:setAlign("left");
    obj.layout68:setWidth(375);
    obj.layout68:setMargins({right=5});
    obj.layout68:setName("layout68");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout68);
    obj.rectangle47:setAlign("top");
    obj.rectangle47:setHeight(200);
    obj.rectangle47:setMargins({bottom=5});
    obj.rectangle47:setColor("black");
    obj.rectangle47:setName("rectangle47");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle47);
    obj.label117:setAlign("top");
    obj.label117:setHeight(20);
    obj.label117:setText("DESCRIÇÃO FÍSICA");
    obj.label117:setMargins({left=5});
    obj.label117:setName("label117");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle47);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("aparencia");
    obj.textEditor7:setMargins({left=5,right=5,bottom=5});
    obj.textEditor7:setName("textEditor7");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout68);
    obj.rectangle48:setAlign("top");
    obj.rectangle48:setHeight(200);
    obj.rectangle48:setMargins({bottom=5});
    obj.rectangle48:setColor("black");
    obj.rectangle48:setName("rectangle48");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.rectangle48);
    obj.label118:setAlign("top");
    obj.label118:setHeight(20);
    obj.label118:setText("PERSONALIDADE");
    obj.label118:setMargins({left=5});
    obj.label118:setName("label118");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle48);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("personalidade");
    obj.textEditor8:setMargins({left=5,right=5,bottom=5});
    obj.textEditor8:setName("textEditor8");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout68);
    obj.rectangle49:setAlign("top");
    obj.rectangle49:setHeight(200);
    obj.rectangle49:setMargins({bottom=5});
    obj.rectangle49:setColor("black");
    obj.rectangle49:setName("rectangle49");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle49);
    obj.label119:setAlign("top");
    obj.label119:setHeight(20);
    obj.label119:setText("COMPLICAÇÕES");
    obj.label119:setMargins({left=5});
    obj.label119:setName("label119");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle49);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("complicacoes");
    obj.textEditor9:setMargins({left=5,right=5,bottom=5});
    obj.textEditor9:setName("textEditor9");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.scrollBox4);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setName("rectangle50");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.rectangle50);
    obj.label120:setAlign("top");
    obj.label120:setText("HISTORIA");
    obj.label120:setMargins({left=5});
    obj.label120:setName("label120");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.rectangle50);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setMargins({left=5,right=5,bottom=5});
    obj.richEdit1:setName("richEdit1");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab5);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateNotes);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.scrollBox5);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(400);
    obj.layout69:setMargins({right=10});
    obj.layout69:setName("layout69");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout69);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setXradius(5);
    obj.rectangle51:setYradius(15);
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setName("rectangle51");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle51);
    obj.label121:setAlign("top");
    obj.label121:setHeight(20);
    obj.label121:setText("Anotações");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.rectangle51);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setField("anotacoes1");
    obj.textEditor10:setMargins({left=10,right=10,bottom=10});
    obj.textEditor10:setName("textEditor10");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.scrollBox5);
    obj.layout70:setAlign("left");
    obj.layout70:setWidth(400);
    obj.layout70:setMargins({right=10});
    obj.layout70:setName("layout70");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout70);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setXradius(5);
    obj.rectangle52:setYradius(15);
    obj.rectangle52:setCornerType("round");
    obj.rectangle52:setName("rectangle52");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.rectangle52);
    obj.label122:setAlign("top");
    obj.label122:setHeight(20);
    obj.label122:setText("Anotações");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle52);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("anotacoes2");
    obj.textEditor11:setMargins({left=10,right=10,bottom=10});
    obj.textEditor11:setName("textEditor11");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.scrollBox5);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(400);
    obj.layout71:setMargins({right=10});
    obj.layout71:setName("layout71");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout71);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(5);
    obj.rectangle53:setYradius(15);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle53);
    obj.label123:setAlign("top");
    obj.label123:setHeight(20);
    obj.label123:setText("Anotações");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle53);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("anotacoes3");
    obj.textEditor12:setMargins({left=10,right=10,bottom=10});
    obj.textEditor12:setName("textEditor12");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab6);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");


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

		


    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmTemplateCreditos);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox6);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(250);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/MM3/images/mm.jpg");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox6);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/MM3/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.scrollBox6);
    obj.layout72:setLeft(850);
    obj.layout72:setTop(0);
    obj.layout72:setWidth(200);
    obj.layout72:setHeight(160);
    obj.layout72:setName("layout72");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout72);
    obj.rectangle54:setAlign("client");
    obj.rectangle54:setColor("black");
    obj.rectangle54:setXradius(5);
    obj.rectangle54:setYradius(15);
    obj.rectangle54:setCornerType("round");
    obj.rectangle54:setName("rectangle54");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout72);
    obj.label124:setLeft(0);
    obj.label124:setTop(10);
    obj.label124:setWidth(200);
    obj.label124:setHeight(20);
    obj.label124:setText("Programado por: ");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setName("label124");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout72);
    obj.label125:setLeft(0);
    obj.label125:setTop(35);
    obj.label125:setWidth(200);
    obj.label125:setHeight(20);
    obj.label125:setText("Vinny (Ambesek)");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.scrollBox6);
    obj.layout73:setLeft(850);
    obj.layout73:setTop(200);
    obj.layout73:setWidth(200);
    obj.layout73:setHeight(150);
    obj.layout73:setName("layout73");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout73);
    obj.rectangle55:setLeft(0);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(200);
    obj.rectangle55:setHeight(150);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setName("rectangle55");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout73);
    obj.label126:setLeft(0);
    obj.label126:setTop(10);
    obj.label126:setWidth(80);
    obj.label126:setHeight(20);
    obj.label126:setText("Tema:");
    obj.label126:setHorzTextAlign("center");
    obj.label126:setName("label126");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout73);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(10);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("theme");
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setItems({'Escuro', 'Claro'});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout73);
    obj.dataLink32:setField("theme");
    obj.dataLink32:setDefaultValue("Escuro");
    obj.dataLink32:setName("dataLink32");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout73);
    obj.label127:setLeft(0);
    obj.label127:setTop(35);
    obj.label127:setWidth(90);
    obj.label127:setHeight(20);
    obj.label127:setText("Cores: ");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout73);
    obj.label128:setLeft(0);
    obj.label128:setTop(60);
    obj.label128:setWidth(90);
    obj.label128:setHeight(20);
    obj.label128:setText("Fundo ");
    obj.label128:setHorzTextAlign("center");
    obj.label128:setName("label128");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout73);
    obj.comboBox5:setLeft(95);
    obj.comboBox5:setTop(60);
    obj.comboBox5:setWidth(90);
    obj.comboBox5:setField("colorBackground");
    obj.comboBox5:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox5:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout73);
    obj.dataLink33:setField("colorBackground");
    obj.dataLink33:setDefaultValue("#000000");
    obj.dataLink33:setName("dataLink33");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout73);
    obj.label129:setLeft(0);
    obj.label129:setTop(85);
    obj.label129:setWidth(90);
    obj.label129:setHeight(20);
    obj.label129:setText("Linhas ");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout73);
    obj.comboBox6:setLeft(95);
    obj.comboBox6:setTop(85);
    obj.comboBox6:setWidth(90);
    obj.comboBox6:setField("colorStroke");
    obj.comboBox6:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox6:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout73);
    obj.dataLink34:setField("colorStroke");
    obj.dataLink34:setDefaultValue("#FFFFFF");
    obj.dataLink34:setName("dataLink34");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout73);
    obj.label130:setLeft(0);
    obj.label130:setTop(110);
    obj.label130:setWidth(90);
    obj.label130:setHeight(20);
    obj.label130:setText("Fonte ");
    obj.label130:setHorzTextAlign("center");
    obj.label130:setName("label130");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout73);
    obj.comboBox7:setLeft(95);
    obj.comboBox7:setTop(110);
    obj.comboBox7:setWidth(90);
    obj.comboBox7:setField("colorFont");
    obj.comboBox7:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox7:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout73);
    obj.dataLink35:setField("colorFont");
    obj.dataLink35:setDefaultValue("#FFFFFF");
    obj.dataLink35:setName("dataLink35");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.scrollBox6);
    obj.label131:setLeft(555);
    obj.label131:setTop(275);
    obj.label131:setWidth(200);
    obj.label131:setHeight(20);
    obj.label131:setText("Versão Atual: ");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setField("versionInstalled");
    obj.label131:setName("label131");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.scrollBox6);
    obj.label132:setLeft(555);
    obj.label132:setTop(300);
    obj.label132:setWidth(200);
    obj.label132:setHeight(20);
    obj.label132:setText("Sua Versão: ");
    obj.label132:setHorzTextAlign("center");
    obj.label132:setField("versionDownloaded");
    obj.label132:setName("label132");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox6);
    obj.checkBox1:setLeft(555);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox6);
    obj.button6:setLeft(555);
    obj.button6:setTop(350);
    obj.button6:setWidth(100);
    obj.button6:setText("Change Log");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox6);
    obj.button7:setLeft(667);
    obj.button7:setTop(350);
    obj.button7:setWidth(100);
    obj.button7:setText("Atualizar");
    obj.button7:setName("button7");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.scrollBox6);
    obj.label133:setLeft(555);
    obj.label133:setTop(400);
    obj.label133:setWidth(200);
    obj.label133:setHeight(20);
    obj.label133:setText("Conheça as Mesas:");
    obj.label133:setName("label133");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox6);
    obj.button8:setLeft(555);
    obj.button8:setTop(425);
    obj.button8:setWidth(100);
    obj.button8:setText("RPGmeister");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox6);
    obj.button9:setLeft(555);
    obj.button9:setTop(475);
    obj.button9:setWidth(100);
    obj.button9:setHeight(20);
    obj.button9:setText("Exportar Ficha");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox6);
    obj.button10:setLeft(660);
    obj.button10:setTop(475);
    obj.button10:setWidth(100);
    obj.button10:setHeight(20);
    obj.button10:setText("Importar Ficha");
    obj.button10:setName("button10");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Mutantes%20e%20Malfeitores%203e/output/Ficha%20Mutantes%20e%20Malfeitores%203e.rpk?raw=true",
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
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Mutantes%20e%20Malfeitores%203e/output/Ficha%20Mutantes%20e%20Malfeitores%203e.rpk?raw=true');
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

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.forcaBase) or 0) + (tonumber(sheet.forcaBonus) or 0)
            
            				sheet.forcaTotal = total
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].forca = sheet.forcaTotal;
            	            end
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.agilidadeBase) or 0) + (tonumber(sheet.agilidadeBonus) or 0)
            
            				sheet.agilidadeTotal = total
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].agilidade = sheet.agilidadeTotal;
            	            end
        end, obj);

    obj._e_event5 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.lutaBase) or 0) + (tonumber(sheet.lutaBonus) or 0)
            
            				sheet.lutaTotal = total
        end, obj);

    obj._e_event6 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].luta = sheet.lutaTotal;
            	            end
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.prontidaoBase) or 0) + (tonumber(sheet.prontidaoBonus) or 0)
            
            				sheet.prontidaoTotal = total
        end, obj);

    obj._e_event8 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].prontidao = sheet.prontidaoTotal;
            	            end
        end, obj);

    obj._e_event9 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.vigorBase) or 0) + (tonumber(sheet.vigorBonus) or 0)
            
            				sheet.vigorTotal = total
        end, obj);

    obj._e_event10 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].vigor = sheet.vigorTotal;
            	            end
        end, obj);

    obj._e_event11 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.destrezaBase) or 0) + (tonumber(sheet.destrezaBonus) or 0)
            
            				sheet.destrezaTotal = total
        end, obj);

    obj._e_event12 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].destreza = sheet.destrezaTotal;
            	            end
        end, obj);

    obj._e_event13 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.intelectoBase) or 0) + (tonumber(sheet.intelectoBonus) or 0)
            
            				sheet.intelectoTotal = total
        end, obj);

    obj._e_event14 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].intelecto = sheet.intelectoTotal;
            	            end
        end, obj);

    obj._e_event15 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.presencaBase) or 0) + (tonumber(sheet.presencaBonus) or 0)
            
            				sheet.presencaTotal = total
        end, obj);

    obj._e_event16 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].presenca = sheet.presencaTotal;
            	            end
        end, obj);

    obj._e_event17 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            						local total = 	(tonumber(sheet.forcaBase) or 0) + 
            										(tonumber(sheet.agilidadeBase) or 0) + 
            										(tonumber(sheet.lutaBase) or 0) +
            										(tonumber(sheet.prontidaoBase) or 0) + 
            										(tonumber(sheet.vigorBase) or 0) +
            										(tonumber(sheet.destrezaBase) or 0) +
            										(tonumber(sheet.intelectoBase) or 0) + 
            										(tonumber(sheet.presencaBase) or 0);
            
            						sheet.ppAtributo = total * 2
        end, obj);

    obj._e_event18 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.esquivaBase) or 0) + (tonumber(sheet.esquivaBonus) or 0) + (tonumber(sheet.agilidadeTotal) or 0)
            
            				sheet.esquivaTotal = total
        end, obj);

    obj._e_event19 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.apararBase) or 0) + (tonumber(sheet.apararBonus) or 0) + (tonumber(sheet.lutaTotal) or 0)
            
            				sheet.apararTotal = total
        end, obj);

    obj._e_event20 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.fortitudeBase) or 0) + (tonumber(sheet.fortitudeBonus) or 0) + (tonumber(sheet.vigorTotal) or 0)
            
            				sheet.fortitudeTotal = total
        end, obj);

    obj._e_event21 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.resistenciaBase) or 0) + (tonumber(sheet.resistenciaBonus) or 0) + (tonumber(sheet.vigorTotal) or 0)
            
            				sheet.resistenciaTotal = total
        end, obj);

    obj._e_event22 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.vontadeBase) or 0) + (tonumber(sheet.vontadeBonus) or 0) + (tonumber(sheet.prontidaoTotal) or 0)
            
            				sheet.vontadeTotal = total
        end, obj);

    obj._e_event23 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.esquivaTotal) or 0) + (tonumber(sheet.resistenciaTotal) or 0)
            
            				sheet.dfERTotal = total
        end, obj);

    obj._e_event24 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.np) or 0) * 2
            
            				sheet.npMax = total
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].np = sheet.np;
            	            end
        end, obj);

    obj._e_event25 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.apararTotal) or 0) + (tonumber(sheet.resistenciaTotal) or 0)
            
            				sheet.dfARTotal = total
        end, obj);

    obj._e_event26 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.np) or 0) * 2
            
            				sheet.npMax = total
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].np = sheet.np;
            	            end
        end, obj);

    obj._e_event27 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.fortitudeTotal) or 0) + (tonumber(sheet.vontadeTotal) or 0)
            
            				sheet.dfFVTotal = total
        end, obj);

    obj._e_event28 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.np) or 0) * 2
            
            				sheet.npMax = total
            
            				local nodes = NDB.getChildNodes(sheet.rclPericias); 
            	            for i=1, #nodes, 1 do
            	                nodes[i].np = sheet.np;
            	            end
        end, obj);

    obj._e_event29 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            						local total = 	(tonumber(sheet.esquivaBase) or 0) + 
            										(tonumber(sheet.apararBase) or 0) + 
            										(tonumber(sheet.fortitudeBase) or 0) + 
            										(tonumber(sheet.resistenciaBase) or 0) + 
            										(tonumber(sheet.vontadeBase) or 0);
            
            						sheet.ppDefesas = total
        end, obj);

    obj._e_event30 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            				local total = (tonumber(sheet.iniciativaBonus) or 0) + (tonumber(sheet.agilidadeTotal) or 0)
            
            				sheet.iniciativaTotal = total
        end, obj);

    obj._e_event31 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            
            						local total = 	(tonumber(sheet.ppAtributo) or 0) + 
            										(tonumber(sheet.ppPoderes) or 0) + 
            										(tonumber(sheet.ppVantagens) or 0) + 
            										(tonumber(sheet.ppPericias) or 0) + 
            										(tonumber(sheet.ppDefesas) or 0);
            
            						sheet.ppGasto = total
        end, obj);

    obj._e_event32 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event33 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclAtaques:append()
        end, obj);

    obj._e_event34 = obj.button2:addEventListener("onClick",
        function (_)
            local item = self.rclPericias:append()
            
            							if item ~= nil then
            								item.np = sheet.np
            								item.forca = sheet.forcaTotal
            								item.agilidade = sheet.agilidadeTotal
            								item.luta = sheet.lutaTotal
            								item.prontidao = sheet.prontidaoTotal
            								item.vigor = sheet.vigorTotal
            								item.destreza = sheet.destrezaTotal
            								item.intelecto = sheet.intelectoTotal
            								item.presenca = sheet.presencaTotal
            							end
        end, obj);

    obj._e_event35 = obj.button3:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Vai apagar todas perícias atuais.",
            						        function (confirmado)
            						                if confirmado then
            						                	if sheet.rclPericias == nil then sheet.rclPericias = {} end
            						                    local db = NDB.load("defaultskills.xml");
            											NDB.copy(sheet.rclPericias, db); 
            
            											self.rclPericias:sort();
            						                else
            						                        -- usuário escolheu CANCEL
            						                        -- Do nothing
            						                end;
            						        end);
        end, obj);

    obj._e_event36 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclPoderes:append()
        end, obj);

    obj._e_event37 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclVantagens:append()
        end, obj);

    obj._e_event38 = obj.dataLink32:addEventListener("onChange",
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

    obj._e_event39 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event40 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event41 = obj.dataLink35:addEventListener("onChange",
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

    obj._e_event42 = obj.button6:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/tree/master/Plugins/Sheets/Ficha%20Mutantes%20e%20Malfeitores%203e')
        end, obj);

    obj._e_event43 = obj.button7:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Mutantes%20e%20Malfeitores%203e/output/Ficha%20Mutantes%20e%20Malfeitores%203e.rpk?raw=true')
        end, obj);

    obj._e_event44 = obj.button8:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event45 = obj.button9:addEventListener("onClick",
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

    obj._e_event46 = obj.button10:addEventListener("onClick",
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
        if self.rclPoderes ~= nil then self.rclPoderes:destroy(); self.rclPoderes = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
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
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.popPoder ~= nil then self.popPoder:destroy(); self.popPoder = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.rclAtaques ~= nil then self.rclAtaques:destroy(); self.rclAtaques = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.frmEquipamentos ~= nil then self.frmEquipamentos:destroy(); self.frmEquipamentos = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.rclVantagens ~= nil then self.rclVantagens:destroy(); self.rclVantagens = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.frmPoderes ~= nil then self.frmPoderes:destroy(); self.frmPoderes = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.rclPericias ~= nil then self.rclPericias:destroy(); self.rclPericias = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMM3()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMM3();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMM3 = {
    newEditor = newfrmMM3, 
    new = newfrmMM3, 
    name = "frmMM3", 
    dataType = "Ambesek.Mutantes.Malfeitores.3e", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Mutantes e Malfeitores 3e", 
    description=""};

frmMM3 = _frmMM3;
Firecast.registrarForm(_frmMM3);
Firecast.registrarDataType(_frmMM3);

return _frmMM3;
