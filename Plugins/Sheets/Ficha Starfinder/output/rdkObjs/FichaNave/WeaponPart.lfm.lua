require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmWeaponPart()
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
    obj:setName("frmWeaponPart");
    obj:setWidth(400);
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
			local pop = self:findControlByName("weaponPop");
				
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

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setAlign("right");
    obj.edit2:setWidth(50);
    obj.edit2:setText("Dano");
    obj.edit2:setField("dano");
    obj.edit2:setMargins({top=1,bottom=1});
    obj.edit2:setName("edit2");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("right");
    obj.layout1:setWidth(125);
    obj.layout1:setMargins({top=1,bottom=1});
    obj.layout1:setName("layout1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setField("categoria");
    obj.comboBox1:setWidth(75);
    obj.comboBox1:setItems({'-','Pessoal','Leve','Pesada','Capital'});
    obj.comboBox1:setValues({'0','1','2','3','4'});
    obj.comboBox1:setName("comboBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setWidth(23);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setAlign("right");
    obj.button2:setWidth(23);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("tripTipo");
    obj.dataLink1:setDefaultValue("Artilheiro");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("pf");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("une");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("blocos");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("categoria");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setField("tripMin");
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setField("tripMax");
    obj.dataLink7:setName("dataLink7");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            showPopup();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local pf = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.campoProa); 
                        for i=1, #nodes, 1 do
                            pf = pf + (tonumber(nodes[i].pf) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoPopa); 
                        for i=1, #nodes, 1 do
                            pf = pf + (tonumber(nodes[i].pf) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoBombordo); 
                        for i=1, #nodes, 1 do
                            pf = pf + (tonumber(nodes[i].pf) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoEstibordo); 
                        for i=1, #nodes, 1 do
                            pf = pf + (tonumber(nodes[i].pf) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoTorreta); 
                        for i=1, #nodes, 1 do
                            pf = pf + (tonumber(nodes[i].pf) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoAntipessoal); 
                        for i=1, #nodes, 1 do
                            pf = pf + (tonumber(nodes[i].pf) or 0);
                        end;
            
                        node.weapon_pf = pf;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local une = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.campoProa); 
                        for i=1, #nodes, 1 do
                            une = une + (tonumber(nodes[i].une) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoPopa); 
                        for i=1, #nodes, 1 do
                            une = une + (tonumber(nodes[i].une) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoBombordo); 
                        for i=1, #nodes, 1 do
                            une = une + (tonumber(nodes[i].une) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoEstibordo); 
                        for i=1, #nodes, 1 do
                            une = une + (tonumber(nodes[i].une) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoTorreta); 
                        for i=1, #nodes, 1 do
                            une = une + (tonumber(nodes[i].une) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoAntipessoal); 
                        for i=1, #nodes, 1 do
                            une = une + (tonumber(nodes[i].une) or 0);
                        end;
            
                        node.weapon_une = une;
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local blocos = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.campoProa); 
                        for i=1, #nodes, 1 do
                            blocos = blocos + ((tonumber(nodes[i].blocos) or 0) * (tonumber(nodes[i].qtd) or 1));
                        end;
                        local nodes = NDB.getChildNodes(node.campoPopa); 
                        for i=1, #nodes, 1 do
                            blocos = blocos + ((tonumber(nodes[i].blocos) or 0) * (tonumber(nodes[i].qtd) or 1));
                        end;
                        local nodes = NDB.getChildNodes(node.campoBombordo); 
                        for i=1, #nodes, 1 do
                            blocos = blocos + ((tonumber(nodes[i].blocos) or 0) * (tonumber(nodes[i].qtd) or 1));
                        end;
                        local nodes = NDB.getChildNodes(node.campoEstibordo); 
                        for i=1, #nodes, 1 do
                            blocos = blocos + ((tonumber(nodes[i].blocos) or 0) * (tonumber(nodes[i].qtd) or 1));
                        end;
                        local nodes = NDB.getChildNodes(node.campoTorreta); 
                        for i=1, #nodes, 1 do
                            blocos = blocos + ((tonumber(nodes[i].blocos) or 0) * (tonumber(nodes[i].qtd) or 1));
                        end;
                        local nodes = NDB.getChildNodes(node.campoAntipessoal); 
                        for i=1, #nodes, 1 do
                            blocos = blocos + ((tonumber(nodes[i].blocos) or 0) * (tonumber(nodes[i].qtd) or 1));
                        end;
            
                        node.weapon_blocos = blocos;
        end, obj);

    obj._e_event5 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
                        local categoria = tonumber(sheet.categoria) or 0;
            
                        sheet.tripMin = 0;
            
                        if categoria == 1 or categoria == 2 then
                            sheet.tripMax = 1;
                        elseif categoria == 3 then
                            sheet.tripMax = 5;
                        elseif categoria == 4 then
                            sheet.tripMax = 25;
                        else
                            sheet.tripMax = 0;
                        end;
        end, obj);

    obj._e_event6 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local tripMin = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.campoProa); 
                        for i=1, #nodes, 1 do
                            tripMin = tripMin + (tonumber(nodes[i].tripMin) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoPopa); 
                        for i=1, #nodes, 1 do
                            tripMin = tripMin + (tonumber(nodes[i].tripMin) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoBombordo); 
                        for i=1, #nodes, 1 do
                            tripMin = tripMin + (tonumber(nodes[i].tripMin) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoEstibordo); 
                        for i=1, #nodes, 1 do
                            tripMin = tripMin + (tonumber(nodes[i].tripMin) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoTorreta); 
                        for i=1, #nodes, 1 do
                            tripMin = tripMin + (tonumber(nodes[i].tripMin) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoAntipessoal); 
                        for i=1, #nodes, 1 do
                            tripMin = tripMin + (tonumber(nodes[i].tripMin) or 0);
                        end;
            
                        node.weapon_tripMin = tripMin;
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local tripMax = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.campoProa); 
                        for i=1, #nodes, 1 do
                            tripMax = tripMax + (tonumber(nodes[i].tripMax) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoPopa); 
                        for i=1, #nodes, 1 do
                            tripMax = tripMax + (tonumber(nodes[i].tripMax) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoBombordo); 
                        for i=1, #nodes, 1 do
                            tripMax = tripMax + (tonumber(nodes[i].tripMax) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoEstibordo); 
                        for i=1, #nodes, 1 do
                            tripMax = tripMax + (tonumber(nodes[i].tripMax) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoTorreta); 
                        for i=1, #nodes, 1 do
                            tripMax = tripMax + (tonumber(nodes[i].tripMax) or 0);
                        end;
                        local nodes = NDB.getChildNodes(node.campoAntipessoal); 
                        for i=1, #nodes, 1 do
                            tripMax = tripMax + (tonumber(nodes[i].tripMax) or 0);
                        end;
            
                        node.weapon_tripMax = tripMax;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmWeaponPart()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmWeaponPart();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmWeaponPart = {
    newEditor = newfrmWeaponPart, 
    new = newfrmWeaponPart, 
    name = "frmWeaponPart", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmWeaponPart = _frmWeaponPart;
Firecast.registrarForm(_frmWeaponPart);

return _frmWeaponPart;
