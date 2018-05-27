require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmInventory()
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
    obj:setName("frmInventory");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.scrollBox1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(820);
    obj.rectangle1:setHeight(300);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.rectangle1);
    obj.button1:setLeft(5);
    obj.button1:setTop(5);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setText("+");
    obj.button1:setName("button1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.rectangle1);
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(820);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setText("ARMAS");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.rectangle1);
    obj.label2:setLeft(5);
    obj.label2:setTop(30);
    obj.label2:setWidth(150);
    obj.label2:setHeight(25);
    obj.label2:setText("Nome");
    obj.label2:setFontSize(13);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.rectangle1);
    obj.label3:setLeft(155);
    obj.label3:setTop(30);
    obj.label3:setWidth(150);
    obj.label3:setHeight(25);
    obj.label3:setText("Ataque Total");
    obj.label3:setFontSize(13);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.rectangle1);
    obj.label4:setLeft(305);
    obj.label4:setTop(30);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setText("BBA");
    obj.label4:setFontSize(13);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.rectangle1);
    obj.label5:setLeft(355);
    obj.label5:setTop(30);
    obj.label5:setWidth(50);
    obj.label5:setHeight(25);
    obj.label5:setText("Modif.");
    obj.label5:setFontSize(13);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.rectangle1);
    obj.label6:setLeft(405);
    obj.label6:setTop(30);
    obj.label6:setWidth(50);
    obj.label6:setHeight(25);
    obj.label6:setText("Outros");
    obj.label6:setFontSize(13);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.rectangle1);
    obj.label7:setLeft(455);
    obj.label7:setTop(30);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setText("Dano");
    obj.label7:setFontSize(13);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.rectangle1);
    obj.label8:setLeft(510);
    obj.label8:setTop(30);
    obj.label8:setWidth(50);
    obj.label8:setHeight(25);
    obj.label8:setText("Tipo");
    obj.label8:setFontSize(13);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.rectangle1);
    obj.label9:setLeft(560);
    obj.label9:setTop(30);
    obj.label9:setWidth(50);
    obj.label9:setHeight(25);
    obj.label9:setText("Tamanho");
    obj.label9:setFontSize(11);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.rectangle1);
    obj.label10:setLeft(610);
    obj.label10:setTop(30);
    obj.label10:setWidth(50);
    obj.label10:setHeight(25);
    obj.label10:setText("Alcance");
    obj.label10:setFontSize(13);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.rectangle1);
    obj.label11:setLeft(660);
    obj.label11:setTop(30);
    obj.label11:setWidth(110);
    obj.label11:setHeight(25);
    obj.label11:setText("Qualidades");
    obj.label11:setFontSize(13);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.rclArmas = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclArmas:setParent(obj.rectangle1);
    obj.rclArmas:setLeft(5);
    obj.rclArmas:setTop(55);
    obj.rclArmas:setWidth(810);
    obj.rclArmas:setHeight(235);
    obj.rclArmas:setName("rclArmas");
    obj.rclArmas:setField("listaDeArmas");
    obj.rclArmas:setTemplateForm("frmWeaponListForm");
    obj.rclArmas:setLayout("vertical");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.scrollBox1);
    obj.rectangle2:setLeft(0);
    obj.rectangle2:setTop(305);
    obj.rectangle2:setWidth(240);
    obj.rectangle2:setHeight(300);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.rectangle2);
    obj.button2:setLeft(5);
    obj.button2:setTop(5);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setText("+");
    obj.button2:setName("button2");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.rectangle2);
    obj.label12:setLeft(0);
    obj.label12:setTop(5);
    obj.label12:setWidth(240);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("MOCHILA");
    obj.label12:setName("label12");

    obj.rclMochila = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclMochila:setParent(obj.rectangle2);
    obj.rclMochila:setLeft(0);
    obj.rclMochila:setTop(30);
    obj.rclMochila:setWidth(240);
    obj.rclMochila:setHeight(260);
    obj.rclMochila:setName("rclMochila");
    obj.rclMochila:setField("listaDeMochila");
    obj.rclMochila:setTemplateForm("frmRecordListForm");
    obj.rclMochila:setLayout("vertical");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.scrollBox1);
    obj.rectangle3:setLeft(245);
    obj.rectangle3:setTop(305);
    obj.rectangle3:setWidth(240);
    obj.rectangle3:setHeight(300);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.rectangle3);
    obj.button3:setLeft(5);
    obj.button3:setTop(5);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setText("+");
    obj.button3:setName("button3");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.rectangle3);
    obj.label13:setLeft(0);
    obj.label13:setTop(5);
    obj.label13:setWidth(240);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setText("EQUIPAMENTOS");
    obj.label13:setName("label13");

    obj.rclEquipamentos = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclEquipamentos:setParent(obj.rectangle3);
    obj.rclEquipamentos:setLeft(0);
    obj.rclEquipamentos:setTop(30);
    obj.rclEquipamentos:setWidth(240);
    obj.rclEquipamentos:setHeight(260);
    obj.rclEquipamentos:setName("rclEquipamentos");
    obj.rclEquipamentos:setField("listaDeEquipamentos");
    obj.rclEquipamentos:setTemplateForm("frmRecordListForm");
    obj.rclEquipamentos:setLayout("vertical");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.scrollBox1);
    obj.rectangle4:setLeft(490);
    obj.rectangle4:setTop(305);
    obj.rectangle4:setWidth(230);
    obj.rectangle4:setHeight(110);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.rectangle4);
    obj.label14:setLeft(0);
    obj.label14:setTop(5);
    obj.label14:setWidth(230);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setText("ARMADURA");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.rectangle4);
    obj.label15:setLeft(0);
    obj.label15:setTop(30);
    obj.label15:setWidth(100);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setText("Nome");
    obj.label15:setName("label15");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.rectangle4);
    obj.edit1:setLeft(100);
    obj.edit1:setTop(30);
    obj.edit1:setWidth(120);
    obj.edit1:setHeight(25);
    obj.edit1:setField("armadura");
    obj.edit1:setName("edit1");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.rectangle4);
    obj.label16:setLeft(0);
    obj.label16:setTop(55);
    obj.label16:setWidth(100);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setText("Bônus na CA");
    obj.label16:setName("label16");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.rectangle4);
    obj.edit2:setLeft(100);
    obj.edit2:setTop(55);
    obj.edit2:setWidth(60);
    obj.edit2:setHeight(25);
    obj.edit2:setField("ca_armadura");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setType("number");
    obj.edit2:setName("edit2");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.rectangle4);
    obj.label17:setLeft(0);
    obj.label17:setTop(80);
    obj.label17:setWidth(100);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setText("Tipo");
    obj.label17:setName("label17");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.rectangle4);
    obj.edit3:setLeft(100);
    obj.edit3:setTop(80);
    obj.edit3:setWidth(120);
    obj.edit3:setHeight(25);
    obj.edit3:setField("armadura_tipo");
    obj.edit3:setName("edit3");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.scrollBox1);
    obj.rectangle5:setLeft(490);
    obj.rectangle5:setTop(420);
    obj.rectangle5:setWidth(230);
    obj.rectangle5:setHeight(110);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.rectangle5);
    obj.label18:setLeft(0);
    obj.label18:setTop(5);
    obj.label18:setWidth(230);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setText("ESCUDO");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.rectangle5);
    obj.label19:setLeft(0);
    obj.label19:setTop(30);
    obj.label19:setWidth(100);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setText("Nome");
    obj.label19:setName("label19");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.rectangle5);
    obj.edit4:setLeft(100);
    obj.edit4:setTop(30);
    obj.edit4:setWidth(120);
    obj.edit4:setHeight(25);
    obj.edit4:setField("escudo");
    obj.edit4:setName("edit4");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.rectangle5);
    obj.label20:setLeft(0);
    obj.label20:setTop(55);
    obj.label20:setWidth(100);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setText("Bônus na CA");
    obj.label20:setName("label20");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.rectangle5);
    obj.edit5:setLeft(100);
    obj.edit5:setTop(55);
    obj.edit5:setWidth(60);
    obj.edit5:setHeight(25);
    obj.edit5:setField("ca_escudo");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setType("number");
    obj.edit5:setName("edit5");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.rectangle5);
    obj.label21:setLeft(0);
    obj.label21:setTop(80);
    obj.label21:setWidth(100);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setText("Tipo");
    obj.label21:setName("label21");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.rectangle5);
    obj.edit6:setLeft(100);
    obj.edit6:setTop(80);
    obj.edit6:setWidth(120);
    obj.edit6:setHeight(25);
    obj.edit6:setField("escudo_tipo");
    obj.edit6:setName("edit6");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclArmas:append();
        end, obj);

    obj._e_event1 = obj.rclArmas:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclMochila:append();
        end, obj);

    obj._e_event3 = obj.rclMochila:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclEquipamentos:append();
        end, obj);

    obj._e_event5 = obj.rclEquipamentos:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.nome, nodeB.nome);
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event5);
        __o_rrpgObjs.removeEventListenerById(self._e_event4);
        __o_rrpgObjs.removeEventListenerById(self._e_event3);
        __o_rrpgObjs.removeEventListenerById(self._e_event2);
        __o_rrpgObjs.removeEventListenerById(self._e_event1);
        __o_rrpgObjs.removeEventListenerById(self._e_event0);
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.rclArmas ~= nil then self.rclArmas:destroy(); self.rclArmas = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rclEquipamentos ~= nil then self.rclEquipamentos:destroy(); self.rclEquipamentos = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rclMochila ~= nil then self.rclMochila:destroy(); self.rclMochila = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmInventory = {
    newEditor = newfrmInventory, 
    new = newfrmInventory, 
    name = "frmInventory", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmInventory = _frmInventory;
rrpg.registrarForm(_frmInventory);

return _frmInventory;
