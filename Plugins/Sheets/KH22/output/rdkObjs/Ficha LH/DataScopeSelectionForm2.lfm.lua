require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmDataScopeSelectionForm2()
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
    obj:setName("frmDataScopeSelectionForm2");
    obj:setWidth(110);
    obj:setHeight(25);
    obj:setMargins({top=1});


	     function self:alternarVisibilidade()
	     	 ndb.setPermission(sheet, "user", sheet.loginDono, "read", "strongAllow");
	         if self.cbxInvisivel.checked then
	              ndb.setPermission(sheet, "group", "jogadores", "read", nil);
	              ndb.setPermission(sheet, "group", "espectadores", "read", nil);
	         else
	              ndb.setPermission(sheet, "group", "jogadores", "read", "deny");
	              ndb.setPermission(sheet, "group", "espectadores", "read", "deny");
	         end;
	     end; 
	     function self:atualizarCbxInvisivel()          
	         self.cbxInvisivel.checked = ndb.getPermission(sheet, "group", "jogadores", "read") == "deny" or ndb.getPermission(sheet, "group", "espectadores", "read") == "deny";
	          self.cbxInvisivel.enabled = ndb.testPermission(sheet, "writePermissions");
	     end;
	


    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(170);
    obj.label1:setHeight(25);
    obj.label1:setField("nome");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.cbxInvisivel = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxInvisivel:setParent(obj.rectangle1);
    obj.cbxInvisivel:setName("cbxInvisivel");
    obj.cbxInvisivel:setLeft(192);
    obj.cbxInvisivel:setTop(2);
    obj.cbxInvisivel:setWidth(20);
    obj.cbxInvisivel:setHeight(20);
    obj.cbxInvisivel:setImageChecked("/Ficha LH/images/invisivel.png");
    obj.cbxInvisivel:setImageUnchecked("/Ficha LH/images/visivel.png");
    obj.cbxInvisivel:setAutoChange(false);

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(215);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("nome");
    obj.dataLink1:setDefaultValue("Desvantagem");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setField("desc_vandes");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle1);
    obj.dataLink3:setField("efeito_vandes");
    obj.dataLink3:setName("dataLink3");

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

    obj._e_event1 = obj.cbxInvisivel:addEventListener("onClick",
        function (self)
            self:alternarVisibilidade();
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (self)
            ndb.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
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

        if self.cbxInvisivel ~= nil then self.cbxInvisivel:destroy(); self.cbxInvisivel = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmDataScopeSelectionForm2 = {
    newEditor = newfrmDataScopeSelectionForm2, 
    new = newfrmDataScopeSelectionForm2, 
    name = "frmDataScopeSelectionForm2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDataScopeSelectionForm2 = _frmDataScopeSelectionForm2;
rrpg.registrarForm(_frmDataScopeSelectionForm2);

return _frmDataScopeSelectionForm2;
