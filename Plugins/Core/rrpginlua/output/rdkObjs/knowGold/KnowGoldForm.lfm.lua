require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmKnowGold()
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
    obj:setName("frmKnowGold");
    obj:setHeight(300);
    obj:setWidth(300);
    obj:setTitle("RRPG Gold");


		local KG = require("/knowGold/knowGoldPanel.dlua");
		
		self.panKG = KG.newPanel();
		self.panKG.align = "client";
		self.panKG.parent = self;		
		
		function self:setInfo(info)
			self.panKG:setInfo(info);
		end;
	


    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmKnowGold()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmKnowGold();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmKnowGold = {
    newEditor = newfrmKnowGold, 
    new = newfrmKnowGold, 
    name = "frmKnowGold", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "RRPG Gold", 
    description=""};

frmKnowGold = _frmKnowGold;
Firecast.registrarForm(_frmKnowGold);

return _frmKnowGold;
