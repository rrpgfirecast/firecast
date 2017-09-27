require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmPKMN3()
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
    obj:setName("frmPKMN3");
    obj:setAlign("client");
    obj:setTheme("dark");


		local function updateND()
			if sheet ~= nil then
				local pontos =  (tonumber(self.boxDetalhesDoTime.node.total_pv) or 0) + 
								(tonumber(self.boxDetalhesDoTime.node.total_ataque) or 0) + 
								(tonumber(self.boxDetalhesDoTime.node.total_defesa) or 0) + 
								(tonumber(self.boxDetalhesDoTime.node.total_ataque_especial) or 0) + 
								(tonumber(self.boxDetalhesDoTime.node.total_defesa_especial) or 0) + 
								(tonumber(self.boxDetalhesDoTime.node.total_agilidade) or 0);
				pontos = pontos * 8 + (tonumber(self.boxDetalhesDoTime.node.habilidade_custo) or 0);
				local ajuste = math.floor((pontos-181)/120)-2;
				local nd = (tonumber(self.boxDetalhesDoTime.node.pokemon_nivel) or 0) + ajuste;
				if nd < 1 then
					nd = "1/" .. math.floor(2 ^ math.abs(nd-1));
				end;

				self.boxDetalhesDoTime.node.nd = nd;
			end;
		end;
	



		local function updatePV()
			local dv = (tonumber(self.boxDetalhesDoTime.node.estagio) or 0)
			local nv = (tonumber(self.boxDetalhesDoTime.node.pokemon_nivel) or 0)
			local mod = (tonumber(self.boxDetalhesDoTime.node.mod_pv) or 0)

			local min = dv + mod;
			min = math.max(min, 1);

			local pv = min * nv;
			self.boxDetalhesDoTime.node.pv = pv;
		end;
	



		local function updateCA_AC()
			local at = (tonumber(self.boxDetalhesDoTime.node.mod_ataque) or 0);
			local df = (tonumber(self.boxDetalhesDoTime.node.mod_defesa) or 0);
			local sa = (tonumber(self.boxDetalhesDoTime.node.mod_ataque_especial) or 0);
			local sd = (tonumber(self.boxDetalhesDoTime.node.mod_defesa_especial) or 0);
			local nv = (tonumber(self.boxDetalhesDoTime.node.pokemon_nivel) or 0);
			local tm = (tonumber(self.boxDetalhesDoTime.node.tamanho) or 0) * -1;
			local cab = (tonumber(self.boxDetalhesDoTime.node.cab) or 0);
			local acb = (tonumber(self.boxDetalhesDoTime.node.acb) or 0);

			acf = at + tm + acb;
			ace = sa + tm + acb;
			acs = math.max(ace, acf);

			caf = 5 + nv + df + tm + cab;
			cae = 5 + nv + sd + tm + cab;
			cas = math.max(cae, caf);

			self.boxDetalhesDoTime.node.acf = acf;
			self.boxDetalhesDoTime.node.ace = ace;
			self.boxDetalhesDoTime.node.acs = acs;
			self.boxDetalhesDoTime.node.caf = caf;
			self.boxDetalhesDoTime.node.cae = cae;
			self.boxDetalhesDoTime.node.cas = cas;
		end;
	



		local function updateDesl()
			if sheet ~= nil then
				local mod = (tonumber(self.boxDetalhesDoTime.node.mod_agilidade) or 0);
				mod = 6 + mod;

				local terrestre = math.floor((tonumber(self.boxDetalhesDoTime.node.desl_mult_terrestre) or 0) * mod);
				local aquatico = math.floor((tonumber(self.boxDetalhesDoTime.node.desl_mult_aquatico) or 0) * mod);
				local aereo = math.floor((tonumber(self.boxDetalhesDoTime.node.desl_mult_aereo) or 0) * mod);
				local escavar = math.floor((tonumber(self.boxDetalhesDoTime.node.desl_mult_escavar) or 0) * mod);
				local escalar = math.floor((tonumber(self.boxDetalhesDoTime.node.desl_mult_escalar) or 0) * mod);

				self.boxDetalhesDoTime.node.desl_terrestre = "" .. (terrestre*1.5) .. "m (" .. terrestre .. "q)";
				self.boxDetalhesDoTime.node.desl_aquatico = "" .. (aquatico*1.5) .. "m (" .. aquatico .. "q)";
				self.boxDetalhesDoTime.node.desl_aereo = "" .. (aereo*1.5) .. "m (" .. aereo .. "q)";
				self.boxDetalhesDoTime.node.desl_escavar =  "" .. (escavar*1.5) .. "m (" .. escavar .. "q)";
				self.boxDetalhesDoTime.node.desl_escalar = "" .. (escalar*1.5) .. "m (" .. escalar .. "q)";
			end;
		end;
	


    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(205);
    obj.layout1:setHeight(410);
    obj.layout1:setName("layout1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(100);
    obj.button1:setHeight(100);
    obj.button1:setName("button1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.button1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(100);
    obj.image1:setHeight(100);
    obj.image1:setStyle("proportional");
    obj.image1:setField("time_icon_1");
    obj.image1:setSRC("http://www.serebii.net/xy/pokemon/149.png");
    obj.image1:setName("image1");

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.button1);
    obj.image2:setLeft(1);
    obj.image2:setTop(1);
    obj.image2:setWidth(24);
    obj.image2:setHeight(24);
    obj.image2:setStyle("proportional");
    obj.image2:setField("time_ball_1");
    obj.image2:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image2:setName("image2");

    obj.image3 = gui.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.button1);
    obj.image3:setLeft(75);
    obj.image3:setTop(1);
    obj.image3:setWidth(24);
    obj.image3:setHeight(24);
    obj.image3:setStyle("proportional");
    obj.image3:setField("time_equip_1");
    obj.image3:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image3:setName("image3");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.button1);
    obj.label1:setLeft(1);
    obj.label1:setTop(75);
    obj.label1:setWidth(25);
    obj.label1:setHeight(25);
    obj.label1:setField("time_status_1");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(11);
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.button1);
    obj.label2:setLeft(75);
    obj.label2:setTop(75);
    obj.label2:setWidth(25);
    obj.label2:setHeight(25);
    obj.label2:setField("time_level_1");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setLeft(100);
    obj.button2:setTop(50);
    obj.button2:setWidth(100);
    obj.button2:setHeight(100);
    obj.button2:setName("button2");

    obj.image4 = gui.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.button2);
    obj.image4:setLeft(0);
    obj.image4:setTop(0);
    obj.image4:setWidth(100);
    obj.image4:setHeight(100);
    obj.image4:setStyle("proportional");
    obj.image4:setField("time_icon_2");
    obj.image4:setSRC("http://www.serebii.net/xy/pokemon/123.png");
    obj.image4:setName("image4");

    obj.image5 = gui.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.button2);
    obj.image5:setLeft(1);
    obj.image5:setTop(1);
    obj.image5:setWidth(24);
    obj.image5:setHeight(24);
    obj.image5:setStyle("proportional");
    obj.image5:setField("time_ball_2");
    obj.image5:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image5:setName("image5");

    obj.image6 = gui.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.button2);
    obj.image6:setLeft(75);
    obj.image6:setTop(1);
    obj.image6:setWidth(24);
    obj.image6:setHeight(24);
    obj.image6:setStyle("proportional");
    obj.image6:setField("time_equip_2");
    obj.image6:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image6:setName("image6");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.button2);
    obj.label3:setLeft(1);
    obj.label3:setTop(75);
    obj.label3:setWidth(25);
    obj.label3:setHeight(25);
    obj.label3:setField("time_status_2");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontSize(11);
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.button2);
    obj.label4:setLeft(75);
    obj.label4:setTop(75);
    obj.label4:setWidth(25);
    obj.label4:setHeight(25);
    obj.label4:setField("time_level_2");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout1);
    obj.button3:setLeft(0);
    obj.button3:setTop(100);
    obj.button3:setWidth(100);
    obj.button3:setHeight(100);
    obj.button3:setName("button3");

    obj.image7 = gui.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.button3);
    obj.image7:setLeft(0);
    obj.image7:setTop(0);
    obj.image7:setWidth(100);
    obj.image7:setHeight(100);
    obj.image7:setStyle("proportional");
    obj.image7:setField("time_icon_3");
    obj.image7:setSRC("http://www.serebii.net/xy/pokemon/141.png");
    obj.image7:setName("image7");

    obj.image8 = gui.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.button3);
    obj.image8:setLeft(1);
    obj.image8:setTop(1);
    obj.image8:setWidth(24);
    obj.image8:setHeight(24);
    obj.image8:setStyle("proportional");
    obj.image8:setField("time_ball_3");
    obj.image8:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image8:setName("image8");

    obj.image9 = gui.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.button3);
    obj.image9:setLeft(75);
    obj.image9:setTop(1);
    obj.image9:setWidth(24);
    obj.image9:setHeight(24);
    obj.image9:setStyle("proportional");
    obj.image9:setField("time_equip_3");
    obj.image9:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image9:setName("image9");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.button3);
    obj.label5:setLeft(1);
    obj.label5:setTop(75);
    obj.label5:setWidth(25);
    obj.label5:setHeight(25);
    obj.label5:setField("time_status_3");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontSize(11);
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.button3);
    obj.label6:setLeft(75);
    obj.label6:setTop(75);
    obj.label6:setWidth(25);
    obj.label6:setHeight(25);
    obj.label6:setField("time_level_3");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout1);
    obj.button4:setLeft(100);
    obj.button4:setTop(150);
    obj.button4:setWidth(100);
    obj.button4:setHeight(100);
    obj.button4:setName("button4");

    obj.image10 = gui.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.button4);
    obj.image10:setLeft(0);
    obj.image10:setTop(0);
    obj.image10:setWidth(100);
    obj.image10:setHeight(100);
    obj.image10:setStyle("proportional");
    obj.image10:setField("time_icon_4");
    obj.image10:setSRC("http://www.serebii.net/xy/pokemon/721.png");
    obj.image10:setName("image10");

    obj.image11 = gui.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.button4);
    obj.image11:setLeft(1);
    obj.image11:setTop(1);
    obj.image11:setWidth(24);
    obj.image11:setHeight(24);
    obj.image11:setStyle("proportional");
    obj.image11:setField("time_ball_4");
    obj.image11:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image11:setName("image11");

    obj.image12 = gui.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.button4);
    obj.image12:setLeft(75);
    obj.image12:setTop(1);
    obj.image12:setWidth(24);
    obj.image12:setHeight(24);
    obj.image12:setStyle("proportional");
    obj.image12:setField("time_equip_4");
    obj.image12:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image12:setName("image12");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.button4);
    obj.label7:setLeft(1);
    obj.label7:setTop(75);
    obj.label7:setWidth(25);
    obj.label7:setHeight(25);
    obj.label7:setField("time_status_4");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontSize(11);
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.button4);
    obj.label8:setLeft(75);
    obj.label8:setTop(75);
    obj.label8:setWidth(25);
    obj.label8:setHeight(25);
    obj.label8:setField("time_level_4");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout1);
    obj.button5:setLeft(0);
    obj.button5:setTop(200);
    obj.button5:setWidth(100);
    obj.button5:setHeight(100);
    obj.button5:setName("button5");

    obj.image13 = gui.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.button5);
    obj.image13:setLeft(0);
    obj.image13:setTop(0);
    obj.image13:setWidth(100);
    obj.image13:setHeight(100);
    obj.image13:setStyle("proportional");
    obj.image13:setField("time_icon_5");
    obj.image13:setSRC("http://www.serebii.net/xy/pokemon/720.png");
    obj.image13:setName("image13");

    obj.image14 = gui.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.button5);
    obj.image14:setLeft(1);
    obj.image14:setTop(1);
    obj.image14:setWidth(24);
    obj.image14:setHeight(24);
    obj.image14:setStyle("proportional");
    obj.image14:setField("time_ball_5");
    obj.image14:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image14:setName("image14");

    obj.image15 = gui.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.button5);
    obj.image15:setLeft(75);
    obj.image15:setTop(1);
    obj.image15:setWidth(24);
    obj.image15:setHeight(24);
    obj.image15:setStyle("proportional");
    obj.image15:setField("time_equip_5");
    obj.image15:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image15:setName("image15");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.button5);
    obj.label9:setLeft(1);
    obj.label9:setTop(75);
    obj.label9:setWidth(25);
    obj.label9:setHeight(25);
    obj.label9:setField("time_status_5");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setFontSize(11);
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.button5);
    obj.label10:setLeft(75);
    obj.label10:setTop(75);
    obj.label10:setWidth(25);
    obj.label10:setHeight(25);
    obj.label10:setField("time_level_5");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout1);
    obj.button6:setLeft(100);
    obj.button6:setTop(250);
    obj.button6:setWidth(100);
    obj.button6:setHeight(100);
    obj.button6:setName("button6");

    obj.image16 = gui.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.button6);
    obj.image16:setLeft(0);
    obj.image16:setTop(0);
    obj.image16:setWidth(100);
    obj.image16:setHeight(100);
    obj.image16:setStyle("proportional");
    obj.image16:setField("time_icon_6");
    obj.image16:setSRC("http://www.serebii.net/xy/pokemon/719.png");
    obj.image16:setName("image16");

    obj.image17 = gui.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.button6);
    obj.image17:setLeft(1);
    obj.image17:setTop(1);
    obj.image17:setWidth(24);
    obj.image17:setHeight(24);
    obj.image17:setStyle("proportional");
    obj.image17:setField("time_ball_6");
    obj.image17:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image17:setName("image17");

    obj.image18 = gui.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.button6);
    obj.image18:setLeft(75);
    obj.image18:setTop(1);
    obj.image18:setWidth(24);
    obj.image18:setHeight(24);
    obj.image18:setStyle("proportional");
    obj.image18:setField("time_equip_6");
    obj.image18:setSRC("http://www.serebii.net/itemdex/sprites/.png");
    obj.image18:setName("image18");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.button6);
    obj.label11:setLeft(1);
    obj.label11:setTop(75);
    obj.label11:setWidth(25);
    obj.label11:setHeight(25);
    obj.label11:setField("time_status_6");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(11);
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.button6);
    obj.label12:setLeft(75);
    obj.label12:setTop(75);
    obj.label12:setWidth(25);
    obj.label12:setHeight(25);
    obj.label12:setField("time_level_6");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.boxDetalhesDoTime = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoTime:setParent(obj.scrollBox1);
    obj.boxDetalhesDoTime:setLeft(205);
    obj.boxDetalhesDoTime:setTop(0);
    obj.boxDetalhesDoTime:setWidth(1130);
    obj.boxDetalhesDoTime:setHeight(615);
    obj.boxDetalhesDoTime:setVisible(false);
    obj.boxDetalhesDoTime:setName("boxDetalhesDoTime");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.boxDetalhesDoTime);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.boxDetalhesDoTime);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(30);
    obj.edit1:setHeight(25);
    obj.edit1:setField("icon_id");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.boxDetalhesDoTime);
    obj.edit2:setLeft(35);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(25);
    obj.edit2:setField("pokemon_nome");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.boxDetalhesDoTime);
    obj.edit3:setLeft(135);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setField("pokemon_nick");
    obj.edit3:setName("edit3");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.boxDetalhesDoTime);
    obj.comboBox1:setLeft(240);
    obj.comboBox1:setTop(5);
    obj.comboBox1:setWidth(40);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("pokemon_sexo");
    obj.comboBox1:setItems({'♂', '♀', '-'});
    obj.comboBox1:setValues({'m', 'f', 'n'});
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.boxDetalhesDoTime);
    obj.comboBox2:setLeft(280);
    obj.comboBox2:setTop(5);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("pokemon_natureza");
    obj.comboBox2:setItems({'Hardy', 'Lonely', 'Adamant', 'Naughty', 'Brave', 'Bold', 'Docile', 'Impish', 'Lax', 'Relaxed', 'Modest', 'Mild', 'Bashful', 'Rash', 'Quiet', 'Calm', 'Gentle', 'Careful', 'Quirky', 'Sassy', 'Timid', 'Hasty', 'Jolly', 'Naive', 'Serious'});
    obj.comboBox2:setValues({'11', '12', '13', '14', '15', '21', '22', '23', '24', '25', '31', '32', '33', '34', '35', '41', '42', '43', '44', '45', '51', '52', '53', '54', '55'});
    obj.comboBox2:setValue("11");
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.boxDetalhesDoTime);
    obj.comboBox3:setLeft(380);
    obj.comboBox3:setTop(5);
    obj.comboBox3:setWidth(90);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setField("pokemon_tipo1");
    obj.comboBox3:setItems({' ', 'Inseto', 'Noturno', 'Dragão', 'Eletrico', 'Fada', 'Lutador', 'Fogo', 'Voador', 'Fantasma', 'Planta', 'Terra', 'Gelo', 'Normal', 'Veneno', 'Psíquico', 'Pedra', 'Metal', 'Água'});
    obj.comboBox3:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18'});
    obj.comboBox3:setValue("0");
    obj.comboBox3:setName("comboBox3");

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.boxDetalhesDoTime);
    obj.comboBox4:setLeft(470);
    obj.comboBox4:setTop(5);
    obj.comboBox4:setWidth(90);
    obj.comboBox4:setHeight(25);
    obj.comboBox4:setField("pokemon_tipo2");
    obj.comboBox4:setItems({' ', 'Inseto', 'Noturno', 'Dragão', 'Eletrico', 'Fada', 'Lutador', 'Fogo', 'Voador', 'Fantasma', 'Planta', 'Terra', 'Gelo', 'Normal', 'Veneno', 'Psíquico', 'Pedra', 'Metal', 'Água'});
    obj.comboBox4:setValues({'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18'});
    obj.comboBox4:setValue("0");
    obj.comboBox4:setName("comboBox4");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.boxDetalhesDoTime);
    obj.comboBox5:setLeft(570);
    obj.comboBox5:setTop(5);
    obj.comboBox5:setWidth(100);
    obj.comboBox5:setHeight(25);
    obj.comboBox5:setField("pokemon_ball");
    obj.comboBox5:setItems({'pokeball', 'greatball', 'ultraball', 'diveball', 'duskball', 'healball', 'luxuryball', 'nestball', 'netball', 'premierball', 'quickball', 'repeatball', 'timerball', 'moonball', 'lureball', 'loveball', 'levelball', 'heavyball', 'fastball', 'friendball', 'safariball', 'sportball', 'parkball', 'masterball', 'dreamball', 'cherishball', 'none'});
    obj.comboBox5:setValues({'pokeball', 'greatball', 'ultraball', 'diveball', 'duskball', 'healball', 'luxuryball', 'nestball', 'netball', 'premierball', 'quickball', 'repeatball', 'timerball', 'moonball', 'lureball', 'loveball', 'levelball', 'heavyball', 'fastball', 'friendball', 'safariball', 'sportball', 'parkball', 'masterball', 'dreamball', 'cherishball', 'none'});
    obj.comboBox5:setValue("none");
    obj.comboBox5:setName("comboBox5");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.boxDetalhesDoTime);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(32);
    obj.layout2:setWidth(1130);
    obj.layout2:setHeight(185);
    obj.layout2:setName("layout2");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout2);
    obj.label13:setLeft(15);
    obj.label13:setTop(0);
    obj.label13:setWidth(30);
    obj.label13:setHeight(25);
    obj.label13:setText("XP");
    obj.label13:setName("label13");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setLeft(35);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(70);
    obj.edit4:setHeight(25);
    obj.edit4:setField("xp");
    obj.edit4:setName("edit4");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(110);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(70);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout2);
    obj.label14:setLeft(110);
    obj.label14:setTop(0);
    obj.label14:setWidth(70);
    obj.label14:setHeight(25);
    obj.label14:setField("xp_lvlup");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout2);
    obj.label15:setLeft(185);
    obj.label15:setTop(0);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setText("Nível");
    obj.label15:setName("label15");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setLeft(220);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout2);
    obj.label16:setLeft(220);
    obj.label16:setTop(0);
    obj.label16:setWidth(30);
    obj.label16:setHeight(25);
    obj.label16:setField("pokemon_nivel");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout2);
    obj.label17:setLeft(250);
    obj.label17:setTop(0);
    obj.label17:setWidth(25);
    obj.label17:setHeight(25);
    obj.label17:setText(" ND");
    obj.label17:setName("label17");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout2);
    obj.rectangle4:setLeft(275);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(30);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout2);
    obj.label18:setLeft(275);
    obj.label18:setTop(0);
    obj.label18:setWidth(30);
    obj.label18:setHeight(25);
    obj.label18:setField("nd");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout2);
    obj.label19:setLeft(310);
    obj.label19:setTop(0);
    obj.label19:setWidth(25);
    obj.label19:setHeight(25);
    obj.label19:setText(" OT");
    obj.label19:setName("label19");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setLeft(335);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(150);
    obj.edit5:setHeight(25);
    obj.edit5:setField("ot");
    obj.edit5:setName("edit5");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.boxDetalhesDoTime);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(55);
    obj.layout3:setWidth(1130);
    obj.layout3:setHeight(185);
    obj.layout3:setName("layout3");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout3);
    obj.checkBox1:setLeft(5);
    obj.checkBox1:setTop(0);
    obj.checkBox1:setWidth(60);
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setText("Shiny");
    obj.checkBox1:setField("shiny");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout3);
    obj.checkBox2:setLeft(65);
    obj.checkBox2:setTop(0);
    obj.checkBox2:setWidth(60);
    obj.checkBox2:setHeight(25);
    obj.checkBox2:setText("Mega");
    obj.checkBox2:setField("mega");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout3);
    obj.checkBox3:setLeft(125);
    obj.checkBox3:setTop(0);
    obj.checkBox3:setWidth(30);
    obj.checkBox3:setHeight(25);
    obj.checkBox3:setText("Y");
    obj.checkBox3:setField("y");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout3);
    obj.checkBox4:setLeft(160);
    obj.checkBox4:setTop(0);
    obj.checkBox4:setWidth(30);
    obj.checkBox4:setHeight(25);
    obj.checkBox4:setText("X");
    obj.checkBox4:setField("x");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout3);
    obj.checkBox5:setLeft(195);
    obj.checkBox5:setTop(0);
    obj.checkBox5:setWidth(80);
    obj.checkBox5:setHeight(25);
    obj.checkBox5:setText("Pokérus");
    obj.checkBox5:setField("pokerus");
    obj.checkBox5:setName("checkBox5");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.boxDetalhesDoTime);
    obj.button7:setLeft(1100);
    obj.button7:setTop(5);
    obj.button7:setWidth(25);
    obj.button7:setHeight(25);
    obj.button7:setText("+");
    obj.button7:setName("button7");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.boxDetalhesDoTime);
    obj.button8:setLeft(1100);
    obj.button8:setTop(35);
    obj.button8:setWidth(25);
    obj.button8:setHeight(25);
    obj.button8:setText("-");
    obj.button8:setName("button8");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.boxDetalhesDoTime);
    obj.button9:setLeft(1040);
    obj.button9:setTop(5);
    obj.button9:setWidth(55);
    obj.button9:setHeight(55);
    obj.button9:setText("");
    obj.button9:setName("button9");

    obj.image19 = gui.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.button9);
    obj.image19:setLeft(15);
    obj.image19:setTop(15);
    obj.image19:setWidth(25);
    obj.image19:setHeight(25);
    obj.image19:setStyle("stretch");
    obj.image19:setField("browser_icon");
    obj.image19:setSRC("http://www.serebii.net/favicon.ico");
    obj.image19:setName("image19");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.boxDetalhesDoTime);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(80);
    obj.layout4:setWidth(290);
    obj.layout4:setHeight(185);
    obj.layout4:setName("layout4");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout4);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(5);
    obj.layout5:setWidth(300);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout5);
    obj.label20:setLeft(55);
    obj.label20:setTop(0);
    obj.label20:setWidth(50);
    obj.label20:setHeight(25);
    obj.label20:setText("Total");
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout5);
    obj.label21:setLeft(90);
    obj.label21:setTop(0);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setText("Mod");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout5);
    obj.label22:setLeft(125);
    obj.label22:setTop(0);
    obj.label22:setWidth(50);
    obj.label22:setHeight(25);
    obj.label22:setText("Base");
    obj.label22:setName("label22");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout5);
    obj.button10:setLeft(155);
    obj.button10:setTop(0);
    obj.button10:setWidth(30);
    obj.button10:setHeight(25);
    obj.button10:setText("IV");
    obj.button10:setName("button10");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout5);
    obj.label23:setLeft(185);
    obj.label23:setTop(0);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setText("  EV");
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout5);
    obj.label24:setLeft(215);
    obj.label24:setTop(0);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setText("  NT");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout5);
    obj.label25:setLeft(245);
    obj.label25:setTop(0);
    obj.label25:setWidth(50);
    obj.label25:setHeight(25);
    obj.label25:setText("  BF");
    obj.label25:setName("label25");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(30);
    obj.layout6:setWidth(300);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout6);
    obj.label26:setLeft(0);
    obj.label26:setTop(0);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setText("PV");
    obj.label26:setFontSize(13);
    obj.label26:setName("label26");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setLeft(55);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(30);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout6);
    obj.label27:setLeft(55);
    obj.label27:setTop(0);
    obj.label27:setWidth(30);
    obj.label27:setHeight(25);
    obj.label27:setField("total_pv");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout6);
    obj.rectangle7:setLeft(90);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(30);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("Black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout6);
    obj.label28:setLeft(90);
    obj.label28:setTop(0);
    obj.label28:setWidth(30);
    obj.label28:setHeight(25);
    obj.label28:setField("mod_pv");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout6);
    obj.edit6:setLeft(125);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(30);
    obj.edit6:setHeight(25);
    obj.edit6:setField("base_pv");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout6);
    obj.edit7:setLeft(155);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(25);
    obj.edit7:setField("iv_pv");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout6);
    obj.edit8:setLeft(185);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(25);
    obj.edit8:setField("ev_pv");
    obj.edit8:setName("edit8");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout6);
    obj.rectangle8:setLeft(215);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(30);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("Black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout6);
    obj.label29:setLeft(215);
    obj.label29:setTop(0);
    obj.label29:setWidth(30);
    obj.label29:setHeight(25);
    obj.label29:setField("nature_pv");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout6);
    obj.edit9:setLeft(245);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(25);
    obj.edit9:setField("bf_pv");
    obj.edit9:setName("edit9");


			local function sum_mod_pv()
				if sheet~= nil then
					local at = (tonumber(self.boxDetalhesDoTime.node.base_pv) or 0);
					at = (at+1)/8;
					local aux = math.floor(at) + 0.5;
					if at < aux then
						at = math.floor(at);
					else
						at = math.floor(at) + 1;
					end;

					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_pv) or 0);
					iv = math.floor(iv/8);

					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_pv) or 0);
					ev = math.floor(ev/8);

					local nt = 0;
					local id = 0;
					if id > 0 then
						local nature = self.boxDetalhesDoTime.node.pokemon_natureza;
						nature = tonumber(nature) or 0;
						local plus = math.floor(nature / 10);
						local minus = math.floor(nature % 10);

						if plus ~= minus then
							if plus == id then
								self.boxDetalhesDoTime.node.nature_pv = "16";
								nt = 2;
							elseif minus == id then
								self.boxDetalhesDoTime.node.nature_pv = "-16";
								nt = -2;
							else
								self.boxDetalhesDoTime.node.nature_pv = "0";
							end;
						else
							self.boxDetalhesDoTime.node.nature_pv = "0";
						end;
					else
						self.boxDetalhesDoTime.node.nature_pv = "0";
					end;

					local efeitos = 0;
					local atributo = "pv";
					if atributo == "ataque" and self.boxDetalhesDoTime.node.efeitos == "BRN" then
						efeitos = -4;
					elseif atributo == "agilidade" and self.boxDetalhesDoTime.node.efeitos == "PAR" then
						efeitos = -2;
					end;

					local total = at + iv + ev + nt;
					local mod =  math.floor((total/2) - 5) + (tonumber(self.boxDetalhesDoTime.node.bf_pv) or 0)*2 + efeitos;
					mod = math.max(-5, mod);

					self.boxDetalhesDoTime.node.total_pv = total;
					self.boxDetalhesDoTime.node.mod_pv = mod;
					updateND();
					updatePV();
					updateCA_AC();
					updateDesl();
				end;
			end;
		


    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout4);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(55);
    obj.layout7:setWidth(300);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout7);
    obj.label30:setLeft(0);
    obj.label30:setTop(0);
    obj.label30:setWidth(50);
    obj.label30:setHeight(25);
    obj.label30:setText("Ataque");
    obj.label30:setFontSize(13);
    obj.label30:setName("label30");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout7);
    obj.rectangle9:setLeft(55);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(30);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("Black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout7);
    obj.label31:setLeft(55);
    obj.label31:setTop(0);
    obj.label31:setWidth(30);
    obj.label31:setHeight(25);
    obj.label31:setField("total_ataque");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout7);
    obj.rectangle10:setLeft(90);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(30);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("Black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout7);
    obj.label32:setLeft(90);
    obj.label32:setTop(0);
    obj.label32:setWidth(30);
    obj.label32:setHeight(25);
    obj.label32:setField("mod_ataque");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout7);
    obj.edit10:setLeft(125);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(30);
    obj.edit10:setHeight(25);
    obj.edit10:setField("base_ataque");
    obj.edit10:setName("edit10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout7);
    obj.edit11:setLeft(155);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(30);
    obj.edit11:setHeight(25);
    obj.edit11:setField("iv_ataque");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout7);
    obj.edit12:setLeft(185);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setField("ev_ataque");
    obj.edit12:setName("edit12");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout7);
    obj.rectangle11:setLeft(215);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(30);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("Black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout7);
    obj.label33:setLeft(215);
    obj.label33:setTop(0);
    obj.label33:setWidth(30);
    obj.label33:setHeight(25);
    obj.label33:setField("nature_ataque");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout7);
    obj.edit13:setLeft(245);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setField("bf_ataque");
    obj.edit13:setName("edit13");


			local function sum_mod_ataque()
				if sheet~= nil then
					local at = (tonumber(self.boxDetalhesDoTime.node.base_ataque) or 0);
					at = (at+1)/8;
					local aux = math.floor(at) + 0.5;
					if at < aux then
						at = math.floor(at);
					else
						at = math.floor(at) + 1;
					end;

					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_ataque) or 0);
					iv = math.floor(iv/8);

					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_ataque) or 0);
					ev = math.floor(ev/8);

					local nt = 0;
					local id = 1;
					if id > 0 then
						local nature = self.boxDetalhesDoTime.node.pokemon_natureza;
						nature = tonumber(nature) or 0;
						local plus = math.floor(nature / 10);
						local minus = math.floor(nature % 10);

						if plus ~= minus then
							if plus == id then
								self.boxDetalhesDoTime.node.nature_ataque = "16";
								nt = 2;
							elseif minus == id then
								self.boxDetalhesDoTime.node.nature_ataque = "-16";
								nt = -2;
							else
								self.boxDetalhesDoTime.node.nature_ataque = "0";
							end;
						else
							self.boxDetalhesDoTime.node.nature_ataque = "0";
						end;
					else
						self.boxDetalhesDoTime.node.nature_ataque = "0";
					end;

					local efeitos = 0;
					local atributo = "ataque";
					if atributo == "ataque" and self.boxDetalhesDoTime.node.efeitos == "BRN" then
						efeitos = -4;
					elseif atributo == "agilidade" and self.boxDetalhesDoTime.node.efeitos == "PAR" then
						efeitos = -2;
					end;

					local total = at + iv + ev + nt;
					local mod =  math.floor((total/2) - 5) + (tonumber(self.boxDetalhesDoTime.node.bf_ataque) or 0)*2 + efeitos;
					mod = math.max(-5, mod);

					self.boxDetalhesDoTime.node.total_ataque = total;
					self.boxDetalhesDoTime.node.mod_ataque = mod;
					updateND();
					updatePV();
					updateCA_AC();
					updateDesl();
				end;
			end;
		


    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout4);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(80);
    obj.layout8:setWidth(300);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout8);
    obj.label34:setLeft(0);
    obj.label34:setTop(0);
    obj.label34:setWidth(50);
    obj.label34:setHeight(25);
    obj.label34:setText("Defesa");
    obj.label34:setFontSize(13);
    obj.label34:setName("label34");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout8);
    obj.rectangle12:setLeft(55);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(30);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout8);
    obj.label35:setLeft(55);
    obj.label35:setTop(0);
    obj.label35:setWidth(30);
    obj.label35:setHeight(25);
    obj.label35:setField("total_defesa");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout8);
    obj.rectangle13:setLeft(90);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(30);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("Black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout8);
    obj.label36:setLeft(90);
    obj.label36:setTop(0);
    obj.label36:setWidth(30);
    obj.label36:setHeight(25);
    obj.label36:setField("mod_defesa");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout8);
    obj.edit14:setLeft(125);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setField("base_defesa");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout8);
    obj.edit15:setLeft(155);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(30);
    obj.edit15:setHeight(25);
    obj.edit15:setField("iv_defesa");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout8);
    obj.edit16:setLeft(185);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(30);
    obj.edit16:setHeight(25);
    obj.edit16:setField("ev_defesa");
    obj.edit16:setName("edit16");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout8);
    obj.rectangle14:setLeft(215);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(30);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("Black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout8);
    obj.label37:setLeft(215);
    obj.label37:setTop(0);
    obj.label37:setWidth(30);
    obj.label37:setHeight(25);
    obj.label37:setField("nature_defesa");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout8);
    obj.edit17:setLeft(245);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setField("bf_defesa");
    obj.edit17:setName("edit17");


			local function sum_mod_defesa()
				if sheet~= nil then
					local at = (tonumber(self.boxDetalhesDoTime.node.base_defesa) or 0);
					at = (at+1)/8;
					local aux = math.floor(at) + 0.5;
					if at < aux then
						at = math.floor(at);
					else
						at = math.floor(at) + 1;
					end;

					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_defesa) or 0);
					iv = math.floor(iv/8);

					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_defesa) or 0);
					ev = math.floor(ev/8);

					local nt = 0;
					local id = 2;
					if id > 0 then
						local nature = self.boxDetalhesDoTime.node.pokemon_natureza;
						nature = tonumber(nature) or 0;
						local plus = math.floor(nature / 10);
						local minus = math.floor(nature % 10);

						if plus ~= minus then
							if plus == id then
								self.boxDetalhesDoTime.node.nature_defesa = "16";
								nt = 2;
							elseif minus == id then
								self.boxDetalhesDoTime.node.nature_defesa = "-16";
								nt = -2;
							else
								self.boxDetalhesDoTime.node.nature_defesa = "0";
							end;
						else
							self.boxDetalhesDoTime.node.nature_defesa = "0";
						end;
					else
						self.boxDetalhesDoTime.node.nature_defesa = "0";
					end;

					local efeitos = 0;
					local atributo = "defesa";
					if atributo == "ataque" and self.boxDetalhesDoTime.node.efeitos == "BRN" then
						efeitos = -4;
					elseif atributo == "agilidade" and self.boxDetalhesDoTime.node.efeitos == "PAR" then
						efeitos = -2;
					end;

					local total = at + iv + ev + nt;
					local mod =  math.floor((total/2) - 5) + (tonumber(self.boxDetalhesDoTime.node.bf_defesa) or 0)*2 + efeitos;
					mod = math.max(-5, mod);

					self.boxDetalhesDoTime.node.total_defesa = total;
					self.boxDetalhesDoTime.node.mod_defesa = mod;
					updateND();
					updatePV();
					updateCA_AC();
					updateDesl();
				end;
			end;
		


    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout4);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(105);
    obj.layout9:setWidth(300);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout9);
    obj.label38:setLeft(0);
    obj.label38:setTop(0);
    obj.label38:setWidth(50);
    obj.label38:setHeight(25);
    obj.label38:setText("At. Esp.");
    obj.label38:setFontSize(13);
    obj.label38:setName("label38");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout9);
    obj.rectangle15:setLeft(55);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(30);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("Black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout9);
    obj.label39:setLeft(55);
    obj.label39:setTop(0);
    obj.label39:setWidth(30);
    obj.label39:setHeight(25);
    obj.label39:setField("total_ataque_especial");
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout9);
    obj.rectangle16:setLeft(90);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(30);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("Black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout9);
    obj.label40:setLeft(90);
    obj.label40:setTop(0);
    obj.label40:setWidth(30);
    obj.label40:setHeight(25);
    obj.label40:setField("mod_ataque_especial");
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout9);
    obj.edit18:setLeft(125);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setField("base_ataque_especial");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout9);
    obj.edit19:setLeft(155);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setField("iv_ataque_especial");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout9);
    obj.edit20:setLeft(185);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(30);
    obj.edit20:setHeight(25);
    obj.edit20:setField("ev_ataque_especial");
    obj.edit20:setName("edit20");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout9);
    obj.rectangle17:setLeft(215);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(30);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("Black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout9);
    obj.label41:setLeft(215);
    obj.label41:setTop(0);
    obj.label41:setWidth(30);
    obj.label41:setHeight(25);
    obj.label41:setField("nature_ataque_especial");
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout9);
    obj.edit21:setLeft(245);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(30);
    obj.edit21:setHeight(25);
    obj.edit21:setField("bf_ataque_especial");
    obj.edit21:setName("edit21");


			local function sum_mod_ataque_especial()
				if sheet~= nil then
					local at = (tonumber(self.boxDetalhesDoTime.node.base_ataque_especial) or 0);
					at = (at+1)/8;
					local aux = math.floor(at) + 0.5;
					if at < aux then
						at = math.floor(at);
					else
						at = math.floor(at) + 1;
					end;

					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_ataque_especial) or 0);
					iv = math.floor(iv/8);

					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_ataque_especial) or 0);
					ev = math.floor(ev/8);

					local nt = 0;
					local id = 3;
					if id > 0 then
						local nature = self.boxDetalhesDoTime.node.pokemon_natureza;
						nature = tonumber(nature) or 0;
						local plus = math.floor(nature / 10);
						local minus = math.floor(nature % 10);

						if plus ~= minus then
							if plus == id then
								self.boxDetalhesDoTime.node.nature_ataque_especial = "16";
								nt = 2;
							elseif minus == id then
								self.boxDetalhesDoTime.node.nature_ataque_especial = "-16";
								nt = -2;
							else
								self.boxDetalhesDoTime.node.nature_ataque_especial = "0";
							end;
						else
							self.boxDetalhesDoTime.node.nature_ataque_especial = "0";
						end;
					else
						self.boxDetalhesDoTime.node.nature_ataque_especial = "0";
					end;

					local efeitos = 0;
					local atributo = "ataque_especial";
					if atributo == "ataque" and self.boxDetalhesDoTime.node.efeitos == "BRN" then
						efeitos = -4;
					elseif atributo == "agilidade" and self.boxDetalhesDoTime.node.efeitos == "PAR" then
						efeitos = -2;
					end;

					local total = at + iv + ev + nt;
					local mod =  math.floor((total/2) - 5) + (tonumber(self.boxDetalhesDoTime.node.bf_ataque_especial) or 0)*2 + efeitos;
					mod = math.max(-5, mod);

					self.boxDetalhesDoTime.node.total_ataque_especial = total;
					self.boxDetalhesDoTime.node.mod_ataque_especial = mod;
					updateND();
					updatePV();
					updateCA_AC();
					updateDesl();
				end;
			end;
		


    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout4);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(130);
    obj.layout10:setWidth(300);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout10);
    obj.label42:setLeft(0);
    obj.label42:setTop(0);
    obj.label42:setWidth(50);
    obj.label42:setHeight(25);
    obj.label42:setText("Df. Esp.");
    obj.label42:setFontSize(13);
    obj.label42:setName("label42");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout10);
    obj.rectangle18:setLeft(55);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(30);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("Black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout10);
    obj.label43:setLeft(55);
    obj.label43:setTop(0);
    obj.label43:setWidth(30);
    obj.label43:setHeight(25);
    obj.label43:setField("total_defesa_especial");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout10);
    obj.rectangle19:setLeft(90);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(30);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("Black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout10);
    obj.label44:setLeft(90);
    obj.label44:setTop(0);
    obj.label44:setWidth(30);
    obj.label44:setHeight(25);
    obj.label44:setField("mod_defesa_especial");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout10);
    obj.edit22:setLeft(125);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setField("base_defesa_especial");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout10);
    obj.edit23:setLeft(155);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setField("iv_defesa_especial");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout10);
    obj.edit24:setLeft(185);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setField("ev_defesa_especial");
    obj.edit24:setName("edit24");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout10);
    obj.rectangle20:setLeft(215);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(30);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("Black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout10);
    obj.label45:setLeft(215);
    obj.label45:setTop(0);
    obj.label45:setWidth(30);
    obj.label45:setHeight(25);
    obj.label45:setField("nature_defesa_especial");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout10);
    obj.edit25:setLeft(245);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(30);
    obj.edit25:setHeight(25);
    obj.edit25:setField("bf_defesa_especial");
    obj.edit25:setName("edit25");


			local function sum_mod_defesa_especial()
				if sheet~= nil then
					local at = (tonumber(self.boxDetalhesDoTime.node.base_defesa_especial) or 0);
					at = (at+1)/8;
					local aux = math.floor(at) + 0.5;
					if at < aux then
						at = math.floor(at);
					else
						at = math.floor(at) + 1;
					end;

					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_defesa_especial) or 0);
					iv = math.floor(iv/8);

					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_defesa_especial) or 0);
					ev = math.floor(ev/8);

					local nt = 0;
					local id = 4;
					if id > 0 then
						local nature = self.boxDetalhesDoTime.node.pokemon_natureza;
						nature = tonumber(nature) or 0;
						local plus = math.floor(nature / 10);
						local minus = math.floor(nature % 10);

						if plus ~= minus then
							if plus == id then
								self.boxDetalhesDoTime.node.nature_defesa_especial = "16";
								nt = 2;
							elseif minus == id then
								self.boxDetalhesDoTime.node.nature_defesa_especial = "-16";
								nt = -2;
							else
								self.boxDetalhesDoTime.node.nature_defesa_especial = "0";
							end;
						else
							self.boxDetalhesDoTime.node.nature_defesa_especial = "0";
						end;
					else
						self.boxDetalhesDoTime.node.nature_defesa_especial = "0";
					end;

					local efeitos = 0;
					local atributo = "defesa_especial";
					if atributo == "ataque" and self.boxDetalhesDoTime.node.efeitos == "BRN" then
						efeitos = -4;
					elseif atributo == "agilidade" and self.boxDetalhesDoTime.node.efeitos == "PAR" then
						efeitos = -2;
					end;

					local total = at + iv + ev + nt;
					local mod =  math.floor((total/2) - 5) + (tonumber(self.boxDetalhesDoTime.node.bf_defesa_especial) or 0)*2 + efeitos;
					mod = math.max(-5, mod);

					self.boxDetalhesDoTime.node.total_defesa_especial = total;
					self.boxDetalhesDoTime.node.mod_defesa_especial = mod;
					updateND();
					updatePV();
					updateCA_AC();
					updateDesl();
				end;
			end;
		


    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout4);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(155);
    obj.layout11:setWidth(300);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout11);
    obj.label46:setLeft(0);
    obj.label46:setTop(0);
    obj.label46:setWidth(50);
    obj.label46:setHeight(25);
    obj.label46:setText("Agilidade");
    obj.label46:setFontSize(11);
    obj.label46:setName("label46");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout11);
    obj.rectangle21:setLeft(55);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(30);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("Black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout11);
    obj.label47:setLeft(55);
    obj.label47:setTop(0);
    obj.label47:setWidth(30);
    obj.label47:setHeight(25);
    obj.label47:setField("total_agilidade");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout11);
    obj.rectangle22:setLeft(90);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(30);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("Black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout11);
    obj.label48:setLeft(90);
    obj.label48:setTop(0);
    obj.label48:setWidth(30);
    obj.label48:setHeight(25);
    obj.label48:setField("mod_agilidade");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout11);
    obj.edit26:setLeft(125);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(30);
    obj.edit26:setHeight(25);
    obj.edit26:setField("base_agilidade");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout11);
    obj.edit27:setLeft(155);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setField("iv_agilidade");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout11);
    obj.edit28:setLeft(185);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setField("ev_agilidade");
    obj.edit28:setName("edit28");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout11);
    obj.rectangle23:setLeft(215);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(30);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("Black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout11);
    obj.label49:setLeft(215);
    obj.label49:setTop(0);
    obj.label49:setWidth(30);
    obj.label49:setHeight(25);
    obj.label49:setField("nature_agilidade");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout11);
    obj.edit29:setLeft(245);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setField("bf_agilidade");
    obj.edit29:setName("edit29");


			local function sum_mod_agilidade()
				if sheet~= nil then
					local at = (tonumber(self.boxDetalhesDoTime.node.base_agilidade) or 0);
					at = (at+1)/8;
					local aux = math.floor(at) + 0.5;
					if at < aux then
						at = math.floor(at);
					else
						at = math.floor(at) + 1;
					end;

					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_agilidade) or 0);
					iv = math.floor(iv/8);

					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_agilidade) or 0);
					ev = math.floor(ev/8);

					local nt = 0;
					local id = 5;
					if id > 0 then
						local nature = self.boxDetalhesDoTime.node.pokemon_natureza;
						nature = tonumber(nature) or 0;
						local plus = math.floor(nature / 10);
						local minus = math.floor(nature % 10);

						if plus ~= minus then
							if plus == id then
								self.boxDetalhesDoTime.node.nature_agilidade = "16";
								nt = 2;
							elseif minus == id then
								self.boxDetalhesDoTime.node.nature_agilidade = "-16";
								nt = -2;
							else
								self.boxDetalhesDoTime.node.nature_agilidade = "0";
							end;
						else
							self.boxDetalhesDoTime.node.nature_agilidade = "0";
						end;
					else
						self.boxDetalhesDoTime.node.nature_agilidade = "0";
					end;

					local efeitos = 0;
					local atributo = "agilidade";
					if atributo == "ataque" and self.boxDetalhesDoTime.node.efeitos == "BRN" then
						efeitos = -4;
					elseif atributo == "agilidade" and self.boxDetalhesDoTime.node.efeitos == "PAR" then
						efeitos = -2;
					end;

					local total = at + iv + ev + nt;
					local mod =  math.floor((total/2) - 5) + (tonumber(self.boxDetalhesDoTime.node.bf_agilidade) or 0)*2 + efeitos;
					mod = math.max(-5, mod);

					self.boxDetalhesDoTime.node.total_agilidade = total;
					self.boxDetalhesDoTime.node.mod_agilidade = mod;
					updateND();
					updatePV();
					updateCA_AC();
					updateDesl();
				end;
			end;
		


    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.boxDetalhesDoTime);
    obj.layout12:setLeft(300);
    obj.layout12:setTop(80);
    obj.layout12:setWidth(260);
    obj.layout12:setHeight(185);
    obj.layout12:setName("layout12");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout12);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("Black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout12);
    obj.label50:setLeft(5);
    obj.label50:setTop(0);
    obj.label50:setWidth(190);
    obj.label50:setHeight(25);
    obj.label50:setText("Habilidade");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout12);
    obj.edit30:setLeft(5);
    obj.edit30:setTop(25);
    obj.edit30:setWidth(190);
    obj.edit30:setHeight(25);
    obj.edit30:setField("habilidade_nome");
    obj.edit30:setName("edit30");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout12);
    obj.label51:setLeft(200);
    obj.label51:setTop(0);
    obj.label51:setWidth(55);
    obj.label51:setHeight(25);
    obj.label51:setText("Custo");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout12);
    obj.edit31:setLeft(200);
    obj.edit31:setTop(25);
    obj.edit31:setWidth(55);
    obj.edit31:setHeight(25);
    obj.edit31:setField("habilidade_custo");
    obj.edit31:setName("edit31");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout12);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(50);
    obj.textEditor1:setWidth(250);
    obj.textEditor1:setHeight(35);
    obj.textEditor1:setField("habilidade_descricao");
    obj.textEditor1:setName("textEditor1");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout12);
    obj.label52:setLeft(5);
    obj.label52:setTop(85);
    obj.label52:setWidth(250);
    obj.label52:setHeight(25);
    obj.label52:setText("Equipamento");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout12);
    obj.edit32:setLeft(5);
    obj.edit32:setTop(110);
    obj.edit32:setWidth(250);
    obj.edit32:setHeight(25);
    obj.edit32:setField("equipamento_nome");
    obj.edit32:setName("edit32");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout12);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(135);
    obj.textEditor2:setWidth(250);
    obj.textEditor2:setHeight(40);
    obj.textEditor2:setField("equipamento_descricao");
    obj.textEditor2:setName("textEditor2");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.boxDetalhesDoTime);
    obj.layout13:setLeft(565);
    obj.layout13:setTop(80);
    obj.layout13:setWidth(290);
    obj.layout13:setHeight(185);
    obj.layout13:setName("layout13");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout13);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("Black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout13);
    obj.label53:setLeft(0);
    obj.label53:setTop(5);
    obj.label53:setWidth(65);
    obj.label53:setHeight(25);
    obj.label53:setText("Tamanho");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout13);
    obj.comboBox6:setLeft(65);
    obj.comboBox6:setTop(5);
    obj.comboBox6:setWidth(100);
    obj.comboBox6:setHeight(25);
    obj.comboBox6:setField("tamanho");
    obj.comboBox6:setItems({'Minusculo', 'Minimo', 'Miudo', 'Pequeno', 'Médio', 'Grande', 'Enorme', 'Imenso', 'Colossal', 'Colossal+'});
    obj.comboBox6:setValues({'-4', '-3', '-2', '-1', '0', '1', '2', '3', '4', '5'});
    obj.comboBox6:setName("comboBox6");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout13);
    obj.label54:setLeft(185);
    obj.label54:setTop(5);
    obj.label54:setWidth(35);
    obj.label54:setHeight(25);
    obj.label54:setText("Esp.");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout13);
    obj.edit33:setLeft(220);
    obj.edit33:setTop(5);
    obj.edit33:setWidth(65);
    obj.edit33:setHeight(25);
    obj.edit33:setField("espaco");
    obj.edit33:setName("edit33");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout13);
    obj.label55:setLeft(0);
    obj.label55:setTop(30);
    obj.label55:setWidth(65);
    obj.label55:setHeight(25);
    obj.label55:setText("Estagio");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout13);
    obj.comboBox7:setLeft(65);
    obj.comboBox7:setTop(30);
    obj.comboBox7:setWidth(120);
    obj.comboBox7:setHeight(25);
    obj.comboBox7:setField("estagio");
    obj.comboBox7:setItems({'Bebê', 'Antepenultimo', 'Penultimo', 'Ultimo', 'Mega'});
    obj.comboBox7:setValues({'4', '6', '8', '10', '12'});
    obj.comboBox7:setName("comboBox7");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout13);
    obj.label56:setLeft(185);
    obj.label56:setTop(30);
    obj.label56:setWidth(35);
    obj.label56:setHeight(25);
    obj.label56:setText("DV");
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout13);
    obj.rectangle26:setLeft(220);
    obj.rectangle26:setTop(30);
    obj.rectangle26:setWidth(65);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("Black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout13);
    obj.label57:setLeft(220);
    obj.label57:setTop(30);
    obj.label57:setWidth(65);
    obj.label57:setHeight(25);
    obj.label57:setField("dv");
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout13);
    obj.label58:setLeft(0);
    obj.label58:setTop(55);
    obj.label58:setWidth(65);
    obj.label58:setHeight(25);
    obj.label58:setText("STAB");
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout13);
    obj.comboBox8:setLeft(55);
    obj.comboBox8:setTop(55);
    obj.comboBox8:setWidth(50);
    obj.comboBox8:setHeight(25);
    obj.comboBox8:setField("stab");
    obj.comboBox8:setItems({'1.5', '2'});
    obj.comboBox8:setValues({'1.5', '2'});
    obj.comboBox8:setValue("1.5");
    obj.comboBox8:setName("comboBox8");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout13);
    obj.label59:setLeft(105);
    obj.label59:setTop(55);
    obj.label59:setWidth(65);
    obj.label59:setHeight(25);
    obj.label59:setText("CRIT");
    obj.label59:setName("label59");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout13);
    obj.comboBox9:setLeft(135);
    obj.comboBox9:setTop(55);
    obj.comboBox9:setWidth(55);
    obj.comboBox9:setHeight(25);
    obj.comboBox9:setField("crit");
    obj.comboBox9:setItems({'1.5', '2.25'});
    obj.comboBox9:setValues({'2', '3'});
    obj.comboBox9:setValue("1.5");
    obj.comboBox9:setName("comboBox9");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout13);
    obj.label60:setLeft(185);
    obj.label60:setTop(55);
    obj.label60:setWidth(35);
    obj.label60:setHeight(25);
    obj.label60:setText("PV");
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout13);
    obj.edit34:setLeft(220);
    obj.edit34:setTop(55);
    obj.edit34:setWidth(35);
    obj.edit34:setHeight(25);
    obj.edit34:setField("pv_atual");
    obj.edit34:setName("edit34");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout13);
    obj.rectangle27:setLeft(255);
    obj.rectangle27:setTop(55);
    obj.rectangle27:setWidth(30);
    obj.rectangle27:setHeight(25);
    obj.rectangle27:setColor("Black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout13);
    obj.label61:setLeft(255);
    obj.label61:setTop(55);
    obj.label61:setWidth(30);
    obj.label61:setHeight(25);
    obj.label61:setField("pv");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout13);
    obj.label62:setLeft(0);
    obj.label62:setTop(80);
    obj.label62:setWidth(65);
    obj.label62:setHeight(25);
    obj.label62:setText("Efeitos");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.comboBox10 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout13);
    obj.comboBox10:setLeft(65);
    obj.comboBox10:setTop(80);
    obj.comboBox10:setWidth(120);
    obj.comboBox10:setHeight(25);
    obj.comboBox10:setField("efeitos");
    obj.comboBox10:setItems({'Envenenado', 'Paralisado', 'Dormindo', 'Queimado', 'Congelado', 'Nocauteado', 'Saudavel'});
    obj.comboBox10:setValues({'PSN', 'PAR', 'SLP', 'BRN', 'FRZ', 'FNT', ' '});
    obj.comboBox10:setName("comboBox10");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(0);
    obj.layout14:setWidth(290);
    obj.layout14:setHeight(185);
    obj.layout14:setName("layout14");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout14);
    obj.label63:setLeft(5);
    obj.label63:setTop(110);
    obj.label63:setWidth(35);
    obj.label63:setHeight(25);
    obj.label63:setText("CAF");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout14);
    obj.rectangle28:setLeft(40);
    obj.rectangle28:setTop(110);
    obj.rectangle28:setWidth(30);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("Black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout14);
    obj.label64:setLeft(40);
    obj.label64:setTop(110);
    obj.label64:setWidth(30);
    obj.label64:setHeight(25);
    obj.label64:setField("caf");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout14);
    obj.label65:setLeft(75);
    obj.label65:setTop(110);
    obj.label65:setWidth(35);
    obj.label65:setHeight(25);
    obj.label65:setText("CAE");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout14);
    obj.rectangle29:setLeft(110);
    obj.rectangle29:setTop(110);
    obj.rectangle29:setWidth(30);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("Black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout14);
    obj.label66:setLeft(110);
    obj.label66:setTop(110);
    obj.label66:setWidth(30);
    obj.label66:setHeight(25);
    obj.label66:setField("cae");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout14);
    obj.label67:setLeft(145);
    obj.label67:setTop(110);
    obj.label67:setWidth(35);
    obj.label67:setHeight(25);
    obj.label67:setText("CAS");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout14);
    obj.rectangle30:setLeft(180);
    obj.rectangle30:setTop(110);
    obj.rectangle30:setWidth(30);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("Black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout14);
    obj.label68:setLeft(180);
    obj.label68:setTop(110);
    obj.label68:setWidth(30);
    obj.label68:setHeight(25);
    obj.label68:setField("cas");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout14);
    obj.label69:setLeft(215);
    obj.label69:setTop(110);
    obj.label69:setWidth(35);
    obj.label69:setHeight(25);
    obj.label69:setText("CAB");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout14);
    obj.edit35:setLeft(250);
    obj.edit35:setTop(110);
    obj.edit35:setWidth(30);
    obj.edit35:setHeight(25);
    obj.edit35:setField("cab");
    obj.edit35:setName("edit35");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout14);
    obj.label70:setLeft(5);
    obj.label70:setTop(135);
    obj.label70:setWidth(35);
    obj.label70:setHeight(25);
    obj.label70:setText("ACF");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout14);
    obj.rectangle31:setLeft(40);
    obj.rectangle31:setTop(135);
    obj.rectangle31:setWidth(30);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("Black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout14);
    obj.label71:setLeft(40);
    obj.label71:setTop(135);
    obj.label71:setWidth(30);
    obj.label71:setHeight(25);
    obj.label71:setField("acf");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout14);
    obj.label72:setLeft(75);
    obj.label72:setTop(135);
    obj.label72:setWidth(35);
    obj.label72:setHeight(25);
    obj.label72:setText("ACE");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout14);
    obj.rectangle32:setLeft(110);
    obj.rectangle32:setTop(135);
    obj.rectangle32:setWidth(30);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("Black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout14);
    obj.label73:setLeft(110);
    obj.label73:setTop(135);
    obj.label73:setWidth(30);
    obj.label73:setHeight(25);
    obj.label73:setField("ace");
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout14);
    obj.label74:setLeft(145);
    obj.label74:setTop(135);
    obj.label74:setWidth(35);
    obj.label74:setHeight(25);
    obj.label74:setText("ACS");
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout14);
    obj.rectangle33:setLeft(180);
    obj.rectangle33:setTop(135);
    obj.rectangle33:setWidth(30);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("Black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout14);
    obj.label75:setLeft(180);
    obj.label75:setTop(135);
    obj.label75:setWidth(30);
    obj.label75:setHeight(25);
    obj.label75:setField("acs");
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout14);
    obj.label76:setLeft(215);
    obj.label76:setTop(135);
    obj.label76:setWidth(35);
    obj.label76:setHeight(25);
    obj.label76:setText("ACB");
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout14);
    obj.edit36:setLeft(250);
    obj.edit36:setTop(135);
    obj.edit36:setWidth(30);
    obj.edit36:setHeight(25);
    obj.edit36:setField("acb");
    obj.edit36:setName("edit36");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.boxDetalhesDoTime);
    obj.layout15:setLeft(860);
    obj.layout15:setTop(80);
    obj.layout15:setWidth(265);
    obj.layout15:setHeight(185);
    obj.layout15:setName("layout15");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout15);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("Black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout15);
    obj.label77:setLeft(5);
    obj.label77:setTop(0);
    obj.label77:setWidth(265);
    obj.label77:setHeight(25);
    obj.label77:setText("DESLOCAMENTOS");
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout15);
    obj.label78:setLeft(75);
    obj.label78:setTop(30);
    obj.label78:setWidth(35);
    obj.label78:setHeight(25);
    obj.label78:setText("Mult");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout15);
    obj.label79:setLeft(105);
    obj.label79:setTop(30);
    obj.label79:setWidth(75);
    obj.label79:setHeight(25);
    obj.label79:setText("    Valor");
    obj.label79:setName("label79");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout15);
    obj.label80:setLeft(180);
    obj.label80:setTop(30);
    obj.label80:setWidth(75);
    obj.label80:setHeight(25);
    obj.label80:setText("Qualidade");
    obj.label80:setFontSize(13);
    obj.label80:setName("label80");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout15);
    obj.label81:setLeft(5);
    obj.label81:setTop(55);
    obj.label81:setWidth(70);
    obj.label81:setHeight(25);
    obj.label81:setText("Terrestre");
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout15);
    obj.edit37:setLeft(75);
    obj.edit37:setTop(55);
    obj.edit37:setWidth(35);
    obj.edit37:setHeight(25);
    obj.edit37:setField("desl_mult_terrestre");
    obj.edit37:setName("edit37");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout15);
    obj.rectangle35:setLeft(105);
    obj.rectangle35:setTop(55);
    obj.rectangle35:setWidth(155);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("Black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout15);
    obj.label82:setLeft(105);
    obj.label82:setTop(55);
    obj.label82:setWidth(155);
    obj.label82:setHeight(25);
    obj.label82:setField("desl_terrestre");
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout15);
    obj.label83:setLeft(5);
    obj.label83:setTop(80);
    obj.label83:setWidth(70);
    obj.label83:setHeight(25);
    obj.label83:setText("Aquatico");
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout15);
    obj.edit38:setLeft(75);
    obj.edit38:setTop(80);
    obj.edit38:setWidth(35);
    obj.edit38:setHeight(25);
    obj.edit38:setField("desl_mult_aquatico");
    obj.edit38:setName("edit38");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout15);
    obj.rectangle36:setLeft(105);
    obj.rectangle36:setTop(80);
    obj.rectangle36:setWidth(155);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("Black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout15);
    obj.label84:setLeft(105);
    obj.label84:setTop(80);
    obj.label84:setWidth(155);
    obj.label84:setHeight(25);
    obj.label84:setField("desl_aquatico");
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout15);
    obj.label85:setLeft(5);
    obj.label85:setTop(105);
    obj.label85:setWidth(70);
    obj.label85:setHeight(25);
    obj.label85:setText("Aereo");
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout15);
    obj.edit39:setLeft(75);
    obj.edit39:setTop(105);
    obj.edit39:setWidth(35);
    obj.edit39:setHeight(25);
    obj.edit39:setField("desl_mult_aereo");
    obj.edit39:setName("edit39");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout15);
    obj.rectangle37:setLeft(105);
    obj.rectangle37:setTop(105);
    obj.rectangle37:setWidth(80);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("Black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout15);
    obj.label86:setLeft(105);
    obj.label86:setTop(105);
    obj.label86:setWidth(80);
    obj.label86:setHeight(25);
    obj.label86:setField("desl_aereo");
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout15);
    obj.edit40:setLeft(185);
    obj.edit40:setTop(105);
    obj.edit40:setWidth(75);
    obj.edit40:setHeight(25);
    obj.edit40:setField("desl_manobra_aereo");
    obj.edit40:setName("edit40");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout15);
    obj.label87:setLeft(5);
    obj.label87:setTop(130);
    obj.label87:setWidth(70);
    obj.label87:setHeight(25);
    obj.label87:setText("Escavar");
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout15);
    obj.edit41:setLeft(75);
    obj.edit41:setTop(130);
    obj.edit41:setWidth(35);
    obj.edit41:setHeight(25);
    obj.edit41:setField("desl_mult_escavar");
    obj.edit41:setName("edit41");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout15);
    obj.rectangle38:setLeft(105);
    obj.rectangle38:setTop(130);
    obj.rectangle38:setWidth(80);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout15);
    obj.label88:setLeft(105);
    obj.label88:setTop(130);
    obj.label88:setWidth(80);
    obj.label88:setHeight(25);
    obj.label88:setField("desl_escavar");
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout15);
    obj.edit42:setLeft(185);
    obj.edit42:setTop(130);
    obj.edit42:setWidth(75);
    obj.edit42:setHeight(25);
    obj.edit42:setField("desl_manobra_aescavar");
    obj.edit42:setName("edit42");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout15);
    obj.label89:setLeft(5);
    obj.label89:setTop(155);
    obj.label89:setWidth(70);
    obj.label89:setHeight(25);
    obj.label89:setText("Escalar");
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout15);
    obj.edit43:setLeft(75);
    obj.edit43:setTop(155);
    obj.edit43:setWidth(35);
    obj.edit43:setHeight(25);
    obj.edit43:setField("desl_mult_escalar");
    obj.edit43:setName("edit43");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout15);
    obj.rectangle39:setLeft(105);
    obj.rectangle39:setTop(155);
    obj.rectangle39:setWidth(155);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("Black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout15);
    obj.label90:setLeft(105);
    obj.label90:setTop(155);
    obj.label90:setWidth(155);
    obj.label90:setHeight(25);
    obj.label90:setField("desl_escalar");
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.boxDetalhesDoTime);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(270);
    obj.layout16:setWidth(1120);
    obj.layout16:setHeight(340);
    obj.layout16:setName("layout16");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout16);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("Black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout16);
    obj.button11:setLeft(5);
    obj.button11:setTop(2);
    obj.button11:setWidth(20);
    obj.button11:setHeight(20);
    obj.button11:setText("+");
    obj.button11:setName("button11");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout16);
    obj.button12:setLeft(25);
    obj.button12:setTop(2);
    obj.button12:setWidth(20);
    obj.button12:setHeight(20);
    obj.button12:setText("O");
    obj.button12:setName("button12");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout16);
    obj.label91:setLeft(0);
    obj.label91:setTop(2);
    obj.label91:setWidth(1100);
    obj.label91:setHeight(20);
    obj.label91:setText("GOLPES");
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.rclGolpes = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclGolpes:setParent(obj.layout16);
    obj.rclGolpes:setLeft(5);
    obj.rclGolpes:setTop(25);
    obj.rclGolpes:setWidth(1110);
    obj.rclGolpes:setHeight(310);
    obj.rclGolpes:setName("rclGolpes");
    obj.rclGolpes:setField("golpes");
    obj.rclGolpes:setTemplateForm("frmPKMN3MOVE");
    obj.rclGolpes:setLayout("horizontalTiles");


				local function updateIcon()
					if sheet ~= nil then
						local url = "http://www.serebii.net/xy/pokemon/";
						if self.boxDetalhesDoTime.node.shiny then
							url = "http://www.serebii.net/Shiny/XY/";
						end;
						local id = (self.boxDetalhesDoTime.node.icon_id or "000");
						if self.boxDetalhesDoTime.node.mega then
							id = id .. "-m"
						end;
						if self.boxDetalhesDoTime.node.y then
							id = id .. "y"
						end;
						if self.boxDetalhesDoTime.node.x then
							id = id .. "x"
						end;

						sheet["time_icon_" .. self.boxDetalhesDoTime.node.num] = url .. id .. ".png";

						self.boxDetalhesDoTime.node.browser_icon = "http://www.serebii.net/pokedex-xy/icon/" .. id .. ".png";					

						url = "http://www.serebii.net/itemdex/sprites/" .. (self.boxDetalhesDoTime.node.pokemon_ball or "ball") .. ".png";
						sheet["time_ball_" .. self.boxDetalhesDoTime.node.num] = url;

						sheet["time_level_" .. self.boxDetalhesDoTime.node.num] = self.boxDetalhesDoTime.node.pokemon_nivel;
						sheet["time_status_" .. self.boxDetalhesDoTime.node.num] = self.boxDetalhesDoTime.node.efeitos;

						local equip = (self.boxDetalhesDoTime.node.equipamento_nome or "");
						equip = equip:gsub("%s+", "");
						equip = equip:lower();

						url = "http://www.serebii.net/itemdex/sprites/" .. (equip or "") .. ".png";
						sheet["time_equip_" .. self.boxDetalhesDoTime.node.num] = url;

					end;
				end;
			


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            if sheet ~= nil then
            						if sheet.pkmn_time_1 == nil then
            							sheet.pkmn_time_1 = {num="1"};
            						end;
            						sheet.selected = 1;
            						local node = sheet.pkmn_time_1;
            						self.boxDetalhesDoTime.node = node;
            						self.boxDetalhesDoTime.visible = (node ~= nil);
            					end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            if sheet ~= nil then
            						if sheet.pkmn_time_2 == nil then
            							sheet.pkmn_time_2 = {num="2"};
            						end;
            						sheet.selected = 2;
            						local node = sheet.pkmn_time_2;
            						self.boxDetalhesDoTime.node = node;
            						self.boxDetalhesDoTime.visible = (node ~= nil);
            					end;
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (self)
            if sheet ~= nil then
            						if sheet.pkmn_time_3 == nil then
            							sheet.pkmn_time_3 = {num="3"};
            						end;
            						sheet.selected = 3;
            						local node = sheet.pkmn_time_3;
            						self.boxDetalhesDoTime.node = node;
            						self.boxDetalhesDoTime.visible = (node ~= nil);
            					end;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (self)
            if sheet ~= nil then
            						if sheet.pkmn_time_4 == nil then
            							sheet.pkmn_time_4 = {num="4"};
            						end;
            						sheet.selected = 4;
            						local node = sheet.pkmn_time_4;
            						self.boxDetalhesDoTime.node = node;
            						self.boxDetalhesDoTime.visible = (node ~= nil);
            					end;
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (self)
            if sheet ~= nil then
            						if sheet.pkmn_time_5 == nil then
            							sheet.pkmn_time_5 = {num="5"};
            						end;
            						sheet.selected = 5;
            						local node = sheet.pkmn_time_5;
            						self.boxDetalhesDoTime.node = node;
            						self.boxDetalhesDoTime.visible = (node ~= nil);
            					end;
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (self)
            if sheet ~= nil then
            						if sheet.pkmn_time_6 == nil then
            							sheet.pkmn_time_6 = {num="6"};
            						end;
            						sheet.selected = 6;
            						local node = sheet.pkmn_time_6;
            						self.boxDetalhesDoTime.node = node;
            						self.boxDetalhesDoTime.visible = (node ~= nil);
            					end;
        end, obj);

    obj._e_event6 = obj.edit1:addEventListener("onChange",
        function (self)
            updateIcon();
        end, obj);

    obj._e_event7 = obj.comboBox2:addEventListener("onChange",
        function (self)
            sum_mod_ataque();
            					sum_mod_defesa();
            					sum_mod_ataque_especial();
            					sum_mod_defesa_especial();
            					sum_mod_agilidade();
        end, obj);

    obj._e_event8 = obj.comboBox5:addEventListener("onChange",
        function (self)
            updateIcon();
        end, obj);

    obj._e_event9 = obj.edit4:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            							local mod = self.boxDetalhesDoTime.node.xp or "";
            							mod = string.gsub(mod, "X", "");
            							mod = string.gsub(mod, "P", "");
            							mod = string.gsub(mod, "x", "");
            							mod = string.gsub(mod, "p", "");
            							mod = string.gsub(mod, "%.", "");
            							mod = (tonumber(mod) or 0);
            							local mod2 = 0;
            							local mod3 = 0;
            							while mod>=mod2 do
            								mod3 = mod3+1;
            								mod2 = mod2 + mod3*1000;
            							end
            							
            							while true do  
            								mod2, k = string.gsub(mod2, "^(-?%d+)(%d%d%d)", '%1,%2');
            								if (k==0) then
            								  break
            								end
            							end
            							mod2 = string.gsub(mod2, ",", ".");
            							
            							self.boxDetalhesDoTime.node.xp_lvlup = mod2 .. "XP";
            							self.boxDetalhesDoTime.node.pokemon_nivel = mod3;
            							updateND();
            							updatePV();
            							updateCA_AC();
            							updateIcon();
            						end;
        end, obj);

    obj._e_event10 = obj.checkBox1:addEventListener("onChange",
        function (self)
            updateIcon();
        end, obj);

    obj._e_event11 = obj.checkBox2:addEventListener("onChange",
        function (self)
            updateIcon();
        end, obj);

    obj._e_event12 = obj.checkBox3:addEventListener("onChange",
        function (self)
            updateIcon();
        end, obj);

    obj._e_event13 = obj.checkBox4:addEventListener("onChange",
        function (self)
            updateIcon();
        end, obj);

    obj._e_event14 = obj.button7:addEventListener("onClick",
        function (self)
            if sheet~= nil then
            						local pos = tonumber(self.boxDetalhesDoTime.node.num) or 1;
            						if pos > 1 then
            							sheet.pkmn_time_7 = sheet["pkmn_time_" .. (pos-1)];
            							sheet["pkmn_time_" .. (pos-1)] = sheet["pkmn_time_" .. pos];
            							sheet["pkmn_time_" .. pos] = sheet.pkmn_time_7;
            
            							sheet["pkmn_time_" .. pos].num = pos;
            							sheet["pkmn_time_" .. (pos-1)].num = pos-1;
            							self.boxDetalhesDoTime.node = sheet["pkmn_time_" .. pos];
            							updateIcon();
            							self.boxDetalhesDoTime.node = sheet["pkmn_time_" .. (pos-1)];
            							updateIcon();
            						end;
            					end;
        end, obj);

    obj._e_event15 = obj.button8:addEventListener("onClick",
        function (self)
            if sheet~= nil then
            						local pos = tonumber(self.boxDetalhesDoTime.node.num) or 1;
            						if pos < 6 then
            							sheet.pkmn_time_7 = sheet["pkmn_time_" .. (pos+1)];
            							sheet["pkmn_time_" .. (pos+1)] = sheet["pkmn_time_" .. pos];
            							sheet["pkmn_time_" .. pos] = sheet.pkmn_time_7;
            
            							sheet["pkmn_time_" .. pos].num = pos;
            							sheet["pkmn_time_" .. (pos+1)].num = pos+1;
            							self.boxDetalhesDoTime.node = sheet["pkmn_time_" .. pos];
            							updateIcon();
            							self.boxDetalhesDoTime.node = sheet["pkmn_time_" .. (pos+1)];
            							updateIcon();
            						end;
            					end;
        end, obj);

    obj._e_event16 = obj.button9:addEventListener("onClick",
        function (self)
            local id = (self.boxDetalhesDoTime.node.icon_id or "000");
            					gui.openInBrowser("http://www.serebii.net/pokedex-xy/" .. id .. ".shtml");
        end, obj);

    obj._e_event17 = obj.button10:addEventListener("onClick",
        function (self)
            if sheet ~= nil then
            									local jogadores = rrpg.getMesaDe(sheet).jogadores;
            									local current = nil;
            									
            									for i = 1, #jogadores, 1 do
            										if jogadores[i].login==rrpg.getCurrentUser().login then
            											current = jogadores[i];
            										end;
            									end; 
            									
            									if current~=nil and current.isMestre then
            										self.boxDetalhesDoTime.node.iv_pv = math.random(1, 32);
            										self.boxDetalhesDoTime.node.iv_ataque = math.random(1, 32);
            										self.boxDetalhesDoTime.node.iv_defesa = math.random(1, 32);
            										self.boxDetalhesDoTime.node.iv_ataque_especial = math.random(1, 32);
            										self.boxDetalhesDoTime.node.iv_defesa_especial = math.random(1, 32);
            										self.boxDetalhesDoTime.node.iv_agilidade = math.random(1, 32);
            									end;
            								end;
        end, obj);

    obj._e_event18 = obj.edit6:addEventListener("onChange",
        function (self)
            sum_mod_pv();
        end, obj);

    obj._e_event19 = obj.edit7:addEventListener("onChange",
        function (self)
            sum_mod_pv();
            				if sheet ~= nil then
            					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_pv) or 0);
            					iv = math.max(1, iv);
            					iv = math.min(32, iv);
            					self.boxDetalhesDoTime.node.iv_pv = iv;
            				end;
        end, obj);

    obj._e_event20 = obj.edit8:addEventListener("onChange",
        function (self)
            sum_mod_pv();
            				if sheet ~= nil then
            					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_pv) or 0);
            					iv = math.max(0, ev);
            					iv = math.min(64, ev);
            					self.boxDetalhesDoTime.node.ev_pv = iv;
            
            					local sum = (tonumber(self.boxDetalhesDoTime.node.ev_pv) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_agilidade) or 0);
            
            					if sum > 128 then
            						showMessage("Você possui " .. sum .. "EVs, o limite é 128!");
            					end;
            				end;
        end, obj);

    obj._e_event21 = obj.edit9:addEventListener("onChange",
        function (self)
            sum_mod_pv();
            				if sheet ~= nil then
            					local bf = (tonumber(self.boxDetalhesDoTime.node.bf_pv) or 0);
            					bf = math.max(-6, bf);
            					bf = math.min(6, bf);
            					self.boxDetalhesDoTime.node.bf_pv = bf;
            				end;
        end, obj);

    obj._e_event22 = obj.edit10:addEventListener("onChange",
        function (self)
            sum_mod_ataque();
        end, obj);

    obj._e_event23 = obj.edit11:addEventListener("onChange",
        function (self)
            sum_mod_ataque();
            				if sheet ~= nil then
            					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_ataque) or 0);
            					iv = math.max(1, iv);
            					iv = math.min(32, iv);
            					self.boxDetalhesDoTime.node.iv_ataque = iv;
            				end;
        end, obj);

    obj._e_event24 = obj.edit12:addEventListener("onChange",
        function (self)
            sum_mod_ataque();
            				if sheet ~= nil then
            					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_ataque) or 0);
            					iv = math.max(0, ev);
            					iv = math.min(64, ev);
            					self.boxDetalhesDoTime.node.ev_ataque = iv;
            
            					local sum = (tonumber(self.boxDetalhesDoTime.node.ev_pv) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_agilidade) or 0);
            
            					if sum > 128 then
            						showMessage("Você possui " .. sum .. "EVs, o limite é 128!");
            					end;
            				end;
        end, obj);

    obj._e_event25 = obj.edit13:addEventListener("onChange",
        function (self)
            sum_mod_ataque();
            				if sheet ~= nil then
            					local bf = (tonumber(self.boxDetalhesDoTime.node.bf_ataque) or 0);
            					bf = math.max(-6, bf);
            					bf = math.min(6, bf);
            					self.boxDetalhesDoTime.node.bf_ataque = bf;
            				end;
        end, obj);

    obj._e_event26 = obj.edit14:addEventListener("onChange",
        function (self)
            sum_mod_defesa();
        end, obj);

    obj._e_event27 = obj.edit15:addEventListener("onChange",
        function (self)
            sum_mod_defesa();
            				if sheet ~= nil then
            					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_defesa) or 0);
            					iv = math.max(1, iv);
            					iv = math.min(32, iv);
            					self.boxDetalhesDoTime.node.iv_defesa = iv;
            				end;
        end, obj);

    obj._e_event28 = obj.edit16:addEventListener("onChange",
        function (self)
            sum_mod_defesa();
            				if sheet ~= nil then
            					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_defesa) or 0);
            					iv = math.max(0, ev);
            					iv = math.min(64, ev);
            					self.boxDetalhesDoTime.node.ev_defesa = iv;
            
            					local sum = (tonumber(self.boxDetalhesDoTime.node.ev_pv) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_agilidade) or 0);
            
            					if sum > 128 then
            						showMessage("Você possui " .. sum .. "EVs, o limite é 128!");
            					end;
            				end;
        end, obj);

    obj._e_event29 = obj.edit17:addEventListener("onChange",
        function (self)
            sum_mod_defesa();
            				if sheet ~= nil then
            					local bf = (tonumber(self.boxDetalhesDoTime.node.bf_defesa) or 0);
            					bf = math.max(-6, bf);
            					bf = math.min(6, bf);
            					self.boxDetalhesDoTime.node.bf_defesa = bf;
            				end;
        end, obj);

    obj._e_event30 = obj.edit18:addEventListener("onChange",
        function (self)
            sum_mod_ataque_especial();
        end, obj);

    obj._e_event31 = obj.edit19:addEventListener("onChange",
        function (self)
            sum_mod_ataque_especial();
            				if sheet ~= nil then
            					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_ataque_especial) or 0);
            					iv = math.max(1, iv);
            					iv = math.min(32, iv);
            					self.boxDetalhesDoTime.node.iv_ataque_especial = iv;
            				end;
        end, obj);

    obj._e_event32 = obj.edit20:addEventListener("onChange",
        function (self)
            sum_mod_ataque_especial();
            				if sheet ~= nil then
            					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_ataque_especial) or 0);
            					iv = math.max(0, ev);
            					iv = math.min(64, ev);
            					self.boxDetalhesDoTime.node.ev_ataque_especial = iv;
            
            					local sum = (tonumber(self.boxDetalhesDoTime.node.ev_pv) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_agilidade) or 0);
            
            					if sum > 128 then
            						showMessage("Você possui " .. sum .. "EVs, o limite é 128!");
            					end;
            				end;
        end, obj);

    obj._e_event33 = obj.edit21:addEventListener("onChange",
        function (self)
            sum_mod_ataque_especial();
            				if sheet ~= nil then
            					local bf = (tonumber(self.boxDetalhesDoTime.node.bf_ataque_especial) or 0);
            					bf = math.max(-6, bf);
            					bf = math.min(6, bf);
            					self.boxDetalhesDoTime.node.bf_ataque_especial = bf;
            				end;
        end, obj);

    obj._e_event34 = obj.edit22:addEventListener("onChange",
        function (self)
            sum_mod_defesa_especial();
        end, obj);

    obj._e_event35 = obj.edit23:addEventListener("onChange",
        function (self)
            sum_mod_defesa_especial();
            				if sheet ~= nil then
            					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_defesa_especial) or 0);
            					iv = math.max(1, iv);
            					iv = math.min(32, iv);
            					self.boxDetalhesDoTime.node.iv_defesa_especial = iv;
            				end;
        end, obj);

    obj._e_event36 = obj.edit24:addEventListener("onChange",
        function (self)
            sum_mod_defesa_especial();
            				if sheet ~= nil then
            					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_defesa_especial) or 0);
            					iv = math.max(0, ev);
            					iv = math.min(64, ev);
            					self.boxDetalhesDoTime.node.ev_defesa_especial = iv;
            
            					local sum = (tonumber(self.boxDetalhesDoTime.node.ev_pv) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_agilidade) or 0);
            
            					if sum > 128 then
            						showMessage("Você possui " .. sum .. "EVs, o limite é 128!");
            					end;
            				end;
        end, obj);

    obj._e_event37 = obj.edit25:addEventListener("onChange",
        function (self)
            sum_mod_defesa_especial();
            				if sheet ~= nil then
            					local bf = (tonumber(self.boxDetalhesDoTime.node.bf_defesa_especial) or 0);
            					bf = math.max(-6, bf);
            					bf = math.min(6, bf);
            					self.boxDetalhesDoTime.node.bf_defesa_especial = bf;
            				end;
        end, obj);

    obj._e_event38 = obj.edit26:addEventListener("onChange",
        function (self)
            sum_mod_agilidade();
        end, obj);

    obj._e_event39 = obj.edit27:addEventListener("onChange",
        function (self)
            sum_mod_agilidade();
            				if sheet ~= nil then
            					local iv = (tonumber(self.boxDetalhesDoTime.node.iv_agilidade) or 0);
            					iv = math.max(1, iv);
            					iv = math.min(32, iv);
            					self.boxDetalhesDoTime.node.iv_agilidade = iv;
            				end;
        end, obj);

    obj._e_event40 = obj.edit28:addEventListener("onChange",
        function (self)
            sum_mod_agilidade();
            				if sheet ~= nil then
            					local ev = (tonumber(self.boxDetalhesDoTime.node.ev_agilidade) or 0);
            					iv = math.max(0, ev);
            					iv = math.min(64, ev);
            					self.boxDetalhesDoTime.node.ev_agilidade = iv;
            
            					local sum = (tonumber(self.boxDetalhesDoTime.node.ev_pv) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_ataque_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_defesa_especial) or 0) + 
            								(tonumber(self.boxDetalhesDoTime.node.ev_agilidade) or 0);
            
            					if sum > 128 then
            						showMessage("Você possui " .. sum .. "EVs, o limite é 128!");
            					end;
            				end;
        end, obj);

    obj._e_event41 = obj.edit29:addEventListener("onChange",
        function (self)
            sum_mod_agilidade();
            				if sheet ~= nil then
            					local bf = (tonumber(self.boxDetalhesDoTime.node.bf_agilidade) or 0);
            					bf = math.max(-6, bf);
            					bf = math.min(6, bf);
            					self.boxDetalhesDoTime.node.bf_agilidade = bf;
            				end;
        end, obj);

    obj._e_event42 = obj.edit31:addEventListener("onChange",
        function (self)
            updateND();
        end, obj);

    obj._e_event43 = obj.edit32:addEventListener("onChange",
        function (self)
            updateIcon();
        end, obj);

    obj._e_event44 = obj.comboBox6:addEventListener("onChange",
        function (self)
            updateCA_AC();
        end, obj);

    obj._e_event45 = obj.comboBox7:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            							self.boxDetalhesDoTime.node.dv = "d" .. (self.boxDetalhesDoTime.node.estagio or 0);
            							updatePV();
            						end;
        end, obj);

    obj._e_event46 = obj.comboBox10:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            							updateIcon();
            							sum_mod_ataque();
            							sum_mod_agilidade();
            						end;
        end, obj);

    obj._e_event47 = obj.edit35:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            								local cab = tonumber(self.boxDetalhesDoTime.node.cab) or 0;
            								cab = math.max(-6, cab);
            								cab = math.min(6, cab);
            								self.boxDetalhesDoTime.node.cab = cab;
            								updateCA_AC();
            							end;
        end, obj);

    obj._e_event48 = obj.edit36:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            								local acb = tonumber(self.boxDetalhesDoTime.node.acb) or 0;
            								acb = math.max(-6, acb);
            								acb = math.min(6, acb);
            								self.boxDetalhesDoTime.node.acb = acb;
            								updateCA_AC();
            							end;
        end, obj);

    obj._e_event49 = obj.edit37:addEventListener("onChange",
        function (self)
            updateDesl();
        end, obj);

    obj._e_event50 = obj.edit38:addEventListener("onChange",
        function (self)
            updateDesl();
        end, obj);

    obj._e_event51 = obj.edit39:addEventListener("onChange",
        function (self)
            updateDesl();
        end, obj);

    obj._e_event52 = obj.edit41:addEventListener("onChange",
        function (self)
            updateDesl();
        end, obj);

    obj._e_event53 = obj.edit43:addEventListener("onChange",
        function (self)
            updateDesl();
        end, obj);

    obj._e_event54 = obj.button11:addEventListener("onClick",
        function (self)
            self.rclGolpes:append();
        end, obj);

    obj._e_event55 = obj.button12:addEventListener("onClick",
        function (self)
            self.rclGolpes:sort();
        end, obj);

    obj._e_event56 = obj.rclGolpes:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.ordem) or 99) < (tonumber(nodeB.ordem) or 99) then
            		                        return -1;
            		                elseif (tonumber(nodeA.ordem) or 99) > (tonumber(nodeB.ordem) or 99) then
            		                        return 1;
            		                else   
            		                        return utils.compareStringPtBr(nodeA.nome_golpe, nodeB.nome_golpe);
            		                end;
        end, obj);

    function obj:_releaseEvents()
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
        if self.boxDetalhesDoTime ~= nil then self.boxDetalhesDoTime:destroy(); self.boxDetalhesDoTime = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
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
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.rclGolpes ~= nil then self.rclGolpes:destroy(); self.rclGolpes = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmPKMN3 = {
    newEditor = newfrmPKMN3, 
    new = newfrmPKMN3, 
    name = "frmPKMN3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPKMN3 = _frmPKMN3;
rrpg.registrarForm(_frmPKMN3);

return _frmPKMN3;
