require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmProjetoXII111_svg()
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
    obj:setName("frmProjetoXII111_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.AnotacaoEditorNovo = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.AnotacaoEditorNovo:setParent(obj.scrollBox1);
    obj.AnotacaoEditorNovo:setAlign("client");
    obj.AnotacaoEditorNovo:setName("AnotacaoEditorNovo");
    obj.AnotacaoEditorNovo:setField("AnotacaoEditorNovo");
    lfm_setPropAsString(obj.AnotacaoEditorNovo, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.AnotacaoEditorNovo, "defaultFontColor",  "white");
    obj.AnotacaoEditorNovo:setVisible(true);

    obj.Nome33 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.Nome33:setParent(obj.scrollBox1);
    obj.Nome33:setName("Nome33");
    obj.Nome33:setField("Nome33");
    obj.Nome33:setAlign("client");
    obj.Nome33:setVisible(false);

    obj.ConteudoNovoEAntigo = GUI.fromHandle(_obj_newObject("layout"));
    obj.ConteudoNovoEAntigo:setParent(obj.scrollBox1);
    obj.ConteudoNovoEAntigo:setName("ConteudoNovoEAntigo");
    obj.ConteudoNovoEAntigo:setAlign("client");
    obj.ConteudoNovoEAntigo:setMargins({left=200});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.ConteudoNovoEAntigo);
    obj.button1:setText("Conteudo Antigo");
    obj.button1:setLeft(482);
    obj.button1:setTop(0);
    obj.button1:setWidth(119);
    obj.button1:setHeight(21.91);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.ConteudoNovoEAntigo);
    obj.button2:setText("Conteudo Novo");
    obj.button2:setLeft(599);
    obj.button2:setTop(0);
    obj.button2:setWidth(119);
    obj.button2:setHeight(21.91);
    obj.button2:setName("button2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.Nome33.visible = true;
            			 self.AnotacaoEditorNovo.visible = false;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            self.Nome33.visible = false;
            			 self.AnotacaoEditorNovo.visible = true;
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

        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.AnotacaoEditorNovo ~= nil then self.AnotacaoEditorNovo:destroy(); self.AnotacaoEditorNovo = nil; end;
        if self.ConteudoNovoEAntigo ~= nil then self.ConteudoNovoEAntigo:destroy(); self.ConteudoNovoEAntigo = nil; end;
        if self.Nome33 ~= nil then self.Nome33:destroy(); self.Nome33 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmProjetoXII111_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmProjetoXII111_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmProjetoXII111_svg = {
    newEditor = newfrmProjetoXII111_svg, 
    new = newfrmProjetoXII111_svg, 
    name = "frmProjetoXII111_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmProjetoXII111_svg = _frmProjetoXII111_svg;
Firecast.registrarForm(_frmProjetoXII111_svg);

return _frmProjetoXII111_svg;
