require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmMacrosTD()
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
    obj:setName("frmMacrosTD");
    obj:setTitle("Macros");
    obj:setDataType("RRPG_Macros");
    obj:setFormType("tablesDock");


		local resumoMacrosNDB = ndb.newMemNodeDatabase();
		resumoMacrosNDB.macros = {};
		
		local remoteNDB = nil;
		local minhasMacrosGlobaisNDB = nil;
		local minhasMacrosDaMesaNDB = nil;
		
		local remoteObs = nil;
		local minhasGlobaisObs = nil;
		local minhasDaMesaObs = nil;
		
		local scheduledEnumMacros = false;
		local genMacrosPrepared = 0;
		
		local function doEnumMIn(macrosNodeNDB, mDest)
			local cns = ndb.getChildNodes(macrosNodeNDB);
			
			for i = 1, #cns, 1 do
				local c = cns[i];
				local nome = globalPrepareMacroNameForFind(globalPrepareMacroName(c.macro));
				
				if type(nome) == "string" and nome ~= "" and c.acoes ~= "" then
					local o = {};
					o.macro = "/" .. c.macro;
					o.acoes = c.acoes or "";
					o.tipoMacro = c.tipoMacro or "S";
					mDest[genMacrosPrepared] = o;
					genMacrosPrepared = genMacrosPrepared + 1;
				end;
			end;
		end;
		
		local function reenumerarTudo()
			scheduledEnumMacros = false;
			
			local m = {};
			
			if remoteNDB ~= nil and remoteNDB.macros ~= nil then
				doEnumMIn(remoteNDB.macros, m);			
			end;
			
			if minhasMacrosGlobaisNDB ~= nil and minhasMacrosGlobaisNDB.macros ~= nil then
				doEnumMIn(minhasMacrosGlobaisNDB.macros, m);		
			end;
			
			if minhasMacrosDaMesaNDB ~= nil and minhasMacrosDaMesaNDB.macros ~= nil then
				doEnumMIn(minhasMacrosDaMesaNDB.macros, m);		
			end;		

			resumoMacrosNDB.macros = m;
		end;
		
		local function enumerarMacrosRemotas()			
			reenumerarTudo();
		end;
		
		local function enumerarMinhasMacrosGlobais()			
			reenumerarTudo();
		end;
		
		local function enumerarMinhasMacrosDaMesa()			
			reenumerarTudo();
		end;
		
		local function enumerarMacros()
			reenumerarTudo();			
		end;
		
		function self.scheduleEnumRemote()
			setTimeout(enumerarMacrosRemotas, 600);
		end;
		
		function self.scheduleEnumMinhasGlobais()
			setTimeout(enumerarMinhasMacrosGlobais, 600);
		end;
		
		function self.scheduleEnumMinhasDaMesa()
			setTimeout(enumerarMinhasMacrosDaMesa, 600);
		end;		
		
		local function onChangeInNDB(ndb)
			if ndb == remoteNDB then
				if not scheduledEnumMacros then
					scheduledEnumMacros = true;
					self.scheduleEnumRemote();
				end;
			elseif ndb == minhasMacrosGlobaisNDB then
				if not scheduledEnumMacros then
					scheduledEnumMacros = true;
					self.scheduleEnumMinhasGlobais();
				end;
			elseif ndb == minhasMacrosDaMesaNDB then
				if not scheduledEnumMacros then
					scheduledEnumMacros = true;
					self.scheduleEnumMinhasDaMesa();
				end;
			end;
		end;
		
		local function createObserverFor(n)
			local observer = ndb.newObserver(n);				
								
			observer.onDeepChildAdded = function(x)
				onChangeInNDB(n);
			end;
			
			observer.onDeepChildRemoved = function(x)
				onChangeInNDB(n);							
			end;
			
			observer.onDeepChanged = function(node, attr, oldV)												
				onChangeInNDB(n);												
			end;		
			
			return observer;
		end;
	


    obj.layTopo = gui.fromHandle(_obj_newObject("layout"));
    obj.layTopo:setParent(obj);
    obj.layTopo:setName("layTopo");
    obj.layTopo:setAlign("top");
    obj.layTopo:setHeight(25);

    obj.btnGerMacros = gui.fromHandle(_obj_newObject("button"));
    obj.btnGerMacros:setParent(obj.layTopo);
    obj.btnGerMacros:setName("btnGerMacros");
    obj.btnGerMacros:setAlign("left");
    obj.btnGerMacros:setText("Gerenciar Macros");
    obj.btnGerMacros:setTextTrimming("none");
    obj.btnGerMacros:setWidth(112);
    obj.btnGerMacros:setMargins({left=3, right=3, top=1, bottom=1});

    obj.dsbMacros = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dsbMacros:setParent(obj);
    obj.dsbMacros:setName("dsbMacros");
    obj.dsbMacros:setAlign("client");

    obj.rclMacros = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMacros:setParent(obj.dsbMacros);
    obj.rclMacros:setName("rclMacros");
    obj.rclMacros:setField("macros");
    obj.rclMacros:setTemplateForm("frmMacroItemTablesDock");
    obj.rclMacros:setLayout("horizontalTiles");
    obj.rclMacros:setAlign("client");


		if system.isMobile() then
			self.layTopo.height = 32;
			self.layTopo.margins = {bottom=10, top=5, left=5, right=5};
			self.dsbMacros.margins = {left=5, right=5};
		end;
	


