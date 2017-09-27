require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSSF3()
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
    obj:setName("frmSSF3");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(210);
    obj.layout1:setHeight(615);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(210);
    obj.label1:setHeight(20);
    obj.label1:setText("TECNICAS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(185);
    obj.button1:setTop(5);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(5);
    obj.rectangle2:setTop(30);
    obj.rectangle2:setWidth(200);
    obj.rectangle2:setHeight(580);
    obj.rectangle2:setColor("#101010");
    obj.rectangle2:setName("rectangle2");

    obj.rclListaDasTecnicas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasTecnicas:setParent(obj.layout1);
    obj.rclListaDasTecnicas:setName("rclListaDasTecnicas");
    obj.rclListaDasTecnicas:setField("listaTecnicas");
    obj.rclListaDasTecnicas:setTemplateForm("frmSSF3_1");
    obj.rclListaDasTecnicas:setLeft(5);
    obj.rclListaDasTecnicas:setTop(30);
    obj.rclListaDasTecnicas:setWidth(200);
    obj.rclListaDasTecnicas:setHeight(580);
    obj.rclListaDasTecnicas:setSelectable(true);
    obj.rclListaDasTecnicas:setLayout("vertical");
    obj.rclListaDasTecnicas:setMinQt(1);

    obj.boxDetalhesDasTecnicas = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDasTecnicas:setParent(obj.scrollBox1);
    obj.boxDetalhesDasTecnicas:setName("boxDetalhesDasTecnicas");
    obj.boxDetalhesDasTecnicas:setVisible(false);
    obj.boxDetalhesDasTecnicas:setLeft(220);
    obj.boxDetalhesDasTecnicas:setTop(0);
    obj.boxDetalhesDasTecnicas:setWidth(400);
    obj.boxDetalhesDasTecnicas:setHeight(615);

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.boxDetalhesDasTecnicas);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(15);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");


				local function custoTecnica()
					if sheet~=nil then
						local mod = 0;
						local node = self.boxDetalhesDasTecnicas.node;
						if node ~= nil then
							local nodes = ndb.getChildNodes(node.listaDosEfeitosPositivos); 
							
							for i=1, #nodes, 1 do
								mod = mod + (tonumber(nodes[i].custo_efeito_positivo) or 0);
							end
							nodes = ndb.getChildNodes(node.listaDosEfeitosNegativos);   
							for i=1, #nodes, 1 do
								mod = mod - (tonumber(nodes[i].custo_efeito_negativo) or 0);
							end
							mod = mod + (tonumber(node.tipo_tecnica) or 0);
							node.custo_tecnica = mod;
						end;

						mod = 0;
						nodes = ndb.getChildNodes(sheet.listaTecnicas);   
						for i=1, #nodes, 1 do
							mod = mod + (tonumber(nodes[i].custo_tecnica) or 0);
						end
						sheet.xp_tecnicas = mod;

					end
				end;
			


    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.boxDetalhesDasTecnicas);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(5);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(5);
    obj.label2:setTop(5);
    obj.label2:setWidth(50);
    obj.label2:setHeight(20);
    obj.label2:setText("Nome");
    obj.label2:setName("label2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(55);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(140);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome_tecnica");
    obj.edit1:setName("edit1");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.boxDetalhesDasTecnicas);
    obj.layout3:setLeft(200);
    obj.layout3:setTop(5);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(5);
    obj.label3:setTop(5);
    obj.label3:setWidth(50);
    obj.label3:setHeight(20);
    obj.label3:setText("Nível");
    obj.label3:setName("label3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(55);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(140);
    obj.edit2:setHeight(25);
    obj.edit2:setField("nivel_tecnica");
    obj.edit2:setName("edit2");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.boxDetalhesDasTecnicas);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(30);
    obj.layout4:setWidth(200);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setLeft(5);
    obj.label4:setTop(5);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setText("Custo");
    obj.label4:setName("label4");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setLeft(55);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(140);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setLeft(55);
    obj.label5:setTop(3);
    obj.label5:setWidth(140);
    obj.label5:setHeight(20);
    obj.label5:setField("custo_tecnica");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.boxDetalhesDasTecnicas);
    obj.layout5:setLeft(200);
    obj.layout5:setTop(30);
    obj.layout5:setWidth(200);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout5);
    obj.label6:setLeft(5);
    obj.label6:setTop(5);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setText("Fadiga");
    obj.label6:setName("label6");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setLeft(55);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(140);
    obj.edit3:setHeight(25);
    obj.edit3:setField("fadiga_tecnica");
    obj.edit3:setName("edit3");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.boxDetalhesDasTecnicas);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(55);
    obj.layout6:setWidth(200);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout6);
    obj.button2:setLeft(5);
    obj.button2:setTop(2);
    obj.button2:setWidth(50);
    obj.button2:setHeight(20);
    obj.button2:setText("Dados");
    obj.button2:setName("button2");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setLeft(55);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(140);
    obj.edit4:setHeight(25);
    obj.edit4:setField("dados_tecnica");
    obj.edit4:setName("edit4");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.boxDetalhesDasTecnicas);
    obj.layout7:setLeft(200);
    obj.layout7:setTop(55);
    obj.layout7:setWidth(200);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setLeft(5);
    obj.label7:setTop(5);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("Tipo");
    obj.label7:setName("label7");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout7);
    obj.comboBox1:setLeft(55);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(140);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("tipo_tecnica");
    obj.comboBox1:setItems({'Ofensiva', 'Defensiva', 'Avançada'});
    obj.comboBox1:setValues({'0', '75', '100'});
    obj.comboBox1:setName("comboBox1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout7);
    obj.dataLink1:setField("tipo_tecnica");
    obj.dataLink1:setName("dataLink1");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.boxDetalhesDasTecnicas);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(80);
    obj.textEditor1:setWidth(390);
    obj.textEditor1:setHeight(210);
    obj.textEditor1:setField("descricao_tecnica");
    obj.textEditor1:setName("textEditor1");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.boxDetalhesDasTecnicas);
    obj.button3:setLeft(160);
    obj.button3:setTop(295);
    obj.button3:setWidth(80);
    obj.button3:setHeight(20);
    obj.button3:setText("EFEITOS");
    obj.button3:setName("button3");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.boxDetalhesDasTecnicas);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(315);
    obj.layout8:setWidth(190);
    obj.layout8:setHeight(295);
    obj.layout8:setName("layout8");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setLeft(0);
    obj.label8:setTop(5);
    obj.label8:setWidth(190);
    obj.label8:setHeight(20);
    obj.label8:setText("POSITIVOS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout8);
    obj.button4:setText("+");
    obj.button4:setLeft(165);
    obj.button4:setTop(5);
    obj.button4:setWidth(20);
    obj.button4:setHeight(20);
    obj.button4:setName("button4");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout8);
    obj.label9:setLeft(25);
    obj.label9:setTop(30);
    obj.label9:setWidth(190);
    obj.label9:setHeight(20);
    obj.label9:setText("  E    Nome               Custo");
    obj.label9:setName("label9");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout8);
    obj.rectangle5:setLeft(0);
    obj.rectangle5:setTop(50);
    obj.rectangle5:setWidth(190);
    obj.rectangle5:setHeight(245);
    obj.rectangle5:setColor("#101010");
    obj.rectangle5:setName("rectangle5");

    obj.rclListaDosEfeitosPositivos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEfeitosPositivos:setParent(obj.layout8);
    obj.rclListaDosEfeitosPositivos:setName("rclListaDosEfeitosPositivos");
    obj.rclListaDosEfeitosPositivos:setField("listaDosEfeitosPositivos");
    obj.rclListaDosEfeitosPositivos:setTemplateForm("frmSSF3_2");
    obj.rclListaDosEfeitosPositivos:setLeft(0);
    obj.rclListaDosEfeitosPositivos:setTop(50);
    obj.rclListaDosEfeitosPositivos:setWidth(190);
    obj.rclListaDosEfeitosPositivos:setHeight(245);
    obj.rclListaDosEfeitosPositivos:setLayout("vertical");
    obj.rclListaDosEfeitosPositivos:setMinQt(1);
    obj.rclListaDosEfeitosPositivos:setSelectable(true);

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.boxDetalhesDasTecnicas);
    obj.layout9:setLeft(205);
    obj.layout9:setTop(315);
    obj.layout9:setWidth(190);
    obj.layout9:setHeight(295);
    obj.layout9:setName("layout9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout9);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(190);
    obj.label10:setHeight(20);
    obj.label10:setText("NEGATIVOS");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout9);
    obj.button5:setText("+");
    obj.button5:setLeft(165);
    obj.button5:setTop(5);
    obj.button5:setWidth(20);
    obj.button5:setHeight(20);
    obj.button5:setName("button5");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout9);
    obj.label11:setLeft(25);
    obj.label11:setTop(30);
    obj.label11:setWidth(190);
    obj.label11:setHeight(20);
    obj.label11:setText("  E    Nome               Custo");
    obj.label11:setName("label11");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout9);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(50);
    obj.rectangle6:setWidth(190);
    obj.rectangle6:setHeight(245);
    obj.rectangle6:setColor("#101010");
    obj.rectangle6:setName("rectangle6");

    obj.rclListaDosEfeitosNegativos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosEfeitosNegativos:setParent(obj.layout9);
    obj.rclListaDosEfeitosNegativos:setName("rclListaDosEfeitosNegativos");
    obj.rclListaDosEfeitosNegativos:setField("listaDosEfeitosNegativos");
    obj.rclListaDosEfeitosNegativos:setTemplateForm("frmSSF3_3");
    obj.rclListaDosEfeitosNegativos:setLeft(0);
    obj.rclListaDosEfeitosNegativos:setTop(50);
    obj.rclListaDosEfeitosNegativos:setWidth(190);
    obj.rclListaDosEfeitosNegativos:setHeight(245);
    obj.rclListaDosEfeitosNegativos:setLayout("vertical");
    obj.rclListaDosEfeitosNegativos:setMinQt(1);

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox1);
    obj.rectangle7:setLeft(630);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(300);
    obj.rectangle7:setHeight(300);
    obj.rectangle7:setColor("DimGray");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("innerLine");
    obj.rectangle7:setName("rectangle7");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setLeft(630);
    obj.image1:setTop(0);
    obj.image1:setWidth(300);
    obj.image1:setHeight(300);
    obj.image1:setField("avatar_armadura");
    obj.image1:setEditable(true);
    obj.image1:setStyle("stretch");
    obj.image1:setName("image1");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setLeft(630);
    obj.layout10:setTop(310);
    obj.layout10:setWidth(300);
    obj.layout10:setHeight(300);
    obj.layout10:setName("layout10");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout10);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(15);
    obj.rectangle8:setYradius(15);
    obj.rectangle8:setCornerType("round");
    obj.rectangle8:setName("rectangle8");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout10);
    obj.label12:setLeft(0);
    obj.label12:setTop(5);
    obj.label12:setWidth(300);
    obj.label12:setHeight(20);
    obj.label12:setText("CONDIÇÃO");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout10);
    obj.label13:setLeft(0);
    obj.label13:setTop(30);
    obj.label13:setWidth(300);
    obj.label13:setHeight(20);
    obj.label13:setText("          TIPO                       MODIFICADORES");
    obj.label13:setName("label13");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout10);
    obj.comboBox2:setLeft(5);
    obj.comboBox2:setTop(55);
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("tipo_armadura");
    obj.comboBox2:setItems({'Bronze', 'Prata', 'Ouro'});
    obj.comboBox2:setValues({'1', '2', '3'});
    obj.comboBox2:setName("comboBox2");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout10);
    obj.dataLink2:setField("tipo_armadura");
    obj.dataLink2:setName("dataLink2");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout10);
    obj.rectangle9:setLeft(5);
    obj.rectangle9:setTop(80);
    obj.rectangle9:setWidth(100);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout10);
    obj.label14:setLeft(5);
    obj.label14:setTop(80);
    obj.label14:setWidth(100);
    obj.label14:setHeight(20);
    obj.label14:setField("dano_armadura6");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout10);
    obj.rectangle10:setLeft(5);
    obj.rectangle10:setTop(110);
    obj.rectangle10:setWidth(100);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout10);
    obj.label15:setLeft(5);
    obj.label15:setTop(110);
    obj.label15:setWidth(100);
    obj.label15:setHeight(20);
    obj.label15:setField("dano_armadura5");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout10);
    obj.rectangle11:setLeft(5);
    obj.rectangle11:setTop(140);
    obj.rectangle11:setWidth(100);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout10);
    obj.label16:setLeft(5);
    obj.label16:setTop(140);
    obj.label16:setWidth(100);
    obj.label16:setHeight(20);
    obj.label16:setField("dano_armadura4");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout10);
    obj.rectangle12:setLeft(5);
    obj.rectangle12:setTop(170);
    obj.rectangle12:setWidth(100);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout10);
    obj.label17:setLeft(5);
    obj.label17:setTop(170);
    obj.label17:setWidth(100);
    obj.label17:setHeight(20);
    obj.label17:setField("dano_armadura3");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout10);
    obj.rectangle13:setLeft(5);
    obj.rectangle13:setTop(200);
    obj.rectangle13:setWidth(100);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout10);
    obj.label18:setLeft(5);
    obj.label18:setTop(200);
    obj.label18:setWidth(100);
    obj.label18:setHeight(20);
    obj.label18:setField("dano_armadura2");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout10);
    obj.rectangle14:setLeft(5);
    obj.rectangle14:setTop(230);
    obj.rectangle14:setWidth(100);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout10);
    obj.label19:setLeft(5);
    obj.label19:setTop(230);
    obj.label19:setWidth(100);
    obj.label19:setHeight(20);
    obj.label19:setField("dano_armadura1");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout10);
    obj.rectangle15:setLeft(110);
    obj.rectangle15:setTop(80);
    obj.rectangle15:setWidth(185);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout10);
    obj.label20:setLeft(110);
    obj.label20:setTop(80);
    obj.label20:setWidth(185);
    obj.label20:setHeight(20);
    obj.label20:setText("Morta");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout10);
    obj.rectangle16:setLeft(110);
    obj.rectangle16:setTop(110);
    obj.rectangle16:setWidth(185);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout10);
    obj.label21:setLeft(110);
    obj.label21:setTop(110);
    obj.label21:setWidth(185);
    obj.label21:setHeight(20);
    obj.label21:setText("Cosmo e Energização -100%");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout10);
    obj.rectangle17:setLeft(110);
    obj.rectangle17:setTop(140);
    obj.rectangle17:setWidth(185);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout10);
    obj.label22:setLeft(110);
    obj.label22:setTop(140);
    obj.label22:setWidth(185);
    obj.label22:setHeight(20);
    obj.label22:setText("RD básica -50%, HT-8");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout10);
    obj.rectangle18:setLeft(110);
    obj.rectangle18:setTop(170);
    obj.rectangle18:setWidth(185);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout10);
    obj.label23:setLeft(110);
    obj.label23:setTop(170);
    obj.label23:setWidth(185);
    obj.label23:setHeight(20);
    obj.label23:setText("Cosmo e Energização -50%");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout10);
    obj.rectangle19:setLeft(110);
    obj.rectangle19:setTop(200);
    obj.rectangle19:setWidth(185);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout10);
    obj.label24:setLeft(110);
    obj.label24:setTop(200);
    obj.label24:setWidth(185);
    obj.label24:setHeight(20);
    obj.label24:setText("RD ablativa -50%, HT-4");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout10);
    obj.rectangle20:setLeft(110);
    obj.rectangle20:setTop(230);
    obj.rectangle20:setWidth(185);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout10);
    obj.label25:setLeft(110);
    obj.label25:setTop(230);
    obj.label25:setWidth(185);
    obj.label25:setHeight(20);
    obj.label25:setText("Nenhum");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout10);
    obj.checkBox1:setLeft(10);
    obj.checkBox1:setTop(255);
    obj.checkBox1:setText("Equipada");
    obj.checkBox1:setField("armadura_equipada");
    obj.checkBox1:setName("checkBox1");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setLeft(940);
    obj.layout11:setTop(0);
    obj.layout11:setWidth(200);
    obj.layout11:setHeight(135);
    obj.layout11:setName("layout11");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout11);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("black");
    obj.rectangle21:setXradius(15);
    obj.rectangle21:setYradius(15);
    obj.rectangle21:setCornerType("round");
    obj.rectangle21:setName("rectangle21");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(5);
    obj.layout12:setWidth(190);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout12);
    obj.label26:setLeft(5);
    obj.label26:setTop(5);
    obj.label26:setWidth(50);
    obj.label26:setHeight(20);
    obj.label26:setText("Nome");
    obj.label26:setName("label26");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout12);
    obj.edit5:setLeft(55);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(140);
    obj.edit5:setHeight(25);
    obj.edit5:setField("nome_armadura");
    obj.edit5:setName("edit5");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(30);
    obj.layout13:setWidth(190);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout13);
    obj.label27:setLeft(5);
    obj.label27:setTop(5);
    obj.label27:setWidth(60);
    obj.label27:setHeight(20);
    obj.label27:setText("RD Bas.");
    obj.label27:setName("label27");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout13);
    obj.edit6:setLeft(55);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(70);
    obj.edit6:setHeight(25);
    obj.edit6:setField("rdb_armadura");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout13);
    obj.edit7:setLeft(125);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(70);
    obj.edit7:setHeight(25);
    obj.edit7:setField("rdb_armadura_atual");
    obj.edit7:setName("edit7");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(55);
    obj.layout14:setWidth(190);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout14);
    obj.label28:setLeft(5);
    obj.label28:setTop(5);
    obj.label28:setWidth(60);
    obj.label28:setHeight(20);
    obj.label28:setText("RD Abl.");
    obj.label28:setName("label28");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout14);
    obj.edit8:setLeft(55);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(70);
    obj.edit8:setHeight(25);
    obj.edit8:setField("rda_armadura");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout14);
    obj.edit9:setLeft(125);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(70);
    obj.edit9:setHeight(25);
    obj.edit9:setField("rda_armadura_atual");
    obj.edit9:setName("edit9");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(80);
    obj.layout15:setWidth(190);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout15);
    obj.label29:setLeft(5);
    obj.label29:setTop(5);
    obj.label29:setWidth(50);
    obj.label29:setHeight(20);
    obj.label29:setText("HT");
    obj.label29:setName("label29");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout15);
    obj.edit10:setLeft(55);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(70);
    obj.edit10:setHeight(25);
    obj.edit10:setField("ht_armadura");
    obj.edit10:setName("edit10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout15);
    obj.edit11:setLeft(125);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(70);
    obj.edit11:setHeight(25);
    obj.edit11:setField("ht_armadura_atual");
    obj.edit11:setName("edit11");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout11);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(105);
    obj.layout16:setWidth(190);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout16);
    obj.label30:setLeft(5);
    obj.label30:setTop(5);
    obj.label30:setWidth(50);
    obj.label30:setHeight(20);
    obj.label30:setText("PV");
    obj.label30:setName("label30");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout16);
    obj.edit12:setLeft(55);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(70);
    obj.edit12:setHeight(25);
    obj.edit12:setField("pv_armadura");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout16);
    obj.edit13:setLeft(125);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(70);
    obj.edit13:setHeight(25);
    obj.edit13:setField("pv_armadura_atual");
    obj.edit13:setName("edit13");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.scrollBox1);
    obj.layout17:setLeft(940);
    obj.layout17:setTop(145);
    obj.layout17:setWidth(350);
    obj.layout17:setHeight(435);
    obj.layout17:setName("layout17");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout17);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("black");
    obj.rectangle22:setXradius(15);
    obj.rectangle22:setYradius(15);
    obj.rectangle22:setCornerType("round");
    obj.rectangle22:setName("rectangle22");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout17);
    obj.label31:setLeft(0);
    obj.label31:setTop(5);
    obj.label31:setWidth(350);
    obj.label31:setHeight(20);
    obj.label31:setText("ATAQUES COMUNS");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout17);
    obj.button6:setText("+");
    obj.button6:setLeft(325);
    obj.button6:setTop(5);
    obj.button6:setWidth(20);
    obj.button6:setHeight(20);
    obj.button6:setName("button6");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout17);
    obj.rectangle23:setLeft(5);
    obj.rectangle23:setTop(30);
    obj.rectangle23:setWidth(340);
    obj.rectangle23:setHeight(400);
    obj.rectangle23:setColor("#101010");
    obj.rectangle23:setName("rectangle23");

    obj.rclListaDasArmas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasArmas:setParent(obj.layout17);
    obj.rclListaDasArmas:setName("rclListaDasArmas");
    obj.rclListaDasArmas:setField("listaDasArmas");
    obj.rclListaDasArmas:setTemplateForm("frmSSF3_4");
    obj.rclListaDasArmas:setLeft(5);
    obj.rclListaDasArmas:setTop(30);
    obj.rclListaDasArmas:setWidth(340);
    obj.rclListaDasArmas:setHeight(400);
    obj.rclListaDasArmas:setLayout("vertical");
    obj.rclListaDasArmas:setMinQt(1);

    obj.image2 = gui.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.scrollBox1);
    obj.image2:setLeft(0);
    obj.image2:setTop(0);
    obj.image2:setWidth(1335);
    obj.image2:setHeight(615);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20SSF%20releases/imagens/ABA0.png");
    obj.image2:setName("image2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaDasTecnicas:append();
            					custoTecnica();
        end, obj);

    obj._e_event1 = obj.rclListaDasTecnicas:addEventListener("onSelect",
        function (self)
            local node = self.rclListaDasTecnicas.selectedNode;
            					self.boxDetalhesDasTecnicas.node = node;
            					self.boxDetalhesDasTecnicas.visible = (node ~= nil);
            					custoTecnica();
        end, obj);

    obj._e_event2 = obj.rclListaDasTecnicas:addEventListener("onEndEnumeration",
        function (self)
            if self.rclListaDasTecnicas.selectedNode == nil and sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.listaTecnicas);               
            						if #nodes > 0 then
            							self.rclListaDasTecnicas.selectedNode = nodes[1];
            						end;
            					end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					
            						rolagem = rrpg.interpretarRolagem(self.boxDetalhesDasTecnicas.node.dados_tecnica);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Tecnica " .. (self.boxDetalhesDasTecnicas.node.nome_tecnica or 0),
            							function (rolagem)
            								if sheet~=nil then
            									local maximo = 0;
            									local media = 0;
            									local minimo = 0;
            									local efetividade = 0;
            									local resultado = rolagem.resultado;
            									local color = 1;
            
            									for i = 1, #rolagem.ops, 1 do 
            										local operacao = rolagem.ops[i]; 
            										if operacao.tipo == "dado" then   
            											maximo = maximo + (operacao.quantidade * operacao.face);
            											media = media + (operacao.quantidade * (operacao.face+1)/2);
            											minimo = minimo + operacao.quantidade;
            										elseif operacao.tipo == "imediato" then
            											maximo = maximo + operacao.valor;
            											media = media + operacao.valor;
            											minimo = minimo + operacao.valor;
            										end;
            									end;
            
            									efetividade = math.floor( (resultado-minimo)/(maximo-minimo) * 100);
            									if efetividade < 20 then
            										color = 4;
            									elseif efetividade < 40 then
            										color = 7;
            									elseif efetividade < 60 then
            										color = 8;
            									elseif efetividade < 80 then
            										color = 12;
            									else
            										color = 9;
            									end;
            
            									local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            									if self.boxDetalhesDasTecnicas.node.tipo_tecnica == "75" then
            										mesaDoPersonagem.activeChat:enviarMensagem("[§K" .. color .. "]A defesa atingiu " .. efetividade .. "% de seu poder total!");
            									else 
            										mesaDoPersonagem.activeChat:enviarMensagem("[§K" .. color .. "]O golpe atingiu " .. efetividade .. "% de seu poder total!");
            									end;
            
            									
            								end;
            
            							end);
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            							custoTecnica();
            						end;
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            						local mod = "[§K1]Efeitos: [§K12]";
            						local node = self.boxDetalhesDasTecnicas.node;
            						local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            						if node ~= nil then
            							local nodes = ndb.getChildNodes(node.listaDosEfeitosPositivos); 
            							for i=1, #nodes, 1 do
            								if nodes[i].show_efeito_positivo then
            									mod = mod .. "[" .. (nodes[i].nome_efeito_positivo) .. "] ";
            								end;
            							end
            
            							mod = mod .. "[§K4]";
            
            							nodes = ndb.getChildNodes(node.listaDosEfeitosNegativos);   
            							for i=1, #nodes, 1 do
            								if nodes[i].show_efeito_negativo then
            									mod = mod .. "[" .. (nodes[i].nome_efeito_negativo) .. "] ";
            								end;
            							end
            						end;
            
            						mesaDoPersonagem.activeChat:enviarMensagem(mod);
            					end;
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (self)
            self.rclListaDosEfeitosPositivos:append();
            						custoTecnica();
        end, obj);

    obj._e_event7 = obj.rclListaDosEfeitosPositivos:addEventListener("onSelect",
        function (self)
            if sheet~=nil then
            							custoTecnica();
            						end;
        end, obj);

    obj._e_event8 = obj.button5:addEventListener("onClick",
        function (self)
            self.rclListaDosEfeitosNegativos:append();
            						custoTecnica();
        end, obj);

    obj._e_event9 = obj.rclListaDosEfeitosNegativos:addEventListener("onSelect",
        function (self)
            if sheet~=nil then
            							custoTecnica();
            						end;
        end, obj);

    obj._e_event10 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
            						if sheet.tipo_armadura == "1" then
            							sheet.dano_armadura6 = "1.000";
            							sheet.dano_armadura5 = "801-999";
            							sheet.dano_armadura4 = "601-800";
            							sheet.dano_armadura3 = "401-600";
            							sheet.dano_armadura2 = "201-400";
            							sheet.dano_armadura1 = "0-200";
            						elseif sheet.tipo_armadura == "2" then
            							sheet.dano_armadura6 = "2.000";
            							sheet.dano_armadura5 = "1.601-1.999";
            							sheet.dano_armadura4 = "1.201-1.600";
            							sheet.dano_armadura3 = "801-1.200";
            							sheet.dano_armadura2 = "401-800";
            							sheet.dano_armadura1 = "0-400";
            						elseif sheet.tipo_armadura == "3" then
            							sheet.dano_armadura6 = "5.000";
            							sheet.dano_armadura5 = "4.001-4.999";
            							sheet.dano_armadura4 = "3.001-4.000";
            							sheet.dano_armadura3 = "2.001-3.000";
            							sheet.dano_armadura2 = "1.001-2.000";
            							sheet.dano_armadura1 = "0-1.000";
            						end
            					end;
        end, obj);

    obj._e_event11 = obj.button6:addEventListener("onClick",
        function (self)
            self.rclListaDasArmas:append();
        end, obj);

    function obj:_releaseEvents()
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

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.rclListaDasArmas ~= nil then self.rclListaDasArmas:destroy(); self.rclListaDasArmas = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.boxDetalhesDasTecnicas ~= nil then self.boxDetalhesDasTecnicas:destroy(); self.boxDetalhesDasTecnicas = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rclListaDasTecnicas ~= nil then self.rclListaDasTecnicas:destroy(); self.rclListaDasTecnicas = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.rclListaDosEfeitosNegativos ~= nil then self.rclListaDosEfeitosNegativos:destroy(); self.rclListaDosEfeitosNegativos = nil; end;
        if self.rclListaDosEfeitosPositivos ~= nil then self.rclListaDosEfeitosPositivos:destroy(); self.rclListaDosEfeitosPositivos = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSSF3 = {
    newEditor = newfrmSSF3, 
    new = newfrmSSF3, 
    name = "frmSSF3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSSF3 = _frmSSF3;
rrpg.registrarForm(_frmSSF3);

return _frmSSF3;
