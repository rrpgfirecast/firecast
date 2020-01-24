require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha_MM3ed_RRPG_Consultas()
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
    obj:setName("frmFicha_MM3ed_RRPG_Consultas");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(893);
    obj.rectangle1:setHeight(1263);
    obj.rectangle1:setColor("#6cb098");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(893);
    obj.image1:setHeight(1263);
    obj.image1:setSRC("/Ficha_MM3ed_RRPG_image/images/fundo2.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(700);
    obj.layout1:setHeight(1263);
    obj.layout1:setMargins({top=2, left=2, right=2});
    obj.layout1:setName("layout1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("#264d43");
    obj.rectangle2:setWidth(331);
    obj.rectangle2:setHeight(32);
    obj.rectangle2:setMargins({top=4});
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setName("rectangle2");

    obj.popTabelaMed = GUI.fromHandle(_obj_newObject("popup"));
    obj.popTabelaMed:setParent(obj.rectangle2);
    obj.popTabelaMed:setName("popTabelaMed");
    obj.popTabelaMed:setWidth(280);
    obj.popTabelaMed:setHeight(586);
    obj.popTabelaMed:setBackOpacity(0.5);

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.popTabelaMed);
    obj.image2:setAlign("client");
    obj.image2:setStyle("proportional");
    obj.image2:setSRC("/Ficha_MM3ed_RRPG_image/images/TabelaMed.png");
    obj.image2:setName("image2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle2);
    obj.button1:setText("TABELA DE MEDIDAS");
    obj.button1:setWidth(160);
    obj.button1:setHeight(25);
    obj.button1:setLeft(5);
    obj.button1:setTop(4);
    obj.button1:setName("button1");

    obj.popTabelaTam = GUI.fromHandle(_obj_newObject("popup"));
    obj.popTabelaTam:setParent(obj.rectangle2);
    obj.popTabelaTam:setName("popTabelaTam");
    obj.popTabelaTam:setWidth(436);
    obj.popTabelaTam:setHeight(290);
    obj.popTabelaTam:setBackOpacity(0.5);

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.popTabelaTam);
    obj.image3:setAlign("client");
    obj.image3:setStyle("proportional");
    obj.image3:setSRC("/Ficha_MM3ed_RRPG_image/images/TabelaTam.png");
    obj.image3:setName("image3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle2);
    obj.button2:setText("TABELA DE TAMANHO");
    obj.button2:setWidth(160);
    obj.button2:setHeight(25);
    obj.button2:setLeft(170);
    obj.button2:setTop(4);
    obj.button2:setName("button2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setLeft(337);
    obj.label1:setText("GRADUAÇÃO EM VELOCIDADE");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setTop(6);
    obj.label1:setWidth(190);
    obj.label1:setHeight(20);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setLeft(528);
    obj.edit1:setTop(3);
    obj.edit1:setWidth(30);
    obj.edit1:setHeight(25);
    obj.edit1:setType("float");
    obj.edit1:setField("Velocidade1");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setLeft(562);
    obj.label2:setText("≅");
    obj.label2:setTop(5);
    obj.label2:setWidth(8);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle2);
    obj.rectangle3:setLeft(575);
    obj.rectangle3:setTop(3);
    obj.rectangle3:setWidth(33);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("#202020");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle3);
    obj.label3:setText("0");
    obj.label3:setLeft(0);
    obj.label3:setTop(2);
    obj.label3:setWidth(33);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setField("VelocidadeTotal");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setLeft(610);
    obj.label4:setText("km/h");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setTop(5);
    obj.label4:setWidth(38);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setFields({'Velocidade1'});
    obj.dataLink1:setDefaultValues({'0'});
    obj.dataLink1:setName("dataLink1");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout1);
    obj.rectangle4:setAlign("top");
    obj.rectangle4:setColor("#264d43");
    obj.rectangle4:setWidth(631);
    obj.rectangle4:setHeight(60);
    obj.rectangle4:setMargins({top=4});
    obj.rectangle4:setStrokeColor("#264d43");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setName("rectangle4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle4);
    obj.label5:setAlign("top");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setText("VANTAGENS");
    obj.label5:setFontColor("white");
    obj.label5:setFontSize(16);
    obj.label5:setMargins({left=10});
    obj.label5:setName("label5");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle4);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(695);
    obj.layout2:setHeight(32);
    obj.layout2:setMargins({top=2, left=2, right=2});
    obj.layout2:setName("layout2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setVertTextAlign("center");
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setLeft(0);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(165);
    obj.comboBox1:setHeight(27);
    obj.comboBox1:setField("chaveVantagem");
    obj.comboBox1:setItems({'Ação em Movimento', 'Agarrar Aprimorado', 'Agarrar Preciso', 'Agarrar Rápido', 'Ambiente Favorito',
																																					'Arma Improvisada', 'Armação', 'Artífice', 'Assustar', 'Ataque à Distância', 'Ataque Acurado',
																																					'Ataque Corpo-a-Corpo', 'Ataque Defensivo', 'Ataque Dominó', 'Ataque Imprudente', 'Ataque Poderoso',
																																					'Ataque Preciso', 'Atraente', 'Avaliação', 'Bem Informado', 'Bem Relacionado', 'Benefício', 'Capanga',
																																					'Contatos', 'Crítico Aprimorado ', 'De Pé', 'Defesa Aprimorada', 'Derrubar Aprimorado', 'Desarmar Aprimorado',
																																					'Destemido', 'Duro de Matar', 'Empatia com Animais', 'Equipamento', 'Esconder-se à Plena Vista',
																																					'Esforço Extraordinário', 'Esforço Supremo', 'Esquiva Fabulosa', 'Estrangular', 'Evasão', 'Fascinar',
																																					'Faz Tudo', 'Ferramentas Aprimoradas', 'Finta Ágil', 'Idiomas', 'Imobilizar Aprimorado', 'Iniciativa Aprimorada',
																																					'Inimigo Favorito', 'Inspirar', 'Interpor-se', 'Inventor', 'Liderança', 'Luta no Chão', 'Maestria em Arremesso',
																																					'Maestria em Perícia', 'Memória Eidética', 'Mira Aprimorada ', 'Parceiro', 'Prender Arma', 'Quebrar Aprimorado',
																																					'Quebrar Arma', 'Rastrear', 'Redirecionar', 'Ritualista', 'Rolamento Defensivo', 'Saque Rápido', 'Segunda Chance',
																																					'Sorte', 'Sorte de Principiante', 'Tolerância Maior', 'Tomar a Iniciativa', 'Tontear', 'Trabalho em Equipe', 'Transe', 'Zombar', '-'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35',
					'36', '37', '38', '39', '40', '41', '42', '43', '44', '45','46', '47', '48', '49', '50', '51', '52', '53', '54', '55', '56', '57', '58', '59', '60', '61', '62', '63', '64', '65', '66', '67', '68', '69', '70', '71', '72', '73', '74', '75'});
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setName("comboBox1");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout2);
    obj.rectangle5:setAlign("left");
    obj.rectangle5:setColor("#6cb098");
    obj.rectangle5:setWidth(530);
    obj.rectangle5:setHeight(30);
    obj.rectangle5:setMargins({top=2, left=165, right=2});
    obj.rectangle5:setStrokeColor("#202020");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setXradius(2);
    obj.rectangle5:setYradius(2);
    obj.rectangle5:setName("rectangle5");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle5);
    obj.textEditor1:setLeft(2);
    obj.textEditor1:setTop(-2);
    obj.textEditor1:setWidth(530);
    obj.textEditor1:setHeight(30);
    obj.textEditor1:setFontSize(12);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("ConsultaVantagem");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setMargins({top=2, left=2});
    obj.textEditor1:setName("textEditor1");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout1);
    obj.rectangle6:setAlign("top");
    obj.rectangle6:setColor("#264d43");
    obj.rectangle6:setWidth(631);
    obj.rectangle6:setHeight(123);
    obj.rectangle6:setMargins({top=4});
    obj.rectangle6:setStrokeColor("#264d43");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle6);
    obj.label6:setAlign("top");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setText("CONDIÇÕES BÁSICAS");
    obj.label6:setFontColor("white");
    obj.label6:setFontSize(16);
    obj.label6:setMargins({left=10});
    obj.label6:setName("label6");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle6);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(695);
    obj.layout3:setHeight(99);
    obj.layout3:setMargins({top=2, left=2, right=2});
    obj.layout3:setName("layout3");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout3);
    obj.comboBox2:setVertTextAlign("center");
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setFontSize(12);
    obj.comboBox2:setLeft(0);
    obj.comboBox2:setTop(0);
    obj.comboBox2:setWidth(165);
    obj.comboBox2:setHeight(27);
    obj.comboBox2:setField("chaveCondicao1");
    obj.comboBox2:setItems({'Atordoado', 'Compelido', 'Controlado', 'Debilitado', 'Desabilitado', 'Desatento', 'Enfraquecido', 'Fatigado',
																																					'Imóvel', 'Impedido', 'Indefeso', 'Normal', 'Prejudicado', 'Tonto', 'Transformado', 'Vulnerável', '-'});
    obj.comboBox2:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17'});
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setName("comboBox2");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout3);
    obj.rectangle7:setAlign("left");
    obj.rectangle7:setColor("#6cb098");
    obj.rectangle7:setWidth(530);
    obj.rectangle7:setHeight(99);
    obj.rectangle7:setMargins({top=2, left=165, right=2});
    obj.rectangle7:setStrokeColor("#202020");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setXradius(2);
    obj.rectangle7:setYradius(2);
    obj.rectangle7:setName("rectangle7");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle7);
    obj.textEditor2:setLeft(2);
    obj.textEditor2:setTop(-2);
    obj.textEditor2:setWidth(530);
    obj.textEditor2:setHeight(97);
    obj.textEditor2:setFontSize(12);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("ConsultaCondicao1");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setMargins({top=2, left=2});
    obj.textEditor2:setName("textEditor2");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout1);
    obj.rectangle8:setAlign("top");
    obj.rectangle8:setColor("#264d43");
    obj.rectangle8:setWidth(631);
    obj.rectangle8:setHeight(123);
    obj.rectangle8:setMargins({top=4});
    obj.rectangle8:setStrokeColor("#264d43");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setName("rectangle8");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle8);
    obj.label7:setAlign("top");
    lfm_setPropAsString(obj.label7, "fontStyle",  "bold");
    obj.label7:setText("CONDIÇÕES COMBINADAS");
    obj.label7:setFontColor("white");
    obj.label7:setFontSize(16);
    obj.label7:setMargins({left=10});
    obj.label7:setName("label7");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle8);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(695);
    obj.layout4:setHeight(99);
    obj.layout4:setMargins({top=2, left=2, right=2});
    obj.layout4:setName("layout4");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout4);
    obj.comboBox3:setVertTextAlign("center");
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setFontSize(12);
    obj.comboBox3:setLeft(0);
    obj.comboBox3:setTop(0);
    obj.comboBox3:setWidth(165);
    obj.comboBox3:setHeight(27);
    obj.comboBox3:setField("chaveCondicao2");
    obj.comboBox3:setItems({'Abatido', 'Adormecido', 'Caído', 'Cego', 'Exausto', 'Incapacitado', 'Moribundo',
																																					'Paralisado', 'Restrito', 'Surdo', 'Surpreso', 'Transe', '-'});
    obj.comboBox3:setValues({'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13'});
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setName("comboBox3");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout4);
    obj.rectangle9:setAlign("left");
    obj.rectangle9:setColor("#6cb098");
    obj.rectangle9:setWidth(530);
    obj.rectangle9:setHeight(99);
    obj.rectangle9:setMargins({top=2, left=165, right=2});
    obj.rectangle9:setStrokeColor("#202020");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setXradius(2);
    obj.rectangle9:setYradius(2);
    obj.rectangle9:setName("rectangle9");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle9);
    obj.textEditor3:setLeft(2);
    obj.textEditor3:setTop(-2);
    obj.textEditor3:setWidth(530);
    obj.textEditor3:setHeight(97);
    obj.textEditor3:setFontSize(12);
    obj.textEditor3:setFontColor("#000000");
    obj.textEditor3:setField("ConsultaCondicao2");
    obj.textEditor3:setTransparent(true);
    obj.textEditor3:setMargins({top=2, left=2});
    obj.textEditor3:setName("textEditor3");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout1);
    obj.rectangle10:setAlign("top");
    obj.rectangle10:setColor("#264d43");
    obj.rectangle10:setWidth(631);
    obj.rectangle10:setHeight(123);
    obj.rectangle10:setMargins({top=4});
    obj.rectangle10:setStrokeColor("#264d43");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setName("rectangle10");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle10);
    obj.label8:setAlign("top");
    lfm_setPropAsString(obj.label8, "fontStyle",  "bold");
    obj.label8:setText("INVENTANDO COM MAGIA OU TECNOLOGIA");
    obj.label8:setFontColor("white");
    obj.label8:setFontSize(16);
    obj.label8:setMargins({left=10});
    obj.label8:setName("label8");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle10);
    obj.label9:setAlign("top");
    lfm_setPropAsString(obj.label9, "fontStyle",  "bold");
    obj.label9:setText("");
    obj.label9:setFontColor("white");
    obj.label9:setFontSize(16);
    obj.label9:setMargins({left=10});
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle10);
    obj.label10:setAlign("top");
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setText("PROJETO                                                               CONSTRUÇÃO");
    obj.label10:setFontColor("white");
    obj.label10:setFontSize(16);
    obj.label10:setMargins({left=10});
    obj.label10:setName("label10");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle10);
    obj.layout5:setAlign("left");
    obj.layout5:setWidth(695);
    obj.layout5:setHeight(99);
    obj.layout5:setMargins({top=2, left=2, right=2});
    obj.layout5:setName("layout5");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout5);
    obj.label11:setLeft(3);
    obj.label11:setTop(6);
    obj.label11:setText("Custo de Poder:");
    lfm_setPropAsString(obj.label11, "fontStyle",  "bold");
    obj.label11:setWidth(190);
    obj.label11:setHeight(20);
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout5);
    obj.label12:setLeft(3);
    obj.label12:setTop(30);
    obj.label12:setText("Acelerar Projeto:");
    lfm_setPropAsString(obj.label12, "fontStyle",  "bold");
    obj.label12:setWidth(190);
    obj.label12:setHeight(20);
    obj.label12:setName("label12");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout5);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setLeft(108);
    obj.edit2:setTop(3);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(25);
    obj.edit2:setType("float");
    obj.edit2:setField("custoInvento");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setLeft(108);
    obj.edit3:setTop(30);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(25);
    obj.edit3:setType("float");
    obj.edit3:setField("tempoProjetoRapido");
    obj.edit3:setName("edit3");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout5);
    obj.dataLink2:setFields({'tempoProjetoRapido'});
    obj.dataLink2:setDefaultValues({'0'});
    obj.dataLink2:setName("dataLink2");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout5);
    obj.label13:setLeft(155);
    obj.label13:setTop(6);
    obj.label13:setText("CD de Projeto:");
    lfm_setPropAsString(obj.label13, "fontStyle",  "bold");
    obj.label13:setWidth(190);
    obj.label13:setHeight(20);
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout5);
    obj.label14:setLeft(155);
    obj.label14:setTop(30);
    obj.label14:setText("Tempo de Projeto:");
    lfm_setPropAsString(obj.label14, "fontStyle",  "bold");
    obj.label14:setWidth(190);
    obj.label14:setHeight(20);
    obj.label14:setName("label14");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout5);
    obj.rectangle11:setLeft(270);
    obj.rectangle11:setTop(3);
    obj.rectangle11:setWidth(33);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("#202020");
    obj.rectangle11:setStrokeColor("black");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle11);
    obj.label15:setText("0");
    obj.label15:setLeft(0);
    obj.label15:setTop(2);
    obj.label15:setWidth(33);
    obj.label15:setHeight(20);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setField("cdProjeto");
    obj.label15:setName("label15");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout5);
    obj.rectangle12:setLeft(270);
    obj.rectangle12:setTop(30);
    obj.rectangle12:setWidth(130);
    obj.rectangle12:setHeight(23);
    obj.rectangle12:setColor("#264d43");
    obj.rectangle12:setName("rectangle12");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle12);
    obj.label16:setVisible(false);
    obj.label16:setText("0");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setField("tempoProjeto");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle12);
    obj.label17:setText("0");
    obj.label17:setLeft(0);
    obj.label17:setTop(0);
    obj.label17:setWidth(130);
    obj.label17:setHeight(20);
    obj.label17:setHorzTextAlign("leading");
    obj.label17:setField("tempoShowProjeto");
    obj.label17:setName("label17");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout5);
    obj.dataLink3:setFields({'custoInvento', 'tempoProjetoRapido', 'tempoProjeto'});
    obj.dataLink3:setDefaultValues({'0'});
    obj.dataLink3:setName("dataLink3");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout5);
    obj.rectangle13:setLeft(345);
    obj.rectangle13:setTop(3);
    obj.rectangle13:setWidth(5);
    obj.rectangle13:setHeight(56);
    obj.rectangle13:setColor("#8bad9f");
    obj.rectangle13:setStrokeColor("black");
    obj.rectangle13:setXradius(2);
    obj.rectangle13:setYradius(2);
    obj.rectangle13:setName("rectangle13");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout5);
    obj.label18:setLeft(357);
    obj.label18:setTop(6);
    obj.label18:setText("Custo de Poder:");
    lfm_setPropAsString(obj.label18, "fontStyle",  "bold");
    obj.label18:setWidth(190);
    obj.label18:setHeight(20);
    obj.label18:setName("label18");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout5);
    obj.label19:setLeft(357);
    obj.label19:setTop(30);
    obj.label19:setText("Acelerar Constr.:");
    lfm_setPropAsString(obj.label19, "fontStyle",  "bold");
    obj.label19:setWidth(190);
    obj.label19:setHeight(20);
    obj.label19:setName("label19");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout5);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setLeft(460);
    obj.edit4:setTop(3);
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(25);
    obj.edit4:setType("float");
    obj.edit4:setField("custoInvento");
    obj.edit4:setName("edit4");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout5);
    obj.dataLink4:setFields({'custoInvento'});
    obj.dataLink4:setDefaultValues({'0'});
    obj.dataLink4:setName("dataLink4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout5);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setLeft(460);
    obj.edit5:setTop(30);
    obj.edit5:setWidth(30);
    obj.edit5:setHeight(25);
    obj.edit5:setType("float");
    obj.edit5:setField("tempoContruirRapido");
    obj.edit5:setName("edit5");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout5);
    obj.dataLink5:setFields({'tempoContruirRapido'});
    obj.dataLink5:setDefaultValues({'0'});
    obj.dataLink5:setName("dataLink5");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout5);
    obj.label20:setLeft(505);
    obj.label20:setTop(6);
    obj.label20:setText("CD de Construção:");
    lfm_setPropAsString(obj.label20, "fontStyle",  "bold");
    obj.label20:setWidth(190);
    obj.label20:setHeight(20);
    obj.label20:setName("label20");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout5);
    obj.label21:setLeft(505);
    obj.label21:setTop(30);
    obj.label21:setText("Tempo de Constr.:");
    lfm_setPropAsString(obj.label21, "fontStyle",  "bold");
    obj.label21:setWidth(190);
    obj.label21:setHeight(20);
    obj.label21:setName("label21");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout5);
    obj.rectangle14:setLeft(620);
    obj.rectangle14:setTop(3);
    obj.rectangle14:setWidth(33);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("#202020");
    obj.rectangle14:setStrokeColor("black");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.rectangle14);
    obj.label22:setText("0");
    obj.label22:setLeft(0);
    obj.label22:setTop(2);
    obj.label22:setWidth(33);
    obj.label22:setHeight(20);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setField("cdInventoC");
    obj.label22:setName("label22");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout5);
    obj.rectangle15:setLeft(620);
    obj.rectangle15:setTop(30);
    obj.rectangle15:setWidth(130);
    obj.rectangle15:setHeight(23);
    obj.rectangle15:setColor("#264d43");
    obj.rectangle15:setName("rectangle15");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.rectangle15);
    obj.label23:setVisible(false);
    obj.label23:setText("0");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setField("tempoConstruir");
    obj.label23:setName("label23");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.rectangle15);
    obj.label24:setText("0");
    obj.label24:setLeft(0);
    obj.label24:setTop(0);
    obj.label24:setWidth(130);
    obj.label24:setHeight(20);
    obj.label24:setHorzTextAlign("leading");
    obj.label24:setField("tempoShowConstruir");
    obj.label24:setName("label24");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout5);
    obj.dataLink6:setFields({'custoInvento', 'tempoContruirRapido', 'tempoConstruir'});
    obj.dataLink6:setDefaultValues({'0'});
    obj.dataLink6:setName("dataLink6");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.popTabelaMed:show();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            self.popTabelaTam:show();
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.VelocidadeTotal = 2^((tonumber(sheet.Velocidade1) or 0) + 2);
        end, obj);

    obj._e_event3 = obj.comboBox1:addEventListener("onChange",
        function (_)
            if sheet ~= nil then
            					local mod = "";
            					
            					if sheet.chaveVantagem == "1" then	mod = "Mova-se tanto antes quanto depois de sua ação padrão.";
            						elseif sheet.chaveVantagem == "2" then	mod = "Faça ataques de agarrar com apenas uma mão.";
            						elseif sheet.chaveVantagem == "3" then	mod = "Substitui Des por For em ataques para agarrar.";
            						elseif sheet.chaveVantagem == "4" then	mod = "Quando acerta um ataque desarmado, pode fazer um teste de agarrar como ação livre.";
            						elseif sheet.chaveVantagem == "5" then	mod = "Bônus de circunstância no ataque ou na defesa em determinado ambiente.";
            						elseif sheet.chaveVantagem == "6" then	mod = "Use a perícia Combate Desarmado com armas improvisadas, com bônus de dano de +1.";
            						elseif sheet.chaveVantagem == "7" then	mod = "Transfira o benefício de uma perícia de interação para um aliado.";
            						elseif sheet.chaveVantagem == "8" then	mod = "Use Especialidade: Magia para criar dispositivos mágicos temporários.";
            						elseif sheet.chaveVantagem == "9" then	mod = "Use Intimidação para fintar em combate.";
            						elseif sheet.chaveVantagem == "10" then	mod = "Bônus de +1 em testes de ataque à distância por graduação.";
            						elseif sheet.chaveVantagem == "11" then	mod = "Troque a CD do efeito por um bônus de ataque.";
            						elseif sheet.chaveVantagem == "12" then	mod = "Bônus de +1 em testes de ataque corpo-a-corpo por graduação.";
            						elseif sheet.chaveVantagem == "13" then	mod = "Troque um bônus de ataque por um bônus de defesa ativa.";
            						elseif sheet.chaveVantagem == "14" then	mod = "Ganhe um ataque extra quando incapacitar um capanga.";
            						elseif sheet.chaveVantagem == "15" then	mod = "Troque defesa ativa por um bônus de ataque.";
            						elseif sheet.chaveVantagem == "16" then	mod = "Troque bônus de ataque por bônus de efeito.";
            						elseif sheet.chaveVantagem == "17" then	mod = "Ignore penalidades em testes de ataque devido a cobertura ou camuflagem.";
            						elseif sheet.chaveVantagem == "18" then	mod = "Bônus de circunstância em perícias de interação baseado em sua aparência.";
            						elseif sheet.chaveVantagem == "19" then	mod = "Use Intuição para descobrir as habilidades de combate do oponente.";
            						elseif sheet.chaveVantagem == "20" then	mod = "Teste imediato de Investigação ou Percepção para saber alguma coisa.";
            						elseif sheet.chaveVantagem == "21" then	mod = "Chame ajuda ou consiga favores com um teste de Persuasão.";
            						elseif sheet.chaveVantagem == "22" then mod = "Ganhe uma gratificação ou benefício adicional.";
            						elseif sheet.chaveVantagem == "23" then	mod = "Ganhe um seguidor ou capanga com (15 x graduação) pontos de poder.";
            						elseif sheet.chaveVantagem == "24" then	mod = "Faça um teste inicial de Investigação em um minuto.";
            						elseif sheet.chaveVantagem == "25" then	mod = "+1 na ameaça de crítico com um ataque específico por graduação.";
            						elseif sheet.chaveVantagem == "26" then	mod = "Passe de caído para em pé como uma ação livre.";
            						elseif sheet.chaveVantagem == "27" then	mod = "Bônus de +2 em uma defesa ativa quando você usa a ação defender-se.";
            						elseif sheet.chaveVantagem == "28" then	mod = "Sem penalidade para usar a ação derrubar.";
            						elseif sheet.chaveVantagem == "29" then	mod = "Sem penalidade para usar a ação desarmar.";
            						elseif sheet.chaveVantagem == "30" then	mod = "Imune a efeitos de medo.";
            						elseif sheet.chaveVantagem == "31" then	mod = "Estabilize automaticamente quando moribundo.";
            						elseif sheet.chaveVantagem == "32" then	mod = "Use perícias de interação com animais.";
            						elseif sheet.chaveVantagem == "33" then	mod = "5 pontos de equipamento por graduação.";
            						elseif sheet.chaveVantagem == "34" then	mod = "Esconda-se quando observado sem precisar de uma distração.";
            						elseif sheet.chaveVantagem == "35" then	mod = "Ganhe dois benefícios quando usando esforço extra.";
            						elseif sheet.chaveVantagem == "36" then	mod = "Gaste um ponto heróico para ganhar um 20 efetivo em um teste específico.";
            						elseif sheet.chaveVantagem == "37" then	mod = "Você não fica vulnerável quando surpreso ou desatento.";
            						elseif sheet.chaveVantagem == "38" then	mod = "Sufoca um oponente que você tenha agarrado.";
            						elseif sheet.chaveVantagem == "39" then	mod = "Bônus de circunstância para evitar ataques de área.";
            						elseif sheet.chaveVantagem == "40" then	mod = "Use uma perícia de interação para prender a atenção dos outros.";
            						elseif sheet.chaveVantagem == "41" then	mod = "Use qualquer perícia sem treinamento.";
            						elseif sheet.chaveVantagem == "42" then	mod = "Sem penalidade por usar perícias sem as ferramentas apropriadas.";
            						elseif sheet.chaveVantagem == "43" then	mod = "Finte usando a perícia Acrobacia ou sua velocidade.";
            						elseif sheet.chaveVantagem == "44" then	mod = "Fale e compreenda idiomas adicionais.";
            						elseif sheet.chaveVantagem == "45" then	mod = "Penalidade de circunstância de –5 para escapar de você.";
            						elseif sheet.chaveVantagem == "46" then	mod = "Bônus de +4 por graduação em testes de iniciativa.";
            						elseif sheet.chaveVantagem == "47" then	mod = "Bônus de circunstância em testes contra um tipo de oponente.";
            						elseif sheet.chaveVantagem == "48" then	mod = "Gaste um ponto heróico para conceder a seus aliados um bônus de circunstância de +1 por graduação.";
            						elseif sheet.chaveVantagem == "49" then	mod = "Sofra um ataque mirado contra um aliado.";
            						elseif sheet.chaveVantagem == "50" then	mod = "Use Tecnologia para criar dispositivos temporários.";
            						elseif sheet.chaveVantagem == "51" then	mod = "Gaste um ponto heróico para remover uma condição de um aliado.";
            						elseif sheet.chaveVantagem == "52" then	mod = "Sem penalidade por lutar caído.";
            						elseif sheet.chaveVantagem == "53" then	mod = "Bônus de dano de +1 com armas arremessadas por graduação.";
            						elseif sheet.chaveVantagem == "54" then mod = "Realize testes de rotina com uma perícia sob quaisquer circunstâncias.";
            						elseif sheet.chaveVantagem == "55" then	mod = "Você se lembra de tudo, bônus de circunstância de +5 para se lembrar das coisas.";
            						elseif sheet.chaveVantagem == "56" then	mod = "Dobra os bônus de circunstância por mirar.";
            						elseif sheet.chaveVantagem == "57" then	mod = "Ganhe um parceiro com (5 x graduação) pontos de poder.";
            						elseif sheet.chaveVantagem == "58" then	mod = "Tentativa livre de desarme quando você se defende.";
            						elseif sheet.chaveVantagem == "59" then	mod = "Sem penalidade para usar a ação quebrar.";
            						elseif sheet.chaveVantagem == "60" then	mod = "Tentativa livre de quebrar quando você se defende.";
            						elseif sheet.chaveVantagem == "61" then	mod = "Use Percepção para seguir rastros.";
            						elseif sheet.chaveVantagem == "62" then	mod = "Use Enganação para redirecionar um ataque que falhe para outro alvo.";
            						elseif sheet.chaveVantagem == "63" then	mod = "Use Especialidade: Magia para criar e realizar rituais.";
            						elseif sheet.chaveVantagem == "64" then	mod = "Bônus de defesa ativa de +1 em Resistência por graduação.";
            						elseif sheet.chaveVantagem == "65" then	mod = "Saque uma arma como uma ação livre.";
            						elseif sheet.chaveVantagem == "66" then	mod = "Rerole um teste falho contra uma ameaça uma vez.";
            						elseif sheet.chaveVantagem == "67" then	mod = "Rerole uma rolagem uma vez por graduação.";
            						elseif sheet.chaveVantagem == "68" then	mod = "Gaste um ponto heróico para ganhar 5 graduações temporárias em uma perícia.";
            						elseif sheet.chaveVantagem == "69" then	mod = "+5 em testes envolvendo tolerância.";
            						elseif sheet.chaveVantagem == "70" then	mod = "Gaste um ponto heróico para agir primeiro na ordem de iniciativa.";
            						elseif sheet.chaveVantagem == "71" then	mod = "Use Enganação ou Intimidação para deixar um oponente tonto.";
            						elseif sheet.chaveVantagem == "72" then	mod = "+5 de bônus para ajudar em testes de equipe.";
            						elseif sheet.chaveVantagem == "73" then	mod = "Entre em um transe parecido com a morte que diminui as funções vitais.";
            						elseif sheet.chaveVantagem == "74" then	mod = "Use Enganação para desmoralizar em combate.";
            						elseif sheet.chaveVantagem == "75" then
            							mod =  " ";
            					end;
            					
            						sheet.ConsultaVantagem = mod;
            					
            				end;
        end, obj);

    obj._e_event4 = obj.comboBox2:addEventListener("onChange",
        function (_)
            if sheet ~= nil then
            					local mod = "";
            					
            					if sheet.chaveCondicao1 == "1" then mod = "Atordoado: não pode executar ações, nem mesmo ações livres.";
            						elseif sheet.chaveCondicao1 == "2" then mod = "Compelled: o personagem fica limitado a ações livres e a uma única ação padrão por turno, com todas as ações sendo escolhidas pelo personagem que o controla. Controlado se sobrepõe a compelido.";
            						elseif sheet.chaveCondicao1 == "3" then mod = "Controlled: Outro personagem dita suas ações.";
            						elseif sheet.chaveCondicao1 == "4" then mod = "Debilitated: o personagem tem uma ou mais das habilidades reduzida para abaixo de –5.";
            						elseif sheet.chaveCondicao1 == "5" then mod = "Desabled: penalidade de –5 em todos os testes. Caso se aplique à(s) mesma(s) característica(s), debilitado se sobrepõe a desabilitado.";
            						elseif sheet.chaveCondicao1 == "6" then mod = "Unaware: o personagem está completamente inconsciente dos arredores, incapaz de interagir ou de fazer testes de Percepção ou executar qualquer ação baseada neles. Alvos têm cobertura total contra todos os sentidos do personagem desatento.";
            						elseif sheet.chaveCondicao1 == "7" then mod = "Weakened: o personagem perdeu pontos de poder em uma característica temporariamente. Debilitado se sobrepõe a enfraquecido.";
            						elseif sheet.chaveCondicao1 == "8" then mod = "Fatigued: fica Impedido. Um personagem se recupera da condição fatigada com uma hora de descanso.";
            						elseif sheet.chaveCondicao1 == "9" then mod = "Immobile: não tem velocidade de movimento e não pode se mover do lugar em que se encontram, embora ainda sejam capazes de executar ações.";
            						elseif sheet.chaveCondicao1 == "10" then mod = "Hindered: se move a metade de seu movimento normal (–1 graduação de velocidade). Imóvel se sobrepõe a impedido.";
            						elseif sheet.chaveCondicao1 == "11" then mod = "Defenseless: o bônus das defesas ativas de um personagem indefeso é 0. Atacantes podem atacar oponentes indefesos com testes de rotina. Se o atacante preferir fazer um teste de ataque normal, todos os acertos serão tratados como acertos críticos.";
            						elseif sheet.chaveCondicao1 == "12" then mod = "Normal: o personagem não está sob o efeito de nenhuma condição.";
            						elseif sheet.chaveCondicao1 == "13" then mod = "Impaired: sofre uma penalidade de circunstância de –2 em todos os testes. Caso se aplique à(s) mesma(s) característica(s), desabilitado se sobrepõe a prejudicado.";
            						elseif sheet.chaveCondicao1 == "14" then mod = "Dazed: fica limitado a ações livres e a uma única ação padrão por turno. Atordoado se sobrepõe a tonto.";
            						elseif sheet.chaveCondicao1 == "15" then mod = "Transformed: algumas ou todas as características do personagem são alteradas.";
            						elseif sheet.chaveCondicao1 == "16" then mod = "Vulnerable: divide suas defesas ativas pela metade (arredonde o resultado para cima). Indefeso se sobrepõe a vulnerável.";
            						elseif sheet.chaveCondicao1 == "17" then	mod =  " ";
            					end;
            						sheet.ConsultaCondicao1 = mod;
            					
            				end;
        end, obj);

    obj._e_event5 = obj.comboBox3:addEventListener("onChange",
        function (_)
            if sheet ~= nil then
            					local mod = "";
            					
            					if sheet.chaveCondicao2 == "1" then mod = "Staggered: Tonto e impedido.";
            						elseif sheet.chaveCondicao2 == "2" then mod = "Asleep: Indefeso, imóvel e prejudicado.";
            						elseif sheet.chaveCondicao2 == "3" then mod = "Prone: um personagem caído jaz no chão, sofrendo uma penalidade de –5 em testes de combate corpo-a-corpo. Os oponentes ganham um bônus de +5 em testes de combate corpo-a-corpo, mas sofrem uma penalidade de –5 em testes de ataque à distância (na prática, o personagem caído tem cobertura total contra ataques à distância). Personagens caídos estão impedidos. Ficar de pé é uma ação de movimento.";
            						elseif sheet.chaveCondicao2 == "4" then mod = "Blind: Impedido, visualmente desatento e vulnerável, e pode estar prejudicado ou desabilidade para atividades visuais.";
            						elseif sheet.chaveCondicao2 == "5" then mod = "Exhausted: Prejudicado e impedido, recupere após 1 hora de descanso.";
            						elseif sheet.chaveCondicao2 == "6" then mod = "Incapacitated: Indefeso, atordoado e desatento. Normalmente ficam caídos.";
            						elseif sheet.chaveCondicao2 == "7" then mod = "Dying: Incapacitado e próximo da morte.";
            						elseif sheet.chaveCondicao2 == "8" then mod = "Paralyzed: Indefeso, imóvel e fisicamente atordoado; pode ser capaz de realizar ações mentais.";
            						elseif sheet.chaveCondicao2 == "9" then mod = "Restrained: Impedido e vunerável. Se o que quer que o restrinja estiver preso a um objeto imóvel, o personagem está imóvel ao invés de impedido.";
            						elseif sheet.chaveCondicao2 == "10" then mod = "Deaf: Não pode ouvir, o que concede a tudo e todos camuflagem auditiva total contra ele.";
            						elseif sheet.chaveCondicao2 == "11" then mod = "Surprised: Atordoado e vulnerável.";
            						elseif sheet.chaveCondicao2 == "12" then mod = "Entranced: Atordoado, mas só pode prestar atenção no efeito que o mantém em transe. Um aliado pode libertar o personagem desta condição com um teste de qualquer perícia de interação (CD 10+grad).";
            						elseif sheet.chaveCondicao2 == "13" then mod =  " ";
            					end;
            						sheet.ConsultaCondicao2 = mod;
            					
            				end;
        end, obj);

    obj._e_event6 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if tonumber (sheet.tempoProjetoRapido) ~= nil then
            					sheet.tempoProjeto = (tonumber(sheet.custoInvento) or 0) / (2 ^ (tonumber(sheet.tempoProjetoRapido) or 0));
            					sheet.cdProjeto = (tonumber(sheet.custoInvento) or 0) + 10 + (5 * (tonumber(sheet.tempoProjetoRapido) or 0));
            				else
            					sheet.tempoProjeto = (tonumber(sheet.custoInvento) or 0) ;
            					sheet.cdProjeto = (tonumber(sheet.custoInvento) or 0) + 10 ;
            				end;
            				
            				if tonumber (sheet.tempoProjeto) ~= nil then
            					if tonumber(sheet.tempoProjeto) >= 1 then
            						sheet.tempoShowProjeto = sheet.tempoProjeto .. " ≅ horas";
            					elseif tonumber(sheet.tempoProjeto) >= 0 then
            						if tonumber (sheet.tempoProjetoRapido) ~= nil then
            							if tonumber(sheet.tempoProjetoRapido) >= 6 then
            								sheet.tempoShowProjeto = tonumber(sheet.tempoProjeto * 60 * 60) .. " ≅ seg.";
            							else
            								sheet.tempoShowProjeto = tonumber(sheet.tempoProjeto * 60) .. " ≅ min.";
            							end;
            						end;
            					else
            						sheet.tempoShowProjeto = tonumber(60 / tonumber(sheet.tempoProjeto)) .. " ≅ seg.";
            					end;
            				end;
        end, obj);

    obj._e_event7 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if tonumber (sheet.tempoContruirRapido) ~= nil then
            					sheet.tempoConstruir = ((tonumber(sheet.custoInvento) or 0) * 4) / (2 ^ (tonumber(sheet.tempoContruirRapido) or 0));
            					sheet.cdInventoC = (tonumber(sheet.custoInvento) or 0) + 10 + (5 * (tonumber(sheet.tempoContruirRapido) or 0));
            				else
            					sheet.tempoConstruir = (tonumber(sheet.custoInvento) or 0) * 4 ;
            					sheet.cdInventoC = (tonumber(sheet.custoInvento) or 0) + 10 ;
            				end;
            				if tonumber (sheet.tempoConstruir) ~= nil then
            					if tonumber(sheet.tempoConstruir) >= 1 then
            						sheet.tempoShowConstruir = sheet.tempoConstruir .. " ≅ horas";
            					elseif tonumber(sheet.tempoConstruir) >= 0 then
            						if tonumber (sheet.tempoContruirRapido) ~= nil then
            							if tonumber(sheet.tempoContruirRapido) >= 6 then
            								sheet.tempoShowConstruir = tonumber(sheet.tempoConstruir * 60 * 60) .. " ≅ seg.";
            							else
            								sheet.tempoShowConstruir = tonumber(sheet.tempoConstruir * 60) .. " ≅ min.";
            							end;
            						end;
            					else
            						sheet.tempoShowConstruir = tonumber(60 / tonumber(sheet.tempoConstruir)) .. " ≅ seg.";
            					end;
            				end;
        end, obj);

    function obj:_releaseEvents()
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
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.popTabelaMed ~= nil then self.popTabelaMed:destroy(); self.popTabelaMed = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.popTabelaTam ~= nil then self.popTabelaTam:destroy(); self.popTabelaTam = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha_MM3ed_RRPG_Consultas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha_MM3ed_RRPG_Consultas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha_MM3ed_RRPG_Consultas = {
    newEditor = newfrmFicha_MM3ed_RRPG_Consultas, 
    new = newfrmFicha_MM3ed_RRPG_Consultas, 
    name = "frmFicha_MM3ed_RRPG_Consultas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha_MM3ed_RRPG_Consultas = _frmFicha_MM3ed_RRPG_Consultas;
Firecast.registrarForm(_frmFicha_MM3ed_RRPG_Consultas);

return _frmFicha_MM3ed_RRPG_Consultas;
