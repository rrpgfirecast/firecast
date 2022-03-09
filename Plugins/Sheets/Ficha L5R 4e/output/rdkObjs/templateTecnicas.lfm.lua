require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_templateTecnicas()
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
    obj:setName("templateTecnicas");
    obj:setHeight(30);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setHeight(30);
    obj.layout1:setAlign("top");
    obj.layout1:setMargins({bottom=2});
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("nomeEscola");
    obj.edit1:setWidth(283);
    obj.edit1:setAlign("left");
    obj.edit1:setMargins({right=2});
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("white");
    obj.edit1:setName("edit1");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setField("nomeEscola");
    obj.dataLink1:setName("dataLink1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setWidth(25);
    obj.rectangle1:setMargins({right=2});
    obj.rectangle1:setName("rectangle1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setField("lvlEscola");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setAlign("client");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontColor("#cdcdcd");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setDefaultValue("1");
    obj.dataLink2:setField("lvlEscola");
    obj.dataLink2:setName("dataLink2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1:setWidth(80);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setField("afini");
    obj.comboBox1:setItems({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio', 'Maho', 'Nenhum', 'Wards'});
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setMargins({right=2});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontFamily("Cambria");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("#cdcdcd");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setColor("#212121");
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(162);
    obj.rectangle2:setMargins({right=2});
    obj.rectangle2:setName("rectangle2");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle2);
    obj.comboBox2:setWidth(80);
    obj.comboBox2:setHorzTextAlign("center");
    obj.comboBox2:setField("def1");
    obj.comboBox2:setItems({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio', 'Nenhum', 'Craft'});
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setMargins({right=2});
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setFontFamily("Cambria");
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setFontColor("#cdcdcd");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.rectangle2);
    obj.comboBox3:setWidth(80);
    obj.comboBox3:setHorzTextAlign("center");
    obj.comboBox3:setField("def2");
    obj.comboBox3:setItems({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio', 'Nenhum', 'Travel'});
    obj.comboBox3:setAlign("left");
    obj.comboBox3:setName("comboBox3");
    obj.comboBox3:setFontFamily("Cambria");
    obj.comboBox3:setTransparent(true);
    obj.comboBox3:setFontColor("#cdcdcd");

    obj.btnTec = GUI.fromHandle(_obj_newObject("button"));
    obj.btnTec:setParent(obj.layout1);
    obj.btnTec:setAlign("left");
    obj.btnTec:setName("btnTec");
    obj.btnTec:setText("𝐢");
    obj.btnTec:setWidth(30);

    obj.popTecnica = GUI.fromHandle(_obj_newObject("popup"));
    obj.popTecnica:setParent(obj.layout1);
    obj.popTecnica:setName("popTecnica");
    obj.popTecnica:setWidth(560);
    obj.popTecnica:setHeight(350);
    obj.popTecnica:setBackOpacity(0);
    obj.popTecnica:setDrawContainer(false);
    lfm_setPropAsString(obj.popTecnica, "autoScopeNode",  "true");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.popTecnica);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("#0e0e0e");
    obj.rectangle3:setPadding({top=10, left=10, bottom=10, right=10});
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setName("rectangle3");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle3);
    obj.label1:setFontColor("white");
    obj.label1:setAlign("top");
    obj.label1:setField("nomeEscola");
    obj.label1:setMargins({bottom=5});
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontFamily("Constantia");
    obj.label1:setFontSize(26);
    obj.label1:setHeight(30);
    obj.label1:setName("label1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle3);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({bottom=5});
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setName("horzLine1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle3);
    obj.textEditor1:setField("descriEscola");
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setFontFamily("Cambria");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle3);
    obj.dataLink3:setField("descriEscola");
    obj.dataLink3:setDefaultValue("—");
    obj.dataLink3:setName("dataLink3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setText("🞭");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj._e_event0 = obj.btnTec:addEventListener("onClick",
        function (_)
        end, obj);

    obj._e_event1 = obj.btnTec:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popTecnica");
            				if pop ~= nil then
            				pop:setNodeObject(self.sheet);
            				pop:showPopupEx("left", self.btnTec);
            				else
            				showMessage("Ops, bug... Nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    function obj:_releaseEvents()
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

        if self.btnTec ~= nil then self.btnTec:destroy(); self.btnTec = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.popTecnica ~= nil then self.popTecnica:destroy(); self.popTecnica = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newtemplateTecnicas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_templateTecnicas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _templateTecnicas = {
    newEditor = newtemplateTecnicas, 
    new = newtemplateTecnicas, 
    name = "templateTecnicas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

templateTecnicas = _templateTecnicas;
Firecast.registrarForm(_templateTecnicas);

return _templateTecnicas;
