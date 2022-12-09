require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDesbravadores23_svg()
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
    obj:setName("frmDesbravadores23_svg");
    obj:setAlign("client");

    obj.Pag2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.Pag2:setParent(obj);
    obj.Pag2:setName("Pag2");
    obj.Pag2:setAlign("client");
    obj.Pag2:setVisible(true);

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.Pag2);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(601);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(25);
    obj.rectangle1:setYradius(25);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.labSoma3 = GUI.fromHandle(_obj_newObject("label"));
    obj.labSoma3:setParent(obj.rectangle1);
    obj.labSoma3:setFontSize(28);
    obj.labSoma3:setFontColor("lime");
    lfm_setPropAsString(obj.labSoma3, "fontStyle",  "bold");
    obj.labSoma3:setLeft(346);
    obj.labSoma3:setTop(0);
    obj.labSoma3:setWidth(205);
    obj.labSoma3:setHeight(45);
    obj.labSoma3:setName("labSoma3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.labSoma3);
    obj.dataLink1:setField("Soma");
    obj.dataLink1:setName("dataLink1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setSRC("/Imagens/layoutDinheiro.png");
    obj.image1:setHitTest(true);
    obj.image1:setLeft(280);
    obj.image1:setTop(-2);
    obj.image1:setWidth(213);
    obj.image1:setHeight(56);
    obj.image1:setName("image1");

    obj.troca = GUI.fromHandle(_obj_newObject("image"));
    obj.troca:setParent(obj.rectangle1);
    obj.troca:setHitTest(true);
    obj.troca:setCursor("handPoint");
    obj.troca:setLeft(537);
    obj.troca:setTop(-2);
    obj.troca:setWidth(63);
    obj.troca:setHeight(60);
    obj.troca:setName("troca");
    obj.troca:setSRC("/Imagens/vender_on.png");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(600);
    obj.layout1:setHeight(600);
    obj.layout1:setFrameStyle("/frames/frame2.xml");
    obj.layout1:setMargins({left=10, top=10, right=10, bottom=10});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("client");
    obj.layout2:setFrameStyle("/frames/frame1.xml");
    obj.layout2:setMargins({left=10, top=10, right=10, bottom=10});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(30);
    obj.layout3:setMargins({bottom=4});
    obj.layout3:setName("layout3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setText("Criar Novo Item");
    obj.button1:setWidth(150);
    obj.button1:setAlign("left");
    lfm_setPropAsString(obj.button1, "fontStyle",  "bold");
    obj.button1:setName("button1");

    obj.rclListaDosItens = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosItens:setParent(obj.layout1);
    obj.rclListaDosItens:setName("rclListaDosItens");
    obj.rclListaDosItens:setField("campoDosItens");
    obj.rclListaDosItens:setTemplateForm("frmItemDaLista");
    obj.rclListaDosItens:setAlign("client");
    obj.rclListaDosItens:setSelectable(true);

    obj.boxDetalhesDoItem = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoItem:setParent(obj.layout1);
    obj.boxDetalhesDoItem:setName("boxDetalhesDoItem");
    obj.boxDetalhesDoItem:setVisible(false);
    obj.boxDetalhesDoItem:setAlign("right");
    obj.boxDetalhesDoItem:setWidth(400);
    obj.boxDetalhesDoItem:setMargins({left=4, right=4});

    obj.testeee = GUI.fromHandle(_obj_newObject("button"));
    obj.testeee:setParent(obj.boxDetalhesDoItem);
    obj.testeee:setName("testeee");
    obj.testeee:setText("debugDin");
    obj.testeee:setLeft(200);
    obj.testeee:setTop(300);

    obj.Venda = GUI.fromHandle(_obj_newObject("image"));
    obj.Venda:setParent(obj.boxDetalhesDoItem);
    obj.Venda:setName("Venda");
    obj.Venda:setSRC("/Imagens/vendaItens.png");
    obj.Venda:setLeft(222);
    obj.Venda:setTop(165);
    obj.Venda:setWidth(134);
    obj.Venda:setHeight(106);
    obj.Venda:setVisible(true);

    obj.naoVende = GUI.fromHandle(_obj_newObject("image"));
    obj.naoVende:setParent(obj.boxDetalhesDoItem);
    obj.naoVende:setName("naoVende");
    obj.naoVende:setSRC("/Imagens/impossivelVende.png");
    obj.naoVende:setLeft(222);
    obj.naoVende:setTop(165);
    obj.naoVende:setWidth(134);
    obj.naoVende:setHeight(106);
    obj.naoVende:setVisible(false);

    obj.mercadoNegro = GUI.fromHandle(_obj_newObject("image"));
    obj.mercadoNegro:setParent(obj.boxDetalhesDoItem);
    obj.mercadoNegro:setName("mercadoNegro");
    obj.mercadoNegro:setSRC("/Imagens/mercadoNegro.png");
    obj.mercadoNegro:setLeft(222);
    obj.mercadoNegro:setTop(165);
    obj.mercadoNegro:setWidth(134);
    obj.mercadoNegro:setHeight(106);
    obj.mercadoNegro:setVisible(false);

    obj.dinheiro = GUI.fromHandle(_obj_newObject("label"));
    obj.dinheiro:setParent(obj.boxDetalhesDoItem);
    obj.dinheiro:setName("dinheiro");
    obj.dinheiro:setLeft(246);
    obj.dinheiro:setTop(183);
    obj.dinheiro:setWidth(82);
    obj.dinheiro:setHeight(26);
    obj.dinheiro:setFontSize(20);
    obj.dinheiro:setFontColor("black");
    lfm_setPropAsString(obj.dinheiro, "fontStyle",  "bold");
    obj.dinheiro:setField("custo");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.boxDetalhesDoItem);
    obj.image2:setSRC("/Imagens/nivelDoitem.png");
    obj.image2:setLeft(180);
    obj.image2:setTop(364);
    obj.image2:setWidth(205);
    obj.image2:setHeight(30);
    obj.image2:setVisible(true);
    obj.image2:setName("image2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.boxDetalhesDoItem);
    obj.label1:setField("nivelItem");
    obj.label1:setHitTest(true);
    obj.label1:setFontSize(23);
    obj.label1:setFontColor("red");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setLeft(375);
    obj.label1:setTop(367);
    obj.label1:setName("label1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.boxDetalhesDoItem);
    obj.dataLink2:setField("nivelItem");
    obj.dataLink2:setName("dataLink2");

    obj.colocarDinheiro = GUI.fromHandle(_obj_newObject("button"));
    obj.colocarDinheiro:setParent(obj.boxDetalhesDoItem);
    obj.colocarDinheiro:setText("$");
    obj.colocarDinheiro:setName("colocarDinheiro");
    obj.colocarDinheiro:setFontColor("yellow");
    lfm_setPropAsString(obj.colocarDinheiro, "fontStyle",  "bold");
    obj.colocarDinheiro:setFontSize(25);
    obj.colocarDinheiro:setLeft(215);
    obj.colocarDinheiro:setTop(182);
    obj.colocarDinheiro:setWidth(27);
    obj.colocarDinheiro:setHeight(25);

    obj.botaoDeVenda = GUI.fromHandle(_obj_newObject("image"));
    obj.botaoDeVenda:setParent(obj.boxDetalhesDoItem);
    obj.botaoDeVenda:setName("botaoDeVenda");
    obj.botaoDeVenda:setSRC("/Imagens/vendeItem2.png");
    obj.botaoDeVenda:setLeft(237);
    obj.botaoDeVenda:setTop(209);
    obj.botaoDeVenda:setWidth(96);
    obj.botaoDeVenda:setOpacity(1);
    obj.botaoDeVenda:setHeight(21);
    obj.botaoDeVenda:setHitTest(true);
    obj.botaoDeVenda:setCursor("handPoint");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.boxDetalhesDoItem);
    obj.rectangle2:setAlign("top");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setHeight(180);
    obj.rectangle2:setPadding({top=3, left=3, right=3, bottom=3});
    obj.rectangle2:setName("rectangle2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(30);
    obj.layout4:setMargins({bottom=4});
    obj.layout4:setName("layout4");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout4);
    obj.label2:setAlign("left");
    obj.label2:setText("Nome do Item:");
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setAlign("client");
    obj.edit1:setField("campoTitulo");
    obj.edit1:setName("edit1");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setText("Clique aqui para colocar imagem");
    obj.label3:setLeft(8);
    obj.label3:setTop(68);
    obj.label3:setAutoSize(true);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setWordWrap(true);
    obj.label3:setName("label3");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle2);
    obj.image3:setSRC("/Imagens/quadradoImagem.png");
    obj.image3:setLeft(0.5);
    obj.image3:setTop(33);
    obj.image3:setWidth(134);
    obj.image3:setHeight(138);
    obj.image3:setName("image3");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.rectangle2);
    obj.layout5:setAlign("top");
    obj.layout5:setHeight(131.5);
    obj.layout5:setName("layout5");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj.layout5);
    obj.image4:setAlign("left");
    obj.image4:setEditable(true);
    obj.image4:setField("campoURLImagem");
    obj.image4:setWidth(130);
    obj.image4:setHeight(130);
    obj.image4:setMargins({top=-20});
    obj.image4:setName("image4");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("client");
    obj.layout6:setMargins({left=2});
    obj.layout6:setName("layout6");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout6);
    obj.edit2:setAlign("top");
    obj.edit2:setField("campoSubTitulo");
    obj.edit2:setHeight(30);
    obj.edit2:setName("edit2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout6);
    obj.textEditor1:setAlign("top");
    obj.textEditor1:setField("campoTextoGrande");
    obj.textEditor1:setHeight(100);
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle1);
    obj.textEditor2:setLeft(198);
    obj.textEditor2:setTop(250);
    obj.textEditor2:setWidth(193);
    obj.textEditor2:setHeight(347);
    obj.textEditor2:setReadOnly(true);
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setFontFamily("Meiryo UI");
    obj.textEditor2:setText("➢ (Armas)\n\n✪ (Equipáveis; Armaduras)\n\n✶ (Itens Comuns)\n\n✸ (Itens Mágicos)\n\n☌ (Poções)\n\n✉ (Livros; Pergaminhos; Cartas)\n\n♕ (Tesouros; Raros)\n\n♘ (Pet)");
    obj.textEditor2:setName("textEditor2");

    obj.DragaoDeArmadura = GUI.fromHandle(_obj_newObject("image"));
    obj.DragaoDeArmadura:setParent(obj.rectangle1);
    lfm_setPropAsString(obj.DragaoDeArmadura, "animate",  "true");
    obj.DragaoDeArmadura:setName("DragaoDeArmadura");
    obj.DragaoDeArmadura:setLeft(240);
    obj.DragaoDeArmadura:setTop(310);
    obj.DragaoDeArmadura:setWidth(405);
    obj.DragaoDeArmadura:setHeight(370);
    obj.DragaoDeArmadura:setSRC("/Gif/dragãoArmadura.gif");

    obj.image5 = GUI.fromHandle(_obj_newObject("image"));
    obj.image5:setParent(obj.rectangle1);
    obj.image5:setSRC("/Imagens/gramaImagem.png");
    obj.image5:setLeft(175);
    obj.image5:setTop(520);
    obj.image5:setWidth(434);
    obj.image5:setHeight(79);
    obj.image5:setName("image5");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            function format_thousand(v)
            	local s = string.format("%d", math.floor(v))
            	local pos = string.len(s) % 3 
            	if pos == 0 then pos = 3 end
                return string.sub(s, 1, pos)
            	    .. "" .. string.gsub(string.sub(s, pos+1), "(...)", ".%1") 
            		.. "" .. string.sub(string.format("%.0f", v - math.floor(v)), 3) 
            
            end;
            	  self.labSoma3.text = '$' .. format_thousand(sheet.soma);
        end, obj);

    obj._e_event1 = obj.image1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
                                    dialogs.inputQuery("Carteira do jogador", "Colocar dinheiro para jogador:", "",
                                       function (valorPreenchido)
                                       sheet.Soma = (sheet.Soma or 0 ) + valorPreenchido; 
                                end);
                                    end;
        end, obj);

    obj._e_event2 = obj.troca:addEventListener("onMouseEnter",
        function (_)
            self.troca.src = "/Imagens/vender_off.png"
        end, obj);

    obj._e_event3 = obj.troca:addEventListener("onMouseLeave",
        function (_)
            self.troca.src = "/Imagens/vender_on.png"
        end, obj);

    obj._e_event4 = obj.troca:addEventListener("onClick",
        function (_)
            self.fichaPrincipal.visible = true
                         self.Pag2.visible = false;
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            -- Usuário clicou no botão de criar novo item.
                                            -- Vamos inserir um novo item no nosso recordList                              
                                            self.rclListaDosItens:append();
        end, obj);

    obj._e_event6 = obj.rclListaDosItens:addEventListener("onSelect",
        function (_)
            --[[
                                    Este evento é chamado quando o usuário selecionar/deselecionar itens da lista. Quando o usuário selecionar, vamos fazer nosso dataScopeBox (e todas as tag dentro dele) salvar e carregar dados no   objeto Nodo (NodeDatabase) do item selecionado.
            
                              --]]                      
                              local node = self.rclListaDosItens.selectedNode;  
                                     self.boxDetalhesDoItem.node = node;      
            						 
                              -- a caixa de detalhe só ficará visível se houver item selecionado
                                      self.boxDetalhesDoItem.visible = (node ~= nil);
        end, obj);

    obj._e_event7 = obj.testeee:addEventListener("onClick",
        function (_)
            self.boxDetalhesDoItem.node.custo = (sheet.custo or 0) + 0;
                    self.boxDetalhesDoItem.node.nivelItem = 0;
        end, obj);

    obj._e_event8 = obj.label1:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Nivel do item", "Level:", "",
            		   function (valorPreenchido)
            		      self.boxDetalhesDoItem.node.nivelItem = (sheet.nivelItem or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event9 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if self.boxDetalhesDoItem.node.nivelItem == 0 then
                self.Venda.visible = false;
                self.botaoDeVenda.visible = false;
                self.colocarDinheiro.visible = false;
                self.naoVende.visible = true;
                self.dinheiro.visible = false;
               end;
              if self.boxDetalhesDoItem.node.nivelItem == 1 then
              self.mercadoNegro.visible = false;
              self.naoVende.visible = false;
                  self.botaoDeVenda.visible = true;
                self.Venda.visible = true;
                self.botaoDeVenda.visible = true;
                self.colocarDinheiro.visible = true;
                self.dinheiro.visible = true;
             end;
              if self.boxDetalhesDoItem.node.nivelItem == 2 then
              self.mercadoNegro.visible = false;
              self.naoVende.visible = false;
                  self.botaoDeVenda.visible = true;
                self.Venda.visible = true;
                self.botaoDeVenda.visible = true;
                self.colocarDinheiro.visible = true;
                self.dinheiro.visible = true;
             end;
              if self.boxDetalhesDoItem.node.nivelItem == 3 then
              self.mercadoNegro.visible = true;
                  self.botaoDeVenda.visible = false;
                self.Venda.visible = false;
                self.botaoDeVenda.visible = false;
                self.colocarDinheiro.visible = false;
                self.dinheiro.visible = false;
            
              end;
        end, obj);

    obj._e_event10 = obj.colocarDinheiro:addEventListener("onClick",
        function (_)
            if rrpg.getMesaDe(sheet).meuJogador.isMestre then
            		dialogs.inputQuery("Caixa", "Quantidades:", "",
            		   function (valorPreenchido)
            		      self.boxDetalhesDoItem.node.custo = (sheet.custo or 0) + valorPreenchido; 
            	    end);
            		end;
        end, obj);

    obj._e_event11 = obj.botaoDeVenda:addEventListener("onClick",
        function (_)
            local custo = tonumber(sheet.custo) or 0;
                local Soma = tonumber(sheet.Soma) or 0;
                sheet.Soma = Soma + self.boxDetalhesDoItem.node.custo; 
                custo = ndb.deleteNode(self.boxDetalhesDoItem.node);
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.testeee ~= nil then self.testeee:destroy(); self.testeee = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.image5 ~= nil then self.image5:destroy(); self.image5 = nil; end;
        if self.naoVende ~= nil then self.naoVende:destroy(); self.naoVende = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.labSoma3 ~= nil then self.labSoma3:destroy(); self.labSoma3 = nil; end;
        if self.Pag2 ~= nil then self.Pag2:destroy(); self.Pag2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.troca ~= nil then self.troca:destroy(); self.troca = nil; end;
        if self.botaoDeVenda ~= nil then self.botaoDeVenda:destroy(); self.botaoDeVenda = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.boxDetalhesDoItem ~= nil then self.boxDetalhesDoItem:destroy(); self.boxDetalhesDoItem = nil; end;
        if self.Venda ~= nil then self.Venda:destroy(); self.Venda = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.dinheiro ~= nil then self.dinheiro:destroy(); self.dinheiro = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.colocarDinheiro ~= nil then self.colocarDinheiro:destroy(); self.colocarDinheiro = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.mercadoNegro ~= nil then self.mercadoNegro:destroy(); self.mercadoNegro = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rclListaDosItens ~= nil then self.rclListaDosItens:destroy(); self.rclListaDosItens = nil; end;
        if self.DragaoDeArmadura ~= nil then self.DragaoDeArmadura:destroy(); self.DragaoDeArmadura = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDesbravadores23_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDesbravadores23_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDesbravadores23_svg = {
    newEditor = newfrmDesbravadores23_svg, 
    new = newfrmDesbravadores23_svg, 
    name = "frmDesbravadores23_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDesbravadores23_svg = _frmDesbravadores23_svg;
Firecast.registrarForm(_frmDesbravadores23_svg);

return _frmDesbravadores23_svg;
