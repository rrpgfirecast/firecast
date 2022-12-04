require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFicha1_svg()
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
    obj:setName("frmFicha1_svg");
    obj:setAlign("client");

    obj.FichaPrincipalTD = GUI.fromHandle(_obj_newObject("layout"));
    obj.FichaPrincipalTD:setParent(obj);
    obj.FichaPrincipalTD:setName("FichaPrincipalTD");
    obj.FichaPrincipalTD:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.FichaPrincipalTD);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.FichaPrincipal = GUI.fromHandle(_obj_newObject("image"));
    obj.FichaPrincipal:setParent(obj.scrollBox1);
    obj.FichaPrincipal:setName("FichaPrincipal");
    obj.FichaPrincipal:setLeft(0);
    obj.FichaPrincipal:setTop(0);
    obj.FichaPrincipal:setWidth(989);
    obj.FichaPrincipal:setHeight(720);
    obj.FichaPrincipal:setSRC("images/1.png");
    obj.FichaPrincipal:setStyle("stretch");
    obj.FichaPrincipal:setOptimize(true);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setSRC("/imagens/Dinheiro.png");
    obj.image1:setLeft(369);
    obj.image1:setTop(33);
    obj.image1:setWidth(253);
    obj.image1:setHeight(95);
    obj.image1:setName("image1");

    obj.zeraSoma = GUI.fromHandle(_obj_newObject("button"));
    obj.zeraSoma:setParent(obj.scrollBox1);
    obj.zeraSoma:setName("zeraSoma");
    obj.zeraSoma:setVisible(false);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(383.75);
    obj.button1:setTop(47.50);
    obj.button1:setWidth(73.50);
    obj.button1:setHeight(72);
    obj.button1:setOpacity(0);
    obj.button1:setText("$");
    obj.button1:setFontColor("lime");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setName("button1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.labSoma2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma2:setParent(obj.layout1);
    obj.labSoma2:setLeft(471);
    obj.labSoma2:setTop(60);
    lfm_setPropAsString(obj.labSoma2, "fontStyle",  "bold");
    obj.labSoma2:setFontSize(30.0);
    obj.labSoma2:setAutoSize(true);
    obj.labSoma2:setWordWrap(false);
    obj.labSoma2:setName("labSoma2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setField("Soma");
    obj.dataLink1:setName("dataLink1");

    obj.versoes = GUI.fromHandle(_obj_newObject("layout"));
    obj.versoes:setParent(obj.scrollBox1);
    obj.versoes:setName("versoes");
    obj.versoes:setAlign("client");
    obj.versoes:setVisible(true);

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.versoes);
    obj.button2:setLeft(0);
    obj.button2:setTop(85);
    obj.button2:setWidth(85);
    obj.button2:setText("Atualizar");
    lfm_setPropAsString(obj.button2, "fontStyle",  "bold");
    obj.button2:setFontColor("yellow");
    obj.button2:setName("button2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.versoes);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(21);
    obj.rectangle1:setWidth(102);
    obj.rectangle1:setHeight(22);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.versoes);
    obj.image2:setLeft(0);
    obj.image2:setTop(22);
    obj.image2:setWidth(100);
    obj.image2:setHeight(20);
    obj.image2:setStyle("autoFit");
    obj.image2:setSRC("https://dl.dropboxusercontent.com/s/d9wthpq1o0bmink/suaversao%203.png?dl=0");
    obj.image2:setName("image2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.versoes);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(63);
    obj.rectangle2:setWidth(102);
    obj.rectangle2:setHeight(22);
    obj.rectangle2:setColor("white");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.imgVersaoAtual = GUI.fromHandle(_obj_newObject("image"));
    obj.imgVersaoAtual:setParent(obj.versoes);
    obj.imgVersaoAtual:setName("imgVersaoAtual");
    obj.imgVersaoAtual:setSRC("/imagens/versaoCopia.png");
    obj.imgVersaoAtual:setLeft(0);
    obj.imgVersaoAtual:setTop(64);
    obj.imgVersaoAtual:setWidth(100);
    obj.imgVersaoAtual:setHeight(20);
    obj.imgVersaoAtual:setStyle("autoFit");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.versoes);
    obj.image3:setSRC("/imagens/FontSuaVersao.png");
    obj.image3:setLeft(-48);
    obj.image3:setTop(2);
    obj.image3:setWidth(200);
    obj.image3:setHeight(50);
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.versoes);
    obj.image4:setSRC("/imagens/FontVersaoAtual.png");
    obj.image4:setLeft(-33);
    obj.image4:setTop(46);
    obj.image4:setWidth(181.50);
    obj.image4:setHeight(50);
    obj.image4:setName("image4");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.scrollBox1);
    obj.image5:setField("imagemDoPersonagem2");
    obj.image5:setEditable(true);
    obj.image5:setStyle("autoFit");
    obj.image5:setTop(239);
    obj.image5:setLeft(430);
    obj.image5:setWidth(145);
    obj.image5:setHeight(144);
    obj.image5:setName("image5");

    obj.sobrePersonagem = GUI.fromHandle(_obj_newObject("layout"));
    obj.sobrePersonagem:setParent(obj.scrollBox1);
    obj.sobrePersonagem:setName("sobrePersonagem");
    obj.sobrePersonagem:setWidth(286);
    obj.sobrePersonagem:setHeight(471);
    obj.sobrePersonagem:setTop(100);
    obj.sobrePersonagem:setLeft(50);
    obj.sobrePersonagem:setVisible(false);

    obj.image6 = GUI.fromHandle(_obj_newObject("image"));
    obj.image6:setParent(obj.sobrePersonagem);
    obj.image6:setSRC("/imagens/perfil.png");
    obj.image6:setWidth(286);
    obj.image6:setHeight(471);
    obj.image6:setName("image6");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.image6);
    obj.button3:setText("c");
    obj.button3:setLeft(31);
    obj.button3:setTop(29);
    obj.button3:setFontColor("black");
    lfm_setPropAsString(obj.button3, "fontStyle",  "bold");
    obj.button3:setWidth(17);
    obj.button3:setHeight(15);
    obj.button3:setFontSize(12);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.image6);
    obj.button4:setText("c");
    obj.button4:setLeft(48);
    obj.button4:setTop(29);
    obj.button4:setFontColor("Blue");
    lfm_setPropAsString(obj.button4, "fontStyle",  "bold");
    obj.button4:setWidth(17);
    obj.button4:setHeight(15);
    obj.button4:setFontSize(12);
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.image6);
    obj.button5:setText("c");
    obj.button5:setLeft(65);
    obj.button5:setTop(29);
    obj.button5:setFontColor("AliceBlue");
    lfm_setPropAsString(obj.button5, "fontStyle",  "bold");
    obj.button5:setWidth(17);
    obj.button5:setHeight(15);
    obj.button5:setFontSize(12);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.image6);
    obj.button6:setText("c");
    obj.button6:setLeft(83);
    obj.button6:setTop(29);
    obj.button6:setFontColor("Brown");
    lfm_setPropAsString(obj.button6, "fontStyle",  "bold");
    obj.button6:setWidth(17);
    obj.button6:setHeight(15);
    obj.button6:setFontSize(12);
    obj.button6:setName("button6");

    obj.nomePersonagem = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomePersonagem:setParent(obj.image6);
    obj.nomePersonagem:setField("nomePersonagem");
    obj.nomePersonagem:setName("nomePersonagem");
    obj.nomePersonagem:setTop(103);
    obj.nomePersonagem:setLeft(26);
    obj.nomePersonagem:setWidth(237);
    obj.nomePersonagem:setHeight(33);
    obj.nomePersonagem:setTransparent(true);
    obj.nomePersonagem:setFontFamily("times New Roman");
    obj.nomePersonagem:setFontColor("Black");
    obj.nomePersonagem:setHorzTextAlign("center");

    obj.idade = GUI.fromHandle(_obj_newObject("edit"));
    obj.idade:setParent(obj.image6);
    obj.idade:setField("idade");
    obj.idade:setName("idade");
    obj.idade:setTop(165);
    obj.idade:setLeft(28);
    obj.idade:setWidth(63);
    obj.idade:setHeight(30);
    obj.idade:setTransparent(true);
    obj.idade:setFontFamily("times New Roman");
    obj.idade:setFontColor("Black");
    obj.idade:setHorzTextAlign("center");

    obj.raca = GUI.fromHandle(_obj_newObject("edit"));
    obj.raca:setParent(obj.image6);
    obj.raca:setField("raca");
    obj.raca:setName("raca");
    obj.raca:setTop(166);
    obj.raca:setLeft(126);
    obj.raca:setWidth(139);
    obj.raca:setHeight(34);
    obj.raca:setTransparent(true);
    obj.raca:setFontFamily("times New Roman");
    obj.raca:setFontColor("Black");
    obj.raca:setHorzTextAlign("center");

    obj.profissao = GUI.fromHandle(_obj_newObject("edit"));
    obj.profissao:setParent(obj.image6);
    obj.profissao:setField("profissao");
    obj.profissao:setName("profissao");
    obj.profissao:setTop(225);
    obj.profissao:setLeft(27);
    obj.profissao:setWidth(236);
    obj.profissao:setHeight(34);
    obj.profissao:setTransparent(true);
    obj.profissao:setFontFamily("times New Roman");
    obj.profissao:setFontColor("Black");
    obj.profissao:setHorzTextAlign("center");

    obj.peso = GUI.fromHandle(_obj_newObject("edit"));
    obj.peso:setParent(obj.image6);
    obj.peso:setField("peso");
    obj.peso:setName("peso");
    obj.peso:setTop(289);
    obj.peso:setLeft(27);
    obj.peso:setWidth(82);
    obj.peso:setHeight(29);
    obj.peso:setTransparent(true);
    obj.peso:setFontFamily("times New Roman");
    obj.peso:setFontColor("Black");
    obj.peso:setHorzTextAlign("center");

    obj.altura = GUI.fromHandle(_obj_newObject("edit"));
    obj.altura:setParent(obj.image6);
    obj.altura:setField("altura");
    obj.altura:setName("altura");
    obj.altura:setTop(289);
    obj.altura:setLeft(128);
    obj.altura:setWidth(135);
    obj.altura:setHeight(30);
    obj.altura:setTransparent(true);
    obj.altura:setFontFamily("times New Roman");
    obj.altura:setFontColor("Black");
    obj.altura:setHorzTextAlign("center");

    obj.corolhos = GUI.fromHandle(_obj_newObject("edit"));
    obj.corolhos:setParent(obj.image6);
    obj.corolhos:setField("corolhos");
    obj.corolhos:setName("corolhos");
    obj.corolhos:setTop(350);
    obj.corolhos:setLeft(25);
    obj.corolhos:setWidth(107);
    obj.corolhos:setHeight(30);
    obj.corolhos:setTransparent(true);
    obj.corolhos:setFontFamily("times New Roman");
    obj.corolhos:setFontColor("Black");
    obj.corolhos:setHorzTextAlign("center");

    obj.aparencia = GUI.fromHandle(_obj_newObject("edit"));
    obj.aparencia:setParent(obj.image6);
    obj.aparencia:setField("aparencia");
    obj.aparencia:setName("aparencia");
    obj.aparencia:setTop(351);
    obj.aparencia:setLeft(138);
    obj.aparencia:setWidth(126);
    obj.aparencia:setHeight(30);
    obj.aparencia:setTransparent(true);
    obj.aparencia:setFontFamily("times New Roman");
    obj.aparencia:setFontColor("Black");
    obj.aparencia:setHorzTextAlign("center");

    obj.nivelatributo = GUI.fromHandle(_obj_newObject("label"));
    obj.nivelatributo:setParent(obj.image6);
    obj.nivelatributo:setField("nivelatributo");
    obj.nivelatributo:setName("nivelatributo");
    obj.nivelatributo:setTop(411);
    obj.nivelatributo:setLeft(116);
    obj.nivelatributo:setWidth(61);
    obj.nivelatributo:setHeight(29);
    obj.nivelatributo:setFontFamily("Dotum");
    obj.nivelatributo:setFontColor("Black");
    obj.nivelatributo:setHorzTextAlign("center");
    obj.nivelatributo:setFontSize(18);

    obj.atributo = GUI.fromHandle(_obj_newObject("layout"));
    obj.atributo:setParent(obj.scrollBox1);
    obj.atributo:setName("atributo");
    obj.atributo:setTop(0);
    obj.atributo:setLeft(0);
    obj.atributo:setWidth(316);
    obj.atributo:setHeight(716);
    obj.atributo:setVisible(false);

    obj.image7 = GUI.fromHandle(_obj_newObject("image"));
    obj.image7:setParent(obj.atributo);
    obj.image7:setSRC("/imagens/atributo.png");
    obj.image7:setWidth(316);
    obj.image7:setHeight(716);
    obj.image7:setName("image7");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.image7);
    obj.label1:setField("pontosatributo");
    obj.label1:setFontSize(20);
    obj.label1:setTop(139);
    obj.label1:setLeft(125);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setHitTest(true);
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.image7);
    obj.label2:setField("nivelatributo");
    obj.label2:setFontSize(20);
    obj.label2:setTop(217);
    obj.label2:setLeft(135);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setHitTest(true);
    obj.label2:setName("label2");

    obj.up = GUI.fromHandle(_obj_newObject("button"));
    obj.up:setParent(obj.image7);
    obj.up:setName("up");
    obj.up:setText("UP");
    obj.up:setFontColor("yellow");
    obj.up:setWidth(29);
    obj.up:setHeight(20);
    obj.up:setVisible(true);
    obj.up:setTop(217);
    obj.up:setLeft(185);
    obj.up:setFontSize(10.5);
    lfm_setPropAsString(obj.up, "fontStyle",  "bold");

    obj.image8 = GUI.fromHandle(_obj_newObject("image"));
    obj.image8:setParent(obj.image7);
    obj.image8:setSRC("/imagens/Reseta.png");
    obj.image8:setWidth(61);
    obj.image8:setHeight(41);
    obj.image8:setTop(87);
    obj.image8:setLeft(125);
    obj.image8:setHitTest(true);
    obj.image8:setCursor("handPoint");
    obj.image8:setName("image8");



	local function mochila2func();
		if sheet.nivelatributo == 10 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>>" .."[§K12]" .. sheet.nomePersonagem  .. 
			":" .." [§K7]Você acabou de destravar a mochila 2, pode usa avontade:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K7]" .. " Vá para seu inventario. :)"); 
	end; 
	 end;

	local function mochila3func();
		if sheet.nivelatributo == 25 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>>" .."[§K12]" .. sheet.nomePersonagem  .. 
			":" .." [§K7]Você acabou de destravar a mochila 3, pode usa avontade:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K7]" .. " Vá para seu inventario. :)"); 
	end; 
	 end;

	local function mochila4func();
		if sheet.nivelatributo == 100 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>>" .."[§K12]" .. sheet.nomePersonagem  .. 
			":" .." [§K7]Você acabou de destravar a mochila 4, pode usa avontade:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K7]" .. " Vá para seu inventario. :)"); 
	end; 
	 end;
	
		

 	local function nivelvoltarfunc()
	
		if sheet.nivelatributo > 0 then
			sheet.nivelatributo = sheet.nivelatributo - 1;
		
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>" .. "[§K9]" .. sheet.nomePersonagem .. ":" .. "[§K10]" .. " Voltou para o:" .. 
			"[§K8]" .. " Nível: "  ..  sheet.nivelatributo .. "!");
			if sheet.nivelatributo == 2 then
	end; 
        end;	
		    end;
	local function nivelfunc()
	if rrpg.getMesaDe(sheet).meuJogador.isMestre then
		if sheet.nivelatributo >= 0 then
			sheet.nivelatributo = sheet.nivelatributo + 1;
			
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>" .. "[§K9]" .. sheet.nomePersonagem .. ":" .. "[§K10]" .. 
			" Subiu de nível! Foi para o:" .. "[§K8]" .. " Nível: "  .. sheet.nivelatributo .. "!");
        			if sheet.nivelatributo == 2 then
 end;
   end;
    end;
	 end;
	
	local function poderEHabilidadefunc()
	
		if sheet.nivelatributo == 20 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>" .."[§K9]" .. sheet.nomePersonagem  .. 
			":" .." [§K10]Finalmente pode descobrir uma habilidade nova, quando chegou no:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K10]" .. " ~Vá em Poderes/Habilidades e role sua nova habilidade que agora está habilitada. :)");
	end; 
	
		if sheet.nivelatributo == 25 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>>" .."[§K9]" .. sheet.nomePersonagem  .. 
			":" .." [§K10]Finalmente você pode descobrir um poder novo, quando chegou no:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K10]" .. " ~Vá em Poderes/Habilidades e role seu poder que agora está habilitado. :)");
	end;
	
		if sheet.nivelatributo == 50 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>>>" .."[§K9]" .. sheet.nomePersonagem  .. 
			":" .." [§K10]Finalmente pode descobrir uma habilidade nova, quando chegou no:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K10]" .. " ~Vá em Poderes/Habilidades e role sua nova habilidade que agora está habilitada. :)");
	end; 
	
		if sheet.nivelatributo == 80 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>>>>>" .."[§K9]" .. sheet.nomePersonagem  .. 
			":" .." [§K10]Finalmente pode descobrir uma habilidade nova, quando chegou no:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K10]" .. " ~Vá em Poderes/Habilidades e role sua nova habilidade que agora está habilitada. :)");
	end; 
	
		if sheet.nivelatributo == 85 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>>>>>" .."[§K9]" .. sheet.nomePersonagem  .. 
			":" .." [§K10]Finalmente você pode descobrir um poder novo, quando chegou no:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K10]" .. " ~Vá em Poderes/Habilidades e role seu poder que agora está habilitado. :)");
	end;
	
		if sheet.nivelatributo == 100 then
			local chat = rrpg.getMesaDe(sheet).chat;
			chat:enviarMensagem("[§K4]>>>>>>" .."[§K9]" .. sheet.nomePersonagem  .. 
			":" .." [§K10]Finalmente você pode descobrir um poder novo, quando chegou no:" .. "[§K8]" .. " Nível: " 
			 .. sheet.nivelatributo .. "!" .. 
			"[§K10]" .. " ~Vá em Poderes/Habilidades e role seu poder que agora está habilitado. :)");
	end;
	 end;
	
		
	


    obj.Parcela = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela:setParent(obj.image7);
    obj.Parcela:setField("Parcela");
    obj.Parcela:setName("Parcela");
    obj.Parcela:setTop(276);
    obj.Parcela:setLeft(134);
    obj.Parcela:setWidth(49);
    obj.Parcela:setHeight(35);
    obj.Parcela:setHorzTextAlign("center");
    obj.Parcela:setFontSize(22);
    obj.Parcela:setFontFamily("Andalus");
    obj.Parcela:setFontColor("black");

    obj.image9 = GUI.fromHandle(_obj_newObject("image"));
    obj.image9:setParent(obj.Parcela);
    obj.image9:setSRC("/imagens/+.png");
    obj.image9:setWidth(22);
    obj.image9:setHeight(23);
    obj.image9:setHitTest(true);
    obj.image9:setCursor("handPoint");
    obj.image9:setAlign("left");
    obj.image9:setMargins({left=-22});
    obj.image9:setName("image9");

    obj.image10 = GUI.fromHandle(_obj_newObject("image"));
    obj.image10:setParent(obj.image7);
    obj.image10:setSRC("/imagens/-.png");
    obj.image10:setWidth(22);
    obj.image10:setHeight(23);
    obj.image10:setHitTest(true);
    obj.image10:setCursor("handPoint");
    obj.image10:setTop(282);
    obj.image10:setLeft(8);
    obj.image10:setName("image10");

    obj.Parcela1 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela1:setParent(obj.image7);
    obj.Parcela1:setField("Parcela1");
    obj.Parcela1:setName("Parcela1");
    obj.Parcela1:setTop(322);
    obj.Parcela1:setLeft(134);
    obj.Parcela1:setWidth(49);
    obj.Parcela1:setHeight(35);
    obj.Parcela1:setHorzTextAlign("center");
    obj.Parcela1:setFontSize(22);
    obj.Parcela1:setFontFamily("Andalus");
    obj.Parcela1:setFontColor("black");

    obj.image11 = GUI.fromHandle(_obj_newObject("image"));
    obj.image11:setParent(obj.Parcela1);
    obj.image11:setSRC("/imagens/+.png");
    obj.image11:setWidth(22);
    obj.image11:setHeight(23);
    obj.image11:setHitTest(true);
    obj.image11:setCursor("handPoint");
    obj.image11:setAlign("left");
    obj.image11:setMargins({left=-22});
    obj.image11:setName("image11");

    obj.image12 = GUI.fromHandle(_obj_newObject("image"));
    obj.image12:setParent(obj.image7);
    obj.image12:setSRC("/imagens/-.png");
    obj.image12:setWidth(22);
    obj.image12:setHeight(23);
    obj.image12:setHitTest(true);
    obj.image12:setCursor("handPoint");
    obj.image12:setTop(328);
    obj.image12:setLeft(8);
    obj.image12:setName("image12");

    obj.Parcela2 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela2:setParent(obj.image7);
    obj.Parcela2:setField("Parcela2");
    obj.Parcela2:setName("Parcela2");
    obj.Parcela2:setTop(368);
    obj.Parcela2:setLeft(134);
    obj.Parcela2:setWidth(49);
    obj.Parcela2:setHeight(35);
    obj.Parcela2:setHorzTextAlign("center");
    obj.Parcela2:setFontSize(22);
    obj.Parcela2:setFontFamily("Andalus");
    obj.Parcela2:setFontColor("black");

    obj.image13 = GUI.fromHandle(_obj_newObject("image"));
    obj.image13:setParent(obj.Parcela2);
    obj.image13:setSRC("/imagens/+.png");
    obj.image13:setWidth(22);
    obj.image13:setHeight(23);
    obj.image13:setHitTest(true);
    obj.image13:setCursor("handPoint");
    obj.image13:setAlign("left");
    obj.image13:setMargins({left=-22});
    obj.image13:setName("image13");

    obj.image14 = GUI.fromHandle(_obj_newObject("image"));
    obj.image14:setParent(obj.image7);
    obj.image14:setSRC("/imagens/-.png");
    obj.image14:setWidth(22);
    obj.image14:setHeight(23);
    obj.image14:setHitTest(true);
    obj.image14:setCursor("handPoint");
    obj.image14:setTop(374);
    obj.image14:setLeft(8);
    obj.image14:setName("image14");

    obj.Parcela3 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela3:setParent(obj.image7);
    obj.Parcela3:setField("Parcela3");
    obj.Parcela3:setName("Parcela3");
    obj.Parcela3:setTop(414);
    obj.Parcela3:setLeft(134);
    obj.Parcela3:setWidth(49);
    obj.Parcela3:setHeight(35);
    obj.Parcela3:setHorzTextAlign("center");
    obj.Parcela3:setFontSize(22);
    obj.Parcela3:setFontFamily("Andalus");
    obj.Parcela3:setFontColor("black");

    obj.image15 = GUI.fromHandle(_obj_newObject("image"));
    obj.image15:setParent(obj.Parcela3);
    obj.image15:setSRC("/imagens/+.png");
    obj.image15:setWidth(22);
    obj.image15:setHeight(23);
    obj.image15:setHitTest(true);
    obj.image15:setCursor("handPoint");
    obj.image15:setAlign("left");
    obj.image15:setMargins({left=-22});
    obj.image15:setName("image15");

    obj.image16 = GUI.fromHandle(_obj_newObject("image"));
    obj.image16:setParent(obj.image7);
    obj.image16:setSRC("/imagens/-.png");
    obj.image16:setWidth(22);
    obj.image16:setHeight(23);
    obj.image16:setHitTest(true);
    obj.image16:setCursor("handPoint");
    obj.image16:setTop(420);
    obj.image16:setLeft(8);
    obj.image16:setName("image16");

    obj.Parcela4 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela4:setParent(obj.image7);
    obj.Parcela4:setField("Parcela4");
    obj.Parcela4:setName("Parcela4");
    obj.Parcela4:setTop(460);
    obj.Parcela4:setLeft(134);
    obj.Parcela4:setWidth(49);
    obj.Parcela4:setHeight(35);
    obj.Parcela4:setHorzTextAlign("center");
    obj.Parcela4:setFontSize(22);
    obj.Parcela4:setFontFamily("Andalus");
    obj.Parcela4:setFontColor("black");

    obj.image17 = GUI.fromHandle(_obj_newObject("image"));
    obj.image17:setParent(obj.Parcela4);
    obj.image17:setSRC("/imagens/+.png");
    obj.image17:setWidth(22);
    obj.image17:setHeight(23);
    obj.image17:setHitTest(true);
    obj.image17:setCursor("handPoint");
    obj.image17:setAlign("left");
    obj.image17:setMargins({left=-22});
    obj.image17:setName("image17");

    obj.image18 = GUI.fromHandle(_obj_newObject("image"));
    obj.image18:setParent(obj.image7);
    obj.image18:setSRC("/imagens/-.png");
    obj.image18:setWidth(22);
    obj.image18:setHeight(23);
    obj.image18:setHitTest(true);
    obj.image18:setCursor("handPoint");
    obj.image18:setTop(466);
    obj.image18:setLeft(8);
    obj.image18:setName("image18");

    obj.Parcela5 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela5:setParent(obj.image7);
    obj.Parcela5:setField("Parcela5");
    obj.Parcela5:setName("Parcela5");
    obj.Parcela5:setTop(506);
    obj.Parcela5:setLeft(134);
    obj.Parcela5:setWidth(49);
    obj.Parcela5:setHeight(35);
    obj.Parcela5:setHorzTextAlign("center");
    obj.Parcela5:setFontSize(22);
    obj.Parcela5:setFontFamily("Andalus");
    obj.Parcela5:setFontColor("black");

    obj.image19 = GUI.fromHandle(_obj_newObject("image"));
    obj.image19:setParent(obj.Parcela5);
    obj.image19:setSRC("/imagens/+.png");
    obj.image19:setWidth(22);
    obj.image19:setHeight(23);
    obj.image19:setHitTest(true);
    obj.image19:setCursor("handPoint");
    obj.image19:setAlign("left");
    obj.image19:setMargins({left=-22});
    obj.image19:setName("image19");

    obj.image20 = GUI.fromHandle(_obj_newObject("image"));
    obj.image20:setParent(obj.image7);
    obj.image20:setSRC("/imagens/-.png");
    obj.image20:setWidth(22);
    obj.image20:setHeight(23);
    obj.image20:setHitTest(true);
    obj.image20:setCursor("handPoint");
    obj.image20:setTop(512);
    obj.image20:setLeft(8);
    obj.image20:setName("image20");

    obj.Parcela6 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela6:setParent(obj.image7);
    obj.Parcela6:setField("Parcela6");
    obj.Parcela6:setName("Parcela6");
    obj.Parcela6:setTop(552);
    obj.Parcela6:setLeft(134);
    obj.Parcela6:setWidth(49);
    obj.Parcela6:setHeight(35);
    obj.Parcela6:setHorzTextAlign("center");
    obj.Parcela6:setFontSize(22);
    obj.Parcela6:setFontFamily("Andalus");
    obj.Parcela6:setFontColor("black");

    obj.image21 = GUI.fromHandle(_obj_newObject("image"));
    obj.image21:setParent(obj.Parcela6);
    obj.image21:setSRC("/imagens/+.png");
    obj.image21:setWidth(22);
    obj.image21:setHeight(23);
    obj.image21:setHitTest(true);
    obj.image21:setCursor("handPoint");
    obj.image21:setAlign("left");
    obj.image21:setMargins({left=-22});
    obj.image21:setName("image21");

    obj.image22 = GUI.fromHandle(_obj_newObject("image"));
    obj.image22:setParent(obj.image7);
    obj.image22:setSRC("/imagens/-.png");
    obj.image22:setWidth(22);
    obj.image22:setHeight(23);
    obj.image22:setHitTest(true);
    obj.image22:setCursor("handPoint");
    obj.image22:setTop(558);
    obj.image22:setLeft(8);
    obj.image22:setName("image22");

    obj.Parcela7 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela7:setParent(obj.image7);
    obj.Parcela7:setField("Parcela7");
    obj.Parcela7:setName("Parcela7");
    obj.Parcela7:setTop(598);
    obj.Parcela7:setLeft(134);
    obj.Parcela7:setWidth(49);
    obj.Parcela7:setHeight(35);
    obj.Parcela7:setHorzTextAlign("center");
    obj.Parcela7:setFontSize(22);
    obj.Parcela7:setFontFamily("Andalus");
    obj.Parcela7:setFontColor("black");

    obj.image23 = GUI.fromHandle(_obj_newObject("image"));
    obj.image23:setParent(obj.Parcela7);
    obj.image23:setSRC("/imagens/+.png");
    obj.image23:setWidth(22);
    obj.image23:setHeight(23);
    obj.image23:setHitTest(true);
    obj.image23:setCursor("handPoint");
    obj.image23:setAlign("left");
    obj.image23:setMargins({left=-22});
    obj.image23:setName("image23");

    obj.image24 = GUI.fromHandle(_obj_newObject("image"));
    obj.image24:setParent(obj.image7);
    obj.image24:setSRC("/imagens/-.png");
    obj.image24:setWidth(22);
    obj.image24:setHeight(23);
    obj.image24:setHitTest(true);
    obj.image24:setCursor("handPoint");
    obj.image24:setTop(604);
    obj.image24:setLeft(8);
    obj.image24:setName("image24");

    obj.Parcela8 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela8:setParent(obj.image7);
    obj.Parcela8:setField("Parcela8");
    obj.Parcela8:setName("Parcela8");
    obj.Parcela8:setTop(644);
    obj.Parcela8:setLeft(134);
    obj.Parcela8:setWidth(49);
    obj.Parcela8:setHeight(35);
    obj.Parcela8:setHorzTextAlign("center");
    obj.Parcela8:setFontSize(22);
    obj.Parcela8:setFontFamily("Andalus");
    obj.Parcela8:setFontColor("black");

    obj.image25 = GUI.fromHandle(_obj_newObject("image"));
    obj.image25:setParent(obj.Parcela8);
    obj.image25:setSRC("/imagens/+.png");
    obj.image25:setWidth(22);
    obj.image25:setHeight(23);
    obj.image25:setHitTest(true);
    obj.image25:setCursor("handPoint");
    obj.image25:setAlign("left");
    obj.image25:setMargins({left=-22});
    obj.image25:setName("image25");

    obj.image26 = GUI.fromHandle(_obj_newObject("image"));
    obj.image26:setParent(obj.image7);
    obj.image26:setSRC("/imagens/-.png");
    obj.image26:setWidth(22);
    obj.image26:setHeight(23);
    obj.image26:setHitTest(true);
    obj.image26:setCursor("handPoint");
    obj.image26:setTop(650);
    obj.image26:setLeft(8);
    obj.image26:setName("image26");

    obj.Parcela8s = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela8s:setParent(obj.image7);
    obj.Parcela8s:setField("Parcela8s");
    obj.Parcela8s:setName("Parcela8s");
    obj.Parcela8s:setTop(684);
    obj.Parcela8s:setLeft(198);
    obj.Parcela8s:setWidth(48);
    obj.Parcela8s:setHeight(27);
    obj.Parcela8s:setHorzTextAlign("center");
    obj.Parcela8s:setFontSize(22);
    obj.Parcela8s:setFontFamily("Andalus");
    obj.Parcela8s:setFontColor("black");

    obj.image27 = GUI.fromHandle(_obj_newObject("image"));
    obj.image27:setParent(obj.Parcela8s);
    obj.image27:setSRC("/imagens/+.png");
    obj.image27:setWidth(22);
    obj.image27:setHeight(23);
    obj.image27:setHitTest(true);
    obj.image27:setCursor("handPoint");
    obj.image27:setAlign("left");
    obj.image27:setMargins({left=-22});
    obj.image27:setName("image27");

    obj.image28 = GUI.fromHandle(_obj_newObject("image"));
    obj.image28:setParent(obj.image7);
    obj.image28:setSRC("/imagens/-.png");
    obj.image28:setWidth(22);
    obj.image28:setHeight(23);
    obj.image28:setHitTest(true);
    obj.image28:setCursor("handPoint");
    obj.image28:setTop(686);
    obj.image28:setLeft(8);
    obj.image28:setName("image28");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.image7);
    obj.button7:setTop(689);
    obj.button7:setLeft(260);
    obj.button7:setText("Invisivel");
    obj.button7:setOpacity(0);
    obj.button7:setName("button7");

    obj.Parcela9 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela9:setParent(obj.image7);
    obj.Parcela9:setField("Parcela9");
    obj.Parcela9:setName("Parcela9");
    obj.Parcela9:setHitTest(true);
    obj.Parcela9:setTop(276);
    obj.Parcela9:setLeft(198);
    obj.Parcela9:setWidth(49);
    obj.Parcela9:setHeight(35);
    obj.Parcela9:setHorzTextAlign("center");
    obj.Parcela9:setFontSize(22);
    obj.Parcela9:setFontFamily("Andalus");
    obj.Parcela9:setFontColor("black");

    obj.Parcela10 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela10:setParent(obj.image7);
    obj.Parcela10:setField("Parcela10");
    obj.Parcela10:setName("Parcela10");
    obj.Parcela10:setHitTest(true);
    obj.Parcela10:setTop(322);
    obj.Parcela10:setLeft(198);
    obj.Parcela10:setWidth(49);
    obj.Parcela10:setHeight(35);
    obj.Parcela10:setHorzTextAlign("center");
    obj.Parcela10:setFontSize(22);
    obj.Parcela10:setFontFamily("Andalus");
    obj.Parcela10:setFontColor("black");

    obj.Parcela11 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela11:setParent(obj.image7);
    obj.Parcela11:setField("Parcela11");
    obj.Parcela11:setName("Parcela11");
    obj.Parcela11:setHitTest(true);
    obj.Parcela11:setTop(368);
    obj.Parcela11:setLeft(198);
    obj.Parcela11:setWidth(49);
    obj.Parcela11:setHeight(35);
    obj.Parcela11:setHorzTextAlign("center");
    obj.Parcela11:setFontSize(22);
    obj.Parcela11:setFontFamily("Andalus");
    obj.Parcela11:setFontColor("black");

    obj.Parcela12 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela12:setParent(obj.image7);
    obj.Parcela12:setField("Parcela12");
    obj.Parcela12:setName("Parcela12");
    obj.Parcela12:setHitTest(true);
    obj.Parcela12:setTop(414);
    obj.Parcela12:setLeft(198);
    obj.Parcela12:setWidth(49);
    obj.Parcela12:setHeight(35);
    obj.Parcela12:setHorzTextAlign("center");
    obj.Parcela12:setFontSize(22);
    obj.Parcela12:setFontFamily("Andalus");
    obj.Parcela12:setFontColor("black");

    obj.Parcela13 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela13:setParent(obj.image7);
    obj.Parcela13:setField("Parcela13");
    obj.Parcela13:setName("Parcela13");
    obj.Parcela13:setHitTest(true);
    obj.Parcela13:setTop(460);
    obj.Parcela13:setLeft(198);
    obj.Parcela13:setWidth(49);
    obj.Parcela13:setHeight(35);
    obj.Parcela13:setHorzTextAlign("center");
    obj.Parcela13:setFontSize(22);
    obj.Parcela13:setFontFamily("Andalus");
    obj.Parcela13:setFontColor("black");

    obj.Parcela14 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela14:setParent(obj.image7);
    obj.Parcela14:setField("Parcela14");
    obj.Parcela14:setName("Parcela14");
    obj.Parcela14:setHitTest(true);
    obj.Parcela14:setTop(506);
    obj.Parcela14:setLeft(198);
    obj.Parcela14:setWidth(49);
    obj.Parcela14:setHeight(35);
    obj.Parcela14:setHorzTextAlign("center");
    obj.Parcela14:setFontSize(22);
    obj.Parcela14:setFontFamily("Andalus");
    obj.Parcela14:setFontColor("black");

    obj.Parcela15 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela15:setParent(obj.image7);
    obj.Parcela15:setField("Parcela15");
    obj.Parcela15:setName("Parcela15");
    obj.Parcela15:setHitTest(true);
    obj.Parcela15:setTop(552);
    obj.Parcela15:setLeft(198);
    obj.Parcela15:setWidth(49);
    obj.Parcela15:setHeight(35);
    obj.Parcela15:setHorzTextAlign("center");
    obj.Parcela15:setFontSize(22);
    obj.Parcela15:setFontFamily("Andalus");
    obj.Parcela15:setFontColor("black");

    obj.Parcela16 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela16:setParent(obj.image7);
    obj.Parcela16:setField("Parcela16");
    obj.Parcela16:setName("Parcela16");
    obj.Parcela16:setHitTest(true);
    obj.Parcela16:setTop(598);
    obj.Parcela16:setLeft(198);
    obj.Parcela16:setWidth(49);
    obj.Parcela16:setHeight(35);
    obj.Parcela16:setHorzTextAlign("center");
    obj.Parcela16:setFontSize(22);
    obj.Parcela16:setFontFamily("Andalus");
    obj.Parcela16:setFontColor("black");

    obj.Parcela17 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela17:setParent(obj.image7);
    obj.Parcela17:setField("Parcela17");
    obj.Parcela17:setName("Parcela17");
    obj.Parcela17:setHitTest(true);
    obj.Parcela17:setTop(644);
    obj.Parcela17:setLeft(198);
    obj.Parcela17:setWidth(49);
    obj.Parcela17:setHeight(35);
    obj.Parcela17:setHorzTextAlign("center");
    obj.Parcela17:setFontSize(22);
    obj.Parcela17:setFontFamily("Andalus");
    obj.Parcela17:setFontColor("black");

    obj.Parcela18 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela18:setParent(obj.image7);
    obj.Parcela18:setField("Parcela18");
    obj.Parcela18:setName("Parcela18");
    obj.Parcela18:setTop(276);
    obj.Parcela18:setLeft(262);
    obj.Parcela18:setWidth(49);
    obj.Parcela18:setHeight(35);
    obj.Parcela18:setHorzTextAlign("center");
    obj.Parcela18:setFontSize(22);
    obj.Parcela18:setFontFamily("Andalus");
    obj.Parcela18:setFontColor("black");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.Parcela18);
    obj.button8:setAlign("top");
    obj.button8:setText("R");
    obj.button8:setMargins({top=34});
    lfm_setPropAsString(obj.button8, "fontStyle",  "bold");
    obj.button8:setWidth(10);
    obj.button8:setHeight(15);
    obj.button8:setName("button8");

    obj.Parcela19 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela19:setParent(obj.image7);
    obj.Parcela19:setField("Parcela19");
    obj.Parcela19:setName("Parcela19");
    obj.Parcela19:setTop(322);
    obj.Parcela19:setLeft(262);
    obj.Parcela19:setWidth(49);
    obj.Parcela19:setHeight(35);
    obj.Parcela19:setHorzTextAlign("center");
    obj.Parcela19:setFontSize(22);
    obj.Parcela19:setFontFamily("Andalus");
    obj.Parcela19:setFontColor("black");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.Parcela19);
    obj.button9:setAlign("top");
    obj.button9:setText("R");
    obj.button9:setMargins({top=34});
    lfm_setPropAsString(obj.button9, "fontStyle",  "bold");
    obj.button9:setWidth(10);
    obj.button9:setHeight(15);
    obj.button9:setName("button9");

    obj.Parcela20 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela20:setParent(obj.image7);
    obj.Parcela20:setField("Parcela20");
    obj.Parcela20:setName("Parcela20");
    obj.Parcela20:setTop(368);
    obj.Parcela20:setLeft(262);
    obj.Parcela20:setWidth(49);
    obj.Parcela20:setHeight(35);
    obj.Parcela20:setHorzTextAlign("center");
    obj.Parcela20:setFontSize(22);
    obj.Parcela20:setFontFamily("Andalus");
    obj.Parcela20:setFontColor("black");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.Parcela20);
    obj.button10:setAlign("top");
    obj.button10:setText("R");
    obj.button10:setMargins({top=34});
    lfm_setPropAsString(obj.button10, "fontStyle",  "bold");
    obj.button10:setWidth(10);
    obj.button10:setHeight(15);
    obj.button10:setName("button10");

    obj.Parcela21 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela21:setParent(obj.image7);
    obj.Parcela21:setField("Parcela21");
    obj.Parcela21:setName("Parcela21");
    obj.Parcela21:setTop(414);
    obj.Parcela21:setLeft(262);
    obj.Parcela21:setWidth(49);
    obj.Parcela21:setHeight(35);
    obj.Parcela21:setHorzTextAlign("center");
    obj.Parcela21:setFontSize(22);
    obj.Parcela21:setFontFamily("Andalus");
    obj.Parcela21:setFontColor("black");

    obj.button11 = GUI.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.Parcela21);
    obj.button11:setAlign("top");
    obj.button11:setText("R");
    obj.button11:setMargins({top=34});
    lfm_setPropAsString(obj.button11, "fontStyle",  "bold");
    obj.button11:setWidth(10);
    obj.button11:setHeight(15);
    obj.button11:setName("button11");

    obj.Parcela22 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela22:setParent(obj.image7);
    obj.Parcela22:setField("Parcela22");
    obj.Parcela22:setName("Parcela22");
    obj.Parcela22:setTop(460);
    obj.Parcela22:setLeft(262);
    obj.Parcela22:setWidth(49);
    obj.Parcela22:setHeight(35);
    obj.Parcela22:setHorzTextAlign("center");
    obj.Parcela22:setFontSize(22);
    obj.Parcela22:setFontFamily("Andalus");
    obj.Parcela22:setFontColor("black");

    obj.button12 = GUI.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.Parcela22);
    obj.button12:setAlign("top");
    obj.button12:setText("R");
    obj.button12:setMargins({top=34});
    lfm_setPropAsString(obj.button12, "fontStyle",  "bold");
    obj.button12:setWidth(10);
    obj.button12:setHeight(15);
    obj.button12:setName("button12");

    obj.Parcela23 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela23:setParent(obj.image7);
    obj.Parcela23:setField("Parcela23");
    obj.Parcela23:setName("Parcela23");
    obj.Parcela23:setTop(506);
    obj.Parcela23:setLeft(262);
    obj.Parcela23:setWidth(49);
    obj.Parcela23:setHeight(35);
    obj.Parcela23:setHorzTextAlign("center");
    obj.Parcela23:setFontSize(22);
    obj.Parcela23:setFontFamily("Andalus");
    obj.Parcela23:setFontColor("black");

    obj.button13 = GUI.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.Parcela23);
    obj.button13:setAlign("top");
    obj.button13:setText("R");
    obj.button13:setMargins({top=34});
    lfm_setPropAsString(obj.button13, "fontStyle",  "bold");
    obj.button13:setWidth(10);
    obj.button13:setHeight(15);
    obj.button13:setName("button13");

    obj.Parcela24 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela24:setParent(obj.image7);
    obj.Parcela24:setField("Parcela24");
    obj.Parcela24:setName("Parcela24");
    obj.Parcela24:setTop(552);
    obj.Parcela24:setLeft(262);
    obj.Parcela24:setWidth(49);
    obj.Parcela24:setHeight(35);
    obj.Parcela24:setHorzTextAlign("center");
    obj.Parcela24:setFontSize(22);
    obj.Parcela24:setFontFamily("Andalus");
    obj.Parcela24:setFontColor("black");

    obj.button14 = GUI.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.Parcela24);
    obj.button14:setAlign("top");
    obj.button14:setText("R");
    obj.button14:setMargins({top=34});
    lfm_setPropAsString(obj.button14, "fontStyle",  "bold");
    obj.button14:setWidth(10);
    obj.button14:setHeight(15);
    obj.button14:setName("button14");

    obj.Parcela25 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela25:setParent(obj.image7);
    obj.Parcela25:setField("Parcela25");
    obj.Parcela25:setName("Parcela25");
    obj.Parcela25:setTop(598);
    obj.Parcela25:setLeft(262);
    obj.Parcela25:setWidth(49);
    obj.Parcela25:setHeight(35);
    obj.Parcela25:setHorzTextAlign("center");
    obj.Parcela25:setFontSize(22);
    obj.Parcela25:setFontFamily("Andalus");
    obj.Parcela25:setFontColor("black");

    obj.button15 = GUI.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.Parcela25);
    obj.button15:setAlign("top");
    obj.button15:setText("R");
    obj.button15:setMargins({top=34});
    lfm_setPropAsString(obj.button15, "fontStyle",  "bold");
    obj.button15:setWidth(10);
    obj.button15:setHeight(15);
    obj.button15:setName("button15");

    obj.Parcela26 = GUI.fromHandle(_obj_newObject("label"));
    obj.Parcela26:setParent(obj.image7);
    obj.Parcela26:setField("Parcela26");
    obj.Parcela26:setName("Parcela26");
    obj.Parcela26:setTop(644);
    obj.Parcela26:setLeft(262);
    obj.Parcela26:setWidth(49);
    obj.Parcela26:setHeight(35);
    obj.Parcela26:setHorzTextAlign("center");
    obj.Parcela26:setFontSize(22);
    obj.Parcela26:setFontFamily("Andalus");
    obj.Parcela26:setFontColor("black");

    obj.button16 = GUI.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.Parcela26);
    obj.button16:setAlign("top");
    obj.button16:setText("R");
    obj.button16:setMargins({top=34});
    lfm_setPropAsString(obj.button16, "fontStyle",  "bold");
    obj.button16:setWidth(10);
    obj.button16:setHeight(15);
    obj.button16:setName("button16");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.image7);
    obj.dataLink2:setFields({'parcela', 'parcela9', 'parcela18'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.image7);
    obj.dataLink3:setFields({'parcela1', 'parcela10', 'parcela19'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.image7);
    obj.dataLink4:setFields({'parcela2', 'parcela11', 'parcela20'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.image7);
    obj.dataLink5:setFields({'parcela3', 'parcela12', 'parcela21'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.image7);
    obj.dataLink6:setFields({'parcela4', 'parcela13', 'parcela22'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.image7);
    obj.dataLink7:setFields({'parcela5', 'parcela14', 'parcela23'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.image7);
    obj.dataLink8:setFields({'parcela6', 'parcela15', 'parcela24'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.image7);
    obj.dataLink9:setFields({'parcela7', 'parcela16', 'parcela25'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.image7);
    obj.dataLink10:setFields({'parcela8', 'parcela17', 'parcela26'});
    obj.dataLink10:setName("dataLink10");

    obj.Pericias = GUI.fromHandle(_obj_newObject("layout"));
    obj.Pericias:setParent(obj.scrollBox1);
    obj.Pericias:setName("Pericias");
    obj.Pericias:setWidth(353);
    obj.Pericias:setHeight(580);
    obj.Pericias:setLeft(635);
    obj.Pericias:setTop(1);
    obj.Pericias:setVisible(false);

    obj.image29 = GUI.fromHandle(_obj_newObject("image"));
    obj.image29:setParent(obj.Pericias);
    obj.image29:setSRC("/imagens/Skill e Pericia.png");
    obj.image29:setWidth(353);
    obj.image29:setHeight(580);
    obj.image29:setName("image29");

    obj.RNP1 = GUI.fromHandle(_obj_newObject("image"));
    obj.RNP1:setParent(obj.Pericias);
    obj.RNP1:setName("RNP1");
    obj.RNP1:setSRC("/imagens/RNP.png");
    obj.RNP1:setLeft(107.75);
    obj.RNP1:setTop(470);
    obj.RNP1:setWidth(38.50);
    obj.RNP1:setHeight(29.25);
    obj.RNP1:setHitTest(true);
    obj.RNP1:setCursor("handPoint");

    obj.RNP2 = GUI.fromHandle(_obj_newObject("image"));
    obj.RNP2:setParent(obj.Pericias);
    obj.RNP2:setName("RNP2");
    obj.RNP2:setSRC("/imagens/RNP.png");
    obj.RNP2:setLeft(158.75);
    obj.RNP2:setTop(470);
    obj.RNP2:setWidth(38.50);
    obj.RNP2:setHeight(29.25);
    obj.RNP2:setHitTest(true);
    obj.RNP2:setCursor("handPoint");

    obj.RNP3 = GUI.fromHandle(_obj_newObject("image"));
    obj.RNP3:setParent(obj.Pericias);
    obj.RNP3:setName("RNP3");
    obj.RNP3:setSRC("/imagens/RNP.png");
    obj.RNP3:setLeft(208.75);
    obj.RNP3:setTop(470);
    obj.RNP3:setWidth(38.50);
    obj.RNP3:setHeight(29.25);
    obj.RNP3:setHitTest(true);
    obj.RNP3:setCursor("handPoint");

    obj.PPR1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.PPR1:setParent(obj.Pericias);
    obj.PPR1:setName("PPR1");
    obj.PPR1:setAlign("client");

    obj.image30 = GUI.fromHandle(_obj_newObject("image"));
    obj.image30:setParent(obj.PPR1);
    obj.image30:setSRC("/imagens/Area para pericias.png");
    obj.image30:setLeft(92);
    obj.image30:setTop(67);
    obj.image30:setWidth(176);
    obj.image30:setHeight(22);
    obj.image30:setName("image30");

    obj.image31 = GUI.fromHandle(_obj_newObject("image"));
    obj.image31:setParent(obj.PPR1);
    obj.image31:setSRC("/imagens/Meu clique.png");
    obj.image31:setLeft(50);
    obj.image31:setTop(116);
    obj.image31:setWidth(86);
    obj.image31:setHeight(36);
    obj.image31:setHitTest(true);
    obj.image31:setCursor("handPoint");
    obj.image31:setName("image31");

    obj.rclListaPericias = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaPericias:setParent(obj.PPR1);
    obj.rclListaPericias:setName("rclListaPericias");
    obj.rclListaPericias:setField("CampoPericias");
    obj.rclListaPericias:setTemplateForm("frmListaPericias");
    obj.rclListaPericias:setLeft(48);
    obj.rclListaPericias:setTop(171);
    obj.rclListaPericias:setWidth(265);
    obj.rclListaPericias:setHeight(290);

    obj.PPR2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.PPR2:setParent(obj.Pericias);
    obj.PPR2:setName("PPR2");
    obj.PPR2:setAlign("client");
    obj.PPR2:setVisible(false);

    obj.AB1usar = GUI.fromHandle(_obj_newObject("image"));
    obj.AB1usar:setParent(obj.PPR2);
    obj.AB1usar:setName("AB1usar");
    obj.AB1usar:setSRC("/imagens/AB1.png");
    obj.AB1usar:setLeft(88.25);
    obj.AB1usar:setTop(191.25);
    obj.AB1usar:setWidth(165.75);
    obj.AB1usar:setHeight(46.50);
    obj.AB1usar:setHitTest(true);
    obj.AB1usar:setCursor("handPoint");

    obj.AB2usar = GUI.fromHandle(_obj_newObject("image"));
    obj.AB2usar:setParent(obj.PPR2);
    obj.AB2usar:setName("AB2usar");
    obj.AB2usar:setSRC("/imagens/AB2.png");
    obj.AB2usar:setLeft(88.25);
    obj.AB2usar:setTop(290.25);
    obj.AB2usar:setWidth(165.75);
    obj.AB2usar:setHeight(46.50);
    obj.AB2usar:setHitTest(true);
    obj.AB2usar:setCursor("handPoint");

    obj.Comprar1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Comprar1:setParent(obj.PPR2);
    obj.Comprar1:setName("Comprar1");
    obj.Comprar1:setSRC("/imagens/Comprar.png");
    obj.Comprar1:setLeft(107.50);
    obj.Comprar1:setTop(239.25);
    obj.Comprar1:setWidth(46.75);
    obj.Comprar1:setHeight(40.25);
    obj.Comprar1:setHitTest(true);
    obj.Comprar1:setCursor("handPoint");

    obj.Vender1 = GUI.fromHandle(_obj_newObject("image"));
    obj.Vender1:setParent(obj.PPR2);
    obj.Vender1:setName("Vender1");
    obj.Vender1:setSRC("/imagens/Vender.png");
    obj.Vender1:setLeft(183.50);
    obj.Vender1:setTop(239.25);
    obj.Vender1:setWidth(46.75);
    obj.Vender1:setHeight(40.25);
    obj.Vender1:setHitTest(true);
    obj.Vender1:setCursor("handPoint");

    obj.Comprar2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Comprar2:setParent(obj.PPR2);
    obj.Comprar2:setName("Comprar2");
    obj.Comprar2:setSRC("/imagens/Comprar.png");
    obj.Comprar2:setLeft(107.50);
    obj.Comprar2:setTop(338.25);
    obj.Comprar2:setWidth(46.75);
    obj.Comprar2:setHeight(40.25);
    obj.Comprar2:setHitTest(true);
    obj.Comprar2:setCursor("handPoint");

    obj.Vender2 = GUI.fromHandle(_obj_newObject("image"));
    obj.Vender2:setParent(obj.PPR2);
    obj.Vender2:setName("Vender2");
    obj.Vender2:setSRC("/imagens/Vender.png");
    obj.Vender2:setLeft(183.50);
    obj.Vender2:setTop(338.25);
    obj.Vender2:setWidth(46.75);
    obj.Vender2:setHeight(40.25);
    obj.Vender2:setHitTest(true);
    obj.Vender2:setCursor("handPoint");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.PPR2);
    obj.label3:setText("Qtd:");
    obj.label3:setLeft(42);
    obj.label3:setTop(206);
    obj.label3:setFontSize(15);
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontFamily("system");
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.PPR2);
    obj.label4:setText("Qtd:");
    obj.label4:setLeft(42);
    obj.label4:setTop(307);
    obj.label4:setFontSize(15);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.PPR2);
    obj.label5:setField("Quantidade1");
    obj.label5:setLeft(72);
    obj.label5:setTop(207);
    obj.label5:setFontSize(14);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontColor("gray");
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.PPR2);
    obj.label6:setField("Quantidade2");
    obj.label6:setLeft(75);
    obj.label6:setTop(307);
    obj.label6:setFontSize(14);
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setFontColor("gray");
    obj.label6:setName("label6");

    obj.image32 = GUI.fromHandle(_obj_newObject("image"));
    obj.image32:setParent(obj.PPR2);
    obj.image32:setSRC("/imagens/Dinheiro.png");
    obj.image32:setLeft(54);
    obj.image32:setTop(71);
    obj.image32:setWidth(253);
    obj.image32:setHeight(95);
    obj.image32:setName("image32");

    obj.button17 = GUI.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.PPR2);
    obj.button17:setLeft(72.50);
    obj.button17:setTop(84.25);
    obj.button17:setWidth(73.50);
    obj.button17:setHeight(72);
    obj.button17:setOpacity(0);
    obj.button17:setText("$");
    obj.button17:setFontColor("lime");
    lfm_setPropAsString(obj.button17, "fontStyle",  "bold");
    obj.button17:setName("button17");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.PPR2);
    obj.layout2:setAlign("client");
    obj.layout2:setName("layout2");

    obj.labSoma = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma:setParent(obj.layout2);
    obj.labSoma:setLeft(160);
    obj.labSoma:setTop(97.75);
    lfm_setPropAsString(obj.labSoma, "fontStyle",  "bold");
    obj.labSoma:setFontSize(30.0);
    obj.labSoma:setAutoSize(true);
    obj.labSoma:setWordWrap(false);
    obj.labSoma:setName("labSoma");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout2);
    obj.dataLink11:setField("Soma");
    obj.dataLink11:setName("dataLink11");

    obj.RP1 = GUI.fromHandle(_obj_newObject("image"));
    obj.RP1:setParent(obj.Pericias);
    obj.RP1:setName("RP1");
    obj.RP1:setSRC("/imagens/RP.png");
    obj.RP1:setLeft(107.75);
    obj.RP1:setTop(470);
    obj.RP1:setWidth(38.50);
    obj.RP1:setHeight(29.25);
    obj.RP1:setHitTest(true);
    obj.RP1:setCursor("handPoint");
    obj.RP1:setVisible(true);

    obj.RP2 = GUI.fromHandle(_obj_newObject("image"));
    obj.RP2:setParent(obj.Pericias);
    obj.RP2:setName("RP2");
    obj.RP2:setSRC("/imagens/RP.png");
    obj.RP2:setLeft(158.75);
    obj.RP2:setTop(470);
    obj.RP2:setWidth(38.50);
    obj.RP2:setHeight(29.25);
    obj.RP2:setHitTest(true);
    obj.RP2:setCursor("handPoint");
    obj.RP2:setVisible(false);

    obj.RP3 = GUI.fromHandle(_obj_newObject("image"));
    obj.RP3:setParent(obj.Pericias);
    obj.RP3:setName("RP3");
    obj.RP3:setSRC("/imagens/RP.png");
    obj.RP3:setLeft(208.75);
    obj.RP3:setTop(470);
    obj.RP3:setWidth(38.50);
    obj.RP3:setHeight(29.25);
    obj.RP3:setHitTest(true);
    obj.RP3:setCursor("handPoint");
    obj.RP3:setVisible(false);

    obj.Contatos = GUI.fromHandle(_obj_newObject("layout"));
    obj.Contatos:setParent(obj.scrollBox1);
    obj.Contatos:setName("Contatos");
    obj.Contatos:setWidth(323);
    obj.Contatos:setHeight(520);
    obj.Contatos:setLeft(650);
    obj.Contatos:setTop(1);
    obj.Contatos:setVisible(false);

    obj.image33 = GUI.fromHandle(_obj_newObject("image"));
    obj.image33:setParent(obj.Contatos);
    obj.image33:setSRC("/imagens/Contatos.png");
    obj.image33:setWidth(323);
    obj.image33:setHeight(520);
    obj.image33:setName("image33");

    obj.ContatosArea = GUI.fromHandle(_obj_newObject("layout"));
    obj.ContatosArea:setParent(obj.Contatos);
    obj.ContatosArea:setName("ContatosArea");
    obj.ContatosArea:setAlign("client");

    obj.image34 = GUI.fromHandle(_obj_newObject("image"));
    obj.image34:setParent(obj.ContatosArea);
    obj.image34:setSRC("/imagens/ContatosImagem.png");
    obj.image34:setLeft(50);
    obj.image34:setTop(54);
    obj.image34:setWidth(55);
    obj.image34:setHeight(51);
    obj.image34:setHitTest(true);
    obj.image34:setCursor("handPoint");
    obj.image34:setName("image34");

    obj.rclListaContatos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaContatos:setParent(obj.ContatosArea);
    obj.rclListaContatos:setName("rclListaContatos");
    obj.rclListaContatos:setField("CampoContatos");
    obj.rclListaContatos:setTemplateForm("frmListaContatos");
    obj.rclListaContatos:setLeft(35);
    obj.rclListaContatos:setTop(111);
    obj.rclListaContatos:setWidth(265);
    obj.rclListaContatos:setHeight(348);

    obj.luz = GUI.fromHandle(_obj_newObject("image"));
    obj.luz:setParent(obj.scrollBox1);
    obj.luz:setName("luz");
    obj.luz:setWidth(100);
    obj.luz:setHeight(100);
    obj.luz:setSRC("/imagens/sobrePersonagem.png");
    obj.luz:setTop(133);
    obj.luz:setLeft(355);
    obj.luz:setHitTest(true);
    obj.luz:setCursor("handPoint");
    obj.luz:setOpacity(0);

    obj.luz2 = GUI.fromHandle(_obj_newObject("image"));
    obj.luz2:setParent(obj.scrollBox1);
    obj.luz2:setName("luz2");
    obj.luz2:setWidth(100);
    obj.luz2:setHeight(100);
    obj.luz2:setSRC("/imagens/pericias.png");
    obj.luz2:setTop(134);
    obj.luz2:setLeft(548.5);
    obj.luz2:setHitTest(true);
    obj.luz2:setCursor("handPoint");
    obj.luz2:setOpacity(0);

    obj.luz3 = GUI.fromHandle(_obj_newObject("image"));
    obj.luz3:setParent(obj.scrollBox1);
    obj.luz3:setName("luz3");
    obj.luz3:setWidth(100);
    obj.luz3:setHeight(100);
    obj.luz3:setSRC("/imagens/atributos.png");
    obj.luz3:setTop(407);
    obj.luz3:setLeft(356);
    obj.luz3:setHitTest(true);
    obj.luz3:setCursor("handPoint");
    obj.luz3:setOpacity(0);

    obj.luz4 = GUI.fromHandle(_obj_newObject("image"));
    obj.luz4:setParent(obj.scrollBox1);
    obj.luz4:setName("luz4");
    obj.luz4:setWidth(100);
    obj.luz4:setHeight(100);
    obj.luz4:setSRC("/imagens/listadeContatos.png");
    obj.luz4:setTop(410);
    obj.luz4:setLeft(553);
    obj.luz4:setHitTest(true);
    obj.luz4:setCursor("handPoint");
    obj.luz4:setOpacity(0);


        self.imgVersaoAtual.url = 'https://dl.dropboxusercontent.com/s/bm31yrv3aoddlg5/versao.png?dl=0' .. math.random();

    


    obj._e_event0 = obj.zeraSoma:addEventListener("onClick",
        function (_)
            sheet.soma = 0
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
            	local s = string.format("%d", math.floor(v))
            	local pos = string.len(s) % 3 
            	if pos == 0 then pos = 3 end
                return string.sub(s, 1, pos)
            	    .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
            		.. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
            	  self.labSoma2.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            gui.openInBrowser('https://dl.dropboxusercontent.com/s/kv0ohcmcmxqrdrq/ProjetoXII.rpk')
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            self.nomePersonagem.fontColor = ("Black");
            				self.idade.fontColor = ("Black");
            				self.raca.fontColor = ("Black");
            				self.profissao.fontColor = ("Black");
            				self.peso.fontColor = ("Black");
            				self.altura.fontColor = ("Black");
            				self.corolhos.fontColor = ("Black");
            				self.aparencia.fontColor = ("Black");
            				self.nivelatributo.fontColor = ("Black");
        end, obj);

    obj._e_event5 = obj.button4:addEventListener("onClick",
        function (_)
            self.nomePersonagem.fontColor = ("Blue");
            				self.idade.fontColor = ("Blue");
            				self.raca.fontColor = ("Blue");
            				self.profissao.fontColor = ("Blue");
            				self.peso.fontColor = ("Blue");
            				self.altura.fontColor = ("Blue");
            				self.corolhos.fontColor = ("Blue");
            				self.aparencia.fontColor = ("Blue");
            				self.nivelatributo.fontColor = ("Blue");
        end, obj);

    obj._e_event6 = obj.button5:addEventListener("onClick",
        function (_)
            self.nomePersonagem.fontColor = ("AliceBlue");
            				self.idade.fontColor = ("AliceBlue");
            				self.raca.fontColor = ("AliceBlue");
            				self.profissao.fontColor = ("AliceBlue");
            				self.peso.fontColor = ("AliceBlue");
            				self.altura.fontColor = ("AliceBlue");
            				self.corolhos.fontColor = ("AliceBlue");
            				self.aparencia.fontColor = ("AliceBlue");
            				self.nivelatributo.fontColor = ("AliceBlue");
        end, obj);

    obj._e_event7 = obj.button6:addEventListener("onClick",
        function (_)
            self.nomePersonagem.fontColor = ("Brown");
            				self.idade.fontColor = ("Brown");
            				self.raca.fontColor = ("Brown");
            				self.profissao.fontColor = ("Brown");
            				self.peso.fontColor = ("Brown");
            				self.altura.fontColor = ("Brown");
            				self.corolhos.fontColor = ("Brown");
            				self.aparencia.fontColor = ("Brown");
            				self.nivelatributo.fontColor = ("Brown");
        end, obj);

    obj._e_event8 = obj.label1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.pontosatributo = (sheet.pontosatributo or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event9 = obj.label2:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Quantidade de Pontos:", "",
            		   function (valorPreenchido)
            					  sheet.nivelatributo = (sheet.nivelatributo or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event10 = obj.up:addEventListener("onMenu",
        function (_, x, y)
            nivelvoltarfunc(); poderEHabilidadefunc();
        end, obj);

    obj._e_event11 = obj.up:addEventListener("onClick",
        function (_)
            nivelfunc(); poderEHabilidadefunc(); mochila2func(); mochila3func(); mochila4func();
        end, obj);

    obj._e_event12 = obj.up:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            			   sheet.nivelatributo = (sheet.nivelatributo or 0) +0;
            			   sheet.pontosatributo = (sheet.pontosatributo or 0) +1;
            			     else 
            				 showMessage("Você não possui permissões aqui, OTARIO!")
            		end;
        end, obj);

    obj._e_event13 = obj.image8:addEventListener("onDblClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		  sheet.pontosatributo = 12;
            		  sheet.nivelatributo = 0;
            		  sheet.Parcela = 0;
            		  sheet.Parcela1 = 0;
            		  sheet.Parcela2 = 0;
            		  sheet.Parcela3 = 0;
            		  sheet.Parcela4 = 0;
            		  sheet.Parcela5 = 0;
            		  sheet.Parcela6 = 0;
            		  sheet.Parcela7 = 0;
            		  sheet.Parcela8 = 0;
            		  sheet.parcela8s = 0;
            		  sheet.Parcela9 = 0;
            		  sheet.Parcela10 = 0;
            		  sheet.Parcela11 = 0;
            		  sheet.Parcela12 = 0;
            		  sheet.Parcela13 = 0;
            		  sheet.Parcela14 = 0;
            		  sheet.Parcela15 = 0;
            		  sheet.Parcela16 = 0;
            		  sheet.Parcela17 = 0;
            		  sheet.Parcela18 = 0;
            			     else 
            				 showMessage("Você não possui permissões aqui, OTARIO!")
            		end;
        end, obj);

    obj._e_event14 = obj.image9:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela = (sheet.Parcela or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event15 = obj.image10:addEventListener("onClick",
        function (_)
            local Parcela = (sheet.Parcela or 0) -1;
            		    if Parcela >= 0 then
            			 sheet.Parcela = Parcela; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event16 = obj.image11:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela1 = (sheet.Parcela1 or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event17 = obj.image12:addEventListener("onClick",
        function (_)
            local Parcela1 = (sheet.Parcela1 or 0) -1;
            		    if Parcela1 >= 0 then
            			 sheet.Parcela1 = Parcela1; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event18 = obj.image13:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela2 = (sheet.Parcela2 or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event19 = obj.image14:addEventListener("onClick",
        function (_)
            local Parcela2 = (sheet.Parcela2 or 0) -1;
            		    if Parcela2 >= 0 then
            			 sheet.Parcela2 = Parcela2; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event20 = obj.image15:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela3 = (sheet.Parcela3 or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event21 = obj.image16:addEventListener("onClick",
        function (_)
            local Parcela3 = (sheet.Parcela3 or 0) -1;
            		    if Parcela3 >= 0 then
            			 sheet.Parcela3 = Parcela3; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event22 = obj.image17:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela4 = (sheet.Parcela4 or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event23 = obj.image18:addEventListener("onClick",
        function (_)
            local Parcela4 = (sheet.Parcela4 or 0) -1;
            		    if Parcela4 >= 0 then
            			 sheet.Parcela4 = Parcela4; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event24 = obj.image19:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela5 = (sheet.Parcela5 or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event25 = obj.image20:addEventListener("onClick",
        function (_)
            local Parcela5 = (sheet.Parcela5 or 0) -1;
            		    if Parcela5 >= 0 then
            			 sheet.Parcela5 = Parcela5; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event26 = obj.image21:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela6 = (sheet.Parcela6 or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event27 = obj.image22:addEventListener("onClick",
        function (_)
            local Parcela6 = (sheet.Parcela6 or 0) -1;
            		    if Parcela6 >= 0 then
            			 sheet.Parcela6 = Parcela6; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event28 = obj.image23:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela7 = (sheet.Parcela7 or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event29 = obj.image24:addEventListener("onClick",
        function (_)
            local Parcela7 = (sheet.Parcela7 or 0) -1;
            		    if Parcela7 >= 0 then
            			 sheet.Parcela7 = Parcela7; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event30 = obj.image25:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela8 = (sheet.Parcela8 or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event31 = obj.image26:addEventListener("onClick",
        function (_)
            local Parcela8 = (sheet.Parcela8 or 0) -1;
            		    if Parcela8 >= 0 then
            			 sheet.Parcela8 = Parcela8; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.9;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event32 = obj.image27:addEventListener("onClick",
        function (_)
            local pontosatributo = (sheet.pontosatributo or 0) -1;
            		    if pontosatributo >= 0 then
            			 sheet.pontosatributo = pontosatributo; sheet.Parcela8s = (sheet.Parcela8s or 0) +1;
            	                 	else 
            	          showMessage("Você não tem pontos para destribuir, seu fumão!")    
                     end;
        end, obj);

    obj._e_event33 = obj.image28:addEventListener("onClick",
        function (_)
            local Parcela8s = (sheet.Parcela8s or 0) -1;
            		    if Parcela8s >= 0 then
            			 sheet.Parcela8s = Parcela8s; sheet.pontosatributo = (sheet.pontosatributo or 0) +0.8;
            	                 	else 
            	          showMessage("CALMA CARA! Não tem mais nada aqui...")    
                     end;
        end, obj);

    obj._e_event34 = obj.button7:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa de Poções", "Qts sortes queimar:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela8s = (sheet.Parcela8s or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event35 = obj.Parcela9:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela9 = (sheet.Parcela9 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event36 = obj.Parcela10:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela10 = (sheet.Parcela10 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event37 = obj.Parcela11:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela11 = (sheet.Parcela11 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event38 = obj.Parcela12:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela12 = (sheet.Parcela12 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event39 = obj.Parcela13:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela13 = (sheet.Parcela13 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event40 = obj.Parcela14:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela14 = (sheet.Parcela14 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event41 = obj.Parcela15:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela15 = (sheet.Parcela15 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event42 = obj.Parcela16:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela16 = (sheet.Parcela16 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event43 = obj.Parcela17:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Parcela17 = (sheet.Parcela17 or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event44 = obj.button8:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela18 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Força de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event45 = obj.button9:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela19 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Habilidade de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event46 = obj.button10:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela20 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Destreza de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event47 = obj.button11:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela21 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Esquiva de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event48 = obj.button12:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela22 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Energia de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event49 = obj.button13:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela23 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Inteligência de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event50 = obj.button14:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela24 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Carisma de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event51 = obj.button15:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela25 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Resistência de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event52 = obj.button16:addEventListener("onClick",
        function (_)
            local rolagem = rrpg.interpretarRolagem("1d20 + " .. (sheet.Parcela26 or "0"));
            					local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            					mesaDoPersonagem.activeChat:rolarDados(rolagem, "Percepção de " .. (sheet.nomePersonagem or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event53 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela18 = (tonumber(sheet.parcela) or 0) +
            					                         (tonumber(sheet.parcela9) or 0);
        end, obj);

    obj._e_event54 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela19 = (tonumber(sheet.parcela1) or 0) +
            					                         (tonumber(sheet.parcela10) or 0);
        end, obj);

    obj._e_event55 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela20 = (tonumber(sheet.parcela2) or 0) +
            					                         (tonumber(sheet.parcela11) or 0);
        end, obj);

    obj._e_event56 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela21 = (tonumber(sheet.parcela3) or 0) +
            					                         (tonumber(sheet.parcela12) or 0);
        end, obj);

    obj._e_event57 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela22 = (tonumber(sheet.parcela4) or 0) +
            					                         (tonumber(sheet.parcela13) or 0);
        end, obj);

    obj._e_event58 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela23 = (tonumber(sheet.parcela5) or 0) +
            					                         (tonumber(sheet.parcela14) or 0);
        end, obj);

    obj._e_event59 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela24 = (tonumber(sheet.parcela6) or 0) +
            					                         (tonumber(sheet.parcela15) or 0);
        end, obj);

    obj._e_event60 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela25 = (tonumber(sheet.parcela7) or 0) +
            					                         (tonumber(sheet.parcela16) or 0);
        end, obj);

    obj._e_event61 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.Parcela26 = (tonumber(sheet.parcela8) or 0) +
            					                         (tonumber(sheet.parcela17) or 0);
        end, obj);

    obj._e_event62 = obj.RNP1:addEventListener("onClick",
        function (_)
            self.RP1.visible = true;
            		   self.RP2.visible = false;
            		   self.RP3.visible = false;
            		   self.PPR1.visible = true
            		   self.PPR2.visible = false
        end, obj);

    obj._e_event63 = obj.RNP2:addEventListener("onClick",
        function (_)
            self.RP1.visible = false;
            			 self.RP2.visible = true;
            			 self.RP3.visible = false;
            			 self.PPR1.visible = false
            			 self.PPR2.visible = true
        end, obj);

    obj._e_event64 = obj.RNP3:addEventListener("onClick",
        function (_)
            self.RP1.visible = false;
            		    self.RP2.visible = false;
            		    self.RP3.visible = true;
            			self.PPR1.visible = false
            			self.PPR2.visible = false
        end, obj);

    obj._e_event65 = obj.image31:addEventListener("onClick",
        function (_)
            self.rclListaPericias:append();
        end, obj);

    obj._e_event66 = obj.AB1usar:addEventListener("onClick",
        function (_)
            local Quantidade1 = (sheet.Quantidade1 or 0) -1
            		   if Quantidade1 >= 0 then
            		    sheet.Quantidade1 = Quantidade1; local minhaMesa = rrpg.getMesaDe(sheet);
            			 local chat = minhaMesa.chat;
            			 chat:enviarMensagem("/Energia +30")
            			end;
        end, obj);

    obj._e_event67 = obj.AB2usar:addEventListener("onClick",
        function (_)
            local Quantidade2 = (sheet.Quantidade2 or 0) -1
            		   if Quantidade2 >= 0 then
            		    sheet.Quantidade2 = Quantidade2; local minhaMesa = rrpg.getMesaDe(sheet);
            			 local chat = minhaMesa.chat;
            			 chat:enviarMensagem("/Energia +30")
            			end;
        end, obj);

    obj._e_event68 = obj.Comprar1:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -120;
            		   if Soma >= 0 then
            		  sheet.Soma = Soma;sheet.Quantidade1 = (sheet.Quantidade1 or 0) +1;
            		  local minhaMesa = rrpg.getMesaDe(sheet); 
            		  local chat = minhaMesa.chat;
            			chat:enviarMensagem("/me [§K2]Acabou de comprar 1:[§K2] [§K9]AB1[§K9]");
            
            		    else
            			showMessage("Você não tem dinheiro suficiente")
            		  end;
        end, obj);

    obj._e_event69 = obj.Vender1:addEventListener("onClick",
        function (_)
            local Quantidade1 = (sheet.Quantidade1 or 0) -1;
            		  if Quantidade1 >= 0 then
            		 sheet.Quantidade1 = Quantidade1;sheet.Soma = (sheet.Soma or 0) +110;
            		   else
            		    showMessage("Você não tem AB1 suficiente para vender")
            		 end;
        end, obj);

    obj._e_event70 = obj.Comprar2:addEventListener("onClick",
        function (_)
            local Soma = (sheet.Soma or 0) -120;
            		  if Soma >= 0 then
            		  sheet.Soma = Soma;sheet.Quantidade2 = (sheet.Quantidade2 or 0) +1;
            		  local minhaMesa = rrpg.getMesaDe(sheet); 
            		  local chat = minhaMesa.chat;
            			chat:enviarMensagem("/me [§K2]Acabou de comprar 1:[§K2] [§K9]AB2[§K9]");
            		   else
            		   showMessage("Você não tem dinheiro suficiente")
            		  end;
        end, obj);

    obj._e_event71 = obj.Vender2:addEventListener("onClick",
        function (_)
            local Quantidade2 = (sheet.Quantidade2 or 0) -1
                     if Quantidade2 >= 0 then
                   sheet.Quantidade2 = Quantidade2;sheet.Soma = (sheet.Soma or 0) +110;
            	   else 
            	    showMessage("Você não tem mais AB2 para vender")
                   end;
        end, obj);

    obj._e_event72 = obj.button17:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Carteira", "Novo valor:", "",
            		   function (valorPreenchido)
            					  sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event73 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
            	local s = string.format("%d", math.floor(v))
            	local pos = string.len(s) % 3 
            	if pos == 0 then pos = 3 end
                return string.sub(s, 1, pos)
            	    .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
            		.. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
            	  self.labSoma.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event74 = obj.image34:addEventListener("onClick",
        function (_)
            self.rclListaContatos:append();
        end, obj);

    obj._e_event75 = obj.luz:addEventListener("onClick",
        function (_)
            if sheet.sobrePersonagem then
            				    sheet.sobrePersonagem = false;
            				   self.sobrePersonagem.visible = false
            				   self.luz.opacity = 0
            				   self.versoes.visible = true;
            				   else
            				    sheet.sobrePersonagem = true
            					self.sobrePersonagem.visible = true
            					self.luz.opacity = 10
            					self.atributo.visible = false
            					self.luz3.opacity = 0
            					self.luz2.opacity = 0 
            					self.luz4.opacity = 0 					
            					self.Pericias.visible = false
            					self.Contatos.visible = false;
            					self.versoes.visible = true;
            					end;
        end, obj);

    obj._e_event76 = obj.luz2:addEventListener("onClick",
        function (_)
            if sheet.Pericias then
            					sheet.Pericias = false;
            					self.Pericias.visible = false
            					self.luz2.opacity = 0
            					self.versoes.visible = true;
            					else
            					sheet.Pericias = true
            					self.Pericias.visible = true 
            					self.luz2.opacity = 10
            					self.luz.opacity = 0
            					self.luz3.opacity = 0
            					self.luz4.opacity = 0 										
            					self.sobrePersonagem.visible = false
            					self.atributo.visible = false;
            					self.Contatos.visible = false;
            					end;
        end, obj);

    obj._e_event77 = obj.luz3:addEventListener("onClick",
        function (_)
            if sheet.atributo then
            				    sheet.atributo = false;
            				   self.atributo.visible = false
            				   self.luz3.opacity = 0
            				   self.versoes.visible = true;
            				   else
            				   self.versoes.visible = false;
            				    sheet.atributo = true
            					self.atributo.visible = true
            					self.luz3.opacity = 10
            					self.sobrePersonagem.visible = false
            					self.luz.opacity = 0
            			        self.luz2.opacity = 0 
            					self.luz4.opacity = 0 										
            					self.Pericias.visible = false
            					self.Contatos.visible = false;
            					end;
        end, obj);

    obj._e_event78 = obj.luz4:addEventListener("onClick",
        function (_)
            if sheet.Contatos then
            				    sheet.Contatos = false;
            				   self.Contatos.visible = false
            				   self.luz4.opacity = 0
            				   self.versoes.visible = true;
            				   else
            				    sheet.Contatos = true
            					self.Contatos.visible = true
            					self.luz4.opacity = 10
            					self.sobrePersonagem.visible = false
            					self.luz.opacity = 0
            			        self.luz2.opacity = 0
                                self.luz3.opacity = 0					
            					self.Pericias.visible = false
            					self.atributo.visible = false;
            					self.versoes.visible = true;
            					end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.Parcela15 ~= nil then self.Parcela15:destroy(); self.Parcela15 = nil; end;
        if self.Parcela20 ~= nil then self.Parcela20:destroy(); self.Parcela20 = nil; end;
        if self.Parcela17 ~= nil then self.Parcela17:destroy(); self.Parcela17 = nil; end;
        if self.image34 ~= nil then self.image34:destroy(); self.image34 = nil; end;
        if self.image19 ~= nil then self.image19:destroy(); self.image19 = nil; end;
        if self.PPR2 ~= nil then self.PPR2:destroy(); self.PPR2 = nil; end;
        if self.luz3 ~= nil then self.luz3:destroy(); self.luz3 = nil; end;
        if self.Comprar1 ~= nil then self.Comprar1:destroy(); self.Comprar1 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.Comprar2 ~= nil then self.Comprar2:destroy(); self.Comprar2 = nil; end;
        if self.image32 ~= nil then self.image32:destroy(); self.image32 = nil; end;
        if self.luz4 ~= nil then self.luz4:destroy(); self.luz4 = nil; end;
        if self.image30 ~= nil then self.image30:destroy(); self.image30 = nil; end;
        if self.RP2 ~= nil then self.RP2:destroy(); self.RP2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.peso ~= nil then self.peso:destroy(); self.peso = nil; end;
        if self.image7 ~= nil then self.image7:destroy(); self.image7 = nil; end;
        if self.image20 ~= nil then self.image20:destroy(); self.image20 = nil; end;
        if self.image14 ~= nil then self.image14:destroy(); self.image14 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.Parcela23 ~= nil then self.Parcela23:destroy(); self.Parcela23 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image33 ~= nil then self.image33:destroy(); self.image33 = nil; end;
        if self.Parcela ~= nil then self.Parcela:destroy(); self.Parcela = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.Parcela21 ~= nil then self.Parcela21:destroy(); self.Parcela21 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.FichaPrincipalTD ~= nil then self.FichaPrincipalTD:destroy(); self.FichaPrincipalTD = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.image6 ~= nil then self.image6:destroy(); self.image6 = nil; end;
        if self.image25 ~= nil then self.image25:destroy(); self.image25 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.luz2 ~= nil then self.luz2:destroy(); self.luz2 = nil; end;
        if self.sobrePersonagem ~= nil then self.sobrePersonagem:destroy(); self.sobrePersonagem = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.Parcela18 ~= nil then self.Parcela18:destroy(); self.Parcela18 = nil; end;
        if self.Vender1 ~= nil then self.Vender1:destroy(); self.Vender1 = nil; end;
        if self.RP3 ~= nil then self.RP3:destroy(); self.RP3 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.Parcela14 ~= nil then self.Parcela14:destroy(); self.Parcela14 = nil; end;
        if self.zeraSoma ~= nil then self.zeraSoma:destroy(); self.zeraSoma = nil; end;
        if self.image12 ~= nil then self.image12:destroy(); self.image12 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.profissao ~= nil then self.profissao:destroy(); self.profissao = nil; end;
        if self.image24 ~= nil then self.image24:destroy(); self.image24 = nil; end;
        if self.Parcela10 ~= nil then self.Parcela10:destroy(); self.Parcela10 = nil; end;
        if self.labSoma2 ~= nil then self.labSoma2:destroy(); self.labSoma2 = nil; end;
        if self.Parcela1 ~= nil then self.Parcela1:destroy(); self.Parcela1 = nil; end;
        if self.labSoma ~= nil then self.labSoma:destroy(); self.labSoma = nil; end;
        if self.Parcela6 ~= nil then self.Parcela6:destroy(); self.Parcela6 = nil; end;
        if self.up ~= nil then self.up:destroy(); self.up = nil; end;
        if self.image11 ~= nil then self.image11:destroy(); self.image11 = nil; end;
        if self.Pericias ~= nil then self.Pericias:destroy(); self.Pericias = nil; end;
        if self.imgVersaoAtual ~= nil then self.imgVersaoAtual:destroy(); self.imgVersaoAtual = nil; end;
        if self.aparencia ~= nil then self.aparencia:destroy(); self.aparencia = nil; end;
        if self.PPR1 ~= nil then self.PPR1:destroy(); self.PPR1 = nil; end;
        if self.rclListaPericias ~= nil then self.rclListaPericias:destroy(); self.rclListaPericias = nil; end;
        if self.atributo ~= nil then self.atributo:destroy(); self.atributo = nil; end;
        if self.image16 ~= nil then self.image16:destroy(); self.image16 = nil; end;
        if self.Parcela5 ~= nil then self.Parcela5:destroy(); self.Parcela5 = nil; end;
        if self.Parcela11 ~= nil then self.Parcela11:destroy(); self.Parcela11 = nil; end;
        if self.image29 ~= nil then self.image29:destroy(); self.image29 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.versoes ~= nil then self.versoes:destroy(); self.versoes = nil; end;
        if self.Parcela13 ~= nil then self.Parcela13:destroy(); self.Parcela13 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.image27 ~= nil then self.image27:destroy(); self.image27 = nil; end;
        if self.image9 ~= nil then self.image9:destroy(); self.image9 = nil; end;
        if self.nivelatributo ~= nil then self.nivelatributo:destroy(); self.nivelatributo = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.image28 ~= nil then self.image28:destroy(); self.image28 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.Parcela12 ~= nil then self.Parcela12:destroy(); self.Parcela12 = nil; end;
        if self.image26 ~= nil then self.image26:destroy(); self.image26 = nil; end;
        if self.image8 ~= nil then self.image8:destroy(); self.image8 = nil; end;
        if self.Parcela25 ~= nil then self.Parcela25:destroy(); self.Parcela25 = nil; end;
        if self.Parcela24 ~= nil then self.Parcela24:destroy(); self.Parcela24 = nil; end;
        if self.Parcela3 ~= nil then self.Parcela3:destroy(); self.Parcela3 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.nomePersonagem ~= nil then self.nomePersonagem:destroy(); self.nomePersonagem = nil; end;
        if self.RNP3 ~= nil then self.RNP3:destroy(); self.RNP3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.corolhos ~= nil then self.corolhos:destroy(); self.corolhos = nil; end;
        if self.altura ~= nil then self.altura:destroy(); self.altura = nil; end;
        if self.image17 ~= nil then self.image17:destroy(); self.image17 = nil; end;
        if self.ContatosArea ~= nil then self.ContatosArea:destroy(); self.ContatosArea = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.image10 ~= nil then self.image10:destroy(); self.image10 = nil; end;
        if self.FichaPrincipal ~= nil then self.FichaPrincipal:destroy(); self.FichaPrincipal = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.Parcela16 ~= nil then self.Parcela16:destroy(); self.Parcela16 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.Parcela26 ~= nil then self.Parcela26:destroy(); self.Parcela26 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.raca ~= nil then self.raca:destroy(); self.raca = nil; end;
        if self.image22 ~= nil then self.image22:destroy(); self.image22 = nil; end;
        if self.AB2usar ~= nil then self.AB2usar:destroy(); self.AB2usar = nil; end;
        if self.Contatos ~= nil then self.Contatos:destroy(); self.Contatos = nil; end;
        if self.Parcela8 ~= nil then self.Parcela8:destroy(); self.Parcela8 = nil; end;
        if self.Parcela9 ~= nil then self.Parcela9:destroy(); self.Parcela9 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.idade ~= nil then self.idade:destroy(); self.idade = nil; end;
        if self.luz ~= nil then self.luz:destroy(); self.luz = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.AB1usar ~= nil then self.AB1usar:destroy(); self.AB1usar = nil; end;
        if self.rclListaContatos ~= nil then self.rclListaContatos:destroy(); self.rclListaContatos = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.Parcela8s ~= nil then self.Parcela8s:destroy(); self.Parcela8s = nil; end;
        if self.Parcela22 ~= nil then self.Parcela22:destroy(); self.Parcela22 = nil; end;
        if self.Vender2 ~= nil then self.Vender2:destroy(); self.Vender2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.RP1 ~= nil then self.RP1:destroy(); self.RP1 = nil; end;
        if self.image15 ~= nil then self.image15:destroy(); self.image15 = nil; end;
        if self.image23 ~= nil then self.image23:destroy(); self.image23 = nil; end;
        if self.image31 ~= nil then self.image31:destroy(); self.image31 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.Parcela2 ~= nil then self.Parcela2:destroy(); self.Parcela2 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.image13 ~= nil then self.image13:destroy(); self.image13 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.image18 ~= nil then self.image18:destroy(); self.image18 = nil; end;
        if self.RNP1 ~= nil then self.RNP1:destroy(); self.RNP1 = nil; end;
        if self.RNP2 ~= nil then self.RNP2:destroy(); self.RNP2 = nil; end;
        if self.Parcela7 ~= nil then self.Parcela7:destroy(); self.Parcela7 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.Parcela19 ~= nil then self.Parcela19:destroy(); self.Parcela19 = nil; end;
        if self.Parcela4 ~= nil then self.Parcela4:destroy(); self.Parcela4 = nil; end;
        if self.image21 ~= nil then self.image21:destroy(); self.image21 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFicha1_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFicha1_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFicha1_svg = {
    newEditor = newfrmFicha1_svg, 
    new = newfrmFicha1_svg, 
    name = "frmFicha1_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFicha1_svg = _frmFicha1_svg;
Firecast.registrarForm(_frmFicha1_svg);

return _frmFicha1_svg;
