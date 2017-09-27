require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newOpcaoDaComboboxFalsa()
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
    obj:setName("OpcaoDaComboboxFalsa");
    obj:setHeight(24);
    obj:setAlign("top");
    obj:setTheme("dark");

    obj.imgApagar2 = gui.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imgApagar2:setParent(obj);
    obj.imgApagar2:setAlign("left");
    obj.imgApagar2:setWidth(20);
    obj.imgApagar2:setMargins({left=4, top=2, bottom=2});
    obj.imgApagar2:setName("imgApagar2");
    obj.imgApagar2:setImageChecked("/GerenciadorDeCampanha/images/delete.png");
    obj.imgApagar2:setImageUnchecked("/GerenciadorDeCampanha/images/delete.png");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setAlign("client");
    obj.label1:setField("NomeDaOpcao");
    obj.label1:setMargins({left=4});
    obj.label1:setText("Título da Aba");
    obj.label1:setName("label1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("TipoOrganizar");
    obj.dataLink1:setDefaultValue("Alfa");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("NomeDaOpcao");
    obj.dataLink2:setDefaultValue("Título da Aba");
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.imgApagar2:addEventListener("onClick",
        function (self)
            if DonoMestre(sheet, false, "docksub10") then
            						dialogs.confirmYesNo("Deseja realmente apagar este item?",
            							function (confirmado)
            								if confirmado then
            										safeNodeDeletion(sheet);
            								else
            										
            								end;
            							end);
            					end;
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
        end, obj);

    function obj:_releaseEvents()
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
        if self.imgApagar2 ~= nil then self.imgApagar2:destroy(); self.imgApagar2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _OpcaoDaComboboxFalsa = {
    newEditor = newOpcaoDaComboboxFalsa, 
    new = newOpcaoDaComboboxFalsa, 
    name = "OpcaoDaComboboxFalsa", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

OpcaoDaComboboxFalsa = _OpcaoDaComboboxFalsa;
rrpg.registrarForm(_OpcaoDaComboboxFalsa);

return _OpcaoDaComboboxFalsa;
