require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister7A_svg()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmFichaRPGmeister7A_svg");
    obj:setWidth(465);
    obj:setHeight(25);
    obj:setTheme("dark");
    obj:setMargins({top=1});

			
		local function askForDelete()
			dialogs.confirmYesNo("Deseja realmente apagar essa arma?",
								 function (confirmado)
									if confirmado then
										ndb.deleteNode(sheet);
									end;
								 end);
		end;

		local function showArmaPopup()
			local pop = self:findControlByName("popArma");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("bottomCenter", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup de arma para exibir");
			end;				
		end;

		local function getNumber(text)
			local mod = "0";
			if text~= nil then
				mod = string.gsub(text, "%.", "");
				mod = string.gsub(mod, "k", "000");
				mod = string.gsub(mod, "K", "");
				mod = string.gsub(mod, "g", "");
				mod = string.gsub(mod, "P", "");
				mod = string.gsub(mod, "p", "");
				mod = string.gsub(mod, "O", "");
				mod = string.gsub(mod, "o", "");
				mod = string.gsub(mod, "X", "");
				mod = string.gsub(mod, "x", "");
				mod = string.gsub(mod, " ", "");
				mod = string.gsub(mod, ",", ".");
			end
			return tonumber(mod);
		end;

		local function weaponPrice()
			if sheet~= nil then
				local node = ndb.getRoot(sheet);
				local mod = 0;
				local nodes = ndb.getChildNodes(node.campoDasArmas); 
				for i=1, #nodes, 1 do
					mod = mod + (getNumber(nodes[i].preco) or 0);
				end
				mod = string.gsub(mod, "%.", "_");
				while true do  
					mod, k = string.gsub(mod, "^(-?%d+)(%d%d%d)", '%1,%2')
					if (k==0) then
						break
					end
				end
				mod = string.gsub(mod, ",", ".");
				mod = string.gsub(mod, "_", ",");
				node.precoArmas = mod .. "PO";
			end;
		end;

		local function weaponWeight()
			if sheet~= nil then
				local node = ndb.getRoot(sheet);
				local mod = 0;
				local nodes = ndb.getChildNodes(node.campoDasArmas); 
				for i=1, #nodes, 1 do
					mod = mod + (getNumber(nodes[i].peso) or 0);
				end
				mod = string.gsub(mod, "%.", "_");
				while true do  
					mod, k = string.gsub(mod, "^(-?%d+)(%d%d%d)", '%1,%2')
					if (k==0) then
						break
					end
				end
				mod = string.gsub(mod, ",", ".");
				mod = string.gsub(mod, "_", ",");
				node.pesoArmas = mod .. "Kg";
			end;
		end;
		local function createName()
			if sheet~= nil then
				local name = "";
				if (sheet.arma ~= nil) then
					name = name .. sheet.arma;
				end;
				if (sheet.tamanho ~= nil and sheet.tamanho ~="médio" and sheet.tamanho ~="medio" and sheet.tamanho ~="Médio" and sheet.tamanho ~="Medio" and sheet.tamanho ~="média" and sheet.tamanho ~="media" and sheet.tamanho ~="Média" and sheet.tamanho ~="Media") then
					name = name .. " " .. sheet.tamanho;
				end;
				if (sheet.material ~= nil) then
					name = name .. " de " .. sheet.material;
				end;
				if (sheet.qualidade ~= nil) then
					name = name .. " " .. sheet.qualidade;
				end;
				if (sheet.efeitos ~= nil) then
					name = name .. " " .. sheet.efeitos;
				end;
				if (sheet.batismo ~= nil) then
					name = name .. ": " .. sheet.batismo;
				end;
				sheet.nome = name;
			end;
		end;
		


    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(1);
    obj.edit1:setWidth(245);
    obj.edit1:setHeight(23);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(245);
    obj.edit2:setTop(1);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(23);
    obj.edit2:setField("peso");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(295);
    obj.edit3:setTop(1);
    obj.edit3:setWidth(75);
    obj.edit3:setHeight(23);
    obj.edit3:setField("preco");
    obj.edit3:setName("edit3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setLeft(370);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(395);
    obj.button2:setTop(1);
    obj.button2:setWidth(23);
    obj.button2:setHeight(23);
    obj.button2:setText("N");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(420);
    obj.button3:setTop(1);
    obj.button3:setWidth(23);
    obj.button3:setHeight(23);
    obj.button3:setText("X");
    obj.button3:setName("button3");

    obj._e_event0 = obj.edit2:addEventListener("onUserChange",
        function (self)
            weaponWeight();
        end, obj);

    obj._e_event1 = obj.edit3:addEventListener("onUserChange",
        function (self)
            weaponPrice();
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (self)
            showArmaPopup();
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            createName();
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            askForDelete();
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
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister7A_svg = {
    newEditor = newfrmFichaRPGmeister7A_svg, 
    new = newfrmFichaRPGmeister7A_svg, 
    name = "frmFichaRPGmeister7A_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister7A_svg = _frmFichaRPGmeister7A_svg;
rrpg.registrarForm(_frmFichaRPGmeister7A_svg);

return _frmFichaRPGmeister7A_svg;
