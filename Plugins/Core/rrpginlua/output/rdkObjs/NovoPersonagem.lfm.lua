require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmNovoPersonagem()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmNovoPersonagem");
    obj:setTitle("Criar Personagem");
    obj:setWidth(300);
    obj:setHeight(385);
    obj:setCancelable(false);


		require("rrpgRequests.lua");
	
		local function saveStateToNodeDatabase()		
			if sheet then
				if self.rdbJogador.checked then
					sheet.personagemDo = "jogador";
				else
					sheet.personagemDo = "npc";
				end;
				
				if self.rdbTodos.checked then
					sheet.quemPodeVer = "todos";
				else
					sheet.quemPodeVer = "apenasMestre";
				end;

				sheet.lastDataType = self.cmbTemplate.value;
			end;
		end;
	
		local function criarPersonagem()
			if self._estaAguardandoResposta then
				return;
			end;
		
			local nomePersonagem = self.edtNome.text or "";
			local dataType = self.cmbTemplate.value or "";
			local loginDono = self.cmbJogador.value or "";
			
			if nomePersonagem == "" then
				showMessage("Preencha o nome do personagem", function() self.edtNome:setFocus(); end);
				return false;
			end;
			
			if dataType == "" then
				showMessage("Selecione um layout de ficha", function() self.cmbTemplate:setFocus(); self.cmbTemplate:dropDown(); end);
				return false;
			end;
			
			if self.rdbJogador.checked and (loginDono == "") then
				showMessage("Selecione um jogador da lista ou opte por criar um personagem NPC", function() self.cmbJogador:setFocus(); self.cmbJogador:dropDown(); end);
				return false;
			end;
			
			saveStateToNodeDatabase();
								
			rrpg.requests.criarPersonagem(self._bibMae, nomePersonagem, dataType, self.rdbTodos.checked, self._mesa:findJogador(loginDono), 
				function()
					self._estaAguardandoResposta = false;
					self:unlockWithActivity();
					self:close();
				end,
				
				function(err)
					self._estaAguardandoResposta = false;
					self:unlockWithActivity();					
					showMessage("Não foi possível criar o personagem: " .. (err or ""));
				end);
				
			self._estaAguardandoResposta = true;				
			self:lockWithActivity("Criando personagem");		
		end;
		
		local function carregarComboDeJogadores()
			local mesa = self._mesa;			
			local jogadoresStrings = {};
			
			self.cmbJogador.values = {};
			
			if mesa ~= nil then
				local jogadores = mesa.jogadores;
				
				for i = 1, #jogadores, 1 do
					local jogador = jogadores[i];
					jogadoresStrings[#jogadoresStrings + 1] = jogador.login;
				end;
			end;
			
			utils.sortPtBrArray(jogadoresStrings);
			self.cmbJogador.items = jogadoresStrings;		
		end;
		
		local function carregarComboDeTemplates()
			local dts = rrpg.plugins.getInstalledDataTypes();
			
			local dtsToShow = {};
			
			for i = 1, #dts, 1 do
				local dt = dts[i];
				
				if dt.formType == "sheetTemplate" then
					dtsToShow[#dtsToShow + 1] = dt;
				end;
			end;
			
		
			table.sort(dtsToShow, function (esquerda, direita)
									return utils.compareStringPtBr(esquerda.title, direita.title) < 0;
								  end);									  						 

			local titles = {};
			local values = {};
			
			for i = 1, #dtsToShow, 1 do
				titles[i] = string.gsub(dtsToShow[i].title, "&", "n");
				values[i] = dtsToShow[i].dataType;
			end;
						
			self.cmbTemplate.items = titles;
			self.cmbTemplate.values = values;
		end;		
				
		local function configurarNodeDatabase()		
			local node = ndb.load("config.xml");
					
			if type(node.novoPersonagem) ~= "table" then
				node.novoPersonagem = {};
			end;
			
			node = node.novoPersonagem;
			node.personagemDo = node.personagemDo or "npc";
			node.quemPodeVer = node.quemPodeVer or "soMestre";		
			
			self._configNode = node;
			
			if node.personagemDo == "jogador" then
				self.rdbJogador.checked = true;
			else
				self.rdbNPC.checked = true;
			end;
			
			if node.quemPodeVer == "todos" then
				self.rdbTodos.checked = true;
			else
				self.rdbSoMestre.checked = true;
			end;
			
			if node.lastDataType ~= nil then
				self.cmbTemplate.value = node.lastDataType;
			end;
			
			if self.cmbTemplate.value == nil or self.cmbTemplate.value == "" then
				local templateValues = self.cmbTemplate.values;
				
				if #templateValues > 0 then
					self.cmbTemplate.value = templateValues[1];
				end;
			end;
			
			self:setNodeObject(node);
		end;
		
		local function processarRequisicaoDeCancelamento()
			if not self._estaAguardandoResposta then
				local temAlgoPreenchido = (self.edtNome.text ~= '') or (self.rdbJogador.checked and self.cmbJogador.text ~= '');	

				if temAlgoPreenchido then
					dialogs.confirmYesNo('Deseja realmente cancelar a criação do personagem?',
						function (confirmado)
							if confirmado then
								self:close();
							end
						end);				
				else
					self:close();
				end;			
			end;		
		end;
	


    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("Novo Personagem");
    obj.label1:setName("label1");
    obj.label1:setFontSize(15);
    obj.label1:setFontColor("#FFCC66");
    obj.label1:setMargins({left=4, right=4, top=3, bottom=3});
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setAlign("top");
    obj.label1:setAutoSize(true);

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setName("scrollBox1");
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setMargins({left=12, right=12, top=1, bottom=5});

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setMargins({left=10, right=10, top=5, bottom=5});
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxControlsPerLine(1);
    obj.flowLayout1:setName("flowLayout1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowLayout1);
    obj.label2:setText("Nome do Personagem:");
    obj.label2:setName("label2");
    obj.label2:setAutoSize(true);
    obj.label2:setWordWrap(false);
    obj.label2:setMargins({top=10, bottom=2});

    obj.edtNome = gui.fromHandle(_obj_newObject("edit"));
    obj.edtNome:setParent(obj.flowLayout1);
    obj.edtNome:setName("edtNome");
    obj.edtNome:setEnterKeyType("done");
    obj.edtNome:setWidth(250);

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowLayout1);
    obj.label3:setText("Layout da ficha:");
    obj.label3:setName("label3");
    obj.label3:setAutoSize(true);
    obj.label3:setWordWrap(false);
    obj.label3:setMargins({top=10, bottom=2});

    obj.cmbTemplate = gui.fromHandle(_obj_newObject("comboBox"));
    obj.cmbTemplate:setParent(obj.flowLayout1);
    obj.cmbTemplate:setName("cmbTemplate");
    obj.cmbTemplate:setWidth(250);

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowLayout1);
    obj.label4:setText("Este será um personagem:");
    obj.label4:setName("label4");
    obj.label4:setAutoSize(true);
    obj.label4:setWordWrap(false);
    obj.label4:setMargins({top=10, bottom=2});

    obj.flowLayout2 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowLayout1);
    obj.flowLayout2:setHeight(40);
    obj.flowLayout2:setMinWidth(150);
    obj.flowLayout2:setMaxWidth(600);
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setName("flowLayout2");

    obj.rdbNPC = gui.fromHandle(_obj_newObject("radioButton"));
    obj.rdbNPC:setParent(obj.flowLayout2);
    obj.rdbNPC:setName("rdbNPC");
    obj.rdbNPC:setGroupName("personagemDo");
    obj.rdbNPC:setText("NPC");
    obj.rdbNPC:setHeight(26);

    obj.flowLineBreak1 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout2);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.rdbJogador = gui.fromHandle(_obj_newObject("radioButton"));
    obj.rdbJogador:setParent(obj.flowLayout2);
    obj.rdbJogador:setName("rdbJogador");
    obj.rdbJogador:setGroupName("personagemDo");
    obj.rdbJogador:setText("Do jogador:");
    obj.rdbJogador:setWidth(100);
    obj.rdbJogador:setHeight(26);

    obj.cmbJogador = gui.fromHandle(_obj_newObject("comboBox"));
    obj.cmbJogador:setParent(obj.flowLayout2);
    obj.cmbJogador:setName("cmbJogador");
    obj.cmbJogador:setWidth(148);

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowLayout1);
    obj.label5:setText("Quem poderá ver este personagem?");
    obj.label5:setName("label5");
    obj.label5:setAutoSize(true);
    obj.label5:setWordWrap(false);
    obj.label5:setMargins({top=10, bottom=2});

    obj.flowLayout3 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flowLayout1);
    obj.flowLayout3:setHeight(40);
    obj.flowLayout3:setMinWidth(150);
    obj.flowLayout3:setMaxWidth(600);
    obj.flowLayout3:setAutoHeight(true);
    obj.flowLayout3:setName("flowLayout3");

    obj.rdbSoMestre = gui.fromHandle(_obj_newObject("radioButton"));
    obj.rdbSoMestre:setParent(obj.flowLayout3);
    obj.rdbSoMestre:setName("rdbSoMestre");
    obj.rdbSoMestre:setGroupName("QuemPodeVerPersonagem");
    obj.rdbSoMestre:setText("Somente o mestre");
    obj.rdbSoMestre:setWidth(200);
    obj.rdbSoMestre:setHeight(26);

    obj.flowLineBreak2 = gui.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout3);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.rdbTodos = gui.fromHandle(_obj_newObject("radioButton"));
    obj.rdbTodos:setParent(obj.flowLayout3);
    obj.rdbTodos:setName("rdbTodos");
    obj.rdbTodos:setGroupName("QuemPodeVerPersonagem");
    obj.rdbTodos:setText("Todos da mesa");
    obj.rdbTodos:setWidth(200);
    obj.rdbTodos:setHeight(26);

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setName("layout1");
    obj.layout1:setAlign("bottom");
    obj.layout1:setMargins({top=2, bottom=2});
    obj.layout1:setHeight(40);

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("Criar");
    obj.button1:setWidth(100);
    obj.button1:setHorzTextAlign("center");
    obj.button1:setAlign("right");
    obj.button1:setName("button1");
    obj.button1:setMargins({left=4, right=4});

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setText("Cancelar");
    obj.button2:setHorzTextAlign("center");
    obj.button2:setAlign("right");
    obj.button2:setName("button2");
    obj.button2:setWidth(100);
    obj.button2:setMargins({left=4, right=4});

    obj._e_event0 = obj:addEventListener("onShow",
        function (self)
            carregarComboDeJogadores();	
            		carregarComboDeTemplates();	
            		configurarNodeDatabase();
        end, obj);

    obj._e_event1 = obj:addEventListener("onCancelRequest",
        function (self)
            processarRequisicaoDeCancelamento();
        end, obj);

    obj._e_event2 = obj.edtNome:addEventListener("onKeyDown",
        function (self, event)
            if event.keyCode == 13 then criarPersonagem(); end;
        end, obj);

    obj._e_event3 = obj.cmbJogador:addEventListener("onChange",
        function (self)
            if self.cmbJogador.text ~= "" then
            							self.rdbJogador.checked = true;
            						end;
        end, obj);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (self)
            criarPersonagem();
        end, obj);

    obj._e_event5 = obj.button2:addEventListener("onClick",
        function (self)
            processarRequisicaoDeCancelamento();
        end, obj);

    function obj:_releaseEvents()
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

        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.edtNome ~= nil then self.edtNome:destroy(); self.edtNome = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.cmbJogador ~= nil then self.cmbJogador:destroy(); self.cmbJogador = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rdbNPC ~= nil then self.rdbNPC:destroy(); self.rdbNPC = nil; end;
        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.cmbTemplate ~= nil then self.cmbTemplate:destroy(); self.cmbTemplate = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.rdbSoMestre ~= nil then self.rdbSoMestre:destroy(); self.rdbSoMestre = nil; end;
        if self.rdbJogador ~= nil then self.rdbJogador:destroy(); self.rdbJogador = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.rdbTodos ~= nil then self.rdbTodos:destroy(); self.rdbTodos = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmNovoPersonagem = {
    newEditor = newfrmNovoPersonagem, 
    new = newfrmNovoPersonagem, 
    name = "frmNovoPersonagem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "Criar Personagem", 
    description=""};

frmNovoPersonagem = _frmNovoPersonagem;
rrpg.registrarForm(_frmNovoPersonagem);

return _frmNovoPersonagem;
