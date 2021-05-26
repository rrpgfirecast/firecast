require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmGerenciador02_ESTACAO()
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
    obj:setName("frmGerenciador02_ESTACAO");
    obj:setWidth(110);
    obj:setHeight(25);
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(30);
    obj.edit1:setHeight(25);
    obj.edit1:setField("ordem");
    obj.edit1:setType("number");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(30);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(105);
    obj.edit2:setHeight(25);
    obj.edit2:setField("estacao");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(135);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(35);
    obj.edit3:setHeight(25);
    obj.edit3:setField("dias");
    obj.edit3:setType("number");
    obj.edit3:setName("edit3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(170);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("i");
    obj.button1:setHint("Detalhes da Estação");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(195);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setField("dias");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setField("temperatura");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle1);
    obj.dataLink3:setField("chuvas");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle1);
    obj.dataLink4:setField("ventos");
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle1);
    obj.dataLink5:setField("areia");
    obj.dataLink5:setName("dataLink5");

    obj._e_event0 = obj.edit1:addEventListener("onChange",
        function (_)
            local rcl = self:findControlByName("rclEstacoes");
            				if rcl~= nil then
            					rcl:sort();
            				end;
        end, obj);

    obj._e_event1 = obj.button1:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popClima");
            				
            				if pop ~= nil then
            					pop:setNodeObject(self.sheet);
            					pop:showPopupEx("bottomCenter", self);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup de climas para exibir");
            				end;
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            dialogs.confirmOkCancel("Tem certeza que quer apagar esse mês?",
            					function (confirmado)
            						if confirmado then
            							ndb.deleteNode(sheet);
            						end;
            				end);
        end, obj);

    obj._e_event3 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local node = ndb.getRoot(sheet);
            					local mod = 0;
            					local nodes = ndb.getChildNodes(node.listaEstacoes); 
            					for i=1, #nodes, 1 do
            						nodes[i].cumulativo = mod;
            						mod = mod + (tonumber(nodes[i].dias) or 0);
            					end
            					node.duracaoEstacao = mod;
            				end;
        end, obj);

    obj._e_event4 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				if sheet.temperatura ~= "Personalizado" then
            					sheet.temperaturaChance_1 = 5;
            					sheet.temperaturaChance_2 = 20;
            					sheet.temperaturaChance_3 = 50;
            					sheet.temperaturaChance_4 = 20;
            					sheet.temperaturaChance_5 = 5;
            					sheet.temperaturaMM_1 = 1;
            					sheet.temperaturaMM_2 = 2;
            					sheet.temperaturaMM_3 = 3;
            					sheet.temperaturaMM_4 = 4;
            					sheet.temperaturaMM_5 = 5;
            				end;
            
            				if sheet.temperatura == "Infernal" then
            					sheet.temperatura_1 = 31;
            					sheet.temperatura_2 = 35;
            					sheet.temperatura_3 = 41;
            					sheet.temperatura_4 = 49;
            					sheet.temperatura_5 = 57;
            					sheet.temperaturaVar_1 = 4;
            					sheet.temperaturaVar_2 = 6;
            					sheet.temperaturaVar_3 = 8;
            					sheet.temperaturaVar_4 = 8;
            					sheet.temperaturaVar_5 = 8;
            				elseif sheet.temperatura == "Quente" then
            					sheet.temperatura_1 = 25;
            					sheet.temperatura_2 = 27;
            					sheet.temperatura_3 = 29;
            					sheet.temperatura_4 = 33;
            					sheet.temperatura_5 = 39;
            					sheet.temperaturaVar_1 = 2;
            					sheet.temperaturaVar_2 = 2;
            					sheet.temperaturaVar_3 = 4;
            					sheet.temperaturaVar_4 = 6;
            					sheet.temperaturaVar_5 = 6;
            				elseif sheet.temperatura == "Morno" then
            					sheet.temperatura_1 = 20;
            					sheet.temperatura_2 = 22;
            					sheet.temperatura_3 = 24;
            					sheet.temperatura_4 = 26;
            					sheet.temperatura_5 = 30;
            					sheet.temperaturaVar_1 = 3;
            					sheet.temperaturaVar_2 = 2;
            					sheet.temperaturaVar_3 = 2;
            					sheet.temperaturaVar_4 = 4;
            					sheet.temperaturaVar_5 = 6;
            				elseif sheet.temperatura == "Temperado" then
            					sheet.temperatura_1 = 10;
            					sheet.temperatura_2 = 14;
            					sheet.temperatura_3 = 18;
            					sheet.temperatura_4 = 22;
            					sheet.temperatura_5 = 26;
            					sheet.temperaturaVar_1 = 4;
            					sheet.temperaturaVar_2 = 4;
            					sheet.temperaturaVar_3 = 4;
            					sheet.temperaturaVar_4 = 4;
            					sheet.temperaturaVar_5 = 4;
            				elseif sheet.temperatura == "Frio" then
            					sheet.temperatura_1 = -31;
            					sheet.temperatura_2 = -23;
            					sheet.temperatura_3 = -15;
            					sheet.temperatura_4 = -7;
            					sheet.temperatura_5 = 1;
            					sheet.temperaturaVar_1 = 8;
            					sheet.temperaturaVar_2 = 8;
            					sheet.temperaturaVar_3 = 8;
            					sheet.temperaturaVar_4 = 8;
            					sheet.temperaturaVar_5 = 8;
            				elseif sheet.temperatura == "Glacial" then
            					sheet.temperatura_1 = -46;
            					sheet.temperatura_2 = -36;
            					sheet.temperatura_3 = -26;
            					sheet.temperatura_4 = -16;
            					sheet.temperatura_5 = -6;
            					sheet.temperaturaVar_1 = 10;
            					sheet.temperaturaVar_2 = 10;
            					sheet.temperaturaVar_3 = 10;
            					sheet.temperaturaVar_4 = 10;
            					sheet.temperaturaVar_5 = 10;
            				end;
        end, obj);

    obj._e_event5 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				if sheet.chuvas == "Nenhuma" then
            					sheet.chuvaChance_1 = 100;
            					sheet.chuvaChance_2 = 0;
            					sheet.chuvaChance_3 = 0;
            					sheet.chuvaChance_4 = 0;
            					sheet.chuvaChance_5 = 0;
            					sheet.chuvaChance_6 = 0;
            				elseif sheet.chuvas == "Pouca" then
            					sheet.chuvaChance_1 = 90;
            					sheet.chuvaChance_2 = 3;
            					sheet.chuvaChance_3 = 3;
            					sheet.chuvaChance_4 = 3;
            					sheet.chuvaChance_5 = 1;
            					sheet.chuvaChance_6 = 0;
            				elseif sheet.chuvas == "Razoável" then
            					sheet.chuvaChance_1 = 80;
            					sheet.chuvaChance_2 = 6;
            					sheet.chuvaChance_3 = 6;
            					sheet.chuvaChance_4 = 5;
            					sheet.chuvaChance_5 = 2;
            					sheet.chuvaChance_6 = 1;
            				elseif sheet.chuvas == "Muita" then
            					sheet.chuvaChance_1 = 60;
            					sheet.chuvaChance_2 = 13;
            					sheet.chuvaChance_3 = 10;
            					sheet.chuvaChance_4 = 9;
            					sheet.chuvaChance_5 = 5;
            					sheet.chuvaChance_6 = 3;
            				elseif sheet.chuvas == "Constante" then
            					sheet.chuvaChance_1 = 0;
            					sheet.chuvaChance_2 = 10;
            					sheet.chuvaChance_3 = 35;
            					sheet.chuvaChance_4 = 35;
            					sheet.chuvaChance_5 = 15;
            					sheet.chuvaChance_6 = 5;
            				end;
        end, obj);

    obj._e_event6 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				if sheet.ventos == "Nenhuma" then
            					sheet.ventosChance_1 = 100;
            					sheet.ventosChance_2 = 0;
            					sheet.ventosChance_3 = 0;
            					sheet.ventosChance_4 = 0;
            					sheet.ventosChance_5 = 0;
            					sheet.ventosChance_6 = 0;
            					sheet.ventosChance_7 = 0;
            					sheet.ventosChance_8 = 0;
            				elseif sheet.ventos == "Pouco" then
            					sheet.ventosChance_1 = 0;
            					sheet.ventosChance_2 = 89;
            					sheet.ventosChance_3 = 10;
            					sheet.ventosChance_4 = 1;
            					sheet.ventosChance_5 = 0;
            					sheet.ventosChance_6 = 0;
            					sheet.ventosChance_7 = 0;
            					sheet.ventosChance_8 = 0;
            				elseif sheet.ventos == "Razoável" then
            					sheet.ventosChance_1 = 0;
            					sheet.ventosChance_2 = 70;
            					sheet.ventosChance_3 = 15;
            					sheet.ventosChance_4 = 10;
            					sheet.ventosChance_5 = 4;
            					sheet.ventosChance_6 = 1;
            					sheet.ventosChance_7 = 0;
            					sheet.ventosChance_8 = 0;
            				elseif sheet.ventos == "Muito" then
            					sheet.ventosChance_1 = 0;
            					sheet.ventosChance_2 = 50;
            					sheet.ventosChance_3 = 20;
            					sheet.ventosChance_4 = 10;
            					sheet.ventosChance_5 = 10;
            					sheet.ventosChance_6 = 5;
            					sheet.ventosChance_7 = 4;
            					sheet.ventosChance_8 = 1;
            				elseif sheet.ventos == "Constante" then
            					sheet.ventosChance_1 = 0;
            					sheet.ventosChance_2 = 25;
            					sheet.ventosChance_3 = 25;
            					sheet.ventosChance_4 = 15;
            					sheet.ventosChance_5 = 15;
            					sheet.ventosChance_6 = 10;
            					sheet.ventosChance_7 = 8;
            					sheet.ventosChance_8 = 2;
            				end;
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				if sheet.areia == "Nenhuma" then
            					sheet.areiaMin = 9;
            				elseif sheet.areia == "Pouca" then
            					sheet.areiaMin = 6;
            				elseif sheet.areia == "Razoável" then
            					sheet.areiaMin = 5;
            				elseif sheet.areia == "Muita" then
            					sheet.areiaMin = 4;
            				elseif sheet.areia == "Constante" then
            					sheet.areiaMin = 3;
            				end;
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmGerenciador02_ESTACAO()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmGerenciador02_ESTACAO();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmGerenciador02_ESTACAO = {
    newEditor = newfrmGerenciador02_ESTACAO, 
    new = newfrmGerenciador02_ESTACAO, 
    name = "frmGerenciador02_ESTACAO", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador02_ESTACAO = _frmGerenciador02_ESTACAO;
Firecast.registrarForm(_frmGerenciador02_ESTACAO);

return _frmGerenciador02_ESTACAO;
