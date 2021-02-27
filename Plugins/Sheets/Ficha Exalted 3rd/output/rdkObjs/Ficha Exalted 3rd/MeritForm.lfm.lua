require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMeritForm()
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
    obj:setName("frmMeritForm");
    obj:setWidth(110);
    obj:setHeight(25);
    obj:setMargins({top=1});

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setAlign("client");
    obj.edit1:setField("merit");
    obj.edit1:setWidth(150);
    obj.edit1:setName("edit1");

    obj.imageCheckBox1 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox1:setParent(obj.rectangle1);
    obj.imageCheckBox1:setAlign("right");
    obj.imageCheckBox1:setWidth(15);
    obj.imageCheckBox1:setField("merit_1");
    obj.imageCheckBox1:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox1:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox1:setName("imageCheckBox1");

    obj.imageCheckBox2 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox2:setParent(obj.rectangle1);
    obj.imageCheckBox2:setAlign("right");
    obj.imageCheckBox2:setWidth(15);
    obj.imageCheckBox2:setField("merit_2");
    obj.imageCheckBox2:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox2:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox2:setName("imageCheckBox2");

    obj.imageCheckBox3 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox3:setParent(obj.rectangle1);
    obj.imageCheckBox3:setAlign("right");
    obj.imageCheckBox3:setWidth(15);
    obj.imageCheckBox3:setField("merit_3");
    obj.imageCheckBox3:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox3:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox3:setName("imageCheckBox3");

    obj.imageCheckBox4 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox4:setParent(obj.rectangle1);
    obj.imageCheckBox4:setAlign("right");
    obj.imageCheckBox4:setWidth(15);
    obj.imageCheckBox4:setField("merit_4");
    obj.imageCheckBox4:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox4:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox4:setName("imageCheckBox4");

    obj.imageCheckBox5 = GUI.fromHandle(_obj_newObject("imageCheckBox"));
    obj.imageCheckBox5:setParent(obj.rectangle1);
    obj.imageCheckBox5:setAlign("right");
    obj.imageCheckBox5:setWidth(15);
    obj.imageCheckBox5:setField("merit_5");
    obj.imageCheckBox5:setImageChecked("/Ficha Exalted 3rd/images/ball_on.png");
    obj.imageCheckBox5:setImageUnchecked("/Ficha Exalted 3rd/images/ball_off.png");
    obj.imageCheckBox5:setName("imageCheckBox5");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("right");
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            Dialogs.confirmOkCancel("Tem certeza que quer apagar?",
            					function (confirmado)
            						if confirmado then
            							NDB.deleteNode(sheet);
            						end;
            				end);
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

        if self.imageCheckBox3 ~= nil then self.imageCheckBox3:destroy(); self.imageCheckBox3 = nil; end;
        if self.imageCheckBox2 ~= nil then self.imageCheckBox2:destroy(); self.imageCheckBox2 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.imageCheckBox5 ~= nil then self.imageCheckBox5:destroy(); self.imageCheckBox5 = nil; end;
        if self.imageCheckBox1 ~= nil then self.imageCheckBox1:destroy(); self.imageCheckBox1 = nil; end;
        if self.imageCheckBox4 ~= nil then self.imageCheckBox4:destroy(); self.imageCheckBox4 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMeritForm()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMeritForm();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMeritForm = {
    newEditor = newfrmMeritForm, 
    new = newfrmMeritForm, 
    name = "frmMeritForm", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMeritForm = _frmMeritForm;
Firecast.registrarForm(_frmMeritForm);

return _frmMeritForm;
