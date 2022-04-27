require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAnotacao1()
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
    obj:setName("frmAnotacao1");
    obj:setHeight(25);
    obj:setMargins({top=2,bottom=2});

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setField("nomeanot1");
    obj.edit1:setLeft(30);
    obj.edit1:setWidth(145);
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("#C0504D");
    obj.edit1:setFontSize(20);
    obj.edit1:setHorzTextAlign("leading");
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setTextTrimming("word");
    obj.edit1:setFontFamily("kalam");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(180);
    obj.rectangle1:setTop(24);
    lfm_setPropAsString(obj.rectangle1, "sides",  "top");
    obj.rectangle1:setColor("#00000000");
    obj.rectangle1:setStrokeColor("black");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(1);
    obj.button1:setText("X");
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setFontColor("white");
    obj.button1:setName("button1");
    obj.button1:setFontSize(20);
    obj.button1:setHorzTextAlign("leading");
    obj.button1:setVertTextAlign("center");
    obj.button1:setTextTrimming("word");
    obj.button1:setFontFamily("kalam");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(180);
    obj.button2:setText("i");
    obj.button2:setWidth(15);
    obj.button2:setHeight(15);
    obj.button2:setFontColor("white");
    obj.button2:setFontFamily("times new roman");
    obj.button2:setName("button2");
    obj.button2:setFontSize(20);
    obj.button2:setHorzTextAlign("leading");
    obj.button2:setVertTextAlign("center");
    obj.button2:setTextTrimming("word");

    obj.PopAnotacaoLista = GUI.fromHandle(_obj_newObject("popup"));
    obj.PopAnotacaoLista:setParent(obj);
    obj.PopAnotacaoLista:setName("PopAnotacaoLista");
    obj.PopAnotacaoLista:setWidth(680);
    obj.PopAnotacaoLista:setHeight(640);
    obj.PopAnotacaoLista:setBackOpacity(0.5);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.PopAnotacaoLista);
    obj.image1:setWidth(600);
    obj.image1:setHeight(600);
    obj.image1:setStyle("proportional");
    obj.image1:setEditable(true);
    obj.image1:setShowProgress(true);
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.PopAnotacaoLista);
    obj.edit2:setField("AnotacaoListaIILink");
    obj.edit2:setText("Link aqui");
    obj.edit2:setAlign("bottom");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setWidth(680);
    obj.edit2:setTransparent(false);
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("#C0504D");
    obj.edit2:setFontSize(20);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setTextTrimming("word");
    obj.edit2:setFontFamily("kalam");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Quer mesmo apagar essa Anotação?",
            						function (confirmado)
            							if confirmado then
            								NDB.deleteNode(sheet);
            							end;
            					end);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            self.PopAnotacaoLista:show('bottom', self.labNome);
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.PopAnotacaoLista ~= nil then self.PopAnotacaoLista:destroy(); self.PopAnotacaoLista = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAnotacao1()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAnotacao1();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAnotacao1 = {
    newEditor = newfrmAnotacao1, 
    new = newfrmAnotacao1, 
    name = "frmAnotacao1", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAnotacao1 = _frmAnotacao1;
Firecast.registrarForm(_frmAnotacao1);

return _frmAnotacao1;
