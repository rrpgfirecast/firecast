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
    obj:setDataType("Ambesek.Infinite.RPG");
    obj:setTitle("Ficha Infinite RPG");
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

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(200);
    obj.layout1:setMargins({right=10});
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setHeight(200);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("client");
    obj.label1:setText("Avatar");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.label1);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    lfm_setPropAsString(obj.image1, "animate",  "true");
    obj.image1:setName("image1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setHeight(260);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setMargins({top=10});
    obj.rectangle2:setPadding({top=5,bottom=5});
    obj.rectangle2:setName("rectangle2");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle2);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(50);
    obj.layout2:setMargins({left=5,right=5});
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("top");
    obj.label2:setHeight(25);
    obj.label2:setText("Nível");
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setAlign("top");
    obj.edit1:setHeight(25);
    obj.edit1:setField("nivel");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(50);
    obj.layout3:setMargins({left=5,right=5});
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setAlign("top");
    obj.label3:setHeight(25);
    obj.label3:setText("Rank");
    obj.label3:setName("label3");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setAlign("top");
    obj.edit2:setHeight(25);
    obj.edit2:setField("rank");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(50);
    obj.layout4:setMargins({left=5,right=5});
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setAlign("top");
    obj.label4:setHeight(25);
    obj.label4:setText("Tipo");
    obj.label4:setName("label4");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setAlign("top");
    obj.edit3:setHeight(25);
    obj.edit3:setField("tipo");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle2);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(50);
    obj.layout5:setMargins({left=5,right=5});
    obj.layout5:setName("layout5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setAlign("top");
    obj.label5:setHeight(25);
    obj.label5:setText("Sub-Tipo");
    obj.label5:setName("label5");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setAlign("top");
    obj.edit4:setHeight(25);
    obj.edit4:setField("subtipo");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle2);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(50);
    obj.layout6:setMargins({left=5,right=5});
    obj.layout6:setName("layout6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setAlign("top");
    obj.label6:setHeight(25);
    obj.label6:setText("Nível de Poder");
    obj.label6:setName("label6");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setAlign("top");
    obj.edit5:setHeight(25);
    obj.edit5:setField("nivelPoder");
    obj.edit5:setName("edit5");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setAlign("top");
    obj.rectangle3:setHeight(200);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setMargins({top=10});
    obj.rectangle3:setName("rectangle3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle3);
    obj.label7:setAlign("top");
    obj.label7:setHeight(25);
    obj.label7:setText("XP");
    obj.label7:setMargins({left=5,top=5});
    obj.label7:setFontSize(15);
    obj.label7:setName("label7");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle3);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(50);
    obj.layout7:setMargins({left=5,right=5});
    obj.layout7:setName("layout7");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout7);
    obj.label8:setAlign("top");
    obj.label8:setHeight(25);
    obj.label8:setText("Atributos");
    obj.label8:setName("label8");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout7);
    obj.rectangle4:setAlign("top");
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle4);
    obj.label9:setAlign("client");
    obj.label9:setField("xpAtributos");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.rectangle3);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(50);
    obj.layout8:setMargins({left=5,right=5});
    obj.layout8:setName("layout8");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setAlign("top");
    obj.label10:setHeight(25);
    obj.label10:setText("Pericias");
    obj.label10:setName("label10");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout8);
    obj.rectangle5:setAlign("top");
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle5);
    obj.label11:setAlign("client");
    obj.label11:setField("xpPericias");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.rectangle3);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(50);
    obj.layout9:setMargins({left=5,right=5});
    obj.layout9:setName("layout9");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout9);
    obj.label12:setAlign("top");
    obj.label12:setHeight(25);
    obj.label12:setText("Total");
    obj.label12:setName("label12");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout9);
    obj.rectangle6:setAlign("top");
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle6);
    obj.label13:setAlign("client");
    obj.label13:setField("xpTotal");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle3);
    obj.dataLink1:setFields({'xpAtributos','xpPericias'});
    obj.dataLink1:setName("dataLink1");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(600);
    obj.layout10:setMargins({right=10});
    obj.layout10:setName("layout10");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout10);
    obj.rectangle7:setAlign("top");
    obj.rectangle7:setHeight(260);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setMargins({top=0});
    obj.rectangle7:setPadding({top=5,bottom=5});
    obj.rectangle7:setName("rectangle7");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.rectangle7);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(50);
    obj.layout11:setMargins({left=5,right=5});
    obj.layout11:setName("layout11");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout11);
    obj.label14:setAlign("top");
    obj.label14:setHeight(25);
    obj.label14:setText("Nome Completo");
    obj.label14:setName("label14");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout11);
    obj.edit6:setAlign("top");
    obj.edit6:setHeight(25);
    obj.edit6:setField("nome");
    obj.edit6:setName("edit6");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle7);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(50);
    obj.layout12:setMargins({left=5,right=5});
    obj.layout12:setName("layout12");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout12);
    obj.label15:setAlign("top");
    obj.label15:setHeight(25);
    obj.label15:setText("Sexo");
    obj.label15:setName("label15");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout12);
    obj.edit7:setAlign("top");
    obj.edit7:setHeight(25);
    obj.edit7:setField("sexo");
    obj.edit7:setName("edit7");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle7);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(50);
    obj.layout13:setMargins({left=5,right=5});
    obj.layout13:setName("layout13");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout13);
    obj.label16:setAlign("top");
    obj.label16:setHeight(25);
    obj.label16:setText("Altura");
    obj.label16:setName("label16");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout13);
    obj.edit8:setAlign("top");
    obj.edit8:setHeight(25);
    obj.edit8:setField("altura");
    obj.edit8:setName("edit8");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle7);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(50);
    obj.layout14:setMargins({left=5,right=5});
    obj.layout14:setName("layout14");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout14);
    obj.label17:setAlign("top");
    obj.label17:setHeight(25);
    obj.label17:setText("Peso");
    obj.label17:setName("label17");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout14);
    obj.edit9:setAlign("top");
    obj.edit9:setHeight(25);
    obj.edit9:setField("peso");
    obj.edit9:setName("edit9");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle7);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(50);
    obj.layout15:setMargins({left=5,right=5});
    obj.layout15:setName("layout15");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout15);
    obj.label18:setAlign("top");
    obj.label18:setHeight(25);
    obj.label18:setText("Idade");
    obj.label18:setName("label18");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout15);
    obj.edit10:setAlign("top");
    obj.edit10:setHeight(25);
    obj.edit10:setField("idade");
    obj.edit10:setName("edit10");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout10);
    obj.rectangle8:setAlign("top");
    obj.rectangle8:setHeight(200);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setMargins({top=10});
    obj.rectangle8:setName("rectangle8");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle8);
    obj.label19:setAlign("top");
    obj.label19:setHeight(25);
    obj.label19:setText("Personalidade");
    obj.label19:setMargins({left=5,top=5});
    obj.label19:setName("label19");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle8);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setMargins({left=5,right=5,bottom=5});
    obj.textEditor1:setField("personalidade");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout10);
    obj.rectangle9:setAlign("top");
    obj.rectangle9:setHeight(200);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setMargins({top=10});
    obj.rectangle9:setName("rectangle9");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle9);
    obj.label20:setAlign("top");
    obj.label20:setHeight(25);
    obj.label20:setText("Objetivo");
    obj.label20:setMargins({left=5,top=5});
    obj.label20:setName("label20");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle9);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setMargins({left=5,right=5,bottom=5});
    obj.textEditor2:setField("objetivo");
    obj.textEditor2:setName("textEditor2");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.scrollBox1);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(300);
    obj.layout16:setMargins({right=10});
    obj.layout16:setName("layout16");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout16);
    obj.rectangle10:setAlign("top");
    obj.rectangle10:setHeight(680);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setMargins({top=0});
    obj.rectangle10:setName("rectangle10");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle10);
    obj.label21:setAlign("client");
    obj.label21:setText("Imagem");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.label21);
    obj.image2:setAlign("client");
    obj.image2:setField("avatar2");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image2:setName("image2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Atributos");
    obj.tab2:setName("tab2");

    obj.frmAttributes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAttributes:setParent(obj.tab2);
    obj.frmAttributes:setName("frmAttributes");
    obj.frmAttributes:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmAttributes);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox2);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(200);
    obj.layout17:setMargins({right=10});
    obj.layout17:setName("layout17");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout17);
    obj.rectangle11:setAlign("top");
    obj.rectangle11:setHeight(160);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setMargins({top=0});
    obj.rectangle11:setPadding({top=5,bottom=5});
    obj.rectangle11:setName("rectangle11");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle11);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(50);
    obj.layout18:setMargins({left=5,right=5});
    obj.layout18:setName("layout18");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout18);
    obj.label22:setAlign("top");
    obj.label22:setHeight(25);
    obj.label22:setText("HP");
    obj.label22:setName("label22");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout18);
    obj.edit11:setAlign("top");
    obj.edit11:setHeight(25);
    obj.edit11:setField("hp");
    obj.edit11:setName("edit11");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle11);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(50);
    obj.layout19:setMargins({left=5,right=5});
    obj.layout19:setName("layout19");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout19);
    obj.label23:setAlign("top");
    obj.label23:setHeight(25);
    obj.label23:setText("PS");
    obj.label23:setName("label23");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout19);
    obj.edit12:setAlign("top");
    obj.edit12:setHeight(25);
    obj.edit12:setField("ps");
    obj.edit12:setName("edit12");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle11);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(50);
    obj.layout20:setMargins({left=5,right=5});
    obj.layout20:setName("layout20");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout20);
    obj.label24:setAlign("top");
    obj.label24:setHeight(25);
    obj.label24:setText("RD");
    obj.label24:setName("label24");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout20);
    obj.edit13:setAlign("top");
    obj.edit13:setHeight(25);
    obj.edit13:setField("rd");
    obj.edit13:setName("edit13");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout17);
    obj.rectangle12:setAlign("top");
    obj.rectangle12:setHeight(275);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setMargins({top=10});
    obj.rectangle12:setName("rectangle12");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle12);
    obj.label25:setAlign("top");
    obj.label25:setHeight(25);
    obj.label25:setText("Danos");
    obj.label25:setMargins({left=5,top=5});
    obj.label25:setName("label25");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle12);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setMargins({left=5,right=5,bottom=5});
    obj.textEditor3:setField("danos");
    obj.textEditor3:setName("textEditor3");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.scrollBox2);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(415);
    obj.layout21:setMargins({right=10});
    obj.layout21:setName("layout21");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout21);
    obj.rectangle13:setAlign("top");
    obj.rectangle13:setHeight(235);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setMargins({top=0});
    obj.rectangle13:setPadding({top=5,bottom=5});
    obj.rectangle13:setName("rectangle13");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle13);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setMargins({left=5,right=5});
    obj.layout22:setName("layout22");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout22);
    obj.label26:setAlign("left");
    obj.label26:setWidth(75);
    obj.label26:setText("");
    obj.label26:setMargins({right=5});
    obj.label26:setName("label26");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout22);
    obj.label27:setAlign("left");
    obj.label27:setWidth(50);
    obj.label27:setText("Normal");
    obj.label27:setMargins({right=5});
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout22);
    obj.label28:setAlign("left");
    obj.label28:setWidth(50);
    obj.label28:setText("Equip");
    obj.label28:setMargins({right=5});
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout22);
    obj.label29:setAlign("left");
    obj.label29:setWidth(50);
    obj.label29:setText("Add");
    obj.label29:setMargins({right=5});
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout22);
    obj.label30:setAlign("left");
    obj.label30:setWidth(50);
    obj.label30:setText("Total");
    obj.label30:setMargins({right=5});
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout22);
    obj.label31:setAlign("left");
    obj.label31:setWidth(50);
    obj.label31:setText("Mod");
    obj.label31:setMargins({right=5});
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout22);
    obj.label32:setAlign("left");
    obj.label32:setWidth(50);
    obj.label32:setText("XP");
    obj.label32:setMargins({right=5});
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle13);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setMargins({left=5,right=5});
    obj.layout23:setName("layout23");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout23);
    obj.label33:setAlign("left");
    obj.label33:setWidth(75);
    obj.label33:setText("Fortitude");
    obj.label33:setMargins({right=5});
    obj.label33:setName("label33");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout23);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(50);
    obj.edit14:setField("fortitudeNormal");
    obj.edit14:setMargins({right=5});
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout23);
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(50);
    obj.edit15:setField("fortitudeEquip");
    obj.edit15:setMargins({right=5});
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout23);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(50);
    obj.edit16:setField("fortitudeAdd");
    obj.edit16:setMargins({right=5});
    obj.edit16:setName("edit16");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout23);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setMargins({right=5});
    obj.rectangle14:setName("rectangle14");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle14);
    obj.label34:setAlign("client");
    obj.label34:setField("fortitudeTotal");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout23);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setMargins({right=5});
    obj.rectangle15:setName("rectangle15");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle15);
    obj.label35:setAlign("client");
    obj.label35:setField("fortitudeMod");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout23);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setMargins({right=5});
    obj.rectangle16:setName("rectangle16");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle16);
    obj.label36:setAlign("client");
    obj.label36:setField("fortitudeXP");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout23);
    obj.dataLink2:setFields({'fortitudeNormal','fortitudeEquip','fortitudeAdd','fortitudeXP'});
    obj.dataLink2:setName("dataLink2");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle13);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setMargins({left=5,right=5});
    obj.layout24:setName("layout24");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout24);
    obj.label37:setAlign("left");
    obj.label37:setWidth(75);
    obj.label37:setText("Instinto");
    obj.label37:setMargins({right=5});
    obj.label37:setName("label37");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout24);
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(50);
    obj.edit17:setField("instintoNormal");
    obj.edit17:setMargins({right=5});
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout24);
    obj.edit18:setAlign("left");
    obj.edit18:setWidth(50);
    obj.edit18:setField("instintoEquip");
    obj.edit18:setMargins({right=5});
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout24);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(50);
    obj.edit19:setField("instintoAdd");
    obj.edit19:setMargins({right=5});
    obj.edit19:setName("edit19");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout24);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setMargins({right=5});
    obj.rectangle17:setName("rectangle17");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.rectangle17);
    obj.label38:setAlign("client");
    obj.label38:setField("instintoTotal");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout24);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setMargins({right=5});
    obj.rectangle18:setName("rectangle18");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.rectangle18);
    obj.label39:setAlign("client");
    obj.label39:setField("instintoMod");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout24);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setMargins({right=5});
    obj.rectangle19:setName("rectangle19");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.rectangle19);
    obj.label40:setAlign("client");
    obj.label40:setField("instintoXP");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout24);
    obj.dataLink3:setFields({'instintoNormal','instintoEquip','instintoAdd','instintoXP'});
    obj.dataLink3:setName("dataLink3");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle13);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setMargins({left=5,right=5});
    obj.layout25:setName("layout25");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout25);
    obj.label41:setAlign("left");
    obj.label41:setWidth(75);
    obj.label41:setText("Destreza");
    obj.label41:setMargins({right=5});
    obj.label41:setName("label41");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout25);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(50);
    obj.edit20:setField("destrezaNormal");
    obj.edit20:setMargins({right=5});
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout25);
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(50);
    obj.edit21:setField("destrezaEquip");
    obj.edit21:setMargins({right=5});
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout25);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(50);
    obj.edit22:setField("destrezaAdd");
    obj.edit22:setMargins({right=5});
    obj.edit22:setName("edit22");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout25);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(50);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setMargins({right=5});
    obj.rectangle20:setName("rectangle20");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle20);
    obj.label42:setAlign("client");
    obj.label42:setField("destrezaTotal");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout25);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setMargins({right=5});
    obj.rectangle21:setName("rectangle21");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle21);
    obj.label43:setAlign("client");
    obj.label43:setField("destrezaMod");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout25);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setMargins({right=5});
    obj.rectangle22:setName("rectangle22");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle22);
    obj.label44:setAlign("client");
    obj.label44:setField("destrezaXP");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout25);
    obj.dataLink4:setFields({'destrezaNormal','destrezaEquip','destrezaAdd','destrezaXP'});
    obj.dataLink4:setName("dataLink4");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle13);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setMargins({left=5,right=5});
    obj.layout26:setName("layout26");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout26);
    obj.label45:setAlign("left");
    obj.label45:setWidth(75);
    obj.label45:setText("Sabedoria");
    obj.label45:setMargins({right=5});
    obj.label45:setName("label45");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout26);
    obj.edit23:setAlign("left");
    obj.edit23:setWidth(50);
    obj.edit23:setField("sabedoriaNormal");
    obj.edit23:setMargins({right=5});
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout26);
    obj.edit24:setAlign("left");
    obj.edit24:setWidth(50);
    obj.edit24:setField("sabedoriaEquip");
    obj.edit24:setMargins({right=5});
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout26);
    obj.edit25:setAlign("left");
    obj.edit25:setWidth(50);
    obj.edit25:setField("sabedoriaAdd");
    obj.edit25:setMargins({right=5});
    obj.edit25:setName("edit25");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout26);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setMargins({right=5});
    obj.rectangle23:setName("rectangle23");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle23);
    obj.label46:setAlign("client");
    obj.label46:setField("sabedoriaTotal");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout26);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setMargins({right=5});
    obj.rectangle24:setName("rectangle24");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.rectangle24);
    obj.label47:setAlign("client");
    obj.label47:setField("sabedoriaMod");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout26);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setMargins({right=5});
    obj.rectangle25:setName("rectangle25");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle25);
    obj.label48:setAlign("client");
    obj.label48:setField("sabedoriaXP");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout26);
    obj.dataLink5:setFields({'sabedoriaNormal','sabedoriaEquip','sabedoriaAdd','sabedoriaXP'});
    obj.dataLink5:setName("dataLink5");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle13);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setMargins({left=5,right=5});
    obj.layout27:setName("layout27");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout27);
    obj.label49:setAlign("left");
    obj.label49:setWidth(75);
    obj.label49:setText("Intelecto");
    obj.label49:setMargins({right=5});
    obj.label49:setName("label49");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout27);
    obj.edit26:setAlign("left");
    obj.edit26:setWidth(50);
    obj.edit26:setField("intelectoNormal");
    obj.edit26:setMargins({right=5});
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout27);
    obj.edit27:setAlign("left");
    obj.edit27:setWidth(50);
    obj.edit27:setField("intelectoEquip");
    obj.edit27:setMargins({right=5});
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout27);
    obj.edit28:setAlign("left");
    obj.edit28:setWidth(50);
    obj.edit28:setField("intelectoAdd");
    obj.edit28:setMargins({right=5});
    obj.edit28:setName("edit28");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout27);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setWidth(50);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setMargins({right=5});
    obj.rectangle26:setName("rectangle26");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle26);
    obj.label50:setAlign("client");
    obj.label50:setField("intelectoTotal");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout27);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setMargins({right=5});
    obj.rectangle27:setName("rectangle27");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle27);
    obj.label51:setAlign("client");
    obj.label51:setField("intelectoMod");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout27);
    obj.rectangle28:setAlign("left");
    obj.rectangle28:setWidth(50);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setMargins({right=5});
    obj.rectangle28:setName("rectangle28");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle28);
    obj.label52:setAlign("client");
    obj.label52:setField("intelectoXP");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout27);
    obj.dataLink6:setFields({'intelectoNormal','intelectoEquip','intelectoAdd','intelectoXP'});
    obj.dataLink6:setName("dataLink6");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle13);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setMargins({left=5,right=5});
    obj.layout28:setName("layout28");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout28);
    obj.label53:setAlign("left");
    obj.label53:setWidth(75);
    obj.label53:setText("Carisma");
    obj.label53:setMargins({right=5});
    obj.label53:setName("label53");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout28);
    obj.edit29:setAlign("left");
    obj.edit29:setWidth(50);
    obj.edit29:setField("carismaNormal");
    obj.edit29:setMargins({right=5});
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout28);
    obj.edit30:setAlign("left");
    obj.edit30:setWidth(50);
    obj.edit30:setField("carismaEquip");
    obj.edit30:setMargins({right=5});
    obj.edit30:setName("edit30");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout28);
    obj.edit31:setAlign("left");
    obj.edit31:setWidth(50);
    obj.edit31:setField("carismaAdd");
    obj.edit31:setMargins({right=5});
    obj.edit31:setName("edit31");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout28);
    obj.rectangle29:setAlign("left");
    obj.rectangle29:setWidth(50);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setMargins({right=5});
    obj.rectangle29:setName("rectangle29");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle29);
    obj.label54:setAlign("client");
    obj.label54:setField("carismaTotal");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout28);
    obj.rectangle30:setAlign("left");
    obj.rectangle30:setWidth(50);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setMargins({right=5});
    obj.rectangle30:setName("rectangle30");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle30);
    obj.label55:setAlign("client");
    obj.label55:setField("carismaMod");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout28);
    obj.rectangle31:setAlign("left");
    obj.rectangle31:setWidth(50);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setMargins({right=5});
    obj.rectangle31:setName("rectangle31");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.rectangle31);
    obj.label56:setAlign("client");
    obj.label56:setField("carismaXP");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout28);
    obj.dataLink7:setFields({'carismaNormal','carismaEquip','carismaAdd','carismaXP'});
    obj.dataLink7:setName("dataLink7");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle13);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setMargins({left=5,right=5});
    obj.layout29:setName("layout29");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout29);
    obj.label57:setAlign("left");
    obj.label57:setWidth(75);
    obj.label57:setText("Resistência");
    obj.label57:setMargins({right=5});
    obj.label57:setName("label57");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout29);
    obj.edit32:setAlign("left");
    obj.edit32:setWidth(50);
    obj.edit32:setField("resistenciaNormal");
    obj.edit32:setMargins({right=5});
    obj.edit32:setName("edit32");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout29);
    obj.edit33:setAlign("left");
    obj.edit33:setWidth(50);
    obj.edit33:setField("resistenciaEquip");
    obj.edit33:setMargins({right=5});
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout29);
    obj.edit34:setAlign("left");
    obj.edit34:setWidth(50);
    obj.edit34:setField("resistenciaAdd");
    obj.edit34:setMargins({right=5});
    obj.edit34:setName("edit34");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout29);
    obj.rectangle32:setAlign("left");
    obj.rectangle32:setWidth(50);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setMargins({right=5});
    obj.rectangle32:setName("rectangle32");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle32);
    obj.label58:setAlign("client");
    obj.label58:setField("resistenciaTotal");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout29);
    obj.rectangle33:setAlign("left");
    obj.rectangle33:setWidth(50);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setMargins({right=5});
    obj.rectangle33:setName("rectangle33");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle33);
    obj.label59:setAlign("client");
    obj.label59:setField("resistenciaMod");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout29);
    obj.rectangle34:setAlign("left");
    obj.rectangle34:setWidth(50);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setMargins({right=5});
    obj.rectangle34:setName("rectangle34");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle34);
    obj.label60:setAlign("client");
    obj.label60:setField("resistenciaXP");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout29);
    obj.dataLink8:setFields({'resistenciaNormal','resistenciaEquip','resistenciaAdd','resistenciaXP'});
    obj.dataLink8:setName("dataLink8");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle13);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setMargins({left=5,right=5});
    obj.layout30:setName("layout30");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout30);
    obj.label61:setAlign("left");
    obj.label61:setWidth(75);
    obj.label61:setText("Vitalidade");
    obj.label61:setMargins({right=5});
    obj.label61:setName("label61");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout30);
    obj.edit35:setAlign("left");
    obj.edit35:setWidth(50);
    obj.edit35:setField("vitalidadeNormal");
    obj.edit35:setMargins({right=5});
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout30);
    obj.edit36:setAlign("left");
    obj.edit36:setWidth(50);
    obj.edit36:setField("vitalidadeEquip");
    obj.edit36:setMargins({right=5});
    obj.edit36:setName("edit36");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout30);
    obj.edit37:setAlign("left");
    obj.edit37:setWidth(50);
    obj.edit37:setField("vitalidadeAdd");
    obj.edit37:setMargins({right=5});
    obj.edit37:setName("edit37");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout30);
    obj.rectangle35:setAlign("left");
    obj.rectangle35:setWidth(50);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setMargins({right=5});
    obj.rectangle35:setName("rectangle35");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle35);
    obj.label62:setAlign("client");
    obj.label62:setField("vitalidadeTotal");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout30);
    obj.rectangle36:setAlign("left");
    obj.rectangle36:setWidth(50);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setMargins({right=5});
    obj.rectangle36:setName("rectangle36");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle36);
    obj.label63:setAlign("client");
    obj.label63:setField("vitalidadeMod");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout30);
    obj.rectangle37:setAlign("left");
    obj.rectangle37:setWidth(50);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setMargins({right=5});
    obj.rectangle37:setName("rectangle37");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle37);
    obj.label64:setAlign("client");
    obj.label64:setField("vitalidadeXP");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout30);
    obj.dataLink9:setFields({'vitalidadeNormal','vitalidadeEquip','vitalidadeAdd','vitalidadeXP'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle13);
    obj.dataLink10:setFields({'fortitudeXP','instintoXP','destrezaXP','sabedoriaXP','intelectoXP','carismaXP','resistenciaXP','vitalidadeXP'});
    obj.dataLink10:setName("dataLink10");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout21);
    obj.rectangle38:setAlign("top");
    obj.rectangle38:setHeight(200);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setMargins({top=10});
    obj.rectangle38:setName("rectangle38");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle38);
    obj.label65:setAlign("top");
    obj.label65:setHeight(25);
    obj.label65:setText("Poder");
    obj.label65:setMargins({left=5,top=5});
    obj.label65:setName("label65");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle38);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setMargins({left=5,right=5,bottom=5});
    obj.textEditor4:setField("poder");
    obj.textEditor4:setName("textEditor4");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Pericias");
    obj.tab3:setName("tab3");

    obj.frmSkills = GUI.fromHandle(_obj_newObject("form"));
    obj.frmSkills:setParent(obj.tab3);
    obj.frmSkills:setName("frmSkills");
    obj.frmSkills:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmSkills);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.scrollBox3);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(300);
    obj.layout31:setMargins({right=10});
    obj.layout31:setName("layout31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(520);
    obj.layout32:setName("layout32");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout32);
    obj.rectangle39:setAlign("top");
    obj.rectangle39:setHeight(115);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setMargins({top=0});
    obj.rectangle39:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle39:setName("rectangle39");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle39);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setMargins({bottom=5});
    obj.layout33:setName("layout33");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout33);
    obj.label66:setAlign("left");
    obj.label66:setWidth(75);
    obj.label66:setText("Fortitude");
    obj.label66:setName("label66");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout33);
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setWidth(50);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setMargins({right=5});
    obj.rectangle40:setName("rectangle40");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle40);
    obj.label67:setAlign("client");
    obj.label67:setField("fortitudeMod");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle39);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(75);
    obj.layout34:setName("layout34");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout34);
    obj.layout35:setAlign("left");
    obj.layout35:setWidth(140);
    obj.layout35:setMargins({right=10});
    obj.layout35:setName("layout35");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout35);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout36);
    obj.label68:setAlign("left");
    obj.label68:setWidth(70);
    obj.label68:setText("Atletismo");
    obj.label68:setMargins({right=5});
    obj.label68:setFontSize(10);
    obj.label68:setName("label68");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout36);
    obj.edit38:setAlign("left");
    obj.edit38:setWidth(30);
    obj.edit38:setField("atletismoNormal");
    obj.edit38:setMargins({right=5});
    obj.edit38:setName("edit38");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout36);
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setWidth(30);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle41);
    obj.label69:setAlign("client");
    obj.label69:setField("atletismoTotal");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout35);
    obj.dataLink11:setFields({'fortitudeMod','atletismoNormal'});
    obj.dataLink11:setName("dataLink11");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout35);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout37);
    obj.label70:setAlign("left");
    obj.label70:setWidth(70);
    obj.label70:setText("Halterofilia");
    obj.label70:setMargins({right=5});
    obj.label70:setFontSize(10);
    obj.label70:setName("label70");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout37);
    obj.edit39:setAlign("left");
    obj.edit39:setWidth(30);
    obj.edit39:setField("halterofiliaNormal");
    obj.edit39:setMargins({right=5});
    obj.edit39:setName("edit39");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout37);
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setWidth(30);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle42);
    obj.label71:setAlign("client");
    obj.label71:setField("halterofiliaTotal");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout35);
    obj.dataLink12:setFields({'fortitudeMod','halterofiliaNormal'});
    obj.dataLink12:setName("dataLink12");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout34);
    obj.layout38:setAlign("left");
    obj.layout38:setWidth(140);
    obj.layout38:setMargins({right=0});
    obj.layout38:setName("layout38");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout32);
    obj.rectangle43:setAlign("top");
    obj.rectangle43:setHeight(115);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setMargins({top=10});
    obj.rectangle43:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle43:setName("rectangle43");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle43);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setMargins({bottom=5});
    obj.layout39:setName("layout39");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout39);
    obj.label72:setAlign("left");
    obj.label72:setWidth(75);
    obj.label72:setText("Instinto");
    obj.label72:setName("label72");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout39);
    obj.rectangle44:setAlign("left");
    obj.rectangle44:setWidth(50);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setMargins({right=5});
    obj.rectangle44:setName("rectangle44");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle44);
    obj.label73:setAlign("client");
    obj.label73:setField("instintoMod");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle43);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(75);
    obj.layout40:setName("layout40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(140);
    obj.layout41:setMargins({right=10});
    obj.layout41:setName("layout41");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout41);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout42);
    obj.label74:setAlign("left");
    obj.label74:setWidth(70);
    obj.label74:setText("Sentidos");
    obj.label74:setMargins({right=5});
    obj.label74:setFontSize(10);
    obj.label74:setName("label74");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout42);
    obj.edit40:setAlign("left");
    obj.edit40:setWidth(30);
    obj.edit40:setField("sentidosNormal");
    obj.edit40:setMargins({right=5});
    obj.edit40:setName("edit40");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout42);
    obj.rectangle45:setAlign("left");
    obj.rectangle45:setWidth(30);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle45);
    obj.label75:setAlign("client");
    obj.label75:setField("sentidosTotal");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout41);
    obj.dataLink13:setFields({'instintoMod','sentidosNormal'});
    obj.dataLink13:setName("dataLink13");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout41);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout43);
    obj.label76:setAlign("left");
    obj.label76:setWidth(70);
    obj.label76:setText("Coragem");
    obj.label76:setMargins({right=5});
    obj.label76:setFontSize(10);
    obj.label76:setName("label76");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout43);
    obj.edit41:setAlign("left");
    obj.edit41:setWidth(30);
    obj.edit41:setField("coragemNormal");
    obj.edit41:setMargins({right=5});
    obj.edit41:setName("edit41");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout43);
    obj.rectangle46:setAlign("left");
    obj.rectangle46:setWidth(30);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.rectangle46);
    obj.label77:setAlign("client");
    obj.label77:setField("coragemTotal");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout41);
    obj.dataLink14:setFields({'instintoMod','coragemNormal'});
    obj.dataLink14:setName("dataLink14");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(140);
    obj.layout44:setMargins({right=0});
    obj.layout44:setName("layout44");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout32);
    obj.rectangle47:setAlign("top");
    obj.rectangle47:setHeight(115);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setMargins({top=10});
    obj.rectangle47:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle47:setName("rectangle47");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle47);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setMargins({bottom=5});
    obj.layout45:setName("layout45");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout45);
    obj.label78:setAlign("left");
    obj.label78:setWidth(75);
    obj.label78:setText("Destreza");
    obj.label78:setName("label78");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout45);
    obj.rectangle48:setAlign("left");
    obj.rectangle48:setWidth(50);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setMargins({right=5});
    obj.rectangle48:setName("rectangle48");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.rectangle48);
    obj.label79:setAlign("client");
    obj.label79:setField("destrezaMod");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle47);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(75);
    obj.layout46:setName("layout46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(140);
    obj.layout47:setMargins({right=10});
    obj.layout47:setName("layout47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout48);
    obj.label80:setAlign("left");
    obj.label80:setWidth(70);
    obj.label80:setText("Acrobacia");
    obj.label80:setMargins({right=5});
    obj.label80:setFontSize(10);
    obj.label80:setName("label80");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout48);
    obj.edit42:setAlign("left");
    obj.edit42:setWidth(30);
    obj.edit42:setField("acrobaciaNormal");
    obj.edit42:setMargins({right=5});
    obj.edit42:setName("edit42");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout48);
    obj.rectangle49:setAlign("left");
    obj.rectangle49:setWidth(30);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.rectangle49);
    obj.label81:setAlign("client");
    obj.label81:setField("acrobaciaTotal");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout47);
    obj.dataLink15:setFields({'destrezaMod','acrobaciaNormal'});
    obj.dataLink15:setName("dataLink15");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout47);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout49);
    obj.label82:setAlign("left");
    obj.label82:setWidth(70);
    obj.label82:setText("Manuseio");
    obj.label82:setMargins({right=5});
    obj.label82:setFontSize(10);
    obj.label82:setName("label82");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout49);
    obj.edit43:setAlign("left");
    obj.edit43:setWidth(30);
    obj.edit43:setField("manuseioNormal");
    obj.edit43:setMargins({right=5});
    obj.edit43:setName("edit43");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout49);
    obj.rectangle50:setAlign("left");
    obj.rectangle50:setWidth(30);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.rectangle50);
    obj.label83:setAlign("client");
    obj.label83:setField("manuseioTotal");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout47);
    obj.dataLink16:setFields({'destrezaMod','manuseioNormal'});
    obj.dataLink16:setName("dataLink16");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout46);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(140);
    obj.layout50:setMargins({right=0});
    obj.layout50:setName("layout50");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout51);
    obj.label84:setAlign("left");
    obj.label84:setWidth(70);
    obj.label84:setText("Dançar");
    obj.label84:setMargins({right=5});
    obj.label84:setFontSize(10);
    obj.label84:setName("label84");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout51);
    obj.edit44:setAlign("left");
    obj.edit44:setWidth(30);
    obj.edit44:setField("dancarNormal");
    obj.edit44:setMargins({right=5});
    obj.edit44:setName("edit44");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout51);
    obj.rectangle51:setAlign("left");
    obj.rectangle51:setWidth(30);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.rectangle51);
    obj.label85:setAlign("client");
    obj.label85:setField("dancarTotal");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout50);
    obj.dataLink17:setFields({'destrezaMod','dancarNormal'});
    obj.dataLink17:setName("dataLink17");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout52);
    obj.label86:setAlign("left");
    obj.label86:setWidth(70);
    obj.label86:setText("Furtividade");
    obj.label86:setMargins({right=5});
    obj.label86:setFontSize(10);
    obj.label86:setName("label86");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout52);
    obj.edit45:setAlign("left");
    obj.edit45:setWidth(30);
    obj.edit45:setField("furtividadeNormal");
    obj.edit45:setMargins({right=5});
    obj.edit45:setName("edit45");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout52);
    obj.rectangle52:setAlign("left");
    obj.rectangle52:setWidth(30);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.rectangle52);
    obj.label87:setAlign("client");
    obj.label87:setField("furtividadeTotal");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout50);
    obj.dataLink18:setFields({'destrezaMod','furtividadeNormal'});
    obj.dataLink18:setName("dataLink18");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout32);
    obj.rectangle53:setAlign("top");
    obj.rectangle53:setHeight(115);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setMargins({top=10});
    obj.rectangle53:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle53:setName("rectangle53");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle53);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(25);
    obj.layout53:setMargins({bottom=5});
    obj.layout53:setName("layout53");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout53);
    obj.label88:setAlign("left");
    obj.label88:setWidth(75);
    obj.label88:setText("Sabedoria");
    obj.label88:setName("label88");

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout53);
    obj.rectangle54:setAlign("left");
    obj.rectangle54:setWidth(50);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setMargins({right=5});
    obj.rectangle54:setName("rectangle54");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.rectangle54);
    obj.label89:setAlign("client");
    obj.label89:setField("sabedoriaMod");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle53);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(75);
    obj.layout54:setName("layout54");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout54);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(140);
    obj.layout55:setMargins({right=10});
    obj.layout55:setName("layout55");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout55);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout56);
    obj.label90:setAlign("left");
    obj.label90:setWidth(70);
    obj.label90:setText("Medicina");
    obj.label90:setMargins({right=5});
    obj.label90:setFontSize(10);
    obj.label90:setName("label90");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout56);
    obj.edit46:setAlign("left");
    obj.edit46:setWidth(30);
    obj.edit46:setField("medicinaNormal");
    obj.edit46:setMargins({right=5});
    obj.edit46:setName("edit46");

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout56);
    obj.rectangle55:setAlign("left");
    obj.rectangle55:setWidth(30);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.rectangle55);
    obj.label91:setAlign("client");
    obj.label91:setField("medicinaTotal");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout55);
    obj.dataLink19:setFields({'sabedoriaMod','medicinaNormal'});
    obj.dataLink19:setName("dataLink19");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout55);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout57);
    obj.label92:setAlign("left");
    obj.label92:setWidth(70);
    obj.label92:setText("Percepção");
    obj.label92:setMargins({right=5});
    obj.label92:setFontSize(10);
    obj.label92:setName("label92");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout57);
    obj.edit47:setAlign("left");
    obj.edit47:setWidth(30);
    obj.edit47:setField("percepcaoNormal");
    obj.edit47:setMargins({right=5});
    obj.edit47:setName("edit47");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout57);
    obj.rectangle56:setAlign("left");
    obj.rectangle56:setWidth(30);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.rectangle56);
    obj.label93:setAlign("client");
    obj.label93:setField("percepcaoTotal");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout55);
    obj.dataLink20:setFields({'sabedoriaMod','percepcaoNormal'});
    obj.dataLink20:setName("dataLink20");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout55);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout58);
    obj.label94:setAlign("left");
    obj.label94:setWidth(70);
    obj.label94:setText("Controle");
    obj.label94:setMargins({right=5});
    obj.label94:setFontSize(10);
    obj.label94:setName("label94");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout58);
    obj.edit48:setAlign("left");
    obj.edit48:setWidth(30);
    obj.edit48:setField("controleNormal");
    obj.edit48:setMargins({right=5});
    obj.edit48:setName("edit48");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout58);
    obj.rectangle57:setAlign("left");
    obj.rectangle57:setWidth(30);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.rectangle57);
    obj.label95:setAlign("client");
    obj.label95:setField("controleTotal");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout55);
    obj.dataLink21:setFields({'sabedoriaMod','controleNormal'});
    obj.dataLink21:setName("dataLink21");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout54);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(140);
    obj.layout59:setMargins({right=0});
    obj.layout59:setName("layout59");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout59);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout60);
    obj.label96:setAlign("left");
    obj.label96:setWidth(70);
    obj.label96:setText("Culinária");
    obj.label96:setMargins({right=5});
    obj.label96:setFontSize(10);
    obj.label96:setName("label96");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout60);
    obj.edit49:setAlign("left");
    obj.edit49:setWidth(30);
    obj.edit49:setField("culinariaNormal");
    obj.edit49:setMargins({right=5});
    obj.edit49:setName("edit49");

    obj.rectangle58 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout60);
    obj.rectangle58:setAlign("left");
    obj.rectangle58:setWidth(30);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle58);
    obj.label97:setAlign("client");
    obj.label97:setField("culinariaTotal");
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout59);
    obj.dataLink22:setFields({'sabedoriaMod','culinariaNormal'});
    obj.dataLink22:setName("dataLink22");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout59);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout61);
    obj.label98:setAlign("left");
    obj.label98:setWidth(70);
    obj.label98:setText("Sobrevivência");
    obj.label98:setMargins({right=5});
    obj.label98:setFontSize(10);
    obj.label98:setName("label98");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout61);
    obj.edit50:setAlign("left");
    obj.edit50:setWidth(30);
    obj.edit50:setField("sobrevivenciaNormal");
    obj.edit50:setMargins({right=5});
    obj.edit50:setName("edit50");

    obj.rectangle59 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout61);
    obj.rectangle59:setAlign("left");
    obj.rectangle59:setWidth(30);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.rectangle59);
    obj.label99:setAlign("client");
    obj.label99:setField("sobrevivenciaTotal");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout59);
    obj.dataLink23:setFields({'sabedoriaMod','sobrevivenciaNormal'});
    obj.dataLink23:setName("dataLink23");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout59);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout62);
    obj.label100:setAlign("left");
    obj.label100:setWidth(70);
    obj.label100:setText("Natureza");
    obj.label100:setMargins({right=5});
    obj.label100:setFontSize(10);
    obj.label100:setName("label100");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout62);
    obj.edit51:setAlign("left");
    obj.edit51:setWidth(30);
    obj.edit51:setField("naturezaNormal");
    obj.edit51:setMargins({right=5});
    obj.edit51:setName("edit51");

    obj.rectangle60 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout62);
    obj.rectangle60:setAlign("left");
    obj.rectangle60:setWidth(30);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.rectangle60);
    obj.label101:setAlign("client");
    obj.label101:setField("naturezaTotal");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout59);
    obj.dataLink24:setFields({'sabedoriaMod','naturezaNormal'});
    obj.dataLink24:setName("dataLink24");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.scrollBox3);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(300);
    obj.layout63:setMargins({right=10});
    obj.layout63:setName("layout63");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout63);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(520);
    obj.layout64:setName("layout64");

    obj.rectangle61 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout64);
    obj.rectangle61:setAlign("top");
    obj.rectangle61:setHeight(115);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setMargins({top=0});
    obj.rectangle61:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle61:setName("rectangle61");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle61);
    obj.layout65:setAlign("top");
    obj.layout65:setHeight(25);
    obj.layout65:setMargins({bottom=5});
    obj.layout65:setName("layout65");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout65);
    obj.label102:setAlign("left");
    obj.label102:setWidth(75);
    obj.label102:setText("Intelecto");
    obj.label102:setName("label102");

    obj.rectangle62 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout65);
    obj.rectangle62:setAlign("left");
    obj.rectangle62:setWidth(50);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setMargins({right=5});
    obj.rectangle62:setName("rectangle62");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.rectangle62);
    obj.label103:setAlign("client");
    obj.label103:setField("intelectoMod");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle61);
    obj.layout66:setAlign("top");
    obj.layout66:setHeight(75);
    obj.layout66:setName("layout66");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout66);
    obj.layout67:setAlign("left");
    obj.layout67:setWidth(140);
    obj.layout67:setMargins({right=10});
    obj.layout67:setName("layout67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout67);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout68);
    obj.label104:setAlign("left");
    obj.label104:setWidth(70);
    obj.label104:setText("Mecânica");
    obj.label104:setMargins({right=5});
    obj.label104:setFontSize(10);
    obj.label104:setName("label104");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout68);
    obj.edit52:setAlign("left");
    obj.edit52:setWidth(30);
    obj.edit52:setField("mecanicaNormal");
    obj.edit52:setMargins({right=5});
    obj.edit52:setName("edit52");

    obj.rectangle63 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout68);
    obj.rectangle63:setAlign("left");
    obj.rectangle63:setWidth(30);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.rectangle63);
    obj.label105:setAlign("client");
    obj.label105:setField("mecanicaTotal");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout67);
    obj.dataLink25:setFields({'intelectoMod','mecanicaNormal'});
    obj.dataLink25:setName("dataLink25");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout67);
    obj.layout69:setAlign("top");
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout69);
    obj.label106:setAlign("left");
    obj.label106:setWidth(70);
    obj.label106:setText("Investigação");
    obj.label106:setMargins({right=5});
    obj.label106:setFontSize(10);
    obj.label106:setName("label106");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout69);
    obj.edit53:setAlign("left");
    obj.edit53:setWidth(30);
    obj.edit53:setField("investigacaoNormal");
    obj.edit53:setMargins({right=5});
    obj.edit53:setName("edit53");

    obj.rectangle64 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout69);
    obj.rectangle64:setAlign("left");
    obj.rectangle64:setWidth(30);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.rectangle64);
    obj.label107:setAlign("client");
    obj.label107:setField("investigacaoTotal");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout67);
    obj.dataLink26:setFields({'intelectoMod','investigacaoNormal'});
    obj.dataLink26:setName("dataLink26");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout67);
    obj.layout70:setAlign("top");
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout70);
    obj.label108:setAlign("left");
    obj.label108:setWidth(70);
    obj.label108:setText("Poder");
    obj.label108:setMargins({right=5});
    obj.label108:setFontSize(10);
    obj.label108:setName("label108");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout70);
    obj.edit54:setAlign("left");
    obj.edit54:setWidth(30);
    obj.edit54:setField("poderNormal");
    obj.edit54:setMargins({right=5});
    obj.edit54:setName("edit54");

    obj.rectangle65 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout70);
    obj.rectangle65:setAlign("left");
    obj.rectangle65:setWidth(30);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.rectangle65);
    obj.label109:setAlign("client");
    obj.label109:setField("poderTotal");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.dataLink27 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout67);
    obj.dataLink27:setFields({'intelectoMod','poderNormal'});
    obj.dataLink27:setName("dataLink27");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout66);
    obj.layout71:setAlign("left");
    obj.layout71:setWidth(140);
    obj.layout71:setMargins({right=0});
    obj.layout71:setName("layout71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout71);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout72);
    obj.label110:setAlign("left");
    obj.label110:setWidth(70);
    obj.label110:setText("Fisica/Quimica");
    obj.label110:setMargins({right=5});
    obj.label110:setFontSize(10);
    obj.label110:setName("label110");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout72);
    obj.edit55:setAlign("left");
    obj.edit55:setWidth(30);
    obj.edit55:setField("fisicaNormal");
    obj.edit55:setMargins({right=5});
    obj.edit55:setName("edit55");

    obj.rectangle66 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout72);
    obj.rectangle66:setAlign("left");
    obj.rectangle66:setWidth(30);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle66);
    obj.label111:setAlign("client");
    obj.label111:setField("fisicaTotal");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.dataLink28 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout71);
    obj.dataLink28:setFields({'intelectoMod','fisicaNormal'});
    obj.dataLink28:setName("dataLink28");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout71);
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout73);
    obj.label112:setAlign("left");
    obj.label112:setWidth(70);
    obj.label112:setText("Computação");
    obj.label112:setMargins({right=5});
    obj.label112:setFontSize(10);
    obj.label112:setName("label112");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout73);
    obj.edit56:setAlign("left");
    obj.edit56:setWidth(30);
    obj.edit56:setField("computacaoNormal");
    obj.edit56:setMargins({right=5});
    obj.edit56:setName("edit56");

    obj.rectangle67 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout73);
    obj.rectangle67:setAlign("left");
    obj.rectangle67:setWidth(30);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.rectangle67);
    obj.label113:setAlign("client");
    obj.label113:setField("computacaoTotal");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.dataLink29 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout71);
    obj.dataLink29:setFields({'intelectoMod','computacaoNormal'});
    obj.dataLink29:setName("dataLink29");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout71);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout74);
    obj.label114:setAlign("left");
    obj.label114:setWidth(70);
    obj.label114:setText("Sociedade");
    obj.label114:setMargins({right=5});
    obj.label114:setFontSize(10);
    obj.label114:setName("label114");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout74);
    obj.edit57:setAlign("left");
    obj.edit57:setWidth(30);
    obj.edit57:setField("sociedadeNormal");
    obj.edit57:setMargins({right=5});
    obj.edit57:setName("edit57");

    obj.rectangle68 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout74);
    obj.rectangle68:setAlign("left");
    obj.rectangle68:setWidth(30);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.rectangle68);
    obj.label115:setAlign("client");
    obj.label115:setField("sociedadeTotal");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.dataLink30 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout71);
    obj.dataLink30:setFields({'intelectoMod','sociedadeNormal'});
    obj.dataLink30:setName("dataLink30");

    obj.rectangle69 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout64);
    obj.rectangle69:setAlign("top");
    obj.rectangle69:setHeight(115);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setMargins({top=10});
    obj.rectangle69:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle69:setName("rectangle69");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle69);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(25);
    obj.layout75:setMargins({bottom=5});
    obj.layout75:setName("layout75");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout75);
    obj.label116:setAlign("left");
    obj.label116:setWidth(75);
    obj.label116:setText("Carisma");
    obj.label116:setName("label116");

    obj.rectangle70 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout75);
    obj.rectangle70:setAlign("left");
    obj.rectangle70:setWidth(50);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setMargins({right=5});
    obj.rectangle70:setName("rectangle70");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.rectangle70);
    obj.label117:setAlign("client");
    obj.label117:setField("carismaMod");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.rectangle69);
    obj.layout76:setAlign("top");
    obj.layout76:setHeight(75);
    obj.layout76:setName("layout76");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout76);
    obj.layout77:setAlign("left");
    obj.layout77:setWidth(140);
    obj.layout77:setMargins({right=10});
    obj.layout77:setName("layout77");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout77);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(25);
    obj.layout78:setName("layout78");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout78);
    obj.label118:setAlign("left");
    obj.label118:setWidth(70);
    obj.label118:setText("Enganar");
    obj.label118:setMargins({right=5});
    obj.label118:setFontSize(10);
    obj.label118:setName("label118");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout78);
    obj.edit58:setAlign("left");
    obj.edit58:setWidth(30);
    obj.edit58:setField("enganarNormal");
    obj.edit58:setMargins({right=5});
    obj.edit58:setName("edit58");

    obj.rectangle71 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout78);
    obj.rectangle71:setAlign("left");
    obj.rectangle71:setWidth(30);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.rectangle71);
    obj.label119:setAlign("client");
    obj.label119:setField("enganarTotal");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");

    obj.dataLink31 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout77);
    obj.dataLink31:setFields({'carismaMod','enganarNormal'});
    obj.dataLink31:setName("dataLink31");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout77);
    obj.layout79:setAlign("top");
    obj.layout79:setHeight(25);
    obj.layout79:setName("layout79");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout79);
    obj.label120:setAlign("left");
    obj.label120:setWidth(70);
    obj.label120:setText("Intimidar");
    obj.label120:setMargins({right=5});
    obj.label120:setFontSize(10);
    obj.label120:setName("label120");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout79);
    obj.edit59:setAlign("left");
    obj.edit59:setWidth(30);
    obj.edit59:setField("intimidarNormal");
    obj.edit59:setMargins({right=5});
    obj.edit59:setName("edit59");

    obj.rectangle72 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout79);
    obj.rectangle72:setAlign("left");
    obj.rectangle72:setWidth(30);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.rectangle72);
    obj.label121:setAlign("client");
    obj.label121:setField("intimidarTotal");
    obj.label121:setHorzTextAlign("center");
    obj.label121:setName("label121");

    obj.dataLink32 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout77);
    obj.dataLink32:setFields({'carismaMod','intimidarNormal'});
    obj.dataLink32:setName("dataLink32");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.layout77);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(25);
    obj.layout80:setName("layout80");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout80);
    obj.label122:setAlign("left");
    obj.label122:setWidth(70);
    obj.label122:setText("Atuar");
    obj.label122:setMargins({right=5});
    obj.label122:setFontSize(10);
    obj.label122:setName("label122");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout80);
    obj.edit60:setAlign("left");
    obj.edit60:setWidth(30);
    obj.edit60:setField("atuarNormal");
    obj.edit60:setMargins({right=5});
    obj.edit60:setName("edit60");

    obj.rectangle73 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout80);
    obj.rectangle73:setAlign("left");
    obj.rectangle73:setWidth(30);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.rectangle73);
    obj.label123:setAlign("client");
    obj.label123:setField("atuarTotal");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.dataLink33 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout77);
    obj.dataLink33:setFields({'carismaMod','atuarNormal'});
    obj.dataLink33:setName("dataLink33");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.layout76);
    obj.layout81:setAlign("left");
    obj.layout81:setWidth(140);
    obj.layout81:setMargins({right=0});
    obj.layout81:setName("layout81");

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout81);
    obj.layout82:setAlign("top");
    obj.layout82:setHeight(25);
    obj.layout82:setName("layout82");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout82);
    obj.label124:setAlign("left");
    obj.label124:setWidth(70);
    obj.label124:setText("Heroismo");
    obj.label124:setMargins({right=5});
    obj.label124:setFontSize(10);
    obj.label124:setName("label124");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout82);
    obj.edit61:setAlign("left");
    obj.edit61:setWidth(30);
    obj.edit61:setField("heroismoNormal");
    obj.edit61:setMargins({right=5});
    obj.edit61:setName("edit61");

    obj.rectangle74 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout82);
    obj.rectangle74:setAlign("left");
    obj.rectangle74:setWidth(30);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.label125 = GUI.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.rectangle74);
    obj.label125:setAlign("client");
    obj.label125:setField("heroismoTotal");
    obj.label125:setHorzTextAlign("center");
    obj.label125:setName("label125");

    obj.dataLink34 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout81);
    obj.dataLink34:setFields({'carismaMod','heroismoNormal'});
    obj.dataLink34:setName("dataLink34");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.layout81);
    obj.layout83:setAlign("top");
    obj.layout83:setHeight(25);
    obj.layout83:setName("layout83");

    obj.label126 = GUI.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout83);
    obj.label126:setAlign("left");
    obj.label126:setWidth(70);
    obj.label126:setText("Cantar");
    obj.label126:setMargins({right=5});
    obj.label126:setFontSize(10);
    obj.label126:setName("label126");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout83);
    obj.edit62:setAlign("left");
    obj.edit62:setWidth(30);
    obj.edit62:setField("cantarNormal");
    obj.edit62:setMargins({right=5});
    obj.edit62:setName("edit62");

    obj.rectangle75 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout83);
    obj.rectangle75:setAlign("left");
    obj.rectangle75:setWidth(30);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.label127 = GUI.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.rectangle75);
    obj.label127:setAlign("client");
    obj.label127:setField("cantarTotal");
    obj.label127:setHorzTextAlign("center");
    obj.label127:setName("label127");

    obj.dataLink35 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout81);
    obj.dataLink35:setFields({'carismaMod','cantarNormal'});
    obj.dataLink35:setName("dataLink35");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.layout81);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(25);
    obj.layout84:setName("layout84");

    obj.label128 = GUI.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout84);
    obj.label128:setAlign("left");
    obj.label128:setWidth(70);
    obj.label128:setText("Persuadir");
    obj.label128:setMargins({right=5});
    obj.label128:setFontSize(10);
    obj.label128:setName("label128");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout84);
    obj.edit63:setAlign("left");
    obj.edit63:setWidth(30);
    obj.edit63:setField("persuadirNormal");
    obj.edit63:setMargins({right=5});
    obj.edit63:setName("edit63");

    obj.rectangle76 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout84);
    obj.rectangle76:setAlign("left");
    obj.rectangle76:setWidth(30);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.label129 = GUI.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.rectangle76);
    obj.label129:setAlign("client");
    obj.label129:setField("persuadirTotal");
    obj.label129:setHorzTextAlign("center");
    obj.label129:setName("label129");

    obj.dataLink36 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout81);
    obj.dataLink36:setFields({'carismaMod','persuadirNormal'});
    obj.dataLink36:setName("dataLink36");

    obj.rectangle77 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout64);
    obj.rectangle77:setAlign("top");
    obj.rectangle77:setHeight(115);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setMargins({top=10});
    obj.rectangle77:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle77:setName("rectangle77");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.rectangle77);
    obj.layout85:setAlign("top");
    obj.layout85:setHeight(25);
    obj.layout85:setMargins({bottom=5});
    obj.layout85:setName("layout85");

    obj.label130 = GUI.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout85);
    obj.label130:setAlign("left");
    obj.label130:setWidth(75);
    obj.label130:setText("Resistência");
    obj.label130:setName("label130");

    obj.rectangle78 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout85);
    obj.rectangle78:setAlign("left");
    obj.rectangle78:setWidth(50);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setMargins({right=5});
    obj.rectangle78:setName("rectangle78");

    obj.label131 = GUI.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.rectangle78);
    obj.label131:setAlign("client");
    obj.label131:setField("resistenciaMod");
    obj.label131:setHorzTextAlign("center");
    obj.label131:setName("label131");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle77);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(75);
    obj.layout86:setName("layout86");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.layout86);
    obj.layout87:setAlign("left");
    obj.layout87:setWidth(140);
    obj.layout87:setMargins({right=10});
    obj.layout87:setName("layout87");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.layout87);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(25);
    obj.layout88:setName("layout88");

    obj.label132 = GUI.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout88);
    obj.label132:setAlign("left");
    obj.label132:setWidth(70);
    obj.label132:setText("Resistir");
    obj.label132:setMargins({right=5});
    obj.label132:setFontSize(10);
    obj.label132:setName("label132");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout88);
    obj.edit64:setAlign("left");
    obj.edit64:setWidth(30);
    obj.edit64:setField("resistirNormal");
    obj.edit64:setMargins({right=5});
    obj.edit64:setName("edit64");

    obj.rectangle79 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout88);
    obj.rectangle79:setAlign("left");
    obj.rectangle79:setWidth(30);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setName("rectangle79");

    obj.label133 = GUI.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.rectangle79);
    obj.label133:setAlign("client");
    obj.label133:setField("resistirTotal");
    obj.label133:setHorzTextAlign("center");
    obj.label133:setName("label133");

    obj.dataLink37 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout87);
    obj.dataLink37:setFields({'resistenciaMod','resistirNormal'});
    obj.dataLink37:setName("dataLink37");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.layout86);
    obj.layout89:setAlign("left");
    obj.layout89:setWidth(140);
    obj.layout89:setMargins({right=0});
    obj.layout89:setName("layout89");

    obj.rectangle80 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout64);
    obj.rectangle80:setAlign("top");
    obj.rectangle80:setHeight(115);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setMargins({top=10});
    obj.rectangle80:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle80:setName("rectangle80");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle80);
    obj.layout90:setAlign("top");
    obj.layout90:setHeight(25);
    obj.layout90:setMargins({bottom=5});
    obj.layout90:setName("layout90");

    obj.label134 = GUI.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout90);
    obj.label134:setAlign("left");
    obj.label134:setWidth(75);
    obj.label134:setText("Vitalidade");
    obj.label134:setName("label134");

    obj.rectangle81 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout90);
    obj.rectangle81:setAlign("left");
    obj.rectangle81:setWidth(50);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setMargins({right=5});
    obj.rectangle81:setName("rectangle81");

    obj.label135 = GUI.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.rectangle81);
    obj.label135:setAlign("client");
    obj.label135:setField("vitalidadeMod");
    obj.label135:setHorzTextAlign("center");
    obj.label135:setName("label135");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle80);
    obj.layout91:setAlign("top");
    obj.layout91:setHeight(75);
    obj.layout91:setName("layout91");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout91);
    obj.layout92:setAlign("left");
    obj.layout92:setWidth(140);
    obj.layout92:setMargins({right=10});
    obj.layout92:setName("layout92");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout92);
    obj.layout93:setAlign("top");
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.label136 = GUI.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout93);
    obj.label136:setAlign("left");
    obj.label136:setWidth(70);
    obj.label136:setText("Folêgo");
    obj.label136:setMargins({right=5});
    obj.label136:setFontSize(10);
    obj.label136:setName("label136");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout93);
    obj.edit65:setAlign("left");
    obj.edit65:setWidth(30);
    obj.edit65:setField("folegoNormal");
    obj.edit65:setMargins({right=5});
    obj.edit65:setName("edit65");

    obj.rectangle82 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout93);
    obj.rectangle82:setAlign("left");
    obj.rectangle82:setWidth(30);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.label137 = GUI.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.rectangle82);
    obj.label137:setAlign("client");
    obj.label137:setField("folegoTotal");
    obj.label137:setHorzTextAlign("center");
    obj.label137:setName("label137");

    obj.dataLink38 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout92);
    obj.dataLink38:setFields({'vitalidadeMod','folegoNormal'});
    obj.dataLink38:setName("dataLink38");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout91);
    obj.layout94:setAlign("left");
    obj.layout94:setWidth(140);
    obj.layout94:setMargins({right=0});
    obj.layout94:setName("layout94");

    obj.dataLink39 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.scrollBox3);
    obj.dataLink39:setFields({'atletismoNormal','halterofiliaNormal','sentidosNormal','coragemNormal','acrobaciaNormal','manuseioNormal','dancarNormal','furtividadeNormal','medicinaNormal','percepcaoNormal','culinariaNormal','sobrevivenciaNormal','controleNormal','naturezaNormal','mecanicaNormal','investigacaoNormal','fisicaNormal','computacaoNormal','poderNormal','sociedadeNormal','enganarNormal','intimidarNormal','heroismoNormal','cantarNormal','atuarNormal','persuadirNormal','resistirNormal','folegoNormal'});
    obj.dataLink39:setName("dataLink39");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Vantagens");
    obj.tab4:setName("tab4");

    obj.frmAdvantages = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAdvantages:setParent(obj.tab4);
    obj.frmAdvantages:setName("frmAdvantages");
    obj.frmAdvantages:setAlign("client");

    obj.popVantagem = GUI.fromHandle(_obj_newObject("popup"));
    obj.popVantagem:setParent(obj.frmAdvantages);
    obj.popVantagem:setName("popVantagem");
    obj.popVantagem:setWidth(300);
    obj.popVantagem:setHeight(240);
    obj.popVantagem:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popVantagem, "autoScopeNode",  "false");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.popVantagem);
    obj.layout95:setAlign("top");
    obj.layout95:setHeight(50);
    obj.layout95:setMargins({left=5,right=5});
    obj.layout95:setName("layout95");

    obj.label138 = GUI.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout95);
    obj.label138:setAlign("top");
    obj.label138:setHeight(25);
    obj.label138:setText("Nome");
    obj.label138:setName("label138");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout95);
    obj.edit66:setAlign("top");
    obj.edit66:setHeight(25);
    obj.edit66:setField("nome");
    obj.edit66:setName("edit66");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.popVantagem);
    obj.layout96:setAlign("top");
    obj.layout96:setHeight(50);
    obj.layout96:setMargins({left=5,right=5});
    obj.layout96:setName("layout96");

    obj.label139 = GUI.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout96);
    obj.label139:setAlign("top");
    obj.label139:setHeight(25);
    obj.label139:setText("Custo");
    obj.label139:setName("label139");

    obj.edit67 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout96);
    obj.edit67:setAlign("top");
    obj.edit67:setHeight(25);
    obj.edit67:setField("custo");
    obj.edit67:setName("edit67");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.popVantagem);
    obj.layout97:setAlign("client");
    obj.layout97:setMargins({left=5,right=5});
    obj.layout97:setName("layout97");

    obj.label140 = GUI.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout97);
    obj.label140:setAlign("top");
    obj.label140:setHeight(25);
    obj.label140:setText("Descrição");
    obj.label140:setName("label140");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout97);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setHeight(25);
    obj.textEditor5:setField("descricao");
    obj.textEditor5:setName("textEditor5");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmAdvantages);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox4);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxColumns(3);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setName("flowLayout1");

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
				



			


    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.campoDasVantagensPart);
    obj.layout98:setAlign("top");
    obj.layout98:setHeight(25);
    obj.layout98:setName("layout98");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout98);
    obj.button1:setText("+");
    obj.button1:setAlign("left");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.label141 = GUI.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout98);
    obj.label141:setText("VANTAGENS");
    obj.label141:setAlign("left");
    obj.label141:setWidth(225);
    obj.label141:setMargins({left=5});
    obj.label141:setName("label141");

    obj.campoDasVantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasVantagens:setParent(obj.campoDasVantagensPart);
    obj.campoDasVantagens:setName("campoDasVantagens");
    obj.campoDasVantagens:setField("campoDasVantagens");
    obj.campoDasVantagens:setTemplateForm("frmAdvantage");
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
				



			


    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.campoDasDesvantagensPart);
    obj.layout99:setAlign("top");
    obj.layout99:setHeight(25);
    obj.layout99:setName("layout99");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout99);
    obj.button2:setText("+");
    obj.button2:setAlign("left");
    obj.button2:setWidth(30);
    obj.button2:setName("button2");

    obj.label142 = GUI.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout99);
    obj.label142:setText("DESVANTAGENS");
    obj.label142:setAlign("left");
    obj.label142:setWidth(225);
    obj.label142:setMargins({left=5});
    obj.label142:setName("label142");

    obj.campoDasDesvantagens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasDesvantagens:setParent(obj.campoDasDesvantagensPart);
    obj.campoDasDesvantagens:setName("campoDasDesvantagens");
    obj.campoDasDesvantagens:setField("campoDosOutroscampoDasDesvantagens");
    obj.campoDasDesvantagens:setTemplateForm("frmAdvantage");
    obj.campoDasDesvantagens:setAlign("top");
    obj.campoDasDesvantagens:setLayout("vertical");
    obj.campoDasDesvantagens:setAutoHeight(true);
    obj.campoDasDesvantagens:setHitTest(false);
    obj.campoDasDesvantagens:setMinQt(1);

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Equipamentos");
    obj.tab5:setName("tab5");

    obj.frmEquipments = GUI.fromHandle(_obj_newObject("form"));
    obj.frmEquipments:setParent(obj.tab5);
    obj.frmEquipments:setName("frmEquipments");
    obj.frmEquipments:setAlign("client");

    obj.popEquipment = GUI.fromHandle(_obj_newObject("popup"));
    obj.popEquipment:setParent(obj.frmEquipments);
    obj.popEquipment:setName("popEquipment");
    obj.popEquipment:setWidth(400);
    obj.popEquipment:setHeight(440);
    obj.popEquipment:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popEquipment, "autoScopeNode",  "false");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.popEquipment);
    obj.layout100:setAlign("top");
    obj.layout100:setHeight(25);
    obj.layout100:setName("layout100");

    obj.label143 = GUI.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout100);
    obj.label143:setAlign("left");
    obj.label143:setWidth(50);
    obj.label143:setText("Nome");
    obj.label143:setHorzTextAlign("center");
    obj.label143:setName("label143");

    obj.edit68 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout100);
    obj.edit68:setAlign("left");
    obj.edit68:setWidth(200);
    obj.edit68:setField("nome");
    obj.edit68:setName("edit68");

    obj.label144 = GUI.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout100);
    obj.label144:setAlign("left");
    obj.label144:setWidth(50);
    obj.label144:setText("Nível");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.edit69 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout100);
    obj.edit69:setAlign("left");
    obj.edit69:setWidth(50);
    obj.edit69:setField("nivel");
    obj.edit69:setName("edit69");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout100);
    obj.button3:setAlign("left");
    obj.button3:setWidth(25);
    obj.button3:setText("X");
    obj.button3:setMargins({left=5});
    obj.button3:setName("button3");

    obj.layout101 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.popEquipment);
    obj.layout101:setAlign("top");
    obj.layout101:setHeight(200);
    obj.layout101:setMargins({top=5});
    obj.layout101:setName("layout101");

    obj.rectangle83 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout101);
    obj.rectangle83:setAlign("left");
    obj.rectangle83:setWidth(200);
    obj.rectangle83:setColor("black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setMargins({right=5});
    obj.rectangle83:setName("rectangle83");

    obj.label145 = GUI.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.rectangle83);
    obj.label145:setAlign("client");
    obj.label145:setText("Item");
    obj.label145:setHorzTextAlign("center");
    obj.label145:setName("label145");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.label145);
    obj.image3:setAlign("client");
    obj.image3:setField("icon");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image3:setName("image3");

    obj.layout102 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.layout101);
    obj.layout102:setAlign("client");
    obj.layout102:setName("layout102");

    obj.layout103 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout102);
    obj.layout103:setAlign("top");
    obj.layout103:setHeight(100);
    obj.layout103:setMargins({top=0, bottom=0});
    obj.layout103:setName("layout103");

    obj.layout104 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.layout103);
    obj.layout104:setAlign("client");
    obj.layout104:setMargins({left=5,right=5});
    obj.layout104:setName("layout104");

    obj.label146 = GUI.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout104);
    obj.label146:setAlign("top");
    obj.label146:setHeight(25);
    obj.label146:setText("Função");
    obj.label146:setName("label146");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout104);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setHeight(25);
    obj.textEditor6:setField("funcao");
    obj.textEditor6:setName("textEditor6");

    obj.layout105 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.layout102);
    obj.layout105:setAlign("top");
    obj.layout105:setHeight(100);
    obj.layout105:setMargins({top=0, bottom=0});
    obj.layout105:setName("layout105");

    obj.layout106 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.layout105);
    obj.layout106:setAlign("client");
    obj.layout106:setMargins({left=5,right=5});
    obj.layout106:setName("layout106");

    obj.label147 = GUI.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout106);
    obj.label147:setAlign("top");
    obj.label147:setHeight(25);
    obj.label147:setText("Efeito/Dano");
    obj.label147:setName("label147");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout106);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setHeight(25);
    obj.textEditor7:setField("efeito");
    obj.textEditor7:setName("textEditor7");

    obj.layout107 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.popEquipment);
    obj.layout107:setAlign("top");
    obj.layout107:setHeight(200);
    obj.layout107:setMargins({top=0, bottom=5});
    obj.layout107:setName("layout107");

    obj.layout108 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout107);
    obj.layout108:setAlign("client");
    obj.layout108:setMargins({left=5,right=5});
    obj.layout108:setName("layout108");

    obj.label148 = GUI.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout108);
    obj.label148:setAlign("top");
    obj.label148:setHeight(25);
    obj.label148:setText("Descrição");
    obj.label148:setName("label148");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout108);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setHeight(25);
    obj.textEditor8:setField("descricao");
    obj.textEditor8:setName("textEditor8");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmEquipments);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout109 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.scrollBox5);
    obj.layout109:setAlign("top");
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout109);
    obj.button4:setText("+");
    obj.button4:setAlign("left");
    obj.button4:setWidth(30);
    obj.button4:setName("button4");

    obj.label149 = GUI.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout109);
    obj.label149:setText("EQUIPAMENTOS");
    obj.label149:setAlign("left");
    obj.label149:setWidth(225);
    obj.label149:setMargins({left=5});
    obj.label149:setName("label149");

    obj.campoDosEquipamentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDosEquipamentos:setParent(obj.scrollBox5);
    obj.campoDosEquipamentos:setName("campoDosEquipamentos");
    obj.campoDosEquipamentos:setField("campoDosEquipamentos");
    obj.campoDosEquipamentos:setTemplateForm("frmEquipment");
    obj.campoDosEquipamentos:setAlign("client");
    obj.campoDosEquipamentos:setLayout("verticalTiles");
    obj.campoDosEquipamentos:setAutoHeight(false);
    obj.campoDosEquipamentos:setHitTest(false);
    obj.campoDosEquipamentos:setMinQt(1);

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Habilidades");
    obj.tab6:setName("tab6");

    obj.frmAbilities = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAbilities:setParent(obj.tab6);
    obj.frmAbilities:setName("frmAbilities");
    obj.frmAbilities:setAlign("client");

    obj.popAbility = GUI.fromHandle(_obj_newObject("popup"));
    obj.popAbility:setParent(obj.frmAbilities);
    obj.popAbility:setName("popAbility");
    obj.popAbility:setWidth(400);
    obj.popAbility:setHeight(440);
    obj.popAbility:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popAbility, "autoScopeNode",  "false");

    obj.layout110 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.popAbility);
    obj.layout110:setAlign("top");
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.label150 = GUI.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout110);
    obj.label150:setAlign("left");
    obj.label150:setWidth(50);
    obj.label150:setText("Nome");
    obj.label150:setHorzTextAlign("center");
    obj.label150:setName("label150");

    obj.edit70 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout110);
    obj.edit70:setAlign("left");
    obj.edit70:setWidth(200);
    obj.edit70:setField("nome");
    obj.edit70:setName("edit70");

    obj.label151 = GUI.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout110);
    obj.label151:setAlign("left");
    obj.label151:setWidth(50);
    obj.label151:setText("Nível");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.edit71 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout110);
    obj.edit71:setAlign("left");
    obj.edit71:setWidth(50);
    obj.edit71:setField("nivel");
    obj.edit71:setName("edit71");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout110);
    obj.button5:setAlign("left");
    obj.button5:setWidth(25);
    obj.button5:setText("X");
    obj.button5:setMargins({left=5});
    obj.button5:setName("button5");

    obj.layout111 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.popAbility);
    obj.layout111:setAlign("top");
    obj.layout111:setHeight(200);
    obj.layout111:setMargins({top=5});
    obj.layout111:setName("layout111");

    obj.rectangle84 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout111);
    obj.rectangle84:setAlign("left");
    obj.rectangle84:setWidth(200);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setMargins({right=5});
    obj.rectangle84:setName("rectangle84");

    obj.label152 = GUI.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.rectangle84);
    obj.label152:setAlign("client");
    obj.label152:setText("Habilidade");
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.label152);
    obj.image4:setAlign("client");
    obj.image4:setField("icon");
    obj.image4:setEditable(true);
    obj.image4:setStyle("autoFit");
    obj.image4:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image4:setName("image4");

    obj.layout112 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout111);
    obj.layout112:setAlign("client");
    obj.layout112:setName("layout112");

    obj.layout113 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout112);
    obj.layout113:setAlign("top");
    obj.layout113:setHeight(50);
    obj.layout113:setMargins({top=0, bottom=0});
    obj.layout113:setName("layout113");

    obj.layout114 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.layout113);
    obj.layout114:setAlign("top");
    obj.layout114:setHeight(50);
    obj.layout114:setMargins({left=5,right=5});
    obj.layout114:setName("layout114");

    obj.label153 = GUI.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout114);
    obj.label153:setAlign("top");
    obj.label153:setHeight(25);
    obj.label153:setText("Alcance");
    obj.label153:setName("label153");

    obj.edit72 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout114);
    obj.edit72:setAlign("top");
    obj.edit72:setHeight(25);
    obj.edit72:setField("alcance");
    obj.edit72:setName("edit72");

    obj.layout115 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.layout112);
    obj.layout115:setAlign("top");
    obj.layout115:setHeight(50);
    obj.layout115:setMargins({top=0, bottom=0});
    obj.layout115:setName("layout115");

    obj.layout116 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.layout115);
    obj.layout116:setAlign("top");
    obj.layout116:setHeight(50);
    obj.layout116:setMargins({left=5,right=5});
    obj.layout116:setName("layout116");

    obj.label154 = GUI.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout116);
    obj.label154:setAlign("top");
    obj.label154:setHeight(25);
    obj.label154:setText("Custo");
    obj.label154:setName("label154");

    obj.edit73 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout116);
    obj.edit73:setAlign("top");
    obj.edit73:setHeight(25);
    obj.edit73:setField("custo");
    obj.edit73:setName("edit73");

    obj.layout117 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout117:setParent(obj.layout112);
    obj.layout117:setAlign("top");
    obj.layout117:setHeight(100);
    obj.layout117:setMargins({top=0, bottom=0});
    obj.layout117:setName("layout117");

    obj.layout118 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout118:setParent(obj.layout117);
    obj.layout118:setAlign("client");
    obj.layout118:setMargins({left=5,right=5});
    obj.layout118:setName("layout118");

    obj.label155 = GUI.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout118);
    obj.label155:setAlign("top");
    obj.label155:setHeight(25);
    obj.label155:setText("Efeito/Dano");
    obj.label155:setName("label155");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout118);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setHeight(25);
    obj.textEditor9:setField("efeito");
    obj.textEditor9:setName("textEditor9");

    obj.layout119 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout119:setParent(obj.popAbility);
    obj.layout119:setAlign("top");
    obj.layout119:setHeight(200);
    obj.layout119:setMargins({top=0, bottom=5});
    obj.layout119:setName("layout119");

    obj.layout120 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout120:setParent(obj.layout119);
    obj.layout120:setAlign("client");
    obj.layout120:setMargins({left=5,right=5});
    obj.layout120:setName("layout120");

    obj.label156 = GUI.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout120);
    obj.label156:setAlign("top");
    obj.label156:setHeight(25);
    obj.label156:setText("Descrição");
    obj.label156:setName("label156");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout120);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setHeight(25);
    obj.textEditor10:setField("descricao");
    obj.textEditor10:setName("textEditor10");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmAbilities);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.layout121 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout121:setParent(obj.scrollBox6);
    obj.layout121:setAlign("top");
    obj.layout121:setHeight(25);
    obj.layout121:setName("layout121");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout121);
    obj.button6:setText("+");
    obj.button6:setAlign("left");
    obj.button6:setWidth(30);
    obj.button6:setName("button6");

    obj.label157 = GUI.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout121);
    obj.label157:setText("HABILIDADES");
    obj.label157:setAlign("left");
    obj.label157:setWidth(225);
    obj.label157:setMargins({left=5});
    obj.label157:setName("label157");

    obj.campoDasHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.campoDasHabilidades:setParent(obj.scrollBox6);
    obj.campoDasHabilidades:setName("campoDasHabilidades");
    obj.campoDasHabilidades:setField("campoDasHabilidades");
    obj.campoDasHabilidades:setTemplateForm("frmAbility");
    obj.campoDasHabilidades:setAlign("client");
    obj.campoDasHabilidades:setLayout("verticalTiles");
    obj.campoDasHabilidades:setAutoHeight(false);
    obj.campoDasHabilidades:setHitTest(false);
    obj.campoDasHabilidades:setMinQt(1);

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Historia");
    obj.tab7:setName("tab7");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab7);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.frmTemplateDescription);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Anotações");
    obj.tab8:setName("tab8");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab8);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmTemplateNotes);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout122 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout122:setParent(obj.scrollBox7);
    obj.layout122:setAlign("left");
    obj.layout122:setWidth(400);
    obj.layout122:setMargins({right=10});
    obj.layout122:setName("layout122");

    obj.rectangle85 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout122);
    obj.rectangle85:setAlign("client");
    obj.rectangle85:setColor("black");
    obj.rectangle85:setXradius(5);
    obj.rectangle85:setYradius(15);
    obj.rectangle85:setCornerType("round");
    obj.rectangle85:setName("rectangle85");

    obj.label158 = GUI.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.rectangle85);
    obj.label158:setAlign("top");
    obj.label158:setHeight(20);
    obj.label158:setText("Anotações");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle85);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("anotacoes1");
    obj.textEditor11:setMargins({left=10,right=10,bottom=10});
    obj.textEditor11:setName("textEditor11");

    obj.layout123 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout123:setParent(obj.scrollBox7);
    obj.layout123:setAlign("left");
    obj.layout123:setWidth(400);
    obj.layout123:setMargins({right=10});
    obj.layout123:setName("layout123");

    obj.rectangle86 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout123);
    obj.rectangle86:setAlign("client");
    obj.rectangle86:setColor("black");
    obj.rectangle86:setXradius(5);
    obj.rectangle86:setYradius(15);
    obj.rectangle86:setCornerType("round");
    obj.rectangle86:setName("rectangle86");

    obj.label159 = GUI.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.rectangle86);
    obj.label159:setAlign("top");
    obj.label159:setHeight(20);
    obj.label159:setText("Anotações");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle86);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("anotacoes2");
    obj.textEditor12:setMargins({left=10,right=10,bottom=10});
    obj.textEditor12:setName("textEditor12");

    obj.layout124 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout124:setParent(obj.scrollBox7);
    obj.layout124:setAlign("left");
    obj.layout124:setWidth(400);
    obj.layout124:setMargins({right=10});
    obj.layout124:setName("layout124");

    obj.rectangle87 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout124);
    obj.rectangle87:setAlign("client");
    obj.rectangle87:setColor("black");
    obj.rectangle87:setXradius(5);
    obj.rectangle87:setYradius(15);
    obj.rectangle87:setCornerType("round");
    obj.rectangle87:setName("rectangle87");

    obj.label160 = GUI.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.rectangle87);
    obj.label160:setAlign("top");
    obj.label160:setHeight(20);
    obj.label160:setText("Anotações");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.rectangle87);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setField("anotacoes3");
    obj.textEditor13:setMargins({left=10,right=10,bottom=10});
    obj.textEditor13:setName("textEditor13");

    obj.tab9 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab9:setParent(obj.tabControl1);
    obj.tab9:setTitle("Creditos");
    obj.tab9:setName("tab9");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab9);
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
						child = GUI.fromHandle(childHandle);
						
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

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox8);
    obj.image5:setLeft(0);
    obj.image5:setTop(0);
    obj.image5:setWidth(500);
    obj.image5:setHeight(500);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("logo_mesa");
    obj.image5:setName("image5");

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox8);
    obj.image6:setLeft(550);
    obj.image6:setTop(0);
    obj.image6:setWidth(250);
    obj.image6:setHeight(250);
    obj.image6:setStyle("autoFit");
    obj.image6:setSRC("/InfiniteRPG/images/RPGmeister.jpg");
    obj.image6:setName("image6");

    obj.layout125 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout125:setParent(obj.scrollBox8);
    obj.layout125:setLeft(850);
    obj.layout125:setTop(0);
    obj.layout125:setWidth(200);
    obj.layout125:setHeight(100);
    obj.layout125:setName("layout125");

    obj.rectangle88 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout125);
    obj.rectangle88:setAlign("client");
    obj.rectangle88:setColor("black");
    obj.rectangle88:setXradius(5);
    obj.rectangle88:setYradius(15);
    obj.rectangle88:setCornerType("round");
    obj.rectangle88:setName("rectangle88");

    obj.label161 = GUI.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.rectangle88);
    obj.label161:setAlign("top");
    obj.label161:setHeight(25);
    obj.label161:setText("Ficha feita por: ");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.label162 = GUI.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.rectangle88);
    obj.label162:setAlign("top");
    obj.label162:setHeight(25);
    obj.label162:setText("Vinny (Ambesek)");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.label163 = GUI.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.rectangle88);
    obj.label163:setAlign("top");
    obj.label163:setHeight(25);
    obj.label163:setText("Consultor: ");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.label164 = GUI.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.rectangle88);
    obj.label164:setAlign("top");
    obj.label164:setHeight(25);
    obj.label164:setText("LuckNura");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.layout126 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout126:setParent(obj.scrollBox8);
    obj.layout126:setLeft(850);
    obj.layout126:setTop(110);
    obj.layout126:setWidth(200);
    obj.layout126:setHeight(150);
    obj.layout126:setName("layout126");

    obj.rectangle89 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout126);
    obj.rectangle89:setLeft(0);
    obj.rectangle89:setTop(0);
    obj.rectangle89:setWidth(200);
    obj.rectangle89:setHeight(150);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setName("rectangle89");

    obj.label165 = GUI.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.layout126);
    obj.label165:setLeft(0);
    obj.label165:setTop(10);
    obj.label165:setWidth(80);
    obj.label165:setHeight(20);
    obj.label165:setText("Tema:");
    obj.label165:setHorzTextAlign("center");
    obj.label165:setName("label165");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout126);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink40 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout126);
    obj.dataLink40:setField("theme");
    obj.dataLink40:setDefaultValue("Escuro");
    obj.dataLink40:setName("dataLink40");

    obj.label166 = GUI.fromHandle(_obj_newObject("label"));
    obj.label166:setParent(obj.layout126);
    obj.label166:setLeft(0);
    obj.label166:setTop(35);
    obj.label166:setWidth(90);
    obj.label166:setHeight(20);
    obj.label166:setText("Cores: ");
    obj.label166:setHorzTextAlign("center");
    obj.label166:setName("label166");

    obj.label167 = GUI.fromHandle(_obj_newObject("label"));
    obj.label167:setParent(obj.layout126);
    obj.label167:setLeft(0);
    obj.label167:setTop(60);
    obj.label167:setWidth(90);
    obj.label167:setHeight(20);
    obj.label167:setText("Fundo ");
    obj.label167:setHorzTextAlign("center");
    obj.label167:setName("label167");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout126);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink41 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout126);
    obj.dataLink41:setField("colorBackground");
    obj.dataLink41:setDefaultValue("#000000");
    obj.dataLink41:setName("dataLink41");

    obj.label168 = GUI.fromHandle(_obj_newObject("label"));
    obj.label168:setParent(obj.layout126);
    obj.label168:setLeft(0);
    obj.label168:setTop(85);
    obj.label168:setWidth(90);
    obj.label168:setHeight(20);
    obj.label168:setText("Linhas ");
    obj.label168:setHorzTextAlign("center");
    obj.label168:setName("label168");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout126);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink42 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout126);
    obj.dataLink42:setField("colorStroke");
    obj.dataLink42:setDefaultValue("#FFFFFF");
    obj.dataLink42:setName("dataLink42");

    obj.label169 = GUI.fromHandle(_obj_newObject("label"));
    obj.label169:setParent(obj.layout126);
    obj.label169:setLeft(0);
    obj.label169:setTop(110);
    obj.label169:setWidth(90);
    obj.label169:setHeight(20);
    obj.label169:setText("Fonte ");
    obj.label169:setHorzTextAlign("center");
    obj.label169:setName("label169");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout126);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink43 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout126);
    obj.dataLink43:setField("colorFont");
    obj.dataLink43:setDefaultValue("#FFFFFF");
    obj.dataLink43:setName("dataLink43");

    obj.label170 = GUI.fromHandle(_obj_newObject("label"));
    obj.label170:setParent(obj.scrollBox8);
    obj.label170:setLeft(555);
    obj.label170:setTop(275);
    obj.label170:setWidth(200);
    obj.label170:setHeight(20);
    obj.label170:setText("Versão Atual: ");
    obj.label170:setHorzTextAlign("center");
    obj.label170:setField("versionInstalled");
    obj.label170:setName("label170");

    obj.label171 = GUI.fromHandle(_obj_newObject("label"));
    obj.label171:setParent(obj.scrollBox8);
    obj.label171:setLeft(555);
    obj.label171:setTop(300);
    obj.label171:setWidth(200);
    obj.label171:setHeight(20);
    obj.label171:setText("Sua Versão: ");
    obj.label171:setHorzTextAlign("center");
    obj.label171:setField("versionDownloaded");
    obj.label171:setName("label171");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox8);
    obj.checkBox1:setLeft(555);
    obj.checkBox1:setTop(325);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox8);
    obj.button7:setLeft(555);
    obj.button7:setTop(350);
    obj.button7:setWidth(100);
    obj.button7:setText("Change Log");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox8);
    obj.button8:setLeft(667);
    obj.button8:setTop(350);
    obj.button8:setWidth(100);
    obj.button8:setText("Atualizar");
    obj.button8:setName("button8");

    obj.label172 = GUI.fromHandle(_obj_newObject("label"));
    obj.label172:setParent(obj.scrollBox8);
    obj.label172:setLeft(555);
    obj.label172:setTop(400);
    obj.label172:setWidth(200);
    obj.label172:setHeight(20);
    obj.label172:setText("Conheça as Mesas:");
    obj.label172:setName("label172");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.scrollBox8);
    obj.button9:setLeft(555);
    obj.button9:setTop(425);
    obj.button9:setWidth(100);
    obj.button9:setText("RPGmeister");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.scrollBox8);
    obj.button10:setLeft(555);
    obj.button10:setTop(475);
    obj.button10:setWidth(100);
    obj.button10:setHeight(20);
    obj.button10:setText("Exportar Ficha");
    obj.button10:setName("button10");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.scrollBox8);
    obj.button11:setLeft(667);
    obj.button11:setTop(475);
    obj.button11:setWidth(100);
    obj.button11:setHeight(20);
    obj.button11:setText("Importar Ficha");
    obj.button11:setName("button11");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Infinite%20RPG/output/Ficha%20Infinite%20RPG.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Infinite%20RPG/output/Ficha%20Infinite%20RPG.rpk?raw=true');
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
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            						local total = 	(tonumber(sheet.xpAtributos) or 0) +
            										(tonumber(sheet.xpPericias) or 0);
            
            						sheet.xpTotal = total
        end, obj);

    obj._e_event3 = obj.image2:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar2);
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local normal = tonumber(sheet.fortitudeNormal) or 0
            					local cost = 10
            					local xp = 0
            					if normal > 0 then
            						xp = ((10 + (9 + normal))*normal)/2
            					end
            
            					local total = 	(tonumber(sheet.fortitudeEquip) or 0) +
            									(tonumber(sheet.fortitudeAdd) or 0) + normal;
            
            					sheet.fortitudeXP = xp
            					sheet.fortitudeTotal = total
            					sheet.fortitudeMod = math.floor(total/10)
        end, obj);

    obj._e_event5 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local normal = tonumber(sheet.instintoNormal) or 0
            					local cost = 10
            					local xp = 0
            					if normal > 0 then
            						xp = ((10 + (9 + normal))*normal)/2
            					end
            
            					local total = 	(tonumber(sheet.instintoEquip) or 0) +
            									(tonumber(sheet.instintoAdd) or 0) + normal;
            
            					sheet.instintoXP = xp
            					sheet.instintoTotal = total
            					sheet.instintoMod = math.floor(total/10)
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local normal = tonumber(sheet.destrezaNormal) or 0
            					local cost = 10
            					local xp = 0
            					if normal > 0 then
            						xp = ((10 + (9 + normal))*normal)/2
            					end
            
            					local total = 	(tonumber(sheet.destrezaEquip) or 0) +
            									(tonumber(sheet.destrezaAdd) or 0) + normal;
            
            					sheet.destrezaXP = xp
            					sheet.destrezaTotal = total
            					sheet.destrezaMod = math.floor(total/10)
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local normal = tonumber(sheet.sabedoriaNormal) or 0
            					local cost = 10
            					local xp = 0
            					if normal > 0 then
            						xp = ((10 + (9 + normal))*normal)/2
            					end
            
            					local total = 	(tonumber(sheet.sabedoriaEquip) or 0) +
            									(tonumber(sheet.sabedoriaAdd) or 0) + normal;
            
            					sheet.sabedoriaXP = xp
            					sheet.sabedoriaTotal = total
            					sheet.sabedoriaMod = math.floor(total/10)
        end, obj);

    obj._e_event8 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local normal = tonumber(sheet.intelectoNormal) or 0
            					local cost = 10
            					local xp = 0
            					if normal > 0 then
            						xp = ((10 + (9 + normal))*normal)/2
            					end
            
            					local total = 	(tonumber(sheet.intelectoEquip) or 0) +
            									(tonumber(sheet.intelectoAdd) or 0) + normal;
            
            					sheet.intelectoXP = xp
            					sheet.intelectoTotal = total
            					sheet.intelectoMod = math.floor(total/10)
        end, obj);

    obj._e_event9 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local normal = tonumber(sheet.carismaNormal) or 0
            					local cost = 10
            					local xp = 0
            					if normal > 0 then
            						xp = ((10 + (9 + normal))*normal)/2
            					end
            
            					local total = 	(tonumber(sheet.carismaEquip) or 0) +
            									(tonumber(sheet.carismaAdd) or 0) + normal;
            
            					sheet.carismaXP = xp
            					sheet.carismaTotal = total
            					sheet.carismaMod = math.floor(total/10)
        end, obj);

    obj._e_event10 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local normal = tonumber(sheet.resistenciaNormal) or 0
            					local cost = 10
            					local xp = 0
            					if normal > 0 then
            						xp = ((10 + (9 + normal))*normal)/2
            					end
            
            					local total = 	(tonumber(sheet.resistenciaEquip) or 0) +
            									(tonumber(sheet.resistenciaAdd) or 0) + normal;
            
            					sheet.resistenciaXP = xp
            					sheet.resistenciaTotal = total
            					sheet.resistenciaMod = math.floor(total/10)
        end, obj);

    obj._e_event11 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            					local normal = tonumber(sheet.vitalidadeNormal) or 0
            					local cost = 10
            					local xp = 0
            					if normal > 0 then
            						xp = ((10 + (9 + normal))*normal)/2
            					end
            
            					local total = 	(tonumber(sheet.vitalidadeEquip) or 0) +
            									(tonumber(sheet.vitalidadeAdd) or 0) + normal;
            
            					sheet.vitalidadeXP = xp
            					sheet.vitalidadeTotal = total
            					sheet.vitalidadeMod = math.floor(total/10)
        end, obj);

    obj._e_event12 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            						local total = 	(tonumber(sheet.fortitudeXP) or 0) +
            										(tonumber(sheet.instintoXP) or 0) +
            										(tonumber(sheet.destrezaXP) or 0) +
            										(tonumber(sheet.sabedoriaXP) or 0) +
            										(tonumber(sheet.intelectoXP) or 0) +
            										(tonumber(sheet.carismaXP) or 0) +
            										(tonumber(sheet.resistenciaXP) or 0) +
            										(tonumber(sheet.vitalidadeXP) or 0);
            
            						sheet.xpAtributos = total
        end, obj);

    obj._e_event13 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.fortitudeMod or 0) +
            												tonumber(sheet.atletismoNormal or 0);
            
            								sheet.atletismoTotal = total
        end, obj);

    obj._e_event14 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.fortitudeMod or 0) +
            												tonumber(sheet.halterofiliaNormal or 0);
            
            								sheet.halterofiliaTotal = total
        end, obj);

    obj._e_event15 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.instintoMod or 0) +
            												tonumber(sheet.sentidosNormal or 0);
            
            								sheet.sentidosTotal = total
        end, obj);

    obj._e_event16 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.instintoMod or 0) +
            												tonumber(sheet.coragemNormal or 0);
            
            								sheet.coragemTotal = total
        end, obj);

    obj._e_event17 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.destrezaMod or 0) +
            												tonumber(sheet.acrobaciaNormal or 0);
            
            								sheet.acrobaciaTotal = total
        end, obj);

    obj._e_event18 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.destrezaMod or 0) +
            												tonumber(sheet.manuseioNormal or 0);
            
            								sheet.manuseioTotal = total
        end, obj);

    obj._e_event19 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.destrezaMod or 0) +
            												tonumber(sheet.dancarNormal or 0);
            
            								sheet.dancarTotal = total
        end, obj);

    obj._e_event20 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.destrezaMod or 0) +
            												tonumber(sheet.furtividadeNormal or 0);
            
            								sheet.furtividadeTotal = total
        end, obj);

    obj._e_event21 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.sabedoriaMod or 0) +
            												tonumber(sheet.medicinaNormal or 0);
            
            								sheet.medicinaTotal = total
        end, obj);

    obj._e_event22 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.sabedoriaMod or 0) +
            												tonumber(sheet.percepcaoNormal or 0);
            
            								sheet.percepcaoTotal = total
        end, obj);

    obj._e_event23 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.sabedoriaMod or 0) +
            												tonumber(sheet.controleNormal or 0);
            
            								sheet.controleTotal = total
        end, obj);

    obj._e_event24 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.sabedoriaMod or 0) +
            												tonumber(sheet.culinariaNormal or 0);
            
            								sheet.culinariaTotal = total
        end, obj);

    obj._e_event25 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.sabedoriaMod or 0) +
            												tonumber(sheet.sobrevivenciaNormal or 0);
            
            								sheet.sobrevivenciaTotal = total
        end, obj);

    obj._e_event26 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.sabedoriaMod or 0) +
            												tonumber(sheet.naturezaNormal or 0);
            
            								sheet.naturezaTotal = total
        end, obj);

    obj._e_event27 = obj.dataLink25:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.intelectoMod or 0) +
            												tonumber(sheet.mecanicaNormal or 0);
            
            								sheet.mecanicaTotal = total
        end, obj);

    obj._e_event28 = obj.dataLink26:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.intelectoMod or 0) +
            												tonumber(sheet.investigacaoNormal or 0);
            
            								sheet.investigacaoTotal = total
        end, obj);

    obj._e_event29 = obj.dataLink27:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.intelectoMod or 0) +
            												tonumber(sheet.poderNormal or 0);
            
            								sheet.poderTotal = total
        end, obj);

    obj._e_event30 = obj.dataLink28:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.intelectoMod or 0) +
            												tonumber(sheet.fisicaNormal or 0);
            
            								sheet.fisicaTotal = total
        end, obj);

    obj._e_event31 = obj.dataLink29:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.intelectoMod or 0) +
            												tonumber(sheet.computacaoNormal or 0);
            
            								sheet.computacaoTotal = total
        end, obj);

    obj._e_event32 = obj.dataLink30:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.intelectoMod or 0) +
            												tonumber(sheet.sociedadeNormal or 0);
            
            								sheet.sociedadeTotal = total
        end, obj);

    obj._e_event33 = obj.dataLink31:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.carismaMod or 0) +
            												tonumber(sheet.enganarNormal or 0);
            
            								sheet.enganarTotal = total
        end, obj);

    obj._e_event34 = obj.dataLink32:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.carismaMod or 0) +
            												tonumber(sheet.intimidarNormal or 0);
            
            								sheet.intimidarTotal = total
        end, obj);

    obj._e_event35 = obj.dataLink33:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.carismaMod or 0) +
            												tonumber(sheet.atuarNormal or 0);
            
            								sheet.atuarTotal = total
        end, obj);

    obj._e_event36 = obj.dataLink34:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.carismaMod or 0) +
            												tonumber(sheet.heroismoNormal or 0);
            
            								sheet.heroismoTotal = total
        end, obj);

    obj._e_event37 = obj.dataLink35:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.carismaMod or 0) +
            												tonumber(sheet.cantarNormal or 0);
            
            								sheet.cantarTotal = total
        end, obj);

    obj._e_event38 = obj.dataLink36:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.carismaMod or 0) +
            												tonumber(sheet.persuadirNormal or 0);
            
            								sheet.persuadirTotal = total
        end, obj);

    obj._e_event39 = obj.dataLink37:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.resistenciaMod or 0) +
            												tonumber(sheet.resistirNormal or 0);
            
            								sheet.resistirTotal = total
        end, obj);

    obj._e_event40 = obj.dataLink38:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            								local total = 	tonumber(sheet.vitalidadeMod or 0) +
            												tonumber(sheet.folegoNormal or 0);
            
            								sheet.folegoTotal = total
        end, obj);

    obj._e_event41 = obj.dataLink39:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local total = 	(tonumber(sheet.atletismoNormal) or 0) + 
            								(tonumber(sheet.halterofiliaNormal) or 0) + 
            								(tonumber(sheet.sentidosNormal) or 0) + 
            								(tonumber(sheet.coragemNormal) or 0) + 
            								(tonumber(sheet.acrobaciaNormal) or 0) + 
            								(tonumber(sheet.manuseioNormal) or 0) + 
            								(tonumber(sheet.dancarNormal) or 0) + 
            								(tonumber(sheet.furtividadeNormal) or 0) + 
            								(tonumber(sheet.medicinaNormal) or 0) + 
            								(tonumber(sheet.percepcaoNormal) or 0) + 
            								(tonumber(sheet.culinariaNormal) or 0) + 
            								(tonumber(sheet.sobrevivenciaNormal) or 0) + 
            								(tonumber(sheet.controleNormal) or 0) + 
            								(tonumber(sheet.naturezaNormal) or 0) + 
            								(tonumber(sheet.mecanicaNormal) or 0) + 
            								(tonumber(sheet.investigacaoNormal) or 0) + 
            								(tonumber(sheet.fisicaNormal) or 0) + 
            								(tonumber(sheet.computacaoNormal) or 0) + 
            								(tonumber(sheet.poderNormal) or 0) + 
            								(tonumber(sheet.sociedadeNormal) or 0) + 
            								(tonumber(sheet.enganarNormal) or 0) + 
            								(tonumber(sheet.intimidarNormal) or 0) + 
            								(tonumber(sheet.heroismoNormal) or 0) + 
            								(tonumber(sheet.cantarNormal) or 0) + 
            								(tonumber(sheet.atuarNormal) or 0) + 
            								(tonumber(sheet.persuadirNormal) or 0) + 
            								(tonumber(sheet.resistirNormal) or 0) + 
            								(tonumber(sheet.folegoNormal) or 0);
            
            				sheet.xpPericias = total*100
        end, obj);

    obj._e_event42 = obj.button1:addEventListener("onClick",
        function (_)
            self.campoDasVantagens:append();
        end, obj);

    obj._e_event43 = obj.campoDasVantagens:addEventListener("onResize",
        function (_)
            self.campoDasVantagensPart._recalcHeight();
        end, obj);

    obj._e_event44 = obj.campoDasVantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event45 = obj.button2:addEventListener("onClick",
        function (_)
            self.campoDasDesvantagens:append();
        end, obj);

    obj._e_event46 = obj.campoDasDesvantagens:addEventListener("onResize",
        function (_)
            self.campoDasDesvantagensPart._recalcHeight();
        end, obj);

    obj._e_event47 = obj.campoDasDesvantagens:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event48 = obj.button3:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar?",
            										function (confirmado)
            											if confirmado then
            												NDB.deleteNode(self.popEquipment.node);
            												self.popEquipment:close();
            											end;
            										end);
        end, obj);

    obj._e_event49 = obj.image3:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.icon);
        end, obj);

    obj._e_event50 = obj.button4:addEventListener("onClick",
        function (_)
            self.campoDosEquipamentos:append();
        end, obj);

    obj._e_event51 = obj.button5:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar?",
            										function (confirmado)
            											if confirmado then
            												NDB.deleteNode(self.popAbility.node);
            												self.popAbility:close();
            											end;
            										end);
        end, obj);

    obj._e_event52 = obj.image4:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.icon);
        end, obj);

    obj._e_event53 = obj.button6:addEventListener("onClick",
        function (_)
            self.campoDasHabilidades:append();
        end, obj);

    obj._e_event54 = obj.dataLink40:addEventListener("onChange",
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

    obj._e_event55 = obj.dataLink41:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event56 = obj.dataLink42:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event57 = obj.dataLink43:addEventListener("onChange",
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

    obj._e_event58 = obj.button7:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Infinite%20RPG/README.md')
        end, obj);

    obj._e_event59 = obj.button8:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Infinite%20RPG/output/Ficha%20Infinite%20RPG.rpk?raw=true')
        end, obj);

    obj._e_event60 = obj.button9:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event61 = obj.button10:addEventListener("onClick",
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

    obj._e_event62 = obj.button11:addEventListener("onClick",
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

        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
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
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout123 ~= nil then self.layout123:destroy(); self.layout123 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
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
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.label162 ~= nil then self.label162:destroy(); self.label162 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout119 ~= nil then self.layout119:destroy(); self.layout119 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.layout126 ~= nil then self.layout126:destroy(); self.layout126 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.campoDasVantagensPart ~= nil then self.campoDasVantagensPart:destroy(); self.campoDasVantagensPart = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label170 ~= nil then self.label170:destroy(); self.label170 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.campoDasVantagens ~= nil then self.campoDasVantagens:destroy(); self.campoDasVantagens = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
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
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout118 ~= nil then self.layout118:destroy(); self.layout118 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
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
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.frmGeneral ~= nil then self.frmGeneral:destroy(); self.frmGeneral = nil; end;
        if self.frmAttributes ~= nil then self.frmAttributes:destroy(); self.frmAttributes = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.label166 ~= nil then self.label166:destroy(); self.label166 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout120 ~= nil then self.layout120:destroy(); self.layout120 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.popVantagem ~= nil then self.popVantagem:destroy(); self.popVantagem = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.layout113 ~= nil then self.layout113:destroy(); self.layout113 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.layout109 ~= nil then self.layout109:destroy(); self.layout109 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.popEquipment ~= nil then self.popEquipment:destroy(); self.popEquipment = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.frmAdvantages ~= nil then self.frmAdvantages:destroy(); self.frmAdvantages = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.popAbility ~= nil then self.popAbility:destroy(); self.popAbility = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.campoDasDesvantagens ~= nil then self.campoDasDesvantagens:destroy(); self.campoDasDesvantagens = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.label167 ~= nil then self.label167:destroy(); self.label167 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.tab9 ~= nil then self.tab9:destroy(); self.tab9 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
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
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.layout117 ~= nil then self.layout117:destroy(); self.layout117 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label171 ~= nil then self.label171:destroy(); self.label171 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.layout122 ~= nil then self.layout122:destroy(); self.layout122 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.label169 ~= nil then self.label169:destroy(); self.label169 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.campoDasDesvantagensPart ~= nil then self.campoDasDesvantagensPart:destroy(); self.campoDasDesvantagensPart = nil; end;
        if self.label172 ~= nil then self.label172:destroy(); self.label172 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.layout124 ~= nil then self.layout124:destroy(); self.layout124 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.frmSkills ~= nil then self.frmSkills:destroy(); self.frmSkills = nil; end;
        if self.frmAbilities ~= nil then self.frmAbilities:destroy(); self.frmAbilities = nil; end;
        if self.campoDosEquipamentos ~= nil then self.campoDosEquipamentos:destroy(); self.campoDosEquipamentos = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.frmEquipments ~= nil then self.frmEquipments:destroy(); self.frmEquipments = nil; end;
        if self.label168 ~= nil then self.label168:destroy(); self.label168 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.campoDasHabilidades ~= nil then self.campoDasHabilidades:destroy(); self.campoDasHabilidades = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout121 ~= nil then self.layout121:destroy(); self.layout121 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
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
    dataType = "Ambesek.Infinite.RPG", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Infinite RPG", 
    description=""};

frmMain = _frmMain;
Firecast.registrarForm(_frmMain);
Firecast.registrarDataType(_frmMain);

return _frmMain;
