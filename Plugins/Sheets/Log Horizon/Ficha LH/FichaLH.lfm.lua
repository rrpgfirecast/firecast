require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaLH()
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
    obj:setName("frmFichaLH");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.FichaLH");
    obj:setTitle("Ficha LH");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.tabControl1 = gui.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Geral");
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


			local function updateCapacidade()
				if sheet~= nil then
					local str = (tonumber(sheet.for_teste) or 0);
					local des = (tonumber(sheet.des_teste) or 0);
					local pod = (tonumber(sheet.pod_teste) or 0);
					local int = (tonumber(sheet.int_teste) or 0);
					local maior = math.max(str, des, pod, int);

					sheet.atletismo = str;
					sheet.tolerancia = str;
					sheet.desativar = des;
					sheet.operar = des;
					sheet.percepcao = pod;
					sheet.negociacao = pod;
					sheet.conhecimento = int;
					sheet.analisar = int;
					sheet.precisao = maior;
					sheet.evasao = des;
					sheet.resistencia = pod;

					sheet.defesa_fisica_mod = str*2;
					sheet.defesa_magica_mod = int*2;
					sheet.iniciativa_mod = str + int;

					sheet.defesa_fisica_total = str*2 + 
												(tonumber(sheet.defesa_fisica) or 0) + 
												(tonumber(sheet.defesa_fisica_itens) or 0);
					sheet.defesa_magica_total = int*2 + 
												(tonumber(sheet.defesa_magica) or 0) + 
												(tonumber(sheet.defesa_magica_itens) or 0);
					sheet.iniciativa_total = str + int + 
											(tonumber(sheet.iniciativa) or 0) + 
											(tonumber(sheet.iniciativa_itens) or 0);
					sheet.velocidade_total = 2 + 
											(tonumber(sheet.velocidade) or 0) + 
											(tonumber(sheet.velocidade_itens) or 0);
				end;
			end;
		


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(960);
    obj.layout1:setHeight(70);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(310);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(20);
    obj.label1:setText("Raça");
    obj.label1:setHorzTextAlign("trailing");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(110);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("desc_raca");
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(320);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(310);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(100);
    obj.label2:setHeight(20);
    obj.label2:setText("Classe");
    obj.label2:setHorzTextAlign("trailing");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(110);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(200);
    obj.edit2:setHeight(25);
    obj.edit2:setField("desc_classe");
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(585);
    obj.layout4:setTop(5);
    obj.layout4:setWidth(310);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout4);
    obj.label3:setLeft(0);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setText("Rank");
    obj.label3:setHorzTextAlign("trailing");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(110);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(25);
    obj.edit3:setField("desc_rank");
    obj.edit3:setName("edit3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(35);
    obj.layout5:setWidth(310);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(100);
    obj.label4:setHeight(20);
    obj.label4:setText("Arquetipo");
    obj.label4:setHorzTextAlign("trailing");
    obj.label4:setName("label4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setLeft(110);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(200);
    obj.edit4:setHeight(25);
    obj.edit4:setField("desc_arquetipo");
    obj.edit4:setName("edit4");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(320);
    obj.layout6:setTop(35);
    obj.layout6:setWidth(310);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setText("Sub-Classe");
    obj.label5:setHorzTextAlign("trailing");
    obj.label5:setName("label5");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout6);
    obj.edit5:setLeft(110);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(25);
    obj.edit5:setField("desc_sub_classe");
    obj.edit5:setName("edit5");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(75);
    obj.layout7:setWidth(300);
    obj.layout7:setHeight(165);
    obj.layout7:setName("layout7");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout7);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout7);
    obj.label6:setLeft(5);
    obj.label6:setTop(5);
    obj.label6:setWidth(290);
    obj.label6:setHeight(20);
    obj.label6:setText("ATRIBUTOS");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(30);
    obj.layout8:setWidth(300);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout8);
    obj.label7:setLeft(40);
    obj.label7:setTop(0);
    obj.label7:setWidth(35);
    obj.label7:setHeight(25);
    obj.label7:setText("Racial");
    obj.label7:setFontSize(11);
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setLeft(75);
    obj.label8:setTop(0);
    obj.label8:setWidth(35);
    obj.label8:setHeight(25);
    obj.label8:setText("Classe");
    obj.label8:setFontSize(11);
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout8);
    obj.label9:setLeft(110);
    obj.label9:setTop(0);
    obj.label9:setWidth(35);
    obj.label9:setHeight(25);
    obj.label9:setText("Nível");
    obj.label9:setFontSize(11);
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setLeft(145);
    obj.label10:setTop(0);
    obj.label10:setWidth(35);
    obj.label10:setHeight(25);
    obj.label10:setText("Itens");
    obj.label10:setFontSize(11);
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout8);
    obj.label11:setLeft(180);
    obj.label11:setTop(0);
    obj.label11:setWidth(35);
    obj.label11:setHeight(25);
    obj.label11:setText("Outros");
    obj.label11:setFontSize(10);
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setLeft(215);
    obj.label12:setTop(0);
    obj.label12:setWidth(35);
    obj.label12:setHeight(25);
    obj.label12:setText("Total");
    obj.label12:setFontSize(13);
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13:setLeft(250);
    obj.label13:setTop(0);
    obj.label13:setWidth(35);
    obj.label13:setHeight(25);
    obj.label13:setText("Teste");
    obj.label13:setFontSize(13);
    obj.label13:setName("label13");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(55);
    obj.layout9:setWidth(300);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout9);
    obj.label14:setLeft(5);
    obj.label14:setTop(5);
    obj.label14:setWidth(40);
    obj.label14:setHeight(20);
    obj.label14:setText("FOR");
    obj.label14:setName("label14");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout9);
    obj.edit6:setLeft(40);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(25);
    obj.edit6:setField("for_racial");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout9);
    obj.edit7:setLeft(75);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(25);
    obj.edit7:setField("for_classe");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout9);
    obj.edit8:setLeft(110);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(25);
    obj.edit8:setField("for_nivel");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout9);
    obj.edit9:setLeft(145);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(25);
    obj.edit9:setField("for_itens");
    obj.edit9:setName("edit9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout9);
    obj.edit10:setLeft(180);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(25);
    obj.edit10:setField("for_outros");
    obj.edit10:setName("edit10");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout9);
    obj.rectangle3:setLeft(215);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(35);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout9);
    obj.label15:setLeft(215);
    obj.label15:setTop(0);
    obj.label15:setWidth(35);
    obj.label15:setHeight(25);
    obj.label15:setField("for_total");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout9);
    obj.rectangle4:setLeft(255);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(35);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout9);
    obj.label16:setLeft(255);
    obj.label16:setTop(0);
    obj.label16:setWidth(35);
    obj.label16:setHeight(25);
    obj.label16:setField("for_teste");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");


				local function FOR();
					if sheet~=nil then
						sheet.for_total =  (tonumber(sheet.for_racial ) or 0) + 
												(tonumber(sheet.for_classe ) or 0) + 
												(tonumber(sheet.for_nivel ) or 0) + 
												(tonumber(sheet.for_itens ) or 0) + 
												(tonumber(sheet.for_outros ) or 0);
						sheet.for_teste = math.floor((tonumber(sheet.for_total) or 0)/3);

						updateCapacidade();
					end;
				end;
			


    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout7);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(80);
    obj.layout10:setWidth(300);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout10);
    obj.label17:setLeft(5);
    obj.label17:setTop(5);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setText("DES");
    obj.label17:setName("label17");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout10);
    obj.edit11:setLeft(40);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(25);
    obj.edit11:setField("des_racial");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout10);
    obj.edit12:setLeft(75);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setField("des_classe");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout10);
    obj.edit13:setLeft(110);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setField("des_nivel");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout10);
    obj.edit14:setLeft(145);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setField("des_itens");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout10);
    obj.edit15:setLeft(180);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setField("des_outros");
    obj.edit15:setName("edit15");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout10);
    obj.rectangle5:setLeft(215);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(35);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout10);
    obj.label18:setLeft(215);
    obj.label18:setTop(0);
    obj.label18:setWidth(35);
    obj.label18:setHeight(25);
    obj.label18:setField("des_total");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout10);
    obj.rectangle6:setLeft(255);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(35);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout10);
    obj.label19:setLeft(255);
    obj.label19:setTop(0);
    obj.label19:setWidth(35);
    obj.label19:setHeight(25);
    obj.label19:setField("des_teste");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");


				local function DES();
					if sheet~=nil then
						sheet.des_total =  (tonumber(sheet.des_racial ) or 0) + 
												(tonumber(sheet.des_classe ) or 0) + 
												(tonumber(sheet.des_nivel ) or 0) + 
												(tonumber(sheet.des_itens ) or 0) + 
												(tonumber(sheet.des_outros ) or 0);
						sheet.des_teste = math.floor((tonumber(sheet.des_total) or 0)/3);

						updateCapacidade();
					end;
				end;
			


    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout7);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(105);
    obj.layout11:setWidth(300);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout11);
    obj.label20:setLeft(5);
    obj.label20:setTop(5);
    obj.label20:setWidth(40);
    obj.label20:setHeight(20);
    obj.label20:setText("POD");
    obj.label20:setName("label20");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout11);
    obj.edit16:setLeft(40);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setField("pod_racial");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout11);
    obj.edit17:setLeft(75);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setField("pod_classe");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout11);
    obj.edit18:setLeft(110);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setField("pod_nivel");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout11);
    obj.edit19:setLeft(145);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setField("pod_itens");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout11);
    obj.edit20:setLeft(180);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setField("pod_outros");
    obj.edit20:setName("edit20");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout11);
    obj.rectangle7:setLeft(215);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(35);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("Black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout11);
    obj.label21:setLeft(215);
    obj.label21:setTop(0);
    obj.label21:setWidth(35);
    obj.label21:setHeight(25);
    obj.label21:setField("pod_total");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout11);
    obj.rectangle8:setLeft(255);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(35);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("Black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout11);
    obj.label22:setLeft(255);
    obj.label22:setTop(0);
    obj.label22:setWidth(35);
    obj.label22:setHeight(25);
    obj.label22:setField("pod_teste");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");


				local function POD();
					if sheet~=nil then
						sheet.pod_total =  (tonumber(sheet.pod_racial ) or 0) + 
												(tonumber(sheet.pod_classe ) or 0) + 
												(tonumber(sheet.pod_nivel ) or 0) + 
												(tonumber(sheet.pod_itens ) or 0) + 
												(tonumber(sheet.pod_outros ) or 0);
						sheet.pod_teste = math.floor((tonumber(sheet.pod_total) or 0)/3);

						updateCapacidade();
					end;
				end;
			


    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout7);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(130);
    obj.layout12:setWidth(300);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout12);
    obj.label23:setLeft(5);
    obj.label23:setTop(5);
    obj.label23:setWidth(40);
    obj.label23:setHeight(20);
    obj.label23:setText("INT");
    obj.label23:setName("label23");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout12);
    obj.edit21:setLeft(40);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setField("int_racial");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout12);
    obj.edit22:setLeft(75);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setField("int_classe");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout12);
    obj.edit23:setLeft(110);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setField("int_nivel");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout12);
    obj.edit24:setLeft(145);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setField("int_itens");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout12);
    obj.edit25:setLeft(180);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setField("int_outros");
    obj.edit25:setName("edit25");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout12);
    obj.rectangle9:setLeft(215);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(35);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("Black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout12);
    obj.label24:setLeft(215);
    obj.label24:setTop(0);
    obj.label24:setWidth(35);
    obj.label24:setHeight(25);
    obj.label24:setField("int_total");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout12);
    obj.rectangle10:setLeft(255);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(35);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("Black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout12);
    obj.label25:setLeft(255);
    obj.label25:setTop(0);
    obj.label25:setWidth(35);
    obj.label25:setHeight(25);
    obj.label25:setField("int_teste");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");


				local function INT();
					if sheet~=nil then
						sheet.int_total =  (tonumber(sheet.int_racial ) or 0) + 
												(tonumber(sheet.int_classe ) or 0) + 
												(tonumber(sheet.int_nivel ) or 0) + 
												(tonumber(sheet.int_itens ) or 0) + 
												(tonumber(sheet.int_outros ) or 0);
						sheet.int_teste = math.floor((tonumber(sheet.int_total) or 0)/3);

						updateCapacidade();
					end;
				end;
			


    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.scrollBox1);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(245);
    obj.layout13:setWidth(300);
    obj.layout13:setHeight(310);
    obj.layout13:setName("layout13");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout13);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(5);
    obj.rectangle11:setYradius(5);
    obj.rectangle11:setCornerType("round");
    obj.rectangle11:setName("rectangle11");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout13);
    obj.label26:setLeft(5);
    obj.label26:setTop(5);
    obj.label26:setWidth(290);
    obj.label26:setHeight(20);
    obj.label26:setText("BATALHA");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(30);
    obj.layout14:setWidth(300);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout14);
    obj.label27:setLeft(5);
    obj.label27:setTop(0);
    obj.label27:setWidth(100);
    obj.label27:setHeight(25);
    obj.label27:setText("HP");
    obj.label27:setName("label27");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout14);
    obj.edit26:setLeft(110);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(90);
    obj.edit26:setHeight(25);
    obj.edit26:setField("hp_atual");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout14);
    obj.edit27:setLeft(200);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(90);
    obj.edit27:setHeight(25);
    obj.edit27:setField("hp_maximo");
    obj.edit27:setName("edit27");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout13);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(55);
    obj.layout15:setWidth(300);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout15);
    obj.label28:setLeft(5);
    obj.label28:setTop(0);
    obj.label28:setWidth(100);
    obj.label28:setHeight(25);
    obj.label28:setText("Recuperação");
    obj.label28:setName("label28");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout15);
    obj.edit28:setLeft(110);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(180);
    obj.edit28:setHeight(25);
    obj.edit28:setField("recuperacao");
    obj.edit28:setName("edit28");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout13);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(80);
    obj.layout16:setWidth(300);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout16);
    obj.label29:setLeft(5);
    obj.label29:setTop(0);
    obj.label29:setWidth(100);
    obj.label29:setHeight(25);
    obj.label29:setText("PD");
    obj.label29:setName("label29");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout16);
    obj.edit29:setLeft(110);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(90);
    obj.edit29:setHeight(25);
    obj.edit29:setField("pd_atual");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout16);
    obj.edit30:setLeft(200);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(90);
    obj.edit30:setHeight(25);
    obj.edit30:setField("pd_maximo");
    obj.edit30:setName("edit30");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout13);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(105);
    obj.layout17:setWidth(300);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout17);
    obj.label30:setLeft(5);
    obj.label30:setTop(0);
    obj.label30:setWidth(100);
    obj.label30:setHeight(25);
    obj.label30:setText("Ódio");
    obj.label30:setName("label30");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout17);
    obj.edit31:setLeft(110);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(180);
    obj.edit31:setHeight(25);
    obj.edit31:setField("odio");
    obj.edit31:setName("edit31");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout13);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(155);
    obj.layout18:setWidth(300);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout18);
    obj.label31:setLeft(5);
    obj.label31:setTop(0);
    obj.label31:setWidth(100);
    obj.label31:setHeight(25);
    obj.label31:setText("Dano Físico");
    obj.label31:setName("label31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout18);
    obj.edit32:setLeft(110);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(180);
    obj.edit32:setHeight(25);
    obj.edit32:setField("dano_fisico");
    obj.edit32:setName("edit32");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout13);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(180);
    obj.layout19:setWidth(300);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout19);
    obj.label32:setLeft(5);
    obj.label32:setTop(0);
    obj.label32:setWidth(100);
    obj.label32:setHeight(25);
    obj.label32:setText("Dano Mágico");
    obj.label32:setName("label32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout19);
    obj.edit33:setLeft(110);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(180);
    obj.edit33:setHeight(25);
    obj.edit33:setField("dano_magico");
    obj.edit33:setName("edit33");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout13);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(205);
    obj.layout20:setWidth(300);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout20);
    obj.label33:setLeft(5);
    obj.label33:setTop(0);
    obj.label33:setWidth(100);
    obj.label33:setHeight(25);
    obj.label33:setText("Defesa Fisíca");
    obj.label33:setName("label33");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout20);
    obj.rectangle12:setLeft(110);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(45);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout20);
    obj.label34:setLeft(110);
    obj.label34:setTop(0);
    obj.label34:setWidth(45);
    obj.label34:setHeight(25);
    obj.label34:setField("defesa_fisica_mod");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout20);
    obj.edit34:setLeft(155);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(45);
    obj.edit34:setHeight(25);
    obj.edit34:setField("defesa_fisica");
    obj.edit34:setName("edit34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout20);
    obj.edit35:setLeft(200);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(45);
    obj.edit35:setHeight(25);
    obj.edit35:setField("defesa_fisica_itens");
    obj.edit35:setName("edit35");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout20);
    obj.rectangle13:setLeft(245);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(45);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("Black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout20);
    obj.label35:setLeft(245);
    obj.label35:setTop(0);
    obj.label35:setWidth(45);
    obj.label35:setHeight(25);
    obj.label35:setField("defesa_fisica_total");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout13);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(230);
    obj.layout21:setWidth(300);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout21);
    obj.label36:setLeft(5);
    obj.label36:setTop(0);
    obj.label36:setWidth(100);
    obj.label36:setHeight(25);
    obj.label36:setText("Defesa Mágica");
    obj.label36:setName("label36");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout21);
    obj.rectangle14:setLeft(110);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(45);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("Black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout21);
    obj.label37:setLeft(110);
    obj.label37:setTop(0);
    obj.label37:setWidth(45);
    obj.label37:setHeight(25);
    obj.label37:setField("defesa_magica_mod");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout21);
    obj.edit36:setLeft(155);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(45);
    obj.edit36:setHeight(25);
    obj.edit36:setField("defesa_magica");
    obj.edit36:setName("edit36");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout21);
    obj.edit37:setLeft(200);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(45);
    obj.edit37:setHeight(25);
    obj.edit37:setField("defesa_magica_itens");
    obj.edit37:setName("edit37");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout21);
    obj.rectangle15:setLeft(245);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(45);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("Black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout21);
    obj.label38:setLeft(245);
    obj.label38:setTop(0);
    obj.label38:setWidth(45);
    obj.label38:setHeight(25);
    obj.label38:setField("defesa_magica_total");
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout13);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(255);
    obj.layout22:setWidth(300);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout22);
    obj.label39:setLeft(5);
    obj.label39:setTop(0);
    obj.label39:setWidth(100);
    obj.label39:setHeight(25);
    obj.label39:setText("Iniciativa");
    obj.label39:setName("label39");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout22);
    obj.rectangle16:setLeft(110);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(45);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("Black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout22);
    obj.label40:setLeft(110);
    obj.label40:setTop(0);
    obj.label40:setWidth(45);
    obj.label40:setHeight(25);
    obj.label40:setField("iniciativa_mod");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout22);
    obj.edit38:setLeft(155);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(45);
    obj.edit38:setHeight(25);
    obj.edit38:setField("Iniciativa");
    obj.edit38:setName("edit38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout22);
    obj.edit39:setLeft(200);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(45);
    obj.edit39:setHeight(25);
    obj.edit39:setField("iniciativa_itens");
    obj.edit39:setName("edit39");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout22);
    obj.rectangle17:setLeft(245);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(45);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("Black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout22);
    obj.label41:setLeft(245);
    obj.label41:setTop(0);
    obj.label41:setWidth(45);
    obj.label41:setHeight(25);
    obj.label41:setField("iniciativa_total");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout13);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(280);
    obj.layout23:setWidth(300);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout23);
    obj.label42:setLeft(5);
    obj.label42:setTop(0);
    obj.label42:setWidth(100);
    obj.label42:setHeight(25);
    obj.label42:setText("Velocidade");
    obj.label42:setName("label42");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout23);
    obj.rectangle18:setLeft(110);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(45);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("Black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout23);
    obj.label43:setLeft(110);
    obj.label43:setTop(0);
    obj.label43:setWidth(45);
    obj.label43:setHeight(25);
    obj.label43:setText("2");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout23);
    obj.edit40:setLeft(155);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(45);
    obj.edit40:setHeight(25);
    obj.edit40:setField("velocidade");
    obj.edit40:setName("edit40");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout23);
    obj.edit41:setLeft(200);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(45);
    obj.edit41:setHeight(25);
    obj.edit41:setField("velocidade_itens");
    obj.edit41:setName("edit41");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout23);
    obj.rectangle19:setLeft(245);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(45);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("Black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout23);
    obj.label44:setLeft(245);
    obj.label44:setTop(0);
    obj.label44:setWidth(45);
    obj.label44:setHeight(25);
    obj.label44:setField("velocidade_total");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.scrollBox1);
    obj.layout24:setLeft(305);
    obj.layout24:setTop(75);
    obj.layout24:setWidth(250);
    obj.layout24:setHeight(335);
    obj.layout24:setName("layout24");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout24);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setXradius(5);
    obj.rectangle20:setYradius(5);
    obj.rectangle20:setCornerType("round");
    obj.rectangle20:setName("rectangle20");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout24);
    obj.label45:setLeft(5);
    obj.label45:setTop(5);
    obj.label45:setWidth(240);
    obj.label45:setHeight(20);
    obj.label45:setText("CAPACIDADES");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout24);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(30);
    obj.layout25:setWidth(300);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout25);
    obj.label46:setLeft(105);
    obj.label46:setTop(0);
    obj.label46:setWidth(35);
    obj.label46:setHeight(25);
    obj.label46:setText("ATR");
    obj.label46:setFontSize(13);
    obj.label46:setName("label46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout25);
    obj.label47:setLeft(140);
    obj.label47:setTop(0);
    obj.label47:setWidth(35);
    obj.label47:setHeight(25);
    obj.label47:setText("HAB");
    obj.label47:setFontSize(13);
    obj.label47:setName("label47");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout25);
    obj.label48:setLeft(170);
    obj.label48:setTop(0);
    obj.label48:setWidth(35);
    obj.label48:setHeight(25);
    obj.label48:setText("Itens");
    obj.label48:setFontSize(12);
    obj.label48:setName("label48");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout25);
    obj.label49:setLeft(205);
    obj.label49:setTop(0);
    obj.label49:setWidth(35);
    obj.label49:setHeight(25);
    obj.label49:setText("Total");
    obj.label49:setFontSize(12);
    obj.label49:setName("label49");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout24);
    obj.layout26:setLeft(5);
    obj.layout26:setTop(55);
    obj.layout26:setWidth(300);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout26);
    obj.label50:setLeft(5);
    obj.label50:setTop(5);
    obj.label50:setWidth(100);
    obj.label50:setHeight(20);
    obj.label50:setText("Atletismo");
    obj.label50:setName("label50");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout26);
    obj.rectangle21:setLeft(100);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(35);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("Black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout26);
    obj.label51:setLeft(100);
    obj.label51:setTop(0);
    obj.label51:setWidth(35);
    obj.label51:setHeight(25);
    obj.label51:setField("atletismo");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout26);
    obj.dataLink1:setField("atletismo");
    obj.dataLink1:setName("dataLink1");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout26);
    obj.edit42:setLeft(140);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(30);
    obj.edit42:setHeight(25);
    obj.edit42:setField("atletismo_habilidades");
    obj.edit42:setName("edit42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout26);
    obj.edit43:setLeft(170);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(30);
    obj.edit43:setHeight(25);
    obj.edit43:setField("atletismo_itens");
    obj.edit43:setName("edit43");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout26);
    obj.rectangle22:setLeft(205);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(35);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("Black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout26);
    obj.label52:setLeft(205);
    obj.label52:setTop(0);
    obj.label52:setWidth(35);
    obj.label52:setHeight(25);
    obj.label52:setField("atletismo_total");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");


				local function atletismoSum();
					if sheet~=nil then
						sheet.atletismo_total =  (tonumber(sheet.atletismo) or 0) + 
												(tonumber(sheet.atletismo_habilidades) or 0) + 
												(tonumber(sheet.atletismo_itens) or 0)
					end;
				end;
			


    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout24);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(80);
    obj.layout27:setWidth(300);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout27);
    obj.label53:setLeft(5);
    obj.label53:setTop(5);
    obj.label53:setWidth(100);
    obj.label53:setHeight(20);
    obj.label53:setText("Tolerância");
    obj.label53:setName("label53");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout27);
    obj.rectangle23:setLeft(100);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(35);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("Black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout27);
    obj.label54:setLeft(100);
    obj.label54:setTop(0);
    obj.label54:setWidth(35);
    obj.label54:setHeight(25);
    obj.label54:setField("tolerancia");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout27);
    obj.dataLink2:setField("tolerancia");
    obj.dataLink2:setName("dataLink2");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout27);
    obj.edit44:setLeft(140);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(30);
    obj.edit44:setHeight(25);
    obj.edit44:setField("tolerancia_habilidades");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout27);
    obj.edit45:setLeft(170);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(30);
    obj.edit45:setHeight(25);
    obj.edit45:setField("tolerancia_itens");
    obj.edit45:setName("edit45");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout27);
    obj.rectangle24:setLeft(205);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(35);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("Black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout27);
    obj.label55:setLeft(205);
    obj.label55:setTop(0);
    obj.label55:setWidth(35);
    obj.label55:setHeight(25);
    obj.label55:setField("tolerancia_total");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");


				local function toleranciaSum();
					if sheet~=nil then
						sheet.tolerancia_total =  (tonumber(sheet.tolerancia) or 0) + 
												(tonumber(sheet.tolerancia_habilidades) or 0) + 
												(tonumber(sheet.tolerancia_itens) or 0)
					end;
				end;
			


    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout24);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(105);
    obj.layout28:setWidth(300);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout28);
    obj.label56:setLeft(5);
    obj.label56:setTop(5);
    obj.label56:setWidth(100);
    obj.label56:setHeight(20);
    obj.label56:setText("Desativar");
    obj.label56:setName("label56");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout28);
    obj.rectangle25:setLeft(100);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(35);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("Black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout28);
    obj.label57:setLeft(100);
    obj.label57:setTop(0);
    obj.label57:setWidth(35);
    obj.label57:setHeight(25);
    obj.label57:setField("desativar");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout28);
    obj.dataLink3:setField("desativar");
    obj.dataLink3:setName("dataLink3");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout28);
    obj.edit46:setLeft(140);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(30);
    obj.edit46:setHeight(25);
    obj.edit46:setField("desativar_habilidades");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout28);
    obj.edit47:setLeft(170);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(30);
    obj.edit47:setHeight(25);
    obj.edit47:setField("desativar_itens");
    obj.edit47:setName("edit47");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout28);
    obj.rectangle26:setLeft(205);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(35);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("Black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout28);
    obj.label58:setLeft(205);
    obj.label58:setTop(0);
    obj.label58:setWidth(35);
    obj.label58:setHeight(25);
    obj.label58:setField("desativar_total");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");


				local function desativarSum();
					if sheet~=nil then
						sheet.desativar_total =  (tonumber(sheet.desativar) or 0) + 
												(tonumber(sheet.desativar_habilidades) or 0) + 
												(tonumber(sheet.desativar_itens) or 0)
					end;
				end;
			


    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout24);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(130);
    obj.layout29:setWidth(300);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout29);
    obj.label59:setLeft(5);
    obj.label59:setTop(5);
    obj.label59:setWidth(100);
    obj.label59:setHeight(20);
    obj.label59:setText("Operar");
    obj.label59:setName("label59");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout29);
    obj.rectangle27:setLeft(100);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(35);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("Black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout29);
    obj.label60:setLeft(100);
    obj.label60:setTop(0);
    obj.label60:setWidth(35);
    obj.label60:setHeight(25);
    obj.label60:setField("operar");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout29);
    obj.dataLink4:setField("operar");
    obj.dataLink4:setName("dataLink4");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout29);
    obj.edit48:setLeft(140);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(30);
    obj.edit48:setHeight(25);
    obj.edit48:setField("operar_habilidades");
    obj.edit48:setName("edit48");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout29);
    obj.edit49:setLeft(170);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(30);
    obj.edit49:setHeight(25);
    obj.edit49:setField("operar_itens");
    obj.edit49:setName("edit49");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout29);
    obj.rectangle28:setLeft(205);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(35);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("Black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout29);
    obj.label61:setLeft(205);
    obj.label61:setTop(0);
    obj.label61:setWidth(35);
    obj.label61:setHeight(25);
    obj.label61:setField("operar_total");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");


				local function operarSum();
					if sheet~=nil then
						sheet.operar_total =  (tonumber(sheet.operar) or 0) + 
												(tonumber(sheet.operar_habilidades) or 0) + 
												(tonumber(sheet.operar_itens) or 0)
					end;
				end;
			


    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout24);
    obj.layout30:setLeft(5);
    obj.layout30:setTop(155);
    obj.layout30:setWidth(300);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout30);
    obj.label62:setLeft(5);
    obj.label62:setTop(5);
    obj.label62:setWidth(100);
    obj.label62:setHeight(20);
    obj.label62:setText("Percepção");
    obj.label62:setName("label62");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout30);
    obj.rectangle29:setLeft(100);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(35);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("Black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout30);
    obj.label63:setLeft(100);
    obj.label63:setTop(0);
    obj.label63:setWidth(35);
    obj.label63:setHeight(25);
    obj.label63:setField("percepcao");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout30);
    obj.dataLink5:setField("percepcao");
    obj.dataLink5:setName("dataLink5");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout30);
    obj.edit50:setLeft(140);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(30);
    obj.edit50:setHeight(25);
    obj.edit50:setField("percepcao_habilidades");
    obj.edit50:setName("edit50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout30);
    obj.edit51:setLeft(170);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(30);
    obj.edit51:setHeight(25);
    obj.edit51:setField("percepcao_itens");
    obj.edit51:setName("edit51");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout30);
    obj.rectangle30:setLeft(205);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(35);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("Black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout30);
    obj.label64:setLeft(205);
    obj.label64:setTop(0);
    obj.label64:setWidth(35);
    obj.label64:setHeight(25);
    obj.label64:setField("percepcao_total");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");


				local function percepcaoSum();
					if sheet~=nil then
						sheet.percepcao_total =  (tonumber(sheet.percepcao) or 0) + 
												(tonumber(sheet.percepcao_habilidades) or 0) + 
												(tonumber(sheet.percepcao_itens) or 0)
					end;
				end;
			


    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout24);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(180);
    obj.layout31:setWidth(300);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout31);
    obj.label65:setLeft(5);
    obj.label65:setTop(5);
    obj.label65:setWidth(100);
    obj.label65:setHeight(20);
    obj.label65:setText("Negociação");
    obj.label65:setName("label65");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout31);
    obj.rectangle31:setLeft(100);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(35);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("Black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout31);
    obj.label66:setLeft(100);
    obj.label66:setTop(0);
    obj.label66:setWidth(35);
    obj.label66:setHeight(25);
    obj.label66:setField("negociacao");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout31);
    obj.dataLink6:setField("negociacao");
    obj.dataLink6:setName("dataLink6");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout31);
    obj.edit52:setLeft(140);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(30);
    obj.edit52:setHeight(25);
    obj.edit52:setField("negociacao_habilidades");
    obj.edit52:setName("edit52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout31);
    obj.edit53:setLeft(170);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(30);
    obj.edit53:setHeight(25);
    obj.edit53:setField("negociacao_itens");
    obj.edit53:setName("edit53");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout31);
    obj.rectangle32:setLeft(205);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(35);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("Black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout31);
    obj.label67:setLeft(205);
    obj.label67:setTop(0);
    obj.label67:setWidth(35);
    obj.label67:setHeight(25);
    obj.label67:setField("negociacao_total");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");


				local function negociacaoSum();
					if sheet~=nil then
						sheet.negociacao_total =  (tonumber(sheet.negociacao) or 0) + 
												(tonumber(sheet.negociacao_habilidades) or 0) + 
												(tonumber(sheet.negociacao_itens) or 0)
					end;
				end;
			


    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout24);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(205);
    obj.layout32:setWidth(300);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout32);
    obj.label68:setLeft(5);
    obj.label68:setTop(5);
    obj.label68:setWidth(100);
    obj.label68:setHeight(20);
    obj.label68:setText("Conhecimento");
    obj.label68:setName("label68");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout32);
    obj.rectangle33:setLeft(100);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(35);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("Black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout32);
    obj.label69:setLeft(100);
    obj.label69:setTop(0);
    obj.label69:setWidth(35);
    obj.label69:setHeight(25);
    obj.label69:setField("conhecimento");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout32);
    obj.dataLink7:setField("conhecimento");
    obj.dataLink7:setName("dataLink7");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout32);
    obj.edit54:setLeft(140);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(30);
    obj.edit54:setHeight(25);
    obj.edit54:setField("conhecimento_habilidades");
    obj.edit54:setName("edit54");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout32);
    obj.edit55:setLeft(170);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(30);
    obj.edit55:setHeight(25);
    obj.edit55:setField("conhecimento_itens");
    obj.edit55:setName("edit55");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout32);
    obj.rectangle34:setLeft(205);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(35);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("Black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout32);
    obj.label70:setLeft(205);
    obj.label70:setTop(0);
    obj.label70:setWidth(35);
    obj.label70:setHeight(25);
    obj.label70:setField("conhecimento_total");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");


				local function conhecimentoSum();
					if sheet~=nil then
						sheet.conhecimento_total =  (tonumber(sheet.conhecimento) or 0) + 
												(tonumber(sheet.conhecimento_habilidades) or 0) + 
												(tonumber(sheet.conhecimento_itens) or 0)
					end;
				end;
			


    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout24);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(230);
    obj.layout33:setWidth(300);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout33);
    obj.label71:setLeft(5);
    obj.label71:setTop(5);
    obj.label71:setWidth(100);
    obj.label71:setHeight(20);
    obj.label71:setText("Analisar");
    obj.label71:setName("label71");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout33);
    obj.rectangle35:setLeft(100);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(35);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("Black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout33);
    obj.label72:setLeft(100);
    obj.label72:setTop(0);
    obj.label72:setWidth(35);
    obj.label72:setHeight(25);
    obj.label72:setField("analisar");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout33);
    obj.dataLink8:setField("analisar");
    obj.dataLink8:setName("dataLink8");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout33);
    obj.edit56:setLeft(140);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(30);
    obj.edit56:setHeight(25);
    obj.edit56:setField("analisar_habilidades");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout33);
    obj.edit57:setLeft(170);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(30);
    obj.edit57:setHeight(25);
    obj.edit57:setField("analisar_itens");
    obj.edit57:setName("edit57");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout33);
    obj.rectangle36:setLeft(205);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(35);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("Black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout33);
    obj.label73:setLeft(205);
    obj.label73:setTop(0);
    obj.label73:setWidth(35);
    obj.label73:setHeight(25);
    obj.label73:setField("analisar_total");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");


				local function analisarSum();
					if sheet~=nil then
						sheet.analisar_total =  (tonumber(sheet.analisar) or 0) + 
												(tonumber(sheet.analisar_habilidades) or 0) + 
												(tonumber(sheet.analisar_itens) or 0)
					end;
				end;
			


    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout24);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(255);
    obj.layout34:setWidth(300);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout34);
    obj.label74:setLeft(5);
    obj.label74:setTop(5);
    obj.label74:setWidth(100);
    obj.label74:setHeight(20);
    obj.label74:setText("Precisão");
    obj.label74:setName("label74");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout34);
    obj.rectangle37:setLeft(100);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(35);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("Black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout34);
    obj.label75:setLeft(100);
    obj.label75:setTop(0);
    obj.label75:setWidth(35);
    obj.label75:setHeight(25);
    obj.label75:setField("precisao");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout34);
    obj.dataLink9:setField("precisao");
    obj.dataLink9:setName("dataLink9");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout34);
    obj.edit58:setLeft(140);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(30);
    obj.edit58:setHeight(25);
    obj.edit58:setField("precisao_habilidades");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout34);
    obj.edit59:setLeft(170);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(30);
    obj.edit59:setHeight(25);
    obj.edit59:setField("precisao_itens");
    obj.edit59:setName("edit59");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout34);
    obj.rectangle38:setLeft(205);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(35);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout34);
    obj.label76:setLeft(205);
    obj.label76:setTop(0);
    obj.label76:setWidth(35);
    obj.label76:setHeight(25);
    obj.label76:setField("precisao_total");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");


				local function precisaoSum();
					if sheet~=nil then
						sheet.precisao_total =  (tonumber(sheet.precisao) or 0) + 
												(tonumber(sheet.precisao_habilidades) or 0) + 
												(tonumber(sheet.precisao_itens) or 0)
					end;
				end;
			


    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout24);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(280);
    obj.layout35:setWidth(300);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout35);
    obj.label77:setLeft(5);
    obj.label77:setTop(5);
    obj.label77:setWidth(100);
    obj.label77:setHeight(20);
    obj.label77:setText("Evasão");
    obj.label77:setName("label77");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout35);
    obj.rectangle39:setLeft(100);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(35);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("Black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout35);
    obj.label78:setLeft(100);
    obj.label78:setTop(0);
    obj.label78:setWidth(35);
    obj.label78:setHeight(25);
    obj.label78:setField("evasao");
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout35);
    obj.dataLink10:setField("evasao");
    obj.dataLink10:setName("dataLink10");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout35);
    obj.edit60:setLeft(140);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(30);
    obj.edit60:setHeight(25);
    obj.edit60:setField("evasao_habilidades");
    obj.edit60:setName("edit60");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout35);
    obj.edit61:setLeft(170);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(30);
    obj.edit61:setHeight(25);
    obj.edit61:setField("evasao_itens");
    obj.edit61:setName("edit61");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout35);
    obj.rectangle40:setLeft(205);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(35);
    obj.rectangle40:setHeight(25);
    obj.rectangle40:setColor("Black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout35);
    obj.label79:setLeft(205);
    obj.label79:setTop(0);
    obj.label79:setWidth(35);
    obj.label79:setHeight(25);
    obj.label79:setField("evasao_total");
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");


				local function evasaoSum();
					if sheet~=nil then
						sheet.evasao_total =  (tonumber(sheet.evasao) or 0) + 
												(tonumber(sheet.evasao_habilidades) or 0) + 
												(tonumber(sheet.evasao_itens) or 0)
					end;
				end;
			


    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout24);
    obj.layout36:setLeft(5);
    obj.layout36:setTop(305);
    obj.layout36:setWidth(300);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout36);
    obj.label80:setLeft(5);
    obj.label80:setTop(5);
    obj.label80:setWidth(100);
    obj.label80:setHeight(20);
    obj.label80:setText("Resistência");
    obj.label80:setName("label80");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout36);
    obj.rectangle41:setLeft(100);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(35);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("Black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout36);
    obj.label81:setLeft(100);
    obj.label81:setTop(0);
    obj.label81:setWidth(35);
    obj.label81:setHeight(25);
    obj.label81:setField("resistencia");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout36);
    obj.dataLink11:setField("resistencia");
    obj.dataLink11:setName("dataLink11");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout36);
    obj.edit62:setLeft(140);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(25);
    obj.edit62:setField("resistencia_habilidades");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout36);
    obj.edit63:setLeft(170);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(30);
    obj.edit63:setHeight(25);
    obj.edit63:setField("resistencia_itens");
    obj.edit63:setName("edit63");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout36);
    obj.rectangle42:setLeft(205);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(35);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("Black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout36);
    obj.label82:setLeft(205);
    obj.label82:setTop(0);
    obj.label82:setWidth(35);
    obj.label82:setHeight(25);
    obj.label82:setField("resistencia_total");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");


				local function resistenciaSum();
					if sheet~=nil then
						sheet.resistencia_total =  (tonumber(sheet.resistencia) or 0) + 
												(tonumber(sheet.resistencia_habilidades) or 0) + 
												(tonumber(sheet.resistencia_itens) or 0)
					end;
				end;
			


    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.scrollBox1);
    obj.layout37:setLeft(305);
    obj.layout37:setTop(415);
    obj.layout37:setWidth(250);
    obj.layout37:setHeight(140);
    obj.layout37:setName("layout37");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout37);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("black");
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(5);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout37);
    obj.label83:setLeft(5);
    obj.label83:setTop(5);
    obj.label83:setWidth(240);
    obj.label83:setHeight(20);
    obj.label83:setText("EFEITOS");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout37);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(240);
    obj.textEditor1:setHeight(105);
    obj.textEditor1:setField("efeitos");
    obj.textEditor1:setName("textEditor1");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.scrollBox1);
    obj.rectangle44:setLeft(560);
    obj.rectangle44:setTop(75);
    obj.rectangle44:setWidth(250);
    obj.rectangle44:setHeight(250);
    obj.rectangle44:setColor("DimGray");
    obj.rectangle44:setXradius(5);
    obj.rectangle44:setYradius(5);
    obj.rectangle44:setCornerType("innerLine");
    obj.rectangle44:setName("rectangle44");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(560);
    obj.image1:setTop(75);
    obj.image1:setWidth(250);
    obj.image1:setHeight(250);
    obj.image1:setField("avatar");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setAlign("client");
    obj.image2:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20LH%20releases/imagens/block.png");
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.tab2 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.frmLH2 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH2:setParent(obj.tab2);
    obj.frmLH2:setName("frmLH2");
    obj.frmLH2:setAlign("client");
    obj.frmLH2:setTheme("dark");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmLH2);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.scrollBox2);
    obj.layout38:setLeft(0);
    obj.layout38:setTop(0);
    obj.layout38:setWidth(1310);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout38);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setXradius(5);
    obj.rectangle45:setYradius(5);
    obj.rectangle45:setCornerType("round");
    obj.rectangle45:setName("rectangle45");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout38);
    obj.button1:setText("+");
    obj.button1:setLeft(2);
    obj.button1:setTop(2);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout38);
    obj.label84:setLeft(5);
    obj.label84:setTop(0);
    obj.label84:setWidth(1300);
    obj.label84:setHeight(25);
    obj.label84:setText("HABILIDADES");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.rclListaDasHabilidades = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasHabilidades:setParent(obj.scrollBox2);
    obj.rclListaDasHabilidades:setName("rclListaDasHabilidades");
    obj.rclListaDasHabilidades:setField("listaHablidades");
    obj.rclListaDasHabilidades:setTemplateForm("frmLH2_1");
    obj.rclListaDasHabilidades:setLeft(0);
    obj.rclListaDasHabilidades:setTop(30);
    obj.rclListaDasHabilidades:setWidth(1310);
    obj.rclListaDasHabilidades:setHeight(580);
    obj.rclListaDasHabilidades:setLayout("horizontalTiles");
    obj.rclListaDasHabilidades:setMinQt(1);

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.scrollBox2);
    obj.image3:setAlign("client");
    obj.image3:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20LH%20releases/imagens/block.png");
    obj.image3:setStyle("autoFit");
    obj.image3:setName("image3");

    obj.tab3 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Inventario");
    obj.tab3:setName("tab3");

    obj.frmLH3 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH3:setParent(obj.tab3);
    obj.frmLH3:setName("frmLH3");
    obj.frmLH3:setAlign("client");
    obj.frmLH3:setTheme("dark");
    obj.frmLH3:setMargins({top=1});

    obj.scrollBox3 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.frmLH3);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.scrollBox3);
    obj.layout39:setLeft(0);
    obj.layout39:setTop(0);
    obj.layout39:setWidth(400);
    obj.layout39:setHeight(110);
    obj.layout39:setName("layout39");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout39);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setXradius(5);
    obj.rectangle46:setYradius(5);
    obj.rectangle46:setCornerType("round");
    obj.rectangle46:setName("rectangle46");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout39);
    obj.label85:setLeft(5);
    obj.label85:setTop(5);
    obj.label85:setWidth(100);
    obj.label85:setHeight(25);
    obj.label85:setText("Mão");
    obj.label85:setName("label85");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout39);
    obj.edit64:setLeft(50);
    obj.edit64:setTop(5);
    obj.edit64:setWidth(160);
    obj.edit64:setHeight(25);
    obj.edit64:setField("nome_mao_1");
    obj.edit64:setName("edit64");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout39);
    obj.label86:setLeft(215);
    obj.label86:setTop(5);
    obj.label86:setWidth(100);
    obj.label86:setHeight(25);
    obj.label86:setText("Rank");
    obj.label86:setName("label86");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout39);
    obj.edit65:setLeft(255);
    obj.edit65:setTop(5);
    obj.edit65:setWidth(50);
    obj.edit65:setHeight(25);
    obj.edit65:setField("rank_mao_1");
    obj.edit65:setName("edit65");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout39);
    obj.label87:setLeft(310);
    obj.label87:setTop(5);
    obj.label87:setWidth(100);
    obj.label87:setHeight(25);
    obj.label87:setText("Preço");
    obj.label87:setName("label87");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout39);
    obj.edit66:setLeft(345);
    obj.edit66:setTop(5);
    obj.edit66:setWidth(50);
    obj.edit66:setHeight(25);
    obj.edit66:setField("preco_mao_1");
    obj.edit66:setName("edit66");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout39);
    obj.label88:setLeft(5);
    obj.label88:setTop(30);
    obj.label88:setWidth(100);
    obj.label88:setHeight(25);
    obj.label88:setText("TAG");
    obj.label88:setName("label88");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout39);
    obj.edit67:setLeft(50);
    obj.edit67:setTop(30);
    obj.edit67:setWidth(160);
    obj.edit67:setHeight(25);
    obj.edit67:setField("tag_mao_1");
    obj.edit67:setName("edit67");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout39);
    obj.label89:setLeft(215);
    obj.label89:setTop(30);
    obj.label89:setWidth(100);
    obj.label89:setHeight(25);
    obj.label89:setText("Ataque");
    obj.label89:setFontSize(12);
    obj.label89:setName("label89");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout39);
    obj.edit68:setLeft(255);
    obj.edit68:setTop(30);
    obj.edit68:setWidth(50);
    obj.edit68:setHeight(25);
    obj.edit68:setField("ataque_mao_1");
    obj.edit68:setName("edit68");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout39);
    obj.label90:setLeft(310);
    obj.label90:setTop(30);
    obj.label90:setWidth(100);
    obj.label90:setHeight(25);
    obj.label90:setText("Magia");
    obj.label90:setName("label90");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout39);
    obj.edit69:setLeft(345);
    obj.edit69:setTop(30);
    obj.edit69:setWidth(50);
    obj.edit69:setHeight(25);
    obj.edit69:setField("magia_mao_1");
    obj.edit69:setName("edit69");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout39);
    obj.label91:setLeft(5);
    obj.label91:setTop(55);
    obj.label91:setWidth(100);
    obj.label91:setHeight(25);
    obj.label91:setText("Efeito");
    obj.label91:setName("label91");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout39);
    obj.edit70:setLeft(50);
    obj.edit70:setTop(55);
    obj.edit70:setWidth(160);
    obj.edit70:setHeight(25);
    obj.edit70:setField("efeito_mao_1");
    obj.edit70:setName("edit70");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout39);
    obj.label92:setLeft(215);
    obj.label92:setTop(55);
    obj.label92:setWidth(100);
    obj.label92:setHeight(25);
    obj.label92:setText("PDEF");
    obj.label92:setName("label92");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout39);
    obj.edit71:setLeft(255);
    obj.edit71:setTop(55);
    obj.edit71:setWidth(50);
    obj.edit71:setHeight(25);
    obj.edit71:setField("pdef_mao_1");
    obj.edit71:setName("edit71");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout39);
    obj.label93:setLeft(310);
    obj.label93:setTop(55);
    obj.label93:setWidth(100);
    obj.label93:setHeight(25);
    obj.label93:setText("MDEF");
    obj.label93:setName("label93");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout39);
    obj.edit72:setLeft(345);
    obj.edit72:setTop(55);
    obj.edit72:setWidth(50);
    obj.edit72:setHeight(25);
    obj.edit72:setField("mdef_mao_1");
    obj.edit72:setName("edit72");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout39);
    obj.label94:setLeft(115);
    obj.label94:setTop(80);
    obj.label94:setWidth(100);
    obj.label94:setHeight(25);
    obj.label94:setText("Iniciativa");
    obj.label94:setFontSize(11);
    obj.label94:setName("label94");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout39);
    obj.edit73:setLeft(160);
    obj.edit73:setTop(80);
    obj.edit73:setWidth(50);
    obj.edit73:setHeight(25);
    obj.edit73:setField("iniciativa_mao_1");
    obj.edit73:setName("edit73");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout39);
    obj.label95:setLeft(215);
    obj.label95:setTop(80);
    obj.label95:setWidth(100);
    obj.label95:setHeight(25);
    obj.label95:setText("Precisão");
    obj.label95:setFontSize(11);
    obj.label95:setName("label95");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout39);
    obj.edit74:setLeft(255);
    obj.edit74:setTop(80);
    obj.edit74:setWidth(50);
    obj.edit74:setHeight(25);
    obj.edit74:setField("precisao_mao_1");
    obj.edit74:setName("edit74");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout39);
    obj.label96:setLeft(310);
    obj.label96:setTop(80);
    obj.label96:setWidth(100);
    obj.label96:setHeight(25);
    obj.label96:setText("Alcance");
    obj.label96:setFontSize(10);
    obj.label96:setName("label96");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout39);
    obj.edit75:setLeft(345);
    obj.edit75:setTop(80);
    obj.edit75:setWidth(50);
    obj.edit75:setHeight(25);
    obj.edit75:setField("alcance_mao_1");
    obj.edit75:setName("edit75");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox3);
    obj.layout40:setLeft(405);
    obj.layout40:setTop(0);
    obj.layout40:setWidth(400);
    obj.layout40:setHeight(110);
    obj.layout40:setName("layout40");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout40);
    obj.rectangle47:setAlign("client");
    obj.rectangle47:setColor("black");
    obj.rectangle47:setXradius(5);
    obj.rectangle47:setYradius(5);
    obj.rectangle47:setCornerType("round");
    obj.rectangle47:setName("rectangle47");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout40);
    obj.label97:setLeft(5);
    obj.label97:setTop(5);
    obj.label97:setWidth(100);
    obj.label97:setHeight(25);
    obj.label97:setText("Mão");
    obj.label97:setName("label97");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout40);
    obj.edit76:setLeft(50);
    obj.edit76:setTop(5);
    obj.edit76:setWidth(160);
    obj.edit76:setHeight(25);
    obj.edit76:setField("nome_mao_2");
    obj.edit76:setName("edit76");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout40);
    obj.label98:setLeft(215);
    obj.label98:setTop(5);
    obj.label98:setWidth(100);
    obj.label98:setHeight(25);
    obj.label98:setText("Rank");
    obj.label98:setName("label98");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout40);
    obj.edit77:setLeft(255);
    obj.edit77:setTop(5);
    obj.edit77:setWidth(50);
    obj.edit77:setHeight(25);
    obj.edit77:setField("rank_mao_2");
    obj.edit77:setName("edit77");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout40);
    obj.label99:setLeft(310);
    obj.label99:setTop(5);
    obj.label99:setWidth(100);
    obj.label99:setHeight(25);
    obj.label99:setText("Preço");
    obj.label99:setName("label99");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout40);
    obj.edit78:setLeft(345);
    obj.edit78:setTop(5);
    obj.edit78:setWidth(50);
    obj.edit78:setHeight(25);
    obj.edit78:setField("preco_mao_2");
    obj.edit78:setName("edit78");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout40);
    obj.label100:setLeft(5);
    obj.label100:setTop(30);
    obj.label100:setWidth(100);
    obj.label100:setHeight(25);
    obj.label100:setText("TAG");
    obj.label100:setName("label100");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout40);
    obj.edit79:setLeft(50);
    obj.edit79:setTop(30);
    obj.edit79:setWidth(160);
    obj.edit79:setHeight(25);
    obj.edit79:setField("tag_mao_2");
    obj.edit79:setName("edit79");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout40);
    obj.label101:setLeft(215);
    obj.label101:setTop(30);
    obj.label101:setWidth(100);
    obj.label101:setHeight(25);
    obj.label101:setText("Ataque");
    obj.label101:setFontSize(12);
    obj.label101:setName("label101");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout40);
    obj.edit80:setLeft(255);
    obj.edit80:setTop(30);
    obj.edit80:setWidth(50);
    obj.edit80:setHeight(25);
    obj.edit80:setField("ataque_mao_2");
    obj.edit80:setName("edit80");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout40);
    obj.label102:setLeft(310);
    obj.label102:setTop(30);
    obj.label102:setWidth(100);
    obj.label102:setHeight(25);
    obj.label102:setText("Magia");
    obj.label102:setName("label102");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout40);
    obj.edit81:setLeft(345);
    obj.edit81:setTop(30);
    obj.edit81:setWidth(50);
    obj.edit81:setHeight(25);
    obj.edit81:setField("magia_mao_2");
    obj.edit81:setName("edit81");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout40);
    obj.label103:setLeft(5);
    obj.label103:setTop(55);
    obj.label103:setWidth(100);
    obj.label103:setHeight(25);
    obj.label103:setText("Efeito");
    obj.label103:setName("label103");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout40);
    obj.edit82:setLeft(50);
    obj.edit82:setTop(55);
    obj.edit82:setWidth(160);
    obj.edit82:setHeight(25);
    obj.edit82:setField("efeito_mao_2");
    obj.edit82:setName("edit82");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout40);
    obj.label104:setLeft(215);
    obj.label104:setTop(55);
    obj.label104:setWidth(100);
    obj.label104:setHeight(25);
    obj.label104:setText("PDEF");
    obj.label104:setName("label104");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout40);
    obj.edit83:setLeft(255);
    obj.edit83:setTop(55);
    obj.edit83:setWidth(50);
    obj.edit83:setHeight(25);
    obj.edit83:setField("pdef_mao_2");
    obj.edit83:setName("edit83");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout40);
    obj.label105:setLeft(310);
    obj.label105:setTop(55);
    obj.label105:setWidth(100);
    obj.label105:setHeight(25);
    obj.label105:setText("MDEF");
    obj.label105:setName("label105");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout40);
    obj.edit84:setLeft(345);
    obj.edit84:setTop(55);
    obj.edit84:setWidth(50);
    obj.edit84:setHeight(25);
    obj.edit84:setField("mdef_mao_2");
    obj.edit84:setName("edit84");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout40);
    obj.label106:setLeft(115);
    obj.label106:setTop(80);
    obj.label106:setWidth(100);
    obj.label106:setHeight(25);
    obj.label106:setText("Iniciativa");
    obj.label106:setFontSize(11);
    obj.label106:setName("label106");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout40);
    obj.edit85:setLeft(160);
    obj.edit85:setTop(80);
    obj.edit85:setWidth(50);
    obj.edit85:setHeight(25);
    obj.edit85:setField("iniciativa_mao_2");
    obj.edit85:setName("edit85");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout40);
    obj.label107:setLeft(215);
    obj.label107:setTop(80);
    obj.label107:setWidth(100);
    obj.label107:setHeight(25);
    obj.label107:setText("Precisão");
    obj.label107:setFontSize(11);
    obj.label107:setName("label107");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout40);
    obj.edit86:setLeft(255);
    obj.edit86:setTop(80);
    obj.edit86:setWidth(50);
    obj.edit86:setHeight(25);
    obj.edit86:setField("precisao_mao_2");
    obj.edit86:setName("edit86");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout40);
    obj.label108:setLeft(310);
    obj.label108:setTop(80);
    obj.label108:setWidth(100);
    obj.label108:setHeight(25);
    obj.label108:setText("Alcance");
    obj.label108:setFontSize(10);
    obj.label108:setName("label108");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout40);
    obj.edit87:setLeft(345);
    obj.edit87:setTop(80);
    obj.edit87:setWidth(50);
    obj.edit87:setHeight(25);
    obj.edit87:setField("alcance_mao_2");
    obj.edit87:setName("edit87");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.scrollBox3);
    obj.layout41:setLeft(810);
    obj.layout41:setTop(0);
    obj.layout41:setWidth(400);
    obj.layout41:setHeight(110);
    obj.layout41:setName("layout41");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout41);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setXradius(5);
    obj.rectangle48:setYradius(5);
    obj.rectangle48:setCornerType("round");
    obj.rectangle48:setName("rectangle48");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout41);
    obj.label109:setLeft(5);
    obj.label109:setTop(5);
    obj.label109:setWidth(100);
    obj.label109:setHeight(25);
    obj.label109:setText("Armadura");
    obj.label109:setFontSize(10);
    obj.label109:setName("label109");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout41);
    obj.edit88:setLeft(50);
    obj.edit88:setTop(5);
    obj.edit88:setWidth(160);
    obj.edit88:setHeight(25);
    obj.edit88:setField("nome_armadura");
    obj.edit88:setName("edit88");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout41);
    obj.label110:setLeft(215);
    obj.label110:setTop(5);
    obj.label110:setWidth(100);
    obj.label110:setHeight(25);
    obj.label110:setText("Rank");
    obj.label110:setName("label110");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout41);
    obj.edit89:setLeft(255);
    obj.edit89:setTop(5);
    obj.edit89:setWidth(50);
    obj.edit89:setHeight(25);
    obj.edit89:setField("rank_armadura");
    obj.edit89:setName("edit89");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout41);
    obj.label111:setLeft(310);
    obj.label111:setTop(5);
    obj.label111:setWidth(100);
    obj.label111:setHeight(25);
    obj.label111:setText("Preço");
    obj.label111:setName("label111");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout41);
    obj.edit90:setLeft(345);
    obj.edit90:setTop(5);
    obj.edit90:setWidth(50);
    obj.edit90:setHeight(25);
    obj.edit90:setField("preco_armadura");
    obj.edit90:setName("edit90");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout41);
    obj.label112:setLeft(5);
    obj.label112:setTop(30);
    obj.label112:setWidth(100);
    obj.label112:setHeight(25);
    obj.label112:setText("TAG");
    obj.label112:setName("label112");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout41);
    obj.edit91:setLeft(50);
    obj.edit91:setTop(30);
    obj.edit91:setWidth(160);
    obj.edit91:setHeight(25);
    obj.edit91:setField("tag_armadura");
    obj.edit91:setName("edit91");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout41);
    obj.label113:setLeft(215);
    obj.label113:setTop(30);
    obj.label113:setWidth(100);
    obj.label113:setHeight(25);
    obj.label113:setText("PDEF");
    obj.label113:setName("label113");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout41);
    obj.edit92:setLeft(255);
    obj.edit92:setTop(30);
    obj.edit92:setWidth(50);
    obj.edit92:setHeight(25);
    obj.edit92:setField("pdef_armadura");
    obj.edit92:setName("edit92");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout41);
    obj.label114:setLeft(310);
    obj.label114:setTop(30);
    obj.label114:setWidth(100);
    obj.label114:setHeight(25);
    obj.label114:setText("MDEF");
    obj.label114:setName("label114");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout41);
    obj.edit93:setLeft(345);
    obj.edit93:setTop(30);
    obj.edit93:setWidth(50);
    obj.edit93:setHeight(25);
    obj.edit93:setField("mdef_armadura");
    obj.edit93:setName("edit93");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout41);
    obj.label115:setLeft(5);
    obj.label115:setTop(55);
    obj.label115:setWidth(100);
    obj.label115:setHeight(25);
    obj.label115:setText("Efeito");
    obj.label115:setName("label115");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout41);
    obj.edit94:setLeft(50);
    obj.edit94:setTop(55);
    obj.edit94:setWidth(160);
    obj.edit94:setHeight(25);
    obj.edit94:setField("efeito_armadura");
    obj.edit94:setName("edit94");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout41);
    obj.label116:setLeft(215);
    obj.label116:setTop(55);
    obj.label116:setWidth(100);
    obj.label116:setHeight(25);
    obj.label116:setText("Iniciativa");
    obj.label116:setFontSize(10);
    obj.label116:setName("label116");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout41);
    obj.edit95:setLeft(255);
    obj.edit95:setTop(55);
    obj.edit95:setWidth(50);
    obj.edit95:setHeight(25);
    obj.edit95:setField("iniciativa_armadura");
    obj.edit95:setName("edit95");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.scrollBox3);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(115);
    obj.layout42:setWidth(400);
    obj.layout42:setHeight(85);
    obj.layout42:setName("layout42");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout42);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setXradius(5);
    obj.rectangle49:setYradius(5);
    obj.rectangle49:setCornerType("round");
    obj.rectangle49:setName("rectangle49");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout42);
    obj.label117:setLeft(5);
    obj.label117:setTop(5);
    obj.label117:setWidth(100);
    obj.label117:setHeight(25);
    obj.label117:setText("Acessório");
    obj.label117:setFontSize(10);
    obj.label117:setName("label117");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout42);
    obj.edit96:setLeft(50);
    obj.edit96:setTop(5);
    obj.edit96:setWidth(160);
    obj.edit96:setHeight(25);
    obj.edit96:setField("nome_acessorio_1");
    obj.edit96:setName("edit96");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout42);
    obj.label118:setLeft(215);
    obj.label118:setTop(5);
    obj.label118:setWidth(100);
    obj.label118:setHeight(25);
    obj.label118:setText("Rank");
    obj.label118:setName("label118");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout42);
    obj.edit97:setLeft(255);
    obj.edit97:setTop(5);
    obj.edit97:setWidth(50);
    obj.edit97:setHeight(25);
    obj.edit97:setField("rank_acessorio_1");
    obj.edit97:setName("edit97");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout42);
    obj.label119:setLeft(310);
    obj.label119:setTop(5);
    obj.label119:setWidth(100);
    obj.label119:setHeight(25);
    obj.label119:setText("Preço");
    obj.label119:setName("label119");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout42);
    obj.edit98:setLeft(345);
    obj.edit98:setTop(5);
    obj.edit98:setWidth(50);
    obj.edit98:setHeight(25);
    obj.edit98:setField("preco_acessorio_1");
    obj.edit98:setName("edit98");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout42);
    obj.label120:setLeft(5);
    obj.label120:setTop(30);
    obj.label120:setWidth(100);
    obj.label120:setHeight(25);
    obj.label120:setText("TAG");
    obj.label120:setName("label120");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout42);
    obj.edit99:setLeft(50);
    obj.edit99:setTop(30);
    obj.edit99:setWidth(160);
    obj.edit99:setHeight(25);
    obj.edit99:setField("tag_acessorio_1");
    obj.edit99:setName("edit99");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout42);
    obj.label121:setLeft(215);
    obj.label121:setTop(30);
    obj.label121:setWidth(100);
    obj.label121:setHeight(25);
    obj.label121:setText("PDEF");
    obj.label121:setName("label121");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout42);
    obj.edit100:setLeft(255);
    obj.edit100:setTop(30);
    obj.edit100:setWidth(50);
    obj.edit100:setHeight(25);
    obj.edit100:setField("pdef_acessorio_1");
    obj.edit100:setName("edit100");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout42);
    obj.label122:setLeft(310);
    obj.label122:setTop(30);
    obj.label122:setWidth(100);
    obj.label122:setHeight(25);
    obj.label122:setText("MDEF");
    obj.label122:setName("label122");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout42);
    obj.edit101:setLeft(345);
    obj.edit101:setTop(30);
    obj.edit101:setWidth(50);
    obj.edit101:setHeight(25);
    obj.edit101:setField("mdef_acessorio_1");
    obj.edit101:setName("edit101");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout42);
    obj.label123:setLeft(5);
    obj.label123:setTop(55);
    obj.label123:setWidth(100);
    obj.label123:setHeight(25);
    obj.label123:setText("Efeito");
    obj.label123:setName("label123");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout42);
    obj.edit102:setLeft(50);
    obj.edit102:setTop(55);
    obj.edit102:setWidth(160);
    obj.edit102:setHeight(25);
    obj.edit102:setField("efeito_acessorio_1");
    obj.edit102:setName("edit102");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout42);
    obj.label124:setLeft(215);
    obj.label124:setTop(55);
    obj.label124:setWidth(100);
    obj.label124:setHeight(25);
    obj.label124:setText("Iniciativa");
    obj.label124:setFontSize(10);
    obj.label124:setName("label124");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout42);
    obj.edit103:setLeft(255);
    obj.edit103:setTop(55);
    obj.edit103:setWidth(50);
    obj.edit103:setHeight(25);
    obj.edit103:setField("iniciativa_acessorio_1");
    obj.edit103:setName("edit103");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout42);
    obj.label125:setLeft(310);
    obj.label125:setTop(55);
    obj.label125:setWidth(100);
    obj.label125:setHeight(25);
    obj.label125:setText("Magia");
    obj.label125:setName("label125");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout42);
    obj.edit104:setLeft(345);
    obj.edit104:setTop(55);
    obj.edit104:setWidth(50);
    obj.edit104:setHeight(25);
    obj.edit104:setField("magia_acessorio_1");
    obj.edit104:setName("edit104");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.scrollBox3);
    obj.layout43:setLeft(405);
    obj.layout43:setTop(115);
    obj.layout43:setWidth(400);
    obj.layout43:setHeight(85);
    obj.layout43:setName("layout43");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout43);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setXradius(5);
    obj.rectangle50:setYradius(5);
    obj.rectangle50:setCornerType("round");
    obj.rectangle50:setName("rectangle50");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout43);
    obj.label126:setLeft(5);
    obj.label126:setTop(5);
    obj.label126:setWidth(100);
    obj.label126:setHeight(25);
    obj.label126:setText("Acessório");
    obj.label126:setFontSize(10);
    obj.label126:setName("label126");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout43);
    obj.edit105:setLeft(50);
    obj.edit105:setTop(5);
    obj.edit105:setWidth(160);
    obj.edit105:setHeight(25);
    obj.edit105:setField("nome_acessorio_2");
    obj.edit105:setName("edit105");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout43);
    obj.label127:setLeft(215);
    obj.label127:setTop(5);
    obj.label127:setWidth(100);
    obj.label127:setHeight(25);
    obj.label127:setText("Rank");
    obj.label127:setName("label127");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout43);
    obj.edit106:setLeft(255);
    obj.edit106:setTop(5);
    obj.edit106:setWidth(50);
    obj.edit106:setHeight(25);
    obj.edit106:setField("rank_acessorio_2");
    obj.edit106:setName("edit106");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout43);
    obj.label128:setLeft(310);
    obj.label128:setTop(5);
    obj.label128:setWidth(100);
    obj.label128:setHeight(25);
    obj.label128:setText("Preço");
    obj.label128:setName("label128");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout43);
    obj.edit107:setLeft(345);
    obj.edit107:setTop(5);
    obj.edit107:setWidth(50);
    obj.edit107:setHeight(25);
    obj.edit107:setField("preco_acessorio_2");
    obj.edit107:setName("edit107");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout43);
    obj.label129:setLeft(5);
    obj.label129:setTop(30);
    obj.label129:setWidth(100);
    obj.label129:setHeight(25);
    obj.label129:setText("TAG");
    obj.label129:setName("label129");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout43);
    obj.edit108:setLeft(50);
    obj.edit108:setTop(30);
    obj.edit108:setWidth(160);
    obj.edit108:setHeight(25);
    obj.edit108:setField("tag_acessorio_2");
    obj.edit108:setName("edit108");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout43);
    obj.label130:setLeft(215);
    obj.label130:setTop(30);
    obj.label130:setWidth(100);
    obj.label130:setHeight(25);
    obj.label130:setText("PDEF");
    obj.label130:setName("label130");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout43);
    obj.edit109:setLeft(255);
    obj.edit109:setTop(30);
    obj.edit109:setWidth(50);
    obj.edit109:setHeight(25);
    obj.edit109:setField("pdef_acessorio_2");
    obj.edit109:setName("edit109");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout43);
    obj.label131:setLeft(310);
    obj.label131:setTop(30);
    obj.label131:setWidth(100);
    obj.label131:setHeight(25);
    obj.label131:setText("MDEF");
    obj.label131:setName("label131");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout43);
    obj.edit110:setLeft(345);
    obj.edit110:setTop(30);
    obj.edit110:setWidth(50);
    obj.edit110:setHeight(25);
    obj.edit110:setField("mdef_acessorio_2");
    obj.edit110:setName("edit110");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout43);
    obj.label132:setLeft(5);
    obj.label132:setTop(55);
    obj.label132:setWidth(100);
    obj.label132:setHeight(25);
    obj.label132:setText("Efeito");
    obj.label132:setName("label132");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout43);
    obj.edit111:setLeft(50);
    obj.edit111:setTop(55);
    obj.edit111:setWidth(160);
    obj.edit111:setHeight(25);
    obj.edit111:setField("efeito_acessorio_2");
    obj.edit111:setName("edit111");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout43);
    obj.label133:setLeft(215);
    obj.label133:setTop(55);
    obj.label133:setWidth(100);
    obj.label133:setHeight(25);
    obj.label133:setText("Iniciativa");
    obj.label133:setFontSize(10);
    obj.label133:setName("label133");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout43);
    obj.edit112:setLeft(255);
    obj.edit112:setTop(55);
    obj.edit112:setWidth(50);
    obj.edit112:setHeight(25);
    obj.edit112:setField("iniciativa_acessorio_2");
    obj.edit112:setName("edit112");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout43);
    obj.label134:setLeft(310);
    obj.label134:setTop(55);
    obj.label134:setWidth(100);
    obj.label134:setHeight(25);
    obj.label134:setText("Magia");
    obj.label134:setName("label134");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout43);
    obj.edit113:setLeft(345);
    obj.edit113:setTop(55);
    obj.edit113:setWidth(50);
    obj.edit113:setHeight(25);
    obj.edit113:setField("magia_acessorio_2");
    obj.edit113:setName("edit113");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.scrollBox3);
    obj.layout44:setLeft(810);
    obj.layout44:setTop(115);
    obj.layout44:setWidth(400);
    obj.layout44:setHeight(85);
    obj.layout44:setName("layout44");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout44);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setXradius(5);
    obj.rectangle51:setYradius(5);
    obj.rectangle51:setCornerType("round");
    obj.rectangle51:setName("rectangle51");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout44);
    obj.label135:setLeft(5);
    obj.label135:setTop(5);
    obj.label135:setWidth(100);
    obj.label135:setHeight(25);
    obj.label135:setText("Acessório");
    obj.label135:setFontSize(10);
    obj.label135:setName("label135");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout44);
    obj.edit114:setLeft(50);
    obj.edit114:setTop(5);
    obj.edit114:setWidth(160);
    obj.edit114:setHeight(25);
    obj.edit114:setField("nome_acessorio_3");
    obj.edit114:setName("edit114");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout44);
    obj.label136:setLeft(215);
    obj.label136:setTop(5);
    obj.label136:setWidth(100);
    obj.label136:setHeight(25);
    obj.label136:setText("Rank");
    obj.label136:setName("label136");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout44);
    obj.edit115:setLeft(255);
    obj.edit115:setTop(5);
    obj.edit115:setWidth(50);
    obj.edit115:setHeight(25);
    obj.edit115:setField("rank_acessorio_3");
    obj.edit115:setName("edit115");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout44);
    obj.label137:setLeft(310);
    obj.label137:setTop(5);
    obj.label137:setWidth(100);
    obj.label137:setHeight(25);
    obj.label137:setText("Preço");
    obj.label137:setName("label137");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout44);
    obj.edit116:setLeft(345);
    obj.edit116:setTop(5);
    obj.edit116:setWidth(50);
    obj.edit116:setHeight(25);
    obj.edit116:setField("preco_acessorio_3");
    obj.edit116:setName("edit116");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout44);
    obj.label138:setLeft(5);
    obj.label138:setTop(30);
    obj.label138:setWidth(100);
    obj.label138:setHeight(25);
    obj.label138:setText("TAG");
    obj.label138:setName("label138");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout44);
    obj.edit117:setLeft(50);
    obj.edit117:setTop(30);
    obj.edit117:setWidth(160);
    obj.edit117:setHeight(25);
    obj.edit117:setField("tag_acessorio_3");
    obj.edit117:setName("edit117");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout44);
    obj.label139:setLeft(215);
    obj.label139:setTop(30);
    obj.label139:setWidth(100);
    obj.label139:setHeight(25);
    obj.label139:setText("PDEF");
    obj.label139:setName("label139");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout44);
    obj.edit118:setLeft(255);
    obj.edit118:setTop(30);
    obj.edit118:setWidth(50);
    obj.edit118:setHeight(25);
    obj.edit118:setField("pdef_acessorio_3");
    obj.edit118:setName("edit118");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout44);
    obj.label140:setLeft(310);
    obj.label140:setTop(30);
    obj.label140:setWidth(100);
    obj.label140:setHeight(25);
    obj.label140:setText("MDEF");
    obj.label140:setName("label140");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout44);
    obj.edit119:setLeft(345);
    obj.edit119:setTop(30);
    obj.edit119:setWidth(50);
    obj.edit119:setHeight(25);
    obj.edit119:setField("mdef_acessorio_3");
    obj.edit119:setName("edit119");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout44);
    obj.label141:setLeft(5);
    obj.label141:setTop(55);
    obj.label141:setWidth(100);
    obj.label141:setHeight(25);
    obj.label141:setText("Efeito");
    obj.label141:setName("label141");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout44);
    obj.edit120:setLeft(50);
    obj.edit120:setTop(55);
    obj.edit120:setWidth(160);
    obj.edit120:setHeight(25);
    obj.edit120:setField("efeito_acessorio_3");
    obj.edit120:setName("edit120");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout44);
    obj.label142:setLeft(215);
    obj.label142:setTop(55);
    obj.label142:setWidth(100);
    obj.label142:setHeight(25);
    obj.label142:setText("Iniciativa");
    obj.label142:setFontSize(10);
    obj.label142:setName("label142");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout44);
    obj.edit121:setLeft(255);
    obj.edit121:setTop(55);
    obj.edit121:setWidth(50);
    obj.edit121:setHeight(25);
    obj.edit121:setField("iniciativa_acessorio_3");
    obj.edit121:setName("edit121");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout44);
    obj.label143:setLeft(310);
    obj.label143:setTop(55);
    obj.label143:setWidth(100);
    obj.label143:setHeight(25);
    obj.label143:setText("Magia");
    obj.label143:setName("label143");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout44);
    obj.edit122:setLeft(345);
    obj.edit122:setTop(55);
    obj.edit122:setWidth(50);
    obj.edit122:setHeight(25);
    obj.edit122:setField("magia_acessorio_3");
    obj.edit122:setName("edit122");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.scrollBox3);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(205);
    obj.layout45:setWidth(775);
    obj.layout45:setHeight(386);
    obj.layout45:setName("layout45");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout45);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setXradius(5);
    obj.rectangle52:setYradius(5);
    obj.rectangle52:setCornerType("round");
    obj.rectangle52:setName("rectangle52");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout45);
    obj.button2:setText("+");
    obj.button2:setLeft(2);
    obj.button2:setTop(2);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setName("button2");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout45);
    obj.label144:setLeft(5);
    obj.label144:setTop(0);
    obj.label144:setWidth(765);
    obj.label144:setHeight(25);
    obj.label144:setText("BOLSA/EXTRAS");
    obj.label144:setHorzTextAlign("center");
    obj.label144:setName("label144");

    obj.rclListaDosItens = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout45);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("listaItens");
    obj.rclListaDosItens:setTemplateForm("frmLH3_1");
    obj.rclListaDosItens:setLeft(0);
    obj.rclListaDosItens:setTop(30);
    obj.rclListaDosItens:setWidth(760);
    obj.rclListaDosItens:setHeight(351);
    obj.rclListaDosItens:setLayout("vertical");
    obj.rclListaDosItens:setMinQt(1);

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.scrollBox3);
    obj.image4:setAlign("client");
    obj.image4:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20LH%20releases/imagens/block.png");
    obj.image4:setStyle("autoFit");
    obj.image4:setName("image4");

    obj.tab4 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("Descrições");
    obj.tab4:setName("tab4");

    obj.frmLH4 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH4:setParent(obj.tab4);
    obj.frmLH4:setName("frmLH4");
    obj.frmLH4:setAlign("client");
    obj.frmLH4:setTheme("dark");

    obj.scrollBox4 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.frmLH4);
    obj.scrollBox4:setAlign("client");
    obj.scrollBox4:setName("scrollBox4");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.scrollBox4);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(0);
    obj.layout46:setWidth(960);
    obj.layout46:setHeight(70);
    obj.layout46:setName("layout46");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout46);
    obj.rectangle53:setLeft(5);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(950);
    obj.rectangle53:setHeight(70);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(15);
    obj.rectangle53:setYradius(15);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setLeft(5);
    obj.layout47:setTop(5);
    obj.layout47:setWidth(310);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout47);
    obj.label145:setLeft(0);
    obj.label145:setTop(5);
    obj.label145:setWidth(100);
    obj.label145:setHeight(20);
    obj.label145:setText("Sexo");
    obj.label145:setHorzTextAlign("trailing");
    obj.label145:setName("label145");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout47);
    obj.edit123:setLeft(110);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(200);
    obj.edit123:setHeight(25);
    obj.edit123:setField("desc_sexo");
    obj.edit123:setName("edit123");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout46);
    obj.layout48:setLeft(320);
    obj.layout48:setTop(5);
    obj.layout48:setWidth(310);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout48);
    obj.label146:setLeft(0);
    obj.label146:setTop(5);
    obj.label146:setWidth(100);
    obj.label146:setHeight(20);
    obj.label146:setText("Altura");
    obj.label146:setHorzTextAlign("trailing");
    obj.label146:setName("label146");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout48);
    obj.edit124:setLeft(110);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(200);
    obj.edit124:setHeight(25);
    obj.edit124:setField("desc_altura");
    obj.edit124:setName("edit124");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout46);
    obj.layout49:setLeft(585);
    obj.layout49:setTop(5);
    obj.layout49:setWidth(310);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout49);
    obj.label147:setLeft(0);
    obj.label147:setTop(5);
    obj.label147:setWidth(100);
    obj.label147:setHeight(20);
    obj.label147:setText("Olhos");
    obj.label147:setHorzTextAlign("trailing");
    obj.label147:setName("label147");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout49);
    obj.edit125:setLeft(110);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(200);
    obj.edit125:setHeight(25);
    obj.edit125:setField("desc_olhos");
    obj.edit125:setName("edit125");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout46);
    obj.layout50:setLeft(5);
    obj.layout50:setTop(35);
    obj.layout50:setWidth(310);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout50);
    obj.label148:setLeft(0);
    obj.label148:setTop(5);
    obj.label148:setWidth(100);
    obj.label148:setHeight(20);
    obj.label148:setText("Idade");
    obj.label148:setHorzTextAlign("trailing");
    obj.label148:setName("label148");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout50);
    obj.edit126:setLeft(110);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(200);
    obj.edit126:setHeight(25);
    obj.edit126:setField("desc_idade");
    obj.edit126:setName("edit126");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout46);
    obj.layout51:setLeft(320);
    obj.layout51:setTop(35);
    obj.layout51:setWidth(310);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout51);
    obj.label149:setLeft(0);
    obj.label149:setTop(5);
    obj.label149:setWidth(100);
    obj.label149:setHeight(20);
    obj.label149:setText("Peso");
    obj.label149:setHorzTextAlign("trailing");
    obj.label149:setName("label149");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout51);
    obj.edit127:setLeft(110);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(200);
    obj.edit127:setHeight(25);
    obj.edit127:setField("desc_peso");
    obj.edit127:setName("edit127");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout46);
    obj.layout52:setLeft(585);
    obj.layout52:setTop(35);
    obj.layout52:setWidth(310);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout52);
    obj.label150:setLeft(0);
    obj.label150:setTop(5);
    obj.label150:setWidth(100);
    obj.label150:setHeight(20);
    obj.label150:setText("Cabelo");
    obj.label150:setHorzTextAlign("trailing");
    obj.label150:setName("label150");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout52);
    obj.edit128:setLeft(110);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(200);
    obj.edit128:setHeight(25);
    obj.edit128:setField("desc_cabelo");
    obj.edit128:setName("edit128");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox4);
    obj.layout53:setLeft(0);
    obj.layout53:setTop(80);
    obj.layout53:setWidth(400);
    obj.layout53:setHeight(175);
    obj.layout53:setName("layout53");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout53);
    obj.rectangle54:setLeft(0);
    obj.rectangle54:setTop(0);
    obj.rectangle54:setWidth(400);
    obj.rectangle54:setHeight(175);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setXradius(15);
    obj.rectangle54:setYradius(15);
    obj.rectangle54:setCornerType("round");
    obj.rectangle54:setName("rectangle54");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout53);
    obj.label151:setLeft(0);
    obj.label151:setTop(0);
    obj.label151:setWidth(400);
    obj.label151:setHeight(20);
    obj.label151:setText("Aparencia");
    obj.label151:setHorzTextAlign("center");
    obj.label151:setName("label151");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout53);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(135);
    obj.textEditor2:setField("aparencia");
    obj.textEditor2:setName("textEditor2");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.scrollBox4);
    obj.layout54:setLeft(0);
    obj.layout54:setTop(260);
    obj.layout54:setWidth(400);
    obj.layout54:setHeight(175);
    obj.layout54:setName("layout54");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout54);
    obj.rectangle55:setLeft(0);
    obj.rectangle55:setTop(0);
    obj.rectangle55:setWidth(400);
    obj.rectangle55:setHeight(175);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setXradius(15);
    obj.rectangle55:setYradius(15);
    obj.rectangle55:setCornerType("round");
    obj.rectangle55:setName("rectangle55");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout54);
    obj.label152:setLeft(0);
    obj.label152:setTop(0);
    obj.label152:setWidth(400);
    obj.label152:setHeight(20);
    obj.label152:setText("Personalidade");
    obj.label152:setHorzTextAlign("center");
    obj.label152:setName("label152");

    obj.textEditor3 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout54);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(135);
    obj.textEditor3:setField("personalidade");
    obj.textEditor3:setName("textEditor3");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.scrollBox4);
    obj.layout55:setLeft(0);
    obj.layout55:setTop(440);
    obj.layout55:setWidth(400);
    obj.layout55:setHeight(175);
    obj.layout55:setName("layout55");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout55);
    obj.rectangle56:setLeft(0);
    obj.rectangle56:setTop(0);
    obj.rectangle56:setWidth(400);
    obj.rectangle56:setHeight(175);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setXradius(15);
    obj.rectangle56:setYradius(15);
    obj.rectangle56:setCornerType("round");
    obj.rectangle56:setName("rectangle56");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout55);
    obj.label153:setLeft(0);
    obj.label153:setTop(0);
    obj.label153:setWidth(400);
    obj.label153:setHeight(20);
    obj.label153:setText("Idiomas");
    obj.label153:setHorzTextAlign("center");
    obj.label153:setName("label153");

    obj.textEditor4 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout55);
    obj.textEditor4:setLeft(10);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(380);
    obj.textEditor4:setHeight(135);
    obj.textEditor4:setField("idiomas");
    obj.textEditor4:setName("textEditor4");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.scrollBox4);
    obj.layout56:setLeft(410);
    obj.layout56:setTop(80);
    obj.layout56:setWidth(600);
    obj.layout56:setHeight(535);
    obj.layout56:setName("layout56");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout56);
    obj.rectangle57:setLeft(0);
    obj.rectangle57:setTop(0);
    obj.rectangle57:setWidth(600);
    obj.rectangle57:setHeight(535);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setXradius(15);
    obj.rectangle57:setYradius(15);
    obj.rectangle57:setCornerType("round");
    obj.rectangle57:setName("rectangle57");

    obj.label154 = gui.fromHandle(_obj_newObject("label"));
    obj.label154:setParent(obj.layout56);
    obj.label154:setLeft(0);
    obj.label154:setTop(0);
    obj.label154:setWidth(600);
    obj.label154:setHeight(20);
    obj.label154:setText("Historia");
    obj.label154:setHorzTextAlign("center");
    obj.label154:setName("label154");

    obj.textEditor5 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout56);
    obj.textEditor5:setLeft(10);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(580);
    obj.textEditor5:setHeight(495);
    obj.textEditor5:setField("historia");
    obj.textEditor5:setName("textEditor5");

    obj.tab5 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl1);
    obj.tab5:setTitle("Anotações");
    obj.tab5:setName("tab5");

    obj.frmLH5 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH5:setParent(obj.tab5);
    obj.frmLH5:setName("frmLH5");
    obj.frmLH5:setAlign("client");
    obj.frmLH5:setTheme("dark");

    obj.scrollBox5 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmLH5);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.scrollBox5);
    obj.layout57:setLeft(0);
    obj.layout57:setTop(0);
    obj.layout57:setWidth(400);
    obj.layout57:setHeight(580);
    obj.layout57:setName("layout57");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout57);
    obj.rectangle58:setLeft(0);
    obj.rectangle58:setTop(0);
    obj.rectangle58:setWidth(400);
    obj.rectangle58:setHeight(580);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setXradius(15);
    obj.rectangle58:setYradius(15);
    obj.rectangle58:setCornerType("round");
    obj.rectangle58:setName("rectangle58");

    obj.label155 = gui.fromHandle(_obj_newObject("label"));
    obj.label155:setParent(obj.layout57);
    obj.label155:setLeft(0);
    obj.label155:setTop(0);
    obj.label155:setWidth(400);
    obj.label155:setHeight(20);
    obj.label155:setText("Anotações");
    obj.label155:setHorzTextAlign("center");
    obj.label155:setName("label155");

    obj.textEditor6 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout57);
    obj.textEditor6:setLeft(10);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(380);
    obj.textEditor6:setHeight(540);
    obj.textEditor6:setField("anotacoes1");
    obj.textEditor6:setName("textEditor6");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.scrollBox5);
    obj.layout58:setLeft(410);
    obj.layout58:setTop(0);
    obj.layout58:setWidth(400);
    obj.layout58:setHeight(580);
    obj.layout58:setName("layout58");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout58);
    obj.rectangle59:setLeft(0);
    obj.rectangle59:setTop(0);
    obj.rectangle59:setWidth(400);
    obj.rectangle59:setHeight(580);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setXradius(15);
    obj.rectangle59:setYradius(15);
    obj.rectangle59:setCornerType("round");
    obj.rectangle59:setName("rectangle59");

    obj.label156 = gui.fromHandle(_obj_newObject("label"));
    obj.label156:setParent(obj.layout58);
    obj.label156:setLeft(0);
    obj.label156:setTop(0);
    obj.label156:setWidth(400);
    obj.label156:setHeight(20);
    obj.label156:setText("Anotações");
    obj.label156:setHorzTextAlign("center");
    obj.label156:setName("label156");

    obj.textEditor7 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout58);
    obj.textEditor7:setLeft(10);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(380);
    obj.textEditor7:setHeight(540);
    obj.textEditor7:setField("anotacoes2");
    obj.textEditor7:setName("textEditor7");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.scrollBox5);
    obj.layout59:setLeft(820);
    obj.layout59:setTop(0);
    obj.layout59:setWidth(400);
    obj.layout59:setHeight(580);
    obj.layout59:setName("layout59");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout59);
    obj.rectangle60:setLeft(0);
    obj.rectangle60:setTop(0);
    obj.rectangle60:setWidth(400);
    obj.rectangle60:setHeight(580);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setXradius(15);
    obj.rectangle60:setYradius(15);
    obj.rectangle60:setCornerType("round");
    obj.rectangle60:setName("rectangle60");

    obj.label157 = gui.fromHandle(_obj_newObject("label"));
    obj.label157:setParent(obj.layout59);
    obj.label157:setLeft(0);
    obj.label157:setTop(0);
    obj.label157:setWidth(400);
    obj.label157:setHeight(20);
    obj.label157:setText("Anotações");
    obj.label157:setHorzTextAlign("center");
    obj.label157:setName("label157");

    obj.textEditor8 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout59);
    obj.textEditor8:setLeft(10);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(380);
    obj.textEditor8:setHeight(540);
    obj.textEditor8:setField("anotacoes3");
    obj.textEditor8:setName("textEditor8");

    obj.tab6 = gui.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl1);
    obj.tab6:setTitle("Creditos");
    obj.tab6:setName("tab6");

    obj.frmLH6 = gui.fromHandle(_obj_newObject("form"));
    obj.frmLH6:setParent(obj.tab6);
    obj.frmLH6:setName("frmLH6");
    obj.frmLH6:setAlign("client");
    obj.frmLH6:setTheme("dark");

    obj.scrollBox6 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.frmLH6);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox6);
    obj.image5:setLeft(0);
    obj.image5:setTop(0);
    obj.image5:setWidth(500);
    obj.image5:setHeight(250);
    obj.image5:setStyle("autoFit");
    obj.image5:setSRC("/Ficha LH/images/LH.jpg");
    obj.image5:setName("image5");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.scrollBox6);
    obj.image6:setLeft(550);
    obj.image6:setTop(0);
    obj.image6:setWidth(250);
    obj.image6:setHeight(250);
    obj.image6:setStyle("autoFit");
    obj.image6:setSRC("/Ficha LH/images/RPGmeister.jpg");
    obj.image6:setName("image6");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.scrollBox6);
    obj.layout60:setLeft(0);
    obj.layout60:setTop(300);
    obj.layout60:setWidth(200);
    obj.layout60:setHeight(150);
    obj.layout60:setName("layout60");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout60);
    obj.rectangle61:setLeft(0);
    obj.rectangle61:setTop(0);
    obj.rectangle61:setWidth(200);
    obj.rectangle61:setHeight(150);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setXradius(15);
    obj.rectangle61:setYradius(15);
    obj.rectangle61:setCornerType("round");
    obj.rectangle61:setName("rectangle61");

    obj.label158 = gui.fromHandle(_obj_newObject("label"));
    obj.label158:setParent(obj.layout60);
    obj.label158:setLeft(0);
    obj.label158:setTop(10);
    obj.label158:setWidth(200);
    obj.label158:setHeight(20);
    obj.label158:setText("Programador: Vinny (Ambesek)");
    obj.label158:setHorzTextAlign("center");
    obj.label158:setName("label158");

    obj.label159 = gui.fromHandle(_obj_newObject("label"));
    obj.label159:setParent(obj.layout60);
    obj.label159:setLeft(0);
    obj.label159:setTop(35);
    obj.label159:setWidth(200);
    obj.label159:setHeight(20);
    obj.label159:setText("Arte: Nefer (Nefertyne)");
    obj.label159:setHorzTextAlign("center");
    obj.label159:setName("label159");

    obj.label160 = gui.fromHandle(_obj_newObject("label"));
    obj.label160:setParent(obj.layout60);
    obj.label160:setLeft(0);
    obj.label160:setTop(60);
    obj.label160:setWidth(200);
    obj.label160:setHeight(20);
    obj.label160:setText("Consultor: Vinny (hellblackjack)");
    obj.label160:setHorzTextAlign("center");
    obj.label160:setName("label160");

    obj.label161 = gui.fromHandle(_obj_newObject("label"));
    obj.label161:setParent(obj.layout60);
    obj.label161:setLeft(0);
    obj.label161:setTop(95);
    obj.label161:setWidth(200);
    obj.label161:setHeight(20);
    obj.label161:setText("Ficha feita para a mesa Elder Tale");
    obj.label161:setHorzTextAlign("center");
    obj.label161:setName("label161");

    obj.label162 = gui.fromHandle(_obj_newObject("label"));
    obj.label162:setParent(obj.layout60);
    obj.label162:setLeft(0);
    obj.label162:setTop(120);
    obj.label162:setWidth(200);
    obj.label162:setHeight(20);
    obj.label162:setText("Sistema: Log Horizon");
    obj.label162:setHorzTextAlign("center");
    obj.label162:setName("label162");

    obj.label163 = gui.fromHandle(_obj_newObject("label"));
    obj.label163:setParent(obj.scrollBox6);
    obj.label163:setLeft(205);
    obj.label163:setTop(300);
    obj.label163:setWidth(100);
    obj.label163:setHeight(20);
    obj.label163:setText("Versão Atual: ");
    obj.label163:setHorzTextAlign("center");
    obj.label163:setName("label163");

    obj.image7 = gui.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.scrollBox6);
    obj.image7:setLeft(317);
    obj.image7:setTop(300);
    obj.image7:setWidth(100);
    obj.image7:setHeight(20);
    obj.image7:setStyle("autoFit");
    obj.image7:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20LH%20releases/versao01.png");
    obj.image7:setName("image7");

    obj.label164 = gui.fromHandle(_obj_newObject("label"));
    obj.label164:setParent(obj.scrollBox6);
    obj.label164:setLeft(205);
    obj.label164:setTop(325);
    obj.label164:setWidth(100);
    obj.label164:setHeight(20);
    obj.label164:setText("Ultima Versão: ");
    obj.label164:setHorzTextAlign("center");
    obj.label164:setName("label164");

    obj.image8 = gui.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.scrollBox6);
    obj.image8:setLeft(317);
    obj.image8:setTop(325);
    obj.image8:setWidth(100);
    obj.image8:setHeight(20);
    obj.image8:setStyle("autoFit");
    obj.image8:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20LH%20releases/release.png");
    obj.image8:setName("image8");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.scrollBox6);
    obj.button3:setLeft(205);
    obj.button3:setTop(350);
    obj.button3:setWidth(100);
    obj.button3:setText("Change Log");
    obj.button3:setName("button3");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox6);
    obj.button4:setLeft(317);
    obj.button4:setTop(350);
    obj.button4:setWidth(100);
    obj.button4:setText("Atualizar");
    obj.button4:setName("button4");

    obj.label165 = gui.fromHandle(_obj_newObject("label"));
    obj.label165:setParent(obj.scrollBox6);
    obj.label165:setLeft(205);
    obj.label165:setTop(400);
    obj.label165:setWidth(200);
    obj.label165:setHeight(20);
    obj.label165:setText("Conheça as Mesas:");
    obj.label165:setName("label165");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox6);
    obj.button5:setLeft(205);
    obj.button5:setTop(425);
    obj.button5:setWidth(100);
    obj.button5:setText("RPGmeister");
    obj.button5:setName("button5");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox6);
    obj.button6:setLeft(317);
    obj.button6:setTop(425);
    obj.button6:setWidth(100);
    obj.button6:setText("Elder Tale");
    obj.button6:setName("button6");

    obj._e_event0 = obj.edit6:addEventListener("onChange",
        function (self)
            FOR();
        end, obj);

    obj._e_event1 = obj.edit7:addEventListener("onChange",
        function (self)
            FOR();
        end, obj);

    obj._e_event2 = obj.edit8:addEventListener("onChange",
        function (self)
            FOR();
        end, obj);

    obj._e_event3 = obj.edit9:addEventListener("onChange",
        function (self)
            FOR();
        end, obj);

    obj._e_event4 = obj.edit10:addEventListener("onChange",
        function (self)
            FOR();
        end, obj);

    obj._e_event5 = obj.edit11:addEventListener("onChange",
        function (self)
            DES();
        end, obj);

    obj._e_event6 = obj.edit12:addEventListener("onChange",
        function (self)
            DES();
        end, obj);

    obj._e_event7 = obj.edit13:addEventListener("onChange",
        function (self)
            DES();
        end, obj);

    obj._e_event8 = obj.edit14:addEventListener("onChange",
        function (self)
            DES();
        end, obj);

    obj._e_event9 = obj.edit15:addEventListener("onChange",
        function (self)
            DES();
        end, obj);

    obj._e_event10 = obj.edit16:addEventListener("onChange",
        function (self)
            POD();
        end, obj);

    obj._e_event11 = obj.edit17:addEventListener("onChange",
        function (self)
            POD();
        end, obj);

    obj._e_event12 = obj.edit18:addEventListener("onChange",
        function (self)
            POD();
        end, obj);

    obj._e_event13 = obj.edit19:addEventListener("onChange",
        function (self)
            POD();
        end, obj);

    obj._e_event14 = obj.edit20:addEventListener("onChange",
        function (self)
            POD();
        end, obj);

    obj._e_event15 = obj.edit21:addEventListener("onChange",
        function (self)
            INT();
        end, obj);

    obj._e_event16 = obj.edit22:addEventListener("onChange",
        function (self)
            INT();
        end, obj);

    obj._e_event17 = obj.edit23:addEventListener("onChange",
        function (self)
            INT();
        end, obj);

    obj._e_event18 = obj.edit24:addEventListener("onChange",
        function (self)
            INT();
        end, obj);

    obj._e_event19 = obj.edit25:addEventListener("onChange",
        function (self)
            INT();
        end, obj);

    obj._e_event20 = obj.edit34:addEventListener("onChange",
        function (self)
            updateCapacidade();
        end, obj);

    obj._e_event21 = obj.edit35:addEventListener("onChange",
        function (self)
            updateCapacidade();
        end, obj);

    obj._e_event22 = obj.edit36:addEventListener("onChange",
        function (self)
            updateCapacidade();
        end, obj);

    obj._e_event23 = obj.edit37:addEventListener("onChange",
        function (self)
            updateCapacidade();
        end, obj);

    obj._e_event24 = obj.edit38:addEventListener("onChange",
        function (self)
            updateCapacidade();
        end, obj);

    obj._e_event25 = obj.edit39:addEventListener("onChange",
        function (self)
            updateCapacidade();
        end, obj);

    obj._e_event26 = obj.edit40:addEventListener("onChange",
        function (self)
            updateCapacidade();
        end, obj);

    obj._e_event27 = obj.edit41:addEventListener("onChange",
        function (self)
            updateCapacidade();
        end, obj);

    obj._e_event28 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            atletismoSum();
        end, obj);

    obj._e_event29 = obj.edit42:addEventListener("onChange",
        function (self)
            atletismoSum();
        end, obj);

    obj._e_event30 = obj.edit43:addEventListener("onChange",
        function (self)
            atletismoSum();
        end, obj);

    obj._e_event31 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            toleranciaSum();
        end, obj);

    obj._e_event32 = obj.edit44:addEventListener("onChange",
        function (self)
            toleranciaSum();
        end, obj);

    obj._e_event33 = obj.edit45:addEventListener("onChange",
        function (self)
            toleranciaSum();
        end, obj);

    obj._e_event34 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            desativarSum();
        end, obj);

    obj._e_event35 = obj.edit46:addEventListener("onChange",
        function (self)
            desativarSum();
        end, obj);

    obj._e_event36 = obj.edit47:addEventListener("onChange",
        function (self)
            desativarSum();
        end, obj);

    obj._e_event37 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            operarSum();
        end, obj);

    obj._e_event38 = obj.edit48:addEventListener("onChange",
        function (self)
            operarSum();
        end, obj);

    obj._e_event39 = obj.edit49:addEventListener("onChange",
        function (self)
            operarSum();
        end, obj);

    obj._e_event40 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            percepcaoSum();
        end, obj);

    obj._e_event41 = obj.edit50:addEventListener("onChange",
        function (self)
            percepcaoSum();
        end, obj);

    obj._e_event42 = obj.edit51:addEventListener("onChange",
        function (self)
            percepcaoSum();
        end, obj);

    obj._e_event43 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            negociacaoSum();
        end, obj);

    obj._e_event44 = obj.edit52:addEventListener("onChange",
        function (self)
            negociacaoSum();
        end, obj);

    obj._e_event45 = obj.edit53:addEventListener("onChange",
        function (self)
            negociacaoSum();
        end, obj);

    obj._e_event46 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            conhecimentoSum();
        end, obj);

    obj._e_event47 = obj.edit54:addEventListener("onChange",
        function (self)
            conhecimentoSum();
        end, obj);

    obj._e_event48 = obj.edit55:addEventListener("onChange",
        function (self)
            conhecimentoSum();
        end, obj);

    obj._e_event49 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            analisarSum();
        end, obj);

    obj._e_event50 = obj.edit56:addEventListener("onChange",
        function (self)
            analisarSum();
        end, obj);

    obj._e_event51 = obj.edit57:addEventListener("onChange",
        function (self)
            analisarSum();
        end, obj);

    obj._e_event52 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            precisaoSum();
        end, obj);

    obj._e_event53 = obj.edit58:addEventListener("onChange",
        function (self)
            precisaoSum();
        end, obj);

    obj._e_event54 = obj.edit59:addEventListener("onChange",
        function (self)
            precisaoSum();
        end, obj);

    obj._e_event55 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            evasaoSum();
        end, obj);

    obj._e_event56 = obj.edit60:addEventListener("onChange",
        function (self)
            evasaoSum();
        end, obj);

    obj._e_event57 = obj.edit61:addEventListener("onChange",
        function (self)
            evasaoSum();
        end, obj);

    obj._e_event58 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            resistenciaSum();
        end, obj);

    obj._e_event59 = obj.edit62:addEventListener("onChange",
        function (self)
            resistenciaSum();
        end, obj);

    obj._e_event60 = obj.edit63:addEventListener("onChange",
        function (self)
            resistenciaSum();
        end, obj);

    obj._e_event61 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDasHabilidades:append();
        end, obj);

    obj._e_event62 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclListaDosItens:append();
        end, obj);

    obj._e_event63 = obj.button3:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://dl.dropboxusercontent.com/u/31086811/plugins/Ficha%20LH%20releases/Change%20Log.txt')
        end, obj);

    obj._e_event64 = obj.button4:addEventListener("onClick",
        function (self)
            gui.openInBrowser('https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20LH%20releases/Ficha%20LH.rpk')
        end, obj);

    obj._e_event65 = obj.button5:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event66 = obj.button6:addEventListener("onClick",
        function (self)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=122396');
        end, obj);

    function obj:_releaseEvents()
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
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.frmLH2 ~= nil then self.frmLH2:destroy(); self.frmLH2 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label158 ~= nil then self.label158:destroy(); self.label158 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label164 ~= nil then self.label164:destroy(); self.label164 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
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
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.label159 ~= nil then self.label159:destroy(); self.label159 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.frmLH5 ~= nil then self.frmLH5:destroy(); self.frmLH5 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label160 ~= nil then self.label160:destroy(); self.label160 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.frmLH6 ~= nil then self.frmLH6:destroy(); self.frmLH6 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label154 ~= nil then self.label154:destroy(); self.label154 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.frmLH3 ~= nil then self.frmLH3:destroy(); self.frmLH3 = nil; end;
        if self.label155 ~= nil then self.label155:destroy(); self.label155 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.frmLH4 ~= nil then self.frmLH4:destroy(); self.frmLH4 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label165 ~= nil then self.label165:destroy(); self.label165 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
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
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.rclListaDasHabilidades ~= nil then self.rclListaDasHabilidades:destroy(); self.rclListaDasHabilidades = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label157 ~= nil then self.label157:destroy(); self.label157 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.label156 ~= nil then self.label156:destroy(); self.label156 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.frmLH1 ~= nil then self.frmLH1:destroy(); self.frmLH1 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaLH = {
    newEditor = newfrmFichaLH, 
    new = newfrmFichaLH, 
    name = "frmFichaLH", 
    dataType = "Ambesek.Nefertyne.FichaLH", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha LH", 
    description=""};

frmFichaLH = _frmFichaLH;
rrpg.registrarForm(_frmFichaLH);
rrpg.registrarDataType(_frmFichaLH);

return _frmFichaLH;
