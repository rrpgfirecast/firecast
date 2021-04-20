require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmReactorPart()
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
    obj:setName("frmReactorPart");
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
			local pop = self:findControlByName("reactorPop");
				
			if pop ~= nil then
				pop:setNodeObject(self.sheet);
				pop:showPopupEx("bottomCenter", self);
			else
				showMessage("Ops, bug.. nao encontrei o popup para exibir");
			end;				
		end;
		


    obj.reator = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.reator:setParent(obj);
    obj.reator:setAlign("client");
    obj.reator:setField("reator");
    obj.reator:setName("reator");
    obj.reator:setMargins({top=1,bottom=1});
    obj.reator:setValues({});
    obj.reator:setItems({});

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
    obj.dataLink1:setField("tamanho");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("reator");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("pf");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setField("une");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setField("blocos");
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

    obj._e_event2 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
                        local tamanho = tonumber(sheet.tamanho) or 1;
                        local reator = (tonumber(sheet.reator) or 1);
            
                        local items = {'Micron Leve', 'Micron Pesado', 'Micron Ultra', 'Arcus Leve', 'Pulso Marrom', 'Pulso Preto', 'Pulso Branco', 'Pulso Cinza', 'Arcus Pesado', 'Pulso Verde', 'Pulso Vermelho', 'Pulso Azul', 'Arcus Ultra', 'Arcus Máximo', 'Pulso Laranja', 'Pulso Prismático', 'Nova Leve', 'Nova Pesado', 'Nova Ultra', 'Portal Leve', 'Portal Pesado', 'Portal Ultra'};
                        local values = {'1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17','18','19','20','21','22'};
            
                        local current = items[reator];
            
                        if tamanho == 1 then
                        	-- Mn
                        	items = {'Micron Leve', 'Micron Pesado', 'Micron Ultra', 'Arcus Leve', 'Pulso Marrom', 'Pulso Preto', 'Pulso Branco', 'Pulso Cinza', 'Arcus Pesado', 'Pulso Verde', 'Pulso Vermelho', 'Pulso Azul'};
                        	values = {'1','2','3','4','5','6','7','8','9','10','11','12'};
                        elseif tamanho==2 then
                        	-- P
                        	items = {'Arcus Leve', 'Pulso Marrom', 'Pulso Preto', 'Pulso Branco', 'Pulso Cinza', 'Arcus Pesado', 'Pulso Verde', 'Pulso Vermelho', 'Pulso Azul', 'Arcus Ultra', 'Arcus Máximo', 'Pulso Laranja', 'Pulso Prismático'};
                        	values = {'4','5','6','7','8','9','10','11','12','13','14','15','16'};
                        elseif tamanho==3 then
                        	-- M
                        	items = {'Pulso Cinza', 'Arcus Pesado', 'Pulso Verde', 'Pulso Vermelho', 'Pulso Azul', 'Arcus Ultra', 'Arcus Máximo', 'Pulso Laranja', 'Pulso Prismático', 'Nova Leve', 'Nova Pesado', 'Nova Ultra'};
                        	values = {'8','9','10','11','12','13','14','15','16','17','18','19'};
                        elseif tamanho==4 then
                        	-- G
                        	items = {'Arcus Ultra', 'Arcus Máximo', 'Pulso Laranja', 'Pulso Prismático', 'Nova Leve', 'Nova Pesado', 'Nova Ultra', 'Portal Leve', 'Portal Pesado', 'Portal Ultra'};
                        	values = {'13','14','15','16','17','18','19','20','21','22'};
                        elseif tamanho==5 then
                        	 -- E
                        	items = {'Nova Leve', 'Nova Pesado', 'Nova Ultra', 'Portal Leve', 'Portal Pesado', 'Portal Ultra'};
                        	values = {'17','18','19','20','21','22'};
                        elseif tamanho>=6then
                        	-- I or C
                        	items = {'Portal Leve', 'Portal Pesado', 'Portal Ultra'};
                        	values = {'20','21','22'};
                        end;
            
                        self.reator.items = items;
            			self.reator.values = values;
            
                        self.reator.text = current;
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
                    	local reator = (tonumber(sheet.reator) or 1);
            
                    	local pf = {4,6,8,7,9,12,14,10,13,15,17,20,15,20,25,30,15,20,30,30,40,50};
                    	local une = {50,70,80,75,90,120,140,100,130,150,175,200,150,200,250,300,150,200,300,300,400,500};
                    	local blocos = {2,6,12,18,23,30,35,55,72,83,94,110,450,600,750,900,6750,9000,13500,153600,204800,256000};
                    	local tripMin = {0,0,0,1,2,3,4,2,3,5,7,9,20,30,40,50,60,90,120,150,200,250};
                    	local tripMax = {1,2,4,5,10,15,20,10,15,25,35,45,100,150,200,250,300,450,600,750,1000,1250};
            
                    	sheet.pf = pf[reator];
                    	sheet.une = une[reator];
                    	sheet.blocos = blocos[reator];
                    	sheet.tripMin = tripMin[reator];
                    	sheet.tripMax = tripMax[reator];
                    	sheet.tripTipo = "Engenheiro";
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local pf = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.listaReatores); 
                        for i=1, #nodes, 1 do
                            pf = pf + (tonumber(nodes[i].pf) or 0);
                        end;
            
                        node.reator_pf = pf;
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local une = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.listaReatores); 
                        for i=1, #nodes, 1 do
                            une = une + (tonumber(nodes[i].une) or 0);
                        end;
            
                        node.energiaMax = une;
        end, obj);

    obj._e_event6 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local blocos = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.listaReatores); 
                        for i=1, #nodes, 1 do
                            blocos = blocos + (tonumber(nodes[i].blocos) or 0);
                        end;
            
                        node.reator_blocos = blocos;
        end, obj);

    obj._e_event7 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local tripMin = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.listaReatores); 
                        for i=1, #nodes, 1 do
                            tripMin = tripMin + (tonumber(nodes[i].tripMin) or 0);
                        end;
            
                        node.reator_tripMin = tripMin;
        end, obj);

    obj._e_event8 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local tripMax = 0;
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.listaReatores); 
                        for i=1, #nodes, 1 do
                            tripMax = tripMax + (tonumber(nodes[i].tripMax) or 0);
                        end;
            
                        node.reator_tripMax = tripMax;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.reator ~= nil then self.reator:destroy(); self.reator = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmReactorPart()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmReactorPart();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmReactorPart = {
    newEditor = newfrmReactorPart, 
    new = newfrmReactorPart, 
    name = "frmReactorPart", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmReactorPart = _frmReactorPart;
Firecast.registrarForm(_frmReactorPart);

return _frmReactorPart;
