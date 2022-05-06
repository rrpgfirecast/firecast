require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaBasicaV3RichWhite()
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
    obj:setTitle("@@basicSheet.white.title");
    obj:setDescription("@@basicSheet.white.description");
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
    lfm_setPropAsString(obj.richEdit1, "animateImages",  "true");
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

    return obj;
end;

function newfrmFichaBasicaV3RichWhite()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaBasicaV3RichWhite();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaBasicaV3RichWhite = {
    newEditor = newfrmFichaBasicaV3RichWhite, 
    new = newfrmFichaBasicaV3RichWhite, 
    name = "frmFichaBasicaV3RichWhite", 
    dataType = "rrpg.com.br.FichaBasicaV3.DT.White", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "@@basicSheet.white.title", 
    description="@@basicSheet.white.description"};

frmFichaBasicaV3RichWhite = _frmFichaBasicaV3RichWhite;
Firecast.registrarForm(_frmFichaBasicaV3RichWhite);
Firecast.registrarDataType(_frmFichaBasicaV3RichWhite);

return _frmFichaBasicaV3RichWhite;
