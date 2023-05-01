require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmRclCounter()
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
    obj:setName("frmRclCounter");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("top");
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("left");
    obj.rectangle1:setWidth(25);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(25);
    obj.label1:setHeight(25);
    obj.label1:setField("countSum");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setAlign("left");
    obj.label2:setWidth(125);
    obj.label2:setText("<- Soma contador");
    obj.label2:setName("label2");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(125);
    obj.button1:setHeight(25);
    obj.button1:setText("+ Ultimo");
    obj.button1:setHint("Adiciona objetos a lista com contador relativo ao ultimo objeto adicionado ");
    obj.button1:setName("button1");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setAlign("left");
    obj.button2:setWidth(125);
    obj.button2:setHeight(25);
    obj.button2:setText("+ Tamanho");
    obj.button2:setHint("Adiciona objetos a lista com contador em relação ao tamanho da lista");
    obj.button2:setName("button2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(250);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle2);
    obj.label3:setAlign("top");
    obj.label3:setHeight(20);
    obj.label3:setText("Titulo da Lista");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.rclName = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclName:setParent(obj.rectangle2);
    obj.rclName:setAlign("client");
    obj.rclName:setMargins({left=5,right=5,bottom=5,top=5});
    obj.rclName:setName("rclName");
    obj.rclName:setField("listaDe");
    obj.rclName:setTemplateForm("frmRecordListForm");
    obj.rclName:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            -- Aumenta um contador enquanto adiciona um objeto
            					if sheet~=nil then
            						local objetos = NDB.getChildNodes(sheet.listaDe);
            
            						local node = self.rclName:append();
            						if node~=nil then
            							local contador = #objetos;
            							for i=1, #objetos, 1 do
            								local aux = tonumber(objetos[i].contador) or 0;
            								if aux > contador then
            									contador = aux;
            								end;
            							end;
            							node.contador = contador + 1;
            						end;
            
            						self.rclName:sort();
            					end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (_)
            -- Aumenta um contador enquanto adiciona um objeto
            					if sheet~=nil then
            						local objetos = NDB.getChildNodes(sheet.listaDe);
            						local num = #objetos + 1;
            
            						local node = self.rclName:append();
            						if node~=nil then
            							node.contador = num;
            						end;
            
            						self.rclName:sort();
            					end;
        end, obj);

    obj._e_event2 = obj.rclName:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            -- Esse codigo organiza a ordem dos objetos da lista. 
            			        if (tonumber(nodeA.contador) or 0) < (tonumber(nodeB.contador) or 0) then
            			            return -1;
            			        elseif (tonumber(nodeA.contador) or 0) > (tonumber(nodeB.contador) or 0) then
            			            return 1;
            			        else   
            			            return 0;
            			        end;
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

        if self.rclName ~= nil then self.rclName:destroy(); self.rclName = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmRclCounter()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmRclCounter();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmRclCounter = {
    newEditor = newfrmRclCounter, 
    new = newfrmRclCounter, 
    name = "frmRclCounter", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmRclCounter = _frmRclCounter;
Firecast.registrarForm(_frmRclCounter);

return _frmRclCounter;
