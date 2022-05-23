require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaMichiria()
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
    obj:setName("frmFichaMichiria");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Michiria");
    obj:setTitle("Ficha Michiria");
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

    obj.frmLH1 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmLH1:setParent(obj.tab1);
    obj.frmLH1:setName("frmLH1");
    obj.frmLH1:setAlign("client");
    obj.frmLH1:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmLH1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");


			local function vida_status();
				if sheet~=nil then
					sheet.vida_total =  (tonumber(sheet.vida_base ) or 0) * 
										(tonumber(sheet.vida_mult ) or 1);				
				end;
			end;
			local function cha_status();
				if sheet~=nil then
					sheet.cha_total =  (tonumber(sheet.cha_base ) or 0) * 
										(tonumber(sheet.cha_mult ) or 1);				
				end;
			end;
			local function sta_status();
				if sheet~=nil then
					sheet.sta_total =  (tonumber(sheet.sta_base ) or 0) * 
										(tonumber(sheet.sta_mult ) or 1);				
				end;
			end;	
			


    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(825);
    obj.layout1:setHeight(95);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("grey");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(90);
    obj.label1:setHeight(20);
    obj.label1:setText("Clan");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setField("desc_clan");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(210);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(90);
    obj.label2:setHeight(20);
    obj.label2:setText("Nome");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(100);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setField("desc_nome");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(420);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(200);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(90);
    obj.label3:setHeight(20);
    obj.label3:setText("Rank");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setField("desc_rank");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(615);
    obj.layout5:setTop(5);
    obj.layout5:setWidth(200);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(90);
    obj.label4:setHeight(20);
    obj.label4:setText("Raça");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(100);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(25);
    obj.edit4:setField("desc_raca");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(200);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(90);
    obj.label5:setHeight(20);
    obj.label5:setText("Vila de Origem");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(100);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setField("desc_vila_origem");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(210);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(90);
    obj.label6:setHeight(20);
    obj.label6:setText("Vila Atual");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setLeft(100);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("desc_vila_atual");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(420);
    obj.layout8:setTop(35);
    obj.layout8:setWidth(200);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(90);
    obj.label7:setHeight(20);
    obj.label7:setText("Especialização");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setLeft(100);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(100);
    obj.edit7:setHeight(25);
    obj.edit7:setField("desc_especializacao");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(615);
    obj.layout9:setTop(35);
    obj.layout9:setWidth(200);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(90);
    obj.label8:setHeight(20);
    obj.label8:setText("Classe");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setLeft(100);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(25);
    obj.edit8:setField("desc_classe");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(65);
    obj.layout10:setWidth(200);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout10);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(90);
    obj.label9:setHeight(20);
    obj.label9:setText("Dinheiro");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setLeft(100);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(100);
    obj.edit9:setHeight(25);
    obj.edit9:setField("desc_dinheiro");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(210);
    obj.layout11:setTop(65);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout11);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(90);
    obj.label10:setHeight(20);
    obj.label10:setText("Elemento I");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setLeft(100);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(100);
    obj.edit10:setHeight(25);
    obj.edit10:setField("desc_Elemento Principal");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setLeft(420);
    obj.layout12:setTop(65);
    obj.layout12:setWidth(200);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout12);
    obj.label11:setLeft(0);
    obj.label11:setTop(5);
    obj.label11:setWidth(90);
    obj.label11:setHeight(20);
    obj.label11:setText("Elemento II");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout12);
    obj.edit11:setLeft(100);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(100);
    obj.edit11:setHeight(25);
    obj.edit11:setField("desc_Elemento Secundario");
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setName("edit11");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setLeft(615);
    obj.layout13:setTop(65);
    obj.layout13:setWidth(200);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout13);
    obj.label12:setLeft(0);
    obj.label12:setTop(5);
    obj.label12:setWidth(90);
    obj.label12:setHeight(20);
    obj.label12:setText("loginDono");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setLeft(100);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(100);
    obj.edit12:setHeight(25);
    obj.edit12:setField("desc_loginDono");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(100);
    obj.layout14:setWidth(300);
    obj.layout14:setHeight(230);
    obj.layout14:setName("layout14");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout14);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout14);
    obj.label13:setLeft(5);
    obj.label13:setTop(5);
    obj.label13:setWidth(290);
    obj.label13:setHeight(20);
    obj.label13:setText("ATRIBUTOS");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.atributos_todos = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributos_todos:setParent(obj.layout14);
    obj.atributos_todos:setLeft(5);
    obj.atributos_todos:setTop(0);
    obj.atributos_todos:setWidth(300);
    obj.atributos_todos:setHeight(215);
    obj.atributos_todos:setName("atributos_todos");
    obj.atributos_todos:setVisible(false);

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.atributos_todos);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(30);
    obj.layout15:setWidth(300);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout15);
    obj.label14:setLeft(50);
    obj.label14:setTop(0);
    obj.label14:setWidth(35);
    obj.label14:setHeight(25);
    obj.label14:setText("Base");
    obj.label14:setFontSize(11);
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout15);
    obj.label15:setLeft(90);
    obj.label15:setTop(0);
    obj.label15:setWidth(35);
    obj.label15:setHeight(25);
    obj.label15:setText("Multi");
    obj.label15:setFontSize(11);
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout15);
    obj.label16:setLeft(130);
    obj.label16:setTop(0);
    obj.label16:setWidth(35);
    obj.label16:setHeight(25);
    obj.label16:setText("Extra");
    obj.label16:setFontSize(11);
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout15);
    obj.label17:setLeft(175);
    obj.label17:setTop(0);
    obj.label17:setWidth(35);
    obj.label17:setHeight(25);
    obj.label17:setText("Total");
    obj.label17:setFontSize(10);
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout15);
    obj.label18:setLeft(235);
    obj.label18:setTop(0);
    obj.label18:setWidth(35);
    obj.label18:setHeight(25);
    obj.label18:setText("Rank");
    obj.label18:setFontSize(13);
    obj.label18:setName("label18");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.atributos_todos);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(55);
    obj.layout16:setWidth(300);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout16);
    obj.label19:setLeft(5);
    obj.label19:setTop(5);
    obj.label19:setWidth(40);
    obj.label19:setHeight(20);
    obj.label19:setText("VDS");
    obj.label19:setName("label19");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout16);
    obj.edit13:setLeft(40);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(25);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setField("vds_base");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout16);
    obj.edit14:setLeft(85);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(35);
    obj.edit14:setHeight(25);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setField("vds_multi");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout16);
    obj.edit15:setLeft(125);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setField("vds_outros");
    obj.edit15:setName("edit15");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout16);
    obj.rectangle3:setLeft(160);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout16);
    obj.label20:setLeft(160);
    obj.label20:setTop(0);
    obj.label20:setWidth(50);
    obj.label20:setHeight(25);
    obj.label20:setField("vds_total");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout16);
    obj.rectangle4:setLeft(215);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(75);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout16);
    obj.label21:setLeft(215);
    obj.label21:setTop(0);
    obj.label21:setWidth(75);
    obj.label21:setHeight(25);
    obj.label21:setField("vds_teste");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");


				local function VDS();
					if sheet~=nil then
						sheet.vds_total =  (tonumber(sheet.vds_base ) or 0) * 
												(tonumber(sheet.vds_multi ) or 1) + 
												(tonumber(sheet.vds_outros ) or 0);
						rankstats = sheet.vds_total;
						if rankstats<16 then
							sheet.vds_teste = "Acadêmico";
						elseif rankstats>=16 and rankstats<61 then
							sheet.vds_teste = "Gennin";
						elseif rankstats>=61 and rankstats<151 then
							sheet.vds_teste = "Chuunin";
						elseif rankstats>=151 and rankstats<271 then
							sheet.vds_teste = "Jounnin";
						elseif rankstats>=271 and rankstats<421 then
							sheet.vds_teste = "ANBU";
						else
							sheet.vds_teste = "Kage";							
						end;
					end;
				end;	
				


    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.atributos_todos);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(80);
    obj.layout17:setWidth(300);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout17);
    obj.label22:setLeft(5);
    obj.label22:setTop(5);
    obj.label22:setWidth(40);
    obj.label22:setHeight(20);
    obj.label22:setText("AFE");
    obj.label22:setName("label22");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout17);
    obj.edit16:setLeft(40);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(40);
    obj.edit16:setHeight(25);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setField("afe_base");
    obj.edit16:setName("edit16");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout17);
    obj.edit17:setLeft(85);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(35);
    obj.edit17:setHeight(25);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setField("afe_multi");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout17);
    obj.edit18:setLeft(125);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setField("afe_outros");
    obj.edit18:setName("edit18");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout17);
    obj.rectangle5:setLeft(160);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout17);
    obj.label23:setLeft(160);
    obj.label23:setTop(0);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setField("afe_total");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout17);
    obj.rectangle6:setLeft(215);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(75);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout17);
    obj.label24:setLeft(215);
    obj.label24:setTop(0);
    obj.label24:setWidth(75);
    obj.label24:setHeight(25);
    obj.label24:setField("afe_teste");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");


				local function AFE();
					if sheet~=nil then
						sheet.afe_total =  (tonumber(sheet.afe_base ) or 0) * 
												(tonumber(sheet.afe_multi ) or 1) + 
												(tonumber(sheet.afe_outros ) or 0);
						rankstats = sheet.afe_total;
						if rankstats<16 then
							sheet.afe_teste = "Acadêmico";
						elseif rankstats>=16 and rankstats<61 then
							sheet.afe_teste = "Gennin";
						elseif rankstats>=61 and rankstats<151 then
							sheet.afe_teste = "Chuunin";
						elseif rankstats>=151 and rankstats<271 then
							sheet.afe_teste = "Jounnin";
						elseif rankstats>=271 and rankstats<421 then
							sheet.afe_teste = "ANBU";
						else
							sheet.afe_teste = "Kage";							
						end;
					end;
				end;	
				


    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.atributos_todos);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(110);
    obj.layout18:setWidth(300);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout18);
    obj.label25:setLeft(5);
    obj.label25:setTop(5);
    obj.label25:setWidth(40);
    obj.label25:setHeight(20);
    obj.label25:setText("INT");
    obj.label25:setName("label25");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout18);
    obj.edit19:setLeft(40);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(25);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setField("int_base");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout18);
    obj.edit20:setLeft(85);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(35);
    obj.edit20:setHeight(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("int_multi");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout18);
    obj.edit21:setLeft(125);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setField("int_outros");
    obj.edit21:setName("edit21");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout18);
    obj.rectangle7:setLeft(160);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("Black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout18);
    obj.label26:setLeft(160);
    obj.label26:setTop(0);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setField("int_total");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout18);
    obj.rectangle8:setLeft(215);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(75);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("Black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout18);
    obj.label27:setLeft(215);
    obj.label27:setTop(0);
    obj.label27:setWidth(75);
    obj.label27:setHeight(25);
    obj.label27:setField("int_teste");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");


				local function INT();
					if sheet~=nil then
						sheet.int_total =  (tonumber(sheet.int_base ) or 0) * 
												(tonumber(sheet.int_multi ) or 1) + 
												(tonumber(sheet.int_outros ) or 0);
						rankstats = sheet.int_total;
						if rankstats<16 then
							sheet.int_teste = "Acadêmico";
						elseif rankstats>=16 and rankstats<61 then
							sheet.int_teste = "Gennin";
						elseif rankstats>=61 and rankstats<151 then
							sheet.int_teste = "Chuunin";
						elseif rankstats>=151 and rankstats<271 then
							sheet.int_teste = "Jounnin";
						elseif rankstats>=271 and rankstats<421 then
							sheet.int_teste = "ANBU";
						else
							sheet.int_teste = "Kage";							
						end;
					end;
				end;	
				


    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.atributos_todos);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(135);
    obj.layout19:setWidth(300);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout19);
    obj.label28:setLeft(5);
    obj.label28:setTop(5);
    obj.label28:setWidth(40);
    obj.label28:setHeight(20);
    obj.label28:setText("CCH");
    obj.label28:setName("label28");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout19);
    obj.edit22:setLeft(40);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(40);
    obj.edit22:setHeight(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setField("cch_base");
    obj.edit22:setName("edit22");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout19);
    obj.edit23:setLeft(85);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(35);
    obj.edit23:setHeight(25);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setField("cch_multi");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout19);
    obj.edit24:setLeft(125);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setField("cch_outros");
    obj.edit24:setName("edit24");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout19);
    obj.rectangle9:setLeft(160);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("Black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout19);
    obj.label29:setLeft(160);
    obj.label29:setTop(0);
    obj.label29:setWidth(50);
    obj.label29:setHeight(25);
    obj.label29:setField("cch_total");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout19);
    obj.rectangle10:setLeft(215);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(75);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("Black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout19);
    obj.label30:setLeft(215);
    obj.label30:setTop(0);
    obj.label30:setWidth(75);
    obj.label30:setHeight(25);
    obj.label30:setField("cch_teste");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");


				local function CCH();
					if sheet~=nil then
						sheet.cch_total =  (tonumber(sheet.cch_base ) or 0) * 
												(tonumber(sheet.cch_multi ) or 1) + 
												(tonumber(sheet.cch_outros ) or 0);
						rankstats = sheet.cch_total;
						if rankstats<16 then
							sheet.cch_teste = "Acadêmico";
						elseif rankstats>=16 and rankstats<61 then
							sheet.cch_teste = "Gennin";
						elseif rankstats>=61 and rankstats<151 then
							sheet.cch_teste = "Chuunin";
						elseif rankstats>=151 and rankstats<271 then
							sheet.cch_teste = "Jounnin";
						elseif rankstats>=271 and rankstats<421 then
							sheet.cch_teste = "ANBU";
						else
							sheet.cch_teste = "Kage";							
						end;
					end;
				end;	
				


    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.atributos_todos);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(165);
    obj.layout20:setWidth(300);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout20);
    obj.label31:setLeft(5);
    obj.label31:setTop(5);
    obj.label31:setWidth(40);
    obj.label31:setHeight(20);
    obj.label31:setText("AGI");
    obj.label31:setName("label31");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout20);
    obj.edit25:setLeft(40);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(40);
    obj.edit25:setHeight(25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setField("agi_base");
    obj.edit25:setName("edit25");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout20);
    obj.edit26:setLeft(85);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(35);
    obj.edit26:setHeight(25);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setField("agi_multi");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout20);
    obj.edit27:setLeft(125);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setField("agi_outros");
    obj.edit27:setName("edit27");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout20);
    obj.rectangle11:setLeft(160);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("Black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout20);
    obj.label32:setLeft(160);
    obj.label32:setTop(0);
    obj.label32:setWidth(50);
    obj.label32:setHeight(25);
    obj.label32:setField("agi_total");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout20);
    obj.rectangle12:setLeft(215);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(75);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout20);
    obj.label33:setLeft(215);
    obj.label33:setTop(0);
    obj.label33:setWidth(75);
    obj.label33:setHeight(25);
    obj.label33:setField("agi_teste");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");


				local function AGI();
					if sheet~=nil then
						sheet.agi_total =  (tonumber(sheet.agi_base ) or 0) * 
												(tonumber(sheet.agi_multi ) or 1) + 
												(tonumber(sheet.agi_outros ) or 0);
						rankstats = sheet.agi_total;
						if rankstats<16 then
							sheet.agi_teste = "Acadêmico";
						elseif rankstats>=16 and rankstats<61 then
							sheet.agi_teste = "Gennin";
						elseif rankstats>=61 and rankstats<151 then
							sheet.agi_teste = "Chuunin";
						elseif rankstats>=151 and rankstats<271 then
							sheet.agi_teste = "Jounnin";
						elseif rankstats>=271 and rankstats<421 then
							sheet.agi_teste = "ANBU";
						else
							sheet.agi_teste = "Kage";							
						end;
					end;
				end;	
				


    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.atributos_todos);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(190);
    obj.layout21:setWidth(300);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout21);
    obj.label34:setLeft(5);
    obj.label34:setTop(5);
    obj.label34:setWidth(40);
    obj.label34:setHeight(20);
    obj.label34:setText("FOR");
    obj.label34:setName("label34");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout21);
    obj.edit28:setLeft(40);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(40);
    obj.edit28:setHeight(25);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setField("for_base");
    obj.edit28:setName("edit28");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout21);
    obj.edit29:setLeft(85);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(35);
    obj.edit29:setHeight(25);
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setField("for_multi");
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout21);
    obj.edit30:setLeft(125);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setField("for_outros");
    obj.edit30:setName("edit30");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout21);
    obj.rectangle13:setLeft(160);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("Black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout21);
    obj.label35:setLeft(160);
    obj.label35:setTop(0);
    obj.label35:setWidth(50);
    obj.label35:setHeight(25);
    obj.label35:setField("for_total");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout21);
    obj.rectangle14:setLeft(215);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(75);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("Black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout21);
    obj.label36:setLeft(215);
    obj.label36:setTop(0);
    obj.label36:setWidth(75);
    obj.label36:setHeight(25);
    obj.label36:setField("for_teste");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");


				local function FOR();
					if sheet~=nil then
						sheet.for_total =  (tonumber(sheet.for_base ) or 0) * 
												(tonumber(sheet.for_multi ) or 1) + 
												(tonumber(sheet.for_outros ) or 0);
						rankstats = sheet.for_total;
						if rankstats<16 then
							sheet.for_teste = "Acadêmico";
						elseif rankstats>=16 and rankstats<61 then
							sheet.for_teste = "Gennin";
						elseif rankstats>=61 and rankstats<151 then
							sheet.for_teste = "Chuunin";
						elseif rankstats>=151 and rankstats<271 then
							sheet.for_teste = "Jounnin";
						elseif rankstats>=271 and rankstats<421 then
							sheet.for_teste = "ANBU";
						else
							sheet.for_teste = "Kage";							
						end;
					end;
				end;	
				


    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox1);
    obj.layout22:setLeft(305);
    obj.layout22:setTop(100);
    obj.layout22:setWidth(230);
    obj.layout22:setHeight(150);
    obj.layout22:setName("layout22");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout22);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(5);
    obj.rectangle15:setYradius(5);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout22);
    obj.label37:setLeft(5);
    obj.label37:setTop(5);
    obj.label37:setWidth(220);
    obj.label37:setHeight(20);
    obj.label37:setText("STATUS");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout22);
    obj.label38:setLeft(80);
    obj.label38:setTop(25);
    obj.label38:setWidth(50);
    obj.label38:setHeight(25);
    obj.label38:setText("Base");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout22);
    obj.label39:setLeft(125);
    obj.label39:setTop(25);
    obj.label39:setWidth(50);
    obj.label39:setHeight(25);
    obj.label39:setText("Multi");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout22);
    obj.label40:setLeft(170);
    obj.label40:setTop(25);
    obj.label40:setWidth(50);
    obj.label40:setHeight(25);
    obj.label40:setText("Total");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(50);
    obj.layout23:setWidth(230);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout23);
    obj.rectangle16:setMargins({left = 5, right = 5});
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("DarkRed");
    obj.rectangle16:setOpacity(0.5);
    obj.rectangle16:setName("rectangle16");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle16);
    obj.rectangle17:setMargins({left = 75});
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setColor("White");
    obj.rectangle17:setOpacity(0.3);
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle16);
    obj.rectangle18:setMargins({left = 5});
    obj.rectangle18:setWidth(30);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setColor("White");
    obj.rectangle18:setOpacity(0.5);
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle16);
    obj.rectangle19:setMargins({left = 5});
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setColor("White");
    obj.rectangle19:setOpacity(0.3);
    obj.rectangle19:setName("rectangle19");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout23);
    obj.label41:setLeft(5);
    obj.label41:setTop(0);
    obj.label41:setWidth(75);
    obj.label41:setHeight(25);
    obj.label41:setText("Vida");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout23);
    obj.edit31:setLeft(85);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(40);
    obj.edit31:setHeight(25);
    obj.edit31:setField("vida_base");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setTransparent(true);
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout23);
    obj.edit32:setLeft(135);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setField("vida_mult");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setTransparent(true);
    obj.edit32:setName("edit32");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout23);
    obj.label42:setLeft(175);
    obj.label42:setTop(0);
    obj.label42:setWidth(40);
    obj.label42:setHeight(25);
    obj.label42:setField("vida_total");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout22);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(80);
    obj.layout24:setWidth(230);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout24);
    obj.rectangle20:setMargins({left = 5, right = 5});
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("DarkBlue");
    obj.rectangle20:setOpacity(0.5);
    obj.rectangle20:setName("rectangle20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle20);
    obj.rectangle21:setMargins({left = 75});
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setColor("White");
    obj.rectangle21:setOpacity(0.3);
    obj.rectangle21:setName("rectangle21");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle20);
    obj.rectangle22:setMargins({left = 5});
    obj.rectangle22:setWidth(30);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setColor("White");
    obj.rectangle22:setOpacity(0.5);
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle20);
    obj.rectangle23:setMargins({left = 5});
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setColor("White");
    obj.rectangle23:setOpacity(0.3);
    obj.rectangle23:setName("rectangle23");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout24);
    obj.label43:setLeft(5);
    obj.label43:setTop(0);
    obj.label43:setWidth(75);
    obj.label43:setHeight(25);
    obj.label43:setText("Chakra");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout24);
    obj.edit33:setLeft(85);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(25);
    obj.edit33:setField("cha_base");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setTransparent(true);
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout24);
    obj.edit34:setLeft(135);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setField("cha_mult");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setTransparent(true);
    obj.edit34:setName("edit34");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout24);
    obj.label44:setLeft(175);
    obj.label44:setTop(0);
    obj.label44:setWidth(40);
    obj.label44:setHeight(25);
    obj.label44:setField("cha_total");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout22);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(110);
    obj.layout25:setWidth(230);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout25);
    obj.rectangle24:setMargins({left = 5, right = 5});
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("DarkGreen");
    obj.rectangle24:setOpacity(0.5);
    obj.rectangle24:setName("rectangle24");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle24);
    obj.rectangle25:setMargins({left = 75});
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setColor("White");
    obj.rectangle25:setOpacity(0.3);
    obj.rectangle25:setName("rectangle25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle24);
    obj.rectangle26:setMargins({left = 5});
    obj.rectangle26:setWidth(30);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setColor("White");
    obj.rectangle26:setOpacity(0.5);
    obj.rectangle26:setName("rectangle26");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.rectangle24);
    obj.rectangle27:setMargins({left = 5});
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setColor("White");
    obj.rectangle27:setOpacity(0.3);
    obj.rectangle27:setName("rectangle27");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout25);
    obj.label45:setLeft(5);
    obj.label45:setTop(0);
    obj.label45:setWidth(75);
    obj.label45:setHeight(25);
    obj.label45:setText("Stamina");
    lfm_setPropAsString(obj.label45, "fontStyle",  "bold");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout25);
    obj.edit35:setLeft(85);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(40);
    obj.edit35:setHeight(25);
    obj.edit35:setField("sta_base");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setTransparent(true);
    obj.edit35:setName("edit35");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout25);
    obj.edit36:setLeft(135);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setField("sta_mult");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setTransparent(true);
    obj.edit36:setName("edit36");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout25);
    obj.label46:setLeft(175);
    obj.label46:setTop(0);
    obj.label46:setWidth(40);
    obj.label46:setHeight(25);
    obj.label46:setField("sta_total");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox1);
    obj.layout26:setLeft(305);
    obj.layout26:setTop(255);
    obj.layout26:setWidth(230);
    obj.layout26:setHeight(75);
    obj.layout26:setName("layout26");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout26);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(5);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout26);
    obj.label47:setTop(0);
    obj.label47:setWidth(220);
    obj.label47:setHeight(20);
    obj.label47:setText("Localização Atual");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.localizacao = GUI.fromHandle(_obj_newObject("edit"));
    obj.localizacao:setParent(obj.layout26);
    obj.localizacao:setName("localizacao");
    obj.localizacao:setVisible(false);
    obj.localizacao:setTop(25);
    obj.localizacao:setLeft(5);
    obj.localizacao:setWidth(220);
    obj.localizacao:setFontSize(18);
    obj.localizacao:setHeight(40);
    obj.localizacao:setHorzTextAlign("center");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox1);
    obj.layout27:setLeft(105);
    obj.layout27:setTop(335);
    obj.layout27:setWidth(430);
    obj.layout27:setHeight(100);
    obj.layout27:setName("layout27");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout27);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(5);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout27);
    obj.label48:setLeft(5);
    obj.label48:setTop(5);
    obj.label48:setWidth(430);
    obj.label48:setHeight(20);
    obj.label48:setText("Bônus dos Atributos");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.buffatt = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.buffatt:setParent(obj.layout27);
    obj.buffatt:setName("buffatt");
    obj.buffatt:setVisible(false);
    obj.buffatt:setLeft(5);
    obj.buffatt:setTop(30);
    obj.buffatt:setWidth(420);
    obj.buffatt:setHeight(60);
    obj.buffatt:setField("efeitos");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.scrollBox1);
    obj.imageCheckBox1:setLeft(0);
    obj.imageCheckBox1:setTop(335);
    obj.imageCheckBox1:setWidth(100);
    obj.imageCheckBox1:setHeight(100);
    obj.imageCheckBox1:setImageChecked("/Michiria/images/bad.jpg");
    obj.imageCheckBox1:setImageUnchecked("/Michiria/images/good.jpg");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox1);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(440);
    obj.layout28:setWidth(530);
    obj.layout28:setHeight(260);
    obj.layout28:setName("layout28");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout28);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setHeight(25);
    obj.button1:setWidth(125);
    obj.button1:setText("+ Vantagem");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout28);
    obj.button2:setLeft(130);
    obj.button2:setTop(0);
    obj.button2:setHeight(25);
    obj.button2:setWidth(125);
    obj.button2:setText("+ Desvantagem");
    obj.button2:setName("button2");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout28);
    obj.rectangle30:setLeft(0);
    obj.rectangle30:setTop(25);
    obj.rectangle30:setWidth(255);
    obj.rectangle30:setHeight(220);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.rclSelector = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector:setParent(obj.layout28);
    obj.rclSelector:setLeft(0);
    obj.rclSelector:setTop(25);
    obj.rclSelector:setWidth(255);
    obj.rclSelector:setHeight(110);
    obj.rclSelector:setName("rclSelector");
    obj.rclSelector:setField("listaDeOpcoes");
    obj.rclSelector:setTemplateForm("frmDataScopeSelectionForm");
    obj.rclSelector:setLayout("vertical");
    obj.rclSelector:setSelectable(true);

    obj.rclSelector2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector2:setParent(obj.layout28);
    obj.rclSelector2:setLeft(0);
    obj.rclSelector2:setTop(140);
    obj.rclSelector2:setWidth(255);
    obj.rclSelector2:setHeight(105);
    obj.rclSelector2:setName("rclSelector2");
    obj.rclSelector2:setField("listaDeOpcoes2");
    obj.rclSelector2:setTemplateForm("frmDataScopeSelectionForm2");
    obj.rclSelector2:setLayout("vertical");
    obj.rclSelector2:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.layout28);
    obj.boxDetalhesDoItem:setLeft(255);
    obj.boxDetalhesDoItem:setTop(25);
    obj.boxDetalhesDoItem:setWidth(280);
    obj.boxDetalhesDoItem:setHeight(220);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(true);

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.boxDetalhesDoItem);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.boxDetalhesDoItem);
    obj.edit37:setLeft(5);
    obj.edit37:setTop(5);
    obj.edit37:setWidth(265);
    obj.edit37:setHeight(25);
    obj.edit37:setField("nome");
    obj.edit37:setName("edit37");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.boxDetalhesDoItem);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(265);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("desc_vandes");
    obj.textEditor1:setName("textEditor1");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.boxDetalhesDoItem);
    obj.label49:setLeft(5);
    obj.label49:setTop(130);
    obj.label49:setWidth(265);
    obj.label49:setHeight(25);
    obj.label49:setText("Efeito");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.boxDetalhesDoItem);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(155);
    obj.textEditor2:setWidth(265);
    obj.textEditor2:setHeight(55);
    obj.textEditor2:setField("efeito_vandes");
    obj.textEditor2:setName("textEditor2");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.scrollBox1);
    obj.layout29:setLeft(540);
    obj.layout29:setTop(570);
    obj.layout29:setWidth(285);
    obj.layout29:setHeight(115);
    obj.layout29:setName("layout29");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout29);
    obj.button3:setAlign("left");
    obj.button3:setWidth(285);
    obj.button3:setFontSize(16);
    obj.button3:setText("Mostrar Dados Ocultos!");
    obj.button3:setName("button3");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.scrollBox1);
    obj.rectangle32:setLeft(540);
    obj.rectangle32:setTop(100);
    obj.rectangle32:setWidth(285);
    obj.rectangle32:setHeight(460);
    obj.rectangle32:setColor("white");
    obj.rectangle32:setXradius(5);
    obj.rectangle32:setYradius(5);
    obj.rectangle32:setCornerType("innerLine");
    obj.rectangle32:setName("rectangle32");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(540);
    obj.image1:setTop(100);
    obj.image1:setWidth(285);
    obj.image1:setHeight(460);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("proportional");
    obj.image1:setName("image1");

    obj.jutsusNINGENTAI = GUI.fromHandle(_obj_newObject("tab"));
    obj.jutsusNINGENTAI:setParent(obj.tabControl1);
    obj.jutsusNINGENTAI:setName("jutsusNINGENTAI");
    obj.jutsusNINGENTAI:setVisible(false);
    obj.jutsusNINGENTAI:setTitle("Jutsus e Clan");

    obj.frmLH2 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmLH2:setParent(obj.jutsusNINGENTAI);
    obj.frmLH2:setName("frmLH2");
    obj.frmLH2:setAlign("client");
    obj.frmLH2:setTheme("dark");


        local function selectDetalheNode(node, lista)
            if node==nil then return end

            local listas = {"rclListaDosGenjutsus", "rclListaDosNinjutsus", "rclListaDosBasicos", "rclListaDosClans", "rclListaDosKekkeis", "rclListaDosPassivos", "rclListaDosKuchyoses", "rclListaDosEstLutas", "rclListaDasTransformacoes", "rclListaDosTaijutsus", "rclListaDosEspeciais", "rclListaDosEspeciais2", "rclListaDosPassivosNobres", "rclListaDosOutros", "rclListaDosOutros2"}

            for i=1, #listas, 1 do
                if listas[i] ~= lista then
                    local rcl = self:findControlByName(listas[i]);
                    if rcl~=nil then 
                        rcl.selectedNode = nil 
                    else
                        --showMessage(listas[i] .. " was null.")
                    end
                elseif listas[i]==lista then
                    --showMessage(lista .. " was ignored.")
                end
            end               
            self.boxDetalhesDoJutsu.node = node; 
        end
    


    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmLH2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.scrollBox2);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(205);
    obj.layout30:setName("layout30");

    obj.boxDetalhesDoJutsu = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoJutsu:setParent(obj.layout30);
    obj.boxDetalhesDoJutsu:setName("boxDetalhesDoJutsu");
    obj.boxDetalhesDoJutsu:setVisible(true);
    obj.boxDetalhesDoJutsu:setAlign("left");
    obj.boxDetalhesDoJutsu:setWidth(600);

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.boxDetalhesDoJutsu);
    obj.rectangle33:setAlign("top");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setXradius(10);
    obj.rectangle33:setYradius(10);
    obj.rectangle33:setHeight(205);
    obj.rectangle33:setWidth(590);
    obj.rectangle33:setName("rectangle33");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle33);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(200);
    obj.layout31:setHeight(200);
    obj.layout31:setMargins({bottom=4, top=4, left=4, right=4});
    obj.layout31:setName("layout31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setAlign("client");
    obj.layout32:setMargins({left=2});
    obj.layout32:setName("layout32");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout32);
    obj.label50:setAlign("top");
    obj.label50:setText("Descrição");
    obj.label50:setHeight(30);
    obj.label50:setAutoSize(true);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.DescJutsu = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.DescJutsu:setParent(obj.layout32);
    obj.DescJutsu:setAlign("top");
    obj.DescJutsu:setName("DescJutsu");
    obj.DescJutsu:setField("campoTextoGrande2");
    obj.DescJutsu:setHeight(150);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout32);
    obj.button4:setAlign("top");
    obj.button4:setText("Copiar informações (Ctrl+C)");
    obj.button4:setHeight(30);
    obj.button4:setName("button4");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle33);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(380);
    obj.layout33:setName("layout33");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(30);
    obj.layout34:setMargins({bottom=4, top=4 ,right=4});
    obj.layout34:setName("layout34");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout34);
    obj.label51:setAlign("left");
    obj.label51:setText("Nome");
    obj.label51:setWidth(100);
    obj.label51:setAutoSize(true);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout34);
    obj.edit38:setAlign("client");
    obj.edit38:setField("campoJutsu");
    obj.edit38:setName("edit38");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout33);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(30);
    obj.layout35:setMargins({bottom=4, right=4});
    obj.layout35:setName("layout35");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout35);
    obj.label52:setAlign("left");
    obj.label52:setText("Gasto");
    obj.label52:setWidth(100);
    obj.label52:setAutoSize(true);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout35);
    obj.edit39:setAlign("client");
    obj.edit39:setField("campoGasto");
    obj.edit39:setName("edit39");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout33);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(30);
    obj.layout36:setMargins({bottom=4, right=4});
    obj.layout36:setName("layout36");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout36);
    obj.label53:setAlign("left");
    obj.label53:setText("Quantidade");
    obj.label53:setWidth(100);
    obj.label53:setAutoSize(true);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout36);
    obj.edit40:setAlign("client");
    obj.edit40:setField("campoQuantidade");
    obj.edit40:setName("edit40");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout33);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(30);
    obj.layout37:setMargins({bottom=4, right=4});
    obj.layout37:setName("layout37");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout37);
    obj.label54:setAlign("left");
    obj.label54:setText("Alcance");
    obj.label54:setWidth(100);
    obj.label54:setAutoSize(true);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout37);
    obj.edit41:setAlign("client");
    obj.edit41:setField("campoAlcance");
    obj.edit41:setName("edit41");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout33);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(30);
    obj.layout38:setMargins({bottom=4, right=4});
    obj.layout38:setName("layout38");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout38);
    obj.label55:setAlign("left");
    obj.label55:setText("Tempo");
    obj.label55:setWidth(100);
    obj.label55:setAutoSize(true);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout38);
    obj.edit42:setAlign("client");
    obj.edit42:setField("campoTempo");
    obj.edit42:setName("edit42");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout33);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(30);
    obj.layout39:setMargins({bottom=4, right=4});
    obj.layout39:setName("layout39");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout39);
    obj.label56:setAlign("left");
    obj.label56:setText("Dano");
    obj.label56:setWidth(100);
    obj.label56:setAutoSize(true);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout39);
    obj.edit43:setAlign("client");
    obj.edit43:setField("campoDano");
    obj.edit43:setName("edit43");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox2);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(200);
    obj.layout40:setName("layout40");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setAlign("left");
    obj.layout41:setWidth(200);
    obj.layout41:setName("layout41");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout41);
    obj.rectangle34:setAlign("left");
    obj.rectangle34:setColor("grey");
    obj.rectangle34:setWidth(200);
    obj.rectangle34:setStrokeColor("black");
    obj.rectangle34:setStrokeSize(2);
    obj.rectangle34:setName("rectangle34");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle34);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(30);
    obj.layout42:setName("layout42");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout42);
    obj.button5:setText("Adicionar Ninjutsu");
    obj.button5:setWidth(200);
    obj.button5:setAlign("client");
    obj.button5:setMargins({left=2, right=2});
    obj.button5:setName("button5");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle34);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(170);
    obj.layout43:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout43:setName("layout43");

    obj.rclListaDosNinjutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosNinjutsus:setParent(obj.layout43);
    obj.rclListaDosNinjutsus:setName("rclListaDosNinjutsus");
    obj.rclListaDosNinjutsus:setField("rclListaDosNinjutsus");
    obj.rclListaDosNinjutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosNinjutsus:setAlign("client");
    obj.rclListaDosNinjutsus:setHeight(200);
    obj.rclListaDosNinjutsus:setSelectable(true);

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(200);
    obj.layout44:setName("layout44");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout44);
    obj.rectangle35:setAlign("left");
    obj.rectangle35:setColor("grey");
    obj.rectangle35:setWidth(200);
    obj.rectangle35:setStrokeColor("black");
    obj.rectangle35:setStrokeSize(2);
    obj.rectangle35:setName("rectangle35");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle35);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(30);
    obj.layout45:setName("layout45");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout45);
    obj.button6:setText("Adicionar Genjutsu");
    obj.button6:setWidth(200);
    obj.button6:setAlign("client");
    obj.button6:setMargins({left=2, right=2});
    obj.button6:setName("button6");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle35);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(170);
    obj.layout46:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout46:setName("layout46");

    obj.rclListaDosGenjutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosGenjutsus:setParent(obj.layout46);
    obj.rclListaDosGenjutsus:setName("rclListaDosGenjutsus");
    obj.rclListaDosGenjutsus:setField("rclListaDosGenjutsus");
    obj.rclListaDosGenjutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosGenjutsus:setAlign("client");
    obj.rclListaDosGenjutsus:setHeight(200);
    obj.rclListaDosGenjutsus:setSelectable(true);

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout40);
    obj.layout47:setAlign("left");
    obj.layout47:setWidth(200);
    obj.layout47:setName("layout47");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout47);
    obj.rectangle36:setAlign("left");
    obj.rectangle36:setColor("grey");
    obj.rectangle36:setWidth(200);
    obj.rectangle36:setStrokeColor("black");
    obj.rectangle36:setStrokeSize(2);
    obj.rectangle36:setName("rectangle36");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle36);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(30);
    obj.layout48:setName("layout48");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout48);
    obj.button7:setText("Adicionar Taijutsu");
    obj.button7:setWidth(200);
    obj.button7:setAlign("client");
    obj.button7:setMargins({left=2, right=2});
    obj.button7:setName("button7");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle36);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(170);
    obj.layout49:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout49:setName("layout49");

    obj.rclListaDosTaijutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTaijutsus:setParent(obj.layout49);
    obj.rclListaDosTaijutsus:setName("rclListaDosTaijutsus");
    obj.rclListaDosTaijutsus:setField("rclListaDosTaijutsus");
    obj.rclListaDosTaijutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosTaijutsus:setAlign("client");
    obj.rclListaDosTaijutsus:setHeight(200);
    obj.rclListaDosTaijutsus:setSelectable(true);

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout40);
    obj.layout50:setAlign("left");
    obj.layout50:setWidth(200);
    obj.layout50:setName("layout50");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout50);
    obj.rectangle37:setAlign("left");
    obj.rectangle37:setColor("grey");
    obj.rectangle37:setWidth(200);
    obj.rectangle37:setStrokeColor("black");
    obj.rectangle37:setStrokeSize(2);
    obj.rectangle37:setName("rectangle37");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle37);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(30);
    obj.layout51:setName("layout51");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout51);
    obj.button8:setText("Adicionar Especial");
    obj.button8:setWidth(200);
    obj.button8:setAlign("client");
    obj.button8:setMargins({left=2, right=2});
    obj.button8:setName("button8");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.rectangle37);
    obj.layout52:setAlign("top");
    obj.layout52:setHeight(170);
    obj.layout52:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout52:setName("layout52");

    obj.rclListaDosEspeciais = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEspeciais:setParent(obj.layout52);
    obj.rclListaDosEspeciais:setName("rclListaDosEspeciais");
    obj.rclListaDosEspeciais:setField("rclListaDosEspeciais");
    obj.rclListaDosEspeciais:setTemplateForm("frmLH2_1");
    obj.rclListaDosEspeciais:setAlign("client");
    obj.rclListaDosEspeciais:setHeight(200);
    obj.rclListaDosEspeciais:setSelectable(true);

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout40);
    obj.layout53:setAlign("left");
    obj.layout53:setWidth(200);
    obj.layout53:setName("layout53");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout53);
    obj.rectangle38:setAlign("left");
    obj.rectangle38:setColor("grey");
    obj.rectangle38:setWidth(200);
    obj.rectangle38:setStrokeColor("black");
    obj.rectangle38:setStrokeSize(2);
    obj.rectangle38:setName("rectangle38");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle38);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(30);
    obj.layout54:setName("layout54");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout54);
    obj.button9:setText("Adicionar Especial 2");
    obj.button9:setWidth(200);
    obj.button9:setAlign("client");
    obj.button9:setMargins({left=2, right=2});
    obj.button9:setName("button9");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle38);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(170);
    obj.layout55:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout55:setName("layout55");

    obj.rclListaDosEspeciais2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEspeciais2:setParent(obj.layout55);
    obj.rclListaDosEspeciais2:setName("rclListaDosEspeciais2");
    obj.rclListaDosEspeciais2:setField("rclListaDosEspeciais2");
    obj.rclListaDosEspeciais2:setTemplateForm("frmLH2_1");
    obj.rclListaDosEspeciais2:setAlign("client");
    obj.rclListaDosEspeciais2:setHeight(200);
    obj.rclListaDosEspeciais2:setSelectable(true);

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox2);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(200);
    obj.layout56:setName("layout56");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout56);
    obj.layout57:setAlign("left");
    obj.layout57:setWidth(200);
    obj.layout57:setName("layout57");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout57);
    obj.rectangle39:setAlign("left");
    obj.rectangle39:setColor("grey");
    obj.rectangle39:setWidth(200);
    obj.rectangle39:setStrokeColor("black");
    obj.rectangle39:setStrokeSize(2);
    obj.rectangle39:setName("rectangle39");

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle39);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(30);
    obj.layout58:setName("layout58");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout58);
    obj.button10:setText("Adicionar Básicos");
    obj.button10:setWidth(200);
    obj.button10:setAlign("client");
    obj.button10:setMargins({left=2, right=2});
    obj.button10:setName("button10");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle39);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(170);
    obj.layout59:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout59:setName("layout59");

    obj.rclListaDosBasicos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosBasicos:setParent(obj.layout59);
    obj.rclListaDosBasicos:setName("rclListaDosBasicos");
    obj.rclListaDosBasicos:setField("rclListaDosBasicos");
    obj.rclListaDosBasicos:setTemplateForm("frmLH2_1");
    obj.rclListaDosBasicos:setAlign("client");
    obj.rclListaDosBasicos:setHeight(200);
    obj.rclListaDosBasicos:setSelectable(true);

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout56);
    obj.layout60:setAlign("left");
    obj.layout60:setWidth(200);
    obj.layout60:setName("layout60");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout60);
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setColor("grey");
    obj.rectangle40:setWidth(200);
    obj.rectangle40:setStrokeColor("black");
    obj.rectangle40:setStrokeSize(2);
    obj.rectangle40:setName("rectangle40");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle40);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(30);
    obj.layout61:setName("layout61");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout61);
    obj.button11:setText("Adicionar Jutsu do Clan");
    obj.button11:setWidth(200);
    obj.button11:setAlign("client");
    obj.button11:setMargins({left=2, right=2});
    obj.button11:setName("button11");

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.rectangle40);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(170);
    obj.layout62:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout62:setName("layout62");

    obj.rclListaDosClans = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosClans:setParent(obj.layout62);
    obj.rclListaDosClans:setName("rclListaDosClans");
    obj.rclListaDosClans:setField("rclListaDosClans");
    obj.rclListaDosClans:setTemplateForm("frmLH2_1");
    obj.rclListaDosClans:setAlign("client");
    obj.rclListaDosClans:setHeight(200);
    obj.rclListaDosClans:setSelectable(true);

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout56);
    obj.layout63:setAlign("left");
    obj.layout63:setWidth(200);
    obj.layout63:setName("layout63");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout63);
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setColor("grey");
    obj.rectangle41:setWidth(200);
    obj.rectangle41:setStrokeColor("black");
    obj.rectangle41:setStrokeSize(2);
    obj.rectangle41:setName("rectangle41");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle41);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(30);
    obj.layout64:setName("layout64");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout64);
    obj.button12:setText("Adicionar Kekkei Genkai");
    obj.button12:setWidth(200);
    obj.button12:setAlign("client");
    obj.button12:setMargins({left=2, right=2});
    obj.button12:setName("button12");

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle41);
    obj.layout65:setAlign("top");
    obj.layout65:setHeight(170);
    obj.layout65:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout65:setName("layout65");

    obj.rclListaDosKekkeis = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKekkeis:setParent(obj.layout65);
    obj.rclListaDosKekkeis:setName("rclListaDosKekkeis");
    obj.rclListaDosKekkeis:setField("rclListaDosKekkeis");
    obj.rclListaDosKekkeis:setTemplateForm("frmLH2_1");
    obj.rclListaDosKekkeis:setAlign("client");
    obj.rclListaDosKekkeis:setHeight(200);
    obj.rclListaDosKekkeis:setSelectable(true);

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout56);
    obj.layout66:setAlign("left");
    obj.layout66:setWidth(200);
    obj.layout66:setName("layout66");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout66);
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setColor("grey");
    obj.rectangle42:setWidth(200);
    obj.rectangle42:setStrokeColor("black");
    obj.rectangle42:setStrokeSize(2);
    obj.rectangle42:setName("rectangle42");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle42);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(30);
    obj.layout67:setName("layout67");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout67);
    obj.button13:setText("Adicionar Transformação");
    obj.button13:setWidth(200);
    obj.button13:setAlign("client");
    obj.button13:setMargins({left=2, right=2});
    obj.button13:setName("button13");

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle42);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(170);
    obj.layout68:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout68:setName("layout68");

    obj.rclListaDasTransformacoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTransformacoes:setParent(obj.layout68);
    obj.rclListaDasTransformacoes:setName("rclListaDasTransformacoes");
    obj.rclListaDasTransformacoes:setField("rclListaDasTransformacoes");
    obj.rclListaDasTransformacoes:setTemplateForm("frmLH2_1");
    obj.rclListaDasTransformacoes:setAlign("client");
    obj.rclListaDasTransformacoes:setHeight(200);
    obj.rclListaDasTransformacoes:setSelectable(true);

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout56);
    obj.layout69:setAlign("left");
    obj.layout69:setWidth(200);
    obj.layout69:setName("layout69");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout69);
    obj.rectangle43:setAlign("left");
    obj.rectangle43:setColor("grey");
    obj.rectangle43:setWidth(200);
    obj.rectangle43:setStrokeColor("black");
    obj.rectangle43:setStrokeSize(2);
    obj.rectangle43:setName("rectangle43");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.rectangle43);
    obj.layout70:setAlign("top");
    obj.layout70:setHeight(30);
    obj.layout70:setName("layout70");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout70);
    obj.button14:setText("Adicionar Outro");
    obj.button14:setWidth(200);
    obj.button14:setAlign("client");
    obj.button14:setMargins({left=2, right=2});
    obj.button14:setName("button14");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.rectangle43);
    obj.layout71:setAlign("top");
    obj.layout71:setHeight(170);
    obj.layout71:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout71:setName("layout71");

    obj.rclListaDosOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros:setParent(obj.layout71);
    obj.rclListaDosOutros:setName("rclListaDosOutros");
    obj.rclListaDosOutros:setField("rclListaDosOutros");
    obj.rclListaDosOutros:setTemplateForm("frmLH2_1");
    obj.rclListaDosOutros:setAlign("client");
    obj.rclListaDosOutros:setHeight(200);
    obj.rclListaDosOutros:setSelectable(true);

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.scrollBox2);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(200);
    obj.layout72:setName("layout72");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout72);
    obj.layout73:setAlign("left");
    obj.layout73:setWidth(200);
    obj.layout73:setName("layout73");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout73);
    obj.rectangle44:setAlign("left");
    obj.rectangle44:setColor("grey");
    obj.rectangle44:setWidth(200);
    obj.rectangle44:setStrokeColor("black");
    obj.rectangle44:setStrokeSize(2);
    obj.rectangle44:setName("rectangle44");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle44);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(30);
    obj.layout74:setName("layout74");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout74);
    obj.button15:setText("Adicionar Estilo de Luta");
    obj.button15:setWidth(200);
    obj.button15:setAlign("client");
    obj.button15:setMargins({left=2, right=2});
    obj.button15:setName("button15");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle44);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(170);
    obj.layout75:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout75:setName("layout75");

    obj.rclListaDosEstLutas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEstLutas:setParent(obj.layout75);
    obj.rclListaDosEstLutas:setName("rclListaDosEstLutas");
    obj.rclListaDosEstLutas:setField("rclListaDosEstLutas");
    obj.rclListaDosEstLutas:setTemplateForm("frmLH2_1");
    obj.rclListaDosEstLutas:setAlign("client");
    obj.rclListaDosEstLutas:setHeight(200);
    obj.rclListaDosEstLutas:setSelectable(true);

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout72);
    obj.layout76:setAlign("left");
    obj.layout76:setWidth(200);
    obj.layout76:setName("layout76");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout76);
    obj.rectangle45:setAlign("left");
    obj.rectangle45:setColor("grey");
    obj.rectangle45:setWidth(200);
    obj.rectangle45:setStrokeColor("black");
    obj.rectangle45:setStrokeSize(2);
    obj.rectangle45:setName("rectangle45");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.rectangle45);
    obj.layout77:setAlign("top");
    obj.layout77:setHeight(30);
    obj.layout77:setName("layout77");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout77);
    obj.button16:setText("Adicionar Kuchyose");
    obj.button16:setWidth(200);
    obj.button16:setAlign("client");
    obj.button16:setMargins({left=2, right=2});
    obj.button16:setName("button16");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle45);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(170);
    obj.layout78:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout78:setName("layout78");

    obj.rclListaDosKuchyoses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKuchyoses:setParent(obj.layout78);
    obj.rclListaDosKuchyoses:setName("rclListaDosKuchyoses");
    obj.rclListaDosKuchyoses:setField("rclListaDosKuchyoses");
    obj.rclListaDosKuchyoses:setTemplateForm("frmLH2_1");
    obj.rclListaDosKuchyoses:setAlign("client");
    obj.rclListaDosKuchyoses:setHeight(200);
    obj.rclListaDosKuchyoses:setSelectable(true);

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.layout72);
    obj.layout79:setAlign("left");
    obj.layout79:setWidth(200);
    obj.layout79:setName("layout79");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout79);
    obj.rectangle46:setAlign("left");
    obj.rectangle46:setColor("grey");
    obj.rectangle46:setWidth(200);
    obj.rectangle46:setStrokeColor("black");
    obj.rectangle46:setStrokeSize(2);
    obj.rectangle46:setName("rectangle46");

    obj.layout80 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle46);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(30);
    obj.layout80:setName("layout80");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout80);
    obj.button17:setText("Adicionar Passivas");
    obj.button17:setWidth(200);
    obj.button17:setAlign("client");
    obj.button17:setMargins({left=2, right=2});
    obj.button17:setName("button17");

    obj.layout81 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle46);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(170);
    obj.layout81:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout81:setName("layout81");

    obj.rclListaDosPassivos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosPassivos:setParent(obj.layout81);
    obj.rclListaDosPassivos:setName("rclListaDosPassivos");
    obj.rclListaDosPassivos:setField("rclListaDosPassivos");
    obj.rclListaDosPassivos:setTemplateForm("frmLH2_1");
    obj.rclListaDosPassivos:setAlign("client");
    obj.rclListaDosPassivos:setHeight(200);
    obj.rclListaDosPassivos:setSelectable(true);

    obj.layout82 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.layout72);
    obj.layout82:setAlign("left");
    obj.layout82:setWidth(200);
    obj.layout82:setName("layout82");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout82);
    obj.rectangle47:setAlign("left");
    obj.rectangle47:setColor("grey");
    obj.rectangle47:setWidth(200);
    obj.rectangle47:setStrokeColor("black");
    obj.rectangle47:setStrokeSize(2);
    obj.rectangle47:setName("rectangle47");

    obj.layout83 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle47);
    obj.layout83:setAlign("top");
    obj.layout83:setHeight(30);
    obj.layout83:setName("layout83");

    obj.button18 = GUI.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout83);
    obj.button18:setText("Adicionar Passivas Nobres");
    obj.button18:setWidth(200);
    obj.button18:setAlign("client");
    obj.button18:setMargins({left=2, right=2});
    obj.button18:setName("button18");

    obj.layout84 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle47);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(170);
    obj.layout84:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout84:setName("layout84");

    obj.rclListaDosPassivosNobres = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosPassivosNobres:setParent(obj.layout84);
    obj.rclListaDosPassivosNobres:setName("rclListaDosPassivosNobres");
    obj.rclListaDosPassivosNobres:setField("rclListaDosPassivosNobres");
    obj.rclListaDosPassivosNobres:setTemplateForm("frmLH2_1");
    obj.rclListaDosPassivosNobres:setAlign("client");
    obj.rclListaDosPassivosNobres:setHeight(200);
    obj.rclListaDosPassivosNobres:setSelectable(true);

    obj.layout85 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout72);
    obj.layout85:setAlign("left");
    obj.layout85:setWidth(200);
    obj.layout85:setName("layout85");

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout85);
    obj.rectangle48:setAlign("left");
    obj.rectangle48:setColor("grey");
    obj.rectangle48:setWidth(200);
    obj.rectangle48:setStrokeColor("black");
    obj.rectangle48:setStrokeSize(2);
    obj.rectangle48:setName("rectangle48");

    obj.layout86 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.rectangle48);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(30);
    obj.layout86:setName("layout86");

    obj.button19 = GUI.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout86);
    obj.button19:setText("Adicionar Outro 2");
    obj.button19:setWidth(200);
    obj.button19:setAlign("client");
    obj.button19:setMargins({left=2, right=2});
    obj.button19:setName("button19");

    obj.layout87 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle48);
    obj.layout87:setAlign("top");
    obj.layout87:setHeight(170);
    obj.layout87:setFrameStyle("/Michiria/frames/ninjutsu.xml");
    obj.layout87:setName("layout87");

    obj.rclListaDosOutros2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros2:setParent(obj.layout87);
    obj.rclListaDosOutros2:setName("rclListaDosOutros2");
    obj.rclListaDosOutros2:setField("rclListaDosOutros2");
    obj.rclListaDosOutros2:setTemplateForm("frmLH2_1");
    obj.rclListaDosOutros2:setAlign("client");
    obj.rclListaDosOutros2:setHeight(200);
    obj.rclListaDosOutros2:setSelectable(true);

    obj.inventario = GUI.fromHandle(_obj_newObject("tab"));
    obj.inventario:setParent(obj.tabControl1);
    obj.inventario:setName("inventario");
    obj.inventario:setVisible(false);
    obj.inventario:setTitle("Inventário");

    obj.frmLH5 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmLH5:setParent(obj.inventario);
    obj.frmLH5:setName("frmLH5");
    obj.frmLH5:setAlign("client");
    obj.frmLH5:setTheme("dark");
    obj.frmLH5:setMargins({top=1});

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmLH5);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout88 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.scrollBox3);
    obj.layout88:setLeft(0);
    obj.layout88:setTop(0);
    obj.layout88:setWidth(400);
    obj.layout88:setHeight(150);
    obj.layout88:setName("layout88");

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout88);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(5);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout88);
    obj.label57:setLeft(5);
    obj.label57:setTop(5);
    obj.label57:setWidth(95);
    obj.label57:setHeight(25);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setText("Nome");
    obj.label57:setName("label57");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout88);
    obj.edit44:setLeft(100);
    obj.edit44:setTop(5);
    obj.edit44:setWidth(295);
    obj.edit44:setHeight(25);
    obj.edit44:setField("nome_item1");
    obj.edit44:setName("edit44");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout88);
    obj.label58:setLeft(5);
    obj.label58:setTop(30);
    obj.label58:setWidth(95);
    obj.label58:setHeight(25);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setText("Quantidade");
    obj.label58:setName("label58");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout88);
    obj.edit45:setLeft(100);
    obj.edit45:setTop(30);
    obj.edit45:setWidth(205);
    obj.edit45:setHeight(25);
    obj.edit45:setField("qtd_item1");
    obj.edit45:setName("edit45");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout88);
    obj.label59:setLeft(310);
    obj.label59:setTop(30);
    obj.label59:setWidth(45);
    obj.label59:setHeight(25);
    obj.label59:setText("Preço");
    obj.label59:setName("label59");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout88);
    obj.edit46:setLeft(345);
    obj.edit46:setTop(30);
    obj.edit46:setWidth(50);
    obj.edit46:setHeight(25);
    obj.edit46:setField("preco_item1");
    obj.edit46:setName("edit46");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout88);
    obj.label60:setLeft(0);
    obj.label60:setTop(60);
    obj.label60:setWidth(400);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setText("Descrição");
    obj.label60:setName("label60");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout88);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(85);
    obj.textEditor3:setWidth(390);
    obj.textEditor3:setHeight(60);
    obj.textEditor3:setField("tag_item1");
    obj.textEditor3:setName("textEditor3");

    obj.layout89 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.scrollBox3);
    obj.layout89:setLeft(405);
    obj.layout89:setTop(0);
    obj.layout89:setWidth(400);
    obj.layout89:setHeight(150);
    obj.layout89:setName("layout89");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout89);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setXradius(5);
    obj.rectangle50:setYradius(5);
    obj.rectangle50:setCornerType("round");
    obj.rectangle50:setName("rectangle50");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout89);
    obj.label61:setLeft(5);
    obj.label61:setTop(5);
    obj.label61:setWidth(95);
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setText("Nome");
    obj.label61:setName("label61");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout89);
    obj.edit47:setLeft(100);
    obj.edit47:setTop(5);
    obj.edit47:setWidth(295);
    obj.edit47:setHeight(25);
    obj.edit47:setField("nome_item2");
    obj.edit47:setName("edit47");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout89);
    obj.label62:setLeft(5);
    obj.label62:setTop(30);
    obj.label62:setWidth(95);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setText("Quantidade");
    obj.label62:setName("label62");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout89);
    obj.edit48:setLeft(100);
    obj.edit48:setTop(30);
    obj.edit48:setWidth(205);
    obj.edit48:setHeight(25);
    obj.edit48:setField("qtd_item2");
    obj.edit48:setName("edit48");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout89);
    obj.label63:setLeft(310);
    obj.label63:setTop(30);
    obj.label63:setWidth(45);
    obj.label63:setHeight(25);
    obj.label63:setText("Preço");
    obj.label63:setName("label63");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout89);
    obj.edit49:setLeft(345);
    obj.edit49:setTop(30);
    obj.edit49:setWidth(50);
    obj.edit49:setHeight(25);
    obj.edit49:setField("preco_item2");
    obj.edit49:setName("edit49");

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout89);
    obj.label64:setLeft(0);
    obj.label64:setTop(60);
    obj.label64:setWidth(400);
    obj.label64:setHeight(25);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setText("Descrição");
    obj.label64:setName("label64");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout89);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(85);
    obj.textEditor4:setWidth(390);
    obj.textEditor4:setHeight(60);
    obj.textEditor4:setField("tag_item2");
    obj.textEditor4:setName("textEditor4");

    obj.layout90 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.scrollBox3);
    obj.layout90:setLeft(0);
    obj.layout90:setTop(155);
    obj.layout90:setWidth(805);
    obj.layout90:setHeight(550);
    obj.layout90:setName("layout90");

    obj.rectangle51 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout90);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setXradius(5);
    obj.rectangle51:setYradius(5);
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setName("rectangle51");

    obj.button20 = GUI.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout90);
    obj.button20:setText("+");
    obj.button20:setLeft(2);
    obj.button20:setTop(2);
    obj.button20:setWidth(27);
    obj.button20:setHeight(27);
    obj.button20:setName("button20");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout90);
    obj.label65:setLeft(5);
    obj.label65:setTop(0);
    obj.label65:setWidth(765);
    obj.label65:setHeight(25);
    obj.label65:setText("OUTROS");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout90);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("listaItens");
    obj.rclListaDosItens:setTemplateForm("frmLH5_1");
    obj.rclListaDosItens:setLeft(0);
    obj.rclListaDosItens:setTop(30);
    obj.rclListaDosItens:setWidth(800);
    obj.rclListaDosItens:setHeight(505);
    obj.rclListaDosItens:setLayout("vertical");
    obj.rclListaDosItens:setMinQt(1);

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Descrições");
    obj.tab2:setName("tab2");

    obj.frmLH6 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmLH6:setParent(obj.tab2);
    obj.frmLH6:setName("frmLH6");
    obj.frmLH6:setAlign("client");
    obj.frmLH6:setTheme("dark");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmLH6);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.popMeuPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup:setParent(obj.scrollBox4);
    obj.popMeuPopup:setName("popMeuPopup");
    obj.popMeuPopup:setWidth(100);
    obj.popMeuPopup:setHeight(100);
    obj.popMeuPopup:setBackOpacity(0.5);
    lfm_setPropAsString(obj.popMeuPopup, "autoScopeNode",  "false");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.popMeuPopup);
    obj.label66:setAlign("client");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setText("Você não é o mestre ou o dono da ficha!");
    obj.label66:setName("label66");

    obj.layout91 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.scrollBox4);
    obj.layout91:setLeft(0);
    obj.layout91:setTop(0);
    obj.layout91:setWidth(960);
    obj.layout91:setHeight(70);
    obj.layout91:setName("layout91");

    obj.rectangle52 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout91);
    obj.rectangle52:setLeft(5);
    obj.rectangle52:setTop(0);
    obj.rectangle52:setWidth(950);
    obj.rectangle52:setHeight(70);
    obj.rectangle52:setColor("black");
    obj.rectangle52:setXradius(15);
    obj.rectangle52:setYradius(15);
    obj.rectangle52:setCornerType("round");
    obj.rectangle52:setName("rectangle52");

    obj.layout92 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.layout91);
    obj.layout92:setLeft(5);
    obj.layout92:setTop(5);
    obj.layout92:setWidth(310);
    obj.layout92:setHeight(25);
    obj.layout92:setName("layout92");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout92);
    obj.label67:setLeft(0);
    obj.label67:setTop(5);
    obj.label67:setWidth(100);
    obj.label67:setHeight(20);
    obj.label67:setText("Sexo");
    obj.label67:setHorzTextAlign("trailing");
    obj.label67:setName("label67");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout92);
    obj.edit50:setLeft(110);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(200);
    obj.edit50:setHeight(25);
    obj.edit50:setField("desc_sexo");
    obj.edit50:setName("edit50");

    obj.layout93 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.layout91);
    obj.layout93:setLeft(320);
    obj.layout93:setTop(5);
    obj.layout93:setWidth(310);
    obj.layout93:setHeight(25);
    obj.layout93:setName("layout93");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout93);
    obj.label68:setLeft(0);
    obj.label68:setTop(5);
    obj.label68:setWidth(100);
    obj.label68:setHeight(20);
    obj.label68:setText("Altura");
    obj.label68:setHorzTextAlign("trailing");
    obj.label68:setName("label68");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout93);
    obj.edit51:setLeft(110);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(200);
    obj.edit51:setHeight(25);
    obj.edit51:setField("desc_altura");
    obj.edit51:setName("edit51");

    obj.layout94 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout91);
    obj.layout94:setLeft(585);
    obj.layout94:setTop(5);
    obj.layout94:setWidth(310);
    obj.layout94:setHeight(25);
    obj.layout94:setName("layout94");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout94);
    obj.label69:setLeft(0);
    obj.label69:setTop(5);
    obj.label69:setWidth(100);
    obj.label69:setHeight(20);
    obj.label69:setText("Olhos");
    obj.label69:setHorzTextAlign("trailing");
    obj.label69:setName("label69");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout94);
    obj.edit52:setLeft(110);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(200);
    obj.edit52:setHeight(25);
    obj.edit52:setField("desc_olhos");
    obj.edit52:setName("edit52");

    obj.layout95 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.layout91);
    obj.layout95:setLeft(5);
    obj.layout95:setTop(35);
    obj.layout95:setWidth(310);
    obj.layout95:setHeight(25);
    obj.layout95:setName("layout95");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout95);
    obj.label70:setLeft(0);
    obj.label70:setTop(5);
    obj.label70:setWidth(100);
    obj.label70:setHeight(20);
    obj.label70:setText("Idade");
    obj.label70:setHorzTextAlign("trailing");
    obj.label70:setName("label70");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout95);
    obj.edit53:setLeft(110);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(200);
    obj.edit53:setHeight(25);
    obj.edit53:setField("desc_idade");
    obj.edit53:setName("edit53");

    obj.layout96 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.layout91);
    obj.layout96:setLeft(320);
    obj.layout96:setTop(35);
    obj.layout96:setWidth(310);
    obj.layout96:setHeight(25);
    obj.layout96:setName("layout96");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout96);
    obj.label71:setLeft(0);
    obj.label71:setTop(5);
    obj.label71:setWidth(100);
    obj.label71:setHeight(20);
    obj.label71:setText("Peso");
    obj.label71:setHorzTextAlign("trailing");
    obj.label71:setName("label71");

    obj.edit54 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout96);
    obj.edit54:setLeft(110);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(200);
    obj.edit54:setHeight(25);
    obj.edit54:setField("desc_peso");
    obj.edit54:setName("edit54");

    obj.layout97 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.layout91);
    obj.layout97:setLeft(585);
    obj.layout97:setTop(35);
    obj.layout97:setWidth(310);
    obj.layout97:setHeight(25);
    obj.layout97:setName("layout97");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout97);
    obj.label72:setLeft(0);
    obj.label72:setTop(5);
    obj.label72:setWidth(100);
    obj.label72:setHeight(20);
    obj.label72:setText("Cabelo");
    obj.label72:setHorzTextAlign("trailing");
    obj.label72:setName("label72");

    obj.edit55 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout97);
    obj.edit55:setLeft(110);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(200);
    obj.edit55:setHeight(25);
    obj.edit55:setField("desc_cabelo");
    obj.edit55:setName("edit55");

    obj.layout98 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.scrollBox4);
    obj.layout98:setLeft(0);
    obj.layout98:setTop(80);
    obj.layout98:setWidth(400);
    obj.layout98:setHeight(375);
    obj.layout98:setName("layout98");

    obj.rectangle53 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout98);
    obj.rectangle53:setLeft(0);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(400);
    obj.rectangle53:setHeight(375);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(15);
    obj.rectangle53:setYradius(15);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout98);
    obj.label73:setLeft(0);
    obj.label73:setTop(0);
    obj.label73:setWidth(400);
    obj.label73:setHeight(20);
    obj.label73:setText("Aparencia");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout98);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(380);
    obj.textEditor5:setHeight(335);
    obj.textEditor5:setField("aparencia");
    obj.textEditor5:setName("textEditor5");

    obj.perso = GUI.fromHandle(_obj_newObject("layout"));
    obj.perso:setParent(obj.scrollBox4);
    obj.perso:setName("perso");
    obj.perso:setVisible(false);
    obj.perso:setLeft(0);
    obj.perso:setTop(460);
    obj.perso:setWidth(400);
    obj.perso:setHeight(355);

    obj.rectangle54 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.perso);
    obj.rectangle54:setLeft(0);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(400);
    obj.rectangle54:setHeight(355);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setXradius(15);
    obj.rectangle54:setYradius(15);
    obj.rectangle54:setCornerType("round");
    obj.rectangle54:setName("rectangle54");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.perso);
    obj.label74:setLeft(0);
    obj.label74:setTop(0);
    obj.label74:setWidth(400);
    obj.label74:setHeight(20);
    obj.label74:setText("Personalidade");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.perso);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(315);
    obj.textEditor6:setField("personalidade");
    obj.textEditor6:setName("textEditor6");

    obj.hist = GUI.fromHandle(_obj_newObject("layout"));
    obj.hist:setParent(obj.scrollBox4);
    obj.hist:setName("hist");
    obj.hist:setVisible(false);
    obj.hist:setLeft(410);
    obj.hist:setTop(80);
    obj.hist:setWidth(600);
    obj.hist:setHeight(735);

    obj.rectangle55 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.hist);
    obj.rectangle55:setLeft(0);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(600);
    obj.rectangle55:setHeight(735);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setXradius(15);
    obj.rectangle55:setYradius(15);
    obj.rectangle55:setCornerType("round");
    obj.rectangle55:setName("rectangle55");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.hist);
    obj.label75:setLeft(0);
    obj.label75:setTop(0);
    obj.label75:setWidth(600);
    obj.label75:setHeight(20);
    obj.label75:setText("Historia");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.hist);
    obj.richEdit1:setLeft(10);
    obj.richEdit1:setTop(25);
    obj.richEdit1:setWidth(580);
    obj.richEdit1:setHeight(695);
    obj.richEdit1:setField("background");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.anot = GUI.fromHandle(_obj_newObject("tab"));
    obj.anot:setParent(obj.tabControl1);
    obj.anot:setName("anot");
    obj.anot:setVisible(false);
    obj.anot:setTitle("Anotações");

    obj.frmLH7 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmLH7:setParent(obj.anot);
    obj.frmLH7:setName("frmLH7");
    obj.frmLH7:setAlign("client");
    obj.frmLH7:setTheme("dark");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmLH7);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.rclAnotacoes = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAnotacoes:setParent(obj.scrollBox5);
    obj.rclAnotacoes:setName("rclAnotacoes");
    obj.rclAnotacoes:setField("anotacoes");
    obj.rclAnotacoes:setTemplateForm("frmLH7_1");
    obj.rclAnotacoes:setLeft(5);
    obj.rclAnotacoes:setTop(0);
    obj.rclAnotacoes:setHeight(565);
    obj.rclAnotacoes:setWidth(810);
    obj.rclAnotacoes:setMinQt(1);

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Creditos");
    obj.tab3:setName("tab3");

    obj.frmLH8 = GUI.fromHandle(_obj_newObject("form"));
    obj.frmLH8:setParent(obj.tab3);
    obj.frmLH8:setName("frmLH8");
    obj.frmLH8:setAlign("client");
    obj.frmLH8:setTheme("dark");


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
    obj.scrollBox6:setParent(obj.frmLH8);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox6);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(500);
    obj.image2:setHeight(250);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox6);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(350);
    obj.image3:setHeight(350);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Michiria/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout99 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.scrollBox6);
    obj.layout99:setLeft(360);
    obj.layout99:setTop(0);
    obj.layout99:setWidth(200);
    obj.layout99:setHeight(275);
    obj.layout99:setName("layout99");

    obj.rectangle56 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout99);
    obj.rectangle56:setAlign("client");
    obj.rectangle56:setColor("black");
    obj.rectangle56:setXradius(15);
    obj.rectangle56:setYradius(15);
    obj.rectangle56:setCornerType("round");
    obj.rectangle56:setName("rectangle56");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout99);
    obj.label76:setLeft(0);
    obj.label76:setTop(10);
    obj.label76:setWidth(200);
    obj.label76:setHeight(20);
    obj.label76:setText("Obrigado aos autores originais:");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout99);
    obj.label77:setLeft(0);
    obj.label77:setTop(35);
    obj.label77:setWidth(200);
    obj.label77:setHeight(20);
    obj.label77:setText("Programador: Vinny (Ambesek)");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout99);
    obj.label78:setLeft(0);
    obj.label78:setTop(60);
    obj.label78:setWidth(200);
    obj.label78:setHeight(20);
    obj.label78:setText("Arte: Nefer (Nefertyne)");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout99);
    obj.label79:setLeft(0);
    obj.label79:setTop(85);
    obj.label79:setWidth(200);
    obj.label79:setHeight(20);
    obj.label79:setText("Consultor: Vinny (hellblackjack)");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout99);
    obj.label80:setLeft(0);
    obj.label80:setTop(120);
    obj.label80:setWidth(200);
    obj.label80:setHeight(20);
    obj.label80:setText("Ficha modificada por:");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = GUI.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout99);
    obj.label81:setLeft(0);
    obj.label81:setTop(145);
    obj.label81:setWidth(200);
    obj.label81:setHeight(20);
    obj.label81:setText("HashBR - Túlio");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.label82 = GUI.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout99);
    obj.label82:setLeft(0);
    obj.label82:setTop(170);
    obj.label82:setWidth(200);
    obj.label82:setHeight(20);
    obj.label82:setText("Desenho: Átilla Gallio");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.label83 = GUI.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout99);
    obj.label83:setLeft(0);
    obj.label83:setTop(220);
    obj.label83:setWidth(200);
    obj.label83:setHeight(20);
    obj.label83:setText("Ficha re-modificada por:");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.label84 = GUI.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout99);
    obj.label84:setLeft(0);
    obj.label84:setTop(245);
    obj.label84:setWidth(200);
    obj.label84:setHeight(20);
    obj.label84:setText("Vinny (Ambesek)");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.layout100 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.scrollBox6);
    obj.layout100:setLeft(570);
    obj.layout100:setTop(0);
    obj.layout100:setWidth(200);
    obj.layout100:setHeight(150);
    obj.layout100:setName("layout100");

    obj.rectangle57 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout100);
    obj.rectangle57:setLeft(0);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(200);
    obj.rectangle57:setHeight(150);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setName("rectangle57");

    obj.label85 = GUI.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout100);
    obj.label85:setLeft(0);
    obj.label85:setTop(10);
    obj.label85:setWidth(80);
    obj.label85:setHeight(20);
    obj.label85:setText("Tema:");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout100);
    obj.comboBox1:setLeft(95);
    obj.comboBox1:setTop(10);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setField("theme");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setItems({'Escuro', 'Claro'});
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setName("comboBox1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout100);
    obj.dataLink1:setField("theme");
    obj.dataLink1:setDefaultValue("Escuro");
    obj.dataLink1:setName("dataLink1");

    obj.label86 = GUI.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout100);
    obj.label86:setLeft(0);
    obj.label86:setTop(35);
    obj.label86:setWidth(90);
    obj.label86:setHeight(20);
    obj.label86:setText("Cores: ");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.label87 = GUI.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout100);
    obj.label87:setLeft(0);
    obj.label87:setTop(60);
    obj.label87:setWidth(90);
    obj.label87:setHeight(20);
    obj.label87:setText("Fundo ");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout100);
    obj.comboBox2:setLeft(95);
    obj.comboBox2:setTop(60);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setField("colorBackground");
    obj.comboBox2:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox2:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout100);
    obj.dataLink2:setField("colorBackground");
    obj.dataLink2:setDefaultValue("#000000");
    obj.dataLink2:setName("dataLink2");

    obj.label88 = GUI.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout100);
    obj.label88:setLeft(0);
    obj.label88:setTop(85);
    obj.label88:setWidth(90);
    obj.label88:setHeight(20);
    obj.label88:setText("Linhas ");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout100);
    obj.comboBox3:setLeft(95);
    obj.comboBox3:setTop(85);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setField("colorStroke");
    obj.comboBox3:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox3:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout100);
    obj.dataLink3:setField("colorStroke");
    obj.dataLink3:setDefaultValue("#FFFFFF");
    obj.dataLink3:setName("dataLink3");

    obj.label89 = GUI.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout100);
    obj.label89:setLeft(0);
    obj.label89:setTop(110);
    obj.label89:setWidth(90);
    obj.label89:setHeight(20);
    obj.label89:setText("Fonte ");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout100);
    obj.comboBox4:setLeft(95);
    obj.comboBox4:setTop(110);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setField("colorFont");
    obj.comboBox4:setItems({'AliceBlue', 'AntiqueWhite', 'Aqua', 'Aquamarine', 'Azure', 'Beige', 'Bisque', 'Black', 'BlanchedAlmond', 'Blue', 'BlueViolet', 'Brown', 'BurlyWood', 'CadetBlue', 'Chartreuse', 'Chocolate', 'Coral', 'CornflowerBlue', 'Cornsilk', 'Crimson', 'Cyan', 'DarkBlue', 'DarkCyan', 'DarkGoldenRod', 'DarkGray', 'DarkGreen', 'DarkKhaki', 'DarkMagenta', 'DarkOliveGreen', 'DarkOrange', 'DarkOrchid', 'DarkRed', 'DarkSalmon', 'DarkSeaGreen', 'DarkSlateBlue', 'DarkSlateGray', 'DarkTurquoise', 'DarkViolet', 'DeepPink', 'DeepSkyBlue', 'DimGray', 'DodgerBlue', 'FireBrick', 'FloralWhite', 'ForestGreen', 'Fuchsia', 'Gainsboro', 'GhostWhite', 'Gold', 'GoldenRod', 'Gray', 'Green', 'GreenYellow', 'HoneyDew', 'HotPink', 'IndianRed ', 'Indigo ', 'Ivory', 'Khaki', 'Lavender', 'LavenderBlush', 'LawnGreen', 'LemonChiffon', 'LightBlue', 'LightCoral', 'LightCyan', 'LightGoldenRodYellow', 'LightGray', 'LightGreen', 'LightPink', 'LightSalmon', 'LightSeaGreen', 'LightSkyBlue', 'LightSlateGray', 'LightSteelBlue', 'LightYellow', 'Lime', 'LimeGreen', 'Linen', 'Magenta', 'Maroon', 'MediumAquaMarine', 'MediumBlue', 'MediumOrchid', 'MediumPurple', 'MediumSeaGreen', 'MediumSlateBlue', 'MediumSpringGreen', 'MediumTurquoise', 'MediumVioletRed', 'MidnightBlue', 'MintCream', 'MistyRose', 'Moccasin', 'NavajoWhite', 'Navy', 'OldLace', 'Olive', 'OliveDrab', 'Orange', 'OrangeRed', 'Orchid', 'PaleGoldenRod', 'PaleGreen', 'PaleTurquoise', 'PaleVioletRed', 'PapayaWhip', 'PeachPuff', 'Peru', 'Pink', 'Plum', 'PowderBlue', 'Purple', 'RebeccaPurple', 'Red', 'RosyBrown', 'RoyalBlue', 'SaddleBrown', 'Salmon', 'SandyBrown', 'SeaGreen', 'SeaShell', 'Sienna', 'Silver', 'SkyBlue', 'SlateBlue', 'SlateGray', 'Snow', 'SpringGreen', 'SteelBlue', 'Tan', 'Teal', 'Thistle', 'Tomato', 'Turquoise', 'Violet', 'Wheat', 'White', 'WhiteSmoke', 'Yellow', 'YellowGreen'});
    obj.comboBox4:setValues({'#F0F8FF', '#FAEBD7', '#00FFFF', '#7FFFD4', '#F0FFFF', '#F5F5DC', '#FFE4C4', '#000000', '#FFEBCD', '#0000FF', '#8A2BE2', '#A52A2A', '#DEB887', '#5F9EA0', '#7FFF00', '#D2691E', '#FF7F50', '#6495ED', '#FFF8DC', '#DC143C', '#00FFFF', '#00008B', '#008B8B', '#B8860B', '#A9A9A9', '#006400', '#BDB76B', '#8B008B', '#556B2F', '#FF8C00', '#9932CC', '#8B0000', '#E9967A', '#8FBC8F', '#483D8B', '#2F4F4F', '#00CED1', '#9400D3', '#FF1493', '#00BFFF', '#696969', '#1E90FF', '#B22222', '#FFFAF0', '#228B22', '#FF00FF', '#DCDCDC', '#F8F8FF', '#FFD700', '#DAA520', '#808080', '#008000', '#ADFF2F', '#F0FFF0', '#FF69B4', '#CD5C5C', '#4B0082', '#FFFFF0', '#F0E68C', '#E6E6FA', '#FFF0F5', '#7CFC00', '#FFFACD', '#ADD8E6', '#F08080', '#E0FFFF', '#FAFAD2', '#D3D3D3', '#90EE90', '#FFB6C1', '#FFA07A', '#20B2AA', '#87CEFA', '#778899', '#B0C4DE', '#FFFFE0', '#00FF00', '#32CD32', '#FAF0E6', '#FF00FF', '#800000', '#66CDAA', '#0000CD', '#BA55D3', '#9370DB', '#3CB371', '#7B68EE', '#00FA9A', '#48D1CC', '#C71585', '#191970', '#F5FFFA', '#FFE4E1', '#FFE4B5', '#FFDEAD', '#000080', '#FDF5E6', '#808000', '#6B8E23', '#FFA500', '#FF4500', '#DA70D6', '#EEE8AA', '#98FB98', '#AFEEEE', '#DB7093', '#FFEFD5', '#FFDAB9', '#CD853F', '#FFC0CB', '#DDA0DD', '#B0E0E6', '#800080', '#663399', '#FF0000', '#BC8F8F', '#4169E1', '#8B4513', '#FA8072', '#F4A460', '#2E8B57', '#FFF5EE', '#A0522D', '#C0C0C0', '#87CEEB', '#6A5ACD', '#708090', '#FFFAFA', '#00FF7F', '#4682B4', '#D2B48C', '#008080', '#D8BFD8', '#FF6347', '#40E0D0', '#EE82EE', '#F5DEB3', '#FFFFFF', '#F5F5F5', '#FFFF00', '#9ACD32'});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout100);
    obj.dataLink4:setField("colorFont");
    obj.dataLink4:setDefaultValue("#FFFFFF");
    obj.dataLink4:setName("dataLink4");

    obj.label90 = GUI.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.scrollBox6);
    obj.label90:setLeft(570);
    obj.label90:setTop(175);
    obj.label90:setWidth(200);
    obj.label90:setHeight(20);
    obj.label90:setText("Versão Atual: ");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setField("versionInstalled");
    obj.label90:setName("label90");

    obj.label91 = GUI.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.scrollBox6);
    obj.label91:setLeft(570);
    obj.label91:setTop(200);
    obj.label91:setWidth(200);
    obj.label91:setHeight(20);
    obj.label91:setText("Sua Versão: ");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setField("versionDownloaded");
    obj.label91:setName("label91");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox6);
    obj.checkBox1:setLeft(570);
    obj.checkBox1:setTop(225);
    obj.checkBox1:setWidth(200);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("noUpdate");
    obj.checkBox1:setText("Não pedir para atualizar.");
    obj.checkBox1:setName("checkBox1");

    obj.button21 = GUI.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.scrollBox6);
    obj.button21:setLeft(570);
    obj.button21:setTop(250);
    obj.button21:setWidth(100);
    obj.button21:setText("Atualizar");
    obj.button21:setName("button21");

    obj.button22 = GUI.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.scrollBox6);
    obj.button22:setLeft(570);
    obj.button22:setTop(300);
    obj.button22:setWidth(100);
    obj.button22:setHeight(20);
    obj.button22:setText("Exportar Ficha");
    obj.button22:setName("button22");

    obj.button23 = GUI.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.scrollBox6);
    obj.button23:setLeft(570);
    obj.button23:setTop(325);
    obj.button23:setWidth(100);
    obj.button23:setHeight(20);
    obj.button23:setText("Importar Ficha");
    obj.button23:setName("button23");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            Internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Michiria/output/Michiria.rpk?raw=true",
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
                                            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Michiria/output/Michiria.rpk?raw=true');
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

    obj._e_event1 = obj.edit13:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event2 = obj.edit14:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event3 = obj.edit15:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event4 = obj.edit16:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event5 = obj.edit17:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event6 = obj.edit18:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event7 = obj.edit19:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event8 = obj.edit20:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event9 = obj.edit21:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event10 = obj.edit22:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event11 = obj.edit23:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event12 = obj.edit24:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event13 = obj.edit25:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event14 = obj.edit26:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event15 = obj.edit27:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event16 = obj.edit28:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event17 = obj.edit29:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event18 = obj.edit30:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event19 = obj.edit31:addEventListener("onChange",
        function (_)
            vida_status();
        end, obj);

    obj._e_event20 = obj.edit32:addEventListener("onChange",
        function (_)
            vida_status();
        end, obj);

    obj._e_event21 = obj.edit33:addEventListener("onChange",
        function (_)
            cha_status();
        end, obj);

    obj._e_event22 = obj.edit34:addEventListener("onChange",
        function (_)
            cha_status();
        end, obj);

    obj._e_event23 = obj.edit35:addEventListener("onChange",
        function (_)
            sta_status();
        end, obj);

    obj._e_event24 = obj.edit36:addEventListener("onChange",
        function (_)
            sta_status();
        end, obj);

    obj._e_event25 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclSelector:append();
        end, obj);

    obj._e_event26 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclSelector2:append();
        end, obj);

    obj._e_event27 = obj.rclSelector:addEventListener("onSelect",
        function (_)
            local node = self.rclSelector.selectedNode;
            						self.rclSelector2.selectedNode = nil;
            						self.boxDetalhesDoItem.node = node;
        end, obj);

    obj._e_event28 = obj.rclSelector2:addEventListener("onSelect",
        function (_)
            local node = self.rclSelector2.selectedNode;
            						self.rclSelector.selectedNode = nil;
            						self.boxDetalhesDoItem.node = node;
        end, obj);

    obj._e_event29 = obj.button3:addEventListener("onClick",
        function (_)
            local mesa = rrpg.getMesaDe(sheet);
            						if (mesa.meuJogador.isMestre or mesa.meuJogador.login == sheet.desc_loginDono) then
            							self.inventario.visible = true;
            							self.atributos_todos.visible = true;
            							self.jutsusNINGENTAI.visible = true;
            							--self.jutsusOUTROS.visible = true;
            							--self.basicoclan.visible = true;
            							self.perso.visible = true;
            							self.hist.visible = true;
            							self.localizacao.visible = true;
            							self.anot.visible = true;
            							self.buffatt.visible = true;
            						else
            							self.inventario.visible = false;
            							self.atributos_todos.visible = false;
            							self.jutsusNINGENTAI.visible = false;
            							--self.jutsusOUTROS.visible = false;
            							--self.basicoclan.visible = false;
            							self.perso.visible = false;
            							self.hist.visible = false;
            							self.localizacao.visible = false;
            							self.anot.visible = false;
            							self.buffatt.visible = false;					
            							self.popMeuPopup:show('bottom', self.descricoes);
            						end;
        end, obj);

    obj._e_event30 = obj.button4:addEventListener("onClick",
        function (_)
            require("system.lua");
                                                jutsu = (self.boxDetalhesDoJutsu.node.campoJutsu or "--//--");
                                                desc = (self.boxDetalhesDoJutsu.node.campoTextoGrande2 or "--//--");
                                                gasto = (self.boxDetalhesDoJutsu.node.campoGasto or "--//--");
                                                quant = (self.boxDetalhesDoJutsu.node.campoQuantidade or "--//--");
                                                alcan = (self.boxDetalhesDoJutsu.node.CampoAlcance or "--//--");
                                                tempo = (self.boxDetalhesDoJutsu.node.CampoTempo or "--//--");
                                                dano = (self.boxDetalhesDoJutsu.node.CampoDano or "--//--");
                                                System.setClipboardText("Nome: " .. jutsu .. "\n"
                                                                     .. "Descrição: " .. desc .. "\n"
                                                                     .. "Gasto: " .. gasto .. "\n"
                                                                     .. "Quantidade: " .. quant .. "\n"
                                                                     .. "Alcance: " .. alcan .. "\n"
                                                                     .. "Tempo: " .. tempo .. "\n"
                                                                     .. "Dano: " .. dano);
        end, obj);

    obj._e_event31 = obj.button5:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosNinjutsus:append();
                                        if item~=nil then item.campoJutsu = "Ninjutsu" end
        end, obj);

    obj._e_event32 = obj.rclListaDosNinjutsus:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosNinjutsus.selectedNode, "rclListaDosNinjutsus")
        end, obj);

    obj._e_event33 = obj.button6:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosGenjutsus:append();
                                        if item~=nil then item.campoJutsu = "Genjutsu" end
        end, obj);

    obj._e_event34 = obj.rclListaDosGenjutsus:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosGenjutsus.selectedNode, "rclListaDosGenjutsus")
        end, obj);

    obj._e_event35 = obj.button7:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosTaijutsus:append();
                                        if item~=nil then item.campoJutsu = "Taijutsu" end
        end, obj);

    obj._e_event36 = obj.rclListaDosTaijutsus:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosTaijutsus.selectedNode, "rclListaDosTaijutsus")
        end, obj);

    obj._e_event37 = obj.button8:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosEspeciais:append();
                                        if item~=nil then item.campoJutsu = "Especial" end
        end, obj);

    obj._e_event38 = obj.rclListaDosEspeciais:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosEspeciais.selectedNode, "rclListaDosEspeciais")
        end, obj);

    obj._e_event39 = obj.button9:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosEspeciais2:append();
                                        if item~=nil then item.campoJutsu = "Especial 2" end
        end, obj);

    obj._e_event40 = obj.rclListaDosEspeciais2:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosEspeciais2.selectedNode, "rclListaDosEspeciais2")
        end, obj);

    obj._e_event41 = obj.button10:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosBasicos:append();
                                        if item~=nil then item.campoJutsu = "Básicos" end
        end, obj);

    obj._e_event42 = obj.rclListaDosBasicos:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosBasicos.selectedNode, "rclListaDosBasicos")
        end, obj);

    obj._e_event43 = obj.button11:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosClans:append();
                                        if item~=nil then item.campoJutsu = "Jutsu do Clan" end
        end, obj);

    obj._e_event44 = obj.rclListaDosClans:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosClans.selectedNode, "rclListaDosClans")
        end, obj);

    obj._e_event45 = obj.button12:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosKekkeis:append();
                                        if item~=nil then item.campoJutsu = "Kekkei Genkai" end
        end, obj);

    obj._e_event46 = obj.rclListaDosKekkeis:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosKekkeis.selectedNode, "rclListaDosKekkeis")
        end, obj);

    obj._e_event47 = obj.button13:addEventListener("onClick",
        function (_)
            local item = self.rclListaDasTransformacoes:append();
                                        if item~=nil then item.campoJutsu = "Transformação" end
        end, obj);

    obj._e_event48 = obj.rclListaDasTransformacoes:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDasTransformacoes.selectedNode, "rclListaDasTransformacoes")
        end, obj);

    obj._e_event49 = obj.button14:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosOutros:append();
                                        if item~=nil then item.campoJutsu = "Outro" end
        end, obj);

    obj._e_event50 = obj.rclListaDosOutros:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosOutros.selectedNode, "rclListaDosOutros")
        end, obj);

    obj._e_event51 = obj.button15:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosEstLutas:append();
                                        if item~=nil then item.campoJutsu = "Estilo de Luta" end
        end, obj);

    obj._e_event52 = obj.rclListaDosEstLutas:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosEstLutas.selectedNode, "rclListaDosEstLutas")
        end, obj);

    obj._e_event53 = obj.button16:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosKuchyoses:append();
                                        if item~=nil then item.campoJutsu = "Kuchyose" end
        end, obj);

    obj._e_event54 = obj.rclListaDosKuchyoses:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosKuchyoses.selectedNode, "rclListaDosKuchyoses")
        end, obj);

    obj._e_event55 = obj.button17:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosPassivos:append();
                                        if item~=nil then item.campoJutsu = "Passivas" end
        end, obj);

    obj._e_event56 = obj.rclListaDosPassivos:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosPassivos.selectedNode, "rclListaDosPassivos")
        end, obj);

    obj._e_event57 = obj.button18:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosPassivosNobres:append();
                                        if item~=nil then item.campoJutsu = "Passivas Nobres" end
        end, obj);

    obj._e_event58 = obj.rclListaDosPassivosNobres:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosPassivosNobres.selectedNode, "rclListaDosPassivosNobres")
        end, obj);

    obj._e_event59 = obj.button19:addEventListener("onClick",
        function (_)
            local item = self.rclListaDosOutros2:append();
                                        if item~=nil then item.campoJutsu = "Outro 2" end
        end, obj);

    obj._e_event60 = obj.rclListaDosOutros2:addEventListener("onSelect",
        function (_)
            selectDetalheNode(self.rclListaDosOutros2.selectedNode, "rclListaDosOutros2")
        end, obj);

    obj._e_event61 = obj.button20:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event62 = obj.dataLink1:addEventListener("onChange",
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

    obj._e_event63 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local color = sheet.colorBackground or "#000000";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].color = color;
            					end;
        end, obj);

    obj._e_event64 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            					local strokeColor = sheet.colorStroke or "#FFFFFF";
            
            		            local rectangles = findClass("rectangle");
            
            					for i=1, #rectangles, 1 do 
            						rectangles[i].strokeColor = strokeColor;
            					end;
        end, obj);

    obj._e_event65 = obj.dataLink4:addEventListener("onChange",
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

    obj._e_event66 = obj.button21:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Michiria/output/Michiria.rpk?raw=true')
        end, obj);

    obj._e_event67 = obj.button22:addEventListener("onClick",
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

    obj._e_event68 = obj.button23:addEventListener("onClick",
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
        if self.rclListaDosClans ~= nil then self.rclListaDosClans:destroy(); self.rclListaDosClans = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.frmLH2 ~= nil then self.frmLH2:destroy(); self.frmLH2 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.localizacao ~= nil then self.localizacao:destroy(); self.localizacao = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rclListaDosGenjutsus ~= nil then self.rclListaDosGenjutsus:destroy(); self.rclListaDosGenjutsus = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.inventario ~= nil then self.inventario:destroy(); self.inventario = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rclSelector2 ~= nil then self.rclSelector2:destroy(); self.rclSelector2 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout88 ~= nil then self.layout88:destroy(); self.layout88 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.rclListaDosNinjutsus ~= nil then self.rclListaDosNinjutsus:destroy(); self.rclListaDosNinjutsus = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rclListaDosTaijutsus ~= nil then self.rclListaDosTaijutsus:destroy(); self.rclListaDosTaijutsus = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rclListaDosEstLutas ~= nil then self.rclListaDosEstLutas:destroy(); self.rclListaDosEstLutas = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.layout90 ~= nil then self.layout90:destroy(); self.layout90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.frmLH5 ~= nil then self.frmLH5:destroy(); self.frmLH5 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
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
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rclListaDosEspeciais2 ~= nil then self.rclListaDosEspeciais2:destroy(); self.rclListaDosEspeciais2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.frmLH6 ~= nil then self.frmLH6:destroy(); self.frmLH6 = nil; end;
        if self.boxDetalhesDoJutsu ~= nil then self.boxDetalhesDoJutsu:destroy(); self.boxDetalhesDoJutsu = nil; end;
        if self.hist ~= nil then self.hist:destroy(); self.hist = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.atributos_todos ~= nil then self.atributos_todos:destroy(); self.atributos_todos = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.popMeuPopup ~= nil then self.popMeuPopup:destroy(); self.popMeuPopup = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclListaDosPassivos ~= nil then self.rclListaDosPassivos:destroy(); self.rclListaDosPassivos = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.buffatt ~= nil then self.buffatt:destroy(); self.buffatt = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.frmLH7 ~= nil then self.frmLH7:destroy(); self.frmLH7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.rclListaDosKekkeis ~= nil then self.rclListaDosKekkeis:destroy(); self.rclListaDosKekkeis = nil; end;
        if self.jutsusNINGENTAI ~= nil then self.jutsusNINGENTAI:destroy(); self.jutsusNINGENTAI = nil; end;
        if self.rclListaDosBasicos ~= nil then self.rclListaDosBasicos:destroy(); self.rclListaDosBasicos = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.layout82 ~= nil then self.layout82:destroy(); self.layout82 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.DescJutsu ~= nil then self.DescJutsu:destroy(); self.DescJutsu = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.perso ~= nil then self.perso:destroy(); self.perso = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.anot ~= nil then self.anot:destroy(); self.anot = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rclListaDosOutros2 ~= nil then self.rclListaDosOutros2:destroy(); self.rclListaDosOutros2 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rclListaDosEspeciais ~= nil then self.rclListaDosEspeciais:destroy(); self.rclListaDosEspeciais = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.frmLH1 ~= nil then self.frmLH1:destroy(); self.frmLH1 = nil; end;
        if self.frmLH8 ~= nil then self.frmLH8:destroy(); self.frmLH8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.rclListaDosOutros ~= nil then self.rclListaDosOutros:destroy(); self.rclListaDosOutros = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.rclListaDosPassivosNobres ~= nil then self.rclListaDosPassivosNobres:destroy(); self.rclListaDosPassivosNobres = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.rclListaDasTransformacoes ~= nil then self.rclListaDasTransformacoes:destroy(); self.rclListaDasTransformacoes = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.rclListaDosKuchyoses ~= nil then self.rclListaDosKuchyoses:destroy(); self.rclListaDosKuchyoses = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.rclAnotacoes ~= nil then self.rclAnotacoes:destroy(); self.rclAnotacoes = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaMichiria()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaMichiria();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaMichiria = {
    newEditor = newfrmFichaMichiria, 
    new = newfrmFichaMichiria, 
    name = "frmFichaMichiria", 
    dataType = "Ambesek.Michiria", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Michiria", 
    description=""};

frmFichaMichiria = _frmFichaMichiria;
Firecast.registrarForm(_frmFichaMichiria);
Firecast.registrarDataType(_frmFichaMichiria);

return _frmFichaMichiria;
