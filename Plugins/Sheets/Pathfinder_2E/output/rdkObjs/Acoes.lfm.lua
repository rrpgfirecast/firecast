require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAcoes()
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
    obj:setName("frmAcoes");
    obj:setHeight(25);
    obj:setWidth(330);


		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar essa ação?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showAcaoInfoPopup()
			local pop = self:findControlByName("popAcaoInfo");

			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("center", self.sheet);
			else
				showMessage("Não encontrei o popup de ações para exibir.");
			end;
		end;
	    


    obj.tipoAcaoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.tipoAcaoLabel:setParent(obj);
    obj.tipoAcaoLabel:setLeft(1);
    obj.tipoAcaoLabel:setTop(0);
    obj.tipoAcaoLabel:setWidth(100);
    obj.tipoAcaoLabel:setHeight(25);
    obj.tipoAcaoLabel:setColor("transparent");
    obj.tipoAcaoLabel:setStrokeColor("Gray");
    obj.tipoAcaoLabel:setStrokeSize(1);
    obj.tipoAcaoLabel:setName("tipoAcaoLabel");
    obj.tipoAcaoLabel:setVisible(true);
    obj.tipoAcaoLabel:setCornerType("round");
    obj.tipoAcaoLabel:setXradius(5);
    obj.tipoAcaoLabel:setYradius(5);

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.tipoAcaoLabel);
    obj.label1:setWidth(100);
    obj.label1:setHeight(25);
    obj.label1:setField("tipoAcao");
    obj.label1:setFontSize(16);
    obj.label1:setVertTextAlign("center");
    obj.label1:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setFontColor("Gray");
    obj.label1:setName("label1");

    obj.tipoAcaoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.tipoAcaoEdit:setParent(obj);
    obj.tipoAcaoEdit:setField("tipoAcao");
    obj.tipoAcaoEdit:setLeft(1);
    obj.tipoAcaoEdit:setTop(0);
    obj.tipoAcaoEdit:setWidth(100);
    obj.tipoAcaoEdit:setHeight(25);
    obj.tipoAcaoEdit:setName("tipoAcaoEdit");
    obj.tipoAcaoEdit:setVisible(false);
    obj.tipoAcaoEdit:setFontSize(16);

    obj.nomeAcaoLabel = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.nomeAcaoLabel:setParent(obj);
    obj.nomeAcaoLabel:setLeft(101);
    obj.nomeAcaoLabel:setTop(0);
    obj.nomeAcaoLabel:setWidth(221);
    obj.nomeAcaoLabel:setHeight(25);
    obj.nomeAcaoLabel:setColor("transparent");
    obj.nomeAcaoLabel:setStrokeColor("Gray");
    obj.nomeAcaoLabel:setStrokeSize(1);
    obj.nomeAcaoLabel:setName("nomeAcaoLabel");
    obj.nomeAcaoLabel:setVisible(true);
    obj.nomeAcaoLabel:setCornerType("round");
    obj.nomeAcaoLabel:setXradius(5);
    obj.nomeAcaoLabel:setYradius(5);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.nomeAcaoLabel);
    obj.label2:setWidth(221);
    obj.label2:setHeight(25);
    obj.label2:setField("nomeAcao");
    obj.label2:setFontSize(16);
    obj.label2:setVertTextAlign("center");
    obj.label2:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setFontColor("Gray");
    obj.label2:setName("label2");

    obj.nomeAcaoEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.nomeAcaoEdit:setParent(obj);
    obj.nomeAcaoEdit:setField("nomeAcao");
    obj.nomeAcaoEdit:setLeft(101);
    obj.nomeAcaoEdit:setTop(0);
    obj.nomeAcaoEdit:setWidth(221);
    obj.nomeAcaoEdit:setHeight(25);
    obj.nomeAcaoEdit:setName("nomeAcaoEdit");
    obj.nomeAcaoEdit:setVisible(false);
    obj.nomeAcaoEdit:setFontSize(16);

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

    obj._e_event0 = obj.tipoAcaoLabel:addEventListener("onClick",
        function (_)
            self.tipoAcaoLabel.visible = false;
                            self.tipoAcaoEdit.visible = true;
                            self.tipoAcaoEdit:setFocus();
        end, obj);

    obj._e_event1 = obj.tipoAcaoEdit:addEventListener("onExit",
        function (_)
            self.tipoAcaoLabel.visible = true;
                            self.tipoAcaoEdit.visible = false;
        end, obj);

    obj._e_event2 = obj.nomeAcaoLabel:addEventListener("onClick",
        function (_)
            self.nomeAcaoLabel.visible = false;
                            self.nomeAcaoEdit.visible = true;
                            self.nomeAcaoEdit:setFocus();
        end, obj);

    obj._e_event3 = obj.nomeAcaoEdit:addEventListener("onExit",
        function (_)
            self.nomeAcaoLabel.visible = true;
                            self.nomeAcaoEdit.visible = false;
        end, obj);

    obj._e_event4 = obj.button1:addEventListener("onClick",
        function (_)
            showAcaoInfoPopup();
        end, obj);

    obj._e_event5 = obj.button2:addEventListener("onClick",
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

        if self.nomeAcaoEdit ~= nil then self.nomeAcaoEdit:destroy(); self.nomeAcaoEdit = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.tipoAcaoEdit ~= nil then self.tipoAcaoEdit:destroy(); self.tipoAcaoEdit = nil; end;
        if self.tipoAcaoLabel ~= nil then self.tipoAcaoLabel:destroy(); self.tipoAcaoLabel = nil; end;
        if self.nomeAcaoLabel ~= nil then self.nomeAcaoLabel:destroy(); self.nomeAcaoLabel = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAcoes()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAcoes();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAcoes = {
    newEditor = newfrmAcoes, 
    new = newfrmAcoes, 
    name = "frmAcoes", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAcoes = _frmAcoes;
Firecast.registrarForm(_frmAcoes);

return _frmAcoes;
