require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmRunarcana()
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
    obj:setName("frmRunarcana");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Ficha.Runarcana");
    obj:setTitle("Ficha Runarcana");
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
    obj.tab1:setTitle("Principal");
    obj.tab1:setName("tab1");

    obj.frmPrincipal = GUI.fromHandle(_obj_newObject("form"));
    obj.frmPrincipal:setParent(obj.tab1);
    obj.frmPrincipal:setName("frmPrincipal");
    obj.frmPrincipal:setAlign("client");


		function self:AddPericia(nome, key)
			if sheet==nil then return end;
			if self==nil then return end;
			local rclItem = self.rclPericias:append();
			if rclItem ~= nil then
				rclItem.proficiencia = sheet.proficiencia;
				rclItem.for_mod = sheet.for_mod;
				rclItem.des_mod = sheet.des_mod;
				rclItem.con_mod = sheet.con_mod;
				rclItem.int_mod = sheet.int_mod;
				rclItem.sab_mod = sheet.sab_mod;
				rclItem.car_mod = sheet.car_mod;
				rclItem.nome = nome;
				rclItem.perKey = key;
			end;
		end;
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmPrincipal);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(85);
    obj.layout1:setMargins({bottom=5});
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setWidth(1160);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle1:setMargins({right=5});
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(380);
    obj.layout3:setMargins({right=10});
    obj.layout3:setName("layout3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1:setAlign("left");
    obj.label1:setWidth(90);
    obj.label1:setText("JOGADOR");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");
    obj.label1:setFontColor("white");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setAlign("client");
    obj.edit1:setField("jogador");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(15);
    obj.edit1:setFontColor("white");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(380);
    obj.layout4:setMargins({right=10});
    obj.layout4:setName("layout4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setAlign("left");
    obj.label2:setWidth(90);
    obj.label2:setText("PASSADO");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");
    obj.label2:setFontColor("white");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setAlign("client");
    obj.edit2:setField("passado");
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setName("edit2");
    obj.edit2:setFontSize(15);
    obj.edit2:setFontColor("white");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout2);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(380);
    obj.layout5:setMargins({right=10});
    obj.layout5:setName("layout5");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout5);
    obj.label3:setAlign("left");
    obj.label3:setWidth(90);
    obj.label3:setText("CLASSE");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");
    obj.label3:setFontColor("white");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setAlign("client");
    obj.edit3:setField("classe");
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(15);
    obj.edit3:setFontColor("white");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.rectangle1);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(380);
    obj.layout7:setMargins({right=10});
    obj.layout7:setName("layout7");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout7);
    obj.label4:setAlign("left");
    obj.label4:setWidth(90);
    obj.label4:setText("PERSONAGEM");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");
    obj.label4:setFontColor("white");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout7);
    obj.edit4:setAlign("client");
    obj.edit4:setField("personagem");
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(15);
    obj.edit4:setFontColor("white");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout6);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(380);
    obj.layout8:setMargins({right=10});
    obj.layout8:setName("layout8");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout8);
    obj.label5:setAlign("left");
    obj.label5:setWidth(90);
    obj.label5:setText("ALINHAMENTO");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");
    obj.label5:setFontColor("white");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout8);
    obj.edit5:setAlign("client");
    obj.edit5:setField("alinhamento");
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setName("edit5");
    obj.edit5:setFontSize(15);
    obj.edit5:setFontColor("white");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout6);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(380);
    obj.layout9:setMargins({right=10});
    obj.layout9:setName("layout9");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout9);
    obj.label6:setAlign("left");
    obj.label6:setWidth(90);
    obj.label6:setText("NÍVEL");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");
    obj.label6:setFontColor("white");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setAlign("client");
    obj.edit6:setField("nivel");
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(15);
    obj.edit6:setFontColor("white");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.rectangle1);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(380);
    obj.layout11:setMargins({right=10});
    obj.layout11:setName("layout11");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout11);
    obj.label7:setAlign("left");
    obj.label7:setWidth(90);
    obj.label7:setText("ORIGEM");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");
    obj.label7:setFontColor("white");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout11);
    obj.edit7:setAlign("client");
    obj.edit7:setField("origem");
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(15);
    obj.edit7:setFontColor("white");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout10);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(380);
    obj.layout12:setMargins({right=10});
    obj.layout12:setName("layout12");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout12);
    obj.label8:setAlign("left");
    obj.label8:setWidth(90);
    obj.label8:setText("REGIÃO");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");
    obj.label8:setFontColor("white");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout12);
    obj.edit8:setAlign("client");
    obj.edit8:setField("região");
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setName("edit8");
    obj.edit8:setFontSize(15);
    obj.edit8:setFontColor("white");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout10);
    obj.layout13:setAlign("left");
    obj.layout13:setWidth(380);
    obj.layout13:setMargins({right=10});
    obj.layout13:setName("layout13");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout13);
    obj.label9:setAlign("left");
    obj.label9:setWidth(90);
    obj.label9:setText("EXPERIÊNCIA");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");
    obj.label9:setFontColor("white");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout13);
    obj.edit9:setAlign("client");
    obj.edit9:setField("experiência");
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setName("edit9");
    obj.edit9:setFontSize(15);
    obj.edit9:setFontColor("white");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14:setAlign("top");
    obj.layout14:setHeight(185);
    obj.layout14:setMargins({bottom=5});
    obj.layout14:setName("layout14");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout14);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(110);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle2:setMargins({right=5});
    obj.rectangle2:setName("rectangle2");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle2);
    obj.label10:setAlign("top");
    obj.label10:setHeight(25);
    obj.label10:setText("Atributos");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");
    obj.label10:setFontColor("white");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.rectangle2);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout15);
    obj.label11:setAlign("left");
    obj.label11:setWidth(40);
    obj.label11:setText("FOR");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");
    obj.label11:setFontColor("white");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout15);
    obj.edit10:setAlign("left");
    obj.edit10:setWidth(30);
    obj.edit10:setField("for_total");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setName("edit10");
    obj.edit10:setFontSize(15);
    obj.edit10:setFontColor("white");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout15);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle3);
    obj.label12:setAlign("client");
    obj.label12:setField("for_mod");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setVertTextAlign("center");
    obj.label12:setName("label12");
    obj.label12:setFontColor("white");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setField("for_total");
    obj.dataLink1:setName("dataLink1");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.rectangle2);
    obj.layout16:setAlign("top");
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout16);
    obj.label13:setAlign("left");
    obj.label13:setWidth(40);
    obj.label13:setText("DES");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");
    obj.label13:setFontColor("white");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout16);
    obj.edit11:setAlign("left");
    obj.edit11:setWidth(30);
    obj.edit11:setField("des_total");
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setName("edit11");
    obj.edit11:setFontSize(15);
    obj.edit11:setFontColor("white");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout16);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle4);
    obj.label14:setAlign("client");
    obj.label14:setField("des_mod");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setVertTextAlign("center");
    obj.label14:setName("label14");
    obj.label14:setFontColor("white");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle2);
    obj.dataLink2:setField("des_total");
    obj.dataLink2:setName("dataLink2");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.rectangle2);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout17);
    obj.label15:setAlign("left");
    obj.label15:setWidth(40);
    obj.label15:setText("CON");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");
    obj.label15:setFontColor("white");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout17);
    obj.edit12:setAlign("left");
    obj.edit12:setWidth(30);
    obj.edit12:setField("con_total");
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setName("edit12");
    obj.edit12:setFontSize(15);
    obj.edit12:setFontColor("white");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout17);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setWidth(30);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle5);
    obj.label16:setAlign("client");
    obj.label16:setField("con_mod");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setVertTextAlign("center");
    obj.label16:setName("label16");
    obj.label16:setFontColor("white");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle2);
    obj.dataLink3:setField("con_total");
    obj.dataLink3:setName("dataLink3");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.rectangle2);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout18);
    obj.label17:setAlign("left");
    obj.label17:setWidth(40);
    obj.label17:setText("INT");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");
    obj.label17:setFontColor("white");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout18);
    obj.edit13:setAlign("left");
    obj.edit13:setWidth(30);
    obj.edit13:setField("int_total");
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setName("edit13");
    obj.edit13:setFontSize(15);
    obj.edit13:setFontColor("white");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout18);
    obj.rectangle6:setAlign("left");
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle6);
    obj.label18:setAlign("client");
    obj.label18:setField("int_mod");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setVertTextAlign("center");
    obj.label18:setName("label18");
    obj.label18:setFontColor("white");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle2);
    obj.dataLink4:setField("int_total");
    obj.dataLink4:setName("dataLink4");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.rectangle2);
    obj.layout19:setAlign("top");
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout19);
    obj.label19:setAlign("left");
    obj.label19:setWidth(40);
    obj.label19:setText("SAB");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");
    obj.label19:setFontColor("white");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout19);
    obj.edit14:setAlign("left");
    obj.edit14:setWidth(30);
    obj.edit14:setField("sab_total");
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setName("edit14");
    obj.edit14:setFontSize(15);
    obj.edit14:setFontColor("white");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout19);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle7);
    obj.label20:setAlign("client");
    obj.label20:setField("sab_mod");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setVertTextAlign("center");
    obj.label20:setName("label20");
    obj.label20:setFontColor("white");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle2);
    obj.dataLink5:setField("sab_total");
    obj.dataLink5:setName("dataLink5");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.rectangle2);
    obj.layout20:setAlign("top");
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout20);
    obj.label21:setAlign("left");
    obj.label21:setWidth(40);
    obj.label21:setText("CAR");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");
    obj.label21:setFontColor("white");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout20);
    obj.edit15:setAlign("left");
    obj.edit15:setWidth(30);
    obj.edit15:setField("car_total");
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setName("edit15");
    obj.edit15:setFontSize(15);
    obj.edit15:setFontColor("white");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout20);
    obj.rectangle8:setAlign("left");
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle8);
    obj.label22:setAlign("client");
    obj.label22:setField("car_mod");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setVertTextAlign("center");
    obj.label22:setName("label22");
    obj.label22:setFontColor("white");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle2);
    obj.dataLink6:setField("car_total");
    obj.dataLink6:setName("dataLink6");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout14);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setWidth(110);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle9:setMargins({right=5});
    obj.rectangle9:setName("rectangle9");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle9);
    obj.label23:setAlign("top");
    obj.label23:setHeight(25);
    obj.label23:setText("Salvaguarda");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");
    obj.label23:setFontColor("white");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.rectangle9);
    obj.layout21:setAlign("top");
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout21);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("for_svProf1");
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout21);
    obj.checkBox2:setAlign("left");
    obj.checkBox2:setWidth(20);
    obj.checkBox2:setField("for_svProf2");
    obj.checkBox2:setHorzTextAlign("center");
    obj.checkBox2:setName("checkBox2");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout21);
    obj.edit16:setAlign("left");
    obj.edit16:setWidth(30);
    obj.edit16:setField("for_svAdicional");
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setName("edit16");
    obj.edit16:setFontSize(15);
    obj.edit16:setFontColor("white");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout21);
    obj.rectangle10:setAlign("left");
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle10);
    obj.label24:setAlign("client");
    obj.label24:setField("for_svTotal");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setVertTextAlign("center");
    obj.label24:setName("label24");
    obj.label24:setFontColor("white");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle9);
    obj.dataLink7:setFields({'for_mod','proficiencia','for_svProf1','for_svProf2','for_svAdicional'});
    obj.dataLink7:setName("dataLink7");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.rectangle9);
    obj.layout22:setAlign("top");
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout22);
    obj.checkBox3:setAlign("left");
    obj.checkBox3:setWidth(20);
    obj.checkBox3:setField("des_svProf1");
    obj.checkBox3:setHorzTextAlign("center");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout22);
    obj.checkBox4:setAlign("left");
    obj.checkBox4:setWidth(20);
    obj.checkBox4:setField("des_svProf2");
    obj.checkBox4:setHorzTextAlign("center");
    obj.checkBox4:setName("checkBox4");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout22);
    obj.edit17:setAlign("left");
    obj.edit17:setWidth(30);
    obj.edit17:setField("des_svAdicional");
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setName("edit17");
    obj.edit17:setFontSize(15);
    obj.edit17:setFontColor("white");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout22);
    obj.rectangle11:setAlign("left");
    obj.rectangle11:setWidth(30);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.rectangle11);
    obj.label25:setAlign("client");
    obj.label25:setField("des_svTotal");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setVertTextAlign("center");
    obj.label25:setName("label25");
    obj.label25:setFontColor("white");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle9);
    obj.dataLink8:setFields({'des_mod','proficiencia','des_svProf1','des_svProf2','des_svAdicional'});
    obj.dataLink8:setName("dataLink8");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.rectangle9);
    obj.layout23:setAlign("top");
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout23);
    obj.checkBox5:setAlign("left");
    obj.checkBox5:setWidth(20);
    obj.checkBox5:setField("con_svProf1");
    obj.checkBox5:setHorzTextAlign("center");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout23);
    obj.checkBox6:setAlign("left");
    obj.checkBox6:setWidth(20);
    obj.checkBox6:setField("con_svProf2");
    obj.checkBox6:setHorzTextAlign("center");
    obj.checkBox6:setName("checkBox6");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout23);
    obj.edit18:setAlign("left");
    obj.edit18:setWidth(30);
    obj.edit18:setField("con_svAdicional");
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setName("edit18");
    obj.edit18:setFontSize(15);
    obj.edit18:setFontColor("white");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout23);
    obj.rectangle12:setAlign("left");
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.rectangle12);
    obj.label26:setAlign("client");
    obj.label26:setField("con_svTotal");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setVertTextAlign("center");
    obj.label26:setName("label26");
    obj.label26:setFontColor("white");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.rectangle9);
    obj.dataLink9:setFields({'con_mod','proficiencia','con_svProf1','con_svProf2','con_svAdicional'});
    obj.dataLink9:setName("dataLink9");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.rectangle9);
    obj.layout24:setAlign("top");
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout24);
    obj.checkBox7:setAlign("left");
    obj.checkBox7:setWidth(20);
    obj.checkBox7:setField("int_svProf1");
    obj.checkBox7:setHorzTextAlign("center");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout24);
    obj.checkBox8:setAlign("left");
    obj.checkBox8:setWidth(20);
    obj.checkBox8:setField("int_svProf2");
    obj.checkBox8:setHorzTextAlign("center");
    obj.checkBox8:setName("checkBox8");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout24);
    obj.edit19:setAlign("left");
    obj.edit19:setWidth(30);
    obj.edit19:setField("int_svAdicional");
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setName("edit19");
    obj.edit19:setFontSize(15);
    obj.edit19:setFontColor("white");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout24);
    obj.rectangle13:setAlign("left");
    obj.rectangle13:setWidth(30);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.rectangle13);
    obj.label27:setAlign("client");
    obj.label27:setField("int_svTotal");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setVertTextAlign("center");
    obj.label27:setName("label27");
    obj.label27:setFontColor("white");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.rectangle9);
    obj.dataLink10:setFields({'int_mod','proficiencia','int_svProf1','int_svProf2','int_svAdicional'});
    obj.dataLink10:setName("dataLink10");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.rectangle9);
    obj.layout25:setAlign("top");
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout25);
    obj.checkBox9:setAlign("left");
    obj.checkBox9:setWidth(20);
    obj.checkBox9:setField("sab_svProf1");
    obj.checkBox9:setHorzTextAlign("center");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout25);
    obj.checkBox10:setAlign("left");
    obj.checkBox10:setWidth(20);
    obj.checkBox10:setField("sab_svProf2");
    obj.checkBox10:setHorzTextAlign("center");
    obj.checkBox10:setName("checkBox10");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout25);
    obj.edit20:setAlign("left");
    obj.edit20:setWidth(30);
    obj.edit20:setField("sab_svAdicional");
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setName("edit20");
    obj.edit20:setFontSize(15);
    obj.edit20:setFontColor("white");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout25);
    obj.rectangle14:setAlign("left");
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.rectangle14);
    obj.label28:setAlign("client");
    obj.label28:setField("sab_svTotal");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setVertTextAlign("center");
    obj.label28:setName("label28");
    obj.label28:setFontColor("white");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.rectangle9);
    obj.dataLink11:setFields({'sab_mod','proficiencia','sab_svProf1','sab_svProf2','sab_svAdicional'});
    obj.dataLink11:setName("dataLink11");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.rectangle9);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout26);
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setWidth(20);
    obj.checkBox11:setField("car_svProf1");
    obj.checkBox11:setHorzTextAlign("center");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout26);
    obj.checkBox12:setAlign("left");
    obj.checkBox12:setWidth(20);
    obj.checkBox12:setField("car_svProf2");
    obj.checkBox12:setHorzTextAlign("center");
    obj.checkBox12:setName("checkBox12");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout26);
    obj.edit21:setAlign("left");
    obj.edit21:setWidth(30);
    obj.edit21:setField("car_svAdicional");
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setName("edit21");
    obj.edit21:setFontSize(15);
    obj.edit21:setFontColor("white");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout26);
    obj.rectangle15:setAlign("left");
    obj.rectangle15:setWidth(30);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.rectangle15);
    obj.label29:setAlign("client");
    obj.label29:setField("car_svTotal");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setVertTextAlign("center");
    obj.label29:setName("label29");
    obj.label29:setFontColor("white");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.rectangle9);
    obj.dataLink12:setFields({'car_mod','proficiencia','car_svProf1','car_svProf2','car_svAdicional'});
    obj.dataLink12:setName("dataLink12");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout14);
    obj.rectangle16:setAlign("left");
    obj.rectangle16:setWidth(160);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle16:setMargins({right=5});
    obj.rectangle16:setName("rectangle16");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.rectangle16);
    obj.label30:setAlign("top");
    obj.label30:setHeight(25);
    obj.label30:setText("Salvaguarda Contra a Morte");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setFontSize(11);
    obj.label30:setName("label30");
    obj.label30:setFontColor("white");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle16);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout27);
    obj.label31:setAlign("left");
    obj.label31:setText("Sucessos");
    obj.label31:setWidth(70);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");
    obj.label31:setFontColor("white");

    obj.checkBox13 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout27);
    obj.checkBox13:setAlign("left");
    obj.checkBox13:setWidth(20);
    obj.checkBox13:setField("svMorte_sucesso1");
    obj.checkBox13:setHorzTextAlign("center");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout27);
    obj.checkBox14:setAlign("left");
    obj.checkBox14:setWidth(20);
    obj.checkBox14:setField("svMorte_sucesso2");
    obj.checkBox14:setHorzTextAlign("center");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout27);
    obj.checkBox15:setAlign("left");
    obj.checkBox15:setWidth(20);
    obj.checkBox15:setField("svMorte_sucesso3");
    obj.checkBox15:setHorzTextAlign("center");
    obj.checkBox15:setName("checkBox15");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle16);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout28);
    obj.label32:setAlign("left");
    obj.label32:setText("Falhas");
    obj.label32:setWidth(70);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");
    obj.label32:setFontColor("white");

    obj.checkBox16 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout28);
    obj.checkBox16:setAlign("left");
    obj.checkBox16:setWidth(20);
    obj.checkBox16:setField("svMorte_falha1");
    obj.checkBox16:setHorzTextAlign("center");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout28);
    obj.checkBox17:setAlign("left");
    obj.checkBox17:setWidth(20);
    obj.checkBox17:setField("svMorte_falha2");
    obj.checkBox17:setHorzTextAlign("center");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout28);
    obj.checkBox18:setAlign("left");
    obj.checkBox18:setWidth(20);
    obj.checkBox18:setField("svMorte_falha3");
    obj.checkBox18:setHorzTextAlign("center");
    obj.checkBox18:setName("checkBox18");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.rectangle16);
    obj.label33:setAlign("top");
    obj.label33:setHeight(25);
    obj.label33:setText("");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");
    obj.label33:setFontColor("white");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.rectangle16);
    obj.label34:setAlign("top");
    obj.label34:setHeight(25);
    obj.label34:setText("Níveis de Exaustão");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setFontSize(11);
    obj.label34:setName("label34");
    obj.label34:setFontColor("white");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle16);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout29);
    obj.label35:setAlign("left");
    obj.label35:setText("");
    obj.label35:setWidth(15);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");
    obj.label35:setFontColor("white");

    obj.checkBox19 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout29);
    obj.checkBox19:setAlign("left");
    obj.checkBox19:setWidth(20);
    obj.checkBox19:setField("exaustao1");
    obj.checkBox19:setHorzTextAlign("center");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout29);
    obj.checkBox20:setAlign("left");
    obj.checkBox20:setWidth(20);
    obj.checkBox20:setField("exaustao2");
    obj.checkBox20:setHorzTextAlign("center");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout29);
    obj.checkBox21:setAlign("left");
    obj.checkBox21:setWidth(20);
    obj.checkBox21:setField("exaustao3");
    obj.checkBox21:setHorzTextAlign("center");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout29);
    obj.checkBox22:setAlign("left");
    obj.checkBox22:setWidth(20);
    obj.checkBox22:setField("exaustao4");
    obj.checkBox22:setHorzTextAlign("center");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout29);
    obj.checkBox23:setAlign("left");
    obj.checkBox23:setWidth(20);
    obj.checkBox23:setField("exaustao5");
    obj.checkBox23:setHorzTextAlign("center");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout29);
    obj.checkBox24:setAlign("left");
    obj.checkBox24:setWidth(20);
    obj.checkBox24:setField("exaustao6");
    obj.checkBox24:setHorzTextAlign("center");
    obj.checkBox24:setName("checkBox24");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout14);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setWidth(160);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle17:setMargins({right=5});
    obj.rectangle17:setName("rectangle17");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle17);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout30);
    obj.label36:setAlign("left");
    obj.label36:setText("Proficiência");
    obj.label36:setWidth(100);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setFontSize(13);
    obj.label36:setName("label36");
    obj.label36:setFontColor("white");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout30);
    obj.edit22:setAlign("client");
    obj.edit22:setField("proficiencia");
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setName("edit22");
    obj.edit22:setFontSize(15);
    obj.edit22:setFontColor("white");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle17);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout31);
    obj.label37:setAlign("left");
    obj.label37:setText("Inspiração");
    obj.label37:setWidth(100);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setFontSize(13);
    obj.label37:setName("label37");
    obj.label37:setFontColor("white");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout31);
    obj.edit23:setAlign("client");
    obj.edit23:setField("inspiracao");
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setName("edit23");
    obj.edit23:setFontSize(15);
    obj.edit23:setFontColor("white");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle17);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout32);
    obj.label38:setAlign("left");
    obj.label38:setText("Classe de Armadura");
    obj.label38:setWidth(100);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setFontSize(10);
    obj.label38:setName("label38");
    obj.label38:setFontColor("white");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout32);
    obj.edit24:setAlign("client");
    obj.edit24:setField("ca_total");
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setName("edit24");
    obj.edit24:setFontSize(15);
    obj.edit24:setFontColor("white");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle17);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout33);
    obj.label39:setAlign("left");
    obj.label39:setText("Escudo");
    obj.label39:setWidth(100);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setFontSize(13);
    obj.label39:setName("label39");
    obj.label39:setFontColor("white");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout33);
    obj.edit25:setAlign("client");
    obj.edit25:setField("ca_escudo");
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setName("edit25");
    obj.edit25:setFontSize(15);
    obj.edit25:setFontColor("white");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle17);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout34);
    obj.label40:setAlign("left");
    obj.label40:setText("Redução Escudo");
    obj.label40:setWidth(100);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setFontSize(12);
    obj.label40:setName("label40");
    obj.label40:setFontColor("white");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout34);
    obj.edit26:setAlign("client");
    obj.edit26:setField("ca_reducao");
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setName("edit26");
    obj.edit26:setFontSize(15);
    obj.edit26:setFontColor("white");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.rectangle17);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout35);
    obj.label41:setAlign("left");
    obj.label41:setText("Iniciativa");
    obj.label41:setWidth(100);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setFontSize(13);
    obj.label41:setName("label41");
    obj.label41:setFontColor("white");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout35);
    obj.edit27:setAlign("client");
    obj.edit27:setField("iniciativa");
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setName("edit27");
    obj.edit27:setFontSize(15);
    obj.edit27:setFontColor("white");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle17);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout36);
    obj.label42:setAlign("left");
    obj.label42:setText("Deslocamento");
    obj.label42:setWidth(100);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setFontSize(13);
    obj.label42:setName("label42");
    obj.label42:setFontColor("white");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout36);
    obj.edit28:setAlign("client");
    obj.edit28:setField("deslocamento");
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setName("edit28");
    obj.edit28:setFontSize(15);
    obj.edit28:setFontColor("white");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.rectangle17);
    obj.dataLink13:setField("proficiencia");
    obj.dataLink13:setName("dataLink13");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout14);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setWidth(160);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle18:setMargins({right=5});
    obj.rectangle18:setName("rectangle18");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle18);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout37);
    obj.label43:setAlign("left");
    obj.label43:setText("Percepção Passiva");
    obj.label43:setWidth(100);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setFontSize(11);
    obj.label43:setName("label43");
    obj.label43:setFontColor("white");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout37);
    obj.edit29:setAlign("client");
    obj.edit29:setField("percepcao");
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setName("edit29");
    obj.edit29:setFontSize(15);
    obj.edit29:setFontColor("white");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle18);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout38);
    obj.label44:setAlign("left");
    obj.label44:setText("Intuição Passiva");
    obj.label44:setWidth(100);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setFontSize(13);
    obj.label44:setName("label44");
    obj.label44:setFontColor("white");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout38);
    obj.edit30:setAlign("client");
    obj.edit30:setField("intuicao");
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setName("edit30");
    obj.edit30:setFontSize(15);
    obj.edit30:setFontColor("white");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle18);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout39);
    obj.label45:setAlign("left");
    obj.label45:setText("Mana");
    obj.label45:setWidth(100);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setFontSize(13);
    obj.label45:setName("label45");
    obj.label45:setFontColor("white");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout39);
    obj.edit31:setAlign("client");
    obj.edit31:setField("mana");
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setName("edit31");
    obj.edit31:setFontSize(15);
    obj.edit31:setFontColor("white");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle18);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout40);
    obj.label46:setAlign("left");
    obj.label46:setText("Energia");
    obj.label46:setWidth(100);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setFontSize(13);
    obj.label46:setName("label46");
    obj.label46:setFontColor("white");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout40);
    obj.edit32:setAlign("client");
    obj.edit32:setField("energia");
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setName("edit32");
    obj.edit32:setFontSize(15);
    obj.edit32:setFontColor("white");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle18);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout41);
    obj.label47:setAlign("left");
    obj.label47:setText("Ki");
    obj.label47:setWidth(100);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setFontSize(13);
    obj.label47:setName("label47");
    obj.label47:setFontColor("white");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout41);
    obj.edit33:setAlign("client");
    obj.edit33:setField("ki");
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setName("edit33");
    obj.edit33:setFontSize(15);
    obj.edit33:setFontColor("white");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle18);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout42);
    obj.label48:setAlign("left");
    obj.label48:setText("Pontos de Vida");
    obj.label48:setWidth(100);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setFontSize(13);
    obj.label48:setName("label48");
    obj.label48:setFontColor("white");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout42);
    obj.edit34:setAlign("client");
    obj.edit34:setField("pvs");
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setName("edit34");
    obj.edit34:setFontSize(15);
    obj.edit34:setFontColor("white");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle18);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout43);
    obj.label49:setAlign("left");
    obj.label49:setText("Dados de Vida");
    obj.label49:setWidth(100);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setFontSize(13);
    obj.label49:setName("label49");
    obj.label49:setFontColor("white");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout43);
    obj.edit35:setAlign("client");
    obj.edit35:setField("dvs");
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setName("edit35");
    obj.edit35:setFontSize(15);
    obj.edit35:setFontColor("white");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout14);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setWidth(140);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle19:setMargins({right=5});
    obj.rectangle19:setName("rectangle19");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.rectangle19);
    obj.label50:setAlign("top");
    obj.label50:setHeight(25);
    obj.label50:setText("Proficiências");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setFontSize(11);
    obj.label50:setName("label50");
    obj.label50:setFontColor("white");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle19);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("proficiencias_list");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout14);
    obj.rectangle20:setAlign("left");
    obj.rectangle20:setWidth(140);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle20:setMargins({right=5});
    obj.rectangle20:setName("rectangle20");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.rectangle20);
    obj.label51:setAlign("top");
    obj.label51:setHeight(25);
    obj.label51:setText("Heranças e Aprimoramento");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setFontSize(10);
    obj.label51:setName("label51");
    obj.label51:setFontColor("white");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle20);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("herancas_list");
    obj.textEditor2:setName("textEditor2");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout14);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setWidth(140);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle21:setMargins({right=5});
    obj.rectangle21:setName("rectangle21");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.rectangle21);
    obj.label52:setAlign("top");
    obj.label52:setHeight(25);
    obj.label52:setText("Idiomas e Oficios");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setFontSize(10);
    obj.label52:setName("label52");
    obj.label52:setFontColor("white");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle21);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("idiomas_list");
    obj.textEditor3:setName("textEditor3");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox1);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(360);
    obj.layout44:setMargins({bottom=5});
    obj.layout44:setName("layout44");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout44);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setWidth(300);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle22:setMargins({right=5});
    obj.rectangle22:setName("rectangle22");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle22);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout45);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout45);
    obj.label53:setAlign("client");
    obj.label53:setText("Perícias");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");
    obj.label53:setFontColor("white");

    obj.rclPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPericias:setParent(obj.rectangle22);
    obj.rclPericias:setAlign("client");
    obj.rclPericias:setName("rclPericias");
    obj.rclPericias:setField("listaDePericias");
    obj.rclPericias:setTemplateForm("frmPericiaForm");
    obj.rclPericias:setLayout("vertical");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout44);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setWidth(360);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle23:setMargins({right=5});
    obj.rectangle23:setName("rectangle23");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.rectangle23);
    obj.label54:setAlign("client");
    obj.label54:setText("Avatar");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setVertTextAlign("center");
    obj.label54:setName("label54");
    obj.label54:setFontColor("white");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.label54);
    obj.image1:setAlign("client");
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout44);
    obj.rectangle24:setAlign("left");
    obj.rectangle24:setWidth(300);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setPadding({left=5,right=5,top=5,bottom=5});
    obj.rectangle24:setMargins({right=5});
    obj.rectangle24:setName("rectangle24");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.rectangle24);
    obj.label55:setAlign("top");
    obj.label55:setHeight(25);
    obj.label55:setText("Caracteristicas de Personagem");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setFontSize(11);
    obj.label55:setName("label55");
    obj.label55:setFontColor("white");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.rectangle24);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("caracteristicas");
    obj.textEditor4:setName("textEditor4");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Ataques");
    obj.tab2:setName("tab2");

    obj.frmAtaques = GUI.fromHandle(_obj_newObject("form"));
    obj.frmAtaques:setParent(obj.tab2);
    obj.frmAtaques:setName("frmAtaques");
    obj.frmAtaques:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmAtaques);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox2);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout46);
    obj.button2:setAlign("left");
    obj.button2:setWidth(25);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout46);
    obj.label56:setAlign("client");
    obj.label56:setText("Ataques");
    obj.label56:setMargins({left=5});
    obj.label56:setName("label56");
    obj.label56:setFontColor("white");

    obj.rclAtaques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaques:setParent(obj.scrollBox2);
    obj.rclAtaques:setAlign("client");
    obj.rclAtaques:setName("rclAtaques");
    obj.rclAtaques:setField("listaDeAtaques");
    obj.rclAtaques:setTemplateForm("frmAtaqueForm");
    obj.rclAtaques:setLayout("verticalTiles");

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Runas");
    obj.tab3:setName("tab3");

    obj.frmRunas = GUI.fromHandle(_obj_newObject("form"));
    obj.frmRunas:setParent(obj.tab3);
    obj.frmRunas:setName("frmRunas");
    obj.frmRunas:setAlign("client");

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmRunas);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.scrollBox3);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(25);
    obj.layout47:setMargins({bottom=5});
    obj.layout47:setName("layout47");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout47);
    obj.layout48:setAlign("left");
    obj.layout48:setWidth(190);
    obj.layout48:setMargins({right=10});
    obj.layout48:setName("layout48");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout48);
    obj.label57:setAlign("left");
    obj.label57:setWidth(90);
    obj.label57:setText("Pulso Rúnico");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");
    obj.label57:setFontColor("white");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout48);
    obj.edit36:setAlign("client");
    obj.edit36:setField("runas_pulso");
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setName("edit36");
    obj.edit36:setFontSize(15);
    obj.edit36:setFontColor("white");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout47);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(80);
    obj.layout49:setMargins({right=10});
    obj.layout49:setName("layout49");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout49);
    obj.label58:setAlign("left");
    obj.label58:setWidth(50);
    obj.label58:setText("CD");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");
    obj.label58:setFontColor("white");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout49);
    obj.edit37:setAlign("client");
    obj.edit37:setField("runas_cd");
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setName("edit37");
    obj.edit37:setFontSize(15);
    obj.edit37:setFontColor("white");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout47);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(80);
    obj.layout50:setMargins({right=10});
    obj.layout50:setName("layout50");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout50);
    obj.label59:setAlign("left");
    obj.label59:setWidth(50);
    obj.label59:setText("Acerto");
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");
    obj.label59:setFontColor("white");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout50);
    obj.edit38:setAlign("client");
    obj.edit38:setField("runas_acerto");
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setName("edit38");
    obj.edit38:setFontSize(15);
    obj.edit38:setFontColor("white");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox3);
    obj.layout51:setAlign("client");
    obj.layout51:setName("layout51");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout51);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(300);
    obj.layout52:setMargins({right=10});
    obj.layout52:setName("layout52");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout52);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setXradius(5);
    obj.rectangle25:setYradius(15);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setName("rectangle25");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.rectangle25);
    obj.label60:setAlign("top");
    obj.label60:setHeight(20);
    obj.label60:setText("Fagulha Rúnica");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");
    obj.label60:setFontColor("white");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.rectangle25);
    obj.textEditor5:setAlign("client");
    obj.textEditor5:setField("runas_fagulha");
    obj.textEditor5:setMargins({left=10,right=10,bottom=10});
    obj.textEditor5:setName("textEditor5");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout51);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(300);
    obj.layout53:setMargins({right=10});
    obj.layout53:setName("layout53");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout53);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setXradius(5);
    obj.rectangle26:setYradius(15);
    obj.rectangle26:setCornerType("round");
    obj.rectangle26:setName("rectangle26");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.rectangle26);
    obj.label61:setAlign("top");
    obj.label61:setHeight(20);
    obj.label61:setText("Vórtice Rúnico");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");
    obj.label61:setFontColor("white");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.rectangle26);
    obj.textEditor6:setAlign("client");
    obj.textEditor6:setField("runas_vortice");
    obj.textEditor6:setMargins({left=10,right=10,bottom=10});
    obj.textEditor6:setName("textEditor6");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout51);
    obj.layout54:setAlign("left");
    obj.layout54:setWidth(300);
    obj.layout54:setMargins({right=10});
    obj.layout54:setName("layout54");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout54);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("black");
    obj.rectangle27:setXradius(5);
    obj.rectangle27:setYradius(15);
    obj.rectangle27:setCornerType("round");
    obj.rectangle27:setName("rectangle27");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.rectangle27);
    obj.label62:setAlign("top");
    obj.label62:setHeight(20);
    obj.label62:setText("Fluxo Rúnico");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");
    obj.label62:setFontColor("white");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.rectangle27);
    obj.textEditor7:setAlign("client");
    obj.textEditor7:setField("runas_fluxo");
    obj.textEditor7:setMargins({left=10,right=10,bottom=10});
    obj.textEditor7:setName("textEditor7");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout51);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(300);
    obj.layout55:setMargins({right=10});
    obj.layout55:setName("layout55");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout55);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(15);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.rectangle28);
    obj.label63:setAlign("top");
    obj.label63:setHeight(20);
    obj.label63:setText("Explosão Rúnica");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");
    obj.label63:setFontColor("white");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.rectangle28);
    obj.textEditor8:setAlign("client");
    obj.textEditor8:setField("runas_explosao");
    obj.textEditor8:setMargins({left=10,right=10,bottom=10});
    obj.textEditor8:setName("textEditor8");

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Inventario");
    obj.tab4:setName("tab4");

    obj.frmInventario = GUI.fromHandle(_obj_newObject("form"));
    obj.frmInventario:setParent(obj.tab4);
    obj.frmInventario:setName("frmInventario");
    obj.frmInventario:setAlign("client");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmInventario);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox4);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(25);
    obj.layout56:setMargins({bottom=5});
    obj.layout56:setName("layout56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(80);
    obj.layout57:setMargins({right=10});
    obj.layout57:setName("layout57");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout57);
    obj.label64:setAlign("left");
    obj.label64:setWidth(50);
    obj.label64:setText("PC");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");
    obj.label64:setFontColor("white");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout57);
    obj.edit39:setAlign("client");
    obj.edit39:setField("inv_pc");
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setName("edit39");
    obj.edit39:setFontSize(15);
    obj.edit39:setFontColor("white");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout56);
    obj.layout58:setAlign("left");
    obj.layout58:setWidth(80);
    obj.layout58:setMargins({right=10});
    obj.layout58:setName("layout58");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout58);
    obj.label65:setAlign("left");
    obj.label65:setWidth(50);
    obj.label65:setText("PP");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");
    obj.label65:setFontColor("white");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout58);
    obj.edit40:setAlign("client");
    obj.edit40:setField("inv_pp");
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setName("edit40");
    obj.edit40:setFontSize(15);
    obj.edit40:setFontColor("white");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout56);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(80);
    obj.layout59:setMargins({right=10});
    obj.layout59:setName("layout59");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout59);
    obj.label66:setAlign("left");
    obj.label66:setWidth(50);
    obj.label66:setText("PE");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");
    obj.label66:setFontColor("white");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout59);
    obj.edit41:setAlign("client");
    obj.edit41:setField("inv_pe");
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setName("edit41");
    obj.edit41:setFontSize(15);
    obj.edit41:setFontColor("white");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout56);
    obj.layout60:setAlign("left");
    obj.layout60:setWidth(80);
    obj.layout60:setMargins({right=10});
    obj.layout60:setName("layout60");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout60);
    obj.label67:setAlign("left");
    obj.label67:setWidth(50);
    obj.label67:setText("PO");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");
    obj.label67:setFontColor("white");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout60);
    obj.edit42:setAlign("client");
    obj.edit42:setField("inv_po");
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setName("edit42");
    obj.edit42:setFontSize(15);
    obj.edit42:setFontColor("white");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout56);
    obj.layout61:setAlign("left");
    obj.layout61:setWidth(80);
    obj.layout61:setMargins({right=10});
    obj.layout61:setName("layout61");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout61);
    obj.label68:setAlign("left");
    obj.label68:setWidth(50);
    obj.label68:setText("PL");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");
    obj.label68:setFontColor("white");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout61);
    obj.edit43:setAlign("client");
    obj.edit43:setField("inv_pl");
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setName("edit43");
    obj.edit43:setFontSize(15);
    obj.edit43:setFontColor("white");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox4);
    obj.layout62:setAlign("client");
    obj.layout62:setName("layout62");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout62);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(300);
    obj.layout63:setMargins({right=10});
    obj.layout63:setName("layout63");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout63);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(15);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.rectangle29);
    obj.label69:setAlign("top");
    obj.label69:setHeight(20);
    obj.label69:setText("Pertences");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");
    obj.label69:setFontColor("white");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.rectangle29);
    obj.textEditor9:setAlign("client");
    obj.textEditor9:setField("inv_pertences");
    obj.textEditor9:setMargins({left=10,right=10,bottom=10});
    obj.textEditor9:setName("textEditor9");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout62);
    obj.layout64:setAlign("left");
    obj.layout64:setWidth(300);
    obj.layout64:setMargins({right=10});
    obj.layout64:setName("layout64");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout64);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setXradius(5);
    obj.rectangle30:setYradius(15);
    obj.rectangle30:setCornerType("round");
    obj.rectangle30:setName("rectangle30");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.rectangle30);
    obj.label70:setAlign("top");
    obj.label70:setHeight(20);
    obj.label70:setText("Equipamentos");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");
    obj.label70:setFontColor("white");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.rectangle30);
    obj.textEditor10:setAlign("client");
    obj.textEditor10:setField("inv_equipamentos");
    obj.textEditor10:setMargins({left=10,right=10,bottom=10});
    obj.textEditor10:setName("textEditor10");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout62);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(300);
    obj.layout65:setMargins({right=10});
    obj.layout65:setName("layout65");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout65);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setXradius(5);
    obj.rectangle31:setYradius(15);
    obj.rectangle31:setCornerType("round");
    obj.rectangle31:setName("rectangle31");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.rectangle31);
    obj.label71:setAlign("top");
    obj.label71:setHeight(20);
    obj.label71:setText("Mochila");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");
    obj.label71:setFontColor("white");

    obj.textEditor11 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.rectangle31);
    obj.textEditor11:setAlign("client");
    obj.textEditor11:setField("inv_mochila");
    obj.textEditor11:setMargins({left=10,right=10,bottom=10});
    obj.textEditor11:setName("textEditor11");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout62);
    obj.layout66:setAlign("left");
    obj.layout66:setWidth(300);
    obj.layout66:setMargins({right=10});
    obj.layout66:setName("layout66");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout66);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setXradius(5);
    obj.rectangle32:setYradius(15);
    obj.rectangle32:setCornerType("round");
    obj.rectangle32:setName("rectangle32");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.rectangle32);
    obj.label72:setAlign("top");
    obj.label72:setHeight(20);
    obj.label72:setText("Outros");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");
    obj.label72:setFontColor("white");

    obj.textEditor12 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.rectangle32);
    obj.textEditor12:setAlign("client");
    obj.textEditor12:setField("inv_outros");
    obj.textEditor12:setMargins({left=10,right=10,bottom=10});
    obj.textEditor12:setName("textEditor12");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Magias");
    obj.tab5:setName("tab5");

    obj.frmMagias = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMagias:setParent(obj.tab5);
    obj.frmMagias:setName("frmMagias");
    obj.frmMagias:setAlign("client");

    obj.popMagia = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMagia:setParent(obj.frmMagias);
    obj.popMagia:setName("popMagia");
    obj.popMagia:setWidth(250);
    obj.popMagia:setHeight(250);
    obj.popMagia:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popMagia, "autoScopeNode",  "false");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.popMagia);
    obj.edit44:setAlign("top");
    obj.edit44:setField("nome");
    obj.edit44:setTextPrompt("NOME DA MAGIA");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");
    obj.edit44:setFontSize(15);
    obj.edit44:setFontColor("white");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.popMagia);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(2);
    obj.flowLayout1:setMargins({bottom=4});
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setName("flowLayout1");
    obj.flowLayout1:setVertAlign("leading");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(30);
    obj.flowPart1:setMaxWidth(400);
    obj.flowPart1:setHeight(35);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart1:setVertAlign("leading");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.flowPart1);
    obj.label73:setAlign("top");
    obj.label73:setFontSize(10);
    obj.label73:setText("TEMPO FORMULAÇÃO");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setWordWrap(true);
    obj.label73:setTextTrimming("none");
    obj.label73:setAutoSize(true);
    obj.label73:setName("label73");
    obj.label73:setFontColor("#D0D0D0");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.flowPart1);
    obj.edit45:setAlign("client");
    obj.edit45:setField("tempoDeFormulacao");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setFontSize(12);
    obj.edit45:setName("edit45");
    obj.edit45:setFontColor("white");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout1);
    obj.flowPart2:setMinWidth(30);
    obj.flowPart2:setMaxWidth(400);
    obj.flowPart2:setHeight(35);
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart2:setVertAlign("leading");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.flowPart2);
    obj.label74:setAlign("top");
    obj.label74:setFontSize(10);
    obj.label74:setText("ALCANCE");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setWordWrap(true);
    obj.label74:setTextTrimming("none");
    obj.label74:setAutoSize(true);
    obj.label74:setName("label74");
    obj.label74:setFontColor("#D0D0D0");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.flowPart2);
    obj.edit46:setAlign("client");
    obj.edit46:setField("alcance");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setFontSize(12);
    obj.edit46:setName("edit46");
    obj.edit46:setFontColor("white");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout1);
    obj.flowPart3:setMinWidth(30);
    obj.flowPart3:setMaxWidth(400);
    obj.flowPart3:setHeight(35);
    obj.flowPart3:setName("flowPart3");
    obj.flowPart3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart3:setVertAlign("leading");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.flowPart3);
    obj.label75:setAlign("top");
    obj.label75:setFontSize(10);
    obj.label75:setText("COMPONENTES");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setWordWrap(true);
    obj.label75:setTextTrimming("none");
    obj.label75:setAutoSize(true);
    obj.label75:setName("label75");
    obj.label75:setFontColor("#D0D0D0");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.flowPart3);
    obj.edit47:setAlign("client");
    obj.edit47:setField("componentes");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setFontSize(12);
    obj.edit47:setName("edit47");
    obj.edit47:setFontColor("white");

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout1);
    obj.flowPart4:setMinWidth(30);
    obj.flowPart4:setMaxWidth(400);
    obj.flowPart4:setHeight(35);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart4:setVertAlign("leading");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.flowPart4);
    obj.label76:setAlign("top");
    obj.label76:setFontSize(10);
    obj.label76:setText("DURAÇÃO");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setWordWrap(true);
    obj.label76:setTextTrimming("none");
    obj.label76:setAutoSize(true);
    obj.label76:setName("label76");
    obj.label76:setFontColor("#D0D0D0");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.flowPart4);
    obj.edit48:setAlign("client");
    obj.edit48:setField("duracao");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setFontSize(12);
    obj.edit48:setName("edit48");
    obj.edit48:setFontColor("white");

    obj.textEditor13 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.popMagia);
    obj.textEditor13:setAlign("client");
    obj.textEditor13:setField("descricao");
    obj.textEditor13:setName("textEditor13");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmMagias);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.fraMagiasLayout = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.fraMagiasLayout:setParent(obj.scrollBox5);
    obj.fraMagiasLayout:setAlign("top");
    obj.fraMagiasLayout:setHeight(500);
    obj.fraMagiasLayout:setMargins({left=10, right=10, top=10});
    obj.fraMagiasLayout:setAutoHeight(true);
    obj.fraMagiasLayout:setHorzAlign("center");
    obj.fraMagiasLayout:setLineSpacing(3);
    obj.fraMagiasLayout:setName("fraMagiasLayout");
    obj.fraMagiasLayout:setStepSizes({310, 420, 640, 760, 1150});
    obj.fraMagiasLayout:setMinScaledWidth(300);
    obj.fraMagiasLayout:setVertAlign("leading");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.fraMagiasLayout);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMinScaledWidth(290);
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout2:setVertAlign("leading");

    obj.upperGridMagicBox1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicBox1:setParent(obj.flowLayout2);
    obj.upperGridMagicBox1:setHeight(50);
    obj.upperGridMagicBox1:setMinScaledWidth(145);
    obj.upperGridMagicBox1:setMinWidth(145);
    obj.upperGridMagicBox1:setMaxWidth(160);
    obj.upperGridMagicBox1:setMaxScaledWidth(160);
    obj.upperGridMagicBox1:setAvoidScale(true);
    obj.upperGridMagicBox1:setName("upperGridMagicBox1");
    obj.upperGridMagicBox1:setVertAlign("leading");
    obj.upperGridMagicBox1:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicBox1, "_RecalcSize", 
						function ()
							self.upperGridMagicBox1:setHeight(self.panupperGridMagicBox1:getHeight() + self.labupperGridMagicBox1:getHeight());
						end);														
				


    obj.panupperGridMagicBox1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicBox1:setParent(obj.upperGridMagicBox1);
    obj.panupperGridMagicBox1:setName("panupperGridMagicBox1");
    obj.panupperGridMagicBox1:setAlign("top");
    obj.panupperGridMagicBox1:setFrameStyle("/Runarcana/frames/panel6/panel6.xml");
    obj.panupperGridMagicBox1:setHeight(60);

    obj.cmbupperGridMagicBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cmbupperGridMagicBox1:setParent(obj.panupperGridMagicBox1);
    obj.cmbupperGridMagicBox1:setName("cmbupperGridMagicBox1");
    obj.cmbupperGridMagicBox1:setFrameRegion("ContentRegion");
    obj.cmbupperGridMagicBox1:setField("magias.atributoDeConjuracao");
    obj.cmbupperGridMagicBox1:setItems({'FORÇA', 'DESTREZA', 'CONSTITUIÇÃO', 'INTELIGÊNCIA', 'SABEDORIA', 'CARISMA', ''});
    obj.cmbupperGridMagicBox1:setValues({'1', '2', '3', '4', '5', '6', '7'});
    obj.cmbupperGridMagicBox1:setHorzTextAlign("center");
    obj.cmbupperGridMagicBox1:setVertTextAlign("center");
    obj.cmbupperGridMagicBox1:setFontSize(13);
    obj.cmbupperGridMagicBox1:setTransparent(true);

    obj.labupperGridMagicBox1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicBox1:setParent(obj.upperGridMagicBox1);
    obj.labupperGridMagicBox1:setName("labupperGridMagicBox1");
    obj.labupperGridMagicBox1:setAlign("top");
    obj.labupperGridMagicBox1:setAutoSize(true);
    obj.labupperGridMagicBox1:setText("ATRIBUTO DE CONJURAÇÃO");
    obj.labupperGridMagicBox1:setHorzTextAlign("center");
    obj.labupperGridMagicBox1:setVertTextAlign("leading");
    obj.labupperGridMagicBox1:setWordWrap(true);
    obj.labupperGridMagicBox1:setTextTrimming("none");
    obj.labupperGridMagicBox1:setFontSize(12);
    obj.labupperGridMagicBox1:setFontColor("#D0D0D0");

