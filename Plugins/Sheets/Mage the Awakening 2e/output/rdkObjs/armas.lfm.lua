require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_armas()
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
    obj:setName("armas");
    obj:setHeight(230);
    obj:setWidth(220);
    obj:setMargins({left=20, right=20});

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj);
    obj.flowPart1:setHeight(230);
    obj.flowPart1:setWidth(220);
    obj.flowPart1:setMargins({top=10});
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setMinWidth(220);
    obj.flowPart1:setMaxWidth(220);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.flowPart1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#202020");
    obj.rectangle1:setCornerType("bevel");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setPadding({top=10, bottom=10, left=10, right=10});
    obj.rectangle1:setMargins({bottom=10});
    obj.rectangle1:setName("rectangle1");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.rectangle1);
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setWidth(220);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxColumns(1);
    obj.flowLayout1:setName("flowLayout1");

    obj.flowLayout2 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout2:setParent(obj.flowLayout1);
    obj.flowLayout2:setMinWidth(220);
    obj.flowLayout2:setMaxWidth(220);
    obj.flowLayout2:setMargins({top=5, left=10, bottom=5});
    obj.flowLayout2:setName("flowLayout2");
    obj.flowLayout2:setAlign("top");
    obj.flowLayout2:setOrientation("horizontal");
    obj.flowLayout2:setHorzAlign("center");
    obj.flowLayout2:setAutoHeight(true);
    obj.flowLayout2:setMaxControlsPerLine(2);

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flowLayout2);
    obj.flowPart2:setMargins({bottom=0});
    obj.flowPart2:setName("flowPart2");
    obj.flowPart2:setMinWidth(160);
    obj.flowPart2:setMaxWidth(160);
    obj.flowPart2:setHeight(25);

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart2);
    obj.edit1:setAlign("left");
    obj.edit1:setField("fldDis_Disc00");
    obj.edit1:setWidth(160);
    obj.edit1:setName("edit1");
    obj.edit1:setFontSize(14);
    obj.edit1:setFontColor("white");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setTextTrimming("character");
    obj.edit1:setFontFamily("Constantia");
    obj.edit1:setTransparent(true);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.flowPart2);
    obj.dataLink1:setField("fldDis_Disc00");
    obj.dataLink1:setDefaultValue("—");
    obj.dataLink1:setName("dataLink1");

    obj.flowPart3 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart3:setParent(obj.flowLayout2);
    obj.flowPart3:setHeight(25);
    obj.flowPart3:setMargins({top=5, bottom=0});
    obj.flowPart3:setName("flowPart3");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.flowPart3);
    obj.layout1:setAlign("right");
    obj.layout1:setWidth(22);
    obj.layout1:setHeight(22);
    obj.layout1:setMargins({right=7});
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("🞭");
    obj.button1:setWidth(22);
    obj.button1:setHeight(22);
    obj.button1:setHint("Apagar Arma");
    obj.button1:setName("button1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj.flowLayout1);
    obj.horzLine1:setAlign("none");
    obj.horzLine1:setMargins({bottom=10});
    obj.horzLine1:setTop(24);
    obj.horzLine1:setWidth(215);
    obj.horzLine1:setName("horzLine1");
    obj.horzLine1:setStrokeColor("#424242");

    obj.flowLayout3 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout3:setParent(obj.flowLayout1);
    obj.flowLayout3:setAutoHeight(false);
    obj.flowLayout3:setMinWidth(220);
    obj.flowLayout3:setMaxWidth(220);
    obj.flowLayout3:setHeight(100);
    obj.flowLayout3:setMargins();
    obj.flowLayout3:setName("flowLayout3");
    obj.flowLayout3:setAlign("top");
    obj.flowLayout3:setOrientation("horizontal");
    obj.flowLayout3:setHorzAlign("center");
    obj.flowLayout3:setMaxControlsPerLine(2);

    obj.flowPart4 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart4:setParent(obj.flowLayout3);
    obj.flowPart4:setName("flowPart4");
    obj.flowPart4:setMinWidth(100);
    obj.flowPart4:setMaxWidth(100);
    obj.flowPart4:setHeight(25);
    obj.flowPart4:setMargins({left=5, right=5, bottom=10});

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowPart4);
    obj.label1:setAlign("left");
    obj.label1:setWidth(60);
    obj.label1:setText("Damage: ");
    obj.label1:setName("label1");
    obj.label1:setFontSize(14);
    obj.label1:setFontColor("white");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setTextTrimming("character");
    obj.label1:setFontFamily("Constantia");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowPart4);
    obj.edit2:setAlign("client");
    obj.edit2:setField("fldDamage");
    obj.edit2:setName("edit2");
    obj.edit2:setFontSize(14);
    obj.edit2:setFontColor("#cdcdcd");
    obj.edit2:setTextTrimming("character");
    obj.edit2:setFontFamily("Constantia");
    obj.edit2:setTransparent(true);

    obj.flowPart5 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart5:setParent(obj.flowLayout3);
    obj.flowPart5:setName("flowPart5");
    obj.flowPart5:setMinWidth(100);
    obj.flowPart5:setMaxWidth(100);
    obj.flowPart5:setHeight(25);
    obj.flowPart5:setMargins({left=5, right=5, bottom=10});

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowPart5);
    obj.label2:setAlign("left");
    obj.label2:setWidth(50);
    obj.label2:setText("Range: ");
    obj.label2:setName("label2");
    obj.label2:setFontSize(14);
    obj.label2:setFontColor("white");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setTextTrimming("character");
    obj.label2:setFontFamily("Constantia");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowPart5);
    obj.edit3:setAlign("client");
    obj.edit3:setField("fldRange");
    obj.edit3:setName("edit3");
    obj.edit3:setFontSize(14);
    obj.edit3:setFontColor("#cdcdcd");
    obj.edit3:setTextTrimming("character");
    obj.edit3:setFontFamily("Constantia");
    obj.edit3:setTransparent(true);

    obj.flowPart6 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart6:setParent(obj.flowLayout3);
    obj.flowPart6:setName("flowPart6");
    obj.flowPart6:setMinWidth(100);
    obj.flowPart6:setMaxWidth(100);
    obj.flowPart6:setHeight(25);
    obj.flowPart6:setMargins({left=5, right=5, bottom=10});

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowPart6);
    obj.label3:setAlign("left");
    obj.label3:setWidth(35);
    obj.label3:setText("Clip: ");
    obj.label3:setName("label3");
    obj.label3:setFontSize(14);
    obj.label3:setFontColor("white");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setTextTrimming("character");
    obj.label3:setFontFamily("Constantia");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowPart6);
    obj.edit4:setAlign("client");
    obj.edit4:setField("fldClip");
    obj.edit4:setName("edit4");
    obj.edit4:setFontSize(14);
    obj.edit4:setFontColor("#cdcdcd");
    obj.edit4:setTextTrimming("character");
    obj.edit4:setFontFamily("Constantia");
    obj.edit4:setTransparent(true);

    obj.flowPart7 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart7:setParent(obj.flowLayout3);
    obj.flowPart7:setName("flowPart7");
    obj.flowPart7:setMinWidth(100);
    obj.flowPart7:setMaxWidth(100);
    obj.flowPart7:setHeight(25);
    obj.flowPart7:setMargins({left=5, right=5, bottom=10});

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowPart7);
    obj.label4:setAlign("left");
    obj.label4:setWidth(30);
    obj.label4:setText("Init: ");
    obj.label4:setName("label4");
    obj.label4:setFontSize(14);
    obj.label4:setFontColor("white");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setTextTrimming("character");
    obj.label4:setFontFamily("Constantia");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowPart7);
    obj.edit5:setAlign("client");
    obj.edit5:setField("fldInit");
    obj.edit5:setName("edit5");
    obj.edit5:setFontSize(14);
    obj.edit5:setFontColor("#cdcdcd");
    obj.edit5:setTextTrimming("character");
    obj.edit5:setFontFamily("Constantia");
    obj.edit5:setTransparent(true);

    obj.flowPart8 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart8:setParent(obj.flowLayout3);
    obj.flowPart8:setName("flowPart8");
    obj.flowPart8:setMinWidth(100);
    obj.flowPart8:setMaxWidth(100);
    obj.flowPart8:setHeight(25);
    obj.flowPart8:setMargins({left=5, right=5, bottom=10});

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowPart8);
    obj.label5:setAlign("left");
    obj.label5:setWidth(65);
    obj.label5:setText("Strength: ");
    obj.label5:setName("label5");
    obj.label5:setFontSize(14);
    obj.label5:setFontColor("white");
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setTextTrimming("character");
    obj.label5:setFontFamily("Constantia");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.flowPart8);
    obj.edit6:setAlign("client");
    obj.edit6:setField("fldStrength");
    obj.edit6:setName("edit6");
    obj.edit6:setFontSize(14);
    obj.edit6:setFontColor("#cdcdcd");
    obj.edit6:setTextTrimming("character");
    obj.edit6:setFontFamily("Constantia");
    obj.edit6:setTransparent(true);

    obj.flowPart9 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart9:setParent(obj.flowLayout3);
    obj.flowPart9:setName("flowPart9");
    obj.flowPart9:setMinWidth(100);
    obj.flowPart9:setMaxWidth(100);
    obj.flowPart9:setHeight(25);
    obj.flowPart9:setMargins({left=5, right=5, bottom=10});

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowPart9);
    obj.label6:setAlign("left");
    obj.label6:setWidth(35);
    obj.label6:setText("Size: ");
    obj.label6:setName("label6");
    obj.label6:setFontSize(14);
    obj.label6:setFontColor("white");
    lfm_setPropAsString(obj.label6, "fontStyle",  "bold");
    obj.label6:setTextTrimming("character");
    obj.label6:setFontFamily("Constantia");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.flowPart9);
    obj.edit7:setAlign("client");
    obj.edit7:setField("fldSize");
    obj.edit7:setName("edit7");
    obj.edit7:setFontSize(14);
    obj.edit7:setFontColor("#cdcdcd");
    obj.edit7:setTextTrimming("character");
    obj.edit7:setFontFamily("Constantia");
    obj.edit7:setTransparent(true);

    obj.flowPart10 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart10:setParent(obj.flowLayout1);
    obj.flowPart10:setMinWidth(200);
    obj.flowPart10:setMaxWidth(209);
    obj.flowPart10:setHeight(60);
    obj.flowPart10:setMargins({top=5, right=5});
    obj.flowPart10:setName("flowPart10");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.flowPart10);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setTransparent(false);
    obj.textEditor1:setField("texteditor$(classAtr)");
    obj.textEditor1:setMargins({bottom=5, right=10});
    obj.textEditor1:setName("textEditor1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_, event)
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

        if self.flowLayout2 ~= nil then self.flowLayout2:destroy(); self.flowLayout2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.flowPart7 ~= nil then self.flowPart7:destroy(); self.flowPart7 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.flowPart10 ~= nil then self.flowPart10:destroy(); self.flowPart10 = nil; end;
        if self.flowPart4 ~= nil then self.flowPart4:destroy(); self.flowPart4 = nil; end;
        if self.flowLayout3 ~= nil then self.flowLayout3:destroy(); self.flowLayout3 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.flowPart9 ~= nil then self.flowPart9:destroy(); self.flowPart9 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.flowPart6 ~= nil then self.flowPart6:destroy(); self.flowPart6 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.flowPart3 ~= nil then self.flowPart3:destroy(); self.flowPart3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.flowPart8 ~= nil then self.flowPart8:destroy(); self.flowPart8 = nil; end;
        if self.flowPart5 ~= nil then self.flowPart5:destroy(); self.flowPart5 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newarmas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_armas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _armas = {
    newEditor = newarmas, 
    new = newarmas, 
    name = "armas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

armas = _armas;
Firecast.registrarForm(_armas);

return _armas;
