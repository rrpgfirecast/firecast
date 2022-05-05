require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmOther()
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
    obj:setName("frmOther");
    obj:setWidth(110);
    obj:setHeight(35);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(0);
    obj.button1:setTop(2.5);
    obj.button1:setHeight(15);
    obj.button1:setWidth(15);
    obj.button1:setText("1");
    obj.button1:setFontSize(9);
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(0);
    obj.button2:setTop(17.5);
    obj.button2:setHeight(15);
    obj.button2:setWidth(15);
    obj.button2:setText("2");
    obj.button2:setFontSize(9);
    obj.button2:setName("button2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(20);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(175);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(35);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(185);
    obj.label1:setTop(8);
    obj.label1:setWidth(30);
    obj.label1:setHeight(20);
    obj.label1:setField("total");
    obj.label1:setName("label1");

    obj.button3 = GUI.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle1);
    obj.button3:setLeft(215);
    obj.button3:setTop(5);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("i");
    obj.button3:setName("button3");

    obj.button4 = GUI.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.rectangle1);
    obj.button4:setLeft(240);
    obj.button4:setTop(5);
    obj.button4:setWidth(25);
    obj.button4:setHeight(25);
    obj.button4:setText("X");
    obj.button4:setName("button4");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setFields({'inicial','aprimoramento','xp','multApr','multXp'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.rectangle1);
    obj.dataLink2:setField("inicial");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.rectangle1);
    obj.dataLink3:setField("costApr");
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.rectangle1);
    obj.dataLink4:setField("costXp");
    obj.dataLink4:setName("dataLink4");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				local node = NDB.getRoot(sheet);
            				if node==nil then return end;
            
            				node.field1 = true;
            				node.num1 = (tonumber(sheet.total) or 0);
            				node.rollnome1 = "" .. (sheet.nome or "");
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            if sheet==nil then return end;
            				local node = NDB.getRoot(sheet);
            				if node==nil then return end;
            
            				node.field2 = true;
            				node.num2 = (tonumber(sheet.total) or 0);
            				node.rollnome2 = "" .. (sheet.nome or "");
        end, obj);

    obj._e_event2 = obj.button3:addEventListener("onClick",
        function (_)
            local pop = self:findControlByName("popOther");
            					
            				if pop ~= nil then
            					pop:setNodeObject(self.sheet);
            					pop:showPopupEx("right", self);
            				else
            					showMessage("Ops, bug.. nao encontrei o popup para exibir");
            				end;
        end, obj);

    obj._e_event3 = obj.button4:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Tem certeza que quer apagar?",
            					function (confirmado)
            						if confirmado then
            							NDB.deleteNode(sheet);
            						end;
            				end);
        end, obj);

    obj._e_event4 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet==nil then return end;
            				local apr = (tonumber(sheet.aprimoramento) or 0);
            				local xp = (tonumber(sheet.xp) or 0);
            				local mult = (tonumber(sheet.multXp) or 1);
            				local total = (tonumber(sheet.inicial) or 0) + apr + xp;
            
            				sheet.total = total;
            
            				local valor = total - xp;
            				local aux = 0;
            				for j=1, xp, 1 do
            					aux = aux + (valor+j)*mult;
            				end;
            				sheet.costXp = aux;
            
            				mult = (tonumber(sheet.multApr) or 1);
            				sheet.costApr = apr * mult;
        end, obj);

    obj._e_event5 = obj.dataLink2:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local node = NDB.getRoot(sheet);
            					local objetos = NDB.getChildNodes(node.campoDosOutros);
            					local soma = 0;
            
            					for i=1, #objetos, 1 do 
            						soma = soma + (tonumber(objetos[i].inicial) or 0);
            					end;
            
            					node.auditini_out = soma;
            				end;
        end, obj);

    obj._e_event6 = obj.dataLink3:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local node = NDB.getRoot(sheet);
            					local objetos = NDB.getChildNodes(node.campoDosOutros);
            					local soma = 0;
            
            					for i=1, #objetos, 1 do 
            						soma = soma + (tonumber(objetos[i].costApr) or 0);
            					end;
            
            					node.auditbonus_out = soma;
            				end;
        end, obj);

    obj._e_event7 = obj.dataLink4:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            					local node = NDB.getRoot(sheet);
            					local objetos = NDB.getChildNodes(node.campoDosOutros);
            					local soma = 0;
            
            					for i=1, #objetos, 1 do 
            						soma = soma + (tonumber(objetos[i].costXp) or 0);
            					end;
            
            					node.auditxp_out = soma;
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

        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmOther()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmOther();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmOther = {
    newEditor = newfrmOther, 
    new = newfrmOther, 
    name = "frmOther", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmOther = _frmOther;
Firecast.registrarForm(_frmOther);

return _frmOther;
