require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaKH()
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
    obj:setName("frmFichaKH");
    obj:setFormType("sheetTemplate");
    obj:setDataType("HashBR.KH");
    obj:setTitle("Konoha Heroes 2.2");
    obj:setAlign("client");
    obj:setTheme("dark");

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
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(200);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(90);
    obj.label4:setHeight(20);
    obj.label4:setText("Vila de Origem");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(100);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(25);
    obj.edit4:setField("desc_vila_origem");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(210);
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
    obj.label5:setText("Vila Atual");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(100);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setField("desc_vila_atual");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(420);
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
    obj.label6:setText("Especialização");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setLeft(100);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("desc_especializacao");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(65);
    obj.layout8:setWidth(200);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(90);
    obj.label7:setHeight(20);
    obj.label7:setText("Dinheiro");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setLeft(100);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(100);
    obj.edit7:setHeight(25);
    obj.edit7:setField("desc_dinheiro");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(210);
    obj.layout9:setTop(65);
    obj.layout9:setWidth(200);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(90);
    obj.label8:setHeight(20);
    obj.label8:setText("Elemento I");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setLeft(100);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(25);
    obj.edit8:setField("desc_Elemento Principal");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(420);
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
    obj.label9:setText("Elemento II");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setLeft(100);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(100);
    obj.edit9:setHeight(25);
    obj.edit9:setField("desc_Elemento Secundario");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(615);
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
    obj.label10:setText("loginDono");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setLeft(100);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(100);
    obj.edit10:setHeight(25);
    obj.edit10:setField("desc_loginDono");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.scrollBox1);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(100);
    obj.layout12:setWidth(300);
    obj.layout12:setHeight(230);
    obj.layout12:setName("layout12");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout12);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout12);
    obj.label11:setLeft(5);
    obj.label11:setTop(5);
    obj.label11:setWidth(290);
    obj.label11:setHeight(20);
    obj.label11:setText("ATRIBUTOS");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.atributos_todos = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributos_todos:setParent(obj.layout12);
    obj.atributos_todos:setLeft(5);
    obj.atributos_todos:setTop(0);
    obj.atributos_todos:setWidth(300);
    obj.atributos_todos:setHeight(215);
    obj.atributos_todos:setName("atributos_todos");
    obj.atributos_todos:setVisible(false);

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.atributos_todos);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(30);
    obj.layout13:setWidth(300);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout13);
    obj.label12:setLeft(50);
    obj.label12:setTop(0);
    obj.label12:setWidth(35);
    obj.label12:setHeight(25);
    obj.label12:setText("Base");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout13);
    obj.label13:setLeft(90);
    obj.label13:setTop(0);
    obj.label13:setWidth(35);
    obj.label13:setHeight(25);
    obj.label13:setText("Multi");
    obj.label13:setFontSize(11);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout13);
    obj.label14:setLeft(130);
    obj.label14:setTop(0);
    obj.label14:setWidth(35);
    obj.label14:setHeight(25);
    obj.label14:setText("Extra");
    obj.label14:setFontSize(11);
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout13);
    obj.label15:setLeft(175);
    obj.label15:setTop(0);
    obj.label15:setWidth(35);
    obj.label15:setHeight(25);
    obj.label15:setText("Total");
    obj.label15:setFontSize(10);
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout13);
    obj.label16:setLeft(235);
    obj.label16:setTop(0);
    obj.label16:setWidth(35);
    obj.label16:setHeight(25);
    obj.label16:setText("Rank");
    obj.label16:setFontSize(13);
    obj.label16:setName("label16");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.atributos_todos);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(55);
    obj.layout14:setWidth(300);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout14);
    obj.label17:setLeft(5);
    obj.label17:setTop(5);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setText("VDS");
    obj.label17:setName("label17");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout14);
    obj.edit11:setLeft(40);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(25);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setField("vds_base");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout14);
    obj.edit12:setLeft(85);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(35);
    obj.edit12:setHeight(25);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setField("vds_multi");
    obj.edit12:setName("edit12");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout14);
    obj.edit13:setLeft(125);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setField("vds_outros");
    obj.edit13:setName("edit13");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout14);
    obj.rectangle3:setLeft(160);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout14);
    obj.label18:setLeft(160);
    obj.label18:setTop(0);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setField("vds_total");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout14);
    obj.rectangle4:setLeft(215);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(75);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setLeft(215);
    obj.label19:setTop(0);
    obj.label19:setWidth(75);
    obj.label19:setHeight(25);
    obj.label19:setField("vds_teste");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");


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
				


    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.atributos_todos);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(80);
    obj.layout15:setWidth(300);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout15);
    obj.label20:setLeft(5);
    obj.label20:setTop(5);
    obj.label20:setWidth(40);
    obj.label20:setHeight(20);
    obj.label20:setText("AFE");
    obj.label20:setName("label20");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout15);
    obj.edit14:setLeft(40);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setField("afe_base");
    obj.edit14:setName("edit14");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout15);
    obj.edit15:setLeft(85);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(35);
    obj.edit15:setHeight(25);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setField("afe_multi");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout15);
    obj.edit16:setLeft(125);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setField("afe_outros");
    obj.edit16:setName("edit16");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout15);
    obj.rectangle5:setLeft(160);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout15);
    obj.label21:setLeft(160);
    obj.label21:setTop(0);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setField("afe_total");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout15);
    obj.rectangle6:setLeft(215);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(75);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout15);
    obj.label22:setLeft(215);
    obj.label22:setTop(0);
    obj.label22:setWidth(75);
    obj.label22:setHeight(25);
    obj.label22:setField("afe_teste");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");


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
				


    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.atributos_todos);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(110);
    obj.layout16:setWidth(300);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout16);
    obj.label23:setLeft(5);
    obj.label23:setTop(5);
    obj.label23:setWidth(40);
    obj.label23:setHeight(20);
    obj.label23:setText("INT");
    obj.label23:setName("label23");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout16);
    obj.edit17:setLeft(40);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(25);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setField("int_base");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout16);
    obj.edit18:setLeft(85);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(35);
    obj.edit18:setHeight(25);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setField("int_multi");
    obj.edit18:setName("edit18");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout16);
    obj.edit19:setLeft(125);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setField("int_outros");
    obj.edit19:setName("edit19");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout16);
    obj.rectangle7:setLeft(160);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("Black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout16);
    obj.label24:setLeft(160);
    obj.label24:setTop(0);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setField("int_total");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout16);
    obj.rectangle8:setLeft(215);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(75);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("Black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout16);
    obj.label25:setLeft(215);
    obj.label25:setTop(0);
    obj.label25:setWidth(75);
    obj.label25:setHeight(25);
    obj.label25:setField("int_teste");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");


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
				


    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.atributos_todos);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(135);
    obj.layout17:setWidth(300);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout17);
    obj.label26:setLeft(5);
    obj.label26:setTop(5);
    obj.label26:setWidth(40);
    obj.label26:setHeight(20);
    obj.label26:setText("CCH");
    obj.label26:setName("label26");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout17);
    obj.edit20:setLeft(40);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("cch_base");
    obj.edit20:setName("edit20");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout17);
    obj.edit21:setLeft(85);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(35);
    obj.edit21:setHeight(25);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setField("cch_multi");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout17);
    obj.edit22:setLeft(125);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setField("cch_outros");
    obj.edit22:setName("edit22");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout17);
    obj.rectangle9:setLeft(160);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("Black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout17);
    obj.label27:setLeft(160);
    obj.label27:setTop(0);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setField("cch_total");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout17);
    obj.rectangle10:setLeft(215);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(75);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("Black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout17);
    obj.label28:setLeft(215);
    obj.label28:setTop(0);
    obj.label28:setWidth(75);
    obj.label28:setHeight(25);
    obj.label28:setField("cch_teste");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");


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
				


    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.atributos_todos);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(165);
    obj.layout18:setWidth(300);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout18);
    obj.label29:setLeft(5);
    obj.label29:setTop(5);
    obj.label29:setWidth(40);
    obj.label29:setHeight(20);
    obj.label29:setText("AGI");
    obj.label29:setName("label29");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout18);
    obj.edit23:setLeft(40);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(25);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setField("agi_base");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout18);
    obj.edit24:setLeft(85);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(35);
    obj.edit24:setHeight(25);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setField("agi_multi");
    obj.edit24:setName("edit24");

    obj.edit25 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout18);
    obj.edit25:setLeft(125);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setField("agi_outros");
    obj.edit25:setName("edit25");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout18);
    obj.rectangle11:setLeft(160);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("Black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout18);
    obj.label30:setLeft(160);
    obj.label30:setTop(0);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setField("agi_total");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout18);
    obj.rectangle12:setLeft(215);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(75);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout18);
    obj.label31:setLeft(215);
    obj.label31:setTop(0);
    obj.label31:setWidth(75);
    obj.label31:setHeight(25);
    obj.label31:setField("agi_teste");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");


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
				


    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.atributos_todos);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(190);
    obj.layout19:setWidth(300);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout19);
    obj.label32:setLeft(5);
    obj.label32:setTop(5);
    obj.label32:setWidth(40);
    obj.label32:setHeight(20);
    obj.label32:setText("FOR");
    obj.label32:setName("label32");

    obj.edit26 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout19);
    obj.edit26:setLeft(40);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(40);
    obj.edit26:setHeight(25);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setField("for_base");
    obj.edit26:setName("edit26");

    obj.edit27 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout19);
    obj.edit27:setLeft(85);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(35);
    obj.edit27:setHeight(25);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setField("for_multi");
    obj.edit27:setName("edit27");

    obj.edit28 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout19);
    obj.edit28:setLeft(125);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setField("for_outros");
    obj.edit28:setName("edit28");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout19);
    obj.rectangle13:setLeft(160);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("Black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout19);
    obj.label33:setLeft(160);
    obj.label33:setTop(0);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setField("for_total");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout19);
    obj.rectangle14:setLeft(215);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(75);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("Black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout19);
    obj.label34:setLeft(215);
    obj.label34:setTop(0);
    obj.label34:setWidth(75);
    obj.label34:setHeight(25);
    obj.label34:setField("for_teste");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");


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
				


    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.scrollBox1);
    obj.layout20:setLeft(305);
    obj.layout20:setTop(100);
    obj.layout20:setWidth(230);
    obj.layout20:setHeight(150);
    obj.layout20:setName("layout20");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout20);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(5);
    obj.rectangle15:setYradius(5);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout20);
    obj.label35:setLeft(5);
    obj.label35:setTop(5);
    obj.label35:setWidth(220);
    obj.label35:setHeight(20);
    obj.label35:setText("STATUS");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout20);
    obj.label36:setLeft(80);
    obj.label36:setTop(25);
    obj.label36:setWidth(50);
    obj.label36:setHeight(25);
    obj.label36:setText("Base");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout20);
    obj.label37:setLeft(125);
    obj.label37:setTop(25);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setText("Multi");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout20);
    obj.label38:setLeft(170);
    obj.label38:setTop(25);
    obj.label38:setWidth(50);
    obj.label38:setHeight(25);
    obj.label38:setText("Total");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout20);
    obj.layout21:setLeft(0);
    obj.layout21:setTop(50);
    obj.layout21:setWidth(230);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout21);
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

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout21);
    obj.label39:setLeft(5);
    obj.label39:setTop(0);
    obj.label39:setWidth(75);
    obj.label39:setHeight(25);
    obj.label39:setText("Vida");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit29 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout21);
    obj.edit29:setLeft(85);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(40);
    obj.edit29:setHeight(25);
    obj.edit29:setField("vida_base");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setTransparent(true);
    obj.edit29:setName("edit29");

    obj.edit30 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout21);
    obj.edit30:setLeft(135);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setField("vida_mult");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setTransparent(true);
    obj.edit30:setName("edit30");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout21);
    obj.label40:setLeft(175);
    obj.label40:setTop(0);
    obj.label40:setWidth(40);
    obj.label40:setHeight(25);
    obj.label40:setField("vida_total");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout20);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(80);
    obj.layout22:setWidth(230);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout22);
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

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout22);
    obj.label41:setLeft(5);
    obj.label41:setTop(0);
    obj.label41:setWidth(75);
    obj.label41:setHeight(25);
    obj.label41:setText("Chakra");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit31 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout22);
    obj.edit31:setLeft(85);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(40);
    obj.edit31:setHeight(25);
    obj.edit31:setField("cha_base");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setTransparent(true);
    obj.edit31:setName("edit31");

    obj.edit32 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout22);
    obj.edit32:setLeft(135);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setField("cha_mult");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setTransparent(true);
    obj.edit32:setName("edit32");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout22);
    obj.label42:setLeft(175);
    obj.label42:setTop(0);
    obj.label42:setWidth(40);
    obj.label42:setHeight(25);
    obj.label42:setField("cha_total");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout20);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(110);
    obj.layout23:setWidth(230);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout23);
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

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout23);
    obj.label43:setLeft(5);
    obj.label43:setTop(0);
    obj.label43:setWidth(75);
    obj.label43:setHeight(25);
    obj.label43:setText("Stamina");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit33 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout23);
    obj.edit33:setLeft(85);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(25);
    obj.edit33:setField("sta_base");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setTransparent(true);
    obj.edit33:setName("edit33");

    obj.edit34 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout23);
    obj.edit34:setLeft(135);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setField("sta_mult");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setTransparent(true);
    obj.edit34:setName("edit34");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout23);
    obj.label44:setLeft(175);
    obj.label44:setTop(0);
    obj.label44:setWidth(40);
    obj.label44:setHeight(25);
    obj.label44:setField("sta_total");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox1);
    obj.layout24:setLeft(305);
    obj.layout24:setTop(255);
    obj.layout24:setWidth(230);
    obj.layout24:setHeight(75);
    obj.layout24:setName("layout24");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout24);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(5);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout24);
    obj.label45:setTop(0);
    obj.label45:setWidth(220);
    obj.label45:setHeight(20);
    obj.label45:setText("Localização Atual");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.localizacao = GUI.fromHandle(_obj_newObject("edit"));
    obj.localizacao:setParent(obj.layout24);
    obj.localizacao:setName("localizacao");
    obj.localizacao:setVisible(false);
    obj.localizacao:setTop(25);
    obj.localizacao:setLeft(5);
    obj.localizacao:setWidth(220);
    obj.localizacao:setFontSize(18);
    obj.localizacao:setHeight(40);
    obj.localizacao:setHorzTextAlign("center");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox1);
    obj.layout25:setLeft(105);
    obj.layout25:setTop(335);
    obj.layout25:setWidth(430);
    obj.layout25:setHeight(100);
    obj.layout25:setName("layout25");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout25);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(5);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout25);
    obj.label46:setLeft(5);
    obj.label46:setTop(5);
    obj.label46:setWidth(430);
    obj.label46:setHeight(20);
    obj.label46:setText("Bônus dos Atributos");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.buffatt = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.buffatt:setParent(obj.layout25);
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
    obj.imageCheckBox1:setImageChecked("/Ficha LH/images/bad.jpg");
    obj.imageCheckBox1:setImageUnchecked("/Ficha LH/images/good.jpg");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox1);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(440);
    obj.layout26:setWidth(530);
    obj.layout26:setHeight(260);
    obj.layout26:setName("layout26");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout26);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setHeight(25);
    obj.button1:setWidth(125);
    obj.button1:setText("+ Vantagem");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout26);
    obj.button2:setLeft(130);
    obj.button2:setTop(0);
    obj.button2:setHeight(25);
    obj.button2:setWidth(125);
    obj.button2:setText("+ Desvantagem");
    obj.button2:setName("button2");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout26);
    obj.rectangle30:setLeft(0);
    obj.rectangle30:setTop(25);
    obj.rectangle30:setWidth(255);
    obj.rectangle30:setHeight(220);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.rclSelector = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector:setParent(obj.layout26);
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
    obj.rclSelector2:setParent(obj.layout26);
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
    obj.boxDetalhesDoItem:setParent(obj.layout26);
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

    obj.edit35 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.boxDetalhesDoItem);
    obj.edit35:setLeft(5);
    obj.edit35:setTop(5);
    obj.edit35:setWidth(265);
    obj.edit35:setHeight(25);
    obj.edit35:setField("nome");
    obj.edit35:setName("edit35");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.boxDetalhesDoItem);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(265);
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setField("desc_vandes");
    obj.textEditor1:setName("textEditor1");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.boxDetalhesDoItem);
    obj.label47:setLeft(5);
    obj.label47:setTop(130);
    obj.label47:setWidth(265);
    obj.label47:setHeight(25);
    obj.label47:setText("Efeito");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.boxDetalhesDoItem);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(155);
    obj.textEditor2:setWidth(265);
    obj.textEditor2:setHeight(55);
    obj.textEditor2:setField("efeito_vandes");
    obj.textEditor2:setName("textEditor2");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox1);
    obj.layout27:setLeft(540);
    obj.layout27:setTop(570);
    obj.layout27:setWidth(285);
    obj.layout27:setHeight(115);
    obj.layout27:setName("layout27");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout27);
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

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmLH2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.scrollBox2);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(205);
    obj.layout28:setName("layout28");

    obj.boxDetalhesDoJutsu = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoJutsu:setParent(obj.layout28);
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

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle33);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(200);
    obj.layout29:setHeight(200);
    obj.layout29:setMargins({bottom=4, top=4, left=4, right=4});
    obj.layout29:setName("layout29");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout29);
    obj.layout30:setAlign("client");
    obj.layout30:setMargins({left=2});
    obj.layout30:setName("layout30");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout30);
    obj.label48:setAlign("top");
    obj.label48:setText("Descrição");
    obj.label48:setHeight(30);
    obj.label48:setAutoSize(true);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.DescJutsu = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.DescJutsu:setParent(obj.layout30);
    obj.DescJutsu:setAlign("top");
    obj.DescJutsu:setName("DescJutsu");
    obj.DescJutsu:setField("campoTextoGrande2");
    obj.DescJutsu:setHeight(150);

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout30);
    obj.button4:setAlign("top");
    obj.button4:setText("Copiar informações (Ctrl+C)");
    obj.button4:setHeight(30);
    obj.button4:setName("button4");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle33);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(380);
    obj.layout31:setName("layout31");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout31);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(30);
    obj.layout32:setMargins({bottom=4, top=4 ,right=4});
    obj.layout32:setName("layout32");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout32);
    obj.label49:setAlign("left");
    obj.label49:setText("Nome");
    obj.label49:setWidth(100);
    obj.label49:setAutoSize(true);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit36 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout32);
    obj.edit36:setAlign("client");
    obj.edit36:setField("campoJutsu");
    obj.edit36:setName("edit36");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout31);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(30);
    obj.layout33:setMargins({bottom=4, right=4});
    obj.layout33:setName("layout33");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout33);
    obj.label50:setAlign("left");
    obj.label50:setText("Gasto");
    obj.label50:setWidth(100);
    obj.label50:setAutoSize(true);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit37 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout33);
    obj.edit37:setAlign("client");
    obj.edit37:setField("campoGasto");
    obj.edit37:setName("edit37");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout31);
    obj.layout34:setAlign("top");
    obj.layout34:setHeight(30);
    obj.layout34:setMargins({bottom=4, right=4});
    obj.layout34:setName("layout34");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout34);
    obj.label51:setAlign("left");
    obj.label51:setText("Quantidade");
    obj.label51:setWidth(100);
    obj.label51:setAutoSize(true);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit38 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout34);
    obj.edit38:setAlign("client");
    obj.edit38:setField("campoQuantidade");
    obj.edit38:setName("edit38");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout31);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(30);
    obj.layout35:setMargins({bottom=4, right=4});
    obj.layout35:setName("layout35");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout35);
    obj.label52:setAlign("left");
    obj.label52:setText("Alcance");
    obj.label52:setWidth(100);
    obj.label52:setAutoSize(true);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit39 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout35);
    obj.edit39:setAlign("client");
    obj.edit39:setField("campoAlcance");
    obj.edit39:setName("edit39");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout31);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(30);
    obj.layout36:setMargins({bottom=4, right=4});
    obj.layout36:setName("layout36");

    obj.label53 = GUI.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout36);
    obj.label53:setAlign("left");
    obj.label53:setText("Tempo");
    obj.label53:setWidth(100);
    obj.label53:setAutoSize(true);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit40 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout36);
    obj.edit40:setAlign("client");
    obj.edit40:setField("campoTempo");
    obj.edit40:setName("edit40");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout31);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(30);
    obj.layout37:setMargins({bottom=4, right=4});
    obj.layout37:setName("layout37");

    obj.label54 = GUI.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout37);
    obj.label54:setAlign("left");
    obj.label54:setText("Dano");
    obj.label54:setWidth(100);
    obj.label54:setAutoSize(true);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit41 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout37);
    obj.edit41:setAlign("client");
    obj.edit41:setField("campoDano");
    obj.edit41:setName("edit41");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox2);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(200);
    obj.layout38:setName("layout38");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(200);
    obj.layout39:setName("layout39");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout39);
    obj.rectangle34:setAlign("left");
    obj.rectangle34:setColor("grey");
    obj.rectangle34:setWidth(200);
    obj.rectangle34:setStrokeColor("black");
    obj.rectangle34:setStrokeSize(2);
    obj.rectangle34:setName("rectangle34");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle34);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(30);
    obj.layout40:setName("layout40");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout40);
    obj.button5:setText("Adicionar Ninjutsu");
    obj.button5:setWidth(200);
    obj.button5:setAlign("client");
    obj.button5:setMargins({left=2, right=2});
    obj.button5:setName("button5");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle34);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(170);
    obj.layout41:setFrameStyle("/Ficha LH/frames/ninjutsu.xml");
    obj.layout41:setName("layout41");

    obj.rclListaDosNinjutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosNinjutsus:setParent(obj.layout41);
    obj.rclListaDosNinjutsus:setName("rclListaDosNinjutsus");
    obj.rclListaDosNinjutsus:setField("campoDosNinjutsus");
    obj.rclListaDosNinjutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosNinjutsus:setAlign("client");
    obj.rclListaDosNinjutsus:setHeight(200);
    obj.rclListaDosNinjutsus:setSelectable(true);

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout38);
    obj.layout42:setAlign("left");
    obj.layout42:setWidth(200);
    obj.layout42:setName("layout42");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout42);
    obj.rectangle35:setAlign("left");
    obj.rectangle35:setColor("grey");
    obj.rectangle35:setWidth(200);
    obj.rectangle35:setStrokeColor("black");
    obj.rectangle35:setStrokeSize(2);
    obj.rectangle35:setName("rectangle35");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.rectangle35);
    obj.layout43:setAlign("top");
    obj.layout43:setHeight(30);
    obj.layout43:setName("layout43");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout43);
    obj.button6:setText("Adicionar Genjutsu");
    obj.button6:setWidth(200);
    obj.button6:setAlign("client");
    obj.button6:setMargins({left=2, right=2});
    obj.button6:setName("button6");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.rectangle35);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(170);
    obj.layout44:setFrameStyle("/Ficha LH/frames/genjutsu.xml");
    obj.layout44:setName("layout44");

    obj.rclListaDosGenjutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosGenjutsus:setParent(obj.layout44);
    obj.rclListaDosGenjutsus:setName("rclListaDosGenjutsus");
    obj.rclListaDosGenjutsus:setField("campoDosGenjutsus");
    obj.rclListaDosGenjutsus:setTemplateForm("frmLH2_2");
    obj.rclListaDosGenjutsus:setAlign("client");
    obj.rclListaDosGenjutsus:setHeight(200);
    obj.rclListaDosGenjutsus:setSelectable(true);

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout38);
    obj.layout45:setAlign("left");
    obj.layout45:setWidth(200);
    obj.layout45:setName("layout45");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout45);
    obj.rectangle36:setAlign("left");
    obj.rectangle36:setColor("grey");
    obj.rectangle36:setWidth(200);
    obj.rectangle36:setStrokeColor("black");
    obj.rectangle36:setStrokeSize(2);
    obj.rectangle36:setName("rectangle36");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle36);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(30);
    obj.layout46:setName("layout46");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout46);
    obj.button7:setText("Adicionar Taijutsu");
    obj.button7:setWidth(200);
    obj.button7:setAlign("client");
    obj.button7:setMargins({left=2, right=2});
    obj.button7:setName("button7");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle36);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(170);
    obj.layout47:setFrameStyle("/Ficha LH/frames/taijutsu.xml");
    obj.layout47:setName("layout47");

    obj.rclListaDosTaijutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTaijutsus:setParent(obj.layout47);
    obj.rclListaDosTaijutsus:setName("rclListaDosTaijutsus");
    obj.rclListaDosTaijutsus:setField("campoDosTaijutsus");
    obj.rclListaDosTaijutsus:setTemplateForm("frmLH2_3");
    obj.rclListaDosTaijutsus:setAlign("client");
    obj.rclListaDosTaijutsus:setHeight(300);
    obj.rclListaDosTaijutsus:setSelectable(true);

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.scrollBox2);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(200);
    obj.layout48:setName("layout48");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout48);
    obj.layout49:setAlign("left");
    obj.layout49:setWidth(200);
    obj.layout49:setName("layout49");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout49);
    obj.rectangle37:setAlign("left");
    obj.rectangle37:setColor("grey");
    obj.rectangle37:setWidth(200);
    obj.rectangle37:setStrokeColor("black");
    obj.rectangle37:setStrokeSize(2);
    obj.rectangle37:setName("rectangle37");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle37);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(30);
    obj.layout50:setName("layout50");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout50);
    obj.button8:setText("Adicionar Básicos");
    obj.button8:setWidth(200);
    obj.button8:setAlign("client");
    obj.button8:setMargins({left=2, right=2});
    obj.button8:setName("button8");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle37);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(170);
    obj.layout51:setFrameStyle("/Ficha LH/frames/basicos.xml");
    obj.layout51:setName("layout51");

    obj.rclListaDosBasicos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosBasicos:setParent(obj.layout51);
    obj.rclListaDosBasicos:setName("rclListaDosBasicos");
    obj.rclListaDosBasicos:setField("campoDosBasicos");
    obj.rclListaDosBasicos:setTemplateForm("frmLH3_1");
    obj.rclListaDosBasicos:setAlign("client");
    obj.rclListaDosBasicos:setHeight(200);
    obj.rclListaDosBasicos:setSelectable(true);

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout48);
    obj.layout52:setAlign("left");
    obj.layout52:setWidth(200);
    obj.layout52:setName("layout52");

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout52);
    obj.rectangle38:setAlign("left");
    obj.rectangle38:setColor("grey");
    obj.rectangle38:setWidth(200);
    obj.rectangle38:setStrokeColor("black");
    obj.rectangle38:setStrokeSize(2);
    obj.rectangle38:setName("rectangle38");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.rectangle38);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(30);
    obj.layout53:setName("layout53");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout53);
    obj.button9:setText("Adicionar Jutsu do Clan");
    obj.button9:setWidth(200);
    obj.button9:setAlign("client");
    obj.button9:setMargins({left=2, right=2});
    obj.button9:setName("button9");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle38);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(170);
    obj.layout54:setFrameStyle("/Ficha LH/frames/jutsuclan.xml");
    obj.layout54:setName("layout54");

    obj.rclListaDosClans = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosClans:setParent(obj.layout54);
    obj.rclListaDosClans:setName("rclListaDosClans");
    obj.rclListaDosClans:setField("campoDosClans");
    obj.rclListaDosClans:setTemplateForm("frmLH3_2");
    obj.rclListaDosClans:setAlign("client");
    obj.rclListaDosClans:setHeight(200);
    obj.rclListaDosClans:setSelectable(true);

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout48);
    obj.layout55:setAlign("left");
    obj.layout55:setWidth(200);
    obj.layout55:setName("layout55");

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout55);
    obj.rectangle39:setAlign("left");
    obj.rectangle39:setColor("grey");
    obj.rectangle39:setWidth(200);
    obj.rectangle39:setStrokeColor("black");
    obj.rectangle39:setStrokeSize(2);
    obj.rectangle39:setName("rectangle39");

    obj.layout56 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle39);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(30);
    obj.layout56:setName("layout56");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout56);
    obj.button10:setText("Adicionar Kekkei Genkai");
    obj.button10:setWidth(200);
    obj.button10:setAlign("client");
    obj.button10:setMargins({left=2, right=2});
    obj.button10:setName("button10");

    obj.layout57 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle39);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(170);
    obj.layout57:setFrameStyle("/Ficha LH/frames/kekkei.xml");
    obj.layout57:setName("layout57");

    obj.rclListaDosKekkeis = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKekkeis:setParent(obj.layout57);
    obj.rclListaDosKekkeis:setName("rclListaDosKekkeis");
    obj.rclListaDosKekkeis:setField("campoDosKekkeis");
    obj.rclListaDosKekkeis:setTemplateForm("frmLH3_3");
    obj.rclListaDosKekkeis:setAlign("client");
    obj.rclListaDosKekkeis:setHeight(300);
    obj.rclListaDosKekkeis:setSelectable(true);

    obj.layout58 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.scrollBox2);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(200);
    obj.layout58:setName("layout58");

    obj.layout59 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout58);
    obj.layout59:setAlign("left");
    obj.layout59:setWidth(200);
    obj.layout59:setName("layout59");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout59);
    obj.rectangle40:setAlign("left");
    obj.rectangle40:setColor("grey");
    obj.rectangle40:setWidth(200);
    obj.rectangle40:setStrokeColor("black");
    obj.rectangle40:setStrokeSize(2);
    obj.rectangle40:setName("rectangle40");

    obj.layout60 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle40);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(30);
    obj.layout60:setName("layout60");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout60);
    obj.button11:setText("Adicionar Kenjutu");
    obj.button11:setWidth(200);
    obj.button11:setAlign("client");
    obj.button11:setMargins({left=2, right=2});
    obj.button11:setName("button11");

    obj.layout61 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.rectangle40);
    obj.layout61:setAlign("top");
    obj.layout61:setHeight(170);
    obj.layout61:setFrameStyle("/Ficha LH/frames/kenjutsu.xml");
    obj.layout61:setName("layout61");

    obj.rclListaDosKenjutsus = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKenjutsus:setParent(obj.layout61);
    obj.rclListaDosKenjutsus:setName("rclListaDosKenjutsus");
    obj.rclListaDosKenjutsus:setField("campoDosKenjutsus");
    obj.rclListaDosKenjutsus:setTemplateForm("frmLH4_1");
    obj.rclListaDosKenjutsus:setAlign("client");
    obj.rclListaDosKenjutsus:setHeight(200);
    obj.rclListaDosKenjutsus:setSelectable(true);

    obj.layout62 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout58);
    obj.layout62:setAlign("left");
    obj.layout62:setWidth(200);
    obj.layout62:setName("layout62");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout62);
    obj.rectangle41:setAlign("left");
    obj.rectangle41:setColor("grey");
    obj.rectangle41:setWidth(200);
    obj.rectangle41:setStrokeColor("black");
    obj.rectangle41:setStrokeSize(2);
    obj.rectangle41:setName("rectangle41");

    obj.layout63 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle41);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(30);
    obj.layout63:setName("layout63");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout63);
    obj.button12:setText("Adicionar Kuchyose");
    obj.button12:setWidth(200);
    obj.button12:setAlign("client");
    obj.button12:setMargins({left=2, right=2});
    obj.button12:setName("button12");

    obj.layout64 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle41);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(170);
    obj.layout64:setFrameStyle("/Ficha LH/frames/kuchyose.xml");
    obj.layout64:setName("layout64");

    obj.rclListaDosKuchyoses = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKuchyoses:setParent(obj.layout64);
    obj.rclListaDosKuchyoses:setName("rclListaDosKuchyoses");
    obj.rclListaDosKuchyoses:setField("campoDosKuchyoses");
    obj.rclListaDosKuchyoses:setTemplateForm("frmLH4_2");
    obj.rclListaDosKuchyoses:setAlign("client");
    obj.rclListaDosKuchyoses:setHeight(200);
    obj.rclListaDosKuchyoses:setSelectable(true);

    obj.layout65 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout58);
    obj.layout65:setAlign("left");
    obj.layout65:setWidth(200);
    obj.layout65:setName("layout65");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout65);
    obj.rectangle42:setAlign("left");
    obj.rectangle42:setColor("grey");
    obj.rectangle42:setWidth(200);
    obj.rectangle42:setStrokeColor("black");
    obj.rectangle42:setStrokeSize(2);
    obj.rectangle42:setName("rectangle42");

    obj.layout66 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle42);
    obj.layout66:setAlign("top");
    obj.layout66:setHeight(30);
    obj.layout66:setName("layout66");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout66);
    obj.button13:setText("Adicionar Estilo de Luta");
    obj.button13:setWidth(200);
    obj.button13:setAlign("client");
    obj.button13:setMargins({left=2, right=2});
    obj.button13:setName("button13");

    obj.layout67 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle42);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(170);
    obj.layout67:setFrameStyle("/Ficha LH/frames/estilo.xml");
    obj.layout67:setName("layout67");

    obj.rclListaDosEstLutas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEstLutas:setParent(obj.layout67);
    obj.rclListaDosEstLutas:setName("rclListaDosEstLutas");
    obj.rclListaDosEstLutas:setField("campoDosEstLutas");
    obj.rclListaDosEstLutas:setTemplateForm("frmLH4_3");
    obj.rclListaDosEstLutas:setAlign("client");
    obj.rclListaDosEstLutas:setHeight(300);
    obj.rclListaDosEstLutas:setSelectable(true);

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

    obj.layout68 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.scrollBox3);
    obj.layout68:setLeft(0);
    obj.layout68:setTop(0);
    obj.layout68:setWidth(400);
    obj.layout68:setHeight(150);
    obj.layout68:setName("layout68");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout68);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("black");
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(5);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.label55 = GUI.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout68);
    obj.label55:setLeft(5);
    obj.label55:setTop(5);
    obj.label55:setWidth(95);
    obj.label55:setHeight(25);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setText("Nome");
    obj.label55:setName("label55");

    obj.edit42 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout68);
    obj.edit42:setLeft(100);
    obj.edit42:setTop(5);
    obj.edit42:setWidth(295);
    obj.edit42:setHeight(25);
    obj.edit42:setField("nome_item1");
    obj.edit42:setName("edit42");

    obj.label56 = GUI.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout68);
    obj.label56:setLeft(5);
    obj.label56:setTop(30);
    obj.label56:setWidth(95);
    obj.label56:setHeight(25);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setText("Quantidade");
    obj.label56:setName("label56");

    obj.edit43 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout68);
    obj.edit43:setLeft(100);
    obj.edit43:setTop(30);
    obj.edit43:setWidth(205);
    obj.edit43:setHeight(25);
    obj.edit43:setField("qtd_item1");
    obj.edit43:setName("edit43");

    obj.label57 = GUI.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout68);
    obj.label57:setLeft(310);
    obj.label57:setTop(30);
    obj.label57:setWidth(45);
    obj.label57:setHeight(25);
    obj.label57:setText("Preço");
    obj.label57:setName("label57");

    obj.edit44 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout68);
    obj.edit44:setLeft(345);
    obj.edit44:setTop(30);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setField("preco_item1");
    obj.edit44:setName("edit44");

    obj.label58 = GUI.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout68);
    obj.label58:setLeft(0);
    obj.label58:setTop(60);
    obj.label58:setWidth(400);
    obj.label58:setHeight(25);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setText("Descrição");
    obj.label58:setName("label58");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout68);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(85);
    obj.textEditor3:setWidth(390);
    obj.textEditor3:setHeight(60);
    obj.textEditor3:setField("tag_item1");
    obj.textEditor3:setName("textEditor3");

    obj.layout69 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.scrollBox3);
    obj.layout69:setLeft(405);
    obj.layout69:setTop(0);
    obj.layout69:setWidth(400);
    obj.layout69:setHeight(150);
    obj.layout69:setName("layout69");

    obj.rectangle44 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout69);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(5);
    obj.rectangle44:setYradius(5);
    obj.rectangle44:setCornerType("round");
    obj.rectangle44:setName("rectangle44");

    obj.label59 = GUI.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout69);
    obj.label59:setLeft(5);
    obj.label59:setTop(5);
    obj.label59:setWidth(95);
    obj.label59:setHeight(25);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setText("Nome");
    obj.label59:setName("label59");

    obj.edit45 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout69);
    obj.edit45:setLeft(100);
    obj.edit45:setTop(5);
    obj.edit45:setWidth(295);
    obj.edit45:setHeight(25);
    obj.edit45:setField("nome_item2");
    obj.edit45:setName("edit45");

    obj.label60 = GUI.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout69);
    obj.label60:setLeft(5);
    obj.label60:setTop(30);
    obj.label60:setWidth(95);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setText("Quantidade");
    obj.label60:setName("label60");

    obj.edit46 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout69);
    obj.edit46:setLeft(100);
    obj.edit46:setTop(30);
    obj.edit46:setWidth(205);
    obj.edit46:setHeight(25);
    obj.edit46:setField("qtd_item2");
    obj.edit46:setName("edit46");

    obj.label61 = GUI.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout69);
    obj.label61:setLeft(310);
    obj.label61:setTop(30);
    obj.label61:setWidth(45);
    obj.label61:setHeight(25);
    obj.label61:setText("Preço");
    obj.label61:setName("label61");

    obj.edit47 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout69);
    obj.edit47:setLeft(345);
    obj.edit47:setTop(30);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(25);
    obj.edit47:setField("preco_item2");
    obj.edit47:setName("edit47");

    obj.label62 = GUI.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout69);
    obj.label62:setLeft(0);
    obj.label62:setTop(60);
    obj.label62:setWidth(400);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setText("Descrição");
    obj.label62:setName("label62");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout69);
    obj.textEditor4:setLeft(5);
    obj.textEditor4:setTop(85);
    obj.textEditor4:setWidth(390);
    obj.textEditor4:setHeight(60);
    obj.textEditor4:setField("tag_item2");
    obj.textEditor4:setName("textEditor4");

    obj.layout70 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.scrollBox3);
    obj.layout70:setLeft(0);
    obj.layout70:setTop(155);
    obj.layout70:setWidth(805);
    obj.layout70:setHeight(550);
    obj.layout70:setName("layout70");

    obj.rectangle45 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout70);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setXradius(5);
    obj.rectangle45:setYradius(5);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout70);
    obj.button14:setText("+");
    obj.button14:setLeft(2);
    obj.button14:setTop(2);
    obj.button14:setWidth(27);
    obj.button14:setHeight(27);
    obj.button14:setName("button14");

    obj.label63 = GUI.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout70);
    obj.label63:setLeft(5);
    obj.label63:setTop(0);
    obj.label63:setWidth(765);
    obj.label63:setHeight(25);
    obj.label63:setText("OUTROS");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout70);
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

    obj.label64 = GUI.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.popMeuPopup);
    obj.label64:setAlign("client");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setText("Você não é o mestre ou o dono da ficha!");
    obj.label64:setName("label64");

    obj.layout71 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.scrollBox4);
    obj.layout71:setLeft(0);
    obj.layout71:setTop(0);
    obj.layout71:setWidth(960);
    obj.layout71:setHeight(70);
    obj.layout71:setName("layout71");

    obj.rectangle46 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout71);
    obj.rectangle46:setLeft(5);
    obj.rectangle46:setTop(0);
    obj.rectangle46:setWidth(950);
    obj.rectangle46:setHeight(70);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setXradius(15);
    obj.rectangle46:setYradius(15);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.layout72 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout71);
    obj.layout72:setLeft(5);
    obj.layout72:setTop(5);
    obj.layout72:setWidth(310);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.label65 = GUI.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout72);
    obj.label65:setLeft(0);
    obj.label65:setTop(5);
    obj.label65:setWidth(100);
    obj.label65:setHeight(20);
    obj.label65:setText("Sexo");
    obj.label65:setHorzTextAlign("trailing");
    obj.label65:setName("label65");

    obj.edit48 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout72);
    obj.edit48:setLeft(110);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(200);
    obj.edit48:setHeight(25);
    obj.edit48:setField("desc_sexo");
    obj.edit48:setName("edit48");

    obj.layout73 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.layout71);
    obj.layout73:setLeft(320);
    obj.layout73:setTop(5);
    obj.layout73:setWidth(310);
    obj.layout73:setHeight(25);
    obj.layout73:setName("layout73");

    obj.label66 = GUI.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout73);
    obj.label66:setLeft(0);
    obj.label66:setTop(5);
    obj.label66:setWidth(100);
    obj.label66:setHeight(20);
    obj.label66:setText("Altura");
    obj.label66:setHorzTextAlign("trailing");
    obj.label66:setName("label66");

    obj.edit49 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout73);
    obj.edit49:setLeft(110);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(200);
    obj.edit49:setHeight(25);
    obj.edit49:setField("desc_altura");
    obj.edit49:setName("edit49");

    obj.layout74 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.layout71);
    obj.layout74:setLeft(585);
    obj.layout74:setTop(5);
    obj.layout74:setWidth(310);
    obj.layout74:setHeight(25);
    obj.layout74:setName("layout74");

    obj.label67 = GUI.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout74);
    obj.label67:setLeft(0);
    obj.label67:setTop(5);
    obj.label67:setWidth(100);
    obj.label67:setHeight(20);
    obj.label67:setText("Olhos");
    obj.label67:setHorzTextAlign("trailing");
    obj.label67:setName("label67");

    obj.edit50 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout74);
    obj.edit50:setLeft(110);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(200);
    obj.edit50:setHeight(25);
    obj.edit50:setField("desc_olhos");
    obj.edit50:setName("edit50");

    obj.layout75 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.layout71);
    obj.layout75:setLeft(5);
    obj.layout75:setTop(35);
    obj.layout75:setWidth(310);
    obj.layout75:setHeight(25);
    obj.layout75:setName("layout75");

    obj.label68 = GUI.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout75);
    obj.label68:setLeft(0);
    obj.label68:setTop(5);
    obj.label68:setWidth(100);
    obj.label68:setHeight(20);
    obj.label68:setText("Idade");
    obj.label68:setHorzTextAlign("trailing");
    obj.label68:setName("label68");

    obj.edit51 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout75);
    obj.edit51:setLeft(110);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(200);
    obj.edit51:setHeight(25);
    obj.edit51:setField("desc_idade");
    obj.edit51:setName("edit51");

    obj.layout76 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout71);
    obj.layout76:setLeft(320);
    obj.layout76:setTop(35);
    obj.layout76:setWidth(310);
    obj.layout76:setHeight(25);
    obj.layout76:setName("layout76");

    obj.label69 = GUI.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout76);
    obj.label69:setLeft(0);
    obj.label69:setTop(5);
    obj.label69:setWidth(100);
    obj.label69:setHeight(20);
    obj.label69:setText("Peso");
    obj.label69:setHorzTextAlign("trailing");
    obj.label69:setName("label69");

    obj.edit52 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout76);
    obj.edit52:setLeft(110);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(200);
    obj.edit52:setHeight(25);
    obj.edit52:setField("desc_peso");
    obj.edit52:setName("edit52");

    obj.layout77 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.layout71);
    obj.layout77:setLeft(585);
    obj.layout77:setTop(35);
    obj.layout77:setWidth(310);
    obj.layout77:setHeight(25);
    obj.layout77:setName("layout77");

    obj.label70 = GUI.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout77);
    obj.label70:setLeft(0);
    obj.label70:setTop(5);
    obj.label70:setWidth(100);
    obj.label70:setHeight(20);
    obj.label70:setText("Cabelo");
    obj.label70:setHorzTextAlign("trailing");
    obj.label70:setName("label70");

    obj.edit53 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout77);
    obj.edit53:setLeft(110);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(200);
    obj.edit53:setHeight(25);
    obj.edit53:setField("desc_cabelo");
    obj.edit53:setName("edit53");

    obj.layout78 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.scrollBox4);
    obj.layout78:setLeft(0);
    obj.layout78:setTop(80);
    obj.layout78:setWidth(400);
    obj.layout78:setHeight(375);
    obj.layout78:setName("layout78");

    obj.rectangle47 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout78);
    obj.rectangle47:setLeft(0);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(400);
    obj.rectangle47:setHeight(375);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setXradius(15);
    obj.rectangle47:setYradius(15);
    obj.rectangle47:setCornerType("round");
    obj.rectangle47:setName("rectangle47");

    obj.label71 = GUI.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout78);
    obj.label71:setLeft(0);
    obj.label71:setTop(0);
    obj.label71:setWidth(400);
    obj.label71:setHeight(20);
    obj.label71:setText("Aparencia");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout78);
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

    obj.rectangle48 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.perso);
    obj.rectangle48:setLeft(0);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(400);
    obj.rectangle48:setHeight(355);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setXradius(15);
    obj.rectangle48:setYradius(15);
    obj.rectangle48:setCornerType("round");
    obj.rectangle48:setName("rectangle48");

    obj.label72 = GUI.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.perso);
    obj.label72:setLeft(0);
    obj.label72:setTop(0);
    obj.label72:setWidth(400);
    obj.label72:setHeight(20);
    obj.label72:setText("Personalidade");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

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

    obj.rectangle49 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.hist);
    obj.rectangle49:setLeft(0);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(600);
    obj.rectangle49:setHeight(735);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(15);
    obj.rectangle49:setYradius(15);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.label73 = GUI.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.hist);
    obj.label73:setLeft(0);
    obj.label73:setTop(0);
    obj.label73:setWidth(600);
    obj.label73:setHeight(20);
    obj.label73:setText("Historia");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.hist);
    obj.textEditor7:setLeft(10);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(580);
    obj.textEditor7:setHeight(695);
    obj.textEditor7:setField("historia");
    obj.textEditor7:setName("textEditor7");

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
    obj.image2:setSRC("/Ficha LH/images/LH.jpg");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox6);
    obj.image3:setLeft(510);
    obj.image3:setTop(0);
    obj.image3:setWidth(350);
    obj.image3:setHeight(350);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Ficha LH/images/RPGmeister.jpg");
    obj.image3:setName("image3");

    obj.layout79 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.scrollBox6);
    obj.layout79:setLeft(0);
    obj.layout79:setTop(300);
    obj.layout79:setWidth(200);
    obj.layout79:setHeight(200);
    obj.layout79:setName("layout79");

    obj.rectangle50 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout79);
    obj.rectangle50:setLeft(0);
    obj.rectangle50:setTop(0);
    obj.rectangle50:setWidth(200);
    obj.rectangle50:setHeight(200);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setXradius(15);
    obj.rectangle50:setYradius(15);
    obj.rectangle50:setCornerType("round");
    obj.rectangle50:setName("rectangle50");

    obj.label74 = GUI.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout79);
    obj.label74:setLeft(0);
    obj.label74:setTop(10);
    obj.label74:setWidth(200);
    obj.label74:setHeight(20);
    obj.label74:setText("Obrigado aos autores originais:");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = GUI.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout79);
    obj.label75:setLeft(0);
    obj.label75:setTop(35);
    obj.label75:setWidth(200);
    obj.label75:setHeight(20);
    obj.label75:setText("Programador: Vinny (Ambesek)");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = GUI.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout79);
    obj.label76:setLeft(0);
    obj.label76:setTop(60);
    obj.label76:setWidth(200);
    obj.label76:setHeight(20);
    obj.label76:setText("Arte: Nefer (Nefertyne)");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = GUI.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout79);
    obj.label77:setLeft(0);
    obj.label77:setTop(85);
    obj.label77:setWidth(200);
    obj.label77:setHeight(20);
    obj.label77:setText("Consultor: Vinny (hellblackjack)");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = GUI.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout79);
    obj.label78:setLeft(0);
    obj.label78:setTop(120);
    obj.label78:setWidth(200);
    obj.label78:setHeight(20);
    obj.label78:setText("Ficha modificado por:");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = GUI.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout79);
    obj.label79:setLeft(0);
    obj.label79:setTop(145);
    obj.label79:setWidth(200);
    obj.label79:setHeight(20);
    obj.label79:setText("HashBR - Túlio");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = GUI.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout79);
    obj.label80:setLeft(0);
    obj.label80:setTop(170);
    obj.label80:setWidth(200);
    obj.label80:setHeight(20);
    obj.label80:setText("Desenho: Átilla Gallio");
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj._e_event0 = obj.edit11:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event1 = obj.edit12:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event2 = obj.edit13:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event3 = obj.edit14:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event4 = obj.edit15:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event5 = obj.edit16:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event6 = obj.edit17:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event7 = obj.edit18:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event8 = obj.edit19:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event9 = obj.edit20:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event10 = obj.edit21:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event11 = obj.edit22:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event12 = obj.edit23:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event13 = obj.edit24:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event14 = obj.edit25:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event15 = obj.edit26:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event16 = obj.edit27:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event17 = obj.edit28:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event18 = obj.edit29:addEventListener("onChange",
        function (_)
            vida_status();
        end, obj);

    obj._e_event19 = obj.edit30:addEventListener("onChange",
        function (_)
            vida_status();
        end, obj);

    obj._e_event20 = obj.edit31:addEventListener("onChange",
        function (_)
            cha_status();
        end, obj);

    obj._e_event21 = obj.edit32:addEventListener("onChange",
        function (_)
            cha_status();
        end, obj);

    obj._e_event22 = obj.edit33:addEventListener("onChange",
        function (_)
            sta_status();
        end, obj);

    obj._e_event23 = obj.edit34:addEventListener("onChange",
        function (_)
            sta_status();
        end, obj);

    obj._e_event24 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclSelector:append();
        end, obj);

    obj._e_event25 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclSelector2:append();
        end, obj);

    obj._e_event26 = obj.rclSelector:addEventListener("onSelect",
        function (_)
            local node = self.rclSelector.selectedNode;
            						self.rclSelector2.selectedNode = nil;
            						self.boxDetalhesDoItem.node = node;
        end, obj);

    obj._e_event27 = obj.rclSelector2:addEventListener("onSelect",
        function (_)
            local node = self.rclSelector2.selectedNode;
            						self.rclSelector.selectedNode = nil;
            						self.boxDetalhesDoItem.node = node;
        end, obj);

    obj._e_event28 = obj.button3:addEventListener("onClick",
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

    obj._e_event29 = obj.button4:addEventListener("onClick",
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

    obj._e_event30 = obj.button5:addEventListener("onClick",
        function (_)
            self.rclListaDosNinjutsus:append();
        end, obj);

    obj._e_event31 = obj.rclListaDosNinjutsus:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosNinjutsus.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;                       
                                            self.rclListaDosBasicos.selectedNode = nil;   
                                            self.rclListaDosClans.selectedNode = nil;   
                                            self.rclListaDosKekkeis.selectedNode = nil;     
                                            self.rclListaDosKenjutsus.selectedNode = nil;   
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event32 = obj.button6:addEventListener("onClick",
        function (_)
            self.rclListaDosGenjutsus:append();
        end, obj);

    obj._e_event33 = obj.rclListaDosGenjutsus:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosGenjutsus.selectedNode;  
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;                       
                                            self.rclListaDosBasicos.selectedNode = nil;   
                                            self.rclListaDosClans.selectedNode = nil; 
                                            self.rclListaDosKekkeis.selectedNode = nil;    
                                            self.rclListaDosKenjutsus.selectedNode = nil;   
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event34 = obj.button7:addEventListener("onClick",
        function (_)
            self.rclListaDosTaijutsus:append();
        end, obj);

    obj._e_event35 = obj.rclListaDosTaijutsus:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosTaijutsus.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;   
                                            self.rclListaDosBasicos.selectedNode = nil; 
                                            self.rclListaDosClans.selectedNode = nil; 
                                            self.rclListaDosKekkeis.selectedNode = nil; 
                                            self.rclListaDosKenjutsus.selectedNode = nil;     
                                            self.rclListaDosKuchyoses.selectedNode = nil;     
                                            self.rclListaDosEstLutas.selectedNode = nil;                  
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event36 = obj.button8:addEventListener("onClick",
        function (_)
            self.rclListaDosBasicos:append();
        end, obj);

    obj._e_event37 = obj.rclListaDosBasicos:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosBasicos.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;  
                                            self.rclListaDosClans.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil;    
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event38 = obj.button9:addEventListener("onClick",
        function (_)
            self.rclListaDosClans:append();
        end, obj);

    obj._e_event39 = obj.rclListaDosClans:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosClans.selectedNode;  
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;
                                            self.rclListaDosGenjutsus.selectedNode = nil;
                                            self.rclListaDosBasicos.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil;
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event40 = obj.button10:addEventListener("onClick",
        function (_)
            self.rclListaDosKekkeis:append();
        end, obj);

    obj._e_event41 = obj.rclListaDosKekkeis:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosKekkeis.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;
                                            self.rclListaDosBasicos.selectedNode = nil;
                                            self.rclListaDosClans.selectedNode = nil; 
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event42 = obj.button11:addEventListener("onClick",
        function (_)
            self.rclListaDosKenjutsus:append();
        end, obj);

    obj._e_event43 = obj.rclListaDosKenjutsus:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosKenjutsus.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;  
                                            self.rclListaDosClans.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil;    
                                            self.rclListaDosBasicos.selectedNode = nil;  
                                            self.rclListaDosKuchyoses.selectedNode = nil; 
                                            self.rclListaDosEstLutas.selectedNode = nil; 
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event44 = obj.button12:addEventListener("onClick",
        function (_)
            self.rclListaDosKuchyoses:append();
        end, obj);

    obj._e_event45 = obj.rclListaDosKuchyoses:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosKuchyoses.selectedNode;  
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;
                                            self.rclListaDosGenjutsus.selectedNode = nil;
                                            self.rclListaDosBasicos.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil;
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosClans.selectedNode = nil;
                                            self.rclListaDosEstLutas.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event46 = obj.button13:addEventListener("onClick",
        function (_)
            self.rclListaDosEstLutas:append();
        end, obj);

    obj._e_event47 = obj.rclListaDosEstLutas:addEventListener("onSelect",
        function (_)
            local node = self.rclListaDosEstLutas.selectedNode;  
                                            self.rclListaDosGenjutsus.selectedNode = nil;                       
                                            self.rclListaDosNinjutsus.selectedNode = nil;                       
                                            self.rclListaDosTaijutsus.selectedNode = nil;
                                            self.rclListaDosBasicos.selectedNode = nil;
                                            self.rclListaDosKekkeis.selectedNode = nil; 
                                            self.rclListaDosKenjutsus.selectedNode = nil;
                                            self.rclListaDosClans.selectedNode = nil;
                                            self.rclListaDosKuchyoses.selectedNode = nil;
                                            self.boxDetalhesDoJutsu.node = node;
        end, obj);

    obj._e_event48 = obj.button14:addEventListener("onClick",
        function (_)
            self.rclListaDosItens:append();
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.rclListaDosClans ~= nil then self.rclListaDosClans:destroy(); self.rclListaDosClans = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.frmLH2 ~= nil then self.frmLH2:destroy(); self.frmLH2 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.localizacao ~= nil then self.localizacao:destroy(); self.localizacao = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.rclListaDosGenjutsus ~= nil then self.rclListaDosGenjutsus:destroy(); self.rclListaDosGenjutsus = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.boxDetalhesDoJutsu ~= nil then self.boxDetalhesDoJutsu:destroy(); self.boxDetalhesDoJutsu = nil; end;
        if self.inventario ~= nil then self.inventario:destroy(); self.inventario = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.frmLH6 ~= nil then self.frmLH6:destroy(); self.frmLH6 = nil; end;
        if self.hist ~= nil then self.hist:destroy(); self.hist = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.rclSelector2 ~= nil then self.rclSelector2:destroy(); self.rclSelector2 = nil; end;
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
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.rclListaDosNinjutsus ~= nil then self.rclListaDosNinjutsus:destroy(); self.rclListaDosNinjutsus = nil; end;
        if self.atributos_todos ~= nil then self.atributos_todos:destroy(); self.atributos_todos = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.popMeuPopup ~= nil then self.popMeuPopup:destroy(); self.popMeuPopup = nil; end;
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
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.buffatt ~= nil then self.buffatt:destroy(); self.buffatt = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.frmLH7 ~= nil then self.frmLH7:destroy(); self.frmLH7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rclListaDosTaijutsus ~= nil then self.rclListaDosTaijutsus:destroy(); self.rclListaDosTaijutsus = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rclListaDosEstLutas ~= nil then self.rclListaDosEstLutas:destroy(); self.rclListaDosEstLutas = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.jutsusNINGENTAI ~= nil then self.jutsusNINGENTAI:destroy(); self.jutsusNINGENTAI = nil; end;
        if self.rclListaDosBasicos ~= nil then self.rclListaDosBasicos:destroy(); self.rclListaDosBasicos = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.rclListaDosKekkeis ~= nil then self.rclListaDosKekkeis:destroy(); self.rclListaDosKekkeis = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.rclListaDosKenjutsus ~= nil then self.rclListaDosKenjutsus:destroy(); self.rclListaDosKenjutsus = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.DescJutsu ~= nil then self.DescJutsu:destroy(); self.DescJutsu = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.perso ~= nil then self.perso:destroy(); self.perso = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
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
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.anot ~= nil then self.anot:destroy(); self.anot = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.layout76 ~= nil then self.layout76:destroy(); self.layout76 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.frmLH5 ~= nil then self.frmLH5:destroy(); self.frmLH5 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.frmLH1 ~= nil then self.frmLH1:destroy(); self.frmLH1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.frmLH8 ~= nil then self.frmLH8:destroy(); self.frmLH8 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
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
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.rclListaDosKuchyoses ~= nil then self.rclListaDosKuchyoses:destroy(); self.rclListaDosKuchyoses = nil; end;
        if self.rclAnotacoes ~= nil then self.rclAnotacoes:destroy(); self.rclAnotacoes = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaKH()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaKH();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaKH = {
    newEditor = newfrmFichaKH, 
    new = newfrmFichaKH, 
    name = "frmFichaKH", 
    dataType = "HashBR.KH", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Konoha Heroes 2.2", 
    description=""};

frmFichaKH = _frmFichaKH;
Firecast.registrarForm(_frmFichaKH);
Firecast.registrarDataType(_frmFichaKH);

return _frmFichaKH;
