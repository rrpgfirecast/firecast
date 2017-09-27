require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister3o_svg()
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
    obj:setName("frmFichaRPGmeister3o_svg");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(472);
    obj.layout1:setHeight(656);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setName("rectangle1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout1);
    obj.rectangle2:setLeft(202);
    obj.rectangle2:setTop(25);
    obj.rectangle2:setWidth(33);
    obj.rectangle2:setHeight(24);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout1);
    obj.rectangle3:setLeft(267);
    obj.rectangle3:setTop(25);
    obj.rectangle3:setWidth(33);
    obj.rectangle3:setHeight(24);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout1);
    obj.rectangle4:setLeft(202);
    obj.rectangle4:setTop(50);
    obj.rectangle4:setWidth(33);
    obj.rectangle4:setHeight(24);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout1);
    obj.rectangle5:setLeft(267);
    obj.rectangle5:setTop(50);
    obj.rectangle5:setWidth(33);
    obj.rectangle5:setHeight(24);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout1);
    obj.rectangle6:setLeft(202);
    obj.rectangle6:setTop(75);
    obj.rectangle6:setWidth(33);
    obj.rectangle6:setHeight(24);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout1);
    obj.rectangle7:setLeft(267);
    obj.rectangle7:setTop(75);
    obj.rectangle7:setWidth(33);
    obj.rectangle7:setHeight(24);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout1);
    obj.rectangle8:setLeft(202);
    obj.rectangle8:setTop(100);
    obj.rectangle8:setWidth(33);
    obj.rectangle8:setHeight(24);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout1);
    obj.rectangle9:setLeft(267);
    obj.rectangle9:setTop(100);
    obj.rectangle9:setWidth(33);
    obj.rectangle9:setHeight(24);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout1);
    obj.rectangle10:setLeft(202);
    obj.rectangle10:setTop(125);
    obj.rectangle10:setWidth(33);
    obj.rectangle10:setHeight(24);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout1);
    obj.rectangle11:setLeft(267);
    obj.rectangle11:setTop(125);
    obj.rectangle11:setWidth(33);
    obj.rectangle11:setHeight(24);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout1);
    obj.rectangle12:setLeft(202);
    obj.rectangle12:setTop(150);
    obj.rectangle12:setWidth(33);
    obj.rectangle12:setHeight(24);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout1);
    obj.rectangle13:setLeft(267);
    obj.rectangle13:setTop(150);
    obj.rectangle13:setWidth(33);
    obj.rectangle13:setHeight(24);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout1);
    obj.rectangle14:setLeft(202);
    obj.rectangle14:setTop(175);
    obj.rectangle14:setWidth(33);
    obj.rectangle14:setHeight(24);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout1);
    obj.rectangle15:setLeft(267);
    obj.rectangle15:setTop(175);
    obj.rectangle15:setWidth(33);
    obj.rectangle15:setHeight(24);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout1);
    obj.rectangle16:setLeft(202);
    obj.rectangle16:setTop(200);
    obj.rectangle16:setWidth(33);
    obj.rectangle16:setHeight(24);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout1);
    obj.rectangle17:setLeft(267);
    obj.rectangle17:setTop(200);
    obj.rectangle17:setWidth(33);
    obj.rectangle17:setHeight(24);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout1);
    obj.rectangle18:setLeft(202);
    obj.rectangle18:setTop(225);
    obj.rectangle18:setWidth(33);
    obj.rectangle18:setHeight(24);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout1);
    obj.rectangle19:setLeft(267);
    obj.rectangle19:setTop(225);
    obj.rectangle19:setWidth(33);
    obj.rectangle19:setHeight(24);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout1);
    obj.rectangle20:setLeft(202);
    obj.rectangle20:setTop(250);
    obj.rectangle20:setWidth(33);
    obj.rectangle20:setHeight(24);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout1);
    obj.rectangle21:setLeft(267);
    obj.rectangle21:setTop(250);
    obj.rectangle21:setWidth(33);
    obj.rectangle21:setHeight(24);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout1);
    obj.rectangle22:setLeft(202);
    obj.rectangle22:setTop(275);
    obj.rectangle22:setWidth(33);
    obj.rectangle22:setHeight(24);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout1);
    obj.rectangle23:setLeft(267);
    obj.rectangle23:setTop(275);
    obj.rectangle23:setWidth(33);
    obj.rectangle23:setHeight(24);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout1);
    obj.rectangle24:setLeft(202);
    obj.rectangle24:setTop(300);
    obj.rectangle24:setWidth(33);
    obj.rectangle24:setHeight(24);
    obj.rectangle24:setColor("black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout1);
    obj.rectangle25:setLeft(267);
    obj.rectangle25:setTop(300);
    obj.rectangle25:setWidth(33);
    obj.rectangle25:setHeight(24);
    obj.rectangle25:setColor("black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout1);
    obj.rectangle26:setLeft(202);
    obj.rectangle26:setTop(325);
    obj.rectangle26:setWidth(33);
    obj.rectangle26:setHeight(24);
    obj.rectangle26:setColor("black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout1);
    obj.rectangle27:setLeft(267);
    obj.rectangle27:setTop(325);
    obj.rectangle27:setWidth(33);
    obj.rectangle27:setHeight(24);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setStrokeColor("white");
    obj.rectangle27:setStrokeSize(1);
    obj.rectangle27:setName("rectangle27");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout1);
    obj.rectangle28:setLeft(202);
    obj.rectangle28:setTop(350);
    obj.rectangle28:setWidth(33);
    obj.rectangle28:setHeight(24);
    obj.rectangle28:setColor("black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout1);
    obj.rectangle29:setLeft(267);
    obj.rectangle29:setTop(350);
    obj.rectangle29:setWidth(33);
    obj.rectangle29:setHeight(24);
    obj.rectangle29:setColor("black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout1);
    obj.rectangle30:setLeft(202);
    obj.rectangle30:setTop(375);
    obj.rectangle30:setWidth(33);
    obj.rectangle30:setHeight(24);
    obj.rectangle30:setColor("black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout1);
    obj.rectangle31:setLeft(267);
    obj.rectangle31:setTop(375);
    obj.rectangle31:setWidth(33);
    obj.rectangle31:setHeight(24);
    obj.rectangle31:setColor("black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout1);
    obj.rectangle32:setLeft(202);
    obj.rectangle32:setTop(400);
    obj.rectangle32:setWidth(33);
    obj.rectangle32:setHeight(24);
    obj.rectangle32:setColor("black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout1);
    obj.rectangle33:setLeft(267);
    obj.rectangle33:setTop(400);
    obj.rectangle33:setWidth(33);
    obj.rectangle33:setHeight(24);
    obj.rectangle33:setColor("black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout1);
    obj.rectangle34:setLeft(202);
    obj.rectangle34:setTop(425);
    obj.rectangle34:setWidth(33);
    obj.rectangle34:setHeight(24);
    obj.rectangle34:setColor("black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout1);
    obj.rectangle35:setLeft(267);
    obj.rectangle35:setTop(425);
    obj.rectangle35:setWidth(33);
    obj.rectangle35:setHeight(24);
    obj.rectangle35:setColor("black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout1);
    obj.rectangle36:setLeft(202);
    obj.rectangle36:setTop(450);
    obj.rectangle36:setWidth(33);
    obj.rectangle36:setHeight(24);
    obj.rectangle36:setColor("black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout1);
    obj.rectangle37:setLeft(267);
    obj.rectangle37:setTop(450);
    obj.rectangle37:setWidth(33);
    obj.rectangle37:setHeight(24);
    obj.rectangle37:setColor("black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout1);
    obj.rectangle38:setLeft(202);
    obj.rectangle38:setTop(475);
    obj.rectangle38:setWidth(33);
    obj.rectangle38:setHeight(24);
    obj.rectangle38:setColor("black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout1);
    obj.rectangle39:setLeft(267);
    obj.rectangle39:setTop(475);
    obj.rectangle39:setWidth(33);
    obj.rectangle39:setHeight(24);
    obj.rectangle39:setColor("black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout1);
    obj.rectangle40:setLeft(202);
    obj.rectangle40:setTop(500);
    obj.rectangle40:setWidth(33);
    obj.rectangle40:setHeight(24);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setStrokeColor("white");
    obj.rectangle40:setStrokeSize(1);
    obj.rectangle40:setName("rectangle40");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout1);
    obj.rectangle41:setLeft(267);
    obj.rectangle41:setTop(500);
    obj.rectangle41:setWidth(33);
    obj.rectangle41:setHeight(24);
    obj.rectangle41:setColor("black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout1);
    obj.rectangle42:setLeft(202);
    obj.rectangle42:setTop(525);
    obj.rectangle42:setWidth(33);
    obj.rectangle42:setHeight(24);
    obj.rectangle42:setColor("black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout1);
    obj.rectangle43:setLeft(267);
    obj.rectangle43:setTop(525);
    obj.rectangle43:setWidth(33);
    obj.rectangle43:setHeight(24);
    obj.rectangle43:setColor("black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout1);
    obj.rectangle44:setLeft(202);
    obj.rectangle44:setTop(550);
    obj.rectangle44:setWidth(33);
    obj.rectangle44:setHeight(24);
    obj.rectangle44:setColor("black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout1);
    obj.rectangle45:setLeft(267);
    obj.rectangle45:setTop(550);
    obj.rectangle45:setWidth(33);
    obj.rectangle45:setHeight(24);
    obj.rectangle45:setColor("black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout1);
    obj.rectangle46:setLeft(202);
    obj.rectangle46:setTop(575);
    obj.rectangle46:setWidth(33);
    obj.rectangle46:setHeight(24);
    obj.rectangle46:setColor("black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout1);
    obj.rectangle47:setLeft(267);
    obj.rectangle47:setTop(575);
    obj.rectangle47:setWidth(33);
    obj.rectangle47:setHeight(24);
    obj.rectangle47:setColor("black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout1);
    obj.rectangle48:setLeft(202);
    obj.rectangle48:setTop(600);
    obj.rectangle48:setWidth(33);
    obj.rectangle48:setHeight(24);
    obj.rectangle48:setColor("black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout1);
    obj.rectangle49:setLeft(267);
    obj.rectangle49:setTop(600);
    obj.rectangle49:setWidth(33);
    obj.rectangle49:setHeight(24);
    obj.rectangle49:setColor("black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout1);
    obj.rectangle50:setLeft(202);
    obj.rectangle50:setTop(625);
    obj.rectangle50:setWidth(33);
    obj.rectangle50:setHeight(24);
    obj.rectangle50:setColor("black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout1);
    obj.rectangle51:setLeft(267);
    obj.rectangle51:setTop(625);
    obj.rectangle51:setWidth(33);
    obj.rectangle51:setHeight(24);
    obj.rectangle51:setColor("black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.checkBox1 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox1:setParent(obj.layout1);
    obj.checkBox1:setLeft(3);
    obj.checkBox1:setTop(28);
    obj.checkBox1:setWidth(15);
    obj.checkBox1:setHeight(15);
    obj.checkBox1:setField("per1");
    obj.checkBox1:setName("checkBox1");

    obj.checkBox2 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox2:setParent(obj.layout1);
    obj.checkBox2:setLeft(3);
    obj.checkBox2:setTop(53);
    obj.checkBox2:setWidth(15);
    obj.checkBox2:setHeight(15);
    obj.checkBox2:setField("per2");
    obj.checkBox2:setName("checkBox2");

    obj.checkBox3 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox3:setParent(obj.layout1);
    obj.checkBox3:setLeft(3);
    obj.checkBox3:setTop(78);
    obj.checkBox3:setWidth(15);
    obj.checkBox3:setHeight(15);
    obj.checkBox3:setField("per3");
    obj.checkBox3:setName("checkBox3");

    obj.checkBox4 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox4:setParent(obj.layout1);
    obj.checkBox4:setLeft(3);
    obj.checkBox4:setTop(103);
    obj.checkBox4:setWidth(15);
    obj.checkBox4:setHeight(15);
    obj.checkBox4:setField("per4");
    obj.checkBox4:setName("checkBox4");

    obj.checkBox5 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox5:setParent(obj.layout1);
    obj.checkBox5:setLeft(3);
    obj.checkBox5:setTop(128);
    obj.checkBox5:setWidth(15);
    obj.checkBox5:setHeight(15);
    obj.checkBox5:setField("per5");
    obj.checkBox5:setName("checkBox5");

    obj.checkBox6 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox6:setParent(obj.layout1);
    obj.checkBox6:setLeft(3);
    obj.checkBox6:setTop(153);
    obj.checkBox6:setWidth(15);
    obj.checkBox6:setHeight(15);
    obj.checkBox6:setField("per6");
    obj.checkBox6:setName("checkBox6");

    obj.checkBox7 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox7:setParent(obj.layout1);
    obj.checkBox7:setLeft(3);
    obj.checkBox7:setTop(178);
    obj.checkBox7:setWidth(15);
    obj.checkBox7:setHeight(15);
    obj.checkBox7:setField("per7");
    obj.checkBox7:setName("checkBox7");

    obj.checkBox8 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox8:setParent(obj.layout1);
    obj.checkBox8:setLeft(3);
    obj.checkBox8:setTop(203);
    obj.checkBox8:setWidth(15);
    obj.checkBox8:setHeight(15);
    obj.checkBox8:setField("per8");
    obj.checkBox8:setName("checkBox8");

    obj.checkBox9 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox9:setParent(obj.layout1);
    obj.checkBox9:setLeft(3);
    obj.checkBox9:setTop(228);
    obj.checkBox9:setWidth(15);
    obj.checkBox9:setHeight(15);
    obj.checkBox9:setField("per9");
    obj.checkBox9:setName("checkBox9");

    obj.checkBox10 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox10:setParent(obj.layout1);
    obj.checkBox10:setLeft(3);
    obj.checkBox10:setTop(253);
    obj.checkBox10:setWidth(15);
    obj.checkBox10:setHeight(15);
    obj.checkBox10:setField("per10");
    obj.checkBox10:setName("checkBox10");

    obj.checkBox11 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox11:setParent(obj.layout1);
    obj.checkBox11:setLeft(3);
    obj.checkBox11:setTop(278);
    obj.checkBox11:setWidth(15);
    obj.checkBox11:setHeight(15);
    obj.checkBox11:setField("per11");
    obj.checkBox11:setName("checkBox11");

    obj.checkBox12 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox12:setParent(obj.layout1);
    obj.checkBox12:setLeft(3);
    obj.checkBox12:setTop(303);
    obj.checkBox12:setWidth(15);
    obj.checkBox12:setHeight(15);
    obj.checkBox12:setField("per12");
    obj.checkBox12:setName("checkBox12");

    obj.checkBox13 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox13:setParent(obj.layout1);
    obj.checkBox13:setLeft(3);
    obj.checkBox13:setTop(328);
    obj.checkBox13:setWidth(15);
    obj.checkBox13:setHeight(15);
    obj.checkBox13:setField("per13");
    obj.checkBox13:setName("checkBox13");

    obj.checkBox14 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox14:setParent(obj.layout1);
    obj.checkBox14:setLeft(3);
    obj.checkBox14:setTop(353);
    obj.checkBox14:setWidth(15);
    obj.checkBox14:setHeight(15);
    obj.checkBox14:setField("per14");
    obj.checkBox14:setName("checkBox14");

    obj.checkBox15 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox15:setParent(obj.layout1);
    obj.checkBox15:setLeft(3);
    obj.checkBox15:setTop(378);
    obj.checkBox15:setWidth(15);
    obj.checkBox15:setHeight(15);
    obj.checkBox15:setField("per15");
    obj.checkBox15:setName("checkBox15");

    obj.checkBox16 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox16:setParent(obj.layout1);
    obj.checkBox16:setLeft(3);
    obj.checkBox16:setTop(403);
    obj.checkBox16:setWidth(15);
    obj.checkBox16:setHeight(15);
    obj.checkBox16:setField("per16");
    obj.checkBox16:setName("checkBox16");

    obj.checkBox17 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox17:setParent(obj.layout1);
    obj.checkBox17:setLeft(3);
    obj.checkBox17:setTop(428);
    obj.checkBox17:setWidth(15);
    obj.checkBox17:setHeight(15);
    obj.checkBox17:setField("per17");
    obj.checkBox17:setName("checkBox17");

    obj.checkBox18 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox18:setParent(obj.layout1);
    obj.checkBox18:setLeft(3);
    obj.checkBox18:setTop(453);
    obj.checkBox18:setWidth(15);
    obj.checkBox18:setHeight(15);
    obj.checkBox18:setField("per18");
    obj.checkBox18:setName("checkBox18");

    obj.checkBox19 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox19:setParent(obj.layout1);
    obj.checkBox19:setLeft(3);
    obj.checkBox19:setTop(478);
    obj.checkBox19:setWidth(15);
    obj.checkBox19:setHeight(15);
    obj.checkBox19:setField("per19");
    obj.checkBox19:setName("checkBox19");

    obj.checkBox20 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox20:setParent(obj.layout1);
    obj.checkBox20:setLeft(3);
    obj.checkBox20:setTop(503);
    obj.checkBox20:setWidth(15);
    obj.checkBox20:setHeight(15);
    obj.checkBox20:setField("per20");
    obj.checkBox20:setName("checkBox20");

    obj.checkBox21 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox21:setParent(obj.layout1);
    obj.checkBox21:setLeft(3);
    obj.checkBox21:setTop(528);
    obj.checkBox21:setWidth(15);
    obj.checkBox21:setHeight(15);
    obj.checkBox21:setField("per21");
    obj.checkBox21:setName("checkBox21");

    obj.checkBox22 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox22:setParent(obj.layout1);
    obj.checkBox22:setLeft(3);
    obj.checkBox22:setTop(553);
    obj.checkBox22:setWidth(15);
    obj.checkBox22:setHeight(15);
    obj.checkBox22:setField("per22");
    obj.checkBox22:setName("checkBox22");

    obj.checkBox23 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox23:setParent(obj.layout1);
    obj.checkBox23:setLeft(3);
    obj.checkBox23:setTop(578);
    obj.checkBox23:setWidth(15);
    obj.checkBox23:setHeight(15);
    obj.checkBox23:setField("per23");
    obj.checkBox23:setName("checkBox23");

    obj.checkBox24 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox24:setParent(obj.layout1);
    obj.checkBox24:setLeft(3);
    obj.checkBox24:setTop(603);
    obj.checkBox24:setWidth(15);
    obj.checkBox24:setHeight(15);
    obj.checkBox24:setField("per24");
    obj.checkBox24:setName("checkBox24");

    obj.checkBox25 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox25:setParent(obj.layout1);
    obj.checkBox25:setLeft(3);
    obj.checkBox25:setTop(628);
    obj.checkBox25:setWidth(15);
    obj.checkBox25:setHeight(15);
    obj.checkBox25:setField("per25");
    obj.checkBox25:setName("checkBox25");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout1);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(21);
    obj.edit1:setTop(25);
    obj.edit1:setWidth(138);
    obj.edit1:setHeight(25);
    obj.edit1:setField("pericia1");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout1);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(21);
    obj.edit2:setTop(50);
    obj.edit2:setWidth(138);
    obj.edit2:setHeight(25);
    obj.edit2:setField("pericia2");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout1);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(21);
    obj.edit3:setTop(75);
    obj.edit3:setWidth(138);
    obj.edit3:setHeight(25);
    obj.edit3:setField("pericia3");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout1);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(21);
    obj.edit4:setTop(100);
    obj.edit4:setWidth(138);
    obj.edit4:setHeight(25);
    obj.edit4:setField("pericia4");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout1);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(21);
    obj.edit5:setTop(125);
    obj.edit5:setWidth(138);
    obj.edit5:setHeight(25);
    obj.edit5:setField("pericia5");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout1);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(21);
    obj.edit6:setTop(150);
    obj.edit6:setWidth(138);
    obj.edit6:setHeight(25);
    obj.edit6:setField("pericia6");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout1);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(21);
    obj.edit7:setTop(175);
    obj.edit7:setWidth(138);
    obj.edit7:setHeight(25);
    obj.edit7:setField("pericia7");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout1);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(21);
    obj.edit8:setTop(200);
    obj.edit8:setWidth(138);
    obj.edit8:setHeight(25);
    obj.edit8:setField("pericia8");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout1);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(21);
    obj.edit9:setTop(225);
    obj.edit9:setWidth(138);
    obj.edit9:setHeight(25);
    obj.edit9:setField("pericia9");
    obj.edit9:setName("edit9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout1);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(21);
    obj.edit10:setTop(250);
    obj.edit10:setWidth(138);
    obj.edit10:setHeight(25);
    obj.edit10:setField("pericia10");
    obj.edit10:setName("edit10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout1);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(21);
    obj.edit11:setTop(275);
    obj.edit11:setWidth(138);
    obj.edit11:setHeight(25);
    obj.edit11:setField("pericia11");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout1);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(21);
    obj.edit12:setTop(300);
    obj.edit12:setWidth(138);
    obj.edit12:setHeight(25);
    obj.edit12:setField("pericia12");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout1);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(21);
    obj.edit13:setTop(325);
    obj.edit13:setWidth(138);
    obj.edit13:setHeight(25);
    obj.edit13:setField("pericia13");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout1);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(21);
    obj.edit14:setTop(350);
    obj.edit14:setWidth(138);
    obj.edit14:setHeight(25);
    obj.edit14:setField("pericia14");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout1);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(21);
    obj.edit15:setTop(375);
    obj.edit15:setWidth(138);
    obj.edit15:setHeight(25);
    obj.edit15:setField("pericia15");
    obj.edit15:setName("edit15");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout1);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(21);
    obj.edit16:setTop(400);
    obj.edit16:setWidth(138);
    obj.edit16:setHeight(25);
    obj.edit16:setField("pericia16");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout1);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(21);
    obj.edit17:setTop(425);
    obj.edit17:setWidth(138);
    obj.edit17:setHeight(25);
    obj.edit17:setField("pericia17");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout1);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(21);
    obj.edit18:setTop(450);
    obj.edit18:setWidth(138);
    obj.edit18:setHeight(25);
    obj.edit18:setField("pericia18");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout1);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(21);
    obj.edit19:setTop(475);
    obj.edit19:setWidth(138);
    obj.edit19:setHeight(25);
    obj.edit19:setField("pericia19");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout1);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(21);
    obj.edit20:setTop(500);
    obj.edit20:setWidth(138);
    obj.edit20:setHeight(25);
    obj.edit20:setField("pericia20");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout1);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(21);
    obj.edit21:setTop(525);
    obj.edit21:setWidth(138);
    obj.edit21:setHeight(25);
    obj.edit21:setField("pericia21");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout1);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(21);
    obj.edit22:setTop(550);
    obj.edit22:setWidth(138);
    obj.edit22:setHeight(25);
    obj.edit22:setField("pericia22");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout1);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(21);
    obj.edit23:setTop(575);
    obj.edit23:setWidth(138);
    obj.edit23:setHeight(25);
    obj.edit23:setField("pericia23");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout1);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(21);
    obj.edit24:setTop(600);
    obj.edit24:setWidth(138);
    obj.edit24:setHeight(25);
    obj.edit24:setField("pericia24");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout1);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(21);
    obj.edit25:setTop(625);
    obj.edit25:setWidth(138);
    obj.edit25:setHeight(25);
    obj.edit25:setField("pericia25");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout1);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setHorzTextAlign("center");
    obj.edit26:setLeft(161);
    obj.edit26:setTop(25);
    obj.edit26:setWidth(37);
    obj.edit26:setHeight(25);
    obj.edit26:setField("chave1");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout1);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setLeft(161);
    obj.edit27:setTop(50);
    obj.edit27:setWidth(37);
    obj.edit27:setHeight(25);
    obj.edit27:setField("chave2");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout1);
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setLeft(161);
    obj.edit28:setTop(75);
    obj.edit28:setWidth(37);
    obj.edit28:setHeight(25);
    obj.edit28:setField("chave3");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout1);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setLeft(161);
    obj.edit29:setTop(100);
    obj.edit29:setWidth(37);
    obj.edit29:setHeight(25);
    obj.edit29:setField("chave4");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout1);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setLeft(161);
    obj.edit30:setTop(125);
    obj.edit30:setWidth(37);
    obj.edit30:setHeight(25);
    obj.edit30:setField("chave5");
    obj.edit30:setName("edit30");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout1);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setHorzTextAlign("center");
    obj.edit31:setLeft(161);
    obj.edit31:setTop(150);
    obj.edit31:setWidth(37);
    obj.edit31:setHeight(25);
    obj.edit31:setField("chave6");
    obj.edit31:setName("edit31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout1);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setLeft(161);
    obj.edit32:setTop(175);
    obj.edit32:setWidth(37);
    obj.edit32:setHeight(25);
    obj.edit32:setField("chave7");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout1);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setLeft(161);
    obj.edit33:setTop(200);
    obj.edit33:setWidth(37);
    obj.edit33:setHeight(25);
    obj.edit33:setField("chave8");
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout1);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setLeft(161);
    obj.edit34:setTop(225);
    obj.edit34:setWidth(37);
    obj.edit34:setHeight(25);
    obj.edit34:setField("chave9");
    obj.edit34:setName("edit34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout1);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setLeft(161);
    obj.edit35:setTop(250);
    obj.edit35:setWidth(37);
    obj.edit35:setHeight(25);
    obj.edit35:setField("chave10");
    obj.edit35:setName("edit35");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout1);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setHorzTextAlign("center");
    obj.edit36:setLeft(161);
    obj.edit36:setTop(275);
    obj.edit36:setWidth(37);
    obj.edit36:setHeight(25);
    obj.edit36:setField("chave11");
    obj.edit36:setName("edit36");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout1);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setLeft(161);
    obj.edit37:setTop(300);
    obj.edit37:setWidth(37);
    obj.edit37:setHeight(25);
    obj.edit37:setField("chave12");
    obj.edit37:setName("edit37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout1);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setLeft(161);
    obj.edit38:setTop(325);
    obj.edit38:setWidth(37);
    obj.edit38:setHeight(25);
    obj.edit38:setField("chave13");
    obj.edit38:setName("edit38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout1);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setLeft(161);
    obj.edit39:setTop(350);
    obj.edit39:setWidth(37);
    obj.edit39:setHeight(25);
    obj.edit39:setField("chave14");
    obj.edit39:setName("edit39");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout1);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setLeft(161);
    obj.edit40:setTop(375);
    obj.edit40:setWidth(37);
    obj.edit40:setHeight(25);
    obj.edit40:setField("chave15");
    obj.edit40:setName("edit40");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout1);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setHorzTextAlign("center");
    obj.edit41:setLeft(161);
    obj.edit41:setTop(400);
    obj.edit41:setWidth(37);
    obj.edit41:setHeight(25);
    obj.edit41:setField("chave16");
    obj.edit41:setName("edit41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout1);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setLeft(161);
    obj.edit42:setTop(425);
    obj.edit42:setWidth(37);
    obj.edit42:setHeight(25);
    obj.edit42:setField("chave17");
    obj.edit42:setName("edit42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout1);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setLeft(161);
    obj.edit43:setTop(450);
    obj.edit43:setWidth(37);
    obj.edit43:setHeight(25);
    obj.edit43:setField("chave18");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout1);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setLeft(161);
    obj.edit44:setTop(475);
    obj.edit44:setWidth(37);
    obj.edit44:setHeight(25);
    obj.edit44:setField("chave19");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout1);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setLeft(161);
    obj.edit45:setTop(500);
    obj.edit45:setWidth(37);
    obj.edit45:setHeight(25);
    obj.edit45:setField("chave20");
    obj.edit45:setName("edit45");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout1);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setHorzTextAlign("center");
    obj.edit46:setLeft(161);
    obj.edit46:setTop(525);
    obj.edit46:setWidth(37);
    obj.edit46:setHeight(25);
    obj.edit46:setField("chave21");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout1);
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setLeft(161);
    obj.edit47:setTop(550);
    obj.edit47:setWidth(37);
    obj.edit47:setHeight(25);
    obj.edit47:setField("chave22");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout1);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setLeft(161);
    obj.edit48:setTop(575);
    obj.edit48:setWidth(37);
    obj.edit48:setHeight(25);
    obj.edit48:setField("chave23");
    obj.edit48:setName("edit48");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout1);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setLeft(161);
    obj.edit49:setTop(600);
    obj.edit49:setWidth(37);
    obj.edit49:setHeight(25);
    obj.edit49:setField("chave24");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout1);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setLeft(161);
    obj.edit50:setTop(625);
    obj.edit50:setWidth(37);
    obj.edit50:setHeight(25);
    obj.edit50:setField("chave25");
    obj.edit50:setName("edit50");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setField("total1");
    obj.label1:setText("valor");
    obj.label1:setLeft(202);
    obj.label1:setTop(25);
    obj.label1:setWidth(35);
    obj.label1:setHeight(25);
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setField("total2");
    obj.label2:setText("valor");
    obj.label2:setLeft(202);
    obj.label2:setTop(50);
    obj.label2:setWidth(35);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setField("total3");
    obj.label3:setText("valor");
    obj.label3:setLeft(202);
    obj.label3:setTop(75);
    obj.label3:setWidth(35);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setField("total4");
    obj.label4:setText("valor");
    obj.label4:setLeft(202);
    obj.label4:setTop(100);
    obj.label4:setWidth(35);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setField("total5");
    obj.label5:setText("valor");
    obj.label5:setLeft(202);
    obj.label5:setTop(125);
    obj.label5:setWidth(35);
    obj.label5:setHeight(25);
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setField("total6");
    obj.label6:setText("valor");
    obj.label6:setLeft(202);
    obj.label6:setTop(150);
    obj.label6:setWidth(35);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout1);
    obj.label7:setField("total7");
    obj.label7:setText("valor");
    obj.label7:setLeft(202);
    obj.label7:setTop(175);
    obj.label7:setWidth(35);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout1);
    obj.label8:setField("total8");
    obj.label8:setText("valor");
    obj.label8:setLeft(202);
    obj.label8:setTop(200);
    obj.label8:setWidth(35);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout1);
    obj.label9:setField("total9");
    obj.label9:setText("valor");
    obj.label9:setLeft(202);
    obj.label9:setTop(225);
    obj.label9:setWidth(35);
    obj.label9:setHeight(25);
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout1);
    obj.label10:setField("total10");
    obj.label10:setText("valor");
    obj.label10:setLeft(202);
    obj.label10:setTop(250);
    obj.label10:setWidth(35);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout1);
    obj.label11:setField("total11");
    obj.label11:setText("valor");
    obj.label11:setLeft(202);
    obj.label11:setTop(275);
    obj.label11:setWidth(35);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout1);
    obj.label12:setField("total12");
    obj.label12:setText("valor");
    obj.label12:setLeft(202);
    obj.label12:setTop(300);
    obj.label12:setWidth(35);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout1);
    obj.label13:setField("total13");
    obj.label13:setText("valor");
    obj.label13:setLeft(202);
    obj.label13:setTop(325);
    obj.label13:setWidth(35);
    obj.label13:setHeight(25);
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout1);
    obj.label14:setField("total14");
    obj.label14:setText("valor");
    obj.label14:setLeft(202);
    obj.label14:setTop(350);
    obj.label14:setWidth(35);
    obj.label14:setHeight(25);
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout1);
    obj.label15:setField("total15");
    obj.label15:setText("valor");
    obj.label15:setLeft(202);
    obj.label15:setTop(375);
    obj.label15:setWidth(35);
    obj.label15:setHeight(25);
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout1);
    obj.label16:setField("total16");
    obj.label16:setText("valor");
    obj.label16:setLeft(202);
    obj.label16:setTop(400);
    obj.label16:setWidth(35);
    obj.label16:setHeight(25);
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout1);
    obj.label17:setField("total17");
    obj.label17:setText("valor");
    obj.label17:setLeft(202);
    obj.label17:setTop(425);
    obj.label17:setWidth(35);
    obj.label17:setHeight(25);
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout1);
    obj.label18:setField("total18");
    obj.label18:setText("valor");
    obj.label18:setLeft(202);
    obj.label18:setTop(450);
    obj.label18:setWidth(35);
    obj.label18:setHeight(25);
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout1);
    obj.label19:setField("total19");
    obj.label19:setText("valor");
    obj.label19:setLeft(202);
    obj.label19:setTop(475);
    obj.label19:setWidth(35);
    obj.label19:setHeight(25);
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout1);
    obj.label20:setField("total20");
    obj.label20:setText("valor");
    obj.label20:setLeft(202);
    obj.label20:setTop(500);
    obj.label20:setWidth(35);
    obj.label20:setHeight(25);
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout1);
    obj.label21:setField("total21");
    obj.label21:setText("valor");
    obj.label21:setLeft(202);
    obj.label21:setTop(525);
    obj.label21:setWidth(35);
    obj.label21:setHeight(25);
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout1);
    obj.label22:setField("total22");
    obj.label22:setText("valor");
    obj.label22:setLeft(202);
    obj.label22:setTop(550);
    obj.label22:setWidth(35);
    obj.label22:setHeight(25);
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout1);
    obj.label23:setField("total23");
    obj.label23:setText("valor");
    obj.label23:setLeft(202);
    obj.label23:setTop(575);
    obj.label23:setWidth(35);
    obj.label23:setHeight(25);
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout1);
    obj.label24:setField("total24");
    obj.label24:setText("valor");
    obj.label24:setLeft(202);
    obj.label24:setTop(600);
    obj.label24:setWidth(35);
    obj.label24:setHeight(25);
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout1);
    obj.label25:setField("total25");
    obj.label25:setText("valor");
    obj.label25:setLeft(202);
    obj.label25:setTop(625);
    obj.label25:setWidth(35);
    obj.label25:setHeight(25);
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout1);
    obj.label26:setField("atributo1");
    obj.label26:setText("valor");
    obj.label26:setLeft(270);
    obj.label26:setTop(27);
    obj.label26:setWidth(20);
    obj.label26:setHeight(20);
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout1);
    obj.label27:setField("atributo2");
    obj.label27:setText("valor");
    obj.label27:setLeft(270);
    obj.label27:setTop(52);
    obj.label27:setWidth(20);
    obj.label27:setHeight(20);
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout1);
    obj.label28:setField("atributo3");
    obj.label28:setText("valor");
    obj.label28:setLeft(270);
    obj.label28:setTop(77);
    obj.label28:setWidth(20);
    obj.label28:setHeight(20);
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout1);
    obj.label29:setField("atributo4");
    obj.label29:setText("valor");
    obj.label29:setLeft(270);
    obj.label29:setTop(102);
    obj.label29:setWidth(20);
    obj.label29:setHeight(20);
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout1);
    obj.label30:setField("atributo5");
    obj.label30:setText("valor");
    obj.label30:setLeft(270);
    obj.label30:setTop(127);
    obj.label30:setWidth(20);
    obj.label30:setHeight(20);
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout1);
    obj.label31:setField("atributo6");
    obj.label31:setText("valor");
    obj.label31:setLeft(270);
    obj.label31:setTop(152);
    obj.label31:setWidth(20);
    obj.label31:setHeight(20);
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout1);
    obj.label32:setField("atributo7");
    obj.label32:setText("valor");
    obj.label32:setLeft(270);
    obj.label32:setTop(177);
    obj.label32:setWidth(20);
    obj.label32:setHeight(20);
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout1);
    obj.label33:setField("atributo8");
    obj.label33:setText("valor");
    obj.label33:setLeft(270);
    obj.label33:setTop(202);
    obj.label33:setWidth(20);
    obj.label33:setHeight(20);
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout1);
    obj.label34:setField("atributo9");
    obj.label34:setText("valor");
    obj.label34:setLeft(270);
    obj.label34:setTop(227);
    obj.label34:setWidth(20);
    obj.label34:setHeight(20);
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout1);
    obj.label35:setField("atributo10");
    obj.label35:setText("valor");
    obj.label35:setLeft(270);
    obj.label35:setTop(252);
    obj.label35:setWidth(20);
    obj.label35:setHeight(20);
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout1);
    obj.label36:setField("atributo11");
    obj.label36:setText("valor");
    obj.label36:setLeft(270);
    obj.label36:setTop(277);
    obj.label36:setWidth(20);
    obj.label36:setHeight(20);
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout1);
    obj.label37:setField("atributo12");
    obj.label37:setText("valor");
    obj.label37:setLeft(270);
    obj.label37:setTop(302);
    obj.label37:setWidth(20);
    obj.label37:setHeight(20);
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout1);
    obj.label38:setField("atributo13");
    obj.label38:setText("valor");
    obj.label38:setLeft(270);
    obj.label38:setTop(327);
    obj.label38:setWidth(20);
    obj.label38:setHeight(20);
    obj.label38:setHorzTextAlign("center");
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout1);
    obj.label39:setField("atributo14");
    obj.label39:setText("valor");
    obj.label39:setLeft(270);
    obj.label39:setTop(352);
    obj.label39:setWidth(20);
    obj.label39:setHeight(20);
    obj.label39:setHorzTextAlign("center");
    obj.label39:setName("label39");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout1);
    obj.label40:setField("atributo15");
    obj.label40:setText("valor");
    obj.label40:setLeft(270);
    obj.label40:setTop(377);
    obj.label40:setWidth(20);
    obj.label40:setHeight(20);
    obj.label40:setHorzTextAlign("center");
    obj.label40:setName("label40");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout1);
    obj.label41:setField("atributo16");
    obj.label41:setText("valor");
    obj.label41:setLeft(270);
    obj.label41:setTop(402);
    obj.label41:setWidth(20);
    obj.label41:setHeight(20);
    obj.label41:setHorzTextAlign("center");
    obj.label41:setName("label41");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout1);
    obj.label42:setField("atributo17");
    obj.label42:setText("valor");
    obj.label42:setLeft(270);
    obj.label42:setTop(427);
    obj.label42:setWidth(20);
    obj.label42:setHeight(20);
    obj.label42:setHorzTextAlign("center");
    obj.label42:setName("label42");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout1);
    obj.label43:setField("atributo18");
    obj.label43:setText("valor");
    obj.label43:setLeft(270);
    obj.label43:setTop(452);
    obj.label43:setWidth(20);
    obj.label43:setHeight(20);
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout1);
    obj.label44:setField("atributo19");
    obj.label44:setText("valor");
    obj.label44:setLeft(270);
    obj.label44:setTop(477);
    obj.label44:setWidth(20);
    obj.label44:setHeight(20);
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout1);
    obj.label45:setField("atributo20");
    obj.label45:setText("valor");
    obj.label45:setLeft(270);
    obj.label45:setTop(502);
    obj.label45:setWidth(20);
    obj.label45:setHeight(20);
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout1);
    obj.label46:setField("atributo21");
    obj.label46:setText("valor");
    obj.label46:setLeft(270);
    obj.label46:setTop(527);
    obj.label46:setWidth(20);
    obj.label46:setHeight(20);
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout1);
    obj.label47:setField("atributo22");
    obj.label47:setText("valor");
    obj.label47:setLeft(270);
    obj.label47:setTop(552);
    obj.label47:setWidth(20);
    obj.label47:setHeight(20);
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout1);
    obj.label48:setField("atributo23");
    obj.label48:setText("valor");
    obj.label48:setLeft(270);
    obj.label48:setTop(577);
    obj.label48:setWidth(20);
    obj.label48:setHeight(20);
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout1);
    obj.label49:setField("atributo24");
    obj.label49:setText("valor");
    obj.label49:setLeft(270);
    obj.label49:setTop(602);
    obj.label49:setWidth(20);
    obj.label49:setHeight(20);
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout1);
    obj.label50:setField("atributo25");
    obj.label50:setText("valor");
    obj.label50:setLeft(270);
    obj.label50:setTop(627);
    obj.label50:setWidth(20);
    obj.label50:setHeight(20);
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout1);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setHorzTextAlign("center");
    obj.edit51:setLeft(300);
    obj.edit51:setTop(25);
    obj.edit51:setWidth(30);
    obj.edit51:setHeight(25);
    obj.edit51:setField("graduacao1");
    obj.edit51:setName("edit51");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout1);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setLeft(300);
    obj.edit52:setTop(50);
    obj.edit52:setWidth(30);
    obj.edit52:setHeight(25);
    obj.edit52:setField("graduacao2");
    obj.edit52:setName("edit52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout1);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setLeft(300);
    obj.edit53:setTop(75);
    obj.edit53:setWidth(30);
    obj.edit53:setHeight(25);
    obj.edit53:setField("graduacao3");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout1);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setLeft(300);
    obj.edit54:setTop(100);
    obj.edit54:setWidth(30);
    obj.edit54:setHeight(25);
    obj.edit54:setField("graduacao4");
    obj.edit54:setName("edit54");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout1);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setLeft(300);
    obj.edit55:setTop(125);
    obj.edit55:setWidth(30);
    obj.edit55:setHeight(25);
    obj.edit55:setField("graduacao5");
    obj.edit55:setName("edit55");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout1);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setHorzTextAlign("center");
    obj.edit56:setLeft(300);
    obj.edit56:setTop(150);
    obj.edit56:setWidth(30);
    obj.edit56:setHeight(25);
    obj.edit56:setField("graduacao6");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout1);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setLeft(300);
    obj.edit57:setTop(175);
    obj.edit57:setWidth(30);
    obj.edit57:setHeight(25);
    obj.edit57:setField("graduacao7");
    obj.edit57:setName("edit57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout1);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setLeft(300);
    obj.edit58:setTop(200);
    obj.edit58:setWidth(30);
    obj.edit58:setHeight(25);
    obj.edit58:setField("graduacao8");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout1);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setLeft(300);
    obj.edit59:setTop(225);
    obj.edit59:setWidth(30);
    obj.edit59:setHeight(25);
    obj.edit59:setField("graduacao9");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout1);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setLeft(300);
    obj.edit60:setTop(250);
    obj.edit60:setWidth(30);
    obj.edit60:setHeight(25);
    obj.edit60:setField("graduacao10");
    obj.edit60:setName("edit60");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout1);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setHorzTextAlign("center");
    obj.edit61:setLeft(300);
    obj.edit61:setTop(275);
    obj.edit61:setWidth(30);
    obj.edit61:setHeight(25);
    obj.edit61:setField("graduacao11");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout1);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setLeft(300);
    obj.edit62:setTop(300);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(25);
    obj.edit62:setField("graduacao12");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout1);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setLeft(300);
    obj.edit63:setTop(325);
    obj.edit63:setWidth(30);
    obj.edit63:setHeight(25);
    obj.edit63:setField("graduacao13");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout1);
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setLeft(300);
    obj.edit64:setTop(350);
    obj.edit64:setWidth(30);
    obj.edit64:setHeight(25);
    obj.edit64:setField("graduacao14");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout1);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setLeft(300);
    obj.edit65:setTop(375);
    obj.edit65:setWidth(30);
    obj.edit65:setHeight(25);
    obj.edit65:setField("graduacao15");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout1);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setHorzTextAlign("center");
    obj.edit66:setLeft(300);
    obj.edit66:setTop(400);
    obj.edit66:setWidth(30);
    obj.edit66:setHeight(25);
    obj.edit66:setField("graduacao16");
    obj.edit66:setName("edit66");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout1);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setLeft(300);
    obj.edit67:setTop(425);
    obj.edit67:setWidth(30);
    obj.edit67:setHeight(25);
    obj.edit67:setField("graduacao17");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout1);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setLeft(300);
    obj.edit68:setTop(450);
    obj.edit68:setWidth(30);
    obj.edit68:setHeight(25);
    obj.edit68:setField("graduacao18");
    obj.edit68:setName("edit68");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout1);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setLeft(300);
    obj.edit69:setTop(475);
    obj.edit69:setWidth(30);
    obj.edit69:setHeight(25);
    obj.edit69:setField("graduacao19");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout1);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setLeft(300);
    obj.edit70:setTop(500);
    obj.edit70:setWidth(30);
    obj.edit70:setHeight(25);
    obj.edit70:setField("graduacao20");
    obj.edit70:setName("edit70");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout1);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setHorzTextAlign("center");
    obj.edit71:setLeft(300);
    obj.edit71:setTop(525);
    obj.edit71:setWidth(30);
    obj.edit71:setHeight(25);
    obj.edit71:setField("graduacao21");
    obj.edit71:setName("edit71");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout1);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setLeft(300);
    obj.edit72:setTop(550);
    obj.edit72:setWidth(30);
    obj.edit72:setHeight(25);
    obj.edit72:setField("graduacao22");
    obj.edit72:setName("edit72");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout1);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setLeft(300);
    obj.edit73:setTop(575);
    obj.edit73:setWidth(30);
    obj.edit73:setHeight(25);
    obj.edit73:setField("graduacao23");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout1);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setLeft(300);
    obj.edit74:setTop(600);
    obj.edit74:setWidth(30);
    obj.edit74:setHeight(25);
    obj.edit74:setField("graduacao24");
    obj.edit74:setName("edit74");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout1);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setLeft(300);
    obj.edit75:setTop(625);
    obj.edit75:setWidth(30);
    obj.edit75:setHeight(25);
    obj.edit75:setField("graduacao25");
    obj.edit75:setName("edit75");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout1);
    obj.edit76:setType("number");
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setHorzTextAlign("center");
    obj.edit76:setLeft(333);
    obj.edit76:setTop(25);
    obj.edit76:setWidth(33);
    obj.edit76:setHeight(25);
    obj.edit76:setField("outros1");
    obj.edit76:setName("edit76");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout1);
    obj.edit77:setType("number");
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setLeft(333);
    obj.edit77:setTop(50);
    obj.edit77:setWidth(33);
    obj.edit77:setHeight(25);
    obj.edit77:setField("outros2");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout1);
    obj.edit78:setType("number");
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setLeft(333);
    obj.edit78:setTop(75);
    obj.edit78:setWidth(33);
    obj.edit78:setHeight(25);
    obj.edit78:setField("outros3");
    obj.edit78:setName("edit78");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout1);
    obj.edit79:setType("number");
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setLeft(333);
    obj.edit79:setTop(100);
    obj.edit79:setWidth(33);
    obj.edit79:setHeight(25);
    obj.edit79:setField("outros4");
    obj.edit79:setName("edit79");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout1);
    obj.edit80:setType("number");
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setLeft(333);
    obj.edit80:setTop(125);
    obj.edit80:setWidth(33);
    obj.edit80:setHeight(25);
    obj.edit80:setField("outros5");
    obj.edit80:setName("edit80");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout1);
    obj.edit81:setType("number");
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setHorzTextAlign("center");
    obj.edit81:setLeft(333);
    obj.edit81:setTop(150);
    obj.edit81:setWidth(33);
    obj.edit81:setHeight(25);
    obj.edit81:setField("outros6");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout1);
    obj.edit82:setType("number");
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setLeft(333);
    obj.edit82:setTop(175);
    obj.edit82:setWidth(33);
    obj.edit82:setHeight(25);
    obj.edit82:setField("outros7");
    obj.edit82:setName("edit82");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout1);
    obj.edit83:setType("number");
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setLeft(333);
    obj.edit83:setTop(200);
    obj.edit83:setWidth(33);
    obj.edit83:setHeight(25);
    obj.edit83:setField("outros8");
    obj.edit83:setName("edit83");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout1);
    obj.edit84:setType("number");
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setLeft(333);
    obj.edit84:setTop(225);
    obj.edit84:setWidth(33);
    obj.edit84:setHeight(25);
    obj.edit84:setField("outros9");
    obj.edit84:setName("edit84");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout1);
    obj.edit85:setType("number");
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setLeft(333);
    obj.edit85:setTop(250);
    obj.edit85:setWidth(33);
    obj.edit85:setHeight(25);
    obj.edit85:setField("outros10");
    obj.edit85:setName("edit85");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout1);
    obj.edit86:setType("number");
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setHorzTextAlign("center");
    obj.edit86:setLeft(333);
    obj.edit86:setTop(275);
    obj.edit86:setWidth(33);
    obj.edit86:setHeight(25);
    obj.edit86:setField("outros11");
    obj.edit86:setName("edit86");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout1);
    obj.edit87:setType("number");
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setLeft(333);
    obj.edit87:setTop(300);
    obj.edit87:setWidth(33);
    obj.edit87:setHeight(25);
    obj.edit87:setField("outros12");
    obj.edit87:setName("edit87");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout1);
    obj.edit88:setType("number");
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setLeft(333);
    obj.edit88:setTop(325);
    obj.edit88:setWidth(33);
    obj.edit88:setHeight(25);
    obj.edit88:setField("outros13");
    obj.edit88:setName("edit88");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout1);
    obj.edit89:setType("number");
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setLeft(333);
    obj.edit89:setTop(350);
    obj.edit89:setWidth(33);
    obj.edit89:setHeight(25);
    obj.edit89:setField("outros14");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout1);
    obj.edit90:setType("number");
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setLeft(333);
    obj.edit90:setTop(375);
    obj.edit90:setWidth(33);
    obj.edit90:setHeight(25);
    obj.edit90:setField("outros15");
    obj.edit90:setName("edit90");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout1);
    obj.edit91:setType("number");
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setHorzTextAlign("center");
    obj.edit91:setLeft(333);
    obj.edit91:setTop(400);
    obj.edit91:setWidth(33);
    obj.edit91:setHeight(25);
    obj.edit91:setField("outros16");
    obj.edit91:setName("edit91");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout1);
    obj.edit92:setType("number");
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setLeft(333);
    obj.edit92:setTop(425);
    obj.edit92:setWidth(33);
    obj.edit92:setHeight(25);
    obj.edit92:setField("outros17");
    obj.edit92:setName("edit92");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout1);
    obj.edit93:setType("number");
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setLeft(333);
    obj.edit93:setTop(450);
    obj.edit93:setWidth(33);
    obj.edit93:setHeight(25);
    obj.edit93:setField("outros18");
    obj.edit93:setName("edit93");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout1);
    obj.edit94:setType("number");
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setLeft(333);
    obj.edit94:setTop(475);
    obj.edit94:setWidth(33);
    obj.edit94:setHeight(25);
    obj.edit94:setField("outros19");
    obj.edit94:setName("edit94");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout1);
    obj.edit95:setType("number");
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setLeft(333);
    obj.edit95:setTop(500);
    obj.edit95:setWidth(33);
    obj.edit95:setHeight(25);
    obj.edit95:setField("outros20");
    obj.edit95:setName("edit95");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout1);
    obj.edit96:setType("number");
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setHorzTextAlign("center");
    obj.edit96:setLeft(333);
    obj.edit96:setTop(525);
    obj.edit96:setWidth(33);
    obj.edit96:setHeight(25);
    obj.edit96:setField("outros21");
    obj.edit96:setName("edit96");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout1);
    obj.edit97:setType("number");
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setLeft(333);
    obj.edit97:setTop(550);
    obj.edit97:setWidth(33);
    obj.edit97:setHeight(25);
    obj.edit97:setField("outros22");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout1);
    obj.edit98:setType("number");
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setLeft(333);
    obj.edit98:setTop(575);
    obj.edit98:setWidth(33);
    obj.edit98:setHeight(25);
    obj.edit98:setField("outros23");
    obj.edit98:setName("edit98");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout1);
    obj.edit99:setType("number");
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setLeft(333);
    obj.edit99:setTop(600);
    obj.edit99:setWidth(33);
    obj.edit99:setHeight(25);
    obj.edit99:setField("outros24");
    obj.edit99:setName("edit99");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout1);
    obj.edit100:setType("number");
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setLeft(333);
    obj.edit100:setTop(625);
    obj.edit100:setWidth(33);
    obj.edit100:setHeight(25);
    obj.edit100:setField("outros25");
    obj.edit100:setName("edit100");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout1);
    obj.edit101:setType("number");
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setHorzTextAlign("center");
    obj.edit101:setLeft(367);
    obj.edit101:setTop(25);
    obj.edit101:setWidth(33);
    obj.edit101:setHeight(25);
    obj.edit101:setField("penalidade1");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout1);
    obj.edit102:setType("number");
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setLeft(367);
    obj.edit102:setTop(50);
    obj.edit102:setWidth(33);
    obj.edit102:setHeight(25);
    obj.edit102:setField("penalidade2");
    obj.edit102:setName("edit102");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout1);
    obj.edit103:setType("number");
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setLeft(367);
    obj.edit103:setTop(75);
    obj.edit103:setWidth(33);
    obj.edit103:setHeight(25);
    obj.edit103:setField("penalidade3");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout1);
    obj.edit104:setType("number");
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setLeft(367);
    obj.edit104:setTop(100);
    obj.edit104:setWidth(33);
    obj.edit104:setHeight(25);
    obj.edit104:setField("penalidade4");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout1);
    obj.edit105:setType("number");
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setLeft(367);
    obj.edit105:setTop(125);
    obj.edit105:setWidth(33);
    obj.edit105:setHeight(25);
    obj.edit105:setField("penalidade5");
    obj.edit105:setName("edit105");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout1);
    obj.edit106:setType("number");
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setHorzTextAlign("center");
    obj.edit106:setLeft(367);
    obj.edit106:setTop(150);
    obj.edit106:setWidth(33);
    obj.edit106:setHeight(25);
    obj.edit106:setField("penalidade6");
    obj.edit106:setName("edit106");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout1);
    obj.edit107:setType("number");
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setLeft(367);
    obj.edit107:setTop(175);
    obj.edit107:setWidth(33);
    obj.edit107:setHeight(25);
    obj.edit107:setField("penalidade7");
    obj.edit107:setName("edit107");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout1);
    obj.edit108:setType("number");
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setLeft(367);
    obj.edit108:setTop(200);
    obj.edit108:setWidth(33);
    obj.edit108:setHeight(25);
    obj.edit108:setField("penalidade8");
    obj.edit108:setName("edit108");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout1);
    obj.edit109:setType("number");
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setLeft(367);
    obj.edit109:setTop(225);
    obj.edit109:setWidth(33);
    obj.edit109:setHeight(25);
    obj.edit109:setField("penalidade9");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout1);
    obj.edit110:setType("number");
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setLeft(367);
    obj.edit110:setTop(250);
    obj.edit110:setWidth(33);
    obj.edit110:setHeight(25);
    obj.edit110:setField("penalidade10");
    obj.edit110:setName("edit110");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout1);
    obj.edit111:setType("number");
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setHorzTextAlign("center");
    obj.edit111:setLeft(367);
    obj.edit111:setTop(275);
    obj.edit111:setWidth(33);
    obj.edit111:setHeight(25);
    obj.edit111:setField("penalidade11");
    obj.edit111:setName("edit111");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout1);
    obj.edit112:setType("number");
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setHorzTextAlign("center");
    obj.edit112:setLeft(367);
    obj.edit112:setTop(300);
    obj.edit112:setWidth(33);
    obj.edit112:setHeight(25);
    obj.edit112:setField("penalidade12");
    obj.edit112:setName("edit112");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout1);
    obj.edit113:setType("number");
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setLeft(367);
    obj.edit113:setTop(325);
    obj.edit113:setWidth(33);
    obj.edit113:setHeight(25);
    obj.edit113:setField("penalidade13");
    obj.edit113:setName("edit113");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout1);
    obj.edit114:setType("number");
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setHorzTextAlign("center");
    obj.edit114:setLeft(367);
    obj.edit114:setTop(350);
    obj.edit114:setWidth(33);
    obj.edit114:setHeight(25);
    obj.edit114:setField("penalidade14");
    obj.edit114:setName("edit114");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout1);
    obj.edit115:setType("number");
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setHorzTextAlign("center");
    obj.edit115:setLeft(367);
    obj.edit115:setTop(375);
    obj.edit115:setWidth(33);
    obj.edit115:setHeight(25);
    obj.edit115:setField("penalidade15");
    obj.edit115:setName("edit115");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout1);
    obj.edit116:setType("number");
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setLeft(367);
    obj.edit116:setTop(400);
    obj.edit116:setWidth(33);
    obj.edit116:setHeight(25);
    obj.edit116:setField("penalidade16");
    obj.edit116:setName("edit116");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout1);
    obj.edit117:setType("number");
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setHorzTextAlign("center");
    obj.edit117:setLeft(367);
    obj.edit117:setTop(425);
    obj.edit117:setWidth(33);
    obj.edit117:setHeight(25);
    obj.edit117:setField("penalidade17");
    obj.edit117:setName("edit117");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout1);
    obj.edit118:setType("number");
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setHorzTextAlign("center");
    obj.edit118:setLeft(367);
    obj.edit118:setTop(450);
    obj.edit118:setWidth(33);
    obj.edit118:setHeight(25);
    obj.edit118:setField("penalidade18");
    obj.edit118:setName("edit118");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout1);
    obj.edit119:setType("number");
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setLeft(367);
    obj.edit119:setTop(475);
    obj.edit119:setWidth(33);
    obj.edit119:setHeight(25);
    obj.edit119:setField("penalidade19");
    obj.edit119:setName("edit119");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout1);
    obj.edit120:setType("number");
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setHorzTextAlign("center");
    obj.edit120:setLeft(367);
    obj.edit120:setTop(500);
    obj.edit120:setWidth(33);
    obj.edit120:setHeight(25);
    obj.edit120:setField("penalidade20");
    obj.edit120:setName("edit120");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout1);
    obj.edit121:setType("number");
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setHorzTextAlign("center");
    obj.edit121:setLeft(367);
    obj.edit121:setTop(525);
    obj.edit121:setWidth(33);
    obj.edit121:setHeight(25);
    obj.edit121:setField("penalidade21");
    obj.edit121:setName("edit121");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout1);
    obj.edit122:setType("number");
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setLeft(367);
    obj.edit122:setTop(550);
    obj.edit122:setWidth(33);
    obj.edit122:setHeight(25);
    obj.edit122:setField("penalidade22");
    obj.edit122:setName("edit122");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout1);
    obj.edit123:setType("number");
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setHorzTextAlign("center");
    obj.edit123:setLeft(367);
    obj.edit123:setTop(575);
    obj.edit123:setWidth(33);
    obj.edit123:setHeight(25);
    obj.edit123:setField("penalidade23");
    obj.edit123:setName("edit123");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout1);
    obj.edit124:setType("number");
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setHorzTextAlign("center");
    obj.edit124:setLeft(367);
    obj.edit124:setTop(600);
    obj.edit124:setWidth(33);
    obj.edit124:setHeight(25);
    obj.edit124:setField("penalidade24");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout1);
    obj.edit125:setType("number");
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setLeft(367);
    obj.edit125:setTop(625);
    obj.edit125:setWidth(33);
    obj.edit125:setHeight(25);
    obj.edit125:setField("penalidade25");
    obj.edit125:setName("edit125");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout1);
    obj.edit126:setType("number");
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setHorzTextAlign("center");
    obj.edit126:setLeft(400);
    obj.edit126:setTop(25);
    obj.edit126:setWidth(33);
    obj.edit126:setHeight(25);
    obj.edit126:setField("raca1");
    obj.edit126:setName("edit126");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout1);
    obj.edit127:setType("number");
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setHorzTextAlign("center");
    obj.edit127:setLeft(400);
    obj.edit127:setTop(50);
    obj.edit127:setWidth(33);
    obj.edit127:setHeight(25);
    obj.edit127:setField("raca2");
    obj.edit127:setName("edit127");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout1);
    obj.edit128:setType("number");
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setLeft(400);
    obj.edit128:setTop(75);
    obj.edit128:setWidth(33);
    obj.edit128:setHeight(25);
    obj.edit128:setField("raca3");
    obj.edit128:setName("edit128");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout1);
    obj.edit129:setType("number");
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setHorzTextAlign("center");
    obj.edit129:setLeft(400);
    obj.edit129:setTop(100);
    obj.edit129:setWidth(33);
    obj.edit129:setHeight(25);
    obj.edit129:setField("raca4");
    obj.edit129:setName("edit129");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout1);
    obj.edit130:setType("number");
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setHorzTextAlign("center");
    obj.edit130:setLeft(400);
    obj.edit130:setTop(125);
    obj.edit130:setWidth(33);
    obj.edit130:setHeight(25);
    obj.edit130:setField("raca5");
    obj.edit130:setName("edit130");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout1);
    obj.edit131:setType("number");
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setLeft(400);
    obj.edit131:setTop(150);
    obj.edit131:setWidth(33);
    obj.edit131:setHeight(25);
    obj.edit131:setField("raca6");
    obj.edit131:setName("edit131");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout1);
    obj.edit132:setType("number");
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setHorzTextAlign("center");
    obj.edit132:setLeft(400);
    obj.edit132:setTop(175);
    obj.edit132:setWidth(33);
    obj.edit132:setHeight(25);
    obj.edit132:setField("raca7");
    obj.edit132:setName("edit132");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout1);
    obj.edit133:setType("number");
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setHorzTextAlign("center");
    obj.edit133:setLeft(400);
    obj.edit133:setTop(200);
    obj.edit133:setWidth(33);
    obj.edit133:setHeight(25);
    obj.edit133:setField("raca8");
    obj.edit133:setName("edit133");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout1);
    obj.edit134:setType("number");
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setLeft(400);
    obj.edit134:setTop(225);
    obj.edit134:setWidth(33);
    obj.edit134:setHeight(25);
    obj.edit134:setField("raca9");
    obj.edit134:setName("edit134");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout1);
    obj.edit135:setType("number");
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setHorzTextAlign("center");
    obj.edit135:setLeft(400);
    obj.edit135:setTop(250);
    obj.edit135:setWidth(33);
    obj.edit135:setHeight(25);
    obj.edit135:setField("raca10");
    obj.edit135:setName("edit135");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout1);
    obj.edit136:setType("number");
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setHorzTextAlign("center");
    obj.edit136:setLeft(400);
    obj.edit136:setTop(275);
    obj.edit136:setWidth(33);
    obj.edit136:setHeight(25);
    obj.edit136:setField("raca11");
    obj.edit136:setName("edit136");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout1);
    obj.edit137:setType("number");
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setLeft(400);
    obj.edit137:setTop(300);
    obj.edit137:setWidth(33);
    obj.edit137:setHeight(25);
    obj.edit137:setField("raca12");
    obj.edit137:setName("edit137");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout1);
    obj.edit138:setType("number");
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setHorzTextAlign("center");
    obj.edit138:setLeft(400);
    obj.edit138:setTop(325);
    obj.edit138:setWidth(33);
    obj.edit138:setHeight(25);
    obj.edit138:setField("raca13");
    obj.edit138:setName("edit138");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout1);
    obj.edit139:setType("number");
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setHorzTextAlign("center");
    obj.edit139:setLeft(400);
    obj.edit139:setTop(350);
    obj.edit139:setWidth(33);
    obj.edit139:setHeight(25);
    obj.edit139:setField("raca14");
    obj.edit139:setName("edit139");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout1);
    obj.edit140:setType("number");
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setLeft(400);
    obj.edit140:setTop(375);
    obj.edit140:setWidth(33);
    obj.edit140:setHeight(25);
    obj.edit140:setField("raca15");
    obj.edit140:setName("edit140");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout1);
    obj.edit141:setType("number");
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setHorzTextAlign("center");
    obj.edit141:setLeft(400);
    obj.edit141:setTop(400);
    obj.edit141:setWidth(33);
    obj.edit141:setHeight(25);
    obj.edit141:setField("raca16");
    obj.edit141:setName("edit141");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout1);
    obj.edit142:setType("number");
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setHorzTextAlign("center");
    obj.edit142:setLeft(400);
    obj.edit142:setTop(425);
    obj.edit142:setWidth(33);
    obj.edit142:setHeight(25);
    obj.edit142:setField("raca17");
    obj.edit142:setName("edit142");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout1);
    obj.edit143:setType("number");
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setLeft(400);
    obj.edit143:setTop(450);
    obj.edit143:setWidth(33);
    obj.edit143:setHeight(25);
    obj.edit143:setField("raca18");
    obj.edit143:setName("edit143");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout1);
    obj.edit144:setType("number");
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setHorzTextAlign("center");
    obj.edit144:setLeft(400);
    obj.edit144:setTop(475);
    obj.edit144:setWidth(33);
    obj.edit144:setHeight(25);
    obj.edit144:setField("raca19");
    obj.edit144:setName("edit144");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout1);
    obj.edit145:setType("number");
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setHorzTextAlign("center");
    obj.edit145:setLeft(400);
    obj.edit145:setTop(500);
    obj.edit145:setWidth(33);
    obj.edit145:setHeight(25);
    obj.edit145:setField("raca20");
    obj.edit145:setName("edit145");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout1);
    obj.edit146:setType("number");
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setLeft(400);
    obj.edit146:setTop(525);
    obj.edit146:setWidth(33);
    obj.edit146:setHeight(25);
    obj.edit146:setField("raca21");
    obj.edit146:setName("edit146");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout1);
    obj.edit147:setType("number");
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setHorzTextAlign("center");
    obj.edit147:setLeft(400);
    obj.edit147:setTop(550);
    obj.edit147:setWidth(33);
    obj.edit147:setHeight(25);
    obj.edit147:setField("raca22");
    obj.edit147:setName("edit147");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout1);
    obj.edit148:setType("number");
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setHorzTextAlign("center");
    obj.edit148:setLeft(400);
    obj.edit148:setTop(575);
    obj.edit148:setWidth(33);
    obj.edit148:setHeight(25);
    obj.edit148:setField("raca23");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout1);
    obj.edit149:setType("number");
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setLeft(400);
    obj.edit149:setTop(600);
    obj.edit149:setWidth(33);
    obj.edit149:setHeight(25);
    obj.edit149:setField("raca24");
    obj.edit149:setName("edit149");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout1);
    obj.edit150:setType("number");
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setHorzTextAlign("center");
    obj.edit150:setLeft(400);
    obj.edit150:setTop(625);
    obj.edit150:setWidth(33);
    obj.edit150:setHeight(25);
    obj.edit150:setField("raca25");
    obj.edit150:setName("edit150");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout1);
    obj.edit151:setType("number");
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setHorzTextAlign("center");
    obj.edit151:setLeft(433);
    obj.edit151:setTop(25);
    obj.edit151:setWidth(33);
    obj.edit151:setHeight(25);
    obj.edit151:setField("itens1");
    obj.edit151:setName("edit151");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout1);
    obj.edit152:setType("number");
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setLeft(433);
    obj.edit152:setTop(50);
    obj.edit152:setWidth(33);
    obj.edit152:setHeight(25);
    obj.edit152:setField("itens2");
    obj.edit152:setName("edit152");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout1);
    obj.edit153:setType("number");
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setHorzTextAlign("center");
    obj.edit153:setLeft(433);
    obj.edit153:setTop(75);
    obj.edit153:setWidth(33);
    obj.edit153:setHeight(25);
    obj.edit153:setField("itens3");
    obj.edit153:setName("edit153");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout1);
    obj.edit154:setType("number");
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setHorzTextAlign("center");
    obj.edit154:setLeft(433);
    obj.edit154:setTop(100);
    obj.edit154:setWidth(33);
    obj.edit154:setHeight(25);
    obj.edit154:setField("itens4");
    obj.edit154:setName("edit154");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout1);
    obj.edit155:setType("number");
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setLeft(433);
    obj.edit155:setTop(125);
    obj.edit155:setWidth(33);
    obj.edit155:setHeight(25);
    obj.edit155:setField("itens5");
    obj.edit155:setName("edit155");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout1);
    obj.edit156:setType("number");
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setHorzTextAlign("center");
    obj.edit156:setLeft(433);
    obj.edit156:setTop(150);
    obj.edit156:setWidth(33);
    obj.edit156:setHeight(25);
    obj.edit156:setField("itens6");
    obj.edit156:setName("edit156");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout1);
    obj.edit157:setType("number");
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setHorzTextAlign("center");
    obj.edit157:setLeft(433);
    obj.edit157:setTop(175);
    obj.edit157:setWidth(33);
    obj.edit157:setHeight(25);
    obj.edit157:setField("itens7");
    obj.edit157:setName("edit157");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout1);
    obj.edit158:setType("number");
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setLeft(433);
    obj.edit158:setTop(200);
    obj.edit158:setWidth(33);
    obj.edit158:setHeight(25);
    obj.edit158:setField("itens8");
    obj.edit158:setName("edit158");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout1);
    obj.edit159:setType("number");
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setHorzTextAlign("center");
    obj.edit159:setLeft(433);
    obj.edit159:setTop(225);
    obj.edit159:setWidth(33);
    obj.edit159:setHeight(25);
    obj.edit159:setField("itens9");
    obj.edit159:setName("edit159");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout1);
    obj.edit160:setType("number");
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setHorzTextAlign("center");
    obj.edit160:setLeft(433);
    obj.edit160:setTop(250);
    obj.edit160:setWidth(33);
    obj.edit160:setHeight(25);
    obj.edit160:setField("itens10");
    obj.edit160:setName("edit160");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout1);
    obj.edit161:setType("number");
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setLeft(433);
    obj.edit161:setTop(275);
    obj.edit161:setWidth(33);
    obj.edit161:setHeight(25);
    obj.edit161:setField("itens11");
    obj.edit161:setName("edit161");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout1);
    obj.edit162:setType("number");
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setHorzTextAlign("center");
    obj.edit162:setLeft(433);
    obj.edit162:setTop(300);
    obj.edit162:setWidth(33);
    obj.edit162:setHeight(25);
    obj.edit162:setField("itens12");
    obj.edit162:setName("edit162");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout1);
    obj.edit163:setType("number");
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setHorzTextAlign("center");
    obj.edit163:setLeft(433);
    obj.edit163:setTop(325);
    obj.edit163:setWidth(33);
    obj.edit163:setHeight(25);
    obj.edit163:setField("itens13");
    obj.edit163:setName("edit163");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout1);
    obj.edit164:setType("number");
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setLeft(433);
    obj.edit164:setTop(350);
    obj.edit164:setWidth(33);
    obj.edit164:setHeight(25);
    obj.edit164:setField("itens14");
    obj.edit164:setName("edit164");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout1);
    obj.edit165:setType("number");
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setHorzTextAlign("center");
    obj.edit165:setLeft(433);
    obj.edit165:setTop(375);
    obj.edit165:setWidth(33);
    obj.edit165:setHeight(25);
    obj.edit165:setField("itens15");
    obj.edit165:setName("edit165");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout1);
    obj.edit166:setType("number");
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setHorzTextAlign("center");
    obj.edit166:setLeft(433);
    obj.edit166:setTop(400);
    obj.edit166:setWidth(33);
    obj.edit166:setHeight(25);
    obj.edit166:setField("itens16");
    obj.edit166:setName("edit166");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout1);
    obj.edit167:setType("number");
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setLeft(433);
    obj.edit167:setTop(425);
    obj.edit167:setWidth(33);
    obj.edit167:setHeight(25);
    obj.edit167:setField("itens17");
    obj.edit167:setName("edit167");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout1);
    obj.edit168:setType("number");
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setHorzTextAlign("center");
    obj.edit168:setLeft(433);
    obj.edit168:setTop(450);
    obj.edit168:setWidth(33);
    obj.edit168:setHeight(25);
    obj.edit168:setField("itens18");
    obj.edit168:setName("edit168");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout1);
    obj.edit169:setType("number");
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setHorzTextAlign("center");
    obj.edit169:setLeft(433);
    obj.edit169:setTop(475);
    obj.edit169:setWidth(33);
    obj.edit169:setHeight(25);
    obj.edit169:setField("itens19");
    obj.edit169:setName("edit169");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout1);
    obj.edit170:setType("number");
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setLeft(433);
    obj.edit170:setTop(500);
    obj.edit170:setWidth(33);
    obj.edit170:setHeight(25);
    obj.edit170:setField("itens20");
    obj.edit170:setName("edit170");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout1);
    obj.edit171:setType("number");
    obj.edit171:setVertTextAlign("center");
    obj.edit171:setHorzTextAlign("center");
    obj.edit171:setLeft(433);
    obj.edit171:setTop(525);
    obj.edit171:setWidth(33);
    obj.edit171:setHeight(25);
    obj.edit171:setField("itens21");
    obj.edit171:setName("edit171");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout1);
    obj.edit172:setType("number");
    obj.edit172:setVertTextAlign("center");
    obj.edit172:setHorzTextAlign("center");
    obj.edit172:setLeft(433);
    obj.edit172:setTop(550);
    obj.edit172:setWidth(33);
    obj.edit172:setHeight(25);
    obj.edit172:setField("itens22");
    obj.edit172:setName("edit172");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout1);
    obj.edit173:setType("number");
    obj.edit173:setVertTextAlign("center");
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setLeft(433);
    obj.edit173:setTop(575);
    obj.edit173:setWidth(33);
    obj.edit173:setHeight(25);
    obj.edit173:setField("itens23");
    obj.edit173:setName("edit173");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout1);
    obj.edit174:setType("number");
    obj.edit174:setVertTextAlign("center");
    obj.edit174:setHorzTextAlign("center");
    obj.edit174:setLeft(433);
    obj.edit174:setTop(600);
    obj.edit174:setWidth(33);
    obj.edit174:setHeight(25);
    obj.edit174:setField("itens24");
    obj.edit174:setName("edit174");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout1);
    obj.edit175:setType("number");
    obj.edit175:setVertTextAlign("center");
    obj.edit175:setHorzTextAlign("center");
    obj.edit175:setLeft(433);
    obj.edit175:setTop(625);
    obj.edit175:setWidth(33);
    obj.edit175:setHeight(25);
    obj.edit175:setField("itens25");
    obj.edit175:setName("edit175");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout1);
    obj.label51:setText("NOME DA PERÍCIA");
    obj.label51:setLeft(21);
    obj.label51:setTop(1);
    obj.label51:setWidth(135);
    obj.label51:setHeight(20);
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout1);
    obj.label52:setText("CHAVE");
    obj.label52:setLeft(158);
    obj.label52:setTop(1);
    obj.label52:setWidth(45);
    obj.label52:setHeight(20);
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout1);
    obj.label53:setText("TOTAL");
    obj.label53:setLeft(205);
    obj.label53:setTop(1);
    obj.label53:setWidth(40);
    obj.label53:setHeight(20);
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout1);
    obj.label54:setText("ATR");
    obj.label54:setLeft(268);
    obj.label54:setTop(1);
    obj.label54:setWidth(33);
    obj.label54:setHeight(20);
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout1);
    obj.label55:setText("GRAD");
    obj.label55:setLeft(298);
    obj.label55:setTop(1);
    obj.label55:setWidth(40);
    obj.label55:setHeight(20);
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout1);
    obj.label56:setText("OUT");
    obj.label56:setLeft(334);
    obj.label56:setTop(1);
    obj.label56:setWidth(33);
    obj.label56:setHeight(20);
    obj.label56:setHorzTextAlign("center");
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout1);
    obj.label57:setText("PEN");
    obj.label57:setLeft(367);
    obj.label57:setTop(1);
    obj.label57:setWidth(33);
    obj.label57:setHeight(20);
    obj.label57:setHorzTextAlign("center");
    obj.label57:setName("label57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout1);
    obj.label58:setText("RAÇA");
    obj.label58:setLeft(400);
    obj.label58:setTop(1);
    obj.label58:setWidth(33);
    obj.label58:setHeight(20);
    obj.label58:setHorzTextAlign("center");
    obj.label58:setName("label58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout1);
    obj.label59:setText("EQP");
    obj.label59:setLeft(433);
    obj.label59:setTop(1);
    obj.label59:setWidth(33);
    obj.label59:setHeight(20);
    obj.label59:setHorzTextAlign("center");
    obj.label59:setName("label59");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout1);
    obj.button1:setLeft(240);
    obj.button1:setTop(25);
    obj.button1:setWidth(24);
    obj.button1:setHeight(25);
    obj.button1:setText("R");
    obj.button1:setFontSize(11);
    obj.button1:setName("button1");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout1);
    obj.dataLink1:setFields({'atributo1', 'graduacao1', 'outros1', 'penalidade1', 'raca1', 'itens1'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout1);
    obj.dataLink2:setFields({'chave1', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink2:setName("dataLink2");

    obj.button2 = gui.fromHandle(_obj_newObject("button"));
    obj.button2:setParent(obj.layout1);
    obj.button2:setLeft(240);
    obj.button2:setTop(50);
    obj.button2:setWidth(24);
    obj.button2:setHeight(25);
    obj.button2:setText("R");
    obj.button2:setFontSize(11);
    obj.button2:setName("button2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout1);
    obj.dataLink3:setFields({'atributo2', 'graduacao2', 'outros2', 'penalidade2', 'raca2', 'itens2'});
    obj.dataLink3:setName("dataLink3");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout1);
    obj.dataLink4:setFields({'chave2', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink4:setName("dataLink4");

    obj.button3 = gui.fromHandle(_obj_newObject("button"));
    obj.button3:setParent(obj.layout1);
    obj.button3:setLeft(240);
    obj.button3:setTop(75);
    obj.button3:setWidth(24);
    obj.button3:setHeight(25);
    obj.button3:setText("R");
    obj.button3:setFontSize(11);
    obj.button3:setName("button3");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout1);
    obj.dataLink5:setFields({'atributo3', 'graduacao3', 'outros3', 'penalidade3', 'raca3', 'itens3'});
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout1);
    obj.dataLink6:setFields({'chave3', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink6:setName("dataLink6");

    obj.button4 = gui.fromHandle(_obj_newObject("button"));
    obj.button4:setParent(obj.layout1);
    obj.button4:setLeft(240);
    obj.button4:setTop(100);
    obj.button4:setWidth(24);
    obj.button4:setHeight(25);
    obj.button4:setText("R");
    obj.button4:setFontSize(11);
    obj.button4:setName("button4");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout1);
    obj.dataLink7:setFields({'atributo4', 'graduacao4', 'outros4', 'penalidade4', 'raca4', 'itens4'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout1);
    obj.dataLink8:setFields({'chave4', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink8:setName("dataLink8");

    obj.button5 = gui.fromHandle(_obj_newObject("button"));
    obj.button5:setParent(obj.layout1);
    obj.button5:setLeft(240);
    obj.button5:setTop(125);
    obj.button5:setWidth(24);
    obj.button5:setHeight(25);
    obj.button5:setText("R");
    obj.button5:setFontSize(11);
    obj.button5:setName("button5");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout1);
    obj.dataLink9:setFields({'atributo5', 'graduacao5', 'outros5', 'penalidade5', 'raca5', 'itens5'});
    obj.dataLink9:setName("dataLink9");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout1);
    obj.dataLink10:setFields({'chave5', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink10:setName("dataLink10");

    obj.button6 = gui.fromHandle(_obj_newObject("button"));
    obj.button6:setParent(obj.layout1);
    obj.button6:setLeft(240);
    obj.button6:setTop(150);
    obj.button6:setWidth(24);
    obj.button6:setHeight(25);
    obj.button6:setText("R");
    obj.button6:setFontSize(11);
    obj.button6:setName("button6");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout1);
    obj.dataLink11:setFields({'atributo6', 'graduacao6', 'outros6', 'penalidade6', 'raca6', 'itens6'});
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout1);
    obj.dataLink12:setFields({'chave6', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink12:setName("dataLink12");

    obj.button7 = gui.fromHandle(_obj_newObject("button"));
    obj.button7:setParent(obj.layout1);
    obj.button7:setLeft(240);
    obj.button7:setTop(175);
    obj.button7:setWidth(24);
    obj.button7:setHeight(25);
    obj.button7:setText("R");
    obj.button7:setFontSize(11);
    obj.button7:setName("button7");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout1);
    obj.dataLink13:setFields({'atributo7', 'graduacao7', 'outros7', 'penalidade7', 'raca7', 'itens7'});
    obj.dataLink13:setName("dataLink13");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout1);
    obj.dataLink14:setFields({'chave7', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink14:setName("dataLink14");

    obj.button8 = gui.fromHandle(_obj_newObject("button"));
    obj.button8:setParent(obj.layout1);
    obj.button8:setLeft(240);
    obj.button8:setTop(200);
    obj.button8:setWidth(24);
    obj.button8:setHeight(25);
    obj.button8:setText("R");
    obj.button8:setFontSize(11);
    obj.button8:setName("button8");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout1);
    obj.dataLink15:setFields({'atributo8', 'graduacao8', 'outros8', 'penalidade8', 'raca8', 'itens8'});
    obj.dataLink15:setName("dataLink15");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout1);
    obj.dataLink16:setFields({'chave8', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink16:setName("dataLink16");

    obj.button9 = gui.fromHandle(_obj_newObject("button"));
    obj.button9:setParent(obj.layout1);
    obj.button9:setLeft(240);
    obj.button9:setTop(225);
    obj.button9:setWidth(24);
    obj.button9:setHeight(25);
    obj.button9:setText("R");
    obj.button9:setFontSize(11);
    obj.button9:setName("button9");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout1);
    obj.dataLink17:setFields({'atributo9', 'graduacao9', 'outros9', 'penalidade9', 'raca9', 'itens9'});
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout1);
    obj.dataLink18:setFields({'chave9', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink18:setName("dataLink18");

    obj.button10 = gui.fromHandle(_obj_newObject("button"));
    obj.button10:setParent(obj.layout1);
    obj.button10:setLeft(240);
    obj.button10:setTop(250);
    obj.button10:setWidth(24);
    obj.button10:setHeight(25);
    obj.button10:setText("R");
    obj.button10:setFontSize(11);
    obj.button10:setName("button10");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout1);
    obj.dataLink19:setFields({'atributo10', 'graduacao10', 'outros10', 'penalidade10', 'raca10', 'itens10'});
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout1);
    obj.dataLink20:setFields({'chave10', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink20:setName("dataLink20");

    obj.button11 = gui.fromHandle(_obj_newObject("button"));
    obj.button11:setParent(obj.layout1);
    obj.button11:setLeft(240);
    obj.button11:setTop(275);
    obj.button11:setWidth(24);
    obj.button11:setHeight(25);
    obj.button11:setText("R");
    obj.button11:setFontSize(11);
    obj.button11:setName("button11");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout1);
    obj.dataLink21:setFields({'atributo11', 'graduacao11', 'outros11', 'penalidade11', 'raca11', 'itens11'});
    obj.dataLink21:setName("dataLink21");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout1);
    obj.dataLink22:setFields({'chave11', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink22:setName("dataLink22");

    obj.button12 = gui.fromHandle(_obj_newObject("button"));
    obj.button12:setParent(obj.layout1);
    obj.button12:setLeft(240);
    obj.button12:setTop(300);
    obj.button12:setWidth(24);
    obj.button12:setHeight(25);
    obj.button12:setText("R");
    obj.button12:setFontSize(11);
    obj.button12:setName("button12");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout1);
    obj.dataLink23:setFields({'atributo12', 'graduacao12', 'outros12', 'penalidade12', 'raca12', 'itens12'});
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout1);
    obj.dataLink24:setFields({'chave12', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink24:setName("dataLink24");

    obj.button13 = gui.fromHandle(_obj_newObject("button"));
    obj.button13:setParent(obj.layout1);
    obj.button13:setLeft(240);
    obj.button13:setTop(325);
    obj.button13:setWidth(24);
    obj.button13:setHeight(25);
    obj.button13:setText("R");
    obj.button13:setFontSize(11);
    obj.button13:setName("button13");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout1);
    obj.dataLink25:setFields({'atributo13', 'graduacao13', 'outros13', 'penalidade13', 'raca13', 'itens13'});
    obj.dataLink25:setName("dataLink25");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout1);
    obj.dataLink26:setFields({'chave13', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink26:setName("dataLink26");

    obj.button14 = gui.fromHandle(_obj_newObject("button"));
    obj.button14:setParent(obj.layout1);
    obj.button14:setLeft(240);
    obj.button14:setTop(350);
    obj.button14:setWidth(24);
    obj.button14:setHeight(25);
    obj.button14:setText("R");
    obj.button14:setFontSize(11);
    obj.button14:setName("button14");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout1);
    obj.dataLink27:setFields({'atributo14', 'graduacao14', 'outros14', 'penalidade14', 'raca14', 'itens14'});
    obj.dataLink27:setName("dataLink27");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout1);
    obj.dataLink28:setFields({'chave14', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink28:setName("dataLink28");

    obj.button15 = gui.fromHandle(_obj_newObject("button"));
    obj.button15:setParent(obj.layout1);
    obj.button15:setLeft(240);
    obj.button15:setTop(375);
    obj.button15:setWidth(24);
    obj.button15:setHeight(25);
    obj.button15:setText("R");
    obj.button15:setFontSize(11);
    obj.button15:setName("button15");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout1);
    obj.dataLink29:setFields({'atributo15', 'graduacao15', 'outros15', 'penalidade15', 'raca15', 'itens15'});
    obj.dataLink29:setName("dataLink29");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout1);
    obj.dataLink30:setFields({'chave15', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink30:setName("dataLink30");

    obj.button16 = gui.fromHandle(_obj_newObject("button"));
    obj.button16:setParent(obj.layout1);
    obj.button16:setLeft(240);
    obj.button16:setTop(400);
    obj.button16:setWidth(24);
    obj.button16:setHeight(25);
    obj.button16:setText("R");
    obj.button16:setFontSize(11);
    obj.button16:setName("button16");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout1);
    obj.dataLink31:setFields({'atributo16', 'graduacao16', 'outros16', 'penalidade16', 'raca16', 'itens16'});
    obj.dataLink31:setName("dataLink31");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout1);
    obj.dataLink32:setFields({'chave16', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink32:setName("dataLink32");

    obj.button17 = gui.fromHandle(_obj_newObject("button"));
    obj.button17:setParent(obj.layout1);
    obj.button17:setLeft(240);
    obj.button17:setTop(425);
    obj.button17:setWidth(24);
    obj.button17:setHeight(25);
    obj.button17:setText("R");
    obj.button17:setFontSize(11);
    obj.button17:setName("button17");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout1);
    obj.dataLink33:setFields({'atributo17', 'graduacao17', 'outros17', 'penalidade17', 'raca17', 'itens17'});
    obj.dataLink33:setName("dataLink33");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout1);
    obj.dataLink34:setFields({'chave17', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink34:setName("dataLink34");

    obj.button18 = gui.fromHandle(_obj_newObject("button"));
    obj.button18:setParent(obj.layout1);
    obj.button18:setLeft(240);
    obj.button18:setTop(450);
    obj.button18:setWidth(24);
    obj.button18:setHeight(25);
    obj.button18:setText("R");
    obj.button18:setFontSize(11);
    obj.button18:setName("button18");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout1);
    obj.dataLink35:setFields({'atributo18', 'graduacao18', 'outros18', 'penalidade18', 'raca18', 'itens18'});
    obj.dataLink35:setName("dataLink35");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout1);
    obj.dataLink36:setFields({'chave18', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink36:setName("dataLink36");

    obj.button19 = gui.fromHandle(_obj_newObject("button"));
    obj.button19:setParent(obj.layout1);
    obj.button19:setLeft(240);
    obj.button19:setTop(475);
    obj.button19:setWidth(24);
    obj.button19:setHeight(25);
    obj.button19:setText("R");
    obj.button19:setFontSize(11);
    obj.button19:setName("button19");

    obj.dataLink37 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink37:setParent(obj.layout1);
    obj.dataLink37:setFields({'atributo19', 'graduacao19', 'outros19', 'penalidade19', 'raca19', 'itens19'});
    obj.dataLink37:setName("dataLink37");

    obj.dataLink38 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink38:setParent(obj.layout1);
    obj.dataLink38:setFields({'chave19', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink38:setName("dataLink38");

    obj.button20 = gui.fromHandle(_obj_newObject("button"));
    obj.button20:setParent(obj.layout1);
    obj.button20:setLeft(240);
    obj.button20:setTop(500);
    obj.button20:setWidth(24);
    obj.button20:setHeight(25);
    obj.button20:setText("R");
    obj.button20:setFontSize(11);
    obj.button20:setName("button20");

    obj.dataLink39 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink39:setParent(obj.layout1);
    obj.dataLink39:setFields({'atributo20', 'graduacao20', 'outros20', 'penalidade20', 'raca20', 'itens20'});
    obj.dataLink39:setName("dataLink39");

    obj.dataLink40 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink40:setParent(obj.layout1);
    obj.dataLink40:setFields({'chave20', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink40:setName("dataLink40");

    obj.button21 = gui.fromHandle(_obj_newObject("button"));
    obj.button21:setParent(obj.layout1);
    obj.button21:setLeft(240);
    obj.button21:setTop(525);
    obj.button21:setWidth(24);
    obj.button21:setHeight(25);
    obj.button21:setText("R");
    obj.button21:setFontSize(11);
    obj.button21:setName("button21");

    obj.dataLink41 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink41:setParent(obj.layout1);
    obj.dataLink41:setFields({'atributo21', 'graduacao21', 'outros21', 'penalidade21', 'raca21', 'itens21'});
    obj.dataLink41:setName("dataLink41");

    obj.dataLink42 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink42:setParent(obj.layout1);
    obj.dataLink42:setFields({'chave21', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink42:setName("dataLink42");

    obj.button22 = gui.fromHandle(_obj_newObject("button"));
    obj.button22:setParent(obj.layout1);
    obj.button22:setLeft(240);
    obj.button22:setTop(550);
    obj.button22:setWidth(24);
    obj.button22:setHeight(25);
    obj.button22:setText("R");
    obj.button22:setFontSize(11);
    obj.button22:setName("button22");

    obj.dataLink43 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink43:setParent(obj.layout1);
    obj.dataLink43:setFields({'atributo22', 'graduacao22', 'outros22', 'penalidade22', 'raca22', 'itens22'});
    obj.dataLink43:setName("dataLink43");

    obj.dataLink44 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink44:setParent(obj.layout1);
    obj.dataLink44:setFields({'chave22', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink44:setName("dataLink44");

    obj.button23 = gui.fromHandle(_obj_newObject("button"));
    obj.button23:setParent(obj.layout1);
    obj.button23:setLeft(240);
    obj.button23:setTop(575);
    obj.button23:setWidth(24);
    obj.button23:setHeight(25);
    obj.button23:setText("R");
    obj.button23:setFontSize(11);
    obj.button23:setName("button23");

    obj.dataLink45 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink45:setParent(obj.layout1);
    obj.dataLink45:setFields({'atributo23', 'graduacao23', 'outros23', 'penalidade23', 'raca23', 'itens23'});
    obj.dataLink45:setName("dataLink45");

    obj.dataLink46 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink46:setParent(obj.layout1);
    obj.dataLink46:setFields({'chave23', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink46:setName("dataLink46");

    obj.button24 = gui.fromHandle(_obj_newObject("button"));
    obj.button24:setParent(obj.layout1);
    obj.button24:setLeft(240);
    obj.button24:setTop(600);
    obj.button24:setWidth(24);
    obj.button24:setHeight(25);
    obj.button24:setText("R");
    obj.button24:setFontSize(11);
    obj.button24:setName("button24");

    obj.dataLink47 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink47:setParent(obj.layout1);
    obj.dataLink47:setFields({'atributo24', 'graduacao24', 'outros24', 'penalidade24', 'raca24', 'itens24'});
    obj.dataLink47:setName("dataLink47");

    obj.dataLink48 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink48:setParent(obj.layout1);
    obj.dataLink48:setFields({'chave24', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink48:setName("dataLink48");

    obj.button25 = gui.fromHandle(_obj_newObject("button"));
    obj.button25:setParent(obj.layout1);
    obj.button25:setLeft(240);
    obj.button25:setTop(625);
    obj.button25:setWidth(24);
    obj.button25:setHeight(25);
    obj.button25:setText("R");
    obj.button25:setFontSize(11);
    obj.button25:setName("button25");

    obj.dataLink49 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink49:setParent(obj.layout1);
    obj.dataLink49:setFields({'atributo25', 'graduacao25', 'outros25', 'penalidade25', 'raca25', 'itens25'});
    obj.dataLink49:setName("dataLink49");

    obj.dataLink50 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink50:setParent(obj.layout1);
    obj.dataLink50:setFields({'chave25', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink50:setName("dataLink50");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(476);
    obj.layout2:setTop(0);
    obj.layout2:setWidth(472);
    obj.layout2:setHeight(656);
    obj.layout2:setName("layout2");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout2);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout2);
    obj.rectangle53:setLeft(202);
    obj.rectangle53:setTop(25);
    obj.rectangle53:setWidth(33);
    obj.rectangle53:setHeight(24);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setStrokeColor("white");
    obj.rectangle53:setStrokeSize(1);
    obj.rectangle53:setName("rectangle53");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout2);
    obj.rectangle54:setLeft(267);
    obj.rectangle54:setTop(25);
    obj.rectangle54:setWidth(33);
    obj.rectangle54:setHeight(24);
    obj.rectangle54:setColor("black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout2);
    obj.rectangle55:setLeft(202);
    obj.rectangle55:setTop(50);
    obj.rectangle55:setWidth(33);
    obj.rectangle55:setHeight(24);
    obj.rectangle55:setColor("black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.rectangle56 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle56:setParent(obj.layout2);
    obj.rectangle56:setLeft(267);
    obj.rectangle56:setTop(50);
    obj.rectangle56:setWidth(33);
    obj.rectangle56:setHeight(24);
    obj.rectangle56:setColor("black");
    obj.rectangle56:setStrokeColor("white");
    obj.rectangle56:setStrokeSize(1);
    obj.rectangle56:setName("rectangle56");

    obj.rectangle57 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle57:setParent(obj.layout2);
    obj.rectangle57:setLeft(202);
    obj.rectangle57:setTop(75);
    obj.rectangle57:setWidth(33);
    obj.rectangle57:setHeight(24);
    obj.rectangle57:setColor("black");
    obj.rectangle57:setStrokeColor("white");
    obj.rectangle57:setStrokeSize(1);
    obj.rectangle57:setName("rectangle57");

    obj.rectangle58 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle58:setParent(obj.layout2);
    obj.rectangle58:setLeft(267);
    obj.rectangle58:setTop(75);
    obj.rectangle58:setWidth(33);
    obj.rectangle58:setHeight(24);
    obj.rectangle58:setColor("black");
    obj.rectangle58:setStrokeColor("white");
    obj.rectangle58:setStrokeSize(1);
    obj.rectangle58:setName("rectangle58");

    obj.rectangle59 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle59:setParent(obj.layout2);
    obj.rectangle59:setLeft(202);
    obj.rectangle59:setTop(100);
    obj.rectangle59:setWidth(33);
    obj.rectangle59:setHeight(24);
    obj.rectangle59:setColor("black");
    obj.rectangle59:setStrokeColor("white");
    obj.rectangle59:setStrokeSize(1);
    obj.rectangle59:setName("rectangle59");

    obj.rectangle60 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle60:setParent(obj.layout2);
    obj.rectangle60:setLeft(267);
    obj.rectangle60:setTop(100);
    obj.rectangle60:setWidth(33);
    obj.rectangle60:setHeight(24);
    obj.rectangle60:setColor("black");
    obj.rectangle60:setStrokeColor("white");
    obj.rectangle60:setStrokeSize(1);
    obj.rectangle60:setName("rectangle60");

    obj.rectangle61 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle61:setParent(obj.layout2);
    obj.rectangle61:setLeft(202);
    obj.rectangle61:setTop(125);
    obj.rectangle61:setWidth(33);
    obj.rectangle61:setHeight(24);
    obj.rectangle61:setColor("black");
    obj.rectangle61:setStrokeColor("white");
    obj.rectangle61:setStrokeSize(1);
    obj.rectangle61:setName("rectangle61");

    obj.rectangle62 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle62:setParent(obj.layout2);
    obj.rectangle62:setLeft(267);
    obj.rectangle62:setTop(125);
    obj.rectangle62:setWidth(33);
    obj.rectangle62:setHeight(24);
    obj.rectangle62:setColor("black");
    obj.rectangle62:setStrokeColor("white");
    obj.rectangle62:setStrokeSize(1);
    obj.rectangle62:setName("rectangle62");

    obj.rectangle63 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle63:setParent(obj.layout2);
    obj.rectangle63:setLeft(202);
    obj.rectangle63:setTop(150);
    obj.rectangle63:setWidth(33);
    obj.rectangle63:setHeight(24);
    obj.rectangle63:setColor("black");
    obj.rectangle63:setStrokeColor("white");
    obj.rectangle63:setStrokeSize(1);
    obj.rectangle63:setName("rectangle63");

    obj.rectangle64 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle64:setParent(obj.layout2);
    obj.rectangle64:setLeft(267);
    obj.rectangle64:setTop(150);
    obj.rectangle64:setWidth(33);
    obj.rectangle64:setHeight(24);
    obj.rectangle64:setColor("black");
    obj.rectangle64:setStrokeColor("white");
    obj.rectangle64:setStrokeSize(1);
    obj.rectangle64:setName("rectangle64");

    obj.rectangle65 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle65:setParent(obj.layout2);
    obj.rectangle65:setLeft(202);
    obj.rectangle65:setTop(175);
    obj.rectangle65:setWidth(33);
    obj.rectangle65:setHeight(24);
    obj.rectangle65:setColor("black");
    obj.rectangle65:setStrokeColor("white");
    obj.rectangle65:setStrokeSize(1);
    obj.rectangle65:setName("rectangle65");

    obj.rectangle66 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle66:setParent(obj.layout2);
    obj.rectangle66:setLeft(267);
    obj.rectangle66:setTop(175);
    obj.rectangle66:setWidth(33);
    obj.rectangle66:setHeight(24);
    obj.rectangle66:setColor("black");
    obj.rectangle66:setStrokeColor("white");
    obj.rectangle66:setStrokeSize(1);
    obj.rectangle66:setName("rectangle66");

    obj.rectangle67 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle67:setParent(obj.layout2);
    obj.rectangle67:setLeft(202);
    obj.rectangle67:setTop(200);
    obj.rectangle67:setWidth(33);
    obj.rectangle67:setHeight(24);
    obj.rectangle67:setColor("black");
    obj.rectangle67:setStrokeColor("white");
    obj.rectangle67:setStrokeSize(1);
    obj.rectangle67:setName("rectangle67");

    obj.rectangle68 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle68:setParent(obj.layout2);
    obj.rectangle68:setLeft(267);
    obj.rectangle68:setTop(200);
    obj.rectangle68:setWidth(33);
    obj.rectangle68:setHeight(24);
    obj.rectangle68:setColor("black");
    obj.rectangle68:setStrokeColor("white");
    obj.rectangle68:setStrokeSize(1);
    obj.rectangle68:setName("rectangle68");

    obj.rectangle69 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle69:setParent(obj.layout2);
    obj.rectangle69:setLeft(202);
    obj.rectangle69:setTop(225);
    obj.rectangle69:setWidth(33);
    obj.rectangle69:setHeight(24);
    obj.rectangle69:setColor("black");
    obj.rectangle69:setStrokeColor("white");
    obj.rectangle69:setStrokeSize(1);
    obj.rectangle69:setName("rectangle69");

    obj.rectangle70 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle70:setParent(obj.layout2);
    obj.rectangle70:setLeft(267);
    obj.rectangle70:setTop(225);
    obj.rectangle70:setWidth(33);
    obj.rectangle70:setHeight(24);
    obj.rectangle70:setColor("black");
    obj.rectangle70:setStrokeColor("white");
    obj.rectangle70:setStrokeSize(1);
    obj.rectangle70:setName("rectangle70");

    obj.rectangle71 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle71:setParent(obj.layout2);
    obj.rectangle71:setLeft(202);
    obj.rectangle71:setTop(250);
    obj.rectangle71:setWidth(33);
    obj.rectangle71:setHeight(24);
    obj.rectangle71:setColor("black");
    obj.rectangle71:setStrokeColor("white");
    obj.rectangle71:setStrokeSize(1);
    obj.rectangle71:setName("rectangle71");

    obj.rectangle72 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle72:setParent(obj.layout2);
    obj.rectangle72:setLeft(267);
    obj.rectangle72:setTop(250);
    obj.rectangle72:setWidth(33);
    obj.rectangle72:setHeight(24);
    obj.rectangle72:setColor("black");
    obj.rectangle72:setStrokeColor("white");
    obj.rectangle72:setStrokeSize(1);
    obj.rectangle72:setName("rectangle72");

    obj.rectangle73 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle73:setParent(obj.layout2);
    obj.rectangle73:setLeft(202);
    obj.rectangle73:setTop(275);
    obj.rectangle73:setWidth(33);
    obj.rectangle73:setHeight(24);
    obj.rectangle73:setColor("black");
    obj.rectangle73:setStrokeColor("white");
    obj.rectangle73:setStrokeSize(1);
    obj.rectangle73:setName("rectangle73");

    obj.rectangle74 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle74:setParent(obj.layout2);
    obj.rectangle74:setLeft(267);
    obj.rectangle74:setTop(275);
    obj.rectangle74:setWidth(33);
    obj.rectangle74:setHeight(24);
    obj.rectangle74:setColor("black");
    obj.rectangle74:setStrokeColor("white");
    obj.rectangle74:setStrokeSize(1);
    obj.rectangle74:setName("rectangle74");

    obj.rectangle75 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle75:setParent(obj.layout2);
    obj.rectangle75:setLeft(202);
    obj.rectangle75:setTop(300);
    obj.rectangle75:setWidth(33);
    obj.rectangle75:setHeight(24);
    obj.rectangle75:setColor("black");
    obj.rectangle75:setStrokeColor("white");
    obj.rectangle75:setStrokeSize(1);
    obj.rectangle75:setName("rectangle75");

    obj.rectangle76 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle76:setParent(obj.layout2);
    obj.rectangle76:setLeft(267);
    obj.rectangle76:setTop(300);
    obj.rectangle76:setWidth(33);
    obj.rectangle76:setHeight(24);
    obj.rectangle76:setColor("black");
    obj.rectangle76:setStrokeColor("white");
    obj.rectangle76:setStrokeSize(1);
    obj.rectangle76:setName("rectangle76");

    obj.rectangle77 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle77:setParent(obj.layout2);
    obj.rectangle77:setLeft(202);
    obj.rectangle77:setTop(325);
    obj.rectangle77:setWidth(33);
    obj.rectangle77:setHeight(24);
    obj.rectangle77:setColor("black");
    obj.rectangle77:setStrokeColor("white");
    obj.rectangle77:setStrokeSize(1);
    obj.rectangle77:setName("rectangle77");

    obj.rectangle78 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle78:setParent(obj.layout2);
    obj.rectangle78:setLeft(267);
    obj.rectangle78:setTop(325);
    obj.rectangle78:setWidth(33);
    obj.rectangle78:setHeight(24);
    obj.rectangle78:setColor("black");
    obj.rectangle78:setStrokeColor("white");
    obj.rectangle78:setStrokeSize(1);
    obj.rectangle78:setName("rectangle78");

    obj.rectangle79 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle79:setParent(obj.layout2);
    obj.rectangle79:setLeft(202);
    obj.rectangle79:setTop(350);
    obj.rectangle79:setWidth(33);
    obj.rectangle79:setHeight(24);
    obj.rectangle79:setColor("black");
    obj.rectangle79:setStrokeColor("white");
    obj.rectangle79:setStrokeSize(1);
    obj.rectangle79:setName("rectangle79");

    obj.rectangle80 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle80:setParent(obj.layout2);
    obj.rectangle80:setLeft(267);
    obj.rectangle80:setTop(350);
    obj.rectangle80:setWidth(33);
    obj.rectangle80:setHeight(24);
    obj.rectangle80:setColor("black");
    obj.rectangle80:setStrokeColor("white");
    obj.rectangle80:setStrokeSize(1);
    obj.rectangle80:setName("rectangle80");

    obj.rectangle81 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle81:setParent(obj.layout2);
    obj.rectangle81:setLeft(202);
    obj.rectangle81:setTop(375);
    obj.rectangle81:setWidth(33);
    obj.rectangle81:setHeight(24);
    obj.rectangle81:setColor("black");
    obj.rectangle81:setStrokeColor("white");
    obj.rectangle81:setStrokeSize(1);
    obj.rectangle81:setName("rectangle81");

    obj.rectangle82 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle82:setParent(obj.layout2);
    obj.rectangle82:setLeft(267);
    obj.rectangle82:setTop(375);
    obj.rectangle82:setWidth(33);
    obj.rectangle82:setHeight(24);
    obj.rectangle82:setColor("black");
    obj.rectangle82:setStrokeColor("white");
    obj.rectangle82:setStrokeSize(1);
    obj.rectangle82:setName("rectangle82");

    obj.rectangle83 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle83:setParent(obj.layout2);
    obj.rectangle83:setLeft(202);
    obj.rectangle83:setTop(400);
    obj.rectangle83:setWidth(33);
    obj.rectangle83:setHeight(24);
    obj.rectangle83:setColor("black");
    obj.rectangle83:setStrokeColor("white");
    obj.rectangle83:setStrokeSize(1);
    obj.rectangle83:setName("rectangle83");

    obj.rectangle84 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle84:setParent(obj.layout2);
    obj.rectangle84:setLeft(267);
    obj.rectangle84:setTop(400);
    obj.rectangle84:setWidth(33);
    obj.rectangle84:setHeight(24);
    obj.rectangle84:setColor("black");
    obj.rectangle84:setStrokeColor("white");
    obj.rectangle84:setStrokeSize(1);
    obj.rectangle84:setName("rectangle84");

    obj.rectangle85 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle85:setParent(obj.layout2);
    obj.rectangle85:setLeft(202);
    obj.rectangle85:setTop(425);
    obj.rectangle85:setWidth(33);
    obj.rectangle85:setHeight(24);
    obj.rectangle85:setColor("black");
    obj.rectangle85:setStrokeColor("white");
    obj.rectangle85:setStrokeSize(1);
    obj.rectangle85:setName("rectangle85");

    obj.rectangle86 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle86:setParent(obj.layout2);
    obj.rectangle86:setLeft(267);
    obj.rectangle86:setTop(425);
    obj.rectangle86:setWidth(33);
    obj.rectangle86:setHeight(24);
    obj.rectangle86:setColor("black");
    obj.rectangle86:setStrokeColor("white");
    obj.rectangle86:setStrokeSize(1);
    obj.rectangle86:setName("rectangle86");

    obj.rectangle87 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle87:setParent(obj.layout2);
    obj.rectangle87:setLeft(202);
    obj.rectangle87:setTop(450);
    obj.rectangle87:setWidth(33);
    obj.rectangle87:setHeight(24);
    obj.rectangle87:setColor("black");
    obj.rectangle87:setStrokeColor("white");
    obj.rectangle87:setStrokeSize(1);
    obj.rectangle87:setName("rectangle87");

    obj.rectangle88 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle88:setParent(obj.layout2);
    obj.rectangle88:setLeft(267);
    obj.rectangle88:setTop(450);
    obj.rectangle88:setWidth(33);
    obj.rectangle88:setHeight(24);
    obj.rectangle88:setColor("black");
    obj.rectangle88:setStrokeColor("white");
    obj.rectangle88:setStrokeSize(1);
    obj.rectangle88:setName("rectangle88");

    obj.rectangle89 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle89:setParent(obj.layout2);
    obj.rectangle89:setLeft(202);
    obj.rectangle89:setTop(475);
    obj.rectangle89:setWidth(33);
    obj.rectangle89:setHeight(24);
    obj.rectangle89:setColor("black");
    obj.rectangle89:setStrokeColor("white");
    obj.rectangle89:setStrokeSize(1);
    obj.rectangle89:setName("rectangle89");

    obj.rectangle90 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle90:setParent(obj.layout2);
    obj.rectangle90:setLeft(267);
    obj.rectangle90:setTop(475);
    obj.rectangle90:setWidth(33);
    obj.rectangle90:setHeight(24);
    obj.rectangle90:setColor("black");
    obj.rectangle90:setStrokeColor("white");
    obj.rectangle90:setStrokeSize(1);
    obj.rectangle90:setName("rectangle90");

    obj.rectangle91 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle91:setParent(obj.layout2);
    obj.rectangle91:setLeft(202);
    obj.rectangle91:setTop(500);
    obj.rectangle91:setWidth(33);
    obj.rectangle91:setHeight(24);
    obj.rectangle91:setColor("black");
    obj.rectangle91:setStrokeColor("white");
    obj.rectangle91:setStrokeSize(1);
    obj.rectangle91:setName("rectangle91");

    obj.rectangle92 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle92:setParent(obj.layout2);
    obj.rectangle92:setLeft(267);
    obj.rectangle92:setTop(500);
    obj.rectangle92:setWidth(33);
    obj.rectangle92:setHeight(24);
    obj.rectangle92:setColor("black");
    obj.rectangle92:setStrokeColor("white");
    obj.rectangle92:setStrokeSize(1);
    obj.rectangle92:setName("rectangle92");

    obj.rectangle93 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle93:setParent(obj.layout2);
    obj.rectangle93:setLeft(202);
    obj.rectangle93:setTop(525);
    obj.rectangle93:setWidth(33);
    obj.rectangle93:setHeight(24);
    obj.rectangle93:setColor("black");
    obj.rectangle93:setStrokeColor("white");
    obj.rectangle93:setStrokeSize(1);
    obj.rectangle93:setName("rectangle93");

    obj.rectangle94 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle94:setParent(obj.layout2);
    obj.rectangle94:setLeft(267);
    obj.rectangle94:setTop(525);
    obj.rectangle94:setWidth(33);
    obj.rectangle94:setHeight(24);
    obj.rectangle94:setColor("black");
    obj.rectangle94:setStrokeColor("white");
    obj.rectangle94:setStrokeSize(1);
    obj.rectangle94:setName("rectangle94");

    obj.rectangle95 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle95:setParent(obj.layout2);
    obj.rectangle95:setLeft(202);
    obj.rectangle95:setTop(550);
    obj.rectangle95:setWidth(33);
    obj.rectangle95:setHeight(24);
    obj.rectangle95:setColor("black");
    obj.rectangle95:setStrokeColor("white");
    obj.rectangle95:setStrokeSize(1);
    obj.rectangle95:setName("rectangle95");

    obj.rectangle96 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle96:setParent(obj.layout2);
    obj.rectangle96:setLeft(267);
    obj.rectangle96:setTop(550);
    obj.rectangle96:setWidth(33);
    obj.rectangle96:setHeight(24);
    obj.rectangle96:setColor("black");
    obj.rectangle96:setStrokeColor("white");
    obj.rectangle96:setStrokeSize(1);
    obj.rectangle96:setName("rectangle96");

    obj.rectangle97 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle97:setParent(obj.layout2);
    obj.rectangle97:setLeft(202);
    obj.rectangle97:setTop(575);
    obj.rectangle97:setWidth(33);
    obj.rectangle97:setHeight(24);
    obj.rectangle97:setColor("black");
    obj.rectangle97:setStrokeColor("white");
    obj.rectangle97:setStrokeSize(1);
    obj.rectangle97:setName("rectangle97");

    obj.rectangle98 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle98:setParent(obj.layout2);
    obj.rectangle98:setLeft(267);
    obj.rectangle98:setTop(575);
    obj.rectangle98:setWidth(33);
    obj.rectangle98:setHeight(24);
    obj.rectangle98:setColor("black");
    obj.rectangle98:setStrokeColor("white");
    obj.rectangle98:setStrokeSize(1);
    obj.rectangle98:setName("rectangle98");

    obj.rectangle99 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle99:setParent(obj.layout2);
    obj.rectangle99:setLeft(202);
    obj.rectangle99:setTop(600);
    obj.rectangle99:setWidth(33);
    obj.rectangle99:setHeight(24);
    obj.rectangle99:setColor("black");
    obj.rectangle99:setStrokeColor("white");
    obj.rectangle99:setStrokeSize(1);
    obj.rectangle99:setName("rectangle99");

    obj.rectangle100 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle100:setParent(obj.layout2);
    obj.rectangle100:setLeft(267);
    obj.rectangle100:setTop(600);
    obj.rectangle100:setWidth(33);
    obj.rectangle100:setHeight(24);
    obj.rectangle100:setColor("black");
    obj.rectangle100:setStrokeColor("white");
    obj.rectangle100:setStrokeSize(1);
    obj.rectangle100:setName("rectangle100");

    obj.rectangle101 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle101:setParent(obj.layout2);
    obj.rectangle101:setLeft(202);
    obj.rectangle101:setTop(625);
    obj.rectangle101:setWidth(33);
    obj.rectangle101:setHeight(24);
    obj.rectangle101:setColor("black");
    obj.rectangle101:setStrokeColor("white");
    obj.rectangle101:setStrokeSize(1);
    obj.rectangle101:setName("rectangle101");

    obj.rectangle102 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle102:setParent(obj.layout2);
    obj.rectangle102:setLeft(267);
    obj.rectangle102:setTop(625);
    obj.rectangle102:setWidth(33);
    obj.rectangle102:setHeight(24);
    obj.rectangle102:setColor("black");
    obj.rectangle102:setStrokeColor("white");
    obj.rectangle102:setStrokeSize(1);
    obj.rectangle102:setName("rectangle102");

    obj.checkBox26 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox26:setParent(obj.layout2);
    obj.checkBox26:setLeft(3);
    obj.checkBox26:setTop(28);
    obj.checkBox26:setWidth(15);
    obj.checkBox26:setHeight(15);
    obj.checkBox26:setField("per26");
    obj.checkBox26:setName("checkBox26");

    obj.checkBox27 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox27:setParent(obj.layout2);
    obj.checkBox27:setLeft(3);
    obj.checkBox27:setTop(53);
    obj.checkBox27:setWidth(15);
    obj.checkBox27:setHeight(15);
    obj.checkBox27:setField("per27");
    obj.checkBox27:setName("checkBox27");

    obj.checkBox28 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox28:setParent(obj.layout2);
    obj.checkBox28:setLeft(3);
    obj.checkBox28:setTop(78);
    obj.checkBox28:setWidth(15);
    obj.checkBox28:setHeight(15);
    obj.checkBox28:setField("per28");
    obj.checkBox28:setName("checkBox28");

    obj.checkBox29 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox29:setParent(obj.layout2);
    obj.checkBox29:setLeft(3);
    obj.checkBox29:setTop(103);
    obj.checkBox29:setWidth(15);
    obj.checkBox29:setHeight(15);
    obj.checkBox29:setField("per29");
    obj.checkBox29:setName("checkBox29");

    obj.checkBox30 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox30:setParent(obj.layout2);
    obj.checkBox30:setLeft(3);
    obj.checkBox30:setTop(128);
    obj.checkBox30:setWidth(15);
    obj.checkBox30:setHeight(15);
    obj.checkBox30:setField("per30");
    obj.checkBox30:setName("checkBox30");

    obj.checkBox31 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox31:setParent(obj.layout2);
    obj.checkBox31:setLeft(3);
    obj.checkBox31:setTop(153);
    obj.checkBox31:setWidth(15);
    obj.checkBox31:setHeight(15);
    obj.checkBox31:setField("per31");
    obj.checkBox31:setName("checkBox31");

    obj.checkBox32 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox32:setParent(obj.layout2);
    obj.checkBox32:setLeft(3);
    obj.checkBox32:setTop(178);
    obj.checkBox32:setWidth(15);
    obj.checkBox32:setHeight(15);
    obj.checkBox32:setField("per32");
    obj.checkBox32:setName("checkBox32");

    obj.checkBox33 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox33:setParent(obj.layout2);
    obj.checkBox33:setLeft(3);
    obj.checkBox33:setTop(203);
    obj.checkBox33:setWidth(15);
    obj.checkBox33:setHeight(15);
    obj.checkBox33:setField("per33");
    obj.checkBox33:setName("checkBox33");

    obj.checkBox34 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox34:setParent(obj.layout2);
    obj.checkBox34:setLeft(3);
    obj.checkBox34:setTop(228);
    obj.checkBox34:setWidth(15);
    obj.checkBox34:setHeight(15);
    obj.checkBox34:setField("per34");
    obj.checkBox34:setName("checkBox34");

    obj.checkBox35 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox35:setParent(obj.layout2);
    obj.checkBox35:setLeft(3);
    obj.checkBox35:setTop(253);
    obj.checkBox35:setWidth(15);
    obj.checkBox35:setHeight(15);
    obj.checkBox35:setField("per35");
    obj.checkBox35:setName("checkBox35");

    obj.checkBox36 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox36:setParent(obj.layout2);
    obj.checkBox36:setLeft(3);
    obj.checkBox36:setTop(278);
    obj.checkBox36:setWidth(15);
    obj.checkBox36:setHeight(15);
    obj.checkBox36:setField("per36");
    obj.checkBox36:setName("checkBox36");

    obj.checkBox37 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox37:setParent(obj.layout2);
    obj.checkBox37:setLeft(3);
    obj.checkBox37:setTop(303);
    obj.checkBox37:setWidth(15);
    obj.checkBox37:setHeight(15);
    obj.checkBox37:setField("per37");
    obj.checkBox37:setName("checkBox37");

    obj.checkBox38 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox38:setParent(obj.layout2);
    obj.checkBox38:setLeft(3);
    obj.checkBox38:setTop(328);
    obj.checkBox38:setWidth(15);
    obj.checkBox38:setHeight(15);
    obj.checkBox38:setField("per38");
    obj.checkBox38:setName("checkBox38");

    obj.checkBox39 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox39:setParent(obj.layout2);
    obj.checkBox39:setLeft(3);
    obj.checkBox39:setTop(353);
    obj.checkBox39:setWidth(15);
    obj.checkBox39:setHeight(15);
    obj.checkBox39:setField("per39");
    obj.checkBox39:setName("checkBox39");

    obj.checkBox40 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox40:setParent(obj.layout2);
    obj.checkBox40:setLeft(3);
    obj.checkBox40:setTop(378);
    obj.checkBox40:setWidth(15);
    obj.checkBox40:setHeight(15);
    obj.checkBox40:setField("per40");
    obj.checkBox40:setName("checkBox40");

    obj.checkBox41 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox41:setParent(obj.layout2);
    obj.checkBox41:setLeft(3);
    obj.checkBox41:setTop(403);
    obj.checkBox41:setWidth(15);
    obj.checkBox41:setHeight(15);
    obj.checkBox41:setField("per41");
    obj.checkBox41:setName("checkBox41");

    obj.checkBox42 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox42:setParent(obj.layout2);
    obj.checkBox42:setLeft(3);
    obj.checkBox42:setTop(428);
    obj.checkBox42:setWidth(15);
    obj.checkBox42:setHeight(15);
    obj.checkBox42:setField("per42");
    obj.checkBox42:setName("checkBox42");

    obj.checkBox43 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox43:setParent(obj.layout2);
    obj.checkBox43:setLeft(3);
    obj.checkBox43:setTop(453);
    obj.checkBox43:setWidth(15);
    obj.checkBox43:setHeight(15);
    obj.checkBox43:setField("per43");
    obj.checkBox43:setName("checkBox43");

    obj.checkBox44 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox44:setParent(obj.layout2);
    obj.checkBox44:setLeft(3);
    obj.checkBox44:setTop(478);
    obj.checkBox44:setWidth(15);
    obj.checkBox44:setHeight(15);
    obj.checkBox44:setField("per44");
    obj.checkBox44:setName("checkBox44");

    obj.checkBox45 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox45:setParent(obj.layout2);
    obj.checkBox45:setLeft(3);
    obj.checkBox45:setTop(503);
    obj.checkBox45:setWidth(15);
    obj.checkBox45:setHeight(15);
    obj.checkBox45:setField("per45");
    obj.checkBox45:setName("checkBox45");

    obj.checkBox46 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox46:setParent(obj.layout2);
    obj.checkBox46:setLeft(3);
    obj.checkBox46:setTop(528);
    obj.checkBox46:setWidth(15);
    obj.checkBox46:setHeight(15);
    obj.checkBox46:setField("per46");
    obj.checkBox46:setName("checkBox46");

    obj.checkBox47 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox47:setParent(obj.layout2);
    obj.checkBox47:setLeft(3);
    obj.checkBox47:setTop(553);
    obj.checkBox47:setWidth(15);
    obj.checkBox47:setHeight(15);
    obj.checkBox47:setField("per47");
    obj.checkBox47:setName("checkBox47");

    obj.checkBox48 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox48:setParent(obj.layout2);
    obj.checkBox48:setLeft(3);
    obj.checkBox48:setTop(578);
    obj.checkBox48:setWidth(15);
    obj.checkBox48:setHeight(15);
    obj.checkBox48:setField("per48");
    obj.checkBox48:setName("checkBox48");

    obj.checkBox49 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox49:setParent(obj.layout2);
    obj.checkBox49:setLeft(3);
    obj.checkBox49:setTop(603);
    obj.checkBox49:setWidth(15);
    obj.checkBox49:setHeight(15);
    obj.checkBox49:setField("per49");
    obj.checkBox49:setName("checkBox49");

    obj.checkBox50 = gui.fromHandle(_obj_newObject("checkBox"));
    obj.checkBox50:setParent(obj.layout2);
    obj.checkBox50:setLeft(3);
    obj.checkBox50:setTop(628);
    obj.checkBox50:setWidth(15);
    obj.checkBox50:setHeight(15);
    obj.checkBox50:setField("per50");
    obj.checkBox50:setName("checkBox50");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout2);
    obj.edit176:setVertTextAlign("center");
    obj.edit176:setLeft(21);
    obj.edit176:setTop(25);
    obj.edit176:setWidth(138);
    obj.edit176:setHeight(25);
    obj.edit176:setField("pericia26");
    obj.edit176:setName("edit176");

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout2);
    obj.edit177:setVertTextAlign("center");
    obj.edit177:setLeft(21);
    obj.edit177:setTop(50);
    obj.edit177:setWidth(138);
    obj.edit177:setHeight(25);
    obj.edit177:setField("pericia27");
    obj.edit177:setName("edit177");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout2);
    obj.edit178:setVertTextAlign("center");
    obj.edit178:setLeft(21);
    obj.edit178:setTop(75);
    obj.edit178:setWidth(138);
    obj.edit178:setHeight(25);
    obj.edit178:setField("pericia28");
    obj.edit178:setName("edit178");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout2);
    obj.edit179:setVertTextAlign("center");
    obj.edit179:setLeft(21);
    obj.edit179:setTop(100);
    obj.edit179:setWidth(138);
    obj.edit179:setHeight(25);
    obj.edit179:setField("pericia29");
    obj.edit179:setName("edit179");

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout2);
    obj.edit180:setVertTextAlign("center");
    obj.edit180:setLeft(21);
    obj.edit180:setTop(125);
    obj.edit180:setWidth(138);
    obj.edit180:setHeight(25);
    obj.edit180:setField("pericia30");
    obj.edit180:setName("edit180");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout2);
    obj.edit181:setVertTextAlign("center");
    obj.edit181:setLeft(21);
    obj.edit181:setTop(150);
    obj.edit181:setWidth(138);
    obj.edit181:setHeight(25);
    obj.edit181:setField("pericia31");
    obj.edit181:setName("edit181");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout2);
    obj.edit182:setVertTextAlign("center");
    obj.edit182:setLeft(21);
    obj.edit182:setTop(175);
    obj.edit182:setWidth(138);
    obj.edit182:setHeight(25);
    obj.edit182:setField("pericia32");
    obj.edit182:setName("edit182");

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout2);
    obj.edit183:setVertTextAlign("center");
    obj.edit183:setLeft(21);
    obj.edit183:setTop(200);
    obj.edit183:setWidth(138);
    obj.edit183:setHeight(25);
    obj.edit183:setField("pericia33");
    obj.edit183:setName("edit183");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout2);
    obj.edit184:setVertTextAlign("center");
    obj.edit184:setLeft(21);
    obj.edit184:setTop(225);
    obj.edit184:setWidth(138);
    obj.edit184:setHeight(25);
    obj.edit184:setField("pericia34");
    obj.edit184:setName("edit184");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout2);
    obj.edit185:setVertTextAlign("center");
    obj.edit185:setLeft(21);
    obj.edit185:setTop(250);
    obj.edit185:setWidth(138);
    obj.edit185:setHeight(25);
    obj.edit185:setField("pericia35");
    obj.edit185:setName("edit185");

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout2);
    obj.edit186:setVertTextAlign("center");
    obj.edit186:setLeft(21);
    obj.edit186:setTop(275);
    obj.edit186:setWidth(138);
    obj.edit186:setHeight(25);
    obj.edit186:setField("pericia36");
    obj.edit186:setName("edit186");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout2);
    obj.edit187:setVertTextAlign("center");
    obj.edit187:setLeft(21);
    obj.edit187:setTop(300);
    obj.edit187:setWidth(138);
    obj.edit187:setHeight(25);
    obj.edit187:setField("pericia37");
    obj.edit187:setName("edit187");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout2);
    obj.edit188:setVertTextAlign("center");
    obj.edit188:setLeft(21);
    obj.edit188:setTop(325);
    obj.edit188:setWidth(138);
    obj.edit188:setHeight(25);
    obj.edit188:setField("pericia38");
    obj.edit188:setName("edit188");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout2);
    obj.edit189:setVertTextAlign("center");
    obj.edit189:setLeft(21);
    obj.edit189:setTop(350);
    obj.edit189:setWidth(138);
    obj.edit189:setHeight(25);
    obj.edit189:setField("pericia39");
    obj.edit189:setName("edit189");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout2);
    obj.edit190:setVertTextAlign("center");
    obj.edit190:setLeft(21);
    obj.edit190:setTop(375);
    obj.edit190:setWidth(138);
    obj.edit190:setHeight(25);
    obj.edit190:setField("pericia40");
    obj.edit190:setName("edit190");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout2);
    obj.edit191:setVertTextAlign("center");
    obj.edit191:setLeft(21);
    obj.edit191:setTop(400);
    obj.edit191:setWidth(138);
    obj.edit191:setHeight(25);
    obj.edit191:setField("pericia41");
    obj.edit191:setName("edit191");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout2);
    obj.edit192:setVertTextAlign("center");
    obj.edit192:setLeft(21);
    obj.edit192:setTop(425);
    obj.edit192:setWidth(138);
    obj.edit192:setHeight(25);
    obj.edit192:setField("pericia42");
    obj.edit192:setName("edit192");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout2);
    obj.edit193:setVertTextAlign("center");
    obj.edit193:setLeft(21);
    obj.edit193:setTop(450);
    obj.edit193:setWidth(138);
    obj.edit193:setHeight(25);
    obj.edit193:setField("pericia43");
    obj.edit193:setName("edit193");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout2);
    obj.edit194:setVertTextAlign("center");
    obj.edit194:setLeft(21);
    obj.edit194:setTop(475);
    obj.edit194:setWidth(138);
    obj.edit194:setHeight(25);
    obj.edit194:setField("pericia44");
    obj.edit194:setName("edit194");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout2);
    obj.edit195:setVertTextAlign("center");
    obj.edit195:setLeft(21);
    obj.edit195:setTop(500);
    obj.edit195:setWidth(138);
    obj.edit195:setHeight(25);
    obj.edit195:setField("pericia45");
    obj.edit195:setName("edit195");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout2);
    obj.edit196:setVertTextAlign("center");
    obj.edit196:setLeft(21);
    obj.edit196:setTop(525);
    obj.edit196:setWidth(138);
    obj.edit196:setHeight(25);
    obj.edit196:setField("pericia46");
    obj.edit196:setName("edit196");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout2);
    obj.edit197:setVertTextAlign("center");
    obj.edit197:setLeft(21);
    obj.edit197:setTop(550);
    obj.edit197:setWidth(138);
    obj.edit197:setHeight(25);
    obj.edit197:setField("pericia47");
    obj.edit197:setName("edit197");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout2);
    obj.edit198:setVertTextAlign("center");
    obj.edit198:setLeft(21);
    obj.edit198:setTop(575);
    obj.edit198:setWidth(138);
    obj.edit198:setHeight(25);
    obj.edit198:setField("pericia48");
    obj.edit198:setName("edit198");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout2);
    obj.edit199:setVertTextAlign("center");
    obj.edit199:setLeft(21);
    obj.edit199:setTop(600);
    obj.edit199:setWidth(138);
    obj.edit199:setHeight(25);
    obj.edit199:setField("pericia49");
    obj.edit199:setName("edit199");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout2);
    obj.edit200:setVertTextAlign("center");
    obj.edit200:setLeft(21);
    obj.edit200:setTop(625);
    obj.edit200:setWidth(138);
    obj.edit200:setHeight(25);
    obj.edit200:setField("pericia50");
    obj.edit200:setName("edit200");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout2);
    obj.edit201:setVertTextAlign("center");
    obj.edit201:setHorzTextAlign("center");
    obj.edit201:setLeft(161);
    obj.edit201:setTop(25);
    obj.edit201:setWidth(37);
    obj.edit201:setHeight(25);
    obj.edit201:setField("chave26");
    obj.edit201:setName("edit201");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout2);
    obj.edit202:setVertTextAlign("center");
    obj.edit202:setHorzTextAlign("center");
    obj.edit202:setLeft(161);
    obj.edit202:setTop(50);
    obj.edit202:setWidth(37);
    obj.edit202:setHeight(25);
    obj.edit202:setField("chave27");
    obj.edit202:setName("edit202");

    obj.edit203 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout2);
    obj.edit203:setVertTextAlign("center");
    obj.edit203:setHorzTextAlign("center");
    obj.edit203:setLeft(161);
    obj.edit203:setTop(75);
    obj.edit203:setWidth(37);
    obj.edit203:setHeight(25);
    obj.edit203:setField("chave28");
    obj.edit203:setName("edit203");

    obj.edit204 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout2);
    obj.edit204:setVertTextAlign("center");
    obj.edit204:setHorzTextAlign("center");
    obj.edit204:setLeft(161);
    obj.edit204:setTop(100);
    obj.edit204:setWidth(37);
    obj.edit204:setHeight(25);
    obj.edit204:setField("chave29");
    obj.edit204:setName("edit204");

    obj.edit205 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout2);
    obj.edit205:setVertTextAlign("center");
    obj.edit205:setHorzTextAlign("center");
    obj.edit205:setLeft(161);
    obj.edit205:setTop(125);
    obj.edit205:setWidth(37);
    obj.edit205:setHeight(25);
    obj.edit205:setField("chave30");
    obj.edit205:setName("edit205");

    obj.edit206 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout2);
    obj.edit206:setVertTextAlign("center");
    obj.edit206:setHorzTextAlign("center");
    obj.edit206:setLeft(161);
    obj.edit206:setTop(150);
    obj.edit206:setWidth(37);
    obj.edit206:setHeight(25);
    obj.edit206:setField("chave31");
    obj.edit206:setName("edit206");

    obj.edit207 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout2);
    obj.edit207:setVertTextAlign("center");
    obj.edit207:setHorzTextAlign("center");
    obj.edit207:setLeft(161);
    obj.edit207:setTop(175);
    obj.edit207:setWidth(37);
    obj.edit207:setHeight(25);
    obj.edit207:setField("chave32");
    obj.edit207:setName("edit207");

    obj.edit208 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout2);
    obj.edit208:setVertTextAlign("center");
    obj.edit208:setHorzTextAlign("center");
    obj.edit208:setLeft(161);
    obj.edit208:setTop(200);
    obj.edit208:setWidth(37);
    obj.edit208:setHeight(25);
    obj.edit208:setField("chave33");
    obj.edit208:setName("edit208");

    obj.edit209 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout2);
    obj.edit209:setVertTextAlign("center");
    obj.edit209:setHorzTextAlign("center");
    obj.edit209:setLeft(161);
    obj.edit209:setTop(225);
    obj.edit209:setWidth(37);
    obj.edit209:setHeight(25);
    obj.edit209:setField("chave34");
    obj.edit209:setName("edit209");

    obj.edit210 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout2);
    obj.edit210:setVertTextAlign("center");
    obj.edit210:setHorzTextAlign("center");
    obj.edit210:setLeft(161);
    obj.edit210:setTop(250);
    obj.edit210:setWidth(37);
    obj.edit210:setHeight(25);
    obj.edit210:setField("chave35");
    obj.edit210:setName("edit210");

    obj.edit211 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout2);
    obj.edit211:setVertTextAlign("center");
    obj.edit211:setHorzTextAlign("center");
    obj.edit211:setLeft(161);
    obj.edit211:setTop(275);
    obj.edit211:setWidth(37);
    obj.edit211:setHeight(25);
    obj.edit211:setField("chave36");
    obj.edit211:setName("edit211");

    obj.edit212 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout2);
    obj.edit212:setVertTextAlign("center");
    obj.edit212:setHorzTextAlign("center");
    obj.edit212:setLeft(161);
    obj.edit212:setTop(300);
    obj.edit212:setWidth(37);
    obj.edit212:setHeight(25);
    obj.edit212:setField("chave37");
    obj.edit212:setName("edit212");

    obj.edit213 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout2);
    obj.edit213:setVertTextAlign("center");
    obj.edit213:setHorzTextAlign("center");
    obj.edit213:setLeft(161);
    obj.edit213:setTop(325);
    obj.edit213:setWidth(37);
    obj.edit213:setHeight(25);
    obj.edit213:setField("chave38");
    obj.edit213:setName("edit213");

    obj.edit214 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout2);
    obj.edit214:setVertTextAlign("center");
    obj.edit214:setHorzTextAlign("center");
    obj.edit214:setLeft(161);
    obj.edit214:setTop(350);
    obj.edit214:setWidth(37);
    obj.edit214:setHeight(25);
    obj.edit214:setField("chave39");
    obj.edit214:setName("edit214");

    obj.edit215 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout2);
    obj.edit215:setVertTextAlign("center");
    obj.edit215:setHorzTextAlign("center");
    obj.edit215:setLeft(161);
    obj.edit215:setTop(375);
    obj.edit215:setWidth(37);
    obj.edit215:setHeight(25);
    obj.edit215:setField("chave40");
    obj.edit215:setName("edit215");

    obj.edit216 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout2);
    obj.edit216:setVertTextAlign("center");
    obj.edit216:setHorzTextAlign("center");
    obj.edit216:setLeft(161);
    obj.edit216:setTop(400);
    obj.edit216:setWidth(37);
    obj.edit216:setHeight(25);
    obj.edit216:setField("chave41");
    obj.edit216:setName("edit216");

    obj.edit217 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout2);
    obj.edit217:setVertTextAlign("center");
    obj.edit217:setHorzTextAlign("center");
    obj.edit217:setLeft(161);
    obj.edit217:setTop(425);
    obj.edit217:setWidth(37);
    obj.edit217:setHeight(25);
    obj.edit217:setField("chave42");
    obj.edit217:setName("edit217");

    obj.edit218 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout2);
    obj.edit218:setVertTextAlign("center");
    obj.edit218:setHorzTextAlign("center");
    obj.edit218:setLeft(161);
    obj.edit218:setTop(450);
    obj.edit218:setWidth(37);
    obj.edit218:setHeight(25);
    obj.edit218:setField("chave43");
    obj.edit218:setName("edit218");

    obj.edit219 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout2);
    obj.edit219:setVertTextAlign("center");
    obj.edit219:setHorzTextAlign("center");
    obj.edit219:setLeft(161);
    obj.edit219:setTop(475);
    obj.edit219:setWidth(37);
    obj.edit219:setHeight(25);
    obj.edit219:setField("chave44");
    obj.edit219:setName("edit219");

    obj.edit220 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout2);
    obj.edit220:setVertTextAlign("center");
    obj.edit220:setHorzTextAlign("center");
    obj.edit220:setLeft(161);
    obj.edit220:setTop(500);
    obj.edit220:setWidth(37);
    obj.edit220:setHeight(25);
    obj.edit220:setField("chave45");
    obj.edit220:setName("edit220");

    obj.edit221 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout2);
    obj.edit221:setVertTextAlign("center");
    obj.edit221:setHorzTextAlign("center");
    obj.edit221:setLeft(161);
    obj.edit221:setTop(525);
    obj.edit221:setWidth(37);
    obj.edit221:setHeight(25);
    obj.edit221:setField("chave46");
    obj.edit221:setName("edit221");

    obj.edit222 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout2);
    obj.edit222:setVertTextAlign("center");
    obj.edit222:setHorzTextAlign("center");
    obj.edit222:setLeft(161);
    obj.edit222:setTop(550);
    obj.edit222:setWidth(37);
    obj.edit222:setHeight(25);
    obj.edit222:setField("chave47");
    obj.edit222:setName("edit222");

    obj.edit223 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout2);
    obj.edit223:setVertTextAlign("center");
    obj.edit223:setHorzTextAlign("center");
    obj.edit223:setLeft(161);
    obj.edit223:setTop(575);
    obj.edit223:setWidth(37);
    obj.edit223:setHeight(25);
    obj.edit223:setField("chave48");
    obj.edit223:setName("edit223");

    obj.edit224 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout2);
    obj.edit224:setVertTextAlign("center");
    obj.edit224:setHorzTextAlign("center");
    obj.edit224:setLeft(161);
    obj.edit224:setTop(600);
    obj.edit224:setWidth(37);
    obj.edit224:setHeight(25);
    obj.edit224:setField("chave49");
    obj.edit224:setName("edit224");

    obj.edit225 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout2);
    obj.edit225:setVertTextAlign("center");
    obj.edit225:setHorzTextAlign("center");
    obj.edit225:setLeft(161);
    obj.edit225:setTop(625);
    obj.edit225:setWidth(37);
    obj.edit225:setHeight(25);
    obj.edit225:setField("chave50");
    obj.edit225:setName("edit225");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout2);
    obj.label60:setField("total26");
    obj.label60:setText("valor");
    obj.label60:setLeft(202);
    obj.label60:setTop(25);
    obj.label60:setWidth(35);
    obj.label60:setHeight(25);
    obj.label60:setHorzTextAlign("center");
    obj.label60:setName("label60");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout2);
    obj.label61:setField("total27");
    obj.label61:setText("valor");
    obj.label61:setLeft(202);
    obj.label61:setTop(50);
    obj.label61:setWidth(35);
    obj.label61:setHeight(25);
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout2);
    obj.label62:setField("total28");
    obj.label62:setText("valor");
    obj.label62:setLeft(202);
    obj.label62:setTop(75);
    obj.label62:setWidth(35);
    obj.label62:setHeight(25);
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout2);
    obj.label63:setField("total29");
    obj.label63:setText("valor");
    obj.label63:setLeft(202);
    obj.label63:setTop(100);
    obj.label63:setWidth(35);
    obj.label63:setHeight(25);
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout2);
    obj.label64:setField("total30");
    obj.label64:setText("valor");
    obj.label64:setLeft(202);
    obj.label64:setTop(125);
    obj.label64:setWidth(35);
    obj.label64:setHeight(25);
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout2);
    obj.label65:setField("total31");
    obj.label65:setText("valor");
    obj.label65:setLeft(202);
    obj.label65:setTop(150);
    obj.label65:setWidth(35);
    obj.label65:setHeight(25);
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout2);
    obj.label66:setField("total32");
    obj.label66:setText("valor");
    obj.label66:setLeft(202);
    obj.label66:setTop(175);
    obj.label66:setWidth(35);
    obj.label66:setHeight(25);
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout2);
    obj.label67:setField("total33");
    obj.label67:setText("valor");
    obj.label67:setLeft(202);
    obj.label67:setTop(200);
    obj.label67:setWidth(35);
    obj.label67:setHeight(25);
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout2);
    obj.label68:setField("total34");
    obj.label68:setText("valor");
    obj.label68:setLeft(202);
    obj.label68:setTop(225);
    obj.label68:setWidth(35);
    obj.label68:setHeight(25);
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout2);
    obj.label69:setField("total35");
    obj.label69:setText("valor");
    obj.label69:setLeft(202);
    obj.label69:setTop(250);
    obj.label69:setWidth(35);
    obj.label69:setHeight(25);
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout2);
    obj.label70:setField("total36");
    obj.label70:setText("valor");
    obj.label70:setLeft(202);
    obj.label70:setTop(275);
    obj.label70:setWidth(35);
    obj.label70:setHeight(25);
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout2);
    obj.label71:setField("total37");
    obj.label71:setText("valor");
    obj.label71:setLeft(202);
    obj.label71:setTop(300);
    obj.label71:setWidth(35);
    obj.label71:setHeight(25);
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout2);
    obj.label72:setField("total38");
    obj.label72:setText("valor");
    obj.label72:setLeft(202);
    obj.label72:setTop(325);
    obj.label72:setWidth(35);
    obj.label72:setHeight(25);
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout2);
    obj.label73:setField("total39");
    obj.label73:setText("valor");
    obj.label73:setLeft(202);
    obj.label73:setTop(350);
    obj.label73:setWidth(35);
    obj.label73:setHeight(25);
    obj.label73:setHorzTextAlign("center");
    obj.label73:setName("label73");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout2);
    obj.label74:setField("total40");
    obj.label74:setText("valor");
    obj.label74:setLeft(202);
    obj.label74:setTop(375);
    obj.label74:setWidth(35);
    obj.label74:setHeight(25);
    obj.label74:setHorzTextAlign("center");
    obj.label74:setName("label74");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout2);
    obj.label75:setField("total41");
    obj.label75:setText("valor");
    obj.label75:setLeft(202);
    obj.label75:setTop(400);
    obj.label75:setWidth(35);
    obj.label75:setHeight(25);
    obj.label75:setHorzTextAlign("center");
    obj.label75:setName("label75");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout2);
    obj.label76:setField("total42");
    obj.label76:setText("valor");
    obj.label76:setLeft(202);
    obj.label76:setTop(425);
    obj.label76:setWidth(35);
    obj.label76:setHeight(25);
    obj.label76:setHorzTextAlign("center");
    obj.label76:setName("label76");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout2);
    obj.label77:setField("total43");
    obj.label77:setText("valor");
    obj.label77:setLeft(202);
    obj.label77:setTop(450);
    obj.label77:setWidth(35);
    obj.label77:setHeight(25);
    obj.label77:setHorzTextAlign("center");
    obj.label77:setName("label77");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout2);
    obj.label78:setField("total44");
    obj.label78:setText("valor");
    obj.label78:setLeft(202);
    obj.label78:setTop(475);
    obj.label78:setWidth(35);
    obj.label78:setHeight(25);
    obj.label78:setHorzTextAlign("center");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout2);
    obj.label79:setField("total45");
    obj.label79:setText("valor");
    obj.label79:setLeft(202);
    obj.label79:setTop(500);
    obj.label79:setWidth(35);
    obj.label79:setHeight(25);
    obj.label79:setHorzTextAlign("center");
    obj.label79:setName("label79");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout2);
    obj.label80:setField("total46");
    obj.label80:setText("valor");
    obj.label80:setLeft(202);
    obj.label80:setTop(525);
    obj.label80:setWidth(35);
    obj.label80:setHeight(25);
    obj.label80:setHorzTextAlign("center");
    obj.label80:setName("label80");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout2);
    obj.label81:setField("total47");
    obj.label81:setText("valor");
    obj.label81:setLeft(202);
    obj.label81:setTop(550);
    obj.label81:setWidth(35);
    obj.label81:setHeight(25);
    obj.label81:setHorzTextAlign("center");
    obj.label81:setName("label81");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout2);
    obj.label82:setField("total48");
    obj.label82:setText("valor");
    obj.label82:setLeft(202);
    obj.label82:setTop(575);
    obj.label82:setWidth(35);
    obj.label82:setHeight(25);
    obj.label82:setHorzTextAlign("center");
    obj.label82:setName("label82");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout2);
    obj.label83:setField("total49");
    obj.label83:setText("valor");
    obj.label83:setLeft(202);
    obj.label83:setTop(600);
    obj.label83:setWidth(35);
    obj.label83:setHeight(25);
    obj.label83:setHorzTextAlign("center");
    obj.label83:setName("label83");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout2);
    obj.label84:setField("total50");
    obj.label84:setText("valor");
    obj.label84:setLeft(202);
    obj.label84:setTop(625);
    obj.label84:setWidth(35);
    obj.label84:setHeight(25);
    obj.label84:setHorzTextAlign("center");
    obj.label84:setName("label84");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout2);
    obj.label85:setField("atributo26");
    obj.label85:setText("valor");
    obj.label85:setLeft(270);
    obj.label85:setTop(27);
    obj.label85:setWidth(20);
    obj.label85:setHeight(20);
    obj.label85:setHorzTextAlign("center");
    obj.label85:setName("label85");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout2);
    obj.label86:setField("atributo27");
    obj.label86:setText("valor");
    obj.label86:setLeft(270);
    obj.label86:setTop(52);
    obj.label86:setWidth(20);
    obj.label86:setHeight(20);
    obj.label86:setHorzTextAlign("center");
    obj.label86:setName("label86");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout2);
    obj.label87:setField("atributo28");
    obj.label87:setText("valor");
    obj.label87:setLeft(270);
    obj.label87:setTop(77);
    obj.label87:setWidth(20);
    obj.label87:setHeight(20);
    obj.label87:setHorzTextAlign("center");
    obj.label87:setName("label87");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout2);
    obj.label88:setField("atributo29");
    obj.label88:setText("valor");
    obj.label88:setLeft(270);
    obj.label88:setTop(102);
    obj.label88:setWidth(20);
    obj.label88:setHeight(20);
    obj.label88:setHorzTextAlign("center");
    obj.label88:setName("label88");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout2);
    obj.label89:setField("atributo30");
    obj.label89:setText("valor");
    obj.label89:setLeft(270);
    obj.label89:setTop(127);
    obj.label89:setWidth(20);
    obj.label89:setHeight(20);
    obj.label89:setHorzTextAlign("center");
    obj.label89:setName("label89");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout2);
    obj.label90:setField("atributo31");
    obj.label90:setText("valor");
    obj.label90:setLeft(270);
    obj.label90:setTop(152);
    obj.label90:setWidth(20);
    obj.label90:setHeight(20);
    obj.label90:setHorzTextAlign("center");
    obj.label90:setName("label90");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout2);
    obj.label91:setField("atributo32");
    obj.label91:setText("valor");
    obj.label91:setLeft(270);
    obj.label91:setTop(177);
    obj.label91:setWidth(20);
    obj.label91:setHeight(20);
    obj.label91:setHorzTextAlign("center");
    obj.label91:setName("label91");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout2);
    obj.label92:setField("atributo33");
    obj.label92:setText("valor");
    obj.label92:setLeft(270);
    obj.label92:setTop(202);
    obj.label92:setWidth(20);
    obj.label92:setHeight(20);
    obj.label92:setHorzTextAlign("center");
    obj.label92:setName("label92");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout2);
    obj.label93:setField("atributo34");
    obj.label93:setText("valor");
    obj.label93:setLeft(270);
    obj.label93:setTop(227);
    obj.label93:setWidth(20);
    obj.label93:setHeight(20);
    obj.label93:setHorzTextAlign("center");
    obj.label93:setName("label93");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout2);
    obj.label94:setField("atributo35");
    obj.label94:setText("valor");
    obj.label94:setLeft(270);
    obj.label94:setTop(252);
    obj.label94:setWidth(20);
    obj.label94:setHeight(20);
    obj.label94:setHorzTextAlign("center");
    obj.label94:setName("label94");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout2);
    obj.label95:setField("atributo36");
    obj.label95:setText("valor");
    obj.label95:setLeft(270);
    obj.label95:setTop(277);
    obj.label95:setWidth(20);
    obj.label95:setHeight(20);
    obj.label95:setHorzTextAlign("center");
    obj.label95:setName("label95");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout2);
    obj.label96:setField("atributo37");
    obj.label96:setText("valor");
    obj.label96:setLeft(270);
    obj.label96:setTop(302);
    obj.label96:setWidth(20);
    obj.label96:setHeight(20);
    obj.label96:setHorzTextAlign("center");
    obj.label96:setName("label96");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout2);
    obj.label97:setField("atributo38");
    obj.label97:setText("valor");
    obj.label97:setLeft(270);
    obj.label97:setTop(327);
    obj.label97:setWidth(20);
    obj.label97:setHeight(20);
    obj.label97:setHorzTextAlign("center");
    obj.label97:setName("label97");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout2);
    obj.label98:setField("atributo39");
    obj.label98:setText("valor");
    obj.label98:setLeft(270);
    obj.label98:setTop(352);
    obj.label98:setWidth(20);
    obj.label98:setHeight(20);
    obj.label98:setHorzTextAlign("center");
    obj.label98:setName("label98");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout2);
    obj.label99:setField("atributo40");
    obj.label99:setText("valor");
    obj.label99:setLeft(270);
    obj.label99:setTop(377);
    obj.label99:setWidth(20);
    obj.label99:setHeight(20);
    obj.label99:setHorzTextAlign("center");
    obj.label99:setName("label99");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout2);
    obj.label100:setField("atributo41");
    obj.label100:setText("valor");
    obj.label100:setLeft(270);
    obj.label100:setTop(402);
    obj.label100:setWidth(20);
    obj.label100:setHeight(20);
    obj.label100:setHorzTextAlign("center");
    obj.label100:setName("label100");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout2);
    obj.label101:setField("atributo42");
    obj.label101:setText("valor");
    obj.label101:setLeft(270);
    obj.label101:setTop(427);
    obj.label101:setWidth(20);
    obj.label101:setHeight(20);
    obj.label101:setHorzTextAlign("center");
    obj.label101:setName("label101");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout2);
    obj.label102:setField("atributo43");
    obj.label102:setText("valor");
    obj.label102:setLeft(270);
    obj.label102:setTop(452);
    obj.label102:setWidth(20);
    obj.label102:setHeight(20);
    obj.label102:setHorzTextAlign("center");
    obj.label102:setName("label102");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout2);
    obj.label103:setField("atributo44");
    obj.label103:setText("valor");
    obj.label103:setLeft(270);
    obj.label103:setTop(477);
    obj.label103:setWidth(20);
    obj.label103:setHeight(20);
    obj.label103:setHorzTextAlign("center");
    obj.label103:setName("label103");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout2);
    obj.label104:setField("atributo45");
    obj.label104:setText("valor");
    obj.label104:setLeft(270);
    obj.label104:setTop(502);
    obj.label104:setWidth(20);
    obj.label104:setHeight(20);
    obj.label104:setHorzTextAlign("center");
    obj.label104:setName("label104");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout2);
    obj.label105:setField("atributo46");
    obj.label105:setText("valor");
    obj.label105:setLeft(270);
    obj.label105:setTop(527);
    obj.label105:setWidth(20);
    obj.label105:setHeight(20);
    obj.label105:setHorzTextAlign("center");
    obj.label105:setName("label105");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout2);
    obj.label106:setField("atributo47");
    obj.label106:setText("valor");
    obj.label106:setLeft(270);
    obj.label106:setTop(552);
    obj.label106:setWidth(20);
    obj.label106:setHeight(20);
    obj.label106:setHorzTextAlign("center");
    obj.label106:setName("label106");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout2);
    obj.label107:setField("atributo48");
    obj.label107:setText("valor");
    obj.label107:setLeft(270);
    obj.label107:setTop(577);
    obj.label107:setWidth(20);
    obj.label107:setHeight(20);
    obj.label107:setHorzTextAlign("center");
    obj.label107:setName("label107");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout2);
    obj.label108:setField("atributo49");
    obj.label108:setText("valor");
    obj.label108:setLeft(270);
    obj.label108:setTop(602);
    obj.label108:setWidth(20);
    obj.label108:setHeight(20);
    obj.label108:setHorzTextAlign("center");
    obj.label108:setName("label108");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout2);
    obj.label109:setField("atributo50");
    obj.label109:setText("valor");
    obj.label109:setLeft(270);
    obj.label109:setTop(627);
    obj.label109:setWidth(20);
    obj.label109:setHeight(20);
    obj.label109:setHorzTextAlign("center");
    obj.label109:setName("label109");

    obj.edit226 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout2);
    obj.edit226:setVertTextAlign("center");
    obj.edit226:setHorzTextAlign("center");
    obj.edit226:setLeft(300);
    obj.edit226:setTop(25);
    obj.edit226:setWidth(30);
    obj.edit226:setHeight(25);
    obj.edit226:setField("graduacao26");
    obj.edit226:setName("edit226");

    obj.edit227 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout2);
    obj.edit227:setVertTextAlign("center");
    obj.edit227:setHorzTextAlign("center");
    obj.edit227:setLeft(300);
    obj.edit227:setTop(50);
    obj.edit227:setWidth(30);
    obj.edit227:setHeight(25);
    obj.edit227:setField("graduacao27");
    obj.edit227:setName("edit227");

    obj.edit228 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout2);
    obj.edit228:setVertTextAlign("center");
    obj.edit228:setHorzTextAlign("center");
    obj.edit228:setLeft(300);
    obj.edit228:setTop(75);
    obj.edit228:setWidth(30);
    obj.edit228:setHeight(25);
    obj.edit228:setField("graduacao28");
    obj.edit228:setName("edit228");

    obj.edit229 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout2);
    obj.edit229:setVertTextAlign("center");
    obj.edit229:setHorzTextAlign("center");
    obj.edit229:setLeft(300);
    obj.edit229:setTop(100);
    obj.edit229:setWidth(30);
    obj.edit229:setHeight(25);
    obj.edit229:setField("graduacao29");
    obj.edit229:setName("edit229");

    obj.edit230 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout2);
    obj.edit230:setVertTextAlign("center");
    obj.edit230:setHorzTextAlign("center");
    obj.edit230:setLeft(300);
    obj.edit230:setTop(125);
    obj.edit230:setWidth(30);
    obj.edit230:setHeight(25);
    obj.edit230:setField("graduacao30");
    obj.edit230:setName("edit230");

    obj.edit231 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout2);
    obj.edit231:setVertTextAlign("center");
    obj.edit231:setHorzTextAlign("center");
    obj.edit231:setLeft(300);
    obj.edit231:setTop(150);
    obj.edit231:setWidth(30);
    obj.edit231:setHeight(25);
    obj.edit231:setField("graduacao31");
    obj.edit231:setName("edit231");

    obj.edit232 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout2);
    obj.edit232:setVertTextAlign("center");
    obj.edit232:setHorzTextAlign("center");
    obj.edit232:setLeft(300);
    obj.edit232:setTop(175);
    obj.edit232:setWidth(30);
    obj.edit232:setHeight(25);
    obj.edit232:setField("graduacao32");
    obj.edit232:setName("edit232");

    obj.edit233 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout2);
    obj.edit233:setVertTextAlign("center");
    obj.edit233:setHorzTextAlign("center");
    obj.edit233:setLeft(300);
    obj.edit233:setTop(200);
    obj.edit233:setWidth(30);
    obj.edit233:setHeight(25);
    obj.edit233:setField("graduacao33");
    obj.edit233:setName("edit233");

    obj.edit234 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout2);
    obj.edit234:setVertTextAlign("center");
    obj.edit234:setHorzTextAlign("center");
    obj.edit234:setLeft(300);
    obj.edit234:setTop(225);
    obj.edit234:setWidth(30);
    obj.edit234:setHeight(25);
    obj.edit234:setField("graduacao34");
    obj.edit234:setName("edit234");

    obj.edit235 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout2);
    obj.edit235:setVertTextAlign("center");
    obj.edit235:setHorzTextAlign("center");
    obj.edit235:setLeft(300);
    obj.edit235:setTop(250);
    obj.edit235:setWidth(30);
    obj.edit235:setHeight(25);
    obj.edit235:setField("graduacao35");
    obj.edit235:setName("edit235");

    obj.edit236 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout2);
    obj.edit236:setVertTextAlign("center");
    obj.edit236:setHorzTextAlign("center");
    obj.edit236:setLeft(300);
    obj.edit236:setTop(275);
    obj.edit236:setWidth(30);
    obj.edit236:setHeight(25);
    obj.edit236:setField("graduacao36");
    obj.edit236:setName("edit236");

    obj.edit237 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout2);
    obj.edit237:setVertTextAlign("center");
    obj.edit237:setHorzTextAlign("center");
    obj.edit237:setLeft(300);
    obj.edit237:setTop(300);
    obj.edit237:setWidth(30);
    obj.edit237:setHeight(25);
    obj.edit237:setField("graduacao37");
    obj.edit237:setName("edit237");

    obj.edit238 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout2);
    obj.edit238:setVertTextAlign("center");
    obj.edit238:setHorzTextAlign("center");
    obj.edit238:setLeft(300);
    obj.edit238:setTop(325);
    obj.edit238:setWidth(30);
    obj.edit238:setHeight(25);
    obj.edit238:setField("graduacao38");
    obj.edit238:setName("edit238");

    obj.edit239 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout2);
    obj.edit239:setVertTextAlign("center");
    obj.edit239:setHorzTextAlign("center");
    obj.edit239:setLeft(300);
    obj.edit239:setTop(350);
    obj.edit239:setWidth(30);
    obj.edit239:setHeight(25);
    obj.edit239:setField("graduacao39");
    obj.edit239:setName("edit239");

    obj.edit240 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout2);
    obj.edit240:setVertTextAlign("center");
    obj.edit240:setHorzTextAlign("center");
    obj.edit240:setLeft(300);
    obj.edit240:setTop(375);
    obj.edit240:setWidth(30);
    obj.edit240:setHeight(25);
    obj.edit240:setField("graduacao40");
    obj.edit240:setName("edit240");

    obj.edit241 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout2);
    obj.edit241:setVertTextAlign("center");
    obj.edit241:setHorzTextAlign("center");
    obj.edit241:setLeft(300);
    obj.edit241:setTop(400);
    obj.edit241:setWidth(30);
    obj.edit241:setHeight(25);
    obj.edit241:setField("graduacao41");
    obj.edit241:setName("edit241");

    obj.edit242 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout2);
    obj.edit242:setVertTextAlign("center");
    obj.edit242:setHorzTextAlign("center");
    obj.edit242:setLeft(300);
    obj.edit242:setTop(425);
    obj.edit242:setWidth(30);
    obj.edit242:setHeight(25);
    obj.edit242:setField("graduacao42");
    obj.edit242:setName("edit242");

    obj.edit243 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit243:setParent(obj.layout2);
    obj.edit243:setVertTextAlign("center");
    obj.edit243:setHorzTextAlign("center");
    obj.edit243:setLeft(300);
    obj.edit243:setTop(450);
    obj.edit243:setWidth(30);
    obj.edit243:setHeight(25);
    obj.edit243:setField("graduacao43");
    obj.edit243:setName("edit243");

    obj.edit244 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit244:setParent(obj.layout2);
    obj.edit244:setVertTextAlign("center");
    obj.edit244:setHorzTextAlign("center");
    obj.edit244:setLeft(300);
    obj.edit244:setTop(475);
    obj.edit244:setWidth(30);
    obj.edit244:setHeight(25);
    obj.edit244:setField("graduacao44");
    obj.edit244:setName("edit244");

    obj.edit245 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit245:setParent(obj.layout2);
    obj.edit245:setVertTextAlign("center");
    obj.edit245:setHorzTextAlign("center");
    obj.edit245:setLeft(300);
    obj.edit245:setTop(500);
    obj.edit245:setWidth(30);
    obj.edit245:setHeight(25);
    obj.edit245:setField("graduacao45");
    obj.edit245:setName("edit245");

    obj.edit246 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit246:setParent(obj.layout2);
    obj.edit246:setVertTextAlign("center");
    obj.edit246:setHorzTextAlign("center");
    obj.edit246:setLeft(300);
    obj.edit246:setTop(525);
    obj.edit246:setWidth(30);
    obj.edit246:setHeight(25);
    obj.edit246:setField("graduacao46");
    obj.edit246:setName("edit246");

    obj.edit247 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit247:setParent(obj.layout2);
    obj.edit247:setVertTextAlign("center");
    obj.edit247:setHorzTextAlign("center");
    obj.edit247:setLeft(300);
    obj.edit247:setTop(550);
    obj.edit247:setWidth(30);
    obj.edit247:setHeight(25);
    obj.edit247:setField("graduacao47");
    obj.edit247:setName("edit247");

    obj.edit248 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit248:setParent(obj.layout2);
    obj.edit248:setVertTextAlign("center");
    obj.edit248:setHorzTextAlign("center");
    obj.edit248:setLeft(300);
    obj.edit248:setTop(575);
    obj.edit248:setWidth(30);
    obj.edit248:setHeight(25);
    obj.edit248:setField("graduacao48");
    obj.edit248:setName("edit248");

    obj.edit249 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit249:setParent(obj.layout2);
    obj.edit249:setVertTextAlign("center");
    obj.edit249:setHorzTextAlign("center");
    obj.edit249:setLeft(300);
    obj.edit249:setTop(600);
    obj.edit249:setWidth(30);
    obj.edit249:setHeight(25);
    obj.edit249:setField("graduacao49");
    obj.edit249:setName("edit249");

    obj.edit250 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit250:setParent(obj.layout2);
    obj.edit250:setVertTextAlign("center");
    obj.edit250:setHorzTextAlign("center");
    obj.edit250:setLeft(300);
    obj.edit250:setTop(625);
    obj.edit250:setWidth(30);
    obj.edit250:setHeight(25);
    obj.edit250:setField("graduacao50");
    obj.edit250:setName("edit250");

    obj.edit251 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit251:setParent(obj.layout2);
    obj.edit251:setType("number");
    obj.edit251:setVertTextAlign("center");
    obj.edit251:setHorzTextAlign("center");
    obj.edit251:setLeft(333);
    obj.edit251:setTop(25);
    obj.edit251:setWidth(33);
    obj.edit251:setHeight(25);
    obj.edit251:setField("outros26");
    obj.edit251:setName("edit251");

    obj.edit252 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit252:setParent(obj.layout2);
    obj.edit252:setType("number");
    obj.edit252:setVertTextAlign("center");
    obj.edit252:setHorzTextAlign("center");
    obj.edit252:setLeft(333);
    obj.edit252:setTop(50);
    obj.edit252:setWidth(33);
    obj.edit252:setHeight(25);
    obj.edit252:setField("outros27");
    obj.edit252:setName("edit252");

    obj.edit253 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit253:setParent(obj.layout2);
    obj.edit253:setType("number");
    obj.edit253:setVertTextAlign("center");
    obj.edit253:setHorzTextAlign("center");
    obj.edit253:setLeft(333);
    obj.edit253:setTop(75);
    obj.edit253:setWidth(33);
    obj.edit253:setHeight(25);
    obj.edit253:setField("outros28");
    obj.edit253:setName("edit253");

    obj.edit254 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit254:setParent(obj.layout2);
    obj.edit254:setType("number");
    obj.edit254:setVertTextAlign("center");
    obj.edit254:setHorzTextAlign("center");
    obj.edit254:setLeft(333);
    obj.edit254:setTop(100);
    obj.edit254:setWidth(33);
    obj.edit254:setHeight(25);
    obj.edit254:setField("outros29");
    obj.edit254:setName("edit254");

    obj.edit255 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit255:setParent(obj.layout2);
    obj.edit255:setType("number");
    obj.edit255:setVertTextAlign("center");
    obj.edit255:setHorzTextAlign("center");
    obj.edit255:setLeft(333);
    obj.edit255:setTop(125);
    obj.edit255:setWidth(33);
    obj.edit255:setHeight(25);
    obj.edit255:setField("outros30");
    obj.edit255:setName("edit255");

    obj.edit256 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit256:setParent(obj.layout2);
    obj.edit256:setType("number");
    obj.edit256:setVertTextAlign("center");
    obj.edit256:setHorzTextAlign("center");
    obj.edit256:setLeft(333);
    obj.edit256:setTop(150);
    obj.edit256:setWidth(33);
    obj.edit256:setHeight(25);
    obj.edit256:setField("outros31");
    obj.edit256:setName("edit256");

    obj.edit257 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit257:setParent(obj.layout2);
    obj.edit257:setType("number");
    obj.edit257:setVertTextAlign("center");
    obj.edit257:setHorzTextAlign("center");
    obj.edit257:setLeft(333);
    obj.edit257:setTop(175);
    obj.edit257:setWidth(33);
    obj.edit257:setHeight(25);
    obj.edit257:setField("outros32");
    obj.edit257:setName("edit257");

    obj.edit258 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit258:setParent(obj.layout2);
    obj.edit258:setType("number");
    obj.edit258:setVertTextAlign("center");
    obj.edit258:setHorzTextAlign("center");
    obj.edit258:setLeft(333);
    obj.edit258:setTop(200);
    obj.edit258:setWidth(33);
    obj.edit258:setHeight(25);
    obj.edit258:setField("outros33");
    obj.edit258:setName("edit258");

    obj.edit259 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit259:setParent(obj.layout2);
    obj.edit259:setType("number");
    obj.edit259:setVertTextAlign("center");
    obj.edit259:setHorzTextAlign("center");
    obj.edit259:setLeft(333);
    obj.edit259:setTop(225);
    obj.edit259:setWidth(33);
    obj.edit259:setHeight(25);
    obj.edit259:setField("outros34");
    obj.edit259:setName("edit259");

    obj.edit260 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit260:setParent(obj.layout2);
    obj.edit260:setType("number");
    obj.edit260:setVertTextAlign("center");
    obj.edit260:setHorzTextAlign("center");
    obj.edit260:setLeft(333);
    obj.edit260:setTop(250);
    obj.edit260:setWidth(33);
    obj.edit260:setHeight(25);
    obj.edit260:setField("outros35");
    obj.edit260:setName("edit260");

    obj.edit261 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit261:setParent(obj.layout2);
    obj.edit261:setType("number");
    obj.edit261:setVertTextAlign("center");
    obj.edit261:setHorzTextAlign("center");
    obj.edit261:setLeft(333);
    obj.edit261:setTop(275);
    obj.edit261:setWidth(33);
    obj.edit261:setHeight(25);
    obj.edit261:setField("outros36");
    obj.edit261:setName("edit261");

    obj.edit262 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit262:setParent(obj.layout2);
    obj.edit262:setType("number");
    obj.edit262:setVertTextAlign("center");
    obj.edit262:setHorzTextAlign("center");
    obj.edit262:setLeft(333);
    obj.edit262:setTop(300);
    obj.edit262:setWidth(33);
    obj.edit262:setHeight(25);
    obj.edit262:setField("outros37");
    obj.edit262:setName("edit262");

    obj.edit263 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit263:setParent(obj.layout2);
    obj.edit263:setType("number");
    obj.edit263:setVertTextAlign("center");
    obj.edit263:setHorzTextAlign("center");
    obj.edit263:setLeft(333);
    obj.edit263:setTop(325);
    obj.edit263:setWidth(33);
    obj.edit263:setHeight(25);
    obj.edit263:setField("outros38");
    obj.edit263:setName("edit263");

    obj.edit264 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit264:setParent(obj.layout2);
    obj.edit264:setType("number");
    obj.edit264:setVertTextAlign("center");
    obj.edit264:setHorzTextAlign("center");
    obj.edit264:setLeft(333);
    obj.edit264:setTop(350);
    obj.edit264:setWidth(33);
    obj.edit264:setHeight(25);
    obj.edit264:setField("outros39");
    obj.edit264:setName("edit264");

    obj.edit265 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit265:setParent(obj.layout2);
    obj.edit265:setType("number");
    obj.edit265:setVertTextAlign("center");
    obj.edit265:setHorzTextAlign("center");
    obj.edit265:setLeft(333);
    obj.edit265:setTop(375);
    obj.edit265:setWidth(33);
    obj.edit265:setHeight(25);
    obj.edit265:setField("outros40");
    obj.edit265:setName("edit265");

    obj.edit266 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit266:setParent(obj.layout2);
    obj.edit266:setType("number");
    obj.edit266:setVertTextAlign("center");
    obj.edit266:setHorzTextAlign("center");
    obj.edit266:setLeft(333);
    obj.edit266:setTop(400);
    obj.edit266:setWidth(33);
    obj.edit266:setHeight(25);
    obj.edit266:setField("outros41");
    obj.edit266:setName("edit266");

    obj.edit267 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit267:setParent(obj.layout2);
    obj.edit267:setType("number");
    obj.edit267:setVertTextAlign("center");
    obj.edit267:setHorzTextAlign("center");
    obj.edit267:setLeft(333);
    obj.edit267:setTop(425);
    obj.edit267:setWidth(33);
    obj.edit267:setHeight(25);
    obj.edit267:setField("outros42");
    obj.edit267:setName("edit267");

    obj.edit268 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit268:setParent(obj.layout2);
    obj.edit268:setType("number");
    obj.edit268:setVertTextAlign("center");
    obj.edit268:setHorzTextAlign("center");
    obj.edit268:setLeft(333);
    obj.edit268:setTop(450);
    obj.edit268:setWidth(33);
    obj.edit268:setHeight(25);
    obj.edit268:setField("outros43");
    obj.edit268:setName("edit268");

    obj.edit269 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit269:setParent(obj.layout2);
    obj.edit269:setType("number");
    obj.edit269:setVertTextAlign("center");
    obj.edit269:setHorzTextAlign("center");
    obj.edit269:setLeft(333);
    obj.edit269:setTop(475);
    obj.edit269:setWidth(33);
    obj.edit269:setHeight(25);
    obj.edit269:setField("outros44");
    obj.edit269:setName("edit269");

    obj.edit270 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit270:setParent(obj.layout2);
    obj.edit270:setType("number");
    obj.edit270:setVertTextAlign("center");
    obj.edit270:setHorzTextAlign("center");
    obj.edit270:setLeft(333);
    obj.edit270:setTop(500);
    obj.edit270:setWidth(33);
    obj.edit270:setHeight(25);
    obj.edit270:setField("outros45");
    obj.edit270:setName("edit270");

    obj.edit271 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit271:setParent(obj.layout2);
    obj.edit271:setType("number");
    obj.edit271:setVertTextAlign("center");
    obj.edit271:setHorzTextAlign("center");
    obj.edit271:setLeft(333);
    obj.edit271:setTop(525);
    obj.edit271:setWidth(33);
    obj.edit271:setHeight(25);
    obj.edit271:setField("outros46");
    obj.edit271:setName("edit271");

    obj.edit272 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit272:setParent(obj.layout2);
    obj.edit272:setType("number");
    obj.edit272:setVertTextAlign("center");
    obj.edit272:setHorzTextAlign("center");
    obj.edit272:setLeft(333);
    obj.edit272:setTop(550);
    obj.edit272:setWidth(33);
    obj.edit272:setHeight(25);
    obj.edit272:setField("outros47");
    obj.edit272:setName("edit272");

    obj.edit273 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit273:setParent(obj.layout2);
    obj.edit273:setType("number");
    obj.edit273:setVertTextAlign("center");
    obj.edit273:setHorzTextAlign("center");
    obj.edit273:setLeft(333);
    obj.edit273:setTop(575);
    obj.edit273:setWidth(33);
    obj.edit273:setHeight(25);
    obj.edit273:setField("outros48");
    obj.edit273:setName("edit273");

    obj.edit274 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit274:setParent(obj.layout2);
    obj.edit274:setType("number");
    obj.edit274:setVertTextAlign("center");
    obj.edit274:setHorzTextAlign("center");
    obj.edit274:setLeft(333);
    obj.edit274:setTop(600);
    obj.edit274:setWidth(33);
    obj.edit274:setHeight(25);
    obj.edit274:setField("outros49");
    obj.edit274:setName("edit274");

    obj.edit275 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit275:setParent(obj.layout2);
    obj.edit275:setType("number");
    obj.edit275:setVertTextAlign("center");
    obj.edit275:setHorzTextAlign("center");
    obj.edit275:setLeft(333);
    obj.edit275:setTop(625);
    obj.edit275:setWidth(33);
    obj.edit275:setHeight(25);
    obj.edit275:setField("outros50");
    obj.edit275:setName("edit275");

    obj.edit276 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit276:setParent(obj.layout2);
    obj.edit276:setType("number");
    obj.edit276:setVertTextAlign("center");
    obj.edit276:setHorzTextAlign("center");
    obj.edit276:setLeft(367);
    obj.edit276:setTop(25);
    obj.edit276:setWidth(33);
    obj.edit276:setHeight(25);
    obj.edit276:setField("penalidade26");
    obj.edit276:setName("edit276");

    obj.edit277 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit277:setParent(obj.layout2);
    obj.edit277:setType("number");
    obj.edit277:setVertTextAlign("center");
    obj.edit277:setHorzTextAlign("center");
    obj.edit277:setLeft(367);
    obj.edit277:setTop(50);
    obj.edit277:setWidth(33);
    obj.edit277:setHeight(25);
    obj.edit277:setField("penalidade27");
    obj.edit277:setName("edit277");

    obj.edit278 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit278:setParent(obj.layout2);
    obj.edit278:setType("number");
    obj.edit278:setVertTextAlign("center");
    obj.edit278:setHorzTextAlign("center");
    obj.edit278:setLeft(367);
    obj.edit278:setTop(75);
    obj.edit278:setWidth(33);
    obj.edit278:setHeight(25);
    obj.edit278:setField("penalidade28");
    obj.edit278:setName("edit278");

    obj.edit279 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit279:setParent(obj.layout2);
    obj.edit279:setType("number");
    obj.edit279:setVertTextAlign("center");
    obj.edit279:setHorzTextAlign("center");
    obj.edit279:setLeft(367);
    obj.edit279:setTop(100);
    obj.edit279:setWidth(33);
    obj.edit279:setHeight(25);
    obj.edit279:setField("penalidade29");
    obj.edit279:setName("edit279");

    obj.edit280 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit280:setParent(obj.layout2);
    obj.edit280:setType("number");
    obj.edit280:setVertTextAlign("center");
    obj.edit280:setHorzTextAlign("center");
    obj.edit280:setLeft(367);
    obj.edit280:setTop(125);
    obj.edit280:setWidth(33);
    obj.edit280:setHeight(25);
    obj.edit280:setField("penalidade30");
    obj.edit280:setName("edit280");

    obj.edit281 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit281:setParent(obj.layout2);
    obj.edit281:setType("number");
    obj.edit281:setVertTextAlign("center");
    obj.edit281:setHorzTextAlign("center");
    obj.edit281:setLeft(367);
    obj.edit281:setTop(150);
    obj.edit281:setWidth(33);
    obj.edit281:setHeight(25);
    obj.edit281:setField("penalidade31");
    obj.edit281:setName("edit281");

    obj.edit282 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit282:setParent(obj.layout2);
    obj.edit282:setType("number");
    obj.edit282:setVertTextAlign("center");
    obj.edit282:setHorzTextAlign("center");
    obj.edit282:setLeft(367);
    obj.edit282:setTop(175);
    obj.edit282:setWidth(33);
    obj.edit282:setHeight(25);
    obj.edit282:setField("penalidade32");
    obj.edit282:setName("edit282");

    obj.edit283 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit283:setParent(obj.layout2);
    obj.edit283:setType("number");
    obj.edit283:setVertTextAlign("center");
    obj.edit283:setHorzTextAlign("center");
    obj.edit283:setLeft(367);
    obj.edit283:setTop(200);
    obj.edit283:setWidth(33);
    obj.edit283:setHeight(25);
    obj.edit283:setField("penalidade33");
    obj.edit283:setName("edit283");

    obj.edit284 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit284:setParent(obj.layout2);
    obj.edit284:setType("number");
    obj.edit284:setVertTextAlign("center");
    obj.edit284:setHorzTextAlign("center");
    obj.edit284:setLeft(367);
    obj.edit284:setTop(225);
    obj.edit284:setWidth(33);
    obj.edit284:setHeight(25);
    obj.edit284:setField("penalidade34");
    obj.edit284:setName("edit284");

    obj.edit285 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit285:setParent(obj.layout2);
    obj.edit285:setType("number");
    obj.edit285:setVertTextAlign("center");
    obj.edit285:setHorzTextAlign("center");
    obj.edit285:setLeft(367);
    obj.edit285:setTop(250);
    obj.edit285:setWidth(33);
    obj.edit285:setHeight(25);
    obj.edit285:setField("penalidade35");
    obj.edit285:setName("edit285");

    obj.edit286 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit286:setParent(obj.layout2);
    obj.edit286:setType("number");
    obj.edit286:setVertTextAlign("center");
    obj.edit286:setHorzTextAlign("center");
    obj.edit286:setLeft(367);
    obj.edit286:setTop(275);
    obj.edit286:setWidth(33);
    obj.edit286:setHeight(25);
    obj.edit286:setField("penalidade36");
    obj.edit286:setName("edit286");

    obj.edit287 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit287:setParent(obj.layout2);
    obj.edit287:setType("number");
    obj.edit287:setVertTextAlign("center");
    obj.edit287:setHorzTextAlign("center");
    obj.edit287:setLeft(367);
    obj.edit287:setTop(300);
    obj.edit287:setWidth(33);
    obj.edit287:setHeight(25);
    obj.edit287:setField("penalidade37");
    obj.edit287:setName("edit287");

    obj.edit288 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit288:setParent(obj.layout2);
    obj.edit288:setType("number");
    obj.edit288:setVertTextAlign("center");
    obj.edit288:setHorzTextAlign("center");
    obj.edit288:setLeft(367);
    obj.edit288:setTop(325);
    obj.edit288:setWidth(33);
    obj.edit288:setHeight(25);
    obj.edit288:setField("penalidade38");
    obj.edit288:setName("edit288");

    obj.edit289 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit289:setParent(obj.layout2);
    obj.edit289:setType("number");
    obj.edit289:setVertTextAlign("center");
    obj.edit289:setHorzTextAlign("center");
    obj.edit289:setLeft(367);
    obj.edit289:setTop(350);
    obj.edit289:setWidth(33);
    obj.edit289:setHeight(25);
    obj.edit289:setField("penalidade39");
    obj.edit289:setName("edit289");

    obj.edit290 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit290:setParent(obj.layout2);
    obj.edit290:setType("number");
    obj.edit290:setVertTextAlign("center");
    obj.edit290:setHorzTextAlign("center");
    obj.edit290:setLeft(367);
    obj.edit290:setTop(375);
    obj.edit290:setWidth(33);
    obj.edit290:setHeight(25);
    obj.edit290:setField("penalidade40");
    obj.edit290:setName("edit290");

    obj.edit291 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit291:setParent(obj.layout2);
    obj.edit291:setType("number");
    obj.edit291:setVertTextAlign("center");
    obj.edit291:setHorzTextAlign("center");
    obj.edit291:setLeft(367);
    obj.edit291:setTop(400);
    obj.edit291:setWidth(33);
    obj.edit291:setHeight(25);
    obj.edit291:setField("penalidade41");
    obj.edit291:setName("edit291");

    obj.edit292 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit292:setParent(obj.layout2);
    obj.edit292:setType("number");
    obj.edit292:setVertTextAlign("center");
    obj.edit292:setHorzTextAlign("center");
    obj.edit292:setLeft(367);
    obj.edit292:setTop(425);
    obj.edit292:setWidth(33);
    obj.edit292:setHeight(25);
    obj.edit292:setField("penalidade42");
    obj.edit292:setName("edit292");

    obj.edit293 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit293:setParent(obj.layout2);
    obj.edit293:setType("number");
    obj.edit293:setVertTextAlign("center");
    obj.edit293:setHorzTextAlign("center");
    obj.edit293:setLeft(367);
    obj.edit293:setTop(450);
    obj.edit293:setWidth(33);
    obj.edit293:setHeight(25);
    obj.edit293:setField("penalidade43");
    obj.edit293:setName("edit293");

    obj.edit294 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit294:setParent(obj.layout2);
    obj.edit294:setType("number");
    obj.edit294:setVertTextAlign("center");
    obj.edit294:setHorzTextAlign("center");
    obj.edit294:setLeft(367);
    obj.edit294:setTop(475);
    obj.edit294:setWidth(33);
    obj.edit294:setHeight(25);
    obj.edit294:setField("penalidade44");
    obj.edit294:setName("edit294");

    obj.edit295 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit295:setParent(obj.layout2);
    obj.edit295:setType("number");
    obj.edit295:setVertTextAlign("center");
    obj.edit295:setHorzTextAlign("center");
    obj.edit295:setLeft(367);
    obj.edit295:setTop(500);
    obj.edit295:setWidth(33);
    obj.edit295:setHeight(25);
    obj.edit295:setField("penalidade45");
    obj.edit295:setName("edit295");

    obj.edit296 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit296:setParent(obj.layout2);
    obj.edit296:setType("number");
    obj.edit296:setVertTextAlign("center");
    obj.edit296:setHorzTextAlign("center");
    obj.edit296:setLeft(367);
    obj.edit296:setTop(525);
    obj.edit296:setWidth(33);
    obj.edit296:setHeight(25);
    obj.edit296:setField("penalidade46");
    obj.edit296:setName("edit296");

    obj.edit297 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit297:setParent(obj.layout2);
    obj.edit297:setType("number");
    obj.edit297:setVertTextAlign("center");
    obj.edit297:setHorzTextAlign("center");
    obj.edit297:setLeft(367);
    obj.edit297:setTop(550);
    obj.edit297:setWidth(33);
    obj.edit297:setHeight(25);
    obj.edit297:setField("penalidade47");
    obj.edit297:setName("edit297");

    obj.edit298 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit298:setParent(obj.layout2);
    obj.edit298:setType("number");
    obj.edit298:setVertTextAlign("center");
    obj.edit298:setHorzTextAlign("center");
    obj.edit298:setLeft(367);
    obj.edit298:setTop(575);
    obj.edit298:setWidth(33);
    obj.edit298:setHeight(25);
    obj.edit298:setField("penalidade48");
    obj.edit298:setName("edit298");

    obj.edit299 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit299:setParent(obj.layout2);
    obj.edit299:setType("number");
    obj.edit299:setVertTextAlign("center");
    obj.edit299:setHorzTextAlign("center");
    obj.edit299:setLeft(367);
    obj.edit299:setTop(600);
    obj.edit299:setWidth(33);
    obj.edit299:setHeight(25);
    obj.edit299:setField("penalidade49");
    obj.edit299:setName("edit299");

    obj.edit300 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit300:setParent(obj.layout2);
    obj.edit300:setType("number");
    obj.edit300:setVertTextAlign("center");
    obj.edit300:setHorzTextAlign("center");
    obj.edit300:setLeft(367);
    obj.edit300:setTop(625);
    obj.edit300:setWidth(33);
    obj.edit300:setHeight(25);
    obj.edit300:setField("penalidade50");
    obj.edit300:setName("edit300");

    obj.edit301 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit301:setParent(obj.layout2);
    obj.edit301:setType("number");
    obj.edit301:setVertTextAlign("center");
    obj.edit301:setHorzTextAlign("center");
    obj.edit301:setLeft(400);
    obj.edit301:setTop(25);
    obj.edit301:setWidth(33);
    obj.edit301:setHeight(25);
    obj.edit301:setField("raca26");
    obj.edit301:setName("edit301");

    obj.edit302 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit302:setParent(obj.layout2);
    obj.edit302:setType("number");
    obj.edit302:setVertTextAlign("center");
    obj.edit302:setHorzTextAlign("center");
    obj.edit302:setLeft(400);
    obj.edit302:setTop(50);
    obj.edit302:setWidth(33);
    obj.edit302:setHeight(25);
    obj.edit302:setField("raca27");
    obj.edit302:setName("edit302");

    obj.edit303 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit303:setParent(obj.layout2);
    obj.edit303:setType("number");
    obj.edit303:setVertTextAlign("center");
    obj.edit303:setHorzTextAlign("center");
    obj.edit303:setLeft(400);
    obj.edit303:setTop(75);
    obj.edit303:setWidth(33);
    obj.edit303:setHeight(25);
    obj.edit303:setField("raca28");
    obj.edit303:setName("edit303");

    obj.edit304 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit304:setParent(obj.layout2);
    obj.edit304:setType("number");
    obj.edit304:setVertTextAlign("center");
    obj.edit304:setHorzTextAlign("center");
    obj.edit304:setLeft(400);
    obj.edit304:setTop(100);
    obj.edit304:setWidth(33);
    obj.edit304:setHeight(25);
    obj.edit304:setField("raca29");
    obj.edit304:setName("edit304");

    obj.edit305 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit305:setParent(obj.layout2);
    obj.edit305:setType("number");
    obj.edit305:setVertTextAlign("center");
    obj.edit305:setHorzTextAlign("center");
    obj.edit305:setLeft(400);
    obj.edit305:setTop(125);
    obj.edit305:setWidth(33);
    obj.edit305:setHeight(25);
    obj.edit305:setField("raca30");
    obj.edit305:setName("edit305");

    obj.edit306 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit306:setParent(obj.layout2);
    obj.edit306:setType("number");
    obj.edit306:setVertTextAlign("center");
    obj.edit306:setHorzTextAlign("center");
    obj.edit306:setLeft(400);
    obj.edit306:setTop(150);
    obj.edit306:setWidth(33);
    obj.edit306:setHeight(25);
    obj.edit306:setField("raca31");
    obj.edit306:setName("edit306");

    obj.edit307 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit307:setParent(obj.layout2);
    obj.edit307:setType("number");
    obj.edit307:setVertTextAlign("center");
    obj.edit307:setHorzTextAlign("center");
    obj.edit307:setLeft(400);
    obj.edit307:setTop(175);
    obj.edit307:setWidth(33);
    obj.edit307:setHeight(25);
    obj.edit307:setField("raca32");
    obj.edit307:setName("edit307");

    obj.edit308 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit308:setParent(obj.layout2);
    obj.edit308:setType("number");
    obj.edit308:setVertTextAlign("center");
    obj.edit308:setHorzTextAlign("center");
    obj.edit308:setLeft(400);
    obj.edit308:setTop(200);
    obj.edit308:setWidth(33);
    obj.edit308:setHeight(25);
    obj.edit308:setField("raca33");
    obj.edit308:setName("edit308");

    obj.edit309 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit309:setParent(obj.layout2);
    obj.edit309:setType("number");
    obj.edit309:setVertTextAlign("center");
    obj.edit309:setHorzTextAlign("center");
    obj.edit309:setLeft(400);
    obj.edit309:setTop(225);
    obj.edit309:setWidth(33);
    obj.edit309:setHeight(25);
    obj.edit309:setField("raca34");
    obj.edit309:setName("edit309");

    obj.edit310 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit310:setParent(obj.layout2);
    obj.edit310:setType("number");
    obj.edit310:setVertTextAlign("center");
    obj.edit310:setHorzTextAlign("center");
    obj.edit310:setLeft(400);
    obj.edit310:setTop(250);
    obj.edit310:setWidth(33);
    obj.edit310:setHeight(25);
    obj.edit310:setField("raca35");
    obj.edit310:setName("edit310");

    obj.edit311 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit311:setParent(obj.layout2);
    obj.edit311:setType("number");
    obj.edit311:setVertTextAlign("center");
    obj.edit311:setHorzTextAlign("center");
    obj.edit311:setLeft(400);
    obj.edit311:setTop(275);
    obj.edit311:setWidth(33);
    obj.edit311:setHeight(25);
    obj.edit311:setField("raca36");
    obj.edit311:setName("edit311");

    obj.edit312 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit312:setParent(obj.layout2);
    obj.edit312:setType("number");
    obj.edit312:setVertTextAlign("center");
    obj.edit312:setHorzTextAlign("center");
    obj.edit312:setLeft(400);
    obj.edit312:setTop(300);
    obj.edit312:setWidth(33);
    obj.edit312:setHeight(25);
    obj.edit312:setField("raca37");
    obj.edit312:setName("edit312");

    obj.edit313 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit313:setParent(obj.layout2);
    obj.edit313:setType("number");
    obj.edit313:setVertTextAlign("center");
    obj.edit313:setHorzTextAlign("center");
    obj.edit313:setLeft(400);
    obj.edit313:setTop(325);
    obj.edit313:setWidth(33);
    obj.edit313:setHeight(25);
    obj.edit313:setField("raca38");
    obj.edit313:setName("edit313");

    obj.edit314 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit314:setParent(obj.layout2);
    obj.edit314:setType("number");
    obj.edit314:setVertTextAlign("center");
    obj.edit314:setHorzTextAlign("center");
    obj.edit314:setLeft(400);
    obj.edit314:setTop(350);
    obj.edit314:setWidth(33);
    obj.edit314:setHeight(25);
    obj.edit314:setField("raca39");
    obj.edit314:setName("edit314");

    obj.edit315 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit315:setParent(obj.layout2);
    obj.edit315:setType("number");
    obj.edit315:setVertTextAlign("center");
    obj.edit315:setHorzTextAlign("center");
    obj.edit315:setLeft(400);
    obj.edit315:setTop(375);
    obj.edit315:setWidth(33);
    obj.edit315:setHeight(25);
    obj.edit315:setField("raca40");
    obj.edit315:setName("edit315");

    obj.edit316 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit316:setParent(obj.layout2);
    obj.edit316:setType("number");
    obj.edit316:setVertTextAlign("center");
    obj.edit316:setHorzTextAlign("center");
    obj.edit316:setLeft(400);
    obj.edit316:setTop(400);
    obj.edit316:setWidth(33);
    obj.edit316:setHeight(25);
    obj.edit316:setField("raca41");
    obj.edit316:setName("edit316");

    obj.edit317 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit317:setParent(obj.layout2);
    obj.edit317:setType("number");
    obj.edit317:setVertTextAlign("center");
    obj.edit317:setHorzTextAlign("center");
    obj.edit317:setLeft(400);
    obj.edit317:setTop(425);
    obj.edit317:setWidth(33);
    obj.edit317:setHeight(25);
    obj.edit317:setField("raca42");
    obj.edit317:setName("edit317");

    obj.edit318 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit318:setParent(obj.layout2);
    obj.edit318:setType("number");
    obj.edit318:setVertTextAlign("center");
    obj.edit318:setHorzTextAlign("center");
    obj.edit318:setLeft(400);
    obj.edit318:setTop(450);
    obj.edit318:setWidth(33);
    obj.edit318:setHeight(25);
    obj.edit318:setField("raca43");
    obj.edit318:setName("edit318");

    obj.edit319 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit319:setParent(obj.layout2);
    obj.edit319:setType("number");
    obj.edit319:setVertTextAlign("center");
    obj.edit319:setHorzTextAlign("center");
    obj.edit319:setLeft(400);
    obj.edit319:setTop(475);
    obj.edit319:setWidth(33);
    obj.edit319:setHeight(25);
    obj.edit319:setField("raca44");
    obj.edit319:setName("edit319");

    obj.edit320 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit320:setParent(obj.layout2);
    obj.edit320:setType("number");
    obj.edit320:setVertTextAlign("center");
    obj.edit320:setHorzTextAlign("center");
    obj.edit320:setLeft(400);
    obj.edit320:setTop(500);
    obj.edit320:setWidth(33);
    obj.edit320:setHeight(25);
    obj.edit320:setField("raca45");
    obj.edit320:setName("edit320");

    obj.edit321 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit321:setParent(obj.layout2);
    obj.edit321:setType("number");
    obj.edit321:setVertTextAlign("center");
    obj.edit321:setHorzTextAlign("center");
    obj.edit321:setLeft(400);
    obj.edit321:setTop(525);
    obj.edit321:setWidth(33);
    obj.edit321:setHeight(25);
    obj.edit321:setField("raca46");
    obj.edit321:setName("edit321");

    obj.edit322 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit322:setParent(obj.layout2);
    obj.edit322:setType("number");
    obj.edit322:setVertTextAlign("center");
    obj.edit322:setHorzTextAlign("center");
    obj.edit322:setLeft(400);
    obj.edit322:setTop(550);
    obj.edit322:setWidth(33);
    obj.edit322:setHeight(25);
    obj.edit322:setField("raca47");
    obj.edit322:setName("edit322");

    obj.edit323 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit323:setParent(obj.layout2);
    obj.edit323:setType("number");
    obj.edit323:setVertTextAlign("center");
    obj.edit323:setHorzTextAlign("center");
    obj.edit323:setLeft(400);
    obj.edit323:setTop(575);
    obj.edit323:setWidth(33);
    obj.edit323:setHeight(25);
    obj.edit323:setField("raca48");
    obj.edit323:setName("edit323");

    obj.edit324 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit324:setParent(obj.layout2);
    obj.edit324:setType("number");
    obj.edit324:setVertTextAlign("center");
    obj.edit324:setHorzTextAlign("center");
    obj.edit324:setLeft(400);
    obj.edit324:setTop(600);
    obj.edit324:setWidth(33);
    obj.edit324:setHeight(25);
    obj.edit324:setField("raca49");
    obj.edit324:setName("edit324");

    obj.edit325 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit325:setParent(obj.layout2);
    obj.edit325:setType("number");
    obj.edit325:setVertTextAlign("center");
    obj.edit325:setHorzTextAlign("center");
    obj.edit325:setLeft(400);
    obj.edit325:setTop(625);
    obj.edit325:setWidth(33);
    obj.edit325:setHeight(25);
    obj.edit325:setField("raca50");
    obj.edit325:setName("edit325");

    obj.edit326 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit326:setParent(obj.layout2);
    obj.edit326:setType("number");
    obj.edit326:setVertTextAlign("center");
    obj.edit326:setHorzTextAlign("center");
    obj.edit326:setLeft(433);
    obj.edit326:setTop(25);
    obj.edit326:setWidth(33);
    obj.edit326:setHeight(25);
    obj.edit326:setField("itens26");
    obj.edit326:setName("edit326");

    obj.edit327 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit327:setParent(obj.layout2);
    obj.edit327:setType("number");
    obj.edit327:setVertTextAlign("center");
    obj.edit327:setHorzTextAlign("center");
    obj.edit327:setLeft(433);
    obj.edit327:setTop(50);
    obj.edit327:setWidth(33);
    obj.edit327:setHeight(25);
    obj.edit327:setField("itens27");
    obj.edit327:setName("edit327");

    obj.edit328 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit328:setParent(obj.layout2);
    obj.edit328:setType("number");
    obj.edit328:setVertTextAlign("center");
    obj.edit328:setHorzTextAlign("center");
    obj.edit328:setLeft(433);
    obj.edit328:setTop(75);
    obj.edit328:setWidth(33);
    obj.edit328:setHeight(25);
    obj.edit328:setField("itens28");
    obj.edit328:setName("edit328");

    obj.edit329 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit329:setParent(obj.layout2);
    obj.edit329:setType("number");
    obj.edit329:setVertTextAlign("center");
    obj.edit329:setHorzTextAlign("center");
    obj.edit329:setLeft(433);
    obj.edit329:setTop(100);
    obj.edit329:setWidth(33);
    obj.edit329:setHeight(25);
    obj.edit329:setField("itens29");
    obj.edit329:setName("edit329");

    obj.edit330 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit330:setParent(obj.layout2);
    obj.edit330:setType("number");
    obj.edit330:setVertTextAlign("center");
    obj.edit330:setHorzTextAlign("center");
    obj.edit330:setLeft(433);
    obj.edit330:setTop(125);
    obj.edit330:setWidth(33);
    obj.edit330:setHeight(25);
    obj.edit330:setField("itens30");
    obj.edit330:setName("edit330");

    obj.edit331 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit331:setParent(obj.layout2);
    obj.edit331:setType("number");
    obj.edit331:setVertTextAlign("center");
    obj.edit331:setHorzTextAlign("center");
    obj.edit331:setLeft(433);
    obj.edit331:setTop(150);
    obj.edit331:setWidth(33);
    obj.edit331:setHeight(25);
    obj.edit331:setField("itens31");
    obj.edit331:setName("edit331");

    obj.edit332 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit332:setParent(obj.layout2);
    obj.edit332:setType("number");
    obj.edit332:setVertTextAlign("center");
    obj.edit332:setHorzTextAlign("center");
    obj.edit332:setLeft(433);
    obj.edit332:setTop(175);
    obj.edit332:setWidth(33);
    obj.edit332:setHeight(25);
    obj.edit332:setField("itens32");
    obj.edit332:setName("edit332");

    obj.edit333 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit333:setParent(obj.layout2);
    obj.edit333:setType("number");
    obj.edit333:setVertTextAlign("center");
    obj.edit333:setHorzTextAlign("center");
    obj.edit333:setLeft(433);
    obj.edit333:setTop(200);
    obj.edit333:setWidth(33);
    obj.edit333:setHeight(25);
    obj.edit333:setField("itens33");
    obj.edit333:setName("edit333");

    obj.edit334 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit334:setParent(obj.layout2);
    obj.edit334:setType("number");
    obj.edit334:setVertTextAlign("center");
    obj.edit334:setHorzTextAlign("center");
    obj.edit334:setLeft(433);
    obj.edit334:setTop(225);
    obj.edit334:setWidth(33);
    obj.edit334:setHeight(25);
    obj.edit334:setField("itens34");
    obj.edit334:setName("edit334");

    obj.edit335 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit335:setParent(obj.layout2);
    obj.edit335:setType("number");
    obj.edit335:setVertTextAlign("center");
    obj.edit335:setHorzTextAlign("center");
    obj.edit335:setLeft(433);
    obj.edit335:setTop(250);
    obj.edit335:setWidth(33);
    obj.edit335:setHeight(25);
    obj.edit335:setField("itens35");
    obj.edit335:setName("edit335");

    obj.edit336 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit336:setParent(obj.layout2);
    obj.edit336:setType("number");
    obj.edit336:setVertTextAlign("center");
    obj.edit336:setHorzTextAlign("center");
    obj.edit336:setLeft(433);
    obj.edit336:setTop(275);
    obj.edit336:setWidth(33);
    obj.edit336:setHeight(25);
    obj.edit336:setField("itens36");
    obj.edit336:setName("edit336");

    obj.edit337 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit337:setParent(obj.layout2);
    obj.edit337:setType("number");
    obj.edit337:setVertTextAlign("center");
    obj.edit337:setHorzTextAlign("center");
    obj.edit337:setLeft(433);
    obj.edit337:setTop(300);
    obj.edit337:setWidth(33);
    obj.edit337:setHeight(25);
    obj.edit337:setField("itens37");
    obj.edit337:setName("edit337");

    obj.edit338 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit338:setParent(obj.layout2);
    obj.edit338:setType("number");
    obj.edit338:setVertTextAlign("center");
    obj.edit338:setHorzTextAlign("center");
    obj.edit338:setLeft(433);
    obj.edit338:setTop(325);
    obj.edit338:setWidth(33);
    obj.edit338:setHeight(25);
    obj.edit338:setField("itens38");
    obj.edit338:setName("edit338");

    obj.edit339 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit339:setParent(obj.layout2);
    obj.edit339:setType("number");
    obj.edit339:setVertTextAlign("center");
    obj.edit339:setHorzTextAlign("center");
    obj.edit339:setLeft(433);
    obj.edit339:setTop(350);
    obj.edit339:setWidth(33);
    obj.edit339:setHeight(25);
    obj.edit339:setField("itens39");
    obj.edit339:setName("edit339");

    obj.edit340 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit340:setParent(obj.layout2);
    obj.edit340:setType("number");
    obj.edit340:setVertTextAlign("center");
    obj.edit340:setHorzTextAlign("center");
    obj.edit340:setLeft(433);
    obj.edit340:setTop(375);
    obj.edit340:setWidth(33);
    obj.edit340:setHeight(25);
    obj.edit340:setField("itens40");
    obj.edit340:setName("edit340");

    obj.edit341 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit341:setParent(obj.layout2);
    obj.edit341:setType("number");
    obj.edit341:setVertTextAlign("center");
    obj.edit341:setHorzTextAlign("center");
    obj.edit341:setLeft(433);
    obj.edit341:setTop(400);
    obj.edit341:setWidth(33);
    obj.edit341:setHeight(25);
    obj.edit341:setField("itens41");
    obj.edit341:setName("edit341");

    obj.edit342 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit342:setParent(obj.layout2);
    obj.edit342:setType("number");
    obj.edit342:setVertTextAlign("center");
    obj.edit342:setHorzTextAlign("center");
    obj.edit342:setLeft(433);
    obj.edit342:setTop(425);
    obj.edit342:setWidth(33);
    obj.edit342:setHeight(25);
    obj.edit342:setField("itens42");
    obj.edit342:setName("edit342");

    obj.edit343 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit343:setParent(obj.layout2);
    obj.edit343:setType("number");
    obj.edit343:setVertTextAlign("center");
    obj.edit343:setHorzTextAlign("center");
    obj.edit343:setLeft(433);
    obj.edit343:setTop(450);
    obj.edit343:setWidth(33);
    obj.edit343:setHeight(25);
    obj.edit343:setField("itens43");
    obj.edit343:setName("edit343");

    obj.edit344 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit344:setParent(obj.layout2);
    obj.edit344:setType("number");
    obj.edit344:setVertTextAlign("center");
    obj.edit344:setHorzTextAlign("center");
    obj.edit344:setLeft(433);
    obj.edit344:setTop(475);
    obj.edit344:setWidth(33);
    obj.edit344:setHeight(25);
    obj.edit344:setField("itens44");
    obj.edit344:setName("edit344");

    obj.edit345 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit345:setParent(obj.layout2);
    obj.edit345:setType("number");
    obj.edit345:setVertTextAlign("center");
    obj.edit345:setHorzTextAlign("center");
    obj.edit345:setLeft(433);
    obj.edit345:setTop(500);
    obj.edit345:setWidth(33);
    obj.edit345:setHeight(25);
    obj.edit345:setField("itens45");
    obj.edit345:setName("edit345");

    obj.edit346 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit346:setParent(obj.layout2);
    obj.edit346:setType("number");
    obj.edit346:setVertTextAlign("center");
    obj.edit346:setHorzTextAlign("center");
    obj.edit346:setLeft(433);
    obj.edit346:setTop(525);
    obj.edit346:setWidth(33);
    obj.edit346:setHeight(25);
    obj.edit346:setField("itens46");
    obj.edit346:setName("edit346");

    obj.edit347 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit347:setParent(obj.layout2);
    obj.edit347:setType("number");
    obj.edit347:setVertTextAlign("center");
    obj.edit347:setHorzTextAlign("center");
    obj.edit347:setLeft(433);
    obj.edit347:setTop(550);
    obj.edit347:setWidth(33);
    obj.edit347:setHeight(25);
    obj.edit347:setField("itens47");
    obj.edit347:setName("edit347");

    obj.edit348 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit348:setParent(obj.layout2);
    obj.edit348:setType("number");
    obj.edit348:setVertTextAlign("center");
    obj.edit348:setHorzTextAlign("center");
    obj.edit348:setLeft(433);
    obj.edit348:setTop(575);
    obj.edit348:setWidth(33);
    obj.edit348:setHeight(25);
    obj.edit348:setField("itens48");
    obj.edit348:setName("edit348");

    obj.edit349 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit349:setParent(obj.layout2);
    obj.edit349:setType("number");
    obj.edit349:setVertTextAlign("center");
    obj.edit349:setHorzTextAlign("center");
    obj.edit349:setLeft(433);
    obj.edit349:setTop(600);
    obj.edit349:setWidth(33);
    obj.edit349:setHeight(25);
    obj.edit349:setField("itens49");
    obj.edit349:setName("edit349");

    obj.edit350 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit350:setParent(obj.layout2);
    obj.edit350:setType("number");
    obj.edit350:setVertTextAlign("center");
    obj.edit350:setHorzTextAlign("center");
    obj.edit350:setLeft(433);
    obj.edit350:setTop(625);
    obj.edit350:setWidth(33);
    obj.edit350:setHeight(25);
    obj.edit350:setField("itens50");
    obj.edit350:setName("edit350");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout2);
    obj.label110:setText("NOME DA PERÍCIA");
    obj.label110:setLeft(21);
    obj.label110:setTop(1);
    obj.label110:setWidth(135);
    obj.label110:setHeight(20);
    obj.label110:setHorzTextAlign("center");
    obj.label110:setName("label110");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout2);
    obj.label111:setText("CHAVE");
    obj.label111:setLeft(158);
    obj.label111:setTop(1);
    obj.label111:setWidth(45);
    obj.label111:setHeight(20);
    obj.label111:setHorzTextAlign("center");
    obj.label111:setName("label111");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout2);
    obj.label112:setText("TOTAL");
    obj.label112:setLeft(205);
    obj.label112:setTop(1);
    obj.label112:setWidth(40);
    obj.label112:setHeight(20);
    obj.label112:setHorzTextAlign("center");
    obj.label112:setName("label112");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout2);
    obj.label113:setText("ATR");
    obj.label113:setLeft(268);
    obj.label113:setTop(1);
    obj.label113:setWidth(33);
    obj.label113:setHeight(20);
    obj.label113:setHorzTextAlign("center");
    obj.label113:setName("label113");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout2);
    obj.label114:setText("GRAD");
    obj.label114:setLeft(298);
    obj.label114:setTop(1);
    obj.label114:setWidth(40);
    obj.label114:setHeight(20);
    obj.label114:setHorzTextAlign("center");
    obj.label114:setName("label114");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout2);
    obj.label115:setText("OUT");
    obj.label115:setLeft(334);
    obj.label115:setTop(1);
    obj.label115:setWidth(33);
    obj.label115:setHeight(20);
    obj.label115:setHorzTextAlign("center");
    obj.label115:setName("label115");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout2);
    obj.label116:setText("PEN");
    obj.label116:setLeft(367);
    obj.label116:setTop(1);
    obj.label116:setWidth(33);
    obj.label116:setHeight(20);
    obj.label116:setHorzTextAlign("center");
    obj.label116:setName("label116");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout2);
    obj.label117:setText("RAÇA");
    obj.label117:setLeft(400);
    obj.label117:setTop(1);
    obj.label117:setWidth(33);
    obj.label117:setHeight(20);
    obj.label117:setHorzTextAlign("center");
    obj.label117:setName("label117");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout2);
    obj.label118:setText("EQP");
    obj.label118:setLeft(433);
    obj.label118:setTop(1);
    obj.label118:setWidth(33);
    obj.label118:setHeight(20);
    obj.label118:setHorzTextAlign("center");
    obj.label118:setName("label118");

    obj.button26 = gui.fromHandle(_obj_newObject("button"));
    obj.button26:setParent(obj.layout2);
    obj.button26:setLeft(240);
    obj.button26:setTop(25);
    obj.button26:setWidth(24);
    obj.button26:setHeight(25);
    obj.button26:setText("R");
    obj.button26:setFontSize(11);
    obj.button26:setName("button26");

    obj.dataLink51 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink51:setParent(obj.layout2);
    obj.dataLink51:setFields({'atributo26', 'graduacao26', 'outros26', 'penalidade26', 'raca26', 'itens26'});
    obj.dataLink51:setName("dataLink51");

    obj.dataLink52 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink52:setParent(obj.layout2);
    obj.dataLink52:setFields({'chave26', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink52:setName("dataLink52");

    obj.button27 = gui.fromHandle(_obj_newObject("button"));
    obj.button27:setParent(obj.layout2);
    obj.button27:setLeft(240);
    obj.button27:setTop(50);
    obj.button27:setWidth(24);
    obj.button27:setHeight(25);
    obj.button27:setText("R");
    obj.button27:setFontSize(11);
    obj.button27:setName("button27");

    obj.dataLink53 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink53:setParent(obj.layout2);
    obj.dataLink53:setFields({'atributo27', 'graduacao27', 'outros27', 'penalidade27', 'raca27', 'itens27'});
    obj.dataLink53:setName("dataLink53");

    obj.dataLink54 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink54:setParent(obj.layout2);
    obj.dataLink54:setFields({'chave27', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink54:setName("dataLink54");

    obj.button28 = gui.fromHandle(_obj_newObject("button"));
    obj.button28:setParent(obj.layout2);
    obj.button28:setLeft(240);
    obj.button28:setTop(75);
    obj.button28:setWidth(24);
    obj.button28:setHeight(25);
    obj.button28:setText("R");
    obj.button28:setFontSize(11);
    obj.button28:setName("button28");

    obj.dataLink55 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink55:setParent(obj.layout2);
    obj.dataLink55:setFields({'atributo28', 'graduacao28', 'outros28', 'penalidade28', 'raca28', 'itens28'});
    obj.dataLink55:setName("dataLink55");

    obj.dataLink56 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink56:setParent(obj.layout2);
    obj.dataLink56:setFields({'chave28', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink56:setName("dataLink56");

    obj.button29 = gui.fromHandle(_obj_newObject("button"));
    obj.button29:setParent(obj.layout2);
    obj.button29:setLeft(240);
    obj.button29:setTop(100);
    obj.button29:setWidth(24);
    obj.button29:setHeight(25);
    obj.button29:setText("R");
    obj.button29:setFontSize(11);
    obj.button29:setName("button29");

    obj.dataLink57 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink57:setParent(obj.layout2);
    obj.dataLink57:setFields({'atributo29', 'graduacao29', 'outros29', 'penalidade29', 'raca29', 'itens29'});
    obj.dataLink57:setName("dataLink57");

    obj.dataLink58 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink58:setParent(obj.layout2);
    obj.dataLink58:setFields({'chave29', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink58:setName("dataLink58");

    obj.button30 = gui.fromHandle(_obj_newObject("button"));
    obj.button30:setParent(obj.layout2);
    obj.button30:setLeft(240);
    obj.button30:setTop(125);
    obj.button30:setWidth(24);
    obj.button30:setHeight(25);
    obj.button30:setText("R");
    obj.button30:setFontSize(11);
    obj.button30:setName("button30");

    obj.dataLink59 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink59:setParent(obj.layout2);
    obj.dataLink59:setFields({'atributo30', 'graduacao30', 'outros30', 'penalidade30', 'raca30', 'itens30'});
    obj.dataLink59:setName("dataLink59");

    obj.dataLink60 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink60:setParent(obj.layout2);
    obj.dataLink60:setFields({'chave30', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink60:setName("dataLink60");

    obj.button31 = gui.fromHandle(_obj_newObject("button"));
    obj.button31:setParent(obj.layout2);
    obj.button31:setLeft(240);
    obj.button31:setTop(150);
    obj.button31:setWidth(24);
    obj.button31:setHeight(25);
    obj.button31:setText("R");
    obj.button31:setFontSize(11);
    obj.button31:setName("button31");

    obj.dataLink61 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink61:setParent(obj.layout2);
    obj.dataLink61:setFields({'atributo31', 'graduacao31', 'outros31', 'penalidade31', 'raca31', 'itens31'});
    obj.dataLink61:setName("dataLink61");

    obj.dataLink62 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink62:setParent(obj.layout2);
    obj.dataLink62:setFields({'chave31', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink62:setName("dataLink62");

    obj.button32 = gui.fromHandle(_obj_newObject("button"));
    obj.button32:setParent(obj.layout2);
    obj.button32:setLeft(240);
    obj.button32:setTop(175);
    obj.button32:setWidth(24);
    obj.button32:setHeight(25);
    obj.button32:setText("R");
    obj.button32:setFontSize(11);
    obj.button32:setName("button32");

    obj.dataLink63 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink63:setParent(obj.layout2);
    obj.dataLink63:setFields({'atributo32', 'graduacao32', 'outros32', 'penalidade32', 'raca32', 'itens32'});
    obj.dataLink63:setName("dataLink63");

    obj.dataLink64 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink64:setParent(obj.layout2);
    obj.dataLink64:setFields({'chave32', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink64:setName("dataLink64");

    obj.button33 = gui.fromHandle(_obj_newObject("button"));
    obj.button33:setParent(obj.layout2);
    obj.button33:setLeft(240);
    obj.button33:setTop(200);
    obj.button33:setWidth(24);
    obj.button33:setHeight(25);
    obj.button33:setText("R");
    obj.button33:setFontSize(11);
    obj.button33:setName("button33");

    obj.dataLink65 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink65:setParent(obj.layout2);
    obj.dataLink65:setFields({'atributo33', 'graduacao33', 'outros33', 'penalidade33', 'raca33', 'itens33'});
    obj.dataLink65:setName("dataLink65");

    obj.dataLink66 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink66:setParent(obj.layout2);
    obj.dataLink66:setFields({'chave33', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink66:setName("dataLink66");

    obj.button34 = gui.fromHandle(_obj_newObject("button"));
    obj.button34:setParent(obj.layout2);
    obj.button34:setLeft(240);
    obj.button34:setTop(225);
    obj.button34:setWidth(24);
    obj.button34:setHeight(25);
    obj.button34:setText("R");
    obj.button34:setFontSize(11);
    obj.button34:setName("button34");

    obj.dataLink67 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink67:setParent(obj.layout2);
    obj.dataLink67:setFields({'atributo34', 'graduacao34', 'outros34', 'penalidade34', 'raca34', 'itens34'});
    obj.dataLink67:setName("dataLink67");

    obj.dataLink68 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink68:setParent(obj.layout2);
    obj.dataLink68:setFields({'chave34', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink68:setName("dataLink68");

    obj.button35 = gui.fromHandle(_obj_newObject("button"));
    obj.button35:setParent(obj.layout2);
    obj.button35:setLeft(240);
    obj.button35:setTop(250);
    obj.button35:setWidth(24);
    obj.button35:setHeight(25);
    obj.button35:setText("R");
    obj.button35:setFontSize(11);
    obj.button35:setName("button35");

    obj.dataLink69 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink69:setParent(obj.layout2);
    obj.dataLink69:setFields({'atributo35', 'graduacao35', 'outros35', 'penalidade35', 'raca35', 'itens35'});
    obj.dataLink69:setName("dataLink69");

    obj.dataLink70 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink70:setParent(obj.layout2);
    obj.dataLink70:setFields({'chave35', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink70:setName("dataLink70");

    obj.button36 = gui.fromHandle(_obj_newObject("button"));
    obj.button36:setParent(obj.layout2);
    obj.button36:setLeft(240);
    obj.button36:setTop(275);
    obj.button36:setWidth(24);
    obj.button36:setHeight(25);
    obj.button36:setText("R");
    obj.button36:setFontSize(11);
    obj.button36:setName("button36");

    obj.dataLink71 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink71:setParent(obj.layout2);
    obj.dataLink71:setFields({'atributo36', 'graduacao36', 'outros36', 'penalidade36', 'raca36', 'itens36'});
    obj.dataLink71:setName("dataLink71");

    obj.dataLink72 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink72:setParent(obj.layout2);
    obj.dataLink72:setFields({'chave36', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink72:setName("dataLink72");

    obj.button37 = gui.fromHandle(_obj_newObject("button"));
    obj.button37:setParent(obj.layout2);
    obj.button37:setLeft(240);
    obj.button37:setTop(300);
    obj.button37:setWidth(24);
    obj.button37:setHeight(25);
    obj.button37:setText("R");
    obj.button37:setFontSize(11);
    obj.button37:setName("button37");

    obj.dataLink73 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink73:setParent(obj.layout2);
    obj.dataLink73:setFields({'atributo37', 'graduacao37', 'outros37', 'penalidade37', 'raca37', 'itens37'});
    obj.dataLink73:setName("dataLink73");

    obj.dataLink74 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink74:setParent(obj.layout2);
    obj.dataLink74:setFields({'chave37', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink74:setName("dataLink74");

    obj.button38 = gui.fromHandle(_obj_newObject("button"));
    obj.button38:setParent(obj.layout2);
    obj.button38:setLeft(240);
    obj.button38:setTop(325);
    obj.button38:setWidth(24);
    obj.button38:setHeight(25);
    obj.button38:setText("R");
    obj.button38:setFontSize(11);
    obj.button38:setName("button38");

    obj.dataLink75 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink75:setParent(obj.layout2);
    obj.dataLink75:setFields({'atributo38', 'graduacao38', 'outros38', 'penalidade38', 'raca38', 'itens38'});
    obj.dataLink75:setName("dataLink75");

    obj.dataLink76 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink76:setParent(obj.layout2);
    obj.dataLink76:setFields({'chave38', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink76:setName("dataLink76");

    obj.button39 = gui.fromHandle(_obj_newObject("button"));
    obj.button39:setParent(obj.layout2);
    obj.button39:setLeft(240);
    obj.button39:setTop(350);
    obj.button39:setWidth(24);
    obj.button39:setHeight(25);
    obj.button39:setText("R");
    obj.button39:setFontSize(11);
    obj.button39:setName("button39");

    obj.dataLink77 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink77:setParent(obj.layout2);
    obj.dataLink77:setFields({'atributo39', 'graduacao39', 'outros39', 'penalidade39', 'raca39', 'itens39'});
    obj.dataLink77:setName("dataLink77");

    obj.dataLink78 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink78:setParent(obj.layout2);
    obj.dataLink78:setFields({'chave39', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink78:setName("dataLink78");

    obj.button40 = gui.fromHandle(_obj_newObject("button"));
    obj.button40:setParent(obj.layout2);
    obj.button40:setLeft(240);
    obj.button40:setTop(375);
    obj.button40:setWidth(24);
    obj.button40:setHeight(25);
    obj.button40:setText("R");
    obj.button40:setFontSize(11);
    obj.button40:setName("button40");

    obj.dataLink79 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink79:setParent(obj.layout2);
    obj.dataLink79:setFields({'atributo40', 'graduacao40', 'outros40', 'penalidade40', 'raca40', 'itens40'});
    obj.dataLink79:setName("dataLink79");

    obj.dataLink80 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink80:setParent(obj.layout2);
    obj.dataLink80:setFields({'chave40', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink80:setName("dataLink80");

    obj.button41 = gui.fromHandle(_obj_newObject("button"));
    obj.button41:setParent(obj.layout2);
    obj.button41:setLeft(240);
    obj.button41:setTop(400);
    obj.button41:setWidth(24);
    obj.button41:setHeight(25);
    obj.button41:setText("R");
    obj.button41:setFontSize(11);
    obj.button41:setName("button41");

    obj.dataLink81 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink81:setParent(obj.layout2);
    obj.dataLink81:setFields({'atributo41', 'graduacao41', 'outros41', 'penalidade41', 'raca41', 'itens41'});
    obj.dataLink81:setName("dataLink81");

    obj.dataLink82 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink82:setParent(obj.layout2);
    obj.dataLink82:setFields({'chave41', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink82:setName("dataLink82");

    obj.button42 = gui.fromHandle(_obj_newObject("button"));
    obj.button42:setParent(obj.layout2);
    obj.button42:setLeft(240);
    obj.button42:setTop(425);
    obj.button42:setWidth(24);
    obj.button42:setHeight(25);
    obj.button42:setText("R");
    obj.button42:setFontSize(11);
    obj.button42:setName("button42");

    obj.dataLink83 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink83:setParent(obj.layout2);
    obj.dataLink83:setFields({'atributo42', 'graduacao42', 'outros42', 'penalidade42', 'raca42', 'itens42'});
    obj.dataLink83:setName("dataLink83");

    obj.dataLink84 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink84:setParent(obj.layout2);
    obj.dataLink84:setFields({'chave42', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink84:setName("dataLink84");

    obj.button43 = gui.fromHandle(_obj_newObject("button"));
    obj.button43:setParent(obj.layout2);
    obj.button43:setLeft(240);
    obj.button43:setTop(450);
    obj.button43:setWidth(24);
    obj.button43:setHeight(25);
    obj.button43:setText("R");
    obj.button43:setFontSize(11);
    obj.button43:setName("button43");

    obj.dataLink85 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink85:setParent(obj.layout2);
    obj.dataLink85:setFields({'atributo43', 'graduacao43', 'outros43', 'penalidade43', 'raca43', 'itens43'});
    obj.dataLink85:setName("dataLink85");

    obj.dataLink86 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink86:setParent(obj.layout2);
    obj.dataLink86:setFields({'chave43', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink86:setName("dataLink86");

    obj.button44 = gui.fromHandle(_obj_newObject("button"));
    obj.button44:setParent(obj.layout2);
    obj.button44:setLeft(240);
    obj.button44:setTop(475);
    obj.button44:setWidth(24);
    obj.button44:setHeight(25);
    obj.button44:setText("R");
    obj.button44:setFontSize(11);
    obj.button44:setName("button44");

    obj.dataLink87 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink87:setParent(obj.layout2);
    obj.dataLink87:setFields({'atributo44', 'graduacao44', 'outros44', 'penalidade44', 'raca44', 'itens44'});
    obj.dataLink87:setName("dataLink87");

    obj.dataLink88 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink88:setParent(obj.layout2);
    obj.dataLink88:setFields({'chave44', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink88:setName("dataLink88");

    obj.button45 = gui.fromHandle(_obj_newObject("button"));
    obj.button45:setParent(obj.layout2);
    obj.button45:setLeft(240);
    obj.button45:setTop(500);
    obj.button45:setWidth(24);
    obj.button45:setHeight(25);
    obj.button45:setText("R");
    obj.button45:setFontSize(11);
    obj.button45:setName("button45");

    obj.dataLink89 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink89:setParent(obj.layout2);
    obj.dataLink89:setFields({'atributo45', 'graduacao45', 'outros45', 'penalidade45', 'raca45', 'itens45'});
    obj.dataLink89:setName("dataLink89");

    obj.dataLink90 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink90:setParent(obj.layout2);
    obj.dataLink90:setFields({'chave45', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink90:setName("dataLink90");

    obj.button46 = gui.fromHandle(_obj_newObject("button"));
    obj.button46:setParent(obj.layout2);
    obj.button46:setLeft(240);
    obj.button46:setTop(525);
    obj.button46:setWidth(24);
    obj.button46:setHeight(25);
    obj.button46:setText("R");
    obj.button46:setFontSize(11);
    obj.button46:setName("button46");

    obj.dataLink91 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink91:setParent(obj.layout2);
    obj.dataLink91:setFields({'atributo46', 'graduacao46', 'outros46', 'penalidade46', 'raca46', 'itens46'});
    obj.dataLink91:setName("dataLink91");

    obj.dataLink92 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink92:setParent(obj.layout2);
    obj.dataLink92:setFields({'chave46', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink92:setName("dataLink92");

    obj.button47 = gui.fromHandle(_obj_newObject("button"));
    obj.button47:setParent(obj.layout2);
    obj.button47:setLeft(240);
    obj.button47:setTop(550);
    obj.button47:setWidth(24);
    obj.button47:setHeight(25);
    obj.button47:setText("R");
    obj.button47:setFontSize(11);
    obj.button47:setName("button47");

    obj.dataLink93 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink93:setParent(obj.layout2);
    obj.dataLink93:setFields({'atributo47', 'graduacao47', 'outros47', 'penalidade47', 'raca47', 'itens47'});
    obj.dataLink93:setName("dataLink93");

    obj.dataLink94 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink94:setParent(obj.layout2);
    obj.dataLink94:setFields({'chave47', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink94:setName("dataLink94");

    obj.button48 = gui.fromHandle(_obj_newObject("button"));
    obj.button48:setParent(obj.layout2);
    obj.button48:setLeft(240);
    obj.button48:setTop(575);
    obj.button48:setWidth(24);
    obj.button48:setHeight(25);
    obj.button48:setText("R");
    obj.button48:setFontSize(11);
    obj.button48:setName("button48");

    obj.dataLink95 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink95:setParent(obj.layout2);
    obj.dataLink95:setFields({'atributo48', 'graduacao48', 'outros48', 'penalidade48', 'raca48', 'itens48'});
    obj.dataLink95:setName("dataLink95");

    obj.dataLink96 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink96:setParent(obj.layout2);
    obj.dataLink96:setFields({'chave48', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink96:setName("dataLink96");

    obj.button49 = gui.fromHandle(_obj_newObject("button"));
    obj.button49:setParent(obj.layout2);
    obj.button49:setLeft(240);
    obj.button49:setTop(600);
    obj.button49:setWidth(24);
    obj.button49:setHeight(25);
    obj.button49:setText("R");
    obj.button49:setFontSize(11);
    obj.button49:setName("button49");

    obj.dataLink97 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink97:setParent(obj.layout2);
    obj.dataLink97:setFields({'atributo49', 'graduacao49', 'outros49', 'penalidade49', 'raca49', 'itens49'});
    obj.dataLink97:setName("dataLink97");

    obj.dataLink98 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink98:setParent(obj.layout2);
    obj.dataLink98:setFields({'chave49', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink98:setName("dataLink98");

    obj.button50 = gui.fromHandle(_obj_newObject("button"));
    obj.button50:setParent(obj.layout2);
    obj.button50:setLeft(240);
    obj.button50:setTop(625);
    obj.button50:setWidth(24);
    obj.button50:setHeight(25);
    obj.button50:setText("R");
    obj.button50:setFontSize(11);
    obj.button50:setName("button50");

    obj.dataLink99 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink99:setParent(obj.layout2);
    obj.dataLink99:setFields({'atributo50', 'graduacao50', 'outros50', 'penalidade50', 'raca50', 'itens50'});
    obj.dataLink99:setName("dataLink99");

    obj.dataLink100 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink100:setParent(obj.layout2);
    obj.dataLink100:setFields({'chave50', 'efetModFor', 'efetModDes', 'efetModCon', 'efetModInt', 'efetModSab', 'efetModCar'});
    obj.dataLink100:setName("dataLink100");


                local function getAtributo(chave)
					if chave~=nil then
						chave = chave:upper();
					end;
                    local mod = 0;
                    if (chave == "FOR") then
                        mod = getFOR();
                    end;
                    if (chave == "DES") then
                        mod = getDES();  
                    end;
                    if (chave == "CON") then
                        mod = getCON();
                    end;
                    if (chave == "INT") then
                        mod = getINT();  
                    end;
                    if (chave == "SAB") then
                        mod = getSAB(); 
                    end;
                    if (chave == "CAR") then
                        mod = getCAR();
                    end;
					return mod;
                end;
            


    obj.button51 = gui.fromHandle(_obj_newObject("button"));
    obj.button51:setParent(obj.scrollBox1);
    obj.button51:setLeft(2);
    obj.button51:setTop(2);
    obj.button51:setWidth(20);
    obj.button51:setHeight(20);
    obj.button51:setText("P");
    obj.button51:setName("button51");

    obj.button52 = gui.fromHandle(_obj_newObject("button"));
    obj.button52:setParent(obj.scrollBox1);
    obj.button52:setLeft(477);
    obj.button52:setTop(5);
    obj.button52:setWidth(20);
    obj.button52:setHeight(20);
    obj.button52:setText("O");
    obj.button52:setName("button52");


                local function reset()
                    sheet.chave1="DES";
                    sheet.chave2="DES";
                    sheet.chave3="CAR";
                    sheet.chave4="DES";
                    sheet.chave5="CAR";
                    sheet.chave6="CAR";
                    sheet.chave7="INT";
                    sheet.chave8="CAR";
                    sheet.chave9="DES";
                    sheet.chave10="CON";
                    sheet.chave11="INT";
                    sheet.chave12="INT";
                    sheet.chave13="INT";
                    sheet.chave14="INT";
                    sheet.chave15="INT";
                    sheet.chave16="INT";
                    sheet.chave17="INT";
                    sheet.chave18="INT";
                    sheet.chave19="INT";
                    sheet.chave20="INT";
                    sheet.chave21="SAB";
                    sheet.chave22="INT";
                    sheet.chave23="CAR";
                    sheet.chave24="CAR";
                    sheet.chave25="DES";
                    sheet.chave26="FOR";
                    sheet.chave27="DES";
                    sheet.chave28="INT";
                    sheet.chave29="DES";
                    sheet.chave30="INT";
                    sheet.chave31="CAR";
                    sheet.chave32="FOR";
                    sheet.chave33="SAB";
                    sheet.chave34="CAR";
                    sheet.chave35="INT";
                    sheet.chave36="INT";
                    sheet.chave37="SAB";
                    sheet.chave38="DES";
                    sheet.chave39="INT";
                    sheet.chave40="SAB";
                    sheet.chave41="FOR";
                    sheet.chave42="SAB";
                    sheet.chave43="SAB";
                    sheet.chave44="DES";
                    sheet.chave45="CAR";
                    sheet.chave46="";
					sheet.chave47="";
					sheet.chave48="";
					sheet.chave49="";
                    sheet.chave50="";
					
					sheet.pericia1="Abrir Fechaduras";
                    sheet.pericia2="Acrobacia";
                    sheet.pericia3="Adestrar Animais";
                    sheet.pericia4="Arte da Fuga";
                    sheet.pericia5="Atuação";
                    sheet.pericia6="Atuação";
                    sheet.pericia7="Avaliação";
                    sheet.pericia8="Blefar";
                    sheet.pericia9="Cavalgar";
                    sheet.pericia10="Concentração";
                    sheet.pericia11="Conhecimento Arcano";
                    sheet.pericia12="Conhecimento Engenharia e Arquitetura";
                    sheet.pericia13="Conhecimento Geografia";
                    sheet.pericia14="Conhecimento Historia";
                    sheet.pericia15="Conhecimento Local";
                    sheet.pericia16="Conhecimento Masmorras";
                    sheet.pericia17="Conhecimento Natureza";
                    sheet.pericia18="Conhecimento Nobreza e Realeza";
                    sheet.pericia19="Conhecimento Planos";
                    sheet.pericia20="Conhecimento Religião";
                    sheet.pericia21="Cura";
                    sheet.pericia22="Decifrar Escrita";
                    sheet.pericia23="Diplomacia";
                    sheet.pericia24="Disfarces";
                    sheet.pericia25="Equilibrio";
                    sheet.pericia26="Escalar";
                    sheet.pericia27="Esconder-se";
                    sheet.pericia28="Falsificação";
                    sheet.pericia29="Furtividade";
                    sheet.pericia30="Identificar Magia";
                    sheet.pericia31="Intimidação";
                    sheet.pericia32="Natação";
                    sheet.pericia33="Observar";
                    sheet.pericia34="Obter Informação";
                    sheet.pericia35="Oficios";
                    sheet.pericia36="Operar Mecanismo";
                    sheet.pericia37="Ouvir";
                    sheet.pericia38="Prestidigitação";
                    sheet.pericia39="Procurar";
                    sheet.pericia40="Profissão";
                    sheet.pericia41="Saltar";
                    sheet.pericia42="Sentir Motivação";
                    sheet.pericia43="Sobrevivência";
                    sheet.pericia44="Usar Cordar";
                    sheet.pericia45="Usar Instrumento Mágico";
					sheet.pericia46="";
					sheet.pericia47="";
                    sheet.pericia48="";
					sheet.pericia49="";
                    sheet.pericia50="";
                end;
            



				function organize()
					for i=1,50,1 do
						for j=i+1,50,1 do
							local mod1 = sheet["pericia" .. i];
							local mod2 = sheet["pericia" .. j];
							if mod1==nil then
								mod1="zzzzzzzzzz";
							end;
							if mod2==nil then
								mod2="zzzzzzzzzz";
							end;
							
							mod1 = mod1:lower();
							mod2 = mod2:lower();
							
							if mod1>mod2 then
								local aux = sheet["per" .. i]
								sheet["per" .. i] = sheet["per" .. j];
								sheet["per" .. j] = aux;
								
								aux = sheet["pericia" .. i]
								sheet["pericia" .. i] = sheet["pericia" .. j];
								sheet["pericia" .. j] = aux;
								
								aux = sheet["chave" .. i]
								sheet["chave" .. i] = sheet["chave" .. j];
								sheet["chave" .. j] = aux;
								
								aux = sheet["graduacao" .. i]
								sheet["graduacao" .. i] = sheet["graduacao" .. j];
								sheet["graduacao" .. j] = aux;
								
								aux = sheet["outros" .. i]
								sheet["outros" .. i] = sheet["outros" .. j];
								sheet["outros" .. j] = aux;
								
								aux = sheet["penalidade" .. i]
								sheet["penalidade" .. i] = sheet["penalidade" .. j];
								sheet["penalidade" .. j] = aux;
								
								aux = sheet["raca" .. i]
								sheet["raca" .. i] = sheet["raca" .. j];
								sheet["raca" .. j] = aux;
								
								aux = sheet["itens" .. i]
								sheet["itens" .. i] = sheet["itens" .. j];
								sheet["itens" .. j] = aux;
							end;
						end;
					end;
				end;
			


    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(951);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(250);
    obj.layout3:setHeight(335);
    obj.layout3:setName("layout3");

    obj.rectangle103 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle103:setParent(obj.layout3);
    obj.rectangle103:setAlign("client");
    obj.rectangle103:setColor("black");
    obj.rectangle103:setName("rectangle103");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout3);
    obj.label119:setLeft(5);
    obj.label119:setTop(1);
    obj.label119:setWidth(200);
    obj.label119:setHeight(20);
    obj.label119:setText("IDIOMAS");
    obj.label119:setName("label119");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout3);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(23);
    obj.textEditor1:setWidth(240);
    obj.textEditor1:setHeight(305);
    obj.textEditor1:setField("idiomas");
    obj.textEditor1:setName("textEditor1");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(951);
    obj.layout4:setTop(338);
    obj.layout4:setWidth(250);
    obj.layout4:setHeight(290);
    obj.layout4:setName("layout4");

    obj.rectangle104 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle104:setParent(obj.layout4);
    obj.rectangle104:setAlign("client");
    obj.rectangle104:setColor("black");
    obj.rectangle104:setName("rectangle104");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout4);
    obj.label120:setLeft(5);
    obj.label120:setTop(1);
    obj.label120:setWidth(200);
    obj.label120:setHeight(20);
    obj.label120:setText("OUTROS");
    obj.label120:setName("label120");

    obj.textEditor2 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout4);
    obj.textEditor2:setLeft(5);
    obj.textEditor2:setTop(23);
    obj.textEditor2:setWidth(240);
    obj.textEditor2:setHeight(260);
    obj.textEditor2:setField("periciasOutros");
    obj.textEditor2:setName("textEditor2");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox1);
    obj.layout5:setLeft(951);
    obj.layout5:setTop(630);
    obj.layout5:setWidth(100);
    obj.layout5:setHeight(26);
    obj.layout5:setName("layout5");

    obj.rectangle105 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle105:setParent(obj.layout5);
    obj.rectangle105:setAlign("client");
    obj.rectangle105:setColor("black");
    obj.rectangle105:setName("rectangle105");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout5);
    obj.label121:setLeft(10);
    obj.label121:setTop(2);
    obj.label121:setWidth(50);
    obj.label121:setHeight(20);
    obj.label121:setText("TOTAL");
    obj.label121:setName("label121");

    obj.rectangle106 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle106:setParent(obj.layout5);
    obj.rectangle106:setLeft(60);
    obj.rectangle106:setTop(3);
    obj.rectangle106:setWidth(37);
    obj.rectangle106:setHeight(20);
    obj.rectangle106:setColor("black");
    obj.rectangle106:setStrokeColor("white");
    obj.rectangle106:setStrokeSize(1);
    obj.rectangle106:setName("rectangle106");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout5);
    obj.label122:setField("somaGraduacoes");
    obj.label122:setLeft(60);
    obj.label122:setTop(2);
    obj.label122:setWidth(37);
    obj.label122:setHeight(20);
    obj.label122:setHorzTextAlign("center");
    obj.label122:setName("label122");

    obj.dataLink101 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink101:setParent(obj.scrollBox1);
    obj.dataLink101:setFields({'graduacao1', 'graduacao2', 'graduacao3', 'graduacao4', 'graduacao5', 'graduacao6', 'graduacao7', 'graduacao8', 'graduacao9', 'graduacao10', 'graduacao11', 'graduacao12', 'graduacao13', 'graduacao14', 'graduacao15', 'graduacao16', 'graduacao17', 'graduacao18', 'graduacao19', 'graduacao20', 'graduacao21', 'graduacao22', 'graduacao23', 'graduacao24', 'graduacao25', 'graduacao26', 'graduacao27', 'graduacao28', 'graduacao29', 'graduacao30', 'graduacao31', 'graduacao32', 'graduacao33', 'graduacao34', 'graduacao35', 'graduacao36', 'graduacao37', 'graduacao38', 'graduacao39', 'graduacao40', 'graduacao41', 'graduacao42', 'graduacao43', 'graduacao44', 'graduacao45', 'graduacao46', 'graduacao47', 'graduacao48', 'graduacao49', 'graduacao50'});
    obj.dataLink101:setName("dataLink101");

    obj._e_event0 = obj.button1:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total1, "+", "");
            						local mod = math.floor(tonumber(sheet.total1) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia1 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event1 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total1 = (tonumber(sheet.atributo1) or 0) + 
            										(tonumber(sheet.graduacao1) or 0) + 
            										(tonumber(sheet.outros1) or 0) + 
            										(tonumber(sheet.penalidade1) or 0) + 
            										(tonumber(sheet.raca1) or 0) + 
            										(tonumber(sheet.itens1) or 0);
            						if sheet.total1 >= 0 then
            						   sheet.total1 = "+" .. sheet.total1;
            						end;
        end, obj);

    obj._e_event2 = obj.dataLink2:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave1);
            						sheet.atributo1 = mod;
        end, obj);

    obj._e_event3 = obj.button2:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total2, "+", "");
            						local mod = math.floor(tonumber(sheet.total2) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia2 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event4 = obj.dataLink3:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total2 = (tonumber(sheet.atributo2) or 0) + 
            										(tonumber(sheet.graduacao2) or 0) + 
            										(tonumber(sheet.outros2) or 0) + 
            										(tonumber(sheet.penalidade2) or 0) + 
            										(tonumber(sheet.raca2) or 0) + 
            										(tonumber(sheet.itens2) or 0);
            						if sheet.total2 >= 0 then
            						   sheet.total2 = "+" .. sheet.total2;
            						end;
        end, obj);

    obj._e_event5 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave2);
            						sheet.atributo2 = mod;
        end, obj);

    obj._e_event6 = obj.button3:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total3, "+", "");
            						local mod = math.floor(tonumber(sheet.total3) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia3 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event7 = obj.dataLink5:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total3 = (tonumber(sheet.atributo3) or 0) + 
            										(tonumber(sheet.graduacao3) or 0) + 
            										(tonumber(sheet.outros3) or 0) + 
            										(tonumber(sheet.penalidade3) or 0) + 
            										(tonumber(sheet.raca3) or 0) + 
            										(tonumber(sheet.itens3) or 0);
            						if sheet.total3 >= 0 then
            						   sheet.total3 = "+" .. sheet.total3;
            						end;
        end, obj);

    obj._e_event8 = obj.dataLink6:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave3);
            						sheet.atributo3 = mod;
        end, obj);

    obj._e_event9 = obj.button4:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total4, "+", "");
            						local mod = math.floor(tonumber(sheet.total4) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia4 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event10 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total4 = (tonumber(sheet.atributo4) or 0) + 
            										(tonumber(sheet.graduacao4) or 0) + 
            										(tonumber(sheet.outros4) or 0) + 
            										(tonumber(sheet.penalidade4) or 0) + 
            										(tonumber(sheet.raca4) or 0) + 
            										(tonumber(sheet.itens4) or 0);
            						if sheet.total4 >= 0 then
            						   sheet.total4 = "+" .. sheet.total4;
            						end;
        end, obj);

    obj._e_event11 = obj.dataLink8:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave4);
            						sheet.atributo4 = mod;
        end, obj);

    obj._e_event12 = obj.button5:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total5, "+", "");
            						local mod = math.floor(tonumber(sheet.total5) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia5 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event13 = obj.dataLink9:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total5 = (tonumber(sheet.atributo5) or 0) + 
            										(tonumber(sheet.graduacao5) or 0) + 
            										(tonumber(sheet.outros5) or 0) + 
            										(tonumber(sheet.penalidade5) or 0) + 
            										(tonumber(sheet.raca5) or 0) + 
            										(tonumber(sheet.itens5) or 0);
            						if sheet.total5 >= 0 then
            						   sheet.total5 = "+" .. sheet.total5;
            						end;
        end, obj);

    obj._e_event14 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave5);
            						sheet.atributo5 = mod;
        end, obj);

    obj._e_event15 = obj.button6:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total6, "+", "");
            						local mod = math.floor(tonumber(sheet.total6) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia6 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event16 = obj.dataLink11:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total6 = (tonumber(sheet.atributo6) or 0) + 
            										(tonumber(sheet.graduacao6) or 0) + 
            										(tonumber(sheet.outros6) or 0) + 
            										(tonumber(sheet.penalidade6) or 0) + 
            										(tonumber(sheet.raca6) or 0) + 
            										(tonumber(sheet.itens6) or 0);
            						if sheet.total6 >= 0 then
            						   sheet.total6 = "+" .. sheet.total6;
            						end;
        end, obj);

    obj._e_event17 = obj.dataLink12:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave6);
            						sheet.atributo6 = mod;
        end, obj);

    obj._e_event18 = obj.button7:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total7, "+", "");
            						local mod = math.floor(tonumber(sheet.total7) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia7 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event19 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total7 = (tonumber(sheet.atributo7) or 0) + 
            										(tonumber(sheet.graduacao7) or 0) + 
            										(tonumber(sheet.outros7) or 0) + 
            										(tonumber(sheet.penalidade7) or 0) + 
            										(tonumber(sheet.raca7) or 0) + 
            										(tonumber(sheet.itens7) or 0);
            						if sheet.total7 >= 0 then
            						   sheet.total7 = "+" .. sheet.total7;
            						end;
        end, obj);

    obj._e_event20 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave7);
            						sheet.atributo7 = mod;
        end, obj);

    obj._e_event21 = obj.button8:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total8, "+", "");
            						local mod = math.floor(tonumber(sheet.total8) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia8 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event22 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total8 = (tonumber(sheet.atributo8) or 0) + 
            										(tonumber(sheet.graduacao8) or 0) + 
            										(tonumber(sheet.outros8) or 0) + 
            										(tonumber(sheet.penalidade8) or 0) + 
            										(tonumber(sheet.raca8) or 0) + 
            										(tonumber(sheet.itens8) or 0);
            						if sheet.total8 >= 0 then
            						   sheet.total8 = "+" .. sheet.total8;
            						end;
        end, obj);

    obj._e_event23 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave8);
            						sheet.atributo8 = mod;
        end, obj);

    obj._e_event24 = obj.button9:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total9, "+", "");
            						local mod = math.floor(tonumber(sheet.total9) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia9 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event25 = obj.dataLink17:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total9 = (tonumber(sheet.atributo9) or 0) + 
            										(tonumber(sheet.graduacao9) or 0) + 
            										(tonumber(sheet.outros9) or 0) + 
            										(tonumber(sheet.penalidade9) or 0) + 
            										(tonumber(sheet.raca9) or 0) + 
            										(tonumber(sheet.itens9) or 0);
            						if sheet.total9 >= 0 then
            						   sheet.total9 = "+" .. sheet.total9;
            						end;
        end, obj);

    obj._e_event26 = obj.dataLink18:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave9);
            						sheet.atributo9 = mod;
        end, obj);

    obj._e_event27 = obj.button10:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total10, "+", "");
            						local mod = math.floor(tonumber(sheet.total10) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia10 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event28 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total10 = (tonumber(sheet.atributo10) or 0) + 
            										(tonumber(sheet.graduacao10) or 0) + 
            										(tonumber(sheet.outros10) or 0) + 
            										(tonumber(sheet.penalidade10) or 0) + 
            										(tonumber(sheet.raca10) or 0) + 
            										(tonumber(sheet.itens10) or 0);
            						if sheet.total10 >= 0 then
            						   sheet.total10 = "+" .. sheet.total10;
            						end;
        end, obj);

    obj._e_event29 = obj.dataLink20:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave10);
            						sheet.atributo10 = mod;
        end, obj);

    obj._e_event30 = obj.button11:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total11, "+", "");
            						local mod = math.floor(tonumber(sheet.total11) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia11 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event31 = obj.dataLink21:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total11 = (tonumber(sheet.atributo11) or 0) + 
            										(tonumber(sheet.graduacao11) or 0) + 
            										(tonumber(sheet.outros11) or 0) + 
            										(tonumber(sheet.penalidade11) or 0) + 
            										(tonumber(sheet.raca11) or 0) + 
            										(tonumber(sheet.itens11) or 0);
            						if sheet.total11 >= 0 then
            						   sheet.total11 = "+" .. sheet.total11;
            						end;
        end, obj);

    obj._e_event32 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave11);
            						sheet.atributo11 = mod;
        end, obj);

    obj._e_event33 = obj.button12:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total12, "+", "");
            						local mod = math.floor(tonumber(sheet.total12) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia12 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event34 = obj.dataLink23:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total12 = (tonumber(sheet.atributo12) or 0) + 
            										(tonumber(sheet.graduacao12) or 0) + 
            										(tonumber(sheet.outros12) or 0) + 
            										(tonumber(sheet.penalidade12) or 0) + 
            										(tonumber(sheet.raca12) or 0) + 
            										(tonumber(sheet.itens12) or 0);
            						if sheet.total12 >= 0 then
            						   sheet.total12 = "+" .. sheet.total12;
            						end;
        end, obj);

    obj._e_event35 = obj.dataLink24:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave12);
            						sheet.atributo12 = mod;
        end, obj);

    obj._e_event36 = obj.button13:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total13, "+", "");
            						local mod = math.floor(tonumber(sheet.total13) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia13 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event37 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total13 = (tonumber(sheet.atributo13) or 0) + 
            										(tonumber(sheet.graduacao13) or 0) + 
            										(tonumber(sheet.outros13) or 0) + 
            										(tonumber(sheet.penalidade13) or 0) + 
            										(tonumber(sheet.raca13) or 0) + 
            										(tonumber(sheet.itens13) or 0);
            						if sheet.total13 >= 0 then
            						   sheet.total13 = "+" .. sheet.total13;
            						end;
        end, obj);

    obj._e_event38 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave13);
            						sheet.atributo13 = mod;
        end, obj);

    obj._e_event39 = obj.button14:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total14, "+", "");
            						local mod = math.floor(tonumber(sheet.total14) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia14 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event40 = obj.dataLink27:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total14 = (tonumber(sheet.atributo14) or 0) + 
            										(tonumber(sheet.graduacao14) or 0) + 
            										(tonumber(sheet.outros14) or 0) + 
            										(tonumber(sheet.penalidade14) or 0) + 
            										(tonumber(sheet.raca14) or 0) + 
            										(tonumber(sheet.itens14) or 0);
            						if sheet.total14 >= 0 then
            						   sheet.total14 = "+" .. sheet.total14;
            						end;
        end, obj);

    obj._e_event41 = obj.dataLink28:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave14);
            						sheet.atributo14 = mod;
        end, obj);

    obj._e_event42 = obj.button15:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total15, "+", "");
            						local mod = math.floor(tonumber(sheet.total15) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia15 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event43 = obj.dataLink29:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total15 = (tonumber(sheet.atributo15) or 0) + 
            										(tonumber(sheet.graduacao15) or 0) + 
            										(tonumber(sheet.outros15) or 0) + 
            										(tonumber(sheet.penalidade15) or 0) + 
            										(tonumber(sheet.raca15) or 0) + 
            										(tonumber(sheet.itens15) or 0);
            						if sheet.total15 >= 0 then
            						   sheet.total15 = "+" .. sheet.total15;
            						end;
        end, obj);

    obj._e_event44 = obj.dataLink30:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave15);
            						sheet.atributo15 = mod;
        end, obj);

    obj._e_event45 = obj.button16:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total16, "+", "");
            						local mod = math.floor(tonumber(sheet.total16) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia16 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event46 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total16 = (tonumber(sheet.atributo16) or 0) + 
            										(tonumber(sheet.graduacao16) or 0) + 
            										(tonumber(sheet.outros16) or 0) + 
            										(tonumber(sheet.penalidade16) or 0) + 
            										(tonumber(sheet.raca16) or 0) + 
            										(tonumber(sheet.itens16) or 0);
            						if sheet.total16 >= 0 then
            						   sheet.total16 = "+" .. sheet.total16;
            						end;
        end, obj);

    obj._e_event47 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave16);
            						sheet.atributo16 = mod;
        end, obj);

    obj._e_event48 = obj.button17:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total17, "+", "");
            						local mod = math.floor(tonumber(sheet.total17) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia17 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event49 = obj.dataLink33:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total17 = (tonumber(sheet.atributo17) or 0) + 
            										(tonumber(sheet.graduacao17) or 0) + 
            										(tonumber(sheet.outros17) or 0) + 
            										(tonumber(sheet.penalidade17) or 0) + 
            										(tonumber(sheet.raca17) or 0) + 
            										(tonumber(sheet.itens17) or 0);
            						if sheet.total17 >= 0 then
            						   sheet.total17 = "+" .. sheet.total17;
            						end;
        end, obj);

    obj._e_event50 = obj.dataLink34:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave17);
            						sheet.atributo17 = mod;
        end, obj);

    obj._e_event51 = obj.button18:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total18, "+", "");
            						local mod = math.floor(tonumber(sheet.total18) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia18 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event52 = obj.dataLink35:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total18 = (tonumber(sheet.atributo18) or 0) + 
            										(tonumber(sheet.graduacao18) or 0) + 
            										(tonumber(sheet.outros18) or 0) + 
            										(tonumber(sheet.penalidade18) or 0) + 
            										(tonumber(sheet.raca18) or 0) + 
            										(tonumber(sheet.itens18) or 0);
            						if sheet.total18 >= 0 then
            						   sheet.total18 = "+" .. sheet.total18;
            						end;
        end, obj);

    obj._e_event53 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave18);
            						sheet.atributo18 = mod;
        end, obj);

    obj._e_event54 = obj.button19:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total19, "+", "");
            						local mod = math.floor(tonumber(sheet.total19) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia19 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event55 = obj.dataLink37:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total19 = (tonumber(sheet.atributo19) or 0) + 
            										(tonumber(sheet.graduacao19) or 0) + 
            										(tonumber(sheet.outros19) or 0) + 
            										(tonumber(sheet.penalidade19) or 0) + 
            										(tonumber(sheet.raca19) or 0) + 
            										(tonumber(sheet.itens19) or 0);
            						if sheet.total19 >= 0 then
            						   sheet.total19 = "+" .. sheet.total19;
            						end;
        end, obj);

    obj._e_event56 = obj.dataLink38:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave19);
            						sheet.atributo19 = mod;
        end, obj);

    obj._e_event57 = obj.button20:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total20, "+", "");
            						local mod = math.floor(tonumber(sheet.total20) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia20 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event58 = obj.dataLink39:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total20 = (tonumber(sheet.atributo20) or 0) + 
            										(tonumber(sheet.graduacao20) or 0) + 
            										(tonumber(sheet.outros20) or 0) + 
            										(tonumber(sheet.penalidade20) or 0) + 
            										(tonumber(sheet.raca20) or 0) + 
            										(tonumber(sheet.itens20) or 0);
            						if sheet.total20 >= 0 then
            						   sheet.total20 = "+" .. sheet.total20;
            						end;
        end, obj);

    obj._e_event59 = obj.dataLink40:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave20);
            						sheet.atributo20 = mod;
        end, obj);

    obj._e_event60 = obj.button21:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total21, "+", "");
            						local mod = math.floor(tonumber(sheet.total21) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia21 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event61 = obj.dataLink41:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total21 = (tonumber(sheet.atributo21) or 0) + 
            										(tonumber(sheet.graduacao21) or 0) + 
            										(tonumber(sheet.outros21) or 0) + 
            										(tonumber(sheet.penalidade21) or 0) + 
            										(tonumber(sheet.raca21) or 0) + 
            										(tonumber(sheet.itens21) or 0);
            						if sheet.total21 >= 0 then
            						   sheet.total21 = "+" .. sheet.total21;
            						end;
        end, obj);

    obj._e_event62 = obj.dataLink42:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave21);
            						sheet.atributo21 = mod;
        end, obj);

    obj._e_event63 = obj.button22:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total22, "+", "");
            						local mod = math.floor(tonumber(sheet.total22) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia22 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event64 = obj.dataLink43:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total22 = (tonumber(sheet.atributo22) or 0) + 
            										(tonumber(sheet.graduacao22) or 0) + 
            										(tonumber(sheet.outros22) or 0) + 
            										(tonumber(sheet.penalidade22) or 0) + 
            										(tonumber(sheet.raca22) or 0) + 
            										(tonumber(sheet.itens22) or 0);
            						if sheet.total22 >= 0 then
            						   sheet.total22 = "+" .. sheet.total22;
            						end;
        end, obj);

    obj._e_event65 = obj.dataLink44:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave22);
            						sheet.atributo22 = mod;
        end, obj);

    obj._e_event66 = obj.button23:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total23, "+", "");
            						local mod = math.floor(tonumber(sheet.total23) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia23 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event67 = obj.dataLink45:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total23 = (tonumber(sheet.atributo23) or 0) + 
            										(tonumber(sheet.graduacao23) or 0) + 
            										(tonumber(sheet.outros23) or 0) + 
            										(tonumber(sheet.penalidade23) or 0) + 
            										(tonumber(sheet.raca23) or 0) + 
            										(tonumber(sheet.itens23) or 0);
            						if sheet.total23 >= 0 then
            						   sheet.total23 = "+" .. sheet.total23;
            						end;
        end, obj);

    obj._e_event68 = obj.dataLink46:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave23);
            						sheet.atributo23 = mod;
        end, obj);

    obj._e_event69 = obj.button24:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total24, "+", "");
            						local mod = math.floor(tonumber(sheet.total24) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia24 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event70 = obj.dataLink47:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total24 = (tonumber(sheet.atributo24) or 0) + 
            										(tonumber(sheet.graduacao24) or 0) + 
            										(tonumber(sheet.outros24) or 0) + 
            										(tonumber(sheet.penalidade24) or 0) + 
            										(tonumber(sheet.raca24) or 0) + 
            										(tonumber(sheet.itens24) or 0);
            						if sheet.total24 >= 0 then
            						   sheet.total24 = "+" .. sheet.total24;
            						end;
        end, obj);

    obj._e_event71 = obj.dataLink48:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave24);
            						sheet.atributo24 = mod;
        end, obj);

    obj._e_event72 = obj.button25:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total25, "+", "");
            						local mod = math.floor(tonumber(sheet.total25) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia25 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event73 = obj.dataLink49:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total25 = (tonumber(sheet.atributo25) or 0) + 
            										(tonumber(sheet.graduacao25) or 0) + 
            										(tonumber(sheet.outros25) or 0) + 
            										(tonumber(sheet.penalidade25) or 0) + 
            										(tonumber(sheet.raca25) or 0) + 
            										(tonumber(sheet.itens25) or 0);
            						if sheet.total25 >= 0 then
            						   sheet.total25 = "+" .. sheet.total25;
            						end;
        end, obj);

    obj._e_event74 = obj.dataLink50:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave25);
            						sheet.atributo25 = mod;
        end, obj);

    obj._e_event75 = obj.button26:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total26, "+", "");
            						local mod = math.floor(tonumber(sheet.total26) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia26 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event76 = obj.dataLink51:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total26 = (tonumber(sheet.atributo26) or 0) + 
            										(tonumber(sheet.graduacao26) or 0) + 
            										(tonumber(sheet.outros26) or 0) + 
            										(tonumber(sheet.penalidade26) or 0) + 
            										(tonumber(sheet.raca26) or 0) + 
            										(tonumber(sheet.itens26) or 0);
            						if sheet.total26 >= 0 then
            						   sheet.total26 = "+" .. sheet.total26;
            						end;
        end, obj);

    obj._e_event77 = obj.dataLink52:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave26);
            						sheet.atributo26 = mod;
        end, obj);

    obj._e_event78 = obj.button27:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total27, "+", "");
            						local mod = math.floor(tonumber(sheet.total27) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia27 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event79 = obj.dataLink53:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total27 = (tonumber(sheet.atributo27) or 0) + 
            										(tonumber(sheet.graduacao27) or 0) + 
            										(tonumber(sheet.outros27) or 0) + 
            										(tonumber(sheet.penalidade27) or 0) + 
            										(tonumber(sheet.raca27) or 0) + 
            										(tonumber(sheet.itens27) or 0);
            						if sheet.total27 >= 0 then
            						   sheet.total27 = "+" .. sheet.total27;
            						end;
        end, obj);

    obj._e_event80 = obj.dataLink54:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave27);
            						sheet.atributo27 = mod;
        end, obj);

    obj._e_event81 = obj.button28:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total28, "+", "");
            						local mod = math.floor(tonumber(sheet.total28) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia28 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event82 = obj.dataLink55:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total28 = (tonumber(sheet.atributo28) or 0) + 
            										(tonumber(sheet.graduacao28) or 0) + 
            										(tonumber(sheet.outros28) or 0) + 
            										(tonumber(sheet.penalidade28) or 0) + 
            										(tonumber(sheet.raca28) or 0) + 
            										(tonumber(sheet.itens28) or 0);
            						if sheet.total28 >= 0 then
            						   sheet.total28 = "+" .. sheet.total28;
            						end;
        end, obj);

    obj._e_event83 = obj.dataLink56:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave28);
            						sheet.atributo28 = mod;
        end, obj);

    obj._e_event84 = obj.button29:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total29, "+", "");
            						local mod = math.floor(tonumber(sheet.total29) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia29 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event85 = obj.dataLink57:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total29 = (tonumber(sheet.atributo29) or 0) + 
            										(tonumber(sheet.graduacao29) or 0) + 
            										(tonumber(sheet.outros29) or 0) + 
            										(tonumber(sheet.penalidade29) or 0) + 
            										(tonumber(sheet.raca29) or 0) + 
            										(tonumber(sheet.itens29) or 0);
            						if sheet.total29 >= 0 then
            						   sheet.total29 = "+" .. sheet.total29;
            						end;
        end, obj);

    obj._e_event86 = obj.dataLink58:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave29);
            						sheet.atributo29 = mod;
        end, obj);

    obj._e_event87 = obj.button30:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total30, "+", "");
            						local mod = math.floor(tonumber(sheet.total30) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia30 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event88 = obj.dataLink59:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total30 = (tonumber(sheet.atributo30) or 0) + 
            										(tonumber(sheet.graduacao30) or 0) + 
            										(tonumber(sheet.outros30) or 0) + 
            										(tonumber(sheet.penalidade30) or 0) + 
            										(tonumber(sheet.raca30) or 0) + 
            										(tonumber(sheet.itens30) or 0);
            						if sheet.total30 >= 0 then
            						   sheet.total30 = "+" .. sheet.total30;
            						end;
        end, obj);

    obj._e_event89 = obj.dataLink60:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave30);
            						sheet.atributo30 = mod;
        end, obj);

    obj._e_event90 = obj.button31:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total31, "+", "");
            						local mod = math.floor(tonumber(sheet.total31) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia31 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event91 = obj.dataLink61:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total31 = (tonumber(sheet.atributo31) or 0) + 
            										(tonumber(sheet.graduacao31) or 0) + 
            										(tonumber(sheet.outros31) or 0) + 
            										(tonumber(sheet.penalidade31) or 0) + 
            										(tonumber(sheet.raca31) or 0) + 
            										(tonumber(sheet.itens31) or 0);
            						if sheet.total31 >= 0 then
            						   sheet.total31 = "+" .. sheet.total31;
            						end;
        end, obj);

    obj._e_event92 = obj.dataLink62:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave31);
            						sheet.atributo31 = mod;
        end, obj);

    obj._e_event93 = obj.button32:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total32, "+", "");
            						local mod = math.floor(tonumber(sheet.total32) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia32 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event94 = obj.dataLink63:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total32 = (tonumber(sheet.atributo32) or 0) + 
            										(tonumber(sheet.graduacao32) or 0) + 
            										(tonumber(sheet.outros32) or 0) + 
            										(tonumber(sheet.penalidade32) or 0) + 
            										(tonumber(sheet.raca32) or 0) + 
            										(tonumber(sheet.itens32) or 0);
            						if sheet.total32 >= 0 then
            						   sheet.total32 = "+" .. sheet.total32;
            						end;
        end, obj);

    obj._e_event95 = obj.dataLink64:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave32);
            						sheet.atributo32 = mod;
        end, obj);

    obj._e_event96 = obj.button33:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total33, "+", "");
            						local mod = math.floor(tonumber(sheet.total33) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia33 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event97 = obj.dataLink65:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total33 = (tonumber(sheet.atributo33) or 0) + 
            										(tonumber(sheet.graduacao33) or 0) + 
            										(tonumber(sheet.outros33) or 0) + 
            										(tonumber(sheet.penalidade33) or 0) + 
            										(tonumber(sheet.raca33) or 0) + 
            										(tonumber(sheet.itens33) or 0);
            						if sheet.total33 >= 0 then
            						   sheet.total33 = "+" .. sheet.total33;
            						end;
        end, obj);

    obj._e_event98 = obj.dataLink66:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave33);
            						sheet.atributo33 = mod;
        end, obj);

    obj._e_event99 = obj.button34:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total34, "+", "");
            						local mod = math.floor(tonumber(sheet.total34) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia34 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event100 = obj.dataLink67:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total34 = (tonumber(sheet.atributo34) or 0) + 
            										(tonumber(sheet.graduacao34) or 0) + 
            										(tonumber(sheet.outros34) or 0) + 
            										(tonumber(sheet.penalidade34) or 0) + 
            										(tonumber(sheet.raca34) or 0) + 
            										(tonumber(sheet.itens34) or 0);
            						if sheet.total34 >= 0 then
            						   sheet.total34 = "+" .. sheet.total34;
            						end;
        end, obj);

    obj._e_event101 = obj.dataLink68:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave34);
            						sheet.atributo34 = mod;
        end, obj);

    obj._e_event102 = obj.button35:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total35, "+", "");
            						local mod = math.floor(tonumber(sheet.total35) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia35 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event103 = obj.dataLink69:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total35 = (tonumber(sheet.atributo35) or 0) + 
            										(tonumber(sheet.graduacao35) or 0) + 
            										(tonumber(sheet.outros35) or 0) + 
            										(tonumber(sheet.penalidade35) or 0) + 
            										(tonumber(sheet.raca35) or 0) + 
            										(tonumber(sheet.itens35) or 0);
            						if sheet.total35 >= 0 then
            						   sheet.total35 = "+" .. sheet.total35;
            						end;
        end, obj);

    obj._e_event104 = obj.dataLink70:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave35);
            						sheet.atributo35 = mod;
        end, obj);

    obj._e_event105 = obj.button36:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total36, "+", "");
            						local mod = math.floor(tonumber(sheet.total36) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia36 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event106 = obj.dataLink71:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total36 = (tonumber(sheet.atributo36) or 0) + 
            										(tonumber(sheet.graduacao36) or 0) + 
            										(tonumber(sheet.outros36) or 0) + 
            										(tonumber(sheet.penalidade36) or 0) + 
            										(tonumber(sheet.raca36) or 0) + 
            										(tonumber(sheet.itens36) or 0);
            						if sheet.total36 >= 0 then
            						   sheet.total36 = "+" .. sheet.total36;
            						end;
        end, obj);

    obj._e_event107 = obj.dataLink72:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave36);
            						sheet.atributo36 = mod;
        end, obj);

    obj._e_event108 = obj.button37:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total37, "+", "");
            						local mod = math.floor(tonumber(sheet.total37) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia37 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event109 = obj.dataLink73:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total37 = (tonumber(sheet.atributo37) or 0) + 
            										(tonumber(sheet.graduacao37) or 0) + 
            										(tonumber(sheet.outros37) or 0) + 
            										(tonumber(sheet.penalidade37) or 0) + 
            										(tonumber(sheet.raca37) or 0) + 
            										(tonumber(sheet.itens37) or 0);
            						if sheet.total37 >= 0 then
            						   sheet.total37 = "+" .. sheet.total37;
            						end;
        end, obj);

    obj._e_event110 = obj.dataLink74:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave37);
            						sheet.atributo37 = mod;
        end, obj);

    obj._e_event111 = obj.button38:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total38, "+", "");
            						local mod = math.floor(tonumber(sheet.total38) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia38 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event112 = obj.dataLink75:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total38 = (tonumber(sheet.atributo38) or 0) + 
            										(tonumber(sheet.graduacao38) or 0) + 
            										(tonumber(sheet.outros38) or 0) + 
            										(tonumber(sheet.penalidade38) or 0) + 
            										(tonumber(sheet.raca38) or 0) + 
            										(tonumber(sheet.itens38) or 0);
            						if sheet.total38 >= 0 then
            						   sheet.total38 = "+" .. sheet.total38;
            						end;
        end, obj);

    obj._e_event113 = obj.dataLink76:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave38);
            						sheet.atributo38 = mod;
        end, obj);

    obj._e_event114 = obj.button39:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total39, "+", "");
            						local mod = math.floor(tonumber(sheet.total39) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia39 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event115 = obj.dataLink77:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total39 = (tonumber(sheet.atributo39) or 0) + 
            										(tonumber(sheet.graduacao39) or 0) + 
            										(tonumber(sheet.outros39) or 0) + 
            										(tonumber(sheet.penalidade39) or 0) + 
            										(tonumber(sheet.raca39) or 0) + 
            										(tonumber(sheet.itens39) or 0);
            						if sheet.total39 >= 0 then
            						   sheet.total39 = "+" .. sheet.total39;
            						end;
        end, obj);

    obj._e_event116 = obj.dataLink78:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave39);
            						sheet.atributo39 = mod;
        end, obj);

    obj._e_event117 = obj.button40:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total40, "+", "");
            						local mod = math.floor(tonumber(sheet.total40) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia40 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event118 = obj.dataLink79:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total40 = (tonumber(sheet.atributo40) or 0) + 
            										(tonumber(sheet.graduacao40) or 0) + 
            										(tonumber(sheet.outros40) or 0) + 
            										(tonumber(sheet.penalidade40) or 0) + 
            										(tonumber(sheet.raca40) or 0) + 
            										(tonumber(sheet.itens40) or 0);
            						if sheet.total40 >= 0 then
            						   sheet.total40 = "+" .. sheet.total40;
            						end;
        end, obj);

    obj._e_event119 = obj.dataLink80:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave40);
            						sheet.atributo40 = mod;
        end, obj);

    obj._e_event120 = obj.button41:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total41, "+", "");
            						local mod = math.floor(tonumber(sheet.total41) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia41 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event121 = obj.dataLink81:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total41 = (tonumber(sheet.atributo41) or 0) + 
            										(tonumber(sheet.graduacao41) or 0) + 
            										(tonumber(sheet.outros41) or 0) + 
            										(tonumber(sheet.penalidade41) or 0) + 
            										(tonumber(sheet.raca41) or 0) + 
            										(tonumber(sheet.itens41) or 0);
            						if sheet.total41 >= 0 then
            						   sheet.total41 = "+" .. sheet.total41;
            						end;
        end, obj);

    obj._e_event122 = obj.dataLink82:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave41);
            						sheet.atributo41 = mod;
        end, obj);

    obj._e_event123 = obj.button42:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total42, "+", "");
            						local mod = math.floor(tonumber(sheet.total42) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia42 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event124 = obj.dataLink83:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total42 = (tonumber(sheet.atributo42) or 0) + 
            										(tonumber(sheet.graduacao42) or 0) + 
            										(tonumber(sheet.outros42) or 0) + 
            										(tonumber(sheet.penalidade42) or 0) + 
            										(tonumber(sheet.raca42) or 0) + 
            										(tonumber(sheet.itens42) or 0);
            						if sheet.total42 >= 0 then
            						   sheet.total42 = "+" .. sheet.total42;
            						end;
        end, obj);

    obj._e_event125 = obj.dataLink84:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave42);
            						sheet.atributo42 = mod;
        end, obj);

    obj._e_event126 = obj.button43:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total43, "+", "");
            						local mod = math.floor(tonumber(sheet.total43) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia43 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event127 = obj.dataLink85:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total43 = (tonumber(sheet.atributo43) or 0) + 
            										(tonumber(sheet.graduacao43) or 0) + 
            										(tonumber(sheet.outros43) or 0) + 
            										(tonumber(sheet.penalidade43) or 0) + 
            										(tonumber(sheet.raca43) or 0) + 
            										(tonumber(sheet.itens43) or 0);
            						if sheet.total43 >= 0 then
            						   sheet.total43 = "+" .. sheet.total43;
            						end;
        end, obj);

    obj._e_event128 = obj.dataLink86:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave43);
            						sheet.atributo43 = mod;
        end, obj);

    obj._e_event129 = obj.button44:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total44, "+", "");
            						local mod = math.floor(tonumber(sheet.total44) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia44 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event130 = obj.dataLink87:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total44 = (tonumber(sheet.atributo44) or 0) + 
            										(tonumber(sheet.graduacao44) or 0) + 
            										(tonumber(sheet.outros44) or 0) + 
            										(tonumber(sheet.penalidade44) or 0) + 
            										(tonumber(sheet.raca44) or 0) + 
            										(tonumber(sheet.itens44) or 0);
            						if sheet.total44 >= 0 then
            						   sheet.total44 = "+" .. sheet.total44;
            						end;
        end, obj);

    obj._e_event131 = obj.dataLink88:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave44);
            						sheet.atributo44 = mod;
        end, obj);

    obj._e_event132 = obj.button45:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total45, "+", "");
            						local mod = math.floor(tonumber(sheet.total45) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia45 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event133 = obj.dataLink89:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total45 = (tonumber(sheet.atributo45) or 0) + 
            										(tonumber(sheet.graduacao45) or 0) + 
            										(tonumber(sheet.outros45) or 0) + 
            										(tonumber(sheet.penalidade45) or 0) + 
            										(tonumber(sheet.raca45) or 0) + 
            										(tonumber(sheet.itens45) or 0);
            						if sheet.total45 >= 0 then
            						   sheet.total45 = "+" .. sheet.total45;
            						end;
        end, obj);

    obj._e_event134 = obj.dataLink90:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave45);
            						sheet.atributo45 = mod;
        end, obj);

    obj._e_event135 = obj.button46:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total46, "+", "");
            						local mod = math.floor(tonumber(sheet.total46) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia46 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event136 = obj.dataLink91:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total46 = (tonumber(sheet.atributo46) or 0) + 
            										(tonumber(sheet.graduacao46) or 0) + 
            										(tonumber(sheet.outros46) or 0) + 
            										(tonumber(sheet.penalidade46) or 0) + 
            										(tonumber(sheet.raca46) or 0) + 
            										(tonumber(sheet.itens46) or 0);
            						if sheet.total46 >= 0 then
            						   sheet.total46 = "+" .. sheet.total46;
            						end;
        end, obj);

    obj._e_event137 = obj.dataLink92:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave46);
            						sheet.atributo46 = mod;
        end, obj);

    obj._e_event138 = obj.button47:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total47, "+", "");
            						local mod = math.floor(tonumber(sheet.total47) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia47 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event139 = obj.dataLink93:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total47 = (tonumber(sheet.atributo47) or 0) + 
            										(tonumber(sheet.graduacao47) or 0) + 
            										(tonumber(sheet.outros47) or 0) + 
            										(tonumber(sheet.penalidade47) or 0) + 
            										(tonumber(sheet.raca47) or 0) + 
            										(tonumber(sheet.itens47) or 0);
            						if sheet.total47 >= 0 then
            						   sheet.total47 = "+" .. sheet.total47;
            						end;
        end, obj);

    obj._e_event140 = obj.dataLink94:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave47);
            						sheet.atributo47 = mod;
        end, obj);

    obj._e_event141 = obj.button48:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total48, "+", "");
            						local mod = math.floor(tonumber(sheet.total48) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia48 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event142 = obj.dataLink95:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total48 = (tonumber(sheet.atributo48) or 0) + 
            										(tonumber(sheet.graduacao48) or 0) + 
            										(tonumber(sheet.outros48) or 0) + 
            										(tonumber(sheet.penalidade48) or 0) + 
            										(tonumber(sheet.raca48) or 0) + 
            										(tonumber(sheet.itens48) or 0);
            						if sheet.total48 >= 0 then
            						   sheet.total48 = "+" .. sheet.total48;
            						end;
        end, obj);

    obj._e_event143 = obj.dataLink96:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave48);
            						sheet.atributo48 = mod;
        end, obj);

    obj._e_event144 = obj.button49:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total49, "+", "");
            						local mod = math.floor(tonumber(sheet.total49) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia49 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event145 = obj.dataLink97:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total49 = (tonumber(sheet.atributo49) or 0) + 
            										(tonumber(sheet.graduacao49) or 0) + 
            										(tonumber(sheet.outros49) or 0) + 
            										(tonumber(sheet.penalidade49) or 0) + 
            										(tonumber(sheet.raca49) or 0) + 
            										(tonumber(sheet.itens49) or 0);
            						if sheet.total49 >= 0 then
            						   sheet.total49 = "+" .. sheet.total49;
            						end;
        end, obj);

    obj._e_event146 = obj.dataLink98:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave49);
            						sheet.atributo49 = mod;
        end, obj);

    obj._e_event147 = obj.button50:addEventListener("onClick",
        function (self)
            local mesaDoPersonagem = rrpg.getMesaDe(sheet);
            						
            						local value = string.gsub(sheet.total50, "+", "");
            						local mod = math.floor(tonumber(sheet.total50) or 0) + (tonumber(sheet.buffPericia) or 0);
            						local rolagem = rrpg.interpretarRolagem("1d20 + " .. mod);
            						mesaDoPersonagem.activeChat:rolarDados(rolagem, "Teste de " .. (sheet.pericia50 or "Pericia") .. " de " .. (sheet.nome or "PONHA UM NOME NO PERSONAGEM"));
        end, obj);

    obj._e_event148 = obj.dataLink99:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            sheet.total50 = (tonumber(sheet.atributo50) or 0) + 
            										(tonumber(sheet.graduacao50) or 0) + 
            										(tonumber(sheet.outros50) or 0) + 
            										(tonumber(sheet.penalidade50) or 0) + 
            										(tonumber(sheet.raca50) or 0) + 
            										(tonumber(sheet.itens50) or 0);
            						if sheet.total50 >= 0 then
            						   sheet.total50 = "+" .. sheet.total50;
            						end;
        end, obj);

    obj._e_event149 = obj.dataLink100:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = getAtributo(sheet.chave50);
            						sheet.atributo50 = mod;
        end, obj);

    obj._e_event150 = obj.button51:addEventListener("onClick",
        function (self)
            reset();
        end, obj);

    obj._e_event151 = obj.button52:addEventListener("onClick",
        function (self)
            organize();
        end, obj);

    obj._e_event152 = obj.dataLink101:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            local mod = 0;
            					if sheet.per1 then
            						mod = mod + (tonumber(sheet.graduacao1) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao1) or 0) * 2);
            					end;
            					if sheet.per2 then
            						mod = mod + (tonumber(sheet.graduacao2) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao2) or 0) * 2);
            					end;
            					if sheet.per3 then
            						mod = mod + (tonumber(sheet.graduacao3) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao3) or 0) * 2);
            					end;
            					if sheet.per4 then
            						mod = mod + (tonumber(sheet.graduacao4) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao4) or 0) * 2);
            					end;
            					if sheet.per5 then
            						mod = mod + (tonumber(sheet.graduacao5) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao5) or 0) * 2);
            					end;
            					if sheet.per6 then
            						mod = mod + (tonumber(sheet.graduacao6) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao6) or 0) * 2);
            					end;
            					if sheet.per7 then
            						mod = mod + (tonumber(sheet.graduacao7) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao7) or 0) * 2);
            					end;
            					if sheet.per8 then
            						mod = mod + (tonumber(sheet.graduacao8) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao8) or 0) * 2);
            					end;
            					if sheet.per9 then
            						mod = mod + (tonumber(sheet.graduacao9) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao9) or 0) * 2);
            					end;
            					if sheet.per10 then
            						mod = mod + (tonumber(sheet.graduacao10) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao10) or 0) * 2);
            					end;
            					if sheet.per11 then
            						mod = mod + (tonumber(sheet.graduacao11) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao11) or 0) * 2);
            					end;
            					if sheet.per12 then
            						mod = mod + (tonumber(sheet.graduacao12) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao12) or 0) * 2);
            					end;
            					if sheet.per13 then
            						mod = mod + (tonumber(sheet.graduacao13) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao13) or 0) * 2);
            					end;
            					if sheet.per14 then
            						mod = mod + (tonumber(sheet.graduacao14) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao14) or 0) * 2);
            					end;
            					if sheet.per15 then
            						mod = mod + (tonumber(sheet.graduacao15) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao15) or 0) * 2);
            					end;
            					if sheet.per16 then
            						mod = mod + (tonumber(sheet.graduacao16) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao16) or 0) * 2);
            					end;
            					if sheet.per17 then
            						mod = mod + (tonumber(sheet.graduacao17) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao17) or 0) * 2);
            					end;
            					if sheet.per18 then
            						mod = mod + (tonumber(sheet.graduacao18) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao18) or 0) * 2);
            					end;
            					if sheet.per19 then
            						mod = mod + (tonumber(sheet.graduacao19) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao19) or 0) * 2);
            					end;
            					if sheet.per20 then
            						mod = mod + (tonumber(sheet.graduacao20) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao20) or 0) * 2);
            					end;
            					if sheet.per21 then
            						mod = mod + (tonumber(sheet.graduacao21) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao21) or 0) * 2);
            					end;
            					if sheet.per22 then
            						mod = mod + (tonumber(sheet.graduacao22) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao22) or 0) * 2);
            					end;
            					if sheet.per23 then
            						mod = mod + (tonumber(sheet.graduacao23) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao23) or 0) * 2);
            					end;
            					if sheet.per24 then
            						mod = mod + (tonumber(sheet.graduacao24) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao24) or 0) * 2);
            					end;
            					if sheet.per25 then
            						mod = mod + (tonumber(sheet.graduacao25) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao25) or 0) * 2);
            					end;
            					if sheet.per26 then
            						mod = mod + (tonumber(sheet.graduacao26) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao26) or 0) * 2);
            					end;
            					if sheet.per27 then
            						mod = mod + (tonumber(sheet.graduacao27) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao27) or 0) * 2);
            					end;
            					if sheet.per28 then
            						mod = mod + (tonumber(sheet.graduacao28) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao28) or 0) * 2);
            					end;
            					if sheet.per29 then
            						mod = mod + (tonumber(sheet.graduacao29) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao29) or 0) * 2);
            					end;
            					if sheet.per30 then
            						mod = mod + (tonumber(sheet.graduacao30) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao30) or 0) * 2);
            					end;
            					if sheet.per31 then
            						mod = mod + (tonumber(sheet.graduacao31) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao31) or 0) * 2);
            					end;
            					if sheet.per32 then
            						mod = mod + (tonumber(sheet.graduacao32) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao32) or 0) * 2);
            					end;
            					if sheet.per33 then
            						mod = mod + (tonumber(sheet.graduacao33) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao33) or 0) * 2);
            					end;
            					if sheet.per34 then
            						mod = mod + (tonumber(sheet.graduacao34) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao34) or 0) * 2);
            					end;
            					if sheet.per35 then
            						mod = mod + (tonumber(sheet.graduacao35) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao35) or 0) * 2);
            					end;
            					if sheet.per36 then
            						mod = mod + (tonumber(sheet.graduacao36) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao36) or 0) * 2);
            					end;
            					if sheet.per37 then
            						mod = mod + (tonumber(sheet.graduacao37) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao37) or 0) * 2);
            					end;
            					if sheet.per38 then
            						mod = mod + (tonumber(sheet.graduacao38) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao38) or 0) * 2);
            					end;
            					if sheet.per39 then
            						mod = mod + (tonumber(sheet.graduacao39) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao39) or 0) * 2);
            					end;
            					if sheet.per40 then
            						mod = mod + (tonumber(sheet.graduacao40) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao40) or 0) * 2);
            					end;
            					if sheet.per41 then
            						mod = mod + (tonumber(sheet.graduacao41) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao41) or 0) * 2);
            					end;
            					if sheet.per42 then
            						mod = mod + (tonumber(sheet.graduacao42) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao42) or 0) * 2);
            					end;
            					if sheet.per43 then
            						mod = mod + (tonumber(sheet.graduacao43) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao43) or 0) * 2);
            					end;
            					if sheet.per44 then
            						mod = mod + (tonumber(sheet.graduacao44) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao44) or 0) * 2);
            					end;
            					if sheet.per45 then
            						mod = mod + (tonumber(sheet.graduacao45) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao45) or 0) * 2);
            					end;
            					if sheet.per46 then
            						mod = mod + (tonumber(sheet.graduacao46) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao46) or 0) * 2);
            					end;
            					if sheet.per47 then
            						mod = mod + (tonumber(sheet.graduacao47) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao47) or 0) * 2);
            					end;
            					if sheet.per48 then
            						mod = mod + (tonumber(sheet.graduacao48) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao48) or 0) * 2);
            					end;
            					if sheet.per49 then
            						mod = mod + (tonumber(sheet.graduacao49) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao49) or 0) * 2);
            					end;
            					if sheet.per50 then
            						mod = mod + (tonumber(sheet.graduacao50) or 0);
            					else
            						mod = mod + ((tonumber(sheet.graduacao50) or 0) * 2);
            					end;
            					if sheet.somaGraduacoes~=mod then
            						sheet.somaGraduacoes = mod;
            					end;
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event152);
        __o_rrpgObjs.removeEventListenerById(self._e_event151);
        __o_rrpgObjs.removeEventListenerById(self._e_event150);
        __o_rrpgObjs.removeEventListenerById(self._e_event149);
        __o_rrpgObjs.removeEventListenerById(self._e_event148);
        __o_rrpgObjs.removeEventListenerById(self._e_event147);
        __o_rrpgObjs.removeEventListenerById(self._e_event146);
        __o_rrpgObjs.removeEventListenerById(self._e_event145);
        __o_rrpgObjs.removeEventListenerById(self._e_event144);
        __o_rrpgObjs.removeEventListenerById(self._e_event143);
        __o_rrpgObjs.removeEventListenerById(self._e_event142);
        __o_rrpgObjs.removeEventListenerById(self._e_event141);
        __o_rrpgObjs.removeEventListenerById(self._e_event140);
        __o_rrpgObjs.removeEventListenerById(self._e_event139);
        __o_rrpgObjs.removeEventListenerById(self._e_event138);
        __o_rrpgObjs.removeEventListenerById(self._e_event137);
        __o_rrpgObjs.removeEventListenerById(self._e_event136);
        __o_rrpgObjs.removeEventListenerById(self._e_event135);
        __o_rrpgObjs.removeEventListenerById(self._e_event134);
        __o_rrpgObjs.removeEventListenerById(self._e_event133);
        __o_rrpgObjs.removeEventListenerById(self._e_event132);
        __o_rrpgObjs.removeEventListenerById(self._e_event131);
        __o_rrpgObjs.removeEventListenerById(self._e_event130);
        __o_rrpgObjs.removeEventListenerById(self._e_event129);
        __o_rrpgObjs.removeEventListenerById(self._e_event128);
        __o_rrpgObjs.removeEventListenerById(self._e_event127);
        __o_rrpgObjs.removeEventListenerById(self._e_event126);
        __o_rrpgObjs.removeEventListenerById(self._e_event125);
        __o_rrpgObjs.removeEventListenerById(self._e_event124);
        __o_rrpgObjs.removeEventListenerById(self._e_event123);
        __o_rrpgObjs.removeEventListenerById(self._e_event122);
        __o_rrpgObjs.removeEventListenerById(self._e_event121);
        __o_rrpgObjs.removeEventListenerById(self._e_event120);
        __o_rrpgObjs.removeEventListenerById(self._e_event119);
        __o_rrpgObjs.removeEventListenerById(self._e_event118);
        __o_rrpgObjs.removeEventListenerById(self._e_event117);
        __o_rrpgObjs.removeEventListenerById(self._e_event116);
        __o_rrpgObjs.removeEventListenerById(self._e_event115);
        __o_rrpgObjs.removeEventListenerById(self._e_event114);
        __o_rrpgObjs.removeEventListenerById(self._e_event113);
        __o_rrpgObjs.removeEventListenerById(self._e_event112);
        __o_rrpgObjs.removeEventListenerById(self._e_event111);
        __o_rrpgObjs.removeEventListenerById(self._e_event110);
        __o_rrpgObjs.removeEventListenerById(self._e_event109);
        __o_rrpgObjs.removeEventListenerById(self._e_event108);
        __o_rrpgObjs.removeEventListenerById(self._e_event107);
        __o_rrpgObjs.removeEventListenerById(self._e_event106);
        __o_rrpgObjs.removeEventListenerById(self._e_event105);
        __o_rrpgObjs.removeEventListenerById(self._e_event104);
        __o_rrpgObjs.removeEventListenerById(self._e_event103);
        __o_rrpgObjs.removeEventListenerById(self._e_event102);
        __o_rrpgObjs.removeEventListenerById(self._e_event101);
        __o_rrpgObjs.removeEventListenerById(self._e_event100);
        __o_rrpgObjs.removeEventListenerById(self._e_event99);
        __o_rrpgObjs.removeEventListenerById(self._e_event98);
        __o_rrpgObjs.removeEventListenerById(self._e_event97);
        __o_rrpgObjs.removeEventListenerById(self._e_event96);
        __o_rrpgObjs.removeEventListenerById(self._e_event95);
        __o_rrpgObjs.removeEventListenerById(self._e_event94);
        __o_rrpgObjs.removeEventListenerById(self._e_event93);
        __o_rrpgObjs.removeEventListenerById(self._e_event92);
        __o_rrpgObjs.removeEventListenerById(self._e_event91);
        __o_rrpgObjs.removeEventListenerById(self._e_event90);
        __o_rrpgObjs.removeEventListenerById(self._e_event89);
        __o_rrpgObjs.removeEventListenerById(self._e_event88);
        __o_rrpgObjs.removeEventListenerById(self._e_event87);
        __o_rrpgObjs.removeEventListenerById(self._e_event86);
        __o_rrpgObjs.removeEventListenerById(self._e_event85);
        __o_rrpgObjs.removeEventListenerById(self._e_event84);
        __o_rrpgObjs.removeEventListenerById(self._e_event83);
        __o_rrpgObjs.removeEventListenerById(self._e_event82);
        __o_rrpgObjs.removeEventListenerById(self._e_event81);
        __o_rrpgObjs.removeEventListenerById(self._e_event80);
        __o_rrpgObjs.removeEventListenerById(self._e_event79);
        __o_rrpgObjs.removeEventListenerById(self._e_event78);
        __o_rrpgObjs.removeEventListenerById(self._e_event77);
        __o_rrpgObjs.removeEventListenerById(self._e_event76);
        __o_rrpgObjs.removeEventListenerById(self._e_event75);
        __o_rrpgObjs.removeEventListenerById(self._e_event74);
        __o_rrpgObjs.removeEventListenerById(self._e_event73);
        __o_rrpgObjs.removeEventListenerById(self._e_event72);
        __o_rrpgObjs.removeEventListenerById(self._e_event71);
        __o_rrpgObjs.removeEventListenerById(self._e_event70);
        __o_rrpgObjs.removeEventListenerById(self._e_event69);
        __o_rrpgObjs.removeEventListenerById(self._e_event68);
        __o_rrpgObjs.removeEventListenerById(self._e_event67);
        __o_rrpgObjs.removeEventListenerById(self._e_event66);
        __o_rrpgObjs.removeEventListenerById(self._e_event65);
        __o_rrpgObjs.removeEventListenerById(self._e_event64);
        __o_rrpgObjs.removeEventListenerById(self._e_event63);
        __o_rrpgObjs.removeEventListenerById(self._e_event62);
        __o_rrpgObjs.removeEventListenerById(self._e_event61);
        __o_rrpgObjs.removeEventListenerById(self._e_event60);
        __o_rrpgObjs.removeEventListenerById(self._e_event59);
        __o_rrpgObjs.removeEventListenerById(self._e_event58);
        __o_rrpgObjs.removeEventListenerById(self._e_event57);
        __o_rrpgObjs.removeEventListenerById(self._e_event56);
        __o_rrpgObjs.removeEventListenerById(self._e_event55);
        __o_rrpgObjs.removeEventListenerById(self._e_event54);
        __o_rrpgObjs.removeEventListenerById(self._e_event53);
        __o_rrpgObjs.removeEventListenerById(self._e_event52);
        __o_rrpgObjs.removeEventListenerById(self._e_event51);
        __o_rrpgObjs.removeEventListenerById(self._e_event50);
        __o_rrpgObjs.removeEventListenerById(self._e_event49);
        __o_rrpgObjs.removeEventListenerById(self._e_event48);
        __o_rrpgObjs.removeEventListenerById(self._e_event47);
        __o_rrpgObjs.removeEventListenerById(self._e_event46);
        __o_rrpgObjs.removeEventListenerById(self._e_event45);
        __o_rrpgObjs.removeEventListenerById(self._e_event44);
        __o_rrpgObjs.removeEventListenerById(self._e_event43);
        __o_rrpgObjs.removeEventListenerById(self._e_event42);
        __o_rrpgObjs.removeEventListenerById(self._e_event41);
        __o_rrpgObjs.removeEventListenerById(self._e_event40);
        __o_rrpgObjs.removeEventListenerById(self._e_event39);
        __o_rrpgObjs.removeEventListenerById(self._e_event38);
        __o_rrpgObjs.removeEventListenerById(self._e_event37);
        __o_rrpgObjs.removeEventListenerById(self._e_event36);
        __o_rrpgObjs.removeEventListenerById(self._e_event35);
        __o_rrpgObjs.removeEventListenerById(self._e_event34);
        __o_rrpgObjs.removeEventListenerById(self._e_event33);
        __o_rrpgObjs.removeEventListenerById(self._e_event32);
        __o_rrpgObjs.removeEventListenerById(self._e_event31);
        __o_rrpgObjs.removeEventListenerById(self._e_event30);
        __o_rrpgObjs.removeEventListenerById(self._e_event29);
        __o_rrpgObjs.removeEventListenerById(self._e_event28);
        __o_rrpgObjs.removeEventListenerById(self._e_event27);
        __o_rrpgObjs.removeEventListenerById(self._e_event26);
        __o_rrpgObjs.removeEventListenerById(self._e_event25);
        __o_rrpgObjs.removeEventListenerById(self._e_event24);
        __o_rrpgObjs.removeEventListenerById(self._e_event23);
        __o_rrpgObjs.removeEventListenerById(self._e_event22);
        __o_rrpgObjs.removeEventListenerById(self._e_event21);
        __o_rrpgObjs.removeEventListenerById(self._e_event20);
        __o_rrpgObjs.removeEventListenerById(self._e_event19);
        __o_rrpgObjs.removeEventListenerById(self._e_event18);
        __o_rrpgObjs.removeEventListenerById(self._e_event17);
        __o_rrpgObjs.removeEventListenerById(self._e_event16);
        __o_rrpgObjs.removeEventListenerById(self._e_event15);
        __o_rrpgObjs.removeEventListenerById(self._e_event14);
        __o_rrpgObjs.removeEventListenerById(self._e_event13);
        __o_rrpgObjs.removeEventListenerById(self._e_event12);
        __o_rrpgObjs.removeEventListenerById(self._e_event11);
        __o_rrpgObjs.removeEventListenerById(self._e_event10);
        __o_rrpgObjs.removeEventListenerById(self._e_event9);
        __o_rrpgObjs.removeEventListenerById(self._e_event8);
        __o_rrpgObjs.removeEventListenerById(self._e_event7);
        __o_rrpgObjs.removeEventListenerById(self._e_event6);
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

        if self.edit273 ~= nil then self.edit273:destroy(); self.edit273 = nil; end;
        if self.rectangle64 ~= nil then self.rectangle64:destroy(); self.rectangle64 = nil; end;
        if self.dataLink71 ~= nil then self.dataLink71:destroy(); self.dataLink71 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.button15 ~= nil then self.button15:destroy(); self.button15 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.rectangle104 ~= nil then self.rectangle104:destroy(); self.rectangle104 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.rectangle67 ~= nil then self.rectangle67:destroy(); self.rectangle67 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.dataLink92 ~= nil then self.dataLink92:destroy(); self.dataLink92 = nil; end;
        if self.edit262 ~= nil then self.edit262:destroy(); self.edit262 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.checkBox29 ~= nil then self.checkBox29:destroy(); self.checkBox29 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.rectangle59 ~= nil then self.rectangle59:destroy(); self.rectangle59 = nil; end;
        if self.button35 ~= nil then self.button35:destroy(); self.button35 = nil; end;
        if self.dataLink68 ~= nil then self.dataLink68:destroy(); self.dataLink68 = nil; end;
        if self.rectangle103 ~= nil then self.rectangle103:destroy(); self.rectangle103 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.edit267 ~= nil then self.edit267:destroy(); self.edit267 = nil; end;
        if self.dataLink84 ~= nil then self.dataLink84:destroy(); self.dataLink84 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.button21 ~= nil then self.button21:destroy(); self.button21 = nil; end;
        if self.edit312 ~= nil then self.edit312:destroy(); self.edit312 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.dataLink94 ~= nil then self.dataLink94:destroy(); self.dataLink94 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.edit339 ~= nil then self.edit339:destroy(); self.edit339 = nil; end;
        if self.edit260 ~= nil then self.edit260:destroy(); self.edit260 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.checkBox3 ~= nil then self.checkBox3:destroy(); self.checkBox3 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.edit347 ~= nil then self.edit347:destroy(); self.edit347 = nil; end;
        if self.rectangle68 ~= nil then self.rectangle68:destroy(); self.rectangle68 = nil; end;
        if self.edit343 ~= nil then self.edit343:destroy(); self.edit343 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.rectangle80 ~= nil then self.rectangle80:destroy(); self.rectangle80 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit251 ~= nil then self.edit251:destroy(); self.edit251 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.checkBox50 ~= nil then self.checkBox50:destroy(); self.checkBox50 = nil; end;
        if self.edit304 ~= nil then self.edit304:destroy(); self.edit304 = nil; end;
        if self.button45 ~= nil then self.button45:destroy(); self.button45 = nil; end;
        if self.rectangle101 ~= nil then self.rectangle101:destroy(); self.rectangle101 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.edit309 ~= nil then self.edit309:destroy(); self.edit309 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.checkBox48 ~= nil then self.checkBox48:destroy(); self.checkBox48 = nil; end;
        if self.dataLink76 ~= nil then self.dataLink76:destroy(); self.dataLink76 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.button44 ~= nil then self.button44:destroy(); self.button44 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.checkBox23 ~= nil then self.checkBox23:destroy(); self.checkBox23 = nil; end;
        if self.rectangle58 ~= nil then self.rectangle58:destroy(); self.rectangle58 = nil; end;
        if self.checkBox37 ~= nil then self.checkBox37:destroy(); self.checkBox37 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.edit258 ~= nil then self.edit258:destroy(); self.edit258 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.checkBox40 ~= nil then self.checkBox40:destroy(); self.checkBox40 = nil; end;
        if self.edit348 ~= nil then self.edit348:destroy(); self.edit348 = nil; end;
        if self.dataLink97 ~= nil then self.dataLink97:destroy(); self.dataLink97 = nil; end;
        if self.rectangle88 ~= nil then self.rectangle88:destroy(); self.rectangle88 = nil; end;
        if self.checkBox28 ~= nil then self.checkBox28:destroy(); self.checkBox28 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.dataLink80 ~= nil then self.dataLink80:destroy(); self.dataLink80 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.checkBox32 ~= nil then self.checkBox32:destroy(); self.checkBox32 = nil; end;
        if self.edit247 ~= nil then self.edit247:destroy(); self.edit247 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.rectangle76 ~= nil then self.rectangle76:destroy(); self.rectangle76 = nil; end;
        if self.dataLink40 ~= nil then self.dataLink40:destroy(); self.dataLink40 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.button28 ~= nil then self.button28:destroy(); self.button28 = nil; end;
        if self.edit332 ~= nil then self.edit332:destroy(); self.edit332 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.rectangle66 ~= nil then self.rectangle66:destroy(); self.rectangle66 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit313 ~= nil then self.edit313:destroy(); self.edit313 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit287 ~= nil then self.edit287:destroy(); self.edit287 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit249 ~= nil then self.edit249:destroy(); self.edit249 = nil; end;
        if self.checkBox44 ~= nil then self.checkBox44:destroy(); self.checkBox44 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit252 ~= nil then self.edit252:destroy(); self.edit252 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.button13 ~= nil then self.button13:destroy(); self.button13 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.checkBox16 ~= nil then self.checkBox16:destroy(); self.checkBox16 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.rectangle97 ~= nil then self.rectangle97:destroy(); self.rectangle97 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.button32 ~= nil then self.button32:destroy(); self.button32 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.button27 ~= nil then self.button27:destroy(); self.button27 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.button24 ~= nil then self.button24:destroy(); self.button24 = nil; end;
        if self.edit302 ~= nil then self.edit302:destroy(); self.edit302 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit250 ~= nil then self.edit250:destroy(); self.edit250 = nil; end;
        if self.checkBox14 ~= nil then self.checkBox14:destroy(); self.checkBox14 = nil; end;
        if self.edit261 ~= nil then self.edit261:destroy(); self.edit261 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.rectangle62 ~= nil then self.rectangle62:destroy(); self.rectangle62 = nil; end;
        if self.edit308 ~= nil then self.edit308:destroy(); self.edit308 = nil; end;
        if self.edit300 ~= nil then self.edit300:destroy(); self.edit300 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.dataLink69 ~= nil then self.dataLink69:destroy(); self.dataLink69 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.button6 ~= nil then self.button6:destroy(); self.button6 = nil; end;
        if self.dataLink98 ~= nil then self.dataLink98:destroy(); self.dataLink98 = nil; end;
        if self.checkBox12 ~= nil then self.checkBox12:destroy(); self.checkBox12 = nil; end;
        if self.dataLink83 ~= nil then self.dataLink83:destroy(); self.dataLink83 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.checkBox31 ~= nil then self.checkBox31:destroy(); self.checkBox31 = nil; end;
        if self.edit314 ~= nil then self.edit314:destroy(); self.edit314 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.button10 ~= nil then self.button10:destroy(); self.button10 = nil; end;
        if self.checkBox22 ~= nil then self.checkBox22:destroy(); self.checkBox22 = nil; end;
        if self.rectangle78 ~= nil then self.rectangle78:destroy(); self.rectangle78 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.rectangle63 ~= nil then self.rectangle63:destroy(); self.rectangle63 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.checkBox25 ~= nil then self.checkBox25:destroy(); self.checkBox25 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.checkBox35 ~= nil then self.checkBox35:destroy(); self.checkBox35 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.dataLink67 ~= nil then self.dataLink67:destroy(); self.dataLink67 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.button18 ~= nil then self.button18:destroy(); self.button18 = nil; end;
        if self.dataLink57 ~= nil then self.dataLink57:destroy(); self.dataLink57 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.checkBox47 ~= nil then self.checkBox47:destroy(); self.checkBox47 = nil; end;
        if self.edit278 ~= nil then self.edit278:destroy(); self.edit278 = nil; end;
        if self.edit281 ~= nil then self.edit281:destroy(); self.edit281 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit333 ~= nil then self.edit333:destroy(); self.edit333 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.checkBox15 ~= nil then self.checkBox15:destroy(); self.checkBox15 = nil; end;
        if self.edit310 ~= nil then self.edit310:destroy(); self.edit310 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.dataLink73 ~= nil then self.dataLink73:destroy(); self.dataLink73 = nil; end;
        if self.rectangle85 ~= nil then self.rectangle85:destroy(); self.rectangle85 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.button47 ~= nil then self.button47:destroy(); self.button47 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.edit246 ~= nil then self.edit246:destroy(); self.edit246 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.button20 ~= nil then self.button20:destroy(); self.button20 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit298 ~= nil then self.edit298:destroy(); self.edit298 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit244 ~= nil then self.edit244:destroy(); self.edit244 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.dataLink53 ~= nil then self.dataLink53:destroy(); self.dataLink53 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.rectangle70 ~= nil then self.rectangle70:destroy(); self.rectangle70 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.dataLink93 ~= nil then self.dataLink93:destroy(); self.dataLink93 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle87 ~= nil then self.rectangle87:destroy(); self.rectangle87 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle89 ~= nil then self.rectangle89:destroy(); self.rectangle89 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit256 ~= nil then self.edit256:destroy(); self.edit256 = nil; end;
        if self.button29 ~= nil then self.button29:destroy(); self.button29 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit283 ~= nil then self.edit283:destroy(); self.edit283 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.edit291 ~= nil then self.edit291:destroy(); self.edit291 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit349 ~= nil then self.edit349:destroy(); self.edit349 = nil; end;
        if self.edit264 ~= nil then self.edit264:destroy(); self.edit264 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.checkBox33 ~= nil then self.checkBox33:destroy(); self.checkBox33 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.edit326 ~= nil then self.edit326:destroy(); self.edit326 = nil; end;
        if self.dataLink74 ~= nil then self.dataLink74:destroy(); self.dataLink74 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.edit338 ~= nil then self.edit338:destroy(); self.edit338 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.rectangle81 ~= nil then self.rectangle81:destroy(); self.rectangle81 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit293 ~= nil then self.edit293:destroy(); self.edit293 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.checkBox24 ~= nil then self.checkBox24:destroy(); self.checkBox24 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.rectangle92 ~= nil then self.rectangle92:destroy(); self.rectangle92 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.rectangle96 ~= nil then self.rectangle96:destroy(); self.rectangle96 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.edit329 ~= nil then self.edit329:destroy(); self.edit329 = nil; end;
        if self.edit311 ~= nil then self.edit311:destroy(); self.edit311 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.rectangle98 ~= nil then self.rectangle98:destroy(); self.rectangle98 = nil; end;
        if self.checkBox38 ~= nil then self.checkBox38:destroy(); self.checkBox38 = nil; end;
        if self.checkBox4 ~= nil then self.checkBox4:destroy(); self.checkBox4 = nil; end;
        if self.dataLink58 ~= nil then self.dataLink58:destroy(); self.dataLink58 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.rectangle71 ~= nil then self.rectangle71:destroy(); self.rectangle71 = nil; end;
        if self.edit270 ~= nil then self.edit270:destroy(); self.edit270 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.dataLink77 ~= nil then self.dataLink77:destroy(); self.dataLink77 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.edit276 ~= nil then self.edit276:destroy(); self.edit276 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.edit288 ~= nil then self.edit288:destroy(); self.edit288 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.dataLink99 ~= nil then self.dataLink99:destroy(); self.dataLink99 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.checkBox27 ~= nil then self.checkBox27:destroy(); self.checkBox27 = nil; end;
        if self.edit341 ~= nil then self.edit341:destroy(); self.edit341 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.dataLink75 ~= nil then self.dataLink75:destroy(); self.dataLink75 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.checkBox8 ~= nil then self.checkBox8:destroy(); self.checkBox8 = nil; end;
        if self.edit342 ~= nil then self.edit342:destroy(); self.edit342 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.edit340 ~= nil then self.edit340:destroy(); self.edit340 = nil; end;
        if self.edit277 ~= nil then self.edit277:destroy(); self.edit277 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.dataLink65 ~= nil then self.dataLink65:destroy(); self.dataLink65 = nil; end;
        if self.edit350 ~= nil then self.edit350:destroy(); self.edit350 = nil; end;
        if self.dataLink101 ~= nil then self.dataLink101:destroy(); self.dataLink101 = nil; end;
        if self.button22 ~= nil then self.button22:destroy(); self.button22 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.dataLink60 ~= nil then self.dataLink60:destroy(); self.dataLink60 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.dataLink96 ~= nil then self.dataLink96:destroy(); self.dataLink96 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.button42 ~= nil then self.button42:destroy(); self.button42 = nil; end;
        if self.edit321 ~= nil then self.edit321:destroy(); self.edit321 = nil; end;
        if self.edit331 ~= nil then self.edit331:destroy(); self.edit331 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.checkBox21 ~= nil then self.checkBox21:destroy(); self.checkBox21 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit275 ~= nil then self.edit275:destroy(); self.edit275 = nil; end;
        if self.button23 ~= nil then self.button23:destroy(); self.button23 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.edit346 ~= nil then self.edit346:destroy(); self.edit346 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.rectangle73 ~= nil then self.rectangle73:destroy(); self.rectangle73 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle95 ~= nil then self.rectangle95:destroy(); self.rectangle95 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.button17 ~= nil then self.button17:destroy(); self.button17 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit345 ~= nil then self.edit345:destroy(); self.edit345 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit257 ~= nil then self.edit257:destroy(); self.edit257 = nil; end;
        if self.edit259 ~= nil then self.edit259:destroy(); self.edit259 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit303 ~= nil then self.edit303:destroy(); self.edit303 = nil; end;
        if self.dataLink85 ~= nil then self.dataLink85:destroy(); self.dataLink85 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit268 ~= nil then self.edit268:destroy(); self.edit268 = nil; end;
        if self.edit248 ~= nil then self.edit248:destroy(); self.edit248 = nil; end;
        if self.rectangle72 ~= nil then self.rectangle72:destroy(); self.rectangle72 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.dataLink46 ~= nil then self.dataLink46:destroy(); self.dataLink46 = nil; end;
        if self.edit282 ~= nil then self.edit282:destroy(); self.edit282 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.button14 ~= nil then self.button14:destroy(); self.button14 = nil; end;
        if self.dataLink50 ~= nil then self.dataLink50:destroy(); self.dataLink50 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.checkBox30 ~= nil then self.checkBox30:destroy(); self.checkBox30 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.dataLink95 ~= nil then self.dataLink95:destroy(); self.dataLink95 = nil; end;
        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.dataLink86 ~= nil then self.dataLink86:destroy(); self.dataLink86 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink89 ~= nil then self.dataLink89:destroy(); self.dataLink89 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit334 ~= nil then self.edit334:destroy(); self.edit334 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.edit296 ~= nil then self.edit296:destroy(); self.edit296 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.button16 ~= nil then self.button16:destroy(); self.button16 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.edit265 ~= nil then self.edit265:destroy(); self.edit265 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit297 ~= nil then self.edit297:destroy(); self.edit297 = nil; end;
        if self.dataLink100 ~= nil then self.dataLink100:destroy(); self.dataLink100 = nil; end;
        if self.button40 ~= nil then self.button40:destroy(); self.button40 = nil; end;
        if self.dataLink44 ~= nil then self.dataLink44:destroy(); self.dataLink44 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.edit245 ~= nil then self.edit245:destroy(); self.edit245 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.button36 ~= nil then self.button36:destroy(); self.button36 = nil; end;
        if self.button37 ~= nil then self.button37:destroy(); self.button37 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.checkBox49 ~= nil then self.checkBox49:destroy(); self.checkBox49 = nil; end;
        if self.edit255 ~= nil then self.edit255:destroy(); self.edit255 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.dataLink63 ~= nil then self.dataLink63:destroy(); self.dataLink63 = nil; end;
        if self.button26 ~= nil then self.button26:destroy(); self.button26 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.button4 ~= nil then self.button4:destroy(); self.button4 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.edit316 ~= nil then self.edit316:destroy(); self.edit316 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.button7 ~= nil then self.button7:destroy(); self.button7 = nil; end;
        if self.checkBox42 ~= nil then self.checkBox42:destroy(); self.checkBox42 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.edit295 ~= nil then self.edit295:destroy(); self.edit295 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.dataLink72 ~= nil then self.dataLink72:destroy(); self.dataLink72 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.rectangle61 ~= nil then self.rectangle61:destroy(); self.rectangle61 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.edit324 ~= nil then self.edit324:destroy(); self.edit324 = nil; end;
        if self.button43 ~= nil then self.button43:destroy(); self.button43 = nil; end;
        if self.rectangle105 ~= nil then self.rectangle105:destroy(); self.rectangle105 = nil; end;
        if self.rectangle94 ~= nil then self.rectangle94:destroy(); self.rectangle94 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.dataLink81 ~= nil then self.dataLink81:destroy(); self.dataLink81 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit301 ~= nil then self.edit301:destroy(); self.edit301 = nil; end;
        if self.dataLink82 ~= nil then self.dataLink82:destroy(); self.dataLink82 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.edit284 ~= nil then self.edit284:destroy(); self.edit284 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.button33 ~= nil then self.button33:destroy(); self.button33 = nil; end;
        if self.rectangle82 ~= nil then self.rectangle82:destroy(); self.rectangle82 = nil; end;
        if self.rectangle77 ~= nil then self.rectangle77:destroy(); self.rectangle77 = nil; end;
        if self.rectangle99 ~= nil then self.rectangle99:destroy(); self.rectangle99 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.edit330 ~= nil then self.edit330:destroy(); self.edit330 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.button51 ~= nil then self.button51:destroy(); self.button51 = nil; end;
        if self.dataLink55 ~= nil then self.dataLink55:destroy(); self.dataLink55 = nil; end;
        if self.edit263 ~= nil then self.edit263:destroy(); self.edit263 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.edit285 ~= nil then self.edit285:destroy(); self.edit285 = nil; end;
        if self.dataLink47 ~= nil then self.dataLink47:destroy(); self.dataLink47 = nil; end;
        if self.dataLink78 ~= nil then self.dataLink78:destroy(); self.dataLink78 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.button39 ~= nil then self.button39:destroy(); self.button39 = nil; end;
        if self.edit336 ~= nil then self.edit336:destroy(); self.edit336 = nil; end;
        if self.dataLink79 ~= nil then self.dataLink79:destroy(); self.dataLink79 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit274 ~= nil then self.edit274:destroy(); self.edit274 = nil; end;
        if self.edit289 ~= nil then self.edit289:destroy(); self.edit289 = nil; end;
        if self.button30 ~= nil then self.button30:destroy(); self.button30 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.checkBox17 ~= nil then self.checkBox17:destroy(); self.checkBox17 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.dataLink45 ~= nil then self.dataLink45:destroy(); self.dataLink45 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.dataLink43 ~= nil then self.dataLink43:destroy(); self.dataLink43 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.checkBox9 ~= nil then self.checkBox9:destroy(); self.checkBox9 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit323 ~= nil then self.edit323:destroy(); self.edit323 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.button3 ~= nil then self.button3:destroy(); self.button3 = nil; end;
        if self.edit328 ~= nil then self.edit328:destroy(); self.edit328 = nil; end;
        if self.dataLink64 ~= nil then self.dataLink64:destroy(); self.dataLink64 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.dataLink54 ~= nil then self.dataLink54:destroy(); self.dataLink54 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.button11 ~= nil then self.button11:destroy(); self.button11 = nil; end;
        if self.dataLink70 ~= nil then self.dataLink70:destroy(); self.dataLink70 = nil; end;
        if self.dataLink61 ~= nil then self.dataLink61:destroy(); self.dataLink61 = nil; end;
        if self.button5 ~= nil then self.button5:destroy(); self.button5 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit269 ~= nil then self.edit269:destroy(); self.edit269 = nil; end;
        if self.button41 ~= nil then self.button41:destroy(); self.button41 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.edit299 ~= nil then self.edit299:destroy(); self.edit299 = nil; end;
        if self.checkBox19 ~= nil then self.checkBox19:destroy(); self.checkBox19 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.rectangle74 ~= nil then self.rectangle74:destroy(); self.rectangle74 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.button31 ~= nil then self.button31:destroy(); self.button31 = nil; end;
        if self.checkBox26 ~= nil then self.checkBox26:destroy(); self.checkBox26 = nil; end;
        if self.button8 ~= nil then self.button8:destroy(); self.button8 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.checkBox10 ~= nil then self.checkBox10:destroy(); self.checkBox10 = nil; end;
        if self.edit254 ~= nil then self.edit254:destroy(); self.edit254 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.dataLink38 ~= nil then self.dataLink38:destroy(); self.dataLink38 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit286 ~= nil then self.edit286:destroy(); self.edit286 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.checkBox41 ~= nil then self.checkBox41:destroy(); self.checkBox41 = nil; end;
        if self.checkBox39 ~= nil then self.checkBox39:destroy(); self.checkBox39 = nil; end;
        if self.edit305 ~= nil then self.edit305:destroy(); self.edit305 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.edit320 ~= nil then self.edit320:destroy(); self.edit320 = nil; end;
        if self.checkBox18 ~= nil then self.checkBox18:destroy(); self.checkBox18 = nil; end;
        if self.dataLink62 ~= nil then self.dataLink62:destroy(); self.dataLink62 = nil; end;
        if self.dataLink42 ~= nil then self.dataLink42:destroy(); self.dataLink42 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.rectangle91 ~= nil then self.rectangle91:destroy(); self.rectangle91 = nil; end;
        if self.rectangle93 ~= nil then self.rectangle93:destroy(); self.rectangle93 = nil; end;
        if self.edit335 ~= nil then self.edit335:destroy(); self.edit335 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.dataLink87 ~= nil then self.dataLink87:destroy(); self.dataLink87 = nil; end;
        if self.edit243 ~= nil then self.edit243:destroy(); self.edit243 = nil; end;
        if self.checkBox11 ~= nil then self.checkBox11:destroy(); self.checkBox11 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.button2 ~= nil then self.button2:destroy(); self.button2 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.checkBox7 ~= nil then self.checkBox7:destroy(); self.checkBox7 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.button38 ~= nil then self.button38:destroy(); self.button38 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.button52 ~= nil then self.button52:destroy(); self.button52 = nil; end;
        if self.rectangle75 ~= nil then self.rectangle75:destroy(); self.rectangle75 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.rectangle57 ~= nil then self.rectangle57:destroy(); self.rectangle57 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.rectangle83 ~= nil then self.rectangle83:destroy(); self.rectangle83 = nil; end;
        if self.checkBox45 ~= nil then self.checkBox45:destroy(); self.checkBox45 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.edit279 ~= nil then self.edit279:destroy(); self.edit279 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit294 ~= nil then self.edit294:destroy(); self.edit294 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.checkBox43 ~= nil then self.checkBox43:destroy(); self.checkBox43 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.rectangle65 ~= nil then self.rectangle65:destroy(); self.rectangle65 = nil; end;
        if self.edit315 ~= nil then self.edit315:destroy(); self.edit315 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.edit253 ~= nil then self.edit253:destroy(); self.edit253 = nil; end;
        if self.rectangle100 ~= nil then self.rectangle100:destroy(); self.rectangle100 = nil; end;
        if self.edit266 ~= nil then self.edit266:destroy(); self.edit266 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit327 ~= nil then self.edit327:destroy(); self.edit327 = nil; end;
        if self.edit319 ~= nil then self.edit319:destroy(); self.edit319 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit280 ~= nil then self.edit280:destroy(); self.edit280 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.dataLink49 ~= nil then self.dataLink49:destroy(); self.dataLink49 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit325 ~= nil then self.edit325:destroy(); self.edit325 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.rectangle90 ~= nil then self.rectangle90:destroy(); self.rectangle90 = nil; end;
        if self.edit322 ~= nil then self.edit322:destroy(); self.edit322 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.dataLink37 ~= nil then self.dataLink37:destroy(); self.dataLink37 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.checkBox13 ~= nil then self.checkBox13:destroy(); self.checkBox13 = nil; end;
        if self.button9 ~= nil then self.button9:destroy(); self.button9 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.rectangle60 ~= nil then self.rectangle60:destroy(); self.rectangle60 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.dataLink56 ~= nil then self.dataLink56:destroy(); self.dataLink56 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.edit271 ~= nil then self.edit271:destroy(); self.edit271 = nil; end;
        if self.dataLink91 ~= nil then self.dataLink91:destroy(); self.dataLink91 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.rectangle86 ~= nil then self.rectangle86:destroy(); self.rectangle86 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.rectangle56 ~= nil then self.rectangle56:destroy(); self.rectangle56 = nil; end;
        if self.dataLink39 ~= nil then self.dataLink39:destroy(); self.dataLink39 = nil; end;
        if self.button49 ~= nil then self.button49:destroy(); self.button49 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.rectangle79 ~= nil then self.rectangle79:destroy(); self.rectangle79 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink59 ~= nil then self.dataLink59:destroy(); self.dataLink59 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.checkBox6 ~= nil then self.checkBox6:destroy(); self.checkBox6 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit344 ~= nil then self.edit344:destroy(); self.edit344 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.button34 ~= nil then self.button34:destroy(); self.button34 = nil; end;
        if self.edit317 ~= nil then self.edit317:destroy(); self.edit317 = nil; end;
        if self.edit318 ~= nil then self.edit318:destroy(); self.edit318 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.dataLink41 ~= nil then self.dataLink41:destroy(); self.dataLink41 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.button50 ~= nil then self.button50:destroy(); self.button50 = nil; end;
        if self.checkBox20 ~= nil then self.checkBox20:destroy(); self.checkBox20 = nil; end;
        if self.button48 ~= nil then self.button48:destroy(); self.button48 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit306 ~= nil then self.edit306:destroy(); self.edit306 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.edit272 ~= nil then self.edit272:destroy(); self.edit272 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.checkBox5 ~= nil then self.checkBox5:destroy(); self.checkBox5 = nil; end;
        if self.edit290 ~= nil then self.edit290:destroy(); self.edit290 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit307 ~= nil then self.edit307:destroy(); self.edit307 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit337 ~= nil then self.edit337:destroy(); self.edit337 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.rectangle69 ~= nil then self.rectangle69:destroy(); self.rectangle69 = nil; end;
        if self.dataLink66 ~= nil then self.dataLink66:destroy(); self.dataLink66 = nil; end;
        if self.checkBox46 ~= nil then self.checkBox46:destroy(); self.checkBox46 = nil; end;
        if self.dataLink52 ~= nil then self.dataLink52:destroy(); self.dataLink52 = nil; end;
        if self.button12 ~= nil then self.button12:destroy(); self.button12 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle102 ~= nil then self.rectangle102:destroy(); self.rectangle102 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.edit292 ~= nil then self.edit292:destroy(); self.edit292 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.checkBox36 ~= nil then self.checkBox36:destroy(); self.checkBox36 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.dataLink48 ~= nil then self.dataLink48:destroy(); self.dataLink48 = nil; end;
        if self.checkBox2 ~= nil then self.checkBox2:destroy(); self.checkBox2 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.button25 ~= nil then self.button25:destroy(); self.button25 = nil; end;
        if self.checkBox34 ~= nil then self.checkBox34:destroy(); self.checkBox34 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.rectangle106 ~= nil then self.rectangle106:destroy(); self.rectangle106 = nil; end;
        if self.dataLink90 ~= nil then self.dataLink90:destroy(); self.dataLink90 = nil; end;
        if self.rectangle84 ~= nil then self.rectangle84:destroy(); self.rectangle84 = nil; end;
        if self.button46 ~= nil then self.button46:destroy(); self.button46 = nil; end;
        if self.dataLink51 ~= nil then self.dataLink51:destroy(); self.dataLink51 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.dataLink88 ~= nil then self.dataLink88:destroy(); self.dataLink88 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.button19 ~= nil then self.button19:destroy(); self.button19 = nil; end;
        if self.checkBox1 ~= nil then self.checkBox1:destroy(); self.checkBox1 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister3o_svg = {
    newEditor = newfrmFichaRPGmeister3o_svg, 
    new = newfrmFichaRPGmeister3o_svg, 
    name = "frmFichaRPGmeister3o_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister3o_svg = _frmFichaRPGmeister3o_svg;
rrpg.registrarForm(_frmFichaRPGmeister3o_svg);

return _frmFichaRPGmeister3o_svg;
