require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmKingdom()
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
    obj:setName("frmKingdom");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(1240);
    obj.layout1:setHeight(30);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(200);
    obj.layout2:setHeight(30);
    obj.layout2:setName("layout2");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout2);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(95);
    obj.label1:setHeight(20);
    obj.label1:setText("Reino");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(95);
    obj.edit1:setTop(5);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(20);
    obj.edit1:setField("reino");
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(210);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(200);
    obj.layout3:setHeight(30);
    obj.layout3:setName("layout3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout3);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(95);
    obj.label2:setHeight(20);
    obj.label2:setText("População");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout3);
    obj.rectangle2:setLeft(95);
    obj.rectangle2:setTop(5);
    obj.rectangle2:setWidth(100);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(95);
    obj.label3:setTop(5);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setField("populacao");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(420);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(200);
    obj.layout4:setHeight(30);
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setLeft(0);
    obj.label4:setTop(5);
    obj.label4:setWidth(95);
    obj.label4:setHeight(20);
    obj.label4:setText("Riqueza");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout4);
    obj.rectangle3:setLeft(95);
    obj.rectangle3:setTop(5);
    obj.rectangle3:setWidth(100);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout4);
    obj.label5:setLeft(95);
    obj.label5:setTop(5);
    obj.label5:setWidth(100);
    obj.label5:setHeight(20);
    obj.label5:setField("riqueza");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(830);
    obj.layout5:setTop(0);
    obj.layout5:setWidth(410);
    obj.layout5:setHeight(30);
    obj.layout5:setName("layout5");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(0);
    obj.rectangle4:setTop(35);
    obj.rectangle4:setWidth(200);
    obj.rectangle4:setHeight(275);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.rclDestalhesDoReino = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclDestalhesDoReino:setParent(obj.scrollBox1);
    obj.rclDestalhesDoReino:setLeft(0);
    obj.rclDestalhesDoReino:setTop(35);
    obj.rclDestalhesDoReino:setWidth(200);
    obj.rclDestalhesDoReino:setHeight(270);
    obj.rclDestalhesDoReino:setName("rclDestalhesDoReino");
    obj.rclDestalhesDoReino:setField("listaDeDestalhesDoReino");
    obj.rclDestalhesDoReino:setTemplateForm("frmKingdomSelection");
    obj.rclDestalhesDoReino:setLayout("vertical");
    obj.rclDestalhesDoReino:setSelectable(true);
    obj.rclDestalhesDoReino:setMinQt(9);

    obj.boxDetalhesDoReino = GUI.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxDetalhesDoReino:setParent(obj.scrollBox1);
    obj.boxDetalhesDoReino:setLeft(210);
    obj.boxDetalhesDoReino:setTop(35);
    obj.boxDetalhesDoReino:setWidth(1030);
    obj.boxDetalhesDoReino:setHeight(535);
    obj.boxDetalhesDoReino:setName("boxDetalhesDoReino");
    obj.boxDetalhesDoReino:setVisible(false);

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.boxDetalhesDoReino);
    obj.richEdit1:setAlign("client");
    obj.richEdit1:setField("$(field)");
    lfm_setPropAsString(obj.richEdit1, "backgroundColor",  "#333333");
    lfm_setPropAsString(obj.richEdit1, "defaultFontSize",  "12");
    lfm_setPropAsString(obj.richEdit1, "defaultFontColor",  "white");
    obj.richEdit1:setName("richEdit1");

    obj._e_event0 = obj.rclDestalhesDoReino:addEventListener("onEndEnumeration",
        function (_)
            if sheet~= nil then
            					local objetos = ndb.getChildNodes(sheet.listaDeDestalhesDoReino);
            					local nomes = {"Descrição","Cultura","Raças","Classes","Historia","Geografia","Clima", "Outros", "Religião"};
            					local indexes = {1,2,3,4,5,6,7,9,8};
            					for i=1, #objetos, 1 do
            						objetos[i].nome = nomes[i];
            						objetos[i].index = indexes[i];
            					end;
            
            					if self.rclDestalhesDoReino.selectedNode== nil and #objetos>0 then
            						self.rclDestalhesDoReino.selectedNode = objetos[1]; 
            					end;
            					self.rclDestalhesDoReino:sort();
            				end;
        end, obj);

    obj._e_event1 = obj.rclDestalhesDoReino:addEventListener("onSelect",
        function (_)
            local node = self.rclDestalhesDoReino.selectedNode;
            					self.boxDetalhesDoReino.node = node; 
            					self.boxDetalhesDoReino.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.rclDestalhesDoReino:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            if (nodeA.index or 0) < (nodeB.index or 0) then
            					return -1;
            				elseif (nodeA.index or 0) > (nodeB.index or 0) then
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

        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.boxDetalhesDoReino ~= nil then self.boxDetalhesDoReino:destroy(); self.boxDetalhesDoReino = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rclDestalhesDoReino ~= nil then self.rclDestalhesDoReino:destroy(); self.rclDestalhesDoReino = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmKingdom()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmKingdom();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmKingdom = {
    newEditor = newfrmKingdom, 
    new = newfrmKingdom, 
    name = "frmKingdom", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmKingdom = _frmKingdom;
Firecast.registrarForm(_frmKingdom);

return _frmKingdom;
