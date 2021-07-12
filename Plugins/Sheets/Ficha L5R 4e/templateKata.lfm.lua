require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_templateKata()
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
    obj:setName("templateKata");
    obj:setHeight(140);
    obj:setMargins({top=5,bottom=5});

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setText("Nome:");
    obj.label1:setLeft(5);
    obj.label1:setTop(5);
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(50);
    obj.edit1:setField("aaa");
    obj.edit1:setHeight(25);
    obj.edit1:setWidth(160);
    obj.edit1:setMargins({right=2});
    obj.edit1:setName("edit1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setText("Tipo:");
    obj.label2:setLeft(215);
    obj.label2:setTop(5);
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setText("Anel:");
    obj.label3:setLeft(15);
    obj.label3:setTop(33);
    obj.label3:setName("label3");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj);
    obj.comboBox1:setLeft(50);
    obj.comboBox1:setWidth(65);
    obj.comboBox1:setTop(30);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setItems({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio'});
    obj.comboBox1:setField("elementoKata");
    obj.comboBox1:setValues({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio'});
    obj.comboBox1:setName("comboBox1");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setText("Maestria:");
    obj.label4:setLeft(123);
    obj.label4:setTop(33);
    obj.label4:setName("label4");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(183);
    obj.edit2:setTop(30);
    obj.edit2:setField("abb");
    obj.edit2:setHeight(25);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setWidth(25);
    obj.edit2:setMargins({right=2});
    obj.edit2:setName("edit2");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj);
    obj.comboBox2:setLeft(215);
    obj.comboBox2:setWidth(105);
    obj.comboBox2:setTop(30);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setItems({'Kata', 'Kiho Interno', 'Kiho Kármico', 'Kiho Marcial', 'Kiho Místico'});
    obj.comboBox2:setField("tipoKata");
    obj.comboBox2:setValues({'Kata', 'Kiho Interno', 'Kiho Kármico', 'Kiho Marcial', 'Kiho Místico'});
    obj.comboBox2:setName("comboBox2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(320);
    obj.button1:setText("-");
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj);
    obj.textEditor1:setTop(60);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setWidth(340);
    obj.textEditor1:setHeight(85);
    obj.textEditor1:setName("textEditor1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
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

        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newtemplateKata()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_templateKata();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _templateKata = {
    newEditor = newtemplateKata, 
    new = newtemplateKata, 
    name = "templateKata", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

templateKata = _templateKata;
Firecast.registrarForm(_templateKata);

return _templateKata;
