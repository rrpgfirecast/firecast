require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmAtorCombatTracker()
    __o_rrpgObjs.beginObjectsLoading();

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
    obj:setName("frmAtorCombatTracker");
    obj:setHeight(47);


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
			if self == nil or self.popAtor == nil then return end;
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
	



		local preparedVez = false;
	
		local ATOR_VIEW_STATE_VISIVEL = 0;
		local ATOR_VIEW_STATE_PARC_VISIVEL = 1;
		local ATOR_VIEW_STATE_INVISIVEL = 2;
	
		local function getTracker()
			return self:findControlByName("frmCombatTracker");
		end;	
	
		function self:atualizarInterfaceFriendOrFoe()
			local f = sheet.fof;
				
			if f == 1 then
				-- Amigo				
				self.rctFriendOrFoe.color = "lime";
				self.rctFriendOrFoe.hint = "Amigável";
				self.rctOuter.color = "#00FF0016";
				self.rctOuter.strokeColor = "#00FF00A0";				
			elseif f == 2 then
				-- Neutro
				self.rctFriendOrFoe.color = "yellow";
				self.rctFriendOrFoe.hint = "Neutro";
				self.rctOuter.color = "#FFFF0016";
				self.rctOuter.strokeColor = "#FFFF00A0";				
			elseif f == 3 then
				-- Inimigo
				self.rctFriendOrFoe.color = "red";
				self.rctFriendOrFoe.hint = "Hostil";
				self.rctOuter.color = "#FF000016";
				self.rctOuter.strokeColor = "#FF0000B0";								
			else
				self.rctFriendOrFoe.color = "#00000000"; -- Transparente
				self.rctFriendOrFoe.hint = "Amigável ou Hostil?";
				self.rctOuter.color = "#00000000";
				self.rctOuter.strokeColor = "#FFFFFFA0";								
				-- Desconhecido
			end;					
		end;
		
		function self:nextFriendOrFoeFlag()
			local f = tonumber(sheet.fof or 0) or 0;		
			sheet.fof = (f + 1) % 4;
		end;
		
		function self:atualizarInterfaceVez()
			local v = not not sheet.vez;
			
			if v ~= preparedVez then
				preparedVez = v;				
				self.imgVez.visible = v;				
				
				if v == true then		
					self.rctOuter.strokeSize = 2;
					--self.rctOuter.padding = {left=2, top=2, right=2, bottom=2};
				else
					self.rctOuter.strokeSize = 0;
					--self.rctOuter.padding = {};
				end;
				
				self:recalcularAlturaDoAtor();
			end;					
		end;

		function self:getNomeColorido()
			local corAsNumero;
			local fof = sheet.fof;
			
			if fof == 1 then
				corAsNumero = 3; -- Amigo
			elseif fof == 2 then
				corAsNumero = 8;  -- Neutro
			elseif fof == 3 then
				corAsNumero = 4;  -- Inimigo
			else
				corAsNumero = 14; -- Não definido
			end;	

			return "[§K" .. corAsNumero .. "]" .. sheet.nome;			
		end;
		
		function self:setarTurnoDesteAtor()
			local headerTralha = "[§K15] >>";
			local footerTralha = "";
			local notificacaoDeTurno = "[§K1]" .. headerTralha .. "[§K1] Turno de " .. self:getNomeColorido() .. "[§K1] " .. footerTralha;


			if (ndb.getPermission(node, "group", "espectadores", "read") ~= "deny") then			   
				local mesa = rrpg.getMesaDe(sheet);
				if mesa ~= nil then
					local chat = mesa.chat;
					
					if chat ~= nil then
						chat:enviarNarracao(notificacaoDeTurno);
					end;
				end;
			else					
				self:escrever(notificacaoDeTurno);
			end;

			local node = ndb.getRoot(sheet);
			local atores;
			if node.atores == nil then
				atores = {};
			else
				atores =  ndb.getChildNodes(node.atores);
			end;
			
			for i=1, #atores, 1 do
				atores[i].vez = false;
			end;
			sheet.vez = true;
		end;
			
		
		function self:recalcularAlturaDoAtor()
			local function getAlturaDeCtrl(ctrl)
				local m = ctrl.margins;
				return ctrl.height + (m.top or 0) + (m.bottom or 0);
			end;
		
			local p = self.rctOuter.padding;
		
			local h = getAlturaDeCtrl(self.layPrimeiraLinha) +
				   	 getAlturaDeCtrl(self.laySegundaLinha) +
					 getAlturaDeCtrl(self.rclEfeitos) + 
					 p.top;					 		
					 
			if self.height ~= h then
				self.height = h;
			end;
		end;
		
		function self:apagarAtor()
			local n = sheet;
			
			dialogs.confirmYesNo("Deseja realmente apagar este ator?",
				function(confirmado)
					if confirmado then
						if n.vez then
							getTracker():proximoTurno();
						end;
						
						ndb.deleteNode(n);
					end;
				end);
		end;
		
		local function agendarReordenacao()
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

		function self:reordenar()
			--self:sort()
			scheduledSort = false;
		end;
		
		function self:exibirMenuDoAtor()
			getTracker():exibirMenuDoAtor(sheet, self);
		end;
		
		function self:adicionarEfeito()
			self.rclEfeitos:append();
			
			setTimeout(function()
						getTracker():scrollToAtor(sheet);
					   end, 50);	
		end;
		
		function self:getCurrentViewState()
			local estaInvisivel = (ndb.getPermission(sheet, "group", "espectadores", "read") == "deny" or
			                       ndb.getPermission(sheet, "group", "jogadores", "read") == "deny");
								   
			local estaParcialmenteVisivel;
			estaParcialmenteVisivel = sheet.visibilityState == ATOR_VIEW_STATE_PARC_VISIVEL;
				
			if estaInvisivel or (sheet.visibilityState == ATOR_VIEW_STATE_INVISIVEL) then
				return ATOR_VIEW_STATE_INVISIVEL;
			elseif estaParcialmenteVisivel then
				return ATOR_VIEW_STATE_PARC_VISIVEL;
			else
				return ATOR_VIEW_STATE_VISIVEL;
			end;		
		end;
		
		function self:atualizarIndicacaoVisibilidade()
			local currViewState = self:getCurrentViewState();			
			local urlImg;
			local hintAUsar;
			local segundaLinhaDeveEstarVisivel = true;
			
			if currViewState == ATOR_VIEW_STATE_INVISIVEL then
				urlImg = "/GerenciadorDeCampanha/images/invisivel2.png";
				hintAUsar = "Ator visível APENAS para mestres";
			elseif currViewState == ATOR_VIEW_STATE_PARC_VISIVEL then
				urlImg = "/GerenciadorDeCampanha/images/visivelParcial.png"
				hintAUsar = "Ator visível a todos, porém anotações e efeitos escondidos";
				
				local mesa = rrpg.getMesaDe(sheet);
				local meuJogador;
				
				if mesa ~= nil then
					meuJogador = mesa.meuJogador;
				else
					meuJogador = nil;
				end;
				
				if meuJogador ~= nil then				
					segundaLinhaDeveEstarVisivel = meuJogador.isMestre or meuJogador.isJuggernaut;
				end;
				
				if mesa == nil then
					segundaLinhaDeveEstarVisivel = false;				
				end;
			else
				urlImg = "/GerenciadorDeCampanha/images/visivel2.png";
				hintAUsar = "Ator visível a todos";	
			end;
			
			self.imgInvisivel.src = urlImg;
			self.imgInvisivel.hint = hintAUsar;
			self.edtAnotacoes.visible = segundaLinhaDeveEstarVisivel;
			self.imgAddEfeito.visible = self.edtAnotacoes.visible;
			self.imgInvisivel.visible = self.edtAnotacoes.visible;
		end;
		
		function self:alternarVisibilidade()						
			if ndb.testPermission(sheet, "writePermissions") and ndb.testPermission(sheet, "write") then		
				local dadosSensiveisNode = sheet.dadosSensiveis;
				
				if dadosSensiveisNode == nil then
					if not ndb.testPermission(sheet, "createChild") then
						-- não há permissao para crair nodes
						return;
					end;
					
					sheet.dadosSensiveis = {};
					dadosSensiveisNode = sheet.dadosSensiveis;
				else
					if not ndb.testPermission(dadosSensiveisNode, "writePermissions") then
						-- Não há permissão para escreve permissoes neste sub-node
						return;
					end;
				end;
			
				local currViewState = self:getCurrentViewState();
				
				if currViewState == ATOR_VIEW_STATE_PARC_VISIVEL then
					-- tornar invisivel
					sheet.visibilityState = ATOR_VIEW_STATE_INVISIVEL;					
					ndb.setPermission(sheet, "group", "espectadores", "read", "deny");
					ndb.setPermission(sheet, "group", "jogadores", "read", "deny");		
					ndb.setPermission(sheet, "group", "espectadores", "createChild", "deny");
					ndb.setPermission(sheet, "group", "jogadores", "createChild", "deny");	
				elseif currViewState == ATOR_VIEW_STATE_INVISIVEL then
					-- tornar visivel
					sheet.visibilityState = ATOR_VIEW_STATE_VISIVEL;	
					ndb.setPermission(dadosSensiveisNode, "group", "espectadores", "read", nil);
					ndb.setPermission(dadosSensiveisNode, "group", "jogadores", "read", nil);						
					ndb.setPermission(sheet, "group", "espectadores", "createChild", nil);
					ndb.setPermission(sheet, "group", "jogadores", "createChild", nil);		
					ndb.setPermission(sheet, "group", "espectadores", "read", nil);
					ndb.setPermission(sheet, "group", "jogadores", "read", nil);				
				else
					-- tornar parcialmente visivel
					sheet.visibilityState = ATOR_VIEW_STATE_PARC_VISIVEL;
					ndb.setPermission(dadosSensiveisNode, "group", "espectadores", "read", "deny");
					ndb.setPermission(dadosSensiveisNode, "group", "jogadores", "read", "deny");						
					ndb.setPermission(sheet, "group", "espectadores", "createChild", "deny");
					ndb.setPermission(sheet, "group", "jogadores", "createChild", "deny");							
					ndb.setPermission(sheet, "group", "espectadores", "read", nil);
					ndb.setPermission(sheet, "group", "jogadores", "read", nil);																									
				end;
			end;
		end;		
	


    obj.rctOuter = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rctOuter:setParent(obj);
    obj.rctOuter:setName("rctOuter");
    obj.rctOuter:setAlign("client");
    obj.rctOuter:setColor("#00000000");
    obj.rctOuter:setStrokeSize(0);
    obj.rctOuter:setStrokeColor("#FFFFFFA0");
    obj.rctOuter:setPadding({left=3, top=3, right=2, bottom=3});
    obj.rctOuter:setHitTest(true);

    obj.layPrimeiraLinha = GUI.fromHandle(_obj_newObject("layout"));
    obj.layPrimeiraLinha:setParent(obj.rctOuter);
    obj.layPrimeiraLinha:setName("layPrimeiraLinha");
    obj.layPrimeiraLinha:setAlign("top");
    obj.layPrimeiraLinha:setHeight(20);
    obj.layPrimeiraLinha:setMargins({left=2, right=2});

    obj.rctVez = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rctVez:setParent(obj.layPrimeiraLinha);
    obj.rctVez:setName("rctVez");
    obj.rctVez:setColor("#00000000");
    obj.rctVez:setStrokeSize(1);
    obj.rctVez:setStrokeColor("black");
    obj.rctVez:setXradius(2);
    obj.rctVez:setYradius(2);
    obj.rctVez:setHitTest(true);
    obj.rctVez:setCursor("handPoint");
    obj.rctVez:setWidth(23);
    obj.rctVez:setAlign("left");

    obj.imgVez = GUI.fromHandle(_obj_newObject("image"));
    obj.imgVez:setParent(obj.rctVez);
    obj.imgVez:setName("imgVez");
    obj.imgVez:setAlign("client");
    obj.imgVez:setHeight(24);
    obj.imgVez:setVisible(false);
    obj.imgVez:setSRC("/GerenciadorDeCampanha/images/vez.png");

    obj.edtNome = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNome:setParent(obj.layPrimeiraLinha);
    obj.edtNome:setName("edtNome");
    obj.edtNome:setField("nome");
    obj.edtNome:setFontSize(11);
    obj.edtNome:setMargins({left=3});
    obj.edtNome:setWidth(28);
    obj.edtNome:setAlign("client");

    obj.edtIniciativaBonus = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtIniciativaBonus:setParent(obj.layPrimeiraLinha);
    obj.edtIniciativaBonus:setName("edtIniciativaBonus");
    obj.edtIniciativaBonus:setField("iniciativaBonus");
    obj.edtIniciativaBonus:setType("number");
    obj.edtIniciativaBonus:setHorzTextAlign("center");
    obj.edtIniciativaBonus:setFontSize(11);
    obj.edtIniciativaBonus:setMargins({left=3});
    obj.edtIniciativaBonus:setWidth(28);
    obj.edtIniciativaBonus:setAlign("left");

    obj.layRightAlinedComps = GUI.fromHandle(_obj_newObject("layout"));
    obj.layRightAlinedComps:setParent(obj.layPrimeiraLinha);
    obj.layRightAlinedComps:setName("layRightAlinedComps");
    obj.layRightAlinedComps:setAlign("right");
    obj.layRightAlinedComps:setWidth(78);

    obj.edtIniciativa = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtIniciativa:setParent(obj.layRightAlinedComps);
    obj.edtIniciativa:setName("edtIniciativa");
    obj.edtIniciativa:setField("iniciativa");
    obj.edtIniciativa:setType("number");
    obj.edtIniciativa:setHorzTextAlign("center");
    obj.edtIniciativa:setFontSize(11);
    obj.edtIniciativa:setMargins({left=3});
    obj.edtIniciativa:setWidth(28);
    obj.edtIniciativa:setAlign("left");

    obj.rctFriendOrFoe = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rctFriendOrFoe:setParent(obj.layRightAlinedComps);
    obj.rctFriendOrFoe:setName("rctFriendOrFoe");
    obj.rctFriendOrFoe:setColor("#00000000");
    obj.rctFriendOrFoe:setStrokeColor("black");
    obj.rctFriendOrFoe:setStrokeSize(2);
    obj.rctFriendOrFoe:setXradius(4);
    obj.rctFriendOrFoe:setYradius(4);
    obj.rctFriendOrFoe:setHitTest(true);
    obj.rctFriendOrFoe:setCursor("handPoint");
    obj.rctFriendOrFoe:setHint("Amigável ou Hostil?");
    obj.rctFriendOrFoe:setMargins({left=3});
    obj.rctFriendOrFoe:setWidth(25);
    obj.rctFriendOrFoe:setAlign("left");

    obj.imgDeleteAtor = GUI.fromHandle(_obj_newObject("image"));
    obj.imgDeleteAtor:setParent(obj.layRightAlinedComps);
    obj.imgDeleteAtor:setName("imgDeleteAtor");
    obj.imgDeleteAtor:setHitTest(true);
    obj.imgDeleteAtor:setCursor("handPoint");
    obj.imgDeleteAtor:setSRC("/GerenciadorDeCampanha/images/delete 2.png");
    obj.imgDeleteAtor:setMargins({left=5});
    obj.imgDeleteAtor:setWidth(15);
    obj.imgDeleteAtor:setAlign("left");

    obj.laySegundaLinha = GUI.fromHandle(_obj_newObject("layout"));
    obj.laySegundaLinha:setParent(obj.rctOuter);
    obj.laySegundaLinha:setName("laySegundaLinha");
    obj.laySegundaLinha:setAlign("top");
    obj.laySegundaLinha:setHeight(20);
    obj.laySegundaLinha:setMargins({top=1, left=28, right=10});

    obj.edtAnotacoes = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtAnotacoes:setParent(obj.laySegundaLinha);
    obj.edtAnotacoes:setAlign("client");
    obj.edtAnotacoes:setField("dadosSensiveis.notas");
    obj.edtAnotacoes:setTransparent(true);
    obj.edtAnotacoes:setHint("Anotações");
    obj.edtAnotacoes:setName("edtAnotacoes");
    obj.edtAnotacoes:setFontSize(11);

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.edtAnotacoes);
    obj.horzLine1:setAlign("bottom");
    obj.horzLine1:setStrokeColor("black");
    obj.horzLine1:setStrokeSize(1);
    obj.horzLine1:setName("horzLine1");

    obj.imgInvisivel = GUI.fromHandle(_obj_newObject("image"));
    obj.imgInvisivel:setParent(obj.laySegundaLinha);
    obj.imgInvisivel:setAlign("right");
    obj.imgInvisivel:setName("imgInvisivel");
    obj.imgInvisivel:setWidth(14);
    obj.imgInvisivel:setHint("Ator visivel a todos");
    obj.imgInvisivel:setHitTest(true);
    obj.imgInvisivel:setCursor("handPoint");
    obj.imgInvisivel:setSRC("images/visivel 2.png");

    obj.imgAddEfeito = GUI.fromHandle(_obj_newObject("image"));
    obj.imgAddEfeito:setParent(obj.laySegundaLinha);
    obj.imgAddEfeito:setAlign("right");
    obj.imgAddEfeito:setHitTest(true);
    obj.imgAddEfeito:setSRC("/GerenciadorDeCampanha/images/addEffect.png");
    obj.imgAddEfeito:setCursor("handPoint");
    obj.imgAddEfeito:setHint("Adicionar um efeito a este ator");
    obj.imgAddEfeito:setWidth(14);
    obj.imgAddEfeito:setMargins({left=4});
    obj.imgAddEfeito:setName("imgAddEfeito");

    obj.rclEfeitos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEfeitos:setParent(obj.rctOuter);
    obj.rclEfeitos:setMargins({left=28, top=1, right=14});
    obj.rclEfeitos:setName("rclEfeitos");
    obj.rclEfeitos:setAlign("top");
    obj.rclEfeitos:setAutoHeight(true);
    obj.rclEfeitos:setField("dadosSensiveis.efeitos");
    obj.rclEfeitos:setTemplateForm("frmEfeitoCombatTracker");


			if system.isMobile() then
				self.layPrimeiraLinha.height = 32;
				self.rctVez.width = 32;
				self.edtNome.fontSize = 13;					
				self.rctFriendOrFoe.width = 32;
				self.edtIniciativa.width = 32;
				self.imgDeleteAtor.width = 32;
				self.layRightAlinedComps.width = 108;
				
				self.laySegundaLinha.height = 30;
				self.edtAnotacoes.fontSize = 12;
				self.imgInvisivel.width = 30;
				self.imgInvisivel.style = "autoFit";
				self.imgAddEfeito.width = 30;
								
				local margens = self.laySegundaLinha.margins;
				margens.left = 34;
				self.laySegundaLinha.margins = margens;
				
				margens = self.rclEfeitos.margins;
				margens.left = 34;
				self.rclEfeitos.margins = margens;
			end;
		


    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("fof");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("vez");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'iniciativa', '_id'});
    obj.dataLink3:setName("dataLink3");


		local tracker = getTracker();
		
		local function setDropRecursivo(ctrl)
			ctrl.onStartDrop = tracker.handleStartDrop;
			
			local childs = ctrl:getChildren();
			
			for i = 1, #childs, 1 do
				setDropRecursivo(childs[i]);
			end;
		end;
		
		local function setDraggerRecursivo(ctrl, dragger)
			if ctrl ~= self.rctVez then				
				ctrl.onStartDrag = dragger;
			end;
			
			local childs = ctrl:getChildren();
			
			for i = 1, #childs, 1 do
				setDraggerRecursivo(childs[i], dragger);
			end;		
		end;
		
		setDropRecursivo(self);
	


    obj._e_event0 = obj:addEventListener("onMenu",
        function (_, x, y)
            self:exibirMenuDoAtor();
        end, obj);

    obj._e_event1 = obj:addEventListener("onShow",
        function (_)
            self:recalcularAlturaDoAtor();
        end, obj);

    obj._e_event2 = obj:addEventListener("onScopeNodeChanged",
        function (_)
            if self._observer ~= nil then
            			self._observer.enabled = false;
            			self._observer = nil;
            		end;		
            		
            		if sheet ~= nil then			
            			self._observer = ndb.newObserver(sheet);
            			
            			self._observer.onDeepPermissionListChanged = 
            				function(node) 
            					self:atualizarIndicacaoVisibilidade(); 
            				end;
            			
            			self._observer.onFinalPermissionsCouldBeChanged = 
            					function(node)						
            						local souMestre = false;												
            						local mesa = rrpg.getMesaDe(sheet);
            						
            						if mesa ~= nil then
            							local meuJogador = mesa.meuJogador;
            							
            							if meuJogador ~= nil then
            								souMestre = meuJogador.isMestre or meuJogador.isJuggernaut;
            							end;
            						end;
            						
            						self.imgInvisivel.enabled = (ndb.testPermission(sheet, "writePermissions") and 
            													 ndb.testPermission(sheet, "readPermissions") and 
            													 ndb.testPermission(sheet, "write") and 
            													 ndb.testPermission(sheet, "createChild")) and
            													 souMestre;	
            						self.imgAddEfeito.enabled = self.imgInvisivel.enabled;								
            						self:atualizarIndicacaoVisibilidade(); 
            					end;
            			
            			self._observer.onChanged =
            				function(node, attribute)
            					if attribute == "visibilityState" then
            						self:atualizarIndicacaoVisibilidade();											
            					end;
            				end;
            			
            			self._observer.onFinalPermissionsCouldBeChanged();			
            			
            			local umDragger = self:findControlByName("frmCombatTracker");
            			setDraggerRecursivo(self, umDragger);
            		else
            			setDraggerRecursivo(self, nil);
            		end;
        end, obj);

    obj._e_event3 = obj.rctOuter:addEventListener("onMenu",
        function (_, x, y)
            self:exibirMenuDoAtor();
        end, obj);

    obj._e_event4 = obj.rctVez:addEventListener("onMouseUp",
        function (_, event)
            self:setarTurnoDesteAtor();
        end, obj);

    obj._e_event5 = obj.rctVez:addEventListener("onMenu",
        function (_, x, y)
            self:exibirMenuDoAtor();
        end, obj);

    obj._e_event6 = obj.edtIniciativa:addEventListener("onChange",
        function (_)
            local rcl = self:findControlByName("rclAtores");
            						if rcl~= nil then
            							rcl:sort();
            						end;
        end, obj);

    obj._e_event7 = obj.rctFriendOrFoe:addEventListener("onMouseUp",
        function (_, event)
            if event.button == 'left' then self:nextFriendOrFoeFlag(); end;
        end, obj);

    obj._e_event8 = obj.rctFriendOrFoe:addEventListener("onMenu",
        function (_, x, y)
            self:exibirMenuDoAtor();
        end, obj);

    obj._e_event9 = obj.imgDeleteAtor:addEventListener("onMouseUp",
        function (_, event)
            if event.button == 'left' then self:apagarAtor(); end;
        end, obj);

    obj._e_event10 = obj.imgDeleteAtor:addEventListener("onMenu",
        function (_, x, y)
            self:exibirMenuDoAtor();
        end, obj);

    obj._e_event11 = obj.imgInvisivel:addEventListener("onMouseUp",
        function (_, event)
            if event.button =='left' then self:alternarVisibilidade(); end;
        end, obj);

    obj._e_event12 = obj.imgAddEfeito:addEventListener("onMouseUp",
        function (_, event)
            if event.button =='left' then self:adicionarEfeito() end;
        end, obj);

    obj._e_event13 = obj.rclEfeitos:addEventListener("onResize",
        function (_)
            self:recalcularAlturaDoAtor()
        end, obj);

    obj._e_event14 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self:atualizarInterfaceFriendOrFoe();
        end, obj);

    obj._e_event15 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self:atualizarInterfaceVez();
        end, obj);

    obj._e_event16 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            agendarReordenacao();
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

        if self.edtNome ~= nil then self.edtNome:destroy(); self.edtNome = nil; end;
        if self.layRightAlinedComps ~= nil then self.layRightAlinedComps:destroy(); self.layRightAlinedComps = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rclEfeitos ~= nil then self.rclEfeitos:destroy(); self.rclEfeitos = nil; end;
        if self.rctFriendOrFoe ~= nil then self.rctFriendOrFoe:destroy(); self.rctFriendOrFoe = nil; end;
        if self.rctVez ~= nil then self.rctVez:destroy(); self.rctVez = nil; end;
        if self.imgVez ~= nil then self.imgVez:destroy(); self.imgVez = nil; end;
        if self.laySegundaLinha ~= nil then self.laySegundaLinha:destroy(); self.laySegundaLinha = nil; end;
        if self.rctOuter ~= nil then self.rctOuter:destroy(); self.rctOuter = nil; end;
        if self.imgInvisivel ~= nil then self.imgInvisivel:destroy(); self.imgInvisivel = nil; end;
        if self.edtAnotacoes ~= nil then self.edtAnotacoes:destroy(); self.edtAnotacoes = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edtIniciativaBonus ~= nil then self.edtIniciativaBonus:destroy(); self.edtIniciativaBonus = nil; end;
        if self.imgAddEfeito ~= nil then self.imgAddEfeito:destroy(); self.imgAddEfeito = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.imgDeleteAtor ~= nil then self.imgDeleteAtor:destroy(); self.imgDeleteAtor = nil; end;
        if self.edtIniciativa ~= nil then self.edtIniciativa:destroy(); self.edtIniciativa = nil; end;
        if self.layPrimeiraLinha ~= nil then self.layPrimeiraLinha:destroy(); self.layPrimeiraLinha = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAtorCombatTracker = {
    newEditor = newfrmAtorCombatTracker, 
    new = newfrmAtorCombatTracker, 
    name = "frmAtorCombatTracker", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAtorCombatTracker = _frmAtorCombatTracker;
Firecast.registrarForm(_frmAtorCombatTracker);

return _frmAtorCombatTracker;
