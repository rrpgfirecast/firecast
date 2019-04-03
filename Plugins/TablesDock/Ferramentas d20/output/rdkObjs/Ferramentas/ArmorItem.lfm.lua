require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmArmorItem()
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
    obj:setName("frmArmorItem");
    obj:setHeight(50);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("top");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setVisible(true);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("left");
    obj.label1:setWidth(50);
    obj.label1:setText("Tipo");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setField("tipo");
    obj.comboBox1:setItems({'Aprimoramento','Único'});
    obj.comboBox1:setHint("Aprimoramento: Efeito com valor númerico [+1, +2, +3 e etc]. \nÚnico: efeito de arma única.");
    obj.comboBox1:setName("comboBox1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setAlign("left");
    obj.label2:setWidth(40);
    obj.label2:setText("Valor");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setAlign("left");
    obj.label3:setWidth(60);
    obj.label3:setField("preco");
    obj.label3:setHorzTextAlign("center");
    lfm_setPropAsString(obj.label3, "formatFloat",  ",0.## PO");
    obj.label3:setFontSize(10);
    obj.label3:setName("label3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.aprimoramento = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.aprimoramento:setParent(obj);
    obj.aprimoramento:setAlign("client");
    obj.aprimoramento:setColor("#212121");
    obj.aprimoramento:setVisible(true);
    obj.aprimoramento:setName("aprimoramento");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.aprimoramento);
    obj.label4:setAlign("left");
    obj.label4:setWidth(50);
    obj.label4:setText("Nome");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.aprimoramento);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(100);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.aprimoramento);
    obj.label5:setAlign("left");
    obj.label5:setWidth(50);
    obj.label5:setText("Bônus");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.aprimoramento);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(30);
    obj.edit2:setField("bonus");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.unico = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.unico:setParent(obj);
    obj.unico:setAlign("client");
    obj.unico:setColor("#212121");
    obj.unico:setVisible(false);
    obj.unico:setName("unico");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.unico);
    obj.label6:setAlign("left");
    obj.label6:setWidth(50);
    obj.label6:setText("Nome");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.unico);
    obj.edit3:setAlign("left");
    obj.edit3:setWidth(100);
    obj.edit3:setField("nome");
    obj.edit3:setName("edit3");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.unico);
    obj.label7:setAlign("left");
    obj.label7:setWidth(50);
    obj.label7:setText("Valor");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.unico);
    obj.edit4:setAlign("left");
    obj.edit4:setWidth(75);
    obj.edit4:setField("valor");
    obj.edit4:setType("number");
    obj.edit4:setName("edit4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'tipo'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj);
    obj.dataLink2:setFields({'tipo','bonus'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj);
    obj.dataLink3:setFields({'tipo','valor'});
    obj.dataLink3:setName("dataLink3");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar esse efeito?",
            					function (confirmado)
            						if confirmado then
            							NDB.deleteNode(sheet);
            						end;
            					end);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            			if sheet.tipo=="Aprimoramento" then
            				self.aprimoramento.visible = true;
            				self.unico.visible = false;
            			else
            				self.aprimoramento.visible = false;
            				self.unico.visible = true;
            			end;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			if sheet.tipo~="Aprimoramento" then return end;
            
            			local node = toolSheet;
            			local sum = 0;
            
            			local nodes = NDB.getChildNodes(node.armorList); 
            			for i=1, #nodes, 1 do
            				if sheet.tipo=="Aprimoramento" then sum = sum + (tonumber(nodes[i].bonus) or 0) end;
            			end;
            
            			node.armorBonus = sum;
            			sheet.preco = 0;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            			if sheet.tipo~="Único" then return end;
            
            			local node = toolSheet;
            			local sum = 0;
            
            			local nodes = NDB.getChildNodes(node.armorList); 
            			for i=1, #nodes, 1 do
            				if sheet.tipo=="Único" then sum = sum + (tonumber(nodes[i].valor) or 0) end;
            			end;
            
            			node.armorExtraPrice = sum;
            			sheet.preco = sum;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.unico ~= nil then self.unico:destroy(); self.unico = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.aprimoramento ~= nil then self.aprimoramento:destroy(); self.aprimoramento = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmArmorItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmArmorItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmArmorItem = {
    newEditor = newfrmArmorItem, 
    new = newfrmArmorItem, 
    name = "frmArmorItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmArmorItem = _frmArmorItem;
Firecast.registrarForm(_frmArmorItem);

return _frmArmorItem;
