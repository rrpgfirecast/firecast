require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmKnowGold()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("popupForm"));
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

     __o_rrpgObjs.endObjectsLoading();

    return obj;
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
rrpg.registrarForm(_frmKnowGold);

return _frmKnowGold;
