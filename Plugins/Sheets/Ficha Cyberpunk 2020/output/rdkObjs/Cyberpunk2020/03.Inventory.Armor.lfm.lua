require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmInventoryArmor()
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
    obj:setName("frmInventoryArmor");
    obj:setWidth(725);
    obj:setHeight(25);
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
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(150);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("cabeca");
    obj.edit2:setName("edit2");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(200);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("torso");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(250);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("bracoDireito");
    obj.edit4:setName("edit4");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle1);
    obj.edit5:setLeft(300);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("bracoEsquerdo");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle1);
    obj.edit6:setLeft(350);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("pernaDireito");
    obj.edit6:setName("edit6");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.rectangle1);
    obj.edit7:setLeft(400);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("pernaEsquerdo");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.rectangle1);
    obj.edit8:setLeft(450);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(150);
    obj.edit8:setHeight(25);
    obj.edit8:setField("detalhes");
    obj.edit8:setName("edit8");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.rectangle1);
    obj.edit9:setLeft(600);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("preco");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.rectangle1);
    obj.edit10:setLeft(650);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(50);
    obj.edit10:setHeight(25);
    obj.edit10:setField("peso");
    obj.edit10:setName("edit10");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(700);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setFields({'cabeca'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setFields({'torso'});
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle1);
    obj.dataLink3:setFields({'bracoDireito'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle1);
    obj.dataLink4:setFields({'bracoEsquerdo'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.rectangle1);
    obj.dataLink5:setFields({'pernaDireito'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.rectangle1);
    obj.dataLink6:setFields({'pernaEsquerdo'});
    obj.dataLink6:setName("dataLink6");

    obj.dataLink7 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.rectangle1);
    obj.dataLink7:setFields({'preco'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.rectangle1);
    obj.dataLink8:setFields({'peso'});
    obj.dataLink8:setName("dataLink8");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            dialogs.confirmOkCancel("Tem certeza que quer apagar esse objeto?",
            					function (confirmado)
            						if confirmado then
            							ndb.deleteNode(sheet);
            						end;
            				end);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local node = ndb.getRoot(sheet);
            				local objetos = ndb.getChildNodes(node.armorList);
            				local blindagem = 0;
            
            				for i=1, #objetos, 1 do 
            					blindagem = blindagem + (tonumber(objetos[i].cabeca) or 0);
            				end;
            
            				node.blindagemCabeca = blindagem;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local node = ndb.getRoot(sheet);
            				local objetos = ndb.getChildNodes(node.armorList);
            				local blindagem = 0;
            
            				for i=1, #objetos, 1 do 
            					blindagem = blindagem + (tonumber(objetos[i].torso) or 0);
            				end;
            
            				node.blindagemTorso = blindagem;
        end, obj);

    obj._e_event3 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local node = ndb.getRoot(sheet);
            				local objetos = ndb.getChildNodes(node.armorList);
            				local blindagem = 0;
            
            				for i=1, #objetos, 1 do 
            					blindagem = blindagem + (tonumber(objetos[i].bracoDireito) or 0);
            				end;
            
            				node.blindagemBracoDireito = blindagem;
        end, obj);

    obj._e_event4 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local node = ndb.getRoot(sheet);
            				local objetos = ndb.getChildNodes(node.armorList);
            				local blindagem = 0;
            
            				for i=1, #objetos, 1 do 
            					blindagem = blindagem + (tonumber(objetos[i].bracoEsquerdo) or 0);
            				end;
            
            				node.blindagemBracoEsquerdo = blindagem;
        end, obj);

    obj._e_event5 = obj.dataLink5:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local node = ndb.getRoot(sheet);
            				local objetos = ndb.getChildNodes(node.armorList);
            				local blindagem = 0;
            
            				for i=1, #objetos, 1 do 
            					blindagem = blindagem + (tonumber(objetos[i].pernaDireito) or 0);
            				end;
            
            				node.blindagemPernaDireita = blindagem;
        end, obj);

    obj._e_event6 = obj.dataLink6:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local node = ndb.getRoot(sheet);
            				local objetos = ndb.getChildNodes(node.armorList);
            				local blindagem = 0;
            
            				for i=1, #objetos, 1 do 
            					blindagem = blindagem + (tonumber(objetos[i].pernaEsquerdo) or 0);
            				end;
            
            				node.blindagemPernaEsquerda = blindagem;
        end, obj);

    obj._e_event7 = obj.dataLink7:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local node = ndb.getRoot(sheet);
            				local objetos = ndb.getChildNodes(node.armorList);
            				local cost = 0;
            
            				for i=1, #objetos, 1 do 
            					cost = cost + (tonumber(objetos[i].preco) or 0);
            				end;
            
            				node.armorCost = cost;
        end, obj);

    obj._e_event8 = obj.dataLink8:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local node = ndb.getRoot(sheet);
            				local objetos = ndb.getChildNodes(node.armorList);
            				local weight = 0;
            
            				for i=1, #objetos, 1 do 
            					weight = weight + (tonumber(objetos[i].peso) or 0);
            				end;
            
            				node.armorWeight = weight;
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmInventoryArmor()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmInventoryArmor();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmInventoryArmor = {
    newEditor = newfrmInventoryArmor, 
    new = newfrmInventoryArmor, 
    name = "frmInventoryArmor", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInventoryArmor = _frmInventoryArmor;
Firecast.registrarForm(_frmInventoryArmor);

return _frmInventoryArmor;
