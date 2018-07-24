require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrm_FM_Aba()
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
    obj:setName("frm_FM_Aba");
    obj:setHeight(25);
    obj:setWidth(125);
    obj:setTheme("dark");
    obj:setMargins({right=2});

    obj.popupConfig = gui.fromHandle(_obj_newObject("popup"));
    obj.popupConfig:setParent(obj);
    obj.popupConfig:setName("popupConfig");
    obj.popupConfig:setWidth(210);
    obj.popupConfig:setHeight(160);
    obj.popupConfig:setBackOpacity(0.4);

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.popupConfig);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(5);
    obj.layout1:setWidth(200);
    obj.layout1:setHeight(160);
    obj.layout1:setName("layout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setTop(0);
    obj.label1:setWidth(150);
    obj.label1:setHeight(25);
    obj.label1:setText("Ordem da Aba");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(125);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("index");
    obj.edit1:setType("number");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setTop(25);
    obj.label2:setWidth(150);
    obj.label2:setHeight(25);
    obj.label2:setText("Visibilidade");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.cbxInvisivel = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxInvisivel:setParent(obj.layout1);
    obj.cbxInvisivel:setName("cbxInvisivel");
    obj.cbxInvisivel:setLeft(125);
    obj.cbxInvisivel:setTop(27);
    obj.cbxInvisivel:setWidth(20);
    obj.cbxInvisivel:setHeight(20);
    obj.cbxInvisivel:setImageChecked("/FichaMultiaba/images/invisivel.png");
    obj.cbxInvisivel:setImageUnchecked("/FichaMultiaba/images/visivel.png");
    obj.cbxInvisivel:setAutoChange(false);
    obj.cbxInvisivel:setHint("Altera a visibilidade entre somente o mestre e todos. ");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setTop(50);
    obj.label3:setWidth(150);
    obj.label3:setHeight(25);
    obj.label3:setText("Apagar");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(125);
    obj.button1:setTop(50);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setOpacity(0.5);
    obj.button1:setHint("Apaga a aba. ");
    obj.button1:setName("button1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setColor("#000000FF");
    obj.rectangle1:setName("rectangle1");

    obj.name_aba = gui.fromHandle(_obj_newObject("edit"));
    obj.name_aba:setParent(obj);
    obj.name_aba:setLeft(0);
    obj.name_aba:setTop(0);
    obj.name_aba:setWidth(100);
    obj.name_aba:setHeight(25);
    obj.name_aba:setField("nome_aba");
    obj.name_aba:setName("name_aba");
    obj.name_aba:setTransparent(true);
    obj.name_aba:setFontSize(10);

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(100);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("i");
    obj.button2:setOpacity(0.5);
    obj.button2:setHint("Abre popup de opções da aba. ");
    obj.button2:setName("button2");


		 function self:alternarVisibilidade()
			 if self.cbxInvisivel.checked then
				  ndb.setPermission(sheet, "group", "jogadores", "read", nil);
				  ndb.setPermission(sheet, "group", "espectadores", "read", nil);
			 else
				  ndb.setPermission(sheet, "group", "jogadores", "read", "deny");
				  ndb.setPermission(sheet, "group", "espectadores", "read", "deny");
			 end;
		 end; 
		 function self:atualizarCbxInvisivel()		  
			 self.cbxInvisivel.checked = ndb.getPermission(sheet, "group", "espectadores", "read") == "deny" or
										 ndb.getPermission(sheet, "group", "jogadores", "read") == "deny"																					
			  self.cbxInvisivel.enabled = ndb.testPermission(sheet, "writePermissions");
		 end;
	


    obj._e_event0 = obj:addEventListener("onScopeNodeChanged",
        function (self)
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
            			self:atualizarCbxInvisivel();  
            		end;
        end, obj);

    obj._e_event1 = obj.edit1:addEventListener("onChange",
        function (self)
            if sheet==nil then return end;
            					local rcl = self:findControlByName("rclAbas");
            					if rcl~= nil then rcl:sort() end;
        end, obj);

    obj._e_event2 = obj.cbxInvisivel:addEventListener("onClick",
        function (self)
            self:alternarVisibilidade();
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa aba?",
            						function (confirmado)
            							if confirmado then
            								local pop = self:findControlByName("popupConfig");
            				
            								if pop ~= nil then
            									pop:closePopup();
            								end;
            								ndb.deleteNode(sheet);
            							end;
            					end);
        end, obj);

    obj._e_event4 = obj.name_aba:addEventListener("onEnter",
        function (self)
            self.name_aba.transparent = false;
        end, obj);

    obj._e_event5 = obj.name_aba:addEventListener("onExit",
        function (self)
            self.name_aba.transparent = true;
        end, obj);

    obj._e_event6 = obj.name_aba:addEventListener("onChange",
        function (self)
            if sheet==nil then return end;
            			local rcl = self:findControlByName("rclAbas");
            			if rcl~= nil then rcl:sort() end;
        end, obj);

    obj._e_event7 = obj.button2:addEventListener("onClick",
        function (self)
            local pop = self:findControlByName("popupConfig");
            			
            			if pop ~= nil then
            				pop:setNodeObject(self.sheet);
            				pop:showPopupEx("center");
            			else
            				showMessage("Ops, bug.. nao encontrei o popup de opções para exibir");
            			end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.name_aba ~= nil then self.name_aba:destroy(); self.name_aba = nil; end;
        if self.cbxInvisivel ~= nil then self.cbxInvisivel:destroy(); self.cbxInvisivel = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.popupConfig ~= nil then self.popupConfig:destroy(); self.popupConfig = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frm_FM_Aba = {
    newEditor = newfrm_FM_Aba, 
    new = newfrm_FM_Aba, 
    name = "frm_FM_Aba", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frm_FM_Aba = _frm_FM_Aba;
rrpg.registrarForm(_frm_FM_Aba);

return _frm_FM_Aba;
