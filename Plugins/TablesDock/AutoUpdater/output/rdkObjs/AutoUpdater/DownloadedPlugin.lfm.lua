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


        local function tryTranslate(text)
            local trans = Locale.tryLang(text);
            if trans == nil then trans = text end;
            return trans;
        end

        local function downloadID(url)
            local install = true;
            local node = NDB.getParent(NDB.getParent(sheet));
            Internet.download(url,
                function(stream, contentType)
                	node.selectedDataType = tryTranslate("download.status.installing") .. " " .. (sheet.moduleId or "");
                	node.downloadProgress = 1;
                    if stream ~= nil then
                        install = Firecast.Plugins.installPlugin(stream, true);
                    end;

                    if install == false or stream == nil then
                    	node.selectedDataType = tryTranslate("download.status.browser") .. " " .. (sheet.moduleId or "");
                        GUI.openInBrowser(url);
                    else
                    	node.selectedDataType = tryTranslate("download.status.success") .. " " .. (sheet.moduleId or "");
                    	local rcl = self:findControlByName("installedPluginsList");
                    	if rcl== nil then return end;

                        local item = rcl:append()
                        if item == nil then return end

                        NDB.copy(item, sheet)

                        rcl:sort()

                        NDB.deleteNode(sheet);
                    end;
                end,       
                function (errorMsg)
                	node.selectedDataType = tryTranslate("download.status.error") .. " " .. (errorMsg or "");
                	node.downloadProgress = 0;
                end,       
                function (downloaded, total)
                    -- esta função será chamada constantemente.
                    -- dividir "downloaded" por "total" lhe dará uma porcentagem do download.
                    node.selectedDataType = tryTranslate("download.status.downloading") .. " " .. (sheet.moduleId or "");
                    node.downloadProgress = downloaded/total;
                end,
                "checkForModification");
        end
	


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
    obj.downloadButton:setHint("@@hint.install");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.downloadButton);
    obj.image1:setAlign("client");
    obj.image1:setShowStyle("proportional");
    obj.image1:setSRC("/AutoUpdater/images/download.png");
    obj.image1:setName("image1");

    obj.openButton = GUI.fromHandle(_obj_newObject("button"));
    obj.openButton:setParent(obj.rectangle1);
    obj.openButton:setAlign("right");
    obj.openButton:setWidth(25);
    obj.openButton:setName("openButton");
    obj.openButton:setVisible(false);
    obj.openButton:setMargins({top = 12.5, bottom = 12.5, right = 5});
    obj.openButton:setHint("@@hint.github");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.openButton);
    obj.image2:setAlign("client");
    obj.image2:setShowStyle("proportional");
    obj.image2:setSRC("/AutoUpdater/images/www.png");
    obj.image2:setName("image2");

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

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'priority'});
    obj.dataLink4:setName("dataLink4");

    obj._e_event0 = obj.downloadButton:addEventListener("onClick",
        function (_)
            downloadID(sheet.url);
        end, obj);

    obj._e_event1 = obj.openButton:addEventListener("onClick",
        function (_)
            local url = sheet.url;
            				local pos = string.find(url, "/output");
            				if pos == nil then return end;
            				url =  string.sub(url, 1, pos);
            				GUI.openInBrowser(url);
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.url==nil or sheet.url=="" then
            				self.downloadButton.visible = false;
            				self.openButton.visible = false;
            			else
            				self.downloadButton.visible = true;
            				self.openButton.visible = true;
            			end;
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			self.pluginName.hint = sheet.description;
            			self.moduleId.hint = sheet.description;
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			self.author.hint = sheet.contact;
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local rcl = self:findControlByName("downloadedPluginsList");
            			if rcl ~= nil then rcl:sort() end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.author ~= nil then self.author:destroy(); self.author = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.moduleId ~= nil then self.moduleId:destroy(); self.moduleId = nil; end;
        if self.pluginName ~= nil then self.pluginName:destroy(); self.pluginName = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.openButton ~= nil then self.openButton:destroy(); self.openButton = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.downloadButton ~= nil then self.downloadButton:destroy(); self.downloadButton = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
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
