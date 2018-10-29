require("firecast.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");
require("locale.lua");
local __o_Utils = require("utils.lua");

local function constructNew_frmMDA20_4()
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
    obj:setName("frmMDA20_4");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = GUI.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(240);
    obj.layout1:setHeight(165);
    obj.layout1:setName("layout1");

    obj.rectangle1 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(10);
    obj.rectangle1:setYradius(10);
    obj.rectangle1:setCornerType("innerLine");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = GUI.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(240);
    obj.label1:setHeight(20);
    obj.label1:setText("ALLIES");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.textEditor1 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout1);
    obj.textEditor1:setLeft(15);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(200);
    obj.textEditor1:setHeight(125);
    obj.textEditor1:setField("allies");
    obj.textEditor1:setName("textEditor1");

    obj.layout2 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.scrollBox1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(175);
    obj.layout2:setWidth(240);
    obj.layout2:setHeight(165);
    obj.layout2:setName("layout2");

    obj.rectangle2 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(10);
    obj.rectangle2:setYradius(10);
    obj.rectangle2:setCornerType("innerLine");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = GUI.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(0);
    obj.label2:setWidth(240);
    obj.label2:setHeight(20);
    obj.label2:setText("MENTOR");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.textEditor2 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor2:setParent(obj.layout2);
    obj.textEditor2:setLeft(15);
    obj.textEditor2:setTop(25);
    obj.textEditor2:setWidth(200);
    obj.textEditor2:setHeight(125);
    obj.textEditor2:setField("mentor");
    obj.textEditor2:setName("textEditor2");

    obj.layout3 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.scrollBox1);
    obj.layout3:setLeft(250);
    obj.layout3:setTop(0);
    obj.layout3:setWidth(240);
    obj.layout3:setHeight(165);
    obj.layout3:setName("layout3");

    obj.rectangle3 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(10);
    obj.rectangle3:setYradius(10);
    obj.rectangle3:setCornerType("innerLine");
    obj.rectangle3:setName("rectangle3");

    obj.label3 = GUI.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout3);
    obj.label3:setLeft(0);
    obj.label3:setTop(0);
    obj.label3:setWidth(240);
    obj.label3:setHeight(20);
    obj.label3:setText("CONTACTS");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.textEditor3 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor3:setParent(obj.layout3);
    obj.textEditor3:setLeft(15);
    obj.textEditor3:setTop(25);
    obj.textEditor3:setWidth(200);
    obj.textEditor3:setHeight(125);
    obj.textEditor3:setField("contacts");
    obj.textEditor3:setName("textEditor3");

    obj.layout4 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.scrollBox1);
    obj.layout4:setLeft(250);
    obj.layout4:setTop(175);
    obj.layout4:setWidth(240);
    obj.layout4:setHeight(165);
    obj.layout4:setName("layout4");

    obj.rectangle4 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(10);
    obj.rectangle4:setYradius(10);
    obj.rectangle4:setCornerType("innerLine");
    obj.rectangle4:setName("rectangle4");

    obj.label4 = GUI.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout4);
    obj.label4:setLeft(0);
    obj.label4:setTop(0);
    obj.label4:setWidth(240);
    obj.label4:setHeight(20);
    obj.label4:setText("RESOURCES");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.textEditor4 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor4:setParent(obj.layout4);
    obj.textEditor4:setLeft(15);
    obj.textEditor4:setTop(25);
    obj.textEditor4:setWidth(200);
    obj.textEditor4:setHeight(125);
    obj.textEditor4:setField("resources");
    obj.textEditor4:setName("textEditor4");

    obj.layout5 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.scrollBox1);
    obj.layout5:setLeft(500);
    obj.layout5:setTop(0);
    obj.layout5:setWidth(240);
    obj.layout5:setHeight(165);
    obj.layout5:setName("layout5");

    obj.rectangle5 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout5);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setXradius(10);
    obj.rectangle5:setYradius(10);
    obj.rectangle5:setCornerType("innerLine");
    obj.rectangle5:setName("rectangle5");

    obj.label5 = GUI.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout5);
    obj.label5:setLeft(0);
    obj.label5:setTop(0);
    obj.label5:setWidth(240);
    obj.label5:setHeight(20);
    obj.label5:setText("LIBRARY");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.textEditor5 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor5:setParent(obj.layout5);
    obj.textEditor5:setLeft(15);
    obj.textEditor5:setTop(25);
    obj.textEditor5:setWidth(200);
    obj.textEditor5:setHeight(125);
    obj.textEditor5:setField("library");
    obj.textEditor5:setName("textEditor5");

    obj.layout6 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.scrollBox1);
    obj.layout6:setLeft(500);
    obj.layout6:setTop(175);
    obj.layout6:setWidth(240);
    obj.layout6:setHeight(165);
    obj.layout6:setName("layout6");

    obj.rectangle6 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setXradius(10);
    obj.rectangle6:setYradius(10);
    obj.rectangle6:setCornerType("innerLine");
    obj.rectangle6:setName("rectangle6");

    obj.label6 = GUI.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout6);
    obj.label6:setLeft(0);
    obj.label6:setTop(0);
    obj.label6:setWidth(240);
    obj.label6:setHeight(20);
    obj.label6:setText("FAMILIARS");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.textEditor6 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor6:setParent(obj.layout6);
    obj.textEditor6:setLeft(15);
    obj.textEditor6:setTop(25);
    obj.textEditor6:setWidth(200);
    obj.textEditor6:setHeight(125);
    obj.textEditor6:setField("familiars");
    obj.textEditor6:setName("textEditor6");

    obj.layout7 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.scrollBox1);
    obj.layout7:setLeft(750);
    obj.layout7:setTop(0);
    obj.layout7:setWidth(240);
    obj.layout7:setHeight(165);
    obj.layout7:setName("layout7");

    obj.rectangle7 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout7);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(10);
    obj.rectangle7:setYradius(10);
    obj.rectangle7:setCornerType("innerLine");
    obj.rectangle7:setName("rectangle7");

    obj.label7 = GUI.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout7);
    obj.label7:setLeft(0);
    obj.label7:setTop(0);
    obj.label7:setWidth(240);
    obj.label7:setHeight(20);
    obj.label7:setText("CRAY");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.textEditor7 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor7:setParent(obj.layout7);
    obj.textEditor7:setLeft(15);
    obj.textEditor7:setTop(25);
    obj.textEditor7:setWidth(200);
    obj.textEditor7:setHeight(125);
    obj.textEditor7:setField("cray");
    obj.textEditor7:setName("textEditor7");

    obj.layout8 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.scrollBox1);
    obj.layout8:setLeft(750);
    obj.layout8:setTop(175);
    obj.layout8:setWidth(240);
    obj.layout8:setHeight(165);
    obj.layout8:setName("layout8");

    obj.rectangle8 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout8);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setXradius(10);
    obj.rectangle8:setYradius(10);
    obj.rectangle8:setCornerType("innerLine");
    obj.rectangle8:setName("rectangle8");

    obj.label8 = GUI.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout8);
    obj.label8:setLeft(0);
    obj.label8:setTop(0);
    obj.label8:setWidth(240);
    obj.label8:setHeight(20);
    obj.label8:setText("SERVANTS");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.textEditor8 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor8:setParent(obj.layout8);
    obj.textEditor8:setLeft(15);
    obj.textEditor8:setTop(25);
    obj.textEditor8:setWidth(200);
    obj.textEditor8:setHeight(125);
    obj.textEditor8:setField("servants");
    obj.textEditor8:setName("textEditor8");

    obj.layout9 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.scrollBox1);
    obj.layout9:setLeft(1000);
    obj.layout9:setTop(0);
    obj.layout9:setWidth(240);
    obj.layout9:setHeight(165);
    obj.layout9:setName("layout9");

    obj.rectangle9 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout9);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setXradius(10);
    obj.rectangle9:setYradius(10);
    obj.rectangle9:setCornerType("innerLine");
    obj.rectangle9:setName("rectangle9");

    obj.label9 = GUI.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout9);
    obj.label9:setLeft(0);
    obj.label9:setTop(0);
    obj.label9:setWidth(240);
    obj.label9:setHeight(20);
    obj.label9:setText("INFLUENCE");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.textEditor9 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor9:setParent(obj.layout9);
    obj.textEditor9:setLeft(15);
    obj.textEditor9:setTop(25);
    obj.textEditor9:setWidth(200);
    obj.textEditor9:setHeight(125);
    obj.textEditor9:setField("influence");
    obj.textEditor9:setName("textEditor9");

    obj.layout10 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.scrollBox1);
    obj.layout10:setLeft(1000);
    obj.layout10:setTop(175);
    obj.layout10:setWidth(240);
    obj.layout10:setHeight(165);
    obj.layout10:setName("layout10");

    obj.rectangle10 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout10);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setXradius(10);
    obj.rectangle10:setYradius(10);
    obj.rectangle10:setCornerType("innerLine");
    obj.rectangle10:setName("rectangle10");

    obj.label10 = GUI.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout10);
    obj.label10:setLeft(0);
    obj.label10:setTop(0);
    obj.label10:setWidth(240);
    obj.label10:setHeight(20);
    obj.label10:setText("OTHER");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.textEditor10 = GUI.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor10:setParent(obj.layout10);
    obj.textEditor10:setLeft(15);
    obj.textEditor10:setTop(25);
    obj.textEditor10:setWidth(200);
    obj.textEditor10:setHeight(125);
    obj.textEditor10:setField("other");
    obj.textEditor10:setName("textEditor10");

    obj.layout11 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.scrollBox1);
    obj.layout11:setLeft(0);
    obj.layout11:setTop(350);
    obj.layout11:setWidth(615);
    obj.layout11:setHeight(215);
    obj.layout11:setName("layout11");

    obj.rectangle11 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout11);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setXradius(10);
    obj.rectangle11:setYradius(10);
    obj.rectangle11:setCornerType("innerLine");
    obj.rectangle11:setName("rectangle11");

    obj.label11 = GUI.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout11);
    obj.label11:setLeft(0);
    obj.label11:setTop(0);
    obj.label11:setWidth(615);
    obj.label11:setHeight(20);
    obj.label11:setText("CHANTRY");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.label12 = GUI.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout11);
    obj.label12:setLeft(10);
    obj.label12:setTop(25);
    obj.label12:setWidth(200);
    obj.label12:setHeight(20);
    obj.label12:setText("Location");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.label13 = GUI.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout11);
    obj.label13:setLeft(210);
    obj.label13:setTop(25);
    obj.label13:setWidth(395);
    obj.label13:setHeight(20);
    obj.label13:setText("Description");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.layout12 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout11);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(50);
    obj.layout12:setWidth(615);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.edit1 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout12);
    obj.edit1:setLeft(10);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(200);
    obj.edit1:setHeight(24);
    obj.edit1:setField("place_location_1");
    obj.edit1:setName("edit1");

    obj.edit2 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout12);
    obj.edit2:setLeft(210);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(395);
    obj.edit2:setHeight(24);
    obj.edit2:setField("place_description_1");
    obj.edit2:setName("edit2");

    obj.layout13 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout11);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(75);
    obj.layout13:setWidth(615);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit3 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout13);
    obj.edit3:setLeft(10);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(200);
    obj.edit3:setHeight(24);
    obj.edit3:setField("place_location_2");
    obj.edit3:setName("edit3");

    obj.edit4 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout13);
    obj.edit4:setLeft(210);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(395);
    obj.edit4:setHeight(24);
    obj.edit4:setField("place_description_2");
    obj.edit4:setName("edit4");

    obj.layout14 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout11);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(100);
    obj.layout14:setWidth(615);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.edit5 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout14);
    obj.edit5:setLeft(10);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(200);
    obj.edit5:setHeight(24);
    obj.edit5:setField("place_location_3");
    obj.edit5:setName("edit5");

    obj.edit6 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout14);
    obj.edit6:setLeft(210);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(395);
    obj.edit6:setHeight(24);
    obj.edit6:setField("place_description_3");
    obj.edit6:setName("edit6");

    obj.layout15 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout11);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(125);
    obj.layout15:setWidth(615);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit7 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout15);
    obj.edit7:setLeft(10);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(200);
    obj.edit7:setHeight(24);
    obj.edit7:setField("place_location_4");
    obj.edit7:setName("edit7");

    obj.edit8 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout15);
    obj.edit8:setLeft(210);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(395);
    obj.edit8:setHeight(24);
    obj.edit8:setField("place_description_4");
    obj.edit8:setName("edit8");

    obj.layout16 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout11);
    obj.layout16:setLeft(0);
    obj.layout16:setTop(150);
    obj.layout16:setWidth(615);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.edit9 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout16);
    obj.edit9:setLeft(10);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(200);
    obj.edit9:setHeight(24);
    obj.edit9:setField("place_location_5");
    obj.edit9:setName("edit9");

    obj.edit10 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout16);
    obj.edit10:setLeft(210);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(395);
    obj.edit10:setHeight(24);
    obj.edit10:setField("place_description_5");
    obj.edit10:setName("edit10");

    obj.layout17 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout11);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(175);
    obj.layout17:setWidth(615);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit11 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout17);
    obj.edit11:setLeft(10);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(200);
    obj.edit11:setHeight(24);
    obj.edit11:setField("place_location_6");
    obj.edit11:setName("edit11");

    obj.edit12 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout17);
    obj.edit12:setLeft(210);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(395);
    obj.edit12:setHeight(24);
    obj.edit12:setField("place_description_6");
    obj.edit12:setName("edit12");

    obj.layout18 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.scrollBox1);
    obj.layout18:setLeft(625);
    obj.layout18:setTop(350);
    obj.layout18:setWidth(615);
    obj.layout18:setHeight(215);
    obj.layout18:setName("layout18");

    obj.rectangle12 = GUI.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout18);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setXradius(10);
    obj.rectangle12:setYradius(10);
    obj.rectangle12:setCornerType("innerLine");
    obj.rectangle12:setName("rectangle12");

    obj.label14 = GUI.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout18);
    obj.label14:setLeft(0);
    obj.label14:setTop(0);
    obj.label14:setWidth(615);
    obj.label14:setHeight(20);
    obj.label14:setText("SANCTUM");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.label15 = GUI.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout18);
    obj.label15:setLeft(10);
    obj.label15:setTop(25);
    obj.label15:setWidth(200);
    obj.label15:setHeight(20);
    obj.label15:setText("Location");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = GUI.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout18);
    obj.label16:setLeft(210);
    obj.label16:setTop(25);
    obj.label16:setWidth(395);
    obj.label16:setHeight(20);
    obj.label16:setText("Description");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.layout19 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout18);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(50);
    obj.layout19:setWidth(615);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.edit13 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout19);
    obj.edit13:setLeft(10);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(200);
    obj.edit13:setHeight(24);
    obj.edit13:setField("place_location_7");
    obj.edit13:setName("edit13");

    obj.edit14 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout19);
    obj.edit14:setLeft(210);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(395);
    obj.edit14:setHeight(24);
    obj.edit14:setField("place_description_7");
    obj.edit14:setName("edit14");

    obj.layout20 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout18);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(75);
    obj.layout20:setWidth(615);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.edit15 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout20);
    obj.edit15:setLeft(10);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(200);
    obj.edit15:setHeight(24);
    obj.edit15:setField("place_location_8");
    obj.edit15:setName("edit15");

    obj.edit16 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout20);
    obj.edit16:setLeft(210);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(395);
    obj.edit16:setHeight(24);
    obj.edit16:setField("place_description_8");
    obj.edit16:setName("edit16");

    obj.layout21 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout18);
    obj.layout21:setLeft(0);
    obj.layout21:setTop(100);
    obj.layout21:setWidth(615);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.edit17 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout21);
    obj.edit17:setLeft(10);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(200);
    obj.edit17:setHeight(24);
    obj.edit17:setField("place_location_9");
    obj.edit17:setName("edit17");

    obj.edit18 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout21);
    obj.edit18:setLeft(210);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(395);
    obj.edit18:setHeight(24);
    obj.edit18:setField("place_description_9");
    obj.edit18:setName("edit18");

    obj.layout22 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout18);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(125);
    obj.layout22:setWidth(615);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.edit19 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout22);
    obj.edit19:setLeft(10);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(200);
    obj.edit19:setHeight(24);
    obj.edit19:setField("place_location_10");
    obj.edit19:setName("edit19");

    obj.edit20 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout22);
    obj.edit20:setLeft(210);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(395);
    obj.edit20:setHeight(24);
    obj.edit20:setField("place_description_10");
    obj.edit20:setName("edit20");

    obj.layout23 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout18);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(150);
    obj.layout23:setWidth(615);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.edit21 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout23);
    obj.edit21:setLeft(10);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(200);
    obj.edit21:setHeight(24);
    obj.edit21:setField("place_location_11");
    obj.edit21:setName("edit21");

    obj.edit22 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout23);
    obj.edit22:setLeft(210);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(395);
    obj.edit22:setHeight(24);
    obj.edit22:setField("place_description_11");
    obj.edit22:setName("edit22");

    obj.layout24 = GUI.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout18);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(175);
    obj.layout24:setWidth(615);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.edit23 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout24);
    obj.edit23:setLeft(10);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(200);
    obj.edit23:setHeight(24);
    obj.edit23:setField("place_location_12");
    obj.edit23:setName("edit23");

    obj.edit24 = GUI.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout24);
    obj.edit24:setLeft(210);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(395);
    obj.edit24:setHeight(24);
    obj.edit24:setField("place_description_12");
    obj.edit24:setName("edit24");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.textEditor4 ~= nil then self.textEditor4:destroy(); self.textEditor4 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.textEditor9 ~= nil then self.textEditor9:destroy(); self.textEditor9 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.textEditor3 ~= nil then self.textEditor3:destroy(); self.textEditor3 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.textEditor10 ~= nil then self.textEditor10:destroy(); self.textEditor10 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.textEditor6 ~= nil then self.textEditor6:destroy(); self.textEditor6 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.textEditor2 ~= nil then self.textEditor2:destroy(); self.textEditor2 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.textEditor8 ~= nil then self.textEditor8:destroy(); self.textEditor8 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.textEditor5 ~= nil then self.textEditor5:destroy(); self.textEditor5 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.textEditor7 ~= nil then self.textEditor7:destroy(); self.textEditor7 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

    return obj;
end;

function newfrmMDA20_4()
    local retObj = nil;
    __o_rrpgObjs.beginObjectsLoading();

    __o_Utils.tryFinally(
      function()
        retObj = constructNew_frmMDA20_4();
      end,
      function()
        __o_rrpgObjs.endObjectsLoading();
      end);

    assert(retObj ~= nil);
    return retObj;
end;

local _frmMDA20_4 = {
    newEditor = newfrmMDA20_4, 
    new = newfrmMDA20_4, 
    name = "frmMDA20_4", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmMDA20_4 = _frmMDA20_4;
Firecast.registrarForm(_frmMDA20_4);

return _frmMDA20_4;
