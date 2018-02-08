require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmSkillItem()
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
    obj:setName("frmSkillItem");
    obj:setWidth(365);
    obj:setHeight(25);
    obj:setMargins({top=1, right=5});

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#212121");
    obj.rectangle1:setName("rectangle1");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle1);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome");
    obj.edit1:setName("edit1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.rectangle1);
    obj.rectangle2:setLeft(100);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(30);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(100);
    obj.label1:setTop(3);
    obj.label1:setWidth(30);
    obj.label1:setHeight(20);
    obj.label1:setField("nh");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.rectangle1);
    obj.comboBox1:setLeft(130);
    obj.comboBox1:setTop(0);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setHeight(25);
    obj.comboBox1:setField("atr");
    obj.comboBox1:setItems({'ST', 'DX', 'IQ', 'HT', 'VT', 'PR', '-'});
    obj.comboBox1:setName("comboBox1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(180);
    obj.label2:setTop(3);
    obj.label2:setWidth(10);
    obj.label2:setHeight(20);
    obj.label2:setText("+");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle1);
    obj.edit2:setLeft(190);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(25);
    obj.edit2:setType("number");
    obj.edit2:setField("bonus");
    obj.edit2:setName("edit2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(220);
    obj.label3:setTop(3);
    obj.label3:setWidth(10);
    obj.label3:setHeight(20);
    obj.label3:setText("-");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle1);
    obj.edit3:setLeft(230);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(25);
    obj.edit3:setType("number");
    obj.edit3:setField("penalidade");
    obj.edit3:setName("edit3");

    obj.comboBox2 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox2:setParent(obj.rectangle1);
    obj.comboBox2:setLeft(260);
    obj.comboBox2:setTop(0);
    obj.comboBox2:setWidth(55);
    obj.comboBox2:setHeight(25);
    obj.comboBox2:setField("dificuldade");
    obj.comboBox2:setItems({'F', 'M', 'D', 'MD'});
    obj.comboBox2:setValues({'F', 'M', 'D', 'MD'});
    obj.comboBox2:setName("comboBox2");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle1);
    obj.edit4:setLeft(315);
    obj.edit4:setTop(3);
    obj.edit4:setWidth(25);
    obj.edit4:setHeight(20);
    obj.edit4:setField("pts");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(340);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("X");
    obj.button1:setName("button1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.rectangle1);
    obj.dataLink1:setFields({'atr', 'bonus', 'penalidade'});
    obj.dataLink1:setName("dataLink1");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            dialogs.confirmOkCancel("Tem certeza que quer apagar esse objeto?",
            					function (confirmado)
            						if confirmado then
            							ndb.deleteNode(sheet);
            						end;
            				end);
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet==nil then return end;
            
            				local nh = (tonumber(sheet.bonus) or 0) - 
            							(tonumber(sheet.penalidade) or 0);
            
            				local mod = 0;
            				local node = ndb.getRoot(sheet);
            				if sheet.atr=="ST" then
            					mod = (tonumber(node.atributos_mod_st) or 0);
            				elseif sheet.atr=="DX" then
            					mod = (tonumber(node.atributos_mod_dx) or 0);
            				elseif sheet.atr=="IQ" then
            					mod = (tonumber(node.atributos_mod_iq) or 0);
            				elseif sheet.atr=="HT" then
            					mod = (tonumber(node.atributos_mod_ht) or 0);
            				elseif sheet.atr=="VT" then
            					mod = (tonumber(node.atributos_mod_vt) or 0);
            				elseif sheet.atr=="PR" then
            					mod = (tonumber(node.atributos_mod_per) or 0);
            				else
            					mod = 0;
            				end
            
            				sheet.nh = nh + mod;
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

        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.comboBox2 ~= nil then self.comboBox2:destroy(); self.comboBox2 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmSkillItem = {
    newEditor = newfrmSkillItem, 
    new = newfrmSkillItem, 
    name = "frmSkillItem", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmSkillItem = _frmSkillItem;
rrpg.registrarForm(_frmSkillItem);

return _frmSkillItem;
