require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_CaixaFichaNPC()
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
    obj:setName("CaixaFichaNPC");
    obj:setWidth(270);
    obj:setHeight(109);
    obj:setTheme("dark");


		function pegarJogador()
			return ndb.testPermission(sheet, "write");
		end;
		
		function self:setarNPC()
			if sheet ~= nil then
				if sheet.alinhamentoNPC == "Jogador" then
					self.NomePequenoBarrinha.fontColor = "#99ff99";
					sheet.ModCor = "J";
				elseif sheet.alinhamentoNPC == "Aliado" then
					sheet.NomePequeno = "Aliado";
					self.NomePequenoBarrinha.fontColor = "#9999ff";
					sheet.ModCor = "A";
				elseif sheet.alinhamentoNPC == "Inimigo" then
					sheet.NomePequeno = "Inimigo";
					self.NomePequenoBarrinha.fontColor = "#ff9999";
					sheet.ModCor = "I";
				elseif sheet.alinhamentoNPC == "Neutro" then
					sheet.NomePequeno = "Neutro";
					self.NomePequenoBarrinha.fontColor = "#eeeeee";
					sheet.ModCor = "N";
				end;
			end;
		end;

		function cordiv0(valor)
			if valor == 0 then
				return 1;
			else
				return valor;
			end;
		end;
		
		function PrepararRolagem(nomerolagem, rolagem, d20)
			d20 = (d20 or false)
			
			local rolando = rrpg.interpretarRolagem(rolagem); 
			
			if not rolando.possuiAlgumDado then
				if d20 then
					rolando = rrpg.interpretarRolagem("1d20"):concatenar(rolando);
				else
					rolando = rrpg.interpretarRolagem("1d1-1"):concatenar(rolando);
				end;
			end; 
			
			local mesaDoPersonagem = rrpg.getMesaDe(sheet);

			if mesaDoPersonagem ~= nil then
				mesaDoPersonagem.activeChat:rolarDados(rolando, nomerolagem);
			end;
		end;
	
        function self:alternarVisibilidade()
             if self.cbxInvisivel.checked then
             	sheet.hideNPC = false;
                ndb.setPermission(sheet, "group", "jogadores", "read", nil);
                ndb.setPermission(sheet, "group", "espectadores", "read", nil);
             else
             	sheet.hideNPC = true;
                ndb.setPermission(sheet, "group", "jogadores", "read", "deny");
                ndb.setPermission(sheet, "group", "espectadores", "read", "deny");
             end;
         end; 

         function self:atualizarCbxInvisivel()          
             self.cbxInvisivel.checked = ndb.getPermission(sheet, "group", "espectadores", "read") == "deny" or
                                         ndb.getPermission(sheet, "group", "jogadores", "read") == "deny"

			if self.cbxInvisivel.checked then
				self.opacity = 0.5;
			else
				self.opacity = 1.0;
			end;

            self.cbxInvisivel.enabled = DonoMestre(sheet, true);
			self.imgApagar.enabled = DonoMestre(sheet, true);
			self.imgBloquear.enabled = DonoMestre(sheet, true);
			self.imgFalar.enabled = DonoMestre(sheet, true);
		end;
    


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("CorNha");
    obj.dataLink1:setName("dataLink1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setVisible(false);
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setAlign("client");
    obj.layout2:setVisible(false);
    obj.layout2:setName("layout2");

    obj.TipoDeBarras = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.TipoDeBarras:setParent(obj.layout2);
    obj.TipoDeBarras:setName("TipoDeBarras");
    obj.TipoDeBarras:setCancelable(false);
    obj.TipoDeBarras:setWidth(200);
    obj.TipoDeBarras:setTitle("Alinhamento do NPC");
    obj.TipoDeBarras:setHeight(100);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.TipoDeBarras);
    obj.label1:setAlign("top");
    obj.label1:setMargins({left=10, top=4});
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setField("NomeGrande");
    obj.label1:setHeight(16);
    obj.label1:setName("label1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.TipoDeBarras);
    obj.layout3:setAlign("client");
    obj.layout3:setName("layout3");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout3);
    obj.radioButton1:setText("Aliado");
    obj.radioButton1:setGroupName("AlinhamentoNPCs");
    obj.radioButton1:setVertTextAlign("center");
    obj.radioButton1:setField("alinhamentoNPC");
    obj.radioButton1:setFieldValue("Aliado");
    obj.radioButton1:setTop(7);
    obj.radioButton1:setLeft(10);
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout3);
    obj.radioButton2:setText("Inimigo");
    obj.radioButton2:setGroupName("AlinhamentoNPCs");
    obj.radioButton2:setVertTextAlign("center");
    obj.radioButton2:setField("alinhamentoNPC");
    obj.radioButton2:setFieldValue("Inimigo");
    obj.radioButton2:setTop(7);
    obj.radioButton2:setLeft(75);
    obj.radioButton2:setName("radioButton2");

    obj.radioButton3 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout3);
    obj.radioButton3:setText("Neutro");
    obj.radioButton3:setGroupName("AlinhamentoNPCs");
    obj.radioButton3:setVertTextAlign("center");
    obj.radioButton3:setField("alinhamentoNPC");
    obj.radioButton3:setFieldValue("Neutro");
    obj.radioButton3:setTop(29);
    obj.radioButton3:setLeft(10);
    obj.radioButton3:setName("radioButton3");

    obj.radioButton4 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout3);
    obj.radioButton4:setText("Jogador");
    obj.radioButton4:setGroupName("AlinhamentoNPCs");
    obj.radioButton4:setVertTextAlign("center");
    obj.radioButton4:setField("alinhamentoNPC");
    obj.radioButton4:setFieldValue("Jogador");
    obj.radioButton4:setTop(29);
    obj.radioButton4:setLeft(75);
    obj.radioButton4:setName("radioButton4");

    obj.listaDeJogadores = GUI.fromHandle(_obj_newObject("layout"));
    obj.listaDeJogadores:setParent(obj.layout3);
    obj.listaDeJogadores:setWidth(140);
    obj.listaDeJogadores:setName("listaDeJogadores");
    obj.listaDeJogadores:setTop(54);
    obj.listaDeJogadores:setLeft(10);
    obj.listaDeJogadores:setHeight(18);
    obj.listaDeJogadores:setHitTest(true);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.listaDeJogadores);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#333333");
    obj.rectangle1:setXradius(2);
    obj.rectangle1:setYradius(2);
    obj.rectangle1:setHitTest(true);
    obj.rectangle1:setName("rectangle1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setFontColor("white");
    obj.label2:setAlign("client");
    obj.label2:setVertTextAlign("center");
    obj.label2:setMargins({left=4});
    obj.label2:setText("Opções");
    obj.label2:setField("opcaoEscolhida2");
    obj.label2:setHitTest(true);
    obj.label2:setName("label2");

    obj.path1 = GUI.fromHandle(_obj_newObject("path"));
    obj.path1:setParent(obj.rectangle1);
    obj.path1:setAlign("right");
    obj.path1:setWidth(16);
    obj.path1:setMargins({right=2, left=2, top=4, bottom=4});
    obj.path1:setColor("orange");
    obj.path1:setPathData("M 100 100 L 300 100 L 200 300 z");
    obj.path1:setName("path1");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.TipoDeBarras);
    obj.layout4:setAlign("right");
    obj.layout4:setWidth(40);
    obj.layout4:setMargins({top=35, right=4, bottom=5});
    obj.layout4:setName("layout4");

    obj.BotonAction = GUI.fromHandle(_obj_newObject("button"));
    obj.BotonAction:setParent(obj.layout4);
    obj.BotonAction:setName("BotonAction");
    obj.BotonAction:setAlign("client");
    obj.BotonAction:setText("Ok!");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("opcaoEscolhida2");
    obj.dataLink2:setDefaultValue("Nenhum");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("alinhamentoNPC");
    obj.dataLink3:setDefaultValue("Neutro");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("NomeGrande");
    obj.dataLink4:setDefaultValue("Nome do NPC");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("NomePequeno");
    obj.dataLink5:setDefaultValue("Neutro");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("Linha1");
    obj.dataLink6:setDefaultValue("<linha>");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("Linha2");
    obj.dataLink7:setDefaultValue("<linha>");
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setField("ModificadorBarrinhaMax");
    obj.dataLink8:setDefaultValue("igual");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setField("ModificadorBarrinha");
    obj.dataLink9:setDefaultValue("igual");
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'Barrinha1Valor', 'Barrinha1ValorMax'});
    obj.dataLink10:setDefaultValues({'0', '0'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'Barrinha2Valor', 'Barrinha2ValorMax'});
    obj.dataLink11:setDefaultValues({'0', '0'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setFields({'Barrinha3Valor', 'Barrinha3ValorMax'});
    obj.dataLink12:setDefaultValues({'0', '0'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setFields({'Barrinha4Valor', 'Barrinha4ValorMax'});
    obj.dataLink13:setDefaultValues({'0', '0'});
    obj.dataLink13:setName("dataLink13");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj);
    obj.layout5:setAlign("client");
    obj.layout5:setVisible(false);
    obj.layout5:setName("layout5");

    obj.MensagemPopup = GUI.fromHandle(_obj_newObject("popupForm"));
    obj.MensagemPopup:setParent(obj.layout5);
    obj.MensagemPopup:setTitle("Menu de Formatação de Mensagens");
    obj.MensagemPopup:setName("MensagemPopup");
    obj.MensagemPopup:setWidth(420);
    obj.MensagemPopup:setHeight(200);
    obj.MensagemPopup:setPadding({left=4, right=4, top=4, bottom=4});

    obj.MenuCor = GUI.fromHandle(_obj_newObject("popup"));
    obj.MenuCor:setParent(obj.MensagemPopup);
    obj.MenuCor:setName("MenuCor");
    obj.MenuCor:setWidth(172);
    obj.MenuCor:setHeight(150);
    lfm_setPropAsString(obj.MenuCor, "autoScopeNode",  "false");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.MenuCor);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(24);
    obj.layout6:setName("layout6");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout6);
    obj.label3:setAlign("client");
    obj.label3:setText("Informação de Cores:");
    obj.label3:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setName("label3");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.MenuCor);
    obj.layout7:setAlign("client");
    obj.layout7:setMargins({left=4, right=4});
    obj.layout7:setHitTest(true);
    obj.layout7:setName("layout7");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.layout7);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setOrientation("horizontal");
    obj.flowLayout1:setMaxControlsPerLine(7);
    obj.flowLayout1:setName("flowLayout1");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.flowLayout1);
    obj.layout8:setAlign("top");
    obj.layout8:setMargins({top=2, left=2});
    obj.layout8:setWidth(20);
    obj.layout8:setHeight(20);
    obj.layout8:setName("layout8");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout8);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#FFFFFF");
    obj.rectangle2:setName("rectangle2");

    obj.Cor_1 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_1:setParent(obj.rectangle2);
    obj.Cor_1:setAlign("client");
    obj.Cor_1:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_1:setName("Cor_1");
    obj.Cor_1:setHorzTextAlign("center");
    obj.Cor_1:setVertTextAlign("center");
    obj.Cor_1:setText("1");
    obj.Cor_1:setFontColor("#000000");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.flowLayout1);
    obj.layout9:setAlign("top");
    obj.layout9:setMargins({top=2, left=2});
    obj.layout9:setWidth(20);
    obj.layout9:setHeight(20);
    obj.layout9:setName("layout9");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout9);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#7f7fff");
    obj.rectangle3:setName("rectangle3");

    obj.Cor_2 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_2:setParent(obj.rectangle3);
    obj.Cor_2:setAlign("client");
    obj.Cor_2:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_2:setName("Cor_2");
    obj.Cor_2:setHorzTextAlign("center");
    obj.Cor_2:setVertTextAlign("center");
    obj.Cor_2:setText("2");
    obj.Cor_2:setFontColor("#000000");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.flowLayout1);
    obj.layout10:setAlign("top");
    obj.layout10:setMargins({top=2, left=2});
    obj.layout10:setWidth(20);
    obj.layout10:setHeight(20);
    obj.layout10:setName("layout10");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout10);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("#7fff7f");
    obj.rectangle4:setName("rectangle4");

    obj.Cor_3 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_3:setParent(obj.rectangle4);
    obj.Cor_3:setAlign("client");
    obj.Cor_3:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_3:setName("Cor_3");
    obj.Cor_3:setHorzTextAlign("center");
    obj.Cor_3:setVertTextAlign("center");
    obj.Cor_3:setText("3");
    obj.Cor_3:setFontColor("#800080");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.flowLayout1);
    obj.layout11:setAlign("top");
    obj.layout11:setMargins({top=2, left=2});
    obj.layout11:setWidth(20);
    obj.layout11:setHeight(20);
    obj.layout11:setName("layout11");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout11);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("#ff0000");
    obj.rectangle5:setName("rectangle5");

    obj.Cor_4 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_4:setParent(obj.rectangle5);
    obj.Cor_4:setAlign("client");
    obj.Cor_4:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_4:setName("Cor_4");
    obj.Cor_4:setHorzTextAlign("center");
    obj.Cor_4:setVertTextAlign("center");
    obj.Cor_4:setText("4");
    obj.Cor_4:setFontColor("#000000");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.flowLayout1);
    obj.layout12:setAlign("top");
    obj.layout12:setMargins({top=2, left=2});
    obj.layout12:setWidth(20);
    obj.layout12:setHeight(20);
    obj.layout12:setName("layout12");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout12);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("#ff7f7f");
    obj.rectangle6:setName("rectangle6");

    obj.Cor_5 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_5:setParent(obj.rectangle6);
    obj.Cor_5:setAlign("client");
    obj.Cor_5:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_5:setName("Cor_5");
    obj.Cor_5:setHorzTextAlign("center");
    obj.Cor_5:setVertTextAlign("center");
    obj.Cor_5:setText("5");
    obj.Cor_5:setFontColor("#000000");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.flowLayout1);
    obj.layout13:setAlign("top");
    obj.layout13:setMargins({top=2, left=2});
    obj.layout13:setWidth(20);
    obj.layout13:setHeight(20);
    obj.layout13:setName("layout13");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout13);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("#ff7fff");
    obj.rectangle7:setName("rectangle7");

    obj.Cor_6 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_6:setParent(obj.rectangle7);
    obj.Cor_6:setAlign("client");
    obj.Cor_6:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_6:setName("Cor_6");
    obj.Cor_6:setHorzTextAlign("center");
    obj.Cor_6:setVertTextAlign("center");
    obj.Cor_6:setText("6");
    obj.Cor_6:setFontColor("#000000");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.flowLayout1);
    obj.layout14:setAlign("top");
    obj.layout14:setMargins({top=2, left=2});
    obj.layout14:setWidth(20);
    obj.layout14:setHeight(20);
    obj.layout14:setName("layout14");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout14);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("#ff7f00");
    obj.rectangle8:setName("rectangle8");

    obj.Cor_7 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_7:setParent(obj.rectangle8);
    obj.Cor_7:setAlign("client");
    obj.Cor_7:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_7:setName("Cor_7");
    obj.Cor_7:setHorzTextAlign("center");
    obj.Cor_7:setVertTextAlign("center");
    obj.Cor_7:setText("7");
    obj.Cor_7:setFontColor("#000000");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.flowLayout1);
    obj.layout15:setAlign("top");
    obj.layout15:setMargins({top=2, left=2});
    obj.layout15:setWidth(20);
    obj.layout15:setHeight(20);
    obj.layout15:setName("layout15");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout15);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("#ffff00");
    obj.rectangle9:setName("rectangle9");

    obj.Cor_8 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_8:setParent(obj.rectangle9);
    obj.Cor_8:setAlign("client");
    obj.Cor_8:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_8:setName("Cor_8");
    obj.Cor_8:setHorzTextAlign("center");
    obj.Cor_8:setVertTextAlign("center");
    obj.Cor_8:setText("8");
    obj.Cor_8:setFontColor("#000000");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.flowLayout1);
    obj.layout16:setAlign("top");
    obj.layout16:setMargins({top=2, left=2});
    obj.layout16:setWidth(20);
    obj.layout16:setHeight(20);
    obj.layout16:setName("layout16");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout16);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("#00ff00");
    obj.rectangle10:setName("rectangle10");

    obj.Cor_9 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_9:setParent(obj.rectangle10);
    obj.Cor_9:setAlign("client");
    obj.Cor_9:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_9:setName("Cor_9");
    obj.Cor_9:setHorzTextAlign("center");
    obj.Cor_9:setVertTextAlign("center");
    obj.Cor_9:setText("9");
    obj.Cor_9:setFontColor("#000000");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.flowLayout1);
    obj.layout17:setAlign("top");
    obj.layout17:setMargins({top=2, left=2});
    obj.layout17:setWidth(20);
    obj.layout17:setHeight(20);
    obj.layout17:setName("layout17");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout17);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("#7fffff");
    obj.rectangle11:setName("rectangle11");

    obj.Cor_10 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_10:setParent(obj.rectangle11);
    obj.Cor_10:setAlign("client");
    obj.Cor_10:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_10:setName("Cor_10");
    obj.Cor_10:setHorzTextAlign("center");
    obj.Cor_10:setVertTextAlign("center");
    obj.Cor_10:setText("10");
    obj.Cor_10:setFontColor("#000000");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.flowLayout1);
    obj.layout18:setAlign("top");
    obj.layout18:setMargins({top=2, left=2});
    obj.layout18:setWidth(20);
    obj.layout18:setHeight(20);
    obj.layout18:setName("layout18");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout18);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("#00ffff");
    obj.rectangle12:setName("rectangle12");

    obj.Cor_11 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_11:setParent(obj.rectangle12);
    obj.Cor_11:setAlign("client");
    obj.Cor_11:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_11:setName("Cor_11");
    obj.Cor_11:setHorzTextAlign("center");
    obj.Cor_11:setVertTextAlign("center");
    obj.Cor_11:setText("11");
    obj.Cor_11:setFontColor("#000000");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.flowLayout1);
    obj.layout19:setAlign("top");
    obj.layout19:setMargins({top=2, left=2});
    obj.layout19:setWidth(20);
    obj.layout19:setHeight(20);
    obj.layout19:setName("layout19");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout19);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("#0000ff");
    obj.rectangle13:setName("rectangle13");

    obj.Cor_12 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_12:setParent(obj.rectangle13);
    obj.Cor_12:setAlign("client");
    obj.Cor_12:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_12:setName("Cor_12");
    obj.Cor_12:setHorzTextAlign("center");
    obj.Cor_12:setVertTextAlign("center");
    obj.Cor_12:setText("12");
    obj.Cor_12:setFontColor("#ffffff");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.flowLayout1);
    obj.layout20:setAlign("top");
    obj.layout20:setMargins({top=2, left=2});
    obj.layout20:setWidth(20);
    obj.layout20:setHeight(20);
    obj.layout20:setName("layout20");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout20);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("#ff00ff");
    obj.rectangle14:setName("rectangle14");

    obj.Cor_13 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_13:setParent(obj.rectangle14);
    obj.Cor_13:setAlign("client");
    obj.Cor_13:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_13:setName("Cor_13");
    obj.Cor_13:setHorzTextAlign("center");
    obj.Cor_13:setVertTextAlign("center");
    obj.Cor_13:setText("13");
    obj.Cor_13:setFontColor("#000000");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.flowLayout1);
    obj.layout21:setAlign("top");
    obj.layout21:setMargins({top=2, left=2});
    obj.layout21:setWidth(20);
    obj.layout21:setHeight(20);
    obj.layout21:setName("layout21");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout21);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("#7f7f7f");
    obj.rectangle15:setName("rectangle15");

    obj.Cor_14 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_14:setParent(obj.rectangle15);
    obj.Cor_14:setAlign("client");
    obj.Cor_14:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_14:setName("Cor_14");
    obj.Cor_14:setHorzTextAlign("center");
    obj.Cor_14:setVertTextAlign("center");
    obj.Cor_14:setText("14");
    obj.Cor_14:setFontColor("#000000");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.flowLayout1);
    obj.layout22:setAlign("top");
    obj.layout22:setMargins({top=2, left=2});
    obj.layout22:setWidth(20);
    obj.layout22:setHeight(20);
    obj.layout22:setName("layout22");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout22);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("#3f3f3f");
    obj.rectangle16:setName("rectangle16");

    obj.Cor_15 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_15:setParent(obj.rectangle16);
    obj.Cor_15:setAlign("client");
    obj.Cor_15:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_15:setName("Cor_15");
    obj.Cor_15:setHorzTextAlign("center");
    obj.Cor_15:setVertTextAlign("center");
    obj.Cor_15:setText("15");
    obj.Cor_15:setFontColor("#FFFFFF");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.flowLayout1);
    obj.layout23:setAlign("top");
    obj.layout23:setMargins({top=2, left=2});
    obj.layout23:setWidth(20);
    obj.layout23:setHeight(20);
    obj.layout23:setName("layout23");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout23);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("#0f0f0f");
    obj.rectangle17:setName("rectangle17");

    obj.Cor_16 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_16:setParent(obj.rectangle17);
    obj.Cor_16:setAlign("client");
    obj.Cor_16:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_16:setName("Cor_16");
    obj.Cor_16:setHorzTextAlign("center");
    obj.Cor_16:setVertTextAlign("center");
    obj.Cor_16:setText("16");
    obj.Cor_16:setFontColor("#FFFFFF");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.flowLayout1);
    obj.layout24:setAlign("top");
    obj.layout24:setMargins({top=2, left=2});
    obj.layout24:setWidth(20);
    obj.layout24:setHeight(20);
    obj.layout24:setName("layout24");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout24);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("#1f1f1f");
    obj.rectangle18:setName("rectangle18");

    obj.Cor_17 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_17:setParent(obj.rectangle18);
    obj.Cor_17:setAlign("client");
    obj.Cor_17:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_17:setName("Cor_17");
    obj.Cor_17:setHorzTextAlign("center");
    obj.Cor_17:setVertTextAlign("center");
    obj.Cor_17:setText("17");
    obj.Cor_17:setFontColor("#FFFFFF");

    obj.layout25 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.flowLayout1);
    obj.layout25:setAlign("top");
    obj.layout25:setMargins({top=2, left=2});
    obj.layout25:setWidth(20);
    obj.layout25:setHeight(20);
    obj.layout25:setName("layout25");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout25);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("#777777");
    obj.rectangle19:setName("rectangle19");

    obj.Cor_18 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_18:setParent(obj.rectangle19);
    obj.Cor_18:setAlign("client");
    obj.Cor_18:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_18:setName("Cor_18");
    obj.Cor_18:setHorzTextAlign("center");
    obj.Cor_18:setVertTextAlign("center");
    obj.Cor_18:setText("18");
    obj.Cor_18:setFontColor("#000000");

    obj.layout26 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.flowLayout1);
    obj.layout26:setAlign("top");
    obj.layout26:setMargins({top=2, left=2});
    obj.layout26:setWidth(20);
    obj.layout26:setHeight(20);
    obj.layout26:setName("layout26");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout26);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("#111111");
    obj.rectangle20:setName("rectangle20");

    obj.Cor_19 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_19:setParent(obj.rectangle20);
    obj.Cor_19:setAlign("client");
    obj.Cor_19:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_19:setName("Cor_19");
    obj.Cor_19:setHorzTextAlign("center");
    obj.Cor_19:setVertTextAlign("center");
    obj.Cor_19:setText("19");
    obj.Cor_19:setFontColor("#FFFFFF");

    obj.layout27 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.flowLayout1);
    obj.layout27:setAlign("top");
    obj.layout27:setMargins({top=2, left=2});
    obj.layout27:setWidth(20);
    obj.layout27:setHeight(20);
    obj.layout27:setName("layout27");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout27);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("#292929");
    obj.rectangle21:setName("rectangle21");

    obj.Cor_20 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_20:setParent(obj.rectangle21);
    obj.Cor_20:setAlign("client");
    obj.Cor_20:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_20:setName("Cor_20");
    obj.Cor_20:setHorzTextAlign("center");
    obj.Cor_20:setVertTextAlign("center");
    obj.Cor_20:setText("20");
    obj.Cor_20:setFontColor("#FFFFFF");

    obj.layout28 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.flowLayout1);
    obj.layout28:setAlign("top");
    obj.layout28:setMargins({top=2, left=2});
    obj.layout28:setWidth(20);
    obj.layout28:setHeight(20);
    obj.layout28:setName("layout28");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout28);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("#191200");
    obj.rectangle22:setName("rectangle22");

    obj.Cor_21 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_21:setParent(obj.rectangle22);
    obj.Cor_21:setAlign("client");
    obj.Cor_21:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_21:setName("Cor_21");
    obj.Cor_21:setHorzTextAlign("center");
    obj.Cor_21:setVertTextAlign("center");
    obj.Cor_21:setText("21");
    obj.Cor_21:setFontColor("#FFFFFF");

    obj.layout29 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.flowLayout1);
    obj.layout29:setAlign("top");
    obj.layout29:setMargins({top=2, left=2});
    obj.layout29:setWidth(20);
    obj.layout29:setHeight(20);
    obj.layout29:setName("layout29");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout29);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("#6699ff");
    obj.rectangle23:setName("rectangle23");

    obj.Cor_22 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_22:setParent(obj.rectangle23);
    obj.Cor_22:setAlign("client");
    obj.Cor_22:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_22:setName("Cor_22");
    obj.Cor_22:setHorzTextAlign("center");
    obj.Cor_22:setVertTextAlign("center");
    obj.Cor_22:setText("22");
    obj.Cor_22:setFontColor("#000000");

    obj.layout30 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.flowLayout1);
    obj.layout30:setAlign("top");
    obj.layout30:setMargins({top=2, left=2});
    obj.layout30:setWidth(20);
    obj.layout30:setHeight(20);
    obj.layout30:setName("layout30");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout30);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("#f2b440");
    obj.rectangle24:setName("rectangle24");

    obj.Cor_23 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_23:setParent(obj.rectangle24);
    obj.Cor_23:setAlign("client");
    obj.Cor_23:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_23:setName("Cor_23");
    obj.Cor_23:setHorzTextAlign("center");
    obj.Cor_23:setVertTextAlign("center");
    obj.Cor_23:setText("23");
    obj.Cor_23:setFontColor("#000000");

    obj.layout31 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.flowLayout1);
    obj.layout31:setAlign("top");
    obj.layout31:setMargins({top=2, left=2});
    obj.layout31:setWidth(20);
    obj.layout31:setHeight(20);
    obj.layout31:setName("layout31");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout31);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("#d45252");
    obj.rectangle25:setName("rectangle25");

    obj.Cor_24 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_24:setParent(obj.rectangle25);
    obj.Cor_24:setAlign("client");
    obj.Cor_24:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_24:setName("Cor_24");
    obj.Cor_24:setHorzTextAlign("center");
    obj.Cor_24:setVertTextAlign("center");
    obj.Cor_24:setText("24");
    obj.Cor_24:setFontColor("#000000");

    obj.layout32 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.flowLayout1);
    obj.layout32:setAlign("top");
    obj.layout32:setMargins({top=2, left=2});
    obj.layout32:setWidth(20);
    obj.layout32:setHeight(20);
    obj.layout32:setName("layout32");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout32);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("#d396dc");
    obj.rectangle26:setName("rectangle26");

    obj.Cor_25 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_25:setParent(obj.rectangle26);
    obj.Cor_25:setAlign("client");
    obj.Cor_25:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_25:setName("Cor_25");
    obj.Cor_25:setHorzTextAlign("center");
    obj.Cor_25:setVertTextAlign("center");
    obj.Cor_25:setText("25");
    obj.Cor_25:setFontColor("#000000");

    obj.layout33 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.flowLayout1);
    obj.layout33:setAlign("top");
    obj.layout33:setMargins({top=2, left=2});
    obj.layout33:setWidth(20);
    obj.layout33:setHeight(20);
    obj.layout33:setName("layout33");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout33);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("#f47193");
    obj.rectangle27:setName("rectangle27");

    obj.Cor_26 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_26:setParent(obj.rectangle27);
    obj.Cor_26:setAlign("client");
    obj.Cor_26:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_26:setName("Cor_26");
    obj.Cor_26:setHorzTextAlign("center");
    obj.Cor_26:setVertTextAlign("center");
    obj.Cor_26:setText("26");
    obj.Cor_26:setFontColor("#000000");

    obj.layout34 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.flowLayout1);
    obj.layout34:setAlign("top");
    obj.layout34:setMargins({top=2, left=2});
    obj.layout34:setWidth(20);
    obj.layout34:setHeight(20);
    obj.layout34:setName("layout34");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout34);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("#6cecb3");
    obj.rectangle28:setName("rectangle28");

    obj.Cor_27 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_27:setParent(obj.rectangle28);
    obj.Cor_27:setAlign("client");
    obj.Cor_27:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_27:setName("Cor_27");
    obj.Cor_27:setHorzTextAlign("center");
    obj.Cor_27:setVertTextAlign("center");
    obj.Cor_27:setText("27");
    obj.Cor_27:setFontColor("#000000");

    obj.layout35 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.flowLayout1);
    obj.layout35:setAlign("top");
    obj.layout35:setMargins({top=2, left=2});
    obj.layout35:setWidth(20);
    obj.layout35:setHeight(20);
    obj.layout35:setName("layout35");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout35);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("#e54c27");
    obj.rectangle29:setName("rectangle29");

    obj.Cor_28 = GUI.fromHandle(_obj_newObject("label"));
    obj.Cor_28:setParent(obj.rectangle29);
    obj.Cor_28:setAlign("client");
    obj.Cor_28:setMargins({top=2, bottom=2, left=2, right=2});
    obj.Cor_28:setName("Cor_28");
    obj.Cor_28:setHorzTextAlign("center");
    obj.Cor_28:setVertTextAlign("center");
    obj.Cor_28:setText("28");
    obj.Cor_28:setFontColor("#000000");

    obj.layout36 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.MenuCor);
    obj.layout36:setAlign("bottom");
    obj.layout36:setHeight(24);
    obj.layout36:setMargins({bottom=8});
    obj.layout36:setName("layout36");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout36);
    obj.button1:setAlign("right");
    obj.button1:setText("Ok!");
    obj.button1:setMargins({right=4});
    obj.button1:setName("button1");

    obj.layout37 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.MensagemPopup);
    obj.layout37:setAlign("top");
    obj.layout37:setHeight(128);
    obj.layout37:setMargins({top=4});
    obj.layout37:setName("layout37");

    obj.layout38 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout37);
    obj.layout38:setAlign("top");
    obj.layout38:setHeight(18);
    obj.layout38:setMargins({left=8});
    obj.layout38:setName("layout38");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout38);
    obj.label4:setAlign("left");
    obj.label4:setFontSize(12);
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setAutoSize(true);
    obj.label4:setText("Mensagem");
    obj.label4:setName("label4");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout38);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setField("ShowNome");
    obj.comboBox1:setFontColor("white");
    obj.comboBox1:setFontSize(12);
    obj.comboBox1:setItems({'Texto', 'Narração', 'Avatar', 'Mostrar Nome', 'Nome e Avatar'});
    obj.comboBox1:setValues({'0', '1', '2', '3', '4'});
    obj.comboBox1:setText("Texto");
    obj.comboBox1:setWidth(118);
    obj.comboBox1:setVertTextAlign("trailing");
    obj.comboBox1:setMargins({left=10});
    obj.comboBox1:setName("comboBox1");

    obj.layout39 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout38);
    obj.layout39:setAlign("left");
    obj.layout39:setWidth(132);
    obj.layout39:setMargins({left=6});
    obj.layout39:setName("layout39");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout39);
    obj.label5:setFontColor("white");
    obj.label5:setAlign("left");
    obj.label5:setFontSize(12);
    obj.label5:setAutoSize(true);
    obj.label5:setMargins({top=2});
    obj.label5:setText("Cor do Texto:");
    obj.label5:setName("label5");

    obj.CorP = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.CorP:setParent(obj.layout39);
    obj.CorP:setAlign("left");
    obj.CorP:setName("CorP");
    obj.CorP:setField("CorP");
    obj.CorP:setMargins({left=8, right=4});
    obj.CorP:setWidth(48);
    obj.CorP:setFontColor("white");
    obj.CorP:setItems({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28'});
    obj.CorP:setValues({'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28'});
    obj.CorP:setValue("1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout38);
    obj.button2:setAlign("right");
    obj.button2:setText("Cores...");
    obj.button2:setWidth(64);
    obj.button2:setMargins({right=4});
    obj.button2:setName("button2");

    obj.TextoMensagem = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.TextoMensagem:setParent(obj.layout37);
    obj.TextoMensagem:setAlign("client");
    obj.TextoMensagem:setFontSize(12);
    obj.TextoMensagem:setName("TextoMensagem");
    obj.TextoMensagem:setField("TextoMensagem");
    obj.TextoMensagem:setMargins({left=4, right=4, top=4, bottom=4});

    obj.layout40 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout37);
    obj.layout40:setAlign("bottom");
    obj.layout40:setHeight(20);
    obj.layout40:setMargins({bottom=4, top=4});
    obj.layout40:setName("layout40");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout40);
    obj.label6:setAlign("left");
    obj.label6:setWidth(100);
    obj.label6:setFontSize(12);
    obj.label6:setText("Formatar:");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setMargins({left=8});
    obj.label6:setName("label6");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout40);
    obj.button3:setAlign("right");
    obj.button3:setWidth(48);
    obj.button3:setText("Enter");
    obj.button3:setMargins({right=2});
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout40);
    obj.button4:setAlign("right");
    obj.button4:setWidth(60);
    obj.button4:setText("Limpar");
    obj.button4:setMargins({right=4});
    obj.button4:setName("button4");

    obj.layout41 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setAlign("right");
    obj.layout41:setWidth(132);
    obj.layout41:setName("layout41");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout41);
    obj.label7:setLeft(0);
    obj.label7:setFontColor("white");
    obj.label7:setFontSize(12);
    obj.label7:setAutoSize(true);
    obj.label7:setText("Aplicar Cor:");
    obj.label7:setName("label7");

    obj.CorN = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.CorN:setParent(obj.layout41);
    obj.CorN:setLeft(70);
    obj.CorN:setHeight(20);
    obj.CorN:setName("CorN");
    obj.CorN:setField("CorN");
    obj.CorN:setMargins({left=8});
    obj.CorN:setWidth(48);
    obj.CorN:setFontColor("white");
    obj.CorN:setItems({' ', '1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28'});
    obj.CorN:setValues({'0', '01','02','03','04','05','06','07','08','09','10','11','12','13','14','15','16','17','18','19','20','21','22','23','24','25','26','27','28'});
    obj.CorN:setValue("0");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout40);
    obj.dataLink14:setField("CorN");
    obj.dataLink14:setDefaultValue("0");
    obj.dataLink14:setName("dataLink14");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout40);
    obj.button5:setAlign("right");
    obj.button5:setWidth(20);
    lfm_setPropAsString(obj.button5, "fontStyle",  "bold");
    obj.button5:setText("B");
    obj.button5:setMargins({right=2});
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout40);
    obj.button6:setAlign("right");
    obj.button6:setWidth(20);
    lfm_setPropAsString(obj.button6, "fontStyle",  "italic");
    obj.button6:setText("I");
    obj.button6:setMargins({right=2});
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout40);
    obj.button7:setAlign("right");
    obj.button7:setWidth(20);
    lfm_setPropAsString(obj.button7, "fontStyle",  "underline");
    obj.button7:setText("U");
    obj.button7:setMargins({right=2});
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout40);
    obj.button8:setAlign("right");
    obj.button8:setWidth(20);
    lfm_setPropAsString(obj.button8, "fontStyle",  "strikeout");
    obj.button8:setText("S");
    obj.button8:setMargins({right=2});
    obj.button8:setName("button8");

    obj.layout42 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.MensagemPopup);
    obj.layout42:setAlign("bottom");
    obj.layout42:setHeight(60);
    obj.layout42:setMargins({top=4});
    obj.layout42:setName("layout42");

    obj.layout43 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout42);
    obj.layout43:setAlign("left");
    obj.layout43:setWidth(80);
    obj.layout43:setMargins({left=4});
    obj.layout43:setName("layout43");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout43);
    obj.label8:setAlign("top");
    obj.label8:setHeight(18);
    obj.label8:setFontSize(12);
    obj.label8:setMargins({left=8});
    obj.label8:setText("Rolagem");
    obj.label8:setName("label8");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout43);
    obj.edit1:setAlign("top");
    obj.edit1:setHeight(22);
    obj.edit1:setFontSize(12);
    obj.edit1:setMargins({left=4, right=4, top=4, bottom=4});
    obj.edit1:setField("TextoRolagem");
    obj.edit1:setName("edit1");

    obj.layout44 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout42);
    obj.layout44:setAlign("left");
    obj.layout44:setWidth(180);
    obj.layout44:setMargins({left=4});
    obj.layout44:setName("layout44");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout44);
    obj.label9:setAlign("top");
    obj.label9:setHeight(18);
    obj.label9:setFontSize(12);
    obj.label9:setMargins({left=8});
    obj.label9:setText("Nome da Rolagem");
    obj.label9:setName("label9");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout44);
    obj.edit2:setAlign("top");
    obj.edit2:setHeight(22);
    obj.edit2:setFontSize(12);
    obj.edit2:setMargins({left=4, right=4, top=4, bottom=4});
    obj.edit2:setField("NomeRolagem");
    obj.edit2:setName("edit2");

    obj.layout45 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout42);
    obj.layout45:setAlign("client");
    obj.layout45:setMargins({left=4, right=4});
    obj.layout45:setName("layout45");

    obj.button9 = GUI.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout45);
    obj.button9:setAlign("top");
    obj.button9:setHeight(22);
    obj.button9:setFontSize(12);
    obj.button9:setMargins({left=4, right=4});
    obj.button9:setText("Enviar Mensagem");
    obj.button9:setName("button9");

    obj.button10 = GUI.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout45);
    obj.button10:setAlign("top");
    obj.button10:setHeight(22);
    obj.button10:setFontSize(12);
    obj.button10:setMargins({top=4, left=4, right=4});
    obj.button10:setText("Enviar Rolagem");
    obj.button10:setName("button10");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj);
    obj.dataLink15:setField("ShowNome");
    obj.dataLink15:setDefaultValue("1");
    obj.dataLink15:setName("dataLink15");

    obj.BarrinhaPopup = GUI.fromHandle(_obj_newObject("popup"));
    obj.BarrinhaPopup:setParent(obj);
    obj.BarrinhaPopup:setName("BarrinhaPopup");
    obj.BarrinhaPopup:setWidth(140);
    obj.BarrinhaPopup:setHeight(66);
    obj.BarrinhaPopup:setBackOpacity(0);
    obj.BarrinhaPopup:setMargins({left=4, right=4, top=4, bottom=4});
    lfm_setPropAsString(obj.BarrinhaPopup, "autoScopeNode",  "false");

    obj.rectangle30 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.BarrinhaPopup);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("white");
    obj.rectangle30:setXradius(5);
    obj.rectangle30:setYradius(5);
    obj.rectangle30:setName("rectangle30");

    obj.CorPopupBarrinhas = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorPopupBarrinhas:setParent(obj.rectangle30);
    obj.CorPopupBarrinhas:setAlign("client");
    obj.CorPopupBarrinhas:setName("CorPopupBarrinhas");
    obj.CorPopupBarrinhas:setColor("#808080");
    obj.CorPopupBarrinhas:setXradius(5);
    obj.CorPopupBarrinhas:setYradius(5);
    obj.CorPopupBarrinhas:setOpacity(0.9);

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.CorPopupBarrinhas);
    obj.label10:setFontColor("black");
    obj.label10:setMargins({left=6, top=2});
    obj.label10:setAlign("top");
    obj.label10:setText("Valor da Aba");
    obj.label10:setField("AtributoBarrinha");
    obj.label10:setFontSize(12);
    lfm_setPropAsString(obj.label10, "fontStyle",  "bold");
    obj.label10:setAutoSize(true);
    obj.label10:setName("label10");

    obj.layout46 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.CorPopupBarrinhas);
    obj.layout46:setAlign("client");
    obj.layout46:setMargins({top=2, left=4});
    obj.layout46:setName("layout46");

    obj.layout47 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout46);
    obj.layout47:setAlign("top");
    obj.layout47:setHeight(18);
    obj.layout47:setName("layout47");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout47);
    obj.label11:setFontColor("black");
    obj.label11:setAlign("left");
    obj.label11:setText("Atual:  ");
    obj.label11:setHorzTextAlign("trailing");
    obj.label11:setWidth(34);
    obj.label11:setMargins({right=2});
    obj.label11:setFontSize(12);
    obj.label11:setName("label11");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout47);
    obj.comboBox2:setFontColor("white");
    obj.comboBox2:setMargins({left=2});
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setTransparent(false);
    obj.comboBox2:setWidth(40);
    obj.comboBox2:setField("ModificadorBarrinha");
    obj.comboBox2:setItems({'=', '+', '-'});
    obj.comboBox2:setValues({'igual', 'mais', 'menos'});
    obj.comboBox2:setValue("igual");
    obj.comboBox2:setName("comboBox2");

    obj.ValorAtualBarrinha = GUI.fromHandle(_obj_newObject("edit"));
    obj.ValorAtualBarrinha:setParent(obj.layout47);
    obj.ValorAtualBarrinha:setFontColor("black");
    obj.ValorAtualBarrinha:setMargins({left=2, right=4});
    obj.ValorAtualBarrinha:setType("number");
    obj.ValorAtualBarrinha:setAlign("client");
    obj.ValorAtualBarrinha:setTransparent(true);
    obj.ValorAtualBarrinha:setField("ValorMudadoAtualBarrinha");
    obj.ValorAtualBarrinha:setName("ValorAtualBarrinha");

    obj.layout48 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout46);
    obj.layout48:setAlign("top");
    obj.layout48:setHeight(18);
    obj.layout48:setName("layout48");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout48);
    obj.label12:setFontColor("black");
    obj.label12:setAlign("left");
    obj.label12:setText("Max:  ");
    obj.label12:setHorzTextAlign("trailing");
    obj.label12:setWidth(34);
    obj.label12:setMargins({right=2});
    obj.label12:setFontSize(12);
    obj.label12:setName("label12");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout48);
    obj.comboBox3:setFontColor("white");
    obj.comboBox3:setMargins({left=2});
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setTransparent(false);
    obj.comboBox3:setWidth(40);
    obj.comboBox3:setField("ModificadorBarrinhaMax");
    obj.comboBox3:setItems({'=', '+', '-'});
    obj.comboBox3:setValues({'igual', 'mais', 'menos'});
    obj.comboBox3:setValue("igual");
    obj.comboBox3:setName("comboBox3");

    obj.ValorMaxBarrinha = GUI.fromHandle(_obj_newObject("edit"));
    obj.ValorMaxBarrinha:setParent(obj.layout48);
    obj.ValorMaxBarrinha:setFontColor("black");
    obj.ValorMaxBarrinha:setMargins({left=2, right=4});
    obj.ValorMaxBarrinha:setType("number");
    obj.ValorMaxBarrinha:setAlign("client");
    obj.ValorMaxBarrinha:setTransparent(true);
    obj.ValorMaxBarrinha:setField("ValorMudadoMaxBarrinha");
    obj.ValorMaxBarrinha:setName("ValorMaxBarrinha");

    obj.layout49 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj);
    obj.layout49:setAlign("client");
    obj.layout49:setName("layout49");

    obj.rectangle31 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout49);
    obj.rectangle31:setLeft(2);
    obj.rectangle31:setTop(2);
    obj.rectangle31:setWidth(104);
    obj.rectangle31:setHeight(104);
    obj.rectangle31:setColor("#111111");
    obj.rectangle31:setName("rectangle31");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout49);
    obj.image1:setLeft(2);
    obj.image1:setTop(2);
    obj.image1:setWidth(104);
    obj.image1:setHeight(104);
    obj.image1:setEditable(true);
    obj.image1:setOptimize(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setField("AvatarNPC");
    obj.image1:setName("image1");

    obj.layout50 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setLeft(107);
    obj.layout50:setTop(0);
    obj.layout50:setWidth(160);
    obj.layout50:setHeight(104);
    obj.layout50:setName("layout50");

    obj.imgApagar = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imgApagar:setParent(obj.layout50);
    obj.imgApagar:setTop(34);
    obj.imgApagar:setLeft(100);
    obj.imgApagar:setWidth(18);
    obj.imgApagar:setHeight(18);
    obj.imgApagar:setName("imgApagar");
    obj.imgApagar:setImageChecked("/ListaNPCsDock/images/delete.png");
    obj.imgApagar:setImageUnchecked("/ListaNPCsDock/images/delete.png");

    obj.imgFalar = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imgFalar:setParent(obj.layout50);
    obj.imgFalar:setTop(52);
    obj.imgFalar:setLeft(122);
    obj.imgFalar:setWidth(18);
    obj.imgFalar:setHeight(18);
    obj.imgFalar:setName("imgFalar");
    obj.imgFalar:setImageChecked("/ListaNPCsDock/images/voice.png");
    obj.imgFalar:setImageUnchecked("/ListaNPCsDock/images/voice.png");

    obj.imgBloquear = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imgBloquear:setParent(obj.layout50);
    obj.imgBloquear:setTop(32);
    obj.imgBloquear:setLeft(120);
    obj.imgBloquear:setWidth(18);
    obj.imgBloquear:setHeight(18);
    obj.imgBloquear:setName("imgBloquear");
    obj.imgBloquear:setField("imagemBloqueada");
    obj.imgBloquear:setImageChecked("/ListaNPCsDock/images/bloqueado.png");
    obj.imgBloquear:setImageUnchecked("/ListaNPCsDock/images/desbloqueado.png");

    obj.cbxInvisivel = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxInvisivel:setParent(obj.layout50);
    obj.cbxInvisivel:setTop(52);
    obj.cbxInvisivel:setLeft(140);
    obj.cbxInvisivel:setWidth(18);
    obj.cbxInvisivel:setHeight(18);
    obj.cbxInvisivel:setField("imagemInvisivel");
    obj.cbxInvisivel:setAutoChange(false);
    obj.cbxInvisivel:setName("cbxInvisivel");
    obj.cbxInvisivel:setImageChecked("/ListaNPCsDock/images/invisivel.png");
    obj.cbxInvisivel:setImageUnchecked("/ListaNPCsDock/images/visivel.png");

    obj.imgInfo = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imgInfo:setParent(obj.layout50);
    obj.imgInfo:setTop(32);
    obj.imgInfo:setLeft(142);
    obj.imgInfo:setWidth(18);
    obj.imgInfo:setHeight(18);
    obj.imgInfo:setName("imgInfo");
    obj.imgInfo:setImageChecked("/ListaNPCsDock/images/Info.png");
    obj.imgInfo:setImageUnchecked("/ListaNPCsDock/images/Info.png");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout50);
    obj.dataLink16:setField("imagemInvisivel");
    obj.dataLink16:setDefaultValue("false");
    obj.dataLink16:setName("dataLink16");

    obj.popupDetails = GUI.fromHandle(_obj_newObject("popup"));
    obj.popupDetails:setParent(obj.layout50);
    obj.popupDetails:setName("popupDetails");
    obj.popupDetails:setWidth(450);
    obj.popupDetails:setHeight(200);
    obj.popupDetails:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popupDetails, "autoScopeNode",  "false");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.popupDetails);
    obj.label13:setLeft(10);
    obj.label13:setTop(0);
    obj.label13:setWidth(150);
    obj.label13:setHeight(25);
    obj.label13:setText("Raça");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.popupDetails);
    obj.label14:setLeft(160);
    obj.label14:setTop(0);
    obj.label14:setWidth(280);
    obj.label14:setHeight(25);
    obj.label14:setText("Classe");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.popupDetails);
    obj.label15:setLeft(10);
    obj.label15:setTop(50);
    obj.label15:setWidth(125);
    obj.label15:setHeight(25);
    obj.label15:setText("Atitude");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.popupDetails);
    obj.label16:setLeft(135);
    obj.label16:setTop(50);
    obj.label16:setWidth(125);
    obj.label16:setHeight(25);
    obj.label16:setText("Relação");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.popupDetails);
    obj.label17:setLeft(260);
    obj.label17:setTop(50);
    obj.label17:setWidth(175);
    obj.label17:setHeight(25);
    obj.label17:setText("Comentarios");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.popupDetails);
    obj.label18:setLeft(10);
    obj.label18:setTop(100);
    obj.label18:setWidth(250);
    obj.label18:setHeight(25);
    obj.label18:setText("Descrição");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.popupDetails);
    obj.edit3:setLeft(10);
    obj.edit3:setTop(25);
    obj.edit3:setWidth(150);
    obj.edit3:setHeight(25);
    obj.edit3:setField("raca");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.popupDetails);
    obj.edit4:setLeft(160);
    obj.edit4:setTop(25);
    obj.edit4:setWidth(280);
    obj.edit4:setHeight(25);
    obj.edit4:setField("classe");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.popupDetails);
    obj.edit5:setLeft(10);
    obj.edit5:setTop(75);
    obj.edit5:setWidth(125);
    obj.edit5:setHeight(25);
    obj.edit5:setField("atitude");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.popupDetails);
    obj.edit6:setLeft(135);
    obj.edit6:setTop(75);
    obj.edit6:setWidth(125);
    obj.edit6:setHeight(25);
    obj.edit6:setField("relacao");
    obj.edit6:setName("edit6");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.popupDetails);
    obj.textEditor1:setLeft(260);
    obj.textEditor1:setTop(75);
    obj.textEditor1:setWidth(175);
    obj.textEditor1:setHeight(120);
    obj.textEditor1:setField("comentarios");
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.popupDetails);
    obj.textEditor2:setLeft(10);
    obj.textEditor2:setTop(125);
    obj.textEditor2:setWidth(250);
    obj.textEditor2:setHeight(70);
    obj.textEditor2:setField("descricao");
    obj.textEditor2:setName("textEditor2");

    obj.NomeGrandeBarrinha = GUI.fromHandle(_obj_newObject("edit"));
    obj.NomeGrandeBarrinha:setParent(obj.layout50);
    obj.NomeGrandeBarrinha:setAlign("none");
    obj.NomeGrandeBarrinha:setTop(0);
    obj.NomeGrandeBarrinha:setLeft(0);
    obj.NomeGrandeBarrinha:setWidth(155);
    obj.NomeGrandeBarrinha:setFontSize(11.5);
    obj.NomeGrandeBarrinha:setHeight(18);
    lfm_setPropAsString(obj.NomeGrandeBarrinha, "fontStyle",  "bold");
    obj.NomeGrandeBarrinha:setVertTextAlign("trailing");
    obj.NomeGrandeBarrinha:setField("NomeGrande");
    obj.NomeGrandeBarrinha:setTransparent(true);
    obj.NomeGrandeBarrinha:setName("NomeGrandeBarrinha");

    obj.layout51 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout50);
    obj.layout51:setTop(14);
    obj.layout51:setLeft(0);
    obj.layout51:setWidth(155);
    obj.layout51:setHeight(18);
    obj.layout51:setHitTest(true);
    obj.layout51:setName("layout51");

    obj.NomePequenoBarrinha = GUI.fromHandle(_obj_newObject("edit"));
    obj.NomePequenoBarrinha:setParent(obj.layout51);
    obj.NomePequenoBarrinha:setAlign("client");
    obj.NomePequenoBarrinha:setFontSize(11.5);
    obj.NomePequenoBarrinha:setField("NomePequeno");
    obj.NomePequenoBarrinha:setVertTextAlign("trailing");
    lfm_setPropAsString(obj.NomePequenoBarrinha, "fontStyle",  "bold");
    obj.NomePequenoBarrinha:setName("NomePequenoBarrinha");
    obj.NomePequenoBarrinha:setEnabled(false);
    obj.NomePequenoBarrinha:setPadding({left=4, right=4, bottom=4, top=4});
    obj.NomePequenoBarrinha:setTransparent(true);

    obj.path2 = GUI.fromHandle(_obj_newObject("path"));
    obj.path2:setParent(obj.layout51);
    obj.path2:setAlign("right");
    obj.path2:setWidth(18);
    obj.path2:setMargins({left=4, right=4, bottom=6, top=4});
    obj.path2:setColor("orange");
    obj.path2:setPathData("M 100 100 L 300 100 L 200 300 z");
    obj.path2:setHitTest(true);
    obj.path2:setName("path2");

    obj.layout52 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout50);
    obj.layout52:setLeft(3);
    obj.layout52:setTop(32);
    obj.layout52:setHeight(8);
    obj.layout52:setWidth(64);
    obj.layout52:setName("layout52");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout52);
    obj.imageCheckBox1:setAlign("client");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.Barrinha1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha1:setParent(obj.imageCheckBox1);
    obj.Barrinha1:setColorMode("hl");
    obj.Barrinha1:setWidth(64);
    obj.Barrinha1:setHeight(8);
    obj.Barrinha1:setHitTest(true);
    obj.Barrinha1:setMouseGlow(true);
    obj.Barrinha1:setColor("#808080");
    obj.Barrinha1:setName("Barrinha1");
    obj.Barrinha1:setField("Barrinha1Valor");
    obj.Barrinha1:setFieldMax("Barrinha1ValorMax");

    obj.ValoresBarrinha1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha1:setParent(obj.layout50);
    obj.ValoresBarrinha1:setLeft(69);
    obj.ValoresBarrinha1:setTop(29);
    obj.ValoresBarrinha1:setWidth(90);
    obj.ValoresBarrinha1:setHeight(14);
    obj.ValoresBarrinha1:setVisible(false);
    obj.ValoresBarrinha1:setName("ValoresBarrinha1");

    obj.CorBarrinha1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha1:setParent(obj.ValoresBarrinha1);
    obj.CorBarrinha1:setAlign("client");
    obj.CorBarrinha1:setXradius(2);
    obj.CorBarrinha1:setYradius(2);
    obj.CorBarrinha1:setName("CorBarrinha1");
    obj.CorBarrinha1:setColor("green");

    obj.InfoBarrinha1 = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha1:setParent(obj.CorBarrinha1);
    obj.InfoBarrinha1:setAlign("left");
    obj.InfoBarrinha1:setFontColor("white");
    obj.InfoBarrinha1:setFontSize(12);
    obj.InfoBarrinha1:setAutoSize(true);
    obj.InfoBarrinha1:setTextTrimming("none");
    obj.InfoBarrinha1:setWordWrap(false);
    obj.InfoBarrinha1:setName("InfoBarrinha1");
    obj.InfoBarrinha1:setField("InfoBarrinha1");
    obj.InfoBarrinha1:setHorzTextAlign("center");
    obj.InfoBarrinha1:setText("0/0");

    obj.InfoBarrinha1Oculto = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha1Oculto:setParent(obj.CorBarrinha1);
    obj.InfoBarrinha1Oculto:setAlign("client");
    obj.InfoBarrinha1Oculto:setFontColor("white");
    obj.InfoBarrinha1Oculto:setFontSize(12);
    obj.InfoBarrinha1Oculto:setAutoSize(true);
    obj.InfoBarrinha1Oculto:setTextTrimming("none");
    obj.InfoBarrinha1Oculto:setWordWrap(false);
    obj.InfoBarrinha1Oculto:setName("InfoBarrinha1Oculto");
    obj.InfoBarrinha1Oculto:setVisible(false);
    obj.InfoBarrinha1Oculto:setField("InfoBarrinha1Oculto");
    obj.InfoBarrinha1Oculto:setHorzTextAlign("center");
    obj.InfoBarrinha1Oculto:setText("??/??");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout50);
    obj.dataLink17:setField("Barrinha1Invisivel");
    obj.dataLink17:setDefaultValue("false");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout50);
    obj.dataLink18:setField("CorBarrinha1");
    obj.dataLink18:setDefaultValue("#808080");
    obj.dataLink18:setName("dataLink18");

    obj.layout53 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout50);
    obj.layout53:setLeft(3);
    obj.layout53:setTop(42);
    obj.layout53:setHeight(8);
    obj.layout53:setWidth(64);
    obj.layout53:setName("layout53");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.layout53);
    obj.imageCheckBox2:setAlign("client");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.Barrinha2 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha2:setParent(obj.imageCheckBox2);
    obj.Barrinha2:setColorMode("hl");
    obj.Barrinha2:setWidth(64);
    obj.Barrinha2:setHeight(8);
    obj.Barrinha2:setHitTest(true);
    obj.Barrinha2:setMouseGlow(true);
    obj.Barrinha2:setColor("#808080");
    obj.Barrinha2:setName("Barrinha2");
    obj.Barrinha2:setField("Barrinha2Valor");
    obj.Barrinha2:setFieldMax("Barrinha2ValorMax");

    obj.ValoresBarrinha2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha2:setParent(obj.layout50);
    obj.ValoresBarrinha2:setLeft(69);
    obj.ValoresBarrinha2:setTop(39);
    obj.ValoresBarrinha2:setWidth(90);
    obj.ValoresBarrinha2:setHeight(14);
    obj.ValoresBarrinha2:setVisible(false);
    obj.ValoresBarrinha2:setName("ValoresBarrinha2");

    obj.CorBarrinha2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha2:setParent(obj.ValoresBarrinha2);
    obj.CorBarrinha2:setAlign("client");
    obj.CorBarrinha2:setXradius(2);
    obj.CorBarrinha2:setYradius(2);
    obj.CorBarrinha2:setName("CorBarrinha2");
    obj.CorBarrinha2:setColor("green");

    obj.InfoBarrinha2 = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha2:setParent(obj.CorBarrinha2);
    obj.InfoBarrinha2:setAlign("left");
    obj.InfoBarrinha2:setFontColor("white");
    obj.InfoBarrinha2:setFontSize(12);
    obj.InfoBarrinha2:setAutoSize(true);
    obj.InfoBarrinha2:setTextTrimming("none");
    obj.InfoBarrinha2:setWordWrap(false);
    obj.InfoBarrinha2:setName("InfoBarrinha2");
    obj.InfoBarrinha2:setField("InfoBarrinha2");
    obj.InfoBarrinha2:setHorzTextAlign("center");
    obj.InfoBarrinha2:setText("0/0");

    obj.InfoBarrinha2Oculto = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha2Oculto:setParent(obj.CorBarrinha2);
    obj.InfoBarrinha2Oculto:setAlign("client");
    obj.InfoBarrinha2Oculto:setFontColor("white");
    obj.InfoBarrinha2Oculto:setFontSize(12);
    obj.InfoBarrinha2Oculto:setAutoSize(true);
    obj.InfoBarrinha2Oculto:setTextTrimming("none");
    obj.InfoBarrinha2Oculto:setWordWrap(false);
    obj.InfoBarrinha2Oculto:setName("InfoBarrinha2Oculto");
    obj.InfoBarrinha2Oculto:setVisible(false);
    obj.InfoBarrinha2Oculto:setField("InfoBarrinha2Oculto");
    obj.InfoBarrinha2Oculto:setHorzTextAlign("center");
    obj.InfoBarrinha2Oculto:setText("??/??");

    obj.dataLink19 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout50);
    obj.dataLink19:setField("Barrinha2Invisivel");
    obj.dataLink19:setDefaultValue("false");
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout50);
    obj.dataLink20:setField("CorBarrinha2");
    obj.dataLink20:setDefaultValue("#808080");
    obj.dataLink20:setName("dataLink20");

    obj.layout54 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout50);
    obj.layout54:setLeft(3);
    obj.layout54:setTop(52);
    obj.layout54:setHeight(8);
    obj.layout54:setWidth(64);
    obj.layout54:setName("layout54");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.layout54);
    obj.imageCheckBox3:setAlign("client");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.Barrinha3 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha3:setParent(obj.imageCheckBox3);
    obj.Barrinha3:setColorMode("hl");
    obj.Barrinha3:setWidth(64);
    obj.Barrinha3:setHeight(8);
    obj.Barrinha3:setHitTest(true);
    obj.Barrinha3:setMouseGlow(true);
    obj.Barrinha3:setColor("#808080");
    obj.Barrinha3:setName("Barrinha3");
    obj.Barrinha3:setField("Barrinha3Valor");
    obj.Barrinha3:setFieldMax("Barrinha3ValorMax");

    obj.ValoresBarrinha3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha3:setParent(obj.layout50);
    obj.ValoresBarrinha3:setLeft(69);
    obj.ValoresBarrinha3:setTop(49);
    obj.ValoresBarrinha3:setWidth(90);
    obj.ValoresBarrinha3:setHeight(14);
    obj.ValoresBarrinha3:setVisible(false);
    obj.ValoresBarrinha3:setName("ValoresBarrinha3");

    obj.CorBarrinha3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha3:setParent(obj.ValoresBarrinha3);
    obj.CorBarrinha3:setAlign("client");
    obj.CorBarrinha3:setXradius(2);
    obj.CorBarrinha3:setYradius(2);
    obj.CorBarrinha3:setName("CorBarrinha3");
    obj.CorBarrinha3:setColor("green");

    obj.InfoBarrinha3 = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha3:setParent(obj.CorBarrinha3);
    obj.InfoBarrinha3:setAlign("left");
    obj.InfoBarrinha3:setFontColor("white");
    obj.InfoBarrinha3:setFontSize(12);
    obj.InfoBarrinha3:setAutoSize(true);
    obj.InfoBarrinha3:setTextTrimming("none");
    obj.InfoBarrinha3:setWordWrap(false);
    obj.InfoBarrinha3:setName("InfoBarrinha3");
    obj.InfoBarrinha3:setField("InfoBarrinha3");
    obj.InfoBarrinha3:setHorzTextAlign("center");
    obj.InfoBarrinha3:setText("0/0");

    obj.InfoBarrinha3Oculto = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha3Oculto:setParent(obj.CorBarrinha3);
    obj.InfoBarrinha3Oculto:setAlign("client");
    obj.InfoBarrinha3Oculto:setFontColor("white");
    obj.InfoBarrinha3Oculto:setFontSize(12);
    obj.InfoBarrinha3Oculto:setAutoSize(true);
    obj.InfoBarrinha3Oculto:setTextTrimming("none");
    obj.InfoBarrinha3Oculto:setWordWrap(false);
    obj.InfoBarrinha3Oculto:setName("InfoBarrinha3Oculto");
    obj.InfoBarrinha3Oculto:setVisible(false);
    obj.InfoBarrinha3Oculto:setField("InfoBarrinha3Oculto");
    obj.InfoBarrinha3Oculto:setHorzTextAlign("center");
    obj.InfoBarrinha3Oculto:setText("??/??");

    obj.dataLink21 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout50);
    obj.dataLink21:setField("Barrinha3Invisivel");
    obj.dataLink21:setDefaultValue("false");
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout50);
    obj.dataLink22:setField("CorBarrinha3");
    obj.dataLink22:setDefaultValue("#808080");
    obj.dataLink22:setName("dataLink22");

    obj.layout55 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout50);
    obj.layout55:setLeft(3);
    obj.layout55:setTop(62);
    obj.layout55:setHeight(8);
    obj.layout55:setWidth(64);
    obj.layout55:setName("layout55");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.layout55);
    obj.imageCheckBox4:setAlign("client");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.Barrinha4 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.Barrinha4:setParent(obj.imageCheckBox4);
    obj.Barrinha4:setColorMode("hl");
    obj.Barrinha4:setWidth(64);
    obj.Barrinha4:setHeight(8);
    obj.Barrinha4:setHitTest(true);
    obj.Barrinha4:setMouseGlow(true);
    obj.Barrinha4:setColor("#808080");
    obj.Barrinha4:setName("Barrinha4");
    obj.Barrinha4:setField("Barrinha4Valor");
    obj.Barrinha4:setFieldMax("Barrinha4ValorMax");

    obj.ValoresBarrinha4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.ValoresBarrinha4:setParent(obj.layout50);
    obj.ValoresBarrinha4:setLeft(69);
    obj.ValoresBarrinha4:setTop(59);
    obj.ValoresBarrinha4:setWidth(90);
    obj.ValoresBarrinha4:setHeight(14);
    obj.ValoresBarrinha4:setVisible(false);
    obj.ValoresBarrinha4:setName("ValoresBarrinha4");

    obj.CorBarrinha4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.CorBarrinha4:setParent(obj.ValoresBarrinha4);
    obj.CorBarrinha4:setAlign("client");
    obj.CorBarrinha4:setXradius(2);
    obj.CorBarrinha4:setYradius(2);
    obj.CorBarrinha4:setName("CorBarrinha4");
    obj.CorBarrinha4:setColor("green");

    obj.InfoBarrinha4 = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha4:setParent(obj.CorBarrinha4);
    obj.InfoBarrinha4:setAlign("left");
    obj.InfoBarrinha4:setFontColor("white");
    obj.InfoBarrinha4:setFontSize(12);
    obj.InfoBarrinha4:setAutoSize(true);
    obj.InfoBarrinha4:setTextTrimming("none");
    obj.InfoBarrinha4:setWordWrap(false);
    obj.InfoBarrinha4:setName("InfoBarrinha4");
    obj.InfoBarrinha4:setField("InfoBarrinha4");
    obj.InfoBarrinha4:setHorzTextAlign("center");
    obj.InfoBarrinha4:setText("0/0");

    obj.InfoBarrinha4Oculto = GUI.fromHandle(_obj_newObject("label"));
    obj.InfoBarrinha4Oculto:setParent(obj.CorBarrinha4);
    obj.InfoBarrinha4Oculto:setAlign("client");
    obj.InfoBarrinha4Oculto:setFontColor("white");
    obj.InfoBarrinha4Oculto:setFontSize(12);
    obj.InfoBarrinha4Oculto:setAutoSize(true);
    obj.InfoBarrinha4Oculto:setTextTrimming("none");
    obj.InfoBarrinha4Oculto:setWordWrap(false);
    obj.InfoBarrinha4Oculto:setName("InfoBarrinha4Oculto");
    obj.InfoBarrinha4Oculto:setVisible(false);
    obj.InfoBarrinha4Oculto:setField("InfoBarrinha4Oculto");
    obj.InfoBarrinha4Oculto:setHorzTextAlign("center");
    obj.InfoBarrinha4Oculto:setText("??/??");

    obj.dataLink23 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout50);
    obj.dataLink23:setField("Barrinha4Invisivel");
    obj.dataLink23:setDefaultValue("false");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout50);
    obj.dataLink24:setField("CorBarrinha4");
    obj.dataLink24:setDefaultValue("#808080");
    obj.dataLink24:setName("dataLink24");

    obj.Linha1Barrinha = GUI.fromHandle(_obj_newObject("edit"));
    obj.Linha1Barrinha:setParent(obj.layout50);
    obj.Linha1Barrinha:setTop(71);
    obj.Linha1Barrinha:setLeft(0);
    obj.Linha1Barrinha:setWidth(155);
    obj.Linha1Barrinha:setHeight(18);
    obj.Linha1Barrinha:setFontSize(12);
    obj.Linha1Barrinha:setFontColor("#999999");
    obj.Linha1Barrinha:setVertTextAlign("trailing");
    obj.Linha1Barrinha:setText("<linha>");
    obj.Linha1Barrinha:setField("Linha1");
    obj.Linha1Barrinha:setTransparent(true);
    obj.Linha1Barrinha:setName("Linha1Barrinha");

    obj.Linha2Barrinha = GUI.fromHandle(_obj_newObject("edit"));
    obj.Linha2Barrinha:setParent(obj.layout50);
    obj.Linha2Barrinha:setTop(85);
    obj.Linha2Barrinha:setLeft(0);
    obj.Linha2Barrinha:setWidth(155);
    obj.Linha2Barrinha:setHeight(18);
    obj.Linha2Barrinha:setFontSize(12);
    obj.Linha2Barrinha:setFontColor("#999999");
    obj.Linha2Barrinha:setVertTextAlign("trailing");
    obj.Linha2Barrinha:setField("Linha2");
    obj.Linha2Barrinha:setText("<linha>");
    obj.Linha2Barrinha:setTransparent(true);
    obj.Linha2Barrinha:setName("Linha2Barrinha");

    obj.dataLink25 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj);
    obj.dataLink25:setField("CorP");
    obj.dataLink25:setDefaultValue("1");
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj);
    obj.dataLink26:setFields({'Aberto1'});
    obj.dataLink26:setDefaultValues({false});
    obj.dataLink26:setName("dataLink26");

    obj._e_event0 = obj:addEventListener("onScopeNodeChanged",
        function (_)
            if self.observer ~= nil then   
            			self.observer.enabled = false;
            			self.observer = nil;
                    end;
            		
            		if sheet ~= nil then   
            			self.observer = ndb.newObserver(sheet);
            			self.observer.onPermissionListChanged =
            				function(node)                 
            						self:atualizarCbxInvisivel();
            				end;                               
            
            			self.observer.onFinalPermissionsCouldBeChanged =
            				function(node)
            						self:atualizarCbxInvisivel();
            				end;                               
            
            			self:setarNPC();
            			self:atualizarCbxInvisivel();  
                    end;
        end, obj);

    obj._e_event1 = obj:addEventListener("onHide",
        function (_)
            self.TipoDeBarras:close();
            		FecharOPopupForm();
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            sheet.CorReversa = ReverterCor(sheet.CorNha);
        end, obj);

    obj._e_event3 = obj.TipoDeBarras:addEventListener("onCancelRequest",
        function (_)
            if sheet.ModCor == "J" then
            					sheet.alinhamentoNPC = "Jogador"
            				elseif sheet.ModCor == "A" then
            					sheet.alinhamentoNPC = "Aliado"
            				elseif sheet.ModCor == "I" then
            					sheet.alinhamentoNPC = "Inimigo"
            				else
            					sheet.alinhamentoNPC = "Neutro"
            				end;
            				self.TipoDeBarras:close();
            				FecharOPopupForm();
        end, obj);

    obj._e_event4 = obj.radioButton4:addEventListener("onClick",
        function (_)
            chamarListaDeJogadores();
        end, obj);

    obj._e_event5 = obj.rectangle1:addEventListener("onClick",
        function (_)
            setTimeout (function()
            								sheet.alinhamentoNPC = "Jogador";
            								chamarListaDeJogadores();
            							end, 10)
            							InvocarOPopupForm(sheet);
        end, obj);

    obj._e_event6 = obj.label2:addEventListener("onClick",
        function (_)
            setTimeout (function()
            									sheet.alinhamentoNPC = "Jogador";
            									chamarListaDeJogadores();
            								end, 10)
            								InvocarOPopupForm(sheet);
        end, obj);

    obj._e_event7 = obj.path1:addEventListener("onClick",
        function (_)
            setTimeout (function()
            									sheet.alinhamentoNPC = "Jogador";
            									chamarListaDeJogadores();
            								end, 10)
            								InvocarOPopupForm(sheet);
        end, obj);

    obj._e_event8 = obj.BotonAction:addEventListener("onClick",
        function (_)
            if not (sheet.alinhamentoNPC == "Jogador" and sheet.opcaoEscolhida2 == "Nenhum") then
            							ndb.setPermission(sheet, "user", sheet.NomePequeno, "read", nil)
            							ndb.setPermission(sheet, "user", sheet.NomePequeno, "write", nil)
            								
            							if sheet.alinhamentoNPC == "Jogador" then
            								sheet.NomePequeno = sheet.opcaoEscolhida2;
            								ndb.setPermission(sheet, "user", sheet.NomePequeno, "read", "strongAllow")
            								ndb.setPermission(sheet, "user", sheet.NomePequeno, "write", "strongAllow")
            							end;
            							self:setarNPC();
            							self.TipoDeBarras:close();
            							FecharOPopupForm();
            						else
            							dialogs.alert("Não há um jogador para escolher.")
            						end;
        end, obj);

    obj._e_event9 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if (sheet.alinhamentoNPC ~= "Jogador" or sheet.opcaoEscolhida2 ~= "Nenhum") then
            				self.BotonAction.enabled = true;
            			else
            				self.BotonAction.enabled = false;
            			end
        end, obj);

    obj._e_event10 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.BotonAction.enabled = (sheet.alinhamentoNPC ~= "Jogador" or sheet.opcaoEscolhida2 ~= "Nenhum");
        end, obj);

    obj._e_event11 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self:setarNPC();
        end, obj);

    obj._e_event12 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local test = GetBarrinhaNumeros(1);
            			local d0 = (tonumber(sheet.Barrinha1ValorMax or 0) == 0)
            				if d0 then
            					d0 = 1
            				else
            					d0 = tonumber(sheet.Barrinha1ValorMax or 1)
            				end;
            			if test then
            				sheet.InfoBarrinha1 = (sheet.Barrinha1Valor or 0) .. "/" .. (sheet.Barrinha1ValorMax or 0);
            				sheet.InfoBarrinha1Oculto = "??/??";
            			else
            				sheet.InfoBarrinha1 = tostring(math.floor((100 * (sheet.Barrinha1Valor or 0)) / d0)) .. "%";
            				sheet.InfoBarrinha1Oculto = "??%";
            			end;
        end, obj);

    obj._e_event13 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local test = GetBarrinhaNumeros(2);
            			local d0 = (tonumber(sheet.Barrinha2ValorMax or 0) == 0)
            				if d0 then
            					d0 = 1
            				else
            					d0 = tonumber(sheet.Barrinha2ValorMax or 1)
            				end;
            			if test then
            				sheet.InfoBarrinha2 = (sheet.Barrinha2Valor or 0) .. "/" .. (sheet.Barrinha2ValorMax or 0);
            				sheet.InfoBarrinha2Oculto = "??/??";
            			else
            				sheet.InfoBarrinha2 = tostring(math.floor((100 * (sheet.Barrinha2Valor or 0)) / d0)) .. "%";
            				sheet.InfoBarrinha2Oculto = "??%";
            			end;
        end, obj);

    obj._e_event14 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local test = GetBarrinhaNumeros(3);
            			local d0 = (tonumber(sheet.Barrinha3ValorMax or 0) == 0);
            				if d0 then
            					d0 = 1
            				else
            					d0 = tonumber(sheet.Barrinha3ValorMax or 1)
            				end;
            			if test then
            				sheet.InfoBarrinha3 = (sheet.Barrinha3Valor or 0) .. "/" .. (sheet.Barrinha3ValorMax or 0);
            				sheet.InfoBarrinha3Oculto = "??/??";
            			else
            				sheet.InfoBarrinha3 = tostring(math.floor((100 * (sheet.Barrinha3Valor or 0)) / d0)) .. "%";
            				sheet.InfoBarrinha3Oculto = "??%";
            			end;
        end, obj);

    obj._e_event15 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local test = GetBarrinhaNumeros(4);
            			local d0 = (tonumber(sheet.Barrinha4ValorMax or 0) == 0);
            				if d0 then
            					d0 = 1
            				else
            					d0 = tonumber(sheet.Barrinha4ValorMax or 1)
            				end;
            			if test then
            				sheet.InfoBarrinha4 = (sheet.Barrinha4Valor or 0) .. "/" .. (sheet.Barrinha4ValorMax or 0);
            				sheet.InfoBarrinha4Oculto = "??/??";
            			else
            				sheet.InfoBarrinha4 = tostring(math.floor((100 * (sheet.Barrinha4Valor or 0)) / d0)) .. "%";
            				sheet.InfoBarrinha4Oculto = "??%";
            			end;
        end, obj);

    obj._e_event16 = obj.button1:addEventListener("onClick",
        function (_)
            self.MenuCor:close();
        end, obj);

    obj._e_event17 = obj.button2:addEventListener("onClick",
        function (_)
            self.MenuCor.scopeNode = sheet;
            							self.MenuCor:show();
        end, obj);

    obj._e_event18 = obj.button3:addEventListener("onClick",
        function (_)
            sheet.TextoMensagem = (sheet.TextoMensagem or "") .. "\13\10";
        end, obj);

    obj._e_event19 = obj.button4:addEventListener("onClick",
        function (_)
            sheet.TextoMensagem = "";
        end, obj);

    obj._e_event20 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if not ((sheet.CorN == 0) or (self.CorN.value == "0")) then
            								local cor = "[§K" .. self.CorN.text .. "]";
            								if (cor ~= "[§K ]" and not inserindo) then
            									inserindo = true
            									sheet.TextoMensagem = (sheet.TextoMensagem or "") .. cor;
            								end;
            								
            								self.CorN.value = "0";
            								setTimeout(function()
            									inserindo = false;
            								end, 100);
            							end;
        end, obj);

    obj._e_event21 = obj.button5:addEventListener("onClick",
        function (_)
            sheet.TextoMensagem = (sheet.TextoMensagem or "") .. "[§B]";
        end, obj);

    obj._e_event22 = obj.button6:addEventListener("onClick",
        function (_)
            sheet.TextoMensagem = (sheet.TextoMensagem or "") .. "[§T]";
        end, obj);

    obj._e_event23 = obj.button7:addEventListener("onClick",
        function (_)
            sheet.TextoMensagem = (sheet.TextoMensagem or "") .. "[§U]";
        end, obj);

    obj._e_event24 = obj.button8:addEventListener("onClick",
        function (_)
            sheet.TextoMensagem = (sheet.TextoMensagem or "") .. "[§S]";
        end, obj);

    obj._e_event25 = obj.button9:addEventListener("onClick",
        function (_)
            local minhaMesa = rrpg.getMesaDe(sheet);
            							local chat = minhaMesa.activeChat;    
            							
            							cor = "[§K" .. self.CorP.text .. "]"
            							
            							local textoCompleto = self.TextoMensagem.text;
            							for linha in textoCompleto:gmatch("[^\13\10]+") do
            								if (tonumber(sheet.ShowNome) == 3) then
            									if sheet.NomeGrande ~= nil then
            										chat:enviarMensagemNPC(sheet.NomeGrande, cor .. linha);
            									else
            										showMessage("O personagem não possui um nome. Adicione um antes de enviar por este modo.")
            									end;
            								elseif (tonumber(sheet.ShowNome) == 0) then
            									chat:enviarMensagem(cor .. linha);
            								elseif (tonumber(sheet.ShowNome) == 1) then
            									chat:enviarNarracao(cor .. linha);
            								elseif (tonumber(sheet.ShowNome) == 2) then
            									if sheet.AvatarNPC ~= nil then
            										chat:enviarNarracao("[§I" .. sheet.AvatarNPC .. "] " .. cor .. linha)
            									else
            										showMessage("O personagem não possui uma imagem. Adicione uma antes de enviar por este modo.")
            									end;
            								elseif (tonumber(sheet.ShowNome) == 4) then
            									if sheet.AvatarNPC ~= nil then
            										if sheet.NomeGrande ~= nil then
            											chat:enviarMensagemNPC(sheet.NomeGrande, "[§I" .. sheet.AvatarNPC .. "] " .. cor .. linha);
            										else
            											showMessage("O personagem não possui um nome. Adicione um antes de enviar por este modo.")
            										end;
            									else
            										showMessage("O personagem não possui uma imagem. Adicione uma antes de enviar por este modo.")
            									end;
            								end;
            							end;
        end, obj);

    obj._e_event26 = obj.button10:addEventListener("onClick",
        function (_)
            if sheet.NomeRolagem ~= nil then
            								local nome = sheet.NomeRolagem .. " - " .. sheet.NomeGrande;
            							PrepararRolagem(nome, sheet.TextoRolagem);
            							else
            								PrepararRolagem("", sheet.TextoRolagem);
            							end;
        end, obj);

    obj._e_event27 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet.Shownome ~= nil then
            				self.CorP.enabled = true;
            			else
            				sheet.ShowNome = 1;
            			end;
        end, obj);

    obj._e_event28 = obj.BarrinhaPopup:addEventListener("onClose",
        function (_, canceled)
            setTimeout( function()
            				if (sheet.ModificadorBarrinha == "igual") then
            					sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            				elseif (sheet.ModificadorBarrinha == "mais") then
            					sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorTempAtualBarrinha or 0) + tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            				elseif (sheet.ModificadorBarrinha == "menos") then
            					sheet.ValorTempAtualBarrinha = tonumber(sheet.ValorTempAtualBarrinha or 0) - tonumber(sheet.ValorMudadoAtualBarrinha or 0);
            				end;
            				
            				if (sheet.ModificadorBarrinhaMax == "igual") then
            					sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            				elseif (sheet.ModificadorBarrinhaMax == "mais") then
            					sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorTempMaxBarrinha or 0) + tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            				elseif (sheet.ModificadorBarrinhaMax == "menos") then
            					sheet.ValorTempMaxBarrinha = tonumber(sheet.ValorTempMaxBarrinha or 0) - tonumber(sheet.ValorMudadoMaxBarrinha or 0);
            				end;
            				
            				local barrinhapc = 0
            				local barrinhapcmax = 0
            				local porcentagem = 0
            				local porcentagemmax = 0
            			
            				if sheet.BarrinhaID == 1 then
            					barrinhapc = (sheet.ValorTempAtualBarrinha - sheet.Barrinha1Valor);
            					barrinhapcmax = (sheet.ValorTempMaxBarrinha - sheet.Barrinha1ValorMax);
            					porcentagem = math.floor((sheet.ValorTempAtualBarrinha * 100) / cordiv0(sheet.Barrinha1Valor)) - 100;
            					porcentagemmax = math.floor((sheet.ValorTempMaxBarrinha * 100) / cordiv0(sheet.Barrinha1ValorMax)) - 100;
            					sheet.Barrinha1Valor = sheet.ValorTempAtualBarrinha;
            					sheet.Barrinha1ValorMax = sheet.ValorTempMaxBarrinha;
            				elseif sheet.BarrinhaID == 2 then
            					barrinhapc = (sheet.ValorTempAtualBarrinha - sheet.Barrinha2Valor);
            					barrinhapcmax = (sheet.ValorTempMaxBarrinha - sheet.Barrinha2ValorMax);
            					porcentagem = math.floor((sheet.ValorTempAtualBarrinha * 100) / cordiv0(sheet.Barrinha2Valor)) - 100;
            					porcentagemmax = math.floor((sheet.ValorTempMaxBarrinha * 100) / cordiv0(sheet.Barrinha2ValorMax)) - 100;
            					sheet.Barrinha2Valor = sheet.ValorTempAtualBarrinha;
            					sheet.Barrinha2ValorMax = sheet.ValorTempMaxBarrinha;
            				elseif sheet.BarrinhaID == 3 then
            					barrinhapc = (sheet.ValorTempAtualBarrinha - sheet.Barrinha3Valor);
            					barrinhapcmax = (sheet.ValorTempMaxBarrinha - sheet.Barrinha3ValorMax);
            					porcentagem = math.floor((sheet.ValorTempAtualBarrinha * 100) / cordiv0(sheet.Barrinha3Valor)) - 100;
            					porcentagemmax = math.floor((sheet.ValorTempMaxBarrinha * 100) / cordiv0(sheet.Barrinha3ValorMax)) - 100;
            					sheet.Barrinha3Valor = sheet.ValorTempAtualBarrinha;
            					sheet.Barrinha3ValorMax = sheet.ValorTempMaxBarrinha;
            				elseif sheet.BarrinhaID == 4 then
            					barrinhapc = (sheet.ValorTempAtualBarrinha - sheet.Barrinha4Valor);
            					barrinhapcmax = (sheet.ValorTempMaxBarrinha - sheet.Barrinha4ValorMax);
            					porcentagem = math.floor((sheet.ValorTempAtualBarrinha * 100) / cordiv0(sheet.Barrinha4Valor)) - 100;
            					porcentagemmax = math.floor((sheet.ValorTempMaxBarrinha * 100) / cordiv0(sheet.Barrinha4ValorMax)) - 100;
            					sheet.Barrinha4Valor = sheet.ValorTempAtualBarrinha;
            					sheet.Barrinha4ValorMax = sheet.ValorTempMaxBarrinha;
            				end;
            					
            				local chat = GetEnviarChat();
            				
            				if (chat and ((barrinhapc ~= 0) or (barrinhapcmax ~= 0))) then
            					EnviarMudanca(sheet.BarrinhaID, sheet.imagemBloqueada, sheet.NomeGrande, sheet.AtributoBarrinha, barrinhapc, barrinhapcmax, porcentagem, porcentagemmax);
            				end;
            			end, 100)
        end, obj);

    obj._e_event29 = obj.ValorAtualBarrinha:addEventListener("onEnter",
        function (_)
            self.ValorAtualBarrinha.transparent = false;
            								self.ValorAtualBarrinha.fontColor = "white";
        end, obj);

    obj._e_event30 = obj.ValorAtualBarrinha:addEventListener("onExit",
        function (_)
            self.ValorAtualBarrinha.transparent = true;
            								self.ValorAtualBarrinha.fontColor = "black";
        end, obj);

    obj._e_event31 = obj.ValorAtualBarrinha:addEventListener("onKeyDown",
        function (_, event)
            local oenter = (event.keyCode == 13)
            								if oenter then
            									self.BarrinhaPopup:close();
            								end;
        end, obj);

    obj._e_event32 = obj.ValorMaxBarrinha:addEventListener("onEnter",
        function (_)
            self.ValorMaxBarrinha.transparent = false;
            								self.ValorMaxBarrinha.fontColor = "white";
        end, obj);

    obj._e_event33 = obj.ValorMaxBarrinha:addEventListener("onExit",
        function (_)
            self.ValorMaxBarrinha.transparent = true;
            								self.ValorMaxBarrinha.fontColor = "black";
        end, obj);

    obj._e_event34 = obj.ValorMaxBarrinha:addEventListener("onKeyDown",
        function (_, event)
            local oenter = (event.keyCode == 13)
            								if oenter then
            									self.BarrinhaPopup:close();
            								end;
        end, obj);

    obj._e_event35 = obj.imgApagar:addEventListener("onClick",
        function (_)
            if DonoMestre(sheet, false, "docksub10") then
            						dialogs.confirmYesNo("Deseja realmente apagar este item?",
            							function (confirmado)
            								if confirmado then
            									self.TipoDeBarras:close();
            									FecharOPopupForm();
            									ndb.deleteNode(sheet);
            								else
            										
            								end;
            							end);
            					end;
        end, obj);

    obj._e_event36 = obj.imgFalar:addEventListener("onClick",
        function (_)
            if DonoMestre(sheet, false, "docksub1") then
            						if sheet.ShowNome == nil then
            							sheet.ShowNome = 1;
            						end;
            						self.MensagemPopup.scopeNode = sheet;
            						self.MensagemPopup:show();	
            					end;
        end, obj);

    obj._e_event37 = obj.imgBloquear:addEventListener("onClick",
        function (_)
            if not DonoMestre(sheet, false, "docksub2") then
            						sheet.imagemBloqueada = not sheet.imagemBloqueada;
            					end;
        end, obj);

    obj._e_event38 = obj.cbxInvisivel:addEventListener("onClick",
        function (_)
            if DonoMestre(sheet, false, "docksub3") then
            						self:alternarVisibilidade();
            					end;
        end, obj);

    obj._e_event39 = obj.imgInfo:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popupDetails");
            					if pop ~= nil then
            						pop:setNodeObject(self.sheet);
            						pop:showPopupEx("bottomCenter", self.imgInfo);
            					else
            						showMessage("Ops, bug... Nao encontrei o popup de detalhes para exibir");
            					end;
        end, obj);

    obj._e_event40 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            RequestReload("begin");
            					if sheet.imagemInvisivel then
            						if DonoMestre(sheet, true, "docksub4") then
            							self.opacity = 0.50;
            						end;
            					else
            						if DonoMestre(sheet, true, "docksub5") then
            							self.opacity = 1.00;
            						end;
            					end;
            					RequestReload("end");
        end, obj);

    obj._e_event41 = obj.NomeGrandeBarrinha:addEventListener("onEnter",
        function (_)
            self.NomeGrandeBarrinha.transparent = false;
        end, obj);

    obj._e_event42 = obj.NomeGrandeBarrinha:addEventListener("onExit",
        function (_)
            self.NomeGrandeBarrinha.transparent = true;
        end, obj);

    obj._e_event43 = obj.layout51:addEventListener("onClick",
        function (_)
            if DonoMestre(sheet, false, "docksub6") then
            						if sheet.ModCor == "J" then
            							sheet.alinhamentoNPC = "Jogador"
            						elseif sheet.ModCor == "A" then
            							sheet.alinhamentoNPC = "Aliado"
            						elseif sheet.ModCor == "I" then
            							sheet.alinhamentoNPC = "Inimigo"
            						else
            							sheet.alinhamentoNPC = "Neutro"
            						end;
            						chamarListaDeJogadores();
            						self.TipoDeBarras.scopeNode = sheet;
            						self.TipoDeBarras:show();
            					end
        end, obj);

    obj._e_event44 = obj.path2:addEventListener("onClick",
        function (_)
            if DonoMestre(sheet, false, "docksub6") then
            							if sheet.ModCor == "J" then
            								sheet.alinhamentoNPC = "Jogador"
            							elseif sheet.ModCor == "A" then
            								sheet.alinhamentoNPC = "Aliado"
            							elseif sheet.ModCor == "I" then
            								sheet.alinhamentoNPC = "Inimigo"
            							else
            								sheet.alinhamentoNPC = "Neutro"
            							end;
            							chamarListaDeJogadores();
            							self.TipoDeBarras.scopeNode = sheet;
            							self.TipoDeBarras:show();
            						end
        end, obj);

    obj._e_event45 = obj.Barrinha1:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha1.color = (sheet.CorBarrinha1 .. "AA");
            						self.ValoresBarrinha1.visible = true;
            						self.InfoBarrinha1.visible = (pegarJogador() or GetBarrinhaVisivel(sheet.ImagemBloqueada, 1));
            						self.InfoBarrinha1Oculto.visible = not (pegarJogador() or GetBarrinhaVisivel(sheet.ImagemBloqueada, 1));
        end, obj);

    obj._e_event46 = obj.Barrinha1:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha1.visible = false;
        end, obj);

    obj._e_event47 = obj.Barrinha1:addEventListener("onDblClick",
        function (_)
            if pegarJogador() then
            							sheet.BarrinhaID = 1;
            							sheet.AtributoBarrinha = GetBarrinhaNome(1);
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha1Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha1ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha1Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha1ValorMax;
            							self.CorPopupBarrinhas.color = self.CorBarrinha1.color;
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show(bottomCenter, self.Barrinha1);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
            						end;
        end, obj);

    obj._e_event48 = obj.InfoBarrinha1:addEventListener("onResize",
        function (_)
            self.InfoBarrinha1.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event49 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha1.visible = not sheet.Barrinha1Invisivel;
        end, obj);

    obj._e_event50 = obj.dataLink18:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha1.color = sheet.CorBarrinha1;
        end, obj);

    obj._e_event51 = obj.Barrinha2:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha2.color = (sheet.CorBarrinha2 .. "AA");
            						self.ValoresBarrinha2.visible = true;
            						self.InfoBarrinha2.visible = (pegarJogador() or GetBarrinhaVisivel(sheet.ImagemBloqueada, 2));
            						self.InfoBarrinha2Oculto.visible = not (pegarJogador() or GetBarrinhaVisivel(sheet.ImagemBloqueada, 2));
        end, obj);

    obj._e_event52 = obj.Barrinha2:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha2.visible = false;
        end, obj);

    obj._e_event53 = obj.Barrinha2:addEventListener("onDblClick",
        function (_)
            if pegarJogador() then
            							sheet.BarrinhaID = 2;
            							sheet.AtributoBarrinha = GetBarrinhaNome(2);
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha2Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha2ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha2Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha2ValorMax;
            							self.CorPopupBarrinhas.color = self.CorBarrinha2.color;
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show(bottomCenter, self.Barrinha2);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
            						end;
        end, obj);

    obj._e_event54 = obj.InfoBarrinha2:addEventListener("onResize",
        function (_)
            self.InfoBarrinha2.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event55 = obj.dataLink19:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha2.visible = not sheet.Barrinha2Invisivel;
        end, obj);

    obj._e_event56 = obj.dataLink20:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha2.color = sheet.CorBarrinha2;
        end, obj);

    obj._e_event57 = obj.Barrinha3:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha3.color = (sheet.CorBarrinha3 .. "AA");
            						self.ValoresBarrinha3.visible = true;
            						self.InfoBarrinha3.visible = (pegarJogador() or GetBarrinhaVisivel(sheet.ImagemBloqueada, 3));
            						self.InfoBarrinha3Oculto.visible = not (pegarJogador() or GetBarrinhaVisivel(sheet.ImagemBloqueada, 3));
        end, obj);

    obj._e_event58 = obj.Barrinha3:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha3.visible = false;
        end, obj);

    obj._e_event59 = obj.Barrinha3:addEventListener("onDblClick",
        function (_)
            if pegarJogador() then
            							sheet.BarrinhaID = 3;
            							sheet.AtributoBarrinha = GetBarrinhaNome(3);
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha3Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha3ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha3Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha3ValorMax;
            							self.CorPopupBarrinhas.color = self.CorBarrinha3.color;
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show(bottomCenter, self.Barrinha3);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
            						end;
        end, obj);

    obj._e_event60 = obj.InfoBarrinha3:addEventListener("onResize",
        function (_)
            self.InfoBarrinha3.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event61 = obj.dataLink21:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha3.visible = not sheet.Barrinha3Invisivel;
        end, obj);

    obj._e_event62 = obj.dataLink22:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha3.color = sheet.CorBarrinha3;
        end, obj);

    obj._e_event63 = obj.Barrinha4:addEventListener("onMouseEnter",
        function (_)
            self.CorBarrinha4.color = (sheet.CorBarrinha4 .. "AA");
            						self.ValoresBarrinha4.visible = true;
            						self.InfoBarrinha4.visible = (pegarJogador() or GetBarrinhaVisivel(sheet.ImagemBloqueada, 4));
            						self.InfoBarrinha4Oculto.visible = not (pegarJogador() or GetBarrinhaVisivel(sheet.ImagemBloqueada, 4));
        end, obj);

    obj._e_event64 = obj.Barrinha4:addEventListener("onMouseLeave",
        function (_)
            self.ValoresBarrinha4.visible = false;
        end, obj);

    obj._e_event65 = obj.Barrinha4:addEventListener("onDblClick",
        function (_)
            if pegarJogador() then
            							sheet.BarrinhaID = 4;
            							sheet.AtributoBarrinha = GetBarrinhaNome(4);
            							
            							sheet.ModificadorBarrinha = "igual";
            							sheet.ModificadorBarrinhaMax = "igual";
            							sheet.ValorTempAtualBarrinha = sheet.Barrinha4Valor;
            							sheet.ValorTempMaxBarrinha = sheet.Barrinha4ValorMax;
            							sheet.ValorMudadoAtualBarrinha = sheet.Barrinha4Valor;
            							sheet.ValorMudadoMaxBarrinha = sheet.Barrinha4ValorMax;
            							self.CorPopupBarrinhas.color = self.CorBarrinha4.color;
            							self.BarrinhaPopup.scopeNode = sheet;
            							self.BarrinhaPopup:show(bottomCenter, self.Barrinha4);
            							self.BarrinhaPopup.top = (self.BarrinhaPopup.top + 29 + 10);
            						end;
        end, obj);

    obj._e_event66 = obj.InfoBarrinha4:addEventListener("onResize",
        function (_)
            self.InfoBarrinha4.width = (self.ValoresBarrinha1.width - 4);
        end, obj);

    obj._e_event67 = obj.dataLink23:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha4.visible = not sheet.Barrinha4Invisivel;
        end, obj);

    obj._e_event68 = obj.dataLink24:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.Barrinha4.color = sheet.CorBarrinha4;
        end, obj);

    obj._e_event69 = obj.Linha1Barrinha:addEventListener("onEnter",
        function (_)
            self.Linha1Barrinha.transparent = false;
        end, obj);

    obj._e_event70 = obj.Linha1Barrinha:addEventListener("onExit",
        function (_)
            self.Linha1Barrinha.transparent = true;
        end, obj);

    obj._e_event71 = obj.Linha2Barrinha:addEventListener("onEnter",
        function (_)
            self.Linha2Barrinha.transparent = false;
        end, obj);

    obj._e_event72 = obj.Linha2Barrinha:addEventListener("onExit",
        function (_)
            self.Linha2Barrinha.transparent = true;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.InfoBarrinha3 ~= nil then self.InfoBarrinha3:destroy(); self.InfoBarrinha3 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.ValoresBarrinha4 ~= nil then self.ValoresBarrinha4:destroy(); self.ValoresBarrinha4 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.Cor_3 ~= nil then self.Cor_3:destroy(); self.Cor_3 = nil; end;
        if self.popupDetails ~= nil then self.popupDetails:destroy(); self.popupDetails = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.Cor_7 ~= nil then self.Cor_7:destroy(); self.Cor_7 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.Cor_24 ~= nil then self.Cor_24:destroy(); self.Cor_24 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.listaDeJogadores ~= nil then self.listaDeJogadores:destroy(); self.listaDeJogadores = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.path1 ~= nil then self.path1:destroy(); self.path1 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.Barrinha1 ~= nil then self.Barrinha1:destroy(); self.Barrinha1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.imgApagar ~= nil then self.imgApagar:destroy(); self.imgApagar = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.imgBloquear ~= nil then self.imgBloquear:destroy(); self.imgBloquear = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.Cor_25 ~= nil then self.Cor_25:destroy(); self.Cor_25 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.CorBarrinha4 ~= nil then self.CorBarrinha4:destroy(); self.CorBarrinha4 = nil; end;
        if self.Cor_27 ~= nil then self.Cor_27:destroy(); self.Cor_27 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.Cor_6 ~= nil then self.Cor_6:destroy(); self.Cor_6 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.Cor_15 ~= nil then self.Cor_15:destroy(); self.Cor_15 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.Barrinha4 ~= nil then self.Barrinha4:destroy(); self.Barrinha4 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.Cor_1 ~= nil then self.Cor_1:destroy(); self.Cor_1 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.BotonAction ~= nil then self.BotonAction:destroy(); self.BotonAction = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.MensagemPopup ~= nil then self.MensagemPopup:destroy(); self.MensagemPopup = nil; end;
        if self.Cor_23 ~= nil then self.Cor_23:destroy(); self.Cor_23 = nil; end;
        if self.InfoBarrinha3Oculto ~= nil then self.InfoBarrinha3Oculto:destroy(); self.InfoBarrinha3Oculto = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.Cor_13 ~= nil then self.Cor_13:destroy(); self.Cor_13 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.CorBarrinha3 ~= nil then self.CorBarrinha3:destroy(); self.CorBarrinha3 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.CorN ~= nil then self.CorN:destroy(); self.CorN = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.Linha2Barrinha ~= nil then self.Linha2Barrinha:destroy(); self.Linha2Barrinha = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.ValorMaxBarrinha ~= nil then self.ValorMaxBarrinha:destroy(); self.ValorMaxBarrinha = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.Cor_17 ~= nil then self.Cor_17:destroy(); self.Cor_17 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.CorPopupBarrinhas ~= nil then self.CorPopupBarrinhas:destroy(); self.CorPopupBarrinhas = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.TextoMensagem ~= nil then self.TextoMensagem:destroy(); self.TextoMensagem = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.InfoBarrinha2 ~= nil then self.InfoBarrinha2:destroy(); self.InfoBarrinha2 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.ValorAtualBarrinha ~= nil then self.ValorAtualBarrinha:destroy(); self.ValorAtualBarrinha = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.ValoresBarrinha1 ~= nil then self.ValoresBarrinha1:destroy(); self.ValoresBarrinha1 = nil; end;
        if self.ValoresBarrinha2 ~= nil then self.ValoresBarrinha2:destroy(); self.ValoresBarrinha2 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.InfoBarrinha2Oculto ~= nil then self.InfoBarrinha2Oculto:destroy(); self.InfoBarrinha2Oculto = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.BarrinhaPopup ~= nil then self.BarrinhaPopup:destroy(); self.BarrinhaPopup = nil; end;
        if self.Cor_10 ~= nil then self.Cor_10:destroy(); self.Cor_10 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.Cor_8 ~= nil then self.Cor_8:destroy(); self.Cor_8 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.Cor_28 ~= nil then self.Cor_28:destroy(); self.Cor_28 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.imgInfo ~= nil then self.imgInfo:destroy(); self.imgInfo = nil; end;
        if self.Cor_21 ~= nil then self.Cor_21:destroy(); self.Cor_21 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.CorBarrinha2 ~= nil then self.CorBarrinha2:destroy(); self.CorBarrinha2 = nil; end;
        if self.Cor_4 ~= nil then self.Cor_4:destroy(); self.Cor_4 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.imgFalar ~= nil then self.imgFalar:destroy(); self.imgFalar = nil; end;
        if self.Cor_19 ~= nil then self.Cor_19:destroy(); self.Cor_19 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.ValoresBarrinha3 ~= nil then self.ValoresBarrinha3:destroy(); self.ValoresBarrinha3 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.Cor_5 ~= nil then self.Cor_5:destroy(); self.Cor_5 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        if self.InfoBarrinha4 ~= nil then self.InfoBarrinha4:destroy(); self.InfoBarrinha4 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.InfoBarrinha1Oculto ~= nil then self.InfoBarrinha1Oculto:destroy(); self.InfoBarrinha1Oculto = nil; end;
        if self.NomePequenoBarrinha ~= nil then self.NomePequenoBarrinha:destroy(); self.NomePequenoBarrinha = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.Cor_18 ~= nil then self.Cor_18:destroy(); self.Cor_18 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.Cor_12 ~= nil then self.Cor_12:destroy(); self.Cor_12 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.NomeGrandeBarrinha ~= nil then self.NomeGrandeBarrinha:destroy(); self.NomeGrandeBarrinha = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.TipoDeBarras ~= nil then self.TipoDeBarras:destroy(); self.TipoDeBarras = nil; end;
        if self.Cor_26 ~= nil then self.Cor_26:destroy(); self.Cor_26 = nil; end;
        if self.InfoBarrinha1 ~= nil then self.InfoBarrinha1:destroy(); self.InfoBarrinha1 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.Cor_9 ~= nil then self.Cor_9:destroy(); self.Cor_9 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.InfoBarrinha4Oculto ~= nil then self.InfoBarrinha4Oculto:destroy(); self.InfoBarrinha4Oculto = nil; end;
        if self.Cor_16 ~= nil then self.Cor_16:destroy(); self.Cor_16 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.Linha1Barrinha ~= nil then self.Linha1Barrinha:destroy(); self.Linha1Barrinha = nil; end;
        if self.cbxInvisivel ~= nil then self.cbxInvisivel:destroy(); self.cbxInvisivel = nil; end;
        if self.MenuCor ~= nil then self.MenuCor:destroy(); self.MenuCor = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.CorP ~= nil then self.CorP:destroy(); self.CorP = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.Cor_14 ~= nil then self.Cor_14:destroy(); self.Cor_14 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.path2 ~= nil then self.path2:destroy(); self.path2 = nil; end;
        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.Barrinha2 ~= nil then self.Barrinha2:destroy(); self.Barrinha2 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.CorBarrinha1 ~= nil then self.CorBarrinha1:destroy(); self.CorBarrinha1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.Cor_2 ~= nil then self.Cor_2:destroy(); self.Cor_2 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.Cor_11 ~= nil then self.Cor_11:destroy(); self.Cor_11 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.Cor_20 ~= nil then self.Cor_20:destroy(); self.Cor_20 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.Barrinha3 ~= nil then self.Barrinha3:destroy(); self.Barrinha3 = nil; end;
        if self.Cor_22 ~= nil then self.Cor_22:destroy(); self.Cor_22 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newCaixaFichaNPC()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_CaixaFichaNPC();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _CaixaFichaNPC = {
    newEditor = newCaixaFichaNPC, 
    new = newCaixaFichaNPC, 
    name = "CaixaFichaNPC", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

CaixaFichaNPC = _CaixaFichaNPC;
Firecast.registrarForm(_CaixaFichaNPC);

return _CaixaFichaNPC;
