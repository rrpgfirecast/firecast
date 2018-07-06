require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmInstalled()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmInstalled");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.installedPluginsList = gui.fromHandle(_obj_newObject("recordList"));
    obj.installedPluginsList:setParent(obj.scrollBox1);
    obj.installedPluginsList:setAlign("client");
    obj.installedPluginsList:setField("installedPluginsList");
    obj.installedPluginsList:setName("installedPluginsList");
    obj.installedPluginsList:setTemplateForm("frmInstalledPlugin");

    obj._e_event0 = obj.installedPluginsList:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then 
            					return utils.compareStringPtBr(nodeA.name, nodeB.name);
            				elseif nodeA.enabled then
            					return 1;
            				elseif nodeB.enabled then
            					return -1;
            				end;
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

        if self.installedPluginsList ~= nil then self.installedPluginsList:destroy(); self.installedPluginsList = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmInstalled = {
    newEditor = newfrmInstalled, 
    new = newfrmInstalled, 
    name = "frmInstalled", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInstalled = _frmInstalled;
rrpg.registrarForm(_frmInstalled);

return _frmInstalled;
