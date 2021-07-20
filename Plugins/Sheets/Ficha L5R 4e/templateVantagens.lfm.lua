require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_templateVantagens()
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
    obj:setName("templateVantagens");
    obj:setHeight(20);
    obj:setMargins({top=5,bottom=5});

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setField("aqq");
    obj.edit1:setLeft(5);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setMargins({right=2});
    obj.edit1:setName("edit1");

    obj.labNome = GUI.fromHandle(_obj_newObject("button"));
    obj.labNome:setParent(obj);
    obj.labNome:setText("i");
    obj.labNome:setWidth(25);
    obj.labNome:setLeft(210);
    obj.labNome:setHeight(25);
    obj.labNome:setName("labNome");

    obj.popVantagem = GUI.fromHandle(_obj_newObject("popup"));
    obj.popVantagem:setParent(obj);
    obj.popVantagem:setName("popVantagem");
    obj.popVantagem:setTop(30);
    obj.popVantagem:setLeft(500);
    obj.popVantagem:setWidth(400);
    obj.popVantagem:setHeight(160);
    obj.popVantagem:setBackOpacity(0.5);
    lfm_setPropAsString(obj.popVantagem, "autoScopeNode",  "true");

    obj.MinhaVant = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.MinhaVant:setParent(obj.popVantagem);
    obj.MinhaVant:setName("MinhaVant");
    obj.MinhaVant:setField("infoVnt");
    obj.MinhaVant:setAlign("client");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setLeft(240);
    obj.comboBox1:setWidth(90);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Espiritual', 'Física', 'Material', 'Mental', 'Mística', 'Social'});
    obj.comboBox1:setField("atributoSkill");
    obj.comboBox1:setValues({'Espiritual', 'Física', 'Material', 'Mental', 'Mística', 'Social'});
    obj.comboBox1:setName("comboBox1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(335);
    obj.edit2:setField("acc");
    obj.edit2:setHeight(25);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setWidth(25);
    obj.edit2:setMargins({right=2});
    obj.edit2:setName("edit2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(365);
    obj.button1:setText("-");
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj._e_event0 = obj.labNome:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popVantagem");
                            if pop ~= nil then
                            pop:setNodeObject(self.sheet);
                            pop:showPopupEx("right", self.labNome);
                            else
                            showMessage("Ops, bug... Nao encontrei o popup para exibir");
                            end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
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

        if self.MinhaVant ~= nil then self.MinhaVant:destroy(); self.MinhaVant = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.popVantagem ~= nil then self.popVantagem:destroy(); self.popVantagem = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.labNome ~= nil then self.labNome:destroy(); self.labNome = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newtemplateVantagens()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_templateVantagens();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _templateVantagens = {
    newEditor = newtemplateVantagens, 
    new = newtemplateVantagens, 
    name = "templateVantagens", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

templateVantagens = _templateVantagens;
Firecast.registrarForm(_templateVantagens);

return _templateVantagens;
