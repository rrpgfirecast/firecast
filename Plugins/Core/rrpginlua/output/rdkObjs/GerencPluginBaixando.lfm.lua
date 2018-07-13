require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmPluginBaixando()
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
    obj:setName("frmPluginBaixando");
    obj:setTitle("Plugin Baixando");
    obj:setHeight(30);


		local function realmenteCancelarDownload(indicatorId)
			if sheet ~= nil then
				local internetDownloadId = sheet.internetDownloadId;
				
				if internetDownloadId ~= nil then
					Internet.stopDownload(internetDownloadId);
					sheet.internetDownloadId = nil;
				end;		
				
				NDB.deleteNode(sheet);
			end;
		end;
		
		local function cancelarDownload()
			if sheet == nil then
				return;
			end;
		
			local indicatorId = sheet.indicatorId;
		
			if sheet.errorMsg == nil then
				Dialogs.confirmYesNo(lang("plugins.mgr.cancelConfirmation"),
					function(confirmado)
						if confirmado then
							realmenteCancelarDownload(indicatorId);
						end;
					end);
			else
				realmenteCancelarDownload(indicatorId);
			end;
		end;
	


    obj.flwPlug = GUI.fromHandle(_obj_newObject("flowLayout"));
    obj.flwPlug:setParent(obj);
    obj.flwPlug:setName("flwPlug");
    obj.flwPlug:setAlign("top");
    obj.flwPlug:setMaxControlsPerLine(10);
    obj.flwPlug:setAutoHeight(true);

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj.flwPlug);
    obj.flowPart1:setMinWidth(100);
    obj.flowPart1:setMaxWidth(800);
    obj.flowPart1:setMargins({right=3});
    obj.flowPart1:setHeight(20);
    obj.flowPart1:setName("flowPart1");

    obj.labUrl = GUI.fromHandle(_obj_newObject("label"));
    obj.labUrl:setParent(obj.flowPart1);
    obj.labUrl:setName("labUrl");
    obj.labUrl:setField("fileName");
    obj.labUrl:setWordWrap(false);
    obj.labUrl:setFontColor("white");
    obj.labUrl:setAlign("client");

    obj.flowLineBreak1 = GUI.fromHandle(_obj_newObject("flowLineBreak"));
    obj.flowLineBreak1:setParent(obj.flwPlug);
    obj.flowLineBreak1:setHorzAlign("center");
    obj.flowLineBreak1:setName("flowLineBreak1");

    obj.flowPart2 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart2:setParent(obj.flwPlug);
    obj.flowPart2:setMinWidth(80);
    obj.flowPart2:setMaxWidth(250);
    obj.flowPart2:setMargins({left=10, right=10});
    obj.flowPart2:setHeight(32);
    obj.flowPart2:setName("flowPart2");

    obj.indAtividade = GUI.fromHandle(_obj_newObject("activityIndicator"));
    obj.indAtividade:setParent(obj.flowPart2);
    obj.indAtividade:setName("indAtividade");
    obj.indAtividade:setAlign("left");
    obj.indAtividade:setWidth(32);
    obj.indAtividade:setEnabled(true);

    obj.labProgress = GUI.fromHandle(_obj_newObject("label"));
    obj.labProgress:setParent(obj.flowPart2);
    obj.labProgress:setName("labProgress");
    obj.labProgress:setAlign("client");
    obj.labProgress:setText("0,0%");

    obj.btnCancelar = GUI.fromHandle(_obj_newObject("button"));
    obj.btnCancelar:setParent(obj.flwPlug);
    obj.btnCancelar:setName("btnCancelar");
    obj.btnCancelar:setText(lang("plugins.mgr.cancel"));
    obj.btnCancelar:setMargins({left=10, top=5});
    obj.btnCancelar:setWidth(110);
    obj.btnCancelar:setHeight(32);

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'progress', 'errorMsg'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.flwPlug:addEventListener("onResize",
        function (_)
            self.height = self.flwPlug.height + 8;
        end, obj);

    obj._e_event1 = obj.btnCancelar:addEventListener("onClick",
        function (_)
            cancelarDownload();
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local errorMsg = sheet.errorMsg;
            			
            			if errorMsg == nil then												
            				self.labProgress.text = string.format('%1.1f%%', sheet.progress or 0);
            			else
            				self.indAtividade.enabled = false;
            				self.indAtividade.visible = false;
            				self.labProgress.text = tostring(errorMsg);
            			end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.btnCancelar ~= nil then self.btnCancelar:destroy(); self.btnCancelar = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.indAtividade ~= nil then self.indAtividade:destroy(); self.indAtividade = nil; end;
        if self.labUrl ~= nil then self.labUrl:destroy(); self.labUrl = nil; end;
        if self.flwPlug ~= nil then self.flwPlug:destroy(); self.flwPlug = nil; end;
        if self.labProgress ~= nil then self.labProgress:destroy(); self.labProgress = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.flowLineBreak1 ~= nil then self.flowLineBreak1:destroy(); self.flowLineBreak1 = nil; end;
        if self.flowPart2 ~= nil then self.flowPart2:destroy(); self.flowPart2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmPluginBaixando = {
    newEditor = newfrmPluginBaixando, 
    new = newfrmPluginBaixando, 
    name = "frmPluginBaixando", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "Plugin Baixando", 
    description=""};

frmPluginBaixando = _frmPluginBaixando;
Firecast.registrarForm(_frmPluginBaixando);

return _frmPluginBaixando;
