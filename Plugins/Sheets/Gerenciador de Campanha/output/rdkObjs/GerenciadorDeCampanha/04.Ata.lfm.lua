require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciador04()
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
    obj:setName("frmGerenciador04");
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
    obj.rectangle1:setWidth(1260);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(1260);
    obj.label1:setHeight(20);
    obj.label1:setText("ATA DE PRESENÇA");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("+");
    obj.button1:setHint("Novo");
    obj.button1:setName("button1");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle1);
    obj.button2:setLeft(20);
    obj.button2:setTop(0);
    obj.button2:setWidth(20);
    obj.button2:setHeight(20);
    obj.button2:setText("O");
    obj.button2:setHint("Organizar");
    obj.button2:setName("button2");

    obj.scrollBox2 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox2:setParent(obj.scrollBox1);
    obj.scrollBox2:setLeft(0);
    obj.scrollBox2:setTop(20);
    obj.scrollBox2:setWidth(1260);
    obj.scrollBox2:setHeight(590);
    obj.scrollBox2:setName("scrollBox2");

    obj.rclPresenca = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclPresenca:setParent(obj.scrollBox2);
    obj.rclPresenca:setLeft(0);
    obj.rclPresenca:setTop(0);
    obj.rclPresenca:setWidth(1240);
    obj.rclPresenca:setHeight(600);
    obj.rclPresenca:setItemHeight(200);
    obj.rclPresenca:setAutoHeight(true);
    obj.rclPresenca:setMinQt(1);
    obj.rclPresenca:setLayout("horizontalTiles");
    obj.rclPresenca:setName("rclPresenca");
    obj.rclPresenca:setField("presenca");
    obj.rclPresenca:setTemplateForm("frmGerenciador04_PRESENCA");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclPresenca:append();
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclPresenca:sort();
        end, obj);

    obj._e_event2 = obj.rclPresenca:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            local mod1 = nodeA.nick;
            						local mod2 = nodeB.nick;
            						local modR = utils.compareStringPtBr(mod1, mod2);
            						return modR;
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

        if self.rclPresenca ~= nil then self.rclPresenca:destroy(); self.rclPresenca = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.scrollBox2 ~= nil then self.scrollBox2:destroy(); self.scrollBox2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmGerenciador04 = {
    newEditor = newfrmGerenciador04, 
    new = newfrmGerenciador04, 
    name = "frmGerenciador04", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador04 = _frmGerenciador04;
rrpg.registrarForm(_frmGerenciador04);

return _frmGerenciador04;
