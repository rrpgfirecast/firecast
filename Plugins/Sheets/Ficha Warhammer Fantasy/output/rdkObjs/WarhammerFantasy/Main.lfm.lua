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
    obj:setDataType("Ambesek.Warhammer.Fantasy");
    obj:setTitle("Ficha Warhammer Fantasy");
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
    obj.tab1:setTitle("Principal");
    obj.tab1:setName("tab1");

    obj.frmAvatar = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAvatar:setParent(obj.tab1);
    obj.frmAvatar:setName("frmAvatar");
    obj.frmAvatar:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmAvatar);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(80);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setWidth(805);
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(400);
    obj.layout3:setName("layout3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1:setAlign("left");
    obj.label1:setWidth(75);
    obj.label1:setText("Nome");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setAlign("client");
    obj.edit1:setField("name");
    obj.edit1:setName("edit1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(200);
    obj.layout4:setName("layout4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setAlign("left");
    obj.label2:setWidth(75);
    obj.label2:setText("Especie");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setAlign("client");
    obj.edit2:setField("species");
    obj.edit2:setName("edit2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(200);
    obj.layout5:setName("layout5");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout5);
    obj.label3:setAlign("left");
    obj.label3:setWidth(75);
    obj.label3:setText("Classe");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setAlign("client");
    obj.edit3:setField("job");
    obj.edit3:setName("edit3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(400);
    obj.layout7:setName("layout7");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setAlign("left");
    obj.label4:setWidth(75);
    obj.label4:setText("Carreira");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout7);
    obj.edit4:setAlign("client");
    obj.edit4:setField("career");
    obj.edit4:setName("edit4");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout6);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(400);
    obj.layout8:setName("layout8");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout8);
    obj.label5:setAlign("left");
    obj.label5:setWidth(75);
    obj.label5:setText("Nível da Carreira");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontSize(9);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setAlign("client");
    obj.edit5:setField("careerLevel");
    obj.edit5:setName("edit5");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle1);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(600);
    obj.layout10:setName("layout10");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout10);
    obj.label6:setAlign("left");
    obj.label6:setWidth(75);
    obj.label6:setText("Caminho da Carreira");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontSize(9);
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout10);
    obj.edit6:setAlign("client");
    obj.edit6:setField("careerPath");
    obj.edit6:setName("edit6");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout9);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(200);
    obj.layout11:setName("layout11");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout11);
    obj.label7:setAlign("left");
    obj.label7:setWidth(75);
    obj.label7:setText("Status");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontSize(13);
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout11);
    obj.edit7:setAlign("client");
    obj.edit7:setField("status");
    obj.edit7:setName("edit7");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox1);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(280);
    obj.layout12:setMargins({top=5});
    obj.layout12:setName("layout12");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout12);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(195);
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle2:setName("rectangle2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout13);
    obj.label8:setAlign("left");
    obj.label8:setWidth(100);
    obj.label8:setText("");
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout13);
    obj.label9:setAlign("left");
    obj.label9:setWidth(30);
    obj.label9:setText("Ini");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout13);
    obj.label10:setAlign("left");
    obj.label10:setWidth(30);
    obj.label10:setText("Adv");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout13);
    obj.label11:setAlign("left");
    obj.label11:setWidth(30);
    obj.label11:setText("Curr");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout14);
    obj.label12:setAlign("left");
    obj.label12:setWidth(100);
    obj.label12:setText("Corpo-a-Corpo");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(13);
    obj.label12:setName("label12");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout14);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(30);
    obj.edit8:setField("wsInitial");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout14);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(30);
    obj.edit9:setField("wsAdvances");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout14);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle3:setName("rectangle3");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle3);
    obj.label13:setAlign("client");
    obj.label13:setField("wsTotal");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout14);
    obj.dataLink1:setFields({'wsInitial', 'wsAdvances'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout14);
    obj.dataLink2:setFields({'wsTotal'});
    obj.dataLink2:setName("dataLink2");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle2);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout15);
    obj.label14:setAlign("left");
    obj.label14:setWidth(100);
    obj.label14:setText("Arma a Distancia");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontSize(13);
    obj.label14:setName("label14");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout15);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(30);
    obj.edit10:setField("bsInitial");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout15);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(30);
    obj.edit11:setField("bsAdvances");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout15);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle4:setName("rectangle4");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle4);
    obj.label15:setAlign("client");
    obj.label15:setField("bsTotal");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout15);
    obj.dataLink3:setFields({'bsInitial', 'bsAdvances'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout15);
    obj.dataLink4:setFields({'bsTotal'});
    obj.dataLink4:setName("dataLink4");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle2);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout16);
    obj.label16:setAlign("left");
    obj.label16:setWidth(100);
    obj.label16:setText("Força");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(13);
    obj.label16:setName("label16");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout16);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(30);
    obj.edit12:setField("sInitial");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout16);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(30);
    obj.edit13:setField("sAdvances");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout16);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle5:setName("rectangle5");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle5);
    obj.label17:setAlign("client");
    obj.label17:setField("sTotal");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout16);
    obj.dataLink5:setFields({'sInitial', 'sAdvances'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout16);
    obj.dataLink6:setFields({'sTotal'});
    obj.dataLink6:setName("dataLink6");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle2);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout17);
    obj.label18:setAlign("left");
    obj.label18:setWidth(100);
    obj.label18:setText("Constituição");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setFontSize(13);
    obj.label18:setName("label18");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout17);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(30);
    obj.edit14:setField("tInitial");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout17);
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(30);
    obj.edit15:setField("tAdvances");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout17);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle6:setName("rectangle6");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle6);
    obj.label19:setAlign("client");
    obj.label19:setField("tTotal");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout17);
    obj.dataLink7:setFields({'tInitial', 'tAdvances'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout17);
    obj.dataLink8:setFields({'tTotal'});
    obj.dataLink8:setName("dataLink8");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle2);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout18);
    obj.label20:setAlign("left");
    obj.label20:setWidth(100);
    obj.label20:setText("Iniciativa");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setFontSize(13);
    obj.label20:setName("label20");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout18);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(30);
    obj.edit16:setField("iInitial");
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout18);
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(30);
    obj.edit17:setField("iAdvances");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout18);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle7:setName("rectangle7");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle7);
    obj.label21:setAlign("client");
    obj.label21:setField("iTotal");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout18);
    obj.dataLink9:setFields({'iInitial', 'iAdvances'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout18);
    obj.dataLink10:setFields({'iTotal'});
    obj.dataLink10:setName("dataLink10");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle2);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout19);
    obj.label22:setAlign("left");
    obj.label22:setWidth(100);
    obj.label22:setText("Agilidade");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setFontSize(13);
    obj.label22:setName("label22");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout19);
    obj.edit18:setAlign("left");
    obj.edit18:setWidth(30);
    obj.edit18:setField("agInitial");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout19);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(30);
    obj.edit19:setField("agAdvances");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout19);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle8:setName("rectangle8");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle8);
    obj.label23:setAlign("client");
    obj.label23:setField("agTotal");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout19);
    obj.dataLink11:setFields({'agInitial', 'agAdvances'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout19);
    obj.dataLink12:setFields({'agTotal'});
    obj.dataLink12:setName("dataLink12");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle2);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout20);
    obj.label24:setAlign("left");
    obj.label24:setWidth(100);
    obj.label24:setText("Destreza");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setFontSize(13);
    obj.label24:setName("label24");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout20);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(30);
    obj.edit20:setField("dexInitial");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout20);
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(30);
    obj.edit21:setField("dexAdvances");
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setName("edit21");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout20);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle9:setName("rectangle9");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle9);
    obj.label25:setAlign("client");
    obj.label25:setField("dexTotal");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout20);
    obj.dataLink13:setFields({'dexInitial', 'dexAdvances'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout20);
    obj.dataLink14:setFields({'dexTotal'});
    obj.dataLink14:setName("dataLink14");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle2);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout21);
    obj.label26:setAlign("left");
    obj.label26:setWidth(100);
    obj.label26:setText("Inteligencia");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setFontSize(13);
    obj.label26:setName("label26");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout21);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(30);
    obj.edit22:setField("intInitial");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout21);
    obj.edit23:setAlign("left");
    obj.edit23:setWidth(30);
    obj.edit23:setField("intAdvances");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout21);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle10:setName("rectangle10");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle10);
    obj.label27:setAlign("client");
    obj.label27:setField("intTotal");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout21);
    obj.dataLink15:setFields({'intInitial', 'intAdvances'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout21);
    obj.dataLink16:setFields({'intTotal'});
    obj.dataLink16:setName("dataLink16");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle2);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout22);
    obj.label28:setAlign("left");
    obj.label28:setWidth(100);
    obj.label28:setText("Força de Vontade");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setFontSize(11);
    obj.label28:setName("label28");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout22);
    obj.edit24:setAlign("left");
    obj.edit24:setWidth(30);
    obj.edit24:setField("wpInitial");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout22);
    obj.edit25:setAlign("left");
    obj.edit25:setWidth(30);
    obj.edit25:setField("wpAdvances");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout22);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(30);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle11:setName("rectangle11");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle11);
    obj.label29:setAlign("client");
    obj.label29:setField("wpTotal");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout22);
    obj.dataLink17:setFields({'wpInitial', 'wpAdvances'});
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout22);
    obj.dataLink18:setFields({'wpTotal'});
    obj.dataLink18:setName("dataLink18");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle2);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout23);
    obj.label30:setAlign("left");
    obj.label30:setWidth(100);
    obj.label30:setText("Sociedade");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setFontSize(13);
    obj.label30:setName("label30");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout23);
    obj.edit26:setAlign("left");
    obj.edit26:setWidth(30);
    obj.edit26:setField("felInitial");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout23);
    obj.edit27:setAlign("left");
    obj.edit27:setWidth(30);
    obj.edit27:setField("felAdvances");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout23);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle12:setName("rectangle12");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.rectangle12);
    obj.label31:setAlign("client");
    obj.label31:setField("felTotal");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout23);
    obj.dataLink19:setFields({'felInitial', 'felAdvances'});
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout23);
    obj.dataLink20:setFields({'felTotal'});
    obj.dataLink20:setName("dataLink20");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout12);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(135);
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setMargins({left=5});
    obj.rectangle13:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle13:setName("rectangle13");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.rectangle13);
    obj.label32:setAlign("top");
    obj.label32:setWidth(100);
    obj.label32:setText("RESILIÊNCIA");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle13);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout24);
    obj.label33:setAlign("left");
    obj.label33:setWidth(100);
    obj.label33:setText("Resiliência");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setFontSize(13);
    obj.label33:setName("label33");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout24);
    obj.edit28:setAlign("left");
    obj.edit28:setWidth(30);
    obj.edit28:setField("resilience");
    obj.edit28:setName("edit28");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle13);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout25);
    obj.label34:setAlign("left");
    obj.label34:setWidth(100);
    obj.label34:setText("Determinação");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setFontSize(13);
    obj.label34:setName("label34");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout25);
    obj.edit29:setAlign("left");
    obj.edit29:setWidth(30);
    obj.edit29:setField("resolve");
    obj.edit29:setName("edit29");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle13);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout26);
    obj.label35:setAlign("left");
    obj.label35:setWidth(100);
    obj.label35:setText("Motivação");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setFontSize(13);
    obj.label35:setName("label35");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout26);
    obj.edit30:setAlign("left");
    obj.edit30:setWidth(30);
    obj.edit30:setField("motivation");
    obj.edit30:setName("edit30");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle13);
    obj.label36:setAlign("top");
    obj.label36:setWidth(100);
    obj.label36:setText("DESTINO");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setMargins({top=10});
    obj.label36:setName("label36");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle13);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout27);
    obj.label37:setAlign("left");
    obj.label37:setWidth(100);
    obj.label37:setText("Destino");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setFontSize(13);
    obj.label37:setName("label37");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout27);
    obj.edit31:setAlign("left");
    obj.edit31:setWidth(30);
    obj.edit31:setField("fate");
    obj.edit31:setName("edit31");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle13);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout28);
    obj.label38:setAlign("left");
    obj.label38:setWidth(100);
    obj.label38:setText("Fortuna");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setFontSize(13);
    obj.label38:setName("label38");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout28);
    obj.edit32:setAlign("left");
    obj.edit32:setWidth(30);
    obj.edit32:setField("fortuna");
    obj.edit32:setName("edit32");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout12);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(135);
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setMargins({left=5});
    obj.rectangle14:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle14:setName("rectangle14");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle14);
    obj.label39:setAlign("top");
    obj.label39:setWidth(100);
    obj.label39:setText("MOVIMENTO");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle14);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout29);
    obj.label40:setAlign("left");
    obj.label40:setWidth(100);
    obj.label40:setText("Movimento");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontSize(13);
    obj.label40:setName("label40");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout29);
    obj.edit33:setAlign("left");
    obj.edit33:setWidth(30);
    obj.edit33:setField("movement");
    obj.edit33:setName("edit33");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle14);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout30);
    obj.label41:setAlign("left");
    obj.label41:setWidth(100);
    obj.label41:setText("Caminhar");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setFontSize(13);
    obj.label41:setName("label41");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout30);
    obj.edit34:setAlign("left");
    obj.edit34:setWidth(30);
    obj.edit34:setField("walk");
    obj.edit34:setName("edit34");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle14);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout31);
    obj.label42:setAlign("left");
    obj.label42:setWidth(100);
    obj.label42:setText("Correr");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setFontSize(13);
    obj.label42:setName("label42");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout31);
    obj.edit35:setAlign("left");
    obj.edit35:setWidth(30);
    obj.edit35:setField("run");
    obj.edit35:setName("edit35");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle14);
    obj.label43:setAlign("top");
    obj.label43:setWidth(100);
    obj.label43:setText("EXPERIÊNCIA");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setMargins({top=10});
    obj.label43:setName("label43");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle14);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout32);
    obj.label44:setAlign("left");
    obj.label44:setWidth(100);
    obj.label44:setText("Atual");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setFontSize(13);
    obj.label44:setName("label44");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout32);
    obj.edit36:setAlign("left");
    obj.edit36:setWidth(30);
    obj.edit36:setField("xpCurr");
    obj.edit36:setName("edit36");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle14);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout33);
    obj.label45:setAlign("left");
    obj.label45:setWidth(100);
    obj.label45:setText("Gasto");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setFontSize(13);
    obj.label45:setName("label45");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout33);
    obj.edit37:setAlign("left");
    obj.edit37:setWidth(30);
    obj.edit37:setField("xpSpent");
    obj.edit37:setName("edit37");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle14);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout34);
    obj.label46:setAlign("left");
    obj.label46:setWidth(100);
    obj.label46:setText("Total");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setFontSize(13);
    obj.label46:setName("label46");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout34);
    obj.edit38:setAlign("left");
    obj.edit38:setWidth(30);
    obj.edit38:setField("xpTotal");
    obj.edit38:setName("edit38");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout12);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(280);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setMargins({left=5});
    obj.rectangle15:setName("rectangle15");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle15);
    obj.label47:setAlign("client");
    obj.label47:setText("Avatar");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setMargins({left=2, right=2, top=2, bottom=2});
    obj.label47:setName("label47");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.label47);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox1);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(230);
    obj.layout35:setMargins({top=5});
    obj.layout35:setName("layout35");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout35);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(195);
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle16:setName("rectangle16");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle16);
    obj.label48:setAlign("top");
    obj.label48:setWidth(100);
    obj.label48:setText("PSICOLOGIA");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle16);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("psychology");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout35);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(195);
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle17:setMargins({left=5});
    obj.rectangle17:setName("rectangle17");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.rectangle17);
    obj.label49:setAlign("top");
    obj.label49:setWidth(100);
    obj.label49:setText("CORRUPÇÃO & MUTAÇÃO");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle17);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("corruption");
    obj.textEditor2:setName("textEditor2");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout35);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(135);
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle18:setMargins({left=5});
    obj.rectangle18:setName("rectangle18");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle18);
    obj.label50:setAlign("top");
    obj.label50:setWidth(100);
    obj.label50:setText("FERIMENTOS");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle18);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout36);
    obj.label51:setAlign("left");
    obj.label51:setWidth(100);
    obj.label51:setText("SB");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setFontSize(13);
    obj.label51:setName("label51");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout36);
    obj.edit39:setAlign("left");
    obj.edit39:setWidth(30);
    obj.edit39:setField("hpSB");
    obj.edit39:setName("edit39");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle18);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout37);
    obj.label52:setAlign("left");
    obj.label52:setWidth(100);
    obj.label52:setText("TBx2");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setFontSize(13);
    obj.label52:setName("label52");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout37);
    obj.edit40:setAlign("left");
    obj.edit40:setWidth(30);
    obj.edit40:setField("hpTB");
    obj.edit40:setName("edit40");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle18);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout38);
    obj.label53:setAlign("left");
    obj.label53:setWidth(100);
    obj.label53:setText("WPB");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setFontSize(13);
    obj.label53:setName("label53");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout38);
    obj.edit41:setAlign("left");
    obj.edit41:setWidth(30);
    obj.edit41:setField("hpWPB");
    obj.edit41:setName("edit41");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle18);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout39);
    obj.label54:setAlign("left");
    obj.label54:setWidth(100);
    obj.label54:setText("Resistência");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setFontSize(13);
    obj.label54:setName("label54");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout39);
    obj.edit42:setAlign("left");
    obj.edit42:setWidth(30);
    obj.edit42:setField("hpHardy");
    obj.edit42:setName("edit42");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle18);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout40);
    obj.label55:setAlign("left");
    obj.label55:setWidth(100);
    obj.label55:setText("Ferimentos");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setFontSize(13);
    obj.label55:setName("label55");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout40);
    obj.edit43:setAlign("left");
    obj.edit43:setWidth(30);
    obj.edit43:setField("hpWounds");
    obj.edit43:setName("edit43");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle18);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("hpDetails");
    obj.textEditor3:setName("textEditor3");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.frmPericias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPericias:setParent(obj.tab2);
    obj.frmPericias:setName("frmPericias");
    obj.frmPericias:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmPericias);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox2);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxColumns(3);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.campoDasPericiasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasPericiasPart:setParent(obj.flowLayout1);
    obj.campoDasPericiasPart:setMinWidth(300);
    obj.campoDasPericiasPart:setMaxWidth(600);
    obj.campoDasPericiasPart:setHeight(25);
    obj.campoDasPericiasPart:setMinScaledWidth(280);
    obj.campoDasPericiasPart:setName("campoDasPericiasPart");
    obj.campoDasPericiasPart:setAdjustHeightToLine(false);
    obj.campoDasPericiasPart:setMargins({left=5});


					rawset(self.campoDasPericiasPart, "_recalcHeight", 					
						function ()
							self.campoDasPericiasPart.height = self.campoDasPericias.height + 25;
						end);
				


    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.campoDasPericiasPart);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout41);
    obj.button1:setText("+");
    obj.button1:setAlign("left");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout41);
    obj.label56:setText("PERÍCIAS BÁSICAS");
    obj.label56:setAlign("left");
    obj.label56:setWidth(225);
    obj.label56:setMargins({left=5});
    obj.label56:setName("label56");

    obj.campoDasPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasPericias:setParent(obj.campoDasPericiasPart);
    obj.campoDasPericias:setName("campoDasPericias");
    obj.campoDasPericias:setField("campoDasPericias");
    obj.campoDasPericias:setTemplateForm("frmPericia");
    obj.campoDasPericias:setAlign("top");
    obj.campoDasPericias:setLayout("vertical");
    obj.campoDasPericias:setAutoHeight(true);
    obj.campoDasPericias:setHitTest(false);
    obj.campoDasPericias:setMinQt(0);

    obj.campoDasPericiasAvancadasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasPericiasAvancadasPart:setParent(obj.flowLayout1);
    obj.campoDasPericiasAvancadasPart:setMinWidth(300);
    obj.campoDasPericiasAvancadasPart:setMaxWidth(600);
    obj.campoDasPericiasAvancadasPart:setHeight(25);
    obj.campoDasPericiasAvancadasPart:setMinScaledWidth(280);
    obj.campoDasPericiasAvancadasPart:setName("campoDasPericiasAvancadasPart");
    obj.campoDasPericiasAvancadasPart:setAdjustHeightToLine(false);
    obj.campoDasPericiasAvancadasPart:setMargins({left=5});


					rawset(self.campoDasPericiasAvancadasPart, "_recalcHeight", 					
						function ()
							self.campoDasPericiasAvancadasPart.height = self.campoDasPericiasAvancadas.height + 25;
						end);
				


    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.campoDasPericiasAvancadasPart);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout42);
    obj.button2:setText("+");
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setName("button2");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout42);
    obj.label57:setText("PERÍCIAS AVANÇADAS");
    obj.label57:setAlign("left");
    obj.label57:setWidth(225);
    obj.label57:setMargins({left=5});
    obj.label57:setName("label57");

    obj.campoDasPericiasAvancadas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasPericiasAvancadas:setParent(obj.campoDasPericiasAvancadasPart);
    obj.campoDasPericiasAvancadas:setName("campoDasPericiasAvancadas");
    obj.campoDasPericiasAvancadas:setField("campoDasPericiasAvancadas");
    obj.campoDasPericiasAvancadas:setTemplateForm("frmPericia");
    obj.campoDasPericiasAvancadas:setAlign("top");
    obj.campoDasPericiasAvancadas:setLayout("vertical");
    obj.campoDasPericiasAvancadas:setAutoHeight(true);
    obj.campoDasPericiasAvancadas:setHitTest(false);
    obj.campoDasPericiasAvancadas:setMinQt(0);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Habilidades");
    obj.tab3:setName("tab3");

    obj.frmHabilidades = GUI.fromHandle(_obj_newObject("form"));
    obj.frmHabilidades:setParent(obj.tab3);
    obj.frmHabilidades:setName("frmHabilidades");
    obj.frmHabilidades:setAlign("client");

    obj.popHabilidade = GUI.fromHandle(_obj_newObject("popup"));
    obj.popHabilidade:setParent(obj.frmHabilidades);
    obj.popHabilidade:setName("popHabilidade");
    obj.popHabilidade:setWidth(300);
    obj.popHabilidade:setHeight(240);
    obj.popHabilidade:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popHabilidade, "autoScopeNode",  "false");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.popHabilidade);
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(3);
    obj.flowLayout2:setMargins({bottom=4});
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout2);
    obj.flowPart1:setMinWidth(90);
    obj.flowPart1:setMaxWidth(100);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.flowPart1);
    obj.label58:setAlign("top");
    obj.label58:setFontSize(10);
    obj.label58:setText("Qtd");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setWordWrap(true);
    obj.label58:setTextTrimming("none");
    obj.label58:setAutoSize(true);
    obj.label58:setName("label58");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.flowPart1);
    obj.edit44:setAlign("client");
    obj.edit44:setField("qtdHabilidade");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setFontSize(12);
    obj.edit44:setType("number");
    obj.edit44:setName("edit44");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMinWidth(180);
    obj.flowPart2:setMaxWidth(200);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.flowPart2);
    obj.label59:setAlign("top");
    obj.label59:setFontSize(10);
    obj.label59:setText("Obtido");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setWordWrap(true);
    obj.label59:setTextTrimming("none");
    obj.label59:setAutoSize(true);
    obj.label59:setName("label59");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart2);
    obj.edit45:setAlign("client");
    obj.edit45:setField("obtencaoHabilidade");
    obj.edit45:setFontSize(12);
    obj.edit45:setName("edit45");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setMinWidth(90);
    obj.flowPart3:setMaxWidth(100);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.flowPart3);
    obj.label60:setAlign("top");
    obj.label60:setFontSize(10);
    obj.label60:setText("Página");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setWordWrap(true);
    obj.label60:setTextTrimming("none");
    obj.label60:setAutoSize(true);
    obj.label60:setName("label60");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart3);
    obj.edit46:setAlign("client");
    obj.edit46:setField("paginaHabilidade");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(12);
    obj.edit46:setType("number");
    obj.edit46:setName("edit46");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout2);
    obj.flowPart4:setMinWidth(180);
    obj.flowPart4:setMaxWidth(200);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.flowPart4);
    obj.label61:setAlign("top");
    obj.label61:setFontSize(10);
    obj.label61:setText("Livro");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setWordWrap(true);
    obj.label61:setTextTrimming("none");
    obj.label61:setAutoSize(true);
    obj.label61:setName("label61");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart4);
    obj.edit47:setAlign("client");
    obj.edit47:setField("livroHabilidade");
    obj.edit47:setFontSize(12);
    obj.edit47:setName("edit47");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.popHabilidade);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("descricao");
    obj.textEditor4:setName("textEditor4");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmHabilidades);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.scrollBox3);
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxColumns(3);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setOrientation("vertical");
    obj.flowLayout3:setAvoidScale(true);
    obj.flowLayout3:setName("flowLayout3");

    obj.campoDosTalentosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDosTalentosPart:setParent(obj.flowLayout3);
    obj.campoDosTalentosPart:setMinWidth(300);
    obj.campoDosTalentosPart:setMaxWidth(600);
    obj.campoDosTalentosPart:setHeight(25);
    obj.campoDosTalentosPart:setMinScaledWidth(280);
    obj.campoDosTalentosPart:setName("campoDosTalentosPart");
    obj.campoDosTalentosPart:setAdjustHeightToLine(false);
    obj.campoDosTalentosPart:setMargins({left=5});


					rawset(self.campoDosTalentosPart, "_recalcHeight", 					
						function ()
							self.campoDosTalentosPart.height = self.campoDosTalentos.height + 25;
						end);
				


    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.campoDosTalentosPart);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout43);
    obj.button3:setText("+");
    obj.button3:setAlign("left");
    obj.button3:setWidth(30);
    obj.button3:setName("button3");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout43);
    obj.label62:setText("TALENTOS");
    obj.label62:setAlign("left");
    obj.label62:setWidth(225);
    obj.label62:setMargins({left=5});
    obj.label62:setName("label62");

    obj.campoDosTalentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosTalentos:setParent(obj.campoDosTalentosPart);
    obj.campoDosTalentos:setName("campoDosTalentos");
    obj.campoDosTalentos:setField("campoDosTalentos");
    obj.campoDosTalentos:setTemplateForm("frmHabilidade");
    obj.campoDosTalentos:setAlign("top");
    obj.campoDosTalentos:setLayout("vertical");
    obj.campoDosTalentos:setAutoHeight(true);
    obj.campoDosTalentos:setHitTest(false);
    obj.campoDosTalentos:setMinQt(0);

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Magias");
    obj.tab4:setName("tab4");

    obj.frmMagias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMagias:setParent(obj.tab4);
    obj.frmMagias:setName("frmMagias");
    obj.frmMagias:setAlign("client");

    obj.popMagia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj.frmMagias);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setWidth(300);
    obj.popMagia:setHeight(240);
    obj.popMagia:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popMagia, "autoScopeNode",  "false");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.popMagia);
    obj.flowLayout4:setAlign("top");
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setMaxControlsPerLine(3);
    obj.flowLayout4:setMargins({bottom=4});
    obj.flowLayout4:setHorzAlign("center");
    obj.flowLayout4:setName("flowLayout4");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout4);
    obj.flowPart5:setMinWidth(90);
    obj.flowPart5:setMaxWidth(100);
    obj.flowPart5:setHeight(35);
    obj.flowPart5:setName("flowPart5");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.flowPart5);
    obj.label63:setAlign("top");
    obj.label63:setFontSize(10);
    obj.label63:setText("CN");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setWordWrap(true);
    obj.label63:setTextTrimming("none");
    obj.label63:setAutoSize(true);
    obj.label63:setName("label63");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart5);
    obj.edit48:setAlign("client");
    obj.edit48:setField("magicCN");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontSize(12);
    obj.edit48:setType("number");
    obj.edit48:setName("edit48");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout4);
    obj.flowPart6:setMinWidth(180);
    obj.flowPart6:setMaxWidth(200);
    obj.flowPart6:setHeight(35);
    obj.flowPart6:setName("flowPart6");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.flowPart6);
    obj.label64:setAlign("top");
    obj.label64:setFontSize(10);
    obj.label64:setText("Alcance");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setWordWrap(true);
    obj.label64:setTextTrimming("none");
    obj.label64:setAutoSize(true);
    obj.label64:setName("label64");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart6);
    obj.edit49:setAlign("client");
    obj.edit49:setField("magicRange");
    obj.edit49:setFontSize(12);
    obj.edit49:setName("edit49");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout4);
    obj.flowPart7:setMinWidth(90);
    obj.flowPart7:setMaxWidth(100);
    obj.flowPart7:setHeight(35);
    obj.flowPart7:setName("flowPart7");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.flowPart7);
    obj.label65:setAlign("top");
    obj.label65:setFontSize(10);
    obj.label65:setText("Alvo");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setWordWrap(true);
    obj.label65:setTextTrimming("none");
    obj.label65:setAutoSize(true);
    obj.label65:setName("label65");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart7);
    obj.edit50:setAlign("client");
    obj.edit50:setField("magicTarget");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setFontSize(12);
    obj.edit50:setType("number");
    obj.edit50:setName("edit50");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout4);
    obj.flowPart8:setMinWidth(180);
    obj.flowPart8:setMaxWidth(200);
    obj.flowPart8:setHeight(35);
    obj.flowPart8:setName("flowPart8");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.flowPart8);
    obj.label66:setAlign("top");
    obj.label66:setFontSize(10);
    obj.label66:setText("Duração");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setWordWrap(true);
    obj.label66:setTextTrimming("none");
    obj.label66:setAutoSize(true);
    obj.label66:setName("label66");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart8);
    obj.edit51:setAlign("client");
    obj.edit51:setField("magicDuration");
    obj.edit51:setFontSize(12);
    obj.edit51:setName("edit51");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.popMagia);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("descricao");
    obj.textEditor5:setName("textEditor5");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmMagias);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.scrollBox4);
    obj.flowLayout5:setAlign("top");
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setMaxColumns(3);
    obj.flowLayout5:setHorzAlign("center");
    obj.flowLayout5:setOrientation("vertical");
    obj.flowLayout5:setAvoidScale(true);
    obj.flowLayout5:setName("flowLayout5");

    obj.campoDasMagiasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasMagiasPart:setParent(obj.flowLayout5);
    obj.campoDasMagiasPart:setMinWidth(300);
    obj.campoDasMagiasPart:setMaxWidth(600);
    obj.campoDasMagiasPart:setHeight(25);
    obj.campoDasMagiasPart:setMinScaledWidth(280);
    obj.campoDasMagiasPart:setName("campoDasMagiasPart");
    obj.campoDasMagiasPart:setAdjustHeightToLine(false);
    obj.campoDasMagiasPart:setMargins({left=5});


					rawset(self.campoDasMagiasPart, "_recalcHeight", 					
						function ()
							self.campoDasMagiasPart.height = self.campoDasMagias.height + 25;
						end);
				


    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.campoDasMagiasPart);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout44);
    obj.button4:setText("+");
    obj.button4:setAlign("left");
    obj.button4:setWidth(30);
    obj.button4:setName("button4");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout44);
    obj.label67:setText("MAGIAS");
    obj.label67:setAlign("left");
    obj.label67:setWidth(225);
    obj.label67:setMargins({left=5});
    obj.label67:setName("label67");

    obj.campoDasMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasMagias:setParent(obj.campoDasMagiasPart);
    obj.campoDasMagias:setName("campoDasMagias");
    obj.campoDasMagias:setField("campoDasMagias");
    obj.campoDasMagias:setTemplateForm("frmMagia");
    obj.campoDasMagias:setAlign("top");
    obj.campoDasMagias:setLayout("vertical");
    obj.campoDasMagias:setAutoHeight(true);
    obj.campoDasMagias:setHitTest(false);
    obj.campoDasMagias:setMinQt(0);

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Equipamentos");
    obj.tab5:setName("tab5");

    obj.frmEquipamentos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmEquipamentos:setParent(obj.tab5);
    obj.frmEquipamentos:setName("frmEquipamentos");
    obj.frmEquipamentos:setAlign("client");

    obj.popArmadura = GUI.fromHandle(_obj_newObject("popup"));
    obj.popArmadura:setParent(obj.frmEquipamentos);
    obj.popArmadura:setName("popArmadura");
    obj.popArmadura:setWidth(300);
    obj.popArmadura:setHeight(240);
    obj.popArmadura:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popArmadura, "autoScopeNode",  "false");

    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.popArmadura);
    obj.flowLayout6:setAlign("top");
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setMaxControlsPerLine(3);
    obj.flowLayout6:setMargins({bottom=4});
    obj.flowLayout6:setHorzAlign("center");
    obj.flowLayout6:setName("flowLayout6");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout6);
    obj.flowPart9:setMinWidth(90);
    obj.flowPart9:setMaxWidth(100);
    obj.flowPart9:setHeight(35);
    obj.flowPart9:setName("flowPart9");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.flowPart9);
    obj.label68:setAlign("top");
    obj.label68:setFontSize(10);
    obj.label68:setText("Carga");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setWordWrap(true);
    obj.label68:setTextTrimming("none");
    obj.label68:setAutoSize(true);
    obj.label68:setName("label68");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart9);
    obj.edit52:setAlign("client");
    obj.edit52:setField("carga");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setFontSize(12);
    obj.edit52:setType("number");
    obj.edit52:setName("edit52");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout6);
    obj.flowPart10:setMinWidth(180);
    obj.flowPart10:setMaxWidth(200);
    obj.flowPart10:setHeight(35);
    obj.flowPart10:setName("flowPart10");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.flowPart10);
    obj.label69:setAlign("top");
    obj.label69:setFontSize(10);
    obj.label69:setText("Lugares");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setWordWrap(true);
    obj.label69:setTextTrimming("none");
    obj.label69:setAutoSize(true);
    obj.label69:setName("label69");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart10);
    obj.edit53:setAlign("client");
    obj.edit53:setField("lugares");
    obj.edit53:setFontSize(12);
    obj.edit53:setName("edit53");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout6);
    obj.flowPart11:setMinWidth(90);
    obj.flowPart11:setMaxWidth(100);
    obj.flowPart11:setHeight(35);
    obj.flowPart11:setName("flowPart11");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.flowPart11);
    obj.label70:setAlign("top");
    obj.label70:setFontSize(10);
    obj.label70:setText("PA");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setWordWrap(true);
    obj.label70:setTextTrimming("none");
    obj.label70:setAutoSize(true);
    obj.label70:setName("label70");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart11);
    obj.edit54:setAlign("client");
    obj.edit54:setField("pa");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setFontSize(12);
    obj.edit54:setType("number");
    obj.edit54:setName("edit54");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout6);
    obj.flowPart12:setMinWidth(180);
    obj.flowPart12:setMaxWidth(200);
    obj.flowPart12:setHeight(35);
    obj.flowPart12:setName("flowPart12");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.flowPart12);
    obj.label71:setAlign("top");
    obj.label71:setFontSize(10);
    obj.label71:setText("Qualidades");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setWordWrap(true);
    obj.label71:setTextTrimming("none");
    obj.label71:setAutoSize(true);
    obj.label71:setName("label71");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart12);
    obj.edit55:setAlign("client");
    obj.edit55:setField("qualidades");
    obj.edit55:setFontSize(12);
    obj.edit55:setName("edit55");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.popArmadura);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("descricao");
    obj.textEditor6:setName("textEditor6");

    obj.popArmadilha = GUI.fromHandle(_obj_newObject("popup"));
    obj.popArmadilha:setParent(obj.frmEquipamentos);
    obj.popArmadilha:setName("popArmadilha");
    obj.popArmadilha:setWidth(300);
    obj.popArmadilha:setHeight(240);
    obj.popArmadilha:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popArmadilha, "autoScopeNode",  "false");

    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.popArmadilha);
    obj.flowLayout7:setAlign("top");
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setMaxControlsPerLine(3);
    obj.flowLayout7:setMargins({bottom=4});
    obj.flowLayout7:setHorzAlign("center");
    obj.flowLayout7:setName("flowLayout7");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout7);
    obj.flowPart13:setMinWidth(180);
    obj.flowPart13:setMaxWidth(200);
    obj.flowPart13:setHeight(35);
    obj.flowPart13:setName("flowPart13");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.flowPart13);
    obj.label72:setAlign("top");
    obj.label72:setFontSize(10);
    obj.label72:setText("Nome");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setWordWrap(true);
    obj.label72:setTextTrimming("none");
    obj.label72:setAutoSize(true);
    obj.label72:setName("label72");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart13);
    obj.edit56:setAlign("client");
    obj.edit56:setField("nome");
    obj.edit56:setFontSize(12);
    obj.edit56:setName("edit56");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout7);
    obj.flowPart14:setMinWidth(90);
    obj.flowPart14:setMaxWidth(100);
    obj.flowPart14:setHeight(35);
    obj.flowPart14:setName("flowPart14");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowPart14);
    obj.label73:setAlign("top");
    obj.label73:setFontSize(10);
    obj.label73:setText("Carga");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setWordWrap(true);
    obj.label73:setTextTrimming("none");
    obj.label73:setAutoSize(true);
    obj.label73:setName("label73");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart14);
    obj.edit57:setAlign("client");
    obj.edit57:setField("carga");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setFontSize(12);
    obj.edit57:setType("number");
    obj.edit57:setName("edit57");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.popArmadilha);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("descricao");
    obj.textEditor7:setName("textEditor7");

    obj.popArma = GUI.fromHandle(_obj_newObject("popup"));
    obj.popArma:setParent(obj.frmEquipamentos);
    obj.popArma:setName("popArma");
    obj.popArma:setWidth(300);
    obj.popArma:setHeight(240);
    obj.popArma:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popArma, "autoScopeNode",  "false");

    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.popArma);
    obj.flowLayout8:setAlign("top");
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setMaxControlsPerLine(3);
    obj.flowLayout8:setMargins({bottom=4});
    obj.flowLayout8:setHorzAlign("center");
    obj.flowLayout8:setName("flowLayout8");

    obj.flowPart15 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart15:setParent(obj.flowLayout8);
    obj.flowPart15:setMinWidth(90);
    obj.flowPart15:setMaxWidth(100);
    obj.flowPart15:setHeight(35);
    obj.flowPart15:setName("flowPart15");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.flowPart15);
    obj.label74:setAlign("top");
    obj.label74:setFontSize(10);
    obj.label74:setText("Carga");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setWordWrap(true);
    obj.label74:setTextTrimming("none");
    obj.label74:setAutoSize(true);
    obj.label74:setName("label74");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.flowPart15);
    obj.edit58:setAlign("client");
    obj.edit58:setField("carga");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setFontSize(12);
    obj.edit58:setType("number");
    obj.edit58:setName("edit58");

    obj.flowPart16 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart16:setParent(obj.flowLayout8);
    obj.flowPart16:setMinWidth(180);
    obj.flowPart16:setMaxWidth(200);
    obj.flowPart16:setHeight(35);
    obj.flowPart16:setName("flowPart16");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowPart16);
    obj.label75:setAlign("top");
    obj.label75:setFontSize(10);
    obj.label75:setText("Dano");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setWordWrap(true);
    obj.label75:setTextTrimming("none");
    obj.label75:setAutoSize(true);
    obj.label75:setName("label75");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.flowPart16);
    obj.edit59:setAlign("client");
    obj.edit59:setField("dano");
    obj.edit59:setFontSize(12);
    obj.edit59:setName("edit59");

    obj.flowPart17 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart17:setParent(obj.flowLayout8);
    obj.flowPart17:setMinWidth(90);
    obj.flowPart17:setMaxWidth(100);
    obj.flowPart17:setHeight(35);
    obj.flowPart17:setName("flowPart17");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowPart17);
    obj.label76:setAlign("top");
    obj.label76:setFontSize(10);
    obj.label76:setText("Alcance");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setWordWrap(true);
    obj.label76:setTextTrimming("none");
    obj.label76:setAutoSize(true);
    obj.label76:setName("label76");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.flowPart17);
    obj.edit60:setAlign("client");
    obj.edit60:setField("alcance");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setFontSize(12);
    obj.edit60:setType("number");
    obj.edit60:setName("edit60");

    obj.flowPart18 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart18:setParent(obj.flowLayout8);
    obj.flowPart18:setMinWidth(180);
    obj.flowPart18:setMaxWidth(200);
    obj.flowPart18:setHeight(35);
    obj.flowPart18:setName("flowPart18");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart18);
    obj.label77:setAlign("top");
    obj.label77:setFontSize(10);
    obj.label77:setText("Grupo");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setWordWrap(true);
    obj.label77:setTextTrimming("none");
    obj.label77:setAutoSize(true);
    obj.label77:setName("label77");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.flowPart18);
    obj.edit61:setAlign("client");
    obj.edit61:setField("grupo");
    obj.edit61:setFontSize(12);
    obj.edit61:setName("edit61");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.popArma);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("descricao");
    obj.textEditor8:setName("textEditor8");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmEquipamentos);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox5);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(205);
    obj.layout45:setName("layout45");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout45);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(145);
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setMargins({left=5});
    obj.rectangle19:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle19:setName("rectangle19");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.rectangle19);
    obj.label78:setAlign("top");
    obj.label78:setWidth(100);
    obj.label78:setText("PONTOS DE ARMADURA");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setFontSize(11);
    obj.label78:setName("label78");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle19);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout46);
    obj.label79:setAlign("left");
    obj.label79:setWidth(100);
    obj.label79:setText("Cabeça");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setFontSize(13);
    obj.label79:setName("label79");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout46);
    obj.edit62:setAlign("left");
    obj.edit62:setWidth(30);
    obj.edit62:setField("ptsArmCabeca");
    obj.edit62:setName("edit62");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle19);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout47);
    obj.label80:setAlign("left");
    obj.label80:setWidth(100);
    obj.label80:setText("Braço Esquerdo");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setFontSize(13);
    obj.label80:setName("label80");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout47);
    obj.edit63:setAlign("left");
    obj.edit63:setWidth(30);
    obj.edit63:setField("ptsArmBraçoE");
    obj.edit63:setName("edit63");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle19);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout48);
    obj.label81:setAlign("left");
    obj.label81:setWidth(100);
    obj.label81:setText("Braço Direito");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setFontSize(13);
    obj.label81:setName("label81");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout48);
    obj.edit64:setAlign("left");
    obj.edit64:setWidth(30);
    obj.edit64:setField("ptsArmBraçoD");
    obj.edit64:setName("edit64");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle19);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout49);
    obj.label82:setAlign("left");
    obj.label82:setWidth(100);
    obj.label82:setText("Corpo");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setFontSize(13);
    obj.label82:setName("label82");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout49);
    obj.edit65:setAlign("left");
    obj.edit65:setWidth(30);
    obj.edit65:setField("ptsArmCorpo");
    obj.edit65:setName("edit65");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle19);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout50);
    obj.label83:setAlign("left");
    obj.label83:setWidth(100);
    obj.label83:setText("Perna Esquerda");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setFontSize(13);
    obj.label83:setName("label83");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout50);
    obj.edit66:setAlign("left");
    obj.edit66:setWidth(30);
    obj.edit66:setField("ptsArmPernaE");
    obj.edit66:setName("edit66");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle19);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout51);
    obj.label84:setAlign("left");
    obj.label84:setWidth(100);
    obj.label84:setText("Perna Direita");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setFontSize(13);
    obj.label84:setName("label84");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout51);
    obj.edit67:setAlign("left");
    obj.edit67:setWidth(30);
    obj.edit67:setField("ptsArmPernaD");
    obj.edit67:setName("edit67");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle19);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout52);
    obj.label85:setAlign("left");
    obj.label85:setWidth(100);
    obj.label85:setText("Escudo");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setFontSize(13);
    obj.label85:setName("label85");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout52);
    obj.edit68:setAlign("left");
    obj.edit68:setWidth(30);
    obj.edit68:setField("ptsArmEscudo");
    obj.edit68:setName("edit68");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout45);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(135);
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setMargins({left=5});
    obj.rectangle20:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle20:setName("rectangle20");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle20);
    obj.label86:setAlign("top");
    obj.label86:setWidth(100);
    obj.label86:setText("CARGA");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle20);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout53);
    obj.label87:setAlign("left");
    obj.label87:setWidth(100);
    obj.label87:setText("Armaduras");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setFontSize(13);
    obj.label87:setName("label87");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout53);
    obj.edit69:setAlign("left");
    obj.edit69:setWidth(30);
    obj.edit69:setField("cargaArmaduras");
    obj.edit69:setName("edit69");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle20);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout54);
    obj.label88:setAlign("left");
    obj.label88:setWidth(100);
    obj.label88:setText("Manifestações");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setFontSize(13);
    obj.label88:setName("label88");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout54);
    obj.edit70:setAlign("left");
    obj.edit70:setWidth(30);
    obj.edit70:setField("cargaArmadilhas");
    obj.edit70:setName("edit70");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle20);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout55);
    obj.label89:setAlign("left");
    obj.label89:setWidth(100);
    obj.label89:setText("Armas");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setFontSize(13);
    obj.label89:setName("label89");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout55);
    obj.edit71:setAlign("left");
    obj.edit71:setWidth(30);
    obj.edit71:setField("cargaArmas");
    obj.edit71:setName("edit71");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle20);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout56);
    obj.label90:setAlign("left");
    obj.label90:setWidth(100);
    obj.label90:setText("Maximo");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setFontSize(13);
    obj.label90:setName("label90");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout56);
    obj.edit72:setAlign("left");
    obj.edit72:setWidth(30);
    obj.edit72:setField("cargaMaximo");
    obj.edit72:setName("edit72");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle20);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout57);
    obj.label91:setAlign("left");
    obj.label91:setWidth(100);
    obj.label91:setText("Total");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setFontSize(13);
    obj.label91:setName("label91");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout57);
    obj.edit73:setAlign("left");
    obj.edit73:setWidth(30);
    obj.edit73:setField("cargaTotal");
    obj.edit73:setName("edit73");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout45);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(135);
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setMargins({left=5});
    obj.rectangle21:setPadding({left=2,right=2,top=2,bottom=2});
    obj.rectangle21:setName("rectangle21");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.rectangle21);
    obj.label92:setAlign("top");
    obj.label92:setWidth(100);
    obj.label92:setText("RIQUEZA");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle21);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout58);
    obj.label93:setAlign("left");
    obj.label93:setWidth(100);
    obj.label93:setText("D");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setFontSize(13);
    obj.label93:setName("label93");

    obj.edit74 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout58);
    obj.edit74:setAlign("left");
    obj.edit74:setWidth(30);
    obj.edit74:setField("riquezaD");
    obj.edit74:setName("edit74");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle21);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout59);
    obj.label94:setAlign("left");
    obj.label94:setWidth(100);
    obj.label94:setText("SS");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setFontSize(13);
    obj.label94:setName("label94");

    obj.edit75 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout59);
    obj.edit75:setAlign("left");
    obj.edit75:setWidth(30);
    obj.edit75:setField("riquezaSS");
    obj.edit75:setName("edit75");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle21);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout60);
    obj.label95:setAlign("left");
    obj.label95:setWidth(100);
    obj.label95:setText("GC");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setFontSize(13);
    obj.label95:setName("label95");

    obj.edit76 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout60);
    obj.edit76:setAlign("left");
    obj.edit76:setWidth(30);
    obj.edit76:setField("riquezaGC");
    obj.edit76:setName("edit76");

    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.scrollBox5);
    obj.flowLayout9:setAlign("top");
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setMaxColumns(3);
    obj.flowLayout9:setHorzAlign("center");
    obj.flowLayout9:setOrientation("vertical");
    obj.flowLayout9:setAvoidScale(true);
    obj.flowLayout9:setName("flowLayout9");

    obj.campoDasArmadurasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasArmadurasPart:setParent(obj.flowLayout9);
    obj.campoDasArmadurasPart:setMinWidth(300);
    obj.campoDasArmadurasPart:setMaxWidth(600);
    obj.campoDasArmadurasPart:setHeight(25);
    obj.campoDasArmadurasPart:setMinScaledWidth(280);
    obj.campoDasArmadurasPart:setName("campoDasArmadurasPart");
    obj.campoDasArmadurasPart:setAdjustHeightToLine(false);
    obj.campoDasArmadurasPart:setMargins({left=5});


					rawset(self.campoDasArmadurasPart, "_recalcHeight", 					
						function ()
							self.campoDasArmadurasPart.height = self.campoDasArmaduras.height + 25;
						end);
				


    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.campoDasArmadurasPart);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout61);
    obj.button5:setText("+");
    obj.button5:setAlign("left");
    obj.button5:setWidth(30);
    obj.button5:setName("button5");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout61);
    obj.label96:setText("ARMADURAS");
    obj.label96:setAlign("left");
    obj.label96:setWidth(225);
    obj.label96:setMargins({left=5});
    obj.label96:setName("label96");

    obj.campoDasArmaduras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasArmaduras:setParent(obj.campoDasArmadurasPart);
    obj.campoDasArmaduras:setName("campoDasArmaduras");
    obj.campoDasArmaduras:setField("campoDasArmaduras");
    obj.campoDasArmaduras:setTemplateForm("frmArmadura");
    obj.campoDasArmaduras:setAlign("top");
    obj.campoDasArmaduras:setLayout("vertical");
    obj.campoDasArmaduras:setAutoHeight(true);
    obj.campoDasArmaduras:setHitTest(false);
    obj.campoDasArmaduras:setMinQt(0);

    obj.campoDasArmadilhasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasArmadilhasPart:setParent(obj.flowLayout9);
    obj.campoDasArmadilhasPart:setMinWidth(300);
    obj.campoDasArmadilhasPart:setMaxWidth(600);
    obj.campoDasArmadilhasPart:setHeight(25);
    obj.campoDasArmadilhasPart:setMinScaledWidth(280);
    obj.campoDasArmadilhasPart:setName("campoDasArmadilhasPart");
    obj.campoDasArmadilhasPart:setAdjustHeightToLine(false);
    obj.campoDasArmadilhasPart:setMargins({left=5});


					rawset(self.campoDasArmadilhasPart, "_recalcHeight", 					
						function ()
							self.campoDasArmadilhasPart.height = self.campoDasArmadilhas.height + 25;
						end);
				


    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.campoDasArmadilhasPart);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout62);
    obj.button6:setText("+");
    obj.button6:setAlign("left");
    obj.button6:setWidth(30);
    obj.button6:setName("button6");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout62);
    obj.label97:setText("MANIFESTAÇÕES");
    obj.label97:setAlign("left");
    obj.label97:setWidth(225);
    obj.label97:setMargins({left=5});
    obj.label97:setName("label97");

    obj.campoDasArmadilhas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasArmadilhas:setParent(obj.campoDasArmadilhasPart);
    obj.campoDasArmadilhas:setName("campoDasArmadilhas");
    obj.campoDasArmadilhas:setField("campoDasArmadilhas");
    obj.campoDasArmadilhas:setTemplateForm("frmArmadilha");
    obj.campoDasArmadilhas:setAlign("top");
    obj.campoDasArmadilhas:setLayout("vertical");
    obj.campoDasArmadilhas:setAutoHeight(true);
    obj.campoDasArmadilhas:setHitTest(false);
    obj.campoDasArmadilhas:setMinQt(0);

    obj.campoDasArmasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasArmasPart:setParent(obj.flowLayout9);
    obj.campoDasArmasPart:setMinWidth(300);
    obj.campoDasArmasPart:setMaxWidth(600);
    obj.campoDasArmasPart:setHeight(25);
    obj.campoDasArmasPart:setMinScaledWidth(280);
    obj.campoDasArmasPart:setName("campoDasArmasPart");
    obj.campoDasArmasPart:setAdjustHeightToLine(false);
    obj.campoDasArmasPart:setMargins({left=5});


					rawset(self.campoDasArmasPart, "_recalcHeight", 					
						function ()
							self.campoDasArmasPart.height = self.campoDasArmas.height + 25;
						end);
				


    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.campoDasArmasPart);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(25);
    obj.layout63:setName("layout63");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout63);
    obj.button7:setText("+");
    obj.button7:setAlign("left");
    obj.button7:setWidth(30);
    obj.button7:setName("button7");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout63);
    obj.label98:setText("ARMAS");
    obj.label98:setAlign("left");
    obj.label98:setWidth(225);
    obj.label98:setMargins({left=5});
    obj.label98:setName("label98");

    obj.campoDasArmas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasArmas:setParent(obj.campoDasArmasPart);
    obj.campoDasArmas:setName("campoDasArmas");
    obj.campoDasArmas:setField("campoDasArmas");
    obj.campoDasArmas:setTemplateForm("frmArma");
    obj.campoDasArmas:setAlign("top");
    obj.campoDasArmas:setLayout("vertical");
    obj.campoDasArmas:setAutoHeight(true);
    obj.campoDasArmas:setHitTest(false);
    obj.campoDasArmas:setMinQt(0);

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Descrição");
    obj.tab6:setName("tab6");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab6);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmTemplateDescription);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.scrollBox6);
    obj.rectangle22:setLeft(0);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(1205);
    obj.rectangle22:setHeight(105);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setName("rectangle22");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle22);
    obj.label99:setAlign("top");
    obj.label99:setHeight(20);
    obj.label99:setText("DESCRIÇÃO");
    obj.label99:setName("label99");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle22);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout64);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(380);
    obj.layout65:setMargins({right=10});
    obj.layout65:setName("layout65");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout65);
    obj.label100:setAlign("left");
    obj.label100:setWidth(90);
    obj.label100:setText("PASSADO");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.edit77 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout65);
    obj.edit77:setAlign("left");
    obj.edit77:setWidth(290);
    obj.edit77:setField("passado");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setName("edit77");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout64);
    obj.layout66:setAlign("left");
    obj.layout66:setWidth(380);
    obj.layout66:setMargins({right=10});
    obj.layout66:setName("layout66");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout66);
    obj.label101:setAlign("left");
    obj.label101:setWidth(90);
    obj.label101:setText("IDADE");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.edit78 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout66);
    obj.edit78:setAlign("left");
    obj.edit78:setWidth(290);
    obj.edit78:setField("idade");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setName("edit78");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout64);
    obj.layout67:setAlign("left");
    obj.layout67:setWidth(380);
    obj.layout67:setMargins({right=10});
    obj.layout67:setName("layout67");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout67);
    obj.label102:setAlign("left");
    obj.label102:setWidth(90);
    obj.label102:setText("OLHOS");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.edit79 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout67);
    obj.edit79:setAlign("left");
    obj.edit79:setWidth(290);
    obj.edit79:setField("aparenciaOlhos");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setName("edit79");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle22);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout68);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(380);
    obj.layout69:setMargins({right=10});
    obj.layout69:setName("layout69");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout69);
    obj.label103:setAlign("left");
    obj.label103:setWidth(90);
    obj.label103:setText("ALTURA");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.edit80 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout69);
    obj.edit80:setAlign("left");
    obj.edit80:setWidth(290);
    obj.edit80:setField("altura");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setName("edit80");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout68);
    obj.layout70:setAlign("left");
    obj.layout70:setWidth(380);
    obj.layout70:setMargins({right=10});
    obj.layout70:setName("layout70");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout70);
    obj.label104:setAlign("left");
    obj.label104:setWidth(90);
    obj.label104:setText("GÊNERO");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.edit81 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout70);
    obj.edit81:setAlign("left");
    obj.edit81:setWidth(290);
    obj.edit81:setField("genero");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setName("edit81");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout68);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(380);
    obj.layout71:setMargins({right=10});
    obj.layout71:setName("layout71");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout71);
    obj.label105:setAlign("left");
    obj.label105:setWidth(90);
    obj.label105:setText("PELE");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.edit82 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout71);
    obj.edit82:setAlign("left");
    obj.edit82:setWidth(290);
    obj.edit82:setField("pele");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setName("edit82");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle22);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout72);
    obj.layout73:setAlign("left");
    obj.layout73:setWidth(380);
    obj.layout73:setMargins({right=10});
    obj.layout73:setName("layout73");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout73);
    obj.label106:setAlign("left");
    obj.label106:setWidth(90);
    obj.label106:setText("PESO");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.edit83 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout73);
    obj.edit83:setAlign("left");
    obj.edit83:setWidth(290);
    obj.edit83:setField("peso");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setName("edit83");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout72);
    obj.layout74:setAlign("left");
    obj.layout74:setWidth(380);
    obj.layout74:setMargins({right=10});
    obj.layout74:setName("layout74");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout74);
    obj.label107:setAlign("left");
    obj.label107:setWidth(90);
    obj.label107:setText("OUTROS");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.edit84 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout74);
    obj.edit84:setAlign("left");
    obj.edit84:setWidth(290);
    obj.edit84:setField("aparenciaOutros");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setName("edit84");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout72);
    obj.layout75:setAlign("left");
    obj.layout75:setWidth(380);
    obj.layout75:setMargins({right=10});
    obj.layout75:setName("layout75");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout75);
    obj.label108:setAlign("left");
    obj.label108:setWidth(90);
    obj.label108:setText("CABELO");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.edit85 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout75);
    obj.edit85:setAlign("left");
    obj.edit85:setWidth(290);
    obj.edit85:setField("cabelo");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setName("edit85");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.scrollBox6);
    obj.layout76:setLeft(0);
    obj.layout76:setTop(110);
    obj.layout76:setWidth(375);
    obj.layout76:setHeight(240);
    obj.layout76:setName("layout76");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout76);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("black");
    obj.rectangle23:setName("rectangle23");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout76);
    obj.label109:setLeft(5);
    obj.label109:setTop(1);
    obj.label109:setWidth(100);
    obj.label109:setHeight(20);
    obj.label109:setText("AMBIÇÕES");
    obj.label109:setName("label109");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout76);
    obj.textEditor9:setLeft(5);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(365);
    obj.textEditor9:setHeight(210);
    obj.textEditor9:setField("ambition");
    obj.textEditor9:setName("textEditor9");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.scrollBox6);
    obj.layout77:setLeft(0);
    obj.layout77:setTop(355);
    obj.layout77:setWidth(375);
    obj.layout77:setHeight(250);
    obj.layout77:setName("layout77");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout77);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setName("rectangle24");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout77);
    obj.label110:setLeft(5);
    obj.label110:setTop(1);
    obj.label110:setWidth(100);
    obj.label110:setHeight(20);
    obj.label110:setText("GRUPO");
    obj.label110:setName("label110");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout77);
    obj.textEditor10:setLeft(5);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(365);
    obj.textEditor10:setHeight(220);
    obj.textEditor10:setField("party");
    obj.textEditor10:setName("textEditor10");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.scrollBox6);
    obj.layout78:setLeft(380);
    obj.layout78:setTop(110);
    obj.layout78:setWidth(825);
    obj.layout78:setHeight(495);
    obj.layout78:setName("layout78");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout78);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setName("rectangle25");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout78);
    obj.label111:setLeft(5);
    obj.label111:setTop(1);
    obj.label111:setWidth(100);
    obj.label111:setHeight(20);
    obj.label111:setText("HISTORIA");
    obj.label111:setName("label111");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout78);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Anotações");
    obj.tab7:setName("tab7");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab7);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmTemplateNotes);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.scrollBox7);
    obj.layout79:setAlign("left");
    obj.layout79:setWidth(400);
    obj.layout79:setMargins({right=10});
    obj.layout79:setName("layout79");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout79);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setXradius(5);
    obj.rectangle26:setYradius(15);
    obj.rectangle26:setCornerType("round");
    obj.rectangle26:setName("rectangle26");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle26);
    obj.label112:setAlign("top");
    obj.label112:setHeight(20);
    obj.label112:setText("Anotações");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle26);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("anotacoes1");
    obj.textEditor11:setMargins({left=10,right=10,bottom=10});
    obj.textEditor11:setName("textEditor11");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.scrollBox7);
    obj.layout80:setAlign("left");
    obj.layout80:setWidth(400);
    obj.layout80:setMargins({right=10});
    obj.layout80:setName("layout80");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout80);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("black");
    obj.rectangle27:setXradius(5);
    obj.rectangle27:setYradius(15);
    obj.rectangle27:setCornerType("round");
    obj.rectangle27:setName("rectangle27");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle27);
    obj.label113:setAlign("top");
    obj.label113:setHeight(20);
    obj.label113:setText("Anotações");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle27);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("anotacoes2");
    obj.textEditor12:setMargins({left=10,right=10,bottom=10});
    obj.textEditor12:setName("textEditor12");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.scrollBox7);
    obj.layout81:setAlign("left");
    obj.layout81:setWidth(400);
    obj.layout81:setMargins({right=10});
    obj.layout81:setName("layout81");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout81);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(15);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.rectangle28);
    obj.label114:setAlign("top");
    obj.label114:setHeight(20);
    obj.label114:setText("Anotações");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.rectangle28);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setField("anotacoes3");
    obj.textEditor13:setMargins({left=10,right=10,bottom=10});
    obj.textEditor13:setName("textEditor13");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Creditos");
    obj.tab8:setName("tab8");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab8);
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

		


    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmTemplateCreditos);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox8);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(500);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/WarhammerFantasy/images/Bretonnia.jpg");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox8);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/WarhammerFantasy/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox8);
    obj.layout82:setLeft(850);
    obj.layout82:setTop(0);
    obj.layout82:setWidth(200);
    obj.layout82:setHeight(160);
    obj.layout82:setName("layout82");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout82);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(15);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout82);
    obj.label115:setLeft(0);
    obj.label115:setTop(10);
    obj.label115:setWidth(200);
    obj.label115:setHeight(20);
    obj.label115:setText("Plugin feito por: ");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout82);
    obj.label116:setLeft(0);
    obj.label116:setTop(35);
    obj.label116:setWidth(200);
    obj.label116:setHeight(20);
    obj.label116:setText("Vinny (Ambesek)");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout82);
    obj.label117:setLeft(0);
    obj.label117:setTop(60);
    obj.label117:setWidth(200);
    obj.label117:setHeight(20);
    obj.label117:setText("Consultor: NinjaKai");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.scrollBox8);
    obj.layout83:setLeft(850);
    obj.layout83:setTop(170);
    obj.layout83:setWidth(200);
    obj.layout83:setHeight(150);
    obj.layout83:setName("layout83");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout83);
    obj.rectangle30:setLeft(0);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(200);
    obj.rectangle30:setHeight(150);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout83);
    obj.label118:setLeft(0);
    obj.label118:setTop(10);
    obj.label118:setWidth(80);
    obj.label118:setHeight(20);
    obj.label118:setText("Tema:");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout83);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout83);
    obj.dataLink21:setField("theme");
    obj.dataLink21:setDefaultValue("Escuro");
    obj.dataLink21:setName("dataLink21");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout83);
    obj.label119:setLeft(0);
    obj.label119:setTop(35);
    obj.label119:setWidth(90);
    obj.label119:setHeight(20);
    obj.label119:setText("Cores: ");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout83);
    obj.label120:setLeft(0);
    obj.label120:setTop(60);
    obj.label120:setWidth(90);
    obj.label120:setHeight(20);
    obj.label120:setText("Fundo ");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout83);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout83);
    obj.dataLink22:setField("colorBackground");
    obj.dataLink22:setDefaultValue("#000000");
    obj.dataLink22:setName("dataLink22");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout83);
    obj.label121:setLeft(0);
    obj.label121:setTop(85);
    obj.label121:setWidth(90);
    obj.label121:setHeight(20);
    obj.label121:setText("Linhas ");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout83);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout83);
    obj.dataLink23:setField("colorStroke");
    obj.dataLink23:setDefaultValue("#FFFFFF");
    obj.dataLink23:setName("dataLink23");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout83);
    obj.label122:setLeft(0);
    obj.label122:setTop(110);
    obj.label122:setWidth(90);
    obj.label122:setHeight(20);
    obj.label122:setText("Fonte ");
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout83);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout83);
    obj.dataLink24:setField("colorFont");
    obj.dataLink24:setDefaultValue("#FFFFFF");
    obj.dataLink24:setName("dataLink24");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.scrollBox8);
    obj.label123:setLeft(555);
    obj.label123:setTop(275);
    obj.label123:setWidth(200);
    obj.label123:setHeight(20);
    obj.label123:setText("Versão Atual: ");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setField("versionInstalled");
    obj.label123:setName("label123");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.scrollBox8);
    obj.label124:setLeft(555);
    obj.label124:setTop(300);
    obj.label124:setWidth(200);
    obj.label124:setHeight(20);
    obj.label124:setText("Sua Versão: ");
    obj.label124:setHorzTextAlign("center");
    obj.label124:setField("versionDownloaded");
    obj.label124:setName("label124");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox8);
    obj.checkBox1:setLeft(555);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox8);
    obj.button8:setLeft(555);
    obj.button8:setTop(350);
    obj.button8:setWidth(100);
    obj.button8:setText("Change Log");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox8);
    obj.button9:setLeft(667);
    obj.button9:setTop(350);
    obj.button9:setWidth(100);
    obj.button9:setText("Atualizar");
    obj.button9:setName("button9");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.scrollBox8);
    obj.label125:setLeft(555);
    obj.label125:setTop(400);
    obj.label125:setWidth(200);
    obj.label125:setHeight(20);
    obj.label125:setText("Conheça as Mesas:");
    obj.label125:setName("label125");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox8);
    obj.button10:setLeft(555);
    obj.button10:setTop(425);
    obj.button10:setWidth(100);
    obj.button10:setText("RPGmeister");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox8);
    obj.button11:setLeft(667);
    obj.button11:setTop(425);
    obj.button11:setWidth(100);
    obj.button11:setText("WF: Bretonnia");
    obj.button11:setName("button11");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.scrollBox8);
    obj.button12:setLeft(555);
    obj.button12:setTop(450);
    obj.button12:setWidth(100);
    obj.button12:setHeight(20);
    obj.button12:setText("Exportar Ficha");
    obj.button12:setName("button12");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.scrollBox8);
    obj.button13:setLeft(667);
    obj.button13:setTop(450);
    obj.button13:setWidth(100);
    obj.button13:setHeight(20);
    obj.button13:setText("Importar Ficha");
    obj.button13:setName("button13");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Warhammer%20Fantasy/output/Ficha%20Warhammer%20Fantasy.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Warhammer%20Fantasy/output/Ficha%20Warhammer%20Fantasy.rpk?raw=true');
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

    obj._e_event1 = obj:addEventListener("onNodeReady",
        function (_)
            if sheet==nil then return end;
                    
                    if sheet.campoDasPericias == nil then
                        sheet.campoDasPericias = {}
                    end
            
                    local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
                    if #nodes == 0 then
                        local skills = {"Artes", "Atletismo", "Suborno", "Charme", "Charme para Animais", "Escalar", "Calmo", "Resistencia ao Alcool", "Esquiva", "Dirigir", "Tenacidade", "Entretenimento", "Apostar", "Fofoca", "Pechinchar", "Intimidação", "Intuição", "Liderança", "Corpo a corpo (Basico)", "Corpo a corpo", "Navegação", "Sobrevivencia na Natureza", "Percepção", "Cavalgar", "Remar", "Furtividade"}
                        local keys = {"dex", "ag", "fel", "fel", "wp", "s", "wp", "t", "ag", "ag", "t", "fel", "int", "fel", "fel", "s", "i", "fel", "ws", "ws", "i", "int", "i", "ag", "s", "ag"}
            
                        for i=1, #skills, 1 do
                            local node = self.campoDasPericias:append();
                            if node~= nil then
                                node.wsTotal = sheet.wsTotal
                                node.bsTotal = sheet.bsTotal
                                node.sTotal = sheet.sTotal
                                node.tTotal = sheet.tTotal
                                node.iTotal = sheet.iTotal
                                node.agTotal = sheet.agTotal
                                node.dexTotal = sheet.dexTotal
                                node.intTotal = sheet.intTotal
                                node.wpTotal = sheet.wpTotal
                                node.felTotal = sheet.felTotal
                                node.nome = skills[i]
                                node.key = keys[i]
                            end
                        end
                    end
            
                    self.campoDasPericias:sort();
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.wsTotal = tonumber(sheet.wsInitial or 0) +
                                                tonumber(sheet.wsAdvances or 0)
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].wsTotal = sheet.wsTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].wsTotal = sheet.wsTotal
            		                end
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.bsTotal = tonumber(sheet.bsInitial or 0) +
                                                tonumber(sheet.bsAdvances or 0)
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].bsTotal = sheet.bsTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].bsTotal = sheet.bsTotal
            		                end
        end, obj);

    obj._e_event6 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.sTotal = tonumber(sheet.sInitial or 0) +
                                                tonumber(sheet.sAdvances or 0)
        end, obj);

    obj._e_event7 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].sTotal = sheet.sTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].sTotal = sheet.sTotal
            		                end
        end, obj);

    obj._e_event8 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.tTotal = tonumber(sheet.tInitial or 0) +
                                                tonumber(sheet.tAdvances or 0)
        end, obj);

    obj._e_event9 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].tTotal = sheet.tTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].tTotal = sheet.tTotal
            		                end
        end, obj);

    obj._e_event10 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.iTotal = tonumber(sheet.iInitial or 0) +
                                                tonumber(sheet.iAdvances or 0)
        end, obj);

    obj._e_event11 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].iTotal = sheet.iTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].iTotal = sheet.iTotal
            		                end
        end, obj);

    obj._e_event12 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.agTotal = tonumber(sheet.agInitial or 0) +
                                                tonumber(sheet.agAdvances or 0)
        end, obj);

    obj._e_event13 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].agTotal = sheet.agTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].agTotal = sheet.agTotal
            		                end
        end, obj);

    obj._e_event14 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.dexTotal = tonumber(sheet.dexInitial or 0) +
                                                tonumber(sheet.dexAdvances or 0)
        end, obj);

    obj._e_event15 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].dexTotal = sheet.dexTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].dexTotal = sheet.dexTotal
            		                end
        end, obj);

    obj._e_event16 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.intTotal = tonumber(sheet.intInitial or 0) +
                                                tonumber(sheet.intAdvances or 0)
        end, obj);

    obj._e_event17 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].intTotal = sheet.intTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].intTotal = sheet.intTotal
            		                end
        end, obj);

    obj._e_event18 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.wpTotal = tonumber(sheet.wpInitial or 0) +
                                                tonumber(sheet.wpAdvances or 0)
        end, obj);

    obj._e_event19 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].wpTotal = sheet.wpTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].wpTotal = sheet.wpTotal
            		                end
        end, obj);

    obj._e_event20 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                                sheet.felTotal = tonumber(sheet.felInitial or 0) +
                                                tonumber(sheet.felAdvances or 0)
        end, obj);

    obj._e_event21 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            -- Update custom skills atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].felTotal = sheet.felTotal
            		                end
            
            		                -- Update custom attacks atr
            		                local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            		                for i=1, #nodes, 1 do
            		                    nodes[i].felTotal = sheet.felTotal
            		                end
        end, obj);

    obj._e_event22 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event23 = obj.button1:addEventListener("onClick",
        function (_)
            local node = self.campoDasPericias:append();
            
            						if node~= nil and ("campoDasPericias" == "campoDasPericias" or "campoDasPericias" == "campoDasPericiasAvancadas") then
            	                        node.wsTotal = sheet.wsTotal
            	                        node.bsTotal = sheet.bsTotal
            	                        node.sTotal = sheet.sTotal
            	                        node.tTotal = sheet.tTotal
            	                        node.iTotal = sheet.iTotal
            	                        node.agTotal = sheet.agTotal
            	                        node.dexTotal = sheet.dexTotal
            	                        node.intTotal = sheet.intTotal
            	                        node.wpTotal = sheet.wpTotal
            	                        node.felTotal = sheet.felTotal
            						end
        end, obj);

    obj._e_event24 = obj.campoDasPericias:addEventListener("onResize",
        function (_)
            self.campoDasPericiasPart._recalcHeight();
        end, obj);

    obj._e_event25 = obj.campoDasPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event26 = obj.campoDasPericias:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            					
            					if "campoDasPericias" == "campoDasPericias" then
            						if sheet.campoDasPericias == nil then
            							sheet.campoDasPericias = {}
            						end
            
            						local nodes = NDB.getChildNodes(sheet.campoDasPericias); 
            						if #nodes > 0 then return end;
            
            						local skills = {"Artes", "Atletismo", "Suborno", "Charme", "Charme para Animais", "Escalar", "Calmo", "Resistencia ao Alcool", "Esquiva", "Dirigir", "Tenacidade", "Entretenimento", "Apostar", "Fofoca", "Pechinchar", "Intimidação", "Intuição", "Liderança", "Corpo a corpo (Basico)", "Corpo a corpo", "Navegação", "Sobrevivencia na Natureza", "Percepção", "Cavalgar", "Remar", "Furtividade"}
            						local keys = {"dex", "ag", "fel", "fel", "wp", "s", "wp", "t", "ag", "ag", "t", "fel", "int", "fel", "fel", "s", "i", "fel", "ws", "ws", "i", "int", "i", "ag", "s", "ag"}
            
            						for i=1, #skills, 1 do
            							local node = self.campoDasPericias:append();
            							if node~= nil then
            		                        node.wsTotal = sheet.wsTotal
            		                        node.bsTotal = sheet.bsTotal
            		                        node.sTotal = sheet.sTotal
            		                        node.tTotal = sheet.tTotal
            		                        node.iTotal = sheet.iTotal
            		                        node.agTotal = sheet.agTotal
            		                        node.dexTotal = sheet.dexTotal
            		                        node.intTotal = sheet.intTotal
            		                        node.wpTotal = sheet.wpTotal
            		                        node.felTotal = sheet.felTotal
            		                        node.nome = skills[i]
            		                        node.key = keys[i]
            							end
            						end
            
            						self.campoDasPericias:sort();
            					end
        end, obj);

    obj._e_event27 = obj.button2:addEventListener("onClick",
        function (_)
            local node = self.campoDasPericiasAvancadas:append();
            
            						if node~= nil and ("campoDasPericiasAvancadas" == "campoDasPericias" or "campoDasPericiasAvancadas" == "campoDasPericiasAvancadas") then
            	                        node.wsTotal = sheet.wsTotal
            	                        node.bsTotal = sheet.bsTotal
            	                        node.sTotal = sheet.sTotal
            	                        node.tTotal = sheet.tTotal
            	                        node.iTotal = sheet.iTotal
            	                        node.agTotal = sheet.agTotal
            	                        node.dexTotal = sheet.dexTotal
            	                        node.intTotal = sheet.intTotal
            	                        node.wpTotal = sheet.wpTotal
            	                        node.felTotal = sheet.felTotal
            						end
        end, obj);

    obj._e_event28 = obj.campoDasPericiasAvancadas:addEventListener("onResize",
        function (_)
            self.campoDasPericiasAvancadasPart._recalcHeight();
        end, obj);

    obj._e_event29 = obj.campoDasPericiasAvancadas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event30 = obj.campoDasPericiasAvancadas:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            					
            					if "campoDasPericiasAvancadas" == "campoDasPericias" then
            						if sheet.campoDasPericiasAvancadas == nil then
            							sheet.campoDasPericiasAvancadas = {}
            						end
            
            						local nodes = NDB.getChildNodes(sheet.campoDasPericiasAvancadas); 
            						if #nodes > 0 then return end;
            
            						local skills = {"Artes", "Atletismo", "Suborno", "Charme", "Charme para Animais", "Escalar", "Calmo", "Resistencia ao Alcool", "Esquiva", "Dirigir", "Tenacidade", "Entretenimento", "Apostar", "Fofoca", "Pechinchar", "Intimidação", "Intuição", "Liderança", "Corpo a corpo (Basico)", "Corpo a corpo", "Navegação", "Sobrevivencia na Natureza", "Percepção", "Cavalgar", "Remar", "Furtividade"}
            						local keys = {"dex", "ag", "fel", "fel", "wp", "s", "wp", "t", "ag", "ag", "t", "fel", "int", "fel", "fel", "s", "i", "fel", "ws", "ws", "i", "int", "i", "ag", "s", "ag"}
            
            						for i=1, #skills, 1 do
            							local node = self.campoDasPericiasAvancadas:append();
            							if node~= nil then
            		                        node.wsTotal = sheet.wsTotal
            		                        node.bsTotal = sheet.bsTotal
            		                        node.sTotal = sheet.sTotal
            		                        node.tTotal = sheet.tTotal
            		                        node.iTotal = sheet.iTotal
            		                        node.agTotal = sheet.agTotal
            		                        node.dexTotal = sheet.dexTotal
            		                        node.intTotal = sheet.intTotal
            		                        node.wpTotal = sheet.wpTotal
            		                        node.felTotal = sheet.felTotal
            		                        node.nome = skills[i]
            		                        node.key = keys[i]
            							end
            						end
            
            						self.campoDasPericiasAvancadas:sort();
            					end
        end, obj);

    obj._e_event31 = obj.button3:addEventListener("onClick",
        function (_)
            local node = self.campoDosTalentos:append();
            
            						if node~= nil and ("campoDosTalentos" == "campoDasPericias" or "campoDosTalentos" == "campoDasPericiasAvancadas") then
            	                        node.wsTotal = sheet.wsTotal
            	                        node.bsTotal = sheet.bsTotal
            	                        node.sTotal = sheet.sTotal
            	                        node.tTotal = sheet.tTotal
            	                        node.iTotal = sheet.iTotal
            	                        node.agTotal = sheet.agTotal
            	                        node.dexTotal = sheet.dexTotal
            	                        node.intTotal = sheet.intTotal
            	                        node.wpTotal = sheet.wpTotal
            	                        node.felTotal = sheet.felTotal
            						end
        end, obj);

    obj._e_event32 = obj.campoDosTalentos:addEventListener("onResize",
        function (_)
            self.campoDosTalentosPart._recalcHeight();
        end, obj);

    obj._e_event33 = obj.campoDosTalentos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event34 = obj.campoDosTalentos:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            					
            					if "campoDosTalentos" == "campoDasPericias" then
            						if sheet.campoDosTalentos == nil then
            							sheet.campoDosTalentos = {}
            						end
            
            						local nodes = NDB.getChildNodes(sheet.campoDosTalentos); 
            						if #nodes > 0 then return end;
            
            						local skills = {"Artes", "Atletismo", "Suborno", "Charme", "Charme para Animais", "Escalar", "Calmo", "Resistencia ao Alcool", "Esquiva", "Dirigir", "Tenacidade", "Entretenimento", "Apostar", "Fofoca", "Pechinchar", "Intimidação", "Intuição", "Liderança", "Corpo a corpo (Basico)", "Corpo a corpo", "Navegação", "Sobrevivencia na Natureza", "Percepção", "Cavalgar", "Remar", "Furtividade"}
            						local keys = {"dex", "ag", "fel", "fel", "wp", "s", "wp", "t", "ag", "ag", "t", "fel", "int", "fel", "fel", "s", "i", "fel", "ws", "ws", "i", "int", "i", "ag", "s", "ag"}
            
            						for i=1, #skills, 1 do
            							local node = self.campoDosTalentos:append();
            							if node~= nil then
            		                        node.wsTotal = sheet.wsTotal
            		                        node.bsTotal = sheet.bsTotal
            		                        node.sTotal = sheet.sTotal
            		                        node.tTotal = sheet.tTotal
            		                        node.iTotal = sheet.iTotal
            		                        node.agTotal = sheet.agTotal
            		                        node.dexTotal = sheet.dexTotal
            		                        node.intTotal = sheet.intTotal
            		                        node.wpTotal = sheet.wpTotal
            		                        node.felTotal = sheet.felTotal
            		                        node.nome = skills[i]
            		                        node.key = keys[i]
            							end
            						end
            
            						self.campoDosTalentos:sort();
            					end
        end, obj);

    obj._e_event35 = obj.button4:addEventListener("onClick",
        function (_)
            local node = self.campoDasMagias:append();
            
            						if node~= nil and ("campoDasMagias" == "campoDasPericias" or "campoDasMagias" == "campoDasPericiasAvancadas") then
            	                        node.wsTotal = sheet.wsTotal
            	                        node.bsTotal = sheet.bsTotal
            	                        node.sTotal = sheet.sTotal
            	                        node.tTotal = sheet.tTotal
            	                        node.iTotal = sheet.iTotal
            	                        node.agTotal = sheet.agTotal
            	                        node.dexTotal = sheet.dexTotal
            	                        node.intTotal = sheet.intTotal
            	                        node.wpTotal = sheet.wpTotal
            	                        node.felTotal = sheet.felTotal
            						end
        end, obj);

    obj._e_event36 = obj.campoDasMagias:addEventListener("onResize",
        function (_)
            self.campoDasMagiasPart._recalcHeight();
        end, obj);

    obj._e_event37 = obj.campoDasMagias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event38 = obj.campoDasMagias:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            					
            					if "campoDasMagias" == "campoDasPericias" then
            						if sheet.campoDasMagias == nil then
            							sheet.campoDasMagias = {}
            						end
            
            						local nodes = NDB.getChildNodes(sheet.campoDasMagias); 
            						if #nodes > 0 then return end;
            
            						local skills = {"Artes", "Atletismo", "Suborno", "Charme", "Charme para Animais", "Escalar", "Calmo", "Resistencia ao Alcool", "Esquiva", "Dirigir", "Tenacidade", "Entretenimento", "Apostar", "Fofoca", "Pechinchar", "Intimidação", "Intuição", "Liderança", "Corpo a corpo (Basico)", "Corpo a corpo", "Navegação", "Sobrevivencia na Natureza", "Percepção", "Cavalgar", "Remar", "Furtividade"}
            						local keys = {"dex", "ag", "fel", "fel", "wp", "s", "wp", "t", "ag", "ag", "t", "fel", "int", "fel", "fel", "s", "i", "fel", "ws", "ws", "i", "int", "i", "ag", "s", "ag"}
            
            						for i=1, #skills, 1 do
            							local node = self.campoDasMagias:append();
            							if node~= nil then
            		                        node.wsTotal = sheet.wsTotal
            		                        node.bsTotal = sheet.bsTotal
            		                        node.sTotal = sheet.sTotal
            		                        node.tTotal = sheet.tTotal
            		                        node.iTotal = sheet.iTotal
            		                        node.agTotal = sheet.agTotal
            		                        node.dexTotal = sheet.dexTotal
            		                        node.intTotal = sheet.intTotal
            		                        node.wpTotal = sheet.wpTotal
            		                        node.felTotal = sheet.felTotal
            		                        node.nome = skills[i]
            		                        node.key = keys[i]
            							end
            						end
            
            						self.campoDasMagias:sort();
            					end
        end, obj);

    obj._e_event39 = obj.button5:addEventListener("onClick",
        function (_)
            local node = self.campoDasArmaduras:append();
            
            						if node~= nil and ("campoDasArmaduras" == "campoDasPericias" or "campoDasArmaduras" == "campoDasPericiasAvancadas") then
            	                        node.wsTotal = sheet.wsTotal
            	                        node.bsTotal = sheet.bsTotal
            	                        node.sTotal = sheet.sTotal
            	                        node.tTotal = sheet.tTotal
            	                        node.iTotal = sheet.iTotal
            	                        node.agTotal = sheet.agTotal
            	                        node.dexTotal = sheet.dexTotal
            	                        node.intTotal = sheet.intTotal
            	                        node.wpTotal = sheet.wpTotal
            	                        node.felTotal = sheet.felTotal
            						end
        end, obj);

    obj._e_event40 = obj.campoDasArmaduras:addEventListener("onResize",
        function (_)
            self.campoDasArmadurasPart._recalcHeight();
        end, obj);

    obj._e_event41 = obj.campoDasArmaduras:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event42 = obj.campoDasArmaduras:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            					
            					if "campoDasArmaduras" == "campoDasPericias" then
            						if sheet.campoDasArmaduras == nil then
            							sheet.campoDasArmaduras = {}
            						end
            
            						local nodes = NDB.getChildNodes(sheet.campoDasArmaduras); 
            						if #nodes > 0 then return end;
            
            						local skills = {"Artes", "Atletismo", "Suborno", "Charme", "Charme para Animais", "Escalar", "Calmo", "Resistencia ao Alcool", "Esquiva", "Dirigir", "Tenacidade", "Entretenimento", "Apostar", "Fofoca", "Pechinchar", "Intimidação", "Intuição", "Liderança", "Corpo a corpo (Basico)", "Corpo a corpo", "Navegação", "Sobrevivencia na Natureza", "Percepção", "Cavalgar", "Remar", "Furtividade"}
            						local keys = {"dex", "ag", "fel", "fel", "wp", "s", "wp", "t", "ag", "ag", "t", "fel", "int", "fel", "fel", "s", "i", "fel", "ws", "ws", "i", "int", "i", "ag", "s", "ag"}
            
            						for i=1, #skills, 1 do
            							local node = self.campoDasArmaduras:append();
            							if node~= nil then
            		                        node.wsTotal = sheet.wsTotal
            		                        node.bsTotal = sheet.bsTotal
            		                        node.sTotal = sheet.sTotal
            		                        node.tTotal = sheet.tTotal
            		                        node.iTotal = sheet.iTotal
            		                        node.agTotal = sheet.agTotal
            		                        node.dexTotal = sheet.dexTotal
            		                        node.intTotal = sheet.intTotal
            		                        node.wpTotal = sheet.wpTotal
            		                        node.felTotal = sheet.felTotal
            		                        node.nome = skills[i]
            		                        node.key = keys[i]
            							end
            						end
            
            						self.campoDasArmaduras:sort();
            					end
        end, obj);

    obj._e_event43 = obj.button6:addEventListener("onClick",
        function (_)
            local node = self.campoDasArmadilhas:append();
            
            						if node~= nil and ("campoDasArmadilhas" == "campoDasPericias" or "campoDasArmadilhas" == "campoDasPericiasAvancadas") then
            	                        node.wsTotal = sheet.wsTotal
            	                        node.bsTotal = sheet.bsTotal
            	                        node.sTotal = sheet.sTotal
            	                        node.tTotal = sheet.tTotal
            	                        node.iTotal = sheet.iTotal
            	                        node.agTotal = sheet.agTotal
            	                        node.dexTotal = sheet.dexTotal
            	                        node.intTotal = sheet.intTotal
            	                        node.wpTotal = sheet.wpTotal
            	                        node.felTotal = sheet.felTotal
            						end
        end, obj);

    obj._e_event44 = obj.campoDasArmadilhas:addEventListener("onResize",
        function (_)
            self.campoDasArmadilhasPart._recalcHeight();
        end, obj);

    obj._e_event45 = obj.campoDasArmadilhas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event46 = obj.campoDasArmadilhas:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            					
            					if "campoDasArmadilhas" == "campoDasPericias" then
            						if sheet.campoDasArmadilhas == nil then
            							sheet.campoDasArmadilhas = {}
            						end
            
            						local nodes = NDB.getChildNodes(sheet.campoDasArmadilhas); 
            						if #nodes > 0 then return end;
            
            						local skills = {"Artes", "Atletismo", "Suborno", "Charme", "Charme para Animais", "Escalar", "Calmo", "Resistencia ao Alcool", "Esquiva", "Dirigir", "Tenacidade", "Entretenimento", "Apostar", "Fofoca", "Pechinchar", "Intimidação", "Intuição", "Liderança", "Corpo a corpo (Basico)", "Corpo a corpo", "Navegação", "Sobrevivencia na Natureza", "Percepção", "Cavalgar", "Remar", "Furtividade"}
            						local keys = {"dex", "ag", "fel", "fel", "wp", "s", "wp", "t", "ag", "ag", "t", "fel", "int", "fel", "fel", "s", "i", "fel", "ws", "ws", "i", "int", "i", "ag", "s", "ag"}
            
            						for i=1, #skills, 1 do
            							local node = self.campoDasArmadilhas:append();
            							if node~= nil then
            		                        node.wsTotal = sheet.wsTotal
            		                        node.bsTotal = sheet.bsTotal
            		                        node.sTotal = sheet.sTotal
            		                        node.tTotal = sheet.tTotal
            		                        node.iTotal = sheet.iTotal
            		                        node.agTotal = sheet.agTotal
            		                        node.dexTotal = sheet.dexTotal
            		                        node.intTotal = sheet.intTotal
            		                        node.wpTotal = sheet.wpTotal
            		                        node.felTotal = sheet.felTotal
            		                        node.nome = skills[i]
            		                        node.key = keys[i]
            							end
            						end
            
            						self.campoDasArmadilhas:sort();
            					end
        end, obj);

    obj._e_event47 = obj.button7:addEventListener("onClick",
        function (_)
            local node = self.campoDasArmas:append();
            
            						if node~= nil and ("campoDasArmas" == "campoDasPericias" or "campoDasArmas" == "campoDasPericiasAvancadas") then
            	                        node.wsTotal = sheet.wsTotal
            	                        node.bsTotal = sheet.bsTotal
            	                        node.sTotal = sheet.sTotal
            	                        node.tTotal = sheet.tTotal
            	                        node.iTotal = sheet.iTotal
            	                        node.agTotal = sheet.agTotal
            	                        node.dexTotal = sheet.dexTotal
            	                        node.intTotal = sheet.intTotal
            	                        node.wpTotal = sheet.wpTotal
            	                        node.felTotal = sheet.felTotal
            						end
        end, obj);

    obj._e_event48 = obj.campoDasArmas:addEventListener("onResize",
        function (_)
            self.campoDasArmasPart._recalcHeight();
        end, obj);

    obj._e_event49 = obj.campoDasArmas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event50 = obj.campoDasArmas:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            					
            					if "campoDasArmas" == "campoDasPericias" then
            						if sheet.campoDasArmas == nil then
            							sheet.campoDasArmas = {}
            						end
            
            						local nodes = NDB.getChildNodes(sheet.campoDasArmas); 
            						if #nodes > 0 then return end;
            
            						local skills = {"Artes", "Atletismo", "Suborno", "Charme", "Charme para Animais", "Escalar", "Calmo", "Resistencia ao Alcool", "Esquiva", "Dirigir", "Tenacidade", "Entretenimento", "Apostar", "Fofoca", "Pechinchar", "Intimidação", "Intuição", "Liderança", "Corpo a corpo (Basico)", "Corpo a corpo", "Navegação", "Sobrevivencia na Natureza", "Percepção", "Cavalgar", "Remar", "Furtividade"}
            						local keys = {"dex", "ag", "fel", "fel", "wp", "s", "wp", "t", "ag", "ag", "t", "fel", "int", "fel", "fel", "s", "i", "fel", "ws", "ws", "i", "int", "i", "ag", "s", "ag"}
            
            						for i=1, #skills, 1 do
            							local node = self.campoDasArmas:append();
            							if node~= nil then
            		                        node.wsTotal = sheet.wsTotal
            		                        node.bsTotal = sheet.bsTotal
            		                        node.sTotal = sheet.sTotal
            		                        node.tTotal = sheet.tTotal
            		                        node.iTotal = sheet.iTotal
            		                        node.agTotal = sheet.agTotal
            		                        node.dexTotal = sheet.dexTotal
            		                        node.intTotal = sheet.intTotal
            		                        node.wpTotal = sheet.wpTotal
            		                        node.felTotal = sheet.felTotal
            		                        node.nome = skills[i]
            		                        node.key = keys[i]
            							end
            						end
            
            						self.campoDasArmas:sort();
            					end
        end, obj);

    obj._e_event51 = obj.dataLink21:addEventListener("onChange",
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

    obj._e_event52 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event53 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event54 = obj.dataLink24:addEventListener("onChange",
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

    obj._e_event55 = obj.button8:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Warhammer%20Fantasy/README.md')
        end, obj);

    obj._e_event56 = obj.button9:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Warhammer%20Fantasy/output/Ficha%20Warhammer%20Fantasy.rpk?raw=true')
        end, obj);

    obj._e_event57 = obj.button10:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event58 = obj.button11:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecast.app/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=90415');
        end, obj);

    obj._e_event59 = obj.button12:addEventListener("onClick",
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

    obj._e_event60 = obj.button13:addEventListener("onClick",
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
        if self.campoDasArmadurasPart ~= nil then self.campoDasArmadurasPart:destroy(); self.campoDasArmadurasPart = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.popHabilidade ~= nil then self.popHabilidade:destroy(); self.popHabilidade = nil; end;
        if self.campoDosTalentos ~= nil then self.campoDosTalentos:destroy(); self.campoDosTalentos = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.campoDasPericiasAvancadasPart ~= nil then self.campoDasPericiasAvancadasPart:destroy(); self.campoDasPericiasAvancadasPart = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.campoDasArmasPart ~= nil then self.campoDasArmasPart:destroy(); self.campoDasArmasPart = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
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
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.campoDasPericias ~= nil then self.campoDasPericias:destroy(); self.campoDasPericias = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
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
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.flowPart15 ~= nil then self.flowPart15:destroy(); self.flowPart15 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
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
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.flowPart18 ~= nil then self.flowPart18:destroy(); self.flowPart18 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.campoDasArmas ~= nil then self.campoDasArmas:destroy(); self.campoDasArmas = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.popArma ~= nil then self.popArma:destroy(); self.popArma = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.frmPericias ~= nil then self.frmPericias:destroy(); self.frmPericias = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.frmAvatar ~= nil then self.frmAvatar:destroy(); self.frmAvatar = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.campoDasArmadilhas ~= nil then self.campoDasArmadilhas:destroy(); self.campoDasArmadilhas = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.flowPart16 ~= nil then self.flowPart16:destroy(); self.flowPart16 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.frmEquipamentos ~= nil then self.frmEquipamentos:destroy(); self.frmEquipamentos = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.campoDosTalentosPart ~= nil then self.campoDosTalentosPart:destroy(); self.campoDosTalentosPart = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.campoDasPericiasAvancadas ~= nil then self.campoDasPericiasAvancadas:destroy(); self.campoDasPericiasAvancadas = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
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
        if self.frmMagias ~= nil then self.frmMagias:destroy(); self.frmMagias = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.campoDasMagiasPart ~= nil then self.campoDasMagiasPart:destroy(); self.campoDasMagiasPart = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.popArmadilha ~= nil then self.popArmadilha:destroy(); self.popArmadilha = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.campoDasArmaduras ~= nil then self.campoDasArmaduras:destroy(); self.campoDasArmaduras = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.flowPart14 ~= nil then self.flowPart14:destroy(); self.flowPart14 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.frmHabilidades ~= nil then self.frmHabilidades:destroy(); self.frmHabilidades = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.campoDasPericiasPart ~= nil then self.campoDasPericiasPart:destroy(); self.campoDasPericiasPart = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.campoDasArmadilhasPart ~= nil then self.campoDasArmadilhasPart:destroy(); self.campoDasArmadilhasPart = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.campoDasMagias ~= nil then self.campoDasMagias:destroy(); self.campoDasMagias = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.flowPart17 ~= nil then self.flowPart17:destroy(); self.flowPart17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.popArmadura ~= nil then self.popArmadura:destroy(); self.popArmadura = nil; end;
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
    dataType = "Ambesek.Warhammer.Fantasy", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Warhammer Fantasy", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);
Firecast.registrarDataType(_frmMain);

return _frmMain;
