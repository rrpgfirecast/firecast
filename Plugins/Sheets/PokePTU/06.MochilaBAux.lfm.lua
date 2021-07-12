require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmConsumiveis()
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
    obj:setName("frmConsumiveis");
    obj:setHeight(25);
    obj:setWidth(285);
    obj:setMargins({top=2,bottom=2});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar esse item?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showItemPopup()
			local pop = self:findControlByName("popItem");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("left", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de items para exibir");
			end;				
		end;

		local function use()
			local mesa = Firecast.getMesaDe(sheet);

			if sheet.BarrinhaValor~=nil then
				if sheet.BarrinhaValor>= 1 then
					local vAntigo = sheet.BarrinhaValor;
					sheet.BarrinhaValor = tonumber(sheet.BarrinhaValor) - 1;
					local vNovo = sheet.BarrinhaValor;
					local nomItem = sheet.nome or "Item"
					if sheet.dados==nil then
						local texto = nomItem .. " foi usado ( " .. vAntigo .. " -> " .. vNovo .. " ).";
						mesa.activeChat:enviarMensagem(texto);
						local dado = (sheet.Roll or "");
						local rolagem = Firecast.interpretarRolagem(dado);
						if (rolagem.possuiAlgumDado) then
							mesa.activeChat:rolarDados(rolagem, nomItem)
							end

						end;
					end
				end;
			end;

		


    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#000000");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(50);
    obj.button1:setText("Usar");
    obj.button1:setMargins({right=5});
    obj.button1:setName("button1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(140);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(30);
    obj.edit2:setField("BarrinhaValor");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setMargins({right=3, left=3});
    obj.edit2:setName("edit2");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setAlign("right");
    obj.button2:setText("i");
    obj.button2:setWidth(25);
    obj.button2:setMargins({right=5});
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setAlign("right");
    obj.button3:setText("X");
    obj.button3:setWidth(25);
    obj.button3:setName("button3");

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

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            showItemPopup()
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (_)
            askForDelete()
        end, obj);

    function obj:_releaseEvents()
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

        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmConsumiveis()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmConsumiveis();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmConsumiveis = {
    newEditor = newfrmConsumiveis, 
    new = newfrmConsumiveis, 
    name = "frmConsumiveis", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmConsumiveis = _frmConsumiveis;
Firecast.registrarForm(_frmConsumiveis);

return _frmConsumiveis;
