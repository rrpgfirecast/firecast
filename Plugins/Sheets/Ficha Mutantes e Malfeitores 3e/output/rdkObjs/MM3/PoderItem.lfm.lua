require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmPoderItem()
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
    obj:setName("frmPoderItem");
    obj:setWidth(110);
    obj:setHeight(125);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setAlign("right");
    obj.layout2:setWidth(100);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setAlign("client");
    obj.label1:setField("custo");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(12);
    obj.label1:setName("label1");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout2);
    obj.dataLink1:setFields({'custo','tipo','internal'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout2);
    obj.dataLink2:setFields({'custoGrad', 'custoExtra', 'custoFalha', 'custoMult', 'custoExtraFixo', 'custoFalhaFixo', 'ppPoderes'});
    obj.dataLink2:setName("dataLink2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout2);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setText("i");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setAlign("right");
    obj.button2:setWidth(25);
    obj.button2:setText("X");
    obj.button2:setName("button2");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("efeitos");
    obj.textEditor1:setMargins({left=5,right=5,bottom=5});
    obj.textEditor1:setName("textEditor1");

    obj._e_event0 = obj.dataLink1:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet== nil then return end
            
            						local node
            						local custo = 0
            						local nodes
            
            						if sheet.internal == true then
            							-- Se é um sub poder, olhe não para a raiz, mas para o poder original
            							node = NDB.getParent(NDB.getParent(sheet))
            							nodes = NDB.getChildNodes(node.rclSubPoderes); 
            
            							for i=1, #nodes, 1 do
            								if nodes[i].tipo == "Dinâmico" then
            									custo = custo + 2
            								else
            									custo = custo + 1
            								end
            							end
            						else
            							-- Se é um poder olhe para a raiz
            							node = NDB.getRoot(sheet);
            							nodes = NDB.getChildNodes(node.rclPoderes); 
            
            							for i=1, #nodes, 1 do
            								custo = custo + (tonumber(nodes[i].custo) or 0);
            							end
            						end
            	
            						node.ppPoderes = custo
        end, obj);

    obj._e_event1 = obj.dataLink2:addEventListener("onUserChange",
        function (_, field, oldValue, newValue)
            if sheet~= nil then
            							local node = NDB.getRoot(sheet);
            							
            							local grad = (tonumber(sheet.custoGrad) or 0)
            							local extra = (tonumber(sheet.custoExtra) or 0)
            							local falha = (tonumber(sheet.custoFalha) or 0)
            							local mult = (tonumber(sheet.custoMult) or 0)
            							local extraFixo = (tonumber(sheet.custoExtraFixo) or 0)
            							local falhaFixo = (tonumber(sheet.custoFalhaFixo) or 0)
            
            							local ppPoderes = (tonumber(sheet.ppPoderes) or 0)
            
            							local custo = (mult + extra - math.abs(falha)) * grad + extraFixo - math.abs(falhaFixo)
            
            							sheet.custo = custo + ppPoderes
            							sheet.custoArranjo = custo
            						end;
        end, obj);

    obj._e_event2 = obj.button1:addEventListener("onClick",
        function (_)
            local pop;
            						if sheet.internal == true then
            							pop = self:findControlByName("popPoder");
            						else
            							pop = self:findControlByName("popPoderList");
            						end
            						
            						if pop ~= nil then
            							pop:setNodeObject(self.sheet);
            							pop:showPopupEx("right", self);
            						else
            							showMessage("Ops, bug.. nao encontrei o popup para exibir");
            						end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Tem certeza que quer apagar essa vantagem?",
            							function (confirmado)
            								if confirmado then
            									NDB.deleteNode(sheet);
            								end;
            						end);
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

        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmPoderItem()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmPoderItem();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmPoderItem = {
    newEditor = newfrmPoderItem, 
    new = newfrmPoderItem, 
    name = "frmPoderItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPoderItem = _frmPoderItem;
Firecast.registrarForm(_frmPoderItem);

return _frmPoderItem;