self.dsbMacros.node = resumoMacrosNDB;


    obj._e_event0 = obj:addEventListener("onShow",
        function (self)
            self.mesa = rrpg.getMesaDe(self);
            		
            		if self.mesa ~= nil then
            			local mesa = self.mesa;
            			
            			mesa:abrirNDBDeMesa("RRPG_Macros",
            				function(n)
            					if n ~= nil then
            						-- Abriu!					
            						remoteNDB = n;					
            						remoteObs = createObserverFor(n);
            						onChangeInNDB(n)		
            					else
            						remoteNDB = nil;
            						remoteObs = nil;
            					end;
            				end, {criar=true});		
            
            			if globalSimpleMacrosNDB == nil then
            				globalSimpleMacrosNDB = ndb.load("simpleMacros.xml");
            			end;						
            				
            			if globalSimpleMacrosNDB.global == nil then
            				globalSimpleMacrosNDB.global = {};
            			end;
            			
            			minhasMacrosGlobaisNDB = globalSimpleMacrosNDB.global;
            			minhasGlobaisObs = createObserverFor(minhasMacrosGlobaisNDB);
            								
            			if globalSimpleMacrosNDB.mesas == nil then
            				globalSimpleMacrosNDB.mesas = {};
            			end;	
            
            			if globalSimpleMacrosNDB.mesas[self.mesa.codigoInterno] == nil then
            				globalSimpleMacrosNDB.mesas[self.mesa.codigoInterno] = {};
            			end;
            
            			minhasMacrosDaMesaNDB = globalSimpleMacrosNDB.mesas[self.mesa.codigoInterno];
            			minhasDaMesaObs = createObserverFor(minhasMacrosDaMesaNDB); 
            			
            			enumerarMacros();
            		end;
        end, obj);

    obj._e_event1 = obj:addEventListener("onHide",
        function (self)
            ndb.clearNode(resumoMacrosNDB);
            	
            		if self.mesa ~= nil then
            			self.mesa = nil;
            		end;
            		
            		if remoteObs ~= nil then
            			remoteObs.enabled = false;
            			remoteObs = nil;
            		end;
            		
            		if minhasGlobaisObs ~= nil then
            			minhasGlobaisObs.enabled = false;
            			minhasGlobaisObs = nil;
            		end;
            		
            		if minhasDaMesaObs ~= nil then
            			minhasDaMesaObs.enabled = false;
            			minhasDaMesaObs = nil;
            		end;
            		
            		remoteNDB = nil;
            		minhasMacrosGlobaisNDB = nil;
            		minhasMacrosDaMesaNDB = nil;
        end, obj);

    obj._e_event2 = obj.btnGerMacros:addEventListener("onClick",
        function (self)
            globalGerenciarMacros(self.mesa);
        end, obj);

    obj._e_event3 = obj.rclMacros:addEventListener("onItemAdded",
        function (self, node, form)
            form.mesa = self.mesa;
        end, obj);

    obj._e_event4 = obj.rclMacros:addEventListener("onItemRemoved",
        function (self, node, form)
            form.mesa = nil;
        end, obj);

    obj._e_event5 = obj.rclMacros:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.macro, nodeB.macro);
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

        if self.dsbMacros ~= nil then self.dsbMacros:destroy(); self.dsbMacros = nil; end;
        if self.layTopo ~= nil then self.layTopo:destroy(); self.layTopo = nil; end;
        if self.btnGerMacros ~= nil then self.btnGerMacros:destroy(); self.btnGerMacros = nil; end;
        if self.rclMacros ~= nil then self.rclMacros:destroy(); self.rclMacros = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmMacrosTD = {
    newEditor = newfrmMacrosTD, 
    new = newfrmMacrosTD, 
    name = "frmMacrosTD", 
    dataType = "RRPG_Macros", 
    formType = "tablesDock", 
    formComponentName = "form", 
    title = "Macros", 
    description=""};

frmMacrosTD = _frmMacrosTD;
rrpg.registrarForm(_frmMacrosTD);
rrpg.registrarDataType(_frmMacrosTD);
rrpg.registrarSpecialForm(_frmMacrosTD);

return _frmMacrosTD;
