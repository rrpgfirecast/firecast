require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmLH1()
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
    obj:setName("frmLH1");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
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

        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
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
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_frmLH1);

return _frmLH1;
