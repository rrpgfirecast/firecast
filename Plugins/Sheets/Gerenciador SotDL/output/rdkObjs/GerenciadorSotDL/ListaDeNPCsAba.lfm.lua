require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmNPCListAba()
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
    obj:setName("frmNPCListAba");
    obj:setHeight(25);
    obj:setWidth(125);
    obj:setTheme("dark");
    obj:setMargins({right=2});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(2);
    obj.rectangle1:setColor("#000000FF");
    obj.rectangle1:setName("rectangle1");

    obj.name_aba = GUI.fromHandle(_obj_newObject("edit"));
    obj.name_aba:setParent(obj);
    obj.name_aba:setLeft(0);
    obj.name_aba:setTop(0);
    obj.name_aba:setWidth(75);
    obj.name_aba:setHeight(25);
    obj.name_aba:setField("NomeDaOpcao");
    obj.name_aba:setName("name_aba");
    obj.name_aba:setTransparent(true);

    obj.cbxInvisivel = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.cbxInvisivel:setParent(obj);
    obj.cbxInvisivel:setName("cbxInvisivel");
    obj.cbxInvisivel:setLeft(77);
    obj.cbxInvisivel:setTop(2);
    obj.cbxInvisivel:setWidth(20);
    obj.cbxInvisivel:setHeight(20);
    obj.cbxInvisivel:setImageChecked("/GerenciadorSotDL/images/invisivel.png");
    obj.cbxInvisivel:setImageUnchecked("/GerenciadorSotDL/images/visivel.png");
    obj.cbxInvisivel:setAutoChange(false);
    obj.cbxInvisivel:setHint("Altera a visibilidade entre somente o mestre e todos. ");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(100);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setOpacity(0.5);
    obj.button1:setHint("Apaga a aba. ");
    obj.button1:setName("button1");


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
        function (_)
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

    obj._e_event1 = obj.name_aba:addEventListener("onEnter",
        function (_)
            self.name_aba.transparent = false;
        end, obj);

    obj._e_event2 = obj.name_aba:addEventListener("onExit",
        function (_)
            self.name_aba.transparent = true;
        end, obj);

    obj._e_event3 = obj.cbxInvisivel:addEventListener("onClick",
        function (_)
            self:alternarVisibilidade();
        end, obj);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (_)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa aba?",
            				function (confirmado)
            					if confirmado then
            						ndb.deleteNode(sheet);
            					end;
            			end);
        end, obj);

    function obj:_releaseEvents()
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
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.cbxInvisivel ~= nil then self.cbxInvisivel:destroy(); self.cbxInvisivel = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmNPCListAba()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmNPCListAba();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmNPCListAba = {
    newEditor = newfrmNPCListAba, 
    new = newfrmNPCListAba, 
    name = "frmNPCListAba", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmNPCListAba = _frmNPCListAba;
Firecast.registrarForm(_frmNPCListAba);

return _frmNPCListAba;
