require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmVehicleSelect()
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
    obj:setName("frmVehicleSelect");
    obj:setWidth(180);
    obj:setHeight(30);
    obj:setTheme("dark");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj);
    obj.button1:setWidth(30);
    obj.button1:setHeight(30);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(30);
    obj.rectangle1:setWidth(85);
    obj.rectangle1:setHeight(30);
    obj.rectangle1:setColor("#808080");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setHitTest(false);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(5);
    obj.label1:setWidth(75);
    obj.label1:setHeight(30);
    obj.label1:setField("nome");
    obj.label1:setName("label1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("nome");
    obj.dataLink1:setDefaultValue("Veículo");
    obj.dataLink1:setName("dataLink1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj);
    obj.button2:setLeft(115);
    obj.button2:setTop(0);
    obj.button2:setWidth(30);
    obj.button2:setHeight(30);
    obj.button2:setText("E");
    obj.button2:setName("button2");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj);
    obj.button3:setLeft(145);
    obj.button3:setTop(0);
    obj.button3:setWidth(30);
    obj.button3:setHeight(30);
    obj.button3:setText("I");
    obj.button3:setName("button3");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setField("level");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setField("tamanho");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj);
    obj.dataLink4:setFields({'precoBase','precoMult','precoMod','precoOutros','level'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj);
    obj.dataLink5:setFields({'deslBase','deslBaseViagem','deslAdd','deslMult','deslOutros','deslOutrosViagem','quebrado'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj);
    obj.dataLink6:setFields({'pilBase','pilotarAdd','pilOutros','quebrado'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj);
    obj.dataLink7:setFields({'atkBase','ataqueAdd','atkOutros'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj);
    obj.dataLink8:setFields({'caeBase','caeAdd','caeMult','caeOutros','quebrado'});
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj);
    obj.dataLink9:setFields({'cacBase','cacAdd','cacMult','cacOutros','quebrado'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj);
    obj.dataLink10:setFields({'protBase','protAdd','protMult','protOutros','quebrado'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj);
    obj.dataLink11:setFields({'pvBase','pvAdd','pvMult','pvOutros','cobertura'});
    obj.dataLink11:setName("dataLink11");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Tem certeza que quer apagar esse Veículo?",
            				function (confirmado)
            					if confirmado then
            						NDB.deleteNode(sheet);
            					end;
            			end);
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            local xml = NDB.exportXML(sheet);
            
            			local export = {};
            			local bytes = Utils.binaryEncode(export, "utf8", xml);
            
            			local stream = Utils.newMemoryStream();
            			local bytes = stream:write(export);
            
            			Dialogs.saveFile("Salvar Ficha como XML", stream, "veiculo.xml", "application/xml",
            				function()
            					stream:close();
            					showMessage("Veículo Exportado.");
            				end);
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            Dialogs.openFile("Importar Ficha", "application/xml", false, 
            				function(arquivos)
            					local arq = arquivos[1];
            
            					local import = {};
            					local bytes = arq.stream:read(import, arq.stream.size);
            
            					local xml = Utils.binaryDecode(import, "utf8");
            
            					NDB.importXML(sheet, xml);
            				end);
        end, obj);

    obj._e_event3 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local level = tonumber(sheet.level) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaMods); 
            			for i=1, #nodes, 1 do
            				nodes[i].level = level;
            			end;
            			nodes = NDB.getChildNodes(sheet.listaEquips); 
            			for i=1, #nodes, 1 do
            				nodes[i].level = level;
            			end
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local tamanho = tonumber(sheet.tamanho) or 0;
            
            			local nodes = NDB.getChildNodes(sheet.listaMods); 
            			for i=1, #nodes, 1 do
            				nodes[i].tamanho = tamanho;
            			end;
            			nodes = NDB.getChildNodes(sheet.listaEquips); 
            			for i=1, #nodes, 1 do
            				nodes[i].tamanho = tamanho;
            			end
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local level = tonumber(sheet.level) or 1;
            			local precoBase = tonumber(sheet.precoBase) or 0;
            			local precoMult = tonumber(sheet.precoMult) or 1;
            			local precoMod = tonumber(sheet.precoMod) or 0;
            			local precoOutros = tonumber(sheet.precoOutros) or 0;
            
            			sheet.preco = level * precoBase * precoMult + precoMod + precoOutros;
        end, obj);

    obj._e_event6 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local deslBase = tonumber(sheet.deslBase) or 0;
            			local deslBaseViagem = tonumber(sheet.deslBaseViagem) or 0;
            			local deslAdd = tonumber(sheet.deslAdd) or 0;
            			local deslMult = tonumber(sheet.deslMult) or 1;
            			local deslOutros = tonumber(sheet.deslOutros) or 0;
            			local deslOutrosViagem = tonumber(sheet.deslOutrosViagem) or 0;
            
            			if sheet.quebrado then deslMult = deslMult * 0.5 end;
            
            			local desl = math.floor((deslBase + deslAdd) * deslMult + deslOutros);
            			sheet.deslQuadrados = desl;
            			sheet.deslMetros = desl * 1.5;
            			sheet.deslViagem = deslBaseViagem * deslMult + deslOutrosViagem;
        end, obj);

    obj._e_event7 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local pilBase = tonumber(sheet.pilBase) or 0;
            			local pilotarAdd = tonumber(sheet.pilotarAdd) or 0;
            			local pilOutros = tonumber(sheet.pilOutros) or 0;
            
            			local pen = 0;
            			if sheet.quebrado then pen = -2 end;
            
            			sheet.pilotarPen = pilBase + pilotarAdd + pilOutros + pen;
        end, obj);

    obj._e_event8 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local atkBase = tonumber(sheet.atkBase) or 0;
            			local ataqueAdd = tonumber(sheet.ataqueAdd) or 0;
            			local atkOutros = tonumber(sheet.atkOutros) or 0;
            
            			sheet.ataquePen = atkBase + ataqueAdd + atkOutros;
        end, obj);

    obj._e_event9 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local caeBase = tonumber(sheet.caeBase) or 0;
            			local caeAdd = tonumber(sheet.caeAdd) or 0;
            			local caeMult = tonumber(sheet.caeMult) or 1;
            			local caeOutros = tonumber(sheet.caeOutros) or 0;
            
            			if sheet.quebrado then caeMult = caeMult * 0.5 end;
            
            			sheet.cae = math.floor((caeBase + caeAdd) * caeMult + caeOutros);
        end, obj);

    obj._e_event10 = obj.dataLink9:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local cacBase = tonumber(sheet.cacBase) or 0;
            			local cacAdd = tonumber(sheet.cacAdd) or 0;
            			local cacMult = tonumber(sheet.cacMult) or 1;
            			local cacOutros = tonumber(sheet.cacOutros) or 0;
            
            			if sheet.quebrado then cacMult = cacMult * 0.5 end;
            
            			sheet.cac = math.floor((cacBase + cacAdd) * cacMult + cacOutros);
        end, obj);

    obj._e_event11 = obj.dataLink10:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local protBase = tonumber(sheet.protBase) or 0;
            			local protAdd = tonumber(sheet.protAdd) or 0;
            			local protMult = tonumber(sheet.protMult) or 1;
            			local protOutros = tonumber(sheet.protOutros) or 0;
            
            			if sheet.quebrado then protMult = protMult * 0.5 end;
            
            			sheet.protecao = math.floor((protBase + protAdd) * protMult + protOutros);
        end, obj);

    obj._e_event12 = obj.dataLink11:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			local pvBase = tonumber(sheet.pvBase) or 0;
            			local pvAdd = tonumber(sheet.pvAdd) or 0;
            			local pvMult = tonumber(sheet.pvMult) or 1;
            			local pvOutros = tonumber(sheet.pvOutros) or 0;
            			local cobertura = tonumber(sheet.cobertura) or 25;
            
            			local total = math.floor((pvBase + pvAdd) * pvMult + pvOutros);
            
            			local pv = math.floor(total * (100-cobertura) / 100)
            			sheet.pv = pv;
            			sheet.pe = total - pv;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmVehicleSelect()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmVehicleSelect();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmVehicleSelect = {
    newEditor = newfrmVehicleSelect, 
    new = newfrmVehicleSelect, 
    name = "frmVehicleSelect", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmVehicleSelect = _frmVehicleSelect;
Firecast.registrarForm(_frmVehicleSelect);

return _frmVehicleSelect;
