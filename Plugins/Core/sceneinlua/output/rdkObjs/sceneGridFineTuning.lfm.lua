require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmWorldIncrease()
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
    obj:setName("frmWorldIncrease");
    obj:setWidth(300);
    obj:setHeight(200);
    obj:setOpacity(0.9);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);


		
		--[[funções do ajuste fino do grid, estão nesse arquivo por-
		    conta das variaveis ja estarem declaradas e os calculos ja estarem prontos aqui ]]--
		
		local function increaseWorldControlHeight()
			self.sceneAlvo.worldHeight = self.sceneAlvo.worldHeight + 0.1;
		end;
				
		local function decreaseWorldControlHeight()
			self.sceneAlvo.worldHeight = self.sceneAlvo.worldHeight - 0.1;
		end;
		
		local function increaseWorldControlWidth()
			self.sceneAlvo.worldWidth = self.sceneAlvo.worldWidth + 0.1;
		end;
		
		local function decreaseWorldControlWidth()
			self.sceneAlvo.worldWidth = self.sceneAlvo.worldWidth - 0.1;
		end;
		
		local function moveOffsetLeft()
			self.sceneAlvo.grid.offsetX = self.sceneAlvo.grid.offsetX - 0.025;
		end;
		
		local function moveOffsetRight()
			self.sceneAlvo.grid.offsetX = self.sceneAlvo.grid.offsetX + 0.025;
		end;
		
		local function moveOffsetUp()
			self.sceneAlvo.grid.offsetY = self.sceneAlvo.grid.offsetY + 0.025;
		end;
		
		local function moveOffsetDown()
			self.sceneAlvo.grid.offsetY = self.sceneAlvo.grid.offsetY -0.025;
		end;
		
	


    obj.labTipDimension = GUI.fromHandle(_obj_newObject("label"));
    obj.labTipDimension:setParent(obj);
    obj.labTipDimension:setName("labTipDimension");
    obj.labTipDimension:setTop(20);
    obj.labTipDimension:setLeft(20);
    obj.labTipDimension:setWidth(270);
    obj.labTipDimension:setAutoSize(true);
    obj.labTipDimension:setFontColor("white");

    obj.labGridWidth = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridWidth:setParent(obj);
    obj.labGridWidth:setName("labGridWidth");
    obj.labGridWidth:setTop(85);
    obj.labGridWidth:setLeft(20);
    obj.labGridWidth:setWidth(75);
    obj.labGridWidth:setAutoSize(true);
    obj.labGridWidth:setFontColor("white");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setText("+");
    obj.button1:setWidth(30);
    obj.button1:setLeft(110);
    obj.button1:setTop(83);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setText("-");
    obj.button2:setWidth(30);
    obj.button2:setLeft(70);
    obj.button2:setTop(83);
    obj.button2:setName("button2");

    obj.labGridHeight = GUI.fromHandle(_obj_newObject("label"));
    obj.labGridHeight:setParent(obj);
    obj.labGridHeight:setName("labGridHeight");
    obj.labGridHeight:setTop(85);
    obj.labGridHeight:setLeft(160);
    obj.labGridHeight:setWidth(75);
    obj.labGridHeight:setAutoSize(true);
    obj.labGridHeight:setFontColor("white");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setText("+");
    obj.button3:setWidth(30);
    obj.button3:setLeft(250);
    obj.button3:setTop(83);
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj);
    obj.button4:setText("-");
    obj.button4:setWidth(30);
    obj.button4:setLeft(210);
    obj.button4:setTop(83);
    obj.button4:setName("button4");

    obj.laboffset = GUI.fromHandle(_obj_newObject("label"));
    obj.laboffset:setParent(obj);
    obj.laboffset:setName("laboffset");
    obj.laboffset:setAutoSize(true);
    obj.laboffset:setWordWrap(true);
    obj.laboffset:setWidth(200);
    obj.laboffset:setFontColor("white");
    obj.laboffset:setFontSize(17);
    obj.laboffset:setLeft(68);
    obj.laboffset:setTop(120);

    obj.button5 = GUI.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj);
    obj.button5:setText("⮜");
    obj.button5:setWidth(30);
    obj.button5:setLeft(70);
    obj.button5:setTop(150);
    obj.button5:setName("button5");

    obj.button6 = GUI.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj);
    obj.button6:setText("⮞");
    obj.button6:setWidth(30);
    obj.button6:setLeft(110);
    obj.button6:setTop(150);
    obj.button6:setName("button6");

    obj.button7 = GUI.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj);
    obj.button7:setText("⮝");
    obj.button7:setWidth(30);
    obj.button7:setLeft(150);
    obj.button7:setTop(150);
    obj.button7:setName("button7");

    obj.button8 = GUI.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj);
    obj.button8:setText("⮟");
    obj.button8:setWidth(30);
    obj.button8:setLeft(190);
    obj.button8:setTop(150);
    obj.button8:setName("button8");

	
		self.labTipDimension.text = lang('scene.gridFineTuning.dimension');
		self.labGridHeight.text = lang('scene.gridFineTuning.height');
		self.labGridWidth.text = lang('scene.gridFineTuning.width');
		self.laboffset.text = lang('scene.gridFineTuning.offset');
		


    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            increaseWorldControlWidth();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            decreaseWorldControlWidth();
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            increaseWorldControlHeight();
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            decreaseWorldControlHeight();
        end, obj);

    obj._e_event4 = obj.button5:addEventListener("onClick",
        function (_)
            moveOffsetLeft();
        end, obj);

    obj._e_event5 = obj.button6:addEventListener("onClick",
        function (_)
            moveOffsetRight();
        end, obj);

    obj._e_event6 = obj.button7:addEventListener("onClick",
        function (_)
            moveOffsetDown();
        end, obj);

    obj._e_event7 = obj.button8:addEventListener("onClick",
        function (_)
            moveOffsetUp();
        end, obj);

    function obj:_releaseEvents()
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.labGridHeight ~= nil then self.labGridHeight:destroy(); self.labGridHeight = nil; end;
        if self.labGridWidth ~= nil then self.labGridWidth:destroy(); self.labGridWidth = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.labTipDimension ~= nil then self.labTipDimension:destroy(); self.labTipDimension = nil; end;
        if self.laboffset ~= nil then self.laboffset:destroy(); self.laboffset = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmWorldIncrease()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmWorldIncrease();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmWorldIncrease = {
    newEditor = newfrmWorldIncrease, 
    new = newfrmWorldIncrease, 
    name = "frmWorldIncrease", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmWorldIncrease = _frmWorldIncrease;
Firecast.registrarForm(_frmWorldIncrease);

return _frmWorldIncrease;