self.upperGridMagicBox1._RecalcSize();	


    obj.upperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox1:setParent(obj.flowLayout2);
    obj.upperGridMagicEditBox1:setHeight(50);
    obj.upperGridMagicEditBox1:setMinScaledWidth(100);
    obj.upperGridMagicEditBox1:setMinWidth(100);
    obj.upperGridMagicEditBox1:setMaxWidth(160);
    obj.upperGridMagicEditBox1:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox1:setAvoidScale(true);
    obj.upperGridMagicEditBox1:setName("upperGridMagicEditBox1");
    obj.upperGridMagicEditBox1:setVertAlign("leading");
    obj.upperGridMagicEditBox1:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox1, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox1:setHeight(self.panupperGridMagicEditBox1:getHeight() + self.labupperGridMagicEditBox1:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox1:setParent(obj.upperGridMagicEditBox1);
    obj.panupperGridMagicEditBox1:setName("panupperGridMagicEditBox1");
    obj.panupperGridMagicEditBox1:setAlign("top");
    obj.panupperGridMagicEditBox1:setFrameStyle("/Runarcana/frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox1:setHeight(60);

    obj.edtupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox1:setParent(obj.panupperGridMagicEditBox1);
    obj.edtupperGridMagicEditBox1:setName("edtupperGridMagicEditBox1");
    obj.edtupperGridMagicEditBox1:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox1:setField("magias.cdDaMagia");
    obj.edtupperGridMagicEditBox1:setFontSize(22);
    obj.edtupperGridMagicEditBox1:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox1:setFontColor("white");
    obj.edtupperGridMagicEditBox1:setTransparent(true);

    obj.labupperGridMagicEditBox1 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox1:setParent(obj.upperGridMagicEditBox1);
    obj.labupperGridMagicEditBox1:setName("labupperGridMagicEditBox1");
    obj.labupperGridMagicEditBox1:setAlign("top");
    obj.labupperGridMagicEditBox1:setAutoSize(true);
    obj.labupperGridMagicEditBox1:setText("CD DE CONJURAÇÃO");
    obj.labupperGridMagicEditBox1:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox1:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox1:setWordWrap(true);
    obj.labupperGridMagicEditBox1:setTextTrimming("none");
    obj.labupperGridMagicEditBox1:setFontSize(12);
    obj.labupperGridMagicEditBox1:setFontColor("#D0D0D0");

self.upperGridMagicEditBox1._RecalcSize();	


    obj.upperGridMagicEditBox2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox2:setParent(obj.flowLayout2);
    obj.upperGridMagicEditBox2:setHeight(50);
    obj.upperGridMagicEditBox2:setMinScaledWidth(100);
    obj.upperGridMagicEditBox2:setMinWidth(100);
    obj.upperGridMagicEditBox2:setMaxWidth(160);
    obj.upperGridMagicEditBox2:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox2:setAvoidScale(true);
    obj.upperGridMagicEditBox2:setName("upperGridMagicEditBox2");
    obj.upperGridMagicEditBox2:setVertAlign("leading");
    obj.upperGridMagicEditBox2:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox2, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox2:setHeight(self.panupperGridMagicEditBox2:getHeight() + self.labupperGridMagicEditBox2:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox2 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox2:setParent(obj.upperGridMagicEditBox2);
    obj.panupperGridMagicEditBox2:setName("panupperGridMagicEditBox2");
    obj.panupperGridMagicEditBox2:setAlign("top");
    obj.panupperGridMagicEditBox2:setFrameStyle("/Runarcana/frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox2:setHeight(60);

    obj.edtupperGridMagicEditBox2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox2:setParent(obj.panupperGridMagicEditBox2);
    obj.edtupperGridMagicEditBox2:setName("edtupperGridMagicEditBox2");
    obj.edtupperGridMagicEditBox2:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox2:setField("magias.bonusAtaqueSTR");
    obj.edtupperGridMagicEditBox2:setFontSize(22);
    obj.edtupperGridMagicEditBox2:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox2:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox2:setFontColor("white");
    obj.edtupperGridMagicEditBox2:setTransparent(true);

    obj.labupperGridMagicEditBox2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox2:setParent(obj.upperGridMagicEditBox2);
    obj.labupperGridMagicEditBox2:setName("labupperGridMagicEditBox2");
    obj.labupperGridMagicEditBox2:setAlign("top");
    obj.labupperGridMagicEditBox2:setAutoSize(true);
    obj.labupperGridMagicEditBox2:setText("ACERTO DE CONJURAÇÃO");
    obj.labupperGridMagicEditBox2:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox2:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox2:setWordWrap(true);
    obj.labupperGridMagicEditBox2:setTextTrimming("none");
    obj.labupperGridMagicEditBox2:setFontSize(12);
    obj.labupperGridMagicEditBox2:setFontColor("#D0D0D0");

self.upperGridMagicEditBox2._RecalcSize();	


    obj.upperGridMagicEditBox3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.upperGridMagicEditBox3:setParent(obj.flowLayout2);
    obj.upperGridMagicEditBox3:setHeight(50);
    obj.upperGridMagicEditBox3:setMinScaledWidth(100);
    obj.upperGridMagicEditBox3:setMinWidth(100);
    obj.upperGridMagicEditBox3:setMaxWidth(160);
    obj.upperGridMagicEditBox3:setMaxScaledWidth(160);
    obj.upperGridMagicEditBox3:setAvoidScale(true);
    obj.upperGridMagicEditBox3:setName("upperGridMagicEditBox3");
    obj.upperGridMagicEditBox3:setVertAlign("leading");
    obj.upperGridMagicEditBox3:setMargins({left=5, right=5, top=5, bottom=5});

								
					rawset(self.upperGridMagicEditBox3, "_RecalcSize", 
						function ()
							self.upperGridMagicEditBox3:setHeight(self.panupperGridMagicEditBox3:getHeight() + self.labupperGridMagicEditBox3:getHeight());
						end);														
				


    obj.panupperGridMagicEditBox3 = GUI.fromHandle(_obj_newObject("frame"));
    obj.panupperGridMagicEditBox3:setParent(obj.upperGridMagicEditBox3);
    obj.panupperGridMagicEditBox3:setName("panupperGridMagicEditBox3");
    obj.panupperGridMagicEditBox3:setAlign("top");
    obj.panupperGridMagicEditBox3:setFrameStyle("/Runarcana/frames/panel6/panel6.xml");
    obj.panupperGridMagicEditBox3:setHeight(60);

    obj.edtupperGridMagicEditBox3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtupperGridMagicEditBox3:setParent(obj.panupperGridMagicEditBox3);
    obj.edtupperGridMagicEditBox3:setName("edtupperGridMagicEditBox3");
    obj.edtupperGridMagicEditBox3:setFrameRegion("ContentRegion");
    obj.edtupperGridMagicEditBox3:setField("mana");
    obj.edtupperGridMagicEditBox3:setFontSize(22);
    obj.edtupperGridMagicEditBox3:setVertTextAlign("center");
    obj.edtupperGridMagicEditBox3:setHorzTextAlign("center");
    obj.edtupperGridMagicEditBox3:setFontColor("white");
    obj.edtupperGridMagicEditBox3:setTransparent(true);

    obj.labupperGridMagicEditBox3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labupperGridMagicEditBox3:setParent(obj.upperGridMagicEditBox3);
    obj.labupperGridMagicEditBox3:setName("labupperGridMagicEditBox3");
    obj.labupperGridMagicEditBox3:setAlign("top");
    obj.labupperGridMagicEditBox3:setAutoSize(true);
    obj.labupperGridMagicEditBox3:setText("MANA");
    obj.labupperGridMagicEditBox3:setHorzTextAlign("center");
    obj.labupperGridMagicEditBox3:setVertTextAlign("leading");
    obj.labupperGridMagicEditBox3:setWordWrap(true);
    obj.labupperGridMagicEditBox3:setTextTrimming("none");
    obj.labupperGridMagicEditBox3:setFontSize(12);
    obj.labupperGridMagicEditBox3:setFontColor("#D0D0D0");

self.upperGridMagicEditBox3._RecalcSize();	


    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.fraMagiasLayout);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.fraMagiasLayout);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setMaxColumns(3);
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setOrientation("vertical");
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setStepSizes({310, 420, 640, 760, 860, 960, 1150, 1200, 1600});
    obj.flowLayout3:setMinScaledWidth(300);
    obj.flowLayout3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowLayout3:setVertAlign("leading");

    obj.flowLayout4 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout4:setParent(obj.flowLayout3);
    obj.flowLayout4:setHeight(100);
    obj.flowLayout4:setAvoidScale(true);
    obj.flowLayout4:setMaxControlsPerLine(1);
    obj.flowLayout4:setAutoHeight(true);
    obj.flowLayout4:setName("flowLayout4");
    obj.flowLayout4:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout4:setStepSizes({310, 360, 420, 600});
    obj.flowLayout4:setMinScaledWidth(300);
    obj.flowLayout4:setMaxScaledWidth(600);
    obj.flowLayout4:setVertAlign("leading");

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout4);
    obj.flowPart5:setFrameStyle("/Runarcana/frames/magicHeader/header0.xml");
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setAvoidScale(true);
    obj.flowPart5:setMinScaledWidth(280);
    obj.flowPart5:setMinWidth(300);
    obj.flowPart5:setMaxWidth(600);
    obj.flowPart5:setHeight(80);
    obj.flowPart5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart5:setVertAlign("leading");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.flowPart5);
    obj.label77:setFrameRegion("RegiaoSmallTitulo");
    obj.label77:setText("0");
    obj.label77:setName("label77");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setVertTextAlign("center");
    obj.label77:setFontSize(18);
    obj.label77:setFontColor("white");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.flowPart5);
    obj.label78:setFrameRegion("RegiaoConteudo");
    obj.label78:setText("TRUQUES");
    obj.label78:setFontSize(15);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setVertTextAlign("center");
    obj.label78:setName("label78");
    obj.label78:setFontColor("white");

    obj.flwMagicRecordList1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList1:setParent(obj.flowLayout4);
    obj.flwMagicRecordList1:setMinWidth(300);
    obj.flwMagicRecordList1:setMaxWidth(600);
    obj.flwMagicRecordList1:setMinScaledWidth(280);
    obj.flwMagicRecordList1:setName("flwMagicRecordList1");
    obj.flwMagicRecordList1:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList1:setVertAlign("leading");


					rawset(self.flwMagicRecordList1, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList1.height = self.rclflwMagicRecordList1.height +
														self.layBottomflwMagicRecordList1.height + 
														self.flwMagicRecordList1.padding.top + self.flwMagicRecordList1.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList1:setParent(obj.flwMagicRecordList1);
    obj.rclflwMagicRecordList1:setName("rclflwMagicRecordList1");
    obj.rclflwMagicRecordList1:setAlign("top");
    obj.rclflwMagicRecordList1:setField("magias.magias.nivel0");
    obj.rclflwMagicRecordList1:setTemplateForm("frmMagiaItemSemCheckbox");
    obj.rclflwMagicRecordList1:setAutoHeight(true);
    obj.rclflwMagicRecordList1:setMinHeight(5);
    obj.rclflwMagicRecordList1:setHitTest(false);
    obj.rclflwMagicRecordList1:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList1:setParent(obj.flwMagicRecordList1);
    obj.layBottomflwMagicRecordList1:setName("layBottomflwMagicRecordList1");
    obj.layBottomflwMagicRecordList1:setAlign("top");
    obj.layBottomflwMagicRecordList1:setHeight(36);

    obj.btnNovoflwMagicRecordList1 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList1:setParent(obj.layBottomflwMagicRecordList1);
    obj.btnNovoflwMagicRecordList1:setName("btnNovoflwMagicRecordList1");
    obj.btnNovoflwMagicRecordList1:setAlign("left");
    obj.btnNovoflwMagicRecordList1:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList1:setWidth(160);
    obj.btnNovoflwMagicRecordList1:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList1._recalcHeight();


    obj.flowLayout5 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout5:setParent(obj.flowLayout3);
    obj.flowLayout5:setHeight(100);
    obj.flowLayout5:setAvoidScale(true);
    obj.flowLayout5:setMaxControlsPerLine(1);
    obj.flowLayout5:setAutoHeight(true);
    obj.flowLayout5:setName("flowLayout5");
    obj.flowLayout5:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout5:setStepSizes({310, 360, 420, 600});
    obj.flowLayout5:setMinScaledWidth(300);
    obj.flowLayout5:setMaxScaledWidth(600);
    obj.flowLayout5:setVertAlign("leading");

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout5);
    obj.flowPart6:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setAvoidScale(true);
    obj.flowPart6:setMinScaledWidth(280);
    obj.flowPart6:setMinWidth(300);
    obj.flowPart6:setMaxWidth(600);
    obj.flowPart6:setHeight(80);
    obj.flowPart6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart6:setVertAlign("leading");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.flowPart6);
    obj.label79:setFrameRegion("RegiaoSmallTitulo");
    obj.label79:setText("1");
    obj.label79:setName("label79");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setVertTextAlign("center");
    obj.label79:setFontSize(18);
    obj.label79:setFontColor("white");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.flowPart6);
    obj.edit49:setFrameRegion("RegiaoConteudo1");
    obj.edit49:setField("magias.espacosTotais1");
    obj.edit49:setName("edit49");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setFontSize(18);
    obj.edit49:setTransparent(true);
    obj.edit49:setFontColor("white");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.flowPart6);
    obj.label80:setFrameRegion("RegiaoConteudo2");
    obj.label80:setText("Custo de Mana: 2");
    obj.label80:setName("label80");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setVertTextAlign("center");
    obj.label80:setFontSize(18);
    obj.label80:setFontColor("white");

    obj.flwMagicRecordList2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList2:setParent(obj.flowLayout5);
    obj.flwMagicRecordList2:setMinWidth(300);
    obj.flwMagicRecordList2:setMaxWidth(600);
    obj.flwMagicRecordList2:setMinScaledWidth(280);
    obj.flwMagicRecordList2:setName("flwMagicRecordList2");
    obj.flwMagicRecordList2:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList2:setVertAlign("leading");


					rawset(self.flwMagicRecordList2, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList2.height = self.rclflwMagicRecordList2.height +
														self.layBottomflwMagicRecordList2.height + 
														self.flwMagicRecordList2.padding.top + self.flwMagicRecordList2.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList2:setParent(obj.flwMagicRecordList2);
    obj.rclflwMagicRecordList2:setName("rclflwMagicRecordList2");
    obj.rclflwMagicRecordList2:setAlign("top");
    obj.rclflwMagicRecordList2:setField("magias.magias.nivel1");
    obj.rclflwMagicRecordList2:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList2:setAutoHeight(true);
    obj.rclflwMagicRecordList2:setMinHeight(5);
    obj.rclflwMagicRecordList2:setHitTest(false);
    obj.rclflwMagicRecordList2:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList2:setParent(obj.flwMagicRecordList2);
    obj.layBottomflwMagicRecordList2:setName("layBottomflwMagicRecordList2");
    obj.layBottomflwMagicRecordList2:setAlign("top");
    obj.layBottomflwMagicRecordList2:setHeight(36);

    obj.btnNovoflwMagicRecordList2 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList2:setParent(obj.layBottomflwMagicRecordList2);
    obj.btnNovoflwMagicRecordList2:setName("btnNovoflwMagicRecordList2");
    obj.btnNovoflwMagicRecordList2:setAlign("left");
    obj.btnNovoflwMagicRecordList2:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList2:setWidth(160);
    obj.btnNovoflwMagicRecordList2:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList2._recalcHeight();


    obj.flowLayout6 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout6:setParent(obj.flowLayout3);
    obj.flowLayout6:setHeight(100);
    obj.flowLayout6:setAvoidScale(true);
    obj.flowLayout6:setMaxControlsPerLine(1);
    obj.flowLayout6:setAutoHeight(true);
    obj.flowLayout6:setName("flowLayout6");
    obj.flowLayout6:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout6:setStepSizes({310, 360, 420, 600});
    obj.flowLayout6:setMinScaledWidth(300);
    obj.flowLayout6:setMaxScaledWidth(600);
    obj.flowLayout6:setVertAlign("leading");

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout6);
    obj.flowPart7:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setAvoidScale(true);
    obj.flowPart7:setMinScaledWidth(280);
    obj.flowPart7:setMinWidth(300);
    obj.flowPart7:setMaxWidth(600);
    obj.flowPart7:setHeight(80);
    obj.flowPart7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart7:setVertAlign("leading");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.flowPart7);
    obj.label81:setFrameRegion("RegiaoSmallTitulo");
    obj.label81:setText("2");
    obj.label81:setName("label81");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setVertTextAlign("center");
    obj.label81:setFontSize(18);
    obj.label81:setFontColor("white");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.flowPart7);
    obj.edit50:setFrameRegion("RegiaoConteudo1");
    obj.edit50:setField("magias.espacosTotais2");
    obj.edit50:setName("edit50");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setFontSize(18);
    obj.edit50:setTransparent(true);
    obj.edit50:setFontColor("white");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.flowPart7);
    obj.label82:setFrameRegion("RegiaoConteudo2");
    obj.label82:setText("Custo de Mana: 3");
    obj.label82:setName("label82");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setVertTextAlign("center");
    obj.label82:setFontSize(18);
    obj.label82:setFontColor("white");

    obj.flwMagicRecordList3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList3:setParent(obj.flowLayout6);
    obj.flwMagicRecordList3:setMinWidth(300);
    obj.flwMagicRecordList3:setMaxWidth(600);
    obj.flwMagicRecordList3:setMinScaledWidth(280);
    obj.flwMagicRecordList3:setName("flwMagicRecordList3");
    obj.flwMagicRecordList3:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList3:setVertAlign("leading");


					rawset(self.flwMagicRecordList3, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList3.height = self.rclflwMagicRecordList3.height +
														self.layBottomflwMagicRecordList3.height + 
														self.flwMagicRecordList3.padding.top + self.flwMagicRecordList3.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList3:setParent(obj.flwMagicRecordList3);
    obj.rclflwMagicRecordList3:setName("rclflwMagicRecordList3");
    obj.rclflwMagicRecordList3:setAlign("top");
    obj.rclflwMagicRecordList3:setField("magias.magias.nivel2");
    obj.rclflwMagicRecordList3:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList3:setAutoHeight(true);
    obj.rclflwMagicRecordList3:setMinHeight(5);
    obj.rclflwMagicRecordList3:setHitTest(false);
    obj.rclflwMagicRecordList3:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList3:setParent(obj.flwMagicRecordList3);
    obj.layBottomflwMagicRecordList3:setName("layBottomflwMagicRecordList3");
    obj.layBottomflwMagicRecordList3:setAlign("top");
    obj.layBottomflwMagicRecordList3:setHeight(36);

    obj.btnNovoflwMagicRecordList3 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList3:setParent(obj.layBottomflwMagicRecordList3);
    obj.btnNovoflwMagicRecordList3:setName("btnNovoflwMagicRecordList3");
    obj.btnNovoflwMagicRecordList3:setAlign("left");
    obj.btnNovoflwMagicRecordList3:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList3:setWidth(160);
    obj.btnNovoflwMagicRecordList3:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList3._recalcHeight();


    obj.flowLayout7 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout7:setParent(obj.flowLayout3);
    obj.flowLayout7:setHeight(100);
    obj.flowLayout7:setAvoidScale(true);
    obj.flowLayout7:setMaxControlsPerLine(1);
    obj.flowLayout7:setAutoHeight(true);
    obj.flowLayout7:setName("flowLayout7");
    obj.flowLayout7:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout7:setStepSizes({310, 360, 420, 600});
    obj.flowLayout7:setMinScaledWidth(300);
    obj.flowLayout7:setMaxScaledWidth(600);
    obj.flowLayout7:setVertAlign("leading");

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout7);
    obj.flowPart8:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setAvoidScale(true);
    obj.flowPart8:setMinScaledWidth(280);
    obj.flowPart8:setMinWidth(300);
    obj.flowPart8:setMaxWidth(600);
    obj.flowPart8:setHeight(80);
    obj.flowPart8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart8:setVertAlign("leading");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.flowPart8);
    obj.label83:setFrameRegion("RegiaoSmallTitulo");
    obj.label83:setText("3");
    obj.label83:setName("label83");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setVertTextAlign("center");
    obj.label83:setFontSize(18);
    obj.label83:setFontColor("white");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.flowPart8);
    obj.edit51:setFrameRegion("RegiaoConteudo1");
    obj.edit51:setField("magias.espacosTotais3");
    obj.edit51:setName("edit51");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setFontSize(18);
    obj.edit51:setTransparent(true);
    obj.edit51:setFontColor("white");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.flowPart8);
    obj.label84:setFrameRegion("RegiaoConteudo2");
    obj.label84:setText("Custo de Mana: 5");
    obj.label84:setName("label84");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setVertTextAlign("center");
    obj.label84:setFontSize(18);
    obj.label84:setFontColor("white");

    obj.flwMagicRecordList4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList4:setParent(obj.flowLayout7);
    obj.flwMagicRecordList4:setMinWidth(300);
    obj.flwMagicRecordList4:setMaxWidth(600);
    obj.flwMagicRecordList4:setMinScaledWidth(280);
    obj.flwMagicRecordList4:setName("flwMagicRecordList4");
    obj.flwMagicRecordList4:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList4:setVertAlign("leading");


					rawset(self.flwMagicRecordList4, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList4.height = self.rclflwMagicRecordList4.height +
														self.layBottomflwMagicRecordList4.height + 
														self.flwMagicRecordList4.padding.top + self.flwMagicRecordList4.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList4:setParent(obj.flwMagicRecordList4);
    obj.rclflwMagicRecordList4:setName("rclflwMagicRecordList4");
    obj.rclflwMagicRecordList4:setAlign("top");
    obj.rclflwMagicRecordList4:setField("magias.magias.nivel3");
    obj.rclflwMagicRecordList4:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList4:setAutoHeight(true);
    obj.rclflwMagicRecordList4:setMinHeight(5);
    obj.rclflwMagicRecordList4:setHitTest(false);
    obj.rclflwMagicRecordList4:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList4:setParent(obj.flwMagicRecordList4);
    obj.layBottomflwMagicRecordList4:setName("layBottomflwMagicRecordList4");
    obj.layBottomflwMagicRecordList4:setAlign("top");
    obj.layBottomflwMagicRecordList4:setHeight(36);

    obj.btnNovoflwMagicRecordList4 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList4:setParent(obj.layBottomflwMagicRecordList4);
    obj.btnNovoflwMagicRecordList4:setName("btnNovoflwMagicRecordList4");
    obj.btnNovoflwMagicRecordList4:setAlign("left");
    obj.btnNovoflwMagicRecordList4:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList4:setWidth(160);
    obj.btnNovoflwMagicRecordList4:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList4._recalcHeight();


    obj.flowLayout8 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout8:setParent(obj.flowLayout3);
    obj.flowLayout8:setHeight(100);
    obj.flowLayout8:setAvoidScale(true);
    obj.flowLayout8:setMaxControlsPerLine(1);
    obj.flowLayout8:setAutoHeight(true);
    obj.flowLayout8:setName("flowLayout8");
    obj.flowLayout8:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout8:setStepSizes({310, 360, 420, 600});
    obj.flowLayout8:setMinScaledWidth(300);
    obj.flowLayout8:setMaxScaledWidth(600);
    obj.flowLayout8:setVertAlign("leading");

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout8);
    obj.flowPart9:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setAvoidScale(true);
    obj.flowPart9:setMinScaledWidth(280);
    obj.flowPart9:setMinWidth(300);
    obj.flowPart9:setMaxWidth(600);
    obj.flowPart9:setHeight(80);
    obj.flowPart9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart9:setVertAlign("leading");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.flowPart9);
    obj.label85:setFrameRegion("RegiaoSmallTitulo");
    obj.label85:setText("4");
    obj.label85:setName("label85");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setVertTextAlign("center");
    obj.label85:setFontSize(18);
    obj.label85:setFontColor("white");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.flowPart9);
    obj.edit52:setFrameRegion("RegiaoConteudo1");
    obj.edit52:setField("magias.espacosTotais4");
    obj.edit52:setName("edit52");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setFontSize(18);
    obj.edit52:setTransparent(true);
    obj.edit52:setFontColor("white");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.flowPart9);
    obj.label86:setFrameRegion("RegiaoConteudo2");
    obj.label86:setText("Custo de Mana: 6");
    obj.label86:setName("label86");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setVertTextAlign("center");
    obj.label86:setFontSize(18);
    obj.label86:setFontColor("white");

    obj.flwMagicRecordList5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList5:setParent(obj.flowLayout8);
    obj.flwMagicRecordList5:setMinWidth(300);
    obj.flwMagicRecordList5:setMaxWidth(600);
    obj.flwMagicRecordList5:setMinScaledWidth(280);
    obj.flwMagicRecordList5:setName("flwMagicRecordList5");
    obj.flwMagicRecordList5:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList5:setVertAlign("leading");


					rawset(self.flwMagicRecordList5, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList5.height = self.rclflwMagicRecordList5.height +
														self.layBottomflwMagicRecordList5.height + 
														self.flwMagicRecordList5.padding.top + self.flwMagicRecordList5.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList5:setParent(obj.flwMagicRecordList5);
    obj.rclflwMagicRecordList5:setName("rclflwMagicRecordList5");
    obj.rclflwMagicRecordList5:setAlign("top");
    obj.rclflwMagicRecordList5:setField("magias.magias.nivel4");
    obj.rclflwMagicRecordList5:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList5:setAutoHeight(true);
    obj.rclflwMagicRecordList5:setMinHeight(5);
    obj.rclflwMagicRecordList5:setHitTest(false);
    obj.rclflwMagicRecordList5:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList5:setParent(obj.flwMagicRecordList5);
    obj.layBottomflwMagicRecordList5:setName("layBottomflwMagicRecordList5");
    obj.layBottomflwMagicRecordList5:setAlign("top");
    obj.layBottomflwMagicRecordList5:setHeight(36);

    obj.btnNovoflwMagicRecordList5 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList5:setParent(obj.layBottomflwMagicRecordList5);
    obj.btnNovoflwMagicRecordList5:setName("btnNovoflwMagicRecordList5");
    obj.btnNovoflwMagicRecordList5:setAlign("left");
    obj.btnNovoflwMagicRecordList5:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList5:setWidth(160);
    obj.btnNovoflwMagicRecordList5:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList5._recalcHeight();


    obj.flowLayout9 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout9:setParent(obj.flowLayout3);
    obj.flowLayout9:setHeight(100);
    obj.flowLayout9:setAvoidScale(true);
    obj.flowLayout9:setMaxControlsPerLine(1);
    obj.flowLayout9:setAutoHeight(true);
    obj.flowLayout9:setName("flowLayout9");
    obj.flowLayout9:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout9:setStepSizes({310, 360, 420, 600});
    obj.flowLayout9:setMinScaledWidth(300);
    obj.flowLayout9:setMaxScaledWidth(600);
    obj.flowLayout9:setVertAlign("leading");

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout9);
    obj.flowPart10:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart10:setName("flowPart10");
    obj.flowPart10:setAvoidScale(true);
    obj.flowPart10:setMinScaledWidth(280);
    obj.flowPart10:setMinWidth(300);
    obj.flowPart10:setMaxWidth(600);
    obj.flowPart10:setHeight(80);
    obj.flowPart10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart10:setVertAlign("leading");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.flowPart10);
    obj.label87:setFrameRegion("RegiaoSmallTitulo");
    obj.label87:setText("5");
    obj.label87:setName("label87");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setVertTextAlign("center");
    obj.label87:setFontSize(18);
    obj.label87:setFontColor("white");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.flowPart10);
    obj.edit53:setFrameRegion("RegiaoConteudo1");
    obj.edit53:setField("magias.espacosTotais5");
    obj.edit53:setName("edit53");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setFontSize(18);
    obj.edit53:setTransparent(true);
    obj.edit53:setFontColor("white");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.flowPart10);
    obj.label88:setFrameRegion("RegiaoConteudo2");
    obj.label88:setText("Custo de Mana: 7");
    obj.label88:setName("label88");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setVertTextAlign("center");
    obj.label88:setFontSize(18);
    obj.label88:setFontColor("white");

    obj.flwMagicRecordList6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList6:setParent(obj.flowLayout9);
    obj.flwMagicRecordList6:setMinWidth(300);
    obj.flwMagicRecordList6:setMaxWidth(600);
    obj.flwMagicRecordList6:setMinScaledWidth(280);
    obj.flwMagicRecordList6:setName("flwMagicRecordList6");
    obj.flwMagicRecordList6:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList6:setVertAlign("leading");


					rawset(self.flwMagicRecordList6, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList6.height = self.rclflwMagicRecordList6.height +
														self.layBottomflwMagicRecordList6.height + 
														self.flwMagicRecordList6.padding.top + self.flwMagicRecordList6.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList6:setParent(obj.flwMagicRecordList6);
    obj.rclflwMagicRecordList6:setName("rclflwMagicRecordList6");
    obj.rclflwMagicRecordList6:setAlign("top");
    obj.rclflwMagicRecordList6:setField("magias.magias.nivel5");
    obj.rclflwMagicRecordList6:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList6:setAutoHeight(true);
    obj.rclflwMagicRecordList6:setMinHeight(5);
    obj.rclflwMagicRecordList6:setHitTest(false);
    obj.rclflwMagicRecordList6:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList6:setParent(obj.flwMagicRecordList6);
    obj.layBottomflwMagicRecordList6:setName("layBottomflwMagicRecordList6");
    obj.layBottomflwMagicRecordList6:setAlign("top");
    obj.layBottomflwMagicRecordList6:setHeight(36);

    obj.btnNovoflwMagicRecordList6 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList6:setParent(obj.layBottomflwMagicRecordList6);
    obj.btnNovoflwMagicRecordList6:setName("btnNovoflwMagicRecordList6");
    obj.btnNovoflwMagicRecordList6:setAlign("left");
    obj.btnNovoflwMagicRecordList6:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList6:setWidth(160);
    obj.btnNovoflwMagicRecordList6:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList6._recalcHeight();


    obj.flowLayout10 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout10:setParent(obj.flowLayout3);
    obj.flowLayout10:setHeight(100);
    obj.flowLayout10:setAvoidScale(true);
    obj.flowLayout10:setMaxControlsPerLine(1);
    obj.flowLayout10:setAutoHeight(true);
    obj.flowLayout10:setName("flowLayout10");
    obj.flowLayout10:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout10:setStepSizes({310, 360, 420, 600});
    obj.flowLayout10:setMinScaledWidth(300);
    obj.flowLayout10:setMaxScaledWidth(600);
    obj.flowLayout10:setVertAlign("leading");

    obj.flowPart11 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart11:setParent(obj.flowLayout10);
    obj.flowPart11:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart11:setName("flowPart11");
    obj.flowPart11:setAvoidScale(true);
    obj.flowPart11:setMinScaledWidth(280);
    obj.flowPart11:setMinWidth(300);
    obj.flowPart11:setMaxWidth(600);
    obj.flowPart11:setHeight(80);
    obj.flowPart11:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart11:setVertAlign("leading");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.flowPart11);
    obj.label89:setFrameRegion("RegiaoSmallTitulo");
    obj.label89:setText("6");
    obj.label89:setName("label89");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setVertTextAlign("center");
    obj.label89:setFontSize(18);
    obj.label89:setFontColor("white");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.flowPart11);
    obj.edit54:setFrameRegion("RegiaoConteudo1");
    obj.edit54:setField("magias.espacosTotais6");
    obj.edit54:setName("edit54");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setFontSize(18);
    obj.edit54:setTransparent(true);
    obj.edit54:setFontColor("white");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.flowPart11);
    obj.label90:setFrameRegion("RegiaoConteudo2");
    obj.label90:setText("Custo de Mana: 9");
    obj.label90:setName("label90");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setVertTextAlign("center");
    obj.label90:setFontSize(18);
    obj.label90:setFontColor("white");

    obj.flwMagicRecordList7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList7:setParent(obj.flowLayout10);
    obj.flwMagicRecordList7:setMinWidth(300);
    obj.flwMagicRecordList7:setMaxWidth(600);
    obj.flwMagicRecordList7:setMinScaledWidth(280);
    obj.flwMagicRecordList7:setName("flwMagicRecordList7");
    obj.flwMagicRecordList7:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList7:setVertAlign("leading");


					rawset(self.flwMagicRecordList7, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList7.height = self.rclflwMagicRecordList7.height +
														self.layBottomflwMagicRecordList7.height + 
														self.flwMagicRecordList7.padding.top + self.flwMagicRecordList7.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList7:setParent(obj.flwMagicRecordList7);
    obj.rclflwMagicRecordList7:setName("rclflwMagicRecordList7");
    obj.rclflwMagicRecordList7:setAlign("top");
    obj.rclflwMagicRecordList7:setField("magias.magias.nivel6");
    obj.rclflwMagicRecordList7:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList7:setAutoHeight(true);
    obj.rclflwMagicRecordList7:setMinHeight(5);
    obj.rclflwMagicRecordList7:setHitTest(false);
    obj.rclflwMagicRecordList7:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList7:setParent(obj.flwMagicRecordList7);
    obj.layBottomflwMagicRecordList7:setName("layBottomflwMagicRecordList7");
    obj.layBottomflwMagicRecordList7:setAlign("top");
    obj.layBottomflwMagicRecordList7:setHeight(36);

    obj.btnNovoflwMagicRecordList7 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList7:setParent(obj.layBottomflwMagicRecordList7);
    obj.btnNovoflwMagicRecordList7:setName("btnNovoflwMagicRecordList7");
    obj.btnNovoflwMagicRecordList7:setAlign("left");
    obj.btnNovoflwMagicRecordList7:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList7:setWidth(160);
    obj.btnNovoflwMagicRecordList7:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList7._recalcHeight();


    obj.flowLayout11 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout11:setParent(obj.flowLayout3);
    obj.flowLayout11:setHeight(100);
    obj.flowLayout11:setAvoidScale(true);
    obj.flowLayout11:setMaxControlsPerLine(1);
    obj.flowLayout11:setAutoHeight(true);
    obj.flowLayout11:setName("flowLayout11");
    obj.flowLayout11:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout11:setStepSizes({310, 360, 420, 600});
    obj.flowLayout11:setMinScaledWidth(300);
    obj.flowLayout11:setMaxScaledWidth(600);
    obj.flowLayout11:setVertAlign("leading");

    obj.flowPart12 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart12:setParent(obj.flowLayout11);
    obj.flowPart12:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart12:setName("flowPart12");
    obj.flowPart12:setAvoidScale(true);
    obj.flowPart12:setMinScaledWidth(280);
    obj.flowPart12:setMinWidth(300);
    obj.flowPart12:setMaxWidth(600);
    obj.flowPart12:setHeight(80);
    obj.flowPart12:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart12:setVertAlign("leading");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.flowPart12);
    obj.label91:setFrameRegion("RegiaoSmallTitulo");
    obj.label91:setText("7");
    obj.label91:setName("label91");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setVertTextAlign("center");
    obj.label91:setFontSize(18);
    obj.label91:setFontColor("white");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.flowPart12);
    obj.edit55:setFrameRegion("RegiaoConteudo1");
    obj.edit55:setField("magias.espacosTotais7");
    obj.edit55:setName("edit55");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setFontSize(18);
    obj.edit55:setTransparent(true);
    obj.edit55:setFontColor("white");

    obj.label92 = GUI.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.flowPart12);
    obj.label92:setFrameRegion("RegiaoConteudo2");
    obj.label92:setText("Custo de Mana: 12");
    obj.label92:setName("label92");
    obj.label92:setHorzTextAlign("center");
    obj.label92:setVertTextAlign("center");
    obj.label92:setFontSize(18);
    obj.label92:setFontColor("white");

    obj.flwMagicRecordList8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList8:setParent(obj.flowLayout11);
    obj.flwMagicRecordList8:setMinWidth(300);
    obj.flwMagicRecordList8:setMaxWidth(600);
    obj.flwMagicRecordList8:setMinScaledWidth(280);
    obj.flwMagicRecordList8:setName("flwMagicRecordList8");
    obj.flwMagicRecordList8:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList8:setVertAlign("leading");


					rawset(self.flwMagicRecordList8, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList8.height = self.rclflwMagicRecordList8.height +
														self.layBottomflwMagicRecordList8.height + 
														self.flwMagicRecordList8.padding.top + self.flwMagicRecordList8.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList8:setParent(obj.flwMagicRecordList8);
    obj.rclflwMagicRecordList8:setName("rclflwMagicRecordList8");
    obj.rclflwMagicRecordList8:setAlign("top");
    obj.rclflwMagicRecordList8:setField("magias.magias.nivel7");
    obj.rclflwMagicRecordList8:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList8:setAutoHeight(true);
    obj.rclflwMagicRecordList8:setMinHeight(5);
    obj.rclflwMagicRecordList8:setHitTest(false);
    obj.rclflwMagicRecordList8:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList8:setParent(obj.flwMagicRecordList8);
    obj.layBottomflwMagicRecordList8:setName("layBottomflwMagicRecordList8");
    obj.layBottomflwMagicRecordList8:setAlign("top");
    obj.layBottomflwMagicRecordList8:setHeight(36);

    obj.btnNovoflwMagicRecordList8 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList8:setParent(obj.layBottomflwMagicRecordList8);
    obj.btnNovoflwMagicRecordList8:setName("btnNovoflwMagicRecordList8");
    obj.btnNovoflwMagicRecordList8:setAlign("left");
    obj.btnNovoflwMagicRecordList8:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList8:setWidth(160);
    obj.btnNovoflwMagicRecordList8:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList8._recalcHeight();


    obj.flowLayout12 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout12:setParent(obj.flowLayout3);
    obj.flowLayout12:setHeight(100);
    obj.flowLayout12:setAvoidScale(true);
    obj.flowLayout12:setMaxControlsPerLine(1);
    obj.flowLayout12:setAutoHeight(true);
    obj.flowLayout12:setName("flowLayout12");
    obj.flowLayout12:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout12:setStepSizes({310, 360, 420, 600});
    obj.flowLayout12:setMinScaledWidth(300);
    obj.flowLayout12:setMaxScaledWidth(600);
    obj.flowLayout12:setVertAlign("leading");

    obj.flowPart13 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart13:setParent(obj.flowLayout12);
    obj.flowPart13:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart13:setName("flowPart13");
    obj.flowPart13:setAvoidScale(true);
    obj.flowPart13:setMinScaledWidth(280);
    obj.flowPart13:setMinWidth(300);
    obj.flowPart13:setMaxWidth(600);
    obj.flowPart13:setHeight(80);
    obj.flowPart13:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart13:setVertAlign("leading");

    obj.label93 = GUI.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.flowPart13);
    obj.label93:setFrameRegion("RegiaoSmallTitulo");
    obj.label93:setText("8");
    obj.label93:setName("label93");
    obj.label93:setHorzTextAlign("center");
    obj.label93:setVertTextAlign("center");
    obj.label93:setFontSize(18);
    obj.label93:setFontColor("white");

    obj.edit56 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.flowPart13);
    obj.edit56:setFrameRegion("RegiaoConteudo1");
    obj.edit56:setField("magias.espacosTotais8");
    obj.edit56:setName("edit56");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setFontSize(18);
    obj.edit56:setTransparent(true);
    obj.edit56:setFontColor("white");

    obj.label94 = GUI.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.flowPart13);
    obj.label94:setFrameRegion("RegiaoConteudo2");
    obj.label94:setText("Custo de Mana: 16");
    obj.label94:setName("label94");
    obj.label94:setHorzTextAlign("center");
    obj.label94:setVertTextAlign("center");
    obj.label94:setFontSize(18);
    obj.label94:setFontColor("white");

    obj.flwMagicRecordList9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList9:setParent(obj.flowLayout12);
    obj.flwMagicRecordList9:setMinWidth(300);
    obj.flwMagicRecordList9:setMaxWidth(600);
    obj.flwMagicRecordList9:setMinScaledWidth(280);
    obj.flwMagicRecordList9:setName("flwMagicRecordList9");
    obj.flwMagicRecordList9:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList9:setVertAlign("leading");


					rawset(self.flwMagicRecordList9, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList9.height = self.rclflwMagicRecordList9.height +
														self.layBottomflwMagicRecordList9.height + 
														self.flwMagicRecordList9.padding.top + self.flwMagicRecordList9.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList9:setParent(obj.flwMagicRecordList9);
    obj.rclflwMagicRecordList9:setName("rclflwMagicRecordList9");
    obj.rclflwMagicRecordList9:setAlign("top");
    obj.rclflwMagicRecordList9:setField("magias.magias.nivel8");
    obj.rclflwMagicRecordList9:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList9:setAutoHeight(true);
    obj.rclflwMagicRecordList9:setMinHeight(5);
    obj.rclflwMagicRecordList9:setHitTest(false);
    obj.rclflwMagicRecordList9:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList9:setParent(obj.flwMagicRecordList9);
    obj.layBottomflwMagicRecordList9:setName("layBottomflwMagicRecordList9");
    obj.layBottomflwMagicRecordList9:setAlign("top");
    obj.layBottomflwMagicRecordList9:setHeight(36);

    obj.btnNovoflwMagicRecordList9 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList9:setParent(obj.layBottomflwMagicRecordList9);
    obj.btnNovoflwMagicRecordList9:setName("btnNovoflwMagicRecordList9");
    obj.btnNovoflwMagicRecordList9:setAlign("left");
    obj.btnNovoflwMagicRecordList9:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList9:setWidth(160);
    obj.btnNovoflwMagicRecordList9:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList9._recalcHeight();


    obj.flowLayout13 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout13:setParent(obj.flowLayout3);
    obj.flowLayout13:setHeight(100);
    obj.flowLayout13:setAvoidScale(true);
    obj.flowLayout13:setMaxControlsPerLine(1);
    obj.flowLayout13:setAutoHeight(true);
    obj.flowLayout13:setName("flowLayout13");
    obj.flowLayout13:setMargins({left=10, right=10, top=4, bottom=4});
    obj.flowLayout13:setStepSizes({310, 360, 420, 600});
    obj.flowLayout13:setMinScaledWidth(300);
    obj.flowLayout13:setMaxScaledWidth(600);
    obj.flowLayout13:setVertAlign("leading");

    obj.flowPart14 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart14:setParent(obj.flowLayout13);
    obj.flowPart14:setFrameStyle("/Runarcana/frames/magicHeader/header1.xml");
    obj.flowPart14:setName("flowPart14");
    obj.flowPart14:setAvoidScale(true);
    obj.flowPart14:setMinScaledWidth(280);
    obj.flowPart14:setMinWidth(300);
    obj.flowPart14:setMaxWidth(600);
    obj.flowPart14:setHeight(80);
    obj.flowPart14:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flowPart14:setVertAlign("leading");

    obj.label95 = GUI.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.flowPart14);
    obj.label95:setFrameRegion("RegiaoSmallTitulo");
    obj.label95:setText("9");
    obj.label95:setName("label95");
    obj.label95:setHorzTextAlign("center");
    obj.label95:setVertTextAlign("center");
    obj.label95:setFontSize(18);
    obj.label95:setFontColor("white");

    obj.edit57 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.flowPart14);
    obj.edit57:setFrameRegion("RegiaoConteudo1");
    obj.edit57:setField("magias.espacosTotais9");
    obj.edit57:setName("edit57");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setFontSize(18);
    obj.edit57:setTransparent(true);
    obj.edit57:setFontColor("white");

    obj.label96 = GUI.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.flowPart14);
    obj.label96:setFrameRegion("RegiaoConteudo2");
    obj.label96:setText("Custo de Mana: 21");
    obj.label96:setName("label96");
    obj.label96:setHorzTextAlign("center");
    obj.label96:setVertTextAlign("center");
    obj.label96:setFontSize(18);
    obj.label96:setFontColor("white");

    obj.flwMagicRecordList10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flwMagicRecordList10:setParent(obj.flowLayout13);
    obj.flwMagicRecordList10:setMinWidth(300);
    obj.flwMagicRecordList10:setMaxWidth(600);
    obj.flwMagicRecordList10:setMinScaledWidth(280);
    obj.flwMagicRecordList10:setName("flwMagicRecordList10");
    obj.flwMagicRecordList10:setMargins({left=1, right=1, top=2, bottom=2});
    obj.flwMagicRecordList10:setVertAlign("leading");


					rawset(self.flwMagicRecordList10, "_recalcHeight", 					
						function ()
							self.flwMagicRecordList10.height = self.rclflwMagicRecordList10.height +
														self.layBottomflwMagicRecordList10.height + 
														self.flwMagicRecordList10.padding.top + self.flwMagicRecordList10.padding.bottom + 7;
						end);
				


    obj.rclflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclflwMagicRecordList10:setParent(obj.flwMagicRecordList10);
    obj.rclflwMagicRecordList10:setName("rclflwMagicRecordList10");
    obj.rclflwMagicRecordList10:setAlign("top");
    obj.rclflwMagicRecordList10:setField("magias.magias.nivel9");
    obj.rclflwMagicRecordList10:setTemplateForm("frmMagiaItemComCheckbox");
    obj.rclflwMagicRecordList10:setAutoHeight(true);
    obj.rclflwMagicRecordList10:setMinHeight(5);
    obj.rclflwMagicRecordList10:setHitTest(false);
    obj.rclflwMagicRecordList10:setMargins({left=10, right=10});

    obj.layBottomflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layBottomflwMagicRecordList10:setParent(obj.flwMagicRecordList10);
    obj.layBottomflwMagicRecordList10:setName("layBottomflwMagicRecordList10");
    obj.layBottomflwMagicRecordList10:setAlign("top");
    obj.layBottomflwMagicRecordList10:setHeight(36);

    obj.btnNovoflwMagicRecordList10 = GUI.fromHandle(_obj_newObject("button"));
    obj.btnNovoflwMagicRecordList10:setParent(obj.layBottomflwMagicRecordList10);
    obj.btnNovoflwMagicRecordList10:setName("btnNovoflwMagicRecordList10");
    obj.btnNovoflwMagicRecordList10:setAlign("left");
    obj.btnNovoflwMagicRecordList10:setText("Nova Magia");
    obj.btnNovoflwMagicRecordList10:setWidth(160);
    obj.btnNovoflwMagicRecordList10:setMargins({top=4, bottom=4, left=48});

