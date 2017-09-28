require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaKH()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Principal");
    obj.tab1:setName("tab1");

    obj.frmLH1 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH1:setParent(obj.tab1);
    obj.frmLH1:setName("frmLH1");
    obj.frmLH1:setAlign("client");
    obj.frmLH1:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
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
			


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(825);
    obj.layout1:setHeight(95);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("grey");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(90);
    obj.label1:setHeight(20);
    obj.label1:setText("Clan");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setField("desc_clan");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(210);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(90);
    obj.label2:setHeight(20);
    obj.label2:setText("Nome");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(100);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setField("desc_nome");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(420);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(200);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(90);
    obj.label3:setHeight(20);
    obj.label3:setText("Rank");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setField("desc_rank");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(200);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(90);
    obj.label4:setHeight(20);
    obj.label4:setText("Vila de Origem");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(100);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(25);
    obj.edit4:setField("desc_vila_origem");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(210);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(200);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(90);
    obj.label5:setHeight(20);
    obj.label5:setText("Vila Atual");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(100);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(25);
    obj.edit5:setField("desc_vila_atual");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(420);
    obj.layout7:setTop(35);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(90);
    obj.label6:setHeight(20);
    obj.label6:setText("Especialização");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout7);
    obj.edit6:setLeft(100);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("desc_especializacao");
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setName("edit6");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(65);
    obj.layout8:setWidth(200);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setLeft(0);
    obj.label7:setTop(5);
    obj.label7:setWidth(90);
    obj.label7:setHeight(20);
    obj.label7:setText("Dinheiro");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout8);
    obj.edit7:setLeft(100);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(100);
    obj.edit7:setHeight(25);
    obj.edit7:setField("desc_dinheiro");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(210);
    obj.layout9:setTop(65);
    obj.layout9:setWidth(200);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout9);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(90);
    obj.label8:setHeight(20);
    obj.label8:setText("Elemento I");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setLeft(100);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(25);
    obj.edit8:setField("desc_Elemento Principal");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(420);
    obj.layout10:setTop(65);
    obj.layout10:setWidth(200);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout10);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(90);
    obj.label9:setHeight(20);
    obj.label9:setText("Elemento II");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout10);
    obj.edit9:setLeft(100);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(100);
    obj.edit9:setHeight(25);
    obj.edit9:setField("desc_Elemento Secundario");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(615);
    obj.layout11:setTop(65);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout11);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(90);
    obj.label10:setHeight(20);
    obj.label10:setText("loginDono");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout11);
    obj.edit10:setLeft(100);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(100);
    obj.edit10:setHeight(25);
    obj.edit10:setField("desc_loginDono");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.atributos_todos = gui.fromHandle(_obj_newObject("layout"));
    obj.atributos_todos:setParent(obj.scrollBox1);
    obj.atributos_todos:setName("atributos_todos");
    obj.atributos_todos:setVisible(false);
    obj.atributos_todos:setLeft(0);
    obj.atributos_todos:setTop(100);
    obj.atributos_todos:setWidth(300);
    obj.atributos_todos:setHeight(230);

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.atributos_todos);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.atributos_todos);
    obj.label11:setLeft(5);
    obj.label11:setTop(5);
    obj.label11:setWidth(290);
    obj.label11:setHeight(20);
    obj.label11:setText("ATRIBUTOS");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.atributos_todos);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(30);
    obj.layout12:setWidth(300);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout12);
    obj.label12:setLeft(50);
    obj.label12:setTop(0);
    obj.label12:setWidth(35);
    obj.label12:setHeight(25);
    obj.label12:setText("Base");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout12);
    obj.label13:setLeft(90);
    obj.label13:setTop(0);
    obj.label13:setWidth(35);
    obj.label13:setHeight(25);
    obj.label13:setText("Multi");
    obj.label13:setFontSize(11);
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout12);
    obj.label14:setLeft(130);
    obj.label14:setTop(0);
    obj.label14:setWidth(35);
    obj.label14:setHeight(25);
    obj.label14:setText("Extra");
    obj.label14:setFontSize(11);
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout12);
    obj.label15:setLeft(175);
    obj.label15:setTop(0);
    obj.label15:setWidth(35);
    obj.label15:setHeight(25);
    obj.label15:setText("Total");
    obj.label15:setFontSize(10);
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout12);
    obj.label16:setLeft(235);
    obj.label16:setTop(0);
    obj.label16:setWidth(35);
    obj.label16:setHeight(25);
    obj.label16:setText("Rank");
    obj.label16:setFontSize(13);
    obj.label16:setName("label16");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.atributos_todos);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(55);
    obj.layout13:setWidth(300);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout13);
    obj.label17:setLeft(5);
    obj.label17:setTop(5);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setText("VDS");
    obj.label17:setName("label17");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout13);
    obj.edit11:setLeft(40);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(40);
    obj.edit11:setHeight(25);
    obj.edit11:setHorzTextAlign("center");
    obj.edit11:setField("vds_base");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout13);
    obj.edit12:setLeft(85);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(35);
    obj.edit12:setHeight(25);
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setField("vds_multi");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setLeft(125);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setField("vds_outros");
    obj.edit13:setName("edit13");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout13);
    obj.rectangle3:setLeft(160);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout13);
    obj.label18:setLeft(160);
    obj.label18:setTop(0);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setField("vds_total");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout13);
    obj.rectangle4:setLeft(215);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(75);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout13);
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
				


    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.atributos_todos);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(80);
    obj.layout14:setWidth(300);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20:setLeft(5);
    obj.label20:setTop(5);
    obj.label20:setWidth(40);
    obj.label20:setHeight(20);
    obj.label20:setText("AFE");
    obj.label20:setName("label20");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout14);
    obj.edit14:setLeft(40);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setField("afe_base");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout14);
    obj.edit15:setLeft(85);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(35);
    obj.edit15:setHeight(25);
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setField("afe_multi");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout14);
    obj.edit16:setLeft(125);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setHorzTextAlign("center");
    obj.edit16:setField("afe_outros");
    obj.edit16:setName("edit16");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout14);
    obj.rectangle5:setLeft(160);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout14);
    obj.label21:setLeft(160);
    obj.label21:setTop(0);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setField("afe_total");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout14);
    obj.rectangle6:setLeft(215);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(75);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout14);
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
				


    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.atributos_todos);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(110);
    obj.layout15:setWidth(300);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout15);
    obj.label23:setLeft(5);
    obj.label23:setTop(5);
    obj.label23:setWidth(40);
    obj.label23:setHeight(20);
    obj.label23:setText("INT");
    obj.label23:setName("label23");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout15);
    obj.edit17:setLeft(40);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(40);
    obj.edit17:setHeight(25);
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setField("int_base");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout15);
    obj.edit18:setLeft(85);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(35);
    obj.edit18:setHeight(25);
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setField("int_multi");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout15);
    obj.edit19:setLeft(125);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setField("int_outros");
    obj.edit19:setName("edit19");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout15);
    obj.rectangle7:setLeft(160);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("Black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout15);
    obj.label24:setLeft(160);
    obj.label24:setTop(0);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setField("int_total");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout15);
    obj.rectangle8:setLeft(215);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(75);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("Black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout15);
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
				


    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.atributos_todos);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(135);
    obj.layout16:setWidth(300);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout16);
    obj.label26:setLeft(5);
    obj.label26:setTop(5);
    obj.label26:setWidth(40);
    obj.label26:setHeight(20);
    obj.label26:setText("CCH");
    obj.label26:setName("label26");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout16);
    obj.edit20:setLeft(40);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(25);
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setField("cch_base");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout16);
    obj.edit21:setLeft(85);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(35);
    obj.edit21:setHeight(25);
    obj.edit21:setHorzTextAlign("center");
    obj.edit21:setField("cch_multi");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout16);
    obj.edit22:setLeft(125);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setField("cch_outros");
    obj.edit22:setName("edit22");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout16);
    obj.rectangle9:setLeft(160);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("Black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout16);
    obj.label27:setLeft(160);
    obj.label27:setTop(0);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setField("cch_total");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout16);
    obj.rectangle10:setLeft(215);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(75);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("Black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout16);
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
				


    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.atributos_todos);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(165);
    obj.layout17:setWidth(300);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout17);
    obj.label29:setLeft(5);
    obj.label29:setTop(5);
    obj.label29:setWidth(40);
    obj.label29:setHeight(20);
    obj.label29:setText("AGI");
    obj.label29:setName("label29");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout17);
    obj.edit23:setLeft(40);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(25);
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setField("agi_base");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout17);
    obj.edit24:setLeft(85);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(35);
    obj.edit24:setHeight(25);
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setField("agi_multi");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout17);
    obj.edit25:setLeft(125);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setField("agi_outros");
    obj.edit25:setName("edit25");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout17);
    obj.rectangle11:setLeft(160);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("Black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout17);
    obj.label30:setLeft(160);
    obj.label30:setTop(0);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setField("agi_total");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout17);
    obj.rectangle12:setLeft(215);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(75);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout17);
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
				


    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.atributos_todos);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(190);
    obj.layout18:setWidth(300);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout18);
    obj.label32:setLeft(5);
    obj.label32:setTop(5);
    obj.label32:setWidth(40);
    obj.label32:setHeight(20);
    obj.label32:setText("FOR");
    obj.label32:setName("label32");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout18);
    obj.edit26:setLeft(40);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(40);
    obj.edit26:setHeight(25);
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setField("for_base");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout18);
    obj.edit27:setLeft(85);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(35);
    obj.edit27:setHeight(25);
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setField("for_multi");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout18);
    obj.edit28:setLeft(125);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setField("for_outros");
    obj.edit28:setName("edit28");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout18);
    obj.rectangle13:setLeft(160);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("Black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout18);
    obj.label33:setLeft(160);
    obj.label33:setTop(0);
    obj.label33:setWidth(50);
    obj.label33:setHeight(25);
    obj.label33:setField("for_total");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout18);
    obj.rectangle14:setLeft(215);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(75);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("Black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout18);
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
				


    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.scrollBox1);
    obj.layout19:setLeft(305);
    obj.layout19:setTop(100);
    obj.layout19:setWidth(230);
    obj.layout19:setHeight(150);
    obj.layout19:setName("layout19");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout19);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setXradius(5);
    obj.rectangle15:setYradius(5);
    obj.rectangle15:setCornerType("round");
    obj.rectangle15:setName("rectangle15");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout19);
    obj.label35:setLeft(5);
    obj.label35:setTop(5);
    obj.label35:setWidth(220);
    obj.label35:setHeight(20);
    obj.label35:setText("STATUS");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout19);
    obj.label36:setLeft(80);
    obj.label36:setTop(25);
    obj.label36:setWidth(50);
    obj.label36:setHeight(25);
    obj.label36:setText("Base");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout19);
    obj.label37:setLeft(125);
    obj.label37:setTop(25);
    obj.label37:setWidth(50);
    obj.label37:setHeight(25);
    obj.label37:setText("Multi");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout19);
    obj.label38:setLeft(170);
    obj.label38:setTop(25);
    obj.label38:setWidth(50);
    obj.label38:setHeight(25);
    obj.label38:setText("Total");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout19);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(50);
    obj.layout20:setWidth(230);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout20);
    obj.rectangle16:setMargins({left = 5, right = 5});
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("DarkRed");
    obj.rectangle16:setOpacity(0.5);
    obj.rectangle16:setName("rectangle16");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.rectangle16);
    obj.rectangle17:setMargins({left = 75});
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setAlign("left");
    obj.rectangle17:setColor("White");
    obj.rectangle17:setOpacity(0.3);
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle16);
    obj.rectangle18:setMargins({left = 5});
    obj.rectangle18:setWidth(30);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setAlign("left");
    obj.rectangle18:setColor("White");
    obj.rectangle18:setOpacity(0.5);
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.rectangle16);
    obj.rectangle19:setMargins({left = 5});
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setAlign("left");
    obj.rectangle19:setColor("White");
    obj.rectangle19:setOpacity(0.3);
    obj.rectangle19:setName("rectangle19");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout20);
    obj.label39:setLeft(5);
    obj.label39:setTop(0);
    obj.label39:setWidth(75);
    obj.label39:setHeight(25);
    obj.label39:setText("Vida");
    lfm_setPropAsString(obj.label39, "fontStyle",  "bold");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout20);
    obj.edit29:setLeft(85);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(40);
    obj.edit29:setHeight(25);
    obj.edit29:setField("vida_base");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setTransparent(true);
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout20);
    obj.edit30:setLeft(135);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(30);
    obj.edit30:setHeight(25);
    obj.edit30:setField("vida_mult");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setTransparent(true);
    obj.edit30:setName("edit30");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout20);
    obj.label40:setLeft(175);
    obj.label40:setTop(0);
    obj.label40:setWidth(40);
    obj.label40:setHeight(25);
    obj.label40:setField("vida_total");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout19);
    obj.layout21:setLeft(0);
    obj.layout21:setTop(80);
    obj.layout21:setWidth(230);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout21);
    obj.rectangle20:setMargins({left = 5, right = 5});
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("DarkBlue");
    obj.rectangle20:setOpacity(0.5);
    obj.rectangle20:setName("rectangle20");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.rectangle20);
    obj.rectangle21:setMargins({left = 75});
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setAlign("left");
    obj.rectangle21:setColor("White");
    obj.rectangle21:setOpacity(0.3);
    obj.rectangle21:setName("rectangle21");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.rectangle20);
    obj.rectangle22:setMargins({left = 5});
    obj.rectangle22:setWidth(30);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setAlign("left");
    obj.rectangle22:setColor("White");
    obj.rectangle22:setOpacity(0.5);
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.rectangle20);
    obj.rectangle23:setMargins({left = 5});
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setAlign("left");
    obj.rectangle23:setColor("White");
    obj.rectangle23:setOpacity(0.3);
    obj.rectangle23:setName("rectangle23");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout21);
    obj.label41:setLeft(5);
    obj.label41:setTop(0);
    obj.label41:setWidth(75);
    obj.label41:setHeight(25);
    obj.label41:setText("Chakra");
    lfm_setPropAsString(obj.label41, "fontStyle",  "bold");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout21);
    obj.edit31:setLeft(85);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(40);
    obj.edit31:setHeight(25);
    obj.edit31:setField("cha_base");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setTransparent(true);
    obj.edit31:setName("edit31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout21);
    obj.edit32:setLeft(135);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setField("cha_mult");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setTransparent(true);
    obj.edit32:setName("edit32");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout21);
    obj.label42:setLeft(175);
    obj.label42:setTop(0);
    obj.label42:setWidth(40);
    obj.label42:setHeight(25);
    obj.label42:setField("cha_total");
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout19);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(110);
    obj.layout22:setWidth(230);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout22);
    obj.rectangle24:setMargins({left = 5, right = 5});
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("DarkGreen");
    obj.rectangle24:setOpacity(0.5);
    obj.rectangle24:setName("rectangle24");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.rectangle24);
    obj.rectangle25:setMargins({left = 75});
    obj.rectangle25:setWidth(50);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setAlign("left");
    obj.rectangle25:setColor("White");
    obj.rectangle25:setOpacity(0.3);
    obj.rectangle25:setName("rectangle25");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.rectangle24);
    obj.rectangle26:setMargins({left = 5});
    obj.rectangle26:setWidth(30);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setAlign("left");
    obj.rectangle26:setColor("White");
    obj.rectangle26:setOpacity(0.5);
    obj.rectangle26:setName("rectangle26");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.rectangle24);
    obj.rectangle27:setMargins({left = 5});
    obj.rectangle27:setWidth(50);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setAlign("left");
    obj.rectangle27:setColor("White");
    obj.rectangle27:setOpacity(0.3);
    obj.rectangle27:setName("rectangle27");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout22);
    obj.label43:setLeft(5);
    obj.label43:setTop(0);
    obj.label43:setWidth(75);
    obj.label43:setHeight(25);
    obj.label43:setText("Stamina");
    lfm_setPropAsString(obj.label43, "fontStyle",  "bold");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout22);
    obj.edit33:setLeft(85);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(25);
    obj.edit33:setField("sta_base");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setTransparent(true);
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout22);
    obj.edit34:setLeft(135);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setField("sta_mult");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setTransparent(true);
    obj.edit34:setName("edit34");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout22);
    obj.label44:setLeft(175);
    obj.label44:setTop(0);
    obj.label44:setWidth(40);
    obj.label44:setHeight(25);
    obj.label44:setField("sta_total");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.localizacao = gui.fromHandle(_obj_newObject("layout"));
    obj.localizacao:setParent(obj.scrollBox1);
    obj.localizacao:setName("localizacao");
    obj.localizacao:setVisible(false);
    obj.localizacao:setLeft(305);
    obj.localizacao:setTop(255);
    obj.localizacao:setWidth(230);
    obj.localizacao:setHeight(75);

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.localizacao);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setXradius(5);
    obj.rectangle28:setYradius(5);
    obj.rectangle28:setCornerType("round");
    obj.rectangle28:setName("rectangle28");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.localizacao);
    obj.label45:setTop(0);
    obj.label45:setWidth(220);
    obj.label45:setHeight(20);
    obj.label45:setText("Localização Atual");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.localizacao);
    obj.edit35:setTop(25);
    obj.edit35:setLeft(5);
    obj.edit35:setWidth(220);
    obj.edit35:setFontSize(18);
    obj.edit35:setHeight(40);
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.scrollBox1);
    obj.layout23:setLeft(105);
    obj.layout23:setTop(335);
    obj.layout23:setWidth(430);
    obj.layout23:setHeight(100);
    obj.layout23:setName("layout23");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout23);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setXradius(5);
    obj.rectangle29:setYradius(5);
    obj.rectangle29:setCornerType("round");
    obj.rectangle29:setName("rectangle29");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout23);
    obj.label46:setLeft(5);
    obj.label46:setTop(5);
    obj.label46:setWidth(430);
    obj.label46:setHeight(20);
    obj.label46:setText("EFEITOS");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout23);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(420);
    obj.textEditor1:setHeight(60);
    obj.textEditor1:setField("efeitos");
    obj.textEditor1:setName("textEditor1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(0);
    obj.button1:setTop(335);
    obj.button1:setWidth(100);
    obj.button1:setHeight(100);
    obj.button1:setName("button1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.button1);
    obj.dataLink1:setField("clickableImage");
    obj.dataLink1:setDefaultValue("https://i.imgur.com/rSCV1fB.jpg");
    obj.dataLink1:setName("dataLink1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button1);
    obj.image1:setAlign("client");
    obj.image1:setField("clickableImage");
    obj.image1:setMargins({left=5, right=5, top=5, bottom=5});
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");


				-- criando array das imagens que vão ser utilizadas. 
				-- melhor usar imagens hospedadas no firedrive nesse caso
				local pics = {	"https://i.imgur.com/rSCV1fB.jpg", 
								"https://i.imgur.com/B2JojCZ.jpg"};
				


    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox1);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(440);
    obj.layout24:setWidth(530);
    obj.layout24:setHeight(260);
    obj.layout24:setName("layout24");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout24);
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setHeight(25);
    obj.button2:setWidth(125);
    obj.button2:setText("+ Vantagem");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout24);
    obj.button3:setLeft(130);
    obj.button3:setTop(0);
    obj.button3:setHeight(25);
    obj.button3:setWidth(125);
    obj.button3:setText("+ Desvantagem");
    obj.button3:setName("button3");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout24);
    obj.rectangle30:setLeft(0);
    obj.rectangle30:setTop(25);
    obj.rectangle30:setWidth(255);
    obj.rectangle30:setHeight(220);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.rclSelector = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector:setParent(obj.layout24);
    obj.rclSelector:setLeft(0);
    obj.rclSelector:setTop(25);
    obj.rclSelector:setWidth(255);
    obj.rclSelector:setHeight(110);
    obj.rclSelector:setName("rclSelector");
    obj.rclSelector:setField("listaDeOpcoes");
    obj.rclSelector:setTemplateForm("frmDataScopeSelectionForm");
    obj.rclSelector:setLayout("vertical");
    obj.rclSelector:setSelectable(true);

    obj.rclSelector2 = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclSelector2:setParent(obj.layout24);
    obj.rclSelector2:setLeft(0);
    obj.rclSelector2:setTop(140);
    obj.rclSelector2:setWidth(255);
    obj.rclSelector2:setHeight(105);
    obj.rclSelector2:setName("rclSelector2");
    obj.rclSelector2:setField("listaDeOpcoes2");
    obj.rclSelector2:setTemplateForm("frmDataScopeSelectionForm2");
    obj.rclSelector2:setLayout("vertical");
    obj.rclSelector2:setSelectable(true);

    obj.boxDetalhesDoItem = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.layout24);
    obj.boxDetalhesDoItem:setLeft(255);
    obj.boxDetalhesDoItem:setTop(25);
    obj.boxDetalhesDoItem:setWidth(280);
    obj.boxDetalhesDoItem:setHeight(220);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(true);

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.boxDetalhesDoItem);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.boxDetalhesDoItem);
    obj.edit36:setLeft(5);
    obj.edit36:setTop(5);
    obj.edit36:setWidth(265);
    obj.edit36:setHeight(25);
    obj.edit36:setField("nome");
    obj.edit36:setName("edit36");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.boxDetalhesDoItem);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(30);
    obj.textEditor2:setWidth(265);
    obj.textEditor2:setHeight(100);
    obj.textEditor2:setField("desc_vandes");
    obj.textEditor2:setName("textEditor2");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.boxDetalhesDoItem);
    obj.label47:setLeft(5);
    obj.label47:setTop(130);
    obj.label47:setWidth(265);
    obj.label47:setHeight(25);
    obj.label47:setText("Efeito");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.boxDetalhesDoItem);
    obj.textEditor3:setLeft(5);
    obj.textEditor3:setTop(155);
    obj.textEditor3:setWidth(265);
    obj.textEditor3:setHeight(55);
    obj.textEditor3:setField("efeito_vandes");
    obj.textEditor3:setName("textEditor3");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox1);
    obj.layout25:setLeft(540);
    obj.layout25:setTop(570);
    obj.layout25:setWidth(285);
    obj.layout25:setHeight(115);
    obj.layout25:setName("layout25");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout25);
    obj.button4:setAlign("left");
    obj.button4:setWidth(285);
    obj.button4:setFontSize(16);
    obj.button4:setText("Mostrar Dados Ocultos!");
    obj.button4:setName("button4");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
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

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(540);
    obj.image2:setTop(100);
    obj.image2:setWidth(285);
    obj.image2:setHeight(460);
    obj.image2:setField("avatar");
    obj.image2:setEditable(true);
    obj.image2:setStyle("proportional");
    obj.image2:setName("image2");

    obj.jutsusNINGENTAI = gui.fromHandle(_obj_newObject("tab"));
    obj.jutsusNINGENTAI:setParent(obj.tabControl1);
    obj.jutsusNINGENTAI:setName("jutsusNINGENTAI");
    obj.jutsusNINGENTAI:setVisible(false);
    obj.jutsusNINGENTAI:setTitle("NIN/GEN/TAI");

    obj.frmLH2 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH2:setParent(obj.jutsusNINGENTAI);
    obj.frmLH2:setName("frmLH2");
    obj.frmLH2:setTheme("dark");
    obj.frmLH2:setWidth(710);
    obj.frmLH2:setPadding({left=4, top=4, right=4, bottom=4});

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmLH2);
    obj.scrollBox2:setAlign("top");
    obj.scrollBox2:setHeight(800);
    obj.scrollBox2:setWidth(700);
    obj.scrollBox2:setName("scrollBox2");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox2);
    obj.layout26:setAlign("top");
    obj.layout26:setHeight(350);
    obj.layout26:setMargins({bottom=4});
    obj.layout26:setName("layout26");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout26);
    obj.rectangle33:setAlign("top");
    obj.rectangle33:setColor("grey");
    obj.rectangle33:setXradius(10);
    obj.rectangle33:setYradius(10);
    obj.rectangle33:setHeight(350);
    obj.rectangle33:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle33:setName("rectangle33");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.rectangle33);
    obj.layout27:setAlign("top");
    obj.layout27:setHeight(30);
    obj.layout27:setMargins({bottom=4});
    obj.layout27:setName("layout27");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout27);
    obj.button5:setText("Adicionar Ninjutsu");
    obj.button5:setWidth(270);
    obj.button5:setAlign("left");
    obj.button5:setName("button5");

    obj.rclListaDosNinjutsus = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosNinjutsus:setParent(obj.rectangle33);
    obj.rclListaDosNinjutsus:setName("rclListaDosNinjutsus");
    obj.rclListaDosNinjutsus:setField("campoDosNinjutsus");
    obj.rclListaDosNinjutsus:setTemplateForm("frmLH2_1");
    obj.rclListaDosNinjutsus:setAlign("client");
    obj.rclListaDosNinjutsus:setHeight(300);
    obj.rclListaDosNinjutsus:setSelectable(true);

    obj.boxDetalhesDoNinjutsu = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoNinjutsu:setParent(obj.rectangle33);
    obj.boxDetalhesDoNinjutsu:setName("boxDetalhesDoNinjutsu");
    obj.boxDetalhesDoNinjutsu:setVisible(false);
    obj.boxDetalhesDoNinjutsu:setAlign("right");
    obj.boxDetalhesDoNinjutsu:setWidth(400);
    obj.boxDetalhesDoNinjutsu:setMargins({left=4, right=4});

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.boxDetalhesDoNinjutsu);
    obj.rectangle34:setAlign("top");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setXradius(10);
    obj.rectangle34:setYradius(10);
    obj.rectangle34:setHeight(300);
    obj.rectangle34:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle34:setName("rectangle34");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.rectangle34);
    obj.layout28:setAlign("top");
    obj.layout28:setHeight(30);
    obj.layout28:setMargins({bottom=4});
    obj.layout28:setName("layout28");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout28);
    obj.label48:setAlign("left");
    obj.label48:setText("Jutsu");
    obj.label48:setWidth(100);
    obj.label48:setAutoSize(true);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout28);
    obj.edit37:setAlign("client");
    obj.edit37:setField("campoNinjutsu");
    obj.edit37:setName("edit37");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.rectangle34);
    obj.layout29:setAlign("top");
    obj.layout29:setHeight(30);
    obj.layout29:setMargins({bottom=4});
    obj.layout29:setName("layout29");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout29);
    obj.label49:setAlign("left");
    obj.label49:setText("Gasto");
    obj.label49:setWidth(100);
    obj.label49:setAutoSize(true);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout29);
    obj.edit38:setAlign("client");
    obj.edit38:setField("campoGasto");
    obj.edit38:setName("edit38");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.rectangle34);
    obj.layout30:setAlign("top");
    obj.layout30:setHeight(30);
    obj.layout30:setMargins({bottom=4});
    obj.layout30:setName("layout30");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout30);
    obj.label50:setAlign("left");
    obj.label50:setText("Quantidade");
    obj.label50:setWidth(100);
    obj.label50:setAutoSize(true);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout30);
    obj.edit39:setAlign("client");
    obj.edit39:setField("campoQuantidade");
    obj.edit39:setName("edit39");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle34);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(30);
    obj.layout31:setMargins({bottom=4});
    obj.layout31:setName("layout31");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout31);
    obj.label51:setAlign("left");
    obj.label51:setText("Alcance");
    obj.label51:setWidth(100);
    obj.label51:setAutoSize(true);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout31);
    obj.edit40:setAlign("client");
    obj.edit40:setField("campoAlcance");
    obj.edit40:setName("edit40");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.rectangle34);
    obj.layout32:setAlign("top");
    obj.layout32:setHeight(30);
    obj.layout32:setMargins({bottom=4});
    obj.layout32:setName("layout32");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout32);
    obj.label52:setAlign("left");
    obj.label52:setText("Tempo");
    obj.label52:setWidth(100);
    obj.label52:setAutoSize(true);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout32);
    obj.edit41:setAlign("client");
    obj.edit41:setField("campoTempo");
    obj.edit41:setName("edit41");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle34);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(110);
    obj.layout33:setName("layout33");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout33);
    obj.layout34:setAlign("client");
    obj.layout34:setMargins({left=2});
    obj.layout34:setName("layout34");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout34);
    obj.textEditor4:setAlign("top");
    obj.textEditor4:setField("campoTextoGrande");
    obj.textEditor4:setHeight(150);
    obj.textEditor4:setName("textEditor4");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.scrollBox2);
    obj.layout35:setAlign("top");
    obj.layout35:setHeight(350);
    obj.layout35:setMargins({bottom=4});
    obj.layout35:setName("layout35");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout35);
    obj.rectangle35:setAlign("top");
    obj.rectangle35:setColor("grey");
    obj.rectangle35:setXradius(10);
    obj.rectangle35:setYradius(10);
    obj.rectangle35:setHeight(350);
    obj.rectangle35:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle35:setName("rectangle35");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle35);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(30);
    obj.layout36:setMargins({bottom=4});
    obj.layout36:setName("layout36");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout36);
    obj.button6:setText("Adicionar Genjutsu");
    obj.button6:setWidth(270);
    obj.button6:setAlign("left");
    obj.button6:setName("button6");

    obj.rclListaDosGenjutsus = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosGenjutsus:setParent(obj.rectangle35);
    obj.rclListaDosGenjutsus:setName("rclListaDosGenjutsus");
    obj.rclListaDosGenjutsus:setField("campoDosGenjutsus");
    obj.rclListaDosGenjutsus:setTemplateForm("frmLH2_2");
    obj.rclListaDosGenjutsus:setAlign("client");
    obj.rclListaDosGenjutsus:setHeight(300);
    obj.rclListaDosGenjutsus:setSelectable(true);

    obj.boxDetalhesDoGenjutsu = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoGenjutsu:setParent(obj.rectangle35);
    obj.boxDetalhesDoGenjutsu:setName("boxDetalhesDoGenjutsu");
    obj.boxDetalhesDoGenjutsu:setVisible(false);
    obj.boxDetalhesDoGenjutsu:setAlign("right");
    obj.boxDetalhesDoGenjutsu:setWidth(400);
    obj.boxDetalhesDoGenjutsu:setMargins({left=4, right=4});

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.boxDetalhesDoGenjutsu);
    obj.rectangle36:setAlign("top");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setXradius(10);
    obj.rectangle36:setYradius(10);
    obj.rectangle36:setHeight(300);
    obj.rectangle36:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle36:setName("rectangle36");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.rectangle36);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(30);
    obj.layout37:setMargins({bottom=4});
    obj.layout37:setName("layout37");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout37);
    obj.label53:setAlign("left");
    obj.label53:setText("Jutsu");
    obj.label53:setWidth(100);
    obj.label53:setAutoSize(true);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout37);
    obj.edit42:setAlign("client");
    obj.edit42:setField("campoGenjutsu");
    obj.edit42:setName("edit42");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle36);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(30);
    obj.layout38:setMargins({bottom=4});
    obj.layout38:setName("layout38");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout38);
    obj.label54:setAlign("left");
    obj.label54:setText("Gasto");
    obj.label54:setWidth(100);
    obj.label54:setAutoSize(true);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout38);
    obj.edit43:setAlign("client");
    obj.edit43:setField("campoGasto");
    obj.edit43:setName("edit43");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle36);
    obj.layout39:setAlign("top");
    obj.layout39:setHeight(30);
    obj.layout39:setMargins({bottom=4});
    obj.layout39:setName("layout39");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout39);
    obj.label55:setAlign("left");
    obj.label55:setText("Quantidade");
    obj.label55:setWidth(100);
    obj.label55:setAutoSize(true);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout39);
    obj.edit44:setAlign("client");
    obj.edit44:setField("campoQuantidade");
    obj.edit44:setName("edit44");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.rectangle36);
    obj.layout40:setAlign("top");
    obj.layout40:setHeight(30);
    obj.layout40:setMargins({bottom=4});
    obj.layout40:setName("layout40");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout40);
    obj.label56:setAlign("left");
    obj.label56:setText("Alcance");
    obj.label56:setWidth(100);
    obj.label56:setAutoSize(true);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout40);
    obj.edit45:setAlign("client");
    obj.edit45:setField("campoAlcance");
    obj.edit45:setName("edit45");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.rectangle36);
    obj.layout41:setAlign("top");
    obj.layout41:setHeight(30);
    obj.layout41:setMargins({bottom=4});
    obj.layout41:setName("layout41");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout41);
    obj.label57:setAlign("left");
    obj.label57:setText("Tempo");
    obj.label57:setWidth(100);
    obj.label57:setAutoSize(true);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout41);
    obj.edit46:setAlign("client");
    obj.edit46:setField("campoTempo");
    obj.edit46:setName("edit46");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.rectangle36);
    obj.layout42:setAlign("top");
    obj.layout42:setHeight(110);
    obj.layout42:setName("layout42");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setAlign("client");
    obj.layout43:setMargins({left=2});
    obj.layout43:setName("layout43");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout43);
    obj.textEditor5:setAlign("top");
    obj.textEditor5:setField("campoTextoGrande");
    obj.textEditor5:setHeight(150);
    obj.textEditor5:setName("textEditor5");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox2);
    obj.layout44:setAlign("top");
    obj.layout44:setHeight(350);
    obj.layout44:setMargins({bottom=4});
    obj.layout44:setName("layout44");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout44);
    obj.rectangle37:setAlign("top");
    obj.rectangle37:setColor("grey");
    obj.rectangle37:setXradius(10);
    obj.rectangle37:setYradius(10);
    obj.rectangle37:setHeight(350);
    obj.rectangle37:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle37:setName("rectangle37");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.rectangle37);
    obj.layout45:setAlign("top");
    obj.layout45:setHeight(30);
    obj.layout45:setMargins({bottom=4});
    obj.layout45:setName("layout45");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout45);
    obj.button7:setText("Adicionar Taijutsu");
    obj.button7:setWidth(270);
    obj.button7:setAlign("left");
    obj.button7:setName("button7");

    obj.rclListaDosTaijutsus = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTaijutsus:setParent(obj.rectangle37);
    obj.rclListaDosTaijutsus:setName("rclListaDosTaijutsus");
    obj.rclListaDosTaijutsus:setField("campoDosTaijutsus");
    obj.rclListaDosTaijutsus:setTemplateForm("frmLH2_3");
    obj.rclListaDosTaijutsus:setAlign("client");
    obj.rclListaDosTaijutsus:setHeight(300);
    obj.rclListaDosTaijutsus:setSelectable(true);

    obj.boxDetalhesDoTaijutsu = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoTaijutsu:setParent(obj.rectangle37);
    obj.boxDetalhesDoTaijutsu:setName("boxDetalhesDoTaijutsu");
    obj.boxDetalhesDoTaijutsu:setVisible(false);
    obj.boxDetalhesDoTaijutsu:setAlign("right");
    obj.boxDetalhesDoTaijutsu:setWidth(400);
    obj.boxDetalhesDoTaijutsu:setMargins({left=4, right=4});

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.boxDetalhesDoTaijutsu);
    obj.rectangle38:setAlign("top");
    obj.rectangle38:setColor("black");
    obj.rectangle38:setXradius(10);
    obj.rectangle38:setYradius(10);
    obj.rectangle38:setHeight(300);
    obj.rectangle38:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle38:setName("rectangle38");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.rectangle38);
    obj.layout46:setAlign("top");
    obj.layout46:setHeight(30);
    obj.layout46:setMargins({bottom=4});
    obj.layout46:setName("layout46");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout46);
    obj.label58:setAlign("left");
    obj.label58:setText("Jutsu");
    obj.label58:setWidth(100);
    obj.label58:setAutoSize(true);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout46);
    obj.edit47:setAlign("client");
    obj.edit47:setField("campoTaijutsu");
    obj.edit47:setName("edit47");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.rectangle38);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(30);
    obj.layout47:setMargins({bottom=4});
    obj.layout47:setName("layout47");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout47);
    obj.label59:setAlign("left");
    obj.label59:setText("Gasto");
    obj.label59:setWidth(100);
    obj.label59:setAutoSize(true);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout47);
    obj.edit48:setAlign("client");
    obj.edit48:setField("campoGasto");
    obj.edit48:setName("edit48");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.rectangle38);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(30);
    obj.layout48:setMargins({bottom=4});
    obj.layout48:setName("layout48");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout48);
    obj.label60:setAlign("left");
    obj.label60:setText("Quantidade");
    obj.label60:setWidth(100);
    obj.label60:setAutoSize(true);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout48);
    obj.edit49:setAlign("client");
    obj.edit49:setField("campoQuantidade");
    obj.edit49:setName("edit49");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.rectangle38);
    obj.layout49:setAlign("top");
    obj.layout49:setHeight(30);
    obj.layout49:setMargins({bottom=4});
    obj.layout49:setName("layout49");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout49);
    obj.label61:setAlign("left");
    obj.label61:setText("Alcance");
    obj.label61:setWidth(100);
    obj.label61:setAutoSize(true);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout49);
    obj.edit50:setAlign("client");
    obj.edit50:setField("campoAlcance");
    obj.edit50:setName("edit50");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.rectangle38);
    obj.layout50:setAlign("top");
    obj.layout50:setHeight(30);
    obj.layout50:setMargins({bottom=4});
    obj.layout50:setName("layout50");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout50);
    obj.label62:setAlign("left");
    obj.label62:setText("Tempo");
    obj.label62:setWidth(100);
    obj.label62:setAutoSize(true);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout50);
    obj.edit51:setAlign("client");
    obj.edit51:setField("campoTempo");
    obj.edit51:setName("edit51");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.rectangle38);
    obj.layout51:setAlign("top");
    obj.layout51:setHeight(110);
    obj.layout51:setName("layout51");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout51);
    obj.layout52:setAlign("client");
    obj.layout52:setMargins({left=2});
    obj.layout52:setName("layout52");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout52);
    obj.textEditor6:setAlign("top");
    obj.textEditor6:setField("campoTextoGrande");
    obj.textEditor6:setHeight(150);
    obj.textEditor6:setName("textEditor6");

    obj.basicoclan = gui.fromHandle(_obj_newObject("tab"));
    obj.basicoclan:setParent(obj.tabControl1);
    obj.basicoclan:setName("basicoclan");
    obj.basicoclan:setVisible(false);
    obj.basicoclan:setTitle("Básicos/Clan");

    obj.frmLH3 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH3:setParent(obj.basicoclan);
    obj.frmLH3:setName("frmLH3");
    obj.frmLH3:setTheme("dark");
    obj.frmLH3:setWidth(710);
    obj.frmLH3:setPadding({left=4, top=4, right=4, bottom=4});

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmLH3);
    obj.scrollBox3:setAlign("top");
    obj.scrollBox3:setHeight(800);
    obj.scrollBox3:setWidth(700);
    obj.scrollBox3:setName("scrollBox3");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox3);
    obj.layout53:setAlign("top");
    obj.layout53:setHeight(350);
    obj.layout53:setMargins({bottom=4});
    obj.layout53:setName("layout53");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout53);
    obj.rectangle39:setAlign("top");
    obj.rectangle39:setColor("grey");
    obj.rectangle39:setXradius(10);
    obj.rectangle39:setYradius(10);
    obj.rectangle39:setHeight(350);
    obj.rectangle39:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle39:setName("rectangle39");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.rectangle39);
    obj.layout54:setAlign("top");
    obj.layout54:setHeight(30);
    obj.layout54:setMargins({bottom=4});
    obj.layout54:setName("layout54");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout54);
    obj.button8:setText("Adicionar Basico");
    obj.button8:setWidth(270);
    obj.button8:setAlign("left");
    obj.button8:setName("button8");

    obj.rclListaDosBasicos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosBasicos:setParent(obj.rectangle39);
    obj.rclListaDosBasicos:setName("rclListaDosBasicos");
    obj.rclListaDosBasicos:setField("campoDosBasicos");
    obj.rclListaDosBasicos:setTemplateForm("frmLH3_1");
    obj.rclListaDosBasicos:setAlign("client");
    obj.rclListaDosBasicos:setHeight(300);
    obj.rclListaDosBasicos:setSelectable(true);

    obj.boxDetalhesDoBasico = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoBasico:setParent(obj.rectangle39);
    obj.boxDetalhesDoBasico:setName("boxDetalhesDoBasico");
    obj.boxDetalhesDoBasico:setVisible(false);
    obj.boxDetalhesDoBasico:setAlign("right");
    obj.boxDetalhesDoBasico:setWidth(400);
    obj.boxDetalhesDoBasico:setMargins({left=4, right=4});

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.boxDetalhesDoBasico);
    obj.rectangle40:setAlign("top");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setXradius(10);
    obj.rectangle40:setYradius(10);
    obj.rectangle40:setHeight(300);
    obj.rectangle40:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle40:setName("rectangle40");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.rectangle40);
    obj.layout55:setAlign("top");
    obj.layout55:setHeight(30);
    obj.layout55:setMargins({bottom=4});
    obj.layout55:setName("layout55");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout55);
    obj.label63:setAlign("left");
    obj.label63:setText("Jutsu");
    obj.label63:setWidth(100);
    obj.label63:setAutoSize(true);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout55);
    obj.edit52:setAlign("client");
    obj.edit52:setField("campoBasico");
    obj.edit52:setName("edit52");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.rectangle40);
    obj.layout56:setAlign("top");
    obj.layout56:setHeight(30);
    obj.layout56:setMargins({bottom=4});
    obj.layout56:setName("layout56");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout56);
    obj.label64:setAlign("left");
    obj.label64:setText("Gasto");
    obj.label64:setWidth(100);
    obj.label64:setAutoSize(true);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout56);
    obj.edit53:setAlign("client");
    obj.edit53:setField("campoGasto");
    obj.edit53:setName("edit53");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.rectangle40);
    obj.layout57:setAlign("top");
    obj.layout57:setHeight(30);
    obj.layout57:setMargins({bottom=4});
    obj.layout57:setName("layout57");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout57);
    obj.label65:setAlign("left");
    obj.label65:setText("Quantidade");
    obj.label65:setWidth(100);
    obj.label65:setAutoSize(true);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout57);
    obj.edit54:setAlign("client");
    obj.edit54:setField("campoQuantidade");
    obj.edit54:setName("edit54");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.rectangle40);
    obj.layout58:setAlign("top");
    obj.layout58:setHeight(30);
    obj.layout58:setMargins({bottom=4});
    obj.layout58:setName("layout58");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout58);
    obj.label66:setAlign("left");
    obj.label66:setText("Alcance");
    obj.label66:setWidth(100);
    obj.label66:setAutoSize(true);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout58);
    obj.edit55:setAlign("client");
    obj.edit55:setField("campoAlcance");
    obj.edit55:setName("edit55");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.rectangle40);
    obj.layout59:setAlign("top");
    obj.layout59:setHeight(30);
    obj.layout59:setMargins({bottom=4});
    obj.layout59:setName("layout59");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout59);
    obj.label67:setAlign("left");
    obj.label67:setText("Tempo");
    obj.label67:setWidth(100);
    obj.label67:setAutoSize(true);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout59);
    obj.edit56:setAlign("client");
    obj.edit56:setField("campoTempo");
    obj.edit56:setName("edit56");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.rectangle40);
    obj.layout60:setAlign("top");
    obj.layout60:setHeight(110);
    obj.layout60:setName("layout60");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout60);
    obj.layout61:setAlign("client");
    obj.layout61:setMargins({left=2});
    obj.layout61:setName("layout61");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout61);
    obj.textEditor7:setAlign("top");
    obj.textEditor7:setField("campoTextoGrande");
    obj.textEditor7:setHeight(150);
    obj.textEditor7:setName("textEditor7");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.scrollBox3);
    obj.layout62:setAlign("top");
    obj.layout62:setHeight(350);
    obj.layout62:setMargins({bottom=4});
    obj.layout62:setName("layout62");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout62);
    obj.rectangle41:setAlign("top");
    obj.rectangle41:setColor("grey");
    obj.rectangle41:setXradius(10);
    obj.rectangle41:setYradius(10);
    obj.rectangle41:setHeight(350);
    obj.rectangle41:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle41:setName("rectangle41");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.rectangle41);
    obj.layout63:setAlign("top");
    obj.layout63:setHeight(30);
    obj.layout63:setMargins({bottom=4});
    obj.layout63:setName("layout63");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout63);
    obj.button9:setText("Adicionar Jutsu do Clan");
    obj.button9:setWidth(270);
    obj.button9:setAlign("left");
    obj.button9:setName("button9");

    obj.rclListaDosClans = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosClans:setParent(obj.rectangle41);
    obj.rclListaDosClans:setName("rclListaDosClans");
    obj.rclListaDosClans:setField("campoDosClans");
    obj.rclListaDosClans:setTemplateForm("frmLH3_2");
    obj.rclListaDosClans:setAlign("client");
    obj.rclListaDosClans:setHeight(300);
    obj.rclListaDosClans:setSelectable(true);

    obj.boxDetalhesDoClan = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoClan:setParent(obj.rectangle41);
    obj.boxDetalhesDoClan:setName("boxDetalhesDoClan");
    obj.boxDetalhesDoClan:setVisible(false);
    obj.boxDetalhesDoClan:setAlign("right");
    obj.boxDetalhesDoClan:setWidth(400);
    obj.boxDetalhesDoClan:setMargins({left=4, right=4});

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.boxDetalhesDoClan);
    obj.rectangle42:setAlign("top");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setXradius(10);
    obj.rectangle42:setYradius(10);
    obj.rectangle42:setHeight(300);
    obj.rectangle42:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle42:setName("rectangle42");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.rectangle42);
    obj.layout64:setAlign("top");
    obj.layout64:setHeight(30);
    obj.layout64:setMargins({bottom=4});
    obj.layout64:setName("layout64");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout64);
    obj.label68:setAlign("left");
    obj.label68:setText("Jutsu");
    obj.label68:setWidth(100);
    obj.label68:setAutoSize(true);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout64);
    obj.edit57:setAlign("client");
    obj.edit57:setField("campoClan");
    obj.edit57:setName("edit57");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.rectangle42);
    obj.layout65:setAlign("top");
    obj.layout65:setHeight(30);
    obj.layout65:setMargins({bottom=4});
    obj.layout65:setName("layout65");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout65);
    obj.label69:setAlign("left");
    obj.label69:setText("Gasto");
    obj.label69:setWidth(100);
    obj.label69:setAutoSize(true);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout65);
    obj.edit58:setAlign("client");
    obj.edit58:setField("campoGasto");
    obj.edit58:setName("edit58");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.rectangle42);
    obj.layout66:setAlign("top");
    obj.layout66:setHeight(30);
    obj.layout66:setMargins({bottom=4});
    obj.layout66:setName("layout66");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout66);
    obj.label70:setAlign("left");
    obj.label70:setText("Quantidade");
    obj.label70:setWidth(100);
    obj.label70:setAutoSize(true);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout66);
    obj.edit59:setAlign("client");
    obj.edit59:setField("campoQuantidade");
    obj.edit59:setName("edit59");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.rectangle42);
    obj.layout67:setAlign("top");
    obj.layout67:setHeight(30);
    obj.layout67:setMargins({bottom=4});
    obj.layout67:setName("layout67");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout67);
    obj.label71:setAlign("left");
    obj.label71:setText("Alcance");
    obj.label71:setWidth(100);
    obj.label71:setAutoSize(true);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout67);
    obj.edit60:setAlign("client");
    obj.edit60:setField("campoAlcance");
    obj.edit60:setName("edit60");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.rectangle42);
    obj.layout68:setAlign("top");
    obj.layout68:setHeight(30);
    obj.layout68:setMargins({bottom=4});
    obj.layout68:setName("layout68");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout68);
    obj.label72:setAlign("left");
    obj.label72:setText("Tempo");
    obj.label72:setWidth(100);
    obj.label72:setAutoSize(true);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout68);
    obj.edit61:setAlign("client");
    obj.edit61:setField("campoTempo");
    obj.edit61:setName("edit61");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.rectangle42);
    obj.layout69:setAlign("top");
    obj.layout69:setHeight(110);
    obj.layout69:setName("layout69");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout69);
    obj.layout70:setAlign("client");
    obj.layout70:setMargins({left=2});
    obj.layout70:setName("layout70");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout70);
    obj.textEditor8:setAlign("top");
    obj.textEditor8:setField("campoTextoGrande");
    obj.textEditor8:setHeight(150);
    obj.textEditor8:setName("textEditor8");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.scrollBox3);
    obj.layout71:setAlign("top");
    obj.layout71:setHeight(350);
    obj.layout71:setMargins({bottom=4});
    obj.layout71:setName("layout71");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout71);
    obj.rectangle43:setAlign("top");
    obj.rectangle43:setColor("grey");
    obj.rectangle43:setXradius(10);
    obj.rectangle43:setYradius(10);
    obj.rectangle43:setHeight(350);
    obj.rectangle43:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle43:setName("rectangle43");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.rectangle43);
    obj.layout72:setAlign("top");
    obj.layout72:setHeight(30);
    obj.layout72:setMargins({bottom=4});
    obj.layout72:setName("layout72");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout72);
    obj.button10:setText("Adicionar Informação do Kekkei Genkai");
    obj.button10:setWidth(270);
    obj.button10:setAlign("left");
    obj.button10:setName("button10");

    obj.rclListaDosKekkeis = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKekkeis:setParent(obj.rectangle43);
    obj.rclListaDosKekkeis:setName("rclListaDosKekkeis");
    obj.rclListaDosKekkeis:setField("campoDosKekkeis");
    obj.rclListaDosKekkeis:setTemplateForm("frmLH3_3");
    obj.rclListaDosKekkeis:setAlign("client");
    obj.rclListaDosKekkeis:setHeight(300);
    obj.rclListaDosKekkeis:setSelectable(true);

    obj.boxDetalhesDoKekkei = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoKekkei:setParent(obj.rectangle43);
    obj.boxDetalhesDoKekkei:setName("boxDetalhesDoKekkei");
    obj.boxDetalhesDoKekkei:setVisible(false);
    obj.boxDetalhesDoKekkei:setAlign("right");
    obj.boxDetalhesDoKekkei:setWidth(400);
    obj.boxDetalhesDoKekkei:setMargins({left=4, right=4});

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.boxDetalhesDoKekkei);
    obj.rectangle44:setAlign("top");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setXradius(10);
    obj.rectangle44:setYradius(10);
    obj.rectangle44:setHeight(300);
    obj.rectangle44:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle44:setName("rectangle44");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.rectangle44);
    obj.layout73:setAlign("top");
    obj.layout73:setHeight(30);
    obj.layout73:setMargins({bottom=4});
    obj.layout73:setName("layout73");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout73);
    obj.label73:setAlign("left");
    obj.label73:setText("Nome");
    obj.label73:setWidth(100);
    obj.label73:setAutoSize(true);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout73);
    obj.edit62:setAlign("client");
    obj.edit62:setField("campoKekkei");
    obj.edit62:setName("edit62");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.rectangle44);
    obj.layout74:setAlign("top");
    obj.layout74:setHeight(30);
    obj.layout74:setMargins({bottom=4});
    obj.layout74:setName("layout74");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout74);
    obj.label74:setAlign("left");
    obj.label74:setText("Descrição");
    obj.label74:setWidth(395);
    obj.label74:setAutoSize(true);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.layout75 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout75:setParent(obj.rectangle44);
    obj.layout75:setAlign("top");
    obj.layout75:setHeight(210);
    obj.layout75:setName("layout75");

    obj.layout76 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout76:setParent(obj.layout75);
    obj.layout76:setAlign("client");
    obj.layout76:setMargins({left=2});
    obj.layout76:setName("layout76");

    obj.textEditor9 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout76);
    obj.textEditor9:setAlign("top");
    obj.textEditor9:setField("campoTextoGrande");
    obj.textEditor9:setHeight(250);
    obj.textEditor9:setName("textEditor9");

    obj.jutsusOUTROS = gui.fromHandle(_obj_newObject("tab"));
    obj.jutsusOUTROS:setParent(obj.tabControl1);
    obj.jutsusOUTROS:setName("jutsusOUTROS");
    obj.jutsusOUTROS:setVisible(false);
    obj.jutsusOUTROS:setTitle("KEN/Kuchyose/EstLuta");

    obj.frmLH4 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH4:setParent(obj.jutsusOUTROS);
    obj.frmLH4:setName("frmLH4");
    obj.frmLH4:setTheme("dark");
    obj.frmLH4:setWidth(710);
    obj.frmLH4:setPadding({left=4, top=4, right=4, bottom=4});

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmLH4);
    obj.scrollBox4:setAlign("top");
    obj.scrollBox4:setHeight(800);
    obj.scrollBox4:setWidth(700);
    obj.scrollBox4:setName("scrollBox4");

    obj.layout77 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout77:setParent(obj.scrollBox4);
    obj.layout77:setAlign("top");
    obj.layout77:setHeight(350);
    obj.layout77:setMargins({bottom=4});
    obj.layout77:setName("layout77");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout77);
    obj.rectangle45:setAlign("top");
    obj.rectangle45:setColor("grey");
    obj.rectangle45:setXradius(10);
    obj.rectangle45:setYradius(10);
    obj.rectangle45:setHeight(350);
    obj.rectangle45:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle45:setName("rectangle45");

    obj.layout78 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout78:setParent(obj.rectangle45);
    obj.layout78:setAlign("top");
    obj.layout78:setHeight(30);
    obj.layout78:setMargins({bottom=4});
    obj.layout78:setName("layout78");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout78);
    obj.button11:setText("Adicionar Kenjutsu");
    obj.button11:setWidth(270);
    obj.button11:setAlign("left");
    obj.button11:setName("button11");

    obj.rclListaDosKenjutsus = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKenjutsus:setParent(obj.rectangle45);
    obj.rclListaDosKenjutsus:setName("rclListaDosKenjutsus");
    obj.rclListaDosKenjutsus:setField("campoDosKenjutsus");
    obj.rclListaDosKenjutsus:setTemplateForm("frmLH4_1");
    obj.rclListaDosKenjutsus:setAlign("client");
    obj.rclListaDosKenjutsus:setHeight(300);
    obj.rclListaDosKenjutsus:setSelectable(true);

    obj.boxDetalhesDoKenjutsu = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoKenjutsu:setParent(obj.rectangle45);
    obj.boxDetalhesDoKenjutsu:setName("boxDetalhesDoKenjutsu");
    obj.boxDetalhesDoKenjutsu:setVisible(false);
    obj.boxDetalhesDoKenjutsu:setAlign("right");
    obj.boxDetalhesDoKenjutsu:setWidth(400);
    obj.boxDetalhesDoKenjutsu:setMargins({left=4, right=4});

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.boxDetalhesDoKenjutsu);
    obj.rectangle46:setAlign("top");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setXradius(10);
    obj.rectangle46:setYradius(10);
    obj.rectangle46:setHeight(300);
    obj.rectangle46:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle46:setName("rectangle46");

    obj.layout79 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout79:setParent(obj.rectangle46);
    obj.layout79:setAlign("top");
    obj.layout79:setHeight(30);
    obj.layout79:setMargins({bottom=4});
    obj.layout79:setName("layout79");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout79);
    obj.label75:setAlign("left");
    obj.label75:setText("Jutsu");
    obj.label75:setWidth(100);
    obj.label75:setAutoSize(true);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout79);
    obj.edit63:setAlign("client");
    obj.edit63:setField("campoKenjutsu");
    obj.edit63:setName("edit63");

    obj.layout80 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout80:setParent(obj.rectangle46);
    obj.layout80:setAlign("top");
    obj.layout80:setHeight(30);
    obj.layout80:setMargins({bottom=4});
    obj.layout80:setName("layout80");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout80);
    obj.label76:setAlign("left");
    obj.label76:setText("Gasto");
    obj.label76:setWidth(100);
    obj.label76:setAutoSize(true);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout80);
    obj.edit64:setAlign("client");
    obj.edit64:setField("campoGasto");
    obj.edit64:setName("edit64");

    obj.layout81 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout81:setParent(obj.rectangle46);
    obj.layout81:setAlign("top");
    obj.layout81:setHeight(30);
    obj.layout81:setMargins({bottom=4});
    obj.layout81:setName("layout81");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout81);
    obj.label77:setAlign("left");
    obj.label77:setText("Quantidade");
    obj.label77:setWidth(100);
    obj.label77:setAutoSize(true);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout81);
    obj.edit65:setAlign("client");
    obj.edit65:setField("campoQuantidade");
    obj.edit65:setName("edit65");

    obj.layout82 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout82:setParent(obj.rectangle46);
    obj.layout82:setAlign("top");
    obj.layout82:setHeight(30);
    obj.layout82:setMargins({bottom=4});
    obj.layout82:setName("layout82");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout82);
    obj.label78:setAlign("left");
    obj.label78:setText("Alcance");
    obj.label78:setWidth(100);
    obj.label78:setAutoSize(true);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout82);
    obj.edit66:setAlign("client");
    obj.edit66:setField("campoAlcance");
    obj.edit66:setName("edit66");

    obj.layout83 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout83:setParent(obj.rectangle46);
    obj.layout83:setAlign("top");
    obj.layout83:setHeight(30);
    obj.layout83:setMargins({bottom=4});
    obj.layout83:setName("layout83");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout83);
    obj.label79:setAlign("left");
    obj.label79:setText("Tempo");
    obj.label79:setWidth(100);
    obj.label79:setAutoSize(true);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout83);
    obj.edit67:setAlign("client");
    obj.edit67:setField("campoTempo");
    obj.edit67:setName("edit67");

    obj.layout84 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout84:setParent(obj.rectangle46);
    obj.layout84:setAlign("top");
    obj.layout84:setHeight(110);
    obj.layout84:setName("layout84");

    obj.layout85 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout85:setParent(obj.layout84);
    obj.layout85:setAlign("client");
    obj.layout85:setMargins({left=2});
    obj.layout85:setName("layout85");

    obj.textEditor10 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout85);
    obj.textEditor10:setAlign("top");
    obj.textEditor10:setField("campoTextoGrande");
    obj.textEditor10:setHeight(150);
    obj.textEditor10:setName("textEditor10");

    obj.layout86 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout86:setParent(obj.scrollBox4);
    obj.layout86:setAlign("top");
    obj.layout86:setHeight(350);
    obj.layout86:setMargins({bottom=4});
    obj.layout86:setName("layout86");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout86);
    obj.rectangle47:setAlign("top");
    obj.rectangle47:setColor("grey");
    obj.rectangle47:setXradius(10);
    obj.rectangle47:setYradius(10);
    obj.rectangle47:setHeight(350);
    obj.rectangle47:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle47:setName("rectangle47");

    obj.layout87 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout87:setParent(obj.rectangle47);
    obj.layout87:setAlign("top");
    obj.layout87:setHeight(30);
    obj.layout87:setMargins({bottom=4});
    obj.layout87:setName("layout87");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout87);
    obj.button12:setText("Adicionar Kuchyose");
    obj.button12:setWidth(270);
    obj.button12:setAlign("left");
    obj.button12:setName("button12");

    obj.rclListaDosKuchyoses = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosKuchyoses:setParent(obj.rectangle47);
    obj.rclListaDosKuchyoses:setName("rclListaDosKuchyoses");
    obj.rclListaDosKuchyoses:setField("campoDosKuchyoses");
    obj.rclListaDosKuchyoses:setTemplateForm("frmLH4_2");
    obj.rclListaDosKuchyoses:setAlign("client");
    obj.rclListaDosKuchyoses:setHeight(300);
    obj.rclListaDosKuchyoses:setSelectable(true);

    obj.boxDetalhesDoKuchyose = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoKuchyose:setParent(obj.rectangle47);
    obj.boxDetalhesDoKuchyose:setName("boxDetalhesDoKuchyose");
    obj.boxDetalhesDoKuchyose:setVisible(false);
    obj.boxDetalhesDoKuchyose:setAlign("right");
    obj.boxDetalhesDoKuchyose:setWidth(400);
    obj.boxDetalhesDoKuchyose:setMargins({left=4, right=4});

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.boxDetalhesDoKuchyose);
    obj.rectangle48:setAlign("top");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setXradius(10);
    obj.rectangle48:setYradius(10);
    obj.rectangle48:setHeight(300);
    obj.rectangle48:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle48:setName("rectangle48");

    obj.layout88 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout88:setParent(obj.rectangle48);
    obj.layout88:setAlign("top");
    obj.layout88:setHeight(30);
    obj.layout88:setMargins({bottom=4});
    obj.layout88:setName("layout88");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout88);
    obj.label80:setAlign("left");
    obj.label80:setText("Jutsu");
    obj.label80:setWidth(100);
    obj.label80:setAutoSize(true);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout88);
    obj.edit68:setAlign("client");
    obj.edit68:setField("campoKuchyose");
    obj.edit68:setName("edit68");

    obj.layout89 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout89:setParent(obj.rectangle48);
    obj.layout89:setAlign("top");
    obj.layout89:setHeight(30);
    obj.layout89:setMargins({bottom=4});
    obj.layout89:setName("layout89");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout89);
    obj.label81:setAlign("left");
    obj.label81:setText("Gasto");
    obj.label81:setWidth(100);
    obj.label81:setAutoSize(true);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout89);
    obj.edit69:setAlign("client");
    obj.edit69:setField("campoGasto");
    obj.edit69:setName("edit69");

    obj.layout90 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout90:setParent(obj.rectangle48);
    obj.layout90:setAlign("top");
    obj.layout90:setHeight(30);
    obj.layout90:setMargins({bottom=4});
    obj.layout90:setName("layout90");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout90);
    obj.label82:setAlign("left");
    obj.label82:setText("Quantidade");
    obj.label82:setWidth(100);
    obj.label82:setAutoSize(true);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout90);
    obj.edit70:setAlign("client");
    obj.edit70:setField("campoQuantidade");
    obj.edit70:setName("edit70");

    obj.layout91 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout91:setParent(obj.rectangle48);
    obj.layout91:setAlign("top");
    obj.layout91:setHeight(30);
    obj.layout91:setMargins({bottom=4});
    obj.layout91:setName("layout91");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout91);
    obj.label83:setAlign("left");
    obj.label83:setText("Alcance");
    obj.label83:setWidth(100);
    obj.label83:setAutoSize(true);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout91);
    obj.edit71:setAlign("client");
    obj.edit71:setField("campoAlcance");
    obj.edit71:setName("edit71");

    obj.layout92 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout92:setParent(obj.rectangle48);
    obj.layout92:setAlign("top");
    obj.layout92:setHeight(30);
    obj.layout92:setMargins({bottom=4});
    obj.layout92:setName("layout92");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout92);
    obj.label84:setAlign("left");
    obj.label84:setText("Tempo");
    obj.label84:setWidth(100);
    obj.label84:setAutoSize(true);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout92);
    obj.edit72:setAlign("client");
    obj.edit72:setField("campoTempo");
    obj.edit72:setName("edit72");

    obj.layout93 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout93:setParent(obj.rectangle48);
    obj.layout93:setAlign("top");
    obj.layout93:setHeight(110);
    obj.layout93:setName("layout93");

    obj.layout94 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout94:setParent(obj.layout93);
    obj.layout94:setAlign("client");
    obj.layout94:setMargins({left=2});
    obj.layout94:setName("layout94");

    obj.textEditor11 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor11:setParent(obj.layout94);
    obj.textEditor11:setAlign("top");
    obj.textEditor11:setField("campoTextoGrande");
    obj.textEditor11:setHeight(150);
    obj.textEditor11:setName("textEditor11");

    obj.layout95 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout95:setParent(obj.scrollBox4);
    obj.layout95:setAlign("top");
    obj.layout95:setHeight(350);
    obj.layout95:setMargins({bottom=4});
    obj.layout95:setName("layout95");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout95);
    obj.rectangle49:setAlign("top");
    obj.rectangle49:setColor("grey");
    obj.rectangle49:setXradius(10);
    obj.rectangle49:setYradius(10);
    obj.rectangle49:setHeight(350);
    obj.rectangle49:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle49:setName("rectangle49");

    obj.layout96 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout96:setParent(obj.rectangle49);
    obj.layout96:setAlign("top");
    obj.layout96:setHeight(30);
    obj.layout96:setMargins({bottom=4});
    obj.layout96:setName("layout96");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout96);
    obj.button13:setText("Adicionar Estilo de Luta");
    obj.button13:setWidth(270);
    obj.button13:setAlign("left");
    obj.button13:setName("button13");

    obj.rclListaDosEstLutas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEstLutas:setParent(obj.rectangle49);
    obj.rclListaDosEstLutas:setName("rclListaDosEstLutas");
    obj.rclListaDosEstLutas:setField("campoDosEstLutas");
    obj.rclListaDosEstLutas:setTemplateForm("frmLH2_3");
    obj.rclListaDosEstLutas:setAlign("client");
    obj.rclListaDosEstLutas:setHeight(300);
    obj.rclListaDosEstLutas:setSelectable(true);

    obj.boxDetalhesDoEstLuta = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoEstLuta:setParent(obj.rectangle49);
    obj.boxDetalhesDoEstLuta:setName("boxDetalhesDoEstLuta");
    obj.boxDetalhesDoEstLuta:setVisible(false);
    obj.boxDetalhesDoEstLuta:setAlign("right");
    obj.boxDetalhesDoEstLuta:setWidth(400);
    obj.boxDetalhesDoEstLuta:setMargins({left=4, right=4});

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.boxDetalhesDoEstLuta);
    obj.rectangle50:setAlign("top");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setXradius(10);
    obj.rectangle50:setYradius(10);
    obj.rectangle50:setHeight(300);
    obj.rectangle50:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle50:setName("rectangle50");

    obj.layout97 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout97:setParent(obj.rectangle50);
    obj.layout97:setAlign("top");
    obj.layout97:setHeight(30);
    obj.layout97:setMargins({bottom=4});
    obj.layout97:setName("layout97");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout97);
    obj.label85:setAlign("left");
    obj.label85:setText("Nome");
    obj.label85:setWidth(100);
    obj.label85:setAutoSize(true);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout97);
    obj.edit73:setAlign("client");
    obj.edit73:setField("campoEstLuta");
    obj.edit73:setName("edit73");

    obj.layout98 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout98:setParent(obj.rectangle50);
    obj.layout98:setAlign("top");
    obj.layout98:setHeight(30);
    obj.layout98:setMargins({bottom=4});
    obj.layout98:setName("layout98");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout98);
    obj.label86:setAlign("left");
    obj.label86:setText("Gasto");
    obj.label86:setWidth(100);
    obj.label86:setAutoSize(true);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout98);
    obj.edit74:setAlign("client");
    obj.edit74:setField("campoGasto");
    obj.edit74:setName("edit74");

    obj.layout99 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout99:setParent(obj.rectangle50);
    obj.layout99:setAlign("top");
    obj.layout99:setHeight(30);
    obj.layout99:setMargins({bottom=4});
    obj.layout99:setName("layout99");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout99);
    obj.label87:setAlign("left");
    obj.label87:setText("Quantidade");
    obj.label87:setWidth(100);
    obj.label87:setAutoSize(true);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout99);
    obj.edit75:setAlign("client");
    obj.edit75:setField("campoQuantidade");
    obj.edit75:setName("edit75");

    obj.layout100 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout100:setParent(obj.rectangle50);
    obj.layout100:setAlign("top");
    obj.layout100:setHeight(30);
    obj.layout100:setMargins({bottom=4});
    obj.layout100:setName("layout100");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout100);
    obj.label88:setAlign("left");
    obj.label88:setText("Alcance");
    obj.label88:setWidth(100);
    obj.label88:setAutoSize(true);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout100);
    obj.edit76:setAlign("client");
    obj.edit76:setField("campoAlcance");
    obj.edit76:setName("edit76");

    obj.layout101 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout101:setParent(obj.rectangle50);
    obj.layout101:setAlign("top");
    obj.layout101:setHeight(30);
    obj.layout101:setMargins({bottom=4});
    obj.layout101:setName("layout101");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout101);
    obj.label89:setAlign("left");
    obj.label89:setText("Tempo");
    obj.label89:setWidth(100);
    obj.label89:setAutoSize(true);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout101);
    obj.edit77:setAlign("client");
    obj.edit77:setField("campoTempo");
    obj.edit77:setName("edit77");

    obj.layout102 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout102:setParent(obj.rectangle50);
    obj.layout102:setAlign("top");
    obj.layout102:setHeight(110);
    obj.layout102:setName("layout102");

    obj.layout103 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout103:setParent(obj.layout102);
    obj.layout103:setAlign("client");
    obj.layout103:setMargins({left=2});
    obj.layout103:setName("layout103");

    obj.textEditor12 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor12:setParent(obj.layout103);
    obj.textEditor12:setAlign("top");
    obj.textEditor12:setField("campoTextoGrande");
    obj.textEditor12:setHeight(150);
    obj.textEditor12:setName("textEditor12");

    obj.inventario = gui.fromHandle(_obj_newObject("tab"));
    obj.inventario:setParent(obj.tabControl1);
    obj.inventario:setName("inventario");
    obj.inventario:setVisible(false);
    obj.inventario:setTitle("Inventario");

    obj.frmLH5 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH5:setParent(obj.inventario);
    obj.frmLH5:setName("frmLH5");
    obj.frmLH5:setAlign("client");
    obj.frmLH5:setTheme("dark");
    obj.frmLH5:setMargins({top=1});

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmLH5);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout104 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout104:setParent(obj.scrollBox5);
    obj.layout104:setLeft(0);
    obj.layout104:setTop(0);
    obj.layout104:setWidth(400);
    obj.layout104:setHeight(150);
    obj.layout104:setName("layout104");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout104);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setXradius(5);
    obj.rectangle51:setYradius(5);
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setName("rectangle51");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout104);
    obj.label90:setLeft(5);
    obj.label90:setTop(5);
    obj.label90:setWidth(95);
    obj.label90:setHeight(25);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setText("Nome");
    obj.label90:setName("label90");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout104);
    obj.edit78:setLeft(100);
    obj.edit78:setTop(5);
    obj.edit78:setWidth(295);
    obj.edit78:setHeight(25);
    obj.edit78:setField("nome_item1");
    obj.edit78:setName("edit78");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout104);
    obj.label91:setLeft(5);
    obj.label91:setTop(30);
    obj.label91:setWidth(95);
    obj.label91:setHeight(25);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setText("Quantidade");
    obj.label91:setName("label91");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout104);
    obj.edit79:setLeft(100);
    obj.edit79:setTop(30);
    obj.edit79:setWidth(205);
    obj.edit79:setHeight(25);
    obj.edit79:setField("qtd_item1");
    obj.edit79:setName("edit79");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout104);
    obj.label92:setLeft(310);
    obj.label92:setTop(30);
    obj.label92:setWidth(45);
    obj.label92:setHeight(25);
    obj.label92:setText("Preço");
    obj.label92:setName("label92");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout104);
    obj.edit80:setLeft(345);
    obj.edit80:setTop(30);
    obj.edit80:setWidth(50);
    obj.edit80:setHeight(25);
    obj.edit80:setField("preco_item1");
    obj.edit80:setName("edit80");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout104);
    obj.label93:setLeft(0);
    obj.label93:setTop(60);
    obj.label93:setWidth(400);
    obj.label93:setHeight(25);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setText("Descrição");
    obj.label93:setName("label93");

    obj.textEditor13 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor13:setParent(obj.layout104);
    obj.textEditor13:setLeft(5);
    obj.textEditor13:setTop(85);
    obj.textEditor13:setWidth(390);
    obj.textEditor13:setHeight(60);
    obj.textEditor13:setField("tag_item1");
    obj.textEditor13:setName("textEditor13");

    obj.layout105 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout105:setParent(obj.scrollBox5);
    obj.layout105:setLeft(405);
    obj.layout105:setTop(0);
    obj.layout105:setWidth(400);
    obj.layout105:setHeight(150);
    obj.layout105:setName("layout105");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout105);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setXradius(5);
    obj.rectangle52:setYradius(5);
    obj.rectangle52:setCornerType("round");
    obj.rectangle52:setName("rectangle52");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout105);
    obj.label94:setLeft(5);
    obj.label94:setTop(5);
    obj.label94:setWidth(95);
    obj.label94:setHeight(25);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setText("Nome");
    obj.label94:setName("label94");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout105);
    obj.edit81:setLeft(100);
    obj.edit81:setTop(5);
    obj.edit81:setWidth(295);
    obj.edit81:setHeight(25);
    obj.edit81:setField("nome_item2");
    obj.edit81:setName("edit81");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout105);
    obj.label95:setLeft(5);
    obj.label95:setTop(30);
    obj.label95:setWidth(95);
    obj.label95:setHeight(25);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setText("Quantidade");
    obj.label95:setName("label95");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout105);
    obj.edit82:setLeft(100);
    obj.edit82:setTop(30);
    obj.edit82:setWidth(205);
    obj.edit82:setHeight(25);
    obj.edit82:setField("qtd_item2");
    obj.edit82:setName("edit82");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout105);
    obj.label96:setLeft(310);
    obj.label96:setTop(30);
    obj.label96:setWidth(45);
    obj.label96:setHeight(25);
    obj.label96:setText("Preço");
    obj.label96:setName("label96");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout105);
    obj.edit83:setLeft(345);
    obj.edit83:setTop(30);
    obj.edit83:setWidth(50);
    obj.edit83:setHeight(25);
    obj.edit83:setField("preco_item2");
    obj.edit83:setName("edit83");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout105);
    obj.label97:setLeft(0);
    obj.label97:setTop(60);
    obj.label97:setWidth(400);
    obj.label97:setHeight(25);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setText("Descrição");
    obj.label97:setName("label97");

    obj.textEditor14 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor14:setParent(obj.layout105);
    obj.textEditor14:setLeft(5);
    obj.textEditor14:setTop(85);
    obj.textEditor14:setWidth(390);
    obj.textEditor14:setHeight(60);
    obj.textEditor14:setField("tag_item2");
    obj.textEditor14:setName("textEditor14");

    obj.layout106 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout106:setParent(obj.scrollBox5);
    obj.layout106:setLeft(0);
    obj.layout106:setTop(155);
    obj.layout106:setWidth(805);
    obj.layout106:setHeight(550);
    obj.layout106:setName("layout106");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout106);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(5);
    obj.rectangle53:setYradius(5);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout106);
    obj.button14:setText("+");
    obj.button14:setLeft(2);
    obj.button14:setTop(2);
    obj.button14:setWidth(27);
    obj.button14:setHeight(27);
    obj.button14:setName("button14");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout106);
    obj.label98:setLeft(5);
    obj.label98:setTop(0);
    obj.label98:setWidth(765);
    obj.label98:setHeight(25);
    obj.label98:setText("OUTROS");
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.rclListaDosItens = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout106);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("listaItens");
    obj.rclListaDosItens:setTemplateForm("frmLH5_1");
    obj.rclListaDosItens:setLeft(0);
    obj.rclListaDosItens:setTop(30);
    obj.rclListaDosItens:setWidth(800);
    obj.rclListaDosItens:setHeight(505);
    obj.rclListaDosItens:setLayout("vertical");
    obj.rclListaDosItens:setMinQt(1);

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Descrições");
    obj.tab2:setName("tab2");

    obj.frmLH6 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH6:setParent(obj.tab2);
    obj.frmLH6:setName("frmLH6");
    obj.frmLH6:setAlign("client");
    obj.frmLH6:setTheme("dark");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmLH6);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.popMeuPopup = gui.fromHandle(_obj_newObject("popup"));
    obj.popMeuPopup:setParent(obj.scrollBox6);
    obj.popMeuPopup:setName("popMeuPopup");
    obj.popMeuPopup:setWidth(100);
    obj.popMeuPopup:setHeight(100);
    obj.popMeuPopup:setBackOpacity(0.5);

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.popMeuPopup);
    obj.label99:setAlign("client");
    obj.label99:setHorzTextAlign("center");
    obj.label99:setText("Você não é o mestre ou o dono da ficha!");
    obj.label99:setName("label99");

    obj.layout107 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout107:setParent(obj.scrollBox6);
    obj.layout107:setLeft(0);
    obj.layout107:setTop(0);
    obj.layout107:setWidth(960);
    obj.layout107:setHeight(70);
    obj.layout107:setName("layout107");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout107);
    obj.rectangle54:setLeft(5);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(950);
    obj.rectangle54:setHeight(70);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setXradius(15);
    obj.rectangle54:setYradius(15);
    obj.rectangle54:setCornerType("round");
    obj.rectangle54:setName("rectangle54");

    obj.layout108 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout108:setParent(obj.layout107);
    obj.layout108:setLeft(5);
    obj.layout108:setTop(5);
    obj.layout108:setWidth(310);
    obj.layout108:setHeight(25);
    obj.layout108:setName("layout108");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout108);
    obj.label100:setLeft(0);
    obj.label100:setTop(5);
    obj.label100:setWidth(100);
    obj.label100:setHeight(20);
    obj.label100:setText("Sexo");
    obj.label100:setHorzTextAlign("trailing");
    obj.label100:setName("label100");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout108);
    obj.edit84:setLeft(110);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(200);
    obj.edit84:setHeight(25);
    obj.edit84:setField("desc_sexo");
    obj.edit84:setName("edit84");

    obj.layout109 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout109:setParent(obj.layout107);
    obj.layout109:setLeft(320);
    obj.layout109:setTop(5);
    obj.layout109:setWidth(310);
    obj.layout109:setHeight(25);
    obj.layout109:setName("layout109");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout109);
    obj.label101:setLeft(0);
    obj.label101:setTop(5);
    obj.label101:setWidth(100);
    obj.label101:setHeight(20);
    obj.label101:setText("Altura");
    obj.label101:setHorzTextAlign("trailing");
    obj.label101:setName("label101");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout109);
    obj.edit85:setLeft(110);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(200);
    obj.edit85:setHeight(25);
    obj.edit85:setField("desc_altura");
    obj.edit85:setName("edit85");

    obj.layout110 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout110:setParent(obj.layout107);
    obj.layout110:setLeft(585);
    obj.layout110:setTop(5);
    obj.layout110:setWidth(310);
    obj.layout110:setHeight(25);
    obj.layout110:setName("layout110");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout110);
    obj.label102:setLeft(0);
    obj.label102:setTop(5);
    obj.label102:setWidth(100);
    obj.label102:setHeight(20);
    obj.label102:setText("Olhos");
    obj.label102:setHorzTextAlign("trailing");
    obj.label102:setName("label102");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout110);
    obj.edit86:setLeft(110);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(200);
    obj.edit86:setHeight(25);
    obj.edit86:setField("desc_olhos");
    obj.edit86:setName("edit86");

    obj.layout111 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout111:setParent(obj.layout107);
    obj.layout111:setLeft(5);
    obj.layout111:setTop(35);
    obj.layout111:setWidth(310);
    obj.layout111:setHeight(25);
    obj.layout111:setName("layout111");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout111);
    obj.label103:setLeft(0);
    obj.label103:setTop(5);
    obj.label103:setWidth(100);
    obj.label103:setHeight(20);
    obj.label103:setText("Idade");
    obj.label103:setHorzTextAlign("trailing");
    obj.label103:setName("label103");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout111);
    obj.edit87:setLeft(110);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(200);
    obj.edit87:setHeight(25);
    obj.edit87:setField("desc_idade");
    obj.edit87:setName("edit87");

    obj.layout112 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout112:setParent(obj.layout107);
    obj.layout112:setLeft(320);
    obj.layout112:setTop(35);
    obj.layout112:setWidth(310);
    obj.layout112:setHeight(25);
    obj.layout112:setName("layout112");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout112);
    obj.label104:setLeft(0);
    obj.label104:setTop(5);
    obj.label104:setWidth(100);
    obj.label104:setHeight(20);
    obj.label104:setText("Peso");
    obj.label104:setHorzTextAlign("trailing");
    obj.label104:setName("label104");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout112);
    obj.edit88:setLeft(110);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(200);
    obj.edit88:setHeight(25);
    obj.edit88:setField("desc_peso");
    obj.edit88:setName("edit88");

    obj.layout113 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout113:setParent(obj.layout107);
    obj.layout113:setLeft(585);
    obj.layout113:setTop(35);
    obj.layout113:setWidth(310);
    obj.layout113:setHeight(25);
    obj.layout113:setName("layout113");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout113);
    obj.label105:setLeft(0);
    obj.label105:setTop(5);
    obj.label105:setWidth(100);
    obj.label105:setHeight(20);
    obj.label105:setText("Cabelo");
    obj.label105:setHorzTextAlign("trailing");
    obj.label105:setName("label105");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout113);
    obj.edit89:setLeft(110);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(200);
    obj.edit89:setHeight(25);
    obj.edit89:setField("desc_cabelo");
    obj.edit89:setName("edit89");

    obj.layout114 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout114:setParent(obj.scrollBox6);
    obj.layout114:setLeft(0);
    obj.layout114:setTop(80);
    obj.layout114:setWidth(400);
    obj.layout114:setHeight(375);
    obj.layout114:setName("layout114");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout114);
    obj.rectangle55:setLeft(0);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(400);
    obj.rectangle55:setHeight(375);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setXradius(15);
    obj.rectangle55:setYradius(15);
    obj.rectangle55:setCornerType("round");
    obj.rectangle55:setName("rectangle55");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout114);
    obj.label106:setLeft(0);
    obj.label106:setTop(0);
    obj.label106:setWidth(400);
    obj.label106:setHeight(20);
    obj.label106:setText("Aparencia");
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.textEditor15 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor15:setParent(obj.layout114);
    obj.textEditor15:setLeft(10);
    obj.textEditor15:setTop(25);
    obj.textEditor15:setWidth(380);
    obj.textEditor15:setHeight(335);
    obj.textEditor15:setField("aparencia");
    obj.textEditor15:setName("textEditor15");

    obj.perso = gui.fromHandle(_obj_newObject("layout"));
    obj.perso:setParent(obj.scrollBox6);
    obj.perso:setName("perso");
    obj.perso:setVisible(false);
    obj.perso:setLeft(0);
    obj.perso:setTop(460);
    obj.perso:setWidth(400);
    obj.perso:setHeight(355);

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.perso);
    obj.rectangle56:setLeft(0);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(400);
    obj.rectangle56:setHeight(355);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setXradius(15);
    obj.rectangle56:setYradius(15);
    obj.rectangle56:setCornerType("round");
    obj.rectangle56:setName("rectangle56");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.perso);
    obj.label107:setLeft(0);
    obj.label107:setTop(0);
    obj.label107:setWidth(400);
    obj.label107:setHeight(20);
    obj.label107:setText("Personalidade");
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.textEditor16 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor16:setParent(obj.perso);
    obj.textEditor16:setLeft(10);
    obj.textEditor16:setTop(25);
    obj.textEditor16:setWidth(380);
    obj.textEditor16:setHeight(315);
    obj.textEditor16:setField("personalidade");
    obj.textEditor16:setName("textEditor16");

    obj.hist = gui.fromHandle(_obj_newObject("layout"));
    obj.hist:setParent(obj.scrollBox6);
    obj.hist:setName("hist");
    obj.hist:setVisible(false);
    obj.hist:setLeft(410);
    obj.hist:setTop(80);
    obj.hist:setWidth(600);
    obj.hist:setHeight(735);

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.hist);
    obj.rectangle57:setLeft(0);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(600);
    obj.rectangle57:setHeight(735);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setXradius(15);
    obj.rectangle57:setYradius(15);
    obj.rectangle57:setCornerType("round");
    obj.rectangle57:setName("rectangle57");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.hist);
    obj.label108:setLeft(0);
    obj.label108:setTop(0);
    obj.label108:setWidth(600);
    obj.label108:setHeight(20);
    obj.label108:setText("Historia");
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.textEditor17 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor17:setParent(obj.hist);
    obj.textEditor17:setLeft(10);
    obj.textEditor17:setTop(25);
    obj.textEditor17:setWidth(580);
    obj.textEditor17:setHeight(695);
    obj.textEditor17:setField("historia");
    obj.textEditor17:setName("textEditor17");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Conexões");
    obj.tab3:setName("tab3");

    obj.frmLH7 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH7:setParent(obj.tab3);
    obj.frmLH7:setName("frmLH7");
    obj.frmLH7:setAlign("client");
    obj.frmLH7:setTheme("dark");

    obj.scrollBox7 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.frmLH7);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.layout115 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout115:setParent(obj.scrollBox7);
    obj.layout115:setLeft(0);
    obj.layout115:setTop(0);
    obj.layout115:setWidth(400);
    obj.layout115:setHeight(280);
    obj.layout115:setName("layout115");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout115);
    obj.rectangle58:setLeft(0);
    obj.rectangle58:setTop(0);
    obj.rectangle58:setWidth(400);
    obj.rectangle58:setHeight(280);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setXradius(15);
    obj.rectangle58:setYradius(15);
    obj.rectangle58:setCornerType("round");
    obj.rectangle58:setName("rectangle58");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout115);
    obj.label109:setLeft(0);
    obj.label109:setTop(0);
    obj.label109:setWidth(400);
    obj.label109:setHeight(20);
    obj.label109:setText("Conexões Públicas");
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.textEditor18 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor18:setParent(obj.layout115);
    obj.textEditor18:setLeft(10);
    obj.textEditor18:setTop(25);
    obj.textEditor18:setWidth(380);
    obj.textEditor18:setHeight(240);
    obj.textEditor18:setField("anotacoes1");
    obj.textEditor18:setName("textEditor18");

    obj.con_priv = gui.fromHandle(_obj_newObject("layout"));
    obj.con_priv:setParent(obj.scrollBox7);
    obj.con_priv:setName("con_priv");
    obj.con_priv:setVisible(false);
    obj.con_priv:setLeft(410);
    obj.con_priv:setTop(0);
    obj.con_priv:setWidth(400);
    obj.con_priv:setHeight(280);

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.con_priv);
    obj.rectangle59:setLeft(0);
    obj.rectangle59:setTop(0);
    obj.rectangle59:setWidth(400);
    obj.rectangle59:setHeight(280);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setXradius(15);
    obj.rectangle59:setYradius(15);
    obj.rectangle59:setCornerType("round");
    obj.rectangle59:setName("rectangle59");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.con_priv);
    obj.label110:setLeft(0);
    obj.label110:setTop(0);
    obj.label110:setWidth(400);
    obj.label110:setHeight(20);
    obj.label110:setText("Conexões Privadas");
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.textEditor19 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor19:setParent(obj.con_priv);
    obj.textEditor19:setLeft(10);
    obj.textEditor19:setTop(25);
    obj.textEditor19:setWidth(380);
    obj.textEditor19:setHeight(240);
    obj.textEditor19:setField("anotacoes2");
    obj.textEditor19:setName("textEditor19");

    obj.anot = gui.fromHandle(_obj_newObject("layout"));
    obj.anot:setParent(obj.scrollBox7);
    obj.anot:setName("anot");
    obj.anot:setVisible(false);
    obj.anot:setLeft(0);
    obj.anot:setTop(285);
    obj.anot:setWidth(400);
    obj.anot:setHeight(280);

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.anot);
    obj.rectangle60:setLeft(0);
    obj.rectangle60:setTop(0);
    obj.rectangle60:setWidth(400);
    obj.rectangle60:setHeight(280);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setXradius(15);
    obj.rectangle60:setYradius(15);
    obj.rectangle60:setCornerType("round");
    obj.rectangle60:setName("rectangle60");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.anot);
    obj.label111:setLeft(0);
    obj.label111:setTop(0);
    obj.label111:setWidth(400);
    obj.label111:setHeight(20);
    obj.label111:setText("Anotações");
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.textEditor20 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor20:setParent(obj.anot);
    obj.textEditor20:setLeft(10);
    obj.textEditor20:setTop(25);
    obj.textEditor20:setWidth(380);
    obj.textEditor20:setHeight(240);
    obj.textEditor20:setField("anotacoes3");
    obj.textEditor20:setName("textEditor20");

    obj.memoria = gui.fromHandle(_obj_newObject("layout"));
    obj.memoria:setParent(obj.scrollBox7);
    obj.memoria:setName("memoria");
    obj.memoria:setVisible(false);
    obj.memoria:setLeft(410);
    obj.memoria:setTop(285);
    obj.memoria:setWidth(400);
    obj.memoria:setHeight(280);

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.memoria);
    obj.rectangle61:setLeft(0);
    obj.rectangle61:setTop(0);
    obj.rectangle61:setWidth(400);
    obj.rectangle61:setHeight(280);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setXradius(15);
    obj.rectangle61:setYradius(15);
    obj.rectangle61:setCornerType("round");
    obj.rectangle61:setName("rectangle61");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.memoria);
    obj.label112:setLeft(0);
    obj.label112:setTop(0);
    obj.label112:setWidth(400);
    obj.label112:setHeight(20);
    obj.label112:setText("Memória do Personagem");
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.textEditor21 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor21:setParent(obj.memoria);
    obj.textEditor21:setLeft(10);
    obj.textEditor21:setTop(25);
    obj.textEditor21:setWidth(380);
    obj.textEditor21:setHeight(240);
    obj.textEditor21:setField("anotacoes4");
    obj.textEditor21:setName("textEditor21");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Creditos");
    obj.tab4:setName("tab4");

    obj.frmLH8 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH8:setParent(obj.tab4);
    obj.frmLH8:setName("frmLH8");
    obj.frmLH8:setAlign("client");
    obj.frmLH8:setTheme("dark");

    obj.scrollBox8 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmLH8);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox8);
    obj.image3:setLeft(0);
    obj.image3:setTop(0);
    obj.image3:setWidth(500);
    obj.image3:setHeight(250);
    obj.image3:setStyle("autoFit");
    obj.image3:setSRC("/Ficha LH/images/LH.jpg");
    obj.image3:setName("image3");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox8);
    obj.image4:setLeft(510);
    obj.image4:setTop(0);
    obj.image4:setWidth(350);
    obj.image4:setHeight(350);
    obj.image4:setStyle("autoFit");
    obj.image4:setSRC("/Ficha LH/images/RPGmeister.jpg");
    obj.image4:setName("image4");

    obj.layout116 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout116:setParent(obj.scrollBox8);
    obj.layout116:setLeft(0);
    obj.layout116:setTop(300);
    obj.layout116:setWidth(200);
    obj.layout116:setHeight(200);
    obj.layout116:setName("layout116");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout116);
    obj.rectangle62:setLeft(0);
    obj.rectangle62:setTop(0);
    obj.rectangle62:setWidth(200);
    obj.rectangle62:setHeight(200);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setXradius(15);
    obj.rectangle62:setYradius(15);
    obj.rectangle62:setCornerType("round");
    obj.rectangle62:setName("rectangle62");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout116);
    obj.label113:setLeft(0);
    obj.label113:setTop(10);
    obj.label113:setWidth(200);
    obj.label113:setHeight(20);
    obj.label113:setText("Obrigado aos autores originais:");
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout116);
    obj.label114:setLeft(0);
    obj.label114:setTop(35);
    obj.label114:setWidth(200);
    obj.label114:setHeight(20);
    obj.label114:setText("Programador: Vinny (Ambesek)");
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout116);
    obj.label115:setLeft(0);
    obj.label115:setTop(60);
    obj.label115:setWidth(200);
    obj.label115:setHeight(20);
    obj.label115:setText("Arte: Nefer (Nefertyne)");
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout116);
    obj.label116:setLeft(0);
    obj.label116:setTop(85);
    obj.label116:setWidth(200);
    obj.label116:setHeight(20);
    obj.label116:setText("Consultor: Vinny (hellblackjack)");
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout116);
    obj.label117:setLeft(0);
    obj.label117:setTop(120);
    obj.label117:setWidth(200);
    obj.label117:setHeight(20);
    obj.label117:setText("Ficha modificado por:");
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout116);
    obj.label118:setLeft(0);
    obj.label118:setTop(145);
    obj.label118:setWidth(200);
    obj.label118:setHeight(20);
    obj.label118:setText("HashBR - Túlio");
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj._e_event0 = obj.edit11:addEventListener("onChange",
        function (self)
            VDS();
        end, obj);

    obj._e_event1 = obj.edit12:addEventListener("onChange",
        function (self)
            VDS();
        end, obj);

    obj._e_event2 = obj.edit13:addEventListener("onChange",
        function (self)
            VDS();
        end, obj);

    obj._e_event3 = obj.edit14:addEventListener("onChange",
        function (self)
            AFE();
        end, obj);

    obj._e_event4 = obj.edit15:addEventListener("onChange",
        function (self)
            AFE();
        end, obj);

    obj._e_event5 = obj.edit16:addEventListener("onChange",
        function (self)
            AFE();
        end, obj);

    obj._e_event6 = obj.edit17:addEventListener("onChange",
        function (self)
            INT();
        end, obj);

    obj._e_event7 = obj.edit18:addEventListener("onChange",
        function (self)
            INT();
        end, obj);

    obj._e_event8 = obj.edit19:addEventListener("onChange",
        function (self)
            INT();
        end, obj);

    obj._e_event9 = obj.edit20:addEventListener("onChange",
        function (self)
            CCH();
        end, obj);

    obj._e_event10 = obj.edit21:addEventListener("onChange",
        function (self)
            CCH();
        end, obj);

    obj._e_event11 = obj.edit22:addEventListener("onChange",
        function (self)
            CCH();
        end, obj);

    obj._e_event12 = obj.edit23:addEventListener("onChange",
        function (self)
            AGI();
        end, obj);

    obj._e_event13 = obj.edit24:addEventListener("onChange",
        function (self)
            AGI();
        end, obj);

    obj._e_event14 = obj.edit25:addEventListener("onChange",
        function (self)
            AGI();
        end, obj);

    obj._e_event15 = obj.edit26:addEventListener("onChange",
        function (self)
            FOR();
        end, obj);

    obj._e_event16 = obj.edit27:addEventListener("onChange",
        function (self)
            FOR();
        end, obj);

    obj._e_event17 = obj.edit28:addEventListener("onChange",
        function (self)
            FOR();
        end, obj);

    obj._e_event18 = obj.edit29:addEventListener("onChange",
        function (self)
            vida_status();
        end, obj);

    obj._e_event19 = obj.edit30:addEventListener("onChange",
        function (self)
            vida_status();
        end, obj);

    obj._e_event20 = obj.edit31:addEventListener("onChange",
        function (self)
            cha_status();
        end, obj);

    obj._e_event21 = obj.edit32:addEventListener("onChange",
        function (self)
            cha_status();
        end, obj);

    obj._e_event22 = obj.edit33:addEventListener("onChange",
        function (self)
            sta_status();
        end, obj);

    obj._e_event23 = obj.edit34:addEventListener("onChange",
        function (self)
            sta_status();
        end, obj);

    obj._e_event24 = obj.button1:addEventListener("onClick",
        function (self)
            if sheet.imageCounter == nil then
            					sheet.imageCounter = 0;
            				end;
            				-- Contador que vai de 0 a 9 e reseta ao passar de 9
            				sheet.imageCounter = (sheet.imageCounter + 1) % 2;
            				-- pegando imagem do array. O +1 é por que arrays em lua começam em 1 e não em 0
            				sheet.clickableImage = pics[sheet.imageCounter +1];
        end, obj);

    obj._e_event25 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclSelector:append();
        end, obj);

    obj._e_event26 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclSelector2:append();
        end, obj);

    obj._e_event27 = obj.rclSelector:addEventListener("onSelect",
        function (self)
            local node = self.rclSelector.selectedNode;
            						self.rclSelector2.selectedNode = nil;
            						self.boxDetalhesDoItem.node = node;
        end, obj);

    obj._e_event28 = obj.rclSelector2:addEventListener("onSelect",
        function (self)
            local node = self.rclSelector2.selectedNode;
            						self.rclSelector.selectedNode = nil;
            						self.boxDetalhesDoItem.node = node;
        end, obj);

    obj._e_event29 = obj.button4:addEventListener("onClick",
        function (self)
            local mesa = rrpg.getMesaDe(sheet);
            						if (mesa.meuJogador.isMestre or mesa.meuJogador.login == sheet.desc_loginDono) then
            							self.inventario.visible = true;
            							self.atributos_todos.visible = true;
            							self.jutsusNINGENTAI.visible = true;
            							self.jutsusOUTROS.visible = true;
            							self.basicoclan.visible = true;
            							self.perso.visible = true;
            							self.hist.visible = true;
            							self.localizacao.visible = true;
            							self.con_priv.visible = true;
            							self.anot.visible = true;
            							self.memoria.visible = true;
            						else
            							self.inventario.visible = false;
            							self.atributos_todos.visible = false;
            							self.jutsusNINGENTAI.visible = false;
            							self.jutsusOUTROS.visible = false;
            							self.basicoclan.visible = false;
            							self.perso.visible = false;
            							self.hist.visible = false;
            							self.localizacao.visible = false;
            							self.con_priv.visible = false;
            							self.anot.visible = false;
            							self.memoria.visible = false;							
            							self.popMeuPopup:show('bottom', self.descricoes);
            						end;
        end, obj);

    obj._e_event30 = obj.button5:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                                    -- Vamos inserir um novo item no nosso recordList                              
                                    self.rclListaDosNinjutsus:append();
        end, obj);

    obj._e_event31 = obj.rclListaDosNinjutsus:addEventListener("onSelect",
        function (self)
            --[[
                                Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                                --]]                      
                                local node = self.rclListaDosNinjutsus.selectedNode;  
                                self.boxDetalhesDoNinjutsu.node = node;                       
                                -- a caixa de detalhe só ficará visível se houver item selecionado
                                self.boxDetalhesDoNinjutsu.visible = (node ~= nil);
        end, obj);

    obj._e_event32 = obj.button6:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                            -- Vamos inserir um novo item no nosso recordList                              
                            self.rclListaDosGenjutsus:append();
        end, obj);

    obj._e_event33 = obj.rclListaDosGenjutsus:addEventListener("onSelect",
        function (self)
            --[[
                        Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                        --]]                      
                        local node = self.rclListaDosGenjutsus.selectedNode;  
                        self.boxDetalhesDoGenjutsu.node = node;                       
                        -- a caixa de detalhe só ficará visível se houver item selecionado
                        self.boxDetalhesDoGenjutsu.visible = (node ~= nil);
        end, obj);

    obj._e_event34 = obj.button7:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                            -- Vamos inserir um novo item no nosso recordList                              
                            self.rclListaDosTaijutsus:append();
        end, obj);

    obj._e_event35 = obj.rclListaDosTaijutsus:addEventListener("onSelect",
        function (self)
            --[[
                        Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                        --]]                      
                        local node = self.rclListaDosTaijutsus.selectedNode;  
                        self.boxDetalhesDoTaijutsu.node = node;                       
                        -- a caixa de detalhe só ficará visível se houver item selecionado
                        self.boxDetalhesDoTaijutsu.visible = (node ~= nil);
        end, obj);

    obj._e_event36 = obj.button8:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                                    -- Vamos inserir um novo item no nosso recordList                              
                                    self.rclListaDosBasicos:append();
        end, obj);

    obj._e_event37 = obj.rclListaDosBasicos:addEventListener("onSelect",
        function (self)
            --[[
                                Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                                --]]                      
                                local node = self.rclListaDosBasicos.selectedNode;  
                                self.boxDetalhesDoBasico.node = node;                       
                                -- a caixa de detalhe só ficará visível se houver item selecionado
                                self.boxDetalhesDoBasico.visible = (node ~= nil);
        end, obj);

    obj._e_event38 = obj.button9:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                            -- Vamos inserir um novo item no nosso recordList                              
                            self.rclListaDosClans:append();
        end, obj);

    obj._e_event39 = obj.rclListaDosClans:addEventListener("onSelect",
        function (self)
            --[[
                        Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                        --]]                      
                        local node = self.rclListaDosClans.selectedNode;  
                        self.boxDetalhesDoClan.node = node;                       
                        -- a caixa de detalhe só ficará visível se houver item selecionado
                        self.boxDetalhesDoClan.visible = (node ~= nil);
        end, obj);

    obj._e_event40 = obj.button10:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                            -- Vamos inserir um novo item no nosso recordList                              
                            self.rclListaDosKekkeis:append();
        end, obj);

    obj._e_event41 = obj.rclListaDosKekkeis:addEventListener("onSelect",
        function (self)
            --[[
                        Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                        --]]                      
                        local node = self.rclListaDosKekkeis.selectedNode;  
                        self.boxDetalhesDoKekkei.node = node;                       
                        -- a caixa de detalhe só ficará visível se houver item selecionado
                        self.boxDetalhesDoKekkei.visible = (node ~= nil);
        end, obj);

    obj._e_event42 = obj.button11:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                                    -- Vamos inserir um novo item no nosso recordList                              
                                    self.rclListaDosKenjutsus:append();
        end, obj);

    obj._e_event43 = obj.rclListaDosKenjutsus:addEventListener("onSelect",
        function (self)
            --[[
                                Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                                --]]                      
                                local node = self.rclListaDosKenjutsus.selectedNode;  
                                self.boxDetalhesDoKenjutsu.node = node;                       
                                -- a caixa de detalhe só ficará visível se houver item selecionado
                                self.boxDetalhesDoKenjutsu.visible = (node ~= nil);
        end, obj);

    obj._e_event44 = obj.button12:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                            -- Vamos inserir um novo item no nosso recordList                              
                            self.rclListaDosKuchyoses:append();
        end, obj);

    obj._e_event45 = obj.rclListaDosKuchyoses:addEventListener("onSelect",
        function (self)
            --[[
                        Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                        --]]                      
                        local node = self.rclListaDosKuchyoses.selectedNode;  
                        self.boxDetalhesDoKuchyose.node = node;                       
                        -- a caixa de detalhe só ficará visível se houver item selecionado
                        self.boxDetalhesDoKuchyose.visible = (node ~= nil);
        end, obj);

    obj._e_event46 = obj.button13:addEventListener("onClick",
        function (self)
            -- Usuário clicou no botão de criar novo item.
                            -- Vamos inserir um novo item no nosso recordList                              
                            self.rclListaDosEstLutas:append();
        end, obj);

    obj._e_event47 = obj.rclListaDosEstLutas:addEventListener("onSelect",
        function (self)
            --[[
                        Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                        --]]                      
                        local node = self.rclListaDosEstLutas.selectedNode;  
                        self.boxDetalhesDoEstLuta.node = node;                       
                        -- a caixa de detalhe só ficará visível se houver item selecionado
                        self.boxDetalhesDoEstLuta.visible = (node ~= nil);
        end, obj);

    obj._e_event48 = obj.button14:addEventListener("onClick",
        function (self)
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

        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout83 ~= nil then self.layout83:destroy(); self.layout83 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.rclListaDosClans ~= nil then self.rclListaDosClans:destroy(); self.rclListaDosClans = nil; end;
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
        if self.frmLH2 ~= nil then self.frmLH2:destroy(); self.frmLH2 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout94 ~= nil then self.layout94:destroy(); self.layout94 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.localizacao ~= nil then self.localizacao:destroy(); self.localizacao = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.boxDetalhesDoClan ~= nil then self.boxDetalhesDoClan:destroy(); self.boxDetalhesDoClan = nil; end;
        if self.rclListaDosGenjutsus ~= nil then self.rclListaDosGenjutsus:destroy(); self.rclListaDosGenjutsus = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.layout89 ~= nil then self.layout89:destroy(); self.layout89 = nil; end;
        if self.inventario ~= nil then self.inventario:destroy(); self.inventario = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
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
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.textEditor15 ~= nil then self.textEditor15:destroy(); self.textEditor15 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout106 ~= nil then self.layout106:destroy(); self.layout106 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.layout78 ~= nil then self.layout78:destroy(); self.layout78 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.layout103 ~= nil then self.layout103:destroy(); self.layout103 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.layout108 ~= nil then self.layout108:destroy(); self.layout108 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rclListaDosTaijutsus ~= nil then self.rclListaDosTaijutsus:destroy(); self.rclListaDosTaijutsus = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.boxDetalhesDoKenjutsu ~= nil then self.boxDetalhesDoKenjutsu:destroy(); self.boxDetalhesDoKenjutsu = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout100 ~= nil then self.layout100:destroy(); self.layout100 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.con_priv ~= nil then self.con_priv:destroy(); self.con_priv = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rclListaDosEstLutas ~= nil then self.rclListaDosEstLutas:destroy(); self.rclListaDosEstLutas = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.boxDetalhesDoTaijutsu ~= nil then self.boxDetalhesDoTaijutsu:destroy(); self.boxDetalhesDoTaijutsu = nil; end;
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
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.layout111 ~= nil then self.layout111:destroy(); self.layout111 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.textEditor16 ~= nil then self.textEditor16:destroy(); self.textEditor16 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor11 ~= nil then self.textEditor11:destroy(); self.textEditor11 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout107 ~= nil then self.layout107:destroy(); self.layout107 = nil; end;
        if self.layout116 ~= nil then self.layout116:destroy(); self.layout116 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.layout101 ~= nil then self.layout101:destroy(); self.layout101 = nil; end;
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
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.frmLH5 ~= nil then self.frmLH5:destroy(); self.frmLH5 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.layout97 ~= nil then self.layout97:destroy(); self.layout97 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
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
        if self.layout98 ~= nil then self.layout98:destroy(); self.layout98 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.layout115 ~= nil then self.layout115:destroy(); self.layout115 = nil; end;
        if self.layout75 ~= nil then self.layout75:destroy(); self.layout75 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.layout110 ~= nil then self.layout110:destroy(); self.layout110 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.layout114 ~= nil then self.layout114:destroy(); self.layout114 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.frmLH6 ~= nil then self.frmLH6:destroy(); self.frmLH6 = nil; end;
        if self.hist ~= nil then self.hist:destroy(); self.hist = nil; end;
        if self.layout105 ~= nil then self.layout105:destroy(); self.layout105 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.atributos_todos ~= nil then self.atributos_todos:destroy(); self.atributos_todos = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.boxDetalhesDoEstLuta ~= nil then self.boxDetalhesDoEstLuta:destroy(); self.boxDetalhesDoEstLuta = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout92 ~= nil then self.layout92:destroy(); self.layout92 = nil; end;
        if self.popMeuPopup ~= nil then self.popMeuPopup:destroy(); self.popMeuPopup = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.boxDetalhesDoKekkei ~= nil then self.boxDetalhesDoKekkei:destroy(); self.boxDetalhesDoKekkei = nil; end;
        if self.textEditor17 ~= nil then self.textEditor17:destroy(); self.textEditor17 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.frmLH3 ~= nil then self.frmLH3:destroy(); self.frmLH3 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.layout112 ~= nil then self.layout112:destroy(); self.layout112 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.textEditor12 ~= nil then self.textEditor12:destroy(); self.textEditor12 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.frmLH4 ~= nil then self.frmLH4:destroy(); self.frmLH4 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.textEditor20 ~= nil then self.textEditor20:destroy(); self.textEditor20 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.boxDetalhesDoNinjutsu ~= nil then self.boxDetalhesDoNinjutsu:destroy(); self.boxDetalhesDoNinjutsu = nil; end;
        if self.frmLH7 ~= nil then self.frmLH7:destroy(); self.frmLH7 = nil; end;
        if self.textEditor21 ~= nil then self.textEditor21:destroy(); self.textEditor21 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.boxDetalhesDoKuchyose ~= nil then self.boxDetalhesDoKuchyose:destroy(); self.boxDetalhesDoKuchyose = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.layout102 ~= nil then self.layout102:destroy(); self.layout102 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout79 ~= nil then self.layout79:destroy(); self.layout79 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.textEditor13 ~= nil then self.textEditor13:destroy(); self.textEditor13 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.layout80 ~= nil then self.layout80:destroy(); self.layout80 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
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
        if self.rclListaDosKenjutsus ~= nil then self.rclListaDosKenjutsus:destroy(); self.rclListaDosKenjutsus = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.textEditor19 ~= nil then self.textEditor19:destroy(); self.textEditor19 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout95 ~= nil then self.layout95:destroy(); self.layout95 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout93 ~= nil then self.layout93:destroy(); self.layout93 = nil; end;
        if self.layout81 ~= nil then self.layout81:destroy(); self.layout81 = nil; end;
        if self.layout99 ~= nil then self.layout99:destroy(); self.layout99 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.layout77 ~= nil then self.layout77:destroy(); self.layout77 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.perso ~= nil then self.perso:destroy(); self.perso = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.jutsusOUTROS ~= nil then self.jutsusOUTROS:destroy(); self.jutsusOUTROS = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
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
        if self.layout104 ~= nil then self.layout104:destroy(); self.layout104 = nil; end;
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
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.boxDetalhesDoGenjutsu ~= nil then self.boxDetalhesDoGenjutsu:destroy(); self.boxDetalhesDoGenjutsu = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.memoria ~= nil then self.memoria:destroy(); self.memoria = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.frmLH1 ~= nil then self.frmLH1:destroy(); self.frmLH1 = nil; end;
        if self.frmLH8 ~= nil then self.frmLH8:destroy(); self.frmLH8 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.basicoclan ~= nil then self.basicoclan:destroy(); self.basicoclan = nil; end;
        if self.textEditor14 ~= nil then self.textEditor14:destroy(); self.textEditor14 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout84 ~= nil then self.layout84:destroy(); self.layout84 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.layout87 ~= nil then self.layout87:destroy(); self.layout87 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.layout96 ~= nil then self.layout96:destroy(); self.layout96 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.textEditor18 ~= nil then self.textEditor18:destroy(); self.textEditor18 = nil; end;
        if self.boxDetalhesDoBasico ~= nil then self.boxDetalhesDoBasico:destroy(); self.boxDetalhesDoBasico = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.layout86 ~= nil then self.layout86:destroy(); self.layout86 = nil; end;
        if self.rclListaDosKuchyoses ~= nil then self.rclListaDosKuchyoses:destroy(); self.rclListaDosKuchyoses = nil; end;
        if self.layout85 ~= nil then self.layout85:destroy(); self.layout85 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.layout91 ~= nil then self.layout91:destroy(); self.layout91 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_frmFichaKH);
rrpg.registrarDataType(_frmFichaKH);

return _frmFichaKH;
