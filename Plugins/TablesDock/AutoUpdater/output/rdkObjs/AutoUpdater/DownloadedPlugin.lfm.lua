require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDownloadedPlugin()
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
    obj:setName("frmDownloadedPlugin");
    obj:setHeight(50);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.pluginName = GUI.fromHandle(_obj_newObject("label"));
    obj.pluginName:setParent(obj.rectangle1);
    obj.pluginName:setAlign("left");
    obj.pluginName:setField("name");
    obj.pluginName:setHorzTextAlign("center");
    obj.pluginName:setTextTrimming("none");
    obj.pluginName:setWordWrap(true);
    obj.pluginName:setName("pluginName");
    obj.pluginName:setHitTest(true);

    obj.moduleId = GUI.fromHandle(_obj_newObject("label"));
    obj.moduleId:setParent(obj.rectangle1);
    obj.moduleId:setAlign("left");
    obj.moduleId:setField("moduleId");
    obj.moduleId:setHorzTextAlign("center");
    obj.moduleId:setTextTrimming("none");
    obj.moduleId:setWordWrap(true);
    obj.moduleId:setName("moduleId");
    obj.moduleId:setHitTest(true);

    obj.author = GUI.fromHandle(_obj_newObject("label"));
    obj.author:setParent(obj.rectangle1);
    obj.author:setAlign("left");
    obj.author:setField("author");
    obj.author:setHorzTextAlign("center");
    obj.author:setTextTrimming("none");
    obj.author:setWordWrap(true);
    obj.author:setName("author");
    obj.author:setHitTest(true);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setField("version");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(true);
    obj.label1:setName("label1");

    obj.downloadButton = GUI.fromHandle(_obj_newObject("button"));
    obj.downloadButton:setParent(obj.rectangle1);
    obj.downloadButton:setAlign("right");
    obj.downloadButton:setWidth(25);
    obj.downloadButton:setName("downloadButton");
    obj.downloadButton:setVisible(false);
    obj.downloadButton:setMargins({top = 12.5, bottom = 12.5, right = 5});

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.downloadButton);
    obj.image1:setAlign("client");
    obj.image1:setShowStyle("proportional");
    obj.image1:setSRC("/AutoUpdater/images/download.png");
    obj.image1:setName("image1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'url'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'description'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'contact'});
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.downloadButton:addEventListener("onClick",
        function (_)
            local install = true;
            				if sheet.stream ~= nil then
            					install = rrpg.plugins.installPlugin(sheet.stream, true);
            				end;
            				if install == false or sheet.stream == nil then
            					gui.openInBrowser(sheet.url);
            				end;
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.url==nil or sheet.url=="" then
            				self.downloadButton.visible = false;
            			else
            				self.downloadButton.visible = true;
            			end;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			self.pluginName.hint = sheet.description;
            			self.moduleId.hint = sheet.description;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			self.author.hint = sheet.contact;
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.moduleId ~= nil then self.moduleId:destroy(); self.moduleId = nil; end;
        if self.pluginName ~= nil then self.pluginName:destroy(); self.pluginName = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.downloadButton ~= nil then self.downloadButton:destroy(); self.downloadButton = nil; end;
        if self.author ~= nil then self.author:destroy(); self.author = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDownloadedPlugin()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDownloadedPlugin();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDownloadedPlugin = {
    newEditor = newfrmDownloadedPlugin, 
    new = newfrmDownloadedPlugin, 
    name = "frmDownloadedPlugin", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDownloadedPlugin = _frmDownloadedPlugin;
Firecast.registrarForm(_frmDownloadedPlugin);

return _frmDownloadedPlugin;
