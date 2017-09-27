require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmRDF3()
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
    obj:setName("frmRDF3");
    obj:setAlign("client");
    obj:setTheme("dark");

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");

    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(400);
    obj.layout1:setHeight(610);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setAlign("client");
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(5);
    obj.rectangle1:setYradius(5);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(390);
    obj.label1:setHeight(20);
    obj.label1:setText("PERICIAS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(25);
    obj.layout2:setWidth(500);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(0);
    obj.label2:setTop(5);
    obj.label2:setWidth(150);
    obj.label2:setHeight(20);
    obj.label2:setText("NOME");
    obj.label2:setHorzTextAlign("center");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(150);
    obj.label3:setTop(5);
    obj.label3:setWidth(50);
    obj.label3:setHeight(20);
    obj.label3:setText("Chave");
    obj.label3:setHorzTextAlign("center");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(210);
    obj.label4:setTop(5);
    obj.label4:setWidth(40);
    obj.label4:setHeight(20);
    obj.label4:setText("ATR");
    obj.label4:setHorzTextAlign("center");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout2);
    obj.label5:setLeft(250);
    obj.label5:setTop(5);
    obj.label5:setWidth(40);
    obj.label5:setHeight(20);
    obj.label5:setText("NIV");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout2);
    obj.label6:setLeft(290);
    obj.label6:setTop(5);
    obj.label6:setWidth(40);
    obj.label6:setHeight(20);
    obj.label6:setText("OUT");
    obj.label6:setHorzTextAlign("center");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(340);
    obj.label7:setTop(5);
    obj.label7:setWidth(50);
    obj.label7:setHeight(20);
    obj.label7:setText("TOTAL");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(50);
    obj.layout3:setWidth(500);
    obj.layout3:setHeight(555);
    obj.layout3:setName("layout3");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout3);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(0);
    obj.layout4:setWidth(500);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout4);
    obj.edit1:setLeft(0);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(150);
    obj.edit1:setHeight(25);
    obj.edit1:setField("per_1");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout4);
    obj.edit2:setLeft(150);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("per_chave_1");
    obj.edit2:setHorzTextAlign("center");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout4);
    obj.edit3:setLeft(210);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(40);
    obj.edit3:setHeight(25);
    obj.edit3:setField("per_atr_1");
    obj.edit3:setHorzTextAlign("center");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setLeft(250);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(40);
    obj.edit4:setHeight(25);
    obj.edit4:setField("per_niv_1");
    obj.edit4:setHorzTextAlign("center");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setLeft(290);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(40);
    obj.edit5:setHeight(25);
    obj.edit5:setField("per_out_1");
    obj.edit5:setHorzTextAlign("center");
    obj.edit5:setName("edit5");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout4);
    obj.rectangle2:setLeft(340);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(50);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout4);
    obj.label8:setLeft(340);
    obj.label8:setTop(0);
    obj.label8:setWidth(50);
    obj.label8:setHeight(25);
    obj.label8:setField("per_total_1");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.dataLink1 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink1:setParent(obj.layout4);
    obj.dataLink1:setFields({'per_atr_1', 'per_niv_1', 'per_out_1'});
    obj.dataLink1:setName("dataLink1");

    obj.dataLink2 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink2:setParent(obj.layout4);
    obj.dataLink2:setField("per_1");
    obj.dataLink2:setDefaultValue("Arma de Mão");
    obj.dataLink2:setName("dataLink2");

    obj.dataLink3 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink3:setParent(obj.layout4);
    obj.dataLink3:setField("per_chave_1");
    obj.dataLink3:setDefaultValue("MAE");
    obj.dataLink3:setName("dataLink3");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout3);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(25);
    obj.layout5:setWidth(500);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout5);
    obj.edit6:setLeft(0);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(150);
    obj.edit6:setHeight(25);
    obj.edit6:setField("per_2");
    obj.edit6:setName("edit6");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout5);
    obj.edit7:setLeft(150);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(50);
    obj.edit7:setHeight(25);
    obj.edit7:setField("per_chave_2");
    obj.edit7:setHorzTextAlign("center");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout5);
    obj.edit8:setLeft(210);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(40);
    obj.edit8:setHeight(25);
    obj.edit8:setField("per_atr_2");
    obj.edit8:setHorzTextAlign("center");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setLeft(250);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(40);
    obj.edit9:setHeight(25);
    obj.edit9:setField("per_niv_2");
    obj.edit9:setHorzTextAlign("center");
    obj.edit9:setName("edit9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout5);
    obj.edit10:setLeft(290);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(40);
    obj.edit10:setHeight(25);
    obj.edit10:setField("per_out_2");
    obj.edit10:setHorzTextAlign("center");
    obj.edit10:setName("edit10");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout5);
    obj.rectangle3:setLeft(340);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(50);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout5);
    obj.label9:setLeft(340);
    obj.label9:setTop(0);
    obj.label9:setWidth(50);
    obj.label9:setHeight(25);
    obj.label9:setField("per_total_2");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.dataLink4 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink4:setParent(obj.layout5);
    obj.dataLink4:setFields({'per_atr_2', 'per_niv_2', 'per_out_2'});
    obj.dataLink4:setName("dataLink4");

    obj.dataLink5 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink5:setParent(obj.layout5);
    obj.dataLink5:setField("per_2");
    obj.dataLink5:setDefaultValue("Arma Grande");
    obj.dataLink5:setName("dataLink5");

    obj.dataLink6 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink6:setParent(obj.layout5);
    obj.dataLink6:setField("per_chave_2");
    obj.dataLink6:setDefaultValue("MAE");
    obj.dataLink6:setName("dataLink6");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout3);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(50);
    obj.layout6:setWidth(500);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout6);
    obj.edit11:setLeft(0);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(150);
    obj.edit11:setHeight(25);
    obj.edit11:setField("per_3");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout6);
    obj.edit12:setLeft(150);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("per_chave_3");
    obj.edit12:setHorzTextAlign("center");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout6);
    obj.edit13:setLeft(210);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(40);
    obj.edit13:setHeight(25);
    obj.edit13:setField("per_atr_3");
    obj.edit13:setHorzTextAlign("center");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout6);
    obj.edit14:setLeft(250);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(40);
    obj.edit14:setHeight(25);
    obj.edit14:setField("per_niv_3");
    obj.edit14:setHorzTextAlign("center");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout6);
    obj.edit15:setLeft(290);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(40);
    obj.edit15:setHeight(25);
    obj.edit15:setField("per_out_3");
    obj.edit15:setHorzTextAlign("center");
    obj.edit15:setName("edit15");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout6);
    obj.rectangle4:setLeft(340);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(50);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout6);
    obj.label10:setLeft(340);
    obj.label10:setTop(0);
    obj.label10:setWidth(50);
    obj.label10:setHeight(25);
    obj.label10:setField("per_total_3");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.dataLink7 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink7:setParent(obj.layout6);
    obj.dataLink7:setFields({'per_atr_3', 'per_niv_3', 'per_out_3'});
    obj.dataLink7:setName("dataLink7");

    obj.dataLink8 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink8:setParent(obj.layout6);
    obj.dataLink8:setField("per_3");
    obj.dataLink8:setDefaultValue("Pistola");
    obj.dataLink8:setName("dataLink8");

    obj.dataLink9 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink9:setParent(obj.layout6);
    obj.dataLink9:setField("per_chave_3");
    obj.dataLink9:setDefaultValue("DES");
    obj.dataLink9:setName("dataLink9");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout3);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(75);
    obj.layout7:setWidth(500);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout7);
    obj.edit16:setLeft(0);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(150);
    obj.edit16:setHeight(25);
    obj.edit16:setField("per_4");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout7);
    obj.edit17:setLeft(150);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("per_chave_4");
    obj.edit17:setHorzTextAlign("center");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout7);
    obj.edit18:setLeft(210);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(40);
    obj.edit18:setHeight(25);
    obj.edit18:setField("per_atr_4");
    obj.edit18:setHorzTextAlign("center");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout7);
    obj.edit19:setLeft(250);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(40);
    obj.edit19:setHeight(25);
    obj.edit19:setField("per_niv_4");
    obj.edit19:setHorzTextAlign("center");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout7);
    obj.edit20:setLeft(290);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(40);
    obj.edit20:setHeight(25);
    obj.edit20:setField("per_out_4");
    obj.edit20:setHorzTextAlign("center");
    obj.edit20:setName("edit20");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout7);
    obj.rectangle5:setLeft(340);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(50);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout7);
    obj.label11:setLeft(340);
    obj.label11:setTop(0);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setField("per_total_4");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.dataLink10 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink10:setParent(obj.layout7);
    obj.dataLink10:setFields({'per_atr_4', 'per_niv_4', 'per_out_4'});
    obj.dataLink10:setName("dataLink10");

    obj.dataLink11 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink11:setParent(obj.layout7);
    obj.dataLink11:setField("per_4");
    obj.dataLink11:setDefaultValue("Fuzil");
    obj.dataLink11:setName("dataLink11");

    obj.dataLink12 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink12:setParent(obj.layout7);
    obj.dataLink12:setField("per_chave_4");
    obj.dataLink12:setDefaultValue("DES");
    obj.dataLink12:setName("dataLink12");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout3);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(100);
    obj.layout8:setWidth(500);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout8);
    obj.edit21:setLeft(0);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(150);
    obj.edit21:setHeight(25);
    obj.edit21:setField("per_5");
    obj.edit21:setName("edit21");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout8);
    obj.edit22:setLeft(150);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(50);
    obj.edit22:setHeight(25);
    obj.edit22:setField("per_chave_5");
    obj.edit22:setHorzTextAlign("center");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout8);
    obj.edit23:setLeft(210);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(40);
    obj.edit23:setHeight(25);
    obj.edit23:setField("per_atr_5");
    obj.edit23:setHorzTextAlign("center");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout8);
    obj.edit24:setLeft(250);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(40);
    obj.edit24:setHeight(25);
    obj.edit24:setField("per_niv_5");
    obj.edit24:setHorzTextAlign("center");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout8);
    obj.edit25:setLeft(290);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(40);
    obj.edit25:setHeight(25);
    obj.edit25:setField("per_out_5");
    obj.edit25:setHorzTextAlign("center");
    obj.edit25:setName("edit25");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout8);
    obj.rectangle6:setLeft(340);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(50);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout8);
    obj.label12:setLeft(340);
    obj.label12:setTop(0);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setField("per_total_5");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.dataLink13 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink13:setParent(obj.layout8);
    obj.dataLink13:setFields({'per_atr_5', 'per_niv_5', 'per_out_5'});
    obj.dataLink13:setName("dataLink13");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout3);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(125);
    obj.layout9:setWidth(500);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout9);
    obj.edit26:setLeft(0);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(150);
    obj.edit26:setHeight(25);
    obj.edit26:setField("per_6");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout9);
    obj.edit27:setLeft(150);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("per_chave_6");
    obj.edit27:setHorzTextAlign("center");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout9);
    obj.edit28:setLeft(210);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(40);
    obj.edit28:setHeight(25);
    obj.edit28:setField("per_atr_6");
    obj.edit28:setHorzTextAlign("center");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout9);
    obj.edit29:setLeft(250);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(40);
    obj.edit29:setHeight(25);
    obj.edit29:setField("per_niv_6");
    obj.edit29:setHorzTextAlign("center");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout9);
    obj.edit30:setLeft(290);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(40);
    obj.edit30:setHeight(25);
    obj.edit30:setField("per_out_6");
    obj.edit30:setHorzTextAlign("center");
    obj.edit30:setName("edit30");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout9);
    obj.rectangle7:setLeft(340);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(50);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout9);
    obj.label13:setLeft(340);
    obj.label13:setTop(0);
    obj.label13:setWidth(50);
    obj.label13:setHeight(25);
    obj.label13:setField("per_total_6");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.dataLink14 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink14:setParent(obj.layout9);
    obj.dataLink14:setFields({'per_atr_6', 'per_niv_6', 'per_out_6'});
    obj.dataLink14:setName("dataLink14");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout3);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(150);
    obj.layout10:setWidth(500);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout10);
    obj.edit31:setLeft(0);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(150);
    obj.edit31:setHeight(25);
    obj.edit31:setField("per_7");
    obj.edit31:setName("edit31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout10);
    obj.edit32:setLeft(150);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(25);
    obj.edit32:setField("per_chave_7");
    obj.edit32:setHorzTextAlign("center");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout10);
    obj.edit33:setLeft(210);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(40);
    obj.edit33:setHeight(25);
    obj.edit33:setField("per_atr_7");
    obj.edit33:setHorzTextAlign("center");
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout10);
    obj.edit34:setLeft(250);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(40);
    obj.edit34:setHeight(25);
    obj.edit34:setField("per_niv_7");
    obj.edit34:setHorzTextAlign("center");
    obj.edit34:setName("edit34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout10);
    obj.edit35:setLeft(290);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(40);
    obj.edit35:setHeight(25);
    obj.edit35:setField("per_out_7");
    obj.edit35:setHorzTextAlign("center");
    obj.edit35:setName("edit35");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout10);
    obj.rectangle8:setLeft(340);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(50);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout10);
    obj.label14:setLeft(340);
    obj.label14:setTop(0);
    obj.label14:setWidth(50);
    obj.label14:setHeight(25);
    obj.label14:setField("per_total_7");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.dataLink15 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink15:setParent(obj.layout10);
    obj.dataLink15:setFields({'per_atr_7', 'per_niv_7', 'per_out_7'});
    obj.dataLink15:setName("dataLink15");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout3);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(175);
    obj.layout11:setWidth(500);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout11);
    obj.edit36:setLeft(0);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(150);
    obj.edit36:setHeight(25);
    obj.edit36:setField("per_8");
    obj.edit36:setName("edit36");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout11);
    obj.edit37:setLeft(150);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(50);
    obj.edit37:setHeight(25);
    obj.edit37:setField("per_chave_8");
    obj.edit37:setHorzTextAlign("center");
    obj.edit37:setName("edit37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout11);
    obj.edit38:setLeft(210);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(40);
    obj.edit38:setHeight(25);
    obj.edit38:setField("per_atr_8");
    obj.edit38:setHorzTextAlign("center");
    obj.edit38:setName("edit38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout11);
    obj.edit39:setLeft(250);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(40);
    obj.edit39:setHeight(25);
    obj.edit39:setField("per_niv_8");
    obj.edit39:setHorzTextAlign("center");
    obj.edit39:setName("edit39");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout11);
    obj.edit40:setLeft(290);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(40);
    obj.edit40:setHeight(25);
    obj.edit40:setField("per_out_8");
    obj.edit40:setHorzTextAlign("center");
    obj.edit40:setName("edit40");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout11);
    obj.rectangle9:setLeft(340);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(50);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout11);
    obj.label15:setLeft(340);
    obj.label15:setTop(0);
    obj.label15:setWidth(50);
    obj.label15:setHeight(25);
    obj.label15:setField("per_total_8");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.dataLink16 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink16:setParent(obj.layout11);
    obj.dataLink16:setFields({'per_atr_8', 'per_niv_8', 'per_out_8'});
    obj.dataLink16:setName("dataLink16");

    obj.dataLink17 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink17:setParent(obj.layout11);
    obj.dataLink17:setField("per_8");
    obj.dataLink17:setDefaultValue("Detecção");
    obj.dataLink17:setName("dataLink17");

    obj.dataLink18 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink18:setParent(obj.layout11);
    obj.dataLink18:setField("per_chave_8");
    obj.dataLink18:setDefaultValue("PER");
    obj.dataLink18:setName("dataLink18");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout3);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(200);
    obj.layout12:setWidth(500);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout12);
    obj.edit41:setLeft(0);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(150);
    obj.edit41:setHeight(25);
    obj.edit41:setField("per_9");
    obj.edit41:setName("edit41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout12);
    obj.edit42:setLeft(150);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("per_chave_9");
    obj.edit42:setHorzTextAlign("center");
    obj.edit42:setName("edit42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout12);
    obj.edit43:setLeft(210);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(40);
    obj.edit43:setHeight(25);
    obj.edit43:setField("per_atr_9");
    obj.edit43:setHorzTextAlign("center");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout12);
    obj.edit44:setLeft(250);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(40);
    obj.edit44:setHeight(25);
    obj.edit44:setField("per_niv_9");
    obj.edit44:setHorzTextAlign("center");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout12);
    obj.edit45:setLeft(290);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(40);
    obj.edit45:setHeight(25);
    obj.edit45:setField("per_out_9");
    obj.edit45:setHorzTextAlign("center");
    obj.edit45:setName("edit45");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout12);
    obj.rectangle10:setLeft(340);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(50);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout12);
    obj.label16:setLeft(340);
    obj.label16:setTop(0);
    obj.label16:setWidth(50);
    obj.label16:setHeight(25);
    obj.label16:setField("per_total_9");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.dataLink19 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink19:setParent(obj.layout12);
    obj.dataLink19:setFields({'per_atr_9', 'per_niv_9', 'per_out_9'});
    obj.dataLink19:setName("dataLink19");

    obj.dataLink20 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink20:setParent(obj.layout12);
    obj.dataLink20:setField("per_9");
    obj.dataLink20:setDefaultValue("Esgueirar-se");
    obj.dataLink20:setName("dataLink20");

    obj.dataLink21 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink21:setParent(obj.layout12);
    obj.dataLink21:setField("per_chave_9");
    obj.dataLink21:setDefaultValue("AGI");
    obj.dataLink21:setName("dataLink21");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout3);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(225);
    obj.layout13:setWidth(500);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout13);
    obj.edit46:setLeft(0);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(150);
    obj.edit46:setHeight(25);
    obj.edit46:setField("per_10");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout13);
    obj.edit47:setLeft(150);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(25);
    obj.edit47:setField("per_chave_10");
    obj.edit47:setHorzTextAlign("center");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout13);
    obj.edit48:setLeft(210);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(40);
    obj.edit48:setHeight(25);
    obj.edit48:setField("per_atr_10");
    obj.edit48:setHorzTextAlign("center");
    obj.edit48:setName("edit48");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout13);
    obj.edit49:setLeft(250);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(40);
    obj.edit49:setHeight(25);
    obj.edit49:setField("per_niv_10");
    obj.edit49:setHorzTextAlign("center");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout13);
    obj.edit50:setLeft(290);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(40);
    obj.edit50:setHeight(25);
    obj.edit50:setField("per_out_10");
    obj.edit50:setHorzTextAlign("center");
    obj.edit50:setName("edit50");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout13);
    obj.rectangle11:setLeft(340);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(50);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout13);
    obj.label17:setLeft(340);
    obj.label17:setTop(0);
    obj.label17:setWidth(50);
    obj.label17:setHeight(25);
    obj.label17:setField("per_total_10");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.dataLink22 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink22:setParent(obj.layout13);
    obj.dataLink22:setFields({'per_atr_10', 'per_niv_10', 'per_out_10'});
    obj.dataLink22:setName("dataLink22");

    obj.dataLink23 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink23:setParent(obj.layout13);
    obj.dataLink23:setField("per_10");
    obj.dataLink23:setDefaultValue("Comandar");
    obj.dataLink23:setName("dataLink23");

    obj.dataLink24 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink24:setParent(obj.layout13);
    obj.dataLink24:setField("per_chave_10");
    obj.dataLink24:setDefaultValue("SOCIAL");
    obj.dataLink24:setName("dataLink24");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout3);
    obj.layout14:setLeft(5);
    obj.layout14:setTop(250);
    obj.layout14:setWidth(500);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout14);
    obj.edit51:setLeft(0);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(150);
    obj.edit51:setHeight(25);
    obj.edit51:setField("per_11");
    obj.edit51:setName("edit51");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout14);
    obj.edit52:setLeft(150);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(50);
    obj.edit52:setHeight(25);
    obj.edit52:setField("per_chave_11");
    obj.edit52:setHorzTextAlign("center");
    obj.edit52:setName("edit52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout14);
    obj.edit53:setLeft(210);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(40);
    obj.edit53:setHeight(25);
    obj.edit53:setField("per_atr_11");
    obj.edit53:setHorzTextAlign("center");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout14);
    obj.edit54:setLeft(250);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(40);
    obj.edit54:setHeight(25);
    obj.edit54:setField("per_niv_11");
    obj.edit54:setHorzTextAlign("center");
    obj.edit54:setName("edit54");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout14);
    obj.edit55:setLeft(290);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(40);
    obj.edit55:setHeight(25);
    obj.edit55:setField("per_out_11");
    obj.edit55:setHorzTextAlign("center");
    obj.edit55:setName("edit55");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout14);
    obj.rectangle12:setLeft(340);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(50);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout14);
    obj.label18:setLeft(340);
    obj.label18:setTop(0);
    obj.label18:setWidth(50);
    obj.label18:setHeight(25);
    obj.label18:setField("per_total_11");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.dataLink25 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink25:setParent(obj.layout14);
    obj.dataLink25:setFields({'per_atr_11', 'per_niv_11', 'per_out_11'});
    obj.dataLink25:setName("dataLink25");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout3);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(275);
    obj.layout15:setWidth(500);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout15);
    obj.edit56:setLeft(0);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(150);
    obj.edit56:setHeight(25);
    obj.edit56:setField("per_12");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout15);
    obj.edit57:setLeft(150);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(50);
    obj.edit57:setHeight(25);
    obj.edit57:setField("per_chave_12");
    obj.edit57:setHorzTextAlign("center");
    obj.edit57:setName("edit57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout15);
    obj.edit58:setLeft(210);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(40);
    obj.edit58:setHeight(25);
    obj.edit58:setField("per_atr_12");
    obj.edit58:setHorzTextAlign("center");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout15);
    obj.edit59:setLeft(250);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(40);
    obj.edit59:setHeight(25);
    obj.edit59:setField("per_niv_12");
    obj.edit59:setHorzTextAlign("center");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout15);
    obj.edit60:setLeft(290);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(40);
    obj.edit60:setHeight(25);
    obj.edit60:setField("per_out_12");
    obj.edit60:setHorzTextAlign("center");
    obj.edit60:setName("edit60");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout15);
    obj.rectangle13:setLeft(340);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(50);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout15);
    obj.label19:setLeft(340);
    obj.label19:setTop(0);
    obj.label19:setWidth(50);
    obj.label19:setHeight(25);
    obj.label19:setField("per_total_12");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.dataLink26 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink26:setParent(obj.layout15);
    obj.dataLink26:setFields({'per_atr_12', 'per_niv_12', 'per_out_12'});
    obj.dataLink26:setName("dataLink26");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout3);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(300);
    obj.layout16:setWidth(500);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout16);
    obj.edit61:setLeft(0);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(150);
    obj.edit61:setHeight(25);
    obj.edit61:setField("per_13");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout16);
    obj.edit62:setLeft(150);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(50);
    obj.edit62:setHeight(25);
    obj.edit62:setField("per_chave_13");
    obj.edit62:setHorzTextAlign("center");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout16);
    obj.edit63:setLeft(210);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(40);
    obj.edit63:setHeight(25);
    obj.edit63:setField("per_atr_13");
    obj.edit63:setHorzTextAlign("center");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout16);
    obj.edit64:setLeft(250);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(40);
    obj.edit64:setHeight(25);
    obj.edit64:setField("per_niv_13");
    obj.edit64:setHorzTextAlign("center");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout16);
    obj.edit65:setLeft(290);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(40);
    obj.edit65:setHeight(25);
    obj.edit65:setField("per_out_13");
    obj.edit65:setHorzTextAlign("center");
    obj.edit65:setName("edit65");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout16);
    obj.rectangle14:setLeft(340);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(50);
    obj.rectangle14:setHeight(25);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setStrokeColor("white");
    obj.rectangle14:setStrokeSize(1);
    obj.rectangle14:setName("rectangle14");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout16);
    obj.label20:setLeft(340);
    obj.label20:setTop(0);
    obj.label20:setWidth(50);
    obj.label20:setHeight(25);
    obj.label20:setField("per_total_13");
    obj.label20:setHorzTextAlign("center");
    obj.label20:setName("label20");

    obj.dataLink27 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink27:setParent(obj.layout16);
    obj.dataLink27:setFields({'per_atr_13', 'per_niv_13', 'per_out_13'});
    obj.dataLink27:setName("dataLink27");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout3);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(325);
    obj.layout17:setWidth(500);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout17);
    obj.edit66:setLeft(0);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(150);
    obj.edit66:setHeight(25);
    obj.edit66:setField("per_14");
    obj.edit66:setName("edit66");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout17);
    obj.edit67:setLeft(150);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(50);
    obj.edit67:setHeight(25);
    obj.edit67:setField("per_chave_14");
    obj.edit67:setHorzTextAlign("center");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout17);
    obj.edit68:setLeft(210);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(40);
    obj.edit68:setHeight(25);
    obj.edit68:setField("per_atr_14");
    obj.edit68:setHorzTextAlign("center");
    obj.edit68:setName("edit68");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout17);
    obj.edit69:setLeft(250);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(40);
    obj.edit69:setHeight(25);
    obj.edit69:setField("per_niv_14");
    obj.edit69:setHorzTextAlign("center");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout17);
    obj.edit70:setLeft(290);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(40);
    obj.edit70:setHeight(25);
    obj.edit70:setField("per_out_14");
    obj.edit70:setHorzTextAlign("center");
    obj.edit70:setName("edit70");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout17);
    obj.rectangle15:setLeft(340);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(50);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout17);
    obj.label21:setLeft(340);
    obj.label21:setTop(0);
    obj.label21:setWidth(50);
    obj.label21:setHeight(25);
    obj.label21:setField("per_total_14");
    obj.label21:setHorzTextAlign("center");
    obj.label21:setName("label21");

    obj.dataLink28 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink28:setParent(obj.layout17);
    obj.dataLink28:setFields({'per_atr_14', 'per_niv_14', 'per_out_14'});
    obj.dataLink28:setName("dataLink28");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout3);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(350);
    obj.layout18:setWidth(500);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout18);
    obj.edit71:setLeft(0);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(150);
    obj.edit71:setHeight(25);
    obj.edit71:setField("per_15");
    obj.edit71:setName("edit71");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout18);
    obj.edit72:setLeft(150);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(50);
    obj.edit72:setHeight(25);
    obj.edit72:setField("per_chave_15");
    obj.edit72:setHorzTextAlign("center");
    obj.edit72:setName("edit72");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout18);
    obj.edit73:setLeft(210);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(40);
    obj.edit73:setHeight(25);
    obj.edit73:setField("per_atr_15");
    obj.edit73:setHorzTextAlign("center");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout18);
    obj.edit74:setLeft(250);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(40);
    obj.edit74:setHeight(25);
    obj.edit74:setField("per_niv_15");
    obj.edit74:setHorzTextAlign("center");
    obj.edit74:setName("edit74");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout18);
    obj.edit75:setLeft(290);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(40);
    obj.edit75:setHeight(25);
    obj.edit75:setField("per_out_15");
    obj.edit75:setHorzTextAlign("center");
    obj.edit75:setName("edit75");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout18);
    obj.rectangle16:setLeft(340);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(50);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout18);
    obj.label22:setLeft(340);
    obj.label22:setTop(0);
    obj.label22:setWidth(50);
    obj.label22:setHeight(25);
    obj.label22:setField("per_total_15");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.dataLink29 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink29:setParent(obj.layout18);
    obj.dataLink29:setFields({'per_atr_15', 'per_niv_15', 'per_out_15'});
    obj.dataLink29:setName("dataLink29");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout3);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(375);
    obj.layout19:setWidth(500);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout19);
    obj.edit76:setLeft(0);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(150);
    obj.edit76:setHeight(25);
    obj.edit76:setField("per_16");
    obj.edit76:setName("edit76");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout19);
    obj.edit77:setLeft(150);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(50);
    obj.edit77:setHeight(25);
    obj.edit77:setField("per_chave_16");
    obj.edit77:setHorzTextAlign("center");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout19);
    obj.edit78:setLeft(210);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(40);
    obj.edit78:setHeight(25);
    obj.edit78:setField("per_atr_16");
    obj.edit78:setHorzTextAlign("center");
    obj.edit78:setName("edit78");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout19);
    obj.edit79:setLeft(250);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(40);
    obj.edit79:setHeight(25);
    obj.edit79:setField("per_niv_16");
    obj.edit79:setHorzTextAlign("center");
    obj.edit79:setName("edit79");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout19);
    obj.edit80:setLeft(290);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(40);
    obj.edit80:setHeight(25);
    obj.edit80:setField("per_out_16");
    obj.edit80:setHorzTextAlign("center");
    obj.edit80:setName("edit80");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout19);
    obj.rectangle17:setLeft(340);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(50);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout19);
    obj.label23:setLeft(340);
    obj.label23:setTop(0);
    obj.label23:setWidth(50);
    obj.label23:setHeight(25);
    obj.label23:setField("per_total_16");
    obj.label23:setHorzTextAlign("center");
    obj.label23:setName("label23");

    obj.dataLink30 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink30:setParent(obj.layout19);
    obj.dataLink30:setFields({'per_atr_16', 'per_niv_16', 'per_out_16'});
    obj.dataLink30:setName("dataLink30");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout3);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(400);
    obj.layout20:setWidth(500);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout20);
    obj.edit81:setLeft(0);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(150);
    obj.edit81:setHeight(25);
    obj.edit81:setField("per_17");
    obj.edit81:setName("edit81");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout20);
    obj.edit82:setLeft(150);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(50);
    obj.edit82:setHeight(25);
    obj.edit82:setField("per_chave_17");
    obj.edit82:setHorzTextAlign("center");
    obj.edit82:setName("edit82");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout20);
    obj.edit83:setLeft(210);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(40);
    obj.edit83:setHeight(25);
    obj.edit83:setField("per_atr_17");
    obj.edit83:setHorzTextAlign("center");
    obj.edit83:setName("edit83");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout20);
    obj.edit84:setLeft(250);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(40);
    obj.edit84:setHeight(25);
    obj.edit84:setField("per_niv_17");
    obj.edit84:setHorzTextAlign("center");
    obj.edit84:setName("edit84");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout20);
    obj.edit85:setLeft(290);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(40);
    obj.edit85:setHeight(25);
    obj.edit85:setField("per_out_17");
    obj.edit85:setHorzTextAlign("center");
    obj.edit85:setName("edit85");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout20);
    obj.rectangle18:setLeft(340);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(50);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout20);
    obj.label24:setLeft(340);
    obj.label24:setTop(0);
    obj.label24:setWidth(50);
    obj.label24:setHeight(25);
    obj.label24:setField("per_total_17");
    obj.label24:setHorzTextAlign("center");
    obj.label24:setName("label24");

    obj.dataLink31 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink31:setParent(obj.layout20);
    obj.dataLink31:setFields({'per_atr_17', 'per_niv_17', 'per_out_17'});
    obj.dataLink31:setName("dataLink31");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout3);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(425);
    obj.layout21:setWidth(500);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout21);
    obj.edit86:setLeft(0);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(150);
    obj.edit86:setHeight(25);
    obj.edit86:setField("per_18");
    obj.edit86:setName("edit86");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout21);
    obj.edit87:setLeft(150);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(50);
    obj.edit87:setHeight(25);
    obj.edit87:setField("per_chave_18");
    obj.edit87:setHorzTextAlign("center");
    obj.edit87:setName("edit87");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout21);
    obj.edit88:setLeft(210);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(40);
    obj.edit88:setHeight(25);
    obj.edit88:setField("per_atr_18");
    obj.edit88:setHorzTextAlign("center");
    obj.edit88:setName("edit88");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout21);
    obj.edit89:setLeft(250);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(40);
    obj.edit89:setHeight(25);
    obj.edit89:setField("per_niv_18");
    obj.edit89:setHorzTextAlign("center");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout21);
    obj.edit90:setLeft(290);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(40);
    obj.edit90:setHeight(25);
    obj.edit90:setField("per_out_18");
    obj.edit90:setHorzTextAlign("center");
    obj.edit90:setName("edit90");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout21);
    obj.rectangle19:setLeft(340);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(50);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout21);
    obj.label25:setLeft(340);
    obj.label25:setTop(0);
    obj.label25:setWidth(50);
    obj.label25:setHeight(25);
    obj.label25:setField("per_total_18");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.dataLink32 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink32:setParent(obj.layout21);
    obj.dataLink32:setFields({'per_atr_18', 'per_niv_18', 'per_out_18'});
    obj.dataLink32:setName("dataLink32");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout3);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(450);
    obj.layout22:setWidth(500);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout22);
    obj.edit91:setLeft(0);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(150);
    obj.edit91:setHeight(25);
    obj.edit91:setField("per_19");
    obj.edit91:setName("edit91");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout22);
    obj.edit92:setLeft(150);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(50);
    obj.edit92:setHeight(25);
    obj.edit92:setField("per_chave_19");
    obj.edit92:setHorzTextAlign("center");
    obj.edit92:setName("edit92");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout22);
    obj.edit93:setLeft(210);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(40);
    obj.edit93:setHeight(25);
    obj.edit93:setField("per_atr_19");
    obj.edit93:setHorzTextAlign("center");
    obj.edit93:setName("edit93");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout22);
    obj.edit94:setLeft(250);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(40);
    obj.edit94:setHeight(25);
    obj.edit94:setField("per_niv_19");
    obj.edit94:setHorzTextAlign("center");
    obj.edit94:setName("edit94");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout22);
    obj.edit95:setLeft(290);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(40);
    obj.edit95:setHeight(25);
    obj.edit95:setField("per_out_19");
    obj.edit95:setHorzTextAlign("center");
    obj.edit95:setName("edit95");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout22);
    obj.rectangle20:setLeft(340);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(50);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout22);
    obj.label26:setLeft(340);
    obj.label26:setTop(0);
    obj.label26:setWidth(50);
    obj.label26:setHeight(25);
    obj.label26:setField("per_total_19");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.dataLink33 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink33:setParent(obj.layout22);
    obj.dataLink33:setFields({'per_atr_19', 'per_niv_19', 'per_out_19'});
    obj.dataLink33:setName("dataLink33");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout3);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(475);
    obj.layout23:setWidth(500);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout23);
    obj.edit96:setLeft(0);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(150);
    obj.edit96:setHeight(25);
    obj.edit96:setField("per_20");
    obj.edit96:setName("edit96");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout23);
    obj.edit97:setLeft(150);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(50);
    obj.edit97:setHeight(25);
    obj.edit97:setField("per_chave_20");
    obj.edit97:setHorzTextAlign("center");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout23);
    obj.edit98:setLeft(210);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(40);
    obj.edit98:setHeight(25);
    obj.edit98:setField("per_atr_20");
    obj.edit98:setHorzTextAlign("center");
    obj.edit98:setName("edit98");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout23);
    obj.edit99:setLeft(250);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(40);
    obj.edit99:setHeight(25);
    obj.edit99:setField("per_niv_20");
    obj.edit99:setHorzTextAlign("center");
    obj.edit99:setName("edit99");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout23);
    obj.edit100:setLeft(290);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(40);
    obj.edit100:setHeight(25);
    obj.edit100:setField("per_out_20");
    obj.edit100:setHorzTextAlign("center");
    obj.edit100:setName("edit100");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout23);
    obj.rectangle21:setLeft(340);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(50);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout23);
    obj.label27:setLeft(340);
    obj.label27:setTop(0);
    obj.label27:setWidth(50);
    obj.label27:setHeight(25);
    obj.label27:setField("per_total_20");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.dataLink34 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink34:setParent(obj.layout23);
    obj.dataLink34:setFields({'per_atr_20', 'per_niv_20', 'per_out_20'});
    obj.dataLink34:setName("dataLink34");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout3);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(500);
    obj.layout24:setWidth(500);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout24);
    obj.edit101:setLeft(0);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(150);
    obj.edit101:setHeight(25);
    obj.edit101:setField("per_21");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout24);
    obj.edit102:setLeft(150);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(50);
    obj.edit102:setHeight(25);
    obj.edit102:setField("per_chave_21");
    obj.edit102:setHorzTextAlign("center");
    obj.edit102:setName("edit102");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout24);
    obj.edit103:setLeft(210);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(40);
    obj.edit103:setHeight(25);
    obj.edit103:setField("per_atr_21");
    obj.edit103:setHorzTextAlign("center");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout24);
    obj.edit104:setLeft(250);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(40);
    obj.edit104:setHeight(25);
    obj.edit104:setField("per_niv_21");
    obj.edit104:setHorzTextAlign("center");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout24);
    obj.edit105:setLeft(290);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(40);
    obj.edit105:setHeight(25);
    obj.edit105:setField("per_out_21");
    obj.edit105:setHorzTextAlign("center");
    obj.edit105:setName("edit105");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout24);
    obj.rectangle22:setLeft(340);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(50);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout24);
    obj.label28:setLeft(340);
    obj.label28:setTop(0);
    obj.label28:setWidth(50);
    obj.label28:setHeight(25);
    obj.label28:setField("per_total_21");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.dataLink35 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink35:setParent(obj.layout24);
    obj.dataLink35:setFields({'per_atr_21', 'per_niv_21', 'per_out_21'});
    obj.dataLink35:setName("dataLink35");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout3);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(525);
    obj.layout25:setWidth(500);
    obj.layout25:setHeight(25);
    obj.layout25:setName("layout25");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout25);
    obj.edit106:setLeft(0);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(150);
    obj.edit106:setHeight(25);
    obj.edit106:setField("per_22");
    obj.edit106:setName("edit106");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout25);
    obj.edit107:setLeft(150);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(50);
    obj.edit107:setHeight(25);
    obj.edit107:setField("per_chave_22");
    obj.edit107:setHorzTextAlign("center");
    obj.edit107:setName("edit107");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout25);
    obj.edit108:setLeft(210);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(40);
    obj.edit108:setHeight(25);
    obj.edit108:setField("per_atr_22");
    obj.edit108:setHorzTextAlign("center");
    obj.edit108:setName("edit108");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout25);
    obj.edit109:setLeft(250);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(40);
    obj.edit109:setHeight(25);
    obj.edit109:setField("per_niv_22");
    obj.edit109:setHorzTextAlign("center");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout25);
    obj.edit110:setLeft(290);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(40);
    obj.edit110:setHeight(25);
    obj.edit110:setField("per_out_22");
    obj.edit110:setHorzTextAlign("center");
    obj.edit110:setName("edit110");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout25);
    obj.rectangle23:setLeft(340);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(50);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout25);
    obj.label29:setLeft(340);
    obj.label29:setTop(0);
    obj.label29:setWidth(50);
    obj.label29:setHeight(25);
    obj.label29:setField("per_total_22");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.dataLink36 = gui.fromHandle(_obj_newObject("dataLink"));
    obj.dataLink36:setParent(obj.layout25);
    obj.dataLink36:setFields({'per_atr_22', 'per_niv_22', 'per_out_22'});
    obj.dataLink36:setName("dataLink36");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.scrollBox1);
    obj.layout26:setLeft(410);
    obj.layout26:setTop(0);
    obj.layout26:setWidth(450);
    obj.layout26:setHeight(610);
    obj.layout26:setName("layout26");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout26);
    obj.rectangle24:setAlign("client");
    obj.rectangle24:setColor("black");
    obj.rectangle24:setXradius(5);
    obj.rectangle24:setYradius(5);
    obj.rectangle24:setCornerType("round");
    obj.rectangle24:setName("rectangle24");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout26);
    obj.label30:setLeft(5);
    obj.label30:setTop(0);
    obj.label30:setWidth(440);
    obj.label30:setHeight(20);
    obj.label30:setText("BENEFICIOS E HABILIDADES");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout26);
    obj.layout27:setLeft(5);
    obj.layout27:setTop(25);
    obj.layout27:setWidth(500);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout27);
    obj.label31:setLeft(0);
    obj.label31:setTop(5);
    obj.label31:setWidth(150);
    obj.label31:setHeight(20);
    obj.label31:setText("NOME");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout27);
    obj.label32:setLeft(150);
    obj.label32:setTop(5);
    obj.label32:setWidth(250);
    obj.label32:setHeight(20);
    obj.label32:setText("DESCRIÇÃO");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout27);
    obj.label33:setLeft(400);
    obj.label33:setTop(5);
    obj.label33:setWidth(40);
    obj.label33:setHeight(20);
    obj.label33:setText("PAG");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout26);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(50);
    obj.layout28:setWidth(500);
    obj.layout28:setHeight(555);
    obj.layout28:setName("layout28");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout28);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(0);
    obj.layout29:setWidth(500);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout29);
    obj.edit111:setLeft(0);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(150);
    obj.edit111:setHeight(25);
    obj.edit111:setField("ben_1");
    obj.edit111:setName("edit111");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout29);
    obj.edit112:setLeft(150);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(250);
    obj.edit112:setHeight(25);
    obj.edit112:setField("ben_desc_1");
    obj.edit112:setName("edit112");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout29);
    obj.edit113:setLeft(400);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(40);
    obj.edit113:setHeight(25);
    obj.edit113:setField("ben_pag_1");
    obj.edit113:setHorzTextAlign("center");
    obj.edit113:setName("edit113");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout28);
    obj.layout30:setLeft(5);
    obj.layout30:setTop(25);
    obj.layout30:setWidth(500);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout30);
    obj.edit114:setLeft(0);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(150);
    obj.edit114:setHeight(25);
    obj.edit114:setField("ben_2");
    obj.edit114:setName("edit114");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout30);
    obj.edit115:setLeft(150);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(250);
    obj.edit115:setHeight(25);
    obj.edit115:setField("ben_desc_2");
    obj.edit115:setName("edit115");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout30);
    obj.edit116:setLeft(400);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(40);
    obj.edit116:setHeight(25);
    obj.edit116:setField("ben_pag_2");
    obj.edit116:setHorzTextAlign("center");
    obj.edit116:setName("edit116");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout28);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(50);
    obj.layout31:setWidth(500);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout31);
    obj.edit117:setLeft(0);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(150);
    obj.edit117:setHeight(25);
    obj.edit117:setField("ben_3");
    obj.edit117:setName("edit117");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout31);
    obj.edit118:setLeft(150);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(250);
    obj.edit118:setHeight(25);
    obj.edit118:setField("ben_desc_3");
    obj.edit118:setName("edit118");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout31);
    obj.edit119:setLeft(400);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(40);
    obj.edit119:setHeight(25);
    obj.edit119:setField("ben_pag_3");
    obj.edit119:setHorzTextAlign("center");
    obj.edit119:setName("edit119");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout28);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(75);
    obj.layout32:setWidth(500);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout32);
    obj.edit120:setLeft(0);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(150);
    obj.edit120:setHeight(25);
    obj.edit120:setField("ben_4");
    obj.edit120:setName("edit120");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout32);
    obj.edit121:setLeft(150);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(250);
    obj.edit121:setHeight(25);
    obj.edit121:setField("ben_desc_4");
    obj.edit121:setName("edit121");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout32);
    obj.edit122:setLeft(400);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(40);
    obj.edit122:setHeight(25);
    obj.edit122:setField("ben_pag_4");
    obj.edit122:setHorzTextAlign("center");
    obj.edit122:setName("edit122");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout28);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(100);
    obj.layout33:setWidth(500);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout33);
    obj.edit123:setLeft(0);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(150);
    obj.edit123:setHeight(25);
    obj.edit123:setField("ben_5");
    obj.edit123:setName("edit123");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout33);
    obj.edit124:setLeft(150);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(250);
    obj.edit124:setHeight(25);
    obj.edit124:setField("ben_desc_5");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout33);
    obj.edit125:setLeft(400);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(40);
    obj.edit125:setHeight(25);
    obj.edit125:setField("ben_pag_5");
    obj.edit125:setHorzTextAlign("center");
    obj.edit125:setName("edit125");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout28);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(125);
    obj.layout34:setWidth(500);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout34);
    obj.edit126:setLeft(0);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(150);
    obj.edit126:setHeight(25);
    obj.edit126:setField("ben_6");
    obj.edit126:setName("edit126");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout34);
    obj.edit127:setLeft(150);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(250);
    obj.edit127:setHeight(25);
    obj.edit127:setField("ben_desc_6");
    obj.edit127:setName("edit127");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout34);
    obj.edit128:setLeft(400);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(40);
    obj.edit128:setHeight(25);
    obj.edit128:setField("ben_pag_6");
    obj.edit128:setHorzTextAlign("center");
    obj.edit128:setName("edit128");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout28);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(150);
    obj.layout35:setWidth(500);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout35);
    obj.edit129:setLeft(0);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(150);
    obj.edit129:setHeight(25);
    obj.edit129:setField("ben_7");
    obj.edit129:setName("edit129");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout35);
    obj.edit130:setLeft(150);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(250);
    obj.edit130:setHeight(25);
    obj.edit130:setField("ben_desc_7");
    obj.edit130:setName("edit130");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout35);
    obj.edit131:setLeft(400);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(40);
    obj.edit131:setHeight(25);
    obj.edit131:setField("ben_pag_7");
    obj.edit131:setHorzTextAlign("center");
    obj.edit131:setName("edit131");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout28);
    obj.layout36:setLeft(5);
    obj.layout36:setTop(175);
    obj.layout36:setWidth(500);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout36);
    obj.edit132:setLeft(0);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(150);
    obj.edit132:setHeight(25);
    obj.edit132:setField("ben_8");
    obj.edit132:setName("edit132");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout36);
    obj.edit133:setLeft(150);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(250);
    obj.edit133:setHeight(25);
    obj.edit133:setField("ben_desc_8");
    obj.edit133:setName("edit133");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout36);
    obj.edit134:setLeft(400);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(40);
    obj.edit134:setHeight(25);
    obj.edit134:setField("ben_pag_8");
    obj.edit134:setHorzTextAlign("center");
    obj.edit134:setName("edit134");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout28);
    obj.layout37:setLeft(5);
    obj.layout37:setTop(200);
    obj.layout37:setWidth(500);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout37);
    obj.edit135:setLeft(0);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(150);
    obj.edit135:setHeight(25);
    obj.edit135:setField("ben_9");
    obj.edit135:setName("edit135");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout37);
    obj.edit136:setLeft(150);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(250);
    obj.edit136:setHeight(25);
    obj.edit136:setField("ben_desc_9");
    obj.edit136:setName("edit136");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout37);
    obj.edit137:setLeft(400);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(40);
    obj.edit137:setHeight(25);
    obj.edit137:setField("ben_pag_9");
    obj.edit137:setHorzTextAlign("center");
    obj.edit137:setName("edit137");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout28);
    obj.layout38:setLeft(5);
    obj.layout38:setTop(225);
    obj.layout38:setWidth(500);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout38);
    obj.edit138:setLeft(0);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(150);
    obj.edit138:setHeight(25);
    obj.edit138:setField("ben_10");
    obj.edit138:setName("edit138");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout38);
    obj.edit139:setLeft(150);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(250);
    obj.edit139:setHeight(25);
    obj.edit139:setField("ben_desc_10");
    obj.edit139:setName("edit139");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout38);
    obj.edit140:setLeft(400);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(40);
    obj.edit140:setHeight(25);
    obj.edit140:setField("ben_pag_10");
    obj.edit140:setHorzTextAlign("center");
    obj.edit140:setName("edit140");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout28);
    obj.layout39:setLeft(5);
    obj.layout39:setTop(250);
    obj.layout39:setWidth(500);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout39);
    obj.edit141:setLeft(0);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(150);
    obj.edit141:setHeight(25);
    obj.edit141:setField("ben_11");
    obj.edit141:setName("edit141");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout39);
    obj.edit142:setLeft(150);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(250);
    obj.edit142:setHeight(25);
    obj.edit142:setField("ben_desc_11");
    obj.edit142:setName("edit142");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout39);
    obj.edit143:setLeft(400);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(40);
    obj.edit143:setHeight(25);
    obj.edit143:setField("ben_pag_11");
    obj.edit143:setHorzTextAlign("center");
    obj.edit143:setName("edit143");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout28);
    obj.layout40:setLeft(5);
    obj.layout40:setTop(275);
    obj.layout40:setWidth(500);
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout40);
    obj.edit144:setLeft(0);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(150);
    obj.edit144:setHeight(25);
    obj.edit144:setField("ben_12");
    obj.edit144:setName("edit144");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout40);
    obj.edit145:setLeft(150);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(250);
    obj.edit145:setHeight(25);
    obj.edit145:setField("ben_desc_12");
    obj.edit145:setName("edit145");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout40);
    obj.edit146:setLeft(400);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(40);
    obj.edit146:setHeight(25);
    obj.edit146:setField("ben_pag_12");
    obj.edit146:setHorzTextAlign("center");
    obj.edit146:setName("edit146");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout28);
    obj.layout41:setLeft(5);
    obj.layout41:setTop(300);
    obj.layout41:setWidth(500);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout41);
    obj.edit147:setLeft(0);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(150);
    obj.edit147:setHeight(25);
    obj.edit147:setField("ben_13");
    obj.edit147:setName("edit147");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout41);
    obj.edit148:setLeft(150);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(250);
    obj.edit148:setHeight(25);
    obj.edit148:setField("ben_desc_13");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout41);
    obj.edit149:setLeft(400);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(40);
    obj.edit149:setHeight(25);
    obj.edit149:setField("ben_pag_13");
    obj.edit149:setHorzTextAlign("center");
    obj.edit149:setName("edit149");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout28);
    obj.layout42:setLeft(5);
    obj.layout42:setTop(325);
    obj.layout42:setWidth(500);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout42);
    obj.edit150:setLeft(0);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(150);
    obj.edit150:setHeight(25);
    obj.edit150:setField("ben_14");
    obj.edit150:setName("edit150");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout42);
    obj.edit151:setLeft(150);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(250);
    obj.edit151:setHeight(25);
    obj.edit151:setField("ben_desc_14");
    obj.edit151:setName("edit151");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout42);
    obj.edit152:setLeft(400);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(40);
    obj.edit152:setHeight(25);
    obj.edit152:setField("ben_pag_14");
    obj.edit152:setHorzTextAlign("center");
    obj.edit152:setName("edit152");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout28);
    obj.layout43:setLeft(5);
    obj.layout43:setTop(350);
    obj.layout43:setWidth(500);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout43);
    obj.edit153:setLeft(0);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(150);
    obj.edit153:setHeight(25);
    obj.edit153:setField("ben_15");
    obj.edit153:setName("edit153");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout43);
    obj.edit154:setLeft(150);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(250);
    obj.edit154:setHeight(25);
    obj.edit154:setField("ben_desc_15");
    obj.edit154:setName("edit154");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout43);
    obj.edit155:setLeft(400);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(40);
    obj.edit155:setHeight(25);
    obj.edit155:setField("ben_pag_15");
    obj.edit155:setHorzTextAlign("center");
    obj.edit155:setName("edit155");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout28);
    obj.layout44:setLeft(5);
    obj.layout44:setTop(375);
    obj.layout44:setWidth(500);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout44);
    obj.edit156:setLeft(0);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(150);
    obj.edit156:setHeight(25);
    obj.edit156:setField("ben_16");
    obj.edit156:setName("edit156");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout44);
    obj.edit157:setLeft(150);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(250);
    obj.edit157:setHeight(25);
    obj.edit157:setField("ben_desc_16");
    obj.edit157:setName("edit157");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout44);
    obj.edit158:setLeft(400);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(40);
    obj.edit158:setHeight(25);
    obj.edit158:setField("ben_pag_16");
    obj.edit158:setHorzTextAlign("center");
    obj.edit158:setName("edit158");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout28);
    obj.layout45:setLeft(5);
    obj.layout45:setTop(400);
    obj.layout45:setWidth(500);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout45);
    obj.edit159:setLeft(0);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(150);
    obj.edit159:setHeight(25);
    obj.edit159:setField("ben_17");
    obj.edit159:setName("edit159");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout45);
    obj.edit160:setLeft(150);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(250);
    obj.edit160:setHeight(25);
    obj.edit160:setField("ben_desc_17");
    obj.edit160:setName("edit160");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout45);
    obj.edit161:setLeft(400);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(40);
    obj.edit161:setHeight(25);
    obj.edit161:setField("ben_pag_17");
    obj.edit161:setHorzTextAlign("center");
    obj.edit161:setName("edit161");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout28);
    obj.layout46:setLeft(5);
    obj.layout46:setTop(425);
    obj.layout46:setWidth(500);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout46);
    obj.edit162:setLeft(0);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(150);
    obj.edit162:setHeight(25);
    obj.edit162:setField("ben_18");
    obj.edit162:setName("edit162");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout46);
    obj.edit163:setLeft(150);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(250);
    obj.edit163:setHeight(25);
    obj.edit163:setField("ben_desc_18");
    obj.edit163:setName("edit163");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout46);
    obj.edit164:setLeft(400);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(40);
    obj.edit164:setHeight(25);
    obj.edit164:setField("ben_pag_18");
    obj.edit164:setHorzTextAlign("center");
    obj.edit164:setName("edit164");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout28);
    obj.layout47:setLeft(5);
    obj.layout47:setTop(450);
    obj.layout47:setWidth(500);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout47);
    obj.edit165:setLeft(0);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(150);
    obj.edit165:setHeight(25);
    obj.edit165:setField("ben_19");
    obj.edit165:setName("edit165");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout47);
    obj.edit166:setLeft(150);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(250);
    obj.edit166:setHeight(25);
    obj.edit166:setField("ben_desc_19");
    obj.edit166:setName("edit166");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout47);
    obj.edit167:setLeft(400);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(40);
    obj.edit167:setHeight(25);
    obj.edit167:setField("ben_pag_19");
    obj.edit167:setHorzTextAlign("center");
    obj.edit167:setName("edit167");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout28);
    obj.layout48:setLeft(5);
    obj.layout48:setTop(475);
    obj.layout48:setWidth(500);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout48);
    obj.edit168:setLeft(0);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(150);
    obj.edit168:setHeight(25);
    obj.edit168:setField("ben_20");
    obj.edit168:setName("edit168");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout48);
    obj.edit169:setLeft(150);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(250);
    obj.edit169:setHeight(25);
    obj.edit169:setField("ben_desc_20");
    obj.edit169:setName("edit169");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout48);
    obj.edit170:setLeft(400);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(40);
    obj.edit170:setHeight(25);
    obj.edit170:setField("ben_pag_20");
    obj.edit170:setHorzTextAlign("center");
    obj.edit170:setName("edit170");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout28);
    obj.layout49:setLeft(5);
    obj.layout49:setTop(500);
    obj.layout49:setWidth(500);
    obj.layout49:setHeight(25);
    obj.layout49:setName("layout49");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout49);
    obj.edit171:setLeft(0);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(150);
    obj.edit171:setHeight(25);
    obj.edit171:setField("ben_21");
    obj.edit171:setName("edit171");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout49);
    obj.edit172:setLeft(150);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(250);
    obj.edit172:setHeight(25);
    obj.edit172:setField("ben_desc_21");
    obj.edit172:setName("edit172");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout49);
    obj.edit173:setLeft(400);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(40);
    obj.edit173:setHeight(25);
    obj.edit173:setField("ben_pag_21");
    obj.edit173:setHorzTextAlign("center");
    obj.edit173:setName("edit173");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout28);
    obj.layout50:setLeft(5);
    obj.layout50:setTop(525);
    obj.layout50:setWidth(500);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout50);
    obj.edit174:setLeft(0);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(150);
    obj.edit174:setHeight(25);
    obj.edit174:setField("ben_22");
    obj.edit174:setName("edit174");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout50);
    obj.edit175:setLeft(150);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(250);
    obj.edit175:setHeight(25);
    obj.edit175:setField("ben_desc_22");
    obj.edit175:setName("edit175");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout50);
    obj.edit176:setLeft(400);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(40);
    obj.edit176:setHeight(25);
    obj.edit176:setField("ben_pag_22");
    obj.edit176:setHorzTextAlign("center");
    obj.edit176:setName("edit176");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.scrollBox1);
    obj.layout51:setLeft(870);
    obj.layout51:setTop(0);
    obj.layout51:setWidth(250);
    obj.layout51:setHeight(200);
    obj.layout51:setName("layout51");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout51);
    obj.rectangle25:setAlign("client");
    obj.rectangle25:setColor("black");
    obj.rectangle25:setXradius(5);
    obj.rectangle25:setYradius(5);
    obj.rectangle25:setCornerType("round");
    obj.rectangle25:setName("rectangle25");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout51);
    obj.label34:setLeft(5);
    obj.label34:setTop(0);
    obj.label34:setWidth(240);
    obj.label34:setHeight(20);
    obj.label34:setText("CONEXÕES");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout51);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(25);
    obj.textEditor1:setWidth(240);
    obj.textEditor1:setHeight(170);
    obj.textEditor1:setField("conexoes");
    obj.textEditor1:setName("textEditor1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20RdF%20releases/imagens/block.png");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj._e_event0 = obj.dataLink1:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_1 = 	(tonumber(sheet.per_atr_1) or 0) + 
            	                                            	(tonumber(sheet.per_niv_1) or 0) + 
            	                                            	(tonumber(sheet.per_out_1) or 0);
                            	end;
        end, obj);

    obj._e_event1 = obj.dataLink4:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_2 = 	(tonumber(sheet.per_atr_2) or 0) + 
            	                                            	(tonumber(sheet.per_niv_2) or 0) + 
            	                                            	(tonumber(sheet.per_out_2) or 0);
                            	end;
        end, obj);

    obj._e_event2 = obj.dataLink7:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_3 = 	(tonumber(sheet.per_atr_3) or 0) + 
            	                                            	(tonumber(sheet.per_niv_3) or 0) + 
            	                                            	(tonumber(sheet.per_out_3) or 0);
                            	end;
        end, obj);

    obj._e_event3 = obj.dataLink10:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_4 = 	(tonumber(sheet.per_atr_4) or 0) + 
            	                                            	(tonumber(sheet.per_niv_4) or 0) + 
            	                                            	(tonumber(sheet.per_out_4) or 0);
                            	end;
        end, obj);

    obj._e_event4 = obj.dataLink13:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_5 = 	(tonumber(sheet.per_atr_5) or 0) + 
            	                                            	(tonumber(sheet.per_niv_5) or 0) + 
            	                                            	(tonumber(sheet.per_out_5) or 0);
                            	end;
        end, obj);

    obj._e_event5 = obj.dataLink14:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_6 = 	(tonumber(sheet.per_atr_6) or 0) + 
            	                                            	(tonumber(sheet.per_niv_6) or 0) + 
            	                                            	(tonumber(sheet.per_out_6) or 0);
                            	end;
        end, obj);

    obj._e_event6 = obj.dataLink15:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_7 = 	(tonumber(sheet.per_atr_7) or 0) + 
            	                                            	(tonumber(sheet.per_niv_7) or 0) + 
            	                                            	(tonumber(sheet.per_out_7) or 0);
                            	end;
        end, obj);

    obj._e_event7 = obj.dataLink16:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_8 = 	(tonumber(sheet.per_atr_8) or 0) + 
            	                                            	(tonumber(sheet.per_niv_8) or 0) + 
            	                                            	(tonumber(sheet.per_out_8) or 0);
                            	end;
        end, obj);

    obj._e_event8 = obj.dataLink19:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_9 = 	(tonumber(sheet.per_atr_9) or 0) + 
            	                                            	(tonumber(sheet.per_niv_9) or 0) + 
            	                                            	(tonumber(sheet.per_out_9) or 0);
                            	end;
        end, obj);

    obj._e_event9 = obj.dataLink22:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_10 = 	(tonumber(sheet.per_atr_10) or 0) + 
            	                                            	(tonumber(sheet.per_niv_10) or 0) + 
            	                                            	(tonumber(sheet.per_out_10) or 0);
                            	end;
        end, obj);

    obj._e_event10 = obj.dataLink25:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_11 = 	(tonumber(sheet.per_atr_11) or 0) + 
            	                                            	(tonumber(sheet.per_niv_11) or 0) + 
            	                                            	(tonumber(sheet.per_out_11) or 0);
                            	end;
        end, obj);

    obj._e_event11 = obj.dataLink26:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_12 = 	(tonumber(sheet.per_atr_12) or 0) + 
            	                                            	(tonumber(sheet.per_niv_12) or 0) + 
            	                                            	(tonumber(sheet.per_out_12) or 0);
                            	end;
        end, obj);

    obj._e_event12 = obj.dataLink27:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_13 = 	(tonumber(sheet.per_atr_13) or 0) + 
            	                                            	(tonumber(sheet.per_niv_13) or 0) + 
            	                                            	(tonumber(sheet.per_out_13) or 0);
                            	end;
        end, obj);

    obj._e_event13 = obj.dataLink28:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_14 = 	(tonumber(sheet.per_atr_14) or 0) + 
            	                                            	(tonumber(sheet.per_niv_14) or 0) + 
            	                                            	(tonumber(sheet.per_out_14) or 0);
                            	end;
        end, obj);

    obj._e_event14 = obj.dataLink29:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_15 = 	(tonumber(sheet.per_atr_15) or 0) + 
            	                                            	(tonumber(sheet.per_niv_15) or 0) + 
            	                                            	(tonumber(sheet.per_out_15) or 0);
                            	end;
        end, obj);

    obj._e_event15 = obj.dataLink30:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_16 = 	(tonumber(sheet.per_atr_16) or 0) + 
            	                                            	(tonumber(sheet.per_niv_16) or 0) + 
            	                                            	(tonumber(sheet.per_out_16) or 0);
                            	end;
        end, obj);

    obj._e_event16 = obj.dataLink31:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_17 = 	(tonumber(sheet.per_atr_17) or 0) + 
            	                                            	(tonumber(sheet.per_niv_17) or 0) + 
            	                                            	(tonumber(sheet.per_out_17) or 0);
                            	end;
        end, obj);

    obj._e_event17 = obj.dataLink32:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_18 = 	(tonumber(sheet.per_atr_18) or 0) + 
            	                                            	(tonumber(sheet.per_niv_18) or 0) + 
            	                                            	(tonumber(sheet.per_out_18) or 0);
                            	end;
        end, obj);

    obj._e_event18 = obj.dataLink33:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_19 = 	(tonumber(sheet.per_atr_19) or 0) + 
            	                                            	(tonumber(sheet.per_niv_19) or 0) + 
            	                                            	(tonumber(sheet.per_out_19) or 0);
                            	end;
        end, obj);

    obj._e_event19 = obj.dataLink34:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_20 = 	(tonumber(sheet.per_atr_20) or 0) + 
            	                                            	(tonumber(sheet.per_niv_20) or 0) + 
            	                                            	(tonumber(sheet.per_out_20) or 0);
                            	end;
        end, obj);

    obj._e_event20 = obj.dataLink35:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_21 = 	(tonumber(sheet.per_atr_21) or 0) + 
            	                                            	(tonumber(sheet.per_niv_21) or 0) + 
            	                                            	(tonumber(sheet.per_out_21) or 0);
                            	end;
        end, obj);

    obj._e_event21 = obj.dataLink36:addEventListener("onChange",
        function (self, field, oldValue, newValue)
            if sheet~=nil then
                            		sheet.per_total_22 = 	(tonumber(sheet.per_atr_22) or 0) + 
            	                                            	(tonumber(sheet.per_niv_22) or 0) + 
            	                                            	(tonumber(sheet.per_out_22) or 0);
                            	end;
        end, obj);

    function obj:_releaseEvents()
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

        if self.dataLink12 ~= nil then self.dataLink12:destroy(); self.dataLink12 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.dataLink28 ~= nil then self.dataLink28:destroy(); self.dataLink28 = nil; end;
        if self.dataLink33 ~= nil then self.dataLink33:destroy(); self.dataLink33 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.dataLink4 ~= nil then self.dataLink4:destroy(); self.dataLink4 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.dataLink18 ~= nil then self.dataLink18:destroy(); self.dataLink18 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.dataLink21 ~= nil then self.dataLink21:destroy(); self.dataLink21 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.dataLink23 ~= nil then self.dataLink23:destroy(); self.dataLink23 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.dataLink9 ~= nil then self.dataLink9:destroy(); self.dataLink9 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.label16 ~= nil then self.label16:destroy(); self.label16 = nil; end;
        if self.edit158 ~= nil then self.edit158:destroy(); self.edit158 = nil; end;
        if self.edit10 ~= nil then self.edit10:destroy(); self.edit10 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.edit31 ~= nil then self.edit31:destroy(); self.edit31 = nil; end;
        if self.edit106 ~= nil then self.edit106:destroy(); self.edit106 = nil; end;
        if self.edit1 ~= nil then self.edit1:destroy(); self.edit1 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit125 ~= nil then self.edit125:destroy(); self.edit125 = nil; end;
        if self.edit79 ~= nil then self.edit79:destroy(); self.edit79 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.dataLink16 ~= nil then self.dataLink16:destroy(); self.dataLink16 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.dataLink20 ~= nil then self.dataLink20:destroy(); self.dataLink20 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.dataLink3 ~= nil then self.dataLink3:destroy(); self.dataLink3 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.dataLink7 ~= nil then self.dataLink7:destroy(); self.dataLink7 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.dataLink6 ~= nil then self.dataLink6:destroy(); self.dataLink6 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.dataLink2 ~= nil then self.dataLink2:destroy(); self.dataLink2 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.dataLink15 ~= nil then self.dataLink15:destroy(); self.dataLink15 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.dataLink34 ~= nil then self.dataLink34:destroy(); self.dataLink34 = nil; end;
        if self.dataLink29 ~= nil then self.dataLink29:destroy(); self.dataLink29 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.dataLink32 ~= nil then self.dataLink32:destroy(); self.dataLink32 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.dataLink25 ~= nil then self.dataLink25:destroy(); self.dataLink25 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.dataLink31 ~= nil then self.dataLink31:destroy(); self.dataLink31 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.dataLink13 ~= nil then self.dataLink13:destroy(); self.dataLink13 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.dataLink10 ~= nil then self.dataLink10:destroy(); self.dataLink10 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.dataLink5 ~= nil then self.dataLink5:destroy(); self.dataLink5 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.rectangle22 ~= nil then self.rectangle22:destroy(); self.rectangle22 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.dataLink8 ~= nil then self.dataLink8:destroy(); self.dataLink8 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.dataLink14 ~= nil then self.dataLink14:destroy(); self.dataLink14 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.dataLink19 ~= nil then self.dataLink19:destroy(); self.dataLink19 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.dataLink36 ~= nil then self.dataLink36:destroy(); self.dataLink36 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.dataLink17 ~= nil then self.dataLink17:destroy(); self.dataLink17 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.dataLink24 ~= nil then self.dataLink24:destroy(); self.dataLink24 = nil; end;
        if self.dataLink35 ~= nil then self.dataLink35:destroy(); self.dataLink35 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.dataLink1 ~= nil then self.dataLink1:destroy(); self.dataLink1 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.dataLink22 ~= nil then self.dataLink22:destroy(); self.dataLink22 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.dataLink26 ~= nil then self.dataLink26:destroy(); self.dataLink26 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.dataLink27 ~= nil then self.dataLink27:destroy(); self.dataLink27 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.dataLink30 ~= nil then self.dataLink30:destroy(); self.dataLink30 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.dataLink11 ~= nil then self.dataLink11:destroy(); self.dataLink11 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmRDF3 = {
    newEditor = newfrmRDF3, 
    new = newfrmRDF3, 
    name = "frmRDF3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmRDF3 = _frmRDF3;
rrpg.registrarForm(_frmRDF3);

return _frmRDF3;
