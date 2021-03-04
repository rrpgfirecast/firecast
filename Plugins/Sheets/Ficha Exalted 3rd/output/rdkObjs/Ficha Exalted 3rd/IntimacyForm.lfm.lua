require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmIntimacyForm()
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
    obj:setName("frmIntimacyForm");
    obj:setWidth(550);
    obj:setHeight(50);
    obj:setMargins({right=5,bottom=5});
    obj:setTheme("dark");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("dimgray");
    obj.rectangle1:setName("rectangle1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.rectangle1);
    obj.layout1:setAlign("left");
    obj.layout1:setWidth(100);
    obj.layout1:setMargins({right=5});
    obj.layout1:setName("layout1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setText("Type");
    obj.label1:setWidth(100);
    obj.label1:setHorzTextAlign("leading");
    obj.label1:setFontSize(13);
    obj.label1:setName("label1");

    obj.comboBox1 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout1);
    obj.comboBox1:setTop(20);
    obj.comboBox1:setField("type");
    obj.comboBox1:setWidth(100);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setItems({'Principle','Tie'});
    obj.comboBox1:setValues({'1','2'});
    obj.comboBox1:setFontSize(13);
    obj.comboBox1:setName("comboBox1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.rectangle1);
    obj.layout2:setAlign("left");
    obj.layout2:setWidth(200);
    obj.layout2:setMargins({right=5});
    obj.layout2:setName("layout2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setText("Intimacy");
    obj.label2:setWidth(200);
    obj.label2:setHorzTextAlign("leading");
    obj.label2:setFontSize(13);
    obj.label2:setName("label2");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setTop(20);
    obj.edit1:setField("intimacy");
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setName("edit1");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.rectangle1);
    obj.layout3:setAlign("left");
    obj.layout3:setWidth(100);
    obj.layout3:setMargins({right=5});
    obj.layout3:setName("layout3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setText("Nature");
    obj.label3:setWidth(100);
    obj.label3:setHorzTextAlign("leading");
    obj.label3:setFontSize(13);
    obj.label3:setName("label3");

    obj.comboBox2 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.layout3);
    obj.comboBox2:setTop(20);
    obj.comboBox2:setField("nature");
    obj.comboBox2:setWidth(100);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setItems({'Negative','Positive'});
    obj.comboBox2:setValues({'1','2'});
    obj.comboBox2:setFontSize(13);
    obj.comboBox2:setName("comboBox2");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.rectangle1);
    obj.layout4:setAlign("left");
    obj.layout4:setWidth(100);
    obj.layout4:setMargins({right=5});
    obj.layout4:setName("layout4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setText("Intensity");
    obj.label4:setWidth(100);
    obj.label4:setHorzTextAlign("leading");
    obj.label4:setFontSize(13);
    obj.label4:setName("label4");

    obj.comboBox3 = GUI.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox3:setParent(obj.layout4);
    obj.comboBox3:setTop(20);
    obj.comboBox3:setField("intensity");
    obj.comboBox3:setWidth(100);
    obj.comboBox3:setHeight(25);
    obj.comboBox3:setItems({'Minor','Major','Defining'});
    obj.comboBox3:setValues({'1','2','3'});
    obj.comboBox3:setFontSize(13);
    obj.comboBox3:setName("comboBox3");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setMargins({left=5});
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            dialogs.confirmOkCancel("Tem certeza que quer apagar?",
            					function (confirmado)
            						if confirmado then
            							ndb.deleteNode(sheet);
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.comboBox3 ~= nil then self.comboBox3:destroy(); self.comboBox3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmIntimacyForm()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmIntimacyForm();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmIntimacyForm = {
    newEditor = newfrmIntimacyForm, 
    new = newfrmIntimacyForm, 
    name = "frmIntimacyForm", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmIntimacyForm = _frmIntimacyForm;
Firecast.registrarForm(_frmIntimacyForm);

return _frmIntimacyForm;
