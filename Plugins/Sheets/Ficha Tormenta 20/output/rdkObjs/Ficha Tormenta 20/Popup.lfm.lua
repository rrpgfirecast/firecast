require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPopup()
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
    obj:setName("frmPopup");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.popupButton = GUI.fromHandle(_obj_newObject("button"));
    obj.popupButton:setParent(obj.scrollBox1);
    obj.popupButton:setLeft(0);
    obj.popupButton:setTop(0);
    obj.popupButton:setWidth(25);
    obj.popupButton:setHeight(25);
    obj.popupButton:setText("i");
    obj.popupButton:setName("popupButton");
    obj.popupButton:setHint("Botao que abre popup");

    obj.popExemplo = GUI.fromHandle(_obj_newObject("popup"));
    obj.popExemplo:setParent(obj.scrollBox1);
    obj.popExemplo:setName("popExemplo");
    obj.popExemplo:setWidth(300);
    obj.popExemplo:setHeight(400);
    obj.popExemplo:setBackOpacity(0.4);
    lfm_setPropAsString(obj.popExemplo, "autoScopeNode",  "false");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.popExemplo);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(300);
    obj.label1:setHeight(20);
    obj.label1:setText("Exemplo de PopUp");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj._e_event0 = obj.popupButton:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popExemplo");
            				
            				if pop ~= nil then
            					pop:setNodeObject(sheet);
            					pop:showPopupEx("bottomCenter", self.popupButton);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.popExemplo ~= nil then self.popExemplo:destroy(); self.popExemplo = nil; end;
        if self.popupButton ~= nil then self.popupButton:destroy(); self.popupButton = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPopup()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPopup();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPopup = {
    newEditor = newfrmPopup, 
    new = newfrmPopup, 
    name = "frmPopup", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPopup = _frmPopup;
Firecast.registrarForm(_frmPopup);

return _frmPopup;
