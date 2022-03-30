require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMagiasConhecidas()
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
    obj:setName("frmMagiasConhecidas");
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

		local function showInfoMagiaPopup()
			local pop = self:findControlByName("popInfoMagia");

			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:show("bottomCenter", self.botaoMagiaInfo);
			else
				showMessage("Não encontrei o popup da magia para exibir.");
			end;
		end;
	    


    obj.nivelMagiaConhecLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nivelMagiaConhecLabel:setParent(obj);
    obj.nivelMagiaConhecLabel:setLeft(0);
    obj.nivelMagiaConhecLabel:setTop(0);
    obj.nivelMagiaConhecLabel:setWidth(55);
    obj.nivelMagiaConhecLabel:setHeight(25);
    obj.nivelMagiaConhecLabel:setColor("transparent");
    obj.nivelMagiaConhecLabel:setStrokeColor("Gray");
    obj.nivelMagiaConhecLabel:setStrokeSize(1);
    obj.nivelMagiaConhecLabel:setName("nivelMagiaConhecLabel");
    obj.nivelMagiaConhecLabel:setVisible(true);
    obj.nivelMagiaConhecLabel:setCornerType("round");
    obj.nivelMagiaConhecLabel:setXradius(5);
    obj.nivelMagiaConhecLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.nivelMagiaConhecLabel);
    obj.label1:setWidth(55);
    obj.label1:setHeight(25);
    obj.label1:setField("nivelMagiaConhec");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "formatFloat",  "0.## ");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Gray");
    obj.label1:setName("label1");

    obj.nivelMagiaConhecEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nivelMagiaConhecEdit:setParent(obj);
    obj.nivelMagiaConhecEdit:setField("nivelMagiaConhec");
    obj.nivelMagiaConhecEdit:setLeft(0);
    obj.nivelMagiaConhecEdit:setTop(0);
    obj.nivelMagiaConhecEdit:setWidth(55);
    obj.nivelMagiaConhecEdit:setHeight(25);
    obj.nivelMagiaConhecEdit:setType("float");
    obj.nivelMagiaConhecEdit:setName("nivelMagiaConhecEdit");
    obj.nivelMagiaConhecEdit:setVisible(false);
    obj.nivelMagiaConhecEdit:setFontSize(16);

    obj.nomeMagiaConhecLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeMagiaConhecLabel:setParent(obj);
    obj.nomeMagiaConhecLabel:setLeft(55);
    obj.nomeMagiaConhecLabel:setTop(0);
    obj.nomeMagiaConhecLabel:setWidth(189);
    obj.nomeMagiaConhecLabel:setHeight(25);
    obj.nomeMagiaConhecLabel:setColor("transparent");
    obj.nomeMagiaConhecLabel:setStrokeColor("Gray");
    obj.nomeMagiaConhecLabel:setStrokeSize(1);
    obj.nomeMagiaConhecLabel:setName("nomeMagiaConhecLabel");
    obj.nomeMagiaConhecLabel:setVisible(true);
    obj.nomeMagiaConhecLabel:setCornerType("round");
    obj.nomeMagiaConhecLabel:setXradius(5);
    obj.nomeMagiaConhecLabel:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.nomeMagiaConhecLabel);
    obj.label2:setWidth(189);
    obj.label2:setHeight(25);
    obj.label2:setField("nomeMagiaConhec");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Gray");
    obj.label2:setName("label2");

    obj.nomeMagiaConhecEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeMagiaConhecEdit:setParent(obj);
    obj.nomeMagiaConhecEdit:setField("nomeMagiaConhec");
    obj.nomeMagiaConhecEdit:setLeft(55);
    obj.nomeMagiaConhecEdit:setTop(0);
    obj.nomeMagiaConhecEdit:setWidth(189);
    obj.nomeMagiaConhecEdit:setHeight(25);
    obj.nomeMagiaConhecEdit:setName("nomeMagiaConhecEdit");
    obj.nomeMagiaConhecEdit:setVisible(false);
    obj.nomeMagiaConhecEdit:setFontSize(16);

    obj.botaoMagiaInfo = GUI.fromHandle(_obj_newObject("button"));
    obj.botaoMagiaInfo:setParent(obj);
    obj.botaoMagiaInfo:setName("botaoMagiaInfo");
    obj.botaoMagiaInfo:setLeft(244);
    obj.botaoMagiaInfo:setTop(1);
    obj.botaoMagiaInfo:setWidth(23);
    obj.botaoMagiaInfo:setHeight(23);
    obj.botaoMagiaInfo:setText("i");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(267);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.nivelMagiaConhecLabel:addEventListener("onClick",
        function (_)
            self.nivelMagiaConhecLabel.visible = false;
                            self.nivelMagiaConhecEdit.visible = true;
                            self.nivelMagiaConhecEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.nivelMagiaConhecEdit:addEventListener("onExit",
        function (_)
            self.nivelMagiaConhecLabel.visible = true;
                            self.nivelMagiaConhecEdit.visible = false;
        end, obj);

    obj._e_event2 = obj.nomeMagiaConhecLabel:addEventListener("onClick",
        function (_)
            self.nomeMagiaConhecLabel.visible = false;
                            self.nomeMagiaConhecEdit.visible = true;
                            self.nomeMagiaConhecEdit:setFocus();
        end, obj);

    obj._e_event3 = obj.nomeMagiaConhecEdit:addEventListener("onExit",
        function (_)
            self.nomeMagiaConhecLabel.visible = true;
                            self.nomeMagiaConhecEdit.visible = false;
        end, obj);

    obj._e_event4 = obj.botaoMagiaInfo:addEventListener("onClick",
        function (_)
            showInfoMagiaPopup();
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

        if self.nivelMagiaConhecLabel ~= nil then self.nivelMagiaConhecLabel:destroy(); self.nivelMagiaConhecLabel = nil; end;
        if self.nomeMagiaConhecEdit ~= nil then self.nomeMagiaConhecEdit:destroy(); self.nomeMagiaConhecEdit = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.nomeMagiaConhecLabel ~= nil then self.nomeMagiaConhecLabel:destroy(); self.nomeMagiaConhecLabel = nil; end;
        if self.botaoMagiaInfo ~= nil then self.botaoMagiaInfo:destroy(); self.botaoMagiaInfo = nil; end;
        if self.nivelMagiaConhecEdit ~= nil then self.nivelMagiaConhecEdit:destroy(); self.nivelMagiaConhecEdit = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMagiasConhecidas()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMagiasConhecidas();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMagiasConhecidas = {
    newEditor = newfrmMagiasConhecidas, 
    new = newfrmMagiasConhecidas, 
    name = "frmMagiasConhecidas", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMagiasConhecidas = _frmMagiasConhecidas;
Firecast.registrarForm(_frmMagiasConhecidas);

return _frmMagiasConhecidas;
