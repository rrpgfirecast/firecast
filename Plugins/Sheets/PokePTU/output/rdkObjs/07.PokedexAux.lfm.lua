require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmDex()
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
    obj:setName("frmDex");
    obj:setHeight(80);
    obj:setWidth(185);
    obj:setMargins({top=2, right=5, bottom=2});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setMargins({left=5});
    obj.rectangle1:setName("rectangle1");
    obj.rectangle1:setColor("transparent");
    obj.rectangle1:setStrokeColor("white");
    obj.rectangle1:setStrokeSize(1);
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("bevel");
    obj.rectangle1:setStrokeDash("dash");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("top");
    obj.layout1:setWidth(170);
    obj.layout1:setHeight(30);
    obj.layout1:setMargins({top=5});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("Dex #:");
    obj.label1:setWidth(40);
    obj.label1:setFontSize(10);
    lfm_setPropAsString(obj.label1, "fontStyle",  "bold");
    obj.label1:setAlign("left");
    obj.label1:setMargins({left=5});
    obj.label1:setName("label1");
    obj.label1:setFontColor("Moccasin");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(45);
    obj.rectangle2:setMargins({left=5});
    obj.rectangle2:setName("rectangle2");
    obj.rectangle2:setColor("transparent");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("bevel");
    obj.rectangle2:setStrokeDash("dash");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle2);
    obj.edit1:setField("pokeNumber");
    obj.edit1:setType("number");
    obj.edit1:setAlign("client");
    obj.edit1:setTransparent(true);
    obj.edit1:setMargins({left=3,right=3});
    obj.edit1:setHorzTextAlign("center");
    obj.edit1:setName("edit1");
    obj.edit1:setFontColor("White");
    lfm_setPropAsString(obj.edit1, "fontStyle",  "bold");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.layout1);
    obj.imageCheckBox1:setWidth(20);
    obj.imageCheckBox1:setAlign("right");
    obj.imageCheckBox1:setField("pokeCaught");
    obj.imageCheckBox1:setOptimize(true);
    obj.imageCheckBox1:setMargins({left=5});
    obj.imageCheckBox1:setHint("Capturado?");
    obj.imageCheckBox1:setImageChecked("/img/pokeball-on.png");
    obj.imageCheckBox1:setImageUnchecked("/img/pokeball-off.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setAlign("right");
    obj.button1:setText("X");
    obj.button1:setHint("Apagar Entrada");
    obj.button1:setWidth(20);
    obj.button1:setMargins({left=5, right=10});
    obj.button1:setName("button1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("top");
    obj.layout2:setWidth(170);
    obj.layout2:setHeight(30);
    obj.layout2:setMargins({top=5});
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Espécie:");
    obj.label2:setWidth(40);
    obj.label2:setFontSize(10);
    lfm_setPropAsString(obj.label2, "fontStyle",  "bold");
    obj.label2:setAlign("left");
    obj.label2:setMargins({left=5});
    obj.label2:setName("label2");
    obj.label2:setFontColor("Moccasin");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout2);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(120);
    obj.rectangle3:setMargins({left=5});
    obj.rectangle3:setName("rectangle3");
    obj.rectangle3:setColor("transparent");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("bevel");
    obj.rectangle3:setStrokeDash("dash");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle3);
    obj.edit2:setField("pokeSpecie");
    obj.edit2:setAlign("client");
    obj.edit2:setTransparent(true);
    obj.edit2:setMargins({left=5,right=5});
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");
    obj.edit2:setFontColor("White");
    lfm_setPropAsString(obj.edit2, "fontStyle",  "bold");

    obj.dataLink1 = GUI.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj);
    obj.dataLink1:setFields({'pokeNumber', 'pokeCaught'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmYesNo("Deseja realmente apagar este item?",
            						function (confirmado)
            								if confirmado then
            										NDB.deleteNode(sheet);
            								end;
            						end);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (_, field, oldValue, newValue)
            local formPai = self:findControlByName("frmPtuTrainer");
            
            			if formPai ~= nil then
            				formPai.recalcDex();
            				end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmDex()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmDex();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmDex = {
    newEditor = newfrmDex, 
    new = newfrmDex, 
    name = "frmDex", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmDex = _frmDex;
Firecast.registrarForm(_frmDex);

return _frmDex;
