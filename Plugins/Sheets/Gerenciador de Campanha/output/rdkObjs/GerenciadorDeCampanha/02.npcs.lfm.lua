require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciador02()
    __o_rrpgObjs.beginObjectsLoading();

    local obj = gui.fromHandle(_obj_newObject("form"));
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
    obj:setName("frmGerenciador02");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(1320);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(40);
    obj.button1:setTop(0);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("N");
    obj.button1:setName("button1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(1320);
    obj.label1:setHeight(20);
    obj.label1:setText("LISTA DE NPCs CONHECIDOS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rclListaNPCs = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclListaNPCs:setParent(obj.rectangle1);
    obj.rclListaNPCs:setName("rclListaNPCs");
    obj.rclListaNPCs:setField("listaNPCs");
    obj.rclListaNPCs:setTemplateForm("frmGerenciador02_SELECT");
    obj.rclListaNPCs:setLeft(0);
    obj.rclListaNPCs:setTop(20);
    obj.rclListaNPCs:setWidth(1320);
    obj.rclListaNPCs:setHeight(45);
    obj.rclListaNPCs:setSelectable(true);
    obj.rclListaNPCs:setLayout("horizontal");
    obj.rclListaNPCs:setMinQt(1);

    obj.boxNPCs = gui.fromHandle(_obj_newObject("dataScopeBox"));
    obj.boxNPCs:setParent(obj.scrollBox1);
    obj.boxNPCs:setName("boxNPCs");
    obj.boxNPCs:setVisible(false);
    obj.boxNPCs:setLeft(0);
    obj.boxNPCs:setTop(0);
    obj.boxNPCs:setWidth(1320);
    obj.boxNPCs:setHeight(615);

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.boxNPCs);
    obj.button2:setLeft(0);
    obj.button2:setTop(0);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.boxNPCs);
    obj.button3:setLeft(20);
    obj.button3:setTop(0);
    obj.button3:setWidth(20);
    obj.button3:setHeight(20);
    obj.button3:setText("O");
    obj.button3:setName("button3");

    obj.rclNPCs = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclNPCs:setParent(obj.boxNPCs);
    obj.rclNPCs:setLeft(0);
    obj.rclNPCs:setTop(65);
    obj.rclNPCs:setWidth(1320);
    obj.rclNPCs:setHeight(550);
    obj.rclNPCs:setLayout("horizontalTiles");
    obj.rclNPCs:setMinQt(1);
    obj.rclNPCs:setName("rclNPCs");
    obj.rclNPCs:setField("npcs");
    obj.rclNPCs:setTemplateForm("frmGerenciador02_NPC");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclListaNPCs:append();
        end, obj);

    obj._e_event1 = obj.rclListaNPCs:addEventListener("onSelect",
        function (self)
            local node = self.rclListaNPCs.selectedNode;
            					self.boxNPCs.node = node;
            					self.boxNPCs.visible = (node ~= nil);
        end, obj);

    obj._e_event2 = obj.rclListaNPCs:addEventListener("onEndEnumeration",
        function (self)
            if self.rclListaNPCs.selectedNode == nil and sheet ~= nil then
            						local nodes = ndb.getChildNodes(sheet.listaNPCs);               
            						if #nodes > 0 then
            							self.rclListaNPCs.selectedNode = nodes[1];
            						end;
            					end;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclNPCs:append();
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclNPCs:sort();
        end, obj);

    obj._e_event5 = obj.rclNPCs:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            local mod1 = nodeA.relacao;
            						local mod2 = nodeB.relacao;
            						local modR = utils.compareStringPtBr(mod1, mod2);
            						if modR==0 then
            							mod1 = nodeA.nome;
            							mod2 = nodeB.nome;
            							modR = utils.compareStringPtBr(mod1, mod2);
            						end;
            						return modR;
        end, obj);

    function obj:_releaseEvents()
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.boxNPCs ~= nil then self.boxNPCs:destroy(); self.boxNPCs = nil; end;
        if self.rclListaNPCs ~= nil then self.rclListaNPCs:destroy(); self.rclListaNPCs = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.rclNPCs ~= nil then self.rclNPCs:destroy(); self.rclNPCs = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerenciador02 = {
    newEditor = newfrmGerenciador02, 
    new = newfrmGerenciador02, 
    name = "frmGerenciador02", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador02 = _frmGerenciador02;
rrpg.registrarForm(_frmGerenciador02);

return _frmGerenciador02;
