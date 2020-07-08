require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSynchronizeGrid()
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
    obj:setName("frmSynchronizeGrid");
    obj:setWidth(310);
    obj:setHeight(90);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);

    obj.labTip = GUI.fromHandle(_obj_newObject("label"));
    obj.labTip:setParent(obj);
    obj.labTip:setName("labTip");
    obj.labTip:setLeft(20);
    obj.labTip:setTop(20);
    obj.labTip:setWidth(270);
    obj.labTip:setAutoSize(true);
    obj.labTip:setWordWrap(true);
    obj.labTip:setFontColor("white");

	
			self.labTip.text = lang('scene.Synchronize.tip');
			


    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.labTip ~= nil then self.labTip:destroy(); self.labTip = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSynchronizeGrid()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSynchronizeGrid();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSynchronizeGrid = {
    newEditor = newfrmSynchronizeGrid, 
    new = newfrmSynchronizeGrid, 
    name = "frmSynchronizeGrid", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmSynchronizeGrid = _frmSynchronizeGrid;
Firecast.registrarForm(_frmSynchronizeGrid);

return _frmSynchronizeGrid;
