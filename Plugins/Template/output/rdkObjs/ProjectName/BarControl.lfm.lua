require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmBarControl()
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
    obj:setName("frmBarControl");
    obj:setAlign("client");


		



			local function addCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = mesa.meuJogador:getBarValue(1);
				current = current + (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(1, current);
			end;

			local function subtractCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = mesa.meuJogador:getBarValue(1);
				current = current - (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(1, current);
			end;

			local function setCurrent()
				local mesa = Firecast.getMesaDe(sheet); 
				local current = (tonumber(sheet.current) or 0);
				mesa.meuJogador:requestSetBarValue(1, current);
			end;

			local function addMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local current, max = mesa.meuJogador:getBarValue(1);
				max = max + (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;

			local function subtractMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local current, max = mesa.meuJogador:getBarValue(1);
				max = max - (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;

			local function setMax()
				local mesa = Firecast.getMesaDe(sheet); 
				local max = (tonumber(sheet.max) or 0);
				mesa.meuJogador:requestSetBarValue(1, nil, max);
			end;
		


	
	


    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(300);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setText("Atual");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(50);
    obj.edit1:setHeight(25);
    obj.edit1:setField("current");
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(150);
    obj.button1:setTop(0);
    obj.button1:setWidth(50);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setLeft(200);
    obj.button2:setTop(0);
    obj.button2:setWidth(50);
    obj.button2:setHeight(25);
    obj.button2:setText("-");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout1);
    obj.button3:setLeft(250);
    obj.button3:setTop(0);
    obj.button3:setWidth(50);
    obj.button3:setHeight(25);
    obj.button3:setText("=");
    obj.button3:setName("button3");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(100);
    obj.label2:setHeight(25);
    obj.label2:setText("Maximo");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(100);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("max");
    obj.edit2:setName("edit2");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout2);
    obj.button4:setLeft(150);
    obj.button4:setTop(0);
    obj.button4:setWidth(50);
    obj.button4:setHeight(25);
    obj.button4:setText("+");
    obj.button4:setName("button4");

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout2);
    obj.button5:setLeft(200);
    obj.button5:setTop(0);
    obj.button5:setWidth(50);
    obj.button5:setHeight(25);
    obj.button5:setText("-");
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout2);
    obj.button6:setLeft(250);
    obj.button6:setTop(0);
    obj.button6:setWidth(50);
    obj.button6:setHeight(25);
    obj.button6:setText("=");
    obj.button6:setName("button6");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            addCurrent()
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            subtractCurrent()
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            setCurrent()
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            addMax()
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            subtractMax()
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            setMax()
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

        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmBarControl()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmBarControl();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmBarControl = {
    newEditor = newfrmBarControl, 
    new = newfrmBarControl, 
    name = "frmBarControl", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmBarControl = _frmBarControl;
Firecast.registrarForm(_frmBarControl);

return _frmBarControl;
