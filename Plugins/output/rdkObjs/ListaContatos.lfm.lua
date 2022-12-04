require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmListaPericias()
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
    obj:setName("frmListaPericias");
    obj:setWidth(110);
    obj:setHeight(70);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj);
    obj.image1:setSRC("/imagens/CampoPericias2.png");
    obj.image1:setWidth(101);
    obj.image1:setHeight(36);
    obj.image1:setName("image1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.image1);
    obj.edit1:setField("nome");
    obj.edit1:setWidth(101);
    obj.edit1:setHeight(36);
    obj.edit1:setLeft(5);
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj);
    obj.image2:setSRC("/imagens/Apagar.png");
    obj.image2:setWidth(32);
    obj.image2:setLeft(90);
    obj.image2:setTop(-10);
    obj.image2:setHitTest(true);
    obj.image2:setCursor("handPoint");
    obj.image2:setName("image2");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj);
    obj.image3:setSRC("/imagens/Adicional Pericia.png");
    obj.image3:setWidth(32);
    obj.image3:setLeft(90);
    obj.image3:setTop(-40);
    obj.image3:setName("image3");

    obj.image4 = GUI.fromHandle(_obj_newObject("image"));
    obj.image4:setParent(obj);
    obj.image4:setSRC("/imagens/Para Preencher pontos Pericia.png");
    obj.image4:setWidth(75);
    obj.image4:setHeight(50);
    obj.image4:setLeft(120);
    obj.image4:setName("image4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setField("numerosPericia");
    obj.edit2:setWidth(75);
    obj.edit2:setHeight(50);
    obj.edit2:setLeft(120);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setTransparent(true);
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");
    obj.edit2:setFontColor("red");
    obj.edit2:setFontSize(25);
    obj.edit2:setName("edit2");

    obj._e_event0 = obj.image2:addEventListener("onDblClick",
        function (_)
            ndb.deleteNode(sheet);
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

        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.image4 ~= nil then self.image4:destroy(); self.image4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmListaPericias()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmListaPericias();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmListaPericias = {
    newEditor = newfrmListaPericias, 
    new = newfrmListaPericias, 
    name = "frmListaPericias", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmListaPericias = _frmListaPericias;
Firecast.registrarForm(_frmListaPericias);

return _frmListaPericias;
