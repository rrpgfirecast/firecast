require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmLH2()
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
    obj:setName("frmLH2");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(1310);
    obj.layout1:setHeight(25);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(2);
    obj.button1:setTop(2);
    obj.button1:setWidth(20);
    obj.button1:setHeight(20);
    obj.button1:setName("button1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(1300);
    obj.label1:setHeight(25);
    obj.label1:setText("HABILIDADES");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rclListaDasHabilidades = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclListaDasHabilidades:setParent(obj.scrollBox1);
    obj.rclListaDasHabilidades:setName("rclListaDasHabilidades");
    obj.rclListaDasHabilidades:setField("listaHablidades");
    obj.rclListaDasHabilidades:setTemplateForm("frmLH2_1");
    obj.rclListaDasHabilidades:setLeft(0);
    obj.rclListaDasHabilidades:setTop(30);
    obj.rclListaDasHabilidades:setWidth(1310);
    obj.rclListaDasHabilidades:setHeight(580);
    obj.rclListaDasHabilidades:setLayout("horizontalTiles");
    obj.rclListaDasHabilidades:setMinQt(1);

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20LH%20releases/imagens/block.png");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclListaDasHabilidades:append();
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

        if self.rclListaDasHabilidades ~= nil then self.rclListaDasHabilidades:destroy(); self.rclListaDasHabilidades = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmLH2()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmLH2();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmLH2 = {
    newEditor = newfrmLH2, 
    new = newfrmLH2, 
    name = "frmLH2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmLH2 = _frmLH2;
Firecast.registrarForm(_frmLH2);

return _frmLH2;
