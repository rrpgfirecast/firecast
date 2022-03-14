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
    obj:setHeight(70);

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(30);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("left");
    obj.edit1:setField("aaa");
    obj.edit1:setWidth(188);
    obj.edit1:setMargins({right=2});
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("white");
    obj.edit1:setName("edit1");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setField("aaa");
    obj.dataLink1:setName("dataLink1");

    obj.btnKK = GUI.fromHandle(_obj_newObject("button"));
    obj.btnKK:setParent(obj.layout1);
    obj.btnKK:setAlign("right");
    obj.btnKK:setName("btnKK");
    obj.btnKK:setText("𝐢");
    obj.btnKK:setWidth(30);
    obj.btnKK:setMargins({right=2});

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setText("🞭");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setAlign("client");
    obj.edit2:setField("abb");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setMargins({right=2});
    obj.edit2:setName("edit2");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontColor("#cdcdcd");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setDefaultValue("1");
    obj.dataLink2:setField("abb");
    obj.dataLink2:setName("dataLink2");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({top=2, bottom=2});
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setName("horzLine1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setAlign("top");
    obj.layout2:setHeight(30);
    obj.layout2:setName("layout2");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout2);
    obj.comboBox1:setWidth(113);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setMargins({right=2});
    obj.comboBox1:setItems({'Kata', 'Kiho Interno', 'Kiho Kármico', 'Kiho Marcial', 'Kiho Místico'});
    obj.comboBox1:setField("tipoKata");
    obj.comboBox1:setValues({'Kata', 'Kiho Interno', 'Kiho Kármico', 'Kiho Marcial', 'Kiho Místico'});
    obj.comboBox1:setName("comboBox1");
    obj.comboBox1:setFontFamily("Cambria");
    obj.comboBox1:setTransparent(true);
    obj.comboBox1:setFontColor("#cdcdcd");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout2);
    obj.comboBox2:setWidth(113);
    obj.comboBox2:setAlign("left");
    obj.comboBox2:setMargins({right=2});
    obj.comboBox2:setItems({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio'});
    obj.comboBox2:setField("elementoKata");
    obj.comboBox2:setValues({'Água', 'Ar', 'Fogo', 'Terra', 'Vazio'});
    obj.comboBox2:setName("comboBox2");
    obj.comboBox2:setFontFamily("Cambria");
    obj.comboBox2:setTransparent(true);
    obj.comboBox2:setFontColor("#cdcdcd");

    obj.popKK = GUI.fromHandle(_obj_newObject("popup"));
    obj.popKK:setParent(obj.layout2);
    obj.popKK:setName("popKK");
    obj.popKK:setWidth(440);
    obj.popKK:setHeight(200);
    obj.popKK:setBackOpacity(0);
    obj.popKK:setDrawContainer(false);
    lfm_setPropAsString(obj.popKK, "autoScopeNode",  "true");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popKK);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0e0e0e");
    obj.rectangle1:setPadding({top=10, left=10, bottom=10, right=10});
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("bevel");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setFontColor("white");
    obj.label1:setAlign("top");
    obj.label1:setField("aaa");
    obj.label1:setMargins({bottom=5});
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontFamily("Constantia");
    obj.label1:setFontSize(26);
    obj.label1:setHeight(30);
    obj.label1:setName("label1");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj.rectangle1);
    obj.horzLine2:setAlign("top");
    obj.horzLine2:setMargins({bottom=5});
    obj.horzLine2:setStrokeColor("#424242");
    obj.horzLine2:setName("horzLine2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setField("descriKata");
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setFontFamily("Cambria");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle1);
    obj.dataLink3:setField("descriKata");
    obj.dataLink3:setDefaultValue("—");
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.btnKK:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popKK");
            				if pop ~= nil then
            				pop:setNodeObject(self.sheet);
            				pop:showPopupEx("left", self.btnKK);
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

        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.popKK ~= nil then self.popKK:destroy(); self.popKK = nil; end;
        if self.btnKK ~= nil then self.btnKK:destroy(); self.btnKK = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
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
