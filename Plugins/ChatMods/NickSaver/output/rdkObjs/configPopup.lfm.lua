require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_nicksaverPopup()
    local obj = GUI.fromHandle(_obj_newObject("popupForm"));
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
    obj:setName("nicksaverPopup");
    obj:setFormType("undefined");
    obj:setDataType("ambesek.afkbot");
    obj:setTitle("AfkBot");
    obj:setWidth(290);
    obj:setHeight(300);

    obj.checkBox1 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj);
    obj.checkBox1:setField("nickSaved");
    obj.checkBox1:setLeft(10);
    obj.checkBox1:setTop(10);
    obj.checkBox1:setWidth(150);
    obj.checkBox1:setText("Nick nessa mesa: ");
    obj.checkBox1:setHorzTextAlign("center");
    obj.checkBox1:setName("checkBox1");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj);
    obj.edit1:setLeft(160);
    obj.edit1:setTop(10);
    obj.edit1:setWidth(120);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nick");
    obj.edit1:setName("edit1");

    obj.horzLine1 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine1:setParent(obj);
    obj.horzLine1:setLeft(10);
    obj.horzLine1:setTop(40);
    obj.horzLine1:setWidth(270);
    obj.horzLine1:setName("horzLine1");

    obj.checkBox2 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj);
    obj.checkBox2:setField("colorBaseSaved");
    obj.checkBox2:setLeft(10);
    obj.checkBox2:setTop(45);
    obj.checkBox2:setWidth(150);
    obj.checkBox2:setText("Cor base: ");
    obj.checkBox2:setHorzTextAlign("center");
    obj.checkBox2:setName("checkBox2");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj);
    obj.edit2:setLeft(160);
    obj.edit2:setTop(45);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("colorBase");
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setMax(28);
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.checkBox3 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj);
    obj.checkBox3:setField("colorTalkSaved");
    obj.checkBox3:setLeft(10);
    obj.checkBox3:setTop(70);
    obj.checkBox3:setWidth(150);
    obj.checkBox3:setText("Cor de fala: ");
    obj.checkBox3:setHorzTextAlign("center");
    obj.checkBox3:setName("checkBox3");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj);
    obj.edit3:setLeft(160);
    obj.edit3:setTop(70);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("colorTalk");
    obj.edit3:setType("number");
    obj.edit3:setMin(0);
    obj.edit3:setMax(28);
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.checkBox4 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj);
    obj.checkBox4:setField("colorActSaved");
    obj.checkBox4:setLeft(10);
    obj.checkBox4:setTop(95);
    obj.checkBox4:setWidth(150);
    obj.checkBox4:setText("Cor de ação: ");
    obj.checkBox4:setHorzTextAlign("center");
    obj.checkBox4:setName("checkBox4");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj);
    obj.edit4:setLeft(160);
    obj.edit4:setTop(95);
    obj.edit4:setWidth(50);
    obj.edit4:setHeight(25);
    obj.edit4:setField("colorAct");
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setMax(28);
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.checkBox5 = GUI.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj);
    obj.checkBox5:setField("colorThoughtSaved");
    obj.checkBox5:setLeft(10);
    obj.checkBox5:setTop(120);
    obj.checkBox5:setWidth(150);
    obj.checkBox5:setText("Cor de pensamento: ");
    obj.checkBox5:setHorzTextAlign("center");
    obj.checkBox5:setName("checkBox5");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj);
    obj.edit5:setLeft(160);
    obj.edit5:setTop(120);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("colorThought");
    obj.edit5:setType("number");
    obj.edit5:setMin(0);
    obj.edit5:setMax(28);
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.horzLine2 = GUI.fromHandle(_obj_newObject("horzLine"));
    obj.horzLine2:setParent(obj);
    obj.horzLine2:setLeft(10);
    obj.horzLine2:setTop(150);
    obj.horzLine2:setWidth(270);
    obj.horzLine2:setName("horzLine2");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj);
    obj.rectangle1:setLeft(10);
    obj.rectangle1:setTop(155);
    obj.rectangle1:setWidth(20);
    obj.rectangle1:setHeight(20);
    obj.rectangle1:setColor("#000000");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj);
    obj.label1:setLeft(10);
    obj.label1:setTop(175);
    obj.label1:setWidth(20);
    obj.label1:setHeight(20);
    obj.label1:setText("0");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj);
    obj.rectangle2:setLeft(35);
    obj.rectangle2:setTop(155);
    obj.rectangle2:setWidth(20);
    obj.rectangle2:setHeight(20);
    obj.rectangle2:setColor("#FFFFFF");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj);
    obj.label2:setLeft(35);
    obj.label2:setTop(175);
    obj.label2:setWidth(20);
    obj.label2:setHeight(20);
    obj.label2:setText("1");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj);
    obj.rectangle3:setLeft(60);
    obj.rectangle3:setTop(155);
    obj.rectangle3:setWidth(20);
    obj.rectangle3:setHeight(20);
    obj.rectangle3:setColor("#7F7FFF");
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj);
    obj.label3:setLeft(60);
    obj.label3:setTop(175);
    obj.label3:setWidth(20);
    obj.label3:setHeight(20);
    obj.label3:setText("2");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj);
    obj.rectangle4:setLeft(85);
    obj.rectangle4:setTop(155);
    obj.rectangle4:setWidth(20);
    obj.rectangle4:setHeight(20);
    obj.rectangle4:setColor("#7FFF7F");
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj);
    obj.label4:setLeft(85);
    obj.label4:setTop(175);
    obj.label4:setWidth(20);
    obj.label4:setHeight(20);
    obj.label4:setText("3");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj);
    obj.rectangle5:setLeft(110);
    obj.rectangle5:setTop(155);
    obj.rectangle5:setWidth(20);
    obj.rectangle5:setHeight(20);
    obj.rectangle5:setColor("#FF0000");
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj);
    obj.label5:setLeft(110);
    obj.label5:setTop(175);
    obj.label5:setWidth(20);
    obj.label5:setHeight(20);
    obj.label5:setText("4");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj);
    obj.rectangle6:setLeft(135);
    obj.rectangle6:setTop(155);
    obj.rectangle6:setWidth(20);
    obj.rectangle6:setHeight(20);
    obj.rectangle6:setColor("#FF7F7F");
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj);
    obj.label6:setLeft(135);
    obj.label6:setTop(175);
    obj.label6:setWidth(20);
    obj.label6:setHeight(20);
    obj.label6:setText("5");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj);
    obj.rectangle7:setLeft(160);
    obj.rectangle7:setTop(155);
    obj.rectangle7:setWidth(20);
    obj.rectangle7:setHeight(20);
    obj.rectangle7:setColor("#FF7FFF");
    obj.rectangle7:setName("rectangle7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj);
    obj.label7:setLeft(160);
    obj.label7:setTop(175);
    obj.label7:setWidth(20);
    obj.label7:setHeight(20);
    obj.label7:setText("6");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj);
    obj.rectangle8:setLeft(185);
    obj.rectangle8:setTop(155);
    obj.rectangle8:setWidth(20);
    obj.rectangle8:setHeight(20);
    obj.rectangle8:setColor("#FF7F00");
    obj.rectangle8:setName("rectangle8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj);
    obj.label8:setLeft(185);
    obj.label8:setTop(175);
    obj.label8:setWidth(20);
    obj.label8:setHeight(20);
    obj.label8:setText("7");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj);
    obj.rectangle9:setLeft(210);
    obj.rectangle9:setTop(155);
    obj.rectangle9:setWidth(20);
    obj.rectangle9:setHeight(20);
    obj.rectangle9:setColor("#FFFF00");
    obj.rectangle9:setName("rectangle9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj);
    obj.label9:setLeft(210);
    obj.label9:setTop(175);
    obj.label9:setWidth(20);
    obj.label9:setHeight(20);
    obj.label9:setText("8");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj);
    obj.rectangle10:setLeft(235);
    obj.rectangle10:setTop(155);
    obj.rectangle10:setWidth(20);
    obj.rectangle10:setHeight(20);
    obj.rectangle10:setColor("#00FF00");
    obj.rectangle10:setName("rectangle10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj);
    obj.label10:setLeft(235);
    obj.label10:setTop(175);
    obj.label10:setWidth(20);
    obj.label10:setHeight(20);
    obj.label10:setText("9");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj);
    obj.rectangle11:setLeft(10);
    obj.rectangle11:setTop(200);
    obj.rectangle11:setWidth(20);
    obj.rectangle11:setHeight(20);
    obj.rectangle11:setColor("#7FFFFF");
    obj.rectangle11:setName("rectangle11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj);
    obj.label11:setLeft(10);
    obj.label11:setTop(220);
    obj.label11:setWidth(20);
    obj.label11:setHeight(20);
    obj.label11:setText("10");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj);
    obj.rectangle12:setLeft(35);
    obj.rectangle12:setTop(200);
    obj.rectangle12:setWidth(20);
    obj.rectangle12:setHeight(20);
    obj.rectangle12:setColor("#00FFFF");
    obj.rectangle12:setName("rectangle12");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj);
    obj.label12:setLeft(35);
    obj.label12:setTop(220);
    obj.label12:setWidth(20);
    obj.label12:setHeight(20);
    obj.label12:setText("11");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.rectangle13 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj);
    obj.rectangle13:setLeft(60);
    obj.rectangle13:setTop(200);
    obj.rectangle13:setWidth(20);
    obj.rectangle13:setHeight(20);
    obj.rectangle13:setColor("#0000FF");
    obj.rectangle13:setName("rectangle13");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj);
    obj.label13:setLeft(60);
    obj.label13:setTop(220);
    obj.label13:setWidth(20);
    obj.label13:setHeight(20);
    obj.label13:setText("12");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.rectangle14 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj);
    obj.rectangle14:setLeft(85);
    obj.rectangle14:setTop(200);
    obj.rectangle14:setWidth(20);
    obj.rectangle14:setHeight(20);
    obj.rectangle14:setColor("#FF00FF");
    obj.rectangle14:setName("rectangle14");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj);
    obj.label14:setLeft(85);
    obj.label14:setTop(220);
    obj.label14:setWidth(20);
    obj.label14:setHeight(20);
    obj.label14:setText("13");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.rectangle15 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj);
    obj.rectangle15:setLeft(110);
    obj.rectangle15:setTop(200);
    obj.rectangle15:setWidth(20);
    obj.rectangle15:setHeight(20);
    obj.rectangle15:setColor("#7F7F7F");
    obj.rectangle15:setName("rectangle15");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj);
    obj.label15:setLeft(110);
    obj.label15:setTop(220);
    obj.label15:setWidth(20);
    obj.label15:setHeight(20);
    obj.label15:setText("14");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.rectangle16 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj);
    obj.rectangle16:setLeft(135);
    obj.rectangle16:setTop(200);
    obj.rectangle16:setWidth(20);
    obj.rectangle16:setHeight(20);
    obj.rectangle16:setColor("#3F3F3F");
    obj.rectangle16:setName("rectangle16");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj);
    obj.label16:setLeft(135);
    obj.label16:setTop(220);
    obj.label16:setWidth(20);
    obj.label16:setHeight(20);
    obj.label16:setText("15");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.rectangle17 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj);
    obj.rectangle17:setLeft(160);
    obj.rectangle17:setTop(200);
    obj.rectangle17:setWidth(20);
    obj.rectangle17:setHeight(20);
    obj.rectangle17:setColor("#0F0F0F");
    obj.rectangle17:setName("rectangle17");

    obj.label17 = GUI.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj);
    obj.label17:setLeft(160);
    obj.label17:setTop(220);
    obj.label17:setWidth(20);
    obj.label17:setHeight(20);
    obj.label17:setText("16");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.rectangle18 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj);
    obj.rectangle18:setLeft(185);
    obj.rectangle18:setTop(200);
    obj.rectangle18:setWidth(20);
    obj.rectangle18:setHeight(20);
    obj.rectangle18:setColor("#1F1F1F");
    obj.rectangle18:setName("rectangle18");

    obj.label18 = GUI.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj);
    obj.label18:setLeft(185);
    obj.label18:setTop(220);
    obj.label18:setWidth(20);
    obj.label18:setHeight(20);
    obj.label18:setText("17");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.rectangle19 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj);
    obj.rectangle19:setLeft(210);
    obj.rectangle19:setTop(200);
    obj.rectangle19:setWidth(20);
    obj.rectangle19:setHeight(20);
    obj.rectangle19:setColor("#777777");
    obj.rectangle19:setName("rectangle19");

    obj.label19 = GUI.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj);
    obj.label19:setLeft(210);
    obj.label19:setTop(220);
    obj.label19:setWidth(20);
    obj.label19:setHeight(20);
    obj.label19:setText("18");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.rectangle20 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj);
    obj.rectangle20:setLeft(235);
    obj.rectangle20:setTop(200);
    obj.rectangle20:setWidth(20);
    obj.rectangle20:setHeight(20);
    obj.rectangle20:setColor("#111111");
    obj.rectangle20:setName("rectangle20");

    obj.label20 = GUI.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj);
    obj.label20:setLeft(235);
    obj.label20:setTop(220);
    obj.label20:setWidth(20);
    obj.label20:setHeight(20);
    obj.label20:setText("19");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.rectangle21 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj);
    obj.rectangle21:setLeft(10);
    obj.rectangle21:setTop(245);
    obj.rectangle21:setWidth(20);
    obj.rectangle21:setHeight(20);
    obj.rectangle21:setColor("#292929");
    obj.rectangle21:setName("rectangle21");

    obj.label21 = GUI.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj);
    obj.label21:setLeft(10);
    obj.label21:setTop(265);
    obj.label21:setWidth(20);
    obj.label21:setHeight(20);
    obj.label21:setText("20");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.rectangle22 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj);
    obj.rectangle22:setLeft(35);
    obj.rectangle22:setTop(245);
    obj.rectangle22:setWidth(20);
    obj.rectangle22:setHeight(20);
    obj.rectangle22:setColor("#191200");
    obj.rectangle22:setName("rectangle22");

    obj.label22 = GUI.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj);
    obj.label22:setLeft(35);
    obj.label22:setTop(265);
    obj.label22:setWidth(20);
    obj.label22:setHeight(20);
    obj.label22:setText("21");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.rectangle23 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj);
    obj.rectangle23:setLeft(60);
    obj.rectangle23:setTop(245);
    obj.rectangle23:setWidth(20);
    obj.rectangle23:setHeight(20);
    obj.rectangle23:setColor("#6699FF");
    obj.rectangle23:setName("rectangle23");

    obj.label23 = GUI.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj);
    obj.label23:setLeft(60);
    obj.label23:setTop(265);
    obj.label23:setWidth(20);
    obj.label23:setHeight(20);
    obj.label23:setText("22");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.rectangle24 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj);
    obj.rectangle24:setLeft(85);
    obj.rectangle24:setTop(245);
    obj.rectangle24:setWidth(20);
    obj.rectangle24:setHeight(20);
    obj.rectangle24:setColor("#F2B440");
    obj.rectangle24:setName("rectangle24");

    obj.label24 = GUI.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj);
    obj.label24:setLeft(85);
    obj.label24:setTop(265);
    obj.label24:setWidth(20);
    obj.label24:setHeight(20);
    obj.label24:setText("23");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.rectangle25 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj);
    obj.rectangle25:setLeft(110);
    obj.rectangle25:setTop(245);
    obj.rectangle25:setWidth(20);
    obj.rectangle25:setHeight(20);
    obj.rectangle25:setColor("#D45252");
    obj.rectangle25:setName("rectangle25");

    obj.label25 = GUI.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj);
    obj.label25:setLeft(110);
    obj.label25:setTop(265);
    obj.label25:setWidth(20);
    obj.label25:setHeight(20);
    obj.label25:setText("24");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.rectangle26 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj);
    obj.rectangle26:setLeft(135);
    obj.rectangle26:setTop(245);
    obj.rectangle26:setWidth(20);
    obj.rectangle26:setHeight(20);
    obj.rectangle26:setColor("#D396DC");
    obj.rectangle26:setName("rectangle26");

    obj.label26 = GUI.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj);
    obj.label26:setLeft(135);
    obj.label26:setTop(265);
    obj.label26:setWidth(20);
    obj.label26:setHeight(20);
    obj.label26:setText("25");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.rectangle27 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj);
    obj.rectangle27:setLeft(160);
    obj.rectangle27:setTop(245);
    obj.rectangle27:setWidth(20);
    obj.rectangle27:setHeight(20);
    obj.rectangle27:setColor("#F47193");
    obj.rectangle27:setName("rectangle27");

    obj.label27 = GUI.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj);
    obj.label27:setLeft(160);
    obj.label27:setTop(265);
    obj.label27:setWidth(20);
    obj.label27:setHeight(20);
    obj.label27:setText("26");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.rectangle28 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj);
    obj.rectangle28:setLeft(185);
    obj.rectangle28:setTop(245);
    obj.rectangle28:setWidth(20);
    obj.rectangle28:setHeight(20);
    obj.rectangle28:setColor("#6CECB3");
    obj.rectangle28:setName("rectangle28");

    obj.label28 = GUI.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj);
    obj.label28:setLeft(185);
    obj.label28:setTop(265);
    obj.label28:setWidth(20);
    obj.label28:setHeight(20);
    obj.label28:setText("27");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.rectangle29 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj);
    obj.rectangle29:setLeft(210);
    obj.rectangle29:setTop(245);
    obj.rectangle29:setWidth(20);
    obj.rectangle29:setHeight(20);
    obj.rectangle29:setColor("#E54C27");
    obj.rectangle29:setName("rectangle29");

    obj.label29 = GUI.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj);
    obj.label29:setLeft(210);
    obj.label29:setTop(265);
    obj.label29:setWidth(20);
    obj.label29:setHeight(20);
    obj.label29:setText("28");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.horzLine1 ~= nil then self.horzLine1:destroy(); self.horzLine1 = nil; end;
        if self.horzLine2 ~= nil then self.horzLine2:destroy(); self.horzLine2 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newnicksaverPopup()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_nicksaverPopup();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _nicksaverPopup = {
    newEditor = newnicksaverPopup, 
    new = newnicksaverPopup, 
    name = "nicksaverPopup", 
    dataType = "ambesek.afkbot", 
    formType = "undefined", 
    formComponentName = "popupForm", 
    title = "AfkBot", 
    description=""};

nicksaverPopup = _nicksaverPopup;
Firecast.registrarForm(_nicksaverPopup);
Firecast.registrarDataType(_nicksaverPopup);

return _nicksaverPopup;
