require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDetailList()
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
    obj:setName("frmDetailList");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setHeight(660);
    obj.layout1:setWidth(1225);
    obj.layout1:setMargins({right=0});
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(600);
    obj.layout2:setMargins({right=25});
    obj.layout2:setName("layout2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout2);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(600);
    obj.rectangle1:setHeight(660);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(200);
    obj.button1:setHeight(25);
    obj.button1:setText("Ativa");
    obj.button1:setHint("Adicionar");
    obj.button1:setName("button1");

    obj.rclAtiva = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAtiva:setParent(obj.layout2);
    obj.rclAtiva:setLeft(0);
    obj.rclAtiva:setTop(25);
    obj.rclAtiva:setWidth(600);
    obj.rclAtiva:setHeight(635);
    obj.rclAtiva:setName("rclAtiva");
    obj.rclAtiva:setField("listaAtivas");
    obj.rclAtiva:setTemplateForm("frmRecordListForm");
    obj.rclAtiva:setLayout("vertical");
    obj.rclAtiva:setSelectable(true);

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(600);
    obj.layout3:setName("layout3");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(600);
    obj.rectangle2:setHeight(660);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout3);
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setWidth(200);
    obj.button2:setHeight(25);
    obj.button2:setText("Passiva");
    obj.button2:setHint("Adicionar");
    obj.button2:setName("button2");

    obj.rclPassiva = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclPassiva:setParent(obj.layout3);
    obj.rclPassiva:setLeft(0);
    obj.rclPassiva:setTop(25);
    obj.rclPassiva:setWidth(600);
    obj.rclPassiva:setHeight(635);
    obj.rclPassiva:setName("rclPassiva");
    obj.rclPassiva:setField("listaPassivas");
    obj.rclPassiva:setTemplateForm("frmRecordListForm");
    obj.rclPassiva:setLayout("vertical");
    obj.rclPassiva:setSelectable(true);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclAtiva:append();
        end, obj);

    obj._e_event1 = obj.rclAtiva:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclPassiva:append();
        end, obj);

    obj._e_event3 = obj.rclPassiva:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista alfabeticamente. 
            				        return Utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    function obj:_releaseEvents()
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

        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rclAtiva ~= nil then self.rclAtiva:destroy(); self.rclAtiva = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rclPassiva ~= nil then self.rclPassiva:destroy(); self.rclPassiva = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDetailList()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDetailList();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDetailList = {
    newEditor = newfrmDetailList, 
    new = newfrmDetailList, 
    name = "frmDetailList", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDetailList = _frmDetailList;
Firecast.registrarForm(_frmDetailList);

return _frmDetailList;
