require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmAnotacao()
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
    obj:setName("frmAnotacao");
    obj:setWidth(1300);
    obj:setHeight(600);
    obj:setTheme("dark");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(1340);
    obj.rectangle1:setHeight(600);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setText("LISTA");
    obj.label1:setLeft(950);
    obj.label1:setWidth(220);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setFontSize(30);
    obj.label1:setName("label1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(900);
    obj.rectangle2:setTop(35);
    obj.rectangle2:setWidth(220);
    obj.rectangle2:setHeight(400);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setColor("white");
    obj.rectangle2:setStrokeSize(2);
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setName("rectangle2");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle2);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.scrollBox1);
    obj.button1:setLeft(5);
    obj.button1:setTop(1);
    obj.button1:setWidth(15);
    obj.button1:setHeight(15);
    obj.button1:setText("+");
    obj.button1:setFontFamily("kalam");
    obj.button1:setName("button1");

    obj.rclAnotacao1 = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAnotacao1:setParent(obj.scrollBox1);
    obj.rclAnotacao1:setName("rclAnotacao1");
    obj.rclAnotacao1:setField("Anotacaobloco02");
    obj.rclAnotacao1:setTemplateForm("frmAnotacao1");
    obj.rclAnotacao1:setLeft(1);
    obj.rclAnotacao1:setTop(20);
    obj.rclAnotacao1:setWidth(200);
    obj.rclAnotacao1:setAutoHeight(true);

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setText("DIÁRIO");
    obj.label2:setLeft(325);
    obj.label2:setWidth(400);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setFontSize(30);
    obj.label2:setName("label2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setLeft(1);
    obj.rectangle3:setTop(35);
    obj.rectangle3:setWidth(770);
    obj.rectangle3:setHeight(550);
    obj.rectangle3:setColor("white");
    obj.rectangle3:setName("rectangle3");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle3);
    obj.layout1:setLeft(5);
    obj.layout1:setTop(5);
    obj.layout1:setWidth(770);
    obj.layout1:setHeight(550);
    obj.layout1:setName("layout1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.layout1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(770);
    obj.image1:setHeight(550);
    obj.image1:setSRC("/DZ_Ficha2.0/images/diario2.png");
    obj.image1:setStyle("proportional");
    obj.image1:setOptimize(true);
    obj.image1:setAlign("left");
    obj.image1:setName("image1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setFontFamily("kalam");
    obj.textEditor1:setWidth(320);
    obj.textEditor1:setHeight(500);
    obj.textEditor1:setLeft(50);
    obj.textEditor1:setTop(20);
    obj.textEditor1:setFontSize(15);
    obj.textEditor1:setFontColor("black");
    obj.textEditor1:setField("Anotacao1bloco02");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout1);
    obj.textEditor2:setFontFamily("kalam");
    obj.textEditor2:setWidth(320);
    obj.textEditor2:setHeight(500);
    obj.textEditor2:setLeft(390);
    obj.textEditor2:setTop(20);
    obj.textEditor2:setFontSize(15);
    obj.textEditor2:setFontColor("black");
    obj.textEditor2:setField("Anotacao1bloco03");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclAnotacao1:append();
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

        if self.rclAnotacao1 ~= nil then self.rclAnotacao1:destroy(); self.rclAnotacao1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmAnotacao()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmAnotacao();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmAnotacao = {
    newEditor = newfrmAnotacao, 
    new = newfrmAnotacao, 
    name = "frmAnotacao", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmAnotacao = _frmAnotacao;
Firecast.registrarForm(_frmAnotacao);

return _frmAnotacao;
