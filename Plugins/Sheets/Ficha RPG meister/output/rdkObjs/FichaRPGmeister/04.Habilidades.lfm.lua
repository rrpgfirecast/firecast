require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister4_svg()
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
    obj:setName("frmFichaRPGmeister4_svg");
    obj:setAlign("client");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(380);
    obj.layout1:setHeight(600);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0000007F");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(380);
    obj.label1:setHeight(20);
    obj.label1:setText("TALENTOS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rclListaDosTalentos = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosTalentos:setParent(obj.layout1);
    obj.rclListaDosTalentos:setName("rclListaDosTalentos");
    obj.rclListaDosTalentos:setField("campoDosTalentos");
    obj.rclListaDosTalentos:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosTalentos:setLeft(5);
    obj.rclListaDosTalentos:setTop(25);
    obj.rclListaDosTalentos:setWidth(370);
    obj.rclListaDosTalentos:setHeight(570);
    obj.rclListaDosTalentos:setLayout("vertical");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(395);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(380);
    obj.layout2:setHeight(600);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#0000007F");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(380);
    obj.label2:setHeight(20);
    obj.label2:setText("OUTROS");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.rclListaDosOutros = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDosOutros:setParent(obj.layout2);
    obj.rclListaDosOutros:setName("rclListaDosOutros");
    obj.rclListaDosOutros:setField("campoDosOutros");
    obj.rclListaDosOutros:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDosOutros:setLeft(5);
    obj.rclListaDosOutros:setTop(25);
    obj.rclListaDosOutros:setWidth(370);
    obj.rclListaDosOutros:setHeight(570);
    obj.rclListaDosOutros:setLayout("vertical");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(790);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(380);
    obj.layout3:setHeight(600);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#0000007F");
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(380);
    obj.label3:setHeight(20);
    obj.label3:setText("CARACTERISTICAS DE CLASSE");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.rclListaDasCaracteristicasClasse = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasCaracteristicasClasse:setParent(obj.layout3);
    obj.rclListaDasCaracteristicasClasse:setName("rclListaDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setField("campoDasCaracteristicasClasse");
    obj.rclListaDasCaracteristicasClasse:setTemplateForm("frmFichaRPGmeister4h_svg");
    obj.rclListaDasCaracteristicasClasse:setLeft(5);
    obj.rclListaDasCaracteristicasClasse:setTop(25);
    obj.rclListaDasCaracteristicasClasse:setWidth(370);
    obj.rclListaDasCaracteristicasClasse:setHeight(570);
    obj.rclListaDasCaracteristicasClasse:setLayout("vertical");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(1180);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(135);
    obj.layout4:setHeight(600);
    obj.layout4:setName("layout4");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout4);
    obj.button1:setText("Novo Talento");
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(125);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout4);
    obj.button2:setText("Novo Outros");
    obj.button2:setLeft(0);
    obj.button2:setTop(25);
    obj.button2:setWidth(125);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout4);
    obj.button3:setText("Nova Caracteristica");
    obj.button3:setLeft(0);
    obj.button3:setTop(50);
    obj.button3:setWidth(125);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj._e_event0 = obj.rclListaDosTalentos:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event1 = obj.rclListaDosOutros:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event2 = obj.rclListaDasCaracteristicasClasse:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return ((tonumber(nodeA.nivelHabilidade) or 0) - (tonumber(nodeB.nivelHabilidade) or 0));
        end, obj);

    obj._e_event3 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclListaDosTalentos:append();
        end, obj);

    obj._e_event4 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclListaDosOutros:append();
        end, obj);

    obj._e_event5 = obj.button3:addEventListener("onClick",
        function (_)
            self.rclListaDasCaracteristicasClasse:append();
        end, obj);

    function obj:_releaseEvents()
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rclListaDosTalentos ~= nil then self.rclListaDosTalentos:destroy(); self.rclListaDosTalentos = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rclListaDosOutros ~= nil then self.rclListaDosOutros:destroy(); self.rclListaDosOutros = nil; end;
        if self.rclListaDasCaracteristicasClasse ~= nil then self.rclListaDasCaracteristicasClasse:destroy(); self.rclListaDasCaracteristicasClasse = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister4_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister4_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister4_svg = {
    newEditor = newfrmFichaRPGmeister4_svg, 
    new = newfrmFichaRPGmeister4_svg, 
    name = "frmFichaRPGmeister4_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister4_svg = _frmFichaRPGmeister4_svg;
Firecast.registrarForm(_frmFichaRPGmeister4_svg);

return _frmFichaRPGmeister4_svg;
