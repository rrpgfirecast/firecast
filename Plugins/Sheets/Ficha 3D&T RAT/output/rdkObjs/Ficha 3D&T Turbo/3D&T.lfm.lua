require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frm3DeT()
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
    obj:setName("frm3DeT");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.3DeT");
    obj:setTitle("Ficha 3D&T Turbo");
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

    obj.frmGeral = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeral:setParent(obj.tab1);
    obj.frmGeral:setName("frmGeral");
    obj.frmGeral:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(65);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("right");
    obj.rectangle2:setWidth(55);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setMargins({top=5, bottom=5,right=5});
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setAlign("top");
    obj.label1:setHeight(25);
    obj.label1:setText("Pontos");
    obj.label1:setMargins({left=5,right=5});
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setAlign("top");
    obj.edit1:setHeight(25);
    obj.edit1:setField("pontos");
    obj.edit1:setMargins({left=5,right=5});
    obj.edit1:setName("edit1");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setAlign("right");
    obj.rectangle3:setWidth(55);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setMargins({top=5, bottom=5,right=5});
    obj.rectangle3:setName("rectangle3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle3);
    obj.label2:setAlign("top");
    obj.label2:setHeight(25);
    obj.label2:setText("XP");
    obj.label2:setMargins({left=5,right=5});
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle3);
    obj.edit2:setAlign("top");
    obj.edit2:setHeight(25);
    obj.edit2:setField("experiencia");
    obj.edit2:setMargins({left=5,right=5});
    obj.edit2:setName("edit2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setMargins({left=5,top=5});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(300);
    obj.layout3:setMargins({left=5});
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setAlign("left");
    obj.label3:setWidth(100);
    obj.label3:setText("Nome");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setAlign("client");
    obj.edit3:setField("nome");
    obj.edit3:setName("edit3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(300);
    obj.layout4:setMargins({left=5});
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setAlign("left");
    obj.label4:setWidth(100);
    obj.label4:setText("Kit");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setAlign("client");
    obj.edit4:setField("kit");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setAlign("right");
    obj.edit5:setWidth(30);
    obj.edit5:setField("kit_pts");
    obj.edit5:setName("edit5");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(25);
    obj.layout5:setMargins({left=5,top=5});
    obj.layout5:setName("layout5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(300);
    obj.layout6:setMargins({left=5});
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setAlign("left");
    obj.label5:setWidth(100);
    obj.label5:setText("Divindade");
    obj.label5:setName("label5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setAlign("client");
    obj.edit6:setField("divindade");
    obj.edit6:setName("edit6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout5);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(300);
    obj.layout7:setMargins({left=5});
    obj.layout7:setName("layout7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setAlign("left");
    obj.label6:setWidth(100);
    obj.label6:setText("Raça");
    obj.label6:setName("label6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout7);
    obj.edit7:setAlign("client");
    obj.edit7:setField("raca");
    obj.edit7:setName("edit7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(380);
    obj.layout8:setName("layout8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(705);
    obj.layout9:setName("layout9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(185);
    obj.layout10:setMargins({top=5});
    obj.layout10:setName("layout10");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout10);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(230);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle4:setName("rectangle4");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle4);
    obj.label7:setAlign("top");
    obj.label7:setHeight(25);
    obj.label7:setText("Características");
    obj.label7:setName("label7");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle4);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout11);
    obj.label8:setAlign("left");
    obj.label8:setWidth(100);
    obj.label8:setText("");
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout11);
    obj.label9:setAlign("left");
    obj.label9:setWidth(30);
    obj.label9:setText("Total");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontSize(11);
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout11);
    obj.label10:setAlign("left");
    obj.label10:setWidth(30);
    obj.label10:setText("Inicial");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontSize(11);
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout11);
    obj.label11:setAlign("left");
    obj.label11:setWidth(30);
    obj.label11:setText("XP");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(11);
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout11);
    obj.label12:setAlign("left");
    obj.label12:setWidth(30);
    obj.label12:setText("Outros");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(9);
    obj.label12:setName("label12");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle4);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout12);
    obj.label13:setAlign("left");
    obj.label13:setWidth(100);
    obj.label13:setText("Força");
    obj.label13:setName("label13");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout12);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle5);
    obj.label14:setAlign("client");
    obj.label14:setField("forTotal");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout12);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(30);
    obj.edit8:setField("forInicial");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout12);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(30);
    obj.edit9:setField("forXP");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout12);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(30);
    obj.edit10:setField("forOutros");
    obj.edit10:setName("edit10");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout12);
    obj.dataLink1:setFields({'forInicial', 'forXP', 'forOutros'});
    obj.dataLink1:setName("dataLink1");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle4);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setAlign("left");
    obj.label15:setWidth(100);
    obj.label15:setText("Habilidade");
    obj.label15:setName("label15");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout13);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle6);
    obj.label16:setAlign("client");
    obj.label16:setField("habTotal");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout13);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(30);
    obj.edit11:setField("habInicial");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(30);
    obj.edit12:setField("habXP");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(30);
    obj.edit13:setField("habOutros");
    obj.edit13:setName("edit13");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout13);
    obj.dataLink2:setFields({'habInicial', 'habXP', 'habOutros'});
    obj.dataLink2:setName("dataLink2");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle4);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout14);
    obj.label17:setAlign("left");
    obj.label17:setWidth(100);
    obj.label17:setText("Armadura");
    obj.label17:setName("label17");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout14);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle7);
    obj.label18:setAlign("client");
    obj.label18:setField("armTotal");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(30);
    obj.edit14:setField("armInicial");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout14);
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(30);
    obj.edit15:setField("armXP");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(30);
    obj.edit16:setField("armOutros");
    obj.edit16:setName("edit16");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout14);
    obj.dataLink3:setFields({'armInicial', 'armXP', 'armOutros'});
    obj.dataLink3:setName("dataLink3");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle4);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout15);
    obj.label19:setAlign("left");
    obj.label19:setWidth(100);
    obj.label19:setText("Resistência");
    obj.label19:setName("label19");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout15);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle8);
    obj.label20:setAlign("client");
    obj.label20:setField("resTotal");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout15);
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(30);
    obj.edit17:setField("resInicial");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setAlign("left");
    obj.edit18:setWidth(30);
    obj.edit18:setField("resXP");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout15);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(30);
    obj.edit19:setField("resOutros");
    obj.edit19:setName("edit19");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout15);
    obj.dataLink4:setFields({'resInicial', 'resXP', 'resOutros'});
    obj.dataLink4:setName("dataLink4");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle4);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout16);
    obj.label21:setAlign("left");
    obj.label21:setWidth(100);
    obj.label21:setText("Poder de Fogo");
    obj.label21:setName("label21");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout16);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle9);
    obj.label22:setAlign("client");
    obj.label22:setField("pdfTotal");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(30);
    obj.edit20:setField("pdfInicial");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout16);
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(30);
    obj.edit21:setField("pdfXP");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout16);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(30);
    obj.edit22:setField("pdfOutros");
    obj.edit22:setName("edit22");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout16);
    obj.dataLink5:setFields({'pdfInicial', 'pdfXP', 'pdfOutros'});
    obj.dataLink5:setName("dataLink5");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout10);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(230);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setMargins({left=5});
    obj.rectangle10:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle10:setName("rectangle10");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle10);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout17);
    obj.label23:setAlign("left");
    obj.label23:setWidth(90);
    obj.label23:setText("Iniciativa");
    obj.label23:setName("label23");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout17);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(30);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle11);
    obj.label24:setAlign("client");
    obj.label24:setField("iniTotal");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout17);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle12);
    obj.label25:setAlign("client");
    obj.label25:setField("habTotal");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout17);
    obj.edit23:setAlign("left");
    obj.edit23:setWidth(30);
    obj.edit23:setField("iniOutros");
    obj.edit23:setName("edit23");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout17);
    obj.dataLink6:setFields({'habTotal', 'iniOutros'});
    obj.dataLink6:setName("dataLink6");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle10);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setMargins({left=5});
    obj.layout18:setName("layout18");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout18);
    obj.label26:setAlign("left");
    obj.label26:setWidth(30);
    obj.label26:setText("PVs");
    obj.label26:setName("label26");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout18);
    obj.edit24:setAlign("client");
    obj.edit24:setField("pvs_pts");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout18);
    obj.edit25:setAlign("right");
    obj.edit25:setWidth(130);
    obj.edit25:setField("pvs_details");
    obj.edit25:setName("edit25");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle10);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setMargins({left=5});
    obj.layout19:setName("layout19");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout19);
    obj.label27:setAlign("left");
    obj.label27:setWidth(30);
    obj.label27:setText("PMs");
    obj.label27:setName("label27");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout19);
    obj.edit26:setAlign("client");
    obj.edit26:setField("pms_pts");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout19);
    obj.edit27:setAlign("right");
    obj.edit27:setWidth(130);
    obj.edit27:setField("pms_details");
    obj.edit27:setName("edit27");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle10);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout20);
    obj.label28:setAlign("left");
    obj.label28:setWidth(50);
    obj.label28:setText("");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout20);
    obj.label29:setAlign("left");
    obj.label29:setWidth(30);
    obj.label29:setText("Total");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setFontSize(11);
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout20);
    obj.label30:setAlign("left");
    obj.label30:setWidth(30);
    obj.label30:setText("Hab");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setFontSize(11);
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout20);
    obj.label31:setAlign("left");
    obj.label31:setWidth(30);
    obj.label31:setText("Atr");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setFontSize(11);
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout20);
    obj.label32:setAlign("left");
    obj.label32:setWidth(30);
    obj.label32:setText("Bônus");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setFontSize(9);
    obj.label32:setName("label32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout20);
    obj.label33:setAlign("left");
    obj.label33:setWidth(30);
    obj.label33:setText("Outros");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setFontSize(9);
    obj.label33:setName("label33");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle10);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setMargins({left=5});
    obj.layout21:setName("layout21");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout21);
    obj.label34:setAlign("left");
    obj.label34:setWidth(50);
    obj.label34:setText("FA F");
    obj.label34:setName("label34");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout21);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(30);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle13);
    obj.label35:setAlign("client");
    obj.label35:setField("fa_forTotal");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout21);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle14);
    obj.label36:setAlign("client");
    obj.label36:setField("habTotal");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout21);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(30);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.rectangle15);
    obj.label37:setAlign("client");
    obj.label37:setField("forTotal");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout21);
    obj.edit28:setAlign("left");
    obj.edit28:setWidth(30);
    obj.edit28:setField("fa_forBonus");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout21);
    obj.edit29:setAlign("left");
    obj.edit29:setWidth(30);
    obj.edit29:setField("fa_forOutros");
    obj.edit29:setName("edit29");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout21);
    obj.dataLink7:setFields({'habTotal', 'forTotal', 'fa_forBonus', 'fa_forOutros'});
    obj.dataLink7:setName("dataLink7");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle10);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setMargins({left=5});
    obj.layout22:setName("layout22");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout22);
    obj.label38:setAlign("left");
    obj.label38:setWidth(50);
    obj.label38:setText("FA PdF");
    obj.label38:setName("label38");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout22);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(30);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle16);
    obj.label39:setAlign("client");
    obj.label39:setField("fa_pdfTotal");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout22);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(30);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle17);
    obj.label40:setAlign("client");
    obj.label40:setField("habTotal");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout22);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(30);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.rectangle18);
    obj.label41:setAlign("client");
    obj.label41:setField("pdfTotal");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout22);
    obj.edit30:setAlign("left");
    obj.edit30:setWidth(30);
    obj.edit30:setField("fa_pdfBonus");
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout22);
    obj.edit31:setAlign("left");
    obj.edit31:setWidth(30);
    obj.edit31:setField("fa_pdfOutros");
    obj.edit31:setName("edit31");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout22);
    obj.dataLink8:setFields({'habTotal', 'pdfTotal', 'fa_pdfBonus', 'fa_pdfOutros'});
    obj.dataLink8:setName("dataLink8");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle10);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setMargins({left=5});
    obj.layout23:setName("layout23");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout23);
    obj.label42:setAlign("left");
    obj.label42:setWidth(50);
    obj.label42:setText("FD");
    obj.label42:setName("label42");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout23);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(30);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle19);
    obj.label43:setAlign("client");
    obj.label43:setField("fd_armTotal");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout23);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(30);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle20);
    obj.label44:setAlign("client");
    obj.label44:setField("habTotal");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout23);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(30);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.rectangle21);
    obj.label45:setAlign("client");
    obj.label45:setField("armTotal");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout23);
    obj.edit32:setAlign("left");
    obj.edit32:setWidth(30);
    obj.edit32:setField("fd_armBonus");
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout23);
    obj.edit33:setAlign("left");
    obj.edit33:setWidth(30);
    obj.edit33:setField("fd_armOutros");
    obj.edit33:setName("edit33");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout23);
    obj.dataLink9:setFields({'habTotal', 'armTotal', 'fd_armBonus', 'fd_armOutros'});
    obj.dataLink9:setName("dataLink9");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout10);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(230);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setMargins({left=5});
    obj.rectangle22:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle22:setName("rectangle22");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle22);
    obj.label46:setAlign("top");
    obj.label46:setHeight(25);
    obj.label46:setText("Movimentação");
    obj.label46:setName("label46");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle22);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout24);
    obj.label47:setAlign("left");
    obj.label47:setWidth(100);
    obj.label47:setText("Vel. Normal");
    obj.label47:setName("label47");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout24);
    obj.edit34:setAlign("client");
    obj.edit34:setField("movNormal");
    obj.edit34:setName("edit34");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle22);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout25);
    obj.label48:setAlign("left");
    obj.label48:setWidth(100);
    obj.label48:setText("Vel. Máxima");
    obj.label48:setName("label48");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout25);
    obj.edit35:setAlign("client");
    obj.edit35:setField("movMaxima");
    obj.edit35:setName("edit35");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle22);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout26);
    obj.label49:setAlign("left");
    obj.label49:setWidth(100);
    obj.label49:setText("Nadando");
    obj.label49:setName("label49");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout26);
    obj.edit36:setAlign("client");
    obj.edit36:setField("movNadando");
    obj.edit36:setName("edit36");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle22);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout27);
    obj.label50:setAlign("left");
    obj.label50:setWidth(100);
    obj.label50:setText("Escalando");
    obj.label50:setName("label50");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout27);
    obj.edit37:setAlign("client");
    obj.edit37:setField("movEscalando");
    obj.edit37:setName("edit37");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle22);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout28);
    obj.label51:setAlign("left");
    obj.label51:setWidth(100);
    obj.label51:setText("Voando");
    obj.label51:setName("label51");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout28);
    obj.edit38:setAlign("client");
    obj.edit38:setField("movVoando");
    obj.edit38:setName("edit38");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout9);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(185);
    obj.layout29:setMargins({top=5});
    obj.layout29:setName("layout29");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout29);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(230);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle23:setName("rectangle23");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle23);
    obj.label52:setAlign("top");
    obj.label52:setHeight(25);
    obj.label52:setText("Tipo de Dano - Força");
    obj.label52:setName("label52");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle23);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("tipoForca");
    obj.textEditor1:setMargins({left=5,right=5,bottom=5});
    obj.textEditor1:setName("textEditor1");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout29);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(230);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setMargins({left=5});
    obj.rectangle24:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle24:setName("rectangle24");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.rectangle24);
    obj.label53:setAlign("top");
    obj.label53:setHeight(25);
    obj.label53:setText("Tipo de Dano - PdF");
    obj.label53:setName("label53");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle24);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("tipoPdF");
    obj.textEditor2:setMargins({left=5,right=5,bottom=5});
    obj.textEditor2:setName("textEditor2");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout29);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(230);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setMargins({left=5});
    obj.rectangle25:setPadding({left=5,right=5,bottom=5,top=5});
    obj.rectangle25:setName("rectangle25");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle25);
    obj.label54:setAlign("top");
    obj.label54:setHeight(25);
    obj.label54:setText("Outros");
    obj.label54:setName("label54");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle25);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("tipoOutros");
    obj.textEditor3:setMargins({left=5,right=5,bottom=5});
    obj.textEditor3:setName("textEditor3");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout8);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(375);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setMargins({top=5});
    obj.rectangle26:setName("rectangle26");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle26);
    obj.label55:setLeft(0);
    obj.label55:setTop(180);
    obj.label55:setWidth(375);
    obj.label55:setHeight(20);
    obj.label55:setText("Avatar");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle26);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

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

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox2);
    obj.button1:setText("Nova Perícia");
    obj.button1:setAlign("top");
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox2);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setMargins({right=25});
    obj.layout30:setName("layout30");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout30);
    obj.label56:setAlign("client");
    obj.label56:setVertTextAlign("center");
    obj.label56:setText("");
    obj.label56:setName("label56");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout30);
    obj.label57:setAlign("right");
    obj.label57:setWidth(50);
    obj.label57:setText("Custo");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout30);
    obj.label58:setAlign("right");
    obj.label58:setWidth(100);
    obj.label58:setText("Especialização 1");
    obj.label58:setName("label58");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout30);
    obj.label59:setAlign("right");
    obj.label59:setWidth(100);
    obj.label59:setText("Especialização 2");
    obj.label59:setName("label59");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout30);
    obj.label60:setAlign("right");
    obj.label60:setWidth(100);
    obj.label60:setText("Especialização 3");
    obj.label60:setName("label60");

    obj.campoDasPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasPericias:setParent(obj.scrollBox2);
    obj.campoDasPericias:setName("campoDasPericias");
    obj.campoDasPericias:setField("campoDasPericias");
    obj.campoDasPericias:setTemplateForm("frmPericiaItem");
    obj.campoDasPericias:setAlign("top");
    obj.campoDasPericias:setLayout("vertical");
    obj.campoDasPericias:setAutoHeight(true);
    obj.campoDasPericias:setHitTest(false);
    obj.campoDasPericias:setMinQt(1);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Vantagens");
    obj.tab3:setName("tab3");

    obj.frmVantagens = GUI.fromHandle(_obj_newObject("form"));
    obj.frmVantagens:setParent(obj.tab3);
    obj.frmVantagens:setName("frmVantagens");
    obj.frmVantagens:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmVantagens);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox3);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxColumns(3);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.campoDasVantagensUnicasPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasVantagensUnicasPart:setParent(obj.flowLayout1);
    obj.campoDasVantagensUnicasPart:setMinWidth(300);
    obj.campoDasVantagensUnicasPart:setMaxWidth(600);
    obj.campoDasVantagensUnicasPart:setHeight(25);
    obj.campoDasVantagensUnicasPart:setMinScaledWidth(280);
    obj.campoDasVantagensUnicasPart:setName("campoDasVantagensUnicasPart");
    obj.campoDasVantagensUnicasPart:setAdjustHeightToLine(false);
    obj.campoDasVantagensUnicasPart:setMargins({left=5});


					rawset(self.campoDasVantagensUnicasPart, "_recalcHeight", 					
						function ()
							self.campoDasVantagensUnicasPart.height = self.campoDasVantagensUnicas.height + 25;
						end);
				


    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.campoDasVantagensUnicasPart);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout31);
    obj.button2:setText("+");
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setName("button2");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout31);
    obj.label61:setText("VANTAGENS ÚNICAS");
    obj.label61:setAlign("left");
    obj.label61:setWidth(225);
    obj.label61:setMargins({left=5});
    obj.label61:setName("label61");

    obj.campoDasVantagensUnicas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasVantagensUnicas:setParent(obj.campoDasVantagensUnicasPart);
    obj.campoDasVantagensUnicas:setName("campoDasVantagensUnicas");
    obj.campoDasVantagensUnicas:setField("campoDasVantagensUnicas");
    obj.campoDasVantagensUnicas:setTemplateForm("frmVantagensItem");
    obj.campoDasVantagensUnicas:setAlign("top");
    obj.campoDasVantagensUnicas:setLayout("vertical");
    obj.campoDasVantagensUnicas:setAutoHeight(true);
    obj.campoDasVantagensUnicas:setHitTest(false);
    obj.campoDasVantagensUnicas:setMinQt(1);

    obj.campoDasVantagensPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasVantagensPart:setParent(obj.flowLayout1);
    obj.campoDasVantagensPart:setMinWidth(300);
    obj.campoDasVantagensPart:setMaxWidth(600);
    obj.campoDasVantagensPart:setHeight(25);
    obj.campoDasVantagensPart:setMinScaledWidth(280);
    obj.campoDasVantagensPart:setName("campoDasVantagensPart");
    obj.campoDasVantagensPart:setAdjustHeightToLine(false);
    obj.campoDasVantagensPart:setMargins({left=5});


					rawset(self.campoDasVantagensPart, "_recalcHeight", 					
						function ()
							self.campoDasVantagensPart.height = self.campoDasVantagens.height + 25;
						end);
				


    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.campoDasVantagensPart);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout32);
    obj.button3:setText("+");
    obj.button3:setAlign("left");
    obj.button3:setWidth(30);
    obj.button3:setName("button3");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout32);
    obj.label62:setText("VANTAGENS");
    obj.label62:setAlign("left");
    obj.label62:setWidth(225);
    obj.label62:setMargins({left=5});
    obj.label62:setName("label62");

    obj.campoDasVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasVantagens:setParent(obj.campoDasVantagensPart);
    obj.campoDasVantagens:setName("campoDasVantagens");
    obj.campoDasVantagens:setField("campoDasVantagens");
    obj.campoDasVantagens:setTemplateForm("frmVantagensItem");
    obj.campoDasVantagens:setAlign("top");
    obj.campoDasVantagens:setLayout("vertical");
    obj.campoDasVantagens:setAutoHeight(true);
    obj.campoDasVantagens:setHitTest(false);
    obj.campoDasVantagens:setMinQt(1);

    obj.campoDasDesvantagensPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDasDesvantagensPart:setParent(obj.flowLayout1);
    obj.campoDasDesvantagensPart:setMinWidth(300);
    obj.campoDasDesvantagensPart:setMaxWidth(600);
    obj.campoDasDesvantagensPart:setHeight(25);
    obj.campoDasDesvantagensPart:setMinScaledWidth(280);
    obj.campoDasDesvantagensPart:setName("campoDasDesvantagensPart");
    obj.campoDasDesvantagensPart:setAdjustHeightToLine(false);
    obj.campoDasDesvantagensPart:setMargins({left=5});


					rawset(self.campoDasDesvantagensPart, "_recalcHeight", 					
						function ()
							self.campoDasDesvantagensPart.height = self.campoDasDesvantagens.height + 25;
						end);
				


    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.campoDasDesvantagensPart);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout33);
    obj.button4:setText("+");
    obj.button4:setAlign("left");
    obj.button4:setWidth(30);
    obj.button4:setName("button4");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout33);
    obj.label63:setText("DESVANTAGENS");
    obj.label63:setAlign("left");
    obj.label63:setWidth(225);
    obj.label63:setMargins({left=5});
    obj.label63:setName("label63");

    obj.campoDasDesvantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasDesvantagens:setParent(obj.campoDasDesvantagensPart);
    obj.campoDasDesvantagens:setName("campoDasDesvantagens");
    obj.campoDasDesvantagens:setField("campoDasDesvantagens");
    obj.campoDasDesvantagens:setTemplateForm("frmVantagensItem");
    obj.campoDasDesvantagens:setAlign("top");
    obj.campoDasDesvantagens:setLayout("vertical");
    obj.campoDasDesvantagens:setAutoHeight(true);
    obj.campoDasDesvantagens:setHitTest(false);
    obj.campoDasDesvantagens:setMinQt(1);

    obj.campoDeOutrosPart = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.campoDeOutrosPart:setParent(obj.flowLayout1);
    obj.campoDeOutrosPart:setMinWidth(300);
    obj.campoDeOutrosPart:setMaxWidth(600);
    obj.campoDeOutrosPart:setHeight(25);
    obj.campoDeOutrosPart:setMinScaledWidth(280);
    obj.campoDeOutrosPart:setName("campoDeOutrosPart");
    obj.campoDeOutrosPart:setAdjustHeightToLine(false);
    obj.campoDeOutrosPart:setMargins({left=5});


					rawset(self.campoDeOutrosPart, "_recalcHeight", 					
						function ()
							self.campoDeOutrosPart.height = self.campoDeOutros.height + 25;
						end);
				


    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.campoDeOutrosPart);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout34);
    obj.button5:setText("+");
    obj.button5:setAlign("left");
    obj.button5:setWidth(30);
    obj.button5:setName("button5");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout34);
    obj.label64:setText("OUTROS");
    obj.label64:setAlign("left");
    obj.label64:setWidth(225);
    obj.label64:setMargins({left=5});
    obj.label64:setName("label64");

    obj.campoDeOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDeOutros:setParent(obj.campoDeOutrosPart);
    obj.campoDeOutros:setName("campoDeOutros");
    obj.campoDeOutros:setField("campoDeOutros");
    obj.campoDeOutros:setTemplateForm("frmVantagensItem");
    obj.campoDeOutros:setAlign("top");
    obj.campoDeOutros:setLayout("vertical");
    obj.campoDeOutros:setAutoHeight(true);
    obj.campoDeOutros:setHitTest(false);
    obj.campoDeOutros:setMinQt(1);

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Magia");
    obj.tab4:setName("tab4");

    obj.frmMagias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMagias:setParent(obj.tab4);
    obj.frmMagias:setName("frmMagias");
    obj.frmMagias:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmMagias);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.scrollBox4);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(250);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.rectangle27);
    obj.button6:setText("Novo Caminho");
    obj.button6:setAlign("top");
    obj.button6:setHeight(25);
    obj.button6:setName("button6");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.rectangle27);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.campoDasCaminhos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasCaminhos:setParent(obj.scrollBox5);
    obj.campoDasCaminhos:setName("campoDasCaminhos");
    obj.campoDasCaminhos:setField("campoDasCaminhos");
    obj.campoDasCaminhos:setTemplateForm("frmCaminhoItem");
    obj.campoDasCaminhos:setAlign("top");
    obj.campoDasCaminhos:setLayout("vertical");
    obj.campoDasCaminhos:setAutoHeight(true);
    obj.campoDasCaminhos:setHitTest(false);
    obj.campoDasCaminhos:setMinQt(1);
    obj.campoDasCaminhos:setMargins({left=5,right=5,bottom=5});

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.scrollBox4);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setWidth(150);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setMargins({left=5});
    obj.rectangle28:setName("rectangle28");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.rectangle28);
    obj.button7:setText("Nova Magia");
    obj.button7:setAlign("top");
    obj.button7:setHeight(25);
    obj.button7:setName("button7");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.rectangle28);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.campoDasMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasMagias:setParent(obj.scrollBox6);
    obj.campoDasMagias:setName("campoDasMagias");
    obj.campoDasMagias:setField("campoDasMagias");
    obj.campoDasMagias:setTemplateForm("frmMagiaItem");
    obj.campoDasMagias:setAlign("top");
    obj.campoDasMagias:setLayout("verticalTiles");
    obj.campoDasMagias:setAutoHeight(true);
    obj.campoDasMagias:setHitTest(false);
    obj.campoDasMagias:setMinQt(1);
    obj.campoDasMagias:setMargins({left=5,right=5,bottom=5});

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Inventário");
    obj.tab5:setName("tab5");

    obj.frmInventario = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInventario:setParent(obj.tab5);
    obj.frmInventario:setName("frmInventario");
    obj.frmInventario:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmInventario);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox7);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(300);
    obj.layout35:setMargins({bottom=5});
    obj.layout35:setName("layout35");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout35);
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(300);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setMargins({right=5});
    obj.rectangle29:setName("rectangle29");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle29);
    obj.label65:setAlign("top");
    obj.label65:setHeight(25);
    obj.label65:setText("Dinheiro");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle29);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("dinheiro");
    obj.textEditor4:setMargins({left=5,right=5,bottom=5});
    obj.textEditor4:setName("textEditor4");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout35);
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(300);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setMargins({right=5});
    obj.rectangle30:setName("rectangle30");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle30);
    obj.label66:setAlign("top");
    obj.label66:setHeight(25);
    obj.label66:setText("Mochila");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle30);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("mochila");
    obj.textEditor5:setMargins({left=5,right=5,bottom=5});
    obj.textEditor5:setName("textEditor5");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout35);
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(300);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setMargins({right=5});
    obj.rectangle31:setName("rectangle31");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle31);
    obj.label67:setAlign("top");
    obj.label67:setHeight(25);
    obj.label67:setText("Armas");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle31);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("armas");
    obj.textEditor6:setMargins({left=5,right=5,bottom=5});
    obj.textEditor6:setName("textEditor6");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.scrollBox7);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(300);
    obj.layout36:setMargins({bottom=5});
    obj.layout36:setName("layout36");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout36);
    obj.rectangle32:setAlign("left");
    obj.rectangle32:setWidth(300);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setMargins({right=5});
    obj.rectangle32:setName("rectangle32");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle32);
    obj.label68:setAlign("top");
    obj.label68:setHeight(25);
    obj.label68:setText("Consumiveis");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle32);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("consumiveis");
    obj.textEditor7:setMargins({left=5,right=5,bottom=5});
    obj.textEditor7:setName("textEditor7");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout36);
    obj.rectangle33:setAlign("left");
    obj.rectangle33:setWidth(300);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setMargins({right=5});
    obj.rectangle33:setName("rectangle33");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle33);
    obj.label69:setAlign("top");
    obj.label69:setHeight(25);
    obj.label69:setText("Equipamentos");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle33);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("equipamentos");
    obj.textEditor8:setMargins({left=5,right=5,bottom=5});
    obj.textEditor8:setName("textEditor8");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout36);
    obj.rectangle34:setAlign("left");
    obj.rectangle34:setWidth(300);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setMargins({right=5});
    obj.rectangle34:setName("rectangle34");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle34);
    obj.label70:setAlign("top");
    obj.label70:setHeight(25);
    obj.label70:setText("Outros");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle34);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("outros");
    obj.textEditor9:setMargins({left=5,right=5,bottom=5});
    obj.textEditor9:setName("textEditor9");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Descrição");
    obj.tab6:setName("tab6");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab6);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmTemplateDescription);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.scrollBox8);
    obj.rectangle35:setLeft(0);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(1205);
    obj.rectangle35:setHeight(105);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle35);
    obj.label71:setAlign("top");
    obj.label71:setHeight(20);
    obj.label71:setText("DESCRIÇÃO");
    obj.label71:setName("label71");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle35);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(380);
    obj.layout38:setMargins({right=10});
    obj.layout38:setName("layout38");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout38);
    obj.label72:setAlign("left");
    obj.label72:setWidth(90);
    obj.label72:setText("NACIONALIDADE");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setFontSize(10);
    obj.label72:setName("label72");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout38);
    obj.edit39:setAlign("left");
    obj.edit39:setWidth(290);
    obj.edit39:setField("nacionalidade");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setName("edit39");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout37);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(380);
    obj.layout39:setMargins({right=10});
    obj.layout39:setName("layout39");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout39);
    obj.label73:setAlign("left");
    obj.label73:setWidth(90);
    obj.label73:setText("IDADE");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setFontSize(13);
    obj.label73:setName("label73");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout39);
    obj.edit40:setAlign("left");
    obj.edit40:setWidth(290);
    obj.edit40:setField("idade");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setName("edit40");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout37);
    obj.layout40:setAlign("left");
    obj.layout40:setWidth(380);
    obj.layout40:setMargins({right=10});
    obj.layout40:setName("layout40");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout40);
    obj.label74:setAlign("left");
    obj.label74:setWidth(90);
    obj.label74:setText("OLHOS");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setFontSize(13);
    obj.label74:setName("label74");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout40);
    obj.edit41:setAlign("left");
    obj.edit41:setWidth(290);
    obj.edit41:setField("aparenciaOlhos");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setName("edit41");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle35);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(380);
    obj.layout42:setMargins({right=10});
    obj.layout42:setName("layout42");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout42);
    obj.label75:setAlign("left");
    obj.label75:setWidth(90);
    obj.label75:setText("ALTURA");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setFontSize(13);
    obj.label75:setName("label75");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout42);
    obj.edit42:setAlign("left");
    obj.edit42:setWidth(290);
    obj.edit42:setField("altura");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setName("edit42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(380);
    obj.layout43:setMargins({right=10});
    obj.layout43:setName("layout43");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout43);
    obj.label76:setAlign("left");
    obj.label76:setWidth(90);
    obj.label76:setText("GÊNERO");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setFontSize(13);
    obj.label76:setName("label76");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout43);
    obj.edit43:setAlign("left");
    obj.edit43:setWidth(290);
    obj.edit43:setField("genero");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setName("edit43");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout41);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(380);
    obj.layout44:setMargins({right=10});
    obj.layout44:setName("layout44");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout44);
    obj.label77:setAlign("left");
    obj.label77:setWidth(90);
    obj.label77:setText("PELE");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setFontSize(13);
    obj.label77:setName("label77");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout44);
    obj.edit44:setAlign("left");
    obj.edit44:setWidth(290);
    obj.edit44:setField("pele");
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setName("edit44");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle35);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout45);
    obj.layout46:setAlign("left");
    obj.layout46:setWidth(380);
    obj.layout46:setMargins({right=10});
    obj.layout46:setName("layout46");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout46);
    obj.label78:setAlign("left");
    obj.label78:setWidth(90);
    obj.label78:setText("PESO");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setFontSize(13);
    obj.label78:setName("label78");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout46);
    obj.edit45:setAlign("left");
    obj.edit45:setWidth(290);
    obj.edit45:setField("peso");
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setName("edit45");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout45);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(380);
    obj.layout47:setMargins({right=10});
    obj.layout47:setName("layout47");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout47);
    obj.label79:setAlign("left");
    obj.label79:setWidth(90);
    obj.label79:setText("OUTROS");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setFontSize(13);
    obj.label79:setName("label79");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout47);
    obj.edit46:setAlign("left");
    obj.edit46:setWidth(290);
    obj.edit46:setField("aparenciaOutros");
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setName("edit46");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout45);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(380);
    obj.layout48:setMargins({right=10});
    obj.layout48:setName("layout48");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout48);
    obj.label80:setAlign("left");
    obj.label80:setWidth(90);
    obj.label80:setText("CABELO");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setFontSize(13);
    obj.label80:setName("label80");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout48);
    obj.edit47:setAlign("left");
    obj.edit47:setWidth(290);
    obj.edit47:setField("cabelo");
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setName("edit47");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox8);
    obj.layout49:setLeft(0);
    obj.layout49:setTop(110);
    obj.layout49:setWidth(375);
    obj.layout49:setHeight(240);
    obj.layout49:setName("layout49");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout49);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout49);
    obj.label81:setLeft(5);
    obj.label81:setTop(1);
    obj.label81:setWidth(100);
    obj.label81:setHeight(20);
    obj.label81:setText("APARÊNCIA");
    obj.label81:setName("label81");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout49);
    obj.textEditor10:setLeft(5);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(365);
    obj.textEditor10:setHeight(210);
    obj.textEditor10:setField("aparencia");
    obj.textEditor10:setName("textEditor10");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.scrollBox8);
    obj.layout50:setLeft(0);
    obj.layout50:setTop(355);
    obj.layout50:setWidth(375);
    obj.layout50:setHeight(250);
    obj.layout50:setName("layout50");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout50);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("black");
    obj.rectangle37:setName("rectangle37");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout50);
    obj.label82:setLeft(5);
    obj.label82:setTop(1);
    obj.label82:setWidth(100);
    obj.label82:setHeight(20);
    obj.label82:setText("PERSONALIDADE");
    obj.label82:setName("label82");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout50);
    obj.textEditor11:setLeft(5);
    obj.textEditor11:setTop(25);
    obj.textEditor11:setWidth(365);
    obj.textEditor11:setHeight(220);
    obj.textEditor11:setField("personalidade");
    obj.textEditor11:setName("textEditor11");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox8);
    obj.layout51:setLeft(380);
    obj.layout51:setTop(110);
    obj.layout51:setWidth(825);
    obj.layout51:setHeight(495);
    obj.layout51:setName("layout51");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout51);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("black");
    obj.rectangle38:setName("rectangle38");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout51);
    obj.label83:setLeft(5);
    obj.label83:setTop(1);
    obj.label83:setWidth(100);
    obj.label83:setHeight(20);
    obj.label83:setText("HISTORIA");
    obj.label83:setName("label83");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout51);
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

    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmTemplateNotes);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.scrollBox9);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(400);
    obj.layout52:setMargins({right=10});
    obj.layout52:setName("layout52");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout52);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("black");
    obj.rectangle39:setXradius(5);
    obj.rectangle39:setYradius(15);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.rectangle39);
    obj.label84:setAlign("top");
    obj.label84:setHeight(20);
    obj.label84:setText("Anotações");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle39);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("anotacoes1");
    obj.textEditor12:setMargins({left=10,right=10,bottom=10});
    obj.textEditor12:setName("textEditor12");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox9);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(400);
    obj.layout53:setMargins({right=10});
    obj.layout53:setName("layout53");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout53);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setXradius(5);
    obj.rectangle40:setYradius(15);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle40);
    obj.label85:setAlign("top");
    obj.label85:setHeight(20);
    obj.label85:setText("Anotações");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.rectangle40);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setField("anotacoes2");
    obj.textEditor13:setMargins({left=10,right=10,bottom=10});
    obj.textEditor13:setName("textEditor13");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox9);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(400);
    obj.layout54:setMargins({right=10});
    obj.layout54:setName("layout54");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout54);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setXradius(5);
    obj.rectangle41:setYradius(15);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.rectangle41);
    obj.label86:setAlign("top");
    obj.label86:setHeight(20);
    obj.label86:setText("Anotações");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.rectangle41);
    obj.textEditor14:setAlign("client");
    obj.textEditor14:setField("anotacoes3");
    obj.textEditor14:setMargins({left=10,right=10,bottom=10});
    obj.textEditor14:setName("textEditor14");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Creditos");
    obj.tab8:setName("tab8");

    obj.frmCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCreditos:setParent(obj.tab8);
    obj.frmCreditos:setName("frmCreditos");
    obj.frmCreditos:setAlign("client");


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

		


    obj.scrollBox10 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox10:setParent(obj.frmCreditos);
    obj.scrollBox10:setAlign("client");
    obj.scrollBox10:setName("scrollBox10");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox10);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(250);
    obj.image2:setHeight(250);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Ficha 3D&T Turbo/images/RPGmeister.jpg");
    obj.image2:setName("image2");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.scrollBox10);
    obj.layout55:setLeft(300);
    obj.layout55:setTop(0);
    obj.layout55:setWidth(200);
    obj.layout55:setHeight(160);
    obj.layout55:setName("layout55");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout55);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setXradius(5);
    obj.rectangle42:setYradius(15);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout55);
    obj.label87:setLeft(0);
    obj.label87:setTop(10);
    obj.label87:setWidth(200);
    obj.label87:setHeight(20);
    obj.label87:setText("Feito por: ");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout55);
    obj.label88:setLeft(0);
    obj.label88:setTop(35);
    obj.label88:setWidth(200);
    obj.label88:setHeight(20);
    obj.label88:setText("Vinny (Ambesek)");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox10);
    obj.layout56:setLeft(300);
    obj.layout56:setTop(210);
    obj.layout56:setWidth(200);
    obj.layout56:setHeight(150);
    obj.layout56:setName("layout56");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout56);
    obj.rectangle43:setLeft(0);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(200);
    obj.rectangle43:setHeight(150);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setName("rectangle43");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout56);
    obj.label89:setLeft(0);
    obj.label89:setTop(10);
    obj.label89:setWidth(80);
    obj.label89:setHeight(20);
    obj.label89:setText("Tema:");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout56);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout56);
    obj.dataLink10:setField("theme");
    obj.dataLink10:setDefaultValue("Escuro");
    obj.dataLink10:setName("dataLink10");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout56);
    obj.label90:setLeft(0);
    obj.label90:setTop(35);
    obj.label90:setWidth(90);
    obj.label90:setHeight(20);
    obj.label90:setText("Cores: ");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout56);
    obj.label91:setLeft(0);
    obj.label91:setTop(60);
    obj.label91:setWidth(90);
    obj.label91:setHeight(20);
    obj.label91:setText("Fundo ");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout56);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout56);
    obj.dataLink11:setField("colorBackground");
    obj.dataLink11:setDefaultValue("#000000");
    obj.dataLink11:setName("dataLink11");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout56);
    obj.label92:setLeft(0);
    obj.label92:setTop(85);
    obj.label92:setWidth(90);
    obj.label92:setHeight(20);
    obj.label92:setText("Linhas ");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout56);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout56);
    obj.dataLink12:setField("colorStroke");
    obj.dataLink12:setDefaultValue("#FFFFFF");
    obj.dataLink12:setName("dataLink12");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout56);
    obj.label93:setLeft(0);
    obj.label93:setTop(110);
    obj.label93:setWidth(90);
    obj.label93:setHeight(20);
    obj.label93:setText("Fonte ");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout56);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout56);
    obj.dataLink13:setField("colorFont");
    obj.dataLink13:setDefaultValue("#FFFFFF");
    obj.dataLink13:setName("dataLink13");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox10);
    obj.button8:setLeft(300);
    obj.button8:setTop(370);
    obj.button8:setWidth(100);
    obj.button8:setHeight(20);
    obj.button8:setText("Exportar Ficha");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox10);
    obj.button9:setLeft(300);
    obj.button9:setTop(390);
    obj.button9:setWidth(100);
    obj.button9:setHeight(20);
    obj.button9:setText("Importar Ficha");
    obj.button9:setName("button9");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.scrollBox10);
    obj.label94:setLeft(5);
    obj.label94:setTop(275);
    obj.label94:setWidth(200);
    obj.label94:setHeight(20);
    obj.label94:setText("Versão Atual: ");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setField("versionInstalled");
    obj.label94:setName("label94");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.scrollBox10);
    obj.label95:setLeft(5);
    obj.label95:setTop(300);
    obj.label95:setWidth(200);
    obj.label95:setHeight(20);
    obj.label95:setText("Sua Versão: ");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setField("versionDownloaded");
    obj.label95:setName("label95");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox10);
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox10);
    obj.button10:setLeft(5);
    obj.button10:setTop(350);
    obj.button10:setWidth(100);
    obj.button10:setText("Atualizar");
    obj.button10:setName("button10");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.scrollBox10);
    obj.label96:setLeft(5);
    obj.label96:setTop(400);
    obj.label96:setWidth(200);
    obj.label96:setHeight(20);
    obj.label96:setText("Conheça as Mesas:");
    obj.label96:setName("label96");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox10);
    obj.button11:setLeft(5);
    obj.button11:setTop(425);
    obj.button11:setWidth(100);
    obj.button11:setText("RPGmeister");
    obj.button11:setName("button11");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%203D%26T%20RAT/output/Ficha%203D%26T%20RAT.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%203D%26T%20RAT/output/Ficha%203D%26T%20RAT.rpk?raw=true');
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

    obj._e_event1 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                            	sheet.forTotal = (tonumber(sheet.forInicial) or 0) + 
                            	                        (tonumber(sheet.forXP) or 0) + 
                            	                        (tonumber(sheet.forOutros) or 0);
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                            	sheet.habTotal = (tonumber(sheet.habInicial) or 0) + 
                            	                        (tonumber(sheet.habXP) or 0) + 
                            	                        (tonumber(sheet.habOutros) or 0);
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                            	sheet.armTotal = (tonumber(sheet.armInicial) or 0) + 
                            	                        (tonumber(sheet.armXP) or 0) + 
                            	                        (tonumber(sheet.armOutros) or 0);
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                            	sheet.resTotal = (tonumber(sheet.resInicial) or 0) + 
                            	                        (tonumber(sheet.resXP) or 0) + 
                            	                        (tonumber(sheet.resOutros) or 0);
        end, obj);

    obj._e_event5 = obj.dataLink5:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                            	sheet.pdfTotal = (tonumber(sheet.pdfInicial) or 0) + 
                            	                        (tonumber(sheet.pdfXP) or 0) + 
                            	                        (tonumber(sheet.pdfOutros) or 0);
        end, obj);

    obj._e_event6 = obj.dataLink6:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
            				                	sheet.iniTotal = 	(tonumber(sheet.habTotal) or 0) + 
            				                	                    (tonumber(sheet.iniOutros) or 0);
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                            	sheet.fa_forTotal = (tonumber(sheet.habTotal) or 0) + 
                            	                        	(tonumber(sheet.forTotal) or 0) + 
                            	                        	(tonumber(sheet.fa_forBonus) or 0) + 
                            	                        	(tonumber(sheet.fa_forOutros) or 0);
        end, obj);

    obj._e_event8 = obj.dataLink8:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                            	sheet.fa_pdfTotal = (tonumber(sheet.habTotal) or 0) + 
                            	                        	(tonumber(sheet.pdfTotal) or 0) + 
                            	                        	(tonumber(sheet.fa_pdfBonus) or 0) + 
                            	                        	(tonumber(sheet.fa_pdfOutros) or 0);
        end, obj);

    obj._e_event9 = obj.dataLink9:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end
                            	sheet.fd_armTotal = (tonumber(sheet.habTotal) or 0) + 
                            	                        	(tonumber(sheet.armTotal) or 0) + 
                            	                        	(tonumber(sheet.fd_armBonus) or 0) + 
                            	                        	(tonumber(sheet.fd_armOutros) or 0);
        end, obj);

    obj._e_event10 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event11 = obj.button1:addEventListener("onClick",
        function (_)
            self.campoDasPericias:append();
        end, obj);

    obj._e_event12 = obj.button2:addEventListener("onClick",
        function (_)
            self.campoDasVantagensUnicas:append();
        end, obj);

    obj._e_event13 = obj.campoDasVantagensUnicas:addEventListener("onResize",
        function (_)
            self.campoDasVantagensUnicasPart._recalcHeight();
        end, obj);

    obj._e_event14 = obj.campoDasVantagensUnicas:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event15 = obj.button3:addEventListener("onClick",
        function (_)
            self.campoDasVantagens:append();
        end, obj);

    obj._e_event16 = obj.campoDasVantagens:addEventListener("onResize",
        function (_)
            self.campoDasVantagensPart._recalcHeight();
        end, obj);

    obj._e_event17 = obj.campoDasVantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event18 = obj.button4:addEventListener("onClick",
        function (_)
            self.campoDasDesvantagens:append();
        end, obj);

    obj._e_event19 = obj.campoDasDesvantagens:addEventListener("onResize",
        function (_)
            self.campoDasDesvantagensPart._recalcHeight();
        end, obj);

    obj._e_event20 = obj.campoDasDesvantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event21 = obj.button5:addEventListener("onClick",
        function (_)
            self.campoDeOutros:append();
        end, obj);

    obj._e_event22 = obj.campoDeOutros:addEventListener("onResize",
        function (_)
            self.campoDeOutrosPart._recalcHeight();
        end, obj);

    obj._e_event23 = obj.campoDeOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event24 = obj.button6:addEventListener("onClick",
        function (_)
            self.campoDasCaminhos:append();
        end, obj);

    obj._e_event25 = obj.button7:addEventListener("onClick",
        function (_)
            self.campoDasMagias:append();
        end, obj);

    obj._e_event26 = obj.dataLink10:addEventListener("onChange",
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

    obj._e_event27 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event28 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event29 = obj.dataLink13:addEventListener("onChange",
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

    obj._e_event30 = obj.button8:addEventListener("onClick",
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

    obj._e_event31 = obj.button9:addEventListener("onClick",
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

    obj._e_event32 = obj.button10:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%203D%26T%20RAT/output/Ficha%203D%26T%20RAT.rpk?raw=true')
        end, obj);

    obj._e_event33 = obj.button11:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
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

        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.campoDeOutrosPart ~= nil then self.campoDeOutrosPart:destroy(); self.campoDeOutrosPart = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.frmGeral ~= nil then self.frmGeral:destroy(); self.frmGeral = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.campoDasVantagensUnicasPart ~= nil then self.campoDasVantagensUnicasPart:destroy(); self.campoDasVantagensUnicasPart = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.campoDasDesvantagens ~= nil then self.campoDasDesvantagens:destroy(); self.campoDasDesvantagens = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
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
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.campoDasPericias ~= nil then self.campoDasPericias:destroy(); self.campoDasPericias = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.frmVantagens ~= nil then self.frmVantagens:destroy(); self.frmVantagens = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.frmMagias ~= nil then self.frmMagias:destroy(); self.frmMagias = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.frmCreditos ~= nil then self.frmCreditos:destroy(); self.frmCreditos = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.campoDasVantagensPart ~= nil then self.campoDasVantagensPart:destroy(); self.campoDasVantagensPart = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.frmInventario ~= nil then self.frmInventario:destroy(); self.frmInventario = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.campoDasVantagens ~= nil then self.campoDasVantagens:destroy(); self.campoDasVantagens = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.campoDasCaminhos ~= nil then self.campoDasCaminhos:destroy(); self.campoDasCaminhos = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.campoDeOutros ~= nil then self.campoDeOutros:destroy(); self.campoDeOutros = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.campoDasDesvantagensPart ~= nil then self.campoDasDesvantagensPart:destroy(); self.campoDasDesvantagensPart = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.frmPericias ~= nil then self.frmPericias:destroy(); self.frmPericias = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.campoDasVantagensUnicas ~= nil then self.campoDasVantagensUnicas:destroy(); self.campoDasVantagensUnicas = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.campoDasMagias ~= nil then self.campoDasMagias:destroy(); self.campoDasMagias = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.scrollBox10 ~= nil then self.scrollBox10:destroy(); self.scrollBox10 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrm3DeT()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frm3DeT();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frm3DeT = {
    newEditor = newfrm3DeT, 
    new = newfrm3DeT, 
    name = "frm3DeT", 
    dataType = "Ambesek.3DeT", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha 3D&T Turbo", 
    description=""};

frm3DeT = _frm3DeT;
Firecast.registrarForm(_frm3DeT);
Firecast.registrarDataType(_frm3DeT);

return _frm3DeT;
