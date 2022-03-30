require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmClasses()
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
    obj:setName("frmClasses");
    obj:setWidth(400);
    obj:setHeight(25);
    obj:setTheme("dark");


		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar essa classe?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showMagiaPopup()
			local pop = self:findControlByName("popMagias");

			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:show();
			else
				showMessage("Não encontrei o popup de magias para exibir.");
			end;
		end;
		


    obj.nomeClasseExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeClasseExLabel:setParent(obj);
    obj.nomeClasseExLabel:setLeft(0);
    obj.nomeClasseExLabel:setTop(0);
    obj.nomeClasseExLabel:setWidth(100);
    obj.nomeClasseExLabel:setHeight(25);
    obj.nomeClasseExLabel:setColor("transparent");
    obj.nomeClasseExLabel:setStrokeColor("Gray");
    obj.nomeClasseExLabel:setStrokeSize(1);
    obj.nomeClasseExLabel:setName("nomeClasseExLabel");
    obj.nomeClasseExLabel:setVisible(true);
    obj.nomeClasseExLabel:setCornerType("round");
    obj.nomeClasseExLabel:setXradius(5);
    obj.nomeClasseExLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.nomeClasseExLabel);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setField("nomeClasseEx");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Gray");
    obj.label1:setName("label1");

    obj.nomeClasseExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeClasseExEdit:setParent(obj);
    obj.nomeClasseExEdit:setField("nomeClasseEx");
    obj.nomeClasseExEdit:setLeft(0);
    obj.nomeClasseExEdit:setTop(0);
    obj.nomeClasseExEdit:setWidth(100);
    obj.nomeClasseExEdit:setHeight(25);
    obj.nomeClasseExEdit:setName("nomeClasseExEdit");
    obj.nomeClasseExEdit:setVisible(false);
    obj.nomeClasseExEdit:setFontSize(16);

    obj.atrClasseExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.atrClasseExLabel:setParent(obj);
    obj.atrClasseExLabel:setLeft(100);
    obj.atrClasseExLabel:setTop(0);
    obj.atrClasseExLabel:setWidth(55);
    obj.atrClasseExLabel:setHeight(25);
    obj.atrClasseExLabel:setColor("transparent");
    obj.atrClasseExLabel:setStrokeColor("Gray");
    obj.atrClasseExLabel:setStrokeSize(1);
    obj.atrClasseExLabel:setName("atrClasseExLabel");
    obj.atrClasseExLabel:setVisible(true);
    obj.atrClasseExLabel:setCornerType("round");
    obj.atrClasseExLabel:setXradius(5);
    obj.atrClasseExLabel:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.atrClasseExLabel);
    obj.label2:setWidth(55);
    obj.label2:setHeight(25);
    obj.label2:setField("atrClasseEx");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Gray");
    obj.label2:setName("label2");

    obj.atrClasseExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.atrClasseExEdit:setParent(obj);
    obj.atrClasseExEdit:setField("atrClasseEx");
    obj.atrClasseExEdit:setLeft(100);
    obj.atrClasseExEdit:setTop(0);
    obj.atrClasseExEdit:setWidth(55);
    obj.atrClasseExEdit:setHeight(25);
    obj.atrClasseExEdit:setName("atrClasseExEdit");
    obj.atrClasseExEdit:setVisible(false);
    obj.atrClasseExEdit:setFontSize(16);

    obj.profClasseExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.profClasseExLabel:setParent(obj);
    obj.profClasseExLabel:setLeft(155);
    obj.profClasseExLabel:setTop(0);
    obj.profClasseExLabel:setWidth(55);
    obj.profClasseExLabel:setHeight(25);
    obj.profClasseExLabel:setColor("transparent");
    obj.profClasseExLabel:setStrokeColor("Gray");
    obj.profClasseExLabel:setStrokeSize(1);
    obj.profClasseExLabel:setName("profClasseExLabel");
    obj.profClasseExLabel:setVisible(true);
    obj.profClasseExLabel:setCornerType("round");
    obj.profClasseExLabel:setXradius(5);
    obj.profClasseExLabel:setYradius(5);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.profClasseExLabel);
    obj.label3:setWidth(55);
    obj.label3:setHeight(25);
    obj.label3:setField("profClasseEx");
    obj.label3:setFontSize(16);
    obj.label3:setVertTextAlign("center");
    obj.label3:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("Gray");
    obj.label3:setName("label3");

    obj.profClasseExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.profClasseExEdit:setParent(obj);
    obj.profClasseExEdit:setField("profClasseEx");
    obj.profClasseExEdit:setLeft(155);
    obj.profClasseExEdit:setTop(0);
    obj.profClasseExEdit:setWidth(55);
    obj.profClasseExEdit:setHeight(25);
    obj.profClasseExEdit:setName("profClasseExEdit");
    obj.profClasseExEdit:setVisible(false);
    obj.profClasseExEdit:setFontSize(16);

    obj.outrosClasseExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.outrosClasseExLabel:setParent(obj);
    obj.outrosClasseExLabel:setLeft(210);
    obj.outrosClasseExLabel:setTop(0);
    obj.outrosClasseExLabel:setWidth(55);
    obj.outrosClasseExLabel:setHeight(25);
    obj.outrosClasseExLabel:setColor("transparent");
    obj.outrosClasseExLabel:setStrokeColor("Gray");
    obj.outrosClasseExLabel:setStrokeSize(1);
    obj.outrosClasseExLabel:setName("outrosClasseExLabel");
    obj.outrosClasseExLabel:setVisible(true);
    obj.outrosClasseExLabel:setCornerType("round");
    obj.outrosClasseExLabel:setXradius(5);
    obj.outrosClasseExLabel:setYradius(5);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.outrosClasseExLabel);
    obj.label4:setWidth(55);
    obj.label4:setHeight(25);
    obj.label4:setField("outrosClasseEx");
    obj.label4:setFontSize(16);
    obj.label4:setVertTextAlign("center");
    obj.label4:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("Gray");
    obj.label4:setName("label4");

    obj.outrosClasseExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.outrosClasseExEdit:setParent(obj);
    obj.outrosClasseExEdit:setField("outrosClasseEx");
    obj.outrosClasseExEdit:setLeft(210);
    obj.outrosClasseExEdit:setTop(0);
    obj.outrosClasseExEdit:setWidth(55);
    obj.outrosClasseExEdit:setHeight(25);
    obj.outrosClasseExEdit:setName("outrosClasseExEdit");
    obj.outrosClasseExEdit:setVisible(false);
    obj.outrosClasseExEdit:setFontSize(16);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(265);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(57);
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("Gray");
    obj.rectangle1:setStrokeSize(3);
    obj.rectangle1:setVisible(true);
    obj.rectangle1:setOpacity(1);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setName("rectangle1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setWidth(57);
    obj.label5:setHeight(25);
    obj.label5:setField("cdClasseEx");
    obj.label5:setFontSize(16);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontColor("Gray");
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(322);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(345);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'atrClasseEx', 'profClasseEx', 'outrosClasseEx'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.nomeClasseExLabel:addEventListener("onClick",
        function (_)
            self.nomeClasseExLabel.visible = false;
                            self.nomeClasseExEdit.visible = true;
                            self.nomeClasseExEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.nomeClasseExEdit:addEventListener("onExit",
        function (_)
            self.nomeClasseExLabel.visible = true;
                            self.nomeClasseExEdit.visible = false;
        end, obj);

    obj._e_event2 = obj.atrClasseExLabel:addEventListener("onClick",
        function (_)
            self.atrClasseExLabel.visible = false;
                            self.atrClasseExEdit.visible = true;
                            self.atrClasseExEdit:setFocus();
        end, obj);

    obj._e_event3 = obj.atrClasseExEdit:addEventListener("onExit",
        function (_)
            self.atrClasseExLabel.visible = true;
                            self.atrClasseExEdit.visible = false;
        end, obj);

    obj._e_event4 = obj.profClasseExLabel:addEventListener("onClick",
        function (_)
            self.profClasseExLabel.visible = false;
                            self.profClasseExEdit.visible = true;
                            self.profClasseExEdit:setFocus();
        end, obj);

    obj._e_event5 = obj.profClasseExEdit:addEventListener("onExit",
        function (_)
            self.profClasseExLabel.visible = true;
                            self.profClasseExEdit.visible = false;
        end, obj);

    obj._e_event6 = obj.outrosClasseExLabel:addEventListener("onClick",
        function (_)
            self.outrosClasseExLabel.visible = false;
                            self.outrosClasseExEdit.visible = true;
                            self.outrosClasseExEdit:setFocus();
        end, obj);

    obj._e_event7 = obj.outrosClasseExEdit:addEventListener("onExit",
        function (_)
            self.outrosClasseExLabel.visible = true;
                            self.outrosClasseExEdit.visible = false;
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (_)
            showMagiaPopup();
        end, obj);

    obj._e_event9 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event10 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                        sheet.cdClasseEx = 10 + (tonumber(sheet.atrClasseEx) or 0)+
                                               (tonumber(sheet.profClasseEx) or 0)+
                                               (tonumber(sheet.outrosClasseEx) or 0);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.atrClasseExEdit ~= nil then self.atrClasseExEdit:destroy(); self.atrClasseExEdit = nil; end;
        if self.profClasseExEdit ~= nil then self.profClasseExEdit:destroy(); self.profClasseExEdit = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.nomeClasseExEdit ~= nil then self.nomeClasseExEdit:destroy(); self.nomeClasseExEdit = nil; end;
        if self.atrClasseExLabel ~= nil then self.atrClasseExLabel:destroy(); self.atrClasseExLabel = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.outrosClasseExEdit ~= nil then self.outrosClasseExEdit:destroy(); self.outrosClasseExEdit = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.profClasseExLabel ~= nil then self.profClasseExLabel:destroy(); self.profClasseExLabel = nil; end;
        if self.outrosClasseExLabel ~= nil then self.outrosClasseExLabel:destroy(); self.outrosClasseExLabel = nil; end;
        if self.nomeClasseExLabel ~= nil then self.nomeClasseExLabel:destroy(); self.nomeClasseExLabel = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmClasses()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmClasses();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmClasses = {
    newEditor = newfrmClasses, 
    new = newfrmClasses, 
    name = "frmClasses", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmClasses = _frmClasses;
Firecast.registrarForm(_frmClasses);

return _frmClasses;
