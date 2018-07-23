require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGerenciarSimpleMacros()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmGerenciarSimpleMacros");
    obj:setTitle(lang("macros.ui.manageMacros"));
    obj:setWidth(450);
    obj:setHeight(450);
    obj:setResizable(true);

    obj.popEditMacro = GUI.fromHandle(_obj_newObject("popup"));
    obj.popEditMacro:setParent(obj);
    obj.popEditMacro:setName("popEditMacro");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.popEditMacro);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setPadding({left=2, right=2});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText(lang("macros.ui.editLabel"));
    obj.label1:setAlign("client");
    obj.label1:setMargins({right=2});
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(16);
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText(lang("macros.ui.closeButton"));
    obj.button1:setAlign("right");
    obj.button1:setWidth(80);
    obj.button1:setName("button1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.scrollBox1);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({top=4, bottom=2, left=16, right=16});
    obj.horzLine1:setStrokeColor("white");
    obj.horzLine1:setName("horzLine1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMargins({left=5,right=5, top=8});
    obj.flowLayout1:setName("flowLayout1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowLayout1);
    obj.label2:setText(lang("macros.ui.nameLabel"));
    obj.label2:setAutoSize(true);
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowLayout1);
    obj.label3:setText(lang("macros.ui.nameLabel.Orientation"));
    obj.label3:setAutoSize(true);
    obj.label3:setFontSize(12);
    obj.label3:setFontColor("gray");
    obj.label3:setWordWrap(false);
    obj.label3:setName("label3");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flowLayout1);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flowLayout1);
    obj.flowPart1:setMinWidth(100);
    obj.flowPart1:setMaxWidth(250);
    obj.flowPart1:setHeight(30);
    obj.flowPart1:setMargins({bottom=12, top=-2});
    obj.flowPart1:setName("flowPart1");

    obj.edtNomeDaMacro = GUI.fromHandle(_obj_newObject("edit"));
    obj.edtNomeDaMacro:setParent(obj.flowPart1);
    obj.edtNomeDaMacro:setName("edtNomeDaMacro");
    obj.edtNomeDaMacro:setAlign("client");
    obj.edtNomeDaMacro:setField("macro");
    obj.edtNomeDaMacro:setTextPrompt(lang("macros.ui.macroName.example"));

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flowLayout1);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.radioButton1 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.flowLayout1);
    obj.radioButton1:setGroupName("tipoMacro");
    obj.radioButton1:setField("tipoMacro");
    obj.radioButton1:setFieldValue("S");
    obj.radioButton1:setText(lang("macros.ui.macroType.simple"));
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = GUI.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.flowLayout1);
    obj.radioButton2:setGroupName("tipoMacro");
    obj.radioButton2:setField("tipoMacro");
    obj.radioButton2:setFieldValue("L");
    obj.radioButton2:setText(lang("macros.ui.macroType.lua"));
    obj.radioButton2:setMargins({bottom=12, right=8});
    obj.radioButton2:setName("radioButton2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowLayout1);
    obj.button2:setText("??");
    obj.button2:setWidth(45);
    obj.button2:setName("button2");

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flowLayout1);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowLayout1);
    obj.label4:setText(lang("macros.ui.actionsTitle"));
    obj.label4:setAutoSize(true);
    obj.label4:setVertTextAlign("trailing");
    obj.label4:setName("label4");

    obj.labExtraInfoAcoes = GUI.fromHandle(_obj_newObject("label"));
    obj.labExtraInfoAcoes:setParent(obj.flowLayout1);
    obj.labExtraInfoAcoes:setName("labExtraInfoAcoes");
    obj.labExtraInfoAcoes:setText(lang("macros.ui.macroType.onePerLine"));
    obj.labExtraInfoAcoes:setAutoSize(true);
    obj.labExtraInfoAcoes:setFontSize(12);
    obj.labExtraInfoAcoes:setFontColor("gray");
    obj.labExtraInfoAcoes:setWordWrap(false);
    obj.labExtraInfoAcoes:setVertTextAlign("trailing");

    obj.flowLineBreak4 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak4:setParent(obj.flowLayout1);
    obj.flowLineBreak4:setName("flowLineBreak4");

    obj.flpCode = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flpCode:setParent(obj.flowLayout1);
    obj.flpCode:setName("flpCode");
    obj.flpCode:setMinWidth(100);
    obj.flpCode:setMaxWidth(1200);
    obj.flpCode:setHeight(100);
    obj.flpCode:setMargins({bottom=12, top=-2});

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flpCode);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("acoes");
    obj.textEditor1:setWordWrap(false);
    obj.textEditor1:setName("textEditor1");

    obj.flowLineBreak5 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak5:setParent(obj.flowLayout1);
    obj.flowLineBreak5:setName("flowLineBreak5");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowLayout1);
    obj.button3:setText(lang("macros.ui.deleteMacro"));
    obj.button3:setWidth(150);
    obj.button3:setMargins({top=8, right=15, bottom=15});
    obj.button3:setHeight(30);
    obj.button3:setName("button3");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.popEditMacro);
    obj.dataLink1:setFields({'macro', 'acoes'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.popEditMacro);
    obj.dataLink2:setField("tipoMacro");
    obj.dataLink2:setDefaultValue("S");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.popEditMacro);
    obj.dataLink3:setField("macro");
    obj.dataLink3:setName("dataLink3");

		
		function self.editarMacroNode(node)
			if node ~= nil then
				self.popEditMacro:setNodeObject(node);	
				self.popEditMacro:show();
				
				setTimeout(
					function()
						if self.edtNomeDaMacro.text == "" then
							self.edtNomeDaMacro:setFocus();
						end;
					end, 10);
			end;
		end;
	


    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tabMacroMesa = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabMacroMesa:setParent(obj.tabControl1);
    obj.tabMacroMesa:setTitle(lang("macros.ui.title.macrosForEveryoneOnRoom"));
    obj.tabMacroMesa:setName("tabMacroMesa");

    obj.dsbMacrosMesaGlobal = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dsbMacrosMesaGlobal:setParent(obj.tabMacroMesa);
    obj.dsbMacrosMesaGlobal:setName("dsbMacrosMesaGlobal");
    obj.dsbMacrosMesaGlobal:setAlign("client");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.dsbMacrosMesaGlobal);
    obj.layout2:setAlign("client");
    obj.layout2:setMargins({left=2, top=2, right=2, bottom=2});
    obj.layout2:setName("layout2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout2);
    obj.layout3:setAlign("top");
    obj.layout3:setHeight(25);
    obj.layout3:setMargins({left=2, right=2, bottom=8});
    obj.layout3:setName("layout3");

    obj.labTitMesa2 = GUI.fromHandle(_obj_newObject("label"));
    obj.labTitMesa2:setParent(obj.layout3);
    obj.labTitMesa2:setName("labTitMesa2");
    obj.labTitMesa2:setText(lang("macros.ui.room"));
    obj.labTitMesa2:setAlign("client");
    obj.labTitMesa2:setHorzTextAlign("center");
    obj.labTitMesa2:setFontSize(16);
    lfm_setPropAsString(obj.labTitMesa2, "fontStyle",  "bold");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout2);
    obj.layout4:setAlign("top");
    obj.layout4:setHeight(28);
    obj.layout4:setMargins({bottom=5, top=5, left=5});
    obj.layout4:setName("layout4");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout4);
    obj.button4:setText(lang("macros.ui.roomMacro.newTitle"));
    obj.button4:setAlign("left");
    obj.button4:setWidth(150);
    obj.button4:setName("button4");

    obj.rclMacrosDaMesaGlobal = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMacrosDaMesaGlobal:setParent(obj.layout2);
    obj.rclMacrosDaMesaGlobal:setName("rclMacrosDaMesaGlobal");
    obj.rclMacrosDaMesaGlobal:setAlign("client");
    obj.rclMacrosDaMesaGlobal:setField("macros");
    obj.rclMacrosDaMesaGlobal:setTemplateForm("frmGerenciarSimpleMacrosItem");
    obj.rclMacrosDaMesaGlobal:setSelectable(true);

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle(lang("macros.ui.myMacros.title"));
    obj.tab1:setName("tab1");

    obj.tabControl2 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl2:setParent(obj.tab1);
    obj.tabControl2:setAlign("client");
    obj.tabControl2:setName("tabControl2");

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl2);
    obj.tab2:setTitle(lang("macros.ui.myMacros.global.title"));
    obj.tab2:setName("tab2");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.tab2);
    obj.layout5:setAlign("client");
    obj.layout5:setMargins({left=2, top=2, right=2, bottom=2});
    obj.layout5:setName("layout5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout5);
    obj.layout6:setAlign("top");
    obj.layout6:setHeight(28);
    obj.layout6:setMargins({bottom=5, top=5, left=5});
    obj.layout6:setName("layout6");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout6);
    obj.button5:setText(lang("macros.ui.myMacros.global.new.title"));
    obj.button5:setAlign("left");
    obj.button5:setWidth(150);
    obj.button5:setName("button5");

    obj.rclMacrosGlobais = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMacrosGlobais:setParent(obj.layout5);
    obj.rclMacrosGlobais:setName("rclMacrosGlobais");
    obj.rclMacrosGlobais:setAlign("client");
    obj.rclMacrosGlobais:setField("macros");
    obj.rclMacrosGlobais:setTemplateForm("frmGerenciarSimpleMacrosItem");
    obj.rclMacrosGlobais:setSelectable(true);

    obj.tabMacrosDaMesa = GUI.fromHandle(_obj_newObject("tab"));
    obj.tabMacrosDaMesa:setParent(obj.tabControl2);
    obj.tabMacrosDaMesa:setName("tabMacrosDaMesa");
    obj.tabMacrosDaMesa:setTitle(lang("macros.ui.myMacros.thisroom.title"));

    obj.dsbMacrosDaMesa = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.dsbMacrosDaMesa:setParent(obj.tabMacrosDaMesa);
    obj.dsbMacrosDaMesa:setName("dsbMacrosDaMesa");
    obj.dsbMacrosDaMesa:setAlign("client");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.dsbMacrosDaMesa);
    obj.layout7:setAlign("client");
    obj.layout7:setMargins({left=2, top=2, right=2, bottom=2});
    obj.layout7:setName("layout7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout7);
    obj.layout8:setAlign("top");
    obj.layout8:setHeight(25);
    obj.layout8:setMargins({left=2, right=2, bottom=8});
    obj.layout8:setName("layout8");

    obj.labTitMesa = GUI.fromHandle(_obj_newObject("label"));
    obj.labTitMesa:setParent(obj.layout8);
    obj.labTitMesa:setName("labTitMesa");
    obj.labTitMesa:setText(lang("macros.ui.room"));
    obj.labTitMesa:setAlign("client");
    obj.labTitMesa:setHorzTextAlign("center");
    obj.labTitMesa:setFontSize(16);
    lfm_setPropAsString(obj.labTitMesa, "fontStyle",  "bold");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout7);
    obj.layout9:setAlign("top");
    obj.layout9:setHeight(28);
    obj.layout9:setMargins({bottom=3});
    obj.layout9:setName("layout9");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout9);
    obj.button6:setText(lang("macros.ui.myMacros.thisroom.new.title"));
    obj.button6:setAlign("left");
    obj.button6:setWidth(180);
    obj.button6:setName("button6");

    obj.rclMacrosDaMesa = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclMacrosDaMesa:setParent(obj.layout7);
    obj.rclMacrosDaMesa:setName("rclMacrosDaMesa");
    obj.rclMacrosDaMesa:setAlign("client");
    obj.rclMacrosDaMesa:setField("macros");
    obj.rclMacrosDaMesa:setTemplateForm("frmGerenciarSimpleMacrosItem");
    obj.rclMacrosDaMesa:setSelectable(true);

    obj._e_event0 = obj:addEventListener("onShow",
        function (_)
            if globalSimpleMacrosNDB == nil then
            			globalSimpleMacrosNDB = NDB.load("simpleMacros.xml");
            		end;			
            	
            		if globalSimpleMacrosNDB.global == nil then
            			globalSimpleMacrosNDB.global = {};
            		end;
            		
            		self:setNodeObject(globalSimpleMacrosNDB.global);
            		
            		if self._mesa ~= nil then
            			self.tabMacrosDaMesa.visible = true;
            					
            			if globalSimpleMacrosNDB.mesas == nil then
            				globalSimpleMacrosNDB.mesas = {};
            			end;	
            
            			if globalSimpleMacrosNDB.mesas[self._mesa.codigoInterno] == nil then
            				globalSimpleMacrosNDB.mesas[self._mesa.codigoInterno] = {};
            			end;	
            			
            			self.dsbMacrosDaMesa.node = globalSimpleMacrosNDB.mesas[self._mesa.codigoInterno];
            			self.labTitMesa.text = "Mesa: " .. self._mesa.nome;
            			self.labTitMesa2.text = self.labTitMesa.text;
            			
            			local opcoes = {};
            			local travouForm = false;
            			opcoes.criar = true;
            			opcoes.callbackDeCarga = function()
            										self:lockWithActivity(lang("macros.ui.loadingMacrosForRoom"));
            										travouForm = true;
            									 end;
            			
            			self._mesa:abrirNDBDeMesa("RRPG_Macros", 
            				function(nG)
            					if travouForm then
            						self:unlockWithActivity();
            					end;					
            					
            					if nG ~= nil then
            						self.dsbMacrosMesaGlobal.node = nG;
            					else
            						self.tabMacroMesa.visible = false;
            					end;
            				end, opcoes)
            			
            		else
            			self.tabMacrosDaMesa.visible = false;
            			self.dsbMacrosDaMesa.node = nil;
            			self.tabMacroMesa.visible = false;
            		end;
        end, obj);

    obj._e_event1 = obj:addEventListener("onHide",
        function (_)
            self.dsbMacrosDaMesa.node = nil;
            		self:setNodeObject(nil);
        end, obj);

    obj._e_event2 = obj.popEditMacro:addEventListener("onClose",
        function (_, canceled)
            self.popEditMacro:setNodeObject(nil);
        end, obj);

    obj._e_event3 = obj.popEditMacro:addEventListener("onResize",
        function (_)
            self.flpCode.height = self.popEditMacro.height - 220;
        end, obj);

    obj._e_event4 = obj.popEditMacro:addEventListener("onCalculateSize",
        function (_, dueToResize, width, height)
            local w = (self.width or 0) * 0.8;
            			local h = (self.height or 0) * 0.8;
            				
            			if w < 250 then
            				w = 250;
            			elseif w > 1000 then
            				w = 1000;
            			end;
            			
            			if h < 280 then
            				h = 280;
            			elseif h > 1000 then
            				h = 1000;
            			end;
            		
            			return w, h;
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            self.popEditMacro:close();
        end, obj);

    obj._e_event6 = obj.button2:addEventListener("onClick",
        function (_)
            GUI.openInBrowser('http://rrpg.com.br/sdk3beta/RRPG%20SDK%203.html?Macros.html');
        end, obj);

    obj._e_event7 = obj.button3:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo(lang("macros.ui.deleteConfirmation"),
            							function (confirmado)
            								if confirmado then
            									local node = self.popEditMacro:getNodeObject();								
            									self.popEditMacro:close();						
            									
            									if node ~= nil then
            										NDB.deleteNode(node);
            										globalMacrosInvalido = true;
            									end;
            								end;
            							end);
        end, obj);

    obj._e_event8 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            globalMacrosInvalido = true;
        end, obj);

    obj._e_event9 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.labExtraInfoAcoes.visible = self.popEditMacro:getNodeObject().tipoMacro ~= "L";
        end, obj);

    obj._e_event10 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.popEditMacro:getNodeObject().macro = globalPrepareMacroName(self.popEditMacro:getNodeObject().macro);
        end, obj);

    obj._e_event11 = obj.button4:addEventListener("onClick",
        function (_)
            self.editarMacroNode(self.rclMacrosDaMesaGlobal:append());
        end, obj);

    obj._e_event12 = obj.button5:addEventListener("onClick",
        function (_)
            self.editarMacroNode(self.rclMacrosGlobais:append());
        end, obj);

    obj._e_event13 = obj.button6:addEventListener("onClick",
        function (_)
            self.editarMacroNode(self.rclMacrosDaMesa:append());
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.popEditMacro ~= nil then self.popEditMacro:destroy(); self.popEditMacro = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rclMacrosDaMesa ~= nil then self.rclMacrosDaMesa:destroy(); self.rclMacrosDaMesa = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.flowLineBreak5 ~= nil then self.flowLineBreak5:destroy(); self.flowLineBreak5 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.dsbMacrosMesaGlobal ~= nil then self.dsbMacrosMesaGlobal:destroy(); self.dsbMacrosMesaGlobal = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.labTitMesa2 ~= nil then self.labTitMesa2:destroy(); self.labTitMesa2 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.tabMacrosDaMesa ~= nil then self.tabMacrosDaMesa:destroy(); self.tabMacrosDaMesa = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edtNomeDaMacro ~= nil then self.edtNomeDaMacro:destroy(); self.edtNomeDaMacro = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.tabControl2 ~= nil then self.tabControl2:destroy(); self.tabControl2 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rclMacrosDaMesaGlobal ~= nil then self.rclMacrosDaMesaGlobal:destroy(); self.rclMacrosDaMesaGlobal = nil; end;
        if self.labExtraInfoAcoes ~= nil then self.labExtraInfoAcoes:destroy(); self.labExtraInfoAcoes = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.labTitMesa ~= nil then self.labTitMesa:destroy(); self.labTitMesa = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.tabMacroMesa ~= nil then self.tabMacroMesa:destroy(); self.tabMacroMesa = nil; end;
        if self.flowLineBreak4 ~= nil then self.flowLineBreak4:destroy(); self.flowLineBreak4 = nil; end;
        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.rclMacrosGlobais ~= nil then self.rclMacrosGlobais:destroy(); self.rclMacrosGlobais = nil; end;
        if self.dsbMacrosDaMesa ~= nil then self.dsbMacrosDaMesa:destroy(); self.dsbMacrosDaMesa = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flpCode ~= nil then self.flpCode:destroy(); self.flpCode = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGerenciarSimpleMacros()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGerenciarSimpleMacros();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGerenciarSimpleMacros = {
    newEditor = newfrmGerenciarSimpleMacros, 
    new = newfrmGerenciarSimpleMacros, 
    name = "frmGerenciarSimpleMacros", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "@@macros.ui.manageMacros", 
    description=""};

frmGerenciarSimpleMacros = _frmGerenciarSimpleMacros;
Firecast.registrarForm(_frmGerenciarSimpleMacros);

return _frmGerenciarSimpleMacros;
