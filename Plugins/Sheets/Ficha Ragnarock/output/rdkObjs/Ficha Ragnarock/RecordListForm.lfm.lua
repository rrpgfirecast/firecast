require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmRecordListForm()
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
    obj:setName("frmRecordListForm");
    obj:setWidth(575);
    obj:setHeight(25);
    obj:setMargins({top=1});
    obj:setTheme("light");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setWidth(575);
    obj.rectangle1:setHeight(25);
    obj.rectangle1:setColor("#F0FFFF");
    obj.rectangle1:setName("rectangle1");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.rectangle1);
    obj.checkBox1:setAlign("left");
    obj.checkBox1:setWidth(15);
    obj.checkBox1:setText("");
    obj.checkBox1:setField("classe");
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setAlign("left");
    obj.edit1:setWidth(100);
    obj.edit1:setField("nome");
    obj.edit1:setMargins({right=5});
    obj.edit1:setName("edit1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setAlign("left");
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setColor("#F0FFFF");
    obj.rectangle2:setStrokeColor("black");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setMargins({right=5});
    obj.rectangle2:setName("rectangle2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle2);
    obj.label1:setAlign("client");
    obj.label1:setField("total");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setVertTextAlign("center");
    obj.label1:setName("label1");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.rectangle1);
    obj.rectangle3:setAlign("left");
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setColor("#F0FFFF");
    obj.rectangle3:setStrokeColor("black");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle3);
    obj.label2:setAlign("client");
    obj.label2:setField("nivel");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setVertTextAlign("center");
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setAlign("left");
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setFontSize(9);
    obj.comboBox1:setField("mod");
    obj.comboBox1:setItems({'FOR','DES','CON','INT','SAB','CAR'});
    obj.comboBox1:setValues({'forMod','desMod','conMod','intMod','sabMod','carMod'});
    obj.comboBox1:setName("comboBox1");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.rectangle1);
    obj.rectangle4:setAlign("left");
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setColor("#F0FFFF");
    obj.rectangle4:setStrokeColor("black");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle4);
    obj.label3:setAlign("client");
    obj.label3:setField("treinamento");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setVertTextAlign("center");
    obj.label3:setName("label3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setAlign("left");
    obj.edit2:setWidth(50);
    obj.edit2:setField("outros");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setAlign("left");
    obj.button1:setWidth(25);
    obj.button1:setText("X");
    obj.button1:setMargins({left=5});
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar essa habilidade?",
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
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmRecordListForm = {
    newEditor = newfrmRecordListForm, 
    new = newfrmRecordListForm, 
    name = "frmRecordListForm", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmRecordListForm = _frmRecordListForm;
rrpg.registrarForm(_frmRecordListForm);

return _frmRecordListForm;
