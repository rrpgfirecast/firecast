require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");

function newfrmPowers()
    __o_rrpgObjs.beginObjectsLoading();

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
    obj:setName("frmPowers");
    obj:setAlign("client");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(510);
    obj.layout1:setHeight(685);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(510);
    obj.label1:setHeight(20);
    obj.label1:setText("SPELLS - PREPARATIONS - RITUALS - COMPLEX FORMS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.button1 = GUI.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setText("+");
    obj.button1:setLeft(5);
    obj.button1:setTop(0);
    obj.button1:setWidth(25);
    obj.button1:setHeight(25);
    obj.button1:setName("button1");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setText("S/P/R/CF");
    obj.label2:setLeft(5);
    obj.label2:setTop(25);
    obj.label2:setWidth(150);
    obj.label2:setHeight(20);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setText("TYPE/TARGET");
    obj.label3:setLeft(155);
    obj.label3:setTop(25);
    obj.label3:setWidth(100);
    obj.label3:setHeight(20);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setFontSize(11);
    obj.label3:setName("label3");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setText("RANGE");
    obj.label4:setLeft(255);
    obj.label4:setTop(25);
    obj.label4:setWidth(50);
    obj.label4:setHeight(20);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setFontSize(12);
    obj.label4:setName("label4");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setText("DURATION");
    obj.label5:setLeft(305);
    obj.label5:setTop(25);
    obj.label5:setWidth(50);
    obj.label5:setHeight(20);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setFontSize(10);
    obj.label5:setName("label5");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setText("DRAIN");
    obj.label6:setLeft(355);
    obj.label6:setTop(25);
    obj.label6:setWidth(50);
    obj.label6:setHeight(20);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setFontSize(11);
    obj.label6:setName("label6");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setText("KARMA");
    obj.label7:setLeft(405);
    obj.label7:setTop(25);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setFontSize(11);
    obj.label7:setName("label7");

    obj.rclSpells = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclSpells:setParent(obj.layout1);
    obj.rclSpells:setName("rclSpells");
    obj.rclSpells:setField("spellList");
    obj.rclSpells:setTemplateForm("frmSpells");
    obj.rclSpells:setLeft(5);
    obj.rclSpells:setTop(50);
    obj.rclSpells:setWidth(500);
    obj.rclSpells:setHeight(625);
    obj.rclSpells:setLayout("vertical");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(515);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(410);
    obj.layout2:setHeight(685);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout2);
    obj.label8:setLeft(5);
    obj.label8:setTop(0);
    obj.label8:setWidth(410);
    obj.label8:setHeight(20);
    obj.label8:setText("ADEPT POWER or OTHER ABILITIES");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.button2 = GUI.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout2);
    obj.button2:setText("+");
    obj.button2:setLeft(5);
    obj.button2:setTop(0);
    obj.button2:setWidth(25);
    obj.button2:setHeight(25);
    obj.button2:setName("button2");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout2);
    obj.label9:setText("NAME");
    obj.label9:setLeft(5);
    obj.label9:setTop(25);
    obj.label9:setWidth(150);
    obj.label9:setHeight(20);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout2);
    obj.label10:setText("RATING");
    obj.label10:setLeft(155);
    obj.label10:setTop(25);
    obj.label10:setWidth(50);
    obj.label10:setHeight(20);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setFontSize(11);
    obj.label10:setName("label10");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout2);
    obj.label11:setText("NOTES");
    obj.label11:setLeft(205);
    obj.label11:setTop(25);
    obj.label11:setWidth(100);
    obj.label11:setHeight(20);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setFontSize(12);
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout2);
    obj.label12:setText("KARMA");
    obj.label12:setLeft(305);
    obj.label12:setTop(25);
    obj.label12:setWidth(50);
    obj.label12:setHeight(20);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setFontSize(11);
    obj.label12:setName("label12");

    obj.rclAbilities = GUI.fromHandle(_obj_newObject("recordList"));
    obj.rclAbilities:setParent(obj.layout2);
    obj.rclAbilities:setName("rclAbilities");
    obj.rclAbilities:setField("abilityList");
    obj.rclAbilities:setTemplateForm("frmAbilities");
    obj.rclAbilities:setLeft(5);
    obj.rclAbilities:setTop(50);
    obj.rclAbilities:setWidth(400);
    obj.rclAbilities:setHeight(625);
    obj.rclAbilities:setLayout("vertical");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (_)
            self.rclSpells:append();
        end, obj);

    obj._e_event1 = obj.rclSpells:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.spell_name, nodeB.spell_name);
        end, obj);

    obj._e_event2 = obj.button2:addEventListener("onClick",
        function (_)
            self.rclAbilities:append();
        end, obj);

    obj._e_event3 = obj.rclAbilities:addEventListener("onCompare",
        function (_, nodeA, nodeB)
            return utils.compareStringPtBr(nodeA.abilities_name, nodeB.abilities_name);
        end, obj);

    function obj:_releaseEvents()
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

        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rclSpells ~= nil then self.rclSpells:destroy(); self.rclSpells = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rclAbilities ~= nil then self.rclAbilities:destroy(); self.rclAbilities = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmPowers = {
    newEditor = newfrmPowers, 
    new = newfrmPowers, 
    name = "frmPowers", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmPowers = _frmPowers;
Firecast.registrarForm(_frmPowers);

return _frmPowers;
