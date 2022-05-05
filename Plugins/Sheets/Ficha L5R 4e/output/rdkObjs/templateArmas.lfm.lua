require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_templateArmas()
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
    obj:setName("templateArmas");
    obj:setHeight(30);

    obj.btnArma = GUI.fromHandle(_obj_newObject("button"));
    obj.btnArma:setParent(obj);
    obj.btnArma:setAlign("right");
    obj.btnArma:setText("𝐢");
    obj.btnArma:setWidth(30);
    obj.btnArma:setName("btnArma");
    obj.btnArma:setMargins({right=2});

    obj.popArma = GUI.fromHandle(_obj_newObject("popup"));
    obj.popArma:setParent(obj);
    obj.popArma:setName("popArma");
    obj.popArma:setWidth(440);
    obj.popArma:setHeight(260);
    obj.popArma:setBackOpacity(0);
    obj.popArma:setDrawContainer(false);
    lfm_setPropAsString(obj.popArma, "autoScopeNode",  "true");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popArma);
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
    obj.label1:setField("nomeArma");
    obj.label1:setMargins({bottom=5});
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontFamily("Constantia");
    obj.label1:setFontSize(26);
    obj.label1:setHeight(30);
    obj.label1:setName("label1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle1);
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setMargins({bottom=5});
    obj.horzLine1:setStrokeColor("#424242");
    obj.horzLine1:setName("horzLine1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setHeight(30);
    obj.layout1:setAlign("top");
    obj.layout1:setName("layout1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setWidth(210);
    obj.layout2:setAlign("left");
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Perícia:");
    obj.label2:setWidth(50);
    obj.label2:setAlign("left");
    obj.label2:setMargins({right=2});
    obj.label2:setName("label2");
    obj.label2:setFontFamily("Cambria");
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setField("periArma");
    obj.edit1:setAlign("client");
    obj.edit1:setMargins({right=2});
    obj.edit1:setName("edit1");
    obj.edit1:setFontFamily("Cambria");
    obj.edit1:setTransparent(true);
    obj.edit1:setFontColor("#cdcdcd");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setField("periArma");
    obj.dataLink1:setName("dataLink1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setWidth(210);
    obj.layout3:setAlign("left");
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setText("Ataque:");
    obj.label3:setWidth(50);
    obj.label3:setAlign("left");
    obj.label3:setMargins({right=2});
    obj.label3:setName("label3");
    obj.label3:setFontFamily("Cambria");
    obj.label3:setFontColor("white");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setField("atkArma");
    obj.edit2:setAlign("client");
    obj.edit2:setName("edit2");
    obj.edit2:setFontFamily("Cambria");
    obj.edit2:setTransparent(true);
    obj.edit2:setFontColor("#cdcdcd");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout3);
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setField("atkArma");
    obj.dataLink2:setName("dataLink2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setHeight(30);
    obj.layout4:setAlign("top");
    obj.layout4:setName("layout4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout4);
    obj.layout5:setWidth(210);
    obj.layout5:setAlign("left");
    obj.layout5:setName("layout5");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout5);
    obj.label4:setText("Dano:");
    obj.label4:setWidth(40);
    obj.label4:setAlign("left");
    obj.label4:setMargins({right=2});
    obj.label4:setName("label4");
    obj.label4:setFontFamily("Cambria");
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout5);
    obj.edit3:setField("danoArma");
    obj.edit3:setAlign("client");
    obj.edit3:setMargins({right=2});
    obj.edit3:setName("edit3");
    obj.edit3:setFontFamily("Cambria");
    obj.edit3:setTransparent(true);
    obj.edit3:setFontColor("#cdcdcd");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout5);
    obj.dataLink3:setDefaultValue("—");
    obj.dataLink3:setField("danoArma");
    obj.dataLink3:setName("dataLink3");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout4);
    obj.layout6:setWidth(210);
    obj.layout6:setAlign("left");
    obj.layout6:setName("layout6");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout6);
    obj.label5:setText("Quantidade:");
    obj.label5:setWidth(75);
    obj.label5:setAlign("left");
    obj.label5:setMargins({right=2});
    obj.label5:setName("label5");
    obj.label5:setFontFamily("Cambria");
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout6);
    obj.edit4:setField("quantArma");
    obj.edit4:setAlign("client");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");
    obj.edit4:setFontFamily("Cambria");
    obj.edit4:setTransparent(true);
    obj.edit4:setFontColor("#cdcdcd");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout6);
    obj.dataLink4:setDefaultValue("0");
    obj.dataLink4:setField("quantArma");
    obj.dataLink4:setName("dataLink4");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setField("descriArma");
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setFontFamily("Cambria");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setMargins({top=10});
    obj.textEditor1:setName("textEditor1");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle1);
    obj.dataLink5:setField("descriArma");
    obj.dataLink5:setDefaultValue("Descrição.");
    obj.dataLink5:setName("dataLink5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setAlign("right");
    obj.button1:setText("🞭");
    obj.button1:setWidth(30);
    obj.button1:setName("button1");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setField("nomeArma");
    obj.edit5:setAlign("client");
    obj.edit5:setMargins({right=2});
    lfm_setPropAsString(obj.edit5, "fontStyle",  "bold");
    obj.edit5:setFontColor("white");
    obj.edit5:setName("edit5");
    obj.edit5:setFontFamily("Cambria");
    obj.edit5:setTransparent(true);

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setDefaultValue("—");
    obj.dataLink6:setField("nomeArma");
    obj.dataLink6:setName("dataLink6");

    obj._e_event0 = obj.btnArma:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popArma");
            			if pop ~= nil then
            			pop:setNodeObject(self.sheet);
            			pop:showPopupEx("left", self.btnArma);
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

        if self.btnArma ~= nil then self.btnArma:destroy(); self.btnArma = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.popArma ~= nil then self.popArma:destroy(); self.popArma = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newtemplateArmas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_templateArmas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _templateArmas = {
    newEditor = newtemplateArmas, 
    new = newtemplateArmas, 
    name = "templateArmas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

templateArmas = _templateArmas;
Firecast.registrarForm(_templateArmas);

return _templateArmas;
