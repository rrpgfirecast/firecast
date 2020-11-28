require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmkpta8_svg()
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
    obj:setName("frmkpta8_svg");
    obj:setAlign("client");
    obj:setTheme("light");
    obj:setMargins({top=1});

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setWidth(893);
    obj.rectangle1:setHeight(1263);
    obj.rectangle1:setColor("white");
    obj.rectangle1:setName("rectangle1");

    obj.image1 = GUI.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.rectangle1);
    obj.image1:setLeft(0);
    obj.image1:setTop(0);
    obj.image1:setWidth(893);
    obj.image1:setHeight(1263);
    obj.image1:setSRC("/Demônio A Queda/images/bg.png");
    obj.image1:setStyle("stretch");
    obj.image1:setOptimize(true);
    obj.image1:setName("image1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setLeft(54);
    obj.layout1:setTop(207);
    obj.layout1:setWidth(786);
    obj.layout1:setHeight(116);
    obj.layout1:setName("layout1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(0);
    obj.textEditor1:setTop(0);
    obj.textEditor1:setWidth(786);
    obj.textEditor1:setHeight(116);
    obj.textEditor1:setFontSize(18);
    obj.textEditor1:setFontColor("#000000");
    obj.textEditor1:setField("Antes_da_Queda");
    obj.textEditor1:setTransparent(true);
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setLeft(54);
    obj.layout2:setTop(350);
    obj.layout2:setWidth(786);
    obj.layout2:setHeight(69);
    obj.layout2:setName("layout2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout2);
    obj.textEditor2:setLeft(0);
    obj.textEditor2:setTop(0);
    obj.textEditor2:setWidth(786);
    obj.textEditor2:setHeight(69);
    obj.textEditor2:setFontSize(18);
    obj.textEditor2:setFontColor("#000000");
    obj.textEditor2:setField("A_Queda");
    obj.textEditor2:setTransparent(true);
    obj.textEditor2:setName("textEditor2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setLeft(54);
    obj.layout3:setTop(446);
    obj.layout3:setWidth(786);
    obj.layout3:setHeight(217);
    obj.layout3:setName("layout3");

    obj.richEdit1 = GUI.fromHandle(_obj_newObject("richEdit"));
    obj.richEdit1:setParent(obj.layout3);
    obj.richEdit1:setLeft(0);
    obj.richEdit1:setTop(0);
    obj.richEdit1:setWidth(786);
    obj.richEdit1:setHeight(217);
    obj.richEdit1:setField("Após_a_Queda");
    obj.richEdit1:setName("richEdit1");

    obj.image2 = GUI.fromHandle(_obj_newObject("image"));
    obj.image2:setParent(obj.rectangle1);
    obj.image2:setField("imagem");
    obj.image2:setEditable(true);
    obj.image2:setStyle("proportional");
    obj.image2:setLeft(63);
    obj.image2:setTop(692);
    obj.image2:setWidth(774);
    obj.image2:setHeight(389);
    obj.image2:setName("image2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setLeft(57);
    obj.layout4:setTop(1114);
    obj.layout4:setWidth(774);
    obj.layout4:setHeight(72);
    obj.layout4:setName("layout4");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setFontSize(18);
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setFontColor("#000000");
    obj.edit1:setWidth(774);
    obj.edit1:setHeight(73);
    obj.edit1:setTransparent(true);
    obj.edit1:setName("edit1");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.image2 ~= nil then self.image2:destroy(); self.image2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.richEdit1 ~= nil then self.richEdit1:destroy(); self.richEdit1 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmkpta8_svg()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmkpta8_svg();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmkpta8_svg = {
    newEditor = newfrmkpta8_svg, 
    new = newfrmkpta8_svg, 
    name = "frmkpta8_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmkpta8_svg = _frmkpta8_svg;
Firecast.registrarForm(_frmkpta8_svg);

return _frmkpta8_svg;
