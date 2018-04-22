require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmItem()
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
    obj:setName("frmItem");
    obj:setWidth(1200);
    obj:setHeight(25);
    obj:setMargins({top=1});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(200);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(700);
    obj.edit2:setHeight(25);
    obj.edit2:setField("efeito");
    obj.edit2:setName("edit2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(900);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(150);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("tipo");
    obj.comboBox1:setItems({'Consumível', 'Material', 'Arma', 'Equipamento'});
    obj.comboBox1:setName("comboBox1");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(1050);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("quantidade");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(1100);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("max");
    obj.edit4:setName("edit4");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(1150);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar esse item??",
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

        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmItem = {
    newEditor = newfrmItem, 
    new = newfrmItem, 
    name = "frmItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmItem = _frmItem;
rrpg.registrarForm(_frmItem);

return _frmItem;
