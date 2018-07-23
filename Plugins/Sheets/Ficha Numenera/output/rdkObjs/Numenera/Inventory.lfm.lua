require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmInventory()
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
    obj:setName("frmInventory");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(275);
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setHint("Adicionar Cifra");
    obj.button1:setName("button1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(35);
    obj.label1:setTop(5);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setText("CIFRAS");
    obj.label1:setName("label1");

    obj.rclCifras = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclCifras:setParent(obj.rectangle1);
    obj.rclCifras:setLeft(5);
    obj.rclCifras:setTop(30);
    obj.rclCifras:setWidth(265);
    obj.rclCifras:setHeight(560);
    obj.rclCifras:setName("rclCifras");
    obj.rclCifras:setField("listaDeCifras");
    obj.rclCifras:setTemplateForm("frmCypherItem");
    obj.rclCifras:setLayout("vertical");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(285);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(205);
    obj.rectangle2:setHeight(600);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle2);
    obj.button2:setLeft(5);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setHint("Adicionar Cifra");
    obj.button2:setName("button2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle2);
    obj.label2:setLeft(35);
    obj.label2:setTop(5);
    obj.label2:setWidth(200);
    obj.label2:setHeight(25);
    obj.label2:setText("ARTEFATOS e ESQUISITICES");
    obj.label2:setName("label2");

    obj.rclArtifacts = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclArtifacts:setParent(obj.rectangle2);
    obj.rclArtifacts:setLeft(5);
    obj.rclArtifacts:setTop(30);
    obj.rclArtifacts:setWidth(200);
    obj.rclArtifacts:setHeight(560);
    obj.rclArtifacts:setName("rclArtifacts");
    obj.rclArtifacts:setField("listaDeArtefatos");
    obj.rclArtifacts:setTemplateForm("frmSimpleListItem");
    obj.rclArtifacts:setLayout("vertical");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(500);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(205);
    obj.rectangle3:setHeight(600);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle3);
    obj.button3:setLeft(5);
    obj.button3:setTop(5);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setHint("Adicionar Equipamento");
    obj.button3:setName("button3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle3);
    obj.label3:setLeft(35);
    obj.label3:setTop(5);
    obj.label3:setWidth(200);
    obj.label3:setHeight(25);
    obj.label3:setText("EQUIPAMENTOS   Shins");
    obj.label3:setName("label3");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle3);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(175);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(25);
    obj.edit1:setHeight(25);
    obj.edit1:setField("shins");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");

    obj.rclEquipment = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipment:setParent(obj.rectangle3);
    obj.rclEquipment:setLeft(5);
    obj.rclEquipment:setTop(30);
    obj.rclEquipment:setWidth(200);
    obj.rclEquipment:setHeight(560);
    obj.rclEquipment:setName("rclEquipment");
    obj.rclEquipment:setField("listaDeEquipamentos");
    obj.rclEquipment:setTemplateForm("frmSimpleListItem");
    obj.rclEquipment:setLayout("vertical");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(715);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(295);
    obj.rectangle4:setHeight(600);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle4);
    obj.button4:setLeft(5);
    obj.button4:setTop(5);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("+");
    obj.button4:setHint("Adicionar Ataque");
    obj.button4:setName("button4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle4);
    obj.label4:setLeft(35);
    obj.label4:setTop(5);
    obj.label4:setWidth(250);
    obj.label4:setHeight(25);
    obj.label4:setText("ATAQUES                   MOD  DANO");
    obj.label4:setName("label4");

    obj.rclAtaques = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtaques:setParent(obj.rectangle4);
    obj.rclAtaques:setLeft(5);
    obj.rclAtaques:setTop(30);
    obj.rclAtaques:setWidth(285);
    obj.rclAtaques:setHeight(560);
    obj.rclAtaques:setName("rclAtaques");
    obj.rclAtaques:setField("listaDeAtaques");
    obj.rclAtaques:setTemplateForm("frmAttackItem");
    obj.rclAtaques:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclCifras:append();
        end, obj);

    obj._e_event1 = obj.rclCifras:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclArtifacts:append();
        end, obj);

    obj._e_event3 = obj.rclArtifacts:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclEquipment:append();
        end, obj);

    obj._e_event5 = obj.rclEquipment:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event6 = obj.button4:addEventListener("onClick",
        function (_)
            self.rclAtaques:append();
        end, obj);

    obj._e_event7 = obj.rclAtaques:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente.
            					return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rclArtifacts ~= nil then self.rclArtifacts:destroy(); self.rclArtifacts = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.rclAtaques ~= nil then self.rclAtaques:destroy(); self.rclAtaques = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rclCifras ~= nil then self.rclCifras:destroy(); self.rclCifras = nil; end;
        if self.rclEquipment ~= nil then self.rclEquipment:destroy(); self.rclEquipment = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmInventory()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmInventory();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmInventory = {
    newEditor = newfrmInventory, 
    new = newfrmInventory, 
    name = "frmInventory", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInventory = _frmInventory;
Firecast.registrarForm(_frmInventory);

return _frmInventory;
