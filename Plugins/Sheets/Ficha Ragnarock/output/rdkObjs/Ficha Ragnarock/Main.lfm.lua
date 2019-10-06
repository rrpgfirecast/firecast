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
    obj:setDataType("Ambesek.Ragnarock");
    obj:setTitle("Ficha Ragnarok");
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

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(1200);
    obj.layout1:setHeight(570);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(50);
    obj.rectangle1:setMargins({bottom=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(150);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setText("Nome");
    obj.label1:setWidth(150);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTop(20);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(100);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setText("Classe");
    obj.label2:setWidth(100);
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setTop(20);
    obj.edit2:setField("classe");
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(100);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setText("Especialização");
    obj.label3:setWidth(100);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setTop(20);
    obj.edit3:setField("especializacao");
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle1);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(30);
    obj.layout5:setMargins({right=5});
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setText("Level");
    obj.label4:setWidth(30);
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setTop(20);
    obj.edit4:setField("level");
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(30);
    obj.layout6:setMargins({right=5});
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setText("Job");
    obj.label5:setWidth(30);
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setTop(20);
    obj.edit5:setField("job");
    obj.edit5:setWidth(30);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(100);
    obj.layout7:setMargins({right=5});
    obj.layout7:setName("layout7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setText("Zenny");
    obj.label6:setWidth(100);
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setTop(20);
    obj.edit6:setField("zenny");
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle1);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(150);
    obj.layout8:setMargins({right=5});
    obj.layout8:setName("layout8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setText("Personalidade");
    obj.label7:setWidth(150);
    obj.label7:setHorzTextAlign("leading");
    obj.label7:setFontSize(13);
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setTop(20);
    obj.edit7:setField("personalidade");
    obj.edit7:setWidth(150);
    obj.edit7:setHeight(25);
    obj.edit7:setName("edit7");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(100);
    obj.layout9:setMargins({right=5});
    obj.layout9:setName("layout9");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setText("Aparencia");
    obj.label8:setWidth(100);
    obj.label8:setHorzTextAlign("leading");
    obj.label8:setFontSize(13);
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setTop(20);
    obj.edit8:setField("aparencia");
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(25);
    obj.edit8:setName("edit8");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setHeight(305);
    obj.rectangle2:setMargins({bottom=5});
    obj.rectangle2:setName("rectangle2");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle2);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(220);
    obj.layout10:setMargins({right=5});
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setMargins({top=5});
    obj.layout11:setName("layout11");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout11);
    obj.button1:setText("Força");
    obj.button1:setAlign("left");
    obj.button1:setWidth(100);
    obj.button1:setHorzTextAlign("center");
    obj.button1:setName("button1");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout11);
    obj.edit9:setField("atr_FORBase");
    obj.edit9:setLeft(105);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(25);
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout11);
    obj.label9:setText("+");
    obj.label9:setLeft(135);
    obj.label9:setWidth(10);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setField("atr_FORExtra");
    obj.edit10:setLeft(145);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(25);
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout11);
    obj.label10:setText("=");
    obj.label10:setLeft(175);
    obj.label10:setWidth(10);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout11);
    obj.rectangle3:setLeft(185);
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout11);
    obj.label11:setField("atr_FORTotal");
    obj.label11:setLeft(185);
    obj.label11:setWidth(30);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout10);
    obj.dataLink1:setFields({'atr_FORBase','atr_FORExtra'});
    obj.dataLink1:setName("dataLink1");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout10);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setMargins({top=5});
    obj.layout12:setName("layout12");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout12);
    obj.button2:setText("Habilidade");
    obj.button2:setAlign("left");
    obj.button2:setWidth(100);
    obj.button2:setHorzTextAlign("center");
    obj.button2:setName("button2");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout12);
    obj.edit11:setField("atr_HABBase");
    obj.edit11:setLeft(105);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(25);
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout12);
    obj.label12:setText("+");
    obj.label12:setLeft(135);
    obj.label12:setWidth(10);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout12);
    obj.edit12:setField("atr_HABExtra");
    obj.edit12:setLeft(145);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout12);
    obj.label13:setText("=");
    obj.label13:setLeft(175);
    obj.label13:setWidth(10);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout12);
    obj.rectangle4:setLeft(185);
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout12);
    obj.label14:setField("atr_HABTotal");
    obj.label14:setLeft(185);
    obj.label14:setWidth(30);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout10);
    obj.dataLink2:setFields({'atr_HABBase','atr_HABExtra'});
    obj.dataLink2:setName("dataLink2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout10);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setMargins({top=5});
    obj.layout13:setName("layout13");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout13);
    obj.button3:setText("Agilidade");
    obj.button3:setAlign("left");
    obj.button3:setWidth(100);
    obj.button3:setHorzTextAlign("center");
    obj.button3:setName("button3");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setField("atr_AGIBase");
    obj.edit13:setLeft(105);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setName("edit13");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setText("+");
    obj.label15:setLeft(135);
    obj.label15:setWidth(10);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout13);
    obj.edit14:setField("atr_AGIExtra");
    obj.edit14:setLeft(145);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setName("edit14");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout13);
    obj.label16:setText("=");
    obj.label16:setLeft(175);
    obj.label16:setWidth(10);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout13);
    obj.rectangle5:setLeft(185);
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout13);
    obj.label17:setField("atr_AGITotal");
    obj.label17:setLeft(185);
    obj.label17:setWidth(30);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout10);
    obj.dataLink3:setFields({'atr_AGIBase','atr_AGIExtra'});
    obj.dataLink3:setName("dataLink3");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout10);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setMargins({top=5});
    obj.layout14:setName("layout14");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout14);
    obj.button4:setText("Vitalidade");
    obj.button4:setAlign("left");
    obj.button4:setWidth(100);
    obj.button4:setHorzTextAlign("center");
    obj.button4:setName("button4");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout14);
    obj.edit15:setField("atr_VITBase");
    obj.edit15:setLeft(105);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout14);
    obj.label18:setText("+");
    obj.label18:setLeft(135);
    obj.label18:setWidth(10);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setField("atr_VITExtra");
    obj.edit16:setLeft(145);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setType("number");
    obj.edit16:setName("edit16");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setText("=");
    obj.label19:setLeft(175);
    obj.label19:setWidth(10);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout14);
    obj.rectangle6:setLeft(185);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20:setField("atr_VITTotal");
    obj.label20:setLeft(185);
    obj.label20:setWidth(30);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout10);
    obj.dataLink4:setFields({'atr_VITBase','atr_VITExtra'});
    obj.dataLink4:setName("dataLink4");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout10);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setMargins({top=5});
    obj.layout15:setName("layout15");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout15);
    obj.button5:setText("Inteligência");
    obj.button5:setAlign("left");
    obj.button5:setWidth(100);
    obj.button5:setHorzTextAlign("center");
    obj.button5:setName("button5");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout15);
    obj.edit17:setField("atr_INTBase");
    obj.edit17:setLeft(105);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setType("number");
    obj.edit17:setName("edit17");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout15);
    obj.label21:setText("+");
    obj.label21:setLeft(135);
    obj.label21:setWidth(10);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setField("atr_INTExtra");
    obj.edit18:setLeft(145);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout15);
    obj.label22:setText("=");
    obj.label22:setLeft(175);
    obj.label22:setWidth(10);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout15);
    obj.rectangle7:setLeft(185);
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout15);
    obj.label23:setField("atr_INTTotal");
    obj.label23:setLeft(185);
    obj.label23:setWidth(30);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout10);
    obj.dataLink5:setFields({'atr_INTBase','atr_INTExtra'});
    obj.dataLink5:setName("dataLink5");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout10);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setMargins({top=5});
    obj.layout16:setName("layout16");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout16);
    obj.button6:setText("Destreza");
    obj.button6:setAlign("left");
    obj.button6:setWidth(100);
    obj.button6:setHorzTextAlign("center");
    obj.button6:setName("button6");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout16);
    obj.edit19:setField("atr_DESBase");
    obj.edit19:setLeft(105);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setType("number");
    obj.edit19:setName("edit19");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout16);
    obj.label24:setText("+");
    obj.label24:setLeft(135);
    obj.label24:setWidth(10);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setField("atr_DESExtra");
    obj.edit20:setLeft(145);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout16);
    obj.label25:setText("=");
    obj.label25:setLeft(175);
    obj.label25:setWidth(10);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout16);
    obj.rectangle8:setLeft(185);
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout16);
    obj.label26:setField("atr_DESTotal");
    obj.label26:setLeft(185);
    obj.label26:setWidth(30);
    obj.label26:setHeight(25);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout10);
    obj.dataLink6:setFields({'atr_DESBase','atr_DESExtra'});
    obj.dataLink6:setName("dataLink6");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout10);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setMargins({top=5});
    obj.layout17:setName("layout17");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout17);
    obj.button7:setText("Sorte");
    obj.button7:setAlign("left");
    obj.button7:setWidth(100);
    obj.button7:setHorzTextAlign("center");
    obj.button7:setName("button7");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout17);
    obj.edit21:setField("atr_SORBase");
    obj.edit21:setLeft(105);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setType("number");
    obj.edit21:setName("edit21");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout17);
    obj.label27:setText("+");
    obj.label27:setLeft(135);
    obj.label27:setWidth(10);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout17);
    obj.edit22:setField("atr_SORExtra");
    obj.edit22:setLeft(145);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout17);
    obj.label28:setText("=");
    obj.label28:setLeft(175);
    obj.label28:setWidth(10);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout17);
    obj.rectangle9:setLeft(185);
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout17);
    obj.label29:setField("atr_SORTotal");
    obj.label29:setLeft(185);
    obj.label29:setWidth(30);
    obj.label29:setHeight(25);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout10);
    obj.dataLink7:setFields({'atr_SORBase','atr_SORExtra'});
    obj.dataLink7:setName("dataLink7");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout10);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setMargins({top=5});
    obj.layout18:setName("layout18");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout18);
    obj.button8:setText("Magia");
    obj.button8:setAlign("left");
    obj.button8:setWidth(100);
    obj.button8:setHorzTextAlign("center");
    obj.button8:setName("button8");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout18);
    obj.edit23:setField("atr_MAGBase");
    obj.edit23:setLeft(105);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setType("number");
    obj.edit23:setName("edit23");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout18);
    obj.label30:setText("+");
    obj.label30:setLeft(135);
    obj.label30:setWidth(10);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout18);
    obj.edit24:setField("atr_MAGExtra");
    obj.edit24:setLeft(145);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setType("number");
    obj.edit24:setName("edit24");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout18);
    obj.label31:setText("=");
    obj.label31:setLeft(175);
    obj.label31:setWidth(10);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout18);
    obj.rectangle10:setLeft(185);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout18);
    obj.label32:setField("atr_MAGTotal");
    obj.label32:setLeft(185);
    obj.label32:setWidth(30);
    obj.label32:setHeight(25);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout10);
    obj.dataLink8:setFields({'atr_MAGBase','atr_MAGExtra'});
    obj.dataLink8:setName("dataLink8");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout10);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setMargins({top=5});
    obj.layout19:setName("layout19");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout19);
    obj.button9:setText("Defesa");
    obj.button9:setAlign("left");
    obj.button9:setWidth(100);
    obj.button9:setHorzTextAlign("center");
    obj.button9:setName("button9");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout19);
    obj.edit25:setField("atr_DEFBase");
    obj.edit25:setLeft(105);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setType("number");
    obj.edit25:setName("edit25");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout19);
    obj.label33:setText("+");
    obj.label33:setLeft(135);
    obj.label33:setWidth(10);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout19);
    obj.edit26:setField("atr_DEFExtra");
    obj.edit26:setLeft(145);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setType("number");
    obj.edit26:setName("edit26");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout19);
    obj.label34:setText("=");
    obj.label34:setLeft(175);
    obj.label34:setWidth(10);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout19);
    obj.rectangle11:setLeft(185);
    obj.rectangle11:setWidth(30);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout19);
    obj.label35:setField("atr_DEFTotal");
    obj.label35:setLeft(185);
    obj.label35:setWidth(30);
    obj.label35:setHeight(25);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout10);
    obj.dataLink9:setFields({'atr_DEFBase','atr_DEFExtra'});
    obj.dataLink9:setName("dataLink9");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout10);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setMargins({top=5});
    obj.layout20:setName("layout20");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout20);
    obj.button10:setText("Defesa Mágica");
    obj.button10:setAlign("left");
    obj.button10:setWidth(100);
    obj.button10:setHorzTextAlign("center");
    obj.button10:setName("button10");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout20);
    obj.edit27:setField("atr_M.DEFBase");
    obj.edit27:setLeft(105);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setType("number");
    obj.edit27:setName("edit27");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout20);
    obj.label36:setText("+");
    obj.label36:setLeft(135);
    obj.label36:setWidth(10);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout20);
    obj.edit28:setField("atr_M.DEFExtra");
    obj.edit28:setLeft(145);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setType("number");
    obj.edit28:setName("edit28");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout20);
    obj.label37:setText("=");
    obj.label37:setLeft(175);
    obj.label37:setWidth(10);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout20);
    obj.rectangle12:setLeft(185);
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout20);
    obj.label38:setField("atr_M.DEFTotal");
    obj.label38:setLeft(185);
    obj.label38:setWidth(30);
    obj.label38:setHeight(25);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout10);
    obj.dataLink10:setFields({'atr_M.DEFBase','atr_M.DEFExtra'});
    obj.dataLink10:setName("dataLink10");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle2);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(220);
    obj.layout21:setMargins({right=5});
    obj.layout21:setName("layout21");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout21);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setMargins({top=5});
    obj.layout22:setName("layout22");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout22);
    obj.button11:setText("Pulo");
    obj.button11:setAlign("left");
    obj.button11:setWidth(100);
    obj.button11:setHorzTextAlign("center");
    obj.button11:setName("button11");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout22);
    obj.edit29:setField("atr_PULBase");
    obj.edit29:setLeft(105);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setType("number");
    obj.edit29:setName("edit29");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout22);
    obj.label39:setText("+");
    obj.label39:setLeft(135);
    obj.label39:setWidth(10);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout22);
    obj.edit30:setField("atr_PULExtra");
    obj.edit30:setLeft(145);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setType("number");
    obj.edit30:setName("edit30");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout22);
    obj.label40:setText("=");
    obj.label40:setLeft(175);
    obj.label40:setWidth(10);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout22);
    obj.rectangle13:setLeft(185);
    obj.rectangle13:setWidth(30);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout22);
    obj.label41:setField("atr_PULTotal");
    obj.label41:setLeft(185);
    obj.label41:setWidth(30);
    obj.label41:setHeight(25);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout21);
    obj.dataLink11:setFields({'atr_PULBase','atr_PULExtra'});
    obj.dataLink11:setName("dataLink11");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout21);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setMargins({top=5});
    obj.layout23:setName("layout23");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout23);
    obj.button12:setText("Escalada");
    obj.button12:setAlign("left");
    obj.button12:setWidth(100);
    obj.button12:setHorzTextAlign("center");
    obj.button12:setName("button12");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout23);
    obj.edit31:setField("atr_ESCBase");
    obj.edit31:setLeft(105);
    obj.edit31:setWidth(30);
    obj.edit31:setHeight(25);
    obj.edit31:setType("number");
    obj.edit31:setName("edit31");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout23);
    obj.label42:setText("+");
    obj.label42:setLeft(135);
    obj.label42:setWidth(10);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout23);
    obj.edit32:setField("atr_ESCExtra");
    obj.edit32:setLeft(145);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setType("number");
    obj.edit32:setName("edit32");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout23);
    obj.label43:setText("=");
    obj.label43:setLeft(175);
    obj.label43:setWidth(10);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout23);
    obj.rectangle14:setLeft(185);
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout23);
    obj.label44:setField("atr_ESCTotal");
    obj.label44:setLeft(185);
    obj.label44:setWidth(30);
    obj.label44:setHeight(25);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout21);
    obj.dataLink12:setFields({'atr_ESCBase','atr_ESCExtra'});
    obj.dataLink12:setName("dataLink12");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout21);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setMargins({top=5});
    obj.layout24:setName("layout24");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout24);
    obj.button13:setText("Mira");
    obj.button13:setAlign("left");
    obj.button13:setWidth(100);
    obj.button13:setHorzTextAlign("center");
    obj.button13:setName("button13");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout24);
    obj.edit33:setField("atr_MIRBase");
    obj.edit33:setLeft(105);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(25);
    obj.edit33:setType("number");
    obj.edit33:setName("edit33");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout24);
    obj.label45:setText("+");
    obj.label45:setLeft(135);
    obj.label45:setWidth(10);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout24);
    obj.edit34:setField("atr_MIRExtra");
    obj.edit34:setLeft(145);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setType("number");
    obj.edit34:setName("edit34");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout24);
    obj.label46:setText("=");
    obj.label46:setLeft(175);
    obj.label46:setWidth(10);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout24);
    obj.rectangle15:setLeft(185);
    obj.rectangle15:setWidth(30);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout24);
    obj.label47:setField("atr_MIRTotal");
    obj.label47:setLeft(185);
    obj.label47:setWidth(30);
    obj.label47:setHeight(25);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout21);
    obj.dataLink13:setFields({'atr_MIRBase','atr_MIRExtra'});
    obj.dataLink13:setName("dataLink13");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout21);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setMargins({top=5});
    obj.layout25:setName("layout25");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout25);
    obj.button14:setText("Carisma");
    obj.button14:setAlign("left");
    obj.button14:setWidth(100);
    obj.button14:setHorzTextAlign("center");
    obj.button14:setName("button14");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout25);
    obj.edit35:setField("atr_CARBase");
    obj.edit35:setLeft(105);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(25);
    obj.edit35:setType("number");
    obj.edit35:setName("edit35");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout25);
    obj.label48:setText("+");
    obj.label48:setLeft(135);
    obj.label48:setWidth(10);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout25);
    obj.edit36:setField("atr_CARExtra");
    obj.edit36:setLeft(145);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setType("number");
    obj.edit36:setName("edit36");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout25);
    obj.label49:setText("=");
    obj.label49:setLeft(175);
    obj.label49:setWidth(10);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout25);
    obj.rectangle16:setLeft(185);
    obj.rectangle16:setWidth(30);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout25);
    obj.label50:setField("atr_CARTotal");
    obj.label50:setLeft(185);
    obj.label50:setWidth(30);
    obj.label50:setHeight(25);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout21);
    obj.dataLink14:setFields({'atr_CARBase','atr_CARExtra'});
    obj.dataLink14:setName("dataLink14");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout21);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setMargins({top=5});
    obj.layout26:setName("layout26");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout26);
    obj.button15:setText("Labia");
    obj.button15:setAlign("left");
    obj.button15:setWidth(100);
    obj.button15:setHorzTextAlign("center");
    obj.button15:setName("button15");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout26);
    obj.edit37:setField("atr_LABBase");
    obj.edit37:setLeft(105);
    obj.edit37:setWidth(30);
    obj.edit37:setHeight(25);
    obj.edit37:setType("number");
    obj.edit37:setName("edit37");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout26);
    obj.label51:setText("+");
    obj.label51:setLeft(135);
    obj.label51:setWidth(10);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout26);
    obj.edit38:setField("atr_LABExtra");
    obj.edit38:setLeft(145);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(25);
    obj.edit38:setType("number");
    obj.edit38:setName("edit38");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout26);
    obj.label52:setText("=");
    obj.label52:setLeft(175);
    obj.label52:setWidth(10);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout26);
    obj.rectangle17:setLeft(185);
    obj.rectangle17:setWidth(30);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout26);
    obj.label53:setField("atr_LABTotal");
    obj.label53:setLeft(185);
    obj.label53:setWidth(30);
    obj.label53:setHeight(25);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout21);
    obj.dataLink15:setFields({'atr_LABBase','atr_LABExtra'});
    obj.dataLink15:setName("dataLink15");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout21);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setMargins({top=5});
    obj.layout27:setName("layout27");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout27);
    obj.button16:setText("Decifrar");
    obj.button16:setAlign("left");
    obj.button16:setWidth(100);
    obj.button16:setHorzTextAlign("center");
    obj.button16:setName("button16");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout27);
    obj.edit39:setField("atr_DECBase");
    obj.edit39:setLeft(105);
    obj.edit39:setWidth(30);
    obj.edit39:setHeight(25);
    obj.edit39:setType("number");
    obj.edit39:setName("edit39");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout27);
    obj.label54:setText("+");
    obj.label54:setLeft(135);
    obj.label54:setWidth(10);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout27);
    obj.edit40:setField("atr_DECExtra");
    obj.edit40:setLeft(145);
    obj.edit40:setWidth(30);
    obj.edit40:setHeight(25);
    obj.edit40:setType("number");
    obj.edit40:setName("edit40");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout27);
    obj.label55:setText("=");
    obj.label55:setLeft(175);
    obj.label55:setWidth(10);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout27);
    obj.rectangle18:setLeft(185);
    obj.rectangle18:setWidth(30);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout27);
    obj.label56:setField("atr_DECTotal");
    obj.label56:setLeft(185);
    obj.label56:setWidth(30);
    obj.label56:setHeight(25);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout21);
    obj.dataLink16:setFields({'atr_DECBase','atr_DECExtra'});
    obj.dataLink16:setName("dataLink16");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout21);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setMargins({top=5});
    obj.layout28:setName("layout28");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout28);
    obj.button17:setText("Furtividade");
    obj.button17:setAlign("left");
    obj.button17:setWidth(100);
    obj.button17:setHorzTextAlign("center");
    obj.button17:setName("button17");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout28);
    obj.edit41:setField("atr_FURBase");
    obj.edit41:setLeft(105);
    obj.edit41:setWidth(30);
    obj.edit41:setHeight(25);
    obj.edit41:setType("number");
    obj.edit41:setName("edit41");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout28);
    obj.label57:setText("+");
    obj.label57:setLeft(135);
    obj.label57:setWidth(10);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout28);
    obj.edit42:setField("atr_FURExtra");
    obj.edit42:setLeft(145);
    obj.edit42:setWidth(30);
    obj.edit42:setHeight(25);
    obj.edit42:setType("number");
    obj.edit42:setName("edit42");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout28);
    obj.label58:setText("=");
    obj.label58:setLeft(175);
    obj.label58:setWidth(10);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout28);
    obj.rectangle19:setLeft(185);
    obj.rectangle19:setWidth(30);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout28);
    obj.label59:setField("atr_FURTotal");
    obj.label59:setLeft(185);
    obj.label59:setWidth(30);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout21);
    obj.dataLink17:setFields({'atr_FURBase','atr_FURExtra'});
    obj.dataLink17:setName("dataLink17");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout21);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setMargins({top=5});
    obj.layout29:setName("layout29");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout29);
    obj.button18:setText("Percepção");
    obj.button18:setAlign("left");
    obj.button18:setWidth(100);
    obj.button18:setHorzTextAlign("center");
    obj.button18:setName("button18");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout29);
    obj.edit43:setField("atr_PERBase");
    obj.edit43:setLeft(105);
    obj.edit43:setWidth(30);
    obj.edit43:setHeight(25);
    obj.edit43:setType("number");
    obj.edit43:setName("edit43");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout29);
    obj.label60:setText("+");
    obj.label60:setLeft(135);
    obj.label60:setWidth(10);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout29);
    obj.edit44:setField("atr_PERExtra");
    obj.edit44:setLeft(145);
    obj.edit44:setWidth(30);
    obj.edit44:setHeight(25);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout29);
    obj.label61:setText("=");
    obj.label61:setLeft(175);
    obj.label61:setWidth(10);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout29);
    obj.rectangle20:setLeft(185);
    obj.rectangle20:setWidth(30);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout29);
    obj.label62:setField("atr_PERTotal");
    obj.label62:setLeft(185);
    obj.label62:setWidth(30);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout21);
    obj.dataLink18:setFields({'atr_PERBase','atr_PERExtra'});
    obj.dataLink18:setName("dataLink18");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout21);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setMargins({top=5});
    obj.layout30:setName("layout30");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout30);
    obj.button19:setText("Conhecimento");
    obj.button19:setAlign("left");
    obj.button19:setWidth(100);
    obj.button19:setHorzTextAlign("center");
    obj.button19:setName("button19");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout30);
    obj.edit45:setField("atr_CNHBase");
    obj.edit45:setLeft(105);
    obj.edit45:setWidth(30);
    obj.edit45:setHeight(25);
    obj.edit45:setType("number");
    obj.edit45:setName("edit45");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout30);
    obj.label63:setText("+");
    obj.label63:setLeft(135);
    obj.label63:setWidth(10);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout30);
    obj.edit46:setField("atr_CNHExtra");
    obj.edit46:setLeft(145);
    obj.edit46:setWidth(30);
    obj.edit46:setHeight(25);
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout30);
    obj.label64:setText("=");
    obj.label64:setLeft(175);
    obj.label64:setWidth(10);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout30);
    obj.rectangle21:setLeft(185);
    obj.rectangle21:setWidth(30);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout30);
    obj.label65:setField("atr_CNHTotal");
    obj.label65:setLeft(185);
    obj.label65:setWidth(30);
    obj.label65:setHeight(25);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout21);
    obj.dataLink19:setFields({'atr_CNHBase','atr_CNHExtra'});
    obj.dataLink19:setName("dataLink19");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout21);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setMargins({top=5});
    obj.layout31:setName("layout31");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout31);
    obj.button20:setText("Ambidestria");
    obj.button20:setAlign("left");
    obj.button20:setWidth(100);
    obj.button20:setHorzTextAlign("center");
    obj.button20:setName("button20");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout31);
    obj.edit47:setField("atr_AMBBase");
    obj.edit47:setLeft(105);
    obj.edit47:setWidth(30);
    obj.edit47:setHeight(25);
    obj.edit47:setType("number");
    obj.edit47:setName("edit47");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout31);
    obj.label66:setText("+");
    obj.label66:setLeft(135);
    obj.label66:setWidth(10);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout31);
    obj.edit48:setField("atr_AMBExtra");
    obj.edit48:setLeft(145);
    obj.edit48:setWidth(30);
    obj.edit48:setHeight(25);
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout31);
    obj.label67:setText("=");
    obj.label67:setLeft(175);
    obj.label67:setWidth(10);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout31);
    obj.rectangle22:setLeft(185);
    obj.rectangle22:setWidth(30);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout31);
    obj.label68:setField("atr_AMBTotal");
    obj.label68:setLeft(185);
    obj.label68:setWidth(30);
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout21);
    obj.dataLink20:setFields({'atr_AMBBase','atr_AMBExtra'});
    obj.dataLink20:setName("dataLink20");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle2);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(270);
    obj.layout32:setMargins({right=5});
    obj.layout32:setName("layout32");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout32);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setMargins({bottom=5, top=5});
    obj.layout33:setName("layout33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(75);
    obj.layout34:setMargins({right=5});
    obj.layout34:setName("layout34");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout34);
    obj.label69:setText("HP");
    obj.label69:setWidth(20);
    obj.label69:setHorzTextAlign("leading");
    obj.label69:setName("label69");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout34);
    obj.edit49:setLeft(25);
    obj.edit49:setField("hp");
    obj.edit49:setWidth(50);
    obj.edit49:setHeight(25);
    obj.edit49:setName("edit49");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout33);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(75);
    obj.layout35:setMargins({right=5});
    obj.layout35:setName("layout35");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout35);
    obj.label70:setText("SP");
    obj.label70:setWidth(20);
    obj.label70:setHorzTextAlign("leading");
    obj.label70:setName("label70");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout35);
    obj.edit50:setLeft(25);
    obj.edit50:setField("sp");
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(25);
    obj.edit50:setName("edit50");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout32);
    obj.label71:setText("BÔNUS");
    obj.label71:setAlign("top");
    obj.label71:setHeight(25);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout32);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(50);
    obj.layout36:setMargins({bottom=5});
    obj.layout36:setName("layout36");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout36);
    obj.layout37:setAlign("left");
    obj.layout37:setWidth(50);
    obj.layout37:setMargins({right=5});
    obj.layout37:setName("layout37");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout37);
    obj.label72:setText("Esquiva");
    obj.label72:setWidth(50);
    obj.label72:setHorzTextAlign("leading");
    obj.label72:setFontSize(12);
    obj.label72:setName("label72");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout37);
    obj.edit51:setTop(20);
    obj.edit51:setField("bonus_esquiva");
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(25);
    obj.edit51:setName("edit51");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout36);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(45);
    obj.layout38:setMargins({right=5});
    obj.layout38:setName("layout38");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout38);
    obj.label73:setText("Força");
    obj.label73:setWidth(45);
    obj.label73:setHorzTextAlign("leading");
    obj.label73:setFontSize(12);
    obj.label73:setName("label73");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout38);
    obj.edit52:setTop(20);
    obj.edit52:setField("bonus_forca");
    obj.edit52:setWidth(45);
    obj.edit52:setHeight(25);
    obj.edit52:setName("edit52");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout36);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(50);
    obj.layout39:setMargins({right=5});
    obj.layout39:setName("layout39");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout39);
    obj.label74:setText("Destreza");
    obj.label74:setWidth(50);
    obj.label74:setHorzTextAlign("leading");
    obj.label74:setFontSize(11);
    obj.label74:setName("label74");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout39);
    obj.edit53:setTop(20);
    obj.edit53:setField("bonus_destreza");
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(25);
    obj.edit53:setName("edit53");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout36);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(45);
    obj.layout40:setMargins({right=5});
    obj.layout40:setName("layout40");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout40);
    obj.label75:setText("Dano");
    obj.label75:setWidth(45);
    obj.label75:setHorzTextAlign("leading");
    obj.label75:setFontSize(12);
    obj.label75:setName("label75");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout40);
    obj.edit54:setTop(20);
    obj.edit54:setField("bonus_dano");
    obj.edit54:setWidth(45);
    obj.edit54:setHeight(25);
    obj.edit54:setName("edit54");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout36);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(60);
    obj.layout41:setMargins({right=5});
    obj.layout41:setName("layout41");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout41);
    obj.label76:setText("Intensidade");
    obj.label76:setWidth(60);
    obj.label76:setHorzTextAlign("leading");
    obj.label76:setFontSize(11);
    obj.label76:setName("label76");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout41);
    obj.edit55:setTop(20);
    obj.edit55:setField("bonus_intensidade");
    obj.edit55:setWidth(60);
    obj.edit55:setHeight(25);
    obj.edit55:setName("edit55");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout32);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(150);
    obj.layout42:setMargins({bottom=5, top=5});
    obj.layout42:setName("layout42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setMargins({bottom=5});
    obj.layout43:setName("layout43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(220);
    obj.layout44:setMargins({right=5});
    obj.layout44:setName("layout44");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout44);
    obj.label77:setText("D. Corporal");
    obj.label77:setWidth(100);
    obj.label77:setHorzTextAlign("leading");
    obj.label77:setName("label77");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout44);
    obj.edit56:setLeft(105);
    obj.edit56:setField("def_corporal");
    obj.edit56:setWidth(100);
    obj.edit56:setHeight(25);
    obj.edit56:setName("edit56");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout42);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setMargins({bottom=5});
    obj.layout45:setName("layout45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(220);
    obj.layout46:setMargins({right=5});
    obj.layout46:setName("layout46");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout46);
    obj.label78:setText("D. Equipamento");
    obj.label78:setWidth(100);
    obj.label78:setHorzTextAlign("leading");
    obj.label78:setName("label78");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout46);
    obj.edit57:setLeft(105);
    obj.edit57:setField("def_equipamento");
    obj.edit57:setWidth(100);
    obj.edit57:setHeight(25);
    obj.edit57:setName("edit57");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout42);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(25);
    obj.layout47:setMargins({bottom=5});
    obj.layout47:setName("layout47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(220);
    obj.layout48:setMargins({right=5});
    obj.layout48:setName("layout48");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout48);
    obj.label79:setText("R. Intensidade");
    obj.label79:setWidth(100);
    obj.label79:setHorzTextAlign("leading");
    obj.label79:setName("label79");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout48);
    obj.edit58:setLeft(105);
    obj.edit58:setField("R_intensidade");
    obj.edit58:setWidth(100);
    obj.edit58:setHeight(25);
    obj.edit58:setName("edit58");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout42);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(25);
    obj.layout49:setMargins({bottom=10});
    obj.layout49:setName("layout49");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(220);
    obj.layout50:setMargins({right=5});
    obj.layout50:setName("layout50");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout50);
    obj.label80:setText("D.M.A.");
    obj.label80:setWidth(100);
    obj.label80:setHorzTextAlign("leading");
    obj.label80:setName("label80");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout50);
    obj.edit59:setLeft(105);
    obj.edit59:setField("dma");
    obj.edit59:setWidth(100);
    obj.edit59:setHeight(25);
    obj.edit59:setName("edit59");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout42);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(25);
    obj.layout51:setMargins({bottom=5});
    obj.layout51:setName("layout51");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout51);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(220);
    obj.layout52:setMargins({right=5});
    obj.layout52:setName("layout52");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout52);
    obj.label81:setText("D. Total");
    obj.label81:setWidth(100);
    obj.label81:setHorzTextAlign("leading");
    obj.label81:setName("label81");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout52);
    obj.edit60:setLeft(105);
    obj.edit60:setField("def_total");
    obj.edit60:setWidth(100);
    obj.edit60:setHeight(25);
    obj.edit60:setName("edit60");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle2);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(220);
    obj.layout53:setMargins({right=5, top=5});
    obj.layout53:setName("layout53");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout53);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(50);
    obj.layout54:setMargins({bottom=5});
    obj.layout54:setName("layout54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout54);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(100);
    obj.layout55:setMargins({right=5});
    obj.layout55:setName("layout55");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout55);
    obj.label82:setText("Velocidade");
    obj.label82:setWidth(100);
    obj.label82:setHorzTextAlign("leading");
    obj.label82:setFontSize(13);
    obj.label82:setName("label82");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout55);
    obj.edit61:setTop(20);
    obj.edit61:setField("velocidade");
    obj.edit61:setWidth(100);
    obj.edit61:setHeight(25);
    obj.edit61:setName("edit61");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout53);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(50);
    obj.layout56:setMargins({bottom=5});
    obj.layout56:setName("layout56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(150);
    obj.layout57:setMargins({right=5});
    obj.layout57:setName("layout57");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout57);
    obj.label83:setText("Experiência");
    obj.label83:setWidth(150);
    obj.label83:setHorzTextAlign("leading");
    obj.label83:setFontSize(13);
    obj.label83:setName("label83");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout57);
    obj.edit62:setTop(20);
    obj.edit62:setField("experiencia");
    obj.edit62:setWidth(150);
    obj.edit62:setHeight(25);
    obj.edit62:setName("edit62");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout56);
    obj.layout58:setAlign("left");
    obj.layout58:setWidth(50);
    obj.layout58:setMargins({right=5});
    obj.layout58:setName("layout58");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout58);
    obj.label84:setText("AP");
    obj.label84:setWidth(50);
    obj.label84:setHorzTextAlign("leading");
    obj.label84:setFontSize(13);
    obj.label84:setName("label84");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout58);
    obj.edit63:setTop(20);
    obj.edit63:setField("ap");
    obj.edit63:setWidth(50);
    obj.edit63:setHeight(25);
    obj.edit63:setName("edit63");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout53);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(150);
    obj.layout59:setMargins({bottom=5, top=5});
    obj.layout59:setName("layout59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout59);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(25);
    obj.layout60:setMargins({bottom=5});
    obj.layout60:setName("layout60");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(220);
    obj.layout61:setMargins({right=5});
    obj.layout61:setName("layout61");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout61);
    obj.label85:setText("Critico");
    obj.label85:setWidth(100);
    obj.label85:setHorzTextAlign("leading");
    obj.label85:setName("label85");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout61);
    obj.edit64:setLeft(105);
    obj.edit64:setField("critico");
    obj.edit64:setWidth(100);
    obj.edit64:setHeight(25);
    obj.edit64:setName("edit64");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout59);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(25);
    obj.layout62:setMargins({bottom=5});
    obj.layout62:setName("layout62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(220);
    obj.layout63:setMargins({right=5});
    obj.layout63:setName("layout63");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout63);
    obj.label86:setText("Esquiva Perfeita");
    obj.label86:setWidth(100);
    obj.label86:setHorzTextAlign("leading");
    obj.label86:setName("label86");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout63);
    obj.edit65:setLeft(105);
    obj.edit65:setField("esquiva_perfeita");
    obj.edit65:setWidth(100);
    obj.edit65:setHeight(25);
    obj.edit65:setName("edit65");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout59);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(25);
    obj.layout64:setMargins({bottom=5});
    obj.layout64:setName("layout64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout64);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(220);
    obj.layout65:setMargins({right=5});
    obj.layout65:setName("layout65");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout65);
    obj.label87:setText("Turnos de Magia");
    obj.label87:setWidth(100);
    obj.label87:setHorzTextAlign("leading");
    obj.label87:setName("label87");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout65);
    obj.edit66:setLeft(105);
    obj.edit66:setField("tunos_magia");
    obj.edit66:setWidth(100);
    obj.edit66:setHeight(25);
    obj.edit66:setName("edit66");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle2);
    obj.layout66:setAlign("left");
    obj.layout66:setWidth(220);
    obj.layout66:setMargins({right=5});
    obj.layout66:setName("layout66");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout66);
    obj.rectangle23:setLeft(0);
    obj.rectangle23:setTop(50);
    obj.rectangle23:setWidth(200);
    obj.rectangle23:setHeight(200);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.rectangle23);
    obj.label88:setLeft(0);
    obj.label88:setTop(40);
    obj.label88:setWidth(200);
    obj.label88:setHeight(20);
    obj.label88:setText("Avatar");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle23);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout1);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setAlign("top");
    obj.rectangle24:setHeight(200);
    obj.rectangle24:setMargins({bottom=5});
    obj.rectangle24:setName("rectangle24");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle24);
    obj.layout67:setAlign("left");
    obj.layout67:setWidth(500);
    obj.layout67:setMargins({right=5});
    obj.layout67:setName("layout67");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout67);
    obj.label89:setText("VANTAGENS");
    obj.label89:setAlign("top");
    obj.label89:setHeight(25);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout67);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setHeight(165);
    obj.textEditor1:setField("vantagens");
    obj.textEditor1:setName("textEditor1");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle24);
    obj.layout68:setAlign("left");
    obj.layout68:setWidth(500);
    obj.layout68:setMargins({right=5});
    obj.layout68:setName("layout68");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout68);
    obj.label90:setText("DESVANTAGENS");
    obj.label90:setAlign("top");
    obj.label90:setHeight(25);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout68);
    obj.textEditor2:setAlign("top");
    obj.textEditor2:setHeight(165);
    obj.textEditor2:setField("desvantagens");
    obj.textEditor2:setName("textEditor2");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle24);
    obj.image2:setLeft(1010);
    obj.image2:setTop(25);
    obj.image2:setWidth(190);
    obj.image2:setHeight(116);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Ficha Ragnarock/images/ragnarock.jpg");
    obj.image2:setName("image2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Equipamentos");
    obj.tab2:setName("tab2");

    obj.frmEquipamentos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmEquipamentos:setParent(obj.tab2);
    obj.frmEquipamentos:setName("frmEquipamentos");
    obj.frmEquipamentos:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmEquipamentos);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.scrollBox2);
    obj.layout69:setHeight(900);
    obj.layout69:setWidth(1255);
    obj.layout69:setMargins({right=0});
    obj.layout69:setName("layout69");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout69);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setAlign("top");
    obj.rectangle25:setHeight(175);
    obj.rectangle25:setMargins({bottom=5});
    obj.rectangle25:setName("rectangle25");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle25);
    obj.layout70:setAlign("left");
    obj.layout70:setWidth(400);
    obj.layout70:setMargins({right=25});
    obj.layout70:setName("layout70");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout70);
    obj.label91:setText("Cabeça Up");
    obj.label91:setAlign("top");
    obj.label91:setHeight(25);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout70);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(325);
    obj.layout71:setMargins({bottom=0});
    obj.layout71:setName("layout71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout71);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(50);
    obj.layout72:setMargins({bottom=0});
    obj.layout72:setName("layout72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout72);
    obj.layout73:setAlign("left");
    obj.layout73:setWidth(125);
    obj.layout73:setMargins({right=0});
    obj.layout73:setName("layout73");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout73);
    obj.label92:setText("Nome");
    obj.label92:setWidth(125);
    obj.label92:setHorzTextAlign("leading");
    obj.label92:setFontSize(13);
    obj.label92:setName("label92");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout73);
    obj.edit67:setTop(20);
    obj.edit67:setField("head1_nome");
    obj.edit67:setWidth(125);
    obj.edit67:setHeight(25);
    obj.edit67:setName("edit67");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout72);
    obj.layout74:setAlign("left");
    obj.layout74:setWidth(75);
    obj.layout74:setMargins({right=0});
    obj.layout74:setName("layout74");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout74);
    obj.label93:setText("Def");
    obj.label93:setWidth(75);
    obj.label93:setHorzTextAlign("leading");
    obj.label93:setFontSize(13);
    obj.label93:setName("label93");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout74);
    obj.edit68:setTop(20);
    obj.edit68:setField("head1_def");
    obj.edit68:setWidth(75);
    obj.edit68:setHeight(25);
    obj.edit68:setName("edit68");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout72);
    obj.layout75:setAlign("left");
    obj.layout75:setWidth(125);
    obj.layout75:setMargins({right=0});
    obj.layout75:setName("layout75");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout75);
    obj.label94:setText("Bônus");
    obj.label94:setWidth(125);
    obj.label94:setHorzTextAlign("leading");
    obj.label94:setFontSize(13);
    obj.label94:setName("label94");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout75);
    obj.edit69:setTop(20);
    obj.edit69:setField("head1_bonus");
    obj.edit69:setWidth(125);
    obj.edit69:setHeight(25);
    obj.edit69:setName("edit69");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout71);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("head1_desc");
    obj.textEditor3:setName("textEditor3");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout70);
    obj.layout76:setAlign("left");
    obj.layout76:setWidth(75);
    obj.layout76:setMargins({top=50});
    obj.layout76:setName("layout76");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout76);
    obj.rectangle26:setWidth(75);
    obj.rectangle26:setHeight(100);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle26);
    obj.image3:setWidth(75);
    obj.image3:setHeight(100);
    obj.image3:setField("head1_pic");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image3:setName("image3");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle25);
    obj.layout77:setAlign("left");
    obj.layout77:setWidth(400);
    obj.layout77:setMargins({right=25});
    obj.layout77:setName("layout77");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout77);
    obj.label95:setText("Cabeça Mid");
    obj.label95:setAlign("top");
    obj.label95:setHeight(25);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout77);
    obj.layout78:setAlign("left");
    obj.layout78:setWidth(325);
    obj.layout78:setMargins({bottom=0});
    obj.layout78:setName("layout78");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout78);
    obj.layout79:setAlign("top");
    obj.layout79:setHeight(50);
    obj.layout79:setMargins({bottom=0});
    obj.layout79:setName("layout79");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout79);
    obj.layout80:setAlign("left");
    obj.layout80:setWidth(125);
    obj.layout80:setMargins({right=0});
    obj.layout80:setName("layout80");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout80);
    obj.label96:setText("Nome");
    obj.label96:setWidth(125);
    obj.label96:setHorzTextAlign("leading");
    obj.label96:setFontSize(13);
    obj.label96:setName("label96");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout80);
    obj.edit70:setTop(20);
    obj.edit70:setField("head2_nome");
    obj.edit70:setWidth(125);
    obj.edit70:setHeight(25);
    obj.edit70:setName("edit70");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout79);
    obj.layout81:setAlign("left");
    obj.layout81:setWidth(75);
    obj.layout81:setMargins({right=0});
    obj.layout81:setName("layout81");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout81);
    obj.label97:setText("Def");
    obj.label97:setWidth(75);
    obj.label97:setHorzTextAlign("leading");
    obj.label97:setFontSize(13);
    obj.label97:setName("label97");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout81);
    obj.edit71:setTop(20);
    obj.edit71:setField("head2_def");
    obj.edit71:setWidth(75);
    obj.edit71:setHeight(25);
    obj.edit71:setName("edit71");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout79);
    obj.layout82:setAlign("left");
    obj.layout82:setWidth(125);
    obj.layout82:setMargins({right=0});
    obj.layout82:setName("layout82");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout82);
    obj.label98:setText("Bônus");
    obj.label98:setWidth(125);
    obj.label98:setHorzTextAlign("leading");
    obj.label98:setFontSize(13);
    obj.label98:setName("label98");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout82);
    obj.edit72:setTop(20);
    obj.edit72:setField("head2_bonus");
    obj.edit72:setWidth(125);
    obj.edit72:setHeight(25);
    obj.edit72:setName("edit72");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout78);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("head2_desc");
    obj.textEditor4:setName("textEditor4");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout77);
    obj.layout83:setAlign("left");
    obj.layout83:setWidth(75);
    obj.layout83:setMargins({top=50});
    obj.layout83:setName("layout83");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout83);
    obj.rectangle27:setWidth(75);
    obj.rectangle27:setHeight(100);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.rectangle27);
    obj.image4:setWidth(75);
    obj.image4:setHeight(100);
    obj.image4:setField("head2_pic");
    obj.image4:setEditable(true);
    obj.image4:setStyle("autoFit");
    obj.image4:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image4:setName("image4");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle25);
    obj.layout84:setAlign("left");
    obj.layout84:setWidth(400);
    obj.layout84:setMargins({right=25});
    obj.layout84:setName("layout84");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout84);
    obj.label99:setText("Cabeça Down");
    obj.label99:setAlign("top");
    obj.label99:setHeight(25);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout84);
    obj.layout85:setAlign("left");
    obj.layout85:setWidth(325);
    obj.layout85:setMargins({bottom=0});
    obj.layout85:setName("layout85");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.layout85);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(50);
    obj.layout86:setMargins({bottom=0});
    obj.layout86:setName("layout86");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout86);
    obj.layout87:setAlign("left");
    obj.layout87:setWidth(125);
    obj.layout87:setMargins({right=0});
    obj.layout87:setName("layout87");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout87);
    obj.label100:setText("Nome");
    obj.label100:setWidth(125);
    obj.label100:setHorzTextAlign("leading");
    obj.label100:setFontSize(13);
    obj.label100:setName("label100");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout87);
    obj.edit73:setTop(20);
    obj.edit73:setField("head3_nome");
    obj.edit73:setWidth(125);
    obj.edit73:setHeight(25);
    obj.edit73:setName("edit73");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout86);
    obj.layout88:setAlign("left");
    obj.layout88:setWidth(75);
    obj.layout88:setMargins({right=0});
    obj.layout88:setName("layout88");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout88);
    obj.label101:setText("Def");
    obj.label101:setWidth(75);
    obj.label101:setHorzTextAlign("leading");
    obj.label101:setFontSize(13);
    obj.label101:setName("label101");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout88);
    obj.edit74:setTop(20);
    obj.edit74:setField("head3_def");
    obj.edit74:setWidth(75);
    obj.edit74:setHeight(25);
    obj.edit74:setName("edit74");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout86);
    obj.layout89:setAlign("left");
    obj.layout89:setWidth(125);
    obj.layout89:setMargins({right=0});
    obj.layout89:setName("layout89");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout89);
    obj.label102:setText("Bônus");
    obj.label102:setWidth(125);
    obj.label102:setHorzTextAlign("leading");
    obj.label102:setFontSize(13);
    obj.label102:setName("label102");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout89);
    obj.edit75:setTop(20);
    obj.edit75:setField("head3_bonus");
    obj.edit75:setWidth(125);
    obj.edit75:setHeight(25);
    obj.edit75:setName("edit75");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout85);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("head3_desc");
    obj.textEditor5:setName("textEditor5");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.layout84);
    obj.layout90:setAlign("left");
    obj.layout90:setWidth(75);
    obj.layout90:setMargins({top=50});
    obj.layout90:setName("layout90");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout90);
    obj.rectangle28:setWidth(75);
    obj.rectangle28:setHeight(100);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle28);
    obj.image5:setWidth(75);
    obj.image5:setHeight(100);
    obj.image5:setField("head3_pic");
    obj.image5:setEditable(true);
    obj.image5:setStyle("autoFit");
    obj.image5:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image5:setName("image5");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout69);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setAlign("top");
    obj.rectangle29:setHeight(175);
    obj.rectangle29:setMargins({bottom=5});
    obj.rectangle29:setName("rectangle29");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle29);
    obj.layout91:setAlign("left");
    obj.layout91:setWidth(400);
    obj.layout91:setMargins({right=25});
    obj.layout91:setName("layout91");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout91);
    obj.label103:setText("Mão Esquerda");
    obj.label103:setAlign("top");
    obj.label103:setHeight(25);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout91);
    obj.layout92:setAlign("left");
    obj.layout92:setWidth(325);
    obj.layout92:setMargins({bottom=0});
    obj.layout92:setName("layout92");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout92);
    obj.layout93:setAlign("top");
    obj.layout93:setHeight(50);
    obj.layout93:setMargins({bottom=0});
    obj.layout93:setName("layout93");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout93);
    obj.layout94:setAlign("left");
    obj.layout94:setWidth(125);
    obj.layout94:setMargins({right=0});
    obj.layout94:setName("layout94");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout94);
    obj.label104:setText("Nome");
    obj.label104:setWidth(125);
    obj.label104:setHorzTextAlign("leading");
    obj.label104:setFontSize(13);
    obj.label104:setName("label104");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout94);
    obj.edit76:setTop(20);
    obj.edit76:setField("left_nome");
    obj.edit76:setWidth(125);
    obj.edit76:setHeight(25);
    obj.edit76:setName("edit76");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout93);
    obj.layout95:setAlign("left");
    obj.layout95:setWidth(75);
    obj.layout95:setMargins({right=0});
    obj.layout95:setName("layout95");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout95);
    obj.label105:setText("Dano/Def");
    obj.label105:setWidth(75);
    obj.label105:setHorzTextAlign("leading");
    obj.label105:setFontSize(13);
    obj.label105:setName("label105");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout95);
    obj.edit77:setTop(20);
    obj.edit77:setField("left_def");
    obj.edit77:setWidth(75);
    obj.edit77:setHeight(25);
    obj.edit77:setName("edit77");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout93);
    obj.layout96:setAlign("left");
    obj.layout96:setWidth(125);
    obj.layout96:setMargins({right=0});
    obj.layout96:setName("layout96");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout96);
    obj.label106:setText("Intensidade");
    obj.label106:setWidth(125);
    obj.label106:setHorzTextAlign("leading");
    obj.label106:setFontSize(13);
    obj.label106:setName("label106");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout96);
    obj.edit78:setTop(20);
    obj.edit78:setField("left_bonus");
    obj.edit78:setWidth(125);
    obj.edit78:setHeight(25);
    obj.edit78:setName("edit78");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout92);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("left_desc");
    obj.textEditor6:setName("textEditor6");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout91);
    obj.layout97:setAlign("left");
    obj.layout97:setWidth(75);
    obj.layout97:setMargins({top=50});
    obj.layout97:setName("layout97");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout97);
    obj.rectangle30:setWidth(75);
    obj.rectangle30:setHeight(100);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.rectangle30);
    obj.image6:setWidth(75);
    obj.image6:setHeight(100);
    obj.image6:setField("left_pic");
    obj.image6:setEditable(true);
    obj.image6:setStyle("autoFit");
    obj.image6:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image6:setName("image6");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle29);
    obj.layout98:setAlign("left");
    obj.layout98:setWidth(400);
    obj.layout98:setMargins({right=25});
    obj.layout98:setName("layout98");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout98);
    obj.label107:setText("Mão Direita");
    obj.label107:setAlign("top");
    obj.label107:setHeight(25);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.layout98);
    obj.layout99:setAlign("left");
    obj.layout99:setWidth(325);
    obj.layout99:setMargins({bottom=0});
    obj.layout99:setName("layout99");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.layout99);
    obj.layout100:setAlign("top");
    obj.layout100:setHeight(50);
    obj.layout100:setMargins({bottom=0});
    obj.layout100:setName("layout100");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.layout100);
    obj.layout101:setAlign("left");
    obj.layout101:setWidth(125);
    obj.layout101:setMargins({right=0});
    obj.layout101:setName("layout101");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout101);
    obj.label108:setText("Nome");
    obj.label108:setWidth(125);
    obj.label108:setHorzTextAlign("leading");
    obj.label108:setFontSize(13);
    obj.label108:setName("label108");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout101);
    obj.edit79:setTop(20);
    obj.edit79:setField("right_nome");
    obj.edit79:setWidth(125);
    obj.edit79:setHeight(25);
    obj.edit79:setName("edit79");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout100);
    obj.layout102:setAlign("left");
    obj.layout102:setWidth(75);
    obj.layout102:setMargins({right=0});
    obj.layout102:setName("layout102");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout102);
    obj.label109:setText("Dano/Def");
    obj.label109:setWidth(75);
    obj.label109:setHorzTextAlign("leading");
    obj.label109:setFontSize(13);
    obj.label109:setName("label109");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout102);
    obj.edit80:setTop(20);
    obj.edit80:setField("right_def");
    obj.edit80:setWidth(75);
    obj.edit80:setHeight(25);
    obj.edit80:setName("edit80");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout100);
    obj.layout103:setAlign("left");
    obj.layout103:setWidth(125);
    obj.layout103:setMargins({right=0});
    obj.layout103:setName("layout103");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout103);
    obj.label110:setText("Intensidade");
    obj.label110:setWidth(125);
    obj.label110:setHorzTextAlign("leading");
    obj.label110:setFontSize(13);
    obj.label110:setName("label110");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout103);
    obj.edit81:setTop(20);
    obj.edit81:setField("right_bonus");
    obj.edit81:setWidth(125);
    obj.edit81:setHeight(25);
    obj.edit81:setName("edit81");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout99);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("right_desc");
    obj.textEditor7:setName("textEditor7");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout98);
    obj.layout104:setAlign("left");
    obj.layout104:setWidth(75);
    obj.layout104:setMargins({top=50});
    obj.layout104:setName("layout104");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout104);
    obj.rectangle31:setWidth(75);
    obj.rectangle31:setHeight(100);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.rectangle31);
    obj.image7:setWidth(75);
    obj.image7:setHeight(100);
    obj.image7:setField("right_pic");
    obj.image7:setEditable(true);
    obj.image7:setStyle("autoFit");
    obj.image7:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image7:setName("image7");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.rectangle29);
    obj.layout105:setAlign("left");
    obj.layout105:setWidth(400);
    obj.layout105:setMargins({right=25});
    obj.layout105:setName("layout105");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout105);
    obj.label111:setText("Armadura");
    obj.label111:setAlign("top");
    obj.label111:setHeight(25);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout105);
    obj.layout106:setAlign("left");
    obj.layout106:setWidth(325);
    obj.layout106:setMargins({bottom=0});
    obj.layout106:setName("layout106");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.layout106);
    obj.layout107:setAlign("top");
    obj.layout107:setHeight(50);
    obj.layout107:setMargins({bottom=0});
    obj.layout107:setName("layout107");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout107);
    obj.layout108:setAlign("left");
    obj.layout108:setWidth(125);
    obj.layout108:setMargins({right=0});
    obj.layout108:setName("layout108");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout108);
    obj.label112:setText("Nome");
    obj.label112:setWidth(125);
    obj.label112:setHorzTextAlign("leading");
    obj.label112:setFontSize(13);
    obj.label112:setName("label112");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout108);
    obj.edit82:setTop(20);
    obj.edit82:setField("armor_nome");
    obj.edit82:setWidth(125);
    obj.edit82:setHeight(25);
    obj.edit82:setName("edit82");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout107);
    obj.layout109:setAlign("left");
    obj.layout109:setWidth(75);
    obj.layout109:setMargins({right=0});
    obj.layout109:setName("layout109");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout109);
    obj.label113:setText("Def");
    obj.label113:setWidth(75);
    obj.label113:setHorzTextAlign("leading");
    obj.label113:setFontSize(13);
    obj.label113:setName("label113");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout109);
    obj.edit83:setTop(20);
    obj.edit83:setField("armor_def");
    obj.edit83:setWidth(75);
    obj.edit83:setHeight(25);
    obj.edit83:setName("edit83");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout107);
    obj.layout110:setAlign("left");
    obj.layout110:setWidth(125);
    obj.layout110:setMargins({right=0});
    obj.layout110:setName("layout110");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout110);
    obj.label114:setText("Bônus");
    obj.label114:setWidth(125);
    obj.label114:setHorzTextAlign("leading");
    obj.label114:setFontSize(13);
    obj.label114:setName("label114");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout110);
    obj.edit84:setTop(20);
    obj.edit84:setField("armor_bonus");
    obj.edit84:setWidth(125);
    obj.edit84:setHeight(25);
    obj.edit84:setName("edit84");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout106);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("armor_desc");
    obj.textEditor8:setName("textEditor8");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout105);
    obj.layout111:setAlign("left");
    obj.layout111:setWidth(75);
    obj.layout111:setMargins({top=50});
    obj.layout111:setName("layout111");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout111);
    obj.rectangle32:setWidth(75);
    obj.rectangle32:setHeight(100);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.rectangle32);
    obj.image8:setWidth(75);
    obj.image8:setHeight(100);
    obj.image8:setField("armor_pic");
    obj.image8:setEditable(true);
    obj.image8:setStyle("autoFit");
    obj.image8:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image8:setName("image8");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout69);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setAlign("top");
    obj.rectangle33:setHeight(175);
    obj.rectangle33:setMargins({bottom=5});
    obj.rectangle33:setName("rectangle33");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.rectangle33);
    obj.layout112:setAlign("left");
    obj.layout112:setWidth(400);
    obj.layout112:setMargins({right=25});
    obj.layout112:setName("layout112");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout112);
    obj.label115:setText("Garmet");
    obj.label115:setAlign("top");
    obj.label115:setHeight(25);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout112);
    obj.layout113:setAlign("left");
    obj.layout113:setWidth(325);
    obj.layout113:setMargins({bottom=0});
    obj.layout113:setName("layout113");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout113);
    obj.layout114:setAlign("top");
    obj.layout114:setHeight(50);
    obj.layout114:setMargins({bottom=0});
    obj.layout114:setName("layout114");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout114);
    obj.layout115:setAlign("left");
    obj.layout115:setWidth(125);
    obj.layout115:setMargins({right=0});
    obj.layout115:setName("layout115");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout115);
    obj.label116:setText("Nome");
    obj.label116:setWidth(125);
    obj.label116:setHorzTextAlign("leading");
    obj.label116:setFontSize(13);
    obj.label116:setName("label116");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout115);
    obj.edit85:setTop(20);
    obj.edit85:setField("garmel_nome");
    obj.edit85:setWidth(125);
    obj.edit85:setHeight(25);
    obj.edit85:setName("edit85");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout114);
    obj.layout116:setAlign("left");
    obj.layout116:setWidth(75);
    obj.layout116:setMargins({right=0});
    obj.layout116:setName("layout116");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout116);
    obj.label117:setText("Def");
    obj.label117:setWidth(75);
    obj.label117:setHorzTextAlign("leading");
    obj.label117:setFontSize(13);
    obj.label117:setName("label117");

    obj.edit86 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout116);
    obj.edit86:setTop(20);
    obj.edit86:setField("garmel_def");
    obj.edit86:setWidth(75);
    obj.edit86:setHeight(25);
    obj.edit86:setName("edit86");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout114);
    obj.layout117:setAlign("left");
    obj.layout117:setWidth(125);
    obj.layout117:setMargins({right=0});
    obj.layout117:setName("layout117");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout117);
    obj.label118:setText("Bônus");
    obj.label118:setWidth(125);
    obj.label118:setHorzTextAlign("leading");
    obj.label118:setFontSize(13);
    obj.label118:setName("label118");

    obj.edit87 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout117);
    obj.edit87:setTop(20);
    obj.edit87:setField("garmel_bonus");
    obj.edit87:setWidth(125);
    obj.edit87:setHeight(25);
    obj.edit87:setName("edit87");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout113);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("garmel_desc");
    obj.textEditor9:setName("textEditor9");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout112);
    obj.layout118:setAlign("left");
    obj.layout118:setWidth(75);
    obj.layout118:setMargins({top=50});
    obj.layout118:setName("layout118");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout118);
    obj.rectangle34:setWidth(75);
    obj.rectangle34:setHeight(100);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.rectangle34);
    obj.image9:setWidth(75);
    obj.image9:setHeight(100);
    obj.image9:setField("garmel_pic");
    obj.image9:setEditable(true);
    obj.image9:setStyle("autoFit");
    obj.image9:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image9:setName("image9");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.rectangle33);
    obj.layout119:setAlign("left");
    obj.layout119:setWidth(400);
    obj.layout119:setMargins({right=25});
    obj.layout119:setName("layout119");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout119);
    obj.label119:setText("Bota");
    obj.label119:setAlign("top");
    obj.label119:setHeight(25);
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout119);
    obj.layout120:setAlign("left");
    obj.layout120:setWidth(325);
    obj.layout120:setMargins({bottom=0});
    obj.layout120:setName("layout120");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.layout120);
    obj.layout121:setAlign("top");
    obj.layout121:setHeight(50);
    obj.layout121:setMargins({bottom=0});
    obj.layout121:setName("layout121");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.layout121);
    obj.layout122:setAlign("left");
    obj.layout122:setWidth(125);
    obj.layout122:setMargins({right=0});
    obj.layout122:setName("layout122");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout122);
    obj.label120:setText("Nome");
    obj.label120:setWidth(125);
    obj.label120:setHorzTextAlign("leading");
    obj.label120:setFontSize(13);
    obj.label120:setName("label120");

    obj.edit88 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout122);
    obj.edit88:setTop(20);
    obj.edit88:setField("bota_nome");
    obj.edit88:setWidth(125);
    obj.edit88:setHeight(25);
    obj.edit88:setName("edit88");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.layout121);
    obj.layout123:setAlign("left");
    obj.layout123:setWidth(75);
    obj.layout123:setMargins({right=0});
    obj.layout123:setName("layout123");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout123);
    obj.label121:setText("Def");
    obj.label121:setWidth(75);
    obj.label121:setHorzTextAlign("leading");
    obj.label121:setFontSize(13);
    obj.label121:setName("label121");

    obj.edit89 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout123);
    obj.edit89:setTop(20);
    obj.edit89:setField("bota_def");
    obj.edit89:setWidth(75);
    obj.edit89:setHeight(25);
    obj.edit89:setName("edit89");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.layout121);
    obj.layout124:setAlign("left");
    obj.layout124:setWidth(125);
    obj.layout124:setMargins({right=0});
    obj.layout124:setName("layout124");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout124);
    obj.label122:setText("Bônus");
    obj.label122:setWidth(125);
    obj.label122:setHorzTextAlign("leading");
    obj.label122:setFontSize(13);
    obj.label122:setName("label122");

    obj.edit90 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout124);
    obj.edit90:setTop(20);
    obj.edit90:setField("bota_bonus");
    obj.edit90:setWidth(125);
    obj.edit90:setHeight(25);
    obj.edit90:setName("edit90");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout120);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setField("bota_desc");
    obj.textEditor10:setName("textEditor10");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.layout119);
    obj.layout125:setAlign("left");
    obj.layout125:setWidth(75);
    obj.layout125:setMargins({top=50});
    obj.layout125:setName("layout125");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout125);
    obj.rectangle35:setWidth(75);
    obj.rectangle35:setHeight(100);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.rectangle35);
    obj.image10:setWidth(75);
    obj.image10:setHeight(100);
    obj.image10:setField("bota_pic");
    obj.image10:setEditable(true);
    obj.image10:setStyle("autoFit");
    obj.image10:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image10:setName("image10");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.rectangle33);
    obj.layout126:setAlign("left");
    obj.layout126:setWidth(400);
    obj.layout126:setMargins({right=25});
    obj.layout126:setName("layout126");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout126);
    obj.label123:setText("Acessório");
    obj.label123:setAlign("top");
    obj.label123:setHeight(25);
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.layout127 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout127:setParent(obj.layout126);
    obj.layout127:setAlign("left");
    obj.layout127:setWidth(325);
    obj.layout127:setMargins({bottom=0});
    obj.layout127:setName("layout127");

    obj.layout128 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout128:setParent(obj.layout127);
    obj.layout128:setAlign("top");
    obj.layout128:setHeight(50);
    obj.layout128:setMargins({bottom=0});
    obj.layout128:setName("layout128");

    obj.layout129 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout129:setParent(obj.layout128);
    obj.layout129:setAlign("left");
    obj.layout129:setWidth(125);
    obj.layout129:setMargins({right=0});
    obj.layout129:setName("layout129");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout129);
    obj.label124:setText("Nome");
    obj.label124:setWidth(125);
    obj.label124:setHorzTextAlign("leading");
    obj.label124:setFontSize(13);
    obj.label124:setName("label124");

    obj.edit91 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout129);
    obj.edit91:setTop(20);
    obj.edit91:setField("acessorio1_nome");
    obj.edit91:setWidth(125);
    obj.edit91:setHeight(25);
    obj.edit91:setName("edit91");

    obj.layout130 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout130:setParent(obj.layout128);
    obj.layout130:setAlign("left");
    obj.layout130:setWidth(75);
    obj.layout130:setMargins({right=0});
    obj.layout130:setName("layout130");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout130);
    obj.label125:setText("Def");
    obj.label125:setWidth(75);
    obj.label125:setHorzTextAlign("leading");
    obj.label125:setFontSize(13);
    obj.label125:setName("label125");

    obj.edit92 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout130);
    obj.edit92:setTop(20);
    obj.edit92:setField("acessorio1_def");
    obj.edit92:setWidth(75);
    obj.edit92:setHeight(25);
    obj.edit92:setName("edit92");

    obj.layout131 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout131:setParent(obj.layout128);
    obj.layout131:setAlign("left");
    obj.layout131:setWidth(125);
    obj.layout131:setMargins({right=0});
    obj.layout131:setName("layout131");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout131);
    obj.label126:setText("Bônus");
    obj.label126:setWidth(125);
    obj.label126:setHorzTextAlign("leading");
    obj.label126:setFontSize(13);
    obj.label126:setName("label126");

    obj.edit93 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout131);
    obj.edit93:setTop(20);
    obj.edit93:setField("acessorio1_bonus");
    obj.edit93:setWidth(125);
    obj.edit93:setHeight(25);
    obj.edit93:setName("edit93");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout127);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("acessorio1_desc");
    obj.textEditor11:setName("textEditor11");

    obj.layout132 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout132:setParent(obj.layout126);
    obj.layout132:setAlign("left");
    obj.layout132:setWidth(75);
    obj.layout132:setMargins({top=50});
    obj.layout132:setName("layout132");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout132);
    obj.rectangle36:setWidth(75);
    obj.rectangle36:setHeight(100);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.rectangle36);
    obj.image11:setWidth(75);
    obj.image11:setHeight(100);
    obj.image11:setField("acessorio1_pic");
    obj.image11:setEditable(true);
    obj.image11:setStyle("autoFit");
    obj.image11:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image11:setName("image11");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout69);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setAlign("top");
    obj.rectangle37:setHeight(175);
    obj.rectangle37:setMargins({bottom=5});
    obj.rectangle37:setName("rectangle37");

    obj.layout133 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout133:setParent(obj.rectangle37);
    obj.layout133:setAlign("left");
    obj.layout133:setWidth(400);
    obj.layout133:setMargins({right=25});
    obj.layout133:setName("layout133");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout133);
    obj.label127:setText("Acessório");
    obj.label127:setAlign("top");
    obj.label127:setHeight(25);
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.layout134 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout134:setParent(obj.layout133);
    obj.layout134:setAlign("left");
    obj.layout134:setWidth(325);
    obj.layout134:setMargins({bottom=0});
    obj.layout134:setName("layout134");

    obj.layout135 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout135:setParent(obj.layout134);
    obj.layout135:setAlign("top");
    obj.layout135:setHeight(50);
    obj.layout135:setMargins({bottom=0});
    obj.layout135:setName("layout135");

    obj.layout136 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout136:setParent(obj.layout135);
    obj.layout136:setAlign("left");
    obj.layout136:setWidth(125);
    obj.layout136:setMargins({right=0});
    obj.layout136:setName("layout136");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout136);
    obj.label128:setText("Nome");
    obj.label128:setWidth(125);
    obj.label128:setHorzTextAlign("leading");
    obj.label128:setFontSize(13);
    obj.label128:setName("label128");

    obj.edit94 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout136);
    obj.edit94:setTop(20);
    obj.edit94:setField("acessorio2_nome");
    obj.edit94:setWidth(125);
    obj.edit94:setHeight(25);
    obj.edit94:setName("edit94");

    obj.layout137 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout137:setParent(obj.layout135);
    obj.layout137:setAlign("left");
    obj.layout137:setWidth(75);
    obj.layout137:setMargins({right=0});
    obj.layout137:setName("layout137");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout137);
    obj.label129:setText("Def");
    obj.label129:setWidth(75);
    obj.label129:setHorzTextAlign("leading");
    obj.label129:setFontSize(13);
    obj.label129:setName("label129");

    obj.edit95 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout137);
    obj.edit95:setTop(20);
    obj.edit95:setField("acessorio2_def");
    obj.edit95:setWidth(75);
    obj.edit95:setHeight(25);
    obj.edit95:setName("edit95");

    obj.layout138 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout138:setParent(obj.layout135);
    obj.layout138:setAlign("left");
    obj.layout138:setWidth(125);
    obj.layout138:setMargins({right=0});
    obj.layout138:setName("layout138");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout138);
    obj.label130:setText("Bônus");
    obj.label130:setWidth(125);
    obj.label130:setHorzTextAlign("leading");
    obj.label130:setFontSize(13);
    obj.label130:setName("label130");

    obj.edit96 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout138);
    obj.edit96:setTop(20);
    obj.edit96:setField("acessorio2_bonus");
    obj.edit96:setWidth(125);
    obj.edit96:setHeight(25);
    obj.edit96:setName("edit96");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout134);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("acessorio2_desc");
    obj.textEditor12:setName("textEditor12");

    obj.layout139 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout139:setParent(obj.layout133);
    obj.layout139:setAlign("left");
    obj.layout139:setWidth(75);
    obj.layout139:setMargins({top=50});
    obj.layout139:setName("layout139");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout139);
    obj.rectangle38:setWidth(75);
    obj.rectangle38:setHeight(100);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.rectangle38);
    obj.image12:setWidth(75);
    obj.image12:setHeight(100);
    obj.image12:setField("acessorio2_pic");
    obj.image12:setEditable(true);
    obj.image12:setStyle("autoFit");
    obj.image12:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image12:setName("image12");

    obj.layout140 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout140:setParent(obj.rectangle37);
    obj.layout140:setAlign("left");
    obj.layout140:setWidth(400);
    obj.layout140:setMargins({right=25});
    obj.layout140:setName("layout140");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout140);
    obj.label131:setText("Itens");
    obj.label131:setAlign("top");
    obj.label131:setHeight(25);
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout140);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setField("itens_desc");
    obj.textEditor13:setName("textEditor13");

    obj.layout141 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout141:setParent(obj.rectangle37);
    obj.layout141:setAlign("left");
    obj.layout141:setWidth(400);
    obj.layout141:setMargins({right=25});
    obj.layout141:setName("layout141");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout141);
    obj.label132:setText("Acessório");
    obj.label132:setAlign("top");
    obj.label132:setHeight(25);
    obj.label132:setHorzTextAlign("center");
    obj.label132:setName("label132");

    obj.layout142 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout142:setParent(obj.layout141);
    obj.layout142:setAlign("left");
    obj.layout142:setWidth(325);
    obj.layout142:setMargins({bottom=0});
    obj.layout142:setName("layout142");

    obj.layout143 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout143:setParent(obj.layout142);
    obj.layout143:setAlign("top");
    obj.layout143:setHeight(50);
    obj.layout143:setMargins({bottom=0});
    obj.layout143:setName("layout143");

    obj.layout144 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout144:setParent(obj.layout143);
    obj.layout144:setAlign("left");
    obj.layout144:setWidth(125);
    obj.layout144:setMargins({right=0});
    obj.layout144:setName("layout144");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout144);
    obj.label133:setText("Nome");
    obj.label133:setWidth(125);
    obj.label133:setHorzTextAlign("leading");
    obj.label133:setFontSize(13);
    obj.label133:setName("label133");

    obj.edit97 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout144);
    obj.edit97:setTop(20);
    obj.edit97:setField("acessorio3_nome");
    obj.edit97:setWidth(125);
    obj.edit97:setHeight(25);
    obj.edit97:setName("edit97");

    obj.layout145 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout145:setParent(obj.layout143);
    obj.layout145:setAlign("left");
    obj.layout145:setWidth(75);
    obj.layout145:setMargins({right=0});
    obj.layout145:setName("layout145");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout145);
    obj.label134:setText("Def");
    obj.label134:setWidth(75);
    obj.label134:setHorzTextAlign("leading");
    obj.label134:setFontSize(13);
    obj.label134:setName("label134");

    obj.edit98 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout145);
    obj.edit98:setTop(20);
    obj.edit98:setField("acessorio3_def");
    obj.edit98:setWidth(75);
    obj.edit98:setHeight(25);
    obj.edit98:setName("edit98");

    obj.layout146 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout146:setParent(obj.layout143);
    obj.layout146:setAlign("left");
    obj.layout146:setWidth(125);
    obj.layout146:setMargins({right=0});
    obj.layout146:setName("layout146");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout146);
    obj.label135:setText("Bônus");
    obj.label135:setWidth(125);
    obj.label135:setHorzTextAlign("leading");
    obj.label135:setFontSize(13);
    obj.label135:setName("label135");

    obj.edit99 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout146);
    obj.edit99:setTop(20);
    obj.edit99:setField("acessorio3_bonus");
    obj.edit99:setWidth(125);
    obj.edit99:setHeight(25);
    obj.edit99:setName("edit99");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout142);
    obj.textEditor14:setAlign("client");
    obj.textEditor14:setField("acessorio3_desc");
    obj.textEditor14:setName("textEditor14");

    obj.layout147 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout147:setParent(obj.layout141);
    obj.layout147:setAlign("left");
    obj.layout147:setWidth(75);
    obj.layout147:setMargins({top=50});
    obj.layout147:setName("layout147");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout147);
    obj.rectangle39:setWidth(75);
    obj.rectangle39:setHeight(100);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.rectangle39);
    obj.image13:setWidth(75);
    obj.image13:setHeight(100);
    obj.image13:setField("acessorio3_pic");
    obj.image13:setEditable(true);
    obj.image13:setStyle("autoFit");
    obj.image13:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image13:setName("image13");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout69);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setAlign("top");
    obj.rectangle40:setHeight(175);
    obj.rectangle40:setMargins({bottom=5});
    obj.rectangle40:setName("rectangle40");

    obj.layout148 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout148:setParent(obj.rectangle40);
    obj.layout148:setAlign("left");
    obj.layout148:setWidth(600);
    obj.layout148:setMargins({right=37.5});
    obj.layout148:setName("layout148");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout148);
    obj.label136:setText("Orbs");
    obj.label136:setAlign("top");
    obj.label136:setHeight(25);
    obj.label136:setHorzTextAlign("center");
    obj.label136:setName("label136");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout148);
    obj.textEditor15:setAlign("client");
    obj.textEditor15:setField("orbs_desc");
    obj.textEditor15:setName("textEditor15");

    obj.layout149 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout149:setParent(obj.rectangle40);
    obj.layout149:setAlign("left");
    obj.layout149:setWidth(600);
    obj.layout149:setMargins({right=37.5});
    obj.layout149:setName("layout149");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout149);
    obj.label137:setText("Clã");
    obj.label137:setAlign("top");
    obj.label137:setHeight(25);
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.layout149);
    obj.textEditor16:setAlign("client");
    obj.textEditor16:setField("cla_desc");
    obj.textEditor16:setName("textEditor16");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Magias e Habilidades");
    obj.tab3:setName("tab3");

    obj.frmDetailList = GUI.fromHandle(_obj_newObject("form"));
    obj.frmDetailList:setParent(obj.tab3);
    obj.frmDetailList:setName("frmDetailList");
    obj.frmDetailList:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmDetailList);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout150 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout150:setParent(obj.scrollBox3);
    obj.layout150:setHeight(660);
    obj.layout150:setWidth(1225);
    obj.layout150:setMargins({right=0});
    obj.layout150:setName("layout150");

    obj.layout151 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout151:setParent(obj.layout150);
    obj.layout151:setAlign("left");
    obj.layout151:setWidth(600);
    obj.layout151:setMargins({right=25});
    obj.layout151:setName("layout151");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout151);
    obj.rectangle41:setLeft(0);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(600);
    obj.rectangle41:setHeight(660);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setName("rectangle41");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout151);
    obj.button21:setLeft(0);
    obj.button21:setTop(0);
    obj.button21:setWidth(200);
    obj.button21:setHeight(25);
    obj.button21:setText("Ativa");
    obj.button21:setHint("Adicionar");
    obj.button21:setName("button21");

    obj.rclAtiva = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtiva:setParent(obj.layout151);
    obj.rclAtiva:setLeft(0);
    obj.rclAtiva:setTop(25);
    obj.rclAtiva:setWidth(600);
    obj.rclAtiva:setHeight(635);
    obj.rclAtiva:setName("rclAtiva");
    obj.rclAtiva:setField("listaAtivas");
    obj.rclAtiva:setTemplateForm("frmRecordListForm");
    obj.rclAtiva:setLayout("vertical");
    obj.rclAtiva:setSelectable(true);

    obj.layout152 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout152:setParent(obj.layout150);
    obj.layout152:setAlign("left");
    obj.layout152:setWidth(600);
    obj.layout152:setName("layout152");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout152);
    obj.rectangle42:setLeft(0);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(600);
    obj.rectangle42:setHeight(660);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout152);
    obj.button22:setLeft(0);
    obj.button22:setTop(0);
    obj.button22:setWidth(200);
    obj.button22:setHeight(25);
    obj.button22:setText("Passiva");
    obj.button22:setHint("Adicionar");
    obj.button22:setName("button22");

    obj.rclPassiva = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPassiva:setParent(obj.layout152);
    obj.rclPassiva:setLeft(0);
    obj.rclPassiva:setTop(25);
    obj.rclPassiva:setWidth(600);
    obj.rclPassiva:setHeight(635);
    obj.rclPassiva:setName("rclPassiva");
    obj.rclPassiva:setField("listaPassivas");
    obj.rclPassiva:setTemplateForm("frmRecordListForm");
    obj.rclPassiva:setLayout("vertical");
    obj.rclPassiva:setSelectable(true);

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Pets");
    obj.tab4:setName("tab4");

    obj.frmPet = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPet:setParent(obj.tab4);
    obj.frmPet:setName("frmPet");
    obj.frmPet:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmPet);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.scrollBox4);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setAlign("top");
    obj.rectangle43:setHeight(200);
    obj.rectangle43:setMargins({bottom=5});
    obj.rectangle43:setName("rectangle43");

    obj.layout153 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout153:setParent(obj.rectangle43);
    obj.layout153:setAlign("left");
    obj.layout153:setWidth(220);
    obj.layout153:setMargins({right=5});
    obj.layout153:setName("layout153");

    obj.layout154 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout154:setParent(obj.layout153);
    obj.layout154:setAlign("top");
    obj.layout154:setHeight(25);
    obj.layout154:setMargins({top=5});
    obj.layout154:setName("layout154");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout154);
    obj.button23:setText("Força");
    obj.button23:setAlign("left");
    obj.button23:setWidth(100);
    obj.button23:setHorzTextAlign("center");
    obj.button23:setName("button23");

    obj.edit100 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout154);
    obj.edit100:setField("atr_pet_FORBase");
    obj.edit100:setLeft(105);
    obj.edit100:setWidth(30);
    obj.edit100:setHeight(25);
    obj.edit100:setType("number");
    obj.edit100:setName("edit100");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout154);
    obj.label138:setText("+");
    obj.label138:setLeft(135);
    obj.label138:setWidth(10);
    obj.label138:setHorzTextAlign("center");
    obj.label138:setName("label138");

    obj.edit101 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout154);
    obj.edit101:setField("atr_pet_FORExtra");
    obj.edit101:setLeft(145);
    obj.edit101:setWidth(30);
    obj.edit101:setHeight(25);
    obj.edit101:setType("number");
    obj.edit101:setName("edit101");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout154);
    obj.label139:setText("=");
    obj.label139:setLeft(175);
    obj.label139:setWidth(10);
    obj.label139:setHorzTextAlign("center");
    obj.label139:setName("label139");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout154);
    obj.rectangle44:setLeft(185);
    obj.rectangle44:setWidth(30);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout154);
    obj.label140:setField("atr_pet_FORTotal");
    obj.label140:setLeft(185);
    obj.label140:setWidth(30);
    obj.label140:setHeight(25);
    obj.label140:setHorzTextAlign("center");
    obj.label140:setName("label140");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout153);
    obj.dataLink21:setFields({'atr_pet_FORBase','atr_pet_FORExtra'});
    obj.dataLink21:setName("dataLink21");

    obj.layout155 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout155:setParent(obj.layout153);
    obj.layout155:setAlign("top");
    obj.layout155:setHeight(25);
    obj.layout155:setMargins({top=5});
    obj.layout155:setName("layout155");

    obj.button24 = GUI.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout155);
    obj.button24:setText("Agilidade");
    obj.button24:setAlign("left");
    obj.button24:setWidth(100);
    obj.button24:setHorzTextAlign("center");
    obj.button24:setName("button24");

    obj.edit102 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout155);
    obj.edit102:setField("atr_pet_AGIBase");
    obj.edit102:setLeft(105);
    obj.edit102:setWidth(30);
    obj.edit102:setHeight(25);
    obj.edit102:setType("number");
    obj.edit102:setName("edit102");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout155);
    obj.label141:setText("+");
    obj.label141:setLeft(135);
    obj.label141:setWidth(10);
    obj.label141:setHorzTextAlign("center");
    obj.label141:setName("label141");

    obj.edit103 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout155);
    obj.edit103:setField("atr_pet_AGIExtra");
    obj.edit103:setLeft(145);
    obj.edit103:setWidth(30);
    obj.edit103:setHeight(25);
    obj.edit103:setType("number");
    obj.edit103:setName("edit103");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout155);
    obj.label142:setText("=");
    obj.label142:setLeft(175);
    obj.label142:setWidth(10);
    obj.label142:setHorzTextAlign("center");
    obj.label142:setName("label142");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout155);
    obj.rectangle45:setLeft(185);
    obj.rectangle45:setWidth(30);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout155);
    obj.label143:setField("atr_pet_AGITotal");
    obj.label143:setLeft(185);
    obj.label143:setWidth(30);
    obj.label143:setHeight(25);
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout153);
    obj.dataLink22:setFields({'atr_pet_AGIBase','atr_pet_AGIExtra'});
    obj.dataLink22:setName("dataLink22");

    obj.layout156 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout156:setParent(obj.layout153);
    obj.layout156:setAlign("top");
    obj.layout156:setHeight(25);
    obj.layout156:setMargins({top=5});
    obj.layout156:setName("layout156");

    obj.button25 = GUI.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout156);
    obj.button25:setText("Pulo");
    obj.button25:setAlign("left");
    obj.button25:setWidth(100);
    obj.button25:setHorzTextAlign("center");
    obj.button25:setName("button25");

    obj.edit104 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout156);
    obj.edit104:setField("atr_pet_PULBase");
    obj.edit104:setLeft(105);
    obj.edit104:setWidth(30);
    obj.edit104:setHeight(25);
    obj.edit104:setType("number");
    obj.edit104:setName("edit104");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout156);
    obj.label144:setText("+");
    obj.label144:setLeft(135);
    obj.label144:setWidth(10);
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.edit105 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout156);
    obj.edit105:setField("atr_pet_PULExtra");
    obj.edit105:setLeft(145);
    obj.edit105:setWidth(30);
    obj.edit105:setHeight(25);
    obj.edit105:setType("number");
    obj.edit105:setName("edit105");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout156);
    obj.label145:setText("=");
    obj.label145:setLeft(175);
    obj.label145:setWidth(10);
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout156);
    obj.rectangle46:setLeft(185);
    obj.rectangle46:setWidth(30);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout156);
    obj.label146:setField("atr_pet_PULTotal");
    obj.label146:setLeft(185);
    obj.label146:setWidth(30);
    obj.label146:setHeight(25);
    obj.label146:setHorzTextAlign("center");
    obj.label146:setName("label146");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout153);
    obj.dataLink23:setFields({'atr_pet_PULBase','atr_pet_PULExtra'});
    obj.dataLink23:setName("dataLink23");

    obj.layout157 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout157:setParent(obj.rectangle43);
    obj.layout157:setAlign("left");
    obj.layout157:setWidth(270);
    obj.layout157:setMargins({right=5});
    obj.layout157:setName("layout157");

    obj.layout158 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout158:setParent(obj.layout157);
    obj.layout158:setAlign("top");
    obj.layout158:setHeight(50);
    obj.layout158:setMargins({bottom=5, top=5});
    obj.layout158:setName("layout158");

    obj.layout159 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout159:setParent(obj.layout158);
    obj.layout159:setAlign("left");
    obj.layout159:setWidth(150);
    obj.layout159:setMargins({right=5});
    obj.layout159:setName("layout159");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout159);
    obj.label147:setText("Nome");
    obj.label147:setWidth(150);
    obj.label147:setHorzTextAlign("leading");
    obj.label147:setFontSize(13);
    obj.label147:setName("label147");

    obj.edit106 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout159);
    obj.edit106:setTop(20);
    obj.edit106:setField("pet_nome");
    obj.edit106:setWidth(150);
    obj.edit106:setHeight(25);
    obj.edit106:setName("edit106");

    obj.layout160 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout160:setParent(obj.layout158);
    obj.layout160:setAlign("left");
    obj.layout160:setWidth(50);
    obj.layout160:setMargins({right=5});
    obj.layout160:setName("layout160");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout160);
    obj.label148:setText("Level");
    obj.label148:setWidth(50);
    obj.label148:setHorzTextAlign("leading");
    obj.label148:setFontSize(13);
    obj.label148:setName("label148");

    obj.edit107 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout160);
    obj.edit107:setTop(20);
    obj.edit107:setField("pet_level");
    obj.edit107:setWidth(50);
    obj.edit107:setHeight(25);
    obj.edit107:setName("edit107");

    obj.layout161 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout161:setParent(obj.layout157);
    obj.layout161:setAlign("top");
    obj.layout161:setHeight(50);
    obj.layout161:setMargins({bottom=5, top=0});
    obj.layout161:setName("layout161");

    obj.layout162 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout162:setParent(obj.layout161);
    obj.layout162:setAlign("left");
    obj.layout162:setWidth(100);
    obj.layout162:setMargins({right=5});
    obj.layout162:setName("layout162");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout162);
    obj.label149:setText("Raça");
    obj.label149:setWidth(100);
    obj.label149:setHorzTextAlign("leading");
    obj.label149:setFontSize(13);
    obj.label149:setName("label149");

    obj.edit108 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout162);
    obj.edit108:setTop(20);
    obj.edit108:setField("pet_raca");
    obj.edit108:setWidth(100);
    obj.edit108:setHeight(25);
    obj.edit108:setName("edit108");

    obj.layout163 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout163:setParent(obj.layout161);
    obj.layout163:setAlign("left");
    obj.layout163:setWidth(100);
    obj.layout163:setMargins({right=5});
    obj.layout163:setName("layout163");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout163);
    obj.label150:setText("Aparencia");
    obj.label150:setWidth(100);
    obj.label150:setHorzTextAlign("leading");
    obj.label150:setFontSize(13);
    obj.label150:setName("label150");

    obj.edit109 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout163);
    obj.edit109:setTop(20);
    obj.edit109:setField("pet_aparencia");
    obj.edit109:setWidth(100);
    obj.edit109:setHeight(25);
    obj.edit109:setName("edit109");

    obj.layout164 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout164:setParent(obj.layout157);
    obj.layout164:setAlign("top");
    obj.layout164:setHeight(25);
    obj.layout164:setMargins({bottom=5, top=0});
    obj.layout164:setName("layout164");

    obj.layout165 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout165:setParent(obj.layout164);
    obj.layout165:setAlign("left");
    obj.layout165:setWidth(75);
    obj.layout165:setMargins({right=5});
    obj.layout165:setName("layout165");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout165);
    obj.label151:setText("HP");
    obj.label151:setWidth(20);
    obj.label151:setHorzTextAlign("leading");
    obj.label151:setName("label151");

    obj.edit110 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout165);
    obj.edit110:setLeft(25);
    obj.edit110:setField("pet_hp");
    obj.edit110:setWidth(50);
    obj.edit110:setHeight(25);
    obj.edit110:setName("edit110");

    obj.layout166 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout166:setParent(obj.layout164);
    obj.layout166:setAlign("left");
    obj.layout166:setWidth(75);
    obj.layout166:setMargins({right=5});
    obj.layout166:setName("layout166");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout166);
    obj.label152:setText("SP");
    obj.label152:setWidth(20);
    obj.label152:setHorzTextAlign("leading");
    obj.label152:setName("label152");

    obj.edit111 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout166);
    obj.edit111:setLeft(25);
    obj.edit111:setField("pet_sp");
    obj.edit111:setWidth(50);
    obj.edit111:setHeight(25);
    obj.edit111:setName("edit111");

    obj.layout167 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout167:setParent(obj.layout157);
    obj.layout167:setAlign("top");
    obj.layout167:setHeight(50);
    obj.layout167:setMargins({bottom=5});
    obj.layout167:setName("layout167");

    obj.layout168 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout168:setParent(obj.layout167);
    obj.layout168:setAlign("left");
    obj.layout168:setWidth(150);
    obj.layout168:setMargins({right=5});
    obj.layout168:setName("layout168");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout168);
    obj.label153:setText("Experiência");
    obj.label153:setWidth(150);
    obj.label153:setHorzTextAlign("leading");
    obj.label153:setFontSize(13);
    obj.label153:setName("label153");

    obj.edit112 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout168);
    obj.edit112:setTop(20);
    obj.edit112:setField("pet_experiencia");
    obj.edit112:setWidth(150);
    obj.edit112:setHeight(25);
    obj.edit112:setName("edit112");

    obj.layout169 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout169:setParent(obj.layout167);
    obj.layout169:setAlign("left");
    obj.layout169:setWidth(50);
    obj.layout169:setMargins({right=5});
    obj.layout169:setName("layout169");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout169);
    obj.label154:setText("AP");
    obj.label154:setWidth(50);
    obj.label154:setHorzTextAlign("leading");
    obj.label154:setFontSize(13);
    obj.label154:setName("label154");

    obj.edit113 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout169);
    obj.edit113:setTop(20);
    obj.edit113:setField("pet_ap");
    obj.edit113:setWidth(50);
    obj.edit113:setHeight(25);
    obj.edit113:setName("edit113");

    obj.layout170 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout170:setParent(obj.layout167);
    obj.layout170:setAlign("left");
    obj.layout170:setWidth(50);
    obj.layout170:setMargins({right=5});
    obj.layout170:setName("layout170");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout170);
    obj.label155:setText("React");
    obj.label155:setWidth(50);
    obj.label155:setHorzTextAlign("leading");
    obj.label155:setFontSize(13);
    obj.label155:setName("label155");

    obj.edit114 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout170);
    obj.edit114:setTop(20);
    obj.edit114:setField("pet_react");
    obj.edit114:setWidth(50);
    obj.edit114:setHeight(25);
    obj.edit114:setName("edit114");

    obj.layout171 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout171:setParent(obj.rectangle43);
    obj.layout171:setAlign("left");
    obj.layout171:setWidth(200);
    obj.layout171:setMargins({right=5});
    obj.layout171:setName("layout171");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout171);
    obj.rectangle47:setLeft(0);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(200);
    obj.rectangle47:setHeight(200);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.rectangle47);
    obj.image14:setAlign("client");
    obj.image14:setField("pet_avatar");
    obj.image14:setEditable(true);
    obj.image14:setStyle("autoFit");
    obj.image14:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image14:setName("image14");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.scrollBox4);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("pet_background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Background");
    obj.tab5:setName("tab5");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab5);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmTemplateDescription);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.scrollBox5);
    obj.richEdit2:setAlign("client");
    obj.richEdit2:setField("background");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit2, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setName("richEdit2");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Anotações");
    obj.tab6:setName("tab6");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab6);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmTemplateNotes);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout172 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout172:setParent(obj.scrollBox6);
    obj.layout172:setLeft(0);
    obj.layout172:setTop(0);
    obj.layout172:setWidth(400);
    obj.layout172:setHeight(580);
    obj.layout172:setName("layout172");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout172);
    obj.rectangle48:setLeft(0);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(400);
    obj.rectangle48:setHeight(580);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setXradius(5);
    obj.rectangle48:setYradius(15);
    obj.rectangle48:setCornerType("round");
    obj.rectangle48:setName("rectangle48");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout172);
    obj.label156:setLeft(0);
    obj.label156:setTop(0);
    obj.label156:setWidth(400);
    obj.label156:setHeight(20);
    obj.label156:setText("Anotações");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.layout172);
    obj.textEditor17:setLeft(10);
    obj.textEditor17:setTop(25);
    obj.textEditor17:setWidth(380);
    obj.textEditor17:setHeight(540);
    obj.textEditor17:setField("anotacoes1");
    obj.textEditor17:setName("textEditor17");

    obj.layout173 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout173:setParent(obj.scrollBox6);
    obj.layout173:setLeft(410);
    obj.layout173:setTop(0);
    obj.layout173:setWidth(400);
    obj.layout173:setHeight(580);
    obj.layout173:setName("layout173");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout173);
    obj.rectangle49:setLeft(0);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(400);
    obj.rectangle49:setHeight(580);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(15);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout173);
    obj.label157:setLeft(0);
    obj.label157:setTop(0);
    obj.label157:setWidth(400);
    obj.label157:setHeight(20);
    obj.label157:setText("Anotações");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout173);
    obj.textEditor18:setLeft(10);
    obj.textEditor18:setTop(25);
    obj.textEditor18:setWidth(380);
    obj.textEditor18:setHeight(540);
    obj.textEditor18:setField("anotacoes2");
    obj.textEditor18:setName("textEditor18");

    obj.layout174 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout174:setParent(obj.scrollBox6);
    obj.layout174:setLeft(820);
    obj.layout174:setTop(0);
    obj.layout174:setWidth(400);
    obj.layout174:setHeight(580);
    obj.layout174:setName("layout174");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout174);
    obj.rectangle50:setLeft(0);
    obj.rectangle50:setTop(0);
    obj.rectangle50:setWidth(400);
    obj.rectangle50:setHeight(580);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setXradius(5);
    obj.rectangle50:setYradius(15);
    obj.rectangle50:setCornerType("round");
    obj.rectangle50:setName("rectangle50");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout174);
    obj.label158:setLeft(0);
    obj.label158:setTop(0);
    obj.label158:setWidth(400);
    obj.label158:setHeight(20);
    obj.label158:setText("Anotações");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.textEditor19 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.layout174);
    obj.textEditor19:setLeft(10);
    obj.textEditor19:setTop(25);
    obj.textEditor19:setWidth(380);
    obj.textEditor19:setHeight(540);
    obj.textEditor19:setField("anotacoes3");
    obj.textEditor19:setName("textEditor19");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Creditos");
    obj.tab7:setName("tab7");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab7);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");


			local function recursiveFindControls(node, controlsList)
				local children = node:getChildren();
				for i=1, #children, 1 do
					controlsList[#controlsList+1] = children[i];
					recursiveFindControls(children[i], controlsList);
				end;
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

		


    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmTemplateCreditos);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.scrollBox7);
    obj.image15:setLeft(0);
    obj.image15:setTop(0);
    obj.image15:setWidth(484);
    obj.image15:setHeight(290);
    obj.image15:setStyle("autoFit");
    obj.image15:setSRC("/Ficha Ragnarock/images/ragnarok.jpg");
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.scrollBox7);
    obj.image16:setLeft(550);
    obj.image16:setTop(0);
    obj.image16:setWidth(250);
    obj.image16:setHeight(250);
    obj.image16:setStyle("autoFit");
    obj.image16:setSRC("/Ficha Ragnarock/images/RPGmeister.jpg");
    obj.image16:setName("image16");

    obj.layout175 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout175:setParent(obj.scrollBox7);
    obj.layout175:setLeft(850);
    obj.layout175:setTop(0);
    obj.layout175:setWidth(200);
    obj.layout175:setHeight(160);
    obj.layout175:setName("layout175");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout175);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setXradius(5);
    obj.rectangle51:setYradius(15);
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setName("rectangle51");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout175);
    obj.label159:setLeft(0);
    obj.label159:setTop(10);
    obj.label159:setWidth(200);
    obj.label159:setHeight(20);
    obj.label159:setText("Plugin feito por: ");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout175);
    obj.label160:setLeft(0);
    obj.label160:setTop(35);
    obj.label160:setWidth(200);
    obj.label160:setHeight(20);
    obj.label160:setText("Vinny (Ambesek)");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout175);
    obj.label161:setLeft(0);
    obj.label161:setTop(60);
    obj.label161:setWidth(200);
    obj.label161:setHeight(20);
    obj.label161:setText("Consultor: SlAyErXxX");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout175);
    obj.label162:setLeft(0);
    obj.label162:setTop(85);
    obj.label162:setWidth(200);
    obj.label162:setHeight(20);
    obj.label162:setText("Sistema: Silver");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.layout176 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout176:setParent(obj.scrollBox7);
    obj.layout176:setLeft(850);
    obj.layout176:setTop(200);
    obj.layout176:setWidth(200);
    obj.layout176:setHeight(150);
    obj.layout176:setName("layout176");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout176);
    obj.rectangle52:setLeft(0);
    obj.rectangle52:setTop(0);
    obj.rectangle52:setWidth(200);
    obj.rectangle52:setHeight(150);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.layout176);
    obj.label163:setLeft(0);
    obj.label163:setTop(10);
    obj.label163:setWidth(80);
    obj.label163:setHeight(20);
    obj.label163:setText("Tema:");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout176);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout176);
    obj.dataLink24:setField("theme");
    obj.dataLink24:setDefaultValue("Escuro");
    obj.dataLink24:setName("dataLink24");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.layout176);
    obj.label164:setLeft(0);
    obj.label164:setTop(35);
    obj.label164:setWidth(90);
    obj.label164:setHeight(20);
    obj.label164:setText("Cores: ");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout176);
    obj.label165:setLeft(0);
    obj.label165:setTop(60);
    obj.label165:setWidth(90);
    obj.label165:setHeight(20);
    obj.label165:setText("Fundo ");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout176);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout176);
    obj.dataLink25:setField("colorBackground");
    obj.dataLink25:setDefaultValue("#000000");
    obj.dataLink25:setName("dataLink25");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout176);
    obj.label166:setLeft(0);
    obj.label166:setTop(85);
    obj.label166:setWidth(90);
    obj.label166:setHeight(20);
    obj.label166:setText("Linhas ");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout176);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout176);
    obj.dataLink26:setField("colorStroke");
    obj.dataLink26:setDefaultValue("#FFFFFF");
    obj.dataLink26:setName("dataLink26");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout176);
    obj.label167:setLeft(0);
    obj.label167:setTop(110);
    obj.label167:setWidth(90);
    obj.label167:setHeight(20);
    obj.label167:setText("Fonte ");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout176);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout176);
    obj.dataLink27:setField("colorFont");
    obj.dataLink27:setDefaultValue("#FFFFFF");
    obj.dataLink27:setName("dataLink27");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.scrollBox7);
    obj.label168:setLeft(555);
    obj.label168:setTop(275);
    obj.label168:setWidth(200);
    obj.label168:setHeight(20);
    obj.label168:setText("Versão Atual: ");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setField("versionInstalled");
    obj.label168:setName("label168");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.scrollBox7);
    obj.label169:setLeft(555);
    obj.label169:setTop(300);
    obj.label169:setWidth(200);
    obj.label169:setHeight(20);
    obj.label169:setText("Sua Versão: ");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setField("versionDownloaded");
    obj.label169:setName("label169");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox7);
    obj.checkBox1:setLeft(555);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button26 = GUI.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.scrollBox7);
    obj.button26:setLeft(555);
    obj.button26:setTop(350);
    obj.button26:setWidth(100);
    obj.button26:setText("Change Log");
    obj.button26:setName("button26");

    obj.button27 = GUI.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.scrollBox7);
    obj.button27:setLeft(667);
    obj.button27:setTop(350);
    obj.button27:setWidth(100);
    obj.button27:setText("Atualizar");
    obj.button27:setName("button27");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.scrollBox7);
    obj.label170:setLeft(555);
    obj.label170:setTop(400);
    obj.label170:setWidth(200);
    obj.label170:setHeight(20);
    obj.label170:setText("Conheça as Mesas:");
    obj.label170:setName("label170");

    obj.button28 = GUI.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.scrollBox7);
    obj.button28:setLeft(555);
    obj.button28:setTop(425);
    obj.button28:setWidth(100);
    obj.button28:setText("RPGmeister");
    obj.button28:setName("button28");

    obj.button29 = GUI.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.scrollBox7);
    obj.button29:setLeft(667);
    obj.button29:setTop(425);
    obj.button29:setWidth(125);
    obj.button29:setText("Ragnarok");
    obj.button29:setName("button29");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Ragnarock/output/Ficha%20Ragnarock.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Ragnarock/output/Ficha%20Ragnarock.rpk?raw=true');
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
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_FORTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Força" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_FORTotal = 	(tonumber(sheet.atr_FORBase) or 0) + 
            											(tonumber(sheet.atr_FORExtra) or 0);
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_HABTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Habilidade" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_HABTotal = 	(tonumber(sheet.atr_HABBase) or 0) + 
            											(tonumber(sheet.atr_HABExtra) or 0);
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_AGITotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Agilidade" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event6 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_AGITotal = 	(tonumber(sheet.atr_AGIBase) or 0) + 
            											(tonumber(sheet.atr_AGIExtra) or 0);
        end, obj);

    obj._e_event7 = obj.button4:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_VITTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Vitalidade" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event8 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_VITTotal = 	(tonumber(sheet.atr_VITBase) or 0) + 
            											(tonumber(sheet.atr_VITExtra) or 0);
        end, obj);

    obj._e_event9 = obj.button5:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_INTTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Inteligência" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event10 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_INTTotal = 	(tonumber(sheet.atr_INTBase) or 0) + 
            											(tonumber(sheet.atr_INTExtra) or 0);
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_DESTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Destreza" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event12 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_DESTotal = 	(tonumber(sheet.atr_DESBase) or 0) + 
            											(tonumber(sheet.atr_DESExtra) or 0);
        end, obj);

    obj._e_event13 = obj.button7:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_SORTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Sorte" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event14 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_SORTotal = 	(tonumber(sheet.atr_SORBase) or 0) + 
            											(tonumber(sheet.atr_SORExtra) or 0);
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_MAGTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Magia" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event16 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_MAGTotal = 	(tonumber(sheet.atr_MAGBase) or 0) + 
            											(tonumber(sheet.atr_MAGExtra) or 0);
        end, obj);

    obj._e_event17 = obj.button9:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_DEFTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Defesa" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event18 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_DEFTotal = 	(tonumber(sheet.atr_DEFBase) or 0) + 
            											(tonumber(sheet.atr_DEFExtra) or 0);
        end, obj);

    obj._e_event19 = obj.button10:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_M.DEFTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Defesa Mágica" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event20 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_M.DEFTotal = 	(tonumber(sheet.atr_M.DEFBase) or 0) + 
            											(tonumber(sheet.atr_M.DEFExtra) or 0);
        end, obj);

    obj._e_event21 = obj.button11:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_PULTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Pulo" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event22 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_PULTotal = 	(tonumber(sheet.atr_PULBase) or 0) + 
            											(tonumber(sheet.atr_PULExtra) or 0);
        end, obj);

    obj._e_event23 = obj.button12:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_ESCTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Escalada" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event24 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_ESCTotal = 	(tonumber(sheet.atr_ESCBase) or 0) + 
            											(tonumber(sheet.atr_ESCExtra) or 0);
        end, obj);

    obj._e_event25 = obj.button13:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_MIRTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Mira" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event26 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_MIRTotal = 	(tonumber(sheet.atr_MIRBase) or 0) + 
            											(tonumber(sheet.atr_MIRExtra) or 0);
        end, obj);

    obj._e_event27 = obj.button14:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_CARTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Carisma" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event28 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_CARTotal = 	(tonumber(sheet.atr_CARBase) or 0) + 
            											(tonumber(sheet.atr_CARExtra) or 0);
        end, obj);

    obj._e_event29 = obj.button15:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_LABTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Labia" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event30 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_LABTotal = 	(tonumber(sheet.atr_LABBase) or 0) + 
            											(tonumber(sheet.atr_LABExtra) or 0);
        end, obj);

    obj._e_event31 = obj.button16:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_DECTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Decifrar" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event32 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_DECTotal = 	(tonumber(sheet.atr_DECBase) or 0) + 
            											(tonumber(sheet.atr_DECExtra) or 0);
        end, obj);

    obj._e_event33 = obj.button17:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_FURTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Furtividade" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event34 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_FURTotal = 	(tonumber(sheet.atr_FURBase) or 0) + 
            											(tonumber(sheet.atr_FURExtra) or 0);
        end, obj);

    obj._e_event35 = obj.button18:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_PERTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Percepção" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event36 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_PERTotal = 	(tonumber(sheet.atr_PERBase) or 0) + 
            											(tonumber(sheet.atr_PERExtra) or 0);
        end, obj);

    obj._e_event37 = obj.button19:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_CNHTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Conhecimento" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event38 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_CNHTotal = 	(tonumber(sheet.atr_CNHBase) or 0) + 
            											(tonumber(sheet.atr_CNHExtra) or 0);
        end, obj);

    obj._e_event39 = obj.button20:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_AMBTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Ambidestria" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event40 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_AMBTotal = 	(tonumber(sheet.atr_AMBBase) or 0) + 
            											(tonumber(sheet.atr_AMBExtra) or 0);
        end, obj);

    obj._e_event41 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event42 = obj.image3:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.head1_pic);
        end, obj);

    obj._e_event43 = obj.image4:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.head2_pic);
        end, obj);

    obj._e_event44 = obj.image5:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.head3_pic);
        end, obj);

    obj._e_event45 = obj.image6:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.left_pic);
        end, obj);

    obj._e_event46 = obj.image7:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.right_pic);
        end, obj);

    obj._e_event47 = obj.image8:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.armor_pic);
        end, obj);

    obj._e_event48 = obj.image9:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.garmel_pic);
        end, obj);

    obj._e_event49 = obj.image10:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.bota_pic);
        end, obj);

    obj._e_event50 = obj.image11:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.acessorio1_pic);
        end, obj);

    obj._e_event51 = obj.image12:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.acessorio2_pic);
        end, obj);

    obj._e_event52 = obj.image13:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.acessorio3_pic);
        end, obj);

    obj._e_event53 = obj.button21:addEventListener("onClick",
        function (_)
            self.rclAtiva:append();
        end, obj);

    obj._e_event54 = obj.rclAtiva:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event55 = obj.button22:addEventListener("onClick",
        function (_)
            self.rclPassiva:append();
        end, obj);

    obj._e_event56 = obj.rclPassiva:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event57 = obj.button23:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_pet_FORTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Força" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event58 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_pet_FORTotal = 	(tonumber(sheet.atr_pet_FORBase) or 0) + 
            											(tonumber(sheet.atr_pet_FORExtra) or 0);
        end, obj);

    obj._e_event59 = obj.button24:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_pet_AGITotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Agilidade" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event60 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_pet_AGITotal = 	(tonumber(sheet.atr_pet_AGIBase) or 0) + 
            											(tonumber(sheet.atr_pet_AGIExtra) or 0);
        end, obj);

    obj._e_event61 = obj.button25:addEventListener("onClick",
        function (_)
            local faceTable = {10, 10, 10, 10, 10, 10, 12, 12, 14, 14, 16, 16, 18, 18, 20, 20, 22, 22, 26, 26, 28, 28, 30, 30, 32, 32, 34, 34, 38, 38, 40, 40, 42, 42, 44, 44, 46, 46, 50, 50, 52, 52, 54, 54, 56, 56, 58, 58, 62, 62, 64, 64, 66, 66, 68, 68, 70, 70, 74, 74, 76, 76, 78, 78, 80, 80, 82, 82, 86, 86, 88, 88, 90, 90, 92, 92, 94, 94, 98, 98};
            
            					local atr = tonumber(sheet.atr_pet_PULTotal) or 0;
            					atr = math.min(80, atr);
            					atr = math.max(1, atr);
            
            					local faces = faceTable[atr];
            
            					local mesa = Firecast.getMesaDe(sheet);
            
            					local sucessos = 0;
            					local falhas = 0;
            					local decisivo = 0;
            					local falhaCritica = 0;
            
            					Dialogs.inputQuery("Quantidade de Dados", "Coloque quantos dados vai rolar", "1",
            				        function (valorPreenchido)
            				        	local dados = tonumber(valorPreenchido) or 1;
            				        	local rolagem = Firecast.interpretarRolagem("ord " .. dados .. "d" .. faces); 
            							
            							Dialogs.inputQuery("Margem de Critico", "Coloque o maior valor que deve ser considerado critico no dado. ", "1",
            				        		function (valorPreenchido)
            				        			local margem = tonumber(valorPreenchido) or 1;
            
            		                        	mesa.activeChat:rolarDados(rolagem, "Teste de Pulo" .. ", margem de critico " .. margem,
            		                                function (rolado)
            		                                	local op = rolado.ops[2];
             
            											for j=1, #op.resultados, 1 do
            											    local result = op.resultados[j];
            											    if result <= atr then
            											        sucessos = sucessos +1;
            											    else
            											        falhas = falhas +1;
            											    end;
            											    if result <= margem then
            											        decisivo = decisivo +1;
            											    end;
            											    if result == faces then
            											        falhaCritica = falhaCritica +1;
            											    end;
            											end;
            
            											local txt = sucessos .. " Sucesso(s) e " .. falhas .. " Falha(s)! ";
             
            											if decisivo > 0 then
            											    txt = txt .. decisivo .. " Sucesso(s) Critico(s). ";
            											end;
            											if falhaCritica > 0 then
            											    txt = txt .. falhaCritica .. " Falha(s) Critica(s). ";
            											end;
            
            											mesa.activeChat:enviarMensagem(txt);
            		                                end);
            
                                        end);   
            				        end);
        end, obj);

    obj._e_event62 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            				sheet.atr_pet_PULTotal = 	(tonumber(sheet.atr_pet_PULBase) or 0) + 
            											(tonumber(sheet.atr_pet_PULExtra) or 0);
        end, obj);

    obj._e_event63 = obj.image14:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.pet_avatar);
        end, obj);

    obj._e_event64 = obj.comboBox1:addEventListener("onChange",
        function (_)
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

    obj._e_event65 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event66 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event67 = obj.dataLink27:addEventListener("onChange",
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

    obj._e_event68 = obj.button26:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('link_change_log')
        end, obj);

    obj._e_event69 = obj.button27:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Ragnarock/output/Ficha%20Ragnarock.rpk?raw=true')
        end, obj);

    obj._e_event70 = obj.button28:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event71 = obj.button29:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=1063');
        end, obj);

    function obj:_releaseEvents()
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
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.rclAtiva ~= nil then self.rclAtiva:destroy(); self.rclAtiva = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.layout125 ~= nil then self.layout125:destroy(); self.layout125 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.layout140 ~= nil then self.layout140:destroy(); self.layout140 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.label161 ~= nil then self.label161:destroy(); self.label161 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label163 ~= nil then self.label163:destroy(); self.label163 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.layout141 ~= nil then self.layout141:destroy(); self.layout141 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.layout158 ~= nil then self.layout158:destroy(); self.layout158 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.layout174 ~= nil then self.layout174:destroy(); self.layout174 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.layout166 ~= nil then self.layout166:destroy(); self.layout166 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout176 ~= nil then self.layout176:destroy(); self.layout176 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.layout137 ~= nil then self.layout137:destroy(); self.layout137 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.layout132 ~= nil then self.layout132:destroy(); self.layout132 = nil; end;
        if self.layout145 ~= nil then self.layout145:destroy(); self.layout145 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.layout146 ~= nil then self.layout146:destroy(); self.layout146 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.layout136 ~= nil then self.layout136:destroy(); self.layout136 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout154 ~= nil then self.layout154:destroy(); self.layout154 = nil; end;
        if self.layout162 ~= nil then self.layout162:destroy(); self.layout162 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout135 ~= nil then self.layout135:destroy(); self.layout135 = nil; end;
        if self.layout152 ~= nil then self.layout152:destroy(); self.layout152 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout168 ~= nil then self.layout168:destroy(); self.layout168 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout148 ~= nil then self.layout148:destroy(); self.layout148 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.layout128 ~= nil then self.layout128:destroy(); self.layout128 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.layout130 ~= nil then self.layout130:destroy(); self.layout130 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout165 ~= nil then self.layout165:destroy(); self.layout165 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.layout164 ~= nil then self.layout164:destroy(); self.layout164 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.frmDetailList ~= nil then self.frmDetailList:destroy(); self.frmDetailList = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.layout170 ~= nil then self.layout170:destroy(); self.layout170 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.layout134 ~= nil then self.layout134:destroy(); self.layout134 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout156 ~= nil then self.layout156:destroy(); self.layout156 = nil; end;
        if self.rclPassiva ~= nil then self.rclPassiva:destroy(); self.rclPassiva = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.layout160 ~= nil then self.layout160:destroy(); self.layout160 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.layout171 ~= nil then self.layout171:destroy(); self.layout171 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout127 ~= nil then self.layout127:destroy(); self.layout127 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.layout169 ~= nil then self.layout169:destroy(); self.layout169 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout143 ~= nil then self.layout143:destroy(); self.layout143 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout172 ~= nil then self.layout172:destroy(); self.layout172 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.frmEquipamentos ~= nil then self.frmEquipamentos:destroy(); self.frmEquipamentos = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.layout167 ~= nil then self.layout167:destroy(); self.layout167 = nil; end;
        if self.layout147 ~= nil then self.layout147:destroy(); self.layout147 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout133 ~= nil then self.layout133:destroy(); self.layout133 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout173 ~= nil then self.layout173:destroy(); self.layout173 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout138 ~= nil then self.layout138:destroy(); self.layout138 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.layout151 ~= nil then self.layout151:destroy(); self.layout151 = nil; end;
        if self.frmPet ~= nil then self.frmPet:destroy(); self.frmPet = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout129 ~= nil then self.layout129:destroy(); self.layout129 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.layout153 ~= nil then self.layout153:destroy(); self.layout153 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout142 ~= nil then self.layout142:destroy(); self.layout142 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout149 ~= nil then self.layout149:destroy(); self.layout149 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout139 ~= nil then self.layout139:destroy(); self.layout139 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.layout150 ~= nil then self.layout150:destroy(); self.layout150 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.layout175 ~= nil then self.layout175:destroy(); self.layout175 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout144 ~= nil then self.layout144:destroy(); self.layout144 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.layout159 ~= nil then self.layout159:destroy(); self.layout159 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout161 ~= nil then self.layout161:destroy(); self.layout161 = nil; end;
        if self.layout131 ~= nil then self.layout131:destroy(); self.layout131 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.layout155 ~= nil then self.layout155:destroy(); self.layout155 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout157 ~= nil then self.layout157:destroy(); self.layout157 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout163 ~= nil then self.layout163:destroy(); self.layout163 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
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
    dataType = "Ambesek.Ragnarock", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Ragnarok", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);
Firecast.registrarDataType(_frmMain);

return _frmMain;
