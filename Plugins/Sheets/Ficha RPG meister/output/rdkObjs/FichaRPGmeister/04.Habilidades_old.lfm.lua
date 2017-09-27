require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmFichaRPGmeister4o_svg()
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
    obj:setName("frmFichaRPGmeister4o_svg");
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
    obj.layout1:setWidth(380);
    obj.layout1:setHeight(1020);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("#0000007F");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(0);
    obj.label1:setTop(0);
    obj.label1:setWidth(380);
    obj.label1:setHeight(20);
    obj.label1:setText("TALENTOS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(380);
    obj.layout2:setHeight(45);
    obj.layout2:setName("layout2");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setName("rectangle2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(5);
    obj.label2:setTop(1);
    obj.label2:setWidth(35);
    obj.label2:setHeight(20);
    obj.label2:setText("NEP");
    obj.label2:setName("label2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setVertTextAlign("center");
    obj.edit1:setLeft(5);
    obj.edit1:setTop(20);
    obj.edit1:setWidth(35);
    obj.edit1:setHeight(23);
    obj.edit1:setField("tNep1");
    obj.edit1:setName("edit1");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(45);
    obj.label3:setTop(1);
    obj.label3:setWidth(275);
    obj.label3:setHeight(20);
    obj.label3:setText("NOME");
    obj.label3:setName("label3");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setVertTextAlign("center");
    obj.edit2:setLeft(40);
    obj.edit2:setTop(20);
    obj.edit2:setWidth(280);
    obj.edit2:setHeight(23);
    obj.edit2:setField("tNome1");
    obj.edit2:setName("edit2");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(325);
    obj.label4:setTop(1);
    obj.label4:setWidth(55);
    obj.label4:setHeight(20);
    obj.label4:setText("LIVRO");
    obj.label4:setName("label4");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setVertTextAlign("center");
    obj.edit3:setLeft(320);
    obj.edit3:setTop(20);
    obj.edit3:setWidth(55);
    obj.edit3:setHeight(23);
    obj.edit3:setField("tOrigem1");
    obj.edit3:setName("edit3");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(75);
    obj.layout3:setWidth(380);
    obj.layout3:setHeight(45);
    obj.layout3:setName("layout3");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setName("rectangle3");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout3);
    obj.label5:setLeft(5);
    obj.label5:setTop(1);
    obj.label5:setWidth(35);
    obj.label5:setHeight(20);
    obj.label5:setText("NEP");
    obj.label5:setName("label5");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout3);
    obj.edit4:setVertTextAlign("center");
    obj.edit4:setLeft(5);
    obj.edit4:setTop(20);
    obj.edit4:setWidth(35);
    obj.edit4:setHeight(23);
    obj.edit4:setField("tNep2");
    obj.edit4:setName("edit4");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout3);
    obj.label6:setLeft(45);
    obj.label6:setTop(1);
    obj.label6:setWidth(275);
    obj.label6:setHeight(20);
    obj.label6:setText("NOME");
    obj.label6:setName("label6");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout3);
    obj.edit5:setVertTextAlign("center");
    obj.edit5:setLeft(40);
    obj.edit5:setTop(20);
    obj.edit5:setWidth(280);
    obj.edit5:setHeight(23);
    obj.edit5:setField("tNome2");
    obj.edit5:setName("edit5");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout3);
    obj.label7:setLeft(325);
    obj.label7:setTop(1);
    obj.label7:setWidth(55);
    obj.label7:setHeight(20);
    obj.label7:setText("LIVRO");
    obj.label7:setName("label7");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setVertTextAlign("center");
    obj.edit6:setLeft(320);
    obj.edit6:setTop(20);
    obj.edit6:setWidth(55);
    obj.edit6:setHeight(23);
    obj.edit6:setField("tOrigem2");
    obj.edit6:setName("edit6");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(125);
    obj.layout4:setWidth(380);
    obj.layout4:setHeight(45);
    obj.layout4:setName("layout4");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setName("rectangle4");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setLeft(5);
    obj.label8:setTop(1);
    obj.label8:setWidth(35);
    obj.label8:setHeight(20);
    obj.label8:setText("NEP");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout4);
    obj.edit7:setVertTextAlign("center");
    obj.edit7:setLeft(5);
    obj.edit7:setTop(20);
    obj.edit7:setWidth(35);
    obj.edit7:setHeight(23);
    obj.edit7:setField("tNep3");
    obj.edit7:setName("edit7");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout4);
    obj.label9:setLeft(45);
    obj.label9:setTop(1);
    obj.label9:setWidth(275);
    obj.label9:setHeight(20);
    obj.label9:setText("NOME");
    obj.label9:setName("label9");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout4);
    obj.edit8:setVertTextAlign("center");
    obj.edit8:setLeft(40);
    obj.edit8:setTop(20);
    obj.edit8:setWidth(280);
    obj.edit8:setHeight(23);
    obj.edit8:setField("tNome3");
    obj.edit8:setName("edit8");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout4);
    obj.label10:setLeft(325);
    obj.label10:setTop(1);
    obj.label10:setWidth(55);
    obj.label10:setHeight(20);
    obj.label10:setText("LIVRO");
    obj.label10:setName("label10");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout4);
    obj.edit9:setVertTextAlign("center");
    obj.edit9:setLeft(320);
    obj.edit9:setTop(20);
    obj.edit9:setWidth(55);
    obj.edit9:setHeight(23);
    obj.edit9:setField("tOrigem3");
    obj.edit9:setName("edit9");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(175);
    obj.layout5:setWidth(380);
    obj.layout5:setHeight(45);
    obj.layout5:setName("layout5");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout5);
    obj.rectangle5:setAlign("client");
    obj.rectangle5:setColor("black");
    obj.rectangle5:setName("rectangle5");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout5);
    obj.label11:setLeft(5);
    obj.label11:setTop(1);
    obj.label11:setWidth(35);
    obj.label11:setHeight(20);
    obj.label11:setText("NEP");
    obj.label11:setName("label11");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout5);
    obj.edit10:setVertTextAlign("center");
    obj.edit10:setLeft(5);
    obj.edit10:setTop(20);
    obj.edit10:setWidth(35);
    obj.edit10:setHeight(23);
    obj.edit10:setField("tNep4");
    obj.edit10:setName("edit10");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout5);
    obj.label12:setLeft(45);
    obj.label12:setTop(1);
    obj.label12:setWidth(275);
    obj.label12:setHeight(20);
    obj.label12:setText("NOME");
    obj.label12:setName("label12");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout5);
    obj.edit11:setVertTextAlign("center");
    obj.edit11:setLeft(40);
    obj.edit11:setTop(20);
    obj.edit11:setWidth(280);
    obj.edit11:setHeight(23);
    obj.edit11:setField("tNome4");
    obj.edit11:setName("edit11");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout5);
    obj.label13:setLeft(325);
    obj.label13:setTop(1);
    obj.label13:setWidth(55);
    obj.label13:setHeight(20);
    obj.label13:setText("LIVRO");
    obj.label13:setName("label13");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout5);
    obj.edit12:setVertTextAlign("center");
    obj.edit12:setLeft(320);
    obj.edit12:setTop(20);
    obj.edit12:setWidth(55);
    obj.edit12:setHeight(23);
    obj.edit12:setField("tOrigem4");
    obj.edit12:setName("edit12");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(225);
    obj.layout6:setWidth(380);
    obj.layout6:setHeight(45);
    obj.layout6:setName("layout6");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setAlign("client");
    obj.rectangle6:setColor("black");
    obj.rectangle6:setName("rectangle6");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout6);
    obj.label14:setLeft(5);
    obj.label14:setTop(1);
    obj.label14:setWidth(35);
    obj.label14:setHeight(20);
    obj.label14:setText("NEP");
    obj.label14:setName("label14");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout6);
    obj.edit13:setVertTextAlign("center");
    obj.edit13:setLeft(5);
    obj.edit13:setTop(20);
    obj.edit13:setWidth(35);
    obj.edit13:setHeight(23);
    obj.edit13:setField("tNep5");
    obj.edit13:setName("edit13");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout6);
    obj.label15:setLeft(45);
    obj.label15:setTop(1);
    obj.label15:setWidth(275);
    obj.label15:setHeight(20);
    obj.label15:setText("NOME");
    obj.label15:setName("label15");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout6);
    obj.edit14:setVertTextAlign("center");
    obj.edit14:setLeft(40);
    obj.edit14:setTop(20);
    obj.edit14:setWidth(280);
    obj.edit14:setHeight(23);
    obj.edit14:setField("tNome5");
    obj.edit14:setName("edit14");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout6);
    obj.label16:setLeft(325);
    obj.label16:setTop(1);
    obj.label16:setWidth(55);
    obj.label16:setHeight(20);
    obj.label16:setText("LIVRO");
    obj.label16:setName("label16");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout6);
    obj.edit15:setVertTextAlign("center");
    obj.edit15:setLeft(320);
    obj.edit15:setTop(20);
    obj.edit15:setWidth(55);
    obj.edit15:setHeight(23);
    obj.edit15:setField("tOrigem5");
    obj.edit15:setName("edit15");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(275);
    obj.layout7:setWidth(380);
    obj.layout7:setHeight(45);
    obj.layout7:setName("layout7");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout7);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setName("rectangle7");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout7);
    obj.label17:setLeft(5);
    obj.label17:setTop(1);
    obj.label17:setWidth(35);
    obj.label17:setHeight(20);
    obj.label17:setText("NEP");
    obj.label17:setName("label17");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout7);
    obj.edit16:setVertTextAlign("center");
    obj.edit16:setLeft(5);
    obj.edit16:setTop(20);
    obj.edit16:setWidth(35);
    obj.edit16:setHeight(23);
    obj.edit16:setField("tNep6");
    obj.edit16:setName("edit16");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout7);
    obj.label18:setLeft(45);
    obj.label18:setTop(1);
    obj.label18:setWidth(275);
    obj.label18:setHeight(20);
    obj.label18:setText("NOME");
    obj.label18:setName("label18");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout7);
    obj.edit17:setVertTextAlign("center");
    obj.edit17:setLeft(40);
    obj.edit17:setTop(20);
    obj.edit17:setWidth(280);
    obj.edit17:setHeight(23);
    obj.edit17:setField("tNome6");
    obj.edit17:setName("edit17");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout7);
    obj.label19:setLeft(325);
    obj.label19:setTop(1);
    obj.label19:setWidth(55);
    obj.label19:setHeight(20);
    obj.label19:setText("LIVRO");
    obj.label19:setName("label19");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout7);
    obj.edit18:setVertTextAlign("center");
    obj.edit18:setLeft(320);
    obj.edit18:setTop(20);
    obj.edit18:setWidth(55);
    obj.edit18:setHeight(23);
    obj.edit18:setField("tOrigem6");
    obj.edit18:setName("edit18");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(325);
    obj.layout8:setWidth(380);
    obj.layout8:setHeight(45);
    obj.layout8:setName("layout8");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout8);
    obj.rectangle8:setAlign("client");
    obj.rectangle8:setColor("black");
    obj.rectangle8:setName("rectangle8");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout8);
    obj.label20:setLeft(5);
    obj.label20:setTop(1);
    obj.label20:setWidth(35);
    obj.label20:setHeight(20);
    obj.label20:setText("NEP");
    obj.label20:setName("label20");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout8);
    obj.edit19:setVertTextAlign("center");
    obj.edit19:setLeft(5);
    obj.edit19:setTop(20);
    obj.edit19:setWidth(35);
    obj.edit19:setHeight(23);
    obj.edit19:setField("tNep7");
    obj.edit19:setName("edit19");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout8);
    obj.label21:setLeft(45);
    obj.label21:setTop(1);
    obj.label21:setWidth(275);
    obj.label21:setHeight(20);
    obj.label21:setText("NOME");
    obj.label21:setName("label21");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout8);
    obj.edit20:setVertTextAlign("center");
    obj.edit20:setLeft(40);
    obj.edit20:setTop(20);
    obj.edit20:setWidth(280);
    obj.edit20:setHeight(23);
    obj.edit20:setField("tNome7");
    obj.edit20:setName("edit20");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout8);
    obj.label22:setLeft(325);
    obj.label22:setTop(1);
    obj.label22:setWidth(55);
    obj.label22:setHeight(20);
    obj.label22:setText("LIVRO");
    obj.label22:setName("label22");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout8);
    obj.edit21:setVertTextAlign("center");
    obj.edit21:setLeft(320);
    obj.edit21:setTop(20);
    obj.edit21:setWidth(55);
    obj.edit21:setHeight(23);
    obj.edit21:setField("tOrigem7");
    obj.edit21:setName("edit21");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(375);
    obj.layout9:setWidth(380);
    obj.layout9:setHeight(45);
    obj.layout9:setName("layout9");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout9);
    obj.rectangle9:setAlign("client");
    obj.rectangle9:setColor("black");
    obj.rectangle9:setName("rectangle9");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout9);
    obj.label23:setLeft(5);
    obj.label23:setTop(1);
    obj.label23:setWidth(35);
    obj.label23:setHeight(20);
    obj.label23:setText("NEP");
    obj.label23:setName("label23");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout9);
    obj.edit22:setVertTextAlign("center");
    obj.edit22:setLeft(5);
    obj.edit22:setTop(20);
    obj.edit22:setWidth(35);
    obj.edit22:setHeight(23);
    obj.edit22:setField("tNep8");
    obj.edit22:setName("edit22");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout9);
    obj.label24:setLeft(45);
    obj.label24:setTop(1);
    obj.label24:setWidth(275);
    obj.label24:setHeight(20);
    obj.label24:setText("NOME");
    obj.label24:setName("label24");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout9);
    obj.edit23:setVertTextAlign("center");
    obj.edit23:setLeft(40);
    obj.edit23:setTop(20);
    obj.edit23:setWidth(280);
    obj.edit23:setHeight(23);
    obj.edit23:setField("tNome8");
    obj.edit23:setName("edit23");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout9);
    obj.label25:setLeft(325);
    obj.label25:setTop(1);
    obj.label25:setWidth(55);
    obj.label25:setHeight(20);
    obj.label25:setText("LIVRO");
    obj.label25:setName("label25");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout9);
    obj.edit24:setVertTextAlign("center");
    obj.edit24:setLeft(320);
    obj.edit24:setTop(20);
    obj.edit24:setWidth(55);
    obj.edit24:setHeight(23);
    obj.edit24:setField("tOrigem8");
    obj.edit24:setName("edit24");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(0);
    obj.layout10:setTop(425);
    obj.layout10:setWidth(380);
    obj.layout10:setHeight(45);
    obj.layout10:setName("layout10");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout10);
    obj.rectangle10:setAlign("client");
    obj.rectangle10:setColor("black");
    obj.rectangle10:setName("rectangle10");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout10);
    obj.label26:setLeft(5);
    obj.label26:setTop(1);
    obj.label26:setWidth(35);
    obj.label26:setHeight(20);
    obj.label26:setText("NEP");
    obj.label26:setName("label26");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout10);
    obj.edit25:setVertTextAlign("center");
    obj.edit25:setLeft(5);
    obj.edit25:setTop(20);
    obj.edit25:setWidth(35);
    obj.edit25:setHeight(23);
    obj.edit25:setField("tNep9");
    obj.edit25:setName("edit25");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout10);
    obj.label27:setLeft(45);
    obj.label27:setTop(1);
    obj.label27:setWidth(275);
    obj.label27:setHeight(20);
    obj.label27:setText("NOME");
    obj.label27:setName("label27");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout10);
    obj.edit26:setVertTextAlign("center");
    obj.edit26:setLeft(40);
    obj.edit26:setTop(20);
    obj.edit26:setWidth(280);
    obj.edit26:setHeight(23);
    obj.edit26:setField("tNome9");
    obj.edit26:setName("edit26");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout10);
    obj.label28:setLeft(325);
    obj.label28:setTop(1);
    obj.label28:setWidth(55);
    obj.label28:setHeight(20);
    obj.label28:setText("LIVRO");
    obj.label28:setName("label28");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout10);
    obj.edit27:setVertTextAlign("center");
    obj.edit27:setLeft(320);
    obj.edit27:setTop(20);
    obj.edit27:setWidth(55);
    obj.edit27:setHeight(23);
    obj.edit27:setField("tOrigem9");
    obj.edit27:setName("edit27");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(0);
    obj.layout11:setTop(475);
    obj.layout11:setWidth(380);
    obj.layout11:setHeight(45);
    obj.layout11:setName("layout11");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout11);
    obj.rectangle11:setAlign("client");
    obj.rectangle11:setColor("black");
    obj.rectangle11:setName("rectangle11");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout11);
    obj.label29:setLeft(5);
    obj.label29:setTop(1);
    obj.label29:setWidth(35);
    obj.label29:setHeight(20);
    obj.label29:setText("NEP");
    obj.label29:setName("label29");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout11);
    obj.edit28:setVertTextAlign("center");
    obj.edit28:setLeft(5);
    obj.edit28:setTop(20);
    obj.edit28:setWidth(35);
    obj.edit28:setHeight(23);
    obj.edit28:setField("tNep10");
    obj.edit28:setName("edit28");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout11);
    obj.label30:setLeft(45);
    obj.label30:setTop(1);
    obj.label30:setWidth(275);
    obj.label30:setHeight(20);
    obj.label30:setText("NOME");
    obj.label30:setName("label30");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout11);
    obj.edit29:setVertTextAlign("center");
    obj.edit29:setLeft(40);
    obj.edit29:setTop(20);
    obj.edit29:setWidth(280);
    obj.edit29:setHeight(23);
    obj.edit29:setField("tNome10");
    obj.edit29:setName("edit29");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout11);
    obj.label31:setLeft(325);
    obj.label31:setTop(1);
    obj.label31:setWidth(55);
    obj.label31:setHeight(20);
    obj.label31:setText("LIVRO");
    obj.label31:setName("label31");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout11);
    obj.edit30:setVertTextAlign("center");
    obj.edit30:setLeft(320);
    obj.edit30:setTop(20);
    obj.edit30:setWidth(55);
    obj.edit30:setHeight(23);
    obj.edit30:setField("tOrigem10");
    obj.edit30:setName("edit30");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(525);
    obj.layout12:setWidth(380);
    obj.layout12:setHeight(45);
    obj.layout12:setName("layout12");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout12);
    obj.rectangle12:setAlign("client");
    obj.rectangle12:setColor("black");
    obj.rectangle12:setName("rectangle12");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout12);
    obj.label32:setLeft(5);
    obj.label32:setTop(1);
    obj.label32:setWidth(35);
    obj.label32:setHeight(20);
    obj.label32:setText("NEP");
    obj.label32:setName("label32");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout12);
    obj.edit31:setVertTextAlign("center");
    obj.edit31:setLeft(5);
    obj.edit31:setTop(20);
    obj.edit31:setWidth(35);
    obj.edit31:setHeight(23);
    obj.edit31:setField("tNep11");
    obj.edit31:setName("edit31");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout12);
    obj.label33:setLeft(45);
    obj.label33:setTop(1);
    obj.label33:setWidth(275);
    obj.label33:setHeight(20);
    obj.label33:setText("NOME");
    obj.label33:setName("label33");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout12);
    obj.edit32:setVertTextAlign("center");
    obj.edit32:setLeft(40);
    obj.edit32:setTop(20);
    obj.edit32:setWidth(280);
    obj.edit32:setHeight(23);
    obj.edit32:setField("tNome11");
    obj.edit32:setName("edit32");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout12);
    obj.label34:setLeft(325);
    obj.label34:setTop(1);
    obj.label34:setWidth(55);
    obj.label34:setHeight(20);
    obj.label34:setText("LIVRO");
    obj.label34:setName("label34");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout12);
    obj.edit33:setVertTextAlign("center");
    obj.edit33:setLeft(320);
    obj.edit33:setTop(20);
    obj.edit33:setWidth(55);
    obj.edit33:setHeight(23);
    obj.edit33:setField("tOrigem11");
    obj.edit33:setName("edit33");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(575);
    obj.layout13:setWidth(380);
    obj.layout13:setHeight(45);
    obj.layout13:setName("layout13");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout13);
    obj.rectangle13:setAlign("client");
    obj.rectangle13:setColor("black");
    obj.rectangle13:setName("rectangle13");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout13);
    obj.label35:setLeft(5);
    obj.label35:setTop(1);
    obj.label35:setWidth(35);
    obj.label35:setHeight(20);
    obj.label35:setText("NEP");
    obj.label35:setName("label35");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout13);
    obj.edit34:setVertTextAlign("center");
    obj.edit34:setLeft(5);
    obj.edit34:setTop(20);
    obj.edit34:setWidth(35);
    obj.edit34:setHeight(23);
    obj.edit34:setField("tNep12");
    obj.edit34:setName("edit34");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout13);
    obj.label36:setLeft(45);
    obj.label36:setTop(1);
    obj.label36:setWidth(275);
    obj.label36:setHeight(20);
    obj.label36:setText("NOME");
    obj.label36:setName("label36");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout13);
    obj.edit35:setVertTextAlign("center");
    obj.edit35:setLeft(40);
    obj.edit35:setTop(20);
    obj.edit35:setWidth(280);
    obj.edit35:setHeight(23);
    obj.edit35:setField("tNome12");
    obj.edit35:setName("edit35");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout13);
    obj.label37:setLeft(325);
    obj.label37:setTop(1);
    obj.label37:setWidth(55);
    obj.label37:setHeight(20);
    obj.label37:setText("LIVRO");
    obj.label37:setName("label37");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout13);
    obj.edit36:setVertTextAlign("center");
    obj.edit36:setLeft(320);
    obj.edit36:setTop(20);
    obj.edit36:setWidth(55);
    obj.edit36:setHeight(23);
    obj.edit36:setField("tOrigem12");
    obj.edit36:setName("edit36");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout1);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(625);
    obj.layout14:setWidth(380);
    obj.layout14:setHeight(45);
    obj.layout14:setName("layout14");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout14);
    obj.rectangle14:setAlign("client");
    obj.rectangle14:setColor("black");
    obj.rectangle14:setName("rectangle14");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout14);
    obj.label38:setLeft(5);
    obj.label38:setTop(1);
    obj.label38:setWidth(35);
    obj.label38:setHeight(20);
    obj.label38:setText("NEP");
    obj.label38:setName("label38");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout14);
    obj.edit37:setVertTextAlign("center");
    obj.edit37:setLeft(5);
    obj.edit37:setTop(20);
    obj.edit37:setWidth(35);
    obj.edit37:setHeight(23);
    obj.edit37:setField("tNep13");
    obj.edit37:setName("edit37");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout14);
    obj.label39:setLeft(45);
    obj.label39:setTop(1);
    obj.label39:setWidth(275);
    obj.label39:setHeight(20);
    obj.label39:setText("NOME");
    obj.label39:setName("label39");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout14);
    obj.edit38:setVertTextAlign("center");
    obj.edit38:setLeft(40);
    obj.edit38:setTop(20);
    obj.edit38:setWidth(280);
    obj.edit38:setHeight(23);
    obj.edit38:setField("tNome13");
    obj.edit38:setName("edit38");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout14);
    obj.label40:setLeft(325);
    obj.label40:setTop(1);
    obj.label40:setWidth(55);
    obj.label40:setHeight(20);
    obj.label40:setText("LIVRO");
    obj.label40:setName("label40");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout14);
    obj.edit39:setVertTextAlign("center");
    obj.edit39:setLeft(320);
    obj.edit39:setTop(20);
    obj.edit39:setWidth(55);
    obj.edit39:setHeight(23);
    obj.edit39:setField("tOrigem13");
    obj.edit39:setName("edit39");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout1);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(675);
    obj.layout15:setWidth(380);
    obj.layout15:setHeight(45);
    obj.layout15:setName("layout15");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout15);
    obj.rectangle15:setAlign("client");
    obj.rectangle15:setColor("black");
    obj.rectangle15:setName("rectangle15");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout15);
    obj.label41:setLeft(5);
    obj.label41:setTop(1);
    obj.label41:setWidth(35);
    obj.label41:setHeight(20);
    obj.label41:setText("NEP");
    obj.label41:setName("label41");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout15);
    obj.edit40:setVertTextAlign("center");
    obj.edit40:setLeft(5);
    obj.edit40:setTop(20);
    obj.edit40:setWidth(35);
    obj.edit40:setHeight(23);
    obj.edit40:setField("tNep14");
    obj.edit40:setName("edit40");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout15);
    obj.label42:setLeft(45);
    obj.label42:setTop(1);
    obj.label42:setWidth(275);
    obj.label42:setHeight(20);
    obj.label42:setText("NOME");
    obj.label42:setName("label42");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout15);
    obj.edit41:setVertTextAlign("center");
    obj.edit41:setLeft(40);
    obj.edit41:setTop(20);
    obj.edit41:setWidth(280);
    obj.edit41:setHeight(23);
    obj.edit41:setField("tNome14");
    obj.edit41:setName("edit41");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout15);
    obj.label43:setLeft(325);
    obj.label43:setTop(1);
    obj.label43:setWidth(55);
    obj.label43:setHeight(20);
    obj.label43:setText("LIVRO");
    obj.label43:setName("label43");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout15);
    obj.edit42:setVertTextAlign("center");
    obj.edit42:setLeft(320);
    obj.edit42:setTop(20);
    obj.edit42:setWidth(55);
    obj.edit42:setHeight(23);
    obj.edit42:setField("tOrigem14");
    obj.edit42:setName("edit42");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout1);
    obj.layout16:setLeft(0);
    obj.layout16:setTop(725);
    obj.layout16:setWidth(380);
    obj.layout16:setHeight(45);
    obj.layout16:setName("layout16");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout16);
    obj.rectangle16:setAlign("client");
    obj.rectangle16:setColor("black");
    obj.rectangle16:setName("rectangle16");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout16);
    obj.label44:setLeft(5);
    obj.label44:setTop(1);
    obj.label44:setWidth(35);
    obj.label44:setHeight(20);
    obj.label44:setText("NEP");
    obj.label44:setName("label44");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout16);
    obj.edit43:setVertTextAlign("center");
    obj.edit43:setLeft(5);
    obj.edit43:setTop(20);
    obj.edit43:setWidth(35);
    obj.edit43:setHeight(23);
    obj.edit43:setField("tNep29");
    obj.edit43:setName("edit43");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout16);
    obj.label45:setLeft(45);
    obj.label45:setTop(1);
    obj.label45:setWidth(275);
    obj.label45:setHeight(20);
    obj.label45:setText("NOME");
    obj.label45:setName("label45");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout16);
    obj.edit44:setVertTextAlign("center");
    obj.edit44:setLeft(40);
    obj.edit44:setTop(20);
    obj.edit44:setWidth(280);
    obj.edit44:setHeight(23);
    obj.edit44:setField("tNome29");
    obj.edit44:setName("edit44");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout16);
    obj.label46:setLeft(325);
    obj.label46:setTop(1);
    obj.label46:setWidth(55);
    obj.label46:setHeight(20);
    obj.label46:setText("LIVRO");
    obj.label46:setName("label46");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout16);
    obj.edit45:setVertTextAlign("center");
    obj.edit45:setLeft(320);
    obj.edit45:setTop(20);
    obj.edit45:setWidth(55);
    obj.edit45:setHeight(23);
    obj.edit45:setField("tOrigem29");
    obj.edit45:setName("edit45");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout1);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(775);
    obj.layout17:setWidth(380);
    obj.layout17:setHeight(45);
    obj.layout17:setName("layout17");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout17);
    obj.rectangle17:setAlign("client");
    obj.rectangle17:setColor("black");
    obj.rectangle17:setName("rectangle17");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout17);
    obj.label47:setLeft(5);
    obj.label47:setTop(1);
    obj.label47:setWidth(35);
    obj.label47:setHeight(20);
    obj.label47:setText("NEP");
    obj.label47:setName("label47");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout17);
    obj.edit46:setVertTextAlign("center");
    obj.edit46:setLeft(5);
    obj.edit46:setTop(20);
    obj.edit46:setWidth(35);
    obj.edit46:setHeight(23);
    obj.edit46:setField("tNep31");
    obj.edit46:setName("edit46");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout17);
    obj.label48:setLeft(45);
    obj.label48:setTop(1);
    obj.label48:setWidth(275);
    obj.label48:setHeight(20);
    obj.label48:setText("NOME");
    obj.label48:setName("label48");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout17);
    obj.edit47:setVertTextAlign("center");
    obj.edit47:setLeft(40);
    obj.edit47:setTop(20);
    obj.edit47:setWidth(280);
    obj.edit47:setHeight(23);
    obj.edit47:setField("tNome31");
    obj.edit47:setName("edit47");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout17);
    obj.label49:setLeft(325);
    obj.label49:setTop(1);
    obj.label49:setWidth(55);
    obj.label49:setHeight(20);
    obj.label49:setText("LIVRO");
    obj.label49:setName("label49");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout17);
    obj.edit48:setVertTextAlign("center");
    obj.edit48:setLeft(320);
    obj.edit48:setTop(20);
    obj.edit48:setWidth(55);
    obj.edit48:setHeight(23);
    obj.edit48:setField("tOrigem31");
    obj.edit48:setName("edit48");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout1);
    obj.layout18:setLeft(0);
    obj.layout18:setTop(825);
    obj.layout18:setWidth(380);
    obj.layout18:setHeight(45);
    obj.layout18:setName("layout18");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout18);
    obj.rectangle18:setAlign("client");
    obj.rectangle18:setColor("black");
    obj.rectangle18:setName("rectangle18");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout18);
    obj.label50:setLeft(5);
    obj.label50:setTop(1);
    obj.label50:setWidth(35);
    obj.label50:setHeight(20);
    obj.label50:setText("NEP");
    obj.label50:setName("label50");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout18);
    obj.edit49:setVertTextAlign("center");
    obj.edit49:setLeft(5);
    obj.edit49:setTop(20);
    obj.edit49:setWidth(35);
    obj.edit49:setHeight(23);
    obj.edit49:setField("tNep32");
    obj.edit49:setName("edit49");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout18);
    obj.label51:setLeft(45);
    obj.label51:setTop(1);
    obj.label51:setWidth(275);
    obj.label51:setHeight(20);
    obj.label51:setText("NOME");
    obj.label51:setName("label51");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout18);
    obj.edit50:setVertTextAlign("center");
    obj.edit50:setLeft(40);
    obj.edit50:setTop(20);
    obj.edit50:setWidth(280);
    obj.edit50:setHeight(23);
    obj.edit50:setField("tNome32");
    obj.edit50:setName("edit50");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout18);
    obj.label52:setLeft(325);
    obj.label52:setTop(1);
    obj.label52:setWidth(55);
    obj.label52:setHeight(20);
    obj.label52:setText("LIVRO");
    obj.label52:setName("label52");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout18);
    obj.edit51:setVertTextAlign("center");
    obj.edit51:setLeft(320);
    obj.edit51:setTop(20);
    obj.edit51:setWidth(55);
    obj.edit51:setHeight(23);
    obj.edit51:setField("tOrigem32");
    obj.edit51:setName("edit51");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout1);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(875);
    obj.layout19:setWidth(380);
    obj.layout19:setHeight(45);
    obj.layout19:setName("layout19");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout19);
    obj.rectangle19:setAlign("client");
    obj.rectangle19:setColor("black");
    obj.rectangle19:setName("rectangle19");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout19);
    obj.label53:setLeft(5);
    obj.label53:setTop(1);
    obj.label53:setWidth(35);
    obj.label53:setHeight(20);
    obj.label53:setText("NEP");
    obj.label53:setName("label53");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout19);
    obj.edit52:setVertTextAlign("center");
    obj.edit52:setLeft(5);
    obj.edit52:setTop(20);
    obj.edit52:setWidth(35);
    obj.edit52:setHeight(23);
    obj.edit52:setField("tNep33");
    obj.edit52:setName("edit52");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout19);
    obj.label54:setLeft(45);
    obj.label54:setTop(1);
    obj.label54:setWidth(275);
    obj.label54:setHeight(20);
    obj.label54:setText("NOME");
    obj.label54:setName("label54");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout19);
    obj.edit53:setVertTextAlign("center");
    obj.edit53:setLeft(40);
    obj.edit53:setTop(20);
    obj.edit53:setWidth(280);
    obj.edit53:setHeight(23);
    obj.edit53:setField("tNome33");
    obj.edit53:setName("edit53");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout19);
    obj.label55:setLeft(325);
    obj.label55:setTop(1);
    obj.label55:setWidth(55);
    obj.label55:setHeight(20);
    obj.label55:setText("LIVRO");
    obj.label55:setName("label55");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout19);
    obj.edit54:setVertTextAlign("center");
    obj.edit54:setLeft(320);
    obj.edit54:setTop(20);
    obj.edit54:setWidth(55);
    obj.edit54:setHeight(23);
    obj.edit54:setField("tOrigem33");
    obj.edit54:setName("edit54");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout1);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(925);
    obj.layout20:setWidth(380);
    obj.layout20:setHeight(45);
    obj.layout20:setName("layout20");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout20);
    obj.rectangle20:setAlign("client");
    obj.rectangle20:setColor("black");
    obj.rectangle20:setName("rectangle20");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout20);
    obj.label56:setLeft(5);
    obj.label56:setTop(1);
    obj.label56:setWidth(35);
    obj.label56:setHeight(20);
    obj.label56:setText("NEP");
    obj.label56:setName("label56");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout20);
    obj.edit55:setVertTextAlign("center");
    obj.edit55:setLeft(5);
    obj.edit55:setTop(20);
    obj.edit55:setWidth(35);
    obj.edit55:setHeight(23);
    obj.edit55:setField("tNep34");
    obj.edit55:setName("edit55");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout20);
    obj.label57:setLeft(45);
    obj.label57:setTop(1);
    obj.label57:setWidth(275);
    obj.label57:setHeight(20);
    obj.label57:setText("NOME");
    obj.label57:setName("label57");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout20);
    obj.edit56:setVertTextAlign("center");
    obj.edit56:setLeft(40);
    obj.edit56:setTop(20);
    obj.edit56:setWidth(280);
    obj.edit56:setHeight(23);
    obj.edit56:setField("tNome34");
    obj.edit56:setName("edit56");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout20);
    obj.label58:setLeft(325);
    obj.label58:setTop(1);
    obj.label58:setWidth(55);
    obj.label58:setHeight(20);
    obj.label58:setText("LIVRO");
    obj.label58:setName("label58");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout20);
    obj.edit57:setVertTextAlign("center");
    obj.edit57:setLeft(320);
    obj.edit57:setTop(20);
    obj.edit57:setWidth(55);
    obj.edit57:setHeight(23);
    obj.edit57:setField("tOrigem34");
    obj.edit57:setName("edit57");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout1);
    obj.layout21:setLeft(0);
    obj.layout21:setTop(975);
    obj.layout21:setWidth(380);
    obj.layout21:setHeight(45);
    obj.layout21:setName("layout21");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout21);
    obj.rectangle21:setAlign("client");
    obj.rectangle21:setColor("black");
    obj.rectangle21:setName("rectangle21");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout21);
    obj.label59:setLeft(5);
    obj.label59:setTop(1);
    obj.label59:setWidth(35);
    obj.label59:setHeight(20);
    obj.label59:setText("NEP");
    obj.label59:setName("label59");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout21);
    obj.edit58:setVertTextAlign("center");
    obj.edit58:setLeft(5);
    obj.edit58:setTop(20);
    obj.edit58:setWidth(35);
    obj.edit58:setHeight(23);
    obj.edit58:setField("tNep35");
    obj.edit58:setName("edit58");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout21);
    obj.label60:setLeft(45);
    obj.label60:setTop(1);
    obj.label60:setWidth(275);
    obj.label60:setHeight(20);
    obj.label60:setText("NOME");
    obj.label60:setName("label60");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout21);
    obj.edit59:setVertTextAlign("center");
    obj.edit59:setLeft(40);
    obj.edit59:setTop(20);
    obj.edit59:setWidth(280);
    obj.edit59:setHeight(23);
    obj.edit59:setField("tNome35");
    obj.edit59:setName("edit59");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout21);
    obj.label61:setLeft(325);
    obj.label61:setTop(1);
    obj.label61:setWidth(55);
    obj.label61:setHeight(20);
    obj.label61:setText("LIVRO");
    obj.label61:setName("label61");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout21);
    obj.edit60:setVertTextAlign("center");
    obj.edit60:setLeft(320);
    obj.edit60:setTop(20);
    obj.edit60:setWidth(55);
    obj.edit60:setHeight(23);
    obj.edit60:setField("tOrigem35");
    obj.edit60:setName("edit60");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.scrollBox1);
    obj.layout22:setLeft(405);
    obj.layout22:setTop(0);
    obj.layout22:setWidth(380);
    obj.layout22:setHeight(1020);
    obj.layout22:setName("layout22");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout22);
    obj.rectangle22:setAlign("client");
    obj.rectangle22:setColor("#0000007F");
    obj.rectangle22:setName("rectangle22");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout22);
    obj.label62:setLeft(0);
    obj.label62:setTop(0);
    obj.label62:setWidth(380);
    obj.label62:setHeight(20);
    obj.label62:setText("OUTROS");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout22);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(25);
    obj.layout23:setWidth(380);
    obj.layout23:setHeight(45);
    obj.layout23:setName("layout23");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout23);
    obj.rectangle23:setAlign("client");
    obj.rectangle23:setColor("black");
    obj.rectangle23:setName("rectangle23");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout23);
    obj.label63:setLeft(5);
    obj.label63:setTop(1);
    obj.label63:setWidth(35);
    obj.label63:setHeight(20);
    obj.label63:setText("NEP");
    obj.label63:setName("label63");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout23);
    obj.edit61:setVertTextAlign("center");
    obj.edit61:setLeft(5);
    obj.edit61:setTop(20);
    obj.edit61:setWidth(35);
    obj.edit61:setHeight(23);
    obj.edit61:setField("tNep15");
    obj.edit61:setName("edit61");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout23);
    obj.label64:setLeft(45);
    obj.label64:setTop(1);
    obj.label64:setWidth(275);
    obj.label64:setHeight(20);
    obj.label64:setText("NOME");
    obj.label64:setName("label64");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout23);
    obj.edit62:setVertTextAlign("center");
    obj.edit62:setLeft(40);
    obj.edit62:setTop(20);
    obj.edit62:setWidth(280);
    obj.edit62:setHeight(23);
    obj.edit62:setField("tNome15");
    obj.edit62:setName("edit62");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout23);
    obj.label65:setLeft(325);
    obj.label65:setTop(1);
    obj.label65:setWidth(55);
    obj.label65:setHeight(20);
    obj.label65:setText("LIVRO");
    obj.label65:setName("label65");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout23);
    obj.edit63:setVertTextAlign("center");
    obj.edit63:setLeft(320);
    obj.edit63:setTop(20);
    obj.edit63:setWidth(55);
    obj.edit63:setHeight(23);
    obj.edit63:setField("tOrigem15");
    obj.edit63:setName("edit63");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout22);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(75);
    obj.layout24:setWidth(380);
    obj.layout24:setHeight(45);
    obj.layout24:setName("layout24");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout24);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setName("rectangle24");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout24);
    obj.label66:setLeft(5);
    obj.label66:setTop(1);
    obj.label66:setWidth(35);
    obj.label66:setHeight(20);
    obj.label66:setText("NEP");
    obj.label66:setName("label66");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout24);
    obj.edit64:setVertTextAlign("center");
    obj.edit64:setLeft(5);
    obj.edit64:setTop(20);
    obj.edit64:setWidth(35);
    obj.edit64:setHeight(23);
    obj.edit64:setField("tNep16");
    obj.edit64:setName("edit64");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout24);
    obj.label67:setLeft(45);
    obj.label67:setTop(1);
    obj.label67:setWidth(275);
    obj.label67:setHeight(20);
    obj.label67:setText("NOME");
    obj.label67:setName("label67");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout24);
    obj.edit65:setVertTextAlign("center");
    obj.edit65:setLeft(40);
    obj.edit65:setTop(20);
    obj.edit65:setWidth(280);
    obj.edit65:setHeight(23);
    obj.edit65:setField("tNome16");
    obj.edit65:setName("edit65");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout24);
    obj.label68:setLeft(325);
    obj.label68:setTop(1);
    obj.label68:setWidth(55);
    obj.label68:setHeight(20);
    obj.label68:setText("LIVRO");
    obj.label68:setName("label68");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout24);
    obj.edit66:setVertTextAlign("center");
    obj.edit66:setLeft(320);
    obj.edit66:setTop(20);
    obj.edit66:setWidth(55);
    obj.edit66:setHeight(23);
    obj.edit66:setField("tOrigem16");
    obj.edit66:setName("edit66");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout22);
    obj.layout25:setLeft(0);
    obj.layout25:setTop(125);
    obj.layout25:setWidth(380);
    obj.layout25:setHeight(45);
    obj.layout25:setName("layout25");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout25);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setName("rectangle25");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout25);
    obj.label69:setLeft(5);
    obj.label69:setTop(1);
    obj.label69:setWidth(35);
    obj.label69:setHeight(20);
    obj.label69:setText("NEP");
    obj.label69:setName("label69");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout25);
    obj.edit67:setVertTextAlign("center");
    obj.edit67:setLeft(5);
    obj.edit67:setTop(20);
    obj.edit67:setWidth(35);
    obj.edit67:setHeight(23);
    obj.edit67:setField("tNep17");
    obj.edit67:setName("edit67");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout25);
    obj.label70:setLeft(45);
    obj.label70:setTop(1);
    obj.label70:setWidth(275);
    obj.label70:setHeight(20);
    obj.label70:setText("NOME");
    obj.label70:setName("label70");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout25);
    obj.edit68:setVertTextAlign("center");
    obj.edit68:setLeft(40);
    obj.edit68:setTop(20);
    obj.edit68:setWidth(280);
    obj.edit68:setHeight(23);
    obj.edit68:setField("tNome17");
    obj.edit68:setName("edit68");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout25);
    obj.label71:setLeft(325);
    obj.label71:setTop(1);
    obj.label71:setWidth(55);
    obj.label71:setHeight(20);
    obj.label71:setText("LIVRO");
    obj.label71:setName("label71");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout25);
    obj.edit69:setVertTextAlign("center");
    obj.edit69:setLeft(320);
    obj.edit69:setTop(20);
    obj.edit69:setWidth(55);
    obj.edit69:setHeight(23);
    obj.edit69:setField("tOrigem17");
    obj.edit69:setName("edit69");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout22);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(175);
    obj.layout26:setWidth(380);
    obj.layout26:setHeight(45);
    obj.layout26:setName("layout26");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout26);
    obj.rectangle26:setAlign("client");
    obj.rectangle26:setColor("black");
    obj.rectangle26:setName("rectangle26");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout26);
    obj.label72:setLeft(5);
    obj.label72:setTop(1);
    obj.label72:setWidth(35);
    obj.label72:setHeight(20);
    obj.label72:setText("NEP");
    obj.label72:setName("label72");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout26);
    obj.edit70:setVertTextAlign("center");
    obj.edit70:setLeft(5);
    obj.edit70:setTop(20);
    obj.edit70:setWidth(35);
    obj.edit70:setHeight(23);
    obj.edit70:setField("tNep18");
    obj.edit70:setName("edit70");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout26);
    obj.label73:setLeft(45);
    obj.label73:setTop(1);
    obj.label73:setWidth(275);
    obj.label73:setHeight(20);
    obj.label73:setText("NOME");
    obj.label73:setName("label73");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout26);
    obj.edit71:setVertTextAlign("center");
    obj.edit71:setLeft(40);
    obj.edit71:setTop(20);
    obj.edit71:setWidth(280);
    obj.edit71:setHeight(23);
    obj.edit71:setField("tNome18");
    obj.edit71:setName("edit71");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout26);
    obj.label74:setLeft(325);
    obj.label74:setTop(1);
    obj.label74:setWidth(55);
    obj.label74:setHeight(20);
    obj.label74:setText("LIVRO");
    obj.label74:setName("label74");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout26);
    obj.edit72:setVertTextAlign("center");
    obj.edit72:setLeft(320);
    obj.edit72:setTop(20);
    obj.edit72:setWidth(55);
    obj.edit72:setHeight(23);
    obj.edit72:setField("tOrigem18");
    obj.edit72:setName("edit72");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout22);
    obj.layout27:setLeft(0);
    obj.layout27:setTop(225);
    obj.layout27:setWidth(380);
    obj.layout27:setHeight(45);
    obj.layout27:setName("layout27");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout27);
    obj.rectangle27:setAlign("client");
    obj.rectangle27:setColor("black");
    obj.rectangle27:setName("rectangle27");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout27);
    obj.label75:setLeft(5);
    obj.label75:setTop(1);
    obj.label75:setWidth(35);
    obj.label75:setHeight(20);
    obj.label75:setText("NEP");
    obj.label75:setName("label75");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout27);
    obj.edit73:setVertTextAlign("center");
    obj.edit73:setLeft(5);
    obj.edit73:setTop(20);
    obj.edit73:setWidth(35);
    obj.edit73:setHeight(23);
    obj.edit73:setField("tNep19");
    obj.edit73:setName("edit73");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout27);
    obj.label76:setLeft(45);
    obj.label76:setTop(1);
    obj.label76:setWidth(275);
    obj.label76:setHeight(20);
    obj.label76:setText("NOME");
    obj.label76:setName("label76");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout27);
    obj.edit74:setVertTextAlign("center");
    obj.edit74:setLeft(40);
    obj.edit74:setTop(20);
    obj.edit74:setWidth(280);
    obj.edit74:setHeight(23);
    obj.edit74:setField("tNome19");
    obj.edit74:setName("edit74");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout27);
    obj.label77:setLeft(325);
    obj.label77:setTop(1);
    obj.label77:setWidth(55);
    obj.label77:setHeight(20);
    obj.label77:setText("LIVRO");
    obj.label77:setName("label77");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout27);
    obj.edit75:setVertTextAlign("center");
    obj.edit75:setLeft(320);
    obj.edit75:setTop(20);
    obj.edit75:setWidth(55);
    obj.edit75:setHeight(23);
    obj.edit75:setField("tOrigem19");
    obj.edit75:setName("edit75");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout22);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(275);
    obj.layout28:setWidth(380);
    obj.layout28:setHeight(45);
    obj.layout28:setName("layout28");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout28);
    obj.rectangle28:setAlign("client");
    obj.rectangle28:setColor("black");
    obj.rectangle28:setName("rectangle28");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout28);
    obj.label78:setLeft(5);
    obj.label78:setTop(1);
    obj.label78:setWidth(35);
    obj.label78:setHeight(20);
    obj.label78:setText("NEP");
    obj.label78:setName("label78");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout28);
    obj.edit76:setVertTextAlign("center");
    obj.edit76:setLeft(5);
    obj.edit76:setTop(20);
    obj.edit76:setWidth(35);
    obj.edit76:setHeight(23);
    obj.edit76:setField("tNep20");
    obj.edit76:setName("edit76");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout28);
    obj.label79:setLeft(45);
    obj.label79:setTop(1);
    obj.label79:setWidth(275);
    obj.label79:setHeight(20);
    obj.label79:setText("NOME");
    obj.label79:setName("label79");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout28);
    obj.edit77:setVertTextAlign("center");
    obj.edit77:setLeft(40);
    obj.edit77:setTop(20);
    obj.edit77:setWidth(280);
    obj.edit77:setHeight(23);
    obj.edit77:setField("tNome20");
    obj.edit77:setName("edit77");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout28);
    obj.label80:setLeft(325);
    obj.label80:setTop(1);
    obj.label80:setWidth(55);
    obj.label80:setHeight(20);
    obj.label80:setText("LIVRO");
    obj.label80:setName("label80");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout28);
    obj.edit78:setVertTextAlign("center");
    obj.edit78:setLeft(320);
    obj.edit78:setTop(20);
    obj.edit78:setWidth(55);
    obj.edit78:setHeight(23);
    obj.edit78:setField("tOrigem20");
    obj.edit78:setName("edit78");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout22);
    obj.layout29:setLeft(0);
    obj.layout29:setTop(325);
    obj.layout29:setWidth(380);
    obj.layout29:setHeight(45);
    obj.layout29:setName("layout29");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout29);
    obj.rectangle29:setAlign("client");
    obj.rectangle29:setColor("black");
    obj.rectangle29:setName("rectangle29");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout29);
    obj.label81:setLeft(5);
    obj.label81:setTop(1);
    obj.label81:setWidth(35);
    obj.label81:setHeight(20);
    obj.label81:setText("NEP");
    obj.label81:setName("label81");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout29);
    obj.edit79:setVertTextAlign("center");
    obj.edit79:setLeft(5);
    obj.edit79:setTop(20);
    obj.edit79:setWidth(35);
    obj.edit79:setHeight(23);
    obj.edit79:setField("tNep21");
    obj.edit79:setName("edit79");

    obj.label82 = gui.fromHandle(_obj_newObject("label"));
    obj.label82:setParent(obj.layout29);
    obj.label82:setLeft(45);
    obj.label82:setTop(1);
    obj.label82:setWidth(275);
    obj.label82:setHeight(20);
    obj.label82:setText("NOME");
    obj.label82:setName("label82");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout29);
    obj.edit80:setVertTextAlign("center");
    obj.edit80:setLeft(40);
    obj.edit80:setTop(20);
    obj.edit80:setWidth(280);
    obj.edit80:setHeight(23);
    obj.edit80:setField("tNome21");
    obj.edit80:setName("edit80");

    obj.label83 = gui.fromHandle(_obj_newObject("label"));
    obj.label83:setParent(obj.layout29);
    obj.label83:setLeft(325);
    obj.label83:setTop(1);
    obj.label83:setWidth(55);
    obj.label83:setHeight(20);
    obj.label83:setText("LIVRO");
    obj.label83:setName("label83");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout29);
    obj.edit81:setVertTextAlign("center");
    obj.edit81:setLeft(320);
    obj.edit81:setTop(20);
    obj.edit81:setWidth(55);
    obj.edit81:setHeight(23);
    obj.edit81:setField("tOrigem21");
    obj.edit81:setName("edit81");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout22);
    obj.layout30:setLeft(0);
    obj.layout30:setTop(375);
    obj.layout30:setWidth(380);
    obj.layout30:setHeight(45);
    obj.layout30:setName("layout30");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout30);
    obj.rectangle30:setAlign("client");
    obj.rectangle30:setColor("black");
    obj.rectangle30:setName("rectangle30");

    obj.label84 = gui.fromHandle(_obj_newObject("label"));
    obj.label84:setParent(obj.layout30);
    obj.label84:setLeft(5);
    obj.label84:setTop(1);
    obj.label84:setWidth(35);
    obj.label84:setHeight(20);
    obj.label84:setText("NEP");
    obj.label84:setName("label84");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout30);
    obj.edit82:setVertTextAlign("center");
    obj.edit82:setLeft(5);
    obj.edit82:setTop(20);
    obj.edit82:setWidth(35);
    obj.edit82:setHeight(23);
    obj.edit82:setField("tNep22");
    obj.edit82:setName("edit82");

    obj.label85 = gui.fromHandle(_obj_newObject("label"));
    obj.label85:setParent(obj.layout30);
    obj.label85:setLeft(45);
    obj.label85:setTop(1);
    obj.label85:setWidth(275);
    obj.label85:setHeight(20);
    obj.label85:setText("NOME");
    obj.label85:setName("label85");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout30);
    obj.edit83:setVertTextAlign("center");
    obj.edit83:setLeft(40);
    obj.edit83:setTop(20);
    obj.edit83:setWidth(280);
    obj.edit83:setHeight(23);
    obj.edit83:setField("tNome22");
    obj.edit83:setName("edit83");

    obj.label86 = gui.fromHandle(_obj_newObject("label"));
    obj.label86:setParent(obj.layout30);
    obj.label86:setLeft(325);
    obj.label86:setTop(1);
    obj.label86:setWidth(55);
    obj.label86:setHeight(20);
    obj.label86:setText("LIVRO");
    obj.label86:setName("label86");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout30);
    obj.edit84:setVertTextAlign("center");
    obj.edit84:setLeft(320);
    obj.edit84:setTop(20);
    obj.edit84:setWidth(55);
    obj.edit84:setHeight(23);
    obj.edit84:setField("tOrigem22");
    obj.edit84:setName("edit84");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout22);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(425);
    obj.layout31:setWidth(380);
    obj.layout31:setHeight(45);
    obj.layout31:setName("layout31");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout31);
    obj.rectangle31:setAlign("client");
    obj.rectangle31:setColor("black");
    obj.rectangle31:setName("rectangle31");

    obj.label87 = gui.fromHandle(_obj_newObject("label"));
    obj.label87:setParent(obj.layout31);
    obj.label87:setLeft(5);
    obj.label87:setTop(1);
    obj.label87:setWidth(35);
    obj.label87:setHeight(20);
    obj.label87:setText("NEP");
    obj.label87:setName("label87");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout31);
    obj.edit85:setVertTextAlign("center");
    obj.edit85:setLeft(5);
    obj.edit85:setTop(20);
    obj.edit85:setWidth(35);
    obj.edit85:setHeight(23);
    obj.edit85:setField("tNep23");
    obj.edit85:setName("edit85");

    obj.label88 = gui.fromHandle(_obj_newObject("label"));
    obj.label88:setParent(obj.layout31);
    obj.label88:setLeft(45);
    obj.label88:setTop(1);
    obj.label88:setWidth(275);
    obj.label88:setHeight(20);
    obj.label88:setText("NOME");
    obj.label88:setName("label88");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout31);
    obj.edit86:setVertTextAlign("center");
    obj.edit86:setLeft(40);
    obj.edit86:setTop(20);
    obj.edit86:setWidth(280);
    obj.edit86:setHeight(23);
    obj.edit86:setField("tNome23");
    obj.edit86:setName("edit86");

    obj.label89 = gui.fromHandle(_obj_newObject("label"));
    obj.label89:setParent(obj.layout31);
    obj.label89:setLeft(325);
    obj.label89:setTop(1);
    obj.label89:setWidth(55);
    obj.label89:setHeight(20);
    obj.label89:setText("LIVRO");
    obj.label89:setName("label89");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout31);
    obj.edit87:setVertTextAlign("center");
    obj.edit87:setLeft(320);
    obj.edit87:setTop(20);
    obj.edit87:setWidth(55);
    obj.edit87:setHeight(23);
    obj.edit87:setField("tOrigem23");
    obj.edit87:setName("edit87");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout22);
    obj.layout32:setLeft(0);
    obj.layout32:setTop(475);
    obj.layout32:setWidth(380);
    obj.layout32:setHeight(45);
    obj.layout32:setName("layout32");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout32);
    obj.rectangle32:setAlign("client");
    obj.rectangle32:setColor("black");
    obj.rectangle32:setName("rectangle32");

    obj.label90 = gui.fromHandle(_obj_newObject("label"));
    obj.label90:setParent(obj.layout32);
    obj.label90:setLeft(5);
    obj.label90:setTop(1);
    obj.label90:setWidth(35);
    obj.label90:setHeight(20);
    obj.label90:setText("NEP");
    obj.label90:setName("label90");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout32);
    obj.edit88:setVertTextAlign("center");
    obj.edit88:setLeft(5);
    obj.edit88:setTop(20);
    obj.edit88:setWidth(35);
    obj.edit88:setHeight(23);
    obj.edit88:setField("tNep24");
    obj.edit88:setName("edit88");

    obj.label91 = gui.fromHandle(_obj_newObject("label"));
    obj.label91:setParent(obj.layout32);
    obj.label91:setLeft(45);
    obj.label91:setTop(1);
    obj.label91:setWidth(275);
    obj.label91:setHeight(20);
    obj.label91:setText("NOME");
    obj.label91:setName("label91");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout32);
    obj.edit89:setVertTextAlign("center");
    obj.edit89:setLeft(40);
    obj.edit89:setTop(20);
    obj.edit89:setWidth(280);
    obj.edit89:setHeight(23);
    obj.edit89:setField("tNome24");
    obj.edit89:setName("edit89");

    obj.label92 = gui.fromHandle(_obj_newObject("label"));
    obj.label92:setParent(obj.layout32);
    obj.label92:setLeft(325);
    obj.label92:setTop(1);
    obj.label92:setWidth(55);
    obj.label92:setHeight(20);
    obj.label92:setText("LIVRO");
    obj.label92:setName("label92");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout32);
    obj.edit90:setVertTextAlign("center");
    obj.edit90:setLeft(320);
    obj.edit90:setTop(20);
    obj.edit90:setWidth(55);
    obj.edit90:setHeight(23);
    obj.edit90:setField("tOrigem24");
    obj.edit90:setName("edit90");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout22);
    obj.layout33:setLeft(0);
    obj.layout33:setTop(525);
    obj.layout33:setWidth(380);
    obj.layout33:setHeight(45);
    obj.layout33:setName("layout33");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout33);
    obj.rectangle33:setAlign("client");
    obj.rectangle33:setColor("black");
    obj.rectangle33:setName("rectangle33");

    obj.label93 = gui.fromHandle(_obj_newObject("label"));
    obj.label93:setParent(obj.layout33);
    obj.label93:setLeft(5);
    obj.label93:setTop(1);
    obj.label93:setWidth(35);
    obj.label93:setHeight(20);
    obj.label93:setText("NEP");
    obj.label93:setName("label93");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout33);
    obj.edit91:setVertTextAlign("center");
    obj.edit91:setLeft(5);
    obj.edit91:setTop(20);
    obj.edit91:setWidth(35);
    obj.edit91:setHeight(23);
    obj.edit91:setField("tNep25");
    obj.edit91:setName("edit91");

    obj.label94 = gui.fromHandle(_obj_newObject("label"));
    obj.label94:setParent(obj.layout33);
    obj.label94:setLeft(45);
    obj.label94:setTop(1);
    obj.label94:setWidth(275);
    obj.label94:setHeight(20);
    obj.label94:setText("NOME");
    obj.label94:setName("label94");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout33);
    obj.edit92:setVertTextAlign("center");
    obj.edit92:setLeft(40);
    obj.edit92:setTop(20);
    obj.edit92:setWidth(280);
    obj.edit92:setHeight(23);
    obj.edit92:setField("tNome25");
    obj.edit92:setName("edit92");

    obj.label95 = gui.fromHandle(_obj_newObject("label"));
    obj.label95:setParent(obj.layout33);
    obj.label95:setLeft(325);
    obj.label95:setTop(1);
    obj.label95:setWidth(55);
    obj.label95:setHeight(20);
    obj.label95:setText("LIVRO");
    obj.label95:setName("label95");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout33);
    obj.edit93:setVertTextAlign("center");
    obj.edit93:setLeft(320);
    obj.edit93:setTop(20);
    obj.edit93:setWidth(55);
    obj.edit93:setHeight(23);
    obj.edit93:setField("tOrigem25");
    obj.edit93:setName("edit93");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout22);
    obj.layout34:setLeft(0);
    obj.layout34:setTop(575);
    obj.layout34:setWidth(380);
    obj.layout34:setHeight(45);
    obj.layout34:setName("layout34");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout34);
    obj.rectangle34:setAlign("client");
    obj.rectangle34:setColor("black");
    obj.rectangle34:setName("rectangle34");

    obj.label96 = gui.fromHandle(_obj_newObject("label"));
    obj.label96:setParent(obj.layout34);
    obj.label96:setLeft(5);
    obj.label96:setTop(1);
    obj.label96:setWidth(35);
    obj.label96:setHeight(20);
    obj.label96:setText("NEP");
    obj.label96:setName("label96");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout34);
    obj.edit94:setVertTextAlign("center");
    obj.edit94:setLeft(5);
    obj.edit94:setTop(20);
    obj.edit94:setWidth(35);
    obj.edit94:setHeight(23);
    obj.edit94:setField("tNep26");
    obj.edit94:setName("edit94");

    obj.label97 = gui.fromHandle(_obj_newObject("label"));
    obj.label97:setParent(obj.layout34);
    obj.label97:setLeft(45);
    obj.label97:setTop(1);
    obj.label97:setWidth(275);
    obj.label97:setHeight(20);
    obj.label97:setText("NOME");
    obj.label97:setName("label97");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout34);
    obj.edit95:setVertTextAlign("center");
    obj.edit95:setLeft(40);
    obj.edit95:setTop(20);
    obj.edit95:setWidth(280);
    obj.edit95:setHeight(23);
    obj.edit95:setField("tNome26");
    obj.edit95:setName("edit95");

    obj.label98 = gui.fromHandle(_obj_newObject("label"));
    obj.label98:setParent(obj.layout34);
    obj.label98:setLeft(325);
    obj.label98:setTop(1);
    obj.label98:setWidth(55);
    obj.label98:setHeight(20);
    obj.label98:setText("LIVRO");
    obj.label98:setName("label98");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout34);
    obj.edit96:setVertTextAlign("center");
    obj.edit96:setLeft(320);
    obj.edit96:setTop(20);
    obj.edit96:setWidth(55);
    obj.edit96:setHeight(23);
    obj.edit96:setField("tOrigem26");
    obj.edit96:setName("edit96");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout22);
    obj.layout35:setLeft(0);
    obj.layout35:setTop(625);
    obj.layout35:setWidth(380);
    obj.layout35:setHeight(45);
    obj.layout35:setName("layout35");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout35);
    obj.rectangle35:setAlign("client");
    obj.rectangle35:setColor("black");
    obj.rectangle35:setName("rectangle35");

    obj.label99 = gui.fromHandle(_obj_newObject("label"));
    obj.label99:setParent(obj.layout35);
    obj.label99:setLeft(5);
    obj.label99:setTop(1);
    obj.label99:setWidth(35);
    obj.label99:setHeight(20);
    obj.label99:setText("NEP");
    obj.label99:setName("label99");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout35);
    obj.edit97:setVertTextAlign("center");
    obj.edit97:setLeft(5);
    obj.edit97:setTop(20);
    obj.edit97:setWidth(35);
    obj.edit97:setHeight(23);
    obj.edit97:setField("tNep27");
    obj.edit97:setName("edit97");

    obj.label100 = gui.fromHandle(_obj_newObject("label"));
    obj.label100:setParent(obj.layout35);
    obj.label100:setLeft(45);
    obj.label100:setTop(1);
    obj.label100:setWidth(275);
    obj.label100:setHeight(20);
    obj.label100:setText("NOME");
    obj.label100:setName("label100");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout35);
    obj.edit98:setVertTextAlign("center");
    obj.edit98:setLeft(40);
    obj.edit98:setTop(20);
    obj.edit98:setWidth(280);
    obj.edit98:setHeight(23);
    obj.edit98:setField("tNome27");
    obj.edit98:setName("edit98");

    obj.label101 = gui.fromHandle(_obj_newObject("label"));
    obj.label101:setParent(obj.layout35);
    obj.label101:setLeft(325);
    obj.label101:setTop(1);
    obj.label101:setWidth(55);
    obj.label101:setHeight(20);
    obj.label101:setText("LIVRO");
    obj.label101:setName("label101");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout35);
    obj.edit99:setVertTextAlign("center");
    obj.edit99:setLeft(320);
    obj.edit99:setTop(20);
    obj.edit99:setWidth(55);
    obj.edit99:setHeight(23);
    obj.edit99:setField("tOrigem27");
    obj.edit99:setName("edit99");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout22);
    obj.layout36:setLeft(0);
    obj.layout36:setTop(675);
    obj.layout36:setWidth(380);
    obj.layout36:setHeight(45);
    obj.layout36:setName("layout36");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout36);
    obj.rectangle36:setAlign("client");
    obj.rectangle36:setColor("black");
    obj.rectangle36:setName("rectangle36");

    obj.label102 = gui.fromHandle(_obj_newObject("label"));
    obj.label102:setParent(obj.layout36);
    obj.label102:setLeft(5);
    obj.label102:setTop(1);
    obj.label102:setWidth(35);
    obj.label102:setHeight(20);
    obj.label102:setText("NEP");
    obj.label102:setName("label102");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout36);
    obj.edit100:setVertTextAlign("center");
    obj.edit100:setLeft(5);
    obj.edit100:setTop(20);
    obj.edit100:setWidth(35);
    obj.edit100:setHeight(23);
    obj.edit100:setField("tNep28");
    obj.edit100:setName("edit100");

    obj.label103 = gui.fromHandle(_obj_newObject("label"));
    obj.label103:setParent(obj.layout36);
    obj.label103:setLeft(45);
    obj.label103:setTop(1);
    obj.label103:setWidth(275);
    obj.label103:setHeight(20);
    obj.label103:setText("NOME");
    obj.label103:setName("label103");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout36);
    obj.edit101:setVertTextAlign("center");
    obj.edit101:setLeft(40);
    obj.edit101:setTop(20);
    obj.edit101:setWidth(280);
    obj.edit101:setHeight(23);
    obj.edit101:setField("tNome28");
    obj.edit101:setName("edit101");

    obj.label104 = gui.fromHandle(_obj_newObject("label"));
    obj.label104:setParent(obj.layout36);
    obj.label104:setLeft(325);
    obj.label104:setTop(1);
    obj.label104:setWidth(55);
    obj.label104:setHeight(20);
    obj.label104:setText("LIVRO");
    obj.label104:setName("label104");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout36);
    obj.edit102:setVertTextAlign("center");
    obj.edit102:setLeft(320);
    obj.edit102:setTop(20);
    obj.edit102:setWidth(55);
    obj.edit102:setHeight(23);
    obj.edit102:setField("tOrigem28");
    obj.edit102:setName("edit102");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout22);
    obj.layout37:setLeft(0);
    obj.layout37:setTop(725);
    obj.layout37:setWidth(380);
    obj.layout37:setHeight(45);
    obj.layout37:setName("layout37");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout37);
    obj.rectangle37:setAlign("client");
    obj.rectangle37:setColor("black");
    obj.rectangle37:setName("rectangle37");

    obj.label105 = gui.fromHandle(_obj_newObject("label"));
    obj.label105:setParent(obj.layout37);
    obj.label105:setLeft(5);
    obj.label105:setTop(1);
    obj.label105:setWidth(35);
    obj.label105:setHeight(20);
    obj.label105:setText("NEP");
    obj.label105:setName("label105");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout37);
    obj.edit103:setVertTextAlign("center");
    obj.edit103:setLeft(5);
    obj.edit103:setTop(20);
    obj.edit103:setWidth(35);
    obj.edit103:setHeight(23);
    obj.edit103:setField("tNep30");
    obj.edit103:setName("edit103");

    obj.label106 = gui.fromHandle(_obj_newObject("label"));
    obj.label106:setParent(obj.layout37);
    obj.label106:setLeft(45);
    obj.label106:setTop(1);
    obj.label106:setWidth(275);
    obj.label106:setHeight(20);
    obj.label106:setText("NOME");
    obj.label106:setName("label106");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout37);
    obj.edit104:setVertTextAlign("center");
    obj.edit104:setLeft(40);
    obj.edit104:setTop(20);
    obj.edit104:setWidth(280);
    obj.edit104:setHeight(23);
    obj.edit104:setField("tNome30");
    obj.edit104:setName("edit104");

    obj.label107 = gui.fromHandle(_obj_newObject("label"));
    obj.label107:setParent(obj.layout37);
    obj.label107:setLeft(325);
    obj.label107:setTop(1);
    obj.label107:setWidth(55);
    obj.label107:setHeight(20);
    obj.label107:setText("LIVRO");
    obj.label107:setName("label107");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout37);
    obj.edit105:setVertTextAlign("center");
    obj.edit105:setLeft(320);
    obj.edit105:setTop(20);
    obj.edit105:setWidth(55);
    obj.edit105:setHeight(23);
    obj.edit105:setField("tOrigem30");
    obj.edit105:setName("edit105");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout22);
    obj.layout38:setLeft(0);
    obj.layout38:setTop(775);
    obj.layout38:setWidth(380);
    obj.layout38:setHeight(45);
    obj.layout38:setName("layout38");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout38);
    obj.rectangle38:setAlign("client");
    obj.rectangle38:setColor("black");
    obj.rectangle38:setName("rectangle38");

    obj.label108 = gui.fromHandle(_obj_newObject("label"));
    obj.label108:setParent(obj.layout38);
    obj.label108:setLeft(5);
    obj.label108:setTop(1);
    obj.label108:setWidth(35);
    obj.label108:setHeight(20);
    obj.label108:setText("NEP");
    obj.label108:setName("label108");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout38);
    obj.edit106:setVertTextAlign("center");
    obj.edit106:setLeft(5);
    obj.edit106:setTop(20);
    obj.edit106:setWidth(35);
    obj.edit106:setHeight(23);
    obj.edit106:setField("tNep36");
    obj.edit106:setName("edit106");

    obj.label109 = gui.fromHandle(_obj_newObject("label"));
    obj.label109:setParent(obj.layout38);
    obj.label109:setLeft(45);
    obj.label109:setTop(1);
    obj.label109:setWidth(275);
    obj.label109:setHeight(20);
    obj.label109:setText("NOME");
    obj.label109:setName("label109");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout38);
    obj.edit107:setVertTextAlign("center");
    obj.edit107:setLeft(40);
    obj.edit107:setTop(20);
    obj.edit107:setWidth(280);
    obj.edit107:setHeight(23);
    obj.edit107:setField("tNome36");
    obj.edit107:setName("edit107");

    obj.label110 = gui.fromHandle(_obj_newObject("label"));
    obj.label110:setParent(obj.layout38);
    obj.label110:setLeft(325);
    obj.label110:setTop(1);
    obj.label110:setWidth(55);
    obj.label110:setHeight(20);
    obj.label110:setText("LIVRO");
    obj.label110:setName("label110");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout38);
    obj.edit108:setVertTextAlign("center");
    obj.edit108:setLeft(320);
    obj.edit108:setTop(20);
    obj.edit108:setWidth(55);
    obj.edit108:setHeight(23);
    obj.edit108:setField("tOrigem36");
    obj.edit108:setName("edit108");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout22);
    obj.layout39:setLeft(0);
    obj.layout39:setTop(825);
    obj.layout39:setWidth(380);
    obj.layout39:setHeight(45);
    obj.layout39:setName("layout39");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout39);
    obj.rectangle39:setAlign("client");
    obj.rectangle39:setColor("black");
    obj.rectangle39:setName("rectangle39");

    obj.label111 = gui.fromHandle(_obj_newObject("label"));
    obj.label111:setParent(obj.layout39);
    obj.label111:setLeft(5);
    obj.label111:setTop(1);
    obj.label111:setWidth(35);
    obj.label111:setHeight(20);
    obj.label111:setText("NEP");
    obj.label111:setName("label111");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout39);
    obj.edit109:setVertTextAlign("center");
    obj.edit109:setLeft(5);
    obj.edit109:setTop(20);
    obj.edit109:setWidth(35);
    obj.edit109:setHeight(23);
    obj.edit109:setField("tNep37");
    obj.edit109:setName("edit109");

    obj.label112 = gui.fromHandle(_obj_newObject("label"));
    obj.label112:setParent(obj.layout39);
    obj.label112:setLeft(45);
    obj.label112:setTop(1);
    obj.label112:setWidth(275);
    obj.label112:setHeight(20);
    obj.label112:setText("NOME");
    obj.label112:setName("label112");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout39);
    obj.edit110:setVertTextAlign("center");
    obj.edit110:setLeft(40);
    obj.edit110:setTop(20);
    obj.edit110:setWidth(280);
    obj.edit110:setHeight(23);
    obj.edit110:setField("tNome37");
    obj.edit110:setName("edit110");

    obj.label113 = gui.fromHandle(_obj_newObject("label"));
    obj.label113:setParent(obj.layout39);
    obj.label113:setLeft(325);
    obj.label113:setTop(1);
    obj.label113:setWidth(55);
    obj.label113:setHeight(20);
    obj.label113:setText("LIVRO");
    obj.label113:setName("label113");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout39);
    obj.edit111:setVertTextAlign("center");
    obj.edit111:setLeft(320);
    obj.edit111:setTop(20);
    obj.edit111:setWidth(55);
    obj.edit111:setHeight(23);
    obj.edit111:setField("tOrigem37");
    obj.edit111:setName("edit111");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout22);
    obj.layout40:setLeft(0);
    obj.layout40:setTop(875);
    obj.layout40:setWidth(380);
    obj.layout40:setHeight(45);
    obj.layout40:setName("layout40");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout40);
    obj.rectangle40:setAlign("client");
    obj.rectangle40:setColor("black");
    obj.rectangle40:setName("rectangle40");

    obj.label114 = gui.fromHandle(_obj_newObject("label"));
    obj.label114:setParent(obj.layout40);
    obj.label114:setLeft(5);
    obj.label114:setTop(1);
    obj.label114:setWidth(35);
    obj.label114:setHeight(20);
    obj.label114:setText("NEP");
    obj.label114:setName("label114");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout40);
    obj.edit112:setVertTextAlign("center");
    obj.edit112:setLeft(5);
    obj.edit112:setTop(20);
    obj.edit112:setWidth(35);
    obj.edit112:setHeight(23);
    obj.edit112:setField("tNep38");
    obj.edit112:setName("edit112");

    obj.label115 = gui.fromHandle(_obj_newObject("label"));
    obj.label115:setParent(obj.layout40);
    obj.label115:setLeft(45);
    obj.label115:setTop(1);
    obj.label115:setWidth(275);
    obj.label115:setHeight(20);
    obj.label115:setText("NOME");
    obj.label115:setName("label115");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout40);
    obj.edit113:setVertTextAlign("center");
    obj.edit113:setLeft(40);
    obj.edit113:setTop(20);
    obj.edit113:setWidth(280);
    obj.edit113:setHeight(23);
    obj.edit113:setField("tNome38");
    obj.edit113:setName("edit113");

    obj.label116 = gui.fromHandle(_obj_newObject("label"));
    obj.label116:setParent(obj.layout40);
    obj.label116:setLeft(325);
    obj.label116:setTop(1);
    obj.label116:setWidth(55);
    obj.label116:setHeight(20);
    obj.label116:setText("LIVRO");
    obj.label116:setName("label116");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout40);
    obj.edit114:setVertTextAlign("center");
    obj.edit114:setLeft(320);
    obj.edit114:setTop(20);
    obj.edit114:setWidth(55);
    obj.edit114:setHeight(23);
    obj.edit114:setField("tOrigem38");
    obj.edit114:setName("edit114");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout22);
    obj.layout41:setLeft(0);
    obj.layout41:setTop(925);
    obj.layout41:setWidth(380);
    obj.layout41:setHeight(45);
    obj.layout41:setName("layout41");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout41);
    obj.rectangle41:setAlign("client");
    obj.rectangle41:setColor("black");
    obj.rectangle41:setName("rectangle41");

    obj.label117 = gui.fromHandle(_obj_newObject("label"));
    obj.label117:setParent(obj.layout41);
    obj.label117:setLeft(5);
    obj.label117:setTop(1);
    obj.label117:setWidth(35);
    obj.label117:setHeight(20);
    obj.label117:setText("NEP");
    obj.label117:setName("label117");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout41);
    obj.edit115:setVertTextAlign("center");
    obj.edit115:setLeft(5);
    obj.edit115:setTop(20);
    obj.edit115:setWidth(35);
    obj.edit115:setHeight(23);
    obj.edit115:setField("tNep39");
    obj.edit115:setName("edit115");

    obj.label118 = gui.fromHandle(_obj_newObject("label"));
    obj.label118:setParent(obj.layout41);
    obj.label118:setLeft(45);
    obj.label118:setTop(1);
    obj.label118:setWidth(275);
    obj.label118:setHeight(20);
    obj.label118:setText("NOME");
    obj.label118:setName("label118");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout41);
    obj.edit116:setVertTextAlign("center");
    obj.edit116:setLeft(40);
    obj.edit116:setTop(20);
    obj.edit116:setWidth(280);
    obj.edit116:setHeight(23);
    obj.edit116:setField("tNome39");
    obj.edit116:setName("edit116");

    obj.label119 = gui.fromHandle(_obj_newObject("label"));
    obj.label119:setParent(obj.layout41);
    obj.label119:setLeft(325);
    obj.label119:setTop(1);
    obj.label119:setWidth(55);
    obj.label119:setHeight(20);
    obj.label119:setText("LIVRO");
    obj.label119:setName("label119");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout41);
    obj.edit117:setVertTextAlign("center");
    obj.edit117:setLeft(320);
    obj.edit117:setTop(20);
    obj.edit117:setWidth(55);
    obj.edit117:setHeight(23);
    obj.edit117:setField("tOrigem39");
    obj.edit117:setName("edit117");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout22);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(975);
    obj.layout42:setWidth(380);
    obj.layout42:setHeight(45);
    obj.layout42:setName("layout42");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout42);
    obj.rectangle42:setAlign("client");
    obj.rectangle42:setColor("black");
    obj.rectangle42:setName("rectangle42");

    obj.label120 = gui.fromHandle(_obj_newObject("label"));
    obj.label120:setParent(obj.layout42);
    obj.label120:setLeft(5);
    obj.label120:setTop(1);
    obj.label120:setWidth(35);
    obj.label120:setHeight(20);
    obj.label120:setText("NEP");
    obj.label120:setName("label120");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout42);
    obj.edit118:setVertTextAlign("center");
    obj.edit118:setLeft(5);
    obj.edit118:setTop(20);
    obj.edit118:setWidth(35);
    obj.edit118:setHeight(23);
    obj.edit118:setField("tNep40");
    obj.edit118:setName("edit118");

    obj.label121 = gui.fromHandle(_obj_newObject("label"));
    obj.label121:setParent(obj.layout42);
    obj.label121:setLeft(45);
    obj.label121:setTop(1);
    obj.label121:setWidth(275);
    obj.label121:setHeight(20);
    obj.label121:setText("NOME");
    obj.label121:setName("label121");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout42);
    obj.edit119:setVertTextAlign("center");
    obj.edit119:setLeft(40);
    obj.edit119:setTop(20);
    obj.edit119:setWidth(280);
    obj.edit119:setHeight(23);
    obj.edit119:setField("tNome40");
    obj.edit119:setName("edit119");

    obj.label122 = gui.fromHandle(_obj_newObject("label"));
    obj.label122:setParent(obj.layout42);
    obj.label122:setLeft(325);
    obj.label122:setTop(1);
    obj.label122:setWidth(55);
    obj.label122:setHeight(20);
    obj.label122:setText("LIVRO");
    obj.label122:setName("label122");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout42);
    obj.edit120:setVertTextAlign("center");
    obj.edit120:setLeft(320);
    obj.edit120:setTop(20);
    obj.edit120:setWidth(55);
    obj.edit120:setHeight(23);
    obj.edit120:setField("tOrigem40");
    obj.edit120:setName("edit120");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.scrollBox1);
    obj.layout43:setLeft(810);
    obj.layout43:setTop(0);
    obj.layout43:setWidth(380);
    obj.layout43:setHeight(1020);
    obj.layout43:setName("layout43");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout43);
    obj.rectangle43:setAlign("client");
    obj.rectangle43:setColor("#0000007F");
    obj.rectangle43:setName("rectangle43");

    obj.label123 = gui.fromHandle(_obj_newObject("label"));
    obj.label123:setParent(obj.layout43);
    obj.label123:setLeft(0);
    obj.label123:setTop(0);
    obj.label123:setWidth(380);
    obj.label123:setHeight(20);
    obj.label123:setText("CARACTERISTICAS DE CLASSE");
    obj.label123:setHorzTextAlign("center");
    obj.label123:setName("label123");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout43);
    obj.layout44:setLeft(0);
    obj.layout44:setTop(25);
    obj.layout44:setWidth(380);
    obj.layout44:setHeight(95);
    obj.layout44:setName("layout44");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout44);
    obj.rectangle44:setAlign("client");
    obj.rectangle44:setColor("black");
    obj.rectangle44:setName("rectangle44");

    obj.label124 = gui.fromHandle(_obj_newObject("label"));
    obj.label124:setParent(obj.layout44);
    obj.label124:setLeft(5);
    obj.label124:setTop(1);
    obj.label124:setWidth(35);
    obj.label124:setHeight(20);
    obj.label124:setText("NEP");
    obj.label124:setName("label124");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout44);
    obj.edit121:setVertTextAlign("center");
    obj.edit121:setLeft(5);
    obj.edit121:setTop(20);
    obj.edit121:setWidth(35);
    obj.edit121:setHeight(23);
    obj.edit121:setField("cNep1");
    obj.edit121:setName("edit121");

    obj.label125 = gui.fromHandle(_obj_newObject("label"));
    obj.label125:setParent(obj.layout44);
    obj.label125:setLeft(45);
    obj.label125:setTop(1);
    obj.label125:setWidth(275);
    obj.label125:setHeight(20);
    obj.label125:setText("NOME");
    obj.label125:setName("label125");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout44);
    obj.edit122:setVertTextAlign("center");
    obj.edit122:setLeft(40);
    obj.edit122:setTop(20);
    obj.edit122:setWidth(280);
    obj.edit122:setHeight(23);
    obj.edit122:setField("cNome1");
    obj.edit122:setName("edit122");

    obj.label126 = gui.fromHandle(_obj_newObject("label"));
    obj.label126:setParent(obj.layout44);
    obj.label126:setLeft(325);
    obj.label126:setTop(1);
    obj.label126:setWidth(55);
    obj.label126:setHeight(20);
    obj.label126:setText("LIVRO");
    obj.label126:setName("label126");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout44);
    obj.edit123:setVertTextAlign("center");
    obj.edit123:setLeft(320);
    obj.edit123:setTop(20);
    obj.edit123:setWidth(55);
    obj.edit123:setHeight(23);
    obj.edit123:setField("cOrigem1");
    obj.edit123:setName("edit123");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout44);
    obj.edit124:setVertTextAlign("center");
    obj.edit124:setLeft(5);
    obj.edit124:setTop(43);
    obj.edit124:setWidth(370);
    obj.edit124:setHeight(23);
    obj.edit124:setField("cDescricao1a");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout44);
    obj.edit125:setVertTextAlign("center");
    obj.edit125:setLeft(5);
    obj.edit125:setTop(66);
    obj.edit125:setWidth(370);
    obj.edit125:setHeight(23);
    obj.edit125:setField("cDescricao1b");
    obj.edit125:setName("edit125");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout43);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(125);
    obj.layout45:setWidth(380);
    obj.layout45:setHeight(95);
    obj.layout45:setName("layout45");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout45);
    obj.rectangle45:setAlign("client");
    obj.rectangle45:setColor("black");
    obj.rectangle45:setName("rectangle45");

    obj.label127 = gui.fromHandle(_obj_newObject("label"));
    obj.label127:setParent(obj.layout45);
    obj.label127:setLeft(5);
    obj.label127:setTop(1);
    obj.label127:setWidth(35);
    obj.label127:setHeight(20);
    obj.label127:setText("NEP");
    obj.label127:setName("label127");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout45);
    obj.edit126:setVertTextAlign("center");
    obj.edit126:setLeft(5);
    obj.edit126:setTop(20);
    obj.edit126:setWidth(35);
    obj.edit126:setHeight(23);
    obj.edit126:setField("cNep2");
    obj.edit126:setName("edit126");

    obj.label128 = gui.fromHandle(_obj_newObject("label"));
    obj.label128:setParent(obj.layout45);
    obj.label128:setLeft(45);
    obj.label128:setTop(1);
    obj.label128:setWidth(275);
    obj.label128:setHeight(20);
    obj.label128:setText("NOME");
    obj.label128:setName("label128");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout45);
    obj.edit127:setVertTextAlign("center");
    obj.edit127:setLeft(40);
    obj.edit127:setTop(20);
    obj.edit127:setWidth(280);
    obj.edit127:setHeight(23);
    obj.edit127:setField("cNome2");
    obj.edit127:setName("edit127");

    obj.label129 = gui.fromHandle(_obj_newObject("label"));
    obj.label129:setParent(obj.layout45);
    obj.label129:setLeft(325);
    obj.label129:setTop(1);
    obj.label129:setWidth(55);
    obj.label129:setHeight(20);
    obj.label129:setText("LIVRO");
    obj.label129:setName("label129");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout45);
    obj.edit128:setVertTextAlign("center");
    obj.edit128:setLeft(320);
    obj.edit128:setTop(20);
    obj.edit128:setWidth(55);
    obj.edit128:setHeight(23);
    obj.edit128:setField("cOrigem2");
    obj.edit128:setName("edit128");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout45);
    obj.edit129:setVertTextAlign("center");
    obj.edit129:setLeft(5);
    obj.edit129:setTop(43);
    obj.edit129:setWidth(370);
    obj.edit129:setHeight(23);
    obj.edit129:setField("cDescricao2a");
    obj.edit129:setName("edit129");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout45);
    obj.edit130:setVertTextAlign("center");
    obj.edit130:setLeft(5);
    obj.edit130:setTop(66);
    obj.edit130:setWidth(370);
    obj.edit130:setHeight(23);
    obj.edit130:setField("cDescricao2b");
    obj.edit130:setName("edit130");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout43);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(225);
    obj.layout46:setWidth(380);
    obj.layout46:setHeight(95);
    obj.layout46:setName("layout46");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout46);
    obj.rectangle46:setAlign("client");
    obj.rectangle46:setColor("black");
    obj.rectangle46:setName("rectangle46");

    obj.label130 = gui.fromHandle(_obj_newObject("label"));
    obj.label130:setParent(obj.layout46);
    obj.label130:setLeft(5);
    obj.label130:setTop(1);
    obj.label130:setWidth(35);
    obj.label130:setHeight(20);
    obj.label130:setText("NEP");
    obj.label130:setName("label130");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout46);
    obj.edit131:setVertTextAlign("center");
    obj.edit131:setLeft(5);
    obj.edit131:setTop(20);
    obj.edit131:setWidth(35);
    obj.edit131:setHeight(23);
    obj.edit131:setField("cNep3");
    obj.edit131:setName("edit131");

    obj.label131 = gui.fromHandle(_obj_newObject("label"));
    obj.label131:setParent(obj.layout46);
    obj.label131:setLeft(45);
    obj.label131:setTop(1);
    obj.label131:setWidth(275);
    obj.label131:setHeight(20);
    obj.label131:setText("NOME");
    obj.label131:setName("label131");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout46);
    obj.edit132:setVertTextAlign("center");
    obj.edit132:setLeft(40);
    obj.edit132:setTop(20);
    obj.edit132:setWidth(280);
    obj.edit132:setHeight(23);
    obj.edit132:setField("cNome3");
    obj.edit132:setName("edit132");

    obj.label132 = gui.fromHandle(_obj_newObject("label"));
    obj.label132:setParent(obj.layout46);
    obj.label132:setLeft(325);
    obj.label132:setTop(1);
    obj.label132:setWidth(55);
    obj.label132:setHeight(20);
    obj.label132:setText("LIVRO");
    obj.label132:setName("label132");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout46);
    obj.edit133:setVertTextAlign("center");
    obj.edit133:setLeft(320);
    obj.edit133:setTop(20);
    obj.edit133:setWidth(55);
    obj.edit133:setHeight(23);
    obj.edit133:setField("cOrigem3");
    obj.edit133:setName("edit133");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout46);
    obj.edit134:setVertTextAlign("center");
    obj.edit134:setLeft(5);
    obj.edit134:setTop(43);
    obj.edit134:setWidth(370);
    obj.edit134:setHeight(23);
    obj.edit134:setField("cDescricao3a");
    obj.edit134:setName("edit134");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout46);
    obj.edit135:setVertTextAlign("center");
    obj.edit135:setLeft(5);
    obj.edit135:setTop(66);
    obj.edit135:setWidth(370);
    obj.edit135:setHeight(23);
    obj.edit135:setField("cDescricao3b");
    obj.edit135:setName("edit135");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout43);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(325);
    obj.layout47:setWidth(380);
    obj.layout47:setHeight(95);
    obj.layout47:setName("layout47");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout47);
    obj.rectangle47:setAlign("client");
    obj.rectangle47:setColor("black");
    obj.rectangle47:setName("rectangle47");

    obj.label133 = gui.fromHandle(_obj_newObject("label"));
    obj.label133:setParent(obj.layout47);
    obj.label133:setLeft(5);
    obj.label133:setTop(1);
    obj.label133:setWidth(35);
    obj.label133:setHeight(20);
    obj.label133:setText("NEP");
    obj.label133:setName("label133");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout47);
    obj.edit136:setVertTextAlign("center");
    obj.edit136:setLeft(5);
    obj.edit136:setTop(20);
    obj.edit136:setWidth(35);
    obj.edit136:setHeight(23);
    obj.edit136:setField("cNep4");
    obj.edit136:setName("edit136");

    obj.label134 = gui.fromHandle(_obj_newObject("label"));
    obj.label134:setParent(obj.layout47);
    obj.label134:setLeft(45);
    obj.label134:setTop(1);
    obj.label134:setWidth(275);
    obj.label134:setHeight(20);
    obj.label134:setText("NOME");
    obj.label134:setName("label134");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout47);
    obj.edit137:setVertTextAlign("center");
    obj.edit137:setLeft(40);
    obj.edit137:setTop(20);
    obj.edit137:setWidth(280);
    obj.edit137:setHeight(23);
    obj.edit137:setField("cNome4");
    obj.edit137:setName("edit137");

    obj.label135 = gui.fromHandle(_obj_newObject("label"));
    obj.label135:setParent(obj.layout47);
    obj.label135:setLeft(325);
    obj.label135:setTop(1);
    obj.label135:setWidth(55);
    obj.label135:setHeight(20);
    obj.label135:setText("LIVRO");
    obj.label135:setName("label135");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout47);
    obj.edit138:setVertTextAlign("center");
    obj.edit138:setLeft(320);
    obj.edit138:setTop(20);
    obj.edit138:setWidth(55);
    obj.edit138:setHeight(23);
    obj.edit138:setField("cOrigem4");
    obj.edit138:setName("edit138");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout47);
    obj.edit139:setVertTextAlign("center");
    obj.edit139:setLeft(5);
    obj.edit139:setTop(43);
    obj.edit139:setWidth(370);
    obj.edit139:setHeight(23);
    obj.edit139:setField("cDescricao4a");
    obj.edit139:setName("edit139");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout47);
    obj.edit140:setVertTextAlign("center");
    obj.edit140:setLeft(5);
    obj.edit140:setTop(66);
    obj.edit140:setWidth(370);
    obj.edit140:setHeight(23);
    obj.edit140:setField("cDescricao4b");
    obj.edit140:setName("edit140");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout43);
    obj.layout48:setLeft(0);
    obj.layout48:setTop(425);
    obj.layout48:setWidth(380);
    obj.layout48:setHeight(95);
    obj.layout48:setName("layout48");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout48);
    obj.rectangle48:setAlign("client");
    obj.rectangle48:setColor("black");
    obj.rectangle48:setName("rectangle48");

    obj.label136 = gui.fromHandle(_obj_newObject("label"));
    obj.label136:setParent(obj.layout48);
    obj.label136:setLeft(5);
    obj.label136:setTop(1);
    obj.label136:setWidth(35);
    obj.label136:setHeight(20);
    obj.label136:setText("NEP");
    obj.label136:setName("label136");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout48);
    obj.edit141:setVertTextAlign("center");
    obj.edit141:setLeft(5);
    obj.edit141:setTop(20);
    obj.edit141:setWidth(35);
    obj.edit141:setHeight(23);
    obj.edit141:setField("cNep5");
    obj.edit141:setName("edit141");

    obj.label137 = gui.fromHandle(_obj_newObject("label"));
    obj.label137:setParent(obj.layout48);
    obj.label137:setLeft(45);
    obj.label137:setTop(1);
    obj.label137:setWidth(275);
    obj.label137:setHeight(20);
    obj.label137:setText("NOME");
    obj.label137:setName("label137");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout48);
    obj.edit142:setVertTextAlign("center");
    obj.edit142:setLeft(40);
    obj.edit142:setTop(20);
    obj.edit142:setWidth(280);
    obj.edit142:setHeight(23);
    obj.edit142:setField("cNome5");
    obj.edit142:setName("edit142");

    obj.label138 = gui.fromHandle(_obj_newObject("label"));
    obj.label138:setParent(obj.layout48);
    obj.label138:setLeft(325);
    obj.label138:setTop(1);
    obj.label138:setWidth(55);
    obj.label138:setHeight(20);
    obj.label138:setText("LIVRO");
    obj.label138:setName("label138");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout48);
    obj.edit143:setVertTextAlign("center");
    obj.edit143:setLeft(320);
    obj.edit143:setTop(20);
    obj.edit143:setWidth(55);
    obj.edit143:setHeight(23);
    obj.edit143:setField("cOrigem5");
    obj.edit143:setName("edit143");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout48);
    obj.edit144:setVertTextAlign("center");
    obj.edit144:setLeft(5);
    obj.edit144:setTop(43);
    obj.edit144:setWidth(370);
    obj.edit144:setHeight(23);
    obj.edit144:setField("cDescricao5a");
    obj.edit144:setName("edit144");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout48);
    obj.edit145:setVertTextAlign("center");
    obj.edit145:setLeft(5);
    obj.edit145:setTop(66);
    obj.edit145:setWidth(370);
    obj.edit145:setHeight(23);
    obj.edit145:setField("cDescricao5b");
    obj.edit145:setName("edit145");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout43);
    obj.layout49:setLeft(0);
    obj.layout49:setTop(525);
    obj.layout49:setWidth(380);
    obj.layout49:setHeight(95);
    obj.layout49:setName("layout49");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout49);
    obj.rectangle49:setAlign("client");
    obj.rectangle49:setColor("black");
    obj.rectangle49:setName("rectangle49");

    obj.label139 = gui.fromHandle(_obj_newObject("label"));
    obj.label139:setParent(obj.layout49);
    obj.label139:setLeft(5);
    obj.label139:setTop(1);
    obj.label139:setWidth(35);
    obj.label139:setHeight(20);
    obj.label139:setText("NEP");
    obj.label139:setName("label139");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout49);
    obj.edit146:setVertTextAlign("center");
    obj.edit146:setLeft(5);
    obj.edit146:setTop(20);
    obj.edit146:setWidth(35);
    obj.edit146:setHeight(23);
    obj.edit146:setField("cNep6");
    obj.edit146:setName("edit146");

    obj.label140 = gui.fromHandle(_obj_newObject("label"));
    obj.label140:setParent(obj.layout49);
    obj.label140:setLeft(45);
    obj.label140:setTop(1);
    obj.label140:setWidth(275);
    obj.label140:setHeight(20);
    obj.label140:setText("NOME");
    obj.label140:setName("label140");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout49);
    obj.edit147:setVertTextAlign("center");
    obj.edit147:setLeft(40);
    obj.edit147:setTop(20);
    obj.edit147:setWidth(280);
    obj.edit147:setHeight(23);
    obj.edit147:setField("cNome6");
    obj.edit147:setName("edit147");

    obj.label141 = gui.fromHandle(_obj_newObject("label"));
    obj.label141:setParent(obj.layout49);
    obj.label141:setLeft(325);
    obj.label141:setTop(1);
    obj.label141:setWidth(55);
    obj.label141:setHeight(20);
    obj.label141:setText("LIVRO");
    obj.label141:setName("label141");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout49);
    obj.edit148:setVertTextAlign("center");
    obj.edit148:setLeft(320);
    obj.edit148:setTop(20);
    obj.edit148:setWidth(55);
    obj.edit148:setHeight(23);
    obj.edit148:setField("cOrigem6");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout49);
    obj.edit149:setVertTextAlign("center");
    obj.edit149:setLeft(5);
    obj.edit149:setTop(43);
    obj.edit149:setWidth(370);
    obj.edit149:setHeight(23);
    obj.edit149:setField("cDescricao6a");
    obj.edit149:setName("edit149");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout49);
    obj.edit150:setVertTextAlign("center");
    obj.edit150:setLeft(5);
    obj.edit150:setTop(66);
    obj.edit150:setWidth(370);
    obj.edit150:setHeight(23);
    obj.edit150:setField("cDescricao6b");
    obj.edit150:setName("edit150");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout43);
    obj.layout50:setLeft(0);
    obj.layout50:setTop(625);
    obj.layout50:setWidth(380);
    obj.layout50:setHeight(95);
    obj.layout50:setName("layout50");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout50);
    obj.rectangle50:setAlign("client");
    obj.rectangle50:setColor("black");
    obj.rectangle50:setName("rectangle50");

    obj.label142 = gui.fromHandle(_obj_newObject("label"));
    obj.label142:setParent(obj.layout50);
    obj.label142:setLeft(5);
    obj.label142:setTop(1);
    obj.label142:setWidth(35);
    obj.label142:setHeight(20);
    obj.label142:setText("NEP");
    obj.label142:setName("label142");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout50);
    obj.edit151:setVertTextAlign("center");
    obj.edit151:setLeft(5);
    obj.edit151:setTop(20);
    obj.edit151:setWidth(35);
    obj.edit151:setHeight(23);
    obj.edit151:setField("cNep7");
    obj.edit151:setName("edit151");

    obj.label143 = gui.fromHandle(_obj_newObject("label"));
    obj.label143:setParent(obj.layout50);
    obj.label143:setLeft(45);
    obj.label143:setTop(1);
    obj.label143:setWidth(275);
    obj.label143:setHeight(20);
    obj.label143:setText("NOME");
    obj.label143:setName("label143");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout50);
    obj.edit152:setVertTextAlign("center");
    obj.edit152:setLeft(40);
    obj.edit152:setTop(20);
    obj.edit152:setWidth(280);
    obj.edit152:setHeight(23);
    obj.edit152:setField("cNome7");
    obj.edit152:setName("edit152");

    obj.label144 = gui.fromHandle(_obj_newObject("label"));
    obj.label144:setParent(obj.layout50);
    obj.label144:setLeft(325);
    obj.label144:setTop(1);
    obj.label144:setWidth(55);
    obj.label144:setHeight(20);
    obj.label144:setText("LIVRO");
    obj.label144:setName("label144");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout50);
    obj.edit153:setVertTextAlign("center");
    obj.edit153:setLeft(320);
    obj.edit153:setTop(20);
    obj.edit153:setWidth(55);
    obj.edit153:setHeight(23);
    obj.edit153:setField("cOrigem7");
    obj.edit153:setName("edit153");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout50);
    obj.edit154:setVertTextAlign("center");
    obj.edit154:setLeft(5);
    obj.edit154:setTop(43);
    obj.edit154:setWidth(370);
    obj.edit154:setHeight(23);
    obj.edit154:setField("cDescricao7a");
    obj.edit154:setName("edit154");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout50);
    obj.edit155:setVertTextAlign("center");
    obj.edit155:setLeft(5);
    obj.edit155:setTop(66);
    obj.edit155:setWidth(370);
    obj.edit155:setHeight(23);
    obj.edit155:setField("cDescricao7b");
    obj.edit155:setName("edit155");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout43);
    obj.layout51:setLeft(0);
    obj.layout51:setTop(725);
    obj.layout51:setWidth(380);
    obj.layout51:setHeight(95);
    obj.layout51:setName("layout51");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout51);
    obj.rectangle51:setAlign("client");
    obj.rectangle51:setColor("black");
    obj.rectangle51:setName("rectangle51");

    obj.label145 = gui.fromHandle(_obj_newObject("label"));
    obj.label145:setParent(obj.layout51);
    obj.label145:setLeft(5);
    obj.label145:setTop(1);
    obj.label145:setWidth(35);
    obj.label145:setHeight(20);
    obj.label145:setText("NEP");
    obj.label145:setName("label145");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout51);
    obj.edit156:setVertTextAlign("center");
    obj.edit156:setLeft(5);
    obj.edit156:setTop(20);
    obj.edit156:setWidth(35);
    obj.edit156:setHeight(23);
    obj.edit156:setField("cNep8");
    obj.edit156:setName("edit156");

    obj.label146 = gui.fromHandle(_obj_newObject("label"));
    obj.label146:setParent(obj.layout51);
    obj.label146:setLeft(45);
    obj.label146:setTop(1);
    obj.label146:setWidth(275);
    obj.label146:setHeight(20);
    obj.label146:setText("NOME");
    obj.label146:setName("label146");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout51);
    obj.edit157:setVertTextAlign("center");
    obj.edit157:setLeft(40);
    obj.edit157:setTop(20);
    obj.edit157:setWidth(280);
    obj.edit157:setHeight(23);
    obj.edit157:setField("cNome8");
    obj.edit157:setName("edit157");

    obj.label147 = gui.fromHandle(_obj_newObject("label"));
    obj.label147:setParent(obj.layout51);
    obj.label147:setLeft(325);
    obj.label147:setTop(1);
    obj.label147:setWidth(55);
    obj.label147:setHeight(20);
    obj.label147:setText("LIVRO");
    obj.label147:setName("label147");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout51);
    obj.edit158:setVertTextAlign("center");
    obj.edit158:setLeft(320);
    obj.edit158:setTop(20);
    obj.edit158:setWidth(55);
    obj.edit158:setHeight(23);
    obj.edit158:setField("cOrigem8");
    obj.edit158:setName("edit158");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout51);
    obj.edit159:setVertTextAlign("center");
    obj.edit159:setLeft(5);
    obj.edit159:setTop(43);
    obj.edit159:setWidth(370);
    obj.edit159:setHeight(23);
    obj.edit159:setField("cDescricao8a");
    obj.edit159:setName("edit159");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout51);
    obj.edit160:setVertTextAlign("center");
    obj.edit160:setLeft(5);
    obj.edit160:setTop(66);
    obj.edit160:setWidth(370);
    obj.edit160:setHeight(23);
    obj.edit160:setField("cDescricao8b");
    obj.edit160:setName("edit160");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout43);
    obj.layout52:setLeft(0);
    obj.layout52:setTop(825);
    obj.layout52:setWidth(380);
    obj.layout52:setHeight(95);
    obj.layout52:setName("layout52");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout52);
    obj.rectangle52:setAlign("client");
    obj.rectangle52:setColor("black");
    obj.rectangle52:setName("rectangle52");

    obj.label148 = gui.fromHandle(_obj_newObject("label"));
    obj.label148:setParent(obj.layout52);
    obj.label148:setLeft(5);
    obj.label148:setTop(1);
    obj.label148:setWidth(35);
    obj.label148:setHeight(20);
    obj.label148:setText("NEP");
    obj.label148:setName("label148");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout52);
    obj.edit161:setVertTextAlign("center");
    obj.edit161:setLeft(5);
    obj.edit161:setTop(20);
    obj.edit161:setWidth(35);
    obj.edit161:setHeight(23);
    obj.edit161:setField("cNep9");
    obj.edit161:setName("edit161");

    obj.label149 = gui.fromHandle(_obj_newObject("label"));
    obj.label149:setParent(obj.layout52);
    obj.label149:setLeft(45);
    obj.label149:setTop(1);
    obj.label149:setWidth(275);
    obj.label149:setHeight(20);
    obj.label149:setText("NOME");
    obj.label149:setName("label149");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout52);
    obj.edit162:setVertTextAlign("center");
    obj.edit162:setLeft(40);
    obj.edit162:setTop(20);
    obj.edit162:setWidth(280);
    obj.edit162:setHeight(23);
    obj.edit162:setField("cNome9");
    obj.edit162:setName("edit162");

    obj.label150 = gui.fromHandle(_obj_newObject("label"));
    obj.label150:setParent(obj.layout52);
    obj.label150:setLeft(325);
    obj.label150:setTop(1);
    obj.label150:setWidth(55);
    obj.label150:setHeight(20);
    obj.label150:setText("LIVRO");
    obj.label150:setName("label150");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout52);
    obj.edit163:setVertTextAlign("center");
    obj.edit163:setLeft(320);
    obj.edit163:setTop(20);
    obj.edit163:setWidth(55);
    obj.edit163:setHeight(23);
    obj.edit163:setField("cOrigem9");
    obj.edit163:setName("edit163");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout52);
    obj.edit164:setVertTextAlign("center");
    obj.edit164:setLeft(5);
    obj.edit164:setTop(43);
    obj.edit164:setWidth(370);
    obj.edit164:setHeight(23);
    obj.edit164:setField("cDescricao9a");
    obj.edit164:setName("edit164");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout52);
    obj.edit165:setVertTextAlign("center");
    obj.edit165:setLeft(5);
    obj.edit165:setTop(66);
    obj.edit165:setWidth(370);
    obj.edit165:setHeight(23);
    obj.edit165:setField("cDescricao9b");
    obj.edit165:setName("edit165");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout43);
    obj.layout53:setLeft(0);
    obj.layout53:setTop(925);
    obj.layout53:setWidth(380);
    obj.layout53:setHeight(95);
    obj.layout53:setName("layout53");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout53);
    obj.rectangle53:setAlign("client");
    obj.rectangle53:setColor("black");
    obj.rectangle53:setName("rectangle53");

    obj.label151 = gui.fromHandle(_obj_newObject("label"));
    obj.label151:setParent(obj.layout53);
    obj.label151:setLeft(5);
    obj.label151:setTop(1);
    obj.label151:setWidth(35);
    obj.label151:setHeight(20);
    obj.label151:setText("NEP");
    obj.label151:setName("label151");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout53);
    obj.edit166:setVertTextAlign("center");
    obj.edit166:setLeft(5);
    obj.edit166:setTop(20);
    obj.edit166:setWidth(35);
    obj.edit166:setHeight(23);
    obj.edit166:setField("cNep10");
    obj.edit166:setName("edit166");

    obj.label152 = gui.fromHandle(_obj_newObject("label"));
    obj.label152:setParent(obj.layout53);
    obj.label152:setLeft(45);
    obj.label152:setTop(1);
    obj.label152:setWidth(275);
    obj.label152:setHeight(20);
    obj.label152:setText("NOME");
    obj.label152:setName("label152");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout53);
    obj.edit167:setVertTextAlign("center");
    obj.edit167:setLeft(40);
    obj.edit167:setTop(20);
    obj.edit167:setWidth(280);
    obj.edit167:setHeight(23);
    obj.edit167:setField("cNome10");
    obj.edit167:setName("edit167");

    obj.label153 = gui.fromHandle(_obj_newObject("label"));
    obj.label153:setParent(obj.layout53);
    obj.label153:setLeft(325);
    obj.label153:setTop(1);
    obj.label153:setWidth(55);
    obj.label153:setHeight(20);
    obj.label153:setText("LIVRO");
    obj.label153:setName("label153");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout53);
    obj.edit168:setVertTextAlign("center");
    obj.edit168:setLeft(320);
    obj.edit168:setTop(20);
    obj.edit168:setWidth(55);
    obj.edit168:setHeight(23);
    obj.edit168:setField("cOrigem10");
    obj.edit168:setName("edit168");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout53);
    obj.edit169:setVertTextAlign("center");
    obj.edit169:setLeft(5);
    obj.edit169:setTop(43);
    obj.edit169:setWidth(370);
    obj.edit169:setHeight(23);
    obj.edit169:setField("cDescricao10a");
    obj.edit169:setName("edit169");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout53);
    obj.edit170:setVertTextAlign("center");
    obj.edit170:setLeft(5);
    obj.edit170:setTop(66);
    obj.edit170:setWidth(370);
    obj.edit170:setHeight(23);
    obj.edit170:setField("cDescricao10b");
    obj.edit170:setName("edit170");

    function obj:_releaseEvents()
    end;

    obj._oldLFMDestroy = obj.destroy;

    function obj:destroy() 
        self:_releaseEvents();

        if (self.handle ~= 0) and (self.setNodeDatabase ~= nil) then
          self:setNodeDatabase(nil);
        end;

        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.label119 ~= nil then self.label119:destroy(); self.label119 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.label97 ~= nil then self.label97:destroy(); self.label97 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.label128 ~= nil then self.label128:destroy(); self.label128 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.label96 ~= nil then self.label96:destroy(); self.label96 = nil; end;
        if self.label92 ~= nil then self.label92:destroy(); self.label92 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.label148 ~= nil then self.label148:destroy(); self.label148 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.label143 ~= nil then self.label143:destroy(); self.label143 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.label122 ~= nil then self.label122:destroy(); self.label122 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.label125 ~= nil then self.label125:destroy(); self.label125 = nil; end;
        if self.label146 ~= nil then self.label146:destroy(); self.label146 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.label99 ~= nil then self.label99:destroy(); self.label99 = nil; end;
        if self.label107 ~= nil then self.label107:destroy(); self.label107 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label82 ~= nil then self.label82:destroy(); self.label82 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.label109 ~= nil then self.label109:destroy(); self.label109 = nil; end;
        if self.label106 ~= nil then self.label106:destroy(); self.label106 = nil; end;
        if self.label103 ~= nil then self.label103:destroy(); self.label103 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.label94 ~= nil then self.label94:destroy(); self.label94 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label111 ~= nil then self.label111:destroy(); self.label111 = nil; end;
        if self.label91 ~= nil then self.label91:destroy(); self.label91 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.label116 ~= nil then self.label116:destroy(); self.label116 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.label139 ~= nil then self.label139:destroy(); self.label139 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.label147 ~= nil then self.label147:destroy(); self.label147 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.label89 ~= nil then self.label89:destroy(); self.label89 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.label115 ~= nil then self.label115:destroy(); self.label115 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.label127 ~= nil then self.label127:destroy(); self.label127 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label142 ~= nil then self.label142:destroy(); self.label142 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label90 ~= nil then self.label90:destroy(); self.label90 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.label93 ~= nil then self.label93:destroy(); self.label93 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.label129 ~= nil then self.label129:destroy(); self.label129 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.label86 ~= nil then self.label86:destroy(); self.label86 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.label133 ~= nil then self.label133:destroy(); self.label133 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label102 ~= nil then self.label102:destroy(); self.label102 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.label132 ~= nil then self.label132:destroy(); self.label132 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.label108 ~= nil then self.label108:destroy(); self.label108 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.label124 ~= nil then self.label124:destroy(); self.label124 = nil; end;
        if self.label84 ~= nil then self.label84:destroy(); self.label84 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.label110 ~= nil then self.label110:destroy(); self.label110 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.label151 ~= nil then self.label151:destroy(); self.label151 = nil; end;
        if self.label138 ~= nil then self.label138:destroy(); self.label138 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.label144 ~= nil then self.label144:destroy(); self.label144 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.label140 ~= nil then self.label140:destroy(); self.label140 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label105 ~= nil then self.label105:destroy(); self.label105 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.label126 ~= nil then self.label126:destroy(); self.label126 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label145 ~= nil then self.label145:destroy(); self.label145 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.label88 ~= nil then self.label88:destroy(); self.label88 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
        if self.label131 ~= nil then self.label131:destroy(); self.label131 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.rectangle26 ~= nil then self.rectangle26:destroy(); self.rectangle26 = nil; end;
        if self.label78 ~= nil then self.label78:destroy(); self.label78 = nil; end;
        if self.label101 ~= nil then self.label101:destroy(); self.label101 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.label114 ~= nil then self.label114:destroy(); self.label114 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.label135 ~= nil then self.label135:destroy(); self.label135 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.label120 ~= nil then self.label120:destroy(); self.label120 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.label130 ~= nil then self.label130:destroy(); self.label130 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.label152 ~= nil then self.label152:destroy(); self.label152 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label117 ~= nil then self.label117:destroy(); self.label117 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label123 ~= nil then self.label123:destroy(); self.label123 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.label95 ~= nil then self.label95:destroy(); self.label95 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.label83 ~= nil then self.label83:destroy(); self.label83 = nil; end;
        if self.label98 ~= nil then self.label98:destroy(); self.label98 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.label113 ~= nil then self.label113:destroy(); self.label113 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.label112 ~= nil then self.label112:destroy(); self.label112 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label121 ~= nil then self.label121:destroy(); self.label121 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.label65 ~= nil then self.label65:destroy(); self.label65 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.rectangle29 ~= nil then self.rectangle29:destroy(); self.rectangle29 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.label60 ~= nil then self.label60:destroy(); self.label60 = nil; end;
        if self.label64 ~= nil then self.label64:destroy(); self.label64 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.label150 ~= nil then self.label150:destroy(); self.label150 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label136 ~= nil then self.label136:destroy(); self.label136 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.label149 ~= nil then self.label149:destroy(); self.label149 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label137 ~= nil then self.label137:destroy(); self.label137 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.label118 ~= nil then self.label118:destroy(); self.label118 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.label100 ~= nil then self.label100:destroy(); self.label100 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label85 ~= nil then self.label85:destroy(); self.label85 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.label153 ~= nil then self.label153:destroy(); self.label153 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.label87 ~= nil then self.label87:destroy(); self.label87 = nil; end;
        if self.label104 ~= nil then self.label104:destroy(); self.label104 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.label141 ~= nil then self.label141:destroy(); self.label141 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.label134 ~= nil then self.label134:destroy(); self.label134 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmFichaRPGmeister4o_svg = {
    newEditor = newfrmFichaRPGmeister4o_svg, 
    new = newfrmFichaRPGmeister4o_svg, 
    name = "frmFichaRPGmeister4o_svg", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmFichaRPGmeister4o_svg = _frmFichaRPGmeister4o_svg;
rrpg.registrarForm(_frmFichaRPGmeister4o_svg);

return _frmFichaRPGmeister4o_svg;
