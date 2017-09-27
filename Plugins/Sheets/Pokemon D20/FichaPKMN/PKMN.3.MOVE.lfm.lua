require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmPKMN3MOVE()
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
    obj:setName("frmPKMN3MOVE");
    obj:setHeight(155);
    obj:setWidth(545);
    obj:setTheme("dark");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setHeight(25);
    obj.label1:setWidth(50);
    obj.label1:setText("Nome");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(45);
    obj.edit1:setTop(5);
    obj.edit1:setHeight(25);
    obj.edit1:setWidth(100);
    obj.edit1:setField("nome_golpe");
    obj.edit1:setName("edit1");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setLeft(150);
    obj.comboBox1:setTop(5);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("tipo_golpe");
    obj.comboBox1:setItems({'-', 'Inseto', 'Noturno', 'Dragão', 'Eletrico', 'Fada', 'Lutador', 'Fogo', 'Voador', 'Fantasma', 'Planta', 'Terra', 'Gelo', 'Normal', 'Veneno', 'Psíquico', 'Pedra', 'Metal', 'Água'});
    obj.comboBox1:setValues({'-1', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18'});
    obj.comboBox1:setName("comboBox1");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj);
    obj.comboBox2:setLeft(245);
    obj.comboBox2:setTop(5);
    obj.comboBox2:setWidth(90);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("categoria_golpe");
    obj.comboBox2:setItems({'Físico', 'Especial', 'Suporte'});
    obj.comboBox2:setValues({'1', '2', '3'});
    obj.comboBox2:setName("comboBox2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(345);
    obj.label2:setTop(5);
    obj.label2:setHeight(25);
    obj.label2:setWidth(25);
    obj.label2:setText("PP");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(365);
    obj.edit2:setTop(5);
    obj.edit2:setHeight(25);
    obj.edit2:setWidth(30);
    obj.edit2:setField("pp_golpe");
    obj.edit2:setName("edit2");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj);
    obj.checkBox1:setLeft(395);
    obj.checkBox1:setTop(5);
    obj.checkBox1:setHeight(25);
    obj.checkBox1:setWidth(15);
    obj.checkBox1:setField("ppup1_golpe");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj);
    obj.checkBox2:setLeft(410);
    obj.checkBox2:setTop(5);
    obj.checkBox2:setHeight(25);
    obj.checkBox2:setWidth(15);
    obj.checkBox2:setField("ppup2_golpe");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj);
    obj.checkBox3:setLeft(425);
    obj.checkBox3:setTop(5);
    obj.checkBox3:setHeight(25);
    obj.checkBox3:setWidth(15);
    obj.checkBox3:setField("ppup3_golpe");
    obj.checkBox3:setName("checkBox3");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setLeft(445);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setWidth(30);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(445);
    obj.label3:setTop(5);
    obj.label3:setHeight(25);
    obj.label3:setWidth(30);
    obj.label3:setField("ppreal_golpe");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(480);
    obj.edit3:setTop(5);
    obj.edit3:setHeight(25);
    obj.edit3:setWidth(30);
    obj.edit3:setField("ppusado_golpe");
    obj.edit3:setName("edit3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(515);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(5);
    obj.button2:setTop(35);
    obj.button2:setHeight(25);
    obj.button2:setWidth(40);
    obj.button2:setText("Acc.");
    obj.button2:setName("button2");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(45);
    obj.edit4:setTop(35);
    obj.edit4:setHeight(25);
    obj.edit4:setWidth(30);
    obj.edit4:setField("acc_golpe");
    obj.edit4:setName("edit4");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setLeft(75);
    obj.rectangle3:setTop(35);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setWidth(30);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(75);
    obj.label4:setTop(35);
    obj.label4:setHeight(25);
    obj.label4:setWidth(30);
    obj.label4:setField("acc_real_golpe");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(110);
    obj.button3:setTop(35);
    obj.button3:setHeight(25);
    obj.button3:setWidth(50);
    obj.button3:setText("Dano");
    obj.button3:setName("button3");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(160);
    obj.edit5:setTop(35);
    obj.edit5:setHeight(25);
    obj.edit5:setWidth(40);
    obj.edit5:setField("poder_golpe");
    obj.edit5:setName("edit5");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj);
    obj.rectangle4:setLeft(200);
    obj.rectangle4:setTop(35);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setWidth(35);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(200);
    obj.label5:setTop(35);
    obj.label5:setHeight(25);
    obj.label5:setWidth(35);
    obj.label5:setField("poder_real_golpe");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj);
    obj.rectangle5:setLeft(235);
    obj.rectangle5:setTop(35);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setWidth(100);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setLeft(235);
    obj.label6:setTop(35);
    obj.label6:setHeight(25);
    obj.label6:setWidth(100);
    obj.label6:setField("dados_golpe");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj);
    obj.label7:setLeft(335);
    obj.label7:setTop(35);
    obj.label7:setHeight(25);
    obj.label7:setWidth(40);
    obj.label7:setText("CRIT");
    obj.label7:setName("label7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj);
    obj.edit6:setLeft(365);
    obj.edit6:setTop(35);
    obj.edit6:setHeight(25);
    obj.edit6:setWidth(30);
    obj.edit6:setField("crit_golpe");
    obj.edit6:setName("edit6");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj);
    obj.label8:setLeft(395);
    obj.label8:setTop(35);
    obj.label8:setHeight(25);
    obj.label8:setWidth(40);
    obj.label8:setText("PRIO");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj);
    obj.edit7:setLeft(425);
    obj.edit7:setTop(35);
    obj.edit7:setHeight(25);
    obj.edit7:setWidth(30);
    obj.edit7:setField("prioridade_golpe");
    obj.edit7:setName("edit7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj);
    obj.label9:setLeft(455);
    obj.label9:setTop(35);
    obj.label9:setHeight(25);
    obj.label9:setWidth(40);
    obj.label9:setText("NEP");
    obj.label9:setName("label9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj);
    obj.edit8:setLeft(480);
    obj.edit8:setTop(35);
    obj.edit8:setHeight(25);
    obj.edit8:setWidth(30);
    obj.edit8:setField("nep_golpe");
    obj.edit8:setName("edit8");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj);
    obj.button4:setLeft(515);
    obj.button4:setTop(35);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("O");
    obj.button4:setName("button4");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj);
    obj.label10:setLeft(5);
    obj.label10:setTop(65);
    obj.label10:setHeight(25);
    obj.label10:setWidth(40);
    obj.label10:setText("EQUIP");
    obj.label10:setFontSize(11);
    obj.label10:setName("label10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj);
    obj.edit9:setLeft(35);
    obj.edit9:setTop(65);
    obj.edit9:setHeight(25);
    obj.edit9:setWidth(30);
    obj.edit9:setField("equip_bonus");
    obj.edit9:setName("edit9");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj);
    obj.label11:setLeft(66);
    obj.label11:setTop(65);
    obj.label11:setHeight(25);
    obj.label11:setWidth(40);
    obj.label11:setText("HAB");
    obj.label11:setName("label11");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj);
    obj.edit10:setLeft(95);
    obj.edit10:setTop(65);
    obj.edit10:setHeight(25);
    obj.edit10:setWidth(30);
    obj.edit10:setField("habilidade_bonus");
    obj.edit10:setName("edit10");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj);
    obj.label12:setLeft(125);
    obj.label12:setTop(65);
    obj.label12:setHeight(25);
    obj.label12:setWidth(40);
    obj.label12:setText("CLIM");
    obj.label12:setName("label12");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj);
    obj.edit11:setLeft(155);
    obj.edit11:setTop(65);
    obj.edit11:setHeight(25);
    obj.edit11:setWidth(30);
    obj.edit11:setField("clima_bonus");
    obj.edit11:setName("edit11");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj);
    obj.label13:setLeft(185);
    obj.label13:setTop(65);
    obj.label13:setHeight(25);
    obj.label13:setWidth(40);
    obj.label13:setText("TIME");
    obj.label13:setName("label13");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj);
    obj.edit12:setLeft(215);
    obj.edit12:setTop(65);
    obj.edit12:setHeight(25);
    obj.edit12:setWidth(30);
    obj.edit12:setField("time_bonus");
    obj.edit12:setName("edit12");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj);
    obj.label14:setLeft(246);
    obj.label14:setTop(65);
    obj.label14:setHeight(25);
    obj.label14:setWidth(40);
    obj.label14:setText("OUT");
    obj.label14:setName("label14");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj);
    obj.edit13:setLeft(275);
    obj.edit13:setTop(65);
    obj.edit13:setHeight(25);
    obj.edit13:setWidth(30);
    obj.edit13:setField("outros_bonus");
    obj.edit13:setName("edit13");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj);
    obj.label15:setLeft(306);
    obj.label15:setTop(65);
    obj.label15:setHeight(25);
    obj.label15:setWidth(40);
    obj.label15:setText("VAR");
    obj.label15:setName("label15");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj);
    obj.edit14:setLeft(335);
    obj.edit14:setTop(65);
    obj.edit14:setHeight(25);
    obj.edit14:setWidth(30);
    obj.edit14:setField("variante_bonus");
    obj.edit14:setName("edit14");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj);
    obj.label16:setLeft(460);
    obj.label16:setTop(65);
    obj.label16:setHeight(25);
    obj.label16:setWidth(50);
    obj.label16:setText("ORDEM");
    obj.label16:setName("label16");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj);
    obj.edit15:setLeft(510);
    obj.edit15:setTop(65);
    obj.edit15:setHeight(25);
    obj.edit15:setWidth(30);
    obj.edit15:setField("ordem");
    obj.edit15:setType("number");
    obj.edit15:setName("edit15");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj);
    obj.label17:setLeft(5);
    obj.label17:setTop(95);
    obj.label17:setHeight(25);
    obj.label17:setWidth(40);
    obj.label17:setText("DESC");
    obj.label17:setFontSize(12);
    obj.label17:setName("label17");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj);
    obj.edit16:setLeft(35);
    obj.edit16:setTop(95);
    obj.edit16:setHeight(25);
    obj.edit16:setWidth(505);
    obj.edit16:setField("descricao");
    obj.edit16:setName("edit16");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj);
    obj.label18:setLeft(5);
    obj.label18:setTop(125);
    obj.label18:setHeight(25);
    obj.label18:setWidth(40);
    obj.label18:setText("EXTRA");
    obj.label18:setFontSize(10);
    obj.label18:setName("label18");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj);
    obj.edit17:setLeft(35);
    obj.edit17:setTop(125);
    obj.edit17:setHeight(25);
    obj.edit17:setWidth(435);
    obj.edit17:setField("efeito_secundario");
    obj.edit17:setName("edit17");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj);
    obj.label19:setLeft(470);
    obj.label19:setTop(125);
    obj.label19:setHeight(25);
    obj.label19:setWidth(40);
    obj.label19:setText("CHANCE");
    obj.label19:setFontSize(10);
    obj.label19:setName("label19");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj);
    obj.edit18:setLeft(510);
    obj.edit18:setTop(125);
    obj.edit18:setHeight(25);
    obj.edit18:setWidth(30);
    obj.edit18:setField("chance_efeito_secundario");
    obj.edit18:setType("number");
    obj.edit18:setName("edit18");


		local function rolagem_dano()
			if sheet ~=nil then
				local teste = sheet.dados_golpe or "1d1";

				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
				mesaDoPersonagem.activeChat:rolarDados(teste, "Rolagem de Dano de " .. sheet.nome_golpe);
			end;
		end;
	



		local function secundario()
			local chance = tonumber(sheet.chance_efeito_secundario);
			local extra = sheet.efeito_secundario or "";
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);
			local perc = math.random(0, 100);
			if chance ~= nil then
				if chance >= perc then
					mesaDoPersonagem.activeChat:enviarMensagem(extra);
				end;
			end;
		end;
	



		local function pos(rolado)
			local decisivo = tonumber(sheet.crit_golpe) or 20;
			local dado = rolado.ops[1].resultados[1];

			if dado == 1 then
				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
				mesaDoPersonagem.activeChat:rolarDados(teste, "Confirmação de Falha Critica de " .. sheet.nome_golpe);
			elseif dado>= decisivo then
				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
				mesaDoPersonagem.activeChat:rolarDados(teste, "Confirmação de Sucesso Decisivo de " .. sheet.nome_golpe);
				local box = ndb.getRoot(sheet);
				box = box["pkmn_time_" .. box.selected];
				local mult = tonumber(box.crit) or 2;

				secundario();
				rolagem_dano();
				if mult >= 2 then
					rolagem_dano();
				end;
				if mult == 3 then
					rolagem_dano();
				end;
			else
				secundario();
				rolagem_dano();
			end;
		end;
	



		local function dano()
			if sheet~= nil then
				local poder = tonumber(sheet.poder_golpe) or 5;
				local tipo = sheet.tipo_golpe;
				local mult = 1;
				local categoria = tonumber(sheet.categoria_golpe) or 0;
				
				local box = ndb.getRoot(sheet);
				box = box["pkmn_time_" .. box.selected];
				local nv = box.pokemon_nivel or 1;
				local tm = (tonumber(box.tamanho) or 0);

				if box.pokemon_tipo1 == tipo or box.pokemon_tipo2 == tipo then
					local stab = (tonumber(box.stab) or 0) - 1;
					mult = mult + stab;
				end;

				local equip = (tonumber(sheet.equip_bonus) or 0) / 100;
				local habilidade = (tonumber(sheet.habilidade_bonus) or 0) / 100;
				local clima = (tonumber(sheet.clima_bonus) or 0) / 100;
				local time = (tonumber(sheet.time_bonus) or 0) / 100;
				local outros = (tonumber(sheet.outros_bonus) or 0) / 100;
				local variante = (tonumber(sheet.variante_bonus) or 0) / 100;

				mult = mult + equip + habilidade + clima + time + outros + variante;

				poder = poder * mult;
				if categoria == 3 then
					sheet.poder_real_golpe = "";
				else
					sheet.poder_real_golpe = poder;
				end;
				
				poder = math.floor(poder/5);
				local aux = poder;

				local dados = {"1d1", "1d2", "1d3", "1d4", "2d2", "1d6", "2d3", "1d8", "2d4", "1d10", "4d2", "1d12", "2d6", "3d4", "4d3", "2d8", "4d4", "3d6", "2d10", "5d4", "2d12", "3d8", "4d6", "6d4", "3d10", "5d6", "4d8", "3d12", "8d4", "6d6", "4d10", "5d8", "7d6", "10d4", "4d12", "6d8", "5d10", "8d6", "7d8", "5d12", "6d10", "10d6", "8d8", "7d10", "6d12", "9d8", "12d6", "8d10", "10d8", "7d12", "14d6", "9d10", "8d12", "15d6", "12d8", "10d10", "16d6", "9d12", "17d6", "11d10", "14d8", "10d12", "12d10", "19d6", "15d8", "20d6", "11d12", "16d8", "21d6", "17d8", "14d10", "12d12", "23d6", "18d8", "15d10", "24d6", "13d12", "19d8", "25d6", "16d10"};

				local dado = "1";
				
				if categoria==1 then
					dado = (tonumber(box.mod_ataque) or 0) + tm + nv;
				elseif categoria==2 then
					dado = (tonumber(box.mod_ataque_especial) or 0) + tm +nv;
				end;

				while aux>0 do
					if aux > 81 then
						dado = dado .. "+" .. dados[81];
						aux = aux - 81;
					else 
						dado = dado .. "+" .. dados[aux];
						aux = 0;
					end;
				end;

				if categoria==3 then
					dado = "";
				end;

				sheet.dados_golpe = dado;
			end;
		end;
	



		local function acc()
			if sheet~=nil then
				local box = ndb.getRoot(sheet);
				box = box["pkmn_time_" .. box.selected];

				local nv = box.pokemon_nivel or 1;
				local acc = (tonumber(sheet.acc_golpe) or 0);
				local ac = nv * acc / 100;
				ac = math.floor(ac);

				local bonus = 0;
				local categoria = tonumber(sheet.categoria_golpe) or 0;
				if categoria==1 then
					bonus = tonumber(box.acf) or 0;
				elseif categoria==2 then
					bonus = tonumber(box.ace) or 0;
				elseif categoria==3 then
					bonus = tonumber(box.acs) or 0;
				end;

				ac = ac + bonus;		
				sheet.acc_real_golpe = ac;
			end;
		end;
	



		local function pp()
			if sheet~=nil then
				local mult = 1;
				local pp = (tonumber(sheet.pp_golpe) or 0);

				if pp>=30 then
					pp = "-";
				else
					if sheet.ppup1_golpe then
						mult = mult + 0.2;
					end;
					if sheet.ppup2_golpe then
						mult = mult + 0.2;
					end;
					if sheet.ppup3_golpe then
						mult = mult + 0.2;
					end;

					pp = pp * mult / 5;
					local round = math.floor(pp) + 0.5;
					if pp>=round then
						pp = math.floor(pp) + 1;
					else
						pp = math.floor(pp);
					end;
				end;
				sheet.ppreal_golpe = pp;
			end;
		end;
	


    obj._e_event0 = obj.comboBox2:addEventListener("onChange",
        function (self)
            acc();
            			dano();
        end, obj);

    obj._e_event1 = obj.edit2:addEventListener("onChange",
        function (self)
            pp();
        end, obj);

    obj._e_event2 = obj.checkBox1:addEventListener("onChange",
        function (self)
            pp();
        end, obj);

    obj._e_event3 = obj.checkBox2:addEventListener("onChange",
        function (self)
            pp();
        end, obj);

    obj._e_event4 = obj.checkBox3:addEventListener("onChange",
        function (self)
            pp();
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar esse golpe?",
            				function (confirmado)
            					if confirmado then
            						ndb.deleteNode(sheet);
            					end;
            				end);
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (self)
            acc();
            			if sheet ~=nil then
            				local gastos = tonumber(sheet.ppusado_golpe);
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            				local prioridade = tonumber(sheet.prioridade_golpe) or 0;
            				local prio = "";
            				if prioridade ~= 0 then
            					prio = " (Prioridade: " .. prioridade .. ").";
            				end;
            
            				if gastos ~= nil then
            					if gastos <= 0 then
            						mesaDoPersonagem.activeChat:enviarMensagem("Sem PP!");
            						return;
            					end;
            					gastos = gastos - 1;
            					sheet.ppusado_golpe = gastos;
            				end;
            
            				teste = sheet.acc_real_golpe or "";
            				teste = "1d20+" .. teste;
            				
            				mesaDoPersonagem.activeChat:rolarDados(teste, "Teste de Acerto de " .. sheet.nome_golpe .. prio, 
            					function (rolado)
            						pos(rolado);
            					end);
            			end;
        end, obj);

    obj._e_event7 = obj.edit4:addEventListener("onChange",
        function (self)
            acc();
        end, obj);

    obj._e_event8 = obj.button3:addEventListener("onClick",
        function (self)
            dano();
            			rolagem_dano();
        end, obj);

    obj._e_event9 = obj.edit5:addEventListener("onChange",
        function (self)
            dano();
        end, obj);

    obj._e_event10 = obj.button4:addEventListener("onClick",
        function (self)
            if sheet~= nil then
            				local nome = sheet.nome_golpe or "";
            				nome = nome:gsub("%s+", "");
            				nome = nome:lower();
            				url = "http://www.serebii.net/attackdex-xy/" .. nome .. ".shtml";
            				gui.openInBrowser(url);
            			end;
        end, obj);

    obj._e_event11 = obj.edit9:addEventListener("onChange",
        function (self)
            dano();
        end, obj);

    obj._e_event12 = obj.edit10:addEventListener("onChange",
        function (self)
            dano();
        end, obj);

    obj._e_event13 = obj.edit11:addEventListener("onChange",
        function (self)
            dano();
        end, obj);

    obj._e_event14 = obj.edit12:addEventListener("onChange",
        function (self)
            dano();
        end, obj);

    obj._e_event15 = obj.edit13:addEventListener("onChange",
        function (self)
            dano();
        end, obj);

    obj._e_event16 = obj.edit14:addEventListener("onChange",
        function (self)
            dano();
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmPKMN3MOVE = {
    newEditor = newfrmPKMN3MOVE, 
    new = newfrmPKMN3MOVE, 
    name = "frmPKMN3MOVE", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPKMN3MOVE = _frmPKMN3MOVE;
rrpg.registrarForm(_frmPKMN3MOVE);

return _frmPKMN3MOVE;
