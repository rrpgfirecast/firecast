require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmAMZ2_3()
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
    obj:setName("frmAMZ2_3");
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
    obj.layout1:setWidth(400);
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
    obj.label1:setWidth(400);
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
    obj.rclHabilidadesUnicas:setWidth(390);
    obj.rclHabilidadesUnicas:setHeight(595);
    obj.rclHabilidadesUnicas:setLayout("vertical");
    obj.rclHabilidadesUnicas:setMinQt(3);

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(410);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(400);
    obj.layout2:setHeight(625);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(400);
    obj.label2:setHeight(20);
    obj.label2:setText("Estilo de Luta");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.rclEstilosDeLuta = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEstilosDeLuta:setParent(obj.layout2);
    obj.rclEstilosDeLuta:setName("rclEstilosDeLuta");
    obj.rclEstilosDeLuta:setField("campoDosEstilosDeLuta");
    obj.rclEstilosDeLuta:setTemplateForm("frmAMZ2_3_1");
    obj.rclEstilosDeLuta:setLeft(5);
    obj.rclEstilosDeLuta:setTop(25);
    obj.rclEstilosDeLuta:setWidth(390);
    obj.rclEstilosDeLuta:setHeight(595);
    obj.rclEstilosDeLuta:setLayout("vertical");
    obj.rclEstilosDeLuta:setMinQt(3);

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(820);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(400);
    obj.layout3:setHeight(625);
    obj.layout3:setName("layout3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(400);
    obj.label3:setHeight(20);
    obj.label3:setText("Habilidades Iniciais");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout3);
    obj.button1:setLeft(375);
    obj.button1:setTop(1);
    obj.button1:setWidth(23);
    obj.button1:setHeight(23);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.rclHabilidadesIniciais = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclHabilidadesIniciais:setParent(obj.layout3);
    obj.rclHabilidadesIniciais:setName("rclHabilidadesIniciais");
    obj.rclHabilidadesIniciais:setField("campoDosHabilidadesIniciais");
    obj.rclHabilidadesIniciais:setTemplateForm("frmAMZ2_3_1");
    obj.rclHabilidadesIniciais:setLeft(5);
    obj.rclHabilidadesIniciais:setTop(25);
    obj.rclHabilidadesIniciais:setWidth(390);
    obj.rclHabilidadesIniciais:setHeight(595);
    obj.rclHabilidadesIniciais:setLayout("vertical");
    obj.rclHabilidadesIniciais:setMinQt(1);

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            if sheet~=nil then
            						local node = self.rclHabilidadesIniciais:append();
            					end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rclHabilidadesIniciais ~= nil then self.rclHabilidadesIniciais:destroy(); self.rclHabilidadesIniciais = nil; end;
        if self.rclHabilidadesUnicas ~= nil then self.rclHabilidadesUnicas:destroy(); self.rclHabilidadesUnicas = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rclEstilosDeLuta ~= nil then self.rclEstilosDeLuta:destroy(); self.rclEstilosDeLuta = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmAMZ2_3 = {
    newEditor = newfrmAMZ2_3, 
    new = newfrmAMZ2_3, 
    name = "frmAMZ2_3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAMZ2_3 = _frmAMZ2_3;
rrpg.registrarForm(_frmAMZ2_3);

return _frmAMZ2_3;
