require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTemplate()
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
    obj:setName("frmTemplate");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Tormenta20");
    obj:setTitle("Ficha Tormenta 20");
    obj:setAlign("client");
    obj:setTheme("light");


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

    obj.frmGeral = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeral:setParent(obj.tab1);
    obj.frmGeral:setName("frmGeral");
    obj.frmGeral:setAlign("client");
    obj.frmGeral:setTheme("light");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmGeral);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setWidth(615);
    obj.layout1:setHeight(440);
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(100);
    obj.layout2:setMargins({bottom=5});
    obj.layout2:setName("layout2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setWidth(1030);
    obj.rectangle1:setColor("#F0FFFF");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(50);
    obj.layout3:setName("layout3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(500);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout4);
    obj.label1:setText("Nome");
    obj.label1:setWidth(500);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setTop(20);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(500);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(450);
    obj.layout5:setMargins({right=5});
    obj.layout5:setName("layout5");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout5);
    obj.label2:setText("Classe");
    obj.label2:setWidth(450);
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout5);
    obj.edit2:setTop(20);
    obj.edit2:setField("classe");
    obj.edit2:setWidth(450);
    obj.edit2:setHeight(25);
    obj.edit2:setName("edit2");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setAlign("left");
    obj.layout6:setWidth(65);
    obj.layout6:setMargins({right=5});
    obj.layout6:setName("layout6");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout6);
    obj.label3:setText("Nível");
    obj.label3:setWidth(65);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setTop(20);
    obj.edit3:setField("nivel");
    obj.edit3:setWidth(65);
    obj.edit3:setHeight(25);
    obj.edit3:setName("edit3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.rectangle1);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(50);
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(340);
    obj.layout8:setMargins({right=5});
    obj.layout8:setName("layout8");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout8);
    obj.label4:setText("Raça");
    obj.label4:setWidth(340);
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout8);
    obj.edit4:setTop(20);
    obj.edit4:setField("raca");
    obj.edit4:setWidth(340);
    obj.edit4:setHeight(25);
    obj.edit4:setName("edit4");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(340);
    obj.layout9:setMargins({right=5});
    obj.layout9:setName("layout9");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout9);
    obj.label5:setText("Origem");
    obj.label5:setWidth(340);
    obj.label5:setHorzTextAlign("leading");
    obj.label5:setFontSize(13);
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout9);
    obj.edit5:setTop(20);
    obj.edit5:setField("origem");
    obj.edit5:setWidth(340);
    obj.edit5:setHeight(25);
    obj.edit5:setName("edit5");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(335);
    obj.layout10:setMargins({right=5});
    obj.layout10:setName("layout10");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout10);
    obj.label6:setText("Divindade");
    obj.label6:setWidth(335);
    obj.label6:setHorzTextAlign("leading");
    obj.label6:setFontSize(13);
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout10);
    obj.edit6:setTop(20);
    obj.edit6:setField("divindade");
    obj.edit6:setWidth(335);
    obj.edit6:setHeight(25);
    obj.edit6:setName("edit6");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(160);
    obj.layout11:setMargins({bottom=5});
    obj.layout11:setName("layout11");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout11);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(160);
    obj.rectangle2:setColor("#F0FFFF");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(15);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setPadding({top=5,bottom=5});
    obj.rectangle2:setMargins({right=5});
    obj.rectangle2:setName("rectangle2");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.rectangle2);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(25);
    obj.layout12:setMargins({right=5,left=5});
    obj.layout12:setName("layout12");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout12);
    obj.label7:setAlign("left");
    obj.label7:setText("FOR");
    obj.label7:setWidth(50);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout12);
    obj.edit7:setAlign("left");
    obj.edit7:setWidth(50);
    obj.edit7:setField("forAtr");
    obj.edit7:setHeight(25);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setType("number");
    obj.edit7:setName("edit7");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout12);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setColor("#F0FFFF");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle3);
    obj.label8:setAlign("client");
    obj.label8:setField("forMod");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setVertTextAlign("center");
    obj.label8:setName("label8");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setField("forAtr");
    obj.dataLink1:setName("dataLink1");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.rectangle2);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(25);
    obj.layout13:setMargins({right=5,left=5});
    obj.layout13:setName("layout13");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout13);
    obj.label9:setAlign("left");
    obj.label9:setText("DES");
    obj.label9:setWidth(50);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout13);
    obj.edit8:setAlign("left");
    obj.edit8:setWidth(50);
    obj.edit8:setField("desAtr");
    obj.edit8:setHeight(25);
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setType("number");
    obj.edit8:setName("edit8");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout13);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setColor("#F0FFFF");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle4);
    obj.label10:setAlign("client");
    obj.label10:setField("desMod");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setVertTextAlign("center");
    obj.label10:setName("label10");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle2);
    obj.dataLink2:setField("desAtr");
    obj.dataLink2:setName("dataLink2");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.rectangle2);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(25);
    obj.layout14:setMargins({right=5,left=5});
    obj.layout14:setName("layout14");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout14);
    obj.label11:setAlign("left");
    obj.label11:setText("CON");
    obj.label11:setWidth(50);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout14);
    obj.edit9:setAlign("left");
    obj.edit9:setWidth(50);
    obj.edit9:setField("conAtr");
    obj.edit9:setHeight(25);
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setType("number");
    obj.edit9:setName("edit9");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout14);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setColor("#F0FFFF");
    obj.rectangle5:setStrokeColor("black");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle5);
    obj.label12:setAlign("client");
    obj.label12:setField("conMod");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("center");
    obj.label12:setName("label12");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle2);
    obj.dataLink3:setField("conAtr");
    obj.dataLink3:setName("dataLink3");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle2);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setMargins({right=5,left=5});
    obj.layout15:setName("layout15");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout15);
    obj.label13:setAlign("left");
    obj.label13:setText("INT");
    obj.label13:setWidth(50);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout15);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(50);
    obj.edit10:setField("intAtr");
    obj.edit10:setHeight(25);
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setType("number");
    obj.edit10:setName("edit10");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout15);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setColor("#F0FFFF");
    obj.rectangle6:setStrokeColor("black");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle6);
    obj.label14:setAlign("client");
    obj.label14:setField("intMod");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("center");
    obj.label14:setName("label14");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle2);
    obj.dataLink4:setField("intAtr");
    obj.dataLink4:setName("dataLink4");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle2);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setMargins({right=5,left=5});
    obj.layout16:setName("layout16");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout16);
    obj.label15:setAlign("left");
    obj.label15:setText("SAB");
    obj.label15:setWidth(50);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout16);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(50);
    obj.edit11:setField("sabAtr");
    obj.edit11:setHeight(25);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setType("number");
    obj.edit11:setName("edit11");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout16);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setColor("#F0FFFF");
    obj.rectangle7:setStrokeColor("black");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle7);
    obj.label16:setAlign("client");
    obj.label16:setField("sabMod");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setVertTextAlign("center");
    obj.label16:setName("label16");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle2);
    obj.dataLink5:setField("sabAtr");
    obj.dataLink5:setName("dataLink5");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle2);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setMargins({right=5,left=5});
    obj.layout17:setName("layout17");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout17);
    obj.label17:setAlign("left");
    obj.label17:setText("CAR");
    obj.label17:setWidth(50);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout17);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(50);
    obj.edit12:setField("carAtr");
    obj.edit12:setHeight(25);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setType("number");
    obj.edit12:setName("edit12");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout17);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setColor("#F0FFFF");
    obj.rectangle8:setStrokeColor("black");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle8);
    obj.label18:setAlign("client");
    obj.label18:setField("carMod");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setVertTextAlign("center");
    obj.label18:setName("label18");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle2);
    obj.dataLink6:setField("carAtr");
    obj.dataLink6:setName("dataLink6");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout11);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(700);
    obj.rectangle9:setColor("#F0FFFF");
    obj.rectangle9:setXradius(5);
    obj.rectangle9:setYradius(15);
    obj.rectangle9:setCornerType("round");
    obj.rectangle9:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle9:setMargins({right=5});
    obj.rectangle9:setName("rectangle9");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle9);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(50);
    obj.layout18:setMargins({right=5,left=5});
    obj.layout18:setName("layout18");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(50);
    obj.layout19:setMargins({right=5});
    obj.layout19:setName("layout19");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout19);
    obj.label19:setText("Defesa");
    obj.label19:setWidth(50);
    obj.label19:setHorzTextAlign("leading");
    obj.label19:setFontSize(13);
    obj.label19:setName("label19");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout19);
    obj.rectangle10:setTop(20);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setColor("#F0FFFF");
    obj.rectangle10:setStrokeColor("black");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle10);
    obj.label20:setAlign("client");
    obj.label20:setField("defesa");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setVertTextAlign("center");
    obj.label20:setName("label20");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout18);
    obj.dataLink7:setFields({'caAtr','caAtr','caArm','caEsc','caOut'});
    obj.dataLink7:setName("dataLink7");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout18);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(50);
    obj.layout20:setMargins({right=5});
    obj.layout20:setName("layout20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout20);
    obj.label21:setTop(30);
    obj.label21:setHeight(25);
    obj.label21:setWidth(50);
    obj.label21:setAlign("client");
    obj.label21:setText("= 10 + ");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setVertTextAlign("center");
    obj.label21:setName("label21");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout18);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(50);
    obj.layout21:setMargins({right=5});
    obj.layout21:setName("layout21");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout21);
    obj.checkBox1:setText("Mod.");
    obj.checkBox1:setWidth(50);
    obj.checkBox1:setField("atrModCheck");
    obj.checkBox1:setHorzTextAlign("leading");
    obj.checkBox1:setName("checkBox1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout21);
    obj.comboBox1:setTop(20);
    obj.comboBox1:setField("atrModCombo");
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setItems({'FOR','DES','CON','INT','SAB','CAR'});
    obj.comboBox1:setValues({'forMod','desMod','conMod','intMod','sabMod','carMod'});
    obj.comboBox1:setFontSize(9);
    obj.comboBox1:setName("comboBox1");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout18);
    obj.dataLink8:setFields({'atrModCheck','atrModCombo'});
    obj.dataLink8:setName("dataLink8");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout18);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(50);
    obj.layout22:setMargins({right=5});
    obj.layout22:setName("layout22");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout22);
    obj.label22:setText("Atributo");
    obj.label22:setWidth(50);
    obj.label22:setHorzTextAlign("leading");
    obj.label22:setFontSize(11);
    obj.label22:setName("label22");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout22);
    obj.rectangle11:setTop(20);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setColor("#F0FFFF");
    obj.rectangle11:setStrokeColor("black");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle11);
    obj.label23:setAlign("client");
    obj.label23:setField("caAtr");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setVertTextAlign("center");
    obj.label23:setName("label23");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout18);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(50);
    obj.layout23:setMargins({right=5});
    obj.layout23:setName("layout23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout23);
    obj.label24:setText("Armadura");
    obj.label24:setWidth(50);
    obj.label24:setHorzTextAlign("leading");
    obj.label24:setFontSize(11);
    obj.label24:setName("label24");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout23);
    obj.rectangle12:setTop(20);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setColor("#F0FFFF");
    obj.rectangle12:setStrokeColor("black");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle12);
    obj.label25:setAlign("client");
    obj.label25:setField("caArm");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setVertTextAlign("center");
    obj.label25:setName("label25");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout18);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(50);
    obj.layout24:setMargins({right=5});
    obj.layout24:setName("layout24");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout24);
    obj.label26:setText("Escudo");
    obj.label26:setWidth(50);
    obj.label26:setHorzTextAlign("leading");
    obj.label26:setFontSize(11);
    obj.label26:setName("label26");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout24);
    obj.rectangle13:setTop(20);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setColor("#F0FFFF");
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle13);
    obj.label27:setAlign("client");
    obj.label27:setField("caEsc");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setVertTextAlign("center");
    obj.label27:setName("label27");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout18);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(50);
    obj.layout25:setMargins({right=5});
    obj.layout25:setName("layout25");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout25);
    obj.label28:setText("Outros");
    obj.label28:setWidth(50);
    obj.label28:setHorzTextAlign("leading");
    obj.label28:setFontSize(11);
    obj.label28:setName("label28");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout25);
    obj.edit13:setTop(20);
    obj.edit13:setField("caOut");
    obj.edit13:setWidth(50);
    obj.edit13:setHeight(25);
    obj.edit13:setName("edit13");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle9);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(50);
    obj.layout26:setMargins({right=5,left=5});
    obj.layout26:setName("layout26");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(570);
    obj.layout27:setMargins({right=5});
    obj.layout27:setName("layout27");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout27);
    obj.label29:setText("Armadura");
    obj.label29:setWidth(570);
    obj.label29:setHorzTextAlign("leading");
    obj.label29:setFontSize(13);
    obj.label29:setName("label29");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout27);
    obj.edit14:setTop(20);
    obj.edit14:setField("armaduraNome");
    obj.edit14:setWidth(570);
    obj.edit14:setHeight(25);
    obj.edit14:setName("edit14");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout26);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(50);
    obj.layout28:setMargins({right=5});
    obj.layout28:setName("layout28");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout28);
    obj.label30:setText("Defesa");
    obj.label30:setWidth(50);
    obj.label30:setHorzTextAlign("leading");
    obj.label30:setFontSize(11);
    obj.label30:setName("label30");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout28);
    obj.edit15:setTop(20);
    obj.edit15:setField("caArm");
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setName("edit15");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout26);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(50);
    obj.layout29:setMargins({right=5});
    obj.layout29:setName("layout29");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout29);
    obj.label31:setText("Penalidade");
    obj.label31:setWidth(50);
    obj.label31:setHorzTextAlign("leading");
    obj.label31:setFontSize(9);
    obj.label31:setName("label31");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout29);
    obj.edit16:setTop(20);
    obj.edit16:setField("caArmPen");
    obj.edit16:setWidth(50);
    obj.edit16:setHeight(25);
    obj.edit16:setName("edit16");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle9);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(50);
    obj.layout30:setMargins({right=5,left=5});
    obj.layout30:setName("layout30");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout30);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(570);
    obj.layout31:setMargins({right=5});
    obj.layout31:setName("layout31");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout31);
    obj.label32:setText("Escudo");
    obj.label32:setWidth(570);
    obj.label32:setHorzTextAlign("leading");
    obj.label32:setFontSize(13);
    obj.label32:setName("label32");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout31);
    obj.edit17:setTop(20);
    obj.edit17:setField("escudoNome");
    obj.edit17:setWidth(570);
    obj.edit17:setHeight(25);
    obj.edit17:setName("edit17");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout30);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(50);
    obj.layout32:setMargins({right=5});
    obj.layout32:setName("layout32");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout32);
    obj.label33:setText("Defesa");
    obj.label33:setWidth(50);
    obj.label33:setHorzTextAlign("leading");
    obj.label33:setFontSize(11);
    obj.label33:setName("label33");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout32);
    obj.edit18:setTop(20);
    obj.edit18:setField("caEsc");
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setName("edit18");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout30);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(50);
    obj.layout33:setMargins({right=5});
    obj.layout33:setName("layout33");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout33);
    obj.label34:setText("Penalidade");
    obj.label34:setWidth(50);
    obj.label34:setHorzTextAlign("leading");
    obj.label34:setFontSize(9);
    obj.label34:setName("label34");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout33);
    obj.edit19:setTop(20);
    obj.edit19:setField("caEscPen");
    obj.edit19:setWidth(50);
    obj.edit19:setHeight(25);
    obj.edit19:setName("edit19");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout11);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(160);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.rectangle14);
    obj.label35:setLeft(0);
    obj.label35:setTop(40);
    obj.label35:setWidth(160);
    obj.label35:setHeight(20);
    obj.label35:setText("Avatar");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle14);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.scrollBox1);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(160);
    obj.layout34:setMargins({bottom=5});
    obj.layout34:setName("layout34");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout34);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(160);
    obj.rectangle15:setColor("#F0FFFF");
    obj.rectangle15:setXradius(5);
    obj.rectangle15:setYradius(15);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setPadding({top=5,bottom=5,left=5,right=5});
    obj.rectangle15:setMargins({right=5});
    obj.rectangle15:setName("rectangle15");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.rectangle15);
    obj.label36:setText("Proficiências");
    obj.label36:setAlign("top");
    obj.label36:setHeight(25);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle15);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("proficiencias");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout34);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(260);
    obj.rectangle16:setColor("#F0FFFF");
    obj.rectangle16:setXradius(5);
    obj.rectangle16:setYradius(15);
    obj.rectangle16:setCornerType("round");
    obj.rectangle16:setPadding({top=5,bottom=5});
    obj.rectangle16:setMargins({right=5});
    obj.rectangle16:setName("rectangle16");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle16);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(25);
    obj.layout35:setMargins({right=5,left=5});
    obj.layout35:setName("layout35");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout35);
    obj.label37:setAlign("left");
    obj.label37:setText("Pontos de Vida");
    obj.label37:setWidth(100);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout35);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(50);
    obj.edit20:setField("pvMax");
    obj.edit20:setHeight(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setType("number");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout35);
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(100);
    obj.edit21:setField("pvTemp");
    obj.edit21:setHeight(25);
    obj.edit21:setName("edit21");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle16);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setMargins({right=5,left=5});
    obj.layout36:setName("layout36");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout36);
    obj.label38:setAlign("left");
    obj.label38:setText("Pontos de Mana");
    obj.label38:setWidth(100);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout36);
    obj.edit22:setAlign("left");
    obj.edit22:setWidth(50);
    obj.edit22:setField("pmMax");
    obj.edit22:setHeight(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setType("number");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout36);
    obj.edit23:setAlign("left");
    obj.edit23:setWidth(100);
    obj.edit23:setField("pmTemp");
    obj.edit23:setHeight(25);
    obj.edit23:setName("edit23");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle16);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(25);
    obj.layout37:setMargins({right=5,left=5});
    obj.layout37:setName("layout37");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout37);
    obj.label39:setAlign("left");
    obj.label39:setText("Pontos de Experiência");
    obj.label39:setWidth(100);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontSize(9);
    obj.label39:setName("label39");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout37);
    obj.edit24:setAlign("left");
    obj.edit24:setWidth(150);
    obj.edit24:setField("xp");
    obj.edit24:setHeight(25);
    obj.edit24:setName("edit24");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle16);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(25);
    obj.layout38:setMargins({right=5,left=5});
    obj.layout38:setName("layout38");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout38);
    obj.label40:setAlign("left");
    obj.label40:setText("Deslocamento");
    obj.label40:setWidth(100);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout38);
    obj.edit25:setAlign("left");
    obj.edit25:setWidth(150);
    obj.edit25:setField("deslocamento");
    obj.edit25:setName("edit25");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle16);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setMargins({right=5,left=5});
    obj.layout39:setName("layout39");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout39);
    obj.label41:setAlign("left");
    obj.label41:setText("Tamanho");
    obj.label41:setWidth(100);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout39);
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setField("tamanho");
    obj.comboBox2:setItems({'Minúsculo','Pequeno','Médio','Grande','Enorme','Colossal'});
    obj.comboBox2:setValues({'5','2','0','-2','-5','-10'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout39);
    obj.dataLink9:setField("tamanho");
    obj.dataLink9:setName("dataLink9");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout39);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setColor("#F0FFFF");
    obj.rectangle17:setStrokeColor("black");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.rectangle17);
    obj.label42:setAlign("client");
    obj.label42:setField("tamanhoMod");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setVertTextAlign("center");
    obj.label42:setName("label42");

    obj.rclAtaques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaques:setParent(obj.layout34);
    obj.rclAtaques:setAlign("left");
    obj.rclAtaques:setWidth(600);
    obj.rclAtaques:setName("rclAtaques");
    obj.rclAtaques:setField("listaAtaques");
    obj.rclAtaques:setTemplateForm("frmAtaqueForm");
    obj.rclAtaques:setLayout("vertical");
    obj.rclAtaques:setSelectable(true);
    obj.rclAtaques:setMinQt(3);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Perícias");
    obj.tab2:setName("tab2");

    obj.frmPericias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPericias:setParent(obj.tab2);
    obj.frmPericias:setName("frmPericias");
    obj.frmPericias:setAlign("client");
    obj.frmPericias:setTheme("light");



		local function addSkill(nome, mod, treino, armadura)
			local skill = self.rclPericias:append();
			if skill == nil then return end;

			skill.nome = nome;
			skill.mod = mod;
			skill.treino = treino;
			skill.armadura = armadura;
		end;

		local function tormenta20()
			addSkill("Acrobacia", "desMod", false, true);
			addSkill("Adestramento", "carMod", true, false);
			addSkill("Atletismo", "forMod", false, false);
			addSkill("Atuação", "carMod", false, false);
			addSkill("Cavalgar", "desMod", false, false);
			addSkill("Conhecimento", "intMod", true, false);
			addSkill("Cura", "sabMod", false, false);
			addSkill("Diplomacia", "carMod", false, false);
			addSkill("Enganação", "carMod", false, false);
			addSkill("Fortitude", "conMod", false, false);
			addSkill("Furtividade", "desMod", false, true);
			addSkill("Guerra", "intMod", true, false);
			addSkill("Iniciativa", "desMod", false, false);
			addSkill("Intimidação", "carMod", false, false);
			addSkill("Intuição", "sabMod", false, false);
			addSkill("Inestigação", "intMod", false, false);
			addSkill("Jogatina", "carMod", false, false);
			addSkill("Ladinagem", "desMod", true, true);
			addSkill("Luta", "forMod", false, false);
			addSkill("Misticismo", "intMod", true, false);
			addSkill("Navegação", "sabMod", true, false);
			addSkill("Nobreza", "intMod", true, false);
			addSkill("Ofício", "intMod", false, false);
			addSkill("Percepção", "sabMod", false, false);
			addSkill("Pontaria", "desMod", false, false);
			addSkill("Reflexos", "desMod", false, false);
			addSkill("Religião", "sabMod", true, false);
			addSkill("Percepção", "sabMod", false, false);
			addSkill("Vontade", "sabMod", false, false);
		end

		


    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.frmPericias);
    obj.dataLink10:setField("nivel");
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.frmPericias);
    obj.dataLink11:setFields({'caArmPen','caEscPen'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.frmPericias);
    obj.dataLink12:setField("forMod");
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.frmPericias);
    obj.dataLink13:setField("desMod");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.frmPericias);
    obj.dataLink14:setField("conMod");
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.frmPericias);
    obj.dataLink15:setField("intMod");
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.frmPericias);
    obj.dataLink16:setField("sabMod");
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.frmPericias);
    obj.dataLink17:setField("carMod");
    obj.dataLink17:setName("dataLink17");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmPericias);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox2);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(25);
    obj.layout40:setMargins({bottom=5});
    obj.layout40:setName("layout40");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout40);
    obj.button1:setAlign("left");
    obj.button1:setText("Novo");
    obj.button1:setWidth(100);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout40);
    obj.button2:setAlign("left");
    obj.button2:setText("Tormenta 20");
    obj.button2:setWidth(100);
    obj.button2:setName("button2");

    obj.rclPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPericias:setParent(obj.scrollBox2);
    obj.rclPericias:setAlign("client");
    obj.rclPericias:setName("rclPericias");
    obj.rclPericias:setField("listaPericias");
    obj.rclPericias:setTemplateForm("frmRecordListForm");
    obj.rclPericias:setLayout("verticalTiles");
    obj.rclPericias:setSelectable(true);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Habilidades");
    obj.tab3:setName("tab3");

    obj.frmHabilidades = GUI.fromHandle(_obj_newObject("form"));
    obj.frmHabilidades:setParent(obj.tab3);
    obj.frmHabilidades:setName("frmHabilidades");
    obj.frmHabilidades:setAlign("client");
    obj.frmHabilidades:setTheme("light");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmHabilidades);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.scrollBox3);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(600);
    obj.layout41:setMargins({right=5});
    obj.layout41:setName("layout41");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout41);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setXradius(5);
    obj.rectangle18:setYradius(15);
    obj.rectangle18:setCornerType("round");
    obj.rectangle18:setName("rectangle18");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle18);
    obj.label43:setAlign("top");
    obj.label43:setHeight(20);
    obj.label43:setText("Habilidades de Raça e Origem");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle18);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("habRaca");
    obj.textEditor2:setMargins({left=5,right=5,bottom=5});
    obj.textEditor2:setName("textEditor2");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.scrollBox3);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(600);
    obj.layout42:setMargins({right=5});
    obj.layout42:setName("layout42");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout42);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("black");
    obj.rectangle19:setXradius(5);
    obj.rectangle19:setYradius(15);
    obj.rectangle19:setCornerType("round");
    obj.rectangle19:setName("rectangle19");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.rectangle19);
    obj.label44:setAlign("top");
    obj.label44:setHeight(20);
    obj.label44:setText("Habilidades de Classe e Poderes");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle19);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("habClasse");
    obj.textEditor3:setMargins({left=5,right=5,bottom=5});
    obj.textEditor3:setName("textEditor3");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Magias");
    obj.tab4:setName("tab4");

    obj.frmMagias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMagias:setParent(obj.tab4);
    obj.frmMagias:setName("frmMagias");
    obj.frmMagias:setAlign("client");
    obj.frmMagias:setTheme("light");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.frmMagias);
    obj.dataLink18:setFields({'atrMagiaCombo','forMod','desMod','conMod','intMod','sabMod','carMod'});
    obj.dataLink18:setName("dataLink18");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.frmMagias);
    obj.dataLink19:setFields({'atrMagia','nivel'});
    obj.dataLink19:setName("dataLink19");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmMagias);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.scrollBox4);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setMargins({bottom=5});
    obj.layout43:setName("layout43");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout43);
    obj.button3:setAlign("left");
    obj.button3:setText("Novo");
    obj.button3:setWidth(100);
    obj.button3:setName("button3");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout43);
    obj.label45:setAlign("left");
    obj.label45:setWidth(100);
    obj.label45:setText("Atributo-Chave");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setVertTextAlign("center");
    obj.label45:setName("label45");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout43);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setWidth(50);
    obj.comboBox3:setFontSize(9);
    obj.comboBox3:setField("atrMagiaCombo");
    obj.comboBox3:setItems({'FOR','DES','CON','INT','SAB','CAR'});
    obj.comboBox3:setValues({'forMod','desMod','conMod','intMod','sabMod','carMod'});
    obj.comboBox3:setName("comboBox3");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout43);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(50);
    obj.rectangle20:setColor("#F0FFFF");
    obj.rectangle20:setStrokeColor("black");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.rectangle20);
    obj.label46:setAlign("client");
    obj.label46:setField("atrMagia");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setVertTextAlign("center");
    obj.label46:setName("label46");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout43);
    obj.label47:setAlign("left");
    obj.label47:setWidth(100);
    obj.label47:setText("Teste de Resistência");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setVertTextAlign("center");
    obj.label47:setFontSize(11);
    obj.label47:setName("label47");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout43);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setColor("#F0FFFF");
    obj.rectangle21:setStrokeColor("black");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.rectangle21);
    obj.label48:setAlign("client");
    obj.label48:setField("cdMagia");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setVertTextAlign("center");
    obj.label48:setName("label48");

    obj.rclMagias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMagias:setParent(obj.scrollBox4);
    obj.rclMagias:setAlign("client");
    obj.rclMagias:setName("rclMagias");
    obj.rclMagias:setField("listaMagias");
    obj.rclMagias:setTemplateForm("frmMagiaForm");
    obj.rclMagias:setLayout("verticalTiles");
    obj.rclMagias:setSelectable(true);

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Equipamento");
    obj.tab5:setName("tab5");

    obj.frmEquipamentos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmEquipamentos:setParent(obj.tab5);
    obj.frmEquipamentos:setName("frmEquipamentos");
    obj.frmEquipamentos:setAlign("client");
    obj.frmEquipamentos:setTheme("light");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.frmEquipamentos);
    obj.dataLink20:setFields({'forAtr'});
    obj.dataLink20:setName("dataLink20");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmEquipamentos);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox5);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(25);
    obj.layout44:setMargins({bottom=5});
    obj.layout44:setName("layout44");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout44);
    obj.button4:setAlign("left");
    obj.button4:setText("Novo");
    obj.button4:setWidth(100);
    obj.button4:setName("button4");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout44);
    obj.label49:setAlign("left");
    obj.label49:setWidth(100);
    obj.label49:setText("Carga Atual");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setVertTextAlign("center");
    obj.label49:setName("label49");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout44);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setColor("#F0FFFF");
    obj.rectangle22:setStrokeColor("black");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle22);
    obj.label50:setAlign("client");
    obj.label50:setField("cargaAtual");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setVertTextAlign("center");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout44);
    obj.label51:setAlign("left");
    obj.label51:setWidth(100);
    obj.label51:setText("Carga Máxima");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setVertTextAlign("center");
    obj.label51:setName("label51");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout44);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setColor("#F0FFFF");
    obj.rectangle23:setStrokeColor("black");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle23);
    obj.label52:setAlign("client");
    obj.label52:setField("cargaMax");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setVertTextAlign("center");
    obj.label52:setName("label52");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout44);
    obj.label53:setAlign("left");
    obj.label53:setWidth(100);
    obj.label53:setText("Levantar");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setVertTextAlign("center");
    obj.label53:setName("label53");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout44);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(50);
    obj.rectangle24:setColor("#F0FFFF");
    obj.rectangle24:setStrokeColor("black");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle24);
    obj.label54:setAlign("client");
    obj.label54:setField("cargaLev");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setVertTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout44);
    obj.label55:setAlign("left");
    obj.label55:setWidth(50);
    obj.label55:setText("T$");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setVertTextAlign("center");
    obj.label55:setFontSize(11);
    obj.label55:setName("label55");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout44);
    obj.edit26:setAlign("left");
    obj.edit26:setWidth(75);
    obj.edit26:setField("dinheiroTS");
    obj.edit26:setName("edit26");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout44);
    obj.label56:setAlign("left");
    obj.label56:setWidth(50);
    obj.label56:setText("TO");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setVertTextAlign("center");
    obj.label56:setFontSize(11);
    obj.label56:setName("label56");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout44);
    obj.edit27:setAlign("left");
    obj.edit27:setWidth(75);
    obj.edit27:setField("dinheiroTO");
    obj.edit27:setName("edit27");

    obj.rclEquipamentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipamentos:setParent(obj.scrollBox5);
    obj.rclEquipamentos:setAlign("client");
    obj.rclEquipamentos:setName("rclEquipamentos");
    obj.rclEquipamentos:setField("listaEquipamentos");
    obj.rclEquipamentos:setTemplateForm("frmEquipamentoForm");
    obj.rclEquipamentos:setLayout("verticalTiles");
    obj.rclEquipamentos:setSelectable(true);

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Descrição");
    obj.tab6:setName("tab6");

    obj.frmTemplateDescription = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateDescription:setParent(obj.tab6);
    obj.frmTemplateDescription:setName("frmTemplateDescription");
    obj.frmTemplateDescription:setAlign("client");
    obj.frmTemplateDescription:setTheme("light");

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmTemplateDescription);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.scrollBox6);
    obj.rectangle25:setLeft(0);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(1205);
    obj.rectangle25:setHeight(105);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setName("rectangle25");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.rectangle25);
    obj.label57:setLeft(3);
    obj.label57:setTop(1);
    obj.label57:setWidth(100);
    obj.label57:setHeight(20);
    obj.label57:setText("DESCRIÇÃO");
    obj.label57:setName("label57");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.rectangle25);
    obj.label58:setLeft(10);
    obj.label58:setTop(25);
    obj.label58:setWidth(90);
    obj.label58:setHeight(20);
    obj.label58:setText("TAMANHO");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.rectangle25);
    obj.edit28:setLeft(100);
    obj.edit28:setTop(25);
    obj.edit28:setWidth(200);
    obj.edit28:setHeight(25);
    obj.edit28:setField("tamanhoDesc");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setName("edit28");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.rectangle25);
    obj.label59:setLeft(10);
    obj.label59:setTop(50);
    obj.label59:setWidth(90);
    obj.label59:setHeight(20);
    obj.label59:setText("ALTURA");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.rectangle25);
    obj.edit29:setLeft(100);
    obj.edit29:setTop(50);
    obj.edit29:setWidth(200);
    obj.edit29:setHeight(25);
    obj.edit29:setField("altura");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setName("edit29");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle25);
    obj.label60:setLeft(10);
    obj.label60:setTop(75);
    obj.label60:setWidth(90);
    obj.label60:setHeight(20);
    obj.label60:setText("PESO");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.rectangle25);
    obj.edit30:setLeft(100);
    obj.edit30:setTop(75);
    obj.edit30:setWidth(200);
    obj.edit30:setHeight(25);
    obj.edit30:setField("peso");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setName("edit30");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle25);
    obj.label61:setLeft(310);
    obj.label61:setTop(25);
    obj.label61:setWidth(90);
    obj.label61:setHeight(20);
    obj.label61:setText("IDADE");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.rectangle25);
    obj.edit31:setLeft(400);
    obj.edit31:setTop(25);
    obj.edit31:setWidth(200);
    obj.edit31:setHeight(25);
    obj.edit31:setField("idade");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setName("edit31");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle25);
    obj.label62:setLeft(310);
    obj.label62:setTop(50);
    obj.label62:setWidth(90);
    obj.label62:setHeight(20);
    obj.label62:setText("SEXO");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.rectangle25);
    obj.edit32:setLeft(400);
    obj.edit32:setTop(50);
    obj.edit32:setWidth(200);
    obj.edit32:setHeight(25);
    obj.edit32:setField("sexo");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setName("edit32");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle25);
    obj.label63:setLeft(310);
    obj.label63:setTop(75);
    obj.label63:setWidth(90);
    obj.label63:setHeight(20);
    obj.label63:setText("OUTROS");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.rectangle25);
    obj.edit33:setLeft(400);
    obj.edit33:setTop(75);
    obj.edit33:setWidth(200);
    obj.edit33:setHeight(25);
    obj.edit33:setField("aparenciaOutros");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setName("edit33");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.rectangle25);
    obj.label64:setLeft(610);
    obj.label64:setTop(25);
    obj.label64:setWidth(90);
    obj.label64:setHeight(20);
    obj.label64:setText("OLHOS");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.rectangle25);
    obj.edit34:setLeft(700);
    obj.edit34:setTop(25);
    obj.edit34:setWidth(200);
    obj.edit34:setHeight(25);
    obj.edit34:setField("aparenciaOlhos");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setName("edit34");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.rectangle25);
    obj.label65:setLeft(610);
    obj.label65:setTop(50);
    obj.label65:setWidth(90);
    obj.label65:setHeight(20);
    obj.label65:setText("PELE");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.rectangle25);
    obj.edit35:setLeft(700);
    obj.edit35:setTop(50);
    obj.edit35:setWidth(200);
    obj.edit35:setHeight(25);
    obj.edit35:setField("pele");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setName("edit35");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.rectangle25);
    obj.label66:setLeft(610);
    obj.label66:setTop(75);
    obj.label66:setWidth(90);
    obj.label66:setHeight(20);
    obj.label66:setText("CABELO");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.rectangle25);
    obj.edit36:setLeft(700);
    obj.edit36:setTop(75);
    obj.edit36:setWidth(200);
    obj.edit36:setHeight(25);
    obj.edit36:setField("cabelo");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setName("edit36");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.rectangle25);
    obj.label67:setLeft(910);
    obj.label67:setTop(25);
    obj.label67:setWidth(90);
    obj.label67:setHeight(20);
    obj.label67:setText("PLANO");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.rectangle25);
    obj.edit37:setLeft(1000);
    obj.edit37:setTop(25);
    obj.edit37:setWidth(200);
    obj.edit37:setHeight(25);
    obj.edit37:setField("plano");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setName("edit37");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.rectangle25);
    obj.label68:setLeft(910);
    obj.label68:setTop(50);
    obj.label68:setWidth(90);
    obj.label68:setHeight(20);
    obj.label68:setText("REGIÃO");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.rectangle25);
    obj.edit38:setLeft(1000);
    obj.edit38:setTop(50);
    obj.edit38:setWidth(200);
    obj.edit38:setHeight(25);
    obj.edit38:setField("regiao");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setName("edit38");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle25);
    obj.label69:setLeft(910);
    obj.label69:setTop(75);
    obj.label69:setWidth(90);
    obj.label69:setHeight(20);
    obj.label69:setText("REINO");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.rectangle25);
    obj.edit39:setLeft(1000);
    obj.edit39:setTop(75);
    obj.edit39:setWidth(200);
    obj.edit39:setHeight(25);
    obj.edit39:setField("reino");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setName("edit39");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox6);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(110);
    obj.layout45:setWidth(375);
    obj.layout45:setHeight(240);
    obj.layout45:setName("layout45");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout45);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setName("rectangle26");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout45);
    obj.label70:setLeft(5);
    obj.label70:setTop(1);
    obj.label70:setWidth(100);
    obj.label70:setHeight(20);
    obj.label70:setText("APARÊNCIA");
    obj.label70:setName("label70");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout45);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(365);
    obj.textEditor4:setHeight(210);
    obj.textEditor4:setField("aparencia");
    obj.textEditor4:setName("textEditor4");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox6);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(355);
    obj.layout46:setWidth(375);
    obj.layout46:setHeight(250);
    obj.layout46:setName("layout46");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout46);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout46);
    obj.label71:setLeft(5);
    obj.label71:setTop(1);
    obj.label71:setWidth(100);
    obj.label71:setHeight(20);
    obj.label71:setText("PERSONALIDADE");
    obj.label71:setName("label71");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout46);
    obj.textEditor5:setLeft(5);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(365);
    obj.textEditor5:setHeight(220);
    obj.textEditor5:setField("personalidade");
    obj.textEditor5:setName("textEditor5");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox6);
    obj.layout47:setLeft(380);
    obj.layout47:setTop(110);
    obj.layout47:setWidth(825);
    obj.layout47:setHeight(495);
    obj.layout47:setName("layout47");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout47);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout47);
    obj.label72:setLeft(5);
    obj.label72:setTop(1);
    obj.label72:setWidth(100);
    obj.label72:setHeight(20);
    obj.label72:setText("HISTORIA");
    obj.label72:setName("label72");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout47);
    obj.richEdit1:setLeft(5);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(815);
    obj.richEdit1:setHeight(465);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#FFFFFF");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "black");
    obj.richEdit1:setName("richEdit1");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl1);
    obj.tab7:setTitle("Anotações");
    obj.tab7:setName("tab7");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab7);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");
    obj.frmTemplateNotes:setTheme("light");

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmTemplateNotes);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox7);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(400);
    obj.layout48:setMargins({right=5});
    obj.layout48:setName("layout48");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout48);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(15);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.rectangle29);
    obj.label73:setAlign("top");
    obj.label73:setHeight(20);
    obj.label73:setText("Anotações");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle29);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("anotacoes1");
    obj.textEditor6:setMargins({left=5,right=5,bottom=5});
    obj.textEditor6:setName("textEditor6");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox7);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(400);
    obj.layout49:setMargins({right=5});
    obj.layout49:setName("layout49");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout49);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setXradius(5);
    obj.rectangle30:setYradius(15);
    obj.rectangle30:setCornerType("round");
    obj.rectangle30:setName("rectangle30");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.rectangle30);
    obj.label74:setAlign("top");
    obj.label74:setHeight(20);
    obj.label74:setText("Anotações");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle30);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("anotacoes2");
    obj.textEditor7:setMargins({left=5,right=5,bottom=5});
    obj.textEditor7:setName("textEditor7");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.scrollBox7);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(400);
    obj.layout50:setMargins({right=5});
    obj.layout50:setName("layout50");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout50);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setXradius(5);
    obj.rectangle31:setYradius(15);
    obj.rectangle31:setCornerType("round");
    obj.rectangle31:setName("rectangle31");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.rectangle31);
    obj.label75:setAlign("top");
    obj.label75:setHeight(20);
    obj.label75:setText("Anotações");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle31);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("anotacoes3");
    obj.textEditor8:setMargins({left=5,right=5,bottom=5});
    obj.textEditor8:setName("textEditor8");

    obj.tab8 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab8:setParent(obj.tabControl1);
    obj.tab8:setTitle("Creditos");
    obj.tab8:setName("tab8");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab8);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");
    obj.frmTemplateCreditos:setTheme("light");


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
    obj.image2:setSRC("/Ficha Tormenta 20/images/fulgurante.jpg");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox8);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Ficha Tormenta 20/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox8);
    obj.layout51:setLeft(850);
    obj.layout51:setTop(0);
    obj.layout51:setWidth(200);
    obj.layout51:setHeight(160);
    obj.layout51:setName("layout51");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout51);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setXradius(5);
    obj.rectangle32:setYradius(15);
    obj.rectangle32:setCornerType("round");
    obj.rectangle32:setName("rectangle32");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout51);
    obj.label76:setLeft(0);
    obj.label76:setTop(10);
    obj.label76:setWidth(200);
    obj.label76:setHeight(20);
    obj.label76:setText("Ficha feita por: ");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout51);
    obj.label77:setLeft(0);
    obj.label77:setTop(35);
    obj.label77:setWidth(200);
    obj.label77:setHeight(20);
    obj.label77:setText("Vinny (Ambesek)");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout51);
    obj.label78:setLeft(0);
    obj.label78:setTop(60);
    obj.label78:setWidth(200);
    obj.label78:setHeight(20);
    obj.label78:setText("Willian (sqwert00)");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.scrollBox8);
    obj.layout52:setLeft(850);
    obj.layout52:setTop(170);
    obj.layout52:setWidth(200);
    obj.layout52:setHeight(150);
    obj.layout52:setName("layout52");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout52);
    obj.rectangle33:setLeft(0);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(200);
    obj.rectangle33:setHeight(150);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout52);
    obj.label79:setLeft(0);
    obj.label79:setTop(10);
    obj.label79:setWidth(80);
    obj.label79:setHeight(20);
    obj.label79:setText("Tema:");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout52);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(10);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("theme");
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setItems({'Escuro', 'Claro'});
    obj.comboBox4:setHorzTextAlign("center");
    obj.comboBox4:setName("comboBox4");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout52);
    obj.dataLink21:setField("theme");
    obj.dataLink21:setDefaultValue("Claro");
    obj.dataLink21:setName("dataLink21");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout52);
    obj.label80:setLeft(0);
    obj.label80:setTop(35);
    obj.label80:setWidth(90);
    obj.label80:setHeight(20);
    obj.label80:setText("Cores: ");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout52);
    obj.label81:setLeft(0);
    obj.label81:setTop(60);
    obj.label81:setWidth(90);
    obj.label81:setHeight(20);
    obj.label81:setText("Fundo ");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout52);
    obj.comboBox5:setLeft(95);
    obj.comboBox5:setTop(60);
    obj.comboBox5:setWidth(90);
    obj.comboBox5:setField("colorBackground");
    obj.comboBox5:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox5:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout52);
    obj.dataLink22:setField("colorBackground");
    obj.dataLink22:setDefaultValue("#F0FFFF");
    obj.dataLink22:setName("dataLink22");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout52);
    obj.label82:setLeft(0);
    obj.label82:setTop(85);
    obj.label82:setWidth(90);
    obj.label82:setHeight(20);
    obj.label82:setText("Linhas ");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout52);
    obj.comboBox6:setLeft(95);
    obj.comboBox6:setTop(85);
    obj.comboBox6:setWidth(90);
    obj.comboBox6:setField("colorStroke");
    obj.comboBox6:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox6:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout52);
    obj.dataLink23:setField("colorStroke");
    obj.dataLink23:setDefaultValue("#696969");
    obj.dataLink23:setName("dataLink23");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout52);
    obj.label83:setLeft(0);
    obj.label83:setTop(110);
    obj.label83:setWidth(90);
    obj.label83:setHeight(20);
    obj.label83:setText("Fonte ");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout52);
    obj.comboBox7:setLeft(95);
    obj.comboBox7:setTop(110);
    obj.comboBox7:setWidth(90);
    obj.comboBox7:setField("colorFont");
    obj.comboBox7:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox7:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout52);
    obj.dataLink24:setField("colorFont");
    obj.dataLink24:setDefaultValue("#000000");
    obj.dataLink24:setName("dataLink24");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.scrollBox8);
    obj.label84:setLeft(555);
    obj.label84:setTop(275);
    obj.label84:setWidth(200);
    obj.label84:setHeight(20);
    obj.label84:setText("Versão Atual: ");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setField("versionInstalled");
    obj.label84:setName("label84");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.scrollBox8);
    obj.label85:setLeft(555);
    obj.label85:setTop(300);
    obj.label85:setWidth(200);
    obj.label85:setHeight(20);
    obj.label85:setText("Sua Versão: ");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setField("versionDownloaded");
    obj.label85:setName("label85");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.scrollBox8);
    obj.checkBox2:setLeft(555);
    obj.checkBox2:setTop(325);
    obj.checkBox2:setWidth(200);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setField("noUpdate");
    obj.checkBox2:setText("Não pedir para atualizar.");
    obj.checkBox2:setName("checkBox2");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox8);
    obj.button5:setLeft(555);
    obj.button5:setTop(350);
    obj.button5:setWidth(100);
    obj.button5:setText("Change Log");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox8);
    obj.button6:setLeft(667);
    obj.button6:setTop(350);
    obj.button6:setWidth(100);
    obj.button6:setText("Atualizar");
    obj.button6:setName("button6");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.scrollBox8);
    obj.label86:setLeft(555);
    obj.label86:setTop(400);
    obj.label86:setWidth(200);
    obj.label86:setHeight(20);
    obj.label86:setText("Conheça as Mesas:");
    obj.label86:setName("label86");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox8);
    obj.button7:setLeft(555);
    obj.button7:setTop(425);
    obj.button7:setWidth(100);
    obj.button7:setText("RPGmeister");
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.scrollBox8);
    obj.button8:setLeft(667);
    obj.button8:setTop(425);
    obj.button8:setWidth(125);
    obj.button8:setText("Fulgurante");
    obj.button8:setName("button8");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Tormenta%2020/output/Ficha%20Tormenta%2020.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Tormenta%2020/output/Ficha%20Tormenta%2020.rpk?raw=true');
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

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atr = tonumber(sheet.forAtr) or 0;
            				sheet.formod = math.floor((atr-10)/2)
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atr = tonumber(sheet.desAtr) or 0;
            				sheet.desmod = math.floor((atr-10)/2)
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atr = tonumber(sheet.conAtr) or 0;
            				sheet.conmod = math.floor((atr-10)/2)
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atr = tonumber(sheet.intAtr) or 0;
            				sheet.intmod = math.floor((atr-10)/2)
        end, obj);

    obj._e_event5 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atr = tonumber(sheet.sabAtr) or 0;
            				sheet.sabmod = math.floor((atr-10)/2)
        end, obj);

    obj._e_event6 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local atr = tonumber(sheet.carAtr) or 0;
            				sheet.carmod = math.floor((atr-10)/2)
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            							sheet.defesa = 	(tonumber(sheet.caAtr) or 0) + 
            											(tonumber(sheet.caArm) or 0) + 
            											(tonumber(sheet.caEsc) or 0) + 
            											(tonumber(sheet.caOut) or 0) + 10;
        end, obj);

    obj._e_event8 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            							local check = sheet.atrModCheck or false;
            							local field = sheet.atrModCombo or "empty";
            
            							if check then 
            								sheet.caAtr = tonumber(sheet[field]) or 0;
            							else
            								sheet.caAtr = 0;
            							end;
        end, obj);

    obj._e_event9 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event10 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            							local tam = tonumber(sheet.tamanho) or 0;
            							sheet.tamanhoMod = tam .. "/" .. (tam*-1);
        end, obj);

    obj._e_event11 = obj.rclAtaques:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            			        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event12 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local nivel = tonumber(sheet.nivel) or 0;
            
            			local nivelMod = math.floor(nivel/2);
            			local bonus = 2;
            			if nivel >= 15 then
            				bonus = 6;
            			elseif nivel >= 7 then
            				bonus = 4;
            			end;
            
            			local nodes = NDB.getChildNodes(sheet.listaPericias); 
            			for i=1, #nodes, 1 do
            				nodes[i].nivelMod = nivelMod;
            				nodes[i].bonus = bonus;
            			end
        end, obj);

    obj._e_event13 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local caArmPen = tonumber(sheet.caArmPen) or 0;
            			local caEscPen = tonumber(sheet.caEscPen) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaPericias); 
            			for i=1, #nodes, 1 do
            				nodes[i].pen = caArmPen + caEscPen;
            			end
        end, obj);

    obj._e_event14 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local mod = tonumber(sheet.forMod) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaPericias); 
            			for i=1, #nodes, 1 do
            				nodes[i].forMod = mod;
            			end
        end, obj);

    obj._e_event15 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local mod = tonumber(sheet.desMod) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaPericias); 
            			for i=1, #nodes, 1 do
            				nodes[i].desMod = mod;
            			end
        end, obj);

    obj._e_event16 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local mod = tonumber(sheet.conMod) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaPericias); 
            			for i=1, #nodes, 1 do
            				nodes[i].conMod = mod;
            			end
        end, obj);

    obj._e_event17 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local mod = tonumber(sheet.intMod) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaPericias); 
            			for i=1, #nodes, 1 do
            				nodes[i].intMod = mod;
            			end
        end, obj);

    obj._e_event18 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local mod = tonumber(sheet.sabMod) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaPericias); 
            			for i=1, #nodes, 1 do
            				nodes[i].sabMod = mod;
            			end
        end, obj);

    obj._e_event19 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local mod = tonumber(sheet.carMod) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaPericias); 
            			for i=1, #nodes, 1 do
            				nodes[i].carMod = mod;
            			end
        end, obj);

    obj._e_event20 = obj.button1:addEventListener("onClick",
        function (_)
            addSkill("","",false,false);
        end, obj);

    obj._e_event21 = obj.button2:addEventListener("onClick",
        function (_)
            tormenta20();
        end, obj);

    obj._e_event22 = obj.rclPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            		        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event23 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local atr = sheet.atrMagiaCombo or "empty";
            			sheet.atrMagia = tonumber(sheet[atr]) or 0;
        end, obj);

    obj._e_event24 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local atr = tonumber(sheet.atrMagia) or 0;
            
            
            			local nivel = tonumber(sheet.nivel) or 0;
            			nivel = math.floor(nivel/2);
            
            			sheet.cdMagia = 10 + atr + nivel;
        end, obj);

    obj._e_event25 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclMagias:append();
        end, obj);

    obj._e_event26 = obj.rclMagias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            		        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event27 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local forca = tonumber(sheet.forAtr) or 0;
            
            			sheet.cargaMax = forca * 3;
            			sheet.cargaLev = forca * 10;
        end, obj);

    obj._e_event28 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclEquipamentos:append();
        end, obj);

    obj._e_event29 = obj.rclEquipamentos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            		        return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event30 = obj.comboBox4:addEventListener("onChange",
        function (_)
            if sheet == nil then return end;
            					local theme = sheet.theme;
            					if theme == "Escuro" then
            						theme = "dark";
            					else
            						theme = "light";
            					end;
            
            					local forms = findClass("form");
            
            					for i=1, #forms, 1 do 
            						forms[i].theme = theme;
            					end;
        end, obj);

    obj._e_event31 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event32 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event33 = obj.dataLink24:addEventListener("onChange",
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

    obj._e_event34 = obj.button5:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Tormenta%2020/README.md')
        end, obj);

    obj._e_event35 = obj.button6:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Tormenta%2020/output/Ficha%20Tormenta%2020.rpk?raw=true')
        end, obj);

    obj._e_event36 = obj.button7:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event37 = obj.button8:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecast.app/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=192936');
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
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
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
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
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.rclMagias ~= nil then self.rclMagias:destroy(); self.rclMagias = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.frmEquipamentos ~= nil then self.frmEquipamentos:destroy(); self.frmEquipamentos = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.frmMagias ~= nil then self.frmMagias:destroy(); self.frmMagias = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.frmHabilidades ~= nil then self.frmHabilidades:destroy(); self.frmHabilidades = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.rclEquipamentos ~= nil then self.rclEquipamentos:destroy(); self.rclEquipamentos = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.frmTemplateDescription ~= nil then self.frmTemplateDescription:destroy(); self.frmTemplateDescription = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
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
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.frmPericias ~= nil then self.frmPericias:destroy(); self.frmPericias = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rclAtaques ~= nil then self.rclAtaques:destroy(); self.rclAtaques = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.rclPericias ~= nil then self.rclPericias:destroy(); self.rclPericias = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
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

function newfrmTemplate()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTemplate();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTemplate = {
    newEditor = newfrmTemplate, 
    new = newfrmTemplate, 
    name = "frmTemplate", 
    dataType = "Ambesek.Tormenta20", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Tormenta 20", 
    description=""};

frmTemplate = _frmTemplate;
Firecast.registrarForm(_frmTemplate);
Firecast.registrarDataType(_frmTemplate);

return _frmTemplate;
