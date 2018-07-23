require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaBasicaV3()
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
    obj:setName("frmFichaBasicaV3");
    obj:setFormType("sheetTemplate");
    obj:setDataType("br.com.rrpg.FICHA_BASICA_V3");
    obj:setTitle("Ficha Básica Multi Abas");

    obj.tabControl1 = GUI.fromHandle(_obj_newObject("tabControl"));
    obj.tabControl1:setParent(obj);
    obj.tabControl1:setAlign("client");
    obj.tabControl1:setName("tabControl1");

    obj.tab1 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab1:setParent(obj.tabControl1);
    obj.tab1:setTitle("Atributos");
    obj.tab1:setName("tab1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.tab1);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("atributosStr");
    obj.textEditor1:setWordWrap(true);
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setPadding({left=2, right=2});

    obj.tab2 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab2:setParent(obj.tabControl1);
    obj.tab2:setTitle("Habilidades");
    obj.tab2:setName("tab2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.tab2);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("habilidadesStr");
    obj.textEditor2:setWordWrap(true);
    obj.textEditor2:setName("textEditor2");
    obj.textEditor2:setPadding({left=2, right=2});

    obj.tab3 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab3:setParent(obj.tabControl1);
    obj.tab3:setTitle("Equipamentos");
    obj.tab3:setName("tab3");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.tab3);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("equipamentosStr");
    obj.textEditor3:setWordWrap(true);
    obj.textEditor3:setName("textEditor3");
    obj.textEditor3:setPadding({left=2, right=2});

    obj.tab4 = GUI.fromHandle(_obj_newObject("tab"));
    obj.tab4:setParent(obj.tabControl1);
    obj.tab4:setTitle("História");
    obj.tab4:setName("tab4");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.tab4);
    obj.textEditor4:setAlign("client");
    obj.textEditor4:setField("historiaStr");
    obj.textEditor4:setWordWrap(true);
    obj.textEditor4:setName("textEditor4");
    obj.textEditor4:setPadding({left=2, right=2});

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.tab1 ~= nil then self.tab1:destroy(); self.tab1 = nil; end;
        if self.tab4 ~= nil then self.tab4:destroy(); self.tab4 = nil; end;
        if self.tabControl1 ~= nil then self.tabControl1:destroy(); self.tabControl1 = nil; end;
        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.tab3 ~= nil then self.tab3:destroy(); self.tab3 = nil; end;
        if self.tab2 ~= nil then self.tab2:destroy(); self.tab2 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaBasicaV3()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaBasicaV3();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaBasicaV3 = {
    newEditor = newfrmFichaBasicaV3, 
    new = newfrmFichaBasicaV3, 
    name = "frmFichaBasicaV3", 
    dataType = "br.com.rrpg.FICHA_BASICA_V3", 
    formType = "sheetTemplate", 
    formComponentName = "form", 
    title = "Ficha Básica Multi Abas", 
    description=""};

frmFichaBasicaV3 = _frmFichaBasicaV3;
Firecast.registrarForm(_frmFichaBasicaV3);
Firecast.registrarDataType(_frmFichaBasicaV3);

return _frmFichaBasicaV3;
