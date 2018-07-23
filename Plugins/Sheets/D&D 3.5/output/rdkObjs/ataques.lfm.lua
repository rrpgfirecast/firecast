require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_ataques()
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
    obj:setName("ataques");
    obj:setHeight(180);
    obj:setWidth(632);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(632);
    obj.rectangle1:setHeight(150);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setText("Ataque");
    obj.label1:setWidth(158);
    obj.label1:setHeight(30);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontColor("black");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setWidth(158);
    obj.edit1:setField("ataque");
    obj.edit1:setHeight(30);
    obj.edit1:setTop(30);
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontColor("black");
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setText("Bônus de Ataque");
    obj.label2:setWidth(158);
    obj.label2:setHeight(30);
    obj.label2:setLeft(158);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontColor("black");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setWidth(158);
    obj.edit2:setField("bonus");
    obj.edit2:setHeight(30);
    obj.edit2:setTop(30);
    obj.edit2:setLeft(158);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setFontColor("black");
    obj.edit2:setName("edit2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setText("Dano");
    obj.label3:setWidth(158);
    obj.label3:setHeight(30);
    obj.label3:setLeft(316);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontColor("black");
    obj.label3:setName("label3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setWidth(158);
    obj.edit3:setField("dano");
    obj.edit3:setHeight(30);
    obj.edit3:setTop(30);
    obj.edit3:setLeft(316);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setFontColor("black");
    obj.edit3:setName("edit3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setText("Sucesso Decisivo");
    obj.label4:setWidth(158);
    obj.label4:setHeight(30);
    obj.label4:setLeft(474);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontColor("black");
    obj.label4:setName("label4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setWidth(158);
    obj.edit4:setField("decisivo");
    obj.edit4:setHeight(30);
    obj.edit4:setTop(30);
    obj.edit4:setLeft(474);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setFontColor("black");
    obj.edit4:setName("edit4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setText("Alcance");
    obj.label5:setWidth(80);
    obj.label5:setHeight(30);
    obj.label5:setTop(60);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontColor("black");
    obj.label5:setName("label5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setWidth(80);
    obj.edit5:setField("alcance");
    obj.edit5:setHeight(30);
    obj.edit5:setTop(90);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setFontColor("black");
    obj.edit5:setName("edit5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setText("Tipo");
    obj.label6:setWidth(80);
    obj.label6:setHeight(30);
    obj.label6:setTop(60);
    obj.label6:setLeft(80);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontColor("black");
    obj.label6:setName("label6");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setWidth(80);
    obj.edit6:setField("tipo");
    obj.edit6:setHeight(30);
    obj.edit6:setTop(90);
    obj.edit6:setLeft(80);
    obj.edit6:setHorzTextAlign("center");
    obj.edit6:setFontColor("black");
    obj.edit6:setName("edit6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setText("Observações");
    obj.label7:setWidth(472);
    obj.label7:setHeight(30);
    obj.label7:setTop(60);
    obj.label7:setLeft(160);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontColor("black");
    obj.label7:setName("label7");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setWidth(472);
    obj.edit7:setField("observacoes");
    obj.edit7:setHeight(30);
    obj.edit7:setTop(90);
    obj.edit7:setLeft(160);
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setFontColor("black");
    obj.edit7:setName("edit7");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setText("Apagar");
    obj.button1:setWidth(100);
    obj.button1:setHeight(30);
    obj.button1:setTop(120);
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newataques()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_ataques();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _ataques = {
    newEditor = newataques, 
    new = newataques, 
    name = "ataques", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

ataques = _ataques;
Firecast.registrarForm(_ataques);

return _ataques;
