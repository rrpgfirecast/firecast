require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGerenciador01_Sessao()
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
    obj:setName("frmGerenciador01_Sessao");
    obj:setHeight(35);
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(530);
    obj.rectangle1:setHeight(35);
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(30);
    obj.edit1:setHeight(25);
    obj.edit1:setField("numero");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(35);
    obj.edit2:setTop(5);
    obj.edit2:setWidth(80);
    obj.edit2:setHeight(25);
    obj.edit2:setField("data");
    obj.edit2:setName("edit2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(115);
    obj.button1:setTop(5);
    obj.button1:setWidth(50);
    obj.button1:setHeight(25);
    obj.button1:setText("LOG");
    obj.button1:setHint("Abrir Log");
    obj.button1:setName("button1");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(165);
    obj.edit3:setTop(5);
    obj.edit3:setWidth(100);
    obj.edit3:setHeight(25);
    obj.edit3:setField("log");
    obj.edit3:setName("edit3");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(265);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            gui.openInBrowser(sheet.log);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa sessao?",
            					function (confirmado)
            						if confirmado then
            							ndb.deleteNode(sheet);
            						end;
            				end);
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGerenciador01_Sessao()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGerenciador01_Sessao();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGerenciador01_Sessao = {
    newEditor = newfrmGerenciador01_Sessao, 
    new = newfrmGerenciador01_Sessao, 
    name = "frmGerenciador01_Sessao", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador01_Sessao = _frmGerenciador01_Sessao;
Firecast.registrarForm(_frmGerenciador01_Sessao);

return _frmGerenciador01_Sessao;
