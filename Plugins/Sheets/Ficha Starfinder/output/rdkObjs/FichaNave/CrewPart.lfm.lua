require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmCrewPart()
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
    obj:setName("frmCrewPart");
    obj:setWidth(500);
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

        function recursiveEnumPersonagensEmBibItem(bibItem, dest, tipo)
            if bibItem.tipo == "personagem" and tipo == "PJs" then
                if bibItem.loginDono ~= nil and bibItem.loginDono ~= "" then
                    dest[#dest + 1] = bibItem;
                end;
            elseif bibItem.tipo == "personagem" and tipo == "PdMs" then
                if (bibItem.loginDono == nil) or (bibItem.loginDono == "") then
                    dest[#dest + 1] = bibItem;
                end;
            else
                local filhos = bibItem.filhos;
                
                for i = 1, #filhos, 1 do
                    recursiveEnumPersonagensEmBibItem(filhos[i], dest, tipo);
                end;
            end;
        end;

        function self.listAllCharacters(tipo)
            local mesa = Firecast.getMesaDe(sheet);

            local personagens = {};
            recursiveEnumPersonagensEmBibItem(mesa.biblioteca, personagens, tipo);
            
            table.sort(personagens,
                function(left, right)
                    return Utils.compareStringPtBr(left.nome, right.nome) < 0;
                end);
                
            local nomes = {};
            local valores = {};
            
            nomes[1] = "-";
            valores[1] = "0";
            local current = tonumber(sheet.ficha);
            local nome = "";
            
            for i = 1, #personagens, 1 do
                nomes[#nomes + 1] = personagens[i].nome;
                valores[#valores + 1] = tostring(personagens[i].codigoInterno);
                if personagens[i].codigoInterno == current then
                    nome = personagens[i].nome;
                end;
            end;
            
            self.fichaComboBox.items = nomes;
            self.fichaComboBox.values = valores;

            if nome ~= "" then
                sheet.ficha = current;
                self.fichaComboBox.text = nome;
            end;
        end;
        


    obj.funcao = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.funcao:setParent(obj);
    obj.funcao:setAlign("left");
    obj.funcao:setWidth(100);
    obj.funcao:setField("funcao");
    obj.funcao:setName("funcao");
    obj.funcao:setMargins({top=1,bottom=1});
    obj.funcao:setItems({'Capitão','Artilheiro','Engenheiro','Oficial','Piloto','Médico','Outro'});
    obj.funcao:setValues({'1','2','3','4','5','6','7'});

    obj.tipo = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.tipo:setParent(obj);
    obj.tipo:setAlign("left");
    obj.tipo:setWidth(75);
    obj.tipo:setField("tipo");
    obj.tipo:setName("tipo");
    obj.tipo:setMargins({top=1,bottom=1});
    obj.tipo:setItems({'PJ','PdM','Generico'});
    obj.tipo:setValues({'1','2','3'});

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj);
    obj.layout1:setAlign("client");
    obj.layout1:setName("layout1");

    obj.fichaComboBox = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.fichaComboBox:setParent(obj.layout1);
    obj.fichaComboBox:setAlign("client");
    obj.fichaComboBox:setField("ficha");
    obj.fichaComboBox:setName("fichaComboBox");
    obj.fichaComboBox:setMargins({top=1,bottom=1});
    obj.fichaComboBox:setItems({});
    obj.fichaComboBox:setValues({});
    obj.fichaComboBox:setVisible(false);

    obj.fichaEdit = GUI.fromHandle(_obj_newObject("edit"));
    obj.fichaEdit:setParent(obj.layout1);
    obj.fichaEdit:setAlign("client");
    obj.fichaEdit:setField("ficha");
    obj.fichaEdit:setName("fichaEdit");
    obj.fichaEdit:setMargins({top=1,bottom=1});
    obj.fichaEdit:setVisible(false);

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj);
    obj.layout2:setAlign("right");
    obj.layout2:setWidth(90);
    obj.layout2:setName("layout2");

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout2);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(20);
    obj.checkBox1:setField("boss");
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setAlign("client");
    obj.edit1:setField("qtd");
    obj.edit1:setMargins({top=1,bottom=1});
    obj.edit1:setName("edit1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setAlign("right");
    obj.button1:setWidth(23);
    obj.button1:setText("X");
    obj.button1:setMargins({top=1,bottom=1});
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setField("tipo");
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'funcao','qtd'});
    obj.dataLink2:setName("dataLink2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            askForDelete();
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
                        local tipo = tonumber(sheet.tipo) or 0;
            
                        if tipo == 1 then
                            self.fichaComboBox.visible = true;
                            self.fichaEdit.visible = false;
                            self.listAllCharacters("PJs");
                        elseif tipo == 2 then
                            self.fichaComboBox.visible = true;
                            self.fichaEdit.visible = false;
                            self.listAllCharacters("PdMs");
                        elseif tipo == 3 then
                            self.fichaComboBox.visible = false;
                            self.fichaEdit.visible = true;
                        end;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
                        local trips = {0,0,0,0,0,0,0};
                        local node = NDB.getParent(NDB.getParent(sheet));
            
                        local nodes = NDB.getChildNodes(node.listaTripulantes); 
                        for i=1, #nodes, 1 do
                            local funcao = tonumber(nodes[i].funcao) or 0;
                            local qtd = tonumber(nodes[i].qtd) or 0;
            
                            if funcao >= 1 and funcao <= 7 then
                                trips[funcao] = trips[funcao] + qtd;
                            end;
                        end;
            
                        node.trip_atual1 = trips[1];
                        node.trip_atual2 = trips[2];
                        node.trip_atual3 = trips[3];
                        node.trip_atual4 = trips[4];
                        node.trip_atual5 = trips[5];
                        node.trip_atual6 = trips[6];
                        node.trip_atual7 = trips[7];
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

        if self.funcao ~= nil then self.funcao:destroy(); self.funcao = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.tipo ~= nil then self.tipo:destroy(); self.tipo = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.fichaComboBox ~= nil then self.fichaComboBox:destroy(); self.fichaComboBox = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.fichaEdit ~= nil then self.fichaEdit:destroy(); self.fichaEdit = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmCrewPart()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmCrewPart();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmCrewPart = {
    newEditor = newfrmCrewPart, 
    new = newfrmCrewPart, 
    name = "frmCrewPart", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmCrewPart = _frmCrewPart;
Firecast.registrarForm(_frmCrewPart);

return _frmCrewPart;
