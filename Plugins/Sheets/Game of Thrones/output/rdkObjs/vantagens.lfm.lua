require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_vantagens()
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
    obj:setName("vantagens");
    obj:setHeight(25);
    obj:setWidth(680);
    obj:setMargins({bottom=10});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("🞭");
    obj.label1:setWidth(25);
    obj.label1:setHint("Apagar Vantagem");
    obj.label1:setAlign("left");
    obj.label1:setMargins({right=10, bottom=3});
    obj.label1:setHitTest(true);
    obj.label1:setFontSize(25);
    obj.label1:setCursor("handPoint");
    obj.label1:setFontColor("#a7754d");
    obj.label1:setName("label1");

    obj.DescVant = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.DescVant:setParent(obj.layout1);
    obj.DescVant:setName("DescVant");
    obj.DescVant:setWidth(25);
    obj.DescVant:setHint("Descrição");
    obj.DescVant:setAlign("left");
    obj.DescVant:setMargins({right=10});
    obj.DescVant:setStrokeColor("#a7754d");
    obj.DescVant:setStrokeSize(2);
    obj.DescVant:setXradius(3);
    obj.DescVant:setYradius(3);
    obj.DescVant:setCornerType("round");
    obj.DescVant:setColor("transparent");
    obj.DescVant:setCursor("handPoint");
    obj.DescVant:setHitTest(true);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.DescVant);
    obj.label2:setAlign("client");
    obj.label2:setText("𝐢");
    obj.label2:setFontSize(17);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setVertTextAlign("center");
    obj.label2:setFontColor("#a7754d");
    obj.label2:setName("label2");

    obj.popUp_Vant = GUI.fromHandle(_obj_newObject("popup"));
    obj.popUp_Vant:setParent(obj.layout1);
    obj.popUp_Vant:setName("popUp_Vant");
    obj.popUp_Vant:setWidth(590);
    obj.popUp_Vant:setHeight(350);
    obj.popUp_Vant:setBackOpacity(0);
    obj.popUp_Vant:setDrawContainer(false);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.popUp_Vant);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#e2bc8f");
    obj.rectangle1:setStrokeSize(4);
    obj.rectangle1:setStrokeColor("#a7754d");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("#e2bc8f");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setStrokeColor("#a7754d");
    obj.rectangle2:setMargins({top=6, right=6, left=6, bottom=6});
    obj.rectangle2:setName("rectangle2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setField("nomeVant");
    obj.label3:setAlign("top");
    obj.label3:setFontFamily("Palatino Linotype");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("black");
    obj.label3:setFontSize(25);
    obj.label3:setMargins({top=20, left=20});
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle2);
    obj.label4:setField("tipoVant");
    lfm_setPropAsString(obj.label4, "anchors",  "right top");
    obj.label4:setFontFamily("Palatino Linotype");
    obj.label4:setHorzTextAlign("trailing");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("black");
    obj.label4:setFontSize(15);
    obj.label4:setTop(25);
    obj.label4:setRight(0);
    obj.label4:setName("label4");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.rectangle2);
    obj.horzLine1:setStrokeSize(2);
    obj.horzLine1:setStrokeColor("#a7754d");
    obj.horzLine1:setMargins({left=20, right=20, top=10, bottom=10});
    obj.horzLine1:setAlign("top");
    obj.horzLine1:setName("horzLine1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle2);
    obj.textEditor1:setField("DescVant");
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setMargins({top=10, right=20, left=20, bottom=20});
    obj.textEditor1:setName("textEditor1");
    obj.textEditor1:setFontFamily("Palatino Linotype");
    obj.textEditor1:setFontColor("#573c27");
    obj.textEditor1:setFontSize(15);
    obj.textEditor1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle2);
    obj.dataLink1:setField("DescVant");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setField("nomeVant");
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(300);
    obj.edit1:setMargins({right=10});
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setFontColor("black");
    obj.edit1:setName("edit1");
    obj.edit1:setFontFamily("Palatino Linotype");
    obj.edit1:setHeight(25);
    obj.edit1:setFontSize(15);
    obj.edit1:setTransparent(true);

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setField("nomeVant");
    obj.dataLink2:setDefaultValue("—");
    obj.dataLink2:setName("dataLink2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setField("tipoVant");
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(150);
    obj.edit2:setName("edit2");
    obj.edit2:setFontFamily("Palatino Linotype");
    obj.edit2:setFontColor("#573c27");
    obj.edit2:setHeight(25);
    obj.edit2:setFontSize(15);
    obj.edit2:setTransparent(true);

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setField("tipoVant");
    obj.dataLink3:setDefaultValue("—");
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.label1:addEventListener("onClick",
        function (_)
            NDB.deleteNode(sheet);
        end, obj);

    obj._e_event1 = obj.DescVant:addEventListener("onClick",
        function (_)
        end, obj);

    obj._e_event2 = obj.DescVant:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popUp_Vant");
            				
            				if pop ~= nil then
            					pop:setNodeObject(sheet);
            					pop:showPopupEx("right", self.DescVant);
            				else
            					showMessage("Ops, não encontrei o pop-up para exibir");
            				end;
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

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.popUp_Vant ~= nil then self.popUp_Vant:destroy(); self.popUp_Vant = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.DescVant ~= nil then self.DescVant:destroy(); self.DescVant = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newvantagens()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_vantagens();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _vantagens = {
    newEditor = newvantagens, 
    new = newvantagens, 
    name = "vantagens", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

vantagens = _vantagens;
Firecast.registrarForm(_vantagens);

return _vantagens;
