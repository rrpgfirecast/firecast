require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmInventario()
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
    obj:setName("frmInventario");
    obj:setWidth(465);
    obj:setHeight(25);
    obj:setTheme("dark");

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse item?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showInvPopup()
			local pop = self:findControlByName("popInv");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:show("bottomCenter", self.botaoItemInfo);
			else
				showMessage("Não encontrei o popup do item para exibir.");
			end;
		end;
		


    obj.nomeItemLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeItemLabel:setParent(obj);
    obj.nomeItemLabel:setLeft(0);
    obj.nomeItemLabel:setTop(0);
    obj.nomeItemLabel:setWidth(177);
    obj.nomeItemLabel:setHeight(25);
    obj.nomeItemLabel:setColor("transparent");
    obj.nomeItemLabel:setStrokeColor("Gray");
    obj.nomeItemLabel:setStrokeSize(1);
    obj.nomeItemLabel:setName("nomeItemLabel");
    obj.nomeItemLabel:setVisible(true);
    obj.nomeItemLabel:setCornerType("round");
    obj.nomeItemLabel:setXradius(5);
    obj.nomeItemLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.nomeItemLabel);
    obj.label1:setWidth(177);
    obj.label1:setHeight(25);
    obj.label1:setField("nomeItem");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Gray");
    obj.label1:setName("label1");

    obj.nomeItemEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeItemEdit:setParent(obj);
    obj.nomeItemEdit:setField("nomeItem");
    obj.nomeItemEdit:setLeft(0);
    obj.nomeItemEdit:setTop(0);
    obj.nomeItemEdit:setWidth(177);
    obj.nomeItemEdit:setHeight(25);
    obj.nomeItemEdit:setName("nomeItemEdit");
    obj.nomeItemEdit:setVisible(false);
    obj.nomeItemEdit:setFontSize(16);

    obj.volumeItemLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.volumeItemLabel:setParent(obj);
    obj.volumeItemLabel:setLeft(177);
    obj.volumeItemLabel:setTop(0);
    obj.volumeItemLabel:setWidth(77);
    obj.volumeItemLabel:setHeight(25);
    obj.volumeItemLabel:setColor("transparent");
    obj.volumeItemLabel:setStrokeColor("Gray");
    obj.volumeItemLabel:setStrokeSize(1);
    obj.volumeItemLabel:setName("volumeItemLabel");
    obj.volumeItemLabel:setVisible(true);
    obj.volumeItemLabel:setCornerType("round");
    obj.volumeItemLabel:setXradius(5);
    obj.volumeItemLabel:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.volumeItemLabel);
    obj.label2:setWidth(77);
    obj.label2:setHeight(25);
    obj.label2:setField("volumeItem");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Gray");
    obj.label2:setName("label2");

    obj.volumeItemEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.volumeItemEdit:setParent(obj);
    obj.volumeItemEdit:setField("volumeItem");
    obj.volumeItemEdit:setLeft(177);
    obj.volumeItemEdit:setTop(0);
    obj.volumeItemEdit:setWidth(77);
    obj.volumeItemEdit:setHeight(25);
    obj.volumeItemEdit:setName("volumeItemEdit");
    obj.volumeItemEdit:setVisible(false);
    obj.volumeItemEdit:setFontSize(16);

    obj.botaoItemInfo = GUI.fromHandle(_obj_newObject("button"));
    obj.botaoItemInfo:setParent(obj);
    obj.botaoItemInfo:setName("botaoItemInfo");
    obj.botaoItemInfo:setLeft(254);
    obj.botaoItemInfo:setTop(1);
    obj.botaoItemInfo:setWidth(23);
    obj.botaoItemInfo:setHeight(23);
    obj.botaoItemInfo:setText("i");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(277);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nomeItemLabel:addEventListener("onClick",
        function (_)
            self.nomeItemLabel.visible = false;
                            self.nomeItemEdit.visible = true;
                            self.nomeItemEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.nomeItemEdit:addEventListener("onExit",
        function (_)
            self.nomeItemLabel.visible = true;
                            self.nomeItemEdit.visible = false;
        end, obj);

    obj._e_event2 = obj.volumeItemLabel:addEventListener("onClick",
        function (_)
            self.volumeItemLabel.visible = false;
                            self.volumeItemEdit.visible = true;
                            self.volumeItemEdit:setFocus();
        end, obj);

    obj._e_event3 = obj.volumeItemEdit:addEventListener("onExit",
        function (_)
            self.volumeItemLabel.visible = true;
                            self.volumeItemEdit.visible = false;
        end, obj);

    obj._e_event4 = obj.botaoItemInfo:addEventListener("onClick",
        function (_)
            showInvPopup();
        end, obj);

    obj._e_event5 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
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

        if self.nomeItemLabel ~= nil then self.nomeItemLabel:destroy(); self.nomeItemLabel = nil; end;
        if self.volumeItemLabel ~= nil then self.volumeItemLabel:destroy(); self.volumeItemLabel = nil; end;
        if self.botaoItemInfo ~= nil then self.botaoItemInfo:destroy(); self.botaoItemInfo = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.nomeItemEdit ~= nil then self.nomeItemEdit:destroy(); self.nomeItemEdit = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.volumeItemEdit ~= nil then self.volumeItemEdit:destroy(); self.volumeItemEdit = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmInventario()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmInventario();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmInventario = {
    newEditor = newfrmInventario, 
    new = newfrmInventario, 
    name = "frmInventario", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInventario = _frmInventario;
Firecast.registrarForm(_frmInventario);

return _frmInventario;
