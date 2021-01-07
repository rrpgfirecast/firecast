require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmItem()
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
    obj:setName("frmItem");
    obj:setHeight(30);
    obj:setMargins({top=2,bottom=2});

    obj.flowPart1 = GUI.fromHandle(_obj_newObject("flowPart"));
    obj.flowPart1:setParent(obj);
    obj.flowPart1:setMinWidth(400);
    obj.flowPart1:setWidth(1400);
    obj.flowPart1:setMaxWidth(1600);
    obj.flowPart1:setHeight(30);
    obj.flowPart1:setName("flowPart1");

			
			local function askForDelete()
				Dialogs.confirmYesNo("Deseja realmente apagar '" .. (sheet.nomeItem or "<sem nome>").. "'?'",
									 function (confirmado)
										if confirmado then
											NDB.deleteNode(self.sheet);
										end;
									 end);
			end;
			
			local function showItemPopup()
				local pop = self:findControlByName("popItem");
				local popControle = self:findControlByName("buttonItemInfo");
					
				if pop ~= nil then
					pop:setNodeObject(self.sheet);
					pop:show("topCenter", popControle);
				else
					showMessage("Não foi encontrada a janela de descrição correspondente.");
				end;
			end;
			


    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowPart1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(375);
    obj.edit1:setField("nomeItem");
    obj.edit1:setMargins({right=5});
    obj.edit1:setFontSize(18);
    obj.edit1:setName("edit1");

    obj.buttonItemInfo = GUI.fromHandle(_obj_newObject("button"));
    obj.buttonItemInfo:setParent(obj.flowPart1);
    obj.buttonItemInfo:setName("buttonItemInfo");
    obj.buttonItemInfo:setAlign("left");
    obj.buttonItemInfo:setText("i");
    obj.buttonItemInfo:setWidth(30);
    obj.buttonItemInfo:setMargins({right=5});
    obj.buttonItemInfo:setFontSize(15);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowPart1);
    obj.button1:setAlign("left");
    obj.button1:setText("Apagar");
    obj.button1:setWidth(80);
    obj.button1:setMargins({right=5});
    obj.button1:setName("button1");
    obj.button1:setFontSize(15);

    obj._e_event0 = obj.buttonItemInfo:addEventListener("onClick",
        function (_)
            showItemPopup();
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
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

        if self.buttonItemInfo ~= nil then self.buttonItemInfo:destroy(); self.buttonItemInfo = nil; end;
        if self.flowPart1 ~= nil then self.flowPart1:destroy(); self.flowPart1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmItem = {
    newEditor = newfrmItem, 
    new = newfrmItem, 
    name = "frmItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmItem = _frmItem;
Firecast.registrarForm(_frmItem);

return _frmItem;
