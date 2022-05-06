require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAvailable()
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
    obj:setName("frmAvailable");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.scrollBox1);
    obj.edit1:setAlign("top");
    obj.edit1:setHeight(25);
    obj.edit1:setField("filter");
    obj.edit1:setTextPrompt("Filtro");
    obj.edit1:setName("edit1");

    obj.downloadedPluginsList = GUI.fromHandle(_obj_newObject("recordList"));
    obj.downloadedPluginsList:setParent(obj.scrollBox1);
    obj.downloadedPluginsList:setAlign("client");
    obj.downloadedPluginsList:setField("downloadedPluginsList");
    obj.downloadedPluginsList:setName("downloadedPluginsList");
    obj.downloadedPluginsList:setTemplateForm("frmDownloadedPlugin");

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

    obj._e_event0 = obj.edit1:addEventListener("onChange",
        function (_)
            --write(self.scope.node);
            				if self.scope.node == nil then return end;
            
            				local nodes = NDB.getChildNodes(self.scope.node.downloadedPluginsList);
            				--local mesa = Firecast.getMesaDe(self);
            				--local login = mesa.meuJogador.login;
            				local filter = string.lower(Utils.removerAcentos(self.scope.node.filter));
            
            				-- Deixe todos visiveis 
            				if filter == nil or filter == "" then
            					for i = 1, #nodes, 1 do
            						nodes[i].priority = 0;
            						--NDB.setPermission(nodes[i], "user", login, "read", "allow");
            					end;
            				-- Deixe apenas os matchs visiveis
            				else
            					for i = 1, #nodes, 1 do
            						local name = string.lower(Utils.removerAcentos(nodes[i].name));
            						local moduleId = string.lower(Utils.removerAcentos(nodes[i].moduleId));
            						local author = string.lower(Utils.removerAcentos(nodes[i].author));
            
            						if string.find(name, filter) or string.find(moduleId, filter) or string.find(author, filter) then
            							nodes[i].priority = 1;
            							--NDB.setPermission(nodes[i], "user", login, "read", "allow");
            						else
            							nodes[i].priority = -1;
            							--NDB.setPermission(nodes[i], "user", login, "read", "deny");
            							--showMessage(NDB.getPermission(nodes[i], "user", login, "read"));
            						end;
            					end;
            				end;
        end, obj);

    obj._e_event1 = obj.downloadedPluginsList:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if nodeA.enabled and nodeB.enabled then
            					if (tonumber(nodeA.priority) or 0) > (tonumber(nodeB.priority) or 0) then
            						return -1;
            					elseif (tonumber(nodeB.priority) or 0) > (tonumber(nodeA.priority) or 0) then
            						return 1;
            					else
            						return Utils.compareStringPtBr(nodeA.name, nodeB.name);
            					end;
            				elseif nodeA.enabled then
            					return 1;
            				elseif nodeB.enabled then
            					return -1;
            				end;
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

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.progressBar1 ~= nil then self.progressBar1:destroy(); self.progressBar1 = nil; end;
        if self.downloadedPluginsList ~= nil then self.downloadedPluginsList:destroy(); self.downloadedPluginsList = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAvailable()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAvailable();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAvailable = {
    newEditor = newfrmAvailable, 
    new = newfrmAvailable, 
    name = "frmAvailable", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAvailable = _frmAvailable;
Firecast.registrarForm(_frmAvailable);

return _frmAvailable;
