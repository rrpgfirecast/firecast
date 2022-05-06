require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmInstalled()
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
    obj:setName("frmInstalled");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.installedPluginsList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.installedPluginsList:setParent(obj.scrollBox1);
    obj.installedPluginsList:setAlign("client");
    obj.installedPluginsList:setField("installedPluginsList");
    obj.installedPluginsList:setName("installedPluginsList");
    obj.installedPluginsList:setTemplateForm("frmInstalledPlugin");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("bottom");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(350);
    obj.label1:setField("selectedDataType");
    obj.label1:setName("label1");

    obj.progressBar1 = GUI.fromHandle(_obj_newObject("progressBar"));
    obj.progressBar1:setParent(obj.layout1);
    obj.progressBar1:setAlign("client");
    obj.progressBar1:setField("downloadProgress");
    obj.progressBar1:setMargins({left=5,right=5,top=5,bottom=5});
    obj.progressBar1:setMax(1.0);
    obj.progressBar1:setName("progressBar1");

    obj._e_event0 = obj.installedPluginsList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then 
            					return Utils.compareStringPtBr(nodeA.name, nodeB.name);
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
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmInstalled()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmInstalled();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
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
Firecast.registrarForm(_frmInstalled);

return _frmInstalled;
