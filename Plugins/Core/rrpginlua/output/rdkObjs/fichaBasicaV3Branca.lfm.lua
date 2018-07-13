require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmFichaBasicaV3RichWhite()
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
    obj:setName("frmFichaBasicaV3RichWhite");
    obj:setTitle("Ficha Básica do RRPG v3 - Branca");
    obj:setDescription("Ficha Básica do RRPG v3 - Branca");
    obj:setDataType("rrpg.com.br.FichaBasicaV3.DT.White");
    obj:setFormType("sheetTemplate");
    obj:setTheme("light");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj);
    obj.richEdit1:setAlign("client");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "white");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "black");
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

local _frmFichaBasicaV3RichWhite = {
    newEditor = newfrmFichaBasicaV3RichWhite, 
    new = newfrmFichaBasicaV3RichWhite, 
    name = "frmFichaBasicaV3RichWhite", 
    dataType = "rrpg.com.br.FichaBasicaV3.DT.White", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Básica do RRPG v3 - Branca", 
    description="Ficha Básica do RRPG v3 - Branca"};

frmFichaBasicaV3RichWhite = _frmFichaBasicaV3RichWhite;
Firecast.registrarForm(_frmFichaBasicaV3RichWhite);
Firecast.registrarDataType(_frmFichaBasicaV3RichWhite);

return _frmFichaBasicaV3RichWhite;
