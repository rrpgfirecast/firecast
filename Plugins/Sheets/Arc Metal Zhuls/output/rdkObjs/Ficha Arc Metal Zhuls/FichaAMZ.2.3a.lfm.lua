require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAMZ2_3a()
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
    obj:setName("frmAMZ2_3a");
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
    obj.label1:setText("Habilidades Únicas");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rclHabilidadesUnicas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesUnicas:setParent(obj.layout1);
    obj.rclHabilidadesUnicas:setName("rclHabilidadesUnicas");
    obj.rclHabilidadesUnicas:setField("campoDasHabilidadesUnicas");
    obj.rclHabilidadesUnicas:setTemplateForm("frmAMZ2_3_1");
    obj.rclHabilidadesUnicas:setLeft(5);
    obj.rclHabilidadesUnicas:setTop(25);
    obj.rclHabilidadesUnicas:setWidth(790);
    obj.rclHabilidadesUnicas:setHeight(595);
    obj.rclHabilidadesUnicas:setLayout("vertical");
    obj.rclHabilidadesUnicas:setMinQt(3);

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
        if self.rclHabilidadesUnicas ~= nil then self.rclHabilidadesUnicas:destroy(); self.rclHabilidadesUnicas = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAMZ2_3a = {
    newEditor = newfrmAMZ2_3a, 
    new = newfrmAMZ2_3a, 
    name = "frmAMZ2_3a", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAMZ2_3a = _frmAMZ2_3a;
rrpg.registrarForm(_frmAMZ2_3a);

return _frmAMZ2_3a;
