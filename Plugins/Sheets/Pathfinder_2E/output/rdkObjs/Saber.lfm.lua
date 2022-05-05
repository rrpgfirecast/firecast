require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmSaber()
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
    obj:setName("frmSaber");
    obj:setWidth(400);
    obj:setHeight(25);
    obj:setTheme("dark");


		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar essa perícia?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;
		


    obj.nomeSaberExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeSaberExLabel:setParent(obj);
    obj.nomeSaberExLabel:setLeft(0);
    obj.nomeSaberExLabel:setTop(0);
    obj.nomeSaberExLabel:setWidth(100);
    obj.nomeSaberExLabel:setHeight(25);
    obj.nomeSaberExLabel:setColor("transparent");
    obj.nomeSaberExLabel:setStrokeColor("Gray");
    obj.nomeSaberExLabel:setStrokeSize(1);
    obj.nomeSaberExLabel:setName("nomeSaberExLabel");
    obj.nomeSaberExLabel:setVisible(true);
    obj.nomeSaberExLabel:setCornerType("round");
    obj.nomeSaberExLabel:setXradius(5);
    obj.nomeSaberExLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.nomeSaberExLabel);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setField("nomeSaberEx");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Gray");
    obj.label1:setName("label1");

    obj.nomeSaberExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeSaberExEdit:setParent(obj);
    obj.nomeSaberExEdit:setField("nomeSaberEx");
    obj.nomeSaberExEdit:setLeft(0);
    obj.nomeSaberExEdit:setTop(0);
    obj.nomeSaberExEdit:setWidth(100);
    obj.nomeSaberExEdit:setHeight(25);
    obj.nomeSaberExEdit:setName("nomeSaberExEdit");
    obj.nomeSaberExEdit:setVisible(false);
    obj.nomeSaberExEdit:setFontSize(16);

    obj.atrSaberExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.atrSaberExLabel:setParent(obj);
    obj.atrSaberExLabel:setLeft(100);
    obj.atrSaberExLabel:setTop(0);
    obj.atrSaberExLabel:setWidth(55);
    obj.atrSaberExLabel:setHeight(25);
    obj.atrSaberExLabel:setColor("transparent");
    obj.atrSaberExLabel:setStrokeColor("Gray");
    obj.atrSaberExLabel:setStrokeSize(1);
    obj.atrSaberExLabel:setName("atrSaberExLabel");
    obj.atrSaberExLabel:setVisible(true);
    obj.atrSaberExLabel:setCornerType("round");
    obj.atrSaberExLabel:setXradius(5);
    obj.atrSaberExLabel:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.atrSaberExLabel);
    obj.label2:setWidth(55);
    obj.label2:setHeight(25);
    obj.label2:setField("atrSaberEx");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Gray");
    obj.label2:setName("label2");

    obj.atrSaberExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.atrSaberExEdit:setParent(obj);
    obj.atrSaberExEdit:setField("atrSaberEx");
    obj.atrSaberExEdit:setLeft(100);
    obj.atrSaberExEdit:setTop(0);
    obj.atrSaberExEdit:setWidth(55);
    obj.atrSaberExEdit:setHeight(25);
    obj.atrSaberExEdit:setName("atrSaberExEdit");
    obj.atrSaberExEdit:setVisible(false);
    obj.atrSaberExEdit:setFontSize(16);

    obj.profSaberExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.profSaberExLabel:setParent(obj);
    obj.profSaberExLabel:setLeft(155);
    obj.profSaberExLabel:setTop(0);
    obj.profSaberExLabel:setWidth(55);
    obj.profSaberExLabel:setHeight(25);
    obj.profSaberExLabel:setColor("transparent");
    obj.profSaberExLabel:setStrokeColor("Gray");
    obj.profSaberExLabel:setStrokeSize(1);
    obj.profSaberExLabel:setName("profSaberExLabel");
    obj.profSaberExLabel:setVisible(true);
    obj.profSaberExLabel:setCornerType("round");
    obj.profSaberExLabel:setXradius(5);
    obj.profSaberExLabel:setYradius(5);

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.profSaberExLabel);
    obj.label3:setWidth(55);
    obj.label3:setHeight(25);
    obj.label3:setField("profSaberEx");
    obj.label3:setFontSize(16);
    obj.label3:setVertTextAlign("center");
    obj.label3:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label3, "fontStyle",  "bold");
    obj.label3:setFontColor("Gray");
    obj.label3:setName("label3");

    obj.profSaberExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.profSaberExEdit:setParent(obj);
    obj.profSaberExEdit:setField("profSaberEx");
    obj.profSaberExEdit:setLeft(155);
    obj.profSaberExEdit:setTop(0);
    obj.profSaberExEdit:setWidth(55);
    obj.profSaberExEdit:setHeight(25);
    obj.profSaberExEdit:setName("profSaberExEdit");
    obj.profSaberExEdit:setVisible(false);
    obj.profSaberExEdit:setFontSize(16);

    obj.outrosSaberExLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.outrosSaberExLabel:setParent(obj);
    obj.outrosSaberExLabel:setLeft(210);
    obj.outrosSaberExLabel:setTop(0);
    obj.outrosSaberExLabel:setWidth(55);
    obj.outrosSaberExLabel:setHeight(25);
    obj.outrosSaberExLabel:setColor("transparent");
    obj.outrosSaberExLabel:setStrokeColor("Gray");
    obj.outrosSaberExLabel:setStrokeSize(1);
    obj.outrosSaberExLabel:setName("outrosSaberExLabel");
    obj.outrosSaberExLabel:setVisible(true);
    obj.outrosSaberExLabel:setCornerType("round");
    obj.outrosSaberExLabel:setXradius(5);
    obj.outrosSaberExLabel:setYradius(5);

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.outrosSaberExLabel);
    obj.label4:setWidth(55);
    obj.label4:setHeight(25);
    obj.label4:setField("outrosSaberEx");
    obj.label4:setFontSize(16);
    obj.label4:setVertTextAlign("center");
    obj.label4:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label4, "fontStyle",  "bold");
    obj.label4:setFontColor("Gray");
    obj.label4:setName("label4");

    obj.outrosSaberExEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.outrosSaberExEdit:setParent(obj);
    obj.outrosSaberExEdit:setField("outrosSaberEx");
    obj.outrosSaberExEdit:setLeft(210);
    obj.outrosSaberExEdit:setTop(0);
    obj.outrosSaberExEdit:setWidth(55);
    obj.outrosSaberExEdit:setHeight(25);
    obj.outrosSaberExEdit:setName("outrosSaberExEdit");
    obj.outrosSaberExEdit:setVisible(false);
    obj.outrosSaberExEdit:setFontSize(16);

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(265);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(79);
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
    obj.label5:setWidth(79);
    obj.label5:setHeight(25);
    obj.label5:setField("bonusSaberEx");
    obj.label5:setFontSize(16);
    lfm_setPropAsString(obj.label5, "fontStyle",  "bold");
    obj.label5:setFontColor("Gray");
    obj.label5:setVertTextAlign("center");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(344);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("R");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(367);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'atrSaberEx', 'profSaberEx', 'outrosSaberEx'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("bonusSaberEx");
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.nomeSaberExLabel:addEventListener("onClick",
        function (_)
            self.nomeSaberExLabel.visible = false;
                            self.nomeSaberExEdit.visible = true;
                            self.nomeSaberExEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.nomeSaberExEdit:addEventListener("onExit",
        function (_)
            self.nomeSaberExLabel.visible = true;
                            self.nomeSaberExEdit.visible = false;
        end, obj);

    obj._e_event2 = obj.atrSaberExLabel:addEventListener("onClick",
        function (_)
            self.atrSaberExLabel.visible = false;
                            self.atrSaberExEdit.visible = true;
                            self.atrSaberExEdit:setFocus();
        end, obj);

    obj._e_event3 = obj.atrSaberExEdit:addEventListener("onExit",
        function (_)
            self.atrSaberExLabel.visible = true;
                            self.atrSaberExEdit.visible = false;
        end, obj);

    obj._e_event4 = obj.profSaberExLabel:addEventListener("onClick",
        function (_)
            self.profSaberExLabel.visible = false;
                            self.profSaberExEdit.visible = true;
                            self.profSaberExEdit:setFocus();
        end, obj);

    obj._e_event5 = obj.profSaberExEdit:addEventListener("onExit",
        function (_)
            self.profSaberExLabel.visible = true;
                            self.profSaberExEdit.visible = false;
        end, obj);

    obj._e_event6 = obj.outrosSaberExLabel:addEventListener("onClick",
        function (_)
            self.outrosSaberExLabel.visible = false;
                            self.outrosSaberExEdit.visible = true;
                            self.outrosSaberExEdit:setFocus();
        end, obj);

    obj._e_event7 = obj.outrosSaberExEdit:addEventListener("onExit",
        function (_)
            self.outrosSaberExLabel.visible = true;
                            self.outrosSaberExEdit.visible = false;
        end, obj);

    obj._e_event8 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet.bonusSaberEx ~= nil then
                            local mod = tonumber(sheet.bonusSaberEx);
                            local rolagem = Firecast.interpretarRolagem("1d20 + " .. mod or 0);
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Saber de " .. (sheet.nome or "Personagem"));
                            else
                            local rolagem = Firecast.interpretarRolagem("1d20");
                            local mesa = Firecast.getMesaDe(sheet);
                            mesa.activeChat:rolarDados(rolagem, "Teste de Saber de " .. (sheet.nome or "Personagem"));
                            end;
        end, obj);

    obj._e_event9 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event10 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
            
                        sheet.bonusSaberEx = (tonumber(sheet.atrSaberEx) or 0)+
                                               (tonumber(sheet.profSaberEx) or 0)+
                                               (tonumber(sheet.outrosSaberEx) or 0);
        end, obj);

    obj._e_event11 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet == nil then return end;
                        local mod = (tonumber(sheet.bonusSaberEx or 0));
                        if (mod >= 0) then
                            sheet.bonusSaberEx = "+" .. mod;
                        else
                            sheet.bonusSaberEx = mod;
                        end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
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
        if self.nomeSaberExLabel ~= nil then self.nomeSaberExLabel:destroy(); self.nomeSaberExLabel = nil; end;
        if self.atrSaberExEdit ~= nil then self.atrSaberExEdit:destroy(); self.atrSaberExEdit = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.outrosSaberExLabel ~= nil then self.outrosSaberExLabel:destroy(); self.outrosSaberExLabel = nil; end;
        if self.nomeSaberExEdit ~= nil then self.nomeSaberExEdit:destroy(); self.nomeSaberExEdit = nil; end;
        if self.profSaberExEdit ~= nil then self.profSaberExEdit:destroy(); self.profSaberExEdit = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.profSaberExLabel ~= nil then self.profSaberExLabel:destroy(); self.profSaberExLabel = nil; end;
        if self.atrSaberExLabel ~= nil then self.atrSaberExLabel:destroy(); self.atrSaberExLabel = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.outrosSaberExEdit ~= nil then self.outrosSaberExEdit:destroy(); self.outrosSaberExEdit = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmSaber()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmSaber();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmSaber = {
    newEditor = newfrmSaber, 
    new = newfrmSaber, 
    name = "frmSaber", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSaber = _frmSaber;
Firecast.registrarForm(_frmSaber);

return _frmSaber;
