require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmEquipment()
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
    obj:setName("frmEquipment");
    obj:setHeight(100);
    obj:setWidth(100);
    obj:setMargins({top=5,bottom=5,left=5,right=5});

 
		



		local function showPopup()
			local pop = self:findControlByName("popEquipment");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("right", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup para exibir");
			end;				
		end;
	



	


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(100);
    obj.rectangle1:setHeight(100);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("client");
    obj.label1:setText("Item");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.label1);
    obj.image1:setAlign("client");
    obj.image1:setField("icon");
    obj.image1:setHitTest(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setMargins({left=2, right=2, top=2, bottom=2});
    obj.image1:setName("image1");

    obj._e_event0 = obj.image1:addEventListener("onClick",
        function (_)
            showPopup();
        end, obj);

    obj._e_event1 = obj.image1:addEventListener("onStartDrag",
        function (_, drag, x, y)
            drag:addData("imageURL", sheet.icon);
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

        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmEquipment()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmEquipment();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmEquipment = {
    newEditor = newfrmEquipment, 
    new = newfrmEquipment, 
    name = "frmEquipment", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmEquipment = _frmEquipment;
Firecast.registrarForm(_frmEquipment);

return _frmEquipment;
