require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmFichaRPGmeister6ES_svg()
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
    obj:setName("frmFichaRPGmeister6ES_svg");
    obj:setWidth(150);
    obj:setHeight(40);
    obj:setTheme("dark");
    obj:setMargins({top=3});


		local function use()
			local mesa = Firecast.getMesaDe(sheet);

			local texto = (sheet.nome or "Equipamento") .. " foi usado.";
			if sheet.cd~=nil then
				texto = texto .. " CD: " .. sheet.cd .. ".";
			end;
			
			if sheet.dados~=nil then
				local rolagem = Firecast.interpretarRolagem(sheet.dados);
				
				mesa.activeChat:rolarDados(rolagem, texto);
			end;

			if sheet.BarrinhaValor~=nil then
				sheet.BarrinhaValor = tonumber(sheet.BarrinhaValor) - 1;

				if sheet.dados==nil then
					mesa.activeChat:enviarMensagem(texto);
				end;
			end;
		end;
	


    obj.background = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.background:setParent(obj);
    obj.background:setAlign("client");
    obj.background:setColor("#333333");
    obj.background:setHitTest(false);
    obj.background:setName("background");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("U");
    obj.button1:setName("button1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(140);
    obj.label1:setHeight(25);
    obj.label1:setField("slot");
    obj.label1:setFontSize(16);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(5);
    obj.label2:setTop(25);
    obj.label2:setWidth(140);
    obj.label2:setHeight(15);
    obj.label2:setField("nome");
    obj.label2:setFontSize(9);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj._e_event0 = obj:addEventListener("onMouseEnter",
        function (_)
            self.background.color = "#444444";
        end, obj);

    obj._e_event1 = obj:addEventListener("onMouseLeave",
        function (_)
            self.background.color = "#333333";
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            use();
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

        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.background ~= nil then self.background:destroy(); self.background = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmFichaRPGmeister6ES_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmFichaRPGmeister6ES_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmFichaRPGmeister6ES_svg = {
    newEditor = newfrmFichaRPGmeister6ES_svg, 
    new = newfrmFichaRPGmeister6ES_svg, 
    name = "frmFichaRPGmeister6ES_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister6ES_svg = _frmFichaRPGmeister6ES_svg;
Firecast.registrarForm(_frmFichaRPGmeister6ES_svg);

return _frmFichaRPGmeister6ES_svg;
