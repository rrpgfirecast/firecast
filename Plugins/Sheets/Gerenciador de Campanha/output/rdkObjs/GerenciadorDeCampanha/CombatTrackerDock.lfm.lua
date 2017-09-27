require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmCombatTracker()
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
    obj:setName("frmCombatTracker");
    obj:setFormType("tablesDock");
    obj:setDataType("RRPG.TB.COMBAT.TRACKER.v1");
    obj:setTitle("Tracker de Combate");
    obj:setAlign("client");


		local ATOR_VIEW_STATE_VISIVEL = 0;
		local ATOR_VIEW_STATE_PARC_VISIVEL = 1;
		local ATOR_VIEW_STATE_INVISIVEL = 2;
	
		local function getAtoresNDB()
			if sheet.atores == nil then
				sheet.atores = {};
			end;
			
			return sheet.atores;
		end;	

		local function getAtoresNodes()
			local atores = getAtoresNDB();
			return ndb.getChildNodes(atores);
		end;
		
		function self:souMestre()
			local mesa = rrpg.getMesaDe(sheet);

			if mesa ~= nil then
				local j = mesa.meuJogador;
				
				if j ~= nil then
					return j.isMestre;
				else
					return false;
				end;
			else
				return false;
			end;
		end;
		
		function self:narrar(msg)
			local mesa = rrpg.getMesaDe(sheet);
			
			if mesa ~= nil then
				local chat = mesa.chat;
				
				if chat ~= nil then
					chat:enviarNarracao(msg);
				end;
			end;
		end;
		
		function self:escrever(msg)
			local mesa = rrpg.getMesaDe(sheet);
			
			if mesa ~= nil then
				local chat = mesa.chat;
				
				if chat ~= nil then
					chat:escrever(msg);
				end;
			end;
		end;
		
		function self:getNomeColoridoDe(nodeAtor)
			local corAsNumero;
			local fof = nodeAtor.fof;
			
			if fof == 1 then
				corAsNumero = 3; -- Amigo
			elseif fof == 2 then
				corAsNumero = 8;  -- Neutro
			elseif fof == 3 then
				corAsNumero = 4;  -- Inimigo
			else
				corAsNumero = 14; -- Não definido
			end;	

			return "[§K" .. corAsNumero .. "]" .. nodeAtor.nome;			
		end;
		
		function self:ativarTurnoDe(node)
			if not self:souMestre() then
				return nil;
			end;		
		
			local atores = getAtoresNodes();
			local oldEstavaNaVez = node.vez;
			
			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a ~= node then
					a.vez = false;
				end;
			end;
			
			if node ~= nil then
				node.vez = true;
				self.rclAtores:scrollToNode(node);
			end;
						
			if (type(node.nome) == "string" and node.nome ~= "") and
               (not oldEstavaNaVez)	then
				local headerTralha = "[§K15] >>";
				local footerTralha = "";
				local notificacaoDeTurno = "[§K1]" .. headerTralha .. "[§K1] Turno de " .. self:getNomeColoridoDe(node) .. "[§K1] " .. footerTralha;
			
				if (ndb.getPermission(node, "group", "espectadores", "read") ~= "deny") then			   
					self:narrar(notificacaoDeTurno);
				else					
					self:escrever(notificacaoDeTurno);
				end;
			end;
		end;
		
		local scheduledSort = false;
		
		function self:reordenar()
			self.rclAtores:sort();
			scheduledSort = false;
		end;
		
		function self:agendarReordenacao()
			if not scheduledSort then
				scheduledSort = true;
				
				setTimeout(function()
							  if scheduledSort then
								self:reordenar();
								scheduledSort = false;
							  end;							  
						   end, 200);
			end;
		end;	
		
		function self:compareNodes(nodeA, nodeB)
			local r = (tonumber(nodeB.iniciativa) or 0) - (tonumber(nodeA.iniciativa) or 0);
			
			if r == 0 then
				r = (nodeA._id or 0) - (nodeB._id or 0);
			end;
			
			return r;		
		end;
		
		function self:avancarRelogioDeAtor(ator, relogioAtual, relogioOld)
			if ator.dadosSensiveis ~= nil and ator.dadosSensiveis.efeitos ~= nil then
				local lEfeitos = ndb.getChildNodes(ator.dadosSensiveis.efeitos);
				
				for i = 1, #lEfeitos, 1 do
					local ef = lEfeitos[i];
					local duracao = tonumber(ef.duracao);
										
					if (duracao ~= nil) and (duracao > 0) then
						local duracaoReal = tonumber(ef.duracaoReal);					
					
						if duracaoReal == nil then
							duracaoReal = duracao;
							ef.duracaoReal = duracaoReal;
						end;
						
						local duracaoRealRestante = duracaoReal - (relogioAtual - relogioOld);
						local constanteMargemSuperior = 0.000001;
																		
						if duracaoRealRestante < constanteMargemSuperior then
							local nomeEfeito = ef.descricao;
							ndb.deleteNode(ef);
							
							if nomeEfeito ~= nil and ator.nome ~= nil then
								local fof = ator.fof or 0;
								local enviarNarracao = (ndb.getPermission(ator, "group", "espectadores", "read") ~= "deny") and
								                       (fof ~= 3) and (ator.visibilityState ~= ATOR_VIEW_STATE_PARC_VISIVEL); -- não é inimigo;
													   
								local notificacao = "[§K15] >> [§K1]O efeito [§K7]" .. nomeEfeito .. "[§K1] de " .. self:getNomeColoridoDe(ator) .. "[§K1] chegou ao fim";
								
								if enviarNarracao then
									self:narrar(notificacao);
								else
									self:escrever(notificacao);
								end;
							end;
						else
							ef.duracaoReal = duracaoRealRestante;
							local duracaoRestanteArredondada = math.ceil(duracaoRealRestante - constanteMargemSuperior);							
						
							if duracaoRestanteArredondada ~= duracao then
								ef.duracao = duracaoRestanteArredondada;
							end;
						end;						
						
					end;					
				end;
			end;
		end;
		
		function self:avancarRelogio(rodadas)
			-- esta função avança o relógio do combat tracker, podendo remover automaticamente os efeitos
			-- dos atores
			--  OBS: O parâmetro "rodadas" virá com valor "quebrado", exemplo: 0.5, 0.3, etc..
							
			rodadas = rodadas or 1.0;
			local relogioAtual = tonumber(sheet.relogio) or 0.0;
			local relogioOld = relogioAtual;
			local atores = getAtoresNodes();			
			
			relogioAtual = relogioAtual + rodadas;
			
			for i = 1, #atores, 1 do
				self:avancarRelogioDeAtor(atores[i], relogioAtual, relogioOld);
			end;
						
			sheet.relogio = relogioAtual;
		end;
		
		function self:proximoTurno()
			if not self:souMestre() then
				return;
			end;
		
			local atores = getAtoresNodes();
			local atorComVez = nil;
			local idxAtorComVez = nil;
			local novaRodada = false;
			
			if #atores > 0 then			
				table.sort(atores,
					function(nodeA, nodeB)
						return self:compareNodes(nodeA, nodeB) < 0;
					end);
			
				for i = 1, #atores, 1 do
					local a = atores[i];
					
					if a.vez then
						atorComVez = a;
						idxAtorComVez = i;	
						break;					
					end;
				end;			

				if idxAtorComVez == nil then
					idxAtorComVez = 1;
				else					
					idxAtorComVez = idxAtorComVez + 1;
				end;
				
				if idxAtorComVez < 1 then
					idxAtorComVez = 1;
				elseif idxAtorComVez > #atores then
					idxAtorComVez = 1;
					novaRodada = true;
				end;
				
				self:ativarTurnoDe(atores[idxAtorComVez]);
				
				if novaRodada then
					sheet.rodada = (tonumber(sheet.rodada or 0) or 0) + 1;
				end;
			end;
			
			if tonumber(sheet.rodada) == nil then
				sheet.rodada = 1;
			end;
			
			if #atores > 0 then
				self:avancarRelogio(1 / #atores);
			else
				self:avancarRelogio(1);			
			end;
		end;
		
		function self:tratarNovoAtor(node)
			if node ~= nil then
				local g = (sheet.generator or 0) + 1;
				sheet.generator = g;				
				node._id = g;
			end;
		end;
		
		function self:criarNovoAtor()
			local novoNode = nil;
			ndb.beginUpdate(sheet);
			
			tryFinally(function()
					novoNode = self.rclAtores:append();
					self:tratarNovoAtor(novoNode);
				end,
				
				function()
					ndb.endUpdate(sheet);
				end);
				
			return novoNode;
		end;
		
		function self:limpar()		
			local n = sheet;
			
			dialogs.confirmYesNo("Deseja realmente limpar o Tracker de Combate?",
				function(confirmado)
					if confirmado then
						n.atores = {};
						n.rodada = 1;
						n.relogio = 0;
					end;
				end);
		end;
		
		function self:exibirMenuDoAtor(node, form)
			self.popAtor.node = node;
			self.popAtorForm = form;
			self.popAtor:show("mouseCenter", form);
		end;
		
		function self:scrollToAtor(node)
			self.rclAtores:scrollToNode(node);
		end;

		self.listenersAtivo = false;
		self.listenerHandleChatCommand = nil;
		self.listenerListChatCommands = nil;
			
		local function verificarEstadoMsgEvents()			
			local deveUsarListeners = self.visible and sheet ~= nil;
			local mesaAcoplada = rrpg.getMesaDe(sheet);
			
			if deveUsarListeners and not self.listenersAtivo and mesaAcoplada ~= nil then				
			
				-- ativar listeners
				self.listenersAtivo = true;
				
				self.listenerHandleChatCommand = rrpg.messaging.listen("HandleChatCommand", 
					function(msg)
						if (msg.comando == ">>") and (self:souMestre()) then
							self:proximoTurno();
							msg.response = {handled = true};
						end;					
					end, {mesa = mesaAcoplada});
					
				self.listenerListChatCommands = rrpg.messaging.listen("ListChatCommands", 
					function(msg)
						if self:souMestre() then
							msg.response = {{comando="/>>", descricao="Iniciar o próximo turno (Tracker de Combate)"}};
						end;						
					end, {mesa = mesaAcoplada});					
				
			elseif not deveUsarListeners and self.listenersAtivo then
				-- desativar listeners;				
				self.listenersAtivo = false;
				rrpg.messaging.unlisten(self.listenerHandleChatCommand);
				rrpg.messaging.unlisten(self.listenerListChatCommands);				
				self.listenerHandleChatCommand = nil;
				self.listenerListChatCommands = nil;				
			end
		end;		
			
		self.onScopeNodeChanged = verificarEstadoMsgEvents;							
		self.onShow = verificarEstadoMsgEvents;
		self.onHide = verificarEstadoMsgEvents;
		
		local function dropPersonagemActor(personagem)
			if personagem == nil then
				return;
			end;
		
			local atores = ndb.getChildNodes(getAtoresNDB());
			local atorDoPersonagem = nil;	
		    local chavePer = personagem.codigoInterno;

			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a.chavePer ~= nil and a.chavePer == chavePer then
					atorDoPersonagem = a;
					break;
				end;
			end;
			
			if atorDoPersonagem == nil then
				atorDoPersonagem = self:criarNovoAtor();
				atorDoPersonagem.chavePer = chavePer;				
			end;
			
			atorDoPersonagem.nome = personagem.nome;
			
			if personagem.loginDono ~= "" then			
				atorDoPersonagem.fof = 1;
			else
				atorDoPersonagem.fof = 2;
			end;
			
			return atorDoPersonagem;			
		end;
		
		local function dropJogadorActor(jogador)					
			local mesa = rrpg.getMesaDe(jogador);
			
			if mesa ~= nil then
				local chavePer = jogador.personagemPrincipal;
				local personagem = mesa:findBibliotecaItem(chavePer);
				
				if personagem ~= nil then
					return dropPersonagemActor(personagem);					
				end;							
			end;
		
			local atores = ndb.getChildNodes(getAtoresNDB());
			local atorDoJogador = nil;
			local loginJogador = string.lower(jogador.login);

			for i = 1, #atores, 1 do
				local a = atores[i];
				
				if a.login ~= nil and string.lower(a.login) == loginJogador then
					atorDoJogador = a;
					break;
				end;
			end;
			
			if atorDoJogador == nil then
				atorDoJogador = self:criarNovoAtor();
				atorDoJogador.login = loginJogador;				
			end;
			
			atorDoJogador.nome = jogador.nick;
			atorDoJogador.fof = 1;
			
			return atorDoJogador;
		end;
		
		function self.handleStartDrop(drop, x, y, drag)
			drop:addAction('characters',
				function(value)
					for i = 1, #value, 1 do
						dropPersonagemActor(value[i]);
					end
				end);		
		
			drop:addAction('character',
				function(value)
					dropPersonagemActor(value);
				end);		
		
			drop:addAction('players',
				function(value)
					for i = 1, #value, 1 do
						dropJogadorActor(value[i]);
					end
				end);		
		
			drop:addAction('player',
				function(value)
					dropJogadorActor(value);
				end);
		end;
		
		function self:createDraggerForAtor(ator)
			local tracker = self;
		
			return function(drag, x, y)
					  drag:addData('text', tostring(ator.nome));
					  local mesa = rrpg.getMesaDe(tracker);
					  
					  if mesa ~= nil then
						local jogador = mesa:findJogador(tostring(ator.login or ""));
						
						if jogador ~= nil then
							drag:addData('player', jogador);
						end;
						
						local personagem = mesa:findBibliotecaItem(tonumber(ator.chavePer) or -1);
						
						if personagem ~= nil then
							drag:addData('character', personagem);
						end;
					  end;					  
				   end;
		end;
	


    obj.layTopTracker = gui.fromHandle(_obj_newObject("layout"));
    obj.layTopTracker:setParent(obj);
    obj.layTopTracker:setName("layTopTracker");
    obj.layTopTracker:setAlign("top");
    obj.layTopTracker:setHeight(18);
    obj.layTopTracker:setMargins({left=2, right=2, top=2});

    obj.btnAddAtor = gui.fromHandle(_obj_newObject("button"));
    obj.btnAddAtor:setParent(obj.layTopTracker);
    obj.btnAddAtor:setName("btnAddAtor");
    obj.btnAddAtor:setText("");
    obj.btnAddAtor:setHint("Adicionar um novo ator ao Tracker");
    obj.btnAddAtor:setWidth(24);
    obj.btnAddAtor:setAlign("left");
    obj.btnAddAtor:setMargins({left=2, right=2});

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.btnAddAtor);
    obj.image1:setAlign("client");
    obj.image1:setSRC("/GerenciadorDeCampanha/images/addIcon.png");
    obj.image1:setName("image1");

    obj.btnRoll = gui.fromHandle(_obj_newObject("button"));
    obj.btnRoll:setParent(obj.layTopTracker);
    obj.btnRoll:setName("btnRoll");
    obj.btnRoll:setText("R");
    obj.btnRoll:setAlign("left");
    obj.btnRoll:setHint("Faz os testes de iniciativa de todos.");
    obj.btnRoll:setWidth(24);
    obj.btnRoll:setMargins({left=2, right=2});

    obj.btnUpdate = gui.fromHandle(_obj_newObject("button"));
    obj.btnUpdate:setParent(obj.layTopTracker);
    obj.btnUpdate:setName("btnUpdate");
    obj.btnUpdate:setText("A");
    obj.btnUpdate:setAlign("left");
    obj.btnUpdate:setHint("Atualiza a ordem de iniciativa");
    obj.btnUpdate:setWidth(24);
    obj.btnUpdate:setMargins({left=2, right=2});

    obj.btnAddAll = gui.fromHandle(_obj_newObject("button"));
    obj.btnAddAll:setParent(obj.layTopTracker);
    obj.btnAddAll:setName("btnAddAll");
    obj.btnAddAll:setText("T");
    obj.btnAddAll:setAlign("left");
    obj.btnAddAll:setHint("Adiciona todos com +Jogador a lista.");
    obj.btnAddAll:setWidth(24);
    obj.btnAddAll:setMargins({left=2, right=2});

    obj.btnLimpar = gui.fromHandle(_obj_newObject("button"));
    obj.btnLimpar:setParent(obj.layTopTracker);
    obj.btnLimpar:setName("btnLimpar");
    obj.btnLimpar:setText("Limpar");
    obj.btnLimpar:setAlign("right");
    obj.btnLimpar:setWidth(60);
    obj.btnLimpar:setMargins({left=2, right=2});

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(16);
    obj.layout1:setPadding({left=2, right=2});
    obj.layout1:setName("layout1");
    obj.layout1:setMargins({left=2, right=2});

    obj.layHeader0 = gui.fromHandle(_obj_newObject("layout"));
    obj.layHeader0:setParent(obj.layout1);
    obj.layHeader0:setName("layHeader0");
    obj.layHeader0:setWidth(23);
    obj.layHeader0:setAlign("left");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText(" Teste   Nome");
    obj.label1:setName("label1");
    obj.label1:setFontSize(11);
    obj.label1:setMargins({left=3});
    obj.label1:setWidth(28);
    obj.label1:setAlign("client");

    obj.layRightAlinedTitle = gui.fromHandle(_obj_newObject("layout"));
    obj.layRightAlinedTitle:setParent(obj.layout1);
    obj.layRightAlinedTitle:setName("layRightAlinedTitle");
    obj.layRightAlinedTitle:setAlign("right");
    obj.layRightAlinedTitle:setWidth(78);

    obj.labTitIniciativa = gui.fromHandle(_obj_newObject("label"));
    obj.labTitIniciativa:setParent(obj.layRightAlinedTitle);
    obj.labTitIniciativa:setName("labTitIniciativa");
    obj.labTitIniciativa:setText("Init");
    obj.labTitIniciativa:setHorzTextAlign("center");
    obj.labTitIniciativa:setFontSize(11);
    obj.labTitIniciativa:setMargins({left=3});
    obj.labTitIniciativa:setWidth(28);
    obj.labTitIniciativa:setAlign("left");

    obj.labTitFoF = gui.fromHandle(_obj_newObject("label"));
    obj.labTitFoF:setParent(obj.layRightAlinedTitle);
    obj.labTitFoF:setName("labTitFoF");
    obj.labTitFoF:setText("A/H");
    obj.labTitFoF:setHorzTextAlign("center");
    obj.labTitFoF:setFontSize(11);
    obj.labTitFoF:setMargins({left=3});
    obj.labTitFoF:setWidth(25);
    obj.labTitFoF:setAlign("left");


		if system.isMobile() then
			self.layTopTracker.height = 32;
			self.btnAddAtor.width = self.layTopTracker.height;
			self.layHeader0.width = 32;
			self.layRightAlinedTitle.width = 108;
			self.layRightAlinedTitle.width = 108;
			self.labTitFoF.width = 32;
			self.labTitIniciativa.width = 32;
		end;
	


    obj.rclAtores = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAtores:setParent(obj);
    obj.rclAtores:setName("rclAtores");
    obj.rclAtores:setAlign("client");
    obj.rclAtores:setField("atores");
    obj.rclAtores:setTemplateForm("frmAtorCombatTracker");
    obj.rclAtores:setMargins({top=1});

    obj.layTrackerBottom = gui.fromHandle(_obj_newObject("layout"));
    obj.layTrackerBottom:setParent(obj);
    obj.layTrackerBottom:setName("layTrackerBottom");
    obj.layTrackerBottom:setAlign("bottom");
    obj.layTrackerBottom:setHeight(28);
    obj.layTrackerBottom:setMargins({top=2, left=2, bottom=2, right=2});

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layTrackerBottom);
    obj.button1:setText("Próx. turno");
    obj.button1:setFontSize(11);
    obj.button1:setWidth(70);
    obj.button1:setAlign("left");
    obj.button1:setName("button1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layTrackerBottom);
    obj.layout2:setAlign("right");
    obj.layout2:setWidth(68);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setAlign("left");
    obj.label2:setAutoSize(true);
    obj.label2:setText("Rodada");
    obj.label2:setWordWrap(false);
    obj.label2:setFontSize(11);
    obj.label2:setName("label2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setField("rodada");
    obj.edit1:setAlign("client");
    obj.edit1:setType("number");
    obj.edit1:setMin(0);
    obj.edit1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setName("edit1");


		if system.isMobile() then
			self.layTrackerBottom.height = 32;
		end;
		
		self.onStartDrop = self.handleStartDrop;
		self.rclAtores.onStartDrop = self.handleStartDrop;
	


    obj._e_event0 = obj.btnAddAtor:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					shoMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				self:criarNovoAtor();
        end, obj);

    obj._e_event1 = obj.btnRoll:addEventListener("onClick",
        function (self)
            local nodes = ndb.getChildNodes(sheet.atores);
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					shoMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				for i=1, #nodes, 1 do
            					if nodes[i].iniciativaBonus ~= nil then
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. nodes[i].iniciativaBonus);
            
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Iniciativa de " .. (nodes[i].nome or "Nome"),
            								function (rolado)
            									nodes[i].iniciativa = rolado.resultado;
            									self.rclAtores:sort();
            								end); 
            					end;
            				end
        end, obj);

    obj._e_event2 = obj.btnUpdate:addEventListener("onClick",
        function (self)
            self.rclAtores:sort()
        end, obj);

    obj._e_event3 = obj.btnAddAll:addEventListener("onClick",
        function (self)
            local jogadores = rrpg.getMesaDe(sheet).jogadores;
            				local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            
            				if not mesaDoPersonagem.meuJogador.isGold then
            					shoMessage("Apenas para usuarios Gold!");
            					return;
            				end;
            
            				for i=1, #jogadores, 1 do
            					if jogadores[i].isJogador then
            						local ator = self:criarNovoAtor();
            						ator.nome = utils.removerFmtChat(jogadores[i].nick)
            						ator.fof = 1;
            					end;
            				end
        end, obj);

    obj._e_event4 = obj.btnLimpar:addEventListener("onClick",
        function (self)
            self:limpar();
        end, obj);

    obj._e_event5 = obj.rclAtores:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return self:compareNodes(nodeA, nodeB);
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (self)
            self:proximoTurno();
        end, obj);

    function obj:_releaseEvents()
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

        if self.btnAddAll ~= nil then self.btnAddAll:destroy(); self.btnAddAll = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.labTitFoF ~= nil then self.labTitFoF:destroy(); self.labTitFoF = nil; end;
        if self.btnRoll ~= nil then self.btnRoll:destroy(); self.btnRoll = nil; end;
        if self.layTopTracker ~= nil then self.layTopTracker:destroy(); self.layTopTracker = nil; end;
        if self.labTitIniciativa ~= nil then self.labTitIniciativa:destroy(); self.labTitIniciativa = nil; end;
        if self.rclAtores ~= nil then self.rclAtores:destroy(); self.rclAtores = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layRightAlinedTitle ~= nil then self.layRightAlinedTitle:destroy(); self.layRightAlinedTitle = nil; end;
        if self.btnAddAtor ~= nil then self.btnAddAtor:destroy(); self.btnAddAtor = nil; end;
        if self.btnUpdate ~= nil then self.btnUpdate:destroy(); self.btnUpdate = nil; end;
        if self.btnLimpar ~= nil then self.btnLimpar:destroy(); self.btnLimpar = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.layTrackerBottom ~= nil then self.layTrackerBottom:destroy(); self.layTrackerBottom = nil; end;
        if self.layHeader0 ~= nil then self.layHeader0:destroy(); self.layHeader0 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmCombatTracker = {
    newEditor = newfrmCombatTracker, 
    new = newfrmCombatTracker, 
    name = "frmCombatTracker", 
    dataType = "RRPG.TB.COMBAT.TRACKER.v1", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Tracker de Combate", 
    description=""};

frmCombatTracker = _frmCombatTracker;
rrpg.registrarForm(_frmCombatTracker);
rrpg.registrarDataType(_frmCombatTracker);
rrpg.registrarSpecialForm(_frmCombatTracker);

return _frmCombatTracker;
