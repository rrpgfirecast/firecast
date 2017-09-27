require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaBasicaV3Rich()
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
    obj:setName("frmFichaBasicaV3Rich");
    obj:setTitle("Ficha Básica do RRPG v3");
    obj:setDescription("Ficha Básica do RRPG v3");
    obj:setDataType("rrpg.com.br.FichaBasicaV3.DT");
    obj:setFormType("sheetTemplate");
    obj:setTheme("dark");

    obj.richEdit1 = gui.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj);
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#363B45");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setField("txt");
    lfm_setPropAsString(obj.richEdit1, "hideSelection",  "false");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "15");
    obj.richEdit1:setName("richEdit1");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaBasicaV3Rich = {
    newEditor = newfrmFichaBasicaV3Rich, 
    new = newfrmFichaBasicaV3Rich, 
    name = "frmFichaBasicaV3Rich", 
    dataType = "rrpg.com.br.FichaBasicaV3.DT", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Básica do RRPG v3", 
    description="Ficha Básica do RRPG v3"};

frmFichaBasicaV3Rich = _frmFichaBasicaV3Rich;
rrpg.registrarForm(_frmFichaBasicaV3Rich);
rrpg.registrarDataType(_frmFichaBasicaV3Rich);

return _frmFichaBasicaV3Rich;
