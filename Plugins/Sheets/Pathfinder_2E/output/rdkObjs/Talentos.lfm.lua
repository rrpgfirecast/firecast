require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmTalentos()
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
    obj:setName("frmTalentos");
    obj:setHeight(25);
    obj:setWidth(330);


		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse talento?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showTalentoInfoPopup()
			local pop = self:findControlByName("popTalentoInfo");

			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("bottomCenter", self.botaoTalento);
			else
				showMessage("Não encontrei o popup de talentos para exibir.");
			end;
		end;
	    


    obj.nivelTalentoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nivelTalentoLabel:setParent(obj);
    obj.nivelTalentoLabel:setLeft(1);
    obj.nivelTalentoLabel:setTop(0);
    obj.nivelTalentoLabel:setWidth(55);
    obj.nivelTalentoLabel:setHeight(25);
    obj.nivelTalentoLabel:setColor("transparent");
    obj.nivelTalentoLabel:setStrokeColor("Gray");
    obj.nivelTalentoLabel:setStrokeSize(1);
    obj.nivelTalentoLabel:setName("nivelTalentoLabel");
    obj.nivelTalentoLabel:setVisible(true);
    obj.nivelTalentoLabel:setCornerType("round");
    obj.nivelTalentoLabel:setXradius(5);
    obj.nivelTalentoLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.nivelTalentoLabel);
    obj.label1:setWidth(55);
    obj.label1:setHeight(25);
    obj.label1:setField("nivelTalento");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Gray");
    obj.label1:setName("label1");

    obj.nivelTalentoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivelTalentoEdit:setParent(obj);
    obj.nivelTalentoEdit:setField("nivelTalento");
    obj.nivelTalentoEdit:setLeft(1);
    obj.nivelTalentoEdit:setTop(0);
    obj.nivelTalentoEdit:setWidth(55);
    obj.nivelTalentoEdit:setHeight(25);
    obj.nivelTalentoEdit:setType("float");
    obj.nivelTalentoEdit:setName("nivelTalentoEdit");
    obj.nivelTalentoEdit:setVisible(false);
    obj.nivelTalentoEdit:setFontSize(16);

    obj.nomeTalentoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeTalentoLabel:setParent(obj);
    obj.nomeTalentoLabel:setLeft(56);
    obj.nomeTalentoLabel:setTop(0);
    obj.nomeTalentoLabel:setWidth(207);
    obj.nomeTalentoLabel:setHeight(25);
    obj.nomeTalentoLabel:setColor("transparent");
    obj.nomeTalentoLabel:setStrokeColor("Gray");
    obj.nomeTalentoLabel:setStrokeSize(1);
    obj.nomeTalentoLabel:setName("nomeTalentoLabel");
    obj.nomeTalentoLabel:setVisible(true);
    obj.nomeTalentoLabel:setCornerType("round");
    obj.nomeTalentoLabel:setXradius(5);
    obj.nomeTalentoLabel:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.nomeTalentoLabel);
    obj.label2:setWidth(207);
    obj.label2:setHeight(25);
    obj.label2:setField("nomeTalento");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Gray");
    obj.label2:setName("label2");

    obj.nomeTalentoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeTalentoEdit:setParent(obj);
    obj.nomeTalentoEdit:setField("nomeTalento");
    obj.nomeTalentoEdit:setLeft(56);
    obj.nomeTalentoEdit:setTop(0);
    obj.nomeTalentoEdit:setWidth(207);
    obj.nomeTalentoEdit:setHeight(25);
    obj.nomeTalentoEdit:setName("nomeTalentoEdit");
    obj.nomeTalentoEdit:setVisible(false);
    obj.nomeTalentoEdit:setFontSize(16);

    obj.botaoTalento = GUI.fromHandle(_obj_newObject("button"));
    obj.botaoTalento:setParent(obj);
    obj.botaoTalento:setName("botaoTalento");
    obj.botaoTalento:setLeft(263);
    obj.botaoTalento:setTop(1);
    obj.botaoTalento:setWidth(23);
    obj.botaoTalento:setHeight(23);
    obj.botaoTalento:setText("i");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(286);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nivelTalentoLabel:addEventListener("onClick",
        function (_)
            self.nivelTalentoLabel.visible = false;
                            self.nivelTalentoEdit.visible = true;
                            self.nivelTalentoEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.nivelTalentoEdit:addEventListener("onExit",
        function (_)
            self.nivelTalentoLabel.visible = true;
                            self.nivelTalentoEdit.visible = false;
        end, obj);

    obj._e_event2 = obj.nomeTalentoLabel:addEventListener("onClick",
        function (_)
            self.nomeTalentoLabel.visible = false;
                            self.nomeTalentoEdit.visible = true;
                            self.nomeTalentoEdit:setFocus();
        end, obj);

    obj._e_event3 = obj.nomeTalentoEdit:addEventListener("onExit",
        function (_)
            self.nomeTalentoLabel.visible = true;
                            self.nomeTalentoEdit.visible = false;
        end, obj);

    obj._e_event4 = obj.botaoTalento:addEventListener("onClick",
        function (_)
            showTalentoInfoPopup();
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

        if self.nivelTalentoEdit ~= nil then self.nivelTalentoEdit:destroy(); self.nivelTalentoEdit = nil; end;
        if self.nomeTalentoEdit ~= nil then self.nomeTalentoEdit:destroy(); self.nomeTalentoEdit = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.botaoTalento ~= nil then self.botaoTalento:destroy(); self.botaoTalento = nil; end;
        if self.nomeTalentoLabel ~= nil then self.nomeTalentoLabel:destroy(); self.nomeTalentoLabel = nil; end;
        if self.nivelTalentoLabel ~= nil then self.nivelTalentoLabel:destroy(); self.nivelTalentoLabel = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmTalentos()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmTalentos();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmTalentos = {
    newEditor = newfrmTalentos, 
    new = newfrmTalentos, 
    name = "frmTalentos", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmTalentos = _frmTalentos;
Firecast.registrarForm(_frmTalentos);

return _frmTalentos;
