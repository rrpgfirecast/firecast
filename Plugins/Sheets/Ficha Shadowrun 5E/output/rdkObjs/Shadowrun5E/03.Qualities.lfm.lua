require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmQualities()
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
    obj:setName("frmQualities");
    obj:setAlign("client");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(410);
    obj.layout1:setHeight(685);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(410);
    obj.label1:setHeight(20);
    obj.label1:setText("POSITIVE QUALITIES");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(5);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("NAME");
    obj.label2:setLeft(5);
    obj.label2:setTop(25);
    obj.label2:setWidth(150);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setText("NOTES");
    obj.label3:setLeft(155);
    obj.label3:setTop(25);
    obj.label3:setWidth(150);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setText("KARMA");
    obj.label4:setLeft(305);
    obj.label4:setTop(25);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.rclPositiveQualities = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclPositiveQualities:setParent(obj.layout1);
    obj.rclPositiveQualities:setName("rclPositiveQualities");
    obj.rclPositiveQualities:setField("positiveQualityList");
    obj.rclPositiveQualities:setTemplateForm("frmQuality");
    obj.rclPositiveQualities:setLeft(5);
    obj.rclPositiveQualities:setTop(50);
    obj.rclPositiveQualities:setWidth(400);
    obj.rclPositiveQualities:setHeight(625);
    obj.rclPositiveQualities:setLayout("vertical");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(415);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(410);
    obj.layout2:setHeight(685);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(5);
    obj.label5:setTop(0);
    obj.label5:setWidth(410);
    obj.label5:setHeight(20);
    obj.label5:setText("NEGATIVE QUALITIES");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("+");
    obj.button2:setLeft(5);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setText("NAME");
    obj.label6:setLeft(5);
    obj.label6:setTop(25);
    obj.label6:setWidth(150);
    obj.label6:setHeight(20);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setText("NOTES");
    obj.label7:setLeft(155);
    obj.label7:setTop(25);
    obj.label7:setWidth(150);
    obj.label7:setHeight(20);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setText("KARMA");
    obj.label8:setLeft(305);
    obj.label8:setTop(25);
    obj.label8:setWidth(50);
    obj.label8:setHeight(20);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.rclNegativeQualities = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclNegativeQualities:setParent(obj.layout2);
    obj.rclNegativeQualities:setName("rclNegativeQualities");
    obj.rclNegativeQualities:setField("negativeQualityList");
    obj.rclNegativeQualities:setTemplateForm("frmQuality");
    obj.rclNegativeQualities:setLeft(5);
    obj.rclNegativeQualities:setTop(50);
    obj.rclNegativeQualities:setWidth(400);
    obj.rclNegativeQualities:setHeight(625);
    obj.rclNegativeQualities:setLayout("vertical");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(830);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(360);
    obj.layout3:setHeight(685);
    obj.layout3:setName("layout3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout3);
    obj.label9:setLeft(5);
    obj.label9:setTop(0);
    obj.label9:setWidth(360);
    obj.label9:setHeight(20);
    obj.label9:setText("CONTACTS");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout3);
    obj.button3:setText("+");
    obj.button3:setLeft(5);
    obj.button3:setTop(0);
    obj.button3:setWidth(25);
    obj.button3:setHeight(25);
    obj.button3:setName("button3");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout3);
    obj.label10:setText("NAME");
    obj.label10:setLeft(5);
    obj.label10:setTop(25);
    obj.label10:setWidth(150);
    obj.label10:setHeight(20);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout3);
    obj.label11:setText("LOYALTY");
    obj.label11:setLeft(155);
    obj.label11:setTop(25);
    obj.label11:setWidth(50);
    obj.label11:setHeight(20);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(12);
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout3);
    obj.label12:setText("CONNECTION");
    obj.label12:setLeft(205);
    obj.label12:setTop(25);
    obj.label12:setWidth(50);
    obj.label12:setHeight(20);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(7);
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout3);
    obj.label13:setText("FAVOR");
    obj.label13:setLeft(255);
    obj.label13:setTop(25);
    obj.label13:setWidth(50);
    obj.label13:setHeight(20);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.rclContacts = gui.fromHandle(_obj_newObject("recordList"));
    obj.rclContacts:setParent(obj.layout3);
    obj.rclContacts:setName("rclContacts");
    obj.rclContacts:setField("contactList");
    obj.rclContacts:setTemplateForm("frmContact");
    obj.rclContacts:setLeft(5);
    obj.rclContacts:setTop(50);
    obj.rclContacts:setWidth(350);
    obj.rclContacts:setHeight(625);
    obj.rclContacts:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            self.rclPositiveQualities:append();
        end, obj);

    obj._e_event1 = obj.rclPositiveQualities:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.quality_name, nodeB.quality_name);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (self)
            self.rclNegativeQualities:append();
        end, obj);

    obj._e_event3 = obj.rclNegativeQualities:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.quality_name, nodeB.quality_name);
        end, obj);

    obj._e_event4 = obj.button3:addEventListener("onClick",
        function (self)
            self.rclContacts:append();
        end, obj);

    obj._e_event5 = obj.rclContacts:addEventListener("onCompare",
        function (self, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.contact_name, nodeB.contact_name);
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

        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.rclNegativeQualities ~= nil then self.rclNegativeQualities:destroy(); self.rclNegativeQualities = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.rclPositiveQualities ~= nil then self.rclPositiveQualities:destroy(); self.rclPositiveQualities = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.rclContacts ~= nil then self.rclContacts:destroy(); self.rclContacts = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmQualities = {
    newEditor = newfrmQualities, 
    new = newfrmQualities, 
    name = "frmQualities", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmQualities = _frmQualities;
rrpg.registrarForm(_frmQualities);

return _frmQualities;
