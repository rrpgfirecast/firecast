require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmACN5()
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
    obj:setName("frmACN5");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});


		local function fullResize()
			local height = self.notes.height / 3;
			
			self.anotacoes1.height = height-25;
			self.anotacoes1Part.height = height;
			self.anotacoes2.height = height-25;
			self.anotacoes2Part.height = height;
			self.anotacoes3.height = height-25;
			self.anotacoes3Part.height = height;
			self.anotacoes4.height = height-25;
			self.anotacoes4Part.height = height;
			self.anotacoes5.height = height-25;
			self.anotacoes5Part.height = height;
			self.anotacoes6.height = height-25;
			self.anotacoes6Part.height = height;
			self.anotacoes7.height = height-25;
			self.anotacoes7Part.height = height;
			self.anotacoes8.height = height-25;
			self.anotacoes8Part.height = height;
			self.anotacoes9.height = height-25;
			self.anotacoes9Part.height = height;
		end;
	


    obj.notes = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.notes:setParent(obj);
    obj.notes:setAlign("client");
    obj.notes:setName("notes");

    obj.flowLayout1 = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.notes);
    obj.flowLayout1:setAlign("top");
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setMaxColumns(3);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setOrientation("vertical");
    obj.flowLayout1:setAvoidScale(true);
    obj.flowLayout1:setName("flowLayout1");

    obj.anotacoes1Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes1Part:setParent(obj.flowLayout1);
    obj.anotacoes1Part:setMinWidth(300);
    obj.anotacoes1Part:setMaxWidth(600);
    obj.anotacoes1Part:setMinScaledWidth(280);
    obj.anotacoes1Part:setName("anotacoes1Part");
    obj.anotacoes1Part:setAdjustHeightToLine(false);
    obj.anotacoes1Part:setMargins({left=5});

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.anotacoes1Part);
    obj.label1:setAlign("top");
    obj.label1:setHeight(25);
    obj.label1:setText("ANOTAÇÕES");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.anotacoes1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes1:setParent(obj.anotacoes1Part);
    obj.anotacoes1:setAlign("top");
    obj.anotacoes1:setField("anotacoes1");
    obj.anotacoes1:setHeight(52);
    obj.anotacoes1:setName("anotacoes1");

    obj.anotacoes2Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes2Part:setParent(obj.flowLayout1);
    obj.anotacoes2Part:setMinWidth(300);
    obj.anotacoes2Part:setMaxWidth(600);
    obj.anotacoes2Part:setMinScaledWidth(280);
    obj.anotacoes2Part:setName("anotacoes2Part");
    obj.anotacoes2Part:setAdjustHeightToLine(false);
    obj.anotacoes2Part:setMargins({left=5});

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.anotacoes2Part);
    obj.label2:setAlign("top");
    obj.label2:setHeight(25);
    obj.label2:setText("ANOTAÇÕES");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.anotacoes2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes2:setParent(obj.anotacoes2Part);
    obj.anotacoes2:setAlign("top");
    obj.anotacoes2:setField("anotacoes2");
    obj.anotacoes2:setHeight(52);
    obj.anotacoes2:setName("anotacoes2");

    obj.anotacoes3Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes3Part:setParent(obj.flowLayout1);
    obj.anotacoes3Part:setMinWidth(300);
    obj.anotacoes3Part:setMaxWidth(600);
    obj.anotacoes3Part:setMinScaledWidth(280);
    obj.anotacoes3Part:setName("anotacoes3Part");
    obj.anotacoes3Part:setAdjustHeightToLine(false);
    obj.anotacoes3Part:setMargins({left=5});

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.anotacoes3Part);
    obj.label3:setAlign("top");
    obj.label3:setHeight(25);
    obj.label3:setText("ANOTAÇÕES");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.anotacoes3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes3:setParent(obj.anotacoes3Part);
    obj.anotacoes3:setAlign("top");
    obj.anotacoes3:setField("anotacoes3");
    obj.anotacoes3:setHeight(52);
    obj.anotacoes3:setName("anotacoes3");

    obj.anotacoes4Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes4Part:setParent(obj.flowLayout1);
    obj.anotacoes4Part:setMinWidth(300);
    obj.anotacoes4Part:setMaxWidth(600);
    obj.anotacoes4Part:setMinScaledWidth(280);
    obj.anotacoes4Part:setName("anotacoes4Part");
    obj.anotacoes4Part:setAdjustHeightToLine(false);
    obj.anotacoes4Part:setMargins({left=5});

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.anotacoes4Part);
    obj.label4:setAlign("top");
    obj.label4:setHeight(25);
    obj.label4:setText("ANOTAÇÕES");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.anotacoes4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes4:setParent(obj.anotacoes4Part);
    obj.anotacoes4:setAlign("top");
    obj.anotacoes4:setField("anotacoes4");
    obj.anotacoes4:setHeight(52);
    obj.anotacoes4:setName("anotacoes4");

    obj.anotacoes5Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes5Part:setParent(obj.flowLayout1);
    obj.anotacoes5Part:setMinWidth(300);
    obj.anotacoes5Part:setMaxWidth(600);
    obj.anotacoes5Part:setMinScaledWidth(280);
    obj.anotacoes5Part:setName("anotacoes5Part");
    obj.anotacoes5Part:setAdjustHeightToLine(false);
    obj.anotacoes5Part:setMargins({left=5});

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.anotacoes5Part);
    obj.label5:setAlign("top");
    obj.label5:setHeight(25);
    obj.label5:setText("ANOTAÇÕES");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.anotacoes5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes5:setParent(obj.anotacoes5Part);
    obj.anotacoes5:setAlign("top");
    obj.anotacoes5:setField("anotacoes5");
    obj.anotacoes5:setHeight(52);
    obj.anotacoes5:setName("anotacoes5");

    obj.anotacoes6Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes6Part:setParent(obj.flowLayout1);
    obj.anotacoes6Part:setMinWidth(300);
    obj.anotacoes6Part:setMaxWidth(600);
    obj.anotacoes6Part:setMinScaledWidth(280);
    obj.anotacoes6Part:setName("anotacoes6Part");
    obj.anotacoes6Part:setAdjustHeightToLine(false);
    obj.anotacoes6Part:setMargins({left=5});

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.anotacoes6Part);
    obj.label6:setAlign("top");
    obj.label6:setHeight(25);
    obj.label6:setText("ANOTAÇÕES");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.anotacoes6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes6:setParent(obj.anotacoes6Part);
    obj.anotacoes6:setAlign("top");
    obj.anotacoes6:setField("anotacoes6");
    obj.anotacoes6:setHeight(52);
    obj.anotacoes6:setName("anotacoes6");

    obj.anotacoes7Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes7Part:setParent(obj.flowLayout1);
    obj.anotacoes7Part:setMinWidth(300);
    obj.anotacoes7Part:setMaxWidth(600);
    obj.anotacoes7Part:setMinScaledWidth(280);
    obj.anotacoes7Part:setName("anotacoes7Part");
    obj.anotacoes7Part:setAdjustHeightToLine(false);
    obj.anotacoes7Part:setMargins({left=5});

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.anotacoes7Part);
    obj.label7:setAlign("top");
    obj.label7:setHeight(25);
    obj.label7:setText("ANOTAÇÕES");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.anotacoes7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes7:setParent(obj.anotacoes7Part);
    obj.anotacoes7:setAlign("top");
    obj.anotacoes7:setField("anotacoes7");
    obj.anotacoes7:setHeight(52);
    obj.anotacoes7:setName("anotacoes7");

    obj.anotacoes8Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes8Part:setParent(obj.flowLayout1);
    obj.anotacoes8Part:setMinWidth(300);
    obj.anotacoes8Part:setMaxWidth(600);
    obj.anotacoes8Part:setMinScaledWidth(280);
    obj.anotacoes8Part:setName("anotacoes8Part");
    obj.anotacoes8Part:setAdjustHeightToLine(false);
    obj.anotacoes8Part:setMargins({left=5});

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.anotacoes8Part);
    obj.label8:setAlign("top");
    obj.label8:setHeight(25);
    obj.label8:setText("ANOTAÇÕES");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.anotacoes8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes8:setParent(obj.anotacoes8Part);
    obj.anotacoes8:setAlign("top");
    obj.anotacoes8:setField("anotacoes8");
    obj.anotacoes8:setHeight(52);
    obj.anotacoes8:setName("anotacoes8");

    obj.anotacoes9Part = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.anotacoes9Part:setParent(obj.flowLayout1);
    obj.anotacoes9Part:setMinWidth(300);
    obj.anotacoes9Part:setMaxWidth(600);
    obj.anotacoes9Part:setMinScaledWidth(280);
    obj.anotacoes9Part:setName("anotacoes9Part");
    obj.anotacoes9Part:setAdjustHeightToLine(false);
    obj.anotacoes9Part:setMargins({left=5});

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.anotacoes9Part);
    obj.label9:setAlign("top");
    obj.label9:setHeight(25);
    obj.label9:setText("ANOTAÇÕES");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.anotacoes9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.anotacoes9:setParent(obj.anotacoes9Part);
    obj.anotacoes9:setAlign("top");
    obj.anotacoes9:setField("anotacoes9");
    obj.anotacoes9:setHeight(52);
    obj.anotacoes9:setName("anotacoes9");

    obj._e_event0 = obj.notes:addEventListener("onResize",
        function (_)
            fullResize()
        end, obj);

    obj._e_event1 = obj.anotacoes1:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event2 = obj.anotacoes1:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event3 = obj.anotacoes1:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event4 = obj.anotacoes1:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event5 = obj.anotacoes2:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event6 = obj.anotacoes2:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event7 = obj.anotacoes2:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event8 = obj.anotacoes2:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event9 = obj.anotacoes3:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event10 = obj.anotacoes3:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event11 = obj.anotacoes3:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event12 = obj.anotacoes3:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event13 = obj.anotacoes4:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event14 = obj.anotacoes4:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event15 = obj.anotacoes4:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event16 = obj.anotacoes4:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event17 = obj.anotacoes5:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event18 = obj.anotacoes5:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event19 = obj.anotacoes5:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event20 = obj.anotacoes5:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event21 = obj.anotacoes6:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event22 = obj.anotacoes6:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event23 = obj.anotacoes6:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event24 = obj.anotacoes6:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event25 = obj.anotacoes7:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event26 = obj.anotacoes7:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event27 = obj.anotacoes7:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event28 = obj.anotacoes7:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event29 = obj.anotacoes8:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event30 = obj.anotacoes8:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event31 = obj.anotacoes8:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event32 = obj.anotacoes8:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    obj._e_event33 = obj.anotacoes9:addEventListener("onChange",
        function (_)
            fullResize()
        end, obj);

    obj._e_event34 = obj.anotacoes9:addEventListener("onEnter",
        function (_)
            fullResize()
        end, obj);

    obj._e_event35 = obj.anotacoes9:addEventListener("onExit",
        function (_)
            fullResize()
        end, obj);

    obj._e_event36 = obj.anotacoes9:addEventListener("onMouseMove",
        function (_, event)
            fullResize()
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
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

        if self.anotacoes5Part ~= nil then self.anotacoes5Part:destroy(); self.anotacoes5Part = nil; end;
        if self.anotacoes6 ~= nil then self.anotacoes6:destroy(); self.anotacoes6 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.anotacoes2 ~= nil then self.anotacoes2:destroy(); self.anotacoes2 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.anotacoes5 ~= nil then self.anotacoes5:destroy(); self.anotacoes5 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.anotacoes3 ~= nil then self.anotacoes3:destroy(); self.anotacoes3 = nil; end;
        if self.anotacoes9 ~= nil then self.anotacoes9:destroy(); self.anotacoes9 = nil; end;
        if self.anotacoes4 ~= nil then self.anotacoes4:destroy(); self.anotacoes4 = nil; end;
        if self.anotacoes6Part ~= nil then self.anotacoes6Part:destroy(); self.anotacoes6Part = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.anotacoes8Part ~= nil then self.anotacoes8Part:destroy(); self.anotacoes8Part = nil; end;
        if self.anotacoes4Part ~= nil then self.anotacoes4Part:destroy(); self.anotacoes4Part = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.anotacoes1Part ~= nil then self.anotacoes1Part:destroy(); self.anotacoes1Part = nil; end;
        if self.anotacoes7 ~= nil then self.anotacoes7:destroy(); self.anotacoes7 = nil; end;
        if self.notes ~= nil then self.notes:destroy(); self.notes = nil; end;
        if self.anotacoes9Part ~= nil then self.anotacoes9Part:destroy(); self.anotacoes9Part = nil; end;
        if self.anotacoes8 ~= nil then self.anotacoes8:destroy(); self.anotacoes8 = nil; end;
        if self.anotacoes7Part ~= nil then self.anotacoes7Part:destroy(); self.anotacoes7Part = nil; end;
        if self.anotacoes1 ~= nil then self.anotacoes1:destroy(); self.anotacoes1 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.anotacoes3Part ~= nil then self.anotacoes3Part:destroy(); self.anotacoes3Part = nil; end;
        if self.anotacoes2Part ~= nil then self.anotacoes2Part:destroy(); self.anotacoes2Part = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmACN5()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmACN5();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmACN5 = {
    newEditor = newfrmACN5, 
    new = newfrmACN5, 
    name = "frmACN5", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmACN5 = _frmACN5;
Firecast.registrarForm(_frmACN5);

return _frmACN5;
