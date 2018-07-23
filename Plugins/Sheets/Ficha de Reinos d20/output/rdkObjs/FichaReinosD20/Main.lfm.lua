require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTemplate()
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
    obj:setName("frmTemplate");
    obj:setFormType("sheetTemplate");
    obj:setDataType("Ambesek.Nefertyne.Reinos");
    obj:setTitle("Ficha Reinos d20");
    obj:setAlign("client");
    obj:setTheme("dark");


        local function isNewVersion(installed, downloaded)
            local installedVersion = {};
            local installedIndex = 0;
            for i in string.gmatch(installed, "[^%.]+") do
                installedIndex = installedIndex +1;
                installedVersion[installedIndex] = i;
            end

            local downloadedVersion = {};
            local downloadedIndex = 0;
            for i in string.gmatch(downloaded, "[^%.]+") do
                downloadedIndex = downloadedIndex +1;
                downloadedVersion[downloadedIndex] = i;
            end

            for i=1, math.min(installedIndex, downloadedIndex), 1 do 
                if (tonumber(installedVersion[i]) or 0) > (tonumber(downloadedVersion[i]) or 0) then
                    return false;
                elseif (tonumber(installedVersion[i]) or 0) < (tonumber(downloadedVersion[i]) or 0) then
                    return true;
                end;
            end;

            if downloadedIndex > installedIndex then
                return true;
            else
                return false;
            end;
        end;
        


    obj.tabControl = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl:setParent(obj);
    obj.tabControl:setAlign("client");
    obj.tabControl:setName("tabControl");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl);
    obj.tab1:setTitle("Reino");
    obj.tab1:setName("tab1");

    obj.frmKingdom = GUI.fromHandle(_obj_newObject("form"));
    obj.frmKingdom:setParent(obj.tab1);
    obj.frmKingdom:setName("frmKingdom");
    obj.frmKingdom:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.frmKingdom);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(1240);
    obj.layout1:setHeight(30);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(30);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(95);
    obj.label1:setHeight(20);
    obj.label1:setText("Reino");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(95);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(20);
    obj.edit1:setField("reino");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(210);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(30);
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(95);
    obj.label2:setHeight(20);
    obj.label2:setText("População");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(95);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(100);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(95);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setField("populacao");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(420);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(200);
    obj.layout4:setHeight(30);
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(95);
    obj.label4:setHeight(20);
    obj.label4:setText("Riqueza");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setLeft(95);
    obj.rectangle3:setTop(5);
    obj.rectangle3:setWidth(100);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setLeft(95);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setField("riqueza");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(830);
    obj.layout5:setTop(0);
    obj.layout5:setWidth(410);
    obj.layout5:setHeight(30);
    obj.layout5:setName("layout5");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(35);
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setHeight(275);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.rclDestalhesDoReino = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDestalhesDoReino:setParent(obj.scrollBox1);
    obj.rclDestalhesDoReino:setLeft(0);
    obj.rclDestalhesDoReino:setTop(35);
    obj.rclDestalhesDoReino:setWidth(200);
    obj.rclDestalhesDoReino:setHeight(270);
    obj.rclDestalhesDoReino:setName("rclDestalhesDoReino");
    obj.rclDestalhesDoReino:setField("listaDeDestalhesDoReino");
    obj.rclDestalhesDoReino:setTemplateForm("frmKingdomSelection");
    obj.rclDestalhesDoReino:setLayout("vertical");
    obj.rclDestalhesDoReino:setSelectable(true);
    obj.rclDestalhesDoReino:setMinQt(9);

    obj.boxDetalhesDoReino = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoReino:setParent(obj.scrollBox1);
    obj.boxDetalhesDoReino:setLeft(210);
    obj.boxDetalhesDoReino:setTop(35);
    obj.boxDetalhesDoReino:setWidth(1030);
    obj.boxDetalhesDoReino:setHeight(535);
    obj.boxDetalhesDoReino:setName("boxDetalhesDoReino");
    obj.boxDetalhesDoReino:setVisible(false);

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.boxDetalhesDoReino);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("$(field)");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl);
    obj.tab2:setTitle("Mapa");
    obj.tab2:setName("tab2");

    obj.frmMap = GUI.fromHandle(_obj_newObject("form"));
    obj.frmMap:setParent(obj.tab2);
    obj.frmMap:setName("frmMap");
    obj.frmMap:setAlign("client");

    obj.mapa = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.mapa:setParent(obj.frmMap);
    obj.mapa:setAlign("client");
    obj.mapa:setName("mapa");

    obj.sizeLayout = GUI.fromHandle(_obj_newObject("layout"));
    obj.sizeLayout:setParent(obj.mapa);
    obj.sizeLayout:setName("sizeLayout");
    obj.sizeLayout:setLeft(1160);
    obj.sizeLayout:setTop(0);
    obj.sizeLayout:setWidth(110);
    obj.sizeLayout:setHeight(200);

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.sizeLayout);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.sizeLayout);
    obj.label6:setLeft(0);
    obj.label6:setTop(5);
    obj.label6:setWidth(110);
    obj.label6:setHeight(20);
    obj.label6:setText("Altura Cidade");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setHint("Tamanho vertical em pixels dos botões/cidades do mapa. ");
    obj.label6:setHitTest(true);
    obj.label6:setName("label6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.sizeLayout);
    obj.edit2:setLeft(5);
    obj.edit2:setTop(25);
    obj.edit2:setWidth(100);
    obj.edit2:setHeight(20);
    obj.edit2:setField("altura");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setHint("Tamanho vertical dos botões/cidades do mapa. ");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.sizeLayout);
    obj.dataLink1:setField("altura");
    obj.dataLink1:setDefaultValue("25");
    obj.dataLink1:setName("dataLink1");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.sizeLayout);
    obj.label7:setLeft(0);
    obj.label7:setTop(55);
    obj.label7:setWidth(110);
    obj.label7:setHeight(20);
    obj.label7:setText("Largura Cidade");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setHint("Tamanho horizontal em pixels dos botões/cidades do mapa. ");
    obj.label7:setHitTest(true);
    obj.label7:setName("label7");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.sizeLayout);
    obj.edit3:setLeft(5);
    obj.edit3:setTop(75);
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(20);
    obj.edit3:setField("largura");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setHint("Tamanho horizontal dos botões/cidades do mapa. ");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.sizeLayout);
    obj.dataLink2:setField("largura");
    obj.dataLink2:setDefaultValue("25");
    obj.dataLink2:setName("dataLink2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.sizeLayout);
    obj.label8:setLeft(0);
    obj.label8:setTop(105);
    obj.label8:setWidth(110);
    obj.label8:setHeight(20);
    obj.label8:setText("Altura Lugares");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setHint("Tamanho vertical em pixels dos botões/lugares do mapa. ");
    obj.label8:setHitTest(true);
    obj.label8:setName("label8");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.sizeLayout);
    obj.edit4:setLeft(5);
    obj.edit4:setTop(125);
    obj.edit4:setWidth(100);
    obj.edit4:setHeight(20);
    obj.edit4:setField("altura2");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setHint("Tamanho vertical dos botões/lugares do mapa. ");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.sizeLayout);
    obj.dataLink3:setField("altura2");
    obj.dataLink3:setDefaultValue("30");
    obj.dataLink3:setName("dataLink3");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.sizeLayout);
    obj.label9:setLeft(0);
    obj.label9:setTop(155);
    obj.label9:setWidth(110);
    obj.label9:setHeight(20);
    obj.label9:setText("Largura Lugares");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setHint("Tamanho horizontal em pixels dos botões/lugares do mapa. ");
    obj.label9:setHitTest(true);
    obj.label9:setName("label9");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.sizeLayout);
    obj.edit5:setLeft(5);
    obj.edit5:setTop(175);
    obj.edit5:setWidth(100);
    obj.edit5:setHeight(20);
    obj.edit5:setField("largura2");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setHint("Tamanho horizontal dos botões/lugares do mapa. ");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.sizeLayout);
    obj.dataLink4:setField("largura2");
    obj.dataLink4:setDefaultValue("30");
    obj.dataLink4:setName("dataLink4");

    obj.mapRectangle = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.mapRectangle:setParent(obj.mapa);
    obj.mapRectangle:setLeft(0);
    obj.mapRectangle:setTop(0);
    obj.mapRectangle:setWidth(1152);
    obj.mapRectangle:setHeight(648);
    obj.mapRectangle:setColor("black");
    obj.mapRectangle:setName("mapRectangle");

    obj.mapImage = GUI.fromHandle(_obj_newObject("image"));
    obj.mapImage:setParent(obj.mapa);
    obj.mapImage:setWidth(1152);
    obj.mapImage:setHeight(648);
    obj.mapImage:setField("mapa");
    obj.mapImage:setName("mapImage");
    obj.mapImage:setHitTest(true);
    obj.mapImage:setStyle("proportional");
    obj.mapImage:setHint("Clique para alterar Imagem, shift+clique para adicionar Cidade, ctrl+clique para adicionar Ponto de Interesse, alt+clique para alternar o zoom. ");


			_obj_setProp(self.mapImage.handle, "Stretch", true);
		


    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl);
    obj.tab3:setTitle("Cidades");
    obj.tab3:setName("tab3");

    obj.frmCities = GUI.fromHandle(_obj_newObject("form"));
    obj.frmCities:setParent(obj.tab3);
    obj.frmCities:setName("frmCities");
    obj.frmCities:setAlign("client");

    obj.scrollBox2 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.frmCities);
    obj.scrollBox2:setAlign("client");
    obj.scrollBox2:setName("scrollBox2");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.scrollBox2);
    obj.rectangle6:setLeft(0);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(200);
    obj.rectangle6:setHeight(600);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.rclDestalhesDaCidade = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDestalhesDaCidade:setParent(obj.scrollBox2);
    obj.rclDestalhesDaCidade:setLeft(0);
    obj.rclDestalhesDaCidade:setTop(0);
    obj.rclDestalhesDaCidade:setWidth(200);
    obj.rclDestalhesDaCidade:setHeight(595);
    obj.rclDestalhesDaCidade:setName("rclDestalhesDaCidade");
    obj.rclDestalhesDaCidade:setField("listaDeDestalhesDaCidade");
    obj.rclDestalhesDaCidade:setTemplateForm("frmCitySelection");
    obj.rclDestalhesDaCidade:setLayout("vertical");
    obj.rclDestalhesDaCidade:setSelectable(true);

    obj.boxDetalhesDaCidade = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDaCidade:setParent(obj.scrollBox2);
    obj.boxDetalhesDaCidade:setLeft(210);
    obj.boxDetalhesDaCidade:setTop(0);
    obj.boxDetalhesDaCidade:setWidth(1030);
    obj.boxDetalhesDaCidade:setHeight(600);
    obj.boxDetalhesDaCidade:setName("boxDetalhesDaCidade");
    obj.boxDetalhesDaCidade:setVisible(false);

    obj.scrollBox3 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox3:setParent(obj.boxDetalhesDaCidade);
    obj.scrollBox3:setAlign("client");
    obj.scrollBox3:setName("scrollBox3");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.scrollBox3);
    obj.rectangle7:setLeft(0);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(1010);
    obj.rectangle7:setHeight(3070);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.scrollBox3);
    obj.label10:setLeft(0);
    obj.label10:setTop(5);
    obj.label10:setWidth(100);
    obj.label10:setHeight(20);
    obj.label10:setText("Tamanho");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setHitTest(true);
    obj.label10:setName("label10");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.scrollBox3);
    obj.comboBox1:setLeft(90);
    obj.comboBox1:setTop(5);
    obj.comboBox1:setWidth(130);
    obj.comboBox1:setHeight(20);
    obj.comboBox1:setField("tamanho");
    obj.comboBox1:setItems({'Lugarejo','Povoado','Aldeia','Vila Pequena','Vila Grande','Cidade Pequena','Cidade Grande','Metrópole','Metrópole Planar'});
    obj.comboBox1:setFontSize(11);
    obj.comboBox1:setName("comboBox1");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.scrollBox3);
    obj.label11:setLeft(200);
    obj.label11:setTop(5);
    obj.label11:setWidth(100);
    obj.label11:setHeight(20);
    obj.label11:setText("Tipo");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setHitTest(true);
    obj.label11:setName("label11");

    obj.cidade_tipo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cidade_tipo:setParent(obj.scrollBox3);
    obj.cidade_tipo:setLeft(280);
    obj.cidade_tipo:setTop(5);
    obj.cidade_tipo:setWidth(100);
    obj.cidade_tipo:setHeight(20);
    obj.cidade_tipo:setField("tipo");
    obj.cidade_tipo:setName("cidade_tipo");
    obj.cidade_tipo:setItems({'Rural','Fronteira','Civil','Urbana'});
    obj.cidade_tipo:setHint("");
    obj.cidade_tipo:setFontSize(11);

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.scrollBox3);
    obj.label12:setLeft(400);
    obj.label12:setTop(5);
    obj.label12:setWidth(100);
    obj.label12:setHeight(20);
    obj.label12:setText("Composição Racial");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(11);
    obj.label12:setHitTest(true);
    obj.label12:setName("label12");

    obj.cidade_composicao = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cidade_composicao:setParent(obj.scrollBox3);
    obj.cidade_composicao:setLeft(500);
    obj.cidade_composicao:setTop(5);
    obj.cidade_composicao:setWidth(130);
    obj.cidade_composicao:setHeight(20);
    obj.cidade_composicao:setField("composicao");
    obj.cidade_composicao:setName("cidade_composicao");
    obj.cidade_composicao:setItems({'Isolada','Miscigenada','Integrada'});
    obj.cidade_composicao:setFontSize(11);

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.scrollBox3);
    obj.label13:setLeft(620);
    obj.label13:setTop(5);
    obj.label13:setWidth(100);
    obj.label13:setHeight(20);
    obj.label13:setText("Economia");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setFontSize(11);
    obj.label13:setHitTest(true);
    obj.label13:setName("label13");

    obj.cidade_economia = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cidade_economia:setParent(obj.scrollBox3);
    obj.cidade_economia:setLeft(700);
    obj.cidade_economia:setTop(5);
    obj.cidade_economia:setWidth(100);
    obj.cidade_economia:setHeight(20);
    obj.cidade_economia:setField("economia");
    obj.cidade_economia:setName("cidade_economia");
    obj.cidade_economia:setItems({'Fabricação','Agropecuária','Exploração','Vendas'});
    obj.cidade_economia:setFontSize(11);

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.scrollBox3);
    obj.checkBox1:setLeft(810);
    obj.checkBox1:setTop(5);
    obj.checkBox1:setWidth(100);
    obj.checkBox1:setHeight(20);
    obj.checkBox1:setField("capital");
    obj.checkBox1:setText("Capital");
    obj.checkBox1:setName("checkBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox3);
    obj.button1:setLeft(900);
    obj.button1:setTop(5);
    obj.button1:setWidth(100);
    obj.button1:setHeight(45);
    obj.button1:setText("Aleatorio");
    obj.button1:setHorzTextAlign("center");
    obj.button1:setFontSize(15);
    obj.button1:setHint("Cria uma cidade aleatoria. ");
    obj.button1:setName("button1");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.scrollBox3);
    obj.label14:setLeft(0);
    obj.label14:setTop(30);
    obj.label14:setWidth(100);
    obj.label14:setHeight(20);
    obj.label14:setText("População");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setFontSize(11);
    obj.label14:setHint("Quantidade de adultos. Crianças e Idosos é cerca de 30% desse valor. ");
    obj.label14:setHitTest(true);
    obj.label14:setName("label14");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.scrollBox3);
    obj.edit6:setLeft(100);
    obj.edit6:setTop(30);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(20);
    obj.edit6:setField("populacao");
    obj.edit6:setType("number");
    obj.edit6:setMin(0);
    obj.edit6:setName("edit6");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.scrollBox3);
    obj.label15:setLeft(200);
    obj.label15:setTop(30);
    obj.label15:setWidth(100);
    obj.label15:setHeight(20);
    obj.label15:setText("Limite de PO");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setFontSize(11);
    obj.label15:setHint("Preço do item mais caro da cidade. ");
    obj.label15:setHitTest(true);
    obj.label15:setName("label15");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.scrollBox3);
    obj.edit7:setLeft(300);
    obj.edit7:setTop(30);
    obj.edit7:setWidth(100);
    obj.edit7:setHeight(20);
    obj.edit7:setField("limitePO");
    obj.edit7:setName("edit7");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.scrollBox3);
    obj.label16:setLeft(400);
    obj.label16:setTop(30);
    obj.label16:setWidth(100);
    obj.label16:setHeight(20);
    obj.label16:setText("Riqueza Total");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setFontSize(11);
    obj.label16:setHint("Quantidade de dinheiro que pode ser usada em vendas e compras de um mesmo tipo de item. ");
    obj.label16:setHitTest(true);
    obj.label16:setName("label16");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.scrollBox3);
    obj.edit8:setLeft(500);
    obj.edit8:setTop(30);
    obj.edit8:setWidth(100);
    obj.edit8:setHeight(20);
    obj.edit8:setField("riqueza");
    obj.edit8:setName("edit8");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.scrollBox3);
    obj.dataLink5:setFields({'populacao','tipo'});
    obj.dataLink5:setName("dataLink5");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.scrollBox3);
    obj.label17:setLeft(600);
    obj.label17:setTop(30);
    obj.label17:setWidth(100);
    obj.label17:setHeight(20);
    obj.label17:setText("Fundação");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setFontSize(11);
    obj.label17:setHint("Ano de fundação da cidade. ");
    obj.label17:setHitTest(true);
    obj.label17:setName("label17");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.scrollBox3);
    obj.edit9:setLeft(700);
    obj.edit9:setTop(30);
    obj.edit9:setWidth(100);
    obj.edit9:setHeight(20);
    obj.edit9:setField("fundacao");
    obj.edit9:setName("edit9");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.scrollBox3);
    obj.label18:setLeft(5);
    obj.label18:setTop(55);
    obj.label18:setWidth(1000);
    obj.label18:setHeight(20);
    obj.label18:setText("Descrição");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.richEdit2 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit2:setParent(obj.scrollBox3);
    obj.richEdit2:setLeft(5);
    obj.richEdit2:setTop(80);
    obj.richEdit2:setWidth(1000);
    obj.richEdit2:setHeight(400);
    obj.richEdit2:setField("descricao");
    lfm_setPropAsString(obj.richEdit2, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit2, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit2, "defaultFontColor",  "white");
    obj.richEdit2:setName("richEdit2");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.scrollBox3);
    obj.label19:setLeft(5);
    obj.label19:setTop(485);
    obj.label19:setWidth(1000);
    obj.label19:setHeight(20);
    obj.label19:setText("Historia");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.richEdit3 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit3:setParent(obj.scrollBox3);
    obj.richEdit3:setLeft(5);
    obj.richEdit3:setTop(510);
    obj.richEdit3:setWidth(1000);
    obj.richEdit3:setHeight(400);
    obj.richEdit3:setField("historia");
    lfm_setPropAsString(obj.richEdit3, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit3, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit3, "defaultFontColor",  "white");
    obj.richEdit3:setName("richEdit3");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.scrollBox3);
    obj.label20:setLeft(5);
    obj.label20:setTop(915);
    obj.label20:setWidth(1000);
    obj.label20:setHeight(20);
    obj.label20:setText("Boatos");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.richEdit4 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit4:setParent(obj.scrollBox3);
    obj.richEdit4:setLeft(5);
    obj.richEdit4:setTop(940);
    obj.richEdit4:setWidth(1000);
    obj.richEdit4:setHeight(300);
    obj.richEdit4:setField("boatos");
    lfm_setPropAsString(obj.richEdit4, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit4, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit4, "defaultFontColor",  "white");
    obj.richEdit4:setName("richEdit4");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.scrollBox3);
    obj.label21:setLeft(0);
    obj.label21:setTop(1245);
    obj.label21:setWidth(100);
    obj.label21:setHeight(20);
    obj.label21:setText("Politica");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.scrollBox3);
    obj.checkBox2:setLeft(100);
    obj.checkBox2:setTop(1245);
    obj.checkBox2:setWidth(100);
    obj.checkBox2:setHeight(20);
    obj.checkBox2:setField("politica_1");
    obj.checkBox2:setText("Monarquia");
    obj.checkBox2:setHint("O poder é hereditário e possui apenas duas classes sociais: nobreza e plebe.");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.scrollBox3);
    obj.checkBox3:setLeft(200);
    obj.checkBox3:setTop(1245);
    obj.checkBox3:setWidth(100);
    obj.checkBox3:setHeight(20);
    obj.checkBox3:setField("politica_2");
    obj.checkBox3:setText("Tribal");
    obj.checkBox3:setHint("O poder é dado ao mais capaz e se ele for julgado incapaz pode perder esse direito.");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.scrollBox3);
    obj.checkBox4:setLeft(300);
    obj.checkBox4:setTop(1245);
    obj.checkBox4:setWidth(100);
    obj.checkBox4:setHeight(20);
    obj.checkBox4:setField("politica_3");
    obj.checkBox4:setText("Feudal");
    obj.checkBox4:setHint("O poder é hereditário, mas possui varias classes sociais de nobreza e plebe.");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.scrollBox3);
    obj.checkBox5:setLeft(400);
    obj.checkBox5:setTop(1245);
    obj.checkBox5:setWidth(100);
    obj.checkBox5:setHeight(20);
    obj.checkBox5:setField("politica_4");
    obj.checkBox5:setText("República");
    obj.checkBox5:setHint("O governo é criado através de eleições onde apenas os representantes do povo (como um conselho ou assembleia) podem votar e escolher o seu líder.");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.scrollBox3);
    obj.checkBox6:setLeft(500);
    obj.checkBox6:setTop(1245);
    obj.checkBox6:setWidth(100);
    obj.checkBox6:setHeight(20);
    obj.checkBox6:setField("politica_5");
    obj.checkBox6:setText("Democracia");
    obj.checkBox6:setHint("Todos os cidadãos têm o direito de votar para escolher seu líder. Observe que nem todos da sociedade podem ser considerados cidadãos, mas diferente da república é um grupo muito maior.");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.scrollBox3);
    obj.checkBox7:setLeft(600);
    obj.checkBox7:setTop(1245);
    obj.checkBox7:setWidth(100);
    obj.checkBox7:setHeight(20);
    obj.checkBox7:setField("politica_6");
    obj.checkBox7:setText("Magocracia");
    obj.checkBox7:setHint("O governante é o conjurador arcano mais poderoso.");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.scrollBox3);
    obj.checkBox8:setLeft(700);
    obj.checkBox8:setTop(1245);
    obj.checkBox8:setWidth(100);
    obj.checkBox8:setHeight(20);
    obj.checkBox8:setField("politica_7");
    obj.checkBox8:setText("Teocracia");
    obj.checkBox8:setHint("O governante é o conjurador divino mais poderoso de determinada religião.");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.scrollBox3);
    obj.checkBox9:setLeft(800);
    obj.checkBox9:setTop(1245);
    obj.checkBox9:setWidth(100);
    obj.checkBox9:setHeight(20);
    obj.checkBox9:setField("politica_8");
    obj.checkBox9:setText("Plutocracia");
    obj.checkBox9:setHint("O poder é exercido pela pessoa mais rica.");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.scrollBox3);
    obj.checkBox10:setLeft(900);
    obj.checkBox10:setTop(1245);
    obj.checkBox10:setWidth(100);
    obj.checkBox10:setHeight(20);
    obj.checkBox10:setField("politica_9");
    obj.checkBox10:setText("Outro");
    obj.checkBox10:setHint("");
    obj.checkBox10:setName("checkBox10");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.scrollBox3);
    obj.label22:setLeft(0);
    obj.label22:setTop(1270);
    obj.label22:setWidth(100);
    obj.label22:setHeight(20);
    obj.label22:setText("Militarização");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.cidade_militarizacao = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.cidade_militarizacao:setParent(obj.scrollBox3);
    obj.cidade_militarizacao:setLeft(100);
    obj.cidade_militarizacao:setTop(1270);
    obj.cidade_militarizacao:setWidth(100);
    obj.cidade_militarizacao:setHeight(20);
    obj.cidade_militarizacao:setField("militarizacao");
    obj.cidade_militarizacao:setName("cidade_militarizacao");
    obj.cidade_militarizacao:setItems({'Baixo','Médio','Alto','Guerra'});
    obj.cidade_militarizacao:setHint("");
    obj.cidade_militarizacao:setFontSize(11);

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.scrollBox3);
    obj.label23:setLeft(200);
    obj.label23:setTop(1270);
    obj.label23:setWidth(100);
    obj.label23:setHeight(20);
    obj.label23:setText("Guardas");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setHitTest(true);
    obj.label23:setHint("Número de guardas patrulhando as ruas a qualquer momento e diariamente. ");
    obj.label23:setName("label23");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.scrollBox3);
    obj.rectangle8:setLeft(300);
    obj.rectangle8:setTop(1270);
    obj.rectangle8:setWidth(100);
    obj.rectangle8:setHeight(20);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.scrollBox3);
    obj.label24:setLeft(300);
    obj.label24:setTop(1270);
    obj.label24:setWidth(100);
    obj.label24:setHeight(20);
    obj.label24:setField("guardas");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setHitTest(true);
    obj.label24:setHint("Número de guardas patrulhando as ruas a qualquer momento e diariamente. ");
    obj.label24:setName("label24");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.scrollBox3);
    obj.label25:setLeft(400);
    obj.label25:setTop(1270);
    obj.label25:setWidth(100);
    obj.label25:setHeight(20);
    obj.label25:setText("Reservistas");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setHitTest(true);
    obj.label25:setHint("Número de guardas não oficiais ou de folga. Podem ser chamados para ajudar em caso de emergencias e demoram cerca de uma hora para todos chegarem.");
    obj.label25:setName("label25");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.scrollBox3);
    obj.rectangle9:setLeft(500);
    obj.rectangle9:setTop(1270);
    obj.rectangle9:setWidth(100);
    obj.rectangle9:setHeight(20);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.scrollBox3);
    obj.label26:setLeft(500);
    obj.label26:setTop(1270);
    obj.label26:setWidth(100);
    obj.label26:setHeight(20);
    obj.label26:setField("reservistas");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setHitTest(true);
    obj.label26:setHint("Número de guardas não oficiais ou de folga. Podem ser chamados para ajudar em caso de emergencias e demoram cerca de uma hora para todos chegarem.");
    obj.label26:setName("label26");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.scrollBox3);
    obj.dataLink6:setFields({'populacao','militarizacao'});
    obj.dataLink6:setName("dataLink6");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.scrollBox3);
    obj.label27:setLeft(5);
    obj.label27:setTop(1295);
    obj.label27:setWidth(1000);
    obj.label27:setHeight(20);
    obj.label27:setText("Poderes");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setHitTest(true);
    obj.label27:setHint("Descreva a forma de governo e quem são os poderes da cidade, assim como sua relação entre si.");
    obj.label27:setName("label27");

    obj.richEdit5 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit5:setParent(obj.scrollBox3);
    obj.richEdit5:setLeft(5);
    obj.richEdit5:setTop(1320);
    obj.richEdit5:setWidth(1000);
    obj.richEdit5:setHeight(300);
    obj.richEdit5:setField("poderes");
    lfm_setPropAsString(obj.richEdit5, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit5, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit5, "defaultFontColor",  "white");
    obj.richEdit5:setName("richEdit5");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.scrollBox3);
    obj.label28:setLeft(5);
    obj.label28:setTop(1625);
    obj.label28:setWidth(1000);
    obj.label28:setHeight(20);
    obj.label28:setText("Pessoas Importantes");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.richEdit6 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit6:setParent(obj.scrollBox3);
    obj.richEdit6:setLeft(5);
    obj.richEdit6:setTop(1650);
    obj.richEdit6:setWidth(1000);
    obj.richEdit6:setHeight(300);
    obj.richEdit6:setField("pessoas");
    lfm_setPropAsString(obj.richEdit6, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit6, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit6, "defaultFontColor",  "white");
    obj.richEdit6:setName("richEdit6");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.scrollBox3);
    obj.label29:setLeft(5);
    obj.label29:setTop(1955);
    obj.label29:setWidth(1000);
    obj.label29:setHeight(20);
    obj.label29:setText("Organizações");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.richEdit7 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit7:setParent(obj.scrollBox3);
    obj.richEdit7:setLeft(5);
    obj.richEdit7:setTop(1980);
    obj.richEdit7:setWidth(1000);
    obj.richEdit7:setHeight(300);
    obj.richEdit7:setField("organizacoes");
    lfm_setPropAsString(obj.richEdit7, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit7, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit7, "defaultFontColor",  "white");
    obj.richEdit7:setName("richEdit7");

    obj.label30 = GUI.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.scrollBox3);
    obj.label30:setLeft(5);
    obj.label30:setTop(2285);
    obj.label30:setWidth(1000);
    obj.label30:setHeight(20);
    obj.label30:setText("Religião");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.richEdit8 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit8:setParent(obj.scrollBox3);
    obj.richEdit8:setLeft(5);
    obj.richEdit8:setTop(2310);
    obj.richEdit8:setWidth(1000);
    obj.richEdit8:setHeight(300);
    obj.richEdit8:setField("religiao");
    lfm_setPropAsString(obj.richEdit8, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit8, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit8, "defaultFontColor",  "white");
    obj.richEdit8:setName("richEdit8");

    obj.scrollBox4 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox4:setParent(obj.scrollBox3);
    obj.scrollBox4:setLeft(205);
    obj.scrollBox4:setTop(2615);
    obj.scrollBox4:setWidth(600);
    obj.scrollBox4:setHeight(450);
    obj.scrollBox4:setName("scrollBox4");

    obj.mapRectangleCidade = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.mapRectangleCidade:setParent(obj.scrollBox4);
    obj.mapRectangleCidade:setWidth(600);
    obj.mapRectangleCidade:setHeight(450);
    obj.mapRectangleCidade:setColor("#333333");
    obj.mapRectangleCidade:setName("mapRectangleCidade");

    obj.mapImageCidade = GUI.fromHandle(_obj_newObject("image"));
    obj.mapImageCidade:setParent(obj.scrollBox4);
    obj.mapImageCidade:setWidth(600);
    obj.mapImageCidade:setHeight(450);
    obj.mapImageCidade:setField("mapaCidade");
    obj.mapImageCidade:setName("mapImageCidade");
    obj.mapImageCidade:setHitTest(true);
    obj.mapImageCidade:setStyle("proportional");
    obj.mapImageCidade:setHint("Clique para alterar Imagem. ");


						_obj_setProp(self.mapImageCidade.handle, "Stretch", true);
					


    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl);
    obj.tab4:setTitle("Pontos de Interesse");
    obj.tab4:setName("tab4");

    obj.frmGeography = GUI.fromHandle(_obj_newObject("form"));
    obj.frmGeography:setParent(obj.tab4);
    obj.frmGeography:setName("frmGeography");
    obj.frmGeography:setAlign("client");

    obj.scrollBox5 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox5:setParent(obj.frmGeography);
    obj.scrollBox5:setAlign("client");
    obj.scrollBox5:setName("scrollBox5");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.scrollBox5);
    obj.rectangle10:setLeft(0);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(200);
    obj.rectangle10:setHeight(600);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.rclDestalhesDaGeografia = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDestalhesDaGeografia:setParent(obj.scrollBox5);
    obj.rclDestalhesDaGeografia:setLeft(0);
    obj.rclDestalhesDaGeografia:setTop(0);
    obj.rclDestalhesDaGeografia:setWidth(200);
    obj.rclDestalhesDaGeografia:setHeight(595);
    obj.rclDestalhesDaGeografia:setName("rclDestalhesDaGeografia");
    obj.rclDestalhesDaGeografia:setField("listaDeDestalhesDaGeografia");
    obj.rclDestalhesDaGeografia:setTemplateForm("frmGeographySelection");
    obj.rclDestalhesDaGeografia:setLayout("vertical");
    obj.rclDestalhesDaGeografia:setSelectable(true);

    obj.boxDetalhesDaGeografia = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDaGeografia:setParent(obj.scrollBox5);
    obj.boxDetalhesDaGeografia:setLeft(210);
    obj.boxDetalhesDaGeografia:setTop(0);
    obj.boxDetalhesDaGeografia:setWidth(1030);
    obj.boxDetalhesDaGeografia:setHeight(600);
    obj.boxDetalhesDaGeografia:setName("boxDetalhesDaGeografia");
    obj.boxDetalhesDaGeografia:setVisible(false);

    obj.richEdit9 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit9:setParent(obj.boxDetalhesDaGeografia);
    obj.richEdit9:setAlign("client");
    obj.richEdit9:setField("descricao");
    lfm_setPropAsString(obj.richEdit9, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit9, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit9, "defaultFontColor",  "white");
    obj.richEdit9:setName("richEdit9");

    obj.tab5 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab5:setParent(obj.tabControl);
    obj.tab5:setTitle("Pessoas Importantes");
    obj.tab5:setName("tab5");

    obj.Listade_NPC_Dock = GUI.fromHandle(_obj_newObject("form"));
    obj.Listade_NPC_Dock:setParent(obj.tab5);
    obj.Listade_NPC_Dock:setName("Listade_NPC_Dock");
    obj.Listade_NPC_Dock:setAlign("client");
    obj.Listade_NPC_Dock:setTheme("dark");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.Listade_NPC_Dock);
    obj.dataLink7:setField("CorIndex");
    obj.dataLink7:setDefaultValue("0");
    obj.dataLink7:setName("dataLink7");


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
	


    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.Listade_NPC_Dock);
    obj.layout6:setAlign("client");
    obj.layout6:setVisible(false);
    obj.layout6:setName("layout6");

    obj.Config = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.Config:setParent(obj.layout6);
    obj.Config:setTitle("Configuração de Barrinhas");
    obj.Config:setName("Config");
    obj.Config:setWidth(406);
    obj.Config:setHeight(190);

    obj.label31 = GUI.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.Config);
    obj.label31:setAlign("top");
    obj.label31:setHeight(18);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setText("Configurações de Barrinhas");
    lfm_setPropAsString(obj.label31, "fontStyle",  "bold");
    obj.label31:setFontColor("white");
    obj.label31:setName("label31");

    obj.dcsTituloEAbas = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsTituloEAbas:setParent(obj.Config);
    obj.dcsTituloEAbas:setName("dcsTituloEAbas");
    obj.dcsTituloEAbas:setAlign("top");
    obj.dcsTituloEAbas:setHeight(18);
    obj.dcsTituloEAbas:setMargins({top=4});

    obj.label32 = GUI.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.dcsTituloEAbas);
    obj.label32:setLeft(5);
    obj.label32:setFontSize(12);
    obj.label32:setAutoSize(true);
    obj.label32:setText("Título da Aba:");
    obj.label32:setName("label32");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.dcsTituloEAbas);
    obj.edit10:setLeft(85);
    obj.edit10:setHeight(18);
    obj.edit10:setFontColor("white");
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setFontSize(12);
    obj.edit10:setWidth(108);
    obj.edit10:setField("NomeDaOpcao");
    obj.edit10:setName("edit10");

    obj.label33 = GUI.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.dcsTituloEAbas);
    obj.label33:setLeft(210);
    obj.label33:setFontSize(12);
    obj.label33:setAutoSize(true);
    obj.label33:setText("Organização:");
    obj.label33:setMargins({left=12});
    obj.label33:setName("label33");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.dcsTituloEAbas);
    obj.comboBox2:setLeft(292);
    obj.comboBox2:setHeight(18);
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setFontSize(12);
    obj.comboBox2:setWidth(108);
    obj.comboBox2:setField("TipoOrganizar");
    obj.comboBox2:setItems({'Alfabética', 'Alinhamento'});
    obj.comboBox2:setValues({'Alfa', 'Alin'});
    obj.comboBox2:setName("comboBox2");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.Config);
    obj.layout7:setAlign("top");
    obj.layout7:setHeight(18);
    obj.layout7:setMargins({top=4});
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("left");
    obj.layout8:setWidth(64);
    obj.layout8:setName("layout8");

    obj.label34 = GUI.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout7);
    obj.label34:setAlign("left");
    obj.label34:setFontSize(12);
    obj.label34:setWidth(108);
    obj.label34:setText("Nome da Barrinha");
    obj.label34:setMargins({left=4});
    obj.label34:setName("label34");

    obj.label35 = GUI.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout7);
    obj.label35:setAlign("left");
    obj.label35:setFontSize(12);
    obj.label35:setWidth(26);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setText("Cor");
    obj.label35:setMargins({left=4});
    obj.label35:setName("label35");

    obj.label36 = GUI.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout7);
    obj.label36:setAlign("left");
    obj.label36:setFontSize(12);
    obj.label36:setWidth(82);
    obj.label36:setText("Visibilidade");
    obj.label36:setMargins({left=4});
    obj.label36:setName("label36");

    obj.label37 = GUI.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout7);
    obj.label37:setAlign("left");
    obj.label37:setFontSize(12);
    obj.label37:setWidth(108);
    obj.label37:setText("Tipo de Números");
    obj.label37:setMargins({left=4});
    obj.label37:setName("label37");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.Config);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(18);
    obj.layout9:setMargins({top=4});
    obj.layout9:setName("layout9");

    obj.label38 = GUI.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout9);
    obj.label38:setAlign("left");
    obj.label38:setFontSize(12);
    obj.label38:setText("Barrinha 1:");
    obj.label38:setHorzTextAlign("trailing");
    obj.label38:setWidth(64);
    obj.label38:setName("label38");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout9);
    obj.edit11:setAlign("left");
    obj.edit11:setFontSize(12);
    obj.edit11:setWidth(108);
    obj.edit11:setVertTextAlign("trailing");
    obj.edit11:setField("NomeBarrinha1");
    obj.edit11:setText("Barrinha 1");
    obj.edit11:setMargins({left=4});
    obj.edit11:setName("edit11");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout9);
    obj.layout10:setAlign("left");
    obj.layout10:setWidth(26);
    obj.layout10:setMargins({left=4});
    obj.layout10:setName("layout10");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout10);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("white");
    obj.rectangle11:setHitTest(true);
    obj.rectangle11:setMargins({left=4, right=4});
    obj.rectangle11:setName("rectangle11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.rectangle11);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle12:setHitTest(true);
    obj.rectangle12:setName("rectangle12");

    obj.CorBarrinha1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.rectangle12);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("#808080");
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha1:setHitTest(true);

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout9);
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setFontSize(12);
    obj.comboBox3:setWidth(82);
    obj.comboBox3:setText("Visibilidade");
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setVertTextAlign("trailing");
    obj.comboBox3:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox3:setValues({'a', 'b', 'c'});
    obj.comboBox3:setValue("a");
    obj.comboBox3:setField("VisibBarrinha1");
    obj.comboBox3:setMargins({left=4});
    obj.comboBox3:setName("comboBox3");

    obj.comboBox4 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox4:setParent(obj.layout9);
    obj.comboBox4:setAlign("left");
    obj.comboBox4:setFontSize(12);
    obj.comboBox4:setWidth(104);
    obj.comboBox4:setText("Tipo de Números");
    obj.comboBox4:setVertTextAlign("trailing");
    obj.comboBox4:setFontColor("white");
    obj.comboBox4:setField("NumerosBarrinha1");
    obj.comboBox4:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox4:setValues({'x', 'y'});
    obj.comboBox4:setValue("x");
    obj.comboBox4:setMargins({left=4});
    obj.comboBox4:setName("comboBox4");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout9);
    obj.dataLink8:setField("CorBarrinha1");
    obj.dataLink8:setDefaultValue("#808080");
    obj.dataLink8:setName("dataLink8");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.Config);
    obj.layout11:setAlign("top");
    obj.layout11:setHeight(18);
    obj.layout11:setMargins({top=4});
    obj.layout11:setName("layout11");

    obj.label39 = GUI.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout11);
    obj.label39:setAlign("left");
    obj.label39:setFontSize(12);
    obj.label39:setText("Barrinha 1:");
    obj.label39:setHorzTextAlign("trailing");
    obj.label39:setWidth(64);
    obj.label39:setName("label39");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout11);
    obj.edit12:setAlign("left");
    obj.edit12:setFontSize(12);
    obj.edit12:setWidth(108);
    obj.edit12:setVertTextAlign("trailing");
    obj.edit12:setField("NomeBarrinha2");
    obj.edit12:setText("Barrinha 2");
    obj.edit12:setMargins({left=4});
    obj.edit12:setName("edit12");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setAlign("left");
    obj.layout12:setWidth(26);
    obj.layout12:setMargins({left=4});
    obj.layout12:setName("layout12");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout12);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("white");
    obj.rectangle13:setHitTest(true);
    obj.rectangle13:setMargins({left=4, right=4});
    obj.rectangle13:setName("rectangle13");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.rectangle13);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle14:setHitTest(true);
    obj.rectangle14:setName("rectangle14");

    obj.CorBarrinha2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.rectangle14);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("#808080");
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha2:setHitTest(true);

    obj.comboBox5 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox5:setParent(obj.layout11);
    obj.comboBox5:setAlign("left");
    obj.comboBox5:setFontSize(12);
    obj.comboBox5:setWidth(82);
    obj.comboBox5:setText("Visibilidade");
    obj.comboBox5:setFontColor("white");
    obj.comboBox5:setVertTextAlign("trailing");
    obj.comboBox5:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox5:setValues({'a', 'b', 'c'});
    obj.comboBox5:setValue("a");
    obj.comboBox5:setField("VisibBarrinha2");
    obj.comboBox5:setMargins({left=4});
    obj.comboBox5:setName("comboBox5");

    obj.comboBox6 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox6:setParent(obj.layout11);
    obj.comboBox6:setAlign("left");
    obj.comboBox6:setFontSize(12);
    obj.comboBox6:setWidth(104);
    obj.comboBox6:setText("Tipo de Números");
    obj.comboBox6:setVertTextAlign("trailing");
    obj.comboBox6:setFontColor("white");
    obj.comboBox6:setField("NumerosBarrinha2");
    obj.comboBox6:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox6:setValues({'x', 'y'});
    obj.comboBox6:setValue("x");
    obj.comboBox6:setMargins({left=4});
    obj.comboBox6:setName("comboBox6");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout11);
    obj.dataLink9:setField("CorBarrinha2");
    obj.dataLink9:setDefaultValue("#808080");
    obj.dataLink9:setName("dataLink9");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.Config);
    obj.layout13:setAlign("top");
    obj.layout13:setHeight(18);
    obj.layout13:setMargins({top=4});
    obj.layout13:setName("layout13");

    obj.label40 = GUI.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout13);
    obj.label40:setAlign("left");
    obj.label40:setFontSize(12);
    obj.label40:setText("Barrinha 1:");
    obj.label40:setHorzTextAlign("trailing");
    obj.label40:setWidth(64);
    obj.label40:setName("label40");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout13);
    obj.edit13:setAlign("left");
    obj.edit13:setFontSize(12);
    obj.edit13:setWidth(108);
    obj.edit13:setVertTextAlign("trailing");
    obj.edit13:setField("NomeBarrinha3");
    obj.edit13:setText("Barrinha 3");
    obj.edit13:setMargins({left=4});
    obj.edit13:setName("edit13");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout13);
    obj.layout14:setAlign("left");
    obj.layout14:setWidth(26);
    obj.layout14:setMargins({left=4});
    obj.layout14:setName("layout14");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout14);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("white");
    obj.rectangle15:setHitTest(true);
    obj.rectangle15:setMargins({left=4, right=4});
    obj.rectangle15:setName("rectangle15");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.rectangle15);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle16:setHitTest(true);
    obj.rectangle16:setName("rectangle16");

    obj.CorBarrinha3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.rectangle16);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("#808080");
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha3:setHitTest(true);

    obj.comboBox7 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox7:setParent(obj.layout13);
    obj.comboBox7:setAlign("left");
    obj.comboBox7:setFontSize(12);
    obj.comboBox7:setWidth(82);
    obj.comboBox7:setText("Visibilidade");
    obj.comboBox7:setFontColor("white");
    obj.comboBox7:setVertTextAlign("trailing");
    obj.comboBox7:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox7:setValues({'a', 'b', 'c'});
    obj.comboBox7:setValue("a");
    obj.comboBox7:setField("VisibBarrinha3");
    obj.comboBox7:setMargins({left=4});
    obj.comboBox7:setName("comboBox7");

    obj.comboBox8 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox8:setParent(obj.layout13);
    obj.comboBox8:setAlign("left");
    obj.comboBox8:setFontSize(12);
    obj.comboBox8:setWidth(104);
    obj.comboBox8:setText("Tipo de Números");
    obj.comboBox8:setVertTextAlign("trailing");
    obj.comboBox8:setFontColor("white");
    obj.comboBox8:setField("NumerosBarrinha3");
    obj.comboBox8:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox8:setValues({'x', 'y'});
    obj.comboBox8:setValue("x");
    obj.comboBox8:setMargins({left=4});
    obj.comboBox8:setName("comboBox8");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout13);
    obj.dataLink10:setField("CorBarrinha3");
    obj.dataLink10:setDefaultValue("#808080");
    obj.dataLink10:setName("dataLink10");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.Config);
    obj.layout15:setAlign("top");
    obj.layout15:setHeight(18);
    obj.layout15:setMargins({top=4});
    obj.layout15:setName("layout15");

    obj.label41 = GUI.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout15);
    obj.label41:setAlign("left");
    obj.label41:setFontSize(12);
    obj.label41:setText("Barrinha 1:");
    obj.label41:setHorzTextAlign("trailing");
    obj.label41:setWidth(64);
    obj.label41:setName("label41");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout15);
    obj.edit14:setAlign("left");
    obj.edit14:setFontSize(12);
    obj.edit14:setWidth(108);
    obj.edit14:setVertTextAlign("trailing");
    obj.edit14:setField("NomeBarrinha4");
    obj.edit14:setText("Barrinha 4");
    obj.edit14:setMargins({left=4});
    obj.edit14:setName("edit14");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout15);
    obj.layout16:setAlign("left");
    obj.layout16:setWidth(26);
    obj.layout16:setMargins({left=4});
    obj.layout16:setName("layout16");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout16);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("white");
    obj.rectangle17:setHitTest(true);
    obj.rectangle17:setMargins({left=4, right=4});
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.rectangle17);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle18:setHitTest(true);
    obj.rectangle18:setName("rectangle18");

    obj.CorBarrinha4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha4:setParent(obj.rectangle18);
    obj.CorBarrinha4:setName("CorBarrinha4");
    obj.CorBarrinha4:setColor("#808080");
    obj.CorBarrinha4:setAlign("client");
    obj.CorBarrinha4:setMargins({left=1, right=1, top=1, bottom=1});
    obj.CorBarrinha4:setHitTest(true);

    obj.comboBox9 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox9:setParent(obj.layout15);
    obj.comboBox9:setAlign("left");
    obj.comboBox9:setFontSize(12);
    obj.comboBox9:setWidth(82);
    obj.comboBox9:setText("Visibilidade");
    obj.comboBox9:setFontColor("white");
    obj.comboBox9:setVertTextAlign("trailing");
    obj.comboBox9:setItems({'Pública', 'Privada', 'Nenhuma'});
    obj.comboBox9:setValues({'a', 'b', 'c'});
    obj.comboBox9:setValue("a");
    obj.comboBox9:setField("VisibBarrinha4");
    obj.comboBox9:setMargins({left=4});
    obj.comboBox9:setName("comboBox9");

    obj.comboBox10 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox10:setParent(obj.layout15);
    obj.comboBox10:setAlign("left");
    obj.comboBox10:setFontSize(12);
    obj.comboBox10:setWidth(104);
    obj.comboBox10:setText("Tipo de Números");
    obj.comboBox10:setVertTextAlign("trailing");
    obj.comboBox10:setFontColor("white");
    obj.comboBox10:setField("NumerosBarrinha4");
    obj.comboBox10:setItems({'Valores Fixos', 'Porcentagens'});
    obj.comboBox10:setValues({'x', 'y'});
    obj.comboBox10:setValue("x");
    obj.comboBox10:setMargins({left=4});
    obj.comboBox10:setName("comboBox10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout15);
    obj.dataLink11:setField("CorBarrinha4");
    obj.dataLink11:setDefaultValue("#808080");
    obj.dataLink11:setName("dataLink11");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.Config);
    obj.layout17:setAlign("top");
    obj.layout17:setHeight(24);
    obj.layout17:setMargins({top=8});
    obj.layout17:setName("layout17");

    obj.checkBox11 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout17);
    obj.checkBox11:setMargins({left=4});
    obj.checkBox11:setAlign("left");
    obj.checkBox11:setField("EnviarNoChat");
    obj.checkBox11:setWidth(180);
    obj.checkBox11:setFontSize(12);
    obj.checkBox11:setText("Enviar alterações ao chat");
    obj.checkBox11:setName("checkBox11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout17);
    obj.dataLink12:setField("EnviarNoChat");
    obj.dataLink12:setDefaultValue("false");
    obj.dataLink12:setName("dataLink12");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout17);
    obj.button2:setAlign("right");
    obj.button2:setWidth(80);
    obj.button2:setText("OK!");
    obj.button2:setMargins({right=8});
    obj.button2:setName("button2");

    obj.SelectCor = GUI.fromHandle(_obj_newObject("popup"));
    obj.SelectCor:setParent(obj.Config);
    obj.SelectCor:setName("SelectCor");
    obj.SelectCor:setWidth(192);
    obj.SelectCor:setHeight(100);

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.SelectCor);
    obj.layout18:setAlign("top");
    obj.layout18:setHeight(24);
    obj.layout18:setName("layout18");

    obj.label42 = GUI.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout18);
    obj.label42:setAlign("client");
    obj.label42:setText("Selecione a Cor:");
    obj.label42:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label42, "fontStyle",  "bold");
    obj.label42:setName("label42");

    obj.Nha = GUI.fromHandle(_obj_newObject("layout"));
    obj.Nha:setParent(obj.SelectCor);
    obj.Nha:setName("Nha");
    obj.Nha:setAlign("client");
    obj.Nha:setMargins({left=10, right=10});
    obj.Nha:setHitTest(true);

    obj.Selected = GUI.fromHandle(_obj_newObject("layout"));
    obj.Selected:setParent(obj.Nha);
    obj.Selected:setAlign("none");
    obj.Selected:setName("Selected");
    obj.Selected:setWidth(20);
    obj.Selected:setHeight(20);

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.Selected);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("white");
    obj.rectangle19:setName("rectangle19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.rectangle19);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setMargins({left=1, right=1, top=1, bottom=1});
    obj.rectangle20:setName("rectangle20");

    obj.Flow = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.Flow:setParent(obj.Nha);
    obj.Flow:setName("Flow");
    obj.Flow:setAlign("client");
    obj.Flow:setOrientation("horizontal");
    obj.Flow:setMaxControlsPerLine(8);
    obj.Flow:setHitTest(true);
    obj.Flow:setCanFocus(true);

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.Flow);
    obj.layout19:setAlign("left");
    obj.layout19:setWidth(20);
    obj.layout19:setHeight(20);
    obj.layout19:setHitTest(true);
    obj.layout19:setName("layout19");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout19);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle21:setHitTest(true);
    obj.rectangle21:setColor("#acacac");
    obj.rectangle21:setName("rectangle21");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.Flow);
    obj.layout20:setAlign("left");
    obj.layout20:setWidth(20);
    obj.layout20:setHeight(20);
    obj.layout20:setHitTest(true);
    obj.layout20:setName("layout20");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout20);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle22:setHitTest(true);
    obj.rectangle22:setColor("#5959ff");
    obj.rectangle22:setName("rectangle22");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.Flow);
    obj.layout21:setAlign("left");
    obj.layout21:setWidth(20);
    obj.layout21:setHeight(20);
    obj.layout21:setHitTest(true);
    obj.layout21:setName("layout21");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout21);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle23:setHitTest(true);
    obj.rectangle23:setColor("#59ff59");
    obj.rectangle23:setName("rectangle23");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.Flow);
    obj.layout22:setAlign("left");
    obj.layout22:setWidth(20);
    obj.layout22:setHeight(20);
    obj.layout22:setHitTest(true);
    obj.layout22:setName("layout22");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout22);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle24:setHitTest(true);
    obj.rectangle24:setColor("#ff5959");
    obj.rectangle24:setName("rectangle24");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.Flow);
    obj.layout23:setAlign("left");
    obj.layout23:setWidth(20);
    obj.layout23:setHeight(20);
    obj.layout23:setHitTest(true);
    obj.layout23:setName("layout23");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout23);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle25:setHitTest(true);
    obj.rectangle25:setColor("#ff59ff");
    obj.rectangle25:setName("rectangle25");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.Flow);
    obj.layout24:setAlign("left");
    obj.layout24:setWidth(20);
    obj.layout24:setHeight(20);
    obj.layout24:setHitTest(true);
    obj.layout24:setName("layout24");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout24);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle26:setHitTest(true);
    obj.rectangle26:setColor("#ffac59");
    obj.rectangle26:setName("rectangle26");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.Flow);
    obj.layout25:setAlign("left");
    obj.layout25:setWidth(20);
    obj.layout25:setHeight(20);
    obj.layout25:setHitTest(true);
    obj.layout25:setName("layout25");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout25);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle27:setHitTest(true);
    obj.rectangle27:setColor("#ffff59");
    obj.rectangle27:setName("rectangle27");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.Flow);
    obj.layout26:setAlign("left");
    obj.layout26:setWidth(20);
    obj.layout26:setHeight(20);
    obj.layout26:setHitTest(true);
    obj.layout26:setName("layout26");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout26);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle28:setHitTest(true);
    obj.rectangle28:setColor("#59ffff");
    obj.rectangle28:setName("rectangle28");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.Flow);
    obj.layout27:setAlign("left");
    obj.layout27:setWidth(20);
    obj.layout27:setHeight(20);
    obj.layout27:setHitTest(true);
    obj.layout27:setName("layout27");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout27);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle29:setHitTest(true);
    obj.rectangle29:setColor("#ffd159");
    obj.rectangle29:setName("rectangle29");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.Flow);
    obj.layout28:setAlign("left");
    obj.layout28:setWidth(20);
    obj.layout28:setHeight(20);
    obj.layout28:setHitTest(true);
    obj.layout28:setName("layout28");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout28);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle30:setHitTest(true);
    obj.rectangle30:setColor("#5990ff");
    obj.rectangle30:setName("rectangle30");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.Flow);
    obj.layout29:setAlign("left");
    obj.layout29:setWidth(20);
    obj.layout29:setHeight(20);
    obj.layout29:setHitTest(true);
    obj.layout29:setName("layout29");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout29);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle31:setHitTest(true);
    obj.rectangle31:setColor("#f4c264");
    obj.rectangle31:setName("rectangle31");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.Flow);
    obj.layout30:setAlign("left");
    obj.layout30:setWidth(20);
    obj.layout30:setHeight(20);
    obj.layout30:setHitTest(true);
    obj.layout30:setName("layout30");

    obj.rectangle32 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout30);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle32:setHitTest(true);
    obj.rectangle32:setColor("#de7a7a");
    obj.rectangle32:setName("rectangle32");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.Flow);
    obj.layout31:setAlign("left");
    obj.layout31:setWidth(20);
    obj.layout31:setHeight(20);
    obj.layout31:setHitTest(true);
    obj.layout31:setName("layout31");

    obj.rectangle33 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout31);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle33:setHitTest(true);
    obj.rectangle33:setColor("#cb83d6");
    obj.rectangle33:setName("rectangle33");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.Flow);
    obj.layout32:setAlign("left");
    obj.layout32:setWidth(20);
    obj.layout32:setHeight(20);
    obj.layout32:setHitTest(true);
    obj.layout32:setName("layout32");

    obj.rectangle34 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout32);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle34:setHitTest(true);
    obj.rectangle34:setColor("#f3658a");
    obj.rectangle34:setName("rectangle34");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.Flow);
    obj.layout33:setAlign("left");
    obj.layout33:setWidth(20);
    obj.layout33:setHeight(20);
    obj.layout33:setHitTest(true);
    obj.layout33:setName("layout33");

    obj.rectangle35 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout33);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle35:setHitTest(true);
    obj.rectangle35:setColor("#8cecb3");
    obj.rectangle35:setName("rectangle35");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.Flow);
    obj.layout34:setAlign("left");
    obj.layout34:setWidth(20);
    obj.layout34:setHeight(20);
    obj.layout34:setHitTest(true);
    obj.layout34:setName("layout34");

    obj.rectangle36 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout34);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setMargins({left=2, right=2, top=2, bottom=2});
    obj.rectangle36:setHitTest(true);
    obj.rectangle36:setColor("#ed846b");
    obj.rectangle36:setName("rectangle36");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.SelectCor);
    obj.layout35:setAlign("bottom");
    obj.layout35:setHeight(24);
    obj.layout35:setName("layout35");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout35);
    obj.button3:setAlign("right");
    obj.button3:setText("OK!");
    obj.button3:setMargins({right=4});
    obj.button3:setName("button3");

    obj.rectangle37 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.Listade_NPC_Dock);
    obj.rectangle37:setColor("#0f0f0f");
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setPadding({top=4, left=4});
    obj.rectangle37:setName("rectangle37");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.rectangle37);
    obj.layout36:setAlign("top");
    obj.layout36:setHeight(24);
    obj.layout36:setName("layout36");

    obj.NovaAbadeNPCs = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovaAbadeNPCs:setParent(obj.layout36);
    obj.NovaAbadeNPCs:setMargins({left=4});
    obj.NovaAbadeNPCs:setAlign("left");
    obj.NovaAbadeNPCs:setWidth(24);
    obj.NovaAbadeNPCs:setName("NovaAbadeNPCs");
    obj.NovaAbadeNPCs:setImageChecked("/FichaReinosD20/images/addlista.png");
    obj.NovaAbadeNPCs:setImageUnchecked("/FichaReinosD20/images/addlista.png");

    obj.comboBoxFalsa = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.comboBoxFalsa:setParent(obj.layout36);
    obj.comboBoxFalsa:setAlign("left");
    obj.comboBoxFalsa:setMargins({left=8});
    obj.comboBoxFalsa:setName("comboBoxFalsa");
    obj.comboBoxFalsa:setWidth(128);
    obj.comboBoxFalsa:setHeight(20);
    obj.comboBoxFalsa:setHitTest(true);

    obj.rectangle38 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.comboBoxFalsa);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("#333333");
    obj.rectangle38:setXradius(2);
    obj.rectangle38:setYradius(2);
    obj.rectangle38:setHitTest(true);
    obj.rectangle38:setName("rectangle38");

    obj.label43 = GUI.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.rectangle38);
    obj.label43:setFontColor("white");
    obj.label43:setAlign("client");
    obj.label43:setMargins({left=8});
    obj.label43:setVertTextAlign("center");
    obj.label43:setText("Opções");
    obj.label43:setField("NomeDaOpcao");
    obj.label43:setHitTest(true);
    obj.label43:setName("label43");

    obj.path1 = GUI.fromHandle(_obj_newObject("path"));
    obj.path1:setParent(obj.rectangle38);
    obj.path1:setAlign("right");
    obj.path1:setWidth(16);
    obj.path1:setMargins({right=6, left=6, top=8, bottom=8});
    obj.path1:setColor("orange");
    obj.path1:setPathData("M 100 100 L 300 100 L 200 300 z");
    obj.path1:setName("path1");

    obj.dcsMain = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dcsMain:setParent(obj.rectangle37);
    obj.dcsMain:setAlign("client");
    obj.dcsMain:setName("dcsMain");

    obj.ListaDeNPCs = GUI.fromHandle(_obj_newObject("form"));
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
	


    obj.recordNode = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.recordNode:setParent(obj.ListaDeNPCs);
    obj.recordNode:setName("recordNode");
    obj.recordNode:setVisible(false);

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.ListaDeNPCs);
    obj.layout37:setVisible(false);
    obj.layout37:setName("layout37");

    obj.dropDownFalso2 = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.dropDownFalso2:setParent(obj.layout37);
    obj.dropDownFalso2:setName("dropDownFalso2");
    obj.dropDownFalso2:setTitle("Jogador?");
    obj.dropDownFalso2:setWidth(128);
    obj.dropDownFalso2:setHeight(128);

    obj.scrollBox6 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox6:setParent(obj.dropDownFalso2);
    obj.scrollBox6:setAlign("client");
    obj.scrollBox6:setName("scrollBox6");

    obj.opcoesFalsas2 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.opcoesFalsas2:setParent(obj.scrollBox6);
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

    obj.rectangle39 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.ListaDeNPCs);
    obj.rectangle39:setColor("#0f0f0f");
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setName("rectangle39");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.rectangle39);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(24);
    obj.layout38:setMargins({top=4, left=2});
    obj.layout38:setName("layout38");

    obj.Configurar = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Configurar:setParent(obj.layout38);
    obj.Configurar:setMargins({left=4});
    obj.Configurar:setAlign("left");
    obj.Configurar:setWidth(24);
    obj.Configurar:setHint("Configurações da Lista");
    obj.Configurar:setName("Configurar");
    obj.Configurar:setImageChecked("/FichaReinosD20/images/config.png");
    obj.Configurar:setImageUnchecked("/FichaReinosD20/images/config.png");

    obj.NovoNPC = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovoNPC:setParent(obj.layout38);
    obj.NovoNPC:setMargins({left=4});
    obj.NovoNPC:setAlign("left");
    obj.NovoNPC:setWidth(24);
    obj.NovoNPC:setHint("Adicionar novo NPC");
    obj.NovoNPC:setName("NovoNPC");
    obj.NovoNPC:setImageChecked("/FichaReinosD20/images/addnpc.png");
    obj.NovoNPC:setImageUnchecked("/FichaReinosD20/images/addnpc.png");

    obj.Organizar = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Organizar:setParent(obj.layout38);
    obj.Organizar:setMargins({left=4});
    obj.Organizar:setAlign("left");
    obj.Organizar:setWidth(24);
    obj.Organizar:setHint("Ordenar Lista de NPCs");
    obj.Organizar:setName("Organizar");
    obj.Organizar:setImageChecked("/FichaReinosD20/images/organize.png");
    obj.Organizar:setImageUnchecked("/FichaReinosD20/images/organize.png");

    obj.MainClient = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.MainClient:setParent(obj.rectangle39);
    obj.MainClient:setName("MainClient");
    obj.MainClient:setAlign("client");
    obj.MainClient:setMargins({top=2});

    obj.rclListaDeNPC = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDeNPC:setParent(obj.MainClient);
    obj.rclListaDeNPC:setName("rclListaDeNPC");
    obj.rclListaDeNPC:setLayout("verticalTiles");
    obj.rclListaDeNPC:setField("campoDosNPC");
    obj.rclListaDeNPC:setTemplateForm("CaixaFichaNPC");
    obj.rclListaDeNPC:setAlign("none");
    obj.rclListaDeNPC:setAutoHeight(true);
    obj.rclListaDeNPC:setSelectable(true);
    obj.rclListaDeNPC:setMinQt(0);

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.rectangle39);
    obj.layout39:setAlign("bottom");
    obj.layout39:setHeight(32);
    obj.layout39:setName("layout39");

    obj.label44 = GUI.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout39);
    obj.label44:setAlign("right");
    lfm_setPropAsString(obj.label44, "fontStyle",  "italic");
    obj.label44:setFontSize(12);
    obj.label44:setOpacity(0.8);
    obj.label44:setAutoSize(true);
    obj.label44:setText("Criado por Mia\nEditado por Ambesek");
    obj.label44:setName("label44");


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
		


    obj.dropDownFalso = GUI.fromHandle(_obj_newObject("popup"));
    obj.dropDownFalso:setParent(obj.Listade_NPC_Dock);
    obj.dropDownFalso:setName("dropDownFalso");
    obj.dropDownFalso:setWidth(128);
    obj.dropDownFalso:setHeight(128);
    obj.dropDownFalso:setBackOpacity(0);
    obj.dropDownFalso:setNodeObject({sheet});
    obj.dropDownFalso:setHitTest(true);

    obj.scrollBox7 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox7:setParent(obj.dropDownFalso);
    obj.scrollBox7:setAlign("client");
    obj.scrollBox7:setName("scrollBox7");

    obj.opcoesFalsas = GUI.fromHandle(_obj_newObject("recordList"));
    obj.opcoesFalsas:setParent(obj.scrollBox7);
    obj.opcoesFalsas:setVisible(true);
    obj.opcoesFalsas:setAlign("client");
    obj.opcoesFalsas:setTemplateForm("OpcaoDaComboboxFalsa");
    obj.opcoesFalsas:setField("opcoesFalsas");
    obj.opcoesFalsas:setName("opcoesFalsas");
    obj.opcoesFalsas:setLayout("verticalTiles");
    obj.opcoesFalsas:setAutoHeight(true);
    obj.opcoesFalsas:setSelectable(true);
    obj.opcoesFalsas:setMinQt(1);

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.Listade_NPC_Dock);
    obj.dataLink13:setField("opcaoEscolhida");
    obj.dataLink13:setDefaultValue("Opções");
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.Listade_NPC_Dock);
    obj.dataLink14:setFields({'VisibBarrinha1', 'VisibBarrinha2', 'VisibBarrinha3', 'VisibBarrinha4'});
    obj.dataLink14:setDefaultValues({'a', 'a', 'a', 'a'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.Listade_NPC_Dock);
    obj.dataLink15:setFields({'NumerosBarrinha1', 'NumerosBarrinha2', 'NumerosBarrinha3', 'NumerosBarrinha4'});
    obj.dataLink15:setDefaultValues({'x', 'x', 'x', 'x'});
    obj.dataLink15:setName("dataLink15");

    obj.tab6 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab6:setParent(obj.tabControl);
    obj.tab6:setTitle("Anotações");
    obj.tab6:setName("tab6");

    obj.frmTemplateNotes = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateNotes:setParent(obj.tab6);
    obj.frmTemplateNotes:setName("frmTemplateNotes");
    obj.frmTemplateNotes:setAlign("client");

    obj.scrollBox8 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox8:setParent(obj.frmTemplateNotes);
    obj.scrollBox8:setAlign("client");
    obj.scrollBox8:setName("scrollBox8");

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox8);
    obj.layout40:setLeft(0);
    obj.layout40:setTop(0);
    obj.layout40:setWidth(400);
    obj.layout40:setHeight(580);
    obj.layout40:setName("layout40");

    obj.rectangle40 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout40);
    obj.rectangle40:setLeft(0);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(400);
    obj.rectangle40:setHeight(580);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setXradius(5);
    obj.rectangle40:setYradius(15);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.label45 = GUI.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout40);
    obj.label45:setLeft(0);
    obj.label45:setTop(0);
    obj.label45:setWidth(400);
    obj.label45:setHeight(20);
    obj.label45:setText("Anotações");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout40);
    obj.textEditor1:setLeft(10);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(380);
    obj.textEditor1:setHeight(540);
    obj.textEditor1:setField("anotacoes1");
    obj.textEditor1:setName("textEditor1");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.scrollBox8);
    obj.layout41:setLeft(410);
    obj.layout41:setTop(0);
    obj.layout41:setWidth(400);
    obj.layout41:setHeight(580);
    obj.layout41:setName("layout41");

    obj.rectangle41 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout41);
    obj.rectangle41:setLeft(0);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(400);
    obj.rectangle41:setHeight(580);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setXradius(5);
    obj.rectangle41:setYradius(15);
    obj.rectangle41:setCornerType("round");
    obj.rectangle41:setName("rectangle41");

    obj.label46 = GUI.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout41);
    obj.label46:setLeft(0);
    obj.label46:setTop(0);
    obj.label46:setWidth(400);
    obj.label46:setHeight(20);
    obj.label46:setText("Anotações");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout41);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(380);
    obj.textEditor2:setHeight(540);
    obj.textEditor2:setField("anotacoes2");
    obj.textEditor2:setName("textEditor2");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.scrollBox8);
    obj.layout42:setLeft(820);
    obj.layout42:setTop(0);
    obj.layout42:setWidth(400);
    obj.layout42:setHeight(580);
    obj.layout42:setName("layout42");

    obj.rectangle42 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout42);
    obj.rectangle42:setLeft(0);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(400);
    obj.rectangle42:setHeight(580);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setXradius(5);
    obj.rectangle42:setYradius(15);
    obj.rectangle42:setCornerType("round");
    obj.rectangle42:setName("rectangle42");

    obj.label47 = GUI.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout42);
    obj.label47:setLeft(0);
    obj.label47:setTop(0);
    obj.label47:setWidth(400);
    obj.label47:setHeight(20);
    obj.label47:setText("Anotações");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout42);
    obj.textEditor3:setLeft(10);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(380);
    obj.textEditor3:setHeight(540);
    obj.textEditor3:setField("anotacoes3");
    obj.textEditor3:setName("textEditor3");

    obj.tab7 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab7:setParent(obj.tabControl);
    obj.tab7:setTitle("Creditos");
    obj.tab7:setName("tab7");

    obj.frmTemplateCreditos = GUI.fromHandle(_obj_newObject("form"));
    obj.frmTemplateCreditos:setParent(obj.tab7);
    obj.frmTemplateCreditos:setName("frmTemplateCreditos");
    obj.frmTemplateCreditos:setAlign("client");



	local function listToString(list, max)
		local text = "";

		for k=0, max, 1 do
			text = text .. (list[k] or "");
		end;

		return text;
	end;

	local function richEditToMarkdown(richEdit)
		if richEdit==nil then return "" end;
		local nodes = ndb.getChildNodes(richEdit);
		--local text = utils.tableToStr(richEdit) .. "\n";
		local text = "";

		local strList = {};
		local strMax = 0;

		for i=1, #nodes, 1 do
			local parts = ndb.getChildNodes(nodes[i]);

			local str = "";
			local table = "";

			local fragList = {};
			local fragMax = 0;
			for j=1, #parts, 1 do 
				local object = parts[j];
				local frag = "";

				if object.t == "txt" then
					if object.text ~= nil then
						frag = object.text:gsub("\9", "\n");
					else
						frag = "";
					end;

					if object.style ~= nil and frag~="\n" then
						local style = object.style;

						if string.match(style, "b") then
							frag = "**" .. frag .. "**";
						end;

						if string.match(style, "i") then
							frag = "*" .. frag .. "*";
						end;

						if string.match(style, "u") then
							--frag = "__" .. frag .. "__";
						end;

						if string.match(style, "s") then
							frag = "~~" .. frag .. "~~";
						end;
					end;
				elseif object.ctype == "imageURL" then
					frag = "<img src='" .. object.url .. "' style='position:absolute;bottom:50px;right:30px;width:280px' />";
				end;

				if object.i ~= nil then
					fragList[object.i] = frag;
					if object.i > fragMax then fragMax = object.i end;
				end;

				table = table .. utils.tableToStr(object) .. "\n";
			end;
			
			str = listToString(fragList, fragMax);
			strList[nodes[i].i] = str .. "\n";
			if nodes[i].i > strMax then strMax = nodes[i].i end;
			
			--text = text .. "\n" .. table .. "\n";
			--text = text .. utils.tableToStr(nodes[i]) .. "\n\n";
		end;

		text = listToString(strList, strMax);

		return text;
	end;

	local function exportToMarkdown()
		local retorno = "";

		local mesa = rrpg.getMesaDe(sheet);

		local reino = ndb.getChildNodes(sheet.listaDeDestalhesDoReino);
		retorno = "# " .. (sheet.reino or "Reino") .. "\n" .. richEditToMarkdown(reino[1]["$(field)"]) .. "\n";
		retorno = retorno .. "## Cultura" .. "\n" .. richEditToMarkdown(reino[2]["$(field)"]) .. "\n";
		retorno = retorno .. "## Raças" .. "\n" .. richEditToMarkdown(reino[3]["$(field)"]) .. "\n";
		retorno = retorno .. "## Classes" .. "\n" .. richEditToMarkdown(reino[4]["$(field)"]) .. "\n";
		retorno = retorno .. "## Historia" .. "\n" .. richEditToMarkdown(reino[5]["$(field)"]) .. "\n";
		retorno = retorno .. "## Geografia" .. "\n" .. richEditToMarkdown(reino[6]["$(field)"]) .. "\n";
		retorno = retorno .. "## Clima" .. "\n" .. richEditToMarkdown(reino[7]["$(field)"]) .. "\n";
		retorno = retorno .. "## Religião" .. "\n" .. richEditToMarkdown(reino[9]["$(field)"]) .. "\n";
		retorno = retorno .. "## Outros" .. "\n" .. richEditToMarkdown(reino[8]["$(field)"]) .. "\n";

		retorno = retorno .. "<div class='wide'><img src='" .. (sheet.mapa or "") .. "' style='width:640px;height:360px' /><div style='margin-top:20px'></div></div>\n";
		
		local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);

		retorno = retorno .. "## Cidades" .. "\n\n"

		for i=1, #cidades, 1 do 
			local cidade = cidades[i];
			local capital = "";
			if cidade.capital then
				capital = "[capital]\n";
			end;


			retorno = retorno .. "### " .. (cidade.nome or "Cidade") .. "\n" .. capital .. richEditToMarkdown(cidade.descricao) .. "\n";
			retorno = retorno .. "#### Historia" .. "\n" .. richEditToMarkdown(cidade.historia) .. "\n";

			retorno = retorno .. "**Tamanho:** " .. (cidade.tamanho or "tamanho") .. "\n\n";
			retorno = retorno .. "**Tipo:** " .. (cidade.tipo or "tipo") .. "\n\n";
			retorno = retorno .. "**Composição Racial:** " .. (cidade.composicao or "composicao") .. "\n\n";
			retorno = retorno .. "**Economia:** " .. (cidade.economia or "economia") .. "\n\n";
			retorno = retorno .. "**População:** " .. (cidade.populacao or "populacao") .. "\n\n";
			retorno = retorno .. "**Limite de PO:** " .. (cidade.limitePO or "limitePO") .. "\n\n";
			retorno = retorno .. "**Riqueza Total:** " .. (cidade.riqueza or "riqueza") .. "\n\n";
			retorno = retorno .. "**Fundação:** " .. (cidade.fundacao or "fundacao") .. "\n\n";

			retorno = retorno .. "#### Boatos" .. "\n" .. richEditToMarkdown(cidade.boatos) .. "\n";

			retorno = retorno .. "**Politica:** ";
			if cidade.politica_1 then
				retorno = retorno .. "Monarquia ";
			end;
			if cidade.politica_2 then
				retorno = retorno .. "Tribal ";
			end;
			if cidade.politica_3 then
				retorno = retorno .. "Feudal ";
			end;
			if cidade.politica_4 then
				retorno = retorno .. "República ";
			end;
			if cidade.politica_5 then
				retorno = retorno .. "Democracia ";
			end;
			if cidade.politica_6 then
				retorno = retorno .. "Magocracia";
			end;
			if cidade.politica_7 then
				retorno = retorno .. "Teocracia";
			end;
			if cidade.politica_8 then
				retorno = retorno .. "Plutocracia";
			end;
			if cidade.politica_9 then
				retorno = retorno .. "Outros";
			end;
			retorno = retorno .. "\n\n";

			retorno = retorno .. "**Militarização:** " .. (cidade.militarizacao or "militarizacao") .. "\n\n";
			retorno = retorno .. "**Guardas:** " .. (cidade.guardas or "guardas") .. "\n\n";
			retorno = retorno .. "**Reservistas:** " .. (cidade.reservistas or "reservistas") .. "\n\n";

			retorno = retorno .. "#### Poderes" .. "\n" .. richEditToMarkdown(cidade.poderes) .. "\n";
			retorno = retorno .. "#### Pessoas Importantes" .. "\n" .. richEditToMarkdown(cidade.pessoas) .. "\n";
			retorno = retorno .. "#### Organizações" .. "\n" .. richEditToMarkdown(cidade.organizacoes) .. "\n";
			retorno = retorno .. "#### Religião" .. "\n" .. richEditToMarkdown(cidade.religiao) .. "\n";

			retorno = retorno .. "<div class='wide'><img src='" .. (cidade.mapaCidade or "") .. "' style='width:640px;height:360px' /><div style='margin-top:20px'></div></div>\n";

		end;

		local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);

		retorno = retorno .. "## Pontos de Interesse\n\n";

		for i=1, #lugares, 1 do
			local lugar = lugares[i];

			retorno = retorno .. "### " .. (lugar.nome or "Lugar") .. "\n" .. richEditToMarkdown(lugar.descricao) .. "\n";
		end;

		System.setClipboardText(retorno);
	end;

	


    obj.scrollBox9 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox9:setParent(obj.frmTemplateCreditos);
    obj.scrollBox9:setAlign("client");
    obj.scrollBox9:setName("scrollBox9");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox9);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(500);
    obj.image1:setHeight(500);
    obj.image1:setStyle("autoFit");
    obj.image1:setSRC("/FichaReinosD20/images/RPGmeister.jpg");
    obj.image1:setName("image1");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.scrollBox9);
    obj.layout43:setLeft(550);
    obj.layout43:setTop(0);
    obj.layout43:setWidth(200);
    obj.layout43:setHeight(160);
    obj.layout43:setName("layout43");

    obj.rectangle43 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout43);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("black");
    obj.rectangle43:setXradius(5);
    obj.rectangle43:setYradius(15);
    obj.rectangle43:setCornerType("round");
    obj.rectangle43:setName("rectangle43");

    obj.label48 = GUI.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout43);
    obj.label48:setLeft(0);
    obj.label48:setTop(10);
    obj.label48:setWidth(200);
    obj.label48:setHeight(20);
    obj.label48:setText("Plugin feito por: ");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.label49 = GUI.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout43);
    obj.label49:setLeft(0);
    obj.label49:setTop(35);
    obj.label49:setWidth(200);
    obj.label49:setHeight(20);
    obj.label49:setText("Vinny (Ambesek)");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.label50 = GUI.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.scrollBox9);
    obj.label50:setLeft(555);
    obj.label50:setTop(300);
    obj.label50:setWidth(200);
    obj.label50:setHeight(20);
    obj.label50:setText("Versão Atual: ");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setField("versionInstalled");
    obj.label50:setName("label50");

    obj.label51 = GUI.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.scrollBox9);
    obj.label51:setLeft(555);
    obj.label51:setTop(325);
    obj.label51:setWidth(200);
    obj.label51:setHeight(20);
    obj.label51:setText("Ultima Versão: ");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setField("versionDownloaded");
    obj.label51:setName("label51");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.scrollBox9);
    obj.button4:setLeft(555);
    obj.button4:setTop(350);
    obj.button4:setWidth(100);
    obj.button4:setText("Change Log");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.scrollBox9);
    obj.button5:setLeft(667);
    obj.button5:setTop(350);
    obj.button5:setWidth(100);
    obj.button5:setText("Atualizar");
    obj.button5:setName("button5");

    obj.label52 = GUI.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.scrollBox9);
    obj.label52:setLeft(555);
    obj.label52:setTop(400);
    obj.label52:setWidth(200);
    obj.label52:setHeight(20);
    obj.label52:setText("Conheça a Mesa:");
    obj.label52:setName("label52");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.scrollBox9);
    obj.button6:setLeft(555);
    obj.button6:setTop(425);
    obj.button6:setWidth(100);
    obj.button6:setText("RPGmeister");
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.scrollBox9);
    obj.button7:setLeft(660);
    obj.button7:setTop(425);
    obj.button7:setWidth(100);
    obj.button7:setText("Exportar");
    obj.button7:setHint("Coloca o conteudo da ficha na área de tranferencia (Ctrl+V) no formato markdown. Experimente colar o texto no site: homebrewery.naturalcrit.com");
    obj.button7:setName("button7");

    obj._e_event0 = obj:addEventListener("onNodeReady",
        function (_)
            internet.download("https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20de%20Reinos%20d20/output/Ficha%20de%20Reinos%20d20.rpk?raw=true",
                        function(stream, contentType)
                            local info = rrpg.plugins.getRPKDetails(stream);
                            sheet.versionDownloaded = "VERSÃO DISPONÍVEL: " .. info.version;
            
                            local installed = rrpg.plugins.getInstalledPlugins();
                            local myself;
                            for i=1, #installed, 1 do
                                if installed[i].moduleId == info.moduleId then
                                    myself = installed[i];
                                    sheet.versionInstalled = "VERSÃO INSTALADA: " .. installed[i].version;
                                end;
                            end;
            
                            if sheet.noUpdate==true then return end;
                            if myself~= nil and isNewVersion(myself.version, info.version) then
                                Dialogs.choose("Há uma nova versão desse plugin. Deseja instalar?",{"Sim", "Não", "Não perguntar novamente."},
                                    function(selected, selectedIndex, selectedText)
                                        if selected and selectedIndex == 1 then
                                            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20de%20Reinos%20d20/output/Ficha%20de%20Reinos%20d20.rpk?raw=true');
                                        elseif selected and selectedIndex == 3 then
                                            sheet.noUpdate = true;
                                        end;
                                    end);
                            end;
                        end,       
                        function (errorMsg)
                            --showMessage(errorMsg);
                        end,       
                        function (downloaded, total)
                            -- esta função será chamada constantemente.
                            -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                        end);
        end, obj);

    obj._e_event1 = obj.rclDestalhesDoReino:addEventListener("onEndEnumeration",
        function (_)
            if sheet~= nil then
            					local objetos = ndb.getChildNodes(sheet.listaDeDestalhesDoReino);
            					local nomes = {"Descrição","Cultura","Raças","Classes","Historia","Geografia","Clima", "Outros", "Religião"};
            					local indexes = {1,2,3,4,5,6,7,9,8};
            					for i=1, #objetos, 1 do
            						objetos[i].nome = nomes[i];
            						objetos[i].index = indexes[i];
            					end;
            
            					if self.rclDestalhesDoReino.selectedNode== nil and #objetos>0 then
            						self.rclDestalhesDoReino.selectedNode = objetos[1]; 
            					end;
            					self.rclDestalhesDoReino:sort();
            				end;
        end, obj);

    obj._e_event2 = obj.rclDestalhesDoReino:addEventListener("onSelect",
        function (_)
            local node = self.rclDestalhesDoReino.selectedNode;
            					self.boxDetalhesDoReino.node = node; 
            					self.boxDetalhesDoReino.visible = (node ~= nil);
        end, obj);

    obj._e_event3 = obj.rclDestalhesDoReino:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (nodeA.index or 0) < (nodeB.index or 0) then
            					return -1;
            				elseif (nodeA.index or 0) > (nodeB.index or 0) then
            					return 1;
            				else   
            					return 0;
            				end;
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            
            					for i=1, #cidades, 1 do
            						local node = cidades[i];
            						local altura = tonumber(sheet.altura) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.height = altura;
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event5 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            
            					for i=1, #cidades, 1 do
            						local node = cidades[i];
            						local largura = tonumber(sheet.largura) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.width = largura;
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event6 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            
            					for i=1, #lugares, 1 do
            						local node = lugares[i];
            						local altura2 = tonumber(sheet.altura2) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.height = altura2;
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            
            					for i=1, #lugares, 1 do
            						local node = lugares[i];
            						local largura2 = tonumber(sheet.largura2) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.width = largura2;
            							end;
            						end;
            					end;
        end, obj);

    obj._e_event8 = obj.mapImage:addEventListener("onMouseDown",
        function (_, event)
            sheet.button = event.button;
            				sheet.x = event.x;
            				sheet.y = event.y;
            				sheet.shiftKey = event.shiftKey;
            				sheet.ctrlKey = event.ctrlKey;
            				sheet.altKey = event.altKey;
        end, obj);

    obj._e_event9 = obj.mapImage:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				
            				local mesa = rrpg.getMesaDe(sheet);
            				local mapImage = self:findControlByName("mapImage");
            
            				if sheet.shiftKey then
            					if not ndb.testPermission(sheet, "write") then return end;
            					-- Adicionar Cidade
            					if sheet.cityNum == nil then
            						sheet.cityNum = 0;
            					end;
            					sheet.cityNum = sheet.cityNum + 1;
            
            					local scale = 1;
            					if mapImage.scale > 1 then
            						scale = 0.5;
            					end;
            					local altura = tonumber(sheet.altura) or 25;
            					local largura = tonumber(sheet.largura) or 25;
            
            					local altura2 = tonumber(sheet.altura2) or 30;
            					local largura2 = tonumber(sheet.largura2) or 30;
            
            					local btn = gui.newButton();
            					btn.parent = self.mapa;
            					btn.left = (sheet.x-12)/scale;
            					btn.top = (sheet.y-12)/scale;
            					btn.width = largura/scale;
            					btn.height = altura/scale;
            					btn.cursor = "handPoint";
            					btn.hint = "Cidade";
            					btn.opacity = 0.35;
            					btn.name = "button_c"..sheet.cityNum;
            					btn.text = "";
            
            					local node = self.rclDestalhesDaCidade:append();
            					node.name = btn.name;
            					node.left = btn.left * scale;
            					node.top = btn.top * scale;
            					node.nome = "Cidade";
            
            					local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            					node.contador = #cidades;
            
            					btn.onClick = function() 
            						if sheet.dragged then
            							sheet.dragged = false;
            							return;
            						end;
            						self.boxDetalhesDaCidade.node = node; 
            						self.boxDetalhesDaCidade.visible = (node ~= nil);
            						self.tabControl.tabIndex = 2;
            					end;
            
            					btn.onMouseDown = function(event) 
            						sheet.drag = true;
            						sheet.dragX = event.x;
            						sheet.dragY = event.y;
            					end;
            
            					btn.onMouseMove = function(event)
            						if sheet.drag~=true then return end;
            						sheet.dragged = true;
            
            						btn.top = btn.top + (event.y - sheet.dragY);
            						btn.left = btn.left + (event.x - sheet.dragX);
            					end;
            
            					btn.onMouseUp = function(event)
            						sheet.drag = false;
            
            						local mapImage = self:findControlByName("mapImage");
            						local scale = 1;
            						if mapImage.scale > 1 then
            							scale = 0.5;
            						end;
            						node.left = btn.left*scale;
            						node.top = btn.top*scale;
            					end;
            
            					self.boxDetalhesDaCidade.node = node;
            					self.boxDetalhesDaCidade.visible = (node ~= nil);
            					self.tabControl.tabIndex = 2;
            
            				elseif sheet.ctrlKey then
            					if not ndb.testPermission(sheet, "write") then return end;
            					-- Adicionar Ponto de Interesse
            					if sheet.geographyNum == nil then
            						sheet.geographyNum = 0;
            					end;
            					sheet.geographyNum = sheet.geographyNum + 1;
            
            					local scale = 1;
            					if mapImage.scale > 1 then
            						scale = 0.5;
            					end;
            
            					local altura2 = tonumber(sheet.altura2) or 30;
            					local largura2 = tonumber(sheet.largura2) or 30;
            
            					local btn = gui.newButton();
            					btn.parent = self.mapa;
            					btn.left = (sheet.x-15)/scale;
            					btn.top = (sheet.y-15)/scale;
            					btn.width = largura2/scale;
            					btn.height = altura2/scale;
            					btn.cursor = "handPoint";
            					btn.hint = "Lugar";
            					btn.opacity = 0.35;
            					btn.name = "button_g"..sheet.geographyNum;
            					btn.text = "";
            
            					local node = self.rclDestalhesDaGeografia:append();
            					node.name = btn.name;
            					node.left = btn.left * scale;
            					node.top = btn.top * scale;
            					node.nome = "Lugar";
            					
            					local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            					node.contador = #lugares;
            
            					btn.onClick = function() 
            						if sheet.dragged then
            							sheet.dragged = false;
            							return;
            						end;
            						self.boxDetalhesDaGeografia.node = node; 
            						self.boxDetalhesDaGeografia.visible = (node ~= nil);
            						self.tabControl.tabIndex = 3;
            					end;
            
            					btn.onMouseDown = function(event) 
            						sheet.drag = true;
            						sheet.dragX = event.x;
            						sheet.dragY = event.y;
            					end;
            
            					btn.onMouseMove = function(event)
            						if sheet.drag~=true then return end;
            						sheet.dragged = true;
            
            						btn.top = btn.top + (event.y - sheet.dragY);
            						btn.left = btn.left + (event.x - sheet.dragX);
            					end;
            
            					btn.onMouseUp = function(event)
            						sheet.drag = false;
            
            						local mapImage = self:findControlByName("mapImage");
            						local scale = 1;
            						if mapImage.scale > 1 then
            							scale = 0.5;
            						end;
            						node.left = btn.left*scale;
            						node.top = btn.top*scale;
            					end;
            
            					self.boxDetalhesDaGeografia.node = node;
            					self.boxDetalhesDaGeografia.visible = (node ~= nil);
            					self.tabControl.tabIndex = 3;
            
            				elseif sheet.altKey then
            					-- Zoom control
            					local mapRectangle = self:findControlByName("mapRectangle");
            					local scale = 2;
            					self.sizeLayout.left = 2320;
            
            					if mapImage.scale > 1 then
            						scale = 0.5;
            						self.sizeLayout.left = 1160;
            					end;
            
            
            
            					mapImage.scale = mapImage.scale * scale;
            					mapRectangle.width = mapRectangle.width * scale;
            					mapRectangle.height = mapRectangle.height * scale;
            
            					-- repositioning city buttons
            					local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            					for i=1, #cidades, 1 do
            						local node = cidades[i];
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.width = btn.width * scale;
            								btn.height = btn.height * scale;
            								btn.left = btn.left * scale;
            								btn.top = btn.top * scale;
            							end;
            						end;
            					end;
            
            					-- repositioning places buttons
            					local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            					for i=1, #lugares, 1 do
            						local node = lugares[i];
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn ~= nil then
            								btn.width = btn.width * scale;
            								btn.height = btn.height * scale;
            								btn.left = btn.left * scale;
            								btn.top = btn.top * scale;
            							end;
            						end;
            					end;
            
            				else
            					if not ndb.testPermission(sheet, "write") then return end;
            					-- Alterar Imagem
            					Dialogs.selectImageURL(nil,
            						function(url)
            							sheet.mapa = url;
            						end);
            				end;
        end, obj);

    obj._e_event10 = obj.rclDestalhesDaCidade:addEventListener("onEndEnumeration",
        function (_)
            if sheet~= nil then
            					local cidades = ndb.getChildNodes(sheet.listaDeDestalhesDaCidade);
            					local mapa = self:findControlByName("mapa");
            					local mapImage = self:findControlByName("mapImage");
            
            					for i=1, #cidades, 1 do
            						local node = cidades[i];
            
            						local altura = tonumber(sheet.altura) or 25;
            						local largura = tonumber(sheet.largura) or 25;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn == nil then
            								local btn = gui.newButton();
            								btn.parent = mapa;
            								btn.left = node.left;
            								btn.top = node.top;
            								btn.width = largura;
            								btn.height = altura;
            								btn.cursor = "handPoint";
            								btn.hint = node.nome;
            								btn.opacity = 0.35;
            								btn.name = node.name;
            								btn.text = "";
            								sheet.drag = false;
            
            								btn.onClick = function() 
            									if sheet.dragged then
            										sheet.dragged = false;
            										return;
            									end;
            									self.boxDetalhesDaCidade.node = node; 
            									self.boxDetalhesDaCidade.visible = (node ~= nil);
            									self.tabControl.tabIndex = 2;
            								end;
            
            								btn.onMouseDown = function(event) 
            									sheet.drag = true;
            									sheet.dragX = event.x;
            									sheet.dragY = event.y;
            								end;
            
            								btn.onMouseMove = function(event)
            									if sheet.drag~=true then return end;
            									sheet.dragged = true;
            
            									btn.top = btn.top + (event.y - sheet.dragY);
            									btn.left = btn.left + (event.x - sheet.dragX);
            								end;
            
            								btn.onMouseUp = function(event)
            									sheet.drag = false;
            
            									local mapImage = self:findControlByName("mapImage");
            									local scale = 1;
            									if mapImage.scale > 1 then
            										scale = 0.5;
            									end;
            									node.left = btn.left*scale;
            									node.top = btn.top*scale;
            								end;
            							end;
            						end;
            					end;
            
            					if self.rclDestalhesDaCidade.selectedNode== nil and #cidades>0 then
            						self.rclDestalhesDaCidade.selectedNode = cidades[1]; 
            					end;
            				end;
        end, obj);

    obj._e_event11 = obj.rclDestalhesDaCidade:addEventListener("onSelect",
        function (_)
            local node = self.rclDestalhesDaCidade.selectedNode;
            					self.boxDetalhesDaCidade.node = node; 
            					self.boxDetalhesDaCidade.visible = (node ~= nil);
        end, obj);

    obj._e_event12 = obj.rclDestalhesDaCidade:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            				if nodeA.capital and not nodeB.capital then
            					return -1;
            				elseif not nodeA.capital and nodeB.capital then
            					return 1;
            		        elseif (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            		            return -1;
            		        elseif (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            		            return 1;
            		        else   
            		            return 0;
            		        end;
        end, obj);

    obj._e_event13 = obj.cidade_tipo:addEventListener("onChange",
        function (_)
            local node = self.boxDetalhesDaCidade.node;
            						if node==nil then return end;
            
            						local combobox = self:findControlByName("cidade_tipo");
            						if node.tipo=="Rural" then
            							combobox.hint = "A cidade fica em uma região isolada ou distante de outros lugares possuindo muitos habitantes de classes ligadas à natureza. Possuem 25% menos riquezas que outras cidades.";
            						elseif node.tipo=="Fronteira" then
            							combobox.hint = "A cidade fica perto da borda de duas regiões e por isso possui muitos habitantes temporários (mercadores, aventureiros, viajantes) possuindo como moradores personagens de classes urbanas, mas sendo possível encontrar personagens de classes diferentes em épocas diferentes.";
            						elseif node.tipo=="Civil" then
            							combobox.hint = "Estas regiões são habitas de forma similar as fronteiras, mas sem o grande número de visitantes. Portanto é mais difícil de encontrar personagens de classes muito diferentes.";
            						elseif node.tipo=="Urbana" then
            							combobox.hint = "Regiões densamente habitadas por diversos tipos de pessoas. É possível encontrar uma variedade maior de habitantes do que uma área de fronteira e em qualquer época. Possuem 25% mais riquezas que outras cidades.";
            						end;
        end, obj);

    obj._e_event14 = obj.cidade_composicao:addEventListener("onChange",
        function (_)
            local node = self.boxDetalhesDaCidade.node;
            						if node==nil then return end;
            
            						local combobox = self:findControlByName("cidade_composicao");
            						if node.composicao=="Isolada" then
            							combobox.hint = "Uma raça principal.";
            						elseif node.composicao=="Miscigenada" then
            							combobox.hint = "Algumas raças principais, mas uma boa porção de outras raças.";
            						elseif node.composicao=="Integrada" then
            							combobox.hint = "Divisão parcialmente igualitária de raças";
            						end;
        end, obj);

    obj._e_event15 = obj.cidade_economia:addEventListener("onChange",
        function (_)
            local node = self.boxDetalhesDaCidade.node;
            						if node==nil then return end;
            
            						local combobox = self:findControlByName("cidade_economia");
            						if node.economia =="Fabricação" then
            							combobox.hint = "Está cidade tem como principal atividade economica a compra de material prima para produção de objetos que são revendidos. ";
            						elseif node.economia =="Agropecuária" then
            							combobox.hint = "Está cidade tem como principal atividade economica a exportação de alimentos.";
            						elseif node.economia =="Exploração" then
            							combobox.hint = "Está cidade tem como principal atividade economica a exploração de recursos naturais. ";
            						elseif node.economia =="Vendas" then
            							combobox.hint = "Está cidade tem como principal atividade economica o comercio, sendo um centro de comprar e vendas. ";
            						end;
        end, obj);

    obj._e_event16 = obj.button1:addEventListener("onClick",
        function (_)
            local node = self.boxDetalhesDaCidade.node;
            						if node==nil then return end;
            
            						if node.tamanho == nil or node.tamanho == "" then
            							local tamanhos = {"Lugarejo","Povoado","Aldeia","Vila Pequena","Vila Grande","Cidade Pequena","Cidade Grande","Metrópole","Metrópole Planar"};
            							local index = math.random(9);
            
            							node.tamanho = tamanhos[index];
            						end;
            
            						if node.tipo == nil or node.tipo == "" then
            							local tipos = {"Rural","Fronteira","Civil","Urbana"};
            							local index = math.random(4);
            
            							node.tipo = tipos[index];
            						end;
            
            						if node.populacao == nil or node.populacao == "" then
            
            							if node.tamanho == "Lugarejo" then
            								node.populacao = math.random(20,80);
            							elseif node.tamanho == "Povoado" then
            								node.populacao = math.random(81,400);
            							elseif node.tamanho == "Aldeia" then
            								node.populacao = math.random(401,900);
            							elseif node.tamanho == "Vila Pequena" then
            								node.populacao = math.random(901,2000);
            							elseif node.tamanho == "Vila Grande" then
            								node.populacao = math.random(2001,5000);
            							elseif node.tamanho == "Cidade Pequena" then
            								node.populacao = math.random(5001,12000);
            							elseif node.tamanho == "Cidade Grande" then
            								node.populacao = math.random(12001,25000);
            							elseif node.tamanho == "Metrópole" then
            								node.populacao = math.random(25001,100000);
            							elseif node.tamanho == "Metrópole Planar" then
            								node.populacao = math.random(100001,200000);
            							end;
            
            						end;
            
            						if node.composicao == nil or node.composicao == "" then
            							local composicoes = {"Isolada","Miscigenada","Integrada"};
            							local index = math.random(3);
            
            							node.composicao = composicoes[index];
            						end;
            
            						if node.economia == nil or node.economia == "" then
            							local economias = {"Fabricação","Agropecuária","Exploração","Vendas"};
            							local index = math.random(4);
            
            							node.economia = economias[index];
            						end;
            
            						if node.politica_1~=true and node.politica_2~=true and node.politica_3~=true and node.politica_4~=true and node.politica_5~=true and node.politica_6~=true and node.politica_7~=true and node.politica_8~=true and node.politica_9~=true then
            							local index = math.random(9);
            
            							node["politica_" .. index] = true;
            						end;
            
            						if node.militarizacao == nil or node.militarizacao == "" then
            							local militarizacoes = {"Baixo","Médio","Alto","Guerra"};
            							local index = math.random(4);
            
            							node.militarizacao = militarizacoes[index];
            						end;
        end, obj);

    obj._e_event17 = obj.edit6:addEventListener("onChange",
        function (_)
            local node = self.boxDetalhesDaCidade.node;
            						if node==nil then return end;
            						if populacao == nil then return end;
            
            						local populacao = tonumber(node.populacao) or 0;
            
            						if populacao <=80 then
            							node.tamanho = "Lugarejo";
            						elseif populacao <=400 then
            							node.tamanho = "Povoado";
            						elseif populacao <=900 then
            							node.tamanho = "Aldeia";
            						elseif populacao <=2000 then
            							node.tamanho = "Vila Pequena";
            						elseif populacao <=5000 then
            							node.tamanho = "Vila Grande";
            						elseif populacao <=12000 then
            							node.tamanho = "Cidade Pequena";
            						elseif populacao <=25000 then
            							node.tamanho = "Cidade Grande";
            						elseif populacao <=100000 then
            							node.tamanho = "Metrópole";
            						else
            							node.tamanho = "Metrópole Planar";
            						end;
        end, obj);

    obj._e_event18 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.boxDetalhesDaCidade.node;
            						if node==nil then return end;
            
            						local populacao = tonumber(node.populacao) or 0;
            						local mult = 4;
            
            						if populacao >100000 then
            							mult = 6;
            						end;
            
            						-- Alterar mult por tipo de cidade
            						if node.tipo=="Rural" then
            							mult = mult * 0.75;
            						elseif node.tipo=="Urbana" then
            							mult = mult * 1.25;
            						end;
            
            						-- Limite de PO
            						local limite = math.floor(mult * populacao);
            						local riqueza = math.floor(limite * populacao / 20);
            						
            						while true do  
            							limite, k = string.gsub(limite, "^(-?%d+)(%d%d%d)", '%1,%2')
            							if (k==0) then
            							  break
            							end
            						end
            						limite = string.gsub(limite, ",", ".");
            
            						while true do  
            							riqueza, k = string.gsub(riqueza, "^(-?%d+)(%d%d%d)", '%1,%2')
            							if (k==0) then
            							  break
            							end
            						end
            						riqueza = string.gsub(riqueza, ",", ".");
            
            						node.limitePO = limite;
            
            						-- Riqueza Total
            						node.riqueza = riqueza;
        end, obj);

    obj._e_event19 = obj.cidade_militarizacao:addEventListener("onChange",
        function (_)
            local node = self.boxDetalhesDaCidade.node;
            						if node==nil then return end;
            
            						local mult = 1;
            						local combobox = self:findControlByName("cidade_militarizacao");
            						if node.militarizacao=="Baixo" then
            							combobox.hint = "-50% dos guardas e reservistas.";
            							mult = 0.5;
            						elseif node.militarizacao=="Médio" then
            							combobox.hint = "Quantidade normal de guardas e reservistas.";
            						elseif node.militarizacao=="Alto" then
            							combobox.hint = "+50% guardas e reservistas.";
            							mult = 1.5;
            						elseif node.militarizacao=="Guerra" then
            							combobox.hint = "+100% guardas e reservistas, considere que os reservistas vão estar prontos para lutar a qualquer hora (não é necessário esperar uma hora)";
            							mult = 2;
            						end;
        end, obj);

    obj._e_event20 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local node = self.boxDetalhesDaCidade.node;
            						if node==nil then return end;
            
            						local mult = 1;
            						if node.militarizacao=="Baixo" then
            							mult = 0.5;
            						elseif node.militarizacao=="Médio" then
            						elseif node.militarizacao=="Alto" then
            							mult = 1.5;
            						elseif node.militarizacao=="Guerra" then
            							mult = 2;
            						end;
            
            						local populacao = tonumber(node.populacao) or 0;
            
            						local guardas = math.max(math.floor(populacao * mult / 100), 1);
            						local reservistas = math.max(math.floor(populacao * mult / 20), 1);
            
            						node.guardas = guardas;
            						node.reservistas = reservistas;
        end, obj);

    obj._e_event21 = obj.mapImageCidade:addEventListener("onMouseDown",
        function (_, event)
            local node = self.boxDetalhesDaCidade.node;
            							node.event = event;
        end, obj);

    obj._e_event22 = obj.mapImageCidade:addEventListener("onClick",
        function (_)
            local node = self.boxDetalhesDaCidade.node;
            							if node==nil then return end;
            							local mesa = rrpg.getMesaDe(sheet);
            
            							if node.event.altKey then
            								-- Zoom control
            								local mapImageCidade = self:findControlByName("mapImageCidade");
            								local mapRectangleCidade = self:findControlByName("mapRectangleCidade");
            								local scale = 2;
            
            								if mapImageCidade.scale > 1 then
            									scale = 0.5;
            								end;
            
            								mapImageCidade.scale = mapImageCidade.scale * scale;
            								mapRectangleCidade.width = mapRectangleCidade.width * scale;
            								mapRectangleCidade.height = mapRectangleCidade.height * scale;
            							else
            								if not ndb.testPermission(sheet, "write") then return end;
            								-- Alterar Imagem
            								Dialogs.selectImageURL(nil,
            									function(url)
            										local node = self.boxDetalhesDaCidade.node;
            										node.mapaCidade = url;
            									end);
            							end;
        end, obj);

    obj._e_event23 = obj.rclDestalhesDaGeografia:addEventListener("onEndEnumeration",
        function (_)
            if sheet~= nil then
            					local lugares = ndb.getChildNodes(sheet.listaDeDestalhesDaGeografia);
            					local mapa = self:findControlByName("mapa");
            
            					for i=1, #lugares, 1 do
            						local node = lugares[i];
            
            						local altura2 = tonumber(sheet.altura2) or 30;
            						local largura2 = tonumber(sheet.largura2) or 30;
            
            						if node.name ~= nil then
            							local btn = self:findControlByName(node.name);
            							if btn == nil then
            								local btn = gui.newButton();
            								btn.parent = mapa;
            								btn.left = node.left;
            								btn.top = node.top;
            								btn.width = largura2;
            								btn.height = altura2;
            								btn.cursor = "handPoint";
            								btn.hint = node.nome;
            								btn.opacity = 0.35;
            								btn.name = node.name;
            								btn.text = "";
            
            								btn.onClick = function() 
            									if sheet.dragged then
            										sheet.dragged = false;
            										return;
            									end;
            									self.boxDetalhesDaGeografia.node = node; 
            									self.boxDetalhesDaGeografia.visible = (node ~= nil);
            									self.tabControl.tabIndex = 3;
            								end;
            
            								btn.onMouseDown = function(event) 
            									sheet.drag = true;
            									sheet.dragX = event.x;
            									sheet.dragY = event.y;
            								end;
            
            								btn.onMouseMove = function(event)
            									if sheet.drag~=true then return end;
            									sheet.dragged = true;
            
            									btn.top = btn.top + (event.y - sheet.dragY);
            									btn.left = btn.left + (event.x - sheet.dragX);
            								end;
            
            								btn.onMouseUp = function(event)
            									local mapImage = self:findControlByName("mapImage");
            									local scale = 1;
            									if mapImage.scale > 1 then
            										scale = 0.5;
            									end;
            
            									sheet.drag = false;
            									node.left = btn.left*scale;
            									node.top = btn.top*scale;
            								end;
            							end;
            						end;
            					end;
            
            					if self.rclDestalhesDaGeografia.selectedNode== nil and #lugares>0 then
            						self.rclDestalhesDaGeografia.selectedNode = lugares[1]; 
            					end;
            				end;
        end, obj);

    obj._e_event24 = obj.rclDestalhesDaGeografia:addEventListener("onSelect",
        function (_)
            local node = self.rclDestalhesDaGeografia.selectedNode;
            					self.boxDetalhesDaGeografia.node = node; 
            					self.boxDetalhesDaGeografia.visible = (node ~= nil);
        end, obj);

    obj._e_event25 = obj.rclDestalhesDaGeografia:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            		        if (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            		            return -1;
            		        elseif (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            		            return 1;
            		        else   
            		            return 0;
            		        end;
        end, obj);

    obj._e_event26 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Selected.left = 20 * (tonumber(sheet.CorIndex or 0) % 8);
            			self.Selected.top = 20 * math.floor(tonumber(sheet.CorIndex or 0) / 8);
        end, obj);

    obj._e_event27 = obj.rectangle11:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            					sheet.CorIndex = sheet.IndexBarrinha1;
            					sheet.ColorString = sheet.CorBarrinha1;
            					self.SelectCor:show();
        end, obj);

    obj._e_event28 = obj.rectangle12:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            							sheet.CorIndex = sheet.IndexBarrinha1;
            							sheet.ColorString = sheet.CorBarrinha1;
            							self.SelectCor:show();
        end, obj);

    obj._e_event29 = obj.CorBarrinha1:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 1;
            								sheet.CorIndex = sheet.IndexBarrinha1;
            								sheet.ColorString = sheet.CorBarrinha1;
            								self.SelectCor:show();
        end, obj);

    obj._e_event30 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha1.color = sheet.CorBarrinha1;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha1 = sheet.CorBarrinha1;
            				end;
        end, obj);

    obj._e_event31 = obj.rectangle13:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            					sheet.CorIndex = sheet.IndexBarrinha2;
            					sheet.ColorString = sheet.CorBarrinha2;
            					self.SelectCor:show();
        end, obj);

    obj._e_event32 = obj.rectangle14:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            							sheet.CorIndex = sheet.IndexBarrinha2;
            							sheet.ColorString = sheet.CorBarrinha2;
            							self.SelectCor:show();
        end, obj);

    obj._e_event33 = obj.CorBarrinha2:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 2;
            								sheet.CorIndex = sheet.IndexBarrinha2;
            								sheet.ColorString = sheet.CorBarrinha2;
            								self.SelectCor:show();
        end, obj);

    obj._e_event34 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha2.color = sheet.CorBarrinha2;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha2 = sheet.CorBarrinha2;
            				end;
        end, obj);

    obj._e_event35 = obj.rectangle15:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            					sheet.CorIndex = sheet.IndexBarrinha3;
            					sheet.ColorString = sheet.CorBarrinha3;
            					self.SelectCor:show();
        end, obj);

    obj._e_event36 = obj.rectangle16:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            							sheet.CorIndex = sheet.IndexBarrinha3;
            							sheet.ColorString = sheet.CorBarrinha3;
            							self.SelectCor:show();
        end, obj);

    obj._e_event37 = obj.CorBarrinha3:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 3;
            								sheet.CorIndex = sheet.IndexBarrinha3;
            								sheet.ColorString = sheet.CorBarrinha3;
            								self.SelectCor:show();
        end, obj);

    obj._e_event38 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha3.color = sheet.CorBarrinha3;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha3 = sheet.CorBarrinha3;
            				end;
        end, obj);

    obj._e_event39 = obj.rectangle17:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            					sheet.CorIndex = sheet.IndexBarrinha4;
            					sheet.ColorString = sheet.CorBarrinha4;
            					self.SelectCor:show();
        end, obj);

    obj._e_event40 = obj.rectangle18:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            							sheet.CorIndex = sheet.IndexBarrinha4;
            							sheet.ColorString = sheet.CorBarrinha4;
            							self.SelectCor:show();
        end, obj);

    obj._e_event41 = obj.CorBarrinha4:addEventListener("onClick",
        function (_)
            sheet.IndexBarrinha = 4;
            								sheet.CorIndex = sheet.IndexBarrinha4;
            								sheet.ColorString = sheet.CorBarrinha4;
            								self.SelectCor:show();
        end, obj);

    obj._e_event42 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.CorBarrinha4.color = sheet.CorBarrinha4;
            				local nodes2 = ndb.getChildNodes(sheet.campoDosNPC);
            				for j = 1, #nodes2, 1 do
            				nodes2[j].CorBarrinha4 = sheet.CorBarrinha4;
            				end;
        end, obj);

    obj._e_event43 = obj.button2:addEventListener("onClick",
        function (_)
            self.Config:close();
        end, obj);

    obj._e_event44 = obj.layout19:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "0";
            				sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event45 = obj.rectangle21:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "0";
            					sheet.ColorString = "#acacac";
        end, obj);

    obj._e_event46 = obj.layout20:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "1";
            				sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event47 = obj.rectangle22:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "1";
            					sheet.ColorString = "#5959ff";
        end, obj);

    obj._e_event48 = obj.layout21:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "2";
            				sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event49 = obj.rectangle23:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "2";
            					sheet.ColorString = "#59ff59";
        end, obj);

    obj._e_event50 = obj.layout22:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "3";
            				sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event51 = obj.rectangle24:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "3";
            					sheet.ColorString = "#ff5959";
        end, obj);

    obj._e_event52 = obj.layout23:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "4";
            				sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event53 = obj.rectangle25:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "4";
            					sheet.ColorString = "#ff59ff";
        end, obj);

    obj._e_event54 = obj.layout24:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "5";
            				sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event55 = obj.rectangle26:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "5";
            					sheet.ColorString = "#ffac59";
        end, obj);

    obj._e_event56 = obj.layout25:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "6";
            				sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event57 = obj.rectangle27:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "6";
            					sheet.ColorString = "#ffff59";
        end, obj);

    obj._e_event58 = obj.layout26:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "7";
            				sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event59 = obj.rectangle28:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "7";
            					sheet.ColorString = "#59ffff";
        end, obj);

    obj._e_event60 = obj.layout27:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "8";
            				sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event61 = obj.rectangle29:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "8";
            					sheet.ColorString = "#ffd159";
        end, obj);

    obj._e_event62 = obj.layout28:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "9";
            				sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event63 = obj.rectangle30:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "9";
            					sheet.ColorString = "#5990ff";
        end, obj);

    obj._e_event64 = obj.layout29:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "10";
            				sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event65 = obj.rectangle31:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "10";
            					sheet.ColorString = "#f4c264";
        end, obj);

    obj._e_event66 = obj.layout30:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "11";
            				sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event67 = obj.rectangle32:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "11";
            					sheet.ColorString = "#de7a7a";
        end, obj);

    obj._e_event68 = obj.layout31:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "12";
            				sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event69 = obj.rectangle33:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "12";
            					sheet.ColorString = "#cb83d6";
        end, obj);

    obj._e_event70 = obj.layout32:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "13";
            				sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event71 = obj.rectangle34:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "13";
            					sheet.ColorString = "#f3658a";
        end, obj);

    obj._e_event72 = obj.layout33:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "14";
            				sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event73 = obj.rectangle35:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "14";
            					sheet.ColorString = "#8cecb3";
        end, obj);

    obj._e_event74 = obj.layout34:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "15";
            				sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event75 = obj.rectangle36:addEventListener("onClick",
        function (_)
            sheet.CorIndex = "15";
            					sheet.ColorString = "#ed846b";
        end, obj);

    obj._e_event76 = obj.button3:addEventListener("onClick",
        function (_)
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

    obj._e_event77 = obj.NovaAbadeNPCs:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						node = self.opcoesFalsas:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event78 = obj.rectangle38:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event79 = obj.label43:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            						 self:autoCalcular();
        end, obj);

    obj._e_event80 = obj.path1:addEventListener("onClick",
        function (_)
            self.dropDownFalso.scopeNode = sheet;
            							 self:autoCalcular();
        end, obj);

    obj._e_event81 = obj.ListaDeNPCs:addEventListener("onShow",
        function (_)
            if self.opcoesFalsas2.selectedNode == nil and sheet ~= nil then
            			chamarListaDeJogadores();
            			autoCalcular();
                        local nodes = ndb.getChildNodes(sheet.opcoesFalsas2);               
                        if #nodes > 0 then
                            self.opcoesFalsas2.selectedNode = nodes[1];
                        end;
                    end;
        end, obj);

    obj._e_event82 = obj.opcoesFalsas2:addEventListener("onSelect",
        function (_)
            local node = self.opcoesFalsas2.selectedNode;
            						 setTimeout(function()
            							if node ~= nil then
            								self.recordNode.scopeNode.opcaoEscolhida2 = node.NomeDaOpcao;
            							end;
            						 end,10);
        end, obj);

    obj._e_event83 = obj.opcoesFalsas2:addEventListener("onCompare",
        function (_, nodeA, nodeB)
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

    obj._e_event84 = obj.rectangle39:addEventListener("onResize",
        function (_)
            if self.width >= 270 then
            				self.rclListaDeNPC.width = self.width;
            			else
            				self.rclListaDeNPC.width = 270;
            			end;
        end, obj);

    obj._e_event85 = obj.Configurar:addEventListener("onClick",
        function (_)
            if DonoMestre() then
            						self.Config.scopeNode = sheet;
            						self.Config:show();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event86 = obj.NovoNPC:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						node = self.rclListaDeNPC:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event87 = obj.Organizar:addEventListener("onClick",
        function (_)
            if DonoMestre() then			
            						self.rclListaDeNPC:sort();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event88 = obj.rclListaDeNPC:addEventListener("onBeginEnumeration",
        function (_)
        end, obj);

    obj._e_event89 = obj.rclListaDeNPC:addEventListener("onItemAdded",
        function (_, node, form)
            node.CorBarrinha1 = (sheet.CorBarrinha1 or "#808080");
            					node.CorBarrinha2 = (sheet.CorBarrinha2 or "#808080");
            					node.CorBarrinha3 = (sheet.CorBarrinha3 or "#808080");
            					node.CorBarrinha4 = (sheet.CorBarrinha4 or "#808080");
            					form.Barrinha1.color = sheet.CorBarrinha1;
            					form.Barrinha2.color = sheet.CorBarrinha2;
            					form.Barrinha3.color = sheet.CorBarrinha3;
            					form.Barrinha4.color = sheet.CorBarrinha4;
        end, obj);

    obj._e_event90 = obj.rclListaDeNPC:addEventListener("onCompare",
        function (_, nodeA, nodeB)
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

    obj._e_event91 = obj.opcoesFalsas:addEventListener("onSelect",
        function (_)
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

    obj._e_event92 = obj.opcoesFalsas:addEventListener("onBeginEnumeration",
        function (_)
            if sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            						if #nodes == 0 then
            							local node = self.opcoesFalsas:append();
            							node.NomeDaOpcao = "Principal";
            						end;
            					end;
        end, obj);

    obj._e_event93 = obj.opcoesFalsas:addEventListener("onEndEnumeration",
        function (_)
            local nodes = ndb.getChildNodes(sheet.opcoesFalsas);
            					if self.dcsMain.scopeNode == nil then
            						self.dcsMain.scopeNode = nodes[1];
            						self.dcsTituloEAbas.scopeNode = nodes[1];
            						self.comboBoxFalsa.scopeNode = nodes[1];
            					end;
        end, obj);

    obj._e_event94 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event95 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event96 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
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

    obj._e_event97 = obj.button4:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20de%20Reinos%20d20/README.md')
        end, obj);

    obj._e_event98 = obj.button5:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://github.com/rrpgfirecast/firecast/blob/master/Plugins/Sheets/Ficha%20de%20Reinos%20d20/output/Ficha%20de%20Reinos%20d20.rpk?raw=true')
        end, obj);

    obj._e_event99 = obj.button6:addEventListener("onClick",
        function (_)
            gui.openInBrowser('http://firecast.rrpg.com.br:90/a?a=pagRWEMesaInfo.actInfoMesa&mesaid=64070');
        end, obj);

    obj._e_event100 = obj.button7:addEventListener("onClick",
        function (_)
            exportToMarkdown();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
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

        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dcsMain ~= nil then self.dcsMain:destroy(); self.dcsMain = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.cidade_militarizacao ~= nil then self.cidade_militarizacao:destroy(); self.cidade_militarizacao = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.frmCities ~= nil then self.frmCities:destroy(); self.frmCities = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.Nha ~= nil then self.Nha:destroy(); self.Nha = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.frmKingdom ~= nil then self.frmKingdom:destroy(); self.frmKingdom = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.path1 ~= nil then self.path1:destroy(); self.path1 = nil; end;
        if self.cidade_composicao ~= nil then self.cidade_composicao:destroy(); self.cidade_composicao = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.Organizar ~= nil then self.Organizar:destroy(); self.Organizar = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.scrollBox9 ~= nil then self.scrollBox9:destroy(); self.scrollBox9 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.CorBarrinha4 ~= nil then self.CorBarrinha4:destroy(); self.CorBarrinha4 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        if self.tab5 ~= nil then self.tab5:destroy(); self.tab5 = nil; end;
        if self.comboBox10 ~= nil then self.comboBox10:destroy(); self.comboBox10 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.mapRectangleCidade ~= nil then self.mapRectangleCidade:destroy(); self.mapRectangleCidade = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.cidade_economia ~= nil then self.cidade_economia:destroy(); self.cidade_economia = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.mapImage ~= nil then self.mapImage:destroy(); self.mapImage = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.CorBarrinha3 ~= nil then self.CorBarrinha3:destroy(); self.CorBarrinha3 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.boxDetalhesDaCidade ~= nil then self.boxDetalhesDaCidade:destroy(); self.boxDetalhesDaCidade = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.comboBoxFalsa ~= nil then self.comboBoxFalsa:destroy(); self.comboBoxFalsa = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.tab7 ~= nil then self.tab7:destroy(); self.tab7 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.recordNode ~= nil then self.recordNode:destroy(); self.recordNode = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.frmTemplateCreditos ~= nil then self.frmTemplateCreditos:destroy(); self.frmTemplateCreditos = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rclDestalhesDoReino ~= nil then self.rclDestalhesDoReino:destroy(); self.rclDestalhesDoReino = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.sizeLayout ~= nil then self.sizeLayout:destroy(); self.sizeLayout = nil; end;
        if self.rclDestalhesDaCidade ~= nil then self.rclDestalhesDaCidade:destroy(); self.rclDestalhesDaCidade = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.scrollBox3 ~= nil then self.scrollBox3:destroy(); self.scrollBox3 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.SelectCor ~= nil then self.SelectCor:destroy(); self.SelectCor = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.richEdit3 ~= nil then self.richEdit3:destroy(); self.richEdit3 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.opcoesFalsas2 ~= nil then self.opcoesFalsas2:destroy(); self.opcoesFalsas2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.Listade_NPC_Dock ~= nil then self.Listade_NPC_Dock:destroy(); self.Listade_NPC_Dock = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.scrollBox5 ~= nil then self.scrollBox5:destroy(); self.scrollBox5 = nil; end;
        if self.richEdit2 ~= nil then self.richEdit2:destroy(); self.richEdit2 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.richEdit8 ~= nil then self.richEdit8:destroy(); self.richEdit8 = nil; end;
        if self.NovaAbadeNPCs ~= nil then self.NovaAbadeNPCs:destroy(); self.NovaAbadeNPCs = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.boxDetalhesDaGeografia ~= nil then self.boxDetalhesDaGeografia:destroy(); self.boxDetalhesDaGeografia = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.frmGeography ~= nil then self.frmGeography:destroy(); self.frmGeography = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.tab6 ~= nil then self.tab6:destroy(); self.tab6 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.rclDestalhesDaGeografia ~= nil then self.rclDestalhesDaGeografia:destroy(); self.rclDestalhesDaGeografia = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.scrollBox8 ~= nil then self.scrollBox8:destroy(); self.scrollBox8 = nil; end;
        if self.scrollBox7 ~= nil then self.scrollBox7:destroy(); self.scrollBox7 = nil; end;
        if self.mapImageCidade ~= nil then self.mapImageCidade:destroy(); self.mapImageCidade = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.Configurar ~= nil then self.Configurar:destroy(); self.Configurar = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.comboBox4 ~= nil then self.comboBox4:destroy(); self.comboBox4 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.comboBox6 ~= nil then self.comboBox6:destroy(); self.comboBox6 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.dropDownFalso ~= nil then self.dropDownFalso:destroy(); self.dropDownFalso = nil; end;
        if self.richEdit4 ~= nil then self.richEdit4:destroy(); self.richEdit4 = nil; end;
        if self.frmTemplateNotes ~= nil then self.frmTemplateNotes:destroy(); self.frmTemplateNotes = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.rclListaDeNPC ~= nil then self.rclListaDeNPC:destroy(); self.rclListaDeNPC = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.dropDownFalso2 ~= nil then self.dropDownFalso2:destroy(); self.dropDownFalso2 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.boxDetalhesDoReino ~= nil then self.boxDetalhesDoReino:destroy(); self.boxDetalhesDoReino = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.Config ~= nil then self.Config:destroy(); self.Config = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.MainClient ~= nil then self.MainClient:destroy(); self.MainClient = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.mapRectangle ~= nil then self.mapRectangle:destroy(); self.mapRectangle = nil; end;
        if self.comboBox7 ~= nil then self.comboBox7:destroy(); self.comboBox7 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.comboBox5 ~= nil then self.comboBox5:destroy(); self.comboBox5 = nil; end;
        if self.NovoNPC ~= nil then self.NovoNPC:destroy(); self.NovoNPC = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.tabControl ~= nil then self.tabControl:destroy(); self.tabControl = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.opcoesFalsas ~= nil then self.opcoesFalsas:destroy(); self.opcoesFalsas = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.comboBox9 ~= nil then self.comboBox9:destroy(); self.comboBox9 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.comboBox8 ~= nil then self.comboBox8:destroy(); self.comboBox8 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dcsTituloEAbas ~= nil then self.dcsTituloEAbas:destroy(); self.dcsTituloEAbas = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.mapa ~= nil then self.mapa:destroy(); self.mapa = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.scrollBox6 ~= nil then self.scrollBox6:destroy(); self.scrollBox6 = nil; end;
        if self.richEdit7 ~= nil then self.richEdit7:destroy(); self.richEdit7 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.frmMap ~= nil then self.frmMap:destroy(); self.frmMap = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.richEdit6 ~= nil then self.richEdit6:destroy(); self.richEdit6 = nil; end;
        if self.Selected ~= nil then self.Selected:destroy(); self.Selected = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.cidade_tipo ~= nil then self.cidade_tipo:destroy(); self.cidade_tipo = nil; end;
        if self.CorBarrinha1 ~= nil then self.CorBarrinha1:destroy(); self.CorBarrinha1 = nil; end;
        if self.Flow ~= nil then self.Flow:destroy(); self.Flow = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.richEdit5 ~= nil then self.richEdit5:destroy(); self.richEdit5 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.scrollBox4 ~= nil then self.scrollBox4:destroy(); self.scrollBox4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.richEdit9 ~= nil then self.richEdit9:destroy(); self.richEdit9 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.ListaDeNPCs ~= nil then self.ListaDeNPCs:destroy(); self.ListaDeNPCs = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTemplate()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTemplate();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTemplate = {
    newEditor = newfrmTemplate, 
    new = newfrmTemplate, 
    name = "frmTemplate", 
    dataType = "Ambesek.Nefertyne.Reinos", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Reinos d20", 
    description=""};

frmTemplate = _frmTemplate;
Firecast.registrarForm(_frmTemplate);
Firecast.registrarDataType(_frmTemplate);

return _frmTemplate;
