require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newpericia()
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
    obj:setName("pericia");
    obj:setHeight(100);
    obj:setWidth(700);

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setName("rectangle1");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj.rectangle1);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.flowLayout1 = gui.fromHandle(_obj_newObject("flowLayout"));
    obj.flowLayout1:setParent(obj.scrollBox1);
    obj.flowLayout1:setAlign("client");
    obj.flowLayout1:setHeight(500);
    obj.flowLayout1:setAutoHeight(true);
    obj.flowLayout1:setHorzAlign("center");
    obj.flowLayout1:setLineSpacing(3);
    obj.flowLayout1:setName("flowLayout1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.flowLayout1);
    obj.label1:setText("Nome da Pericia");
    obj.label1:setWidth(170);
    obj.label1:setHeight(30);
    obj.label1:setLeft(30);
    obj.label1:setFontColor("black");
    obj.label1:setName("label1");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.flowLayout1);
    obj.checkBox1:setHeight(30);
    obj.checkBox1:setTop(35);
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.flowLayout1);
    obj.edit1:setWidth(170);
    obj.edit1:setLeft(30);
    obj.edit1:setField("nomepericia");
    obj.edit1:setHeight(30);
    obj.edit1:setTop(35);
    obj.edit1:setFontColor("black");
    obj.edit1:setName("edit1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.flowLayout1);
    obj.label2:setText("Habilidade Chave");
    obj.label2:setLeft(200);
    obj.label2:setWidth(100);
    obj.label2:setHeight(30);
    obj.label2:setFontColor("black");
    obj.label2:setName("label2");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.flowLayout1);
    obj.comboBox1:setField("modhabpericia");
    obj.comboBox1:setItems({'FOR', 'DES', 'CON', 'INT', 'SAB', 'CAR'});
    obj.comboBox1:setValues({'1', '2', '3', '4', '5', '6'});
    obj.comboBox1:setValue("E");
    obj.comboBox1:setWidth(70);
    obj.comboBox1:setHeight(30);
    obj.comboBox1:setTop(35);
    obj.comboBox1:setLeft(200);
    obj.comboBox1:setHorzTextAlign("center");
    obj.comboBox1:setFontColor("black");
    obj.comboBox1:setName("comboBox1");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.flowLayout1);
    obj.label3:setText("Total");
    obj.label3:setLeft(300);
    obj.label3:setWidth(100);
    obj.label3:setHeight(30);
    obj.label3:setFontColor("black");
    obj.label3:setName("label3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.flowLayout1);
    obj.edit2:setField("51");
    obj.edit2:setWidth(70);
    obj.edit2:setHeight(30);
    obj.edit2:setLeft(300);
    obj.edit2:setTop(35);
    obj.edit2:setFontColor("black");
    obj.edit2:setName("edit2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.flowLayout1);
    obj.label4:setText("Habilidade");
    obj.label4:setLeft(400);
    obj.label4:setWidth(100);
    obj.label4:setHeight(30);
    obj.label4:setFontColor("black");
    obj.label4:setName("label4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.flowLayout1);
    obj.edit3:setField("habpericia");
    obj.edit3:setWidth(70);
    obj.edit3:setHeight(30);
    obj.edit3:setLeft(400);
    obj.edit3:setTop(35);
    obj.edit3:setFontColor("black");
    obj.edit3:setName("edit3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.flowLayout1);
    obj.label5:setText("Graduacao");
    obj.label5:setLeft(500);
    obj.label5:setWidth(100);
    obj.label5:setHeight(30);
    obj.label5:setFontColor("black");
    obj.label5:setName("label5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.flowLayout1);
    obj.edit4:setField("52");
    obj.edit4:setWidth(70);
    obj.edit4:setHeight(30);
    obj.edit4:setLeft(500);
    obj.edit4:setTop(35);
    obj.edit4:setFontColor("black");
    obj.edit4:setName("edit4");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.flowLayout1);
    obj.label6:setText("Outros");
    obj.label6:setLeft(600);
    obj.label6:setWidth(100);
    obj.label6:setHeight(30);
    obj.label6:setFontColor("black");
    obj.label6:setName("label6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.flowLayout1);
    obj.edit5:setField("53");
    obj.edit5:setWidth(70);
    obj.edit5:setHeight(30);
    obj.edit5:setLeft(600);
    obj.edit5:setTop(35);
    obj.edit5:setFontColor("black");
    obj.edit5:setName("edit5");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.flowLayout1);
    obj.button1:setText("Apagar");
    obj.button1:setFontSize(10);
    obj.button1:setWidth(100);
    obj.button1:setTop(70);
    obj.button1:setLeft(210);
    obj.button1:setName("button1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            ndb.deleteNode(sheet);
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
        if self.flowLayout1 ~= nil then self.flowLayout1:destroy(); self.flowLayout1 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _pericia = {
    newEditor = newpericia, 
    new = newpericia, 
    name = "pericia", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

pericia = _pericia;
rrpg.registrarForm(_pericia);

return _pericia;
