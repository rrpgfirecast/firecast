require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmVehicleMod()
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
    obj:setName("frmVehicleMod");
    obj:setWidth(465);
    obj:setHeight(25);
    obj:setTheme("dark");
    obj:setMargins({top=1});

			
		local function askForDelete()
			Dialogs.confirmYesNo("Deseja realmente apagar?",
								 function (confirmado)
									if confirmado then
										NDB.deleteNode(sheet);
									end;
								 end);
		end;

		local function showPopup()
			local pop = self:findControlByName("addPop");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("bottomCenter", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup para exibir");
			end;				
		end;
		


    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setAlign("client");
    obj.edit1:setField("nome");
    obj.edit1:setMargins({top=1,bottom=1});
    obj.edit1:setName("edit1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("right");
    obj.layout1:setWidth(50);
    obj.layout1:setName("layout1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setWidth(23);
    obj.button1:setText("i");
    obj.button1:setMargins({top=1,bottom=1});
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setAlign("right");
    obj.button2:setWidth(23);
    obj.button2:setText("X");
    obj.button2:setMargins({top=1,bottom=1});
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'level','precoPorLevel'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'tamanho','precoPorTam'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'precoLevel','precoTam','precoAdd'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'precoTotal'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setFields({'precoMult'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setFields({'deslAdd'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'deslMult'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'pilotarAdd'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'ataqueAdd'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'protAdd'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'protMult'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj);
    obj.dataLink12:setFields({'cacAdd'});
    obj.dataLink12:setName("dataLink12");

    obj.dataLink13 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj);
    obj.dataLink13:setFields({'cacMult'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj);
    obj.dataLink14:setFields({'caeAdd'});
    obj.dataLink14:setName("dataLink14");

    obj.dataLink15 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj);
    obj.dataLink15:setFields({'caeMult'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj);
    obj.dataLink16:setFields({'pvAdd'});
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj);
    obj.dataLink17:setFields({'pvMult'});
    obj.dataLink17:setName("dataLink17");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            showPopup();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local level = tonumber(sheet.level) or 1;
            			local preco = tonumber(sheet.precoPorLevel) or 0;
            
            			sheet.precoLevel = level * preco;
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local tamanho = tonumber(sheet.tamanho) or 1;
            			local preco = tonumber(sheet.precoPorTam) or 0;
            
            			sheet.precoTam = tamanho * preco;
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			sheet.precoTotal = (tonumber(sheet.precoLevel) or 0)+
            								(tonumber(sheet.precoTam) or 0)+
            								(tonumber(sheet.precoAdd) or 0);
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local preco = 0;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				preco = preco + (tonumber(nodes[i].precoTotal) or 0);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				preco = preco + (tonumber(nodes[i].precoTotal) or 0);
            			end
            			node.precoMod = preco;
        end, obj);

    obj._e_event6 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local mult = 1;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].precoMult) or 0)/100);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].precoMult) or 0)/100);
            			end
            			node.precoMult = mult;
        end, obj);

    obj._e_event7 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local desl = 0;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				desl = desl + (tonumber(nodes[i].deslAdd) or 0);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				desl = desl + (tonumber(nodes[i].deslAdd) or 0);
            			end
            			node.deslAdd = desl;
        end, obj);

    obj._e_event8 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local mult = 1;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].deslMult) or 0)/100);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].deslMult) or 0)/100);
            			end
            			node.deslMult = mult;
        end, obj);

    obj._e_event9 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local pil = 0;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				pil = pil + (tonumber(nodes[i].pilotarAdd) or 0);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				pil = pil + (tonumber(nodes[i].pilotarAdd) or 0);
            			end
            			node.pilotarAdd = pil;
        end, obj);

    obj._e_event10 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local atk = 0;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				atk = atk + (tonumber(nodes[i].ataqueAdd) or 0);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				atk = atk + (tonumber(nodes[i].ataqueAdd) or 0);
            			end
            			node.ataqueAdd = atk;
        end, obj);

    obj._e_event11 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local aux = 0;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				aux = aux + (tonumber(nodes[i].protAdd) or 0);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				aux = aux + (tonumber(nodes[i].protAdd) or 0);
            			end
            			node.protAdd = aux;
        end, obj);

    obj._e_event12 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local mult = 1;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].protMult) or 0)/100);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].protMult) or 0)/100);
            			end
            			node.protMult = mult;
        end, obj);

    obj._e_event13 = obj.dataLink12:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local aux = 0;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				aux = aux + (tonumber(nodes[i].cacAdd) or 0);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				aux = aux + (tonumber(nodes[i].cacAdd) or 0);
            			end
            			node.cacAdd = aux;
        end, obj);

    obj._e_event14 = obj.dataLink13:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local mult = 1;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].cacMult) or 0)/100);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].cacMult) or 0)/100);
            			end
            			node.cacMult = mult;
        end, obj);

    obj._e_event15 = obj.dataLink14:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local aux = 0;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				aux = aux + (tonumber(nodes[i].caeAdd) or 0);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				aux = aux + (tonumber(nodes[i].caeAdd) or 0);
            			end
            			node.caeAdd = aux;
        end, obj);

    obj._e_event16 = obj.dataLink15:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local mult = 1;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].caeMult) or 0)/100);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].caeMult) or 0)/100);
            			end
            			node.caeMult = mult;
        end, obj);

    obj._e_event17 = obj.dataLink16:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local aux = 0;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				aux = aux + (tonumber(nodes[i].pvAdd) or 0);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				aux = aux + (tonumber(nodes[i].pvAdd) or 0);
            			end
            			node.pvAdd = aux;
        end, obj);

    obj._e_event18 = obj.dataLink17:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			local node = NDB.getParent(NDB.getParent(sheet));
            
            			local mult = 1;
            			local nodes = NDB.getChildNodes(node.listaMods); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].pvMult) or 0)/100);
            			end
            			local nodes = NDB.getChildNodes(node.listaEquips); 
            			for i=1, #nodes, 1 do
            				mult = mult + ((tonumber(nodes[i].pvMult) or 0)/100);
            			end
            			node.pvMult = mult;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
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

        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmVehicleMod()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmVehicleMod();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmVehicleMod = {
    newEditor = newfrmVehicleMod, 
    new = newfrmVehicleMod, 
    name = "frmVehicleMod", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmVehicleMod = _frmVehicleMod;
Firecast.registrarForm(_frmVehicleMod);

return _frmVehicleMod;
