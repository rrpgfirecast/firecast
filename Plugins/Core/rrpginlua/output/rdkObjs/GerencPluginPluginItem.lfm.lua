require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmGerencPluginItem()
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
    obj:setName("frmGerencPluginItem");
    obj:setTitle("Gerenciar Plugins");
    obj:setHeight(30);


		local function desinstalarPlugin()
			if sheet == nil then
				return;
			end;
			
			local moduleId = sheet.moduleId;
			
			Dialogs.confirmYesNo(lang("plugins.mgr.uninstallConfirmation"),
				function (confirmado)
					if confirmado then
						local r, msg = Firecast.Plugins.uninstallPlugin(moduleId);
						
						if not r then
							showMessage(lang("plugins.mgr.uninstallFailure") .. ": " .. msg);
						end;
					end;
				end);
		end;
		


    obj.flwPlug = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flwPlug:setParent(obj);
    obj.flwPlug:setName("flwPlug");
    obj.flwPlug:setAlign("top");
    obj.flwPlug:setMaxControlsPerLine(2);
    obj.flwPlug:setAutoHeight(true);

    obj.labNome = GUI.fromHandle(_obj_newObject("label"));
    obj.labNome:setParent(obj.flwPlug);
    obj.labNome:setName("labNome");
    obj.labNome:setField("name");
    obj.labNome:setWordWrap(false);
    obj.labNome:setFontColor("white");
    obj.labNome:setMargins({right=3});
    obj.labNome:setAutoSize(true);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flwPlug);
    obj.label1:setField("version");
    obj.label1:setFontColor("gray");
    obj.label1:setFontSize(12);
    obj.label1:setName("label1");
    obj.label1:setWordWrap(false);
    obj.label1:setAutoSize(true);

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flwPlug);
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.fptDescricao = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.fptDescricao:setParent(obj.flwPlug);
    obj.fptDescricao:setName("fptDescricao");
    obj.fptDescricao:setMinWidth(100);
    obj.fptDescricao:setMaxWidth(800);
    obj.fptDescricao:setMargins({left=10, right=10});

    obj.labDescricao = GUI.fromHandle(_obj_newObject("label"));
    obj.labDescricao:setParent(obj.fptDescricao);
    obj.labDescricao:setName("labDescricao");
    obj.labDescricao:setField("description");
    obj.labDescricao:setFontColor("silver");
    obj.labDescricao:setFontSize(12);
    obj.labDescricao:setAlign("top");
    obj.labDescricao:setWordWrap(true);
    obj.labDescricao:setAutoSize(true);

    obj.flowLineBreak2 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak2:setParent(obj.flwPlug);
    obj.flowLineBreak2:setName("flowLineBreak2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flwPlug);
    obj.label2:setText(lang("plugins.mgr.authorLabel"));
    obj.label2:setFontColor("silver");
    obj.label2:setFontSize(12);
    obj.label2:setMargins({left=10});
    obj.label2:setName("label2");
    obj.label2:setWordWrap(false);
    obj.label2:setAutoSize(true);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flwPlug);
    obj.label3:setField("author");
    obj.label3:setFontColor("gray");
    obj.label3:setFontSize(11);
    obj.label3:setName("label3");
    obj.label3:setWordWrap(false);
    obj.label3:setAutoSize(true);

    obj.flowLineBreak3 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak3:setParent(obj.flwPlug);
    obj.flowLineBreak3:setName("flowLineBreak3");

    obj.btnDesinstalar = GUI.fromHandle(_obj_newObject("button"));
    obj.btnDesinstalar:setParent(obj.flwPlug);
    obj.btnDesinstalar:setName("btnDesinstalar");
    obj.btnDesinstalar:setText(lang("plugins.mgr.uninstall"));
    obj.btnDesinstalar:setMargins({left=5, top=5});
    obj.btnDesinstalar:setWidth(110);
    obj.btnDesinstalar:setHeight(40);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("moduleId");
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.flwPlug:addEventListener("onResize",
        function (_)
            self.height = self.flwPlug.height + 15;
        end, obj);

    obj._e_event1 = obj.labDescricao:addEventListener("onResize",
        function (_)
            self.fptDescricao.height = self.labDescricao.height;
        end, obj);

    obj._e_event2 = obj.btnDesinstalar:addEventListener("onClick",
        function (_)
            desinstalarPlugin()
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            self.btnDesinstalar.visible = sheet.moduleId ~= 'RRPG.FIRECAST.FMXModule';
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

        if self.btnDesinstalar ~= nil then self.btnDesinstalar:destroy(); self.btnDesinstalar = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.fptDescricao ~= nil then self.fptDescricao:destroy(); self.fptDescricao = nil; end;
        if self.flwPlug ~= nil then self.flwPlug:destroy(); self.flwPlug = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.labDescricao ~= nil then self.labDescricao:destroy(); self.labDescricao = nil; end;
        if self.flowLineBreak2 ~= nil then self.flowLineBreak2:destroy(); self.flowLineBreak2 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.labNome ~= nil then self.labNome:destroy(); self.labNome = nil; end;
        if self.flowLineBreak3 ~= nil then self.flowLineBreak3:destroy(); self.flowLineBreak3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerencPluginItem = {
    newEditor = newfrmGerencPluginItem, 
    new = newfrmGerencPluginItem, 
    name = "frmGerencPluginItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "Gerenciar Plugins", 
    description=""};

frmGerencPluginItem = _frmGerencPluginItem;
Firecast.registrarForm(_frmGerencPluginItem);

return _frmGerencPluginItem;