self.flwMagicRecordList10._recalcHeight();


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

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.scrollBox6);
    obj.rectangle33:setLeft(0);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(1205);
    obj.rectangle33:setHeight(105);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.label97 = GUI.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.rectangle33);
    obj.label97:setAlign("top");
    obj.label97:setHeight(20);
    obj.label97:setText("DESCRIÇÃO");
    obj.label97:setName("label97");
    obj.label97:setFontColor("white");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle33);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout67);
    obj.layout68:setAlign("left");
    obj.layout68:setWidth(380);
    obj.layout68:setMargins({right=10});
    obj.layout68:setName("layout68");

    obj.label98 = GUI.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout68);
    obj.label98:setAlign("left");
    obj.label98:setWidth(90);
    obj.label98:setText("PASSADO");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");
    obj.label98:setFontColor("white");

    obj.edit58 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout68);
    obj.edit58:setAlign("client");
    obj.edit58:setField("passado");
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setName("edit58");
    obj.edit58:setFontSize(15);
    obj.edit58:setFontColor("white");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout67);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(380);
    obj.layout69:setMargins({right=10});
    obj.layout69:setName("layout69");

    obj.label99 = GUI.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout69);
    obj.label99:setAlign("left");
    obj.label99:setWidth(90);
    obj.label99:setText("IDADE");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");
    obj.label99:setFontColor("white");

    obj.edit59 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout69);
    obj.edit59:setAlign("client");
    obj.edit59:setField("idade");
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setName("edit59");
    obj.edit59:setFontSize(15);
    obj.edit59:setFontColor("white");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout67);
    obj.layout70:setAlign("left");
    obj.layout70:setWidth(380);
    obj.layout70:setMargins({right=10});
    obj.layout70:setName("layout70");

    obj.label100 = GUI.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout70);
    obj.label100:setAlign("left");
    obj.label100:setWidth(90);
    obj.label100:setText("OLHOS");
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");
    obj.label100:setFontColor("white");

    obj.edit60 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout70);
    obj.edit60:setAlign("client");
    obj.edit60:setField("aparenciaOlhos");
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setName("edit60");
    obj.edit60:setFontSize(15);
    obj.edit60:setFontColor("white");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle33);
    obj.layout71:setAlign("top");
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout71);
    obj.layout72:setAlign("left");
    obj.layout72:setWidth(380);
    obj.layout72:setMargins({right=10});
    obj.layout72:setName("layout72");

    obj.label101 = GUI.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout72);
    obj.label101:setAlign("left");
    obj.label101:setWidth(90);
    obj.label101:setText("ALTURA");
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");
    obj.label101:setFontColor("white");

    obj.edit61 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout72);
    obj.edit61:setAlign("client");
    obj.edit61:setField("altura");
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setName("edit61");
    obj.edit61:setFontSize(15);
    obj.edit61:setFontColor("white");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout71);
    obj.layout73:setAlign("left");
    obj.layout73:setWidth(380);
    obj.layout73:setMargins({right=10});
    obj.layout73:setName("layout73");

    obj.label102 = GUI.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout73);
    obj.label102:setAlign("left");
    obj.label102:setWidth(90);
    obj.label102:setText("GÊNERO");
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");
    obj.label102:setFontColor("white");

    obj.edit62 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout73);
    obj.edit62:setAlign("client");
    obj.edit62:setField("genero");
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setName("edit62");
    obj.edit62:setFontSize(15);
    obj.edit62:setFontColor("white");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout71);
    obj.layout74:setAlign("left");
    obj.layout74:setWidth(380);
    obj.layout74:setMargins({right=10});
    obj.layout74:setName("layout74");

    obj.label103 = GUI.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout74);
    obj.label103:setAlign("left");
    obj.label103:setWidth(90);
    obj.label103:setText("PELE");
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");
    obj.label103:setFontColor("white");

    obj.edit63 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout74);
    obj.edit63:setAlign("client");
    obj.edit63:setField("pele");
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setName("edit63");
    obj.edit63:setFontSize(15);
    obj.edit63:setFontColor("white");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle33);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout75);
    obj.layout76:setAlign("left");
    obj.layout76:setWidth(380);
    obj.layout76:setMargins({right=10});
    obj.layout76:setName("layout76");

    obj.label104 = GUI.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout76);
    obj.label104:setAlign("left");
    obj.label104:setWidth(90);
    obj.label104:setText("PESO");
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");
    obj.label104:setFontColor("white");

    obj.edit64 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout76);
    obj.edit64:setAlign("client");
    obj.edit64:setField("peso");
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setName("edit64");
    obj.edit64:setFontSize(15);
    obj.edit64:setFontColor("white");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout75);
    obj.layout77:setAlign("left");
    obj.layout77:setWidth(380);
    obj.layout77:setMargins({right=10});
    obj.layout77:setName("layout77");

    obj.label105 = GUI.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout77);
    obj.label105:setAlign("left");
    obj.label105:setWidth(90);
    obj.label105:setText("OUTROS");
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");
    obj.label105:setFontColor("white");

    obj.edit65 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout77);
    obj.edit65:setAlign("client");
    obj.edit65:setField("aparenciaOutros");
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setName("edit65");
    obj.edit65:setFontSize(15);
    obj.edit65:setFontColor("white");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.layout75);
    obj.layout78:setAlign("left");
    obj.layout78:setWidth(380);
    obj.layout78:setMargins({right=10});
    obj.layout78:setName("layout78");

    obj.label106 = GUI.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout78);
    obj.label106:setAlign("left");
    obj.label106:setWidth(90);
    obj.label106:setText("CABELO");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");
    obj.label106:setFontColor("white");

    obj.edit66 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout78);
    obj.edit66:setAlign("client");
    obj.edit66:setField("cabelo");
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setName("edit66");
    obj.edit66:setFontSize(15);
    obj.edit66:setFontColor("white");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.scrollBox6);
    obj.layout79:setLeft(0);
    obj.layout79:setTop(110);
    obj.layout79:setWidth(375);
    obj.layout79:setHeight(240);
    obj.layout79:setName("layout79");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout79);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setName("rectangle34");

    obj.label107 = GUI.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout79);
    obj.label107:setLeft(5);
    obj.label107:setTop(1);
    obj.label107:setWidth(100);
    obj.label107:setHeight(20);
    obj.label107:setText("APARÊNCIA");
    obj.label107:setName("label107");
    obj.label107:setFontColor("white");

    obj.textEditor14 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout79);
    obj.textEditor14:setLeft(5);
    obj.textEditor14:setTop(25);
    obj.textEditor14:setWidth(365);
    obj.textEditor14:setHeight(210);
    obj.textEditor14:setField("aparencia");
    obj.textEditor14:setName("textEditor14");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.scrollBox6);
    obj.layout80:setLeft(0);
    obj.layout80:setTop(355);
    obj.layout80:setWidth(375);
    obj.layout80:setHeight(250);
    obj.layout80:setName("layout80");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout80);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.label108 = GUI.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout80);
    obj.label108:setLeft(5);
    obj.label108:setTop(1);
    obj.label108:setWidth(100);
    obj.label108:setHeight(20);
    obj.label108:setText("PERSONALIDADE");
    obj.label108:setName("label108");
    obj.label108:setFontColor("white");

    obj.textEditor15 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout80);
    obj.textEditor15:setLeft(5);
    obj.textEditor15:setTop(25);
    obj.textEditor15:setWidth(365);
    obj.textEditor15:setHeight(220);
    obj.textEditor15:setField("personalidade");
    obj.textEditor15:setName("textEditor15");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.scrollBox6);
    obj.layout81:setLeft(380);
    obj.layout81:setTop(110);
    obj.layout81:setWidth(825);
    obj.layout81:setHeight(495);
    obj.layout81:setName("layout81");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout81);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.label109 = GUI.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout81);
    obj.label109:setLeft(5);
    obj.label109:setTop(1);
    obj.label109:setWidth(100);
    obj.label109:setHeight(20);
    obj.label109:setText("HISTORIA");
    obj.label109:setName("label109");
    obj.label109:setFontColor("white");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout81);
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

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.scrollBox7);
    obj.layout82:setAlign("left");
    obj.layout82:setWidth(400);
    obj.layout82:setMargins({right=10});
    obj.layout82:setName("layout82");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout82);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("black");
    obj.rectangle37:setXradius(5);
    obj.rectangle37:setYradius(15);
    obj.rectangle37:setCornerType("round");
    obj.rectangle37:setName("rectangle37");

    obj.label110 = GUI.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.rectangle37);
    obj.label110:setAlign("top");
    obj.label110:setHeight(20);
    obj.label110:setText("Anotações");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");
    obj.label110:setFontColor("white");

    obj.textEditor16 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.rectangle37);
    obj.textEditor16:setAlign("client");
    obj.textEditor16:setField("anotacoes1");
    obj.textEditor16:setMargins({left=10,right=10,bottom=10});
    obj.textEditor16:setName("textEditor16");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.scrollBox7);
    obj.layout83:setAlign("left");
    obj.layout83:setWidth(400);
    obj.layout83:setMargins({right=10});
    obj.layout83:setName("layout83");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout83);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("black");
    obj.rectangle38:setXradius(5);
    obj.rectangle38:setYradius(15);
    obj.rectangle38:setCornerType("round");
    obj.rectangle38:setName("rectangle38");

    obj.label111 = GUI.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.rectangle38);
    obj.label111:setAlign("top");
    obj.label111:setHeight(20);
    obj.label111:setText("Anotações");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");
    obj.label111:setFontColor("white");

    obj.textEditor17 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.rectangle38);
    obj.textEditor17:setAlign("client");
    obj.textEditor17:setField("anotacoes2");
    obj.textEditor17:setMargins({left=10,right=10,bottom=10});
    obj.textEditor17:setName("textEditor17");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.scrollBox7);
    obj.layout84:setAlign("left");
    obj.layout84:setWidth(400);
    obj.layout84:setMargins({right=10});
    obj.layout84:setName("layout84");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout84);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("black");
    obj.rectangle39:setXradius(5);
    obj.rectangle39:setYradius(15);
    obj.rectangle39:setCornerType("round");
    obj.rectangle39:setName("rectangle39");

    obj.label112 = GUI.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.rectangle39);
    obj.label112:setAlign("top");
    obj.label112:setHeight(20);
    obj.label112:setText("Anotações");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");
    obj.label112:setFontColor("white");

    obj.textEditor18 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.rectangle39);
    obj.textEditor18:setAlign("client");
    obj.textEditor18:setField("anotacoes3");
    obj.textEditor18:setMargins({left=10,right=10,bottom=10});
    obj.textEditor18:setName("textEditor18");

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
    obj.image2:setHeight(112);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("/Runarcana/images/runarcana.png");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox8);
    obj.image3:setLeft(550);
    obj.image3:setTop(0);
    obj.image3:setWidth(250);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Runarcana/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.scrollBox8);
    obj.layout85:setLeft(850);
    obj.layout85:setTop(0);
    obj.layout85:setWidth(200);
    obj.layout85:setHeight(160);
    obj.layout85:setName("layout85");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout85);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setXradius(5);
    obj.rectangle40:setYradius(15);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.label113 = GUI.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout85);
    obj.label113:setLeft(0);
    obj.label113:setTop(10);
    obj.label113:setWidth(200);
    obj.label113:setHeight(20);
    obj.label113:setText("Ficha feita por: ");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");
    obj.label113:setFontColor("white");

    obj.label114 = GUI.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout85);
    obj.label114:setLeft(0);
    obj.label114:setTop(35);
    obj.label114:setWidth(200);
    obj.label114:setHeight(20);
    obj.label114:setText("Vinny (Ambesek)");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");
    obj.label114:setFontColor("white");

    obj.label115 = GUI.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout85);
    obj.label115:setLeft(0);
    obj.label115:setTop(60);
    obj.label115:setWidth(200);
    obj.label115:setHeight(20);
    obj.label115:setText("Consultor: Arddhu");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");
    obj.label115:setFontColor("white");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.scrollBox8);
    obj.layout86:setLeft(850);
    obj.layout86:setTop(170);
    obj.layout86:setWidth(200);
    obj.layout86:setHeight(150);
    obj.layout86:setName("layout86");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout86);
    obj.rectangle41:setLeft(0);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(200);
    obj.rectangle41:setHeight(150);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setName("rectangle41");

    obj.label116 = GUI.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout86);
    obj.label116:setLeft(0);
    obj.label116:setTop(10);
    obj.label116:setWidth(80);
    obj.label116:setHeight(20);
    obj.label116:setText("Tema:");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");
    obj.label116:setFontColor("white");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout86);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout86);
    obj.dataLink14:setField("theme");
    obj.dataLink14:setDefaultValue("Escuro");
    obj.dataLink14:setName("dataLink14");

    obj.label117 = GUI.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout86);
    obj.label117:setLeft(0);
    obj.label117:setTop(35);
    obj.label117:setWidth(90);
    obj.label117:setHeight(20);
    obj.label117:setText("Cores: ");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");
    obj.label117:setFontColor("white");

    obj.label118 = GUI.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout86);
    obj.label118:setLeft(0);
    obj.label118:setTop(60);
    obj.label118:setWidth(90);
    obj.label118:setHeight(20);
    obj.label118:setText("Fundo ");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");
    obj.label118:setFontColor("white");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout86);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout86);
    obj.dataLink15:setField("colorBackground");
    obj.dataLink15:setDefaultValue("#000000");
    obj.dataLink15:setName("dataLink15");

    obj.label119 = GUI.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout86);
    obj.label119:setLeft(0);
    obj.label119:setTop(85);
    obj.label119:setWidth(90);
    obj.label119:setHeight(20);
    obj.label119:setText("Linhas ");
    obj.label119:setHorzTextAlign("center");
    obj.label119:setName("label119");
    obj.label119:setFontColor("white");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout86);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout86);
    obj.dataLink16:setField("colorStroke");
    obj.dataLink16:setDefaultValue("#FFFFFF");
    obj.dataLink16:setName("dataLink16");

    obj.label120 = GUI.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout86);
    obj.label120:setLeft(0);
    obj.label120:setTop(110);
    obj.label120:setWidth(90);
    obj.label120:setHeight(20);
    obj.label120:setText("Fonte ");
    obj.label120:setHorzTextAlign("center");
    obj.label120:setName("label120");
    obj.label120:setFontColor("white");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout86);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout86);
    obj.dataLink17:setField("colorFont");
    obj.dataLink17:setDefaultValue("#FFFFFF");
    obj.dataLink17:setName("dataLink17");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.scrollBox8);
    obj.layout87:setLeft(850);
    obj.layout87:setTop(330);
    obj.layout87:setWidth(200);
    obj.layout87:setHeight(150);
    obj.layout87:setName("layout87");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout87);
    obj.button3:setLeft(0);
    obj.button3:setTop(0);
    obj.button3:setWidth(100);
    obj.button3:setHeight(20);
    obj.button3:setText("Exportar Ficha");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout87);
    obj.button4:setLeft(0);
    obj.button4:setTop(25);
    obj.button4:setWidth(100);
    obj.button4:setHeight(20);
    obj.button4:setText("Importar Ficha");
    obj.button4:setName("button4");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.scrollBox8);
    obj.layout88:setLeft(0);
    obj.layout88:setTop(330);
    obj.layout88:setWidth(220);
    obj.layout88:setHeight(100);
    obj.layout88:setName("layout88");

    obj.checkBox25 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout88);
    obj.checkBox25:setLeft(0);
    obj.checkBox25:setTop(0);
    obj.checkBox25:setWidth(200);
    obj.checkBox25:setHeight(20);
    obj.checkBox25:setField("noUpdate");
    obj.checkBox25:setText("Não pedir para atualizar.");
    obj.checkBox25:setName("checkBox25");

    obj.label121 = GUI.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout88);
    obj.label121:setLeft(0);
    obj.label121:setTop(25);
    obj.label121:setWidth(200);
    obj.label121:setHeight(20);
    obj.label121:setText("Versão Atual: ");
    obj.label121:setField("versionInstalled");
    obj.label121:setName("label121");
    obj.label121:setFontColor("white");

    obj.label122 = GUI.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout88);
    obj.label122:setLeft(0);
    obj.label122:setTop(50);
    obj.label122:setWidth(200);
    obj.label122:setHeight(20);
    obj.label122:setText("Sua Versão: ");
    obj.label122:setField("versionDownloaded");
    obj.label122:setName("label122");
    obj.label122:setFontColor("white");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout88);
    obj.button5:setLeft(0);
    obj.button5:setTop(75);
    obj.button5:setWidth(100);
    obj.button5:setText("Change Log");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout88);
    obj.button6:setLeft(110);
    obj.button6:setTop(75);
    obj.button6:setWidth(100);
    obj.button6:setText("Atualizar");
    obj.button6:setName("button6");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.scrollBox8);
    obj.layout89:setLeft(250);
    obj.layout89:setTop(330);
    obj.layout89:setWidth(210);
    obj.layout89:setHeight(50);
    obj.layout89:setName("layout89");

    obj.label123 = GUI.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout89);
    obj.label123:setLeft(0);
    obj.label123:setTop(0);
    obj.label123:setWidth(200);
    obj.label123:setHeight(20);
    obj.label123:setText("Conheça as Mesas:");
    obj.label123:setName("label123");
    obj.label123:setFontColor("white");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout89);
    obj.button7:setLeft(0);
    obj.button7:setTop(25);
    obj.button7:setWidth(100);
    obj.button7:setText("RPGmeister");
    obj.button7:setName("button7");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.scrollBox8);
    obj.layout90:setLeft(400);
    obj.layout90:setTop(330);
    obj.layout90:setWidth(330);
    obj.layout90:setHeight(50);
    obj.layout90:setName("layout90");

    obj.label124 = GUI.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout90);
    obj.label124:setLeft(0);
    obj.label124:setTop(0);
    obj.label124:setWidth(200);
    obj.label124:setHeight(20);
    obj.label124:setText("Conheça o Sistema:");
    obj.label124:setName("label124");
    obj.label124:setFontColor("white");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout90);
    obj.button8:setLeft(0);
    obj.button8:setTop(25);
    obj.button8:setWidth(100);
    obj.button8:setText("Runarcana");
    obj.button8:setName("button8");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout90);
    obj.button9:setLeft(110);
    obj.button9:setTop(25);
    obj.button9:setWidth(100);
    obj.button9:setText("Wiki");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout90);
    obj.button10:setLeft(220);
    obj.button10:setTop(25);
    obj.button10:setWidth(100);
    obj.button10:setText("Apoia.se");
    obj.button10:setName("button10");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Runarcana/output/Ficha%20Runarcana.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Runarcana/output/Ficha%20Runarcana.rpk?raw=true');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            sheet.versionInstalled = "VERSÃO INSTALADA: ?";
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: ?";
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
            if sheet==nil then return end;
            				sheet.for_mod = math.floor((tonumber(sheet.for_total) or 0)/2) - 5;
            
            				local nodes = NDB.getChildNodes(sheet.listaDePericias);
            				for i=1, #nodes, 1 do
            					nodes[i].for_mod = sheet.for_mod;
            				end;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				sheet.des_mod = math.floor((tonumber(sheet.des_total) or 0)/2) - 5;
            
            				local nodes = NDB.getChildNodes(sheet.listaDePericias);
            				for i=1, #nodes, 1 do
            					nodes[i].des_mod = sheet.des_mod;
            				end;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				sheet.con_mod = math.floor((tonumber(sheet.con_total) or 0)/2) - 5;
            
            				local nodes = NDB.getChildNodes(sheet.listaDePericias);
            				for i=1, #nodes, 1 do
            					nodes[i].con_mod = sheet.con_mod;
            				end;
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				sheet.int_mod = math.floor((tonumber(sheet.int_total) or 0)/2) - 5;
            
            				local nodes = NDB.getChildNodes(sheet.listaDePericias);
            				for i=1, #nodes, 1 do
            					nodes[i].int_mod = sheet.int_mod;
            				end;
        end, obj);

    obj._e_event5 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				sheet.sab_mod = math.floor((tonumber(sheet.sab_total) or 0)/2) - 5;
            
            				local nodes = NDB.getChildNodes(sheet.listaDePericias);
            				for i=1, #nodes, 1 do
            					nodes[i].sab_mod = sheet.sab_mod;
            				end;
        end, obj);

    obj._e_event6 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				sheet.car_mod = math.floor((tonumber(sheet.car_total) or 0)/2) - 5;
            
            				local nodes = NDB.getChildNodes(sheet.listaDePericias);
            				for i=1, #nodes, 1 do
            					nodes[i].car_mod = sheet.car_mod;
            				end;
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local prof = tonumber(sheet.proficiencia) or 0;
            				local total = (tonumber(sheet.for_mod) or 0) + (tonumber(sheet.for_svAdicional) or 0);
            				
            				if sheet.for_svProf1 then total = total + prof end;
            				if sheet.for_svProf2 then total = total + prof end;
            
            				sheet.for_svTotal = total;
        end, obj);

    obj._e_event8 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local prof = tonumber(sheet.proficiencia) or 0;
            				local total = (tonumber(sheet.des_mod) or 0) + (tonumber(sheet.des_svAdicional) or 0);
            				
            				if sheet.des_svProf1 then total = total + prof end;
            				if sheet.des_svProf2 then total = total + prof end;
            
            				sheet.des_svTotal = total;
        end, obj);

    obj._e_event9 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local prof = tonumber(sheet.proficiencia) or 0;
            				local total = (tonumber(sheet.con_mod) or 0) + (tonumber(sheet.con_svAdicional) or 0);
            				
            				if sheet.con_svProf1 then total = total + prof end;
            				if sheet.con_svProf2 then total = total + prof end;
            
            				sheet.con_svTotal = total;
        end, obj);

    obj._e_event10 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local prof = tonumber(sheet.proficiencia) or 0;
            				local total = (tonumber(sheet.int_mod) or 0) + (tonumber(sheet.int_svAdicional) or 0);
            				
            				if sheet.int_svProf1 then total = total + prof end;
            				if sheet.int_svProf2 then total = total + prof end;
            
            				sheet.int_svTotal = total;
        end, obj);

    obj._e_event11 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local prof = tonumber(sheet.proficiencia) or 0;
            				local total = (tonumber(sheet.sab_mod) or 0) + (tonumber(sheet.sab_svAdicional) or 0);
            				
            				if sheet.sab_svProf1 then total = total + prof end;
            				if sheet.sab_svProf2 then total = total + prof end;
            
            				sheet.sab_svTotal = total;
        end, obj);

    obj._e_event12 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local prof = tonumber(sheet.proficiencia) or 0;
            				local total = (tonumber(sheet.car_mod) or 0) + (tonumber(sheet.car_svAdicional) or 0);
            				
            				if sheet.car_svProf1 then total = total + prof end;
            				if sheet.car_svProf2 then total = total + prof end;
            
            				sheet.car_svTotal = total;
        end, obj);

    obj._e_event13 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            						local nodes = NDB.getChildNodes(sheet.listaDePericias);
            						for i=1, #nodes, 1 do
            							nodes[i].proficiencia = sheet.proficiencia;
            						end;
        end, obj);

    obj._e_event14 = obj.button1:addEventListener("onClick",
        function (_)
            self:AddPericia("","7");
        end, obj);

    obj._e_event15 = obj.rclPericias:addEventListener("onEndEnumeration",
        function (_)
            if sheet==nil then return end;
            						local nodes = NDB.getChildNodes(sheet.listaDePericias);  
            						if #nodes == 0 then
            							-- Add default skills
            							self:AddPericia("Acrobacia","2");
            							self:AddPericia("Arcanismo","4");
            							self:AddPericia("Atletismo","1");
            							self:AddPericia("Atuação","6");
            							self:AddPericia("Enganação","6");
            							self:AddPericia("Furtividade","2");
            							self:AddPericia("Historia","4");
            							self:AddPericia("Intimidação","6");
            							self:AddPericia("Intuição","5");
            							self:AddPericia("Investigação","4");
            							self:AddPericia("Lidar com Animais","5");
            							self:AddPericia("Medicina","5");
            							self:AddPericia("Natureza","4");
            							self:AddPericia("Percepção","5");
            							self:AddPericia("Persuasão","6");
            							self:AddPericia("Prestidigitação","2");
            							self:AddPericia("Religião","4");
            							self:AddPericia("Sobrevivência","5");
            							self:AddPericia("Tecnologia","4");
            						end;
        end, obj);

    obj._e_event16 = obj.rclPericias:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event17 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.avatar);
        end, obj);

    obj._e_event18 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclAtaques:append();
        end, obj);

    obj._e_event19 = obj.rclAtaques:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event20 = obj.labupperGridMagicBox1:addEventListener("onResize",
        function (_)
            self.upperGridMagicBox1._RecalcSize();
        end, obj);

    obj._e_event21 = obj.labupperGridMagicEditBox1:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox1._RecalcSize();
        end, obj);

    obj._e_event22 = obj.labupperGridMagicEditBox2:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox2._RecalcSize();
        end, obj);

    obj._e_event23 = obj.labupperGridMagicEditBox3:addEventListener("onResize",
        function (_)
            self.upperGridMagicEditBox3._RecalcSize();
        end, obj);

    obj._e_event24 = obj.rclflwMagicRecordList1:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList1._recalcHeight();
        end, obj);

    obj._e_event25 = obj.btnNovoflwMagicRecordList1:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList1:append();
        end, obj);

    obj._e_event26 = obj.rclflwMagicRecordList2:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList2._recalcHeight();
        end, obj);

    obj._e_event27 = obj.btnNovoflwMagicRecordList2:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList2:append();
        end, obj);

    obj._e_event28 = obj.rclflwMagicRecordList3:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList3._recalcHeight();
        end, obj);

    obj._e_event29 = obj.btnNovoflwMagicRecordList3:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList3:append();
        end, obj);

    obj._e_event30 = obj.rclflwMagicRecordList4:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList4._recalcHeight();
        end, obj);

    obj._e_event31 = obj.btnNovoflwMagicRecordList4:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList4:append();
        end, obj);

    obj._e_event32 = obj.rclflwMagicRecordList5:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList5._recalcHeight();
        end, obj);

    obj._e_event33 = obj.btnNovoflwMagicRecordList5:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList5:append();
        end, obj);

    obj._e_event34 = obj.rclflwMagicRecordList6:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList6._recalcHeight();
        end, obj);

    obj._e_event35 = obj.btnNovoflwMagicRecordList6:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList6:append();
        end, obj);

    obj._e_event36 = obj.rclflwMagicRecordList7:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList7._recalcHeight();
        end, obj);

    obj._e_event37 = obj.btnNovoflwMagicRecordList7:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList7:append();
        end, obj);

    obj._e_event38 = obj.rclflwMagicRecordList8:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList8._recalcHeight();
        end, obj);

    obj._e_event39 = obj.btnNovoflwMagicRecordList8:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList8:append();
        end, obj);

    obj._e_event40 = obj.rclflwMagicRecordList9:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList9._recalcHeight();
        end, obj);

    obj._e_event41 = obj.btnNovoflwMagicRecordList9:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList9:append();
        end, obj);

    obj._e_event42 = obj.rclflwMagicRecordList10:addEventListener("onResize",
        function (_)
            self.flwMagicRecordList10._recalcHeight();
        end, obj);

    obj._e_event43 = obj.btnNovoflwMagicRecordList10:addEventListener("onClick",
        function (_)
            self.rclflwMagicRecordList10:append();
        end, obj);

    obj._e_event44 = obj.dataLink14:addEventListener("onChange",
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

    obj._e_event45 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event46 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event47 = obj.dataLink17:addEventListener("onChange",
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

    obj._e_event48 = obj.button3:addEventListener("onClick",
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

    obj._e_event49 = obj.button4:addEventListener("onClick",
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

    obj._e_event50 = obj.button5:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Runarcana/README.md')
        end, obj);

    obj._e_event51 = obj.button6:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20Runarcana/output/Ficha%20Runarcana.rpk?raw=true')
        end, obj);

    obj._e_event52 = obj.button7:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://my.firecastrpg.com/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event53 = obj.button8:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://runarcana.org/');
        end, obj);

    obj._e_event54 = obj.button9:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://wiki.runarcana.org/P%C3%A1gina_principal');
        end, obj);

    obj._e_event55 = obj.button10:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('Apoia.se/arddhu');
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edtupperGridMagicEditBox2 ~= nil then self.edtupperGridMagicEditBox2:destroy(); self.edtupperGridMagicEditBox2 = nil; end;
        if self.rclflwMagicRecordList7 ~= nil then self.rclflwMagicRecordList7:destroy(); self.rclflwMagicRecordList7 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.upperGridMagicEditBox2 ~= nil then self.upperGridMagicEditBox2:destroy(); self.upperGridMagicEditBox2 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.flwMagicRecordList6 ~= nil then self.flwMagicRecordList6:destroy(); self.flwMagicRecordList6 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.flowPart13 ~= nil then self.flowPart13:destroy(); self.flowPart13 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.flwMagicRecordList5 ~= nil then self.flwMagicRecordList5:destroy(); self.flwMagicRecordList5 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.btnNovoflwMagicRecordList10 ~= nil then self.btnNovoflwMagicRecordList10:destroy(); self.btnNovoflwMagicRecordList10 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.flwMagicRecordList2 ~= nil then self.flwMagicRecordList2:destroy(); self.flwMagicRecordList2 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.btnNovoflwMagicRecordList9 ~= nil then self.btnNovoflwMagicRecordList9:destroy(); self.btnNovoflwMagicRecordList9 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.frmAtaques ~= nil then self.frmAtaques:destroy(); self.frmAtaques = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.btnNovoflwMagicRecordList3 ~= nil then self.btnNovoflwMagicRecordList3:destroy(); self.btnNovoflwMagicRecordList3 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.popMagia ~= nil then self.popMagia:destroy(); self.popMagia = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.btnNovoflwMagicRecordList6 ~= nil then self.btnNovoflwMagicRecordList6:destroy(); self.btnNovoflwMagicRecordList6 = nil; end;
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
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.frmInventario ~= nil then self.frmInventario:destroy(); self.frmInventario = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flwMagicRecordList4 ~= nil then self.flwMagicRecordList4:destroy(); self.flwMagicRecordList4 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.panupperGridMagicBox1 ~= nil then self.panupperGridMagicBox1:destroy(); self.panupperGridMagicBox1 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.flowLayout8 ~= nil then self.flowLayout8:destroy(); self.flowLayout8 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.labupperGridMagicBox1 ~= nil then self.labupperGridMagicBox1:destroy(); self.labupperGridMagicBox1 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.upperGridMagicEditBox1 ~= nil then self.upperGridMagicEditBox1:destroy(); self.upperGridMagicEditBox1 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layBottomflwMagicRecordList6 ~= nil then self.layBottomflwMagicRecordList6:destroy(); self.layBottomflwMagicRecordList6 = nil; end;
        if self.layBottomflwMagicRecordList9 ~= nil then self.layBottomflwMagicRecordList9:destroy(); self.layBottomflwMagicRecordList9 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.flwMagicRecordList9 ~= nil then self.flwMagicRecordList9:destroy(); self.flwMagicRecordList9 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.flowLayout12 ~= nil then self.flowLayout12:destroy(); self.flowLayout12 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rclflwMagicRecordList2 ~= nil then self.rclflwMagicRecordList2:destroy(); self.rclflwMagicRecordList2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layBottomflwMagicRecordList3 ~= nil then self.layBottomflwMagicRecordList3:destroy(); self.layBottomflwMagicRecordList3 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.flwMagicRecordList1 ~= nil then self.flwMagicRecordList1:destroy(); self.flwMagicRecordList1 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edtupperGridMagicEditBox3 ~= nil then self.edtupperGridMagicEditBox3:destroy(); self.edtupperGridMagicEditBox3 = nil; end;
        if self.frmPrincipal ~= nil then self.frmPrincipal:destroy(); self.frmPrincipal = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.labupperGridMagicEditBox2 ~= nil then self.labupperGridMagicEditBox2:destroy(); self.labupperGridMagicEditBox2 = nil; end;
        if self.layBottomflwMagicRecordList2 ~= nil then self.layBottomflwMagicRecordList2:destroy(); self.layBottomflwMagicRecordList2 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.flowLayout7 ~= nil then self.flowLayout7:destroy(); self.flowLayout7 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.flowLayout10 ~= nil then self.flowLayout10:destroy(); self.flowLayout10 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.flwMagicRecordList8 ~= nil then self.flwMagicRecordList8:destroy(); self.flwMagicRecordList8 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.flowLayout4 ~= nil then self.flowLayout4:destroy(); self.flowLayout4 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.rclAtaques ~= nil then self.rclAtaques:destroy(); self.rclAtaques = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.layBottomflwMagicRecordList4 ~= nil then self.layBottomflwMagicRecordList4:destroy(); self.layBottomflwMagicRecordList4 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.panupperGridMagicEditBox3 ~= nil then self.panupperGridMagicEditBox3:destroy(); self.panupperGridMagicEditBox3 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.layBottomflwMagicRecordList8 ~= nil then self.layBottomflwMagicRecordList8:destroy(); self.layBottomflwMagicRecordList8 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
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
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.flowLayout13 ~= nil then self.flowLayout13:destroy(); self.flowLayout13 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.panupperGridMagicEditBox2 ~= nil then self.panupperGridMagicEditBox2:destroy(); self.panupperGridMagicEditBox2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.flowLayout5 ~= nil then self.flowLayout5:destroy(); self.flowLayout5 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.tab8 ~= nil then self.tab8:destroy(); self.tab8 = nil; end;
        if self.frmRunas ~= nil then self.frmRunas:destroy(); self.frmRunas = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.flwMagicRecordList3 ~= nil then self.flwMagicRecordList3:destroy(); self.flwMagicRecordList3 = nil; end;
        if self.upperGridMagicEditBox3 ~= nil then self.upperGridMagicEditBox3:destroy(); self.upperGridMagicEditBox3 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.rclflwMagicRecordList5 ~= nil then self.rclflwMagicRecordList5:destroy(); self.rclflwMagicRecordList5 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclflwMagicRecordList9 ~= nil then self.rclflwMagicRecordList9:destroy(); self.rclflwMagicRecordList9 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.btnNovoflwMagicRecordList7 ~= nil then self.btnNovoflwMagicRecordList7:destroy(); self.btnNovoflwMagicRecordList7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
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
        if self.flwMagicRecordList7 ~= nil then self.flwMagicRecordList7:destroy(); self.flwMagicRecordList7 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.frmMagias ~= nil then self.frmMagias:destroy(); self.frmMagias = nil; end;
        if self.layBottomflwMagicRecordList5 ~= nil then self.layBottomflwMagicRecordList5:destroy(); self.layBottomflwMagicRecordList5 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.btnNovoflwMagicRecordList5 ~= nil then self.btnNovoflwMagicRecordList5:destroy(); self.btnNovoflwMagicRecordList5 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowLayout6 ~= nil then self.flowLayout6:destroy(); self.flowLayout6 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.rclflwMagicRecordList10 ~= nil then self.rclflwMagicRecordList10:destroy(); self.rclflwMagicRecordList10 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.upperGridMagicBox1 ~= nil then self.upperGridMagicBox1:destroy(); self.upperGridMagicBox1 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.panupperGridMagicEditBox1 ~= nil then self.panupperGridMagicEditBox1:destroy(); self.panupperGridMagicEditBox1 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rclflwMagicRecordList6 ~= nil then self.rclflwMagicRecordList6:destroy(); self.rclflwMagicRecordList6 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
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
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rclflwMagicRecordList1 ~= nil then self.rclflwMagicRecordList1:destroy(); self.rclflwMagicRecordList1 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.cmbupperGridMagicBox1 ~= nil then self.cmbupperGridMagicBox1:destroy(); self.cmbupperGridMagicBox1 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
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
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.layBottomflwMagicRecordList1 ~= nil then self.layBottomflwMagicRecordList1:destroy(); self.layBottomflwMagicRecordList1 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.flowPart12 ~= nil then self.flowPart12:destroy(); self.flowPart12 = nil; end;
        if self.rclflwMagicRecordList8 ~= nil then self.rclflwMagicRecordList8:destroy(); self.rclflwMagicRecordList8 = nil; end;
        if self.layBottomflwMagicRecordList7 ~= nil then self.layBottomflwMagicRecordList7:destroy(); self.layBottomflwMagicRecordList7 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.fraMagiasLayout ~= nil then self.fraMagiasLayout:destroy(); self.fraMagiasLayout = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.flowLayout9 ~= nil then self.flowLayout9:destroy(); self.flowLayout9 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.labupperGridMagicEditBox3 ~= nil then self.labupperGridMagicEditBox3:destroy(); self.labupperGridMagicEditBox3 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.flowLayout11 ~= nil then self.flowLayout11:destroy(); self.flowLayout11 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.btnNovoflwMagicRecordList4 ~= nil then self.btnNovoflwMagicRecordList4:destroy(); self.btnNovoflwMagicRecordList4 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.flowPart11 ~= nil then self.flowPart11:destroy(); self.flowPart11 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.btnNovoflwMagicRecordList2 ~= nil then self.btnNovoflwMagicRecordList2:destroy(); self.btnNovoflwMagicRecordList2 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.btnNovoflwMagicRecordList1 ~= nil then self.btnNovoflwMagicRecordList1:destroy(); self.btnNovoflwMagicRecordList1 = nil; end;
        if self.layBottomflwMagicRecordList10 ~= nil then self.layBottomflwMagicRecordList10:destroy(); self.layBottomflwMagicRecordList10 = nil; end;
        if self.rclflwMagicRecordList3 ~= nil then self.rclflwMagicRecordList3:destroy(); self.rclflwMagicRecordList3 = nil; end;
        if self.rclPericias ~= nil then self.rclPericias:destroy(); self.rclPericias = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.btnNovoflwMagicRecordList8 ~= nil then self.btnNovoflwMagicRecordList8:destroy(); self.btnNovoflwMagicRecordList8 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.flwMagicRecordList10 ~= nil then self.flwMagicRecordList10:destroy(); self.flwMagicRecordList10 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.labupperGridMagicEditBox1 ~= nil then self.labupperGridMagicEditBox1:destroy(); self.labupperGridMagicEditBox1 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.rclflwMagicRecordList4 ~= nil then self.rclflwMagicRecordList4:destroy(); self.rclflwMagicRecordList4 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.edtupperGridMagicEditBox1 ~= nil then self.edtupperGridMagicEditBox1:destroy(); self.edtupperGridMagicEditBox1 = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmRunarcana()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmRunarcana();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmRunarcana = {
    newEditor = newfrmRunarcana, 
    new = newfrmRunarcana, 
    name = "frmRunarcana", 
    dataType = "Ambesek.Ficha.Runarcana", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Runarcana", 
    description=""};

frmRunarcana = _frmRunarcana;
Firecast.registrarForm(_frmRunarcana);
Firecast.registrarDataType(_frmRunarcana);

return _frmRunarcana;
