require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmACN5()
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
    obj:setName("frmACN5");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(400);
    obj.layout1:setMargins({right=10});
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setAlign("top");
    obj.label1:setHeight(20);
    obj.label1:setText("Anotações");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.rectangle1);
    obj.textEditor1:setAlign("client");
    obj.textEditor1:setField("anotacoes1");
    obj.textEditor1:setMargins({left=10,right=10,bottom=10});
    obj.textEditor1:setName("textEditor1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("bottom");
    obj.rectangle2:setHeight(380);
    obj.rectangle2:setColor("DimGray");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setMargins({left=10,right=10,bottom=10});
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle2);
    obj.image1:setAlign("client");
    obj.image1:setField("anotacoesPic1");
    obj.image1:setEditable(true);
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(400);
    obj.layout2:setMargins({right=10});
    obj.layout2:setName("layout2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(15);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle3);
    obj.label2:setAlign("top");
    obj.label2:setHeight(20);
    obj.label2:setText("Anotações");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.rectangle3);
    obj.textEditor2:setAlign("client");
    obj.textEditor2:setField("anotacoes2");
    obj.textEditor2:setMargins({left=10,right=10,bottom=10});
    obj.textEditor2:setName("textEditor2");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle3);
    obj.rectangle4:setAlign("bottom");
    obj.rectangle4:setHeight(380);
    obj.rectangle4:setColor("DimGray");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("innerLine");
    obj.rectangle4:setMargins({left=10,right=10,bottom=10});
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle4);
    obj.image2:setAlign("client");
    obj.image2:setField("anotacoesPic2");
    obj.image2:setEditable(true);
    obj.image2:setStyle("autoFit");
    obj.image2:setName("image2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(400);
    obj.layout3:setMargins({right=10});
    obj.layout3:setName("layout3");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout3);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(5);
    obj.rectangle5:setYradius(15);
    obj.rectangle5:setCornerType("round");
    obj.rectangle5:setName("rectangle5");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle5);
    obj.label3:setAlign("top");
    obj.label3:setHeight(20);
    obj.label3:setText("Anotações");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.rectangle5);
    obj.textEditor3:setAlign("client");
    obj.textEditor3:setField("anotacoes3");
    obj.textEditor3:setMargins({left=10,right=10,bottom=10});
    obj.textEditor3:setName("textEditor3");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.rectangle5);
    obj.rectangle6:setAlign("bottom");
    obj.rectangle6:setHeight(380);
    obj.rectangle6:setColor("DimGray");
    obj.rectangle6:setXradius(5);
    obj.rectangle6:setYradius(5);
    obj.rectangle6:setCornerType("innerLine");
    obj.rectangle6:setMargins({left=10,right=10,bottom=10});
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.image3 = GUI.fromHandle(_obj_newObject("image"));
    obj.image3:setParent(obj.rectangle6);
    obj.image3:setAlign("client");
    obj.image3:setField("anotacoesPic3");
    obj.image3:setEditable(true);
    obj.image3:setStyle("autoFit");
    obj.image3:setName("image3");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.image3 ~= nil then self.image3:destroy(); self.image3 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmACN5()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmACN5();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmACN5 = {
    newEditor = newfrmACN5, 
    new = newfrmACN5, 
    name = "frmACN5", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmACN5 = _frmACN5;
Firecast.registrarForm(_frmACN5);

return _frmACN5;
