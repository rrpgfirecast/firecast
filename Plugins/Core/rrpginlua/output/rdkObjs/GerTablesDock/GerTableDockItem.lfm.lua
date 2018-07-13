require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmTableDockItem()
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
    obj:setName("frmTableDockItem");
    obj:setHeight(28);


		local plugins = require("plugins.lua");
		local tdGlobal = require("/GerTablesDock/GerTablesDockGlobal.dlua");
	
		local ignorarMudancaCount = 0;
	
		local function doAtivoMudou()
			ignorarMudancaCount = ignorarMudancaCount + 1;
			self.cbxAtivar.checked = sheet.ativo;
			ignorarMudancaCount = ignorarMudancaCount - 1;
		end;
				
		local function inverterEstadoPorClick()
			if ignorarMudancaCount <= 0 then			
				ignorarMudancaCount = ignorarMudancaCount + 1;
				
				if self.mesa.podeTablesDock then
					if not self.cbxAtivar.checked then
						self.unloadTDFunction(self.mesa, sheet);
					else					
						self.loadTDFunction(self.mesa, sheet);
					end;				

					sheet.ativo = plugins.getIsTablesDockActive(self.mesa, sheet.moduleId, sheet.name);
					local tdN = tdGlobal.getNDBForMesaTablesDock(self.mesa, sheet.moduleId, sheet.name, sheet.ativo);				
					
					if tdN ~= nil then
						tdN.ativo = sheet.ativo;
					end;
				else
					if self.frmKG == nil then
						self.frmKG = GUI.newForm("frmKnowGold");
						self.frmKG.width = 300;
						self.frmKG.height = 300;
						self.frmKG:setInfo("Janelas Acopláveis é um recurso exclusivo para usuários assinantes do RRPG Gold.\nVocê também poderá utilizar as janelas acopláveis se o dono da mesa for Gold Plus =)");
					end;
									
					self.frmKG:show();
				end;			
					
				
				setTimeout(function()
							ignorarMudancaCount = ignorarMudancaCount + 1;
							local atv = plugins.getIsTablesDockActive(self.mesa, sheet.moduleId, sheet.name);
							self.cbxAtivar.checked = atv;
							sheet.ativo = atv;
							ignorarMudancaCount = ignorarMudancaCount - 1;
						   end, 50);
				
				ignorarMudancaCount = ignorarMudancaCount - 1;
			end;
		end;
		
		local function doLimparDados()
			local m = self.mesa;
		
			Dialogs.confirmYesNo("Deseja realmente limpar os dados desta janela acoplável?",
				function(confirmado)
					if confirmado then
							m:abrirNDBDeMesa(sheet.dataType, 
								function(root)																	
									if root ~= nil then
										NDB.clearNode(root);
									end;	
								end);
					end;
				end);
		end;
			
		local function doAtualizarEstadoBtnLimpar()
			self.btnLimparDados.enabled = (sheet.dataType ~= nil) and type(sheet.dataType) == "string";
			self.btnEditPermissions.enabled = self.btnLimparDados.enabled;
		end;
		
		local function doEditPermissions()
			local m = self.mesa;				
		
			m:abrirNDBDeMesa(sheet.dataType, 
				function(root)																	
					if root ~= nil then
						NDB.editPermissions(root);
					end;	
				end);
		end;		
	


    obj.cbxAtivar = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.cbxAtivar:setParent(obj);
    obj.cbxAtivar:setName("cbxAtivar");
    obj.cbxAtivar:setText("");
    obj.cbxAtivar:setAlign("left");
    obj.cbxAtivar:setWidth(28);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setAlign("client");
    obj.label1:setField("title");
    obj.label1:setHitTest(true);
    obj.label1:setName("label1");

    obj.btnLimparDados = GUI.fromHandle(_obj_newObject("button"));
    obj.btnLimparDados:setParent(obj);
    obj.btnLimparDados:setName("btnLimparDados");
    obj.btnLimparDados:setText("Limpar Dados");
    obj.btnLimparDados:setAlign("right");
    obj.btnLimparDados:setWidth(85);
    obj.btnLimparDados:setFontSize(12);
    obj.btnLimparDados:setTextTrimming("none");
    obj.btnLimparDados:setMargins({top=1,bottom=1,left=1, right=1});

    obj.btnEditPermissions = GUI.fromHandle(_obj_newObject("button"));
    obj.btnEditPermissions:setParent(obj);
    obj.btnEditPermissions:setName("btnEditPermissions");
    obj.btnEditPermissions:setHint("Editar Permissões...");
    obj.btnEditPermissions:setAlign("right");
    obj.btnEditPermissions:setWidth(32);
    obj.btnEditPermissions:setFontSize(12);
    obj.btnEditPermissions:setTextTrimming("none");
    obj.btnEditPermissions:setMargins({top=1,bottom=1,left=1, right=1});

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.btnEditPermissions);
    obj.image1:setAlign("client");
    obj.image1:setSRC("/GerTablesDock/security.png");
    obj.image1:setName("image1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("ativo");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("dataType");
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj:addEventListener("onScopeNodeChanged",
        function (_)
            if sheet ~= nil then
            			doAtualizarEstadoBtnLimpar();
            		end;
        end, obj);

    obj._e_event1 = obj.cbxAtivar:addEventListener("onChange",
        function (_)
            inverterEstadoPorClick()
        end, obj);

    obj._e_event2 = obj.label1:addEventListener("onClick",
        function (_)
            self.cbxAtivar.checked = not self.cbxAtivar.checked
        end, obj);

    obj._e_event3 = obj.btnLimparDados:addEventListener("onClick",
        function (_)
            doLimparDados()
        end, obj);

    obj._e_event4 = obj.btnEditPermissions:addEventListener("onClick",
        function (_)
            doEditPermissions()
        end, obj);

    obj._e_event5 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            doAtivoMudou();
        end, obj);

    obj._e_event6 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            doAtualizarEstadoBtnLimpar()
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.cbxAtivar ~= nil then self.cbxAtivar:destroy(); self.cbxAtivar = nil; end;
        if self.btnEditPermissions ~= nil then self.btnEditPermissions:destroy(); self.btnEditPermissions = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.btnLimparDados ~= nil then self.btnLimparDados:destroy(); self.btnLimparDados = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmTableDockItem = {
    newEditor = newfrmTableDockItem, 
    new = newfrmTableDockItem, 
    name = "frmTableDockItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmTableDockItem = _frmTableDockItem;
Firecast.registrarForm(_frmTableDockItem);

return _frmTableDockItem;
