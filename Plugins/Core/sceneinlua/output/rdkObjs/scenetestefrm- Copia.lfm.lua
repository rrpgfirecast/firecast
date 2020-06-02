require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTeste()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("frmTeste");
    obj:setWidth(300);
    obj:setHeight(100);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj);
    obj.flowPart1:setName("flowPart1");
    obj.flowPart1:setHeight(100);
    obj.flowPart1:setWidth(300);
    obj.flowPart1:setMinWidth(50);
    obj.flowPart1:setMaxWidth(5000);
    obj.flowPart1:setMargins({left=2, right=2, top=2, bottom=2});

    obj.labdesenhequadrados = GUI.fromHandle(_obj_newObject("label"));
    obj.labdesenhequadrados:setParent(obj.flowPart1);
    obj.labdesenhequadrados:setName("labdesenhequadrados");
    obj.labdesenhequadrados:setAutoSize(true);
    obj.labdesenhequadrados:setFontColor("red");
    obj.labdesenhequadrados:setAlign("top");
    obj.labdesenhequadrados:setWidth(280);
    obj.labdesenhequadrados:setWordWrap(true);
    obj.labdesenhequadrados:setHorzTextAlign("center");
    obj.labdesenhequadrados:setVertTextAlign("leading");
    obj.labdesenhequadrados:setMargins({right=5});

    obj.labalturamundo = GUI.fromHandle(_obj_newObject("label"));
    obj.labalturamundo:setParent(obj.flowPart1);
    obj.labalturamundo:setName("labalturamundo");
    obj.labalturamundo:setAutoSize(true);
    obj.labalturamundo:setFontColor("white");
    obj.labalturamundo:setAlign("left");
    obj.labalturamundo:setWordWrap(true);
    obj.labalturamundo:setHorzTextAlign("leading");
    obj.labalturamundo:setVertTextAlign("center");
    obj.labalturamundo:setMargins({left=10, right=5});
    obj.labalturamundo:setFontSize(15);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowPart1);
    obj.button1:setText("+");
    obj.button1:setWidth(30);
    obj.button1:setLeft(100);
    obj.button1:setTop(58);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.flowPart1);
    obj.button2:setText("-");
    obj.button2:setWidth(30);
    obj.button2:setLeft(60);
    obj.button2:setTop(58);
    obj.button2:setName("button2");

    obj.lablarguramundo = GUI.fromHandle(_obj_newObject("label"));
    obj.lablarguramundo:setParent(obj.flowPart1);
    obj.lablarguramundo:setName("lablarguramundo");
    obj.lablarguramundo:setAutoSize(true);
    obj.lablarguramundo:setFontColor("white");
    obj.lablarguramundo:setAlign("left");
    obj.lablarguramundo:setWordWrap(true);
    obj.lablarguramundo:setHorzTextAlign("leading");
    obj.lablarguramundo:setVertTextAlign("center");
    obj.lablarguramundo:setMargins({left=10, right=5});
    obj.lablarguramundo:setFontSize(15);

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.flowPart1);
    obj.button3:setText("+");
    obj.button3:setWidth(30);
    obj.button3:setLeft(250);
    obj.button3:setTop(58);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.flowPart1);
    obj.button4:setText("-");
    obj.button4:setWidth(30);
    obj.button4:setLeft(210);
    obj.button4:setTop(58);
    obj.button4:setName("button4");

	
		
		self.labdesenhequadrados.text = lang('scene.gridFineTuning.dica');
		self.lablarguramundo.text = lang('scene.gridFineTuning.largura');
		self.labalturamundo.text = lang('scene.gridFineTuning.altura');
		
		


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            worldControlIncreaseHeight();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            worldControlDecreaseHeight();
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            worldControlIncreaseWidth();
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            worldControlDecreaseWidth();
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.lablarguramundo ~= nil then self.lablarguramundo:destroy(); self.lablarguramundo = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.labalturamundo ~= nil then self.labalturamundo:destroy(); self.labalturamundo = nil; end;
        if self.labdesenhequadrados ~= nil then self.labdesenhequadrados:destroy(); self.labdesenhequadrados = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTeste()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTeste();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTeste = {
    newEditor = newfrmTeste, 
    new = newfrmTeste, 
    name = "frmTeste", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmTeste = _frmTeste;
Firecast.registrarForm(_frmTeste);

return _frmTeste;
