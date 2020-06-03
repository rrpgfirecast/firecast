require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSquareShape()
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
    obj:setName("frmSquareShape");
    obj:setWidth(300);
    obj:setHeight(100);
    obj:setDrawContainer(true);
    obj:setResizable(true);
    obj:setPlacement("center");
    obj:setCancelable(false);

    obj.labdicamaisemenos = GUI.fromHandle(_obj_newObject("label"));
    obj.labdicamaisemenos:setParent(obj);
    obj.labdicamaisemenos:setName("labdicamaisemenos");
    obj.labdicamaisemenos:setLeft(10);
    obj.labdicamaisemenos:setTop(5);
    obj.labdicamaisemenos:setWidth(290);
    obj.labdicamaisemenos:setAutoSize(true);
    obj.labdicamaisemenos:setWordWrap(true);
    obj.labdicamaisemenos:setFontSize(20);
    obj.labdicamaisemenos:setFontColor("red");

	
			self.labdicamaisemenos.text = lang('scene.gridFineTuning.maisemenos');
			


    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.labdicamaisemenos ~= nil then self.labdicamaisemenos:destroy(); self.labdicamaisemenos = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSquareShape()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSquareShape();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSquareShape = {
    newEditor = newfrmSquareShape, 
    new = newfrmSquareShape, 
    name = "frmSquareShape", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "", 
    description=""};

frmSquareShape = _frmSquareShape;
Firecast.registrarForm(_frmSquareShape);

return _frmSquareShape;
