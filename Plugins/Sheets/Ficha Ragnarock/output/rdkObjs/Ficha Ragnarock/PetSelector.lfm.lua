require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPetSeletor()
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
    obj:setName("frmPetSeletor");
    obj:setWidth(200);
    obj:setHeight(30);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setTop(0);
    obj.button1:setWidth(30);
    obj.button1:setHeight(30);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(30);
    obj.rectangle1:setWidth(170);
    obj.rectangle1:setHeight(30);
    obj.rectangle1:setColor("808080");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setWidth(160);
    obj.label1:setHeight(30);
    obj.label1:setField("pet_nome");
    obj.label1:setName("label1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Tem certeza que quer apagar esse Pet?",
            				function (confirmado)
            					if confirmado then
            						NDB.deleteNode(sheet);
            					end;
            			end);
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPetSeletor()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPetSeletor();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPetSeletor = {
    newEditor = newfrmPetSeletor, 
    new = newfrmPetSeletor, 
    name = "frmPetSeletor", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPetSeletor = _frmPetSeletor;
Firecast.registrarForm(_frmPetSeletor);

return _frmPetSeletor;
