require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newListaDeNPCs()
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
    obj:setName("ListaDeNPCs");
    obj:setAlign("client");
    obj:setTheme("dark");


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
    obj.recordNode:setParent(obj);
    obj.recordNode:setName("recordNode");
    obj.recordNode:setVisible(false);

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setVisible(false);
    obj.layout1:setName("layout1");

    obj.dropDownFalso2 = gui.fromHandle(_obj_newObject("popupForm"));
    obj.dropDownFalso2:setParent(obj.layout1);
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

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setColor("#0f0f0f");
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(24);
    obj.layout2:setMargins({top=4, left=2});
    obj.layout2:setName("layout2");

    obj.Configurar = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Configurar:setParent(obj.layout2);
    obj.Configurar:setMargins({left=4});
    obj.Configurar:setAlign("left");
    obj.Configurar:setWidth(24);
    obj.Configurar:setHint("Configurações da Lista");
    obj.Configurar:setName("Configurar");
    obj.Configurar:setImageChecked("/GerenciadorDeCampanha/images/config.png");
    obj.Configurar:setImageUnchecked("/GerenciadorDeCampanha/images/config.png");

    obj.NovoNPC = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.NovoNPC:setParent(obj.layout2);
    obj.NovoNPC:setMargins({left=4});
    obj.NovoNPC:setAlign("left");
    obj.NovoNPC:setWidth(24);
    obj.NovoNPC:setHint("Adicionar novo NPC");
    obj.NovoNPC:setName("NovoNPC");
    obj.NovoNPC:setImageChecked("/GerenciadorDeCampanha/images/addnpc.png");
    obj.NovoNPC:setImageUnchecked("/GerenciadorDeCampanha/images/addnpc.png");

    obj.Organizar = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.Organizar:setParent(obj.layout2);
    obj.Organizar:setMargins({left=4});
    obj.Organizar:setAlign("left");
    obj.Organizar:setWidth(24);
    obj.Organizar:setHint("Ordenar Lista de NPCs");
    obj.Organizar:setName("Organizar");
    obj.Organizar:setImageChecked("/GerenciadorDeCampanha/images/organize.png");
    obj.Organizar:setImageUnchecked("/GerenciadorDeCampanha/images/organize.png");

    obj.MainClient = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.MainClient:setParent(obj.rectangle1);
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

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("bottom");
    obj.layout3:setHeight(32);
    obj.layout3:setName("layout3");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout3);
    obj.label1:setAlign("right");
    lfm_setPropAsString(obj.label1, "fontStyle",  "italic");
    obj.label1:setFontSize(12);
    obj.label1:setOpacity(0.8);
    obj.label1:setAutoSize(true);
    obj.label1:setText("Criado por Mia\nEditado por Ambesek");
    obj.label1:setName("label1");


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
		


    obj._e_event0 = obj:addEventListener("onShow",
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

    obj._e_event1 = obj.opcoesFalsas2:addEventListener("onSelect",
        function (self)
            local node = self.opcoesFalsas2.selectedNode;
            						 setTimeout(function()
            							if node ~= nil then
            								self.recordNode.scopeNode.opcaoEscolhida2 = node.NomeDaOpcao;
            							end;
            						 end,10);
        end, obj);

    obj._e_event2 = obj.opcoesFalsas2:addEventListener("onCompare",
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

    obj._e_event3 = obj.rectangle1:addEventListener("onResize",
        function (self)
            if self.width >= 270 then
            				self.rclListaDeNPC.width = self.width;
            			else
            				self.rclListaDeNPC.width = 270;
            			end;
        end, obj);

    obj._e_event4 = obj.Configurar:addEventListener("onClick",
        function (self)
            if DonoMestre() then
            						self.Config.scopeNode = sheet;
            						self.Config:show();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event5 = obj.NovoNPC:addEventListener("onClick",
        function (self)
            if DonoMestre() then			
            						node = self.rclListaDeNPC:append();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event6 = obj.Organizar:addEventListener("onClick",
        function (self)
            if DonoMestre() then			
            						self.rclListaDeNPC:sort();
            					else
            						dialogs.alert("Apenas o dono da ficha e o mestre da mesa podem realizar esta ação.");
            					end;
        end, obj);

    obj._e_event7 = obj.rclListaDeNPC:addEventListener("onBeginEnumeration",
        function (self)
        end, obj);

    obj._e_event8 = obj.rclListaDeNPC:addEventListener("onItemAdded",
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

    obj._e_event9 = obj.rclListaDeNPC:addEventListener("onCompare",
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

    function obj:_releaseEvents()
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

        if self.opcoesFalsas2 ~= nil then self.opcoesFalsas2:destroy(); self.opcoesFalsas2 = nil; end;
        if self.dropDownFalso2 ~= nil then self.dropDownFalso2:destroy(); self.dropDownFalso2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.Organizar ~= nil then self.Organizar:destroy(); self.Organizar = nil; end;
        if self.recordNode ~= nil then self.recordNode:destroy(); self.recordNode = nil; end;
        if self.NovoNPC ~= nil then self.NovoNPC:destroy(); self.NovoNPC = nil; end;
        if self.MainClient ~= nil then self.MainClient:destroy(); self.MainClient = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclListaDeNPC ~= nil then self.rclListaDeNPC:destroy(); self.rclListaDeNPC = nil; end;
        if self.Configurar ~= nil then self.Configurar:destroy(); self.Configurar = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _ListaDeNPCs = {
    newEditor = newListaDeNPCs, 
    new = newListaDeNPCs, 
    name = "ListaDeNPCs", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

ListaDeNPCs = _ListaDeNPCs;
rrpg.registrarForm(_ListaDeNPCs);

return _ListaDeNPCs;
