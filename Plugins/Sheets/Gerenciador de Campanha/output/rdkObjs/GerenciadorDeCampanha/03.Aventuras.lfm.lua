require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmGerenciador03()
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
    obj:setName("frmGerenciador03");
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
    obj.rectangle1:setWidth(830);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("Black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(830);
    obj.label1:setHeight(20);
    obj.label1:setText("LISTA DE AVENTURAS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(0);
    obj.button1:setTop(0);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setText("+");
    obj.button1:setHint("Nova Aventura");
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
    obj.scrollBox2:setWidth(830);
    obj.scrollBox2:setHeight(590);
    obj.scrollBox2:setName("scrollBox2");

    obj.rclAventuras = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclAventuras:setParent(obj.scrollBox2);
    obj.rclAventuras:setLeft(0);
    obj.rclAventuras:setTop(0);
    obj.rclAventuras:setWidth(810);
    obj.rclAventuras:setHeight(600);
    obj.rclAventuras:setItemHeight(200);
    obj.rclAventuras:setAutoHeight(true);
    obj.rclAventuras:setMinQt(1);
    obj.rclAventuras:setName("rclAventuras");
    obj.rclAventuras:setField("aventuras");
    obj.rclAventuras:setTemplateForm("frmGerenciador03_AVENTURA");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            								local aventuras = ndb.getChildNodes(sheet.aventuras);
            								local num = #aventuras + 1;
            
            								local node = self.rclAventuras:append();
            								if node~=nil then
            									node.numero = num;
            								end;
            
            								self.rclAventuras:sort();
            							end;
        end, obj);

    obj._e_event1 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclAventuras:sort();
        end, obj);

    obj._e_event2 = obj.rclAventuras:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            if (tonumber(nodeA.numero) or 0) < (tonumber(nodeB.numero) or 0) then
            		                    return 1;
            		                elseif (tonumber(nodeA.numero) or 0) > (tonumber(nodeB.numero) or 0) then
            		                    return -1;
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rclAventuras ~= nil then self.rclAventuras:destroy(); self.rclAventuras = nil; end;
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

local _frmGerenciador03 = {
    newEditor = newfrmGerenciador03, 
    new = newfrmGerenciador03, 
    name = "frmGerenciador03", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmGerenciador03 = _frmGerenciador03;
rrpg.registrarForm(_frmGerenciador03);

return _frmGerenciador03;
