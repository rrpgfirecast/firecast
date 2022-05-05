require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMagiasPreparadas()
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
    obj:setName("frmMagiasPreparadas");
    obj:setHeight(25);
    obj:setWidth(330);


		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar essa magia?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;
	    


    obj.nomeMagiaPrepLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeMagiaPrepLabel:setParent(obj);
    obj.nomeMagiaPrepLabel:setLeft(0);
    obj.nomeMagiaPrepLabel:setTop(0);
    obj.nomeMagiaPrepLabel:setWidth(157);
    obj.nomeMagiaPrepLabel:setHeight(25);
    obj.nomeMagiaPrepLabel:setColor("transparent");
    obj.nomeMagiaPrepLabel:setStrokeColor("Gray");
    obj.nomeMagiaPrepLabel:setStrokeSize(1);
    obj.nomeMagiaPrepLabel:setName("nomeMagiaPrepLabel");
    obj.nomeMagiaPrepLabel:setVisible(true);
    obj.nomeMagiaPrepLabel:setCornerType("round");
    obj.nomeMagiaPrepLabel:setXradius(5);
    obj.nomeMagiaPrepLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.nomeMagiaPrepLabel);
    obj.label1:setWidth(157);
    obj.label1:setHeight(25);
    obj.label1:setField("nomeMagiaPrep");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Gray");
    obj.label1:setName("label1");

    obj.nomeMagiaPrepEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeMagiaPrepEdit:setParent(obj);
    obj.nomeMagiaPrepEdit:setField("nomeMagiaPrep");
    obj.nomeMagiaPrepEdit:setLeft(0);
    obj.nomeMagiaPrepEdit:setTop(0);
    obj.nomeMagiaPrepEdit:setWidth(157);
    obj.nomeMagiaPrepEdit:setHeight(25);
    obj.nomeMagiaPrepEdit:setName("nomeMagiaPrepEdit");
    obj.nomeMagiaPrepEdit:setVisible(false);
    obj.nomeMagiaPrepEdit:setFontSize(16);

    obj.nivelMagiaPrepLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nivelMagiaPrepLabel:setParent(obj);
    obj.nivelMagiaPrepLabel:setLeft(157);
    obj.nivelMagiaPrepLabel:setTop(0);
    obj.nivelMagiaPrepLabel:setWidth(55);
    obj.nivelMagiaPrepLabel:setHeight(25);
    obj.nivelMagiaPrepLabel:setColor("transparent");
    obj.nivelMagiaPrepLabel:setStrokeColor("Gray");
    obj.nivelMagiaPrepLabel:setStrokeSize(1);
    obj.nivelMagiaPrepLabel:setName("nivelMagiaPrepLabel");
    obj.nivelMagiaPrepLabel:setVisible(true);
    obj.nivelMagiaPrepLabel:setCornerType("round");
    obj.nivelMagiaPrepLabel:setXradius(5);
    obj.nivelMagiaPrepLabel:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.nivelMagiaPrepLabel);
    obj.label2:setWidth(55);
    obj.label2:setHeight(25);
    obj.label2:setField("nivelMagiaPrep");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Gray");
    obj.label2:setName("label2");

    obj.nivelMagiaPrepEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivelMagiaPrepEdit:setParent(obj);
    obj.nivelMagiaPrepEdit:setField("nivelMagiaPrep");
    obj.nivelMagiaPrepEdit:setLeft(157);
    obj.nivelMagiaPrepEdit:setTop(0);
    obj.nivelMagiaPrepEdit:setWidth(55);
    obj.nivelMagiaPrepEdit:setHeight(25);
    obj.nivelMagiaPrepEdit:setType("float");
    obj.nivelMagiaPrepEdit:setName("nivelMagiaPrepEdit");
    obj.nivelMagiaPrepEdit:setVisible(false);
    obj.nivelMagiaPrepEdit:setFontSize(16);

    obj.slotMagiaPrepLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.slotMagiaPrepLabel:setParent(obj);
    obj.slotMagiaPrepLabel:setLeft(212);
    obj.slotMagiaPrepLabel:setTop(0);
    obj.slotMagiaPrepLabel:setWidth(55);
    obj.slotMagiaPrepLabel:setHeight(25);
    obj.slotMagiaPrepLabel:setColor("transparent");
    obj.slotMagiaPrepLabel:setStrokeColor("Gray");
    obj.slotMagiaPrepLabel:setStrokeSize(1);
    obj.slotMagiaPrepLabel:setName("slotMagiaPrepLabel");
    obj.slotMagiaPrepLabel:setVisible(true);
    obj.slotMagiaPrepLabel:setCornerType("round");
    obj.slotMagiaPrepLabel:setXradius(5);
    obj.slotMagiaPrepLabel:setYradius(5);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.slotMagiaPrepLabel);
    obj.label3:setWidth(55);
    obj.label3:setHeight(25);
    obj.label3:setField("slotMagiaPrep");
    obj.label3:setFontSize(16);
    obj.label3:setVertTextAlign("center");
    obj.label3:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label3, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("Gray");
    obj.label3:setName("label3");

    obj.slotMagiaPrepEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.slotMagiaPrepEdit:setParent(obj);
    obj.slotMagiaPrepEdit:setField("slotMagiaPrep");
    obj.slotMagiaPrepEdit:setLeft(212);
    obj.slotMagiaPrepEdit:setTop(0);
    obj.slotMagiaPrepEdit:setWidth(55);
    obj.slotMagiaPrepEdit:setHeight(25);
    obj.slotMagiaPrepEdit:setType("float");
    obj.slotMagiaPrepEdit:setName("slotMagiaPrepEdit");
    obj.slotMagiaPrepEdit:setVisible(false);
    obj.slotMagiaPrepEdit:setFontSize(16);

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(267);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nomeMagiaPrepLabel:addEventListener("onClick",
        function (_)
            self.nomeMagiaPrepLabel.visible = false;
                            self.nomeMagiaPrepEdit.visible = true;
                            self.nomeMagiaPrepEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.nomeMagiaPrepEdit:addEventListener("onExit",
        function (_)
            self.nomeMagiaPrepLabel.visible = true;
                            self.nomeMagiaPrepEdit.visible = false;
        end, obj);

    obj._e_event2 = obj.nivelMagiaPrepLabel:addEventListener("onClick",
        function (_)
            self.nivelMagiaPrepLabel.visible = false;
                            self.nivelMagiaPrepEdit.visible = true;
                            self.nivelMagiaPrepEdit:setFocus();
        end, obj);

    obj._e_event3 = obj.nivelMagiaPrepEdit:addEventListener("onExit",
        function (_)
            self.nivelMagiaPrepLabel.visible = true;
                            self.nivelMagiaPrepEdit.visible = false;
        end, obj);

    obj._e_event4 = obj.slotMagiaPrepLabel:addEventListener("onClick",
        function (_)
            self.slotMagiaPrepLabel.visible = false;
                            self.slotMagiaPrepEdit.visible = true;
                            self.slotMagiaPrepEdit:setFocus();
        end, obj);

    obj._e_event5 = obj.slotMagiaPrepEdit:addEventListener("onExit",
        function (_)
            self.slotMagiaPrepLabel.visible = true;
                            self.slotMagiaPrepEdit.visible = false;
        end, obj);

    obj._e_event6 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
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

        if self.nivelMagiaPrepEdit ~= nil then self.nivelMagiaPrepEdit:destroy(); self.nivelMagiaPrepEdit = nil; end;
        if self.slotMagiaPrepEdit ~= nil then self.slotMagiaPrepEdit:destroy(); self.slotMagiaPrepEdit = nil; end;
        if self.nomeMagiaPrepLabel ~= nil then self.nomeMagiaPrepLabel:destroy(); self.nomeMagiaPrepLabel = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.nomeMagiaPrepEdit ~= nil then self.nomeMagiaPrepEdit:destroy(); self.nomeMagiaPrepEdit = nil; end;
        if self.nivelMagiaPrepLabel ~= nil then self.nivelMagiaPrepLabel:destroy(); self.nivelMagiaPrepLabel = nil; end;
        if self.slotMagiaPrepLabel ~= nil then self.slotMagiaPrepLabel:destroy(); self.slotMagiaPrepLabel = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMagiasPreparadas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMagiasPreparadas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMagiasPreparadas = {
    newEditor = newfrmMagiasPreparadas, 
    new = newfrmMagiasPreparadas, 
    name = "frmMagiasPreparadas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMagiasPreparadas = _frmMagiasPreparadas;
Firecast.registrarForm(_frmMagiasPreparadas);

return _frmMagiasPreparadas;
