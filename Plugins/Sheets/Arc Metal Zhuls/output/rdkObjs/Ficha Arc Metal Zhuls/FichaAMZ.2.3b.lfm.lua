require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAMZ2_3b()
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
    obj:setName("frmAMZ2_3b");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(800);
    obj.layout1:setHeight(625);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(800);
    obj.label1:setHeight(20);
    obj.label1:setText("Estilo de Luta");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rclEstilosDeLuta = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEstilosDeLuta:setParent(obj.layout1);
    obj.rclEstilosDeLuta:setName("rclEstilosDeLuta");
    obj.rclEstilosDeLuta:setField("campoDosEstilosDeLuta");
    obj.rclEstilosDeLuta:setTemplateForm("frmAMZ2_3_1");
    obj.rclEstilosDeLuta:setLeft(5);
    obj.rclEstilosDeLuta:setTop(25);
    obj.rclEstilosDeLuta:setWidth(790);
    obj.rclEstilosDeLuta:setHeight(595);
    obj.rclEstilosDeLuta:setLayout("vertical");
    obj.rclEstilosDeLuta:setMinQt(3);

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rclEstilosDeLuta ~= nil then self.rclEstilosDeLuta:destroy(); self.rclEstilosDeLuta = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAMZ2_3b = {
    newEditor = newfrmAMZ2_3b, 
    new = newfrmAMZ2_3b, 
    name = "frmAMZ2_3b", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAMZ2_3b = _frmAMZ2_3b;
rrpg.registrarForm(_frmAMZ2_3b);

return _frmAMZ2_3b;
