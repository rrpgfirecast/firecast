require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmInstalledPlugin()
    __o_rrpgObjs.beginObjectsLoading();

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
    obj:setName("frmInstalledPlugin");
    obj:setHeight(50);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setField("name");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setTextTrimming("none");
    obj.label1:setWordWrap(true);
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setAlign("left");
    obj.label2:setField("moduleId");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setTextTrimming("none");
    obj.label2:setWordWrap(true);
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setAlign("left");
    obj.label3:setField("author");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setTextTrimming("none");
    obj.label3:setWordWrap(true);
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setAlign("left");
    obj.label4:setField("version");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setTextTrimming("none");
    obj.label4:setWordWrap(true);
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setAlign("left");
    obj.label5:setField("versionAvailable");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setTextTrimming("none");
    obj.label5:setWordWrap(true);
    obj.label5:setName("label5");

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

    obj.removeButton = GUI.fromHandle(_obj_newObject("button"));
    obj.removeButton:setParent(obj.rectangle1);
    obj.removeButton:setAlign("right");
    obj.removeButton:setWidth(25);
    obj.removeButton:setName("removeButton");
    obj.removeButton:setMargins({top = 12.5, bottom = 12.5, right = 5});

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.removeButton);
    obj.image2:setAlign("client");
    obj.image2:setShowStyle("proportional");
    obj.image2:setSRC("/AutoUpdater/images/delete.png");
    obj.image2:setName("image2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'url'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'enabled'});
    obj.dataLink2:setName("dataLink2");

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

    obj._e_event1 = obj.removeButton:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Deseja desinstalar esse plugin?",
            			        function (confirmado)
            			            if confirmado then
            			                rrpg.plugins.uninstallPlugin(sheet.moduleId);
            			            end;
            			        end);
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.url==nil or sheet.url=="" then
            				self.downloadButton.visible = false;
            			else
            				self.downloadButton.visible = true;
            			end;
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.enabled then
            				self.removeButton.visible = true;
            			else
            				self.removeButton.visible = false;
            			end;
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

        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.removeButton ~= nil then self.removeButton:destroy(); self.removeButton = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.downloadButton ~= nil then self.downloadButton:destroy(); self.downloadButton = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmInstalledPlugin = {
    newEditor = newfrmInstalledPlugin, 
    new = newfrmInstalledPlugin, 
    name = "frmInstalledPlugin", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInstalledPlugin = _frmInstalledPlugin;
Firecast.registrarForm(_frmInstalledPlugin);

return _frmInstalledPlugin;
