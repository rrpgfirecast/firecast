require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLH1()
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
    obj:setName("frmLH1");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
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

    obj._e_event0 = obj.edit13:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event1 = obj.edit14:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event2 = obj.edit15:addEventListener("onChange",
        function (_)
            VDS();
        end, obj);

    obj._e_event3 = obj.edit16:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event4 = obj.edit17:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event5 = obj.edit18:addEventListener("onChange",
        function (_)
            AFE();
        end, obj);

    obj._e_event6 = obj.edit19:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event7 = obj.edit20:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event8 = obj.edit21:addEventListener("onChange",
        function (_)
            INT();
        end, obj);

    obj._e_event9 = obj.edit22:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event10 = obj.edit23:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event11 = obj.edit24:addEventListener("onChange",
        function (_)
            CCH();
        end, obj);

    obj._e_event12 = obj.edit25:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event13 = obj.edit26:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event14 = obj.edit27:addEventListener("onChange",
        function (_)
            AGI();
        end, obj);

    obj._e_event15 = obj.edit28:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event16 = obj.edit29:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event17 = obj.edit30:addEventListener("onChange",
        function (_)
            FOR();
        end, obj);

    obj._e_event18 = obj.edit31:addEventListener("onChange",
        function (_)
            vida_status();
        end, obj);

    obj._e_event19 = obj.edit32:addEventListener("onChange",
        function (_)
            vida_status();
        end, obj);

    obj._e_event20 = obj.edit33:addEventListener("onChange",
        function (_)
            cha_status();
        end, obj);

    obj._e_event21 = obj.edit34:addEventListener("onChange",
        function (_)
            cha_status();
        end, obj);

    obj._e_event22 = obj.edit35:addEventListener("onChange",
        function (_)
            sta_status();
        end, obj);

    obj._e_event23 = obj.edit36:addEventListener("onChange",
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

    function obj:_releaseEvents()
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

        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.localizacao ~= nil then self.localizacao:destroy(); self.localizacao = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.rclSelector2 ~= nil then self.rclSelector2:destroy(); self.rclSelector2 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.atributos_todos ~= nil then self.atributos_todos:destroy(); self.atributos_todos = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.rclSelector ~= nil then self.rclSelector:destroy(); self.rclSelector = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.buffatt ~= nil then self.buffatt:destroy(); self.buffatt = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLH1()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLH1();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLH1 = {
    newEditor = newfrmLH1, 
    new = newfrmLH1, 
    name = "frmLH1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLH1 = _frmLH1;
Firecast.registrarForm(_frmLH1);

return _frmLH1;
