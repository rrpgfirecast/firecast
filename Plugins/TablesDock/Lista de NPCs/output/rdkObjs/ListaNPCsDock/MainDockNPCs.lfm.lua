require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newListade_NPC_Dock()
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
    obj:setName("Listade_NPC_Dock");
    obj:setFormType("tablesDock");
    obj:setDataType("Lista.de.NPC");
    obj:setTitle("Lista de NPCs");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("CorIndex");
    obj.dataLink1:setDefaultValue("0");
    obj.dataLink1:setName("dataLink1");


		function getOrganizacao()
			return self.dcsMain.scopeNode.TipoOrganizar;
		end;
		
		function MudarNomeDaAba(nome)
			sheet.opcaoEscolhida = nome;
		end;

		function self:autoCalcular()
			local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
			self.dropDownFalso:show(bottomCenter, self.comboBoxFalsa);
			self.dropDownFalso.top = self.dropDownFalso.top + self.comboBoxFalsa.height;
			
			self.dropDownFalso.height = 8 + (24 * #nodes)			 
		end;
		
		function autoFechar()
			self.dropDownFalso:close();
		end;
		
		function safeNodeDeletion(node)
			nodes = ndb.getChildNodes(sheet.opcoesFalsas);
			setTimeout(function()
				if node == self.dcsMain.scopeNode then
					self.opcoesFalsas.selectedNode = nodes[1];
				end;
			end, 10)
			ndb.deleteNode(node);
			self:autoCalcular();
			self.dropDownFalso:close();
		end;
		
		function GetBarrinhaNome(id)
			if sheet ~= nil then
				if id == 1 then
					return (sheet.NomeBarrinha1 or "Barrinha 1");
				elseif id == 2 then
					return (sheet.NomeBarrinha2 or "Barrinha 2");
				elseif id == 3 then
					return (sheet.NomeBarrinha3 or "Barrinha 3");
				elseif id == 4 then
					return (sheet.NomeBarrinha4 or "Barrinha 4");
				end;
			end;
		end;
		
		function GetBarrinhaVisivel(blockoverlay, id)
			if sheet ~= nil then
				if not blockoverlay then
					if id == 1 then
						return (sheet.VisibBarrinha1 == "a");
					elseif id == 2 then
						return (sheet.VisibBarrinha2 == "a");
					elseif id == 3 then
						return (sheet.VisibBarrinha3 == "a");
					elseif id == 4 then
						return (sheet.VisibBarrinha4 == "a");
					end;
				else
					return DonoMestre();
				end;
			end;
		end;
		
		function GetBarrinhaNumeros(id)
			if sheet ~= nil then
				if id == 1 then
					return (sheet.NumerosBarrinha1 == "x");
				elseif id == 2 then
					return (sheet.NumerosBarrinha2 == "x");
				elseif id == 3 then
					return (sheet.NumerosBarrinha3 == "x");
				elseif id == 4 then
					return (sheet.NumerosBarrinha4 == "x");
				end;
			end;
		end;
		
		function GetEnviarChat()
			if sheet ~= nil then
				return sheet.EnviarNoChat;
			end;
		end;
	


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setVisible(false);
    obj.layout1:setName("layout1");

    obj.Config = gui.fromHandle(_obj_newObject("popupForm"));
    obj.Config:setParent(obj.layout1);
    obj.Config:setTitle("Configuração de Barrinhas");
    obj.Config:setName("Config");
    obj.Config:setWidth(406);
    obj.Config:setHeight(190);

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.Config);
    obj.label1:setAlign("top");
    obj.label1:setHeight(18);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("Configurações de Barrinhas");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("white");
    obj.label1:setName("label1");

    obj.dcsTituloEAbas = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsTituloEAbas:setParent(obj.Config);
    obj.dcsTituloEAbas:setName("dcsTituloEAbas");
    obj.dcsTituloEAbas:setAlign("top");
    obj.dcsTituloEAbas:setHeight(18);
    obj.dcsTituloEAbas:setMargins({top=4});

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.dcsTituloEAbas);
    obj.label2:setLeft(5);
    obj.label2:setFontSize(12);
    obj.label2:setAutoSize(true);
    obj.label2:setText("Título da Aba:");
    obj.label2:setName("label2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.dcsTituloEAbas);
    obj.edit1:setLeft(85);
    obj.edit1:setHeight(18);
    obj.edit1:setFontColor("white");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setFontSize(12);
    obj.edit1:setWidth(108);
    obj.edit1:setField("NomeDaOpcao");
    obj.edit1:setName("edit1");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.dcsTituloEAbas);
    obj.label3:setLeft(210);
    obj.label3:setFontSize(12);
    obj.label3:setAutoSize(true);
    obj.label3:setText("Organização:");
    obj.label3:setMargins({left=12});
    obj.label3:setName("label3");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.dcsTituloEAbas);
    obj.comboBox1:setLeft(292);
    obj.comboBox1:setHeight(18);
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setWidth(108);
    obj.comboBox1:setField("TipoOrganizar");
    obj.comboBox1:setItems({'Alfabética', 'Alinhamento'});
    obj.comboBox1:setValues({'Alfa', 'Alin'});
    obj.comboBox1:setName("comboBox1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.Config);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(18);
    obj.layout2:setMargins({top=4});
    obj.layout2:setName("layout2");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(64);
    obj.layout3:setName("layout3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setAlign("left");
    obj.label4:setFontSize(12);
    obj.label4:setWidth(108);
    obj.label4:setText("Nome da Barrinha");
    obj.label4:setMargins({left=4});
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setAlign("left");
    obj.label5:setFontSize(12);
    obj.label5:setWidth(26);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setText("Cor");
    obj.label5:setMargins({left=4});
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setAlign("left");
    obj.label6:setFontSize(12);
    obj.label6:setWidth(82);
    obj.label6:setText("Visibilidade");
    obj.label6:setMargins({left=4});
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setAlign("left");
    obj.label7:setFontSize(12);
    obj.label7:setWidth(108);
    obj.label7:setText("Tipo de Números");
    obj.label7:setMargins({left=4});
    obj.label7:setName("label7");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.Config);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(18);
    obj.layout4:setMargins({top=4});
    obj.layout4:setName("layout4");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setAlign("left");
    obj.label8:setFontSize(12);
    obj.label8:setText("Barrinha 1:");
    obj.label8:setHorzTextAlign("trailing");
    obj.label8:setWidth(64);
    obj.label8:setName("label8");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setAlign("left");
    obj.edit2:setFontSize(12);
    obj.edit2:setWidth(108);
    obj.edit2:setVertTextAlign("trailing");
    obj.edit2:setField("NomeBarrinha1");
    obj.edit2:setText("Barrinha 1");
    obj.edit2:setMargins({left=4});
    obj.edit2:setName("edit2");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(26);
    obj.layout5:setMargins({left=4});
    obj.layout5:setName("layout5");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout5);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("white");
    obj.rectangle1:setHitTest(true);
    obj.rectangle1:setMargins({left=4, right=4});
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle2:setHitTest(true);
    obj.rectangle2:setName("rectangle2");

    obj.CorBarrinha1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.rectangle2);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("#808080");
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha1:setHitTest(true);

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout4);
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setFontSize(12);
    obj.comboBox2:setWidth(82);
    obj.comboBox2:setText("Visibilidade");
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setVertTextAlign("trailing");
    obj.comboBox2:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox2:setValues({'a', 'b', 'c'});
    obj.comboBox2:setValue("a");
    obj.comboBox2:setField("VisibBarrinha1");
    obj.comboBox2:setMargins({left=4});
    obj.comboBox2:setName("comboBox2");

    obj.comboBox3 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout4);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setFontSize(12);
    obj.comboBox3:setWidth(104);
    obj.comboBox3:setText("Tipo de Números");
    obj.comboBox3:setVertTextAlign("trailing");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setField("NumerosBarrinha1");
    obj.comboBox3:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox3:setValues({'x', 'y'});
    obj.comboBox3:setValue("x");
    obj.comboBox3:setMargins({left=4});
    obj.comboBox3:setName("comboBox3");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout4);
    obj.dataLink2:setField("CorBarrinha1");
    obj.dataLink2:setDefaultValue("#808080");
    obj.dataLink2:setName("dataLink2");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.Config);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(18);
    obj.layout6:setMargins({top=4});
    obj.layout6:setName("layout6");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout6);
    obj.label9:setAlign("left");
    obj.label9:setFontSize(12);
    obj.label9:setText("Barrinha 1:");
    obj.label9:setHorzTextAlign("trailing");
    obj.label9:setWidth(64);
    obj.label9:setName("label9");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout6);
    obj.edit3:setAlign("left");
    obj.edit3:setFontSize(12);
    obj.edit3:setWidth(108);
    obj.edit3:setVertTextAlign("trailing");
    obj.edit3:setField("NomeBarrinha2");
    obj.edit3:setText("Barrinha 2");
    obj.edit3:setMargins({left=4});
    obj.edit3:setName("edit3");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout6);
    obj.layout7:setAlign("left");
    obj.layout7:setWidth(26);
    obj.layout7:setMargins({left=4});
    obj.layout7:setName("layout7");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout7);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("white");
    obj.rectangle3:setHitTest(true);
    obj.rectangle3:setMargins({left=4, right=4});
    obj.rectangle3:setName("rectangle3");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle4:setHitTest(true);
    obj.rectangle4:setName("rectangle4");

    obj.CorBarrinha2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.rectangle4);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("#808080");
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha2:setHitTest(true);

    obj.comboBox4 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout6);
    obj.comboBox4:setAlign("left");
    obj.comboBox4:setFontSize(12);
    obj.comboBox4:setWidth(82);
    obj.comboBox4:setText("Visibilidade");
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setVertTextAlign("trailing");
    obj.comboBox4:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox4:setValues({'a', 'b', 'c'});
    obj.comboBox4:setValue("a");
    obj.comboBox4:setField("VisibBarrinha2");
    obj.comboBox4:setMargins({left=4});
    obj.comboBox4:setName("comboBox4");

    obj.comboBox5 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout6);
    obj.comboBox5:setAlign("left");
    obj.comboBox5:setFontSize(12);
    obj.comboBox5:setWidth(104);
    obj.comboBox5:setText("Tipo de Números");
    obj.comboBox5:setVertTextAlign("trailing");
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setField("NumerosBarrinha2");
    obj.comboBox5:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox5:setValues({'x', 'y'});
    obj.comboBox5:setValue("x");
    obj.comboBox5:setMargins({left=4});
    obj.comboBox5:setName("comboBox5");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout6);
    obj.dataLink3:setField("CorBarrinha2");
    obj.dataLink3:setDefaultValue("#808080");
    obj.dataLink3:setName("dataLink3");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.Config);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(18);
    obj.layout8:setMargins({top=4});
    obj.layout8:setName("layout8");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout8);
    obj.label10:setAlign("left");
    obj.label10:setFontSize(12);
    obj.label10:setText("Barrinha 1:");
    obj.label10:setHorzTextAlign("trailing");
    obj.label10:setWidth(64);
    obj.label10:setName("label10");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout8);
    obj.edit4:setAlign("left");
    obj.edit4:setFontSize(12);
    obj.edit4:setWidth(108);
    obj.edit4:setVertTextAlign("trailing");
    obj.edit4:setField("NomeBarrinha3");
    obj.edit4:setText("Barrinha 3");
    obj.edit4:setMargins({left=4});
    obj.edit4:setName("edit4");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout8);
    obj.layout9:setAlign("left");
    obj.layout9:setWidth(26);
    obj.layout9:setMargins({left=4});
    obj.layout9:setName("layout9");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout9);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("white");
    obj.rectangle5:setHitTest(true);
    obj.rectangle5:setMargins({left=4, right=4});
    obj.rectangle5:setName("rectangle5");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle6:setHitTest(true);
    obj.rectangle6:setName("rectangle6");

    obj.CorBarrinha3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.rectangle6);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("#808080");
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha3:setHitTest(true);

    obj.comboBox6 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout8);
    obj.comboBox6:setAlign("left");
    obj.comboBox6:setFontSize(12);
    obj.comboBox6:setWidth(82);
    obj.comboBox6:setText("Visibilidade");
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setVertTextAlign("trailing");
    obj.comboBox6:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox6:setValues({'a', 'b', 'c'});
    obj.comboBox6:setValue("a");
    obj.comboBox6:setField("VisibBarrinha3");
    obj.comboBox6:setMargins({left=4});
    obj.comboBox6:setName("comboBox6");

    obj.comboBox7 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout8);
    obj.comboBox7:setAlign("left");
    obj.comboBox7:setFontSize(12);
    obj.comboBox7:setWidth(104);
    obj.comboBox7:setText("Tipo de Números");
    obj.comboBox7:setVertTextAlign("trailing");
    obj.comboBox7:setFontColor("white");
    obj.comboBox7:setField("NumerosBarrinha3");
    obj.comboBox7:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox7:setValues({'x', 'y'});
    obj.comboBox7:setValue("x");
    obj.comboBox7:setMargins({left=4});
    obj.comboBox7:setName("comboBox7");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout8);
    obj.dataLink4:setField("CorBarrinha3");
    obj.dataLink4:setDefaultValue("#808080");
    obj.dataLink4:setName("dataLink4");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.Config);
    obj.layout10:setAlign("top");
    obj.layout10:setHeight(18);
    obj.layout10:setMargins({top=4});
    obj.layout10:setName("layout10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout10);
    obj.label11:setAlign("left");
    obj.label11:setFontSize(12);
    obj.label11:setText("Barrinha 1:");
    obj.label11:setHorzTextAlign("trailing");
    obj.label11:setWidth(64);
    obj.label11:setName("label11");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout10);
    obj.edit5:setAlign("left");
    obj.edit5:setFontSize(12);
    obj.edit5:setWidth(108);
    obj.edit5:setVertTextAlign("trailing");
    obj.edit5:setField("NomeBarrinha4");
    obj.edit5:setText("Barrinha 4");
    obj.edit5:setMargins({left=4});
    obj.edit5:setName("edit5");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout10);
    obj.layout11:setAlign("left");
    obj.layout11:setWidth(26);
    obj.layout11:setMargins({left=4});
    obj.layout11:setName("layout11");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout11);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("white");
    obj.rectangle7:setHitTest(true);
    obj.rectangle7:setMargins({left=4, right=4});
    obj.rectangle7:setName("rectangle7");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.rectangle7);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle8:setHitTest(true);
    obj.rectangle8:setName("rectangle8");

    obj.CorBarrinha4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha4:setParent(obj.rectangle8);
    obj.CorBarrinha4:setName("CorBarrinha4");
    obj.CorBarrinha4:setColor("#808080");
    obj.CorBarrinha4:setAlign("client");
    obj.CorBarrinha4:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha4:setHitTest(true);

    obj.comboBox8 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout10);
    obj.comboBox8:setAlign("left");
    obj.comboBox8:setFontSize(12);
    obj.comboBox8:setWidth(82);
    obj.comboBox8:setText("Visibilidade");
    obj.comboBox8:setFontColor("white");
    obj.comboBox8:setVertTextAlign("trailing");
    obj.comboBox8:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox8:setValues({'a', 'b', 'c'});
    obj.comboBox8:setValue("a");
    obj.comboBox8:setField("VisibBarrinha4");
    obj.comboBox8:setMargins({left=4});
    obj.comboBox8:setName("comboBox8");

    obj.comboBox9 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout10);
    obj.comboBox9:setAlign("left");
    obj.comboBox9:setFontSize(12);
    obj.comboBox9:setWidth(104);
    obj.comboBox9:setText("Tipo de Números");
    obj.comboBox9:setVertTextAlign("trailing");
    obj.comboBox9:setFontColor("white");
    obj.comboBox9:setField("NumerosBarrinha4");
    obj.comboBox9:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox9:setValues({'x', 'y'});
    obj.comboBox9:setValue("x");
    obj.comboBox9:setMargins({left=4});
    obj.comboBox9:setName("comboBox9");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout10);
    obj.dataLink5:setField("CorBarrinha4");
    obj.dataLink5:setDefaultValue("#808080");
    obj.dataLink5:setName("dataLink5");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.Config);
    obj.layout12:setAlign("top");
    obj.layout12:setHeight(24);
    obj.layout12:setMargins({top=8});
    obj.layout12:setName("layout12");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout12);
    obj.checkBox1:setMargins({left=4});
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setField("EnviarNoChat");
    obj.checkBox1:setWidth(180);
    obj.checkBox1:setFontSize(12);
    obj.checkBox1:setText("Enviar alterações ao chat");
    obj.checkBox1:setName("checkBox1");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout12);
    obj.dataLink6:setField("EnviarNoChat");
    obj.dataLink6:setDefaultValue("false");
    obj.dataLink6:setName("dataLink6");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout12);
    obj.button1:setAlign("right");
    obj.button1:setWidth(80);
    obj.button1:setText("OK!");
    obj.button1:setMargins({right=8});
    obj.button1:setName("button1");

    obj.SelectCor = gui.fromHandle(_obj_newObject("popup"));
    obj.SelectCor:setParent(obj.Config);
    obj.SelectCor:setName("SelectCor");
    obj.SelectCor:setWidth(192);
    obj.SelectCor:setHeight(100);

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.SelectCor);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(24);
    obj.layout13:setName("layout13");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout13);
    obj.label12:setAlign("client");
    obj.label12:setText("Selecione a Cor:");
    obj.label12:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setName("label12");

    obj.Nha = gui.fromHandle(_obj_newObject("layout"));
    obj.Nha:setParent(obj.SelectCor);
    obj.Nha:setName("Nha");
    obj.Nha:setAlign("client");
    obj.Nha:setMargins({left=10, right=10});
    obj.Nha:setHitTest(true);

    obj.Selected = gui.fromHandle(_obj_newObject("layout"));
    obj.Selected:setParent(obj.Nha);
    obj.Selected:setAlign("none");
    obj.Selected:setName("Selected");
    obj.Selected:setWidth(20);
    obj.Selected:setHeight(20);

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.Selected);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("white");
    obj.rectangle9:setName("rectangle9");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.rectangle9);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle10:setName("rectangle10");

    obj.Flow = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.Flow:setParent(obj.Nha);
    obj.Flow:setName("Flow");
    obj.Flow:setAlign("client");
    obj.Flow:setOrientation("horizontal");
    obj.Flow:setMaxControlsPerLine(8);
    obj.Flow:setHitTest(true);
    obj.Flow:setCanFocus(true);

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.Flow);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(20);
    obj.layout14:setHeight(20);
    obj.layout14:setHitTest(true);
    obj.layout14:setName("layout14");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout14);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle11:setHitTest(true);
    obj.rectangle11:setColor("#acacac");
    obj.rectangle11:setName("rectangle11");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.Flow);
    obj.layout15:setAlign("left");
    obj.layout15:setWidth(20);
    obj.layout15:setHeight(20);
    obj.layout15:setHitTest(true);
    obj.layout15:setName("layout15");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout15);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle12:setHitTest(true);
    obj.rectangle12:setColor("#5959ff");
    obj.rectangle12:setName("rectangle12");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.Flow);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(20);
    obj.layout16:setHeight(20);
    obj.layout16:setHitTest(true);
    obj.layout16:setName("layout16");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout16);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle13:setHitTest(true);
    obj.rectangle13:setColor("#59ff59");
    obj.rectangle13:setName("rectangle13");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.Flow);
    obj.layout17:setAlign("left");
    obj.layout17:setWidth(20);
    obj.layout17:setHeight(20);
    obj.layout17:setHitTest(true);
    obj.layout17:setName("layout17");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout17);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle14:setHitTest(true);
    obj.rectangle14:setColor("#ff5959");
    obj.rectangle14:setName("rectangle14");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.Flow);
    obj.layout18:setAlign("left");
    obj.layout18:setWidth(20);
    obj.layout18:setHeight(20);
    obj.layout18:setHitTest(true);
    obj.layout18:setName("layout18");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout18);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle15:setHitTest(true);
    obj.rectangle15:setColor("#ff59ff");
    obj.rectangle15:setName("rectangle15");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.Flow);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(20);
    obj.layout19:setHeight(20);
    obj.layout19:setHitTest(true);
    obj.layout19:setName("layout19");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout19);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle16:setHitTest(true);
    obj.rectangle16:setColor("#ffac59");
    obj.rectangle16:setName("rectangle16");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.Flow);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(20);
    obj.layout20:setHeight(20);
    obj.layout20:setHitTest(true);
    obj.layout20:setName("layout20");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout20);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle17:setHitTest(true);
    obj.rectangle17:setColor("#ffff59");
    obj.rectangle17:setName("rectangle17");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.Flow);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(20);
    obj.layout21:setHeight(20);
    obj.layout21:setHitTest(true);
    obj.layout21:setName("layout21");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout21);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle18:setHitTest(true);
    obj.rectangle18:setColor("#59ffff");
    obj.rectangle18:setName("rectangle18");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.Flow);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(20);
    obj.layout22:setHeight(20);
    obj.layout22:setHitTest(true);
    obj.layout22:setName("layout22");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout22);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle19:setHitTest(true);
    obj.rectangle19:setColor("#ffd159");
    obj.rectangle19:setName("rectangle19");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.Flow);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(20);
    obj.layout23:setHeight(20);
    obj.layout23:setHitTest(true);
    obj.layout23:setName("layout23");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout23);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle20:setHitTest(true);
    obj.rectangle20:setColor("#5990ff");
    obj.rectangle20:setName("rectangle20");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.Flow);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(20);
    obj.layout24:setHeight(20);
    obj.layout24:setHitTest(true);
    obj.layout24:setName("layout24");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout24);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle21:setHitTest(true);
    obj.rectangle21:setColor("#f4c264");
    obj.rectangle21:setName("rectangle21");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.Flow);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(20);
    obj.layout25:setHeight(20);
    obj.layout25:setHitTest(true);
    obj.layout25:setName("layout25");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout25);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle22:setHitTest(true);
    obj.rectangle22:setColor("#de7a7a");
    obj.rectangle22:setName("rectangle22");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.Flow);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(20);
    obj.layout26:setHeight(20);
    obj.layout26:setHitTest(true);
    obj.layout26:setName("layout26");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout26);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle23:setHitTest(true);
    obj.rectangle23:setColor("#cb83d6");
    obj.rectangle23:setName("rectangle23");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.Flow);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(20);
    obj.layout27:setHeight(20);
    obj.layout27:setHitTest(true);
    obj.layout27:setName("layout27");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout27);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle24:setHitTest(true);
    obj.rectangle24:setColor("#f3658a");
    obj.rectangle24:setName("rectangle24");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.Flow);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(20);
    obj.layout28:setHeight(20);
    obj.layout28:setHitTest(true);
    obj.layout28:setName("layout28");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout28);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle25:setHitTest(true);
    obj.rectangle25:setColor("#8cecb3");
    obj.rectangle25:setName("rectangle25");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.Flow);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(20);
    obj.layout29:setHeight(20);
    obj.layout29:setHitTest(true);
    obj.layout29:setName("layout29");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout29);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle26:setHitTest(true);
    obj.rectangle26:setColor("#ed846b");
    obj.rectangle26:setName("rectangle26");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.SelectCor);
    obj.layout30:setAlign("bottom");
    obj.layout30:setHeight(24);
    obj.layout30:setName("layout30");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout30);
    obj.button2:setAlign("right");
    obj.button2:setText("OK!");
    obj.button2:setMargins({right=4});
    obj.button2:setName("button2");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj);
    obj.rectangle27:setColor("#0f0f0f");
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setPadding({top=4, left=4});
    obj.rectangle27:setName("rectangle27");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.rectangle27);
    obj.layout31:setAlign("top");
    obj.layout31:setHeight(24);
    obj.layout31:setName("layout31");

    obj.NovaAbadeNPCs = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovaAbadeNPCs:setParent(obj.layout31);
    obj.NovaAbadeNPCs:setMargins({left=4});
    obj.NovaAbadeNPCs:setAlign("left");
    obj.NovaAbadeNPCs:setWidth(24);
    obj.NovaAbadeNPCs:setName("NovaAbadeNPCs");
    obj.NovaAbadeNPCs:setImageChecked("/ListaNPCsDock/images/addlista.png");
    obj.NovaAbadeNPCs:setImageUnchecked("/ListaNPCsDock/images/addlista.png");

    obj.comboBoxFalsa = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.comboBoxFalsa:setParent(obj.layout31);
    obj.comboBoxFalsa:setAlign("left");
    obj.comboBoxFalsa:setMargins({left=8});
    obj.comboBoxFalsa:setName("comboBoxFalsa");
    obj.comboBoxFalsa:setWidth(128);
    obj.comboBoxFalsa:setHeight(20);
    obj.comboBoxFalsa:setHitTest(true);

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.comboBoxFalsa);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("#333333");
    obj.rectangle28:setXradius(2);
    obj.rectangle28:setYradius(2);
    obj.rectangle28:setHitTest(true);
    obj.rectangle28:setName("rectangle28");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle28);
    obj.label13:setFontColor("white");
    obj.label13:setAlign("client");
    obj.label13:setMargins({left=8});
    obj.label13:setVertTextAlign("center");
    obj.label13:setText("Opções");
    obj.label13:setField("NomeDaOpcao");
    obj.label13:setHitTest(true);
    obj.label13:setName("label13");

    obj.path1 = gui.fromHandle(_obj_newObject("path"));
    obj.path1:setParent(obj.rectangle28);
    obj.path1:setAlign("right");
    obj.path1:setWidth(16);
    obj.path1:setMargins({right=6, left=6, top=8, bottom=8});
    obj.path1:setColor("orange");
    obj.path1:setPathData("M 100 100 L 300 100 L 200 300 z");
    obj.path1:setName("path1");

    obj.dcsMain = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsMain:setParent(obj.rectangle27);
    obj.dcsMain:setAlign("client");
    obj.dcsMain:setName("dcsMain");

    obj.ListaDeNPCs = gui.fromHandle(_obj_newObject("form"));
    obj.ListaDeNPCs:setParent(obj.dcsMain);
    obj.ListaDeNPCs:setName("ListaDeNPCs");
    obj.ListaDeNPCs:setAlign("client");
    obj.ListaDeNPCs:setTheme("dark");


		function InvocarOPopupForm(node)
			self.recordNode.scopeNode = node;
			self.dropDownFalso2.scopeNode = sheet;
			self.dropDownFalso2:show();
		end;
	
		function FecharOPopupForm()
			self.dropDownFalso2:close();
		end;
	
		function autoCalcular()
			jogz2 = {}
			mesaDaFicha = rrpg.getMesaDe(sheet);
				for i = 1, #mesaDaFicha.jogadores, 1 do
					jogz2[i] = mesaDaFicha.jogadores[i].login;
				end;
			self.dropDownFalso2.height = (24 * (#jogz2 + 1))		 
			self.opcoesFalsas2:sort();
		end;
		
		function chamarListaDeJogadores()
			if sheet ~= nil then
				self.opcoesFalsas2:sort();
				local nodes = ndb.getChildNodes(sheet.opcoesFalsas2)
				mesaDaFicha = rrpg.getMesaDe(sheet);
				jogz = {}
				jogz[1] = "Nenhum"
				jogz2 = {}
				for i = 1, #nodes, 1 do
					jogz[i+1] = (nodes[i].NomeDaOpcao or "");
				end;
				for i = 1, #mesaDaFicha.jogadores, 1 do
					jogz2[i] = mesaDaFicha.jogadores[i].login;
				end;
				if jogz2 ~= jogz then
					if #nodes >= 2 then
						for i = #nodes, 1, -1 do
						setTimeout( function()
							ndb.deleteNode(nodes[i])
						end,2)
						end;
					end;
					local node = nil;
						node = self.opcoesFalsas2:append();
					setTimeout( function()
					for i = 1, #jogz2, 1 do
						node = self.opcoesFalsas2:append();
					end;
					end,10)
				else
				end;
				setTimeout( function()
					local nodes2 = ndb.getChildNodes(sheet.opcoesFalsas2)
					for i = 1, #nodes2, 1 do
						if i == 1 then
							nodes2[i].NomeDaOpcao = "Nenhum"
							nodes2[1].CodigoInterno = 1;
						else
							nodes2[i].NomeDaOpcao = jogz2[i-1]
							nodes2[i].CodigoInterno = 2;
							nodes2[i].CodigoInterno = 2;
						end
					end;
					autoCalcular();
				end, 20)
			end
		end;
	


    obj.recordNode = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.recordNode:setParent(obj.ListaDeNPCs);
    obj.recordNode:setName("recordNode");
    obj.recordNode:setVisible(false);

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.ListaDeNPCs);
    obj.layout32:setVisible(false);
    obj.layout32:setName("layout32");

    obj.dropDownFalso2 = gui.fromHandle(_obj_newObject("popupForm"));
    obj.dropDownFalso2:setParent(obj.layout32);
    obj.dropDownFalso2:setName("dropDownFalso2");
    obj.dropDownFalso2:setTitle("Jogador?");
    obj.dropDownFalso2:setWidth(128);
    obj.dropDownFalso2:setHeight(128);

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.dropDownFalso2);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.opcoesFalsas2 = gui.fromHandle(_obj_newObject("recordList"));
    obj.opcoesFalsas2:setParent(obj.scrollBox1);
    obj.opcoesFalsas2:setMargins({left=8});
    obj.opcoesFalsas2:setVisible(true);
    obj.opcoesFalsas2:setAlign("top");
    obj.opcoesFalsas2:setTemplateForm("OpcaoDaComboboxFalsa2");
    obj.opcoesFalsas2:setField("opcoesFalsas2");
    obj.opcoesFalsas2:setName("opcoesFalsas2");
    obj.opcoesFalsas2:setLayout("verticalTiles");
    obj.opcoesFalsas2:setAutoHeight(true);
    obj.opcoesFalsas2:setSelectable(true);
    obj.opcoesFalsas2:setMinQt(0);

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.ListaDeNPCs);
    obj.rectangle29:setColor("#0f0f0f");
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setName("rectangle29");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.rectangle29);
    obj.layout33:setAlign("top");
    obj.layout33:setHeight(24);
    obj.layout33:setMargins({top=4, left=2});
    obj.layout33:setName("layout33");

    obj.Configurar = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Configurar:setParent(obj.layout33);
    obj.Configurar:setMargins({left=4});
    obj.Configurar:setAlign("left");
    obj.Configurar:setWidth(24);
    obj.Configurar:setHint("Configurações da Lista");
    obj.Configurar:setName("Configurar");
    obj.Configurar:setImageChecked("/ListaNPCsDock/images/config.png");
    obj.Configurar:setImageUnchecked("/ListaNPCsDock/images/config.png");

    obj.NovoNPC = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovoNPC:setParent(obj.layout33);
    obj.NovoNPC:setMargins({left=4});
    obj.NovoNPC:setAlign("left");
    obj.NovoNPC:setWidth(24);
    obj.NovoNPC:setHint("Adicionar novo NPC");
    obj.NovoNPC:setName("NovoNPC");
    obj.NovoNPC:setImageChecked("/ListaNPCsDock/images/addnpc.png");
    obj.NovoNPC:setImageUnchecked("/ListaNPCsDock/images/addnpc.png");

    obj.Organizar = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Organizar:setParent(obj.layout33);
    obj.Organizar:setMargins({left=4});
    obj.Organizar:setAlign("left");
    obj.Organizar:setWidth(24);
    obj.Organizar:setHint("Ordenar Lista de NPCs");
    obj.Organizar:setName("Organizar");
    obj.Organizar:setImageChecked("/ListaNPCsDock/images/organize.png");
    obj.Organizar:setImageUnchecked("/ListaNPCsDock/images/organize.png");

    obj.MainClient = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.MainClient:setParent(obj.rectangle29);
    obj.MainClient:setName("MainClient");
    obj.MainClient:setAlign("client");
    obj.MainClient:setMargins({top=2});

    obj.rclListaDeNPC = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDeNPC:setParent(obj.MainClient);
    obj.rclListaDeNPC:setName("rclListaDeNPC");
    obj.rclListaDeNPC:setLayout("verticalTiles");
    obj.rclListaDeNPC:setField("campoDosNPC");
    obj.rclListaDeNPC:setTemplateForm("CaixaFichaNPC");
    obj.rclListaDeNPC:setAlign("none");
    obj.rclListaDeNPC:setAutoHeight(true);
    obj.rclListaDeNPC:setSelectable(true);
    obj.rclListaDeNPC:setMinQt(0);

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.rectangle29);
    obj.layout34:setAlign("bottom");
    obj.layout34:setHeight(32);
    obj.layout34:setName("layout34");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout34);
    obj.label14:setAlign("right");
    lfm_setPropAsString(obj.label14, "fontStyle",  "italic");
    obj.label14:setFontSize(12);
    obj.label14:setOpacity(0.8);
    obj.label14:setAutoSize(true);
    obj.label14:setText("Criado por Mia\nEditado por Ambesek");
    obj.label14:setName("label14");


			function DEC_HEX(IN)
				local B,K,OUT,I,D = 16,"0123456789ABCDEF","",0
				while IN > 0 do
					I=I+1
					D = (IN % B) + 1
					IN = math.floor(IN/B)
					
					OUT = string.sub(K,D,D) .. OUT
				end
				return OUT
			end;
		
			function DonoMestre(node, foioscript)
				if sheet ~= nil then
					node = (node or sheet);
					foioscript = (foioscript or false)
					local personagem = rrpg.getPersonagemDe(sheet);                                
					
					if (personagem ~= nil) then
						local mesa = personagem.mesa;

						if ndb.testPermission(node, "writePermissions") then               
						return true;
						else
							return false;
					   end;
					else
						
						return ndb.testPermission(node, "writePermissions");
					end; 
				end;
			end;

			function EnviarMudanca(barrinhaid, blockoverlay, nomepers, nome, valor, valormax, pc, pcmax)
				if sheet ~= nil then
					if not blockoverlay then
						publico = GetBarrinhaVisivel(blockoverlay, barrinhaid);
					else
						publico = false
					end;
					porcentagem = not (GetBarrinhaNumeros(barrinhaid));
					nome = tostring(nome or GetBarrinhaNome(barrinhaid));
					
					local text = "[§K2]" .. tostring(nome) .. "[§K3] de [§K2]" .. tostring(nomepers) .. "[§K3]: ";
					
					if tonumber(valor) >= 0 then
						valor = "+" .. tostring(valor);
					end;
					if tonumber(valormax) >= 0 then
						valormax = "+" .. tostring(valormax);
					end;
					if tonumber(pc) >= 0 then
						pc = "+" .. tostring(pc);
					end;
					if tonumber(pcmax) >= 0 then
						pcmax = "+" .. tostring(pcmax);
					end;
					
					if publico then
						if not porcentagem then
							if tonumber(valormax) == 0 then
								text = text .. valor;
							else
								text = text .. valor .. "/" .. valormax;
							end;
						else
							if tonumber(valormax) == 0 then
								text = text .. pc .. "%";
							else
								text = text .. pc .. "%" .. "/" .. pcmax .. "%";
							end;
						end;
					else
						if tonumber(valor) >= 0 then
							valor = "+??";
						else 
							valor = "-??"
						end;
						if tonumber(valormax) >= 0 then
							valormax = "+??";
						else 
							valormax = "-??"
						end;
						
						if not porcentagem then
							if tonumber(valormax) == 0 then
								text = text .. valor;
							else
								text = text .. valor .. "/" .. valormax;
							end;
						else
							if tonumber(valormax) == 0 then
								text = text .. valor .. "%";
							else
								text = text .. valor .. "%" .. "/" .. valormax .. "%";
							end;
						end;
					end;
					
					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
					if mesaDoPersonagem ~= nil then
						mesaDoPersonagem.activeChat:enviarMensagem(text);
					end;
				end;
			end;
			
			function RequestReload(mode)
				if sheet ~= nil then
					if mode == "begin" then
						self.rclListaDeNPC:beginUpdate();
						self.rclListaDeNPC.visible = false;
					elseif mode == "end" then
						self.rclListaDeNPC.visible = true;
						self.rclListaDeNPC:endUpdate();
					end;
				end;
			end;
		


    obj.dropDownFalso = gui.fromHandle(_obj_newObject("popup"));
    obj.dropDownFalso:setParent(obj);
    obj.dropDownFalso:setName("dropDownFalso");
    obj.dropDownFalso:setWidth(128);
    obj.dropDownFalso:setHeight(128);
    obj.dropDownFalso:setBackOpacity(0);
    obj.dropDownFalso:setNodeObject({sheet});
    obj.dropDownFalso:setHitTest(true);

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.dropDownFalso);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.opcoesFalsas = gui.fromHandle(_obj_newObject("recordList"));
    obj.opcoesFalsas:setParent(obj.scrollBox2);
    obj.opcoesFalsas:setVisible(true);
    obj.opcoesFalsas:setAlign("client");
    obj.opcoesFalsas:setTemplateForm("OpcaoDaComboboxFalsa");
    obj.opcoesFalsas:setField("opcoesFalsas");
    obj.opcoesFalsas:setName("opcoesFalsas");
    obj.opcoesFalsas:setLayout("verticalTiles");
    obj.opcoesFalsas:setAutoHeight(true);
    obj.opcoesFalsas:setSelectable(true);
    obj.opcoesFalsas:setMinQt(1);

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("opcaoEscolhida");
    obj.dataLink7:setDefaultValue("Opções");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'VisibBarrinha1', 'VisibBarrinha2', 'VisibBarrinha3', 'VisibBarrinha4'});
    obj.dataLink8:setDefaultValues({'a', 'a', 'a', 'a'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'NumerosBarrinha1', 'NumerosBarrinha2', 'NumerosBarrinha3', 'NumerosBarrinha4'});
    obj.dataLink9:setDefaultValues({'x', 'x', 'x', 'x'});
    obj.dataLink9:setName("dataLink9");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.Selected.left = 20 * (tonumber(sheet.CorIndex or 0) % 8);
            			self.Selected.top = 20 * math.floor(tonumber(sheet.CorIndex or 0) / 8);
        end, obj);

    obj._e_event1 = obj.rectangle1:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 1;
            					sheet.CorIndex = sheet.IndexBarrinha1;
            					sheet.ColorString = sheet.CorBarrinha1;
            					self.SelectCor:show();
        end, obj);

    obj._e_event2 = obj.rectangle2:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 1;
            							sheet.CorIndex = sheet.IndexBarrinha1;
            							sheet.ColorString = sheet.CorBarrinha1;
            							self.SelectCor:show();
        end, obj);

    obj._e_event3 = obj.CorBarrinha1:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 1;
            								sheet.CorIndex = sheet.IndexBarrinha1;
            								sheet.ColorString = sheet.CorBarrinha1;
            								self.SelectCor:show();
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.CorBarrinha1.color = sheet.CorBarrinha1;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha1 = sheet.CorBarrinha1;
            				end;
        end, obj);

    obj._e_event5 = obj.rectangle3:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 2;
            					sheet.CorIndex = sheet.IndexBarrinha2;
            					sheet.ColorString = sheet.CorBarrinha2;
            					self.SelectCor:show();
        end, obj);

    obj._e_event6 = obj.rectangle4:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 2;
            							sheet.CorIndex = sheet.IndexBarrinha2;
            							sheet.ColorString = sheet.CorBarrinha2;
            							self.SelectCor:show();
        end, obj);

    obj._e_event7 = obj.CorBarrinha2:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 2;
            								sheet.CorIndex = sheet.IndexBarrinha2;
            								sheet.ColorString = sheet.CorBarrinha2;
            								self.SelectCor:show();
        end, obj);

    obj._e_event8 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.CorBarrinha2.color = sheet.CorBarrinha2;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha2 = sheet.CorBarrinha2;
            				end;
        end, obj);

    obj._e_event9 = obj.rectangle5:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 3;
            					sheet.CorIndex = sheet.IndexBarrinha3;
            					sheet.ColorString = sheet.CorBarrinha3;
            					self.SelectCor:show();
        end, obj);

    obj._e_event10 = obj.rectangle6:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 3;
            							sheet.CorIndex = sheet.IndexBarrinha3;
            							sheet.ColorString = sheet.CorBarrinha3;
            							self.SelectCor:show();
        end, obj);

    obj._e_event11 = obj.CorBarrinha3:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 3;
            								sheet.CorIndex = sheet.IndexBarrinha3;
            								sheet.ColorString = sheet.CorBarrinha3;
            								self.SelectCor:show();
        end, obj);

    obj._e_event12 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.CorBarrinha3.color = sheet.CorBarrinha3;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha3 = sheet.CorBarrinha3;
            				end;
        end, obj);

    obj._e_event13 = obj.rectangle7:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 4;
            					sheet.CorIndex = sheet.IndexBarrinha4;
            					sheet.ColorString = sheet.CorBarrinha4;
            					self.SelectCor:show();
        end, obj);

    obj._e_event14 = obj.rectangle8:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 4;
            							sheet.CorIndex = sheet.IndexBarrinha4;
            							sheet.ColorString = sheet.CorBarrinha4;
            							self.SelectCor:show();
        end, obj);

    obj._e_event15 = obj.CorBarrinha4:addEventListener("onClick",
        function (self)
            sheet.IndexBarrinha = 4;
            								sheet.CorIndex = sheet.IndexBarrinha4;
            								sheet.ColorString = sheet.CorBarrinha4;
            								self.SelectCor:show();
        end, obj);

    obj._e_event16 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            self.CorBarrinha4.color = sheet.CorBarrinha4;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha4 = sheet.CorBarrinha4;
            				end;
        end, obj);

    obj._e_event17 = obj.button1:addEventListener("onClick",
        function (self)
            self.Config:close();
        end, obj);

    obj._e_event18 = obj.layout14:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "0";
            				sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event19 = obj.rectangle11:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "0";
            					sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event20 = obj.layout15:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "1";
            				sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event21 = obj.rectangle12:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "1";
            					sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event22 = obj.layout16:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "2";
            				sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event23 = obj.rectangle13:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "2";
            					sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event24 = obj.layout17:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "3";
            				sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event25 = obj.rectangle14:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "3";
            					sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event26 = obj.layout18:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "4";
            				sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event27 = obj.rectangle15:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "4";
            					sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event28 = obj.layout19:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "5";
            				sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event29 = obj.rectangle16:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "5";
            					sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event30 = obj.layout20:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "6";
            				sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event31 = obj.rectangle17:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "6";
            					sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event32 = obj.layout21:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "7";
            				sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event33 = obj.rectangle18:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "7";
            					sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event34 = obj.layout22:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "8";
            				sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event35 = obj.rectangle19:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "8";
            					sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event36 = obj.layout23:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "9";
            				sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event37 = obj.rectangle20:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "9";
            					sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event38 = obj.layout24:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "10";
            				sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event39 = obj.rectangle21:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "10";
            					sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event40 = obj.layout25:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "11";
            				sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event41 = obj.rectangle22:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "11";
            					sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event42 = obj.layout26:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "12";
            				sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event43 = obj.rectangle23:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "12";
            					sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event44 = obj.layout27:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "13";
            				sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event45 = obj.rectangle24:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "13";
            					sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event46 = obj.layout28:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "14";
            				sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event47 = obj.rectangle25:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "14";
            					sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event48 = obj.layout29:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "15";
            				sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event49 = obj.rectangle26:addEventListener("onClick",
        function (self)
            sheet.CorIndex = "15";
            					sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event50 = obj.button2:addEventListener("onClick",
        function (self)
            if sheet.IndexBarrinha == 1 then
            								sheet.IndexBarrinha1 = sheet.CorIndex;
            								sheet.CorBarrinha1 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 2 then
            								sheet.IndexBarrinha2 = sheet.CorIndex;
            								sheet.CorBarrinha2 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 3 then
            								sheet.IndexBarrinha3 = sheet.CorIndex;
            								sheet.CorBarrinha3 = sheet.ColorString;
            							elseif sheet.IndexBarrinha == 4 then
            								sheet.IndexBarrinha4 = sheet.CorIndex;
            								sheet.CorBarrinha4 = sheet.ColorString;
            							end;
            							self.SelectCor:close();
        end, obj);

    obj._e_event51 = obj.NovaAbadeNPCs:addEventListener("onClick",
        function (self)
            if DonoMestre() then			
            						node = self.opcoesFalsas:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event52 = obj.rectangle28:addEventListener("onClick",
        function (self)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event53 = obj.label13:addEventListener("onClick",
        function (self)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event54 = obj.path1:addEventListener("onClick",
        function (self)
            self.dropDownFalso.scopeNode = sheet;
            							 self:autoCalcular();
        end, obj);

    obj._e_event55 = obj.ListaDeNPCs:addEventListener("onShow",
        function (self)
            if self.opcoesFalsas2.selectedNode == nil and sheet ~= nil then
            			chamarListaDeJogadores();
            			autoCalcular();
                        local nodes = ndb.getChildNodes(sheet.opcoesFalsas2);               
                        if #nodes > 0 then
                            self.opcoesFalsas2.selectedNode = nodes[1];
                        end;
                    end;
        end, obj);

    obj._e_event56 = obj.opcoesFalsas2:addEventListener("onSelect",
        function (self)
            local node = self.opcoesFalsas2.selectedNode;
            						 setTimeout(function()
            							if node ~= nil then
            								self.recordNode.scopeNode.opcaoEscolhida2 = node.NomeDaOpcao;
            							end;
            						 end,10);
        end, obj);

    obj._e_event57 = obj.opcoesFalsas2:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (nodeA.CodigoInterno == nil) then
            							if (nodeA.NomeDaOpcao == "Nenhum") then
            								nodeA.CodigoInterno = 1;
            							else
            								nodeA.CodigoInterno = 2;
            							end;
            						end;
            						if (nodeB.CodigoInterno == nil) then
            							if (nodeB.NomeDaOpcao == "Nenhum") then
            								nodeB.CodigoInterno = 1;
            							else
            								nodeB.CodigoInterno = 2;
            							end;
            						end;
            					 
            						if nodeB.CodigoInterno > nodeA.CodigoInterno then
            							return -1;
            						elseif not (nodeB.CodigoInterno >= nodeA.CodigoInterno) then
            							return 1;
            						else
            							return 1 * utils.compareStringPtBr(nodeA.NomeDaOpcao, nodeB.NomeDaOpcao);
            						end;
        end, obj);

    obj._e_event58 = obj.rectangle29:addEventListener("onResize",
        function (self)
            if self.width >= 270 then
            				self.rclListaDeNPC.width = self.width;
            			else
            				self.rclListaDeNPC.width = 270;
            			end;
        end, obj);

    obj._e_event59 = obj.Configurar:addEventListener("onClick",
        function (self)
            if DonoMestre() then
            						self.Config.scopeNode = sheet;
            						self.Config:show();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event60 = obj.NovoNPC:addEventListener("onClick",
        function (self)
            if DonoMestre() then			
            						node = self.rclListaDeNPC:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event61 = obj.Organizar:addEventListener("onClick",
        function (self)
            if DonoMestre() then			
            						self.rclListaDeNPC:sort();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event62 = obj.rclListaDeNPC:addEventListener("onBeginEnumeration",
        function (self)
        end, obj);

    obj._e_event63 = obj.rclListaDeNPC:addEventListener("onItemAdded",
        function (self, node, form)
            node.CorBarrinha1 = (sheet.CorBarrinha1 or "#808080");
            					node.CorBarrinha2 = (sheet.CorBarrinha2 or "#808080");
            					node.CorBarrinha3 = (sheet.CorBarrinha3 or "#808080");
            					node.CorBarrinha4 = (sheet.CorBarrinha4 or "#808080");
            					form.Barrinha1.color = sheet.CorBarrinha1;
            					form.Barrinha2.color = sheet.CorBarrinha2;
            					form.Barrinha3.color = sheet.CorBarrinha3;
            					form.Barrinha4.color = sheet.CorBarrinha4;
        end, obj);

    obj._e_event64 = obj.rclListaDeNPC:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            org = getOrganizacao();
            					if nodeA.hideNPC and not nodeB.hideNPC then
            						return 1;
            					elseif not nodeA.hideNPC and nodeB.hideNPC then
            						return -1;
            					end;
            					if org == "Alfa" then
            						return utils.compareStringPtBr(nodeA.NomeGrande, nodeB.NomeGrande);
            					else
            						if ((nodeB.alinhamentoNPC or "Padrão") > (nodeA.alinhamentoNPC or "Padrão")) then
            							return -1;
            						elseif (nodeA.alinhamentoNPC or "Padrão") == (nodeB.alinhamentoNPC or "Padrão") then
            							return utils.compareStringPtBr(nodeA.NomePequeno, nodeB.NomePequeno);
            						else
            							return 1;
            						end;
            					end;
        end, obj);

    obj._e_event65 = obj.opcoesFalsas:addEventListener("onSelect",
        function (self)
            local node = self.opcoesFalsas.selectedNode;
            					 setTimeout(function()
            						if node ~= nil then
            							 self.dcsMain.scopeNode = node;
            							 self.dcsTituloEAbas.scopeNode = node;
            							 self.comboBoxFalsa.scopeNode = node;
            						end;
            					 end,10);
            					 self.dropDownFalso:close();
        end, obj);

    obj._e_event66 = obj.opcoesFalsas:addEventListener("onBeginEnumeration",
        function (self)
            if sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            						if #nodes == 0 then
            							local node = self.opcoesFalsas:append();
            							node.NomeDaOpcao = "Principal";
            						end;
            					end;
        end, obj);

    obj._e_event67 = obj.opcoesFalsas:addEventListener("onEndEnumeration",
        function (self)
            local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            					if self.dcsMain.scopeNode == nil then
            						self.dcsMain.scopeNode = nodes[1];
            						self.dcsTituloEAbas.scopeNode = nodes[1];
            						self.comboBoxFalsa.scopeNode = nodes[1];
            					end;
        end, obj);

    obj._e_event68 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet ~= nil then
            				local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            				if #nodes == 0 then
            					local node = self.opcoesFalsas:append();
            				else
            					if self.dcsMain.scopeNode == nil then
            						self.dcsMain.scopeNode = nodes[1];
            						self.dcsTituloEAbas.scopeNode = nodes[1];
            						self.comboBoxFalsa.scopeNode = nodes[1];
            					end;			
            				end;
            			end;
        end, obj);

    obj._e_event69 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local nudes = ndb.getChildNodes(sheet.opcoesFalsas);               
            			for i = 1, #nudes, 1 do
            				local nodes = ndb.getChildNodes(nudes[i].campoDosNPC);       
            				self:beginUpdate();
            				for i = 1,#nodes, 1 do
            					if sheet.VisibBarrinha1 ~= "c" then
            						nodes[i].Barrinha1Invisivel = false;
            					else
            						nodes[i].Barrinha1Invisivel = true;
            					end;
            				
            					if sheet.VisibBarrinha2 ~= "c" then
            						nodes[i].Barrinha2Invisivel = false;
            					else
            						nodes[i].Barrinha2Invisivel = true;
            					end;
            					
            					if sheet.VisibBarrinha3 ~= "c" then
            						nodes[i].Barrinha3Invisivel = false;
            					else
            						nodes[i].Barrinha3Invisivel = true;
            					end;
            					
            					if sheet.VisibBarrinha4 ~= "c" then
            						nodes[i].Barrinha4Invisivel = false;
            					else
            						nodes[i].Barrinha4Invisivel = true;
            					end;
            				end;
            				self:endUpdate();
            			end;
        end, obj);

    obj._e_event70 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local nudes = ndb.getChildNodes(sheet.opcoesFalsas);               
            			for i = 1, #nudes, 1 do
            				local nodes = ndb.getChildNodes(nudes[i].campoDosNPC);    
            				self:beginUpdate();
            				for i = 1,#nodes, 1 do
            				setTimeout( function ()
            					local test = GetBarrinhaNumeros(1);
            					local d0 = (tonumber(nodes[i].Barrinha1ValorMax or 0) == 0)
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha1ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha1 = (nodes[i].Barrinha1Valor or 0) .. "/" .. (nodes[i].Barrinha1ValorMax  or 0);
            						nodes[i].InfoBarrinha1Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha1 = tostring(math.floor((100 * (nodes[i].Barrinha1Valor or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha1Oculto = "??%";
            					end;
            					
            					local test = GetBarrinhaNumeros(2);
            					local d0 = (tonumber(nodes[i].Barrinha2ValorMax or 0) == 0)
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha2ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha2 = (nodes[i].Barrinha2Valor  or 0) .. "/" .. (nodes[i].Barrinha2ValorMax  or 0);
            						nodes[i].InfoBarrinha2Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha2 = tostring(math.floor((100 * (nodes[i].Barrinha2Valor  or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha2Oculto = "??%";
            					end;
            					local test = GetBarrinhaNumeros(3);
            					local d0 = (tonumber(nodes[i].Barrinha3ValorMax or 0) == 0);
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha3ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha3 = (nodes[i].Barrinha3Valor or 0) .. "/" .. (nodes[i].Barrinha3ValorMax  or 0);
            						nodes[i].InfoBarrinha3Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha3 = tostring(math.floor((100 * (nodes[i].Barrinha3Valor or 0) ) / d0)) .. "%";
            						nodes[i].InfoBarrinha3Oculto = "??%";
            					end;
            					local test = GetBarrinhaNumeros(4);
            					local d0 = (tonumber(nodes[i].Barrinha4ValorMax or 0) == 0);
            						if d0 then
            							d0 = 1
            						else
            							d0 = nodes[i].Barrinha4ValorMax
            						end;
            					if test then
            						nodes[i].InfoBarrinha4 = (nodes[i].Barrinha4Valor or 0) .. "/" .. (nodes[i].Barrinha4ValorMax or 0);
            						nodes[i].InfoBarrinha4Oculto = "??/??";
            					else
            						nodes[i].InfoBarrinha4 = tostring(math.floor((100 * (nodes[i].Barrinha4Valor or 0)) / d0)) .. "%";
            						nodes[i].InfoBarrinha4Oculto = "??%";
            					end;
            					end, 100);
            				end;
            				self:endUpdate();
            			end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
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

        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dcsMain ~= nil then self.dcsMain:destroy(); self.dcsMain = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.Configurar ~= nil then self.Configurar:destroy(); self.Configurar = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.Nha ~= nil then self.Nha:destroy(); self.Nha = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.path1 ~= nil then self.path1:destroy(); self.path1 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.dropDownFalso ~= nil then self.dropDownFalso:destroy(); self.dropDownFalso = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.Organizar ~= nil then self.Organizar:destroy(); self.Organizar = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.CorBarrinha4 ~= nil then self.CorBarrinha4:destroy(); self.CorBarrinha4 = nil; end;
        if self.rclListaDeNPC ~= nil then self.rclListaDeNPC:destroy(); self.rclListaDeNPC = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.dropDownFalso2 ~= nil then self.dropDownFalso2:destroy(); self.dropDownFalso2 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.Config ~= nil then self.Config:destroy(); self.Config = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.MainClient ~= nil then self.MainClient:destroy(); self.MainClient = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.NovoNPC ~= nil then self.NovoNPC:destroy(); self.NovoNPC = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.CorBarrinha3 ~= nil then self.CorBarrinha3:destroy(); self.CorBarrinha3 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.comboBoxFalsa ~= nil then self.comboBoxFalsa:destroy(); self.comboBoxFalsa = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.opcoesFalsas ~= nil then self.opcoesFalsas:destroy(); self.opcoesFalsas = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.recordNode ~= nil then self.recordNode:destroy(); self.recordNode = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dcsTituloEAbas ~= nil then self.dcsTituloEAbas:destroy(); self.dcsTituloEAbas = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.Selected ~= nil then self.Selected:destroy(); self.Selected = nil; end;
        if self.SelectCor ~= nil then self.SelectCor:destroy(); self.SelectCor = nil; end;
        if self.CorBarrinha1 ~= nil then self.CorBarrinha1:destroy(); self.CorBarrinha1 = nil; end;
        if self.Flow ~= nil then self.Flow:destroy(); self.Flow = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.opcoesFalsas2 ~= nil then self.opcoesFalsas2:destroy(); self.opcoesFalsas2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.NovaAbadeNPCs ~= nil then self.NovaAbadeNPCs:destroy(); self.NovaAbadeNPCs = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.ListaDeNPCs ~= nil then self.ListaDeNPCs:destroy(); self.ListaDeNPCs = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _Listade_NPC_Dock = {
    newEditor = newListade_NPC_Dock, 
    new = newListade_NPC_Dock, 
    name = "Listade_NPC_Dock", 
    dataType = "Lista.de.NPC", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Lista de NPCs", 
    description=""};

Listade_NPC_Dock = _Listade_NPC_Dock;
rrpg.registrarForm(_Listade_NPC_Dock);
rrpg.registrarDataType(_Listade_NPC_Dock);
rrpg.registrarSpecialForm(_Listade_NPC_Dock);

return _Listade_NPC_Dock;
