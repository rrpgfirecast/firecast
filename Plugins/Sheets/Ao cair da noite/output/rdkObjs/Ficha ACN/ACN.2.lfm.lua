require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmACN2()
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
    obj:setName("frmACN2");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");


			local function xpAptidoes()
				if sheet~=nil then
					local mod = 0;
					local valores = {   ((tonumber(sheet.total0_1 ) or 0)*2 - (tonumber(sheet.xp0_1 ) or 0)), 
										((tonumber(sheet.total0_2 ) or 0)*2 - (tonumber(sheet.xp0_2 ) or 0)), 
										((tonumber(sheet.total0_3 ) or 0)*2 - (tonumber(sheet.xp0_3 ) or 0)),
										((tonumber(sheet.total0_4 ) or 0)*2 - (tonumber(sheet.xp0_4 ) or 0)),
										((tonumber(sheet.total0_5 ) or 0)*2 - (tonumber(sheet.xp0_5 ) or 0)),
										((tonumber(sheet.total0_6 ) or 0)*2 - (tonumber(sheet.xp0_6 ) or 0)),
										((tonumber(sheet.total0_7 ) or 0)*2 - (tonumber(sheet.xp0_7 ) or 0)),
										((tonumber(sheet.total0_8 ) or 0)*2 - (tonumber(sheet.xp0_8 ) or 0)),
										((tonumber(sheet.total0_9 ) or 0)*2 - (tonumber(sheet.xp0_9 ) or 0)),
										((tonumber(sheet.total0_10) or 0)*2 - (tonumber(sheet.xp0_10) or 0)),
										((tonumber(sheet.total0_11) or 0)*2 - (tonumber(sheet.xp0_11) or 0)),
										((tonumber(sheet.total0_12) or 0)*2 - (tonumber(sheet.xp0_12) or 0)),
										((tonumber(sheet.total1_1 ) or 0)*2 - (tonumber(sheet.xp1_1 ) or 0)),
										((tonumber(sheet.total1_2 ) or 0)*2 - (tonumber(sheet.xp1_2 ) or 0)),
										((tonumber(sheet.total1_3 ) or 0)*2 - (tonumber(sheet.xp1_3 ) or 0)),
										((tonumber(sheet.total1_4 ) or 0)*2 - (tonumber(sheet.xp1_4 ) or 0)),
										((tonumber(sheet.total1_5 ) or 0)*2 - (tonumber(sheet.xp1_5 ) or 0)),
										((tonumber(sheet.total1_6 ) or 0)*2 - (tonumber(sheet.xp1_6 ) or 0)),
										((tonumber(sheet.total1_7 ) or 0)*2 - (tonumber(sheet.xp1_7 ) or 0)),
										((tonumber(sheet.total1_8 ) or 0)*2 - (tonumber(sheet.xp1_8 ) or 0)),
										((tonumber(sheet.total1_9 ) or 0)*2 - (tonumber(sheet.xp1_9 ) or 0)),
										((tonumber(sheet.total1_10) or 0)*2 - (tonumber(sheet.xp1_10) or 0)),
										((tonumber(sheet.total1_11) or 0)*2 - (tonumber(sheet.xp1_11) or 0)),
										((tonumber(sheet.total1_12) or 0)*2 - (tonumber(sheet.xp1_12) or 0)),
										((tonumber(sheet.total2_1 ) or 0)*2 - (tonumber(sheet.xp2_1 ) or 0)),
										((tonumber(sheet.total2_2 ) or 0)*2 - (tonumber(sheet.xp2_2 ) or 0)),
										((tonumber(sheet.total2_3 ) or 0)*2 - (tonumber(sheet.xp2_3 ) or 0)),
										((tonumber(sheet.total2_4 ) or 0)*2 - (tonumber(sheet.xp2_4 ) or 0)),
										((tonumber(sheet.total2_5 ) or 0)*2 - (tonumber(sheet.xp2_5 ) or 0)),
										((tonumber(sheet.total2_6 ) or 0)*2 - (tonumber(sheet.xp2_6 ) or 0)),
										((tonumber(sheet.total2_7 ) or 0)*2 - (tonumber(sheet.xp2_7 ) or 0)),
										((tonumber(sheet.total2_8 ) or 0)*2 - (tonumber(sheet.xp2_8 ) or 0)),
										((tonumber(sheet.total2_9 ) or 0)*2 - (tonumber(sheet.xp2_9 ) or 0)),
										((tonumber(sheet.total2_10) or 0)*2 - (tonumber(sheet.xp2_10) or 0)),
										((tonumber(sheet.total2_11) or 0)*2 - (tonumber(sheet.xp2_11) or 0)),
										((tonumber(sheet.total2_12) or 0)*2 - (tonumber(sheet.xp2_12) or 0)),
										((tonumber(sheet.total3_1 ) or 0)*2 - (tonumber(sheet.xp3_1 ) or 0)),
										((tonumber(sheet.total3_2 ) or 0)*2 - (tonumber(sheet.xp3_2 ) or 0)),
										((tonumber(sheet.total3_3 ) or 0)*2 - (tonumber(sheet.xp3_3 ) or 0)),
										((tonumber(sheet.total3_4 ) or 0)*2 - (tonumber(sheet.xp3_4 ) or 0)),
										((tonumber(sheet.total3_5 ) or 0)*2 - (tonumber(sheet.xp3_5 ) or 0)),
										((tonumber(sheet.total3_6 ) or 0)*2 - (tonumber(sheet.xp3_6 ) or 0)),
										((tonumber(sheet.total3_7 ) or 0)*2 - (tonumber(sheet.xp3_7 ) or 0)),
										((tonumber(sheet.total3_8 ) or 0)*2 - (tonumber(sheet.xp3_8 ) or 0)),
										((tonumber(sheet.total3_9 ) or 0)*2 - (tonumber(sheet.xp3_9 ) or 0)),
										((tonumber(sheet.total3_10) or 0)*2 - (tonumber(sheet.xp3_10) or 0)),
										((tonumber(sheet.total3_11) or 0)*2 - (tonumber(sheet.xp3_11) or 0)),
										((tonumber(sheet.total3_12) or 0)*2 - (tonumber(sheet.xp3_12) or 0))
										};
					
					local limites = {	(tonumber(sheet.xp0_1 ) or 0),
										(tonumber(sheet.xp0_2 ) or 0),
										(tonumber(sheet.xp0_3 ) or 0),
										(tonumber(sheet.xp0_4 ) or 0),
										(tonumber(sheet.xp0_5 ) or 0),
										(tonumber(sheet.xp0_6 ) or 0),
										(tonumber(sheet.xp0_7 ) or 0),
										(tonumber(sheet.xp0_8 ) or 0),
										(tonumber(sheet.xp0_9 ) or 0),
										(tonumber(sheet.xp0_10) or 0),
										(tonumber(sheet.xp0_11) or 0),
										(tonumber(sheet.xp0_12) or 0),
										(tonumber(sheet.xp1_1 ) or 0),
										(tonumber(sheet.xp1_2 ) or 0),
										(tonumber(sheet.xp1_3 ) or 0),
										(tonumber(sheet.xp1_4 ) or 0),
										(tonumber(sheet.xp1_5 ) or 0),
										(tonumber(sheet.xp1_6 ) or 0),
										(tonumber(sheet.xp1_7 ) or 0),
										(tonumber(sheet.xp1_8 ) or 0),
										(tonumber(sheet.xp1_9 ) or 0),
										(tonumber(sheet.xp1_10) or 0),
										(tonumber(sheet.xp1_11) or 0),
										(tonumber(sheet.xp1_12) or 0),
										(tonumber(sheet.xp2_1 ) or 0),
										(tonumber(sheet.xp2_2 ) or 0),
										(tonumber(sheet.xp2_3 ) or 0),
										(tonumber(sheet.xp2_4 ) or 0),
										(tonumber(sheet.xp2_5 ) or 0),
										(tonumber(sheet.xp2_6 ) or 0),
										(tonumber(sheet.xp2_7 ) or 0),
										(tonumber(sheet.xp2_8 ) or 0),
										(tonumber(sheet.xp2_9 ) or 0),
										(tonumber(sheet.xp2_10) or 0),
										(tonumber(sheet.xp2_11) or 0),
										(tonumber(sheet.xp2_12) or 0),
										(tonumber(sheet.xp3_1 ) or 0),
										(tonumber(sheet.xp3_2 ) or 0),
										(tonumber(sheet.xp3_3 ) or 0),
										(tonumber(sheet.xp3_4 ) or 0),
										(tonumber(sheet.xp3_5 ) or 0),
										(tonumber(sheet.xp3_6 ) or 0),
										(tonumber(sheet.xp3_7 ) or 0),
										(tonumber(sheet.xp3_8 ) or 0),
										(tonumber(sheet.xp3_9 ) or 0),
										(tonumber(sheet.xp3_10) or 0),
										(tonumber(sheet.xp3_11) or 0),
										(tonumber(sheet.xp3_12) or 0)
										};
					
					for i=1, 48, 1 do
						for j=1, limites[i], 1 do
							mod = mod + math.max(math.floor((valores[i]+j)*1.5), 3);
						end;
					end;

					sheet.XPaptidoes = mod;
					sheet.XPgasta = (tonumber(sheet.XPatributos) or 0) + 
									(tonumber(sheet.XPaegis) or 0) + 
									(tonumber(sheet.XPhistoricos) or 0) + 
									(tonumber(sheet.XPmisticos) or 0) + 
									(tonumber(sheet.XPaptidoes) or 0);
				end;
			end;
		


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(280);
    obj.layout1:setHeight(630);
    obj.layout1:setName("layout1");

    obj.rectangle1 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle1:setParent(obj.layout1);
    obj.rectangle1:setLeft(0);
    obj.rectangle1:setTop(0);
    obj.rectangle1:setWidth(280);
    obj.rectangle1:setHeight(630);
    obj.rectangle1:setColor("black");
    obj.rectangle1:setXradius(15);
    obj.rectangle1:setYradius(15);
    obj.rectangle1:setCornerType("round");
    obj.rectangle1:setName("rectangle1");

    obj.label1 = gui.fromHandle(_obj_newObject("label"));
    obj.label1:setParent(obj.layout1);
    obj.label1:setLeft(5);
    obj.label1:setTop(0);
    obj.label1:setWidth(240);
    obj.label1:setHeight(20);
    obj.label1:setText("TALENTOS FISICOS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout1);
    obj.label2:setLeft(25);
    obj.label2:setTop(25);
    obj.label2:setWidth(315);
    obj.label2:setHeight(20);
    obj.label2:setText(" Nome");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout1);
    obj.label3:setLeft(135);
    obj.label3:setTop(25);
    obj.label3:setWidth(315);
    obj.label3:setHeight(20);
    obj.label3:setText("Total");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout1);
    obj.label4:setLeft(170);
    obj.label4:setTop(25);
    obj.label4:setWidth(315);
    obj.label4:setHeight(20);
    obj.label4:setText(" Inic");
    obj.label4:setName("label4");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout1);
    obj.label5:setLeft(202);
    obj.label5:setTop(25);
    obj.label5:setWidth(315);
    obj.label5:setHeight(20);
    obj.label5:setText(" Apr.");
    obj.label5:setName("label5");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout1);
    obj.label6:setLeft(235);
    obj.label6:setTop(25);
    obj.label6:setWidth(315);
    obj.label6:setHeight(20);
    obj.label6:setText("  XP");
    obj.label6:setName("label6");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(5);
    obj.layout2:setTop(50);
    obj.layout2:setWidth(270);
    obj.layout2:setHeight(50);
    obj.layout2:setName("layout2");

    obj.radioButton1 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton1:setParent(obj.layout2);
    obj.radioButton1:setLeft(0);
    obj.radioButton1:setTop(0);
    obj.radioButton1:setGroupName("grupo1");
    obj.radioButton1:setField("dado1");
    obj.radioButton1:setFieldValue("total0_1");
    obj.radioButton1:setName("radioButton1");

    obj.radioButton2 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton2:setParent(obj.layout2);
    obj.radioButton2:setLeft(0);
    obj.radioButton2:setTop(15);
    obj.radioButton2:setGroupName("grupo2");
    obj.radioButton2:setField("dado2");
    obj.radioButton2:setFieldValue("total0_1");
    obj.radioButton2:setName("radioButton2");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout2);
    obj.edit1:setLeft(20);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(100);
    obj.edit1:setHeight(25);
    obj.edit1:setField("nome0_1");
    obj.edit1:setName("edit1");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout2);
    obj.rectangle2:setLeft(125);
    obj.rectangle2:setTop(0);
    obj.rectangle2:setWidth(40);
    obj.rectangle2:setHeight(25);
    obj.rectangle2:setColor("Black");
    obj.rectangle2:setStrokeColor("white");
    obj.rectangle2:setStrokeSize(1);
    obj.rectangle2:setName("rectangle2");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout2);
    obj.label7:setLeft(125);
    obj.label7:setTop(3);
    obj.label7:setWidth(40);
    obj.label7:setHeight(20);
    obj.label7:setField("total20_1");
    obj.label7:setHorzTextAlign("center");
    obj.label7:setName("label7");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout2);
    obj.edit2:setLeft(170);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(30);
    obj.edit2:setHeight(25);
    obj.edit2:setType("number");
    obj.edit2:setMin(0);
    obj.edit2:setField("base0_1");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout2);
    obj.edit3:setLeft(205);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(30);
    obj.edit3:setHeight(25);
    obj.edit3:setType("number");
    obj.edit3:setMin(0);
    obj.edit3:setField("bonus0_1");
    obj.edit3:setName("edit3");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout2);
    obj.edit4:setLeft(240);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(30);
    obj.edit4:setHeight(25);
    obj.edit4:setType("number");
    obj.edit4:setMin(0);
    obj.edit4:setField("xp0_1");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout2);
    obj.edit5:setLeft(20);
    obj.edit5:setTop(28);
    obj.edit5:setWidth(250);
    obj.edit5:setHeight(20);
    obj.edit5:setField("espec0_1");
    obj.edit5:setName("edit5");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(5);
    obj.layout3:setTop(100);
    obj.layout3:setWidth(270);
    obj.layout3:setHeight(50);
    obj.layout3:setName("layout3");

    obj.radioButton3 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton3:setParent(obj.layout3);
    obj.radioButton3:setLeft(0);
    obj.radioButton3:setTop(0);
    obj.radioButton3:setGroupName("grupo1");
    obj.radioButton3:setField("dado1");
    obj.radioButton3:setFieldValue("total0_2");
    obj.radioButton3:setName("radioButton3");

    obj.radioButton4 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton4:setParent(obj.layout3);
    obj.radioButton4:setLeft(0);
    obj.radioButton4:setTop(15);
    obj.radioButton4:setGroupName("grupo2");
    obj.radioButton4:setField("dado2");
    obj.radioButton4:setFieldValue("total0_2");
    obj.radioButton4:setName("radioButton4");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout3);
    obj.edit6:setLeft(20);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(100);
    obj.edit6:setHeight(25);
    obj.edit6:setField("nome0_2");
    obj.edit6:setName("edit6");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout3);
    obj.rectangle3:setLeft(125);
    obj.rectangle3:setTop(0);
    obj.rectangle3:setWidth(40);
    obj.rectangle3:setHeight(25);
    obj.rectangle3:setColor("Black");
    obj.rectangle3:setStrokeColor("white");
    obj.rectangle3:setStrokeSize(1);
    obj.rectangle3:setName("rectangle3");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout3);
    obj.label8:setLeft(125);
    obj.label8:setTop(3);
    obj.label8:setWidth(40);
    obj.label8:setHeight(20);
    obj.label8:setField("total20_2");
    obj.label8:setHorzTextAlign("center");
    obj.label8:setName("label8");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout3);
    obj.edit7:setLeft(170);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(30);
    obj.edit7:setHeight(25);
    obj.edit7:setType("number");
    obj.edit7:setMin(0);
    obj.edit7:setField("base0_2");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout3);
    obj.edit8:setLeft(205);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(30);
    obj.edit8:setHeight(25);
    obj.edit8:setType("number");
    obj.edit8:setMin(0);
    obj.edit8:setField("bonus0_2");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout3);
    obj.edit9:setLeft(240);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(30);
    obj.edit9:setHeight(25);
    obj.edit9:setType("number");
    obj.edit9:setMin(0);
    obj.edit9:setField("xp0_2");
    obj.edit9:setName("edit9");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout3);
    obj.edit10:setLeft(20);
    obj.edit10:setTop(28);
    obj.edit10:setWidth(250);
    obj.edit10:setHeight(20);
    obj.edit10:setField("espec0_2");
    obj.edit10:setName("edit10");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(5);
    obj.layout4:setTop(150);
    obj.layout4:setWidth(270);
    obj.layout4:setHeight(50);
    obj.layout4:setName("layout4");

    obj.radioButton5 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton5:setParent(obj.layout4);
    obj.radioButton5:setLeft(0);
    obj.radioButton5:setTop(0);
    obj.radioButton5:setGroupName("grupo1");
    obj.radioButton5:setField("dado1");
    obj.radioButton5:setFieldValue("total0_3");
    obj.radioButton5:setName("radioButton5");

    obj.radioButton6 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton6:setParent(obj.layout4);
    obj.radioButton6:setLeft(0);
    obj.radioButton6:setTop(15);
    obj.radioButton6:setGroupName("grupo2");
    obj.radioButton6:setField("dado2");
    obj.radioButton6:setFieldValue("total0_3");
    obj.radioButton6:setName("radioButton6");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout4);
    obj.edit11:setLeft(20);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(100);
    obj.edit11:setHeight(25);
    obj.edit11:setField("nome0_3");
    obj.edit11:setName("edit11");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout4);
    obj.rectangle4:setLeft(125);
    obj.rectangle4:setTop(0);
    obj.rectangle4:setWidth(40);
    obj.rectangle4:setHeight(25);
    obj.rectangle4:setColor("Black");
    obj.rectangle4:setStrokeColor("white");
    obj.rectangle4:setStrokeSize(1);
    obj.rectangle4:setName("rectangle4");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout4);
    obj.label9:setLeft(125);
    obj.label9:setTop(3);
    obj.label9:setWidth(40);
    obj.label9:setHeight(20);
    obj.label9:setField("total20_3");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout4);
    obj.edit12:setLeft(170);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(30);
    obj.edit12:setHeight(25);
    obj.edit12:setType("number");
    obj.edit12:setMin(0);
    obj.edit12:setField("base0_3");
    obj.edit12:setName("edit12");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout4);
    obj.edit13:setLeft(205);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(30);
    obj.edit13:setHeight(25);
    obj.edit13:setType("number");
    obj.edit13:setMin(0);
    obj.edit13:setField("bonus0_3");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout4);
    obj.edit14:setLeft(240);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(30);
    obj.edit14:setHeight(25);
    obj.edit14:setType("number");
    obj.edit14:setMin(0);
    obj.edit14:setField("xp0_3");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout4);
    obj.edit15:setLeft(20);
    obj.edit15:setTop(28);
    obj.edit15:setWidth(250);
    obj.edit15:setHeight(20);
    obj.edit15:setField("espec0_3");
    obj.edit15:setName("edit15");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(5);
    obj.layout5:setTop(200);
    obj.layout5:setWidth(270);
    obj.layout5:setHeight(50);
    obj.layout5:setName("layout5");

    obj.radioButton7 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton7:setParent(obj.layout5);
    obj.radioButton7:setLeft(0);
    obj.radioButton7:setTop(0);
    obj.radioButton7:setGroupName("grupo1");
    obj.radioButton7:setField("dado1");
    obj.radioButton7:setFieldValue("total0_4");
    obj.radioButton7:setName("radioButton7");

    obj.radioButton8 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton8:setParent(obj.layout5);
    obj.radioButton8:setLeft(0);
    obj.radioButton8:setTop(15);
    obj.radioButton8:setGroupName("grupo2");
    obj.radioButton8:setField("dado2");
    obj.radioButton8:setFieldValue("total0_4");
    obj.radioButton8:setName("radioButton8");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout5);
    obj.edit16:setLeft(20);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(100);
    obj.edit16:setHeight(25);
    obj.edit16:setField("nome0_4");
    obj.edit16:setName("edit16");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout5);
    obj.rectangle5:setLeft(125);
    obj.rectangle5:setTop(0);
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout5);
    obj.label10:setLeft(125);
    obj.label10:setTop(3);
    obj.label10:setWidth(40);
    obj.label10:setHeight(20);
    obj.label10:setField("total20_4");
    obj.label10:setHorzTextAlign("center");
    obj.label10:setName("label10");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout5);
    obj.edit17:setLeft(170);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(30);
    obj.edit17:setHeight(25);
    obj.edit17:setType("number");
    obj.edit17:setMin(0);
    obj.edit17:setField("base0_4");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout5);
    obj.edit18:setLeft(205);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(30);
    obj.edit18:setHeight(25);
    obj.edit18:setType("number");
    obj.edit18:setMin(0);
    obj.edit18:setField("bonus0_4");
    obj.edit18:setName("edit18");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout5);
    obj.edit19:setLeft(240);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(30);
    obj.edit19:setHeight(25);
    obj.edit19:setType("number");
    obj.edit19:setMin(0);
    obj.edit19:setField("xp0_4");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout5);
    obj.edit20:setLeft(20);
    obj.edit20:setTop(28);
    obj.edit20:setWidth(250);
    obj.edit20:setHeight(20);
    obj.edit20:setField("espec0_4");
    obj.edit20:setName("edit20");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(5);
    obj.layout6:setTop(250);
    obj.layout6:setWidth(270);
    obj.layout6:setHeight(50);
    obj.layout6:setName("layout6");

    obj.radioButton9 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton9:setParent(obj.layout6);
    obj.radioButton9:setLeft(0);
    obj.radioButton9:setTop(0);
    obj.radioButton9:setGroupName("grupo1");
    obj.radioButton9:setField("dado1");
    obj.radioButton9:setFieldValue("total0_5");
    obj.radioButton9:setName("radioButton9");

    obj.radioButton10 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton10:setParent(obj.layout6);
    obj.radioButton10:setLeft(0);
    obj.radioButton10:setTop(15);
    obj.radioButton10:setGroupName("grupo2");
    obj.radioButton10:setField("dado2");
    obj.radioButton10:setFieldValue("total0_5");
    obj.radioButton10:setName("radioButton10");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout6);
    obj.edit21:setLeft(20);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(100);
    obj.edit21:setHeight(25);
    obj.edit21:setField("nome0_5");
    obj.edit21:setName("edit21");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout6);
    obj.rectangle6:setLeft(125);
    obj.rectangle6:setTop(0);
    obj.rectangle6:setWidth(40);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout6);
    obj.label11:setLeft(125);
    obj.label11:setTop(3);
    obj.label11:setWidth(40);
    obj.label11:setHeight(20);
    obj.label11:setField("total20_5");
    obj.label11:setHorzTextAlign("center");
    obj.label11:setName("label11");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout6);
    obj.edit22:setLeft(170);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(30);
    obj.edit22:setHeight(25);
    obj.edit22:setType("number");
    obj.edit22:setMin(0);
    obj.edit22:setField("base0_5");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout6);
    obj.edit23:setLeft(205);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(30);
    obj.edit23:setHeight(25);
    obj.edit23:setType("number");
    obj.edit23:setMin(0);
    obj.edit23:setField("bonus0_5");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout6);
    obj.edit24:setLeft(240);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(30);
    obj.edit24:setHeight(25);
    obj.edit24:setType("number");
    obj.edit24:setMin(0);
    obj.edit24:setField("xp0_5");
    obj.edit24:setName("edit24");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout6);
    obj.edit25:setLeft(20);
    obj.edit25:setTop(28);
    obj.edit25:setWidth(250);
    obj.edit25:setHeight(20);
    obj.edit25:setField("espec0_5");
    obj.edit25:setName("edit25");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(5);
    obj.layout7:setTop(300);
    obj.layout7:setWidth(270);
    obj.layout7:setHeight(50);
    obj.layout7:setName("layout7");

    obj.radioButton11 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton11:setParent(obj.layout7);
    obj.radioButton11:setLeft(0);
    obj.radioButton11:setTop(0);
    obj.radioButton11:setGroupName("grupo1");
    obj.radioButton11:setField("dado1");
    obj.radioButton11:setFieldValue("total0_6");
    obj.radioButton11:setName("radioButton11");

    obj.radioButton12 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton12:setParent(obj.layout7);
    obj.radioButton12:setLeft(0);
    obj.radioButton12:setTop(15);
    obj.radioButton12:setGroupName("grupo2");
    obj.radioButton12:setField("dado2");
    obj.radioButton12:setFieldValue("total0_6");
    obj.radioButton12:setName("radioButton12");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout7);
    obj.edit26:setLeft(20);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(100);
    obj.edit26:setHeight(25);
    obj.edit26:setField("nome0_6");
    obj.edit26:setName("edit26");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout7);
    obj.rectangle7:setLeft(125);
    obj.rectangle7:setTop(0);
    obj.rectangle7:setWidth(40);
    obj.rectangle7:setHeight(25);
    obj.rectangle7:setColor("Black");
    obj.rectangle7:setStrokeColor("white");
    obj.rectangle7:setStrokeSize(1);
    obj.rectangle7:setName("rectangle7");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout7);
    obj.label12:setLeft(125);
    obj.label12:setTop(3);
    obj.label12:setWidth(40);
    obj.label12:setHeight(20);
    obj.label12:setField("total20_6");
    obj.label12:setHorzTextAlign("center");
    obj.label12:setName("label12");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout7);
    obj.edit27:setLeft(170);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(30);
    obj.edit27:setHeight(25);
    obj.edit27:setType("number");
    obj.edit27:setMin(0);
    obj.edit27:setField("base0_6");
    obj.edit27:setName("edit27");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout7);
    obj.edit28:setLeft(205);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(30);
    obj.edit28:setHeight(25);
    obj.edit28:setType("number");
    obj.edit28:setMin(0);
    obj.edit28:setField("bonus0_6");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout7);
    obj.edit29:setLeft(240);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(30);
    obj.edit29:setHeight(25);
    obj.edit29:setType("number");
    obj.edit29:setMin(0);
    obj.edit29:setField("xp0_6");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout7);
    obj.edit30:setLeft(20);
    obj.edit30:setTop(28);
    obj.edit30:setWidth(250);
    obj.edit30:setHeight(20);
    obj.edit30:setField("espec0_6");
    obj.edit30:setName("edit30");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(5);
    obj.layout8:setTop(350);
    obj.layout8:setWidth(270);
    obj.layout8:setHeight(50);
    obj.layout8:setName("layout8");

    obj.radioButton13 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton13:setParent(obj.layout8);
    obj.radioButton13:setLeft(0);
    obj.radioButton13:setTop(0);
    obj.radioButton13:setGroupName("grupo1");
    obj.radioButton13:setField("dado1");
    obj.radioButton13:setFieldValue("total0_7");
    obj.radioButton13:setName("radioButton13");

    obj.radioButton14 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton14:setParent(obj.layout8);
    obj.radioButton14:setLeft(0);
    obj.radioButton14:setTop(15);
    obj.radioButton14:setGroupName("grupo2");
    obj.radioButton14:setField("dado2");
    obj.radioButton14:setFieldValue("total0_7");
    obj.radioButton14:setName("radioButton14");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout8);
    obj.edit31:setLeft(20);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(100);
    obj.edit31:setHeight(25);
    obj.edit31:setField("nome0_7");
    obj.edit31:setName("edit31");

    obj.rectangle8 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle8:setParent(obj.layout8);
    obj.rectangle8:setLeft(125);
    obj.rectangle8:setTop(0);
    obj.rectangle8:setWidth(40);
    obj.rectangle8:setHeight(25);
    obj.rectangle8:setColor("Black");
    obj.rectangle8:setStrokeColor("white");
    obj.rectangle8:setStrokeSize(1);
    obj.rectangle8:setName("rectangle8");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout8);
    obj.label13:setLeft(125);
    obj.label13:setTop(3);
    obj.label13:setWidth(40);
    obj.label13:setHeight(20);
    obj.label13:setField("total20_7");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout8);
    obj.edit32:setLeft(170);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(30);
    obj.edit32:setHeight(25);
    obj.edit32:setType("number");
    obj.edit32:setMin(0);
    obj.edit32:setField("base0_7");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout8);
    obj.edit33:setLeft(205);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(30);
    obj.edit33:setHeight(25);
    obj.edit33:setType("number");
    obj.edit33:setMin(0);
    obj.edit33:setField("bonus0_7");
    obj.edit33:setName("edit33");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout8);
    obj.edit34:setLeft(240);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(30);
    obj.edit34:setHeight(25);
    obj.edit34:setType("number");
    obj.edit34:setMin(0);
    obj.edit34:setField("xp0_7");
    obj.edit34:setName("edit34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout8);
    obj.edit35:setLeft(20);
    obj.edit35:setTop(28);
    obj.edit35:setWidth(250);
    obj.edit35:setHeight(20);
    obj.edit35:setField("espec0_7");
    obj.edit35:setName("edit35");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(5);
    obj.layout9:setTop(400);
    obj.layout9:setWidth(270);
    obj.layout9:setHeight(50);
    obj.layout9:setName("layout9");

    obj.radioButton15 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton15:setParent(obj.layout9);
    obj.radioButton15:setLeft(0);
    obj.radioButton15:setTop(0);
    obj.radioButton15:setGroupName("grupo1");
    obj.radioButton15:setField("dado1");
    obj.radioButton15:setFieldValue("total0_8");
    obj.radioButton15:setName("radioButton15");

    obj.radioButton16 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton16:setParent(obj.layout9);
    obj.radioButton16:setLeft(0);
    obj.radioButton16:setTop(15);
    obj.radioButton16:setGroupName("grupo2");
    obj.radioButton16:setField("dado2");
    obj.radioButton16:setFieldValue("total0_8");
    obj.radioButton16:setName("radioButton16");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout9);
    obj.edit36:setLeft(20);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(100);
    obj.edit36:setHeight(25);
    obj.edit36:setField("nome0_8");
    obj.edit36:setName("edit36");

    obj.rectangle9 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle9:setParent(obj.layout9);
    obj.rectangle9:setLeft(125);
    obj.rectangle9:setTop(0);
    obj.rectangle9:setWidth(40);
    obj.rectangle9:setHeight(25);
    obj.rectangle9:setColor("Black");
    obj.rectangle9:setStrokeColor("white");
    obj.rectangle9:setStrokeSize(1);
    obj.rectangle9:setName("rectangle9");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout9);
    obj.label14:setLeft(125);
    obj.label14:setTop(3);
    obj.label14:setWidth(40);
    obj.label14:setHeight(20);
    obj.label14:setField("total20_8");
    obj.label14:setHorzTextAlign("center");
    obj.label14:setName("label14");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout9);
    obj.edit37:setLeft(170);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(30);
    obj.edit37:setHeight(25);
    obj.edit37:setType("number");
    obj.edit37:setMin(0);
    obj.edit37:setField("base0_8");
    obj.edit37:setName("edit37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout9);
    obj.edit38:setLeft(205);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(30);
    obj.edit38:setHeight(25);
    obj.edit38:setType("number");
    obj.edit38:setMin(0);
    obj.edit38:setField("bonus0_8");
    obj.edit38:setName("edit38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout9);
    obj.edit39:setLeft(240);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(30);
    obj.edit39:setHeight(25);
    obj.edit39:setType("number");
    obj.edit39:setMin(0);
    obj.edit39:setField("xp0_8");
    obj.edit39:setName("edit39");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout9);
    obj.edit40:setLeft(20);
    obj.edit40:setTop(28);
    obj.edit40:setWidth(250);
    obj.edit40:setHeight(20);
    obj.edit40:setField("espec0_8");
    obj.edit40:setName("edit40");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(5);
    obj.layout10:setTop(450);
    obj.layout10:setWidth(270);
    obj.layout10:setHeight(50);
    obj.layout10:setName("layout10");

    obj.radioButton17 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton17:setParent(obj.layout10);
    obj.radioButton17:setLeft(0);
    obj.radioButton17:setTop(0);
    obj.radioButton17:setGroupName("grupo1");
    obj.radioButton17:setField("dado1");
    obj.radioButton17:setFieldValue("total0_9");
    obj.radioButton17:setName("radioButton17");

    obj.radioButton18 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton18:setParent(obj.layout10);
    obj.radioButton18:setLeft(0);
    obj.radioButton18:setTop(15);
    obj.radioButton18:setGroupName("grupo2");
    obj.radioButton18:setField("dado2");
    obj.radioButton18:setFieldValue("total0_9");
    obj.radioButton18:setName("radioButton18");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout10);
    obj.edit41:setLeft(20);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(100);
    obj.edit41:setHeight(25);
    obj.edit41:setField("nome0_9");
    obj.edit41:setName("edit41");

    obj.rectangle10 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle10:setParent(obj.layout10);
    obj.rectangle10:setLeft(125);
    obj.rectangle10:setTop(0);
    obj.rectangle10:setWidth(40);
    obj.rectangle10:setHeight(25);
    obj.rectangle10:setColor("Black");
    obj.rectangle10:setStrokeColor("white");
    obj.rectangle10:setStrokeSize(1);
    obj.rectangle10:setName("rectangle10");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout10);
    obj.label15:setLeft(125);
    obj.label15:setTop(3);
    obj.label15:setWidth(40);
    obj.label15:setHeight(20);
    obj.label15:setField("total20_9");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout10);
    obj.edit42:setLeft(170);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(30);
    obj.edit42:setHeight(25);
    obj.edit42:setType("number");
    obj.edit42:setMin(0);
    obj.edit42:setField("base0_9");
    obj.edit42:setName("edit42");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout10);
    obj.edit43:setLeft(205);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(30);
    obj.edit43:setHeight(25);
    obj.edit43:setType("number");
    obj.edit43:setMin(0);
    obj.edit43:setField("bonus0_9");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout10);
    obj.edit44:setLeft(240);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(30);
    obj.edit44:setHeight(25);
    obj.edit44:setType("number");
    obj.edit44:setMin(0);
    obj.edit44:setField("xp0_9");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout10);
    obj.edit45:setLeft(20);
    obj.edit45:setTop(28);
    obj.edit45:setWidth(250);
    obj.edit45:setHeight(20);
    obj.edit45:setField("espec0_9");
    obj.edit45:setName("edit45");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(5);
    obj.layout11:setTop(500);
    obj.layout11:setWidth(270);
    obj.layout11:setHeight(50);
    obj.layout11:setName("layout11");

    obj.radioButton19 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton19:setParent(obj.layout11);
    obj.radioButton19:setLeft(0);
    obj.radioButton19:setTop(0);
    obj.radioButton19:setGroupName("grupo1");
    obj.radioButton19:setField("dado1");
    obj.radioButton19:setFieldValue("total0_10");
    obj.radioButton19:setName("radioButton19");

    obj.radioButton20 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton20:setParent(obj.layout11);
    obj.radioButton20:setLeft(0);
    obj.radioButton20:setTop(15);
    obj.radioButton20:setGroupName("grupo2");
    obj.radioButton20:setField("dado2");
    obj.radioButton20:setFieldValue("total0_10");
    obj.radioButton20:setName("radioButton20");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout11);
    obj.edit46:setLeft(20);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(100);
    obj.edit46:setHeight(25);
    obj.edit46:setField("nome0_10");
    obj.edit46:setName("edit46");

    obj.rectangle11 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle11:setParent(obj.layout11);
    obj.rectangle11:setLeft(125);
    obj.rectangle11:setTop(0);
    obj.rectangle11:setWidth(40);
    obj.rectangle11:setHeight(25);
    obj.rectangle11:setColor("Black");
    obj.rectangle11:setStrokeColor("white");
    obj.rectangle11:setStrokeSize(1);
    obj.rectangle11:setName("rectangle11");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout11);
    obj.label16:setLeft(125);
    obj.label16:setTop(3);
    obj.label16:setWidth(40);
    obj.label16:setHeight(20);
    obj.label16:setField("total20_10");
    obj.label16:setHorzTextAlign("center");
    obj.label16:setName("label16");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout11);
    obj.edit47:setLeft(170);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(30);
    obj.edit47:setHeight(25);
    obj.edit47:setType("number");
    obj.edit47:setMin(0);
    obj.edit47:setField("base0_10");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout11);
    obj.edit48:setLeft(205);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(30);
    obj.edit48:setHeight(25);
    obj.edit48:setType("number");
    obj.edit48:setMin(0);
    obj.edit48:setField("bonus0_10");
    obj.edit48:setName("edit48");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout11);
    obj.edit49:setLeft(240);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(30);
    obj.edit49:setHeight(25);
    obj.edit49:setType("number");
    obj.edit49:setMin(0);
    obj.edit49:setField("xp0_10");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout11);
    obj.edit50:setLeft(20);
    obj.edit50:setTop(28);
    obj.edit50:setWidth(250);
    obj.edit50:setHeight(20);
    obj.edit50:setField("espec0_10");
    obj.edit50:setName("edit50");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setLeft(5);
    obj.layout12:setTop(550);
    obj.layout12:setWidth(270);
    obj.layout12:setHeight(50);
    obj.layout12:setName("layout12");

    obj.radioButton21 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton21:setParent(obj.layout12);
    obj.radioButton21:setLeft(0);
    obj.radioButton21:setTop(0);
    obj.radioButton21:setGroupName("grupo1");
    obj.radioButton21:setField("dado1");
    obj.radioButton21:setFieldValue("total0_11");
    obj.radioButton21:setName("radioButton21");

    obj.radioButton22 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton22:setParent(obj.layout12);
    obj.radioButton22:setLeft(0);
    obj.radioButton22:setTop(15);
    obj.radioButton22:setGroupName("grupo2");
    obj.radioButton22:setField("dado2");
    obj.radioButton22:setFieldValue("total0_11");
    obj.radioButton22:setName("radioButton22");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout12);
    obj.edit51:setLeft(20);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(100);
    obj.edit51:setHeight(25);
    obj.edit51:setField("nome0_11");
    obj.edit51:setName("edit51");

    obj.rectangle12 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle12:setParent(obj.layout12);
    obj.rectangle12:setLeft(125);
    obj.rectangle12:setTop(0);
    obj.rectangle12:setWidth(40);
    obj.rectangle12:setHeight(25);
    obj.rectangle12:setColor("Black");
    obj.rectangle12:setStrokeColor("white");
    obj.rectangle12:setStrokeSize(1);
    obj.rectangle12:setName("rectangle12");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout12);
    obj.label17:setLeft(125);
    obj.label17:setTop(3);
    obj.label17:setWidth(40);
    obj.label17:setHeight(20);
    obj.label17:setField("total20_11");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout12);
    obj.edit52:setLeft(170);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(30);
    obj.edit52:setHeight(25);
    obj.edit52:setType("number");
    obj.edit52:setMin(0);
    obj.edit52:setField("base0_11");
    obj.edit52:setName("edit52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout12);
    obj.edit53:setLeft(205);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(30);
    obj.edit53:setHeight(25);
    obj.edit53:setType("number");
    obj.edit53:setMin(0);
    obj.edit53:setField("bonus0_11");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout12);
    obj.edit54:setLeft(240);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(30);
    obj.edit54:setHeight(25);
    obj.edit54:setType("number");
    obj.edit54:setMin(0);
    obj.edit54:setField("xp0_11");
    obj.edit54:setName("edit54");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout12);
    obj.edit55:setLeft(20);
    obj.edit55:setTop(28);
    obj.edit55:setWidth(250);
    obj.edit55:setHeight(20);
    obj.edit55:setField("espec0_11");
    obj.edit55:setName("edit55");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setLeft(5);
    obj.layout13:setTop(600);
    obj.layout13:setWidth(270);
    obj.layout13:setHeight(50);
    obj.layout13:setName("layout13");

    obj.radioButton23 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton23:setParent(obj.layout13);
    obj.radioButton23:setLeft(0);
    obj.radioButton23:setTop(0);
    obj.radioButton23:setGroupName("grupo1");
    obj.radioButton23:setField("dado1");
    obj.radioButton23:setFieldValue("total0_12");
    obj.radioButton23:setName("radioButton23");

    obj.radioButton24 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton24:setParent(obj.layout13);
    obj.radioButton24:setLeft(0);
    obj.radioButton24:setTop(15);
    obj.radioButton24:setGroupName("grupo2");
    obj.radioButton24:setField("dado2");
    obj.radioButton24:setFieldValue("total0_12");
    obj.radioButton24:setName("radioButton24");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout13);
    obj.edit56:setLeft(20);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(100);
    obj.edit56:setHeight(25);
    obj.edit56:setField("nome0_12");
    obj.edit56:setName("edit56");

    obj.rectangle13 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle13:setParent(obj.layout13);
    obj.rectangle13:setLeft(125);
    obj.rectangle13:setTop(0);
    obj.rectangle13:setWidth(40);
    obj.rectangle13:setHeight(25);
    obj.rectangle13:setColor("Black");
    obj.rectangle13:setStrokeColor("white");
    obj.rectangle13:setStrokeSize(1);
    obj.rectangle13:setName("rectangle13");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout13);
    obj.label18:setLeft(125);
    obj.label18:setTop(3);
    obj.label18:setWidth(40);
    obj.label18:setHeight(20);
    obj.label18:setField("total20_12");
    obj.label18:setHorzTextAlign("center");
    obj.label18:setName("label18");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout13);
    obj.edit57:setLeft(170);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(30);
    obj.edit57:setHeight(25);
    obj.edit57:setType("number");
    obj.edit57:setMin(0);
    obj.edit57:setField("base0_12");
    obj.edit57:setName("edit57");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout13);
    obj.edit58:setLeft(205);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(30);
    obj.edit58:setHeight(25);
    obj.edit58:setType("number");
    obj.edit58:setMin(0);
    obj.edit58:setField("bonus0_12");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout13);
    obj.edit59:setLeft(240);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(30);
    obj.edit59:setHeight(25);
    obj.edit59:setType("number");
    obj.edit59:setMin(0);
    obj.edit59:setField("xp0_12");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout13);
    obj.edit60:setLeft(20);
    obj.edit60:setTop(28);
    obj.edit60:setWidth(250);
    obj.edit60:setHeight(20);
    obj.edit60:setField("espec0_12");
    obj.edit60:setName("edit60");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.scrollBox1);
    obj.layout14:setLeft(300);
    obj.layout14:setTop(0);
    obj.layout14:setWidth(280);
    obj.layout14:setHeight(630);
    obj.layout14:setName("layout14");

    obj.rectangle14 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle14:setParent(obj.layout14);
    obj.rectangle14:setLeft(0);
    obj.rectangle14:setTop(0);
    obj.rectangle14:setWidth(280);
    obj.rectangle14:setHeight(630);
    obj.rectangle14:setColor("black");
    obj.rectangle14:setXradius(15);
    obj.rectangle14:setYradius(15);
    obj.rectangle14:setCornerType("round");
    obj.rectangle14:setName("rectangle14");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout14);
    obj.label19:setLeft(5);
    obj.label19:setTop(0);
    obj.label19:setWidth(240);
    obj.label19:setHeight(20);
    obj.label19:setText("CONHECIMENTOS FISICOS");
    obj.label19:setHorzTextAlign("center");
    obj.label19:setName("label19");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout14);
    obj.label20:setLeft(25);
    obj.label20:setTop(25);
    obj.label20:setWidth(315);
    obj.label20:setHeight(20);
    obj.label20:setText(" Nome");
    obj.label20:setName("label20");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout14);
    obj.label21:setLeft(135);
    obj.label21:setTop(25);
    obj.label21:setWidth(315);
    obj.label21:setHeight(20);
    obj.label21:setText("Total");
    obj.label21:setName("label21");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout14);
    obj.label22:setLeft(170);
    obj.label22:setTop(25);
    obj.label22:setWidth(315);
    obj.label22:setHeight(20);
    obj.label22:setText(" Inic");
    obj.label22:setName("label22");

    obj.label23 = gui.fromHandle(_obj_newObject("label"));
    obj.label23:setParent(obj.layout14);
    obj.label23:setLeft(202);
    obj.label23:setTop(25);
    obj.label23:setWidth(315);
    obj.label23:setHeight(20);
    obj.label23:setText(" Apr.");
    obj.label23:setName("label23");

    obj.label24 = gui.fromHandle(_obj_newObject("label"));
    obj.label24:setParent(obj.layout14);
    obj.label24:setLeft(235);
    obj.label24:setTop(25);
    obj.label24:setWidth(315);
    obj.label24:setHeight(20);
    obj.label24:setText("  XP");
    obj.label24:setName("label24");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout14);
    obj.layout15:setLeft(5);
    obj.layout15:setTop(50);
    obj.layout15:setWidth(270);
    obj.layout15:setHeight(50);
    obj.layout15:setName("layout15");

    obj.radioButton25 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton25:setParent(obj.layout15);
    obj.radioButton25:setLeft(0);
    obj.radioButton25:setTop(0);
    obj.radioButton25:setGroupName("grupo1");
    obj.radioButton25:setField("dado1");
    obj.radioButton25:setFieldValue("total2_1");
    obj.radioButton25:setName("radioButton25");

    obj.radioButton26 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton26:setParent(obj.layout15);
    obj.radioButton26:setLeft(0);
    obj.radioButton26:setTop(15);
    obj.radioButton26:setGroupName("grupo2");
    obj.radioButton26:setField("dado2");
    obj.radioButton26:setFieldValue("total2_1");
    obj.radioButton26:setName("radioButton26");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout15);
    obj.edit61:setLeft(20);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(100);
    obj.edit61:setHeight(25);
    obj.edit61:setField("nome2_1");
    obj.edit61:setName("edit61");

    obj.rectangle15 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle15:setParent(obj.layout15);
    obj.rectangle15:setLeft(125);
    obj.rectangle15:setTop(0);
    obj.rectangle15:setWidth(40);
    obj.rectangle15:setHeight(25);
    obj.rectangle15:setColor("Black");
    obj.rectangle15:setStrokeColor("white");
    obj.rectangle15:setStrokeSize(1);
    obj.rectangle15:setName("rectangle15");

    obj.label25 = gui.fromHandle(_obj_newObject("label"));
    obj.label25:setParent(obj.layout15);
    obj.label25:setLeft(125);
    obj.label25:setTop(3);
    obj.label25:setWidth(40);
    obj.label25:setHeight(20);
    obj.label25:setField("total22_1");
    obj.label25:setHorzTextAlign("center");
    obj.label25:setName("label25");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout15);
    obj.edit62:setLeft(170);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(30);
    obj.edit62:setHeight(25);
    obj.edit62:setType("number");
    obj.edit62:setMin(0);
    obj.edit62:setField("base2_1");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout15);
    obj.edit63:setLeft(205);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(30);
    obj.edit63:setHeight(25);
    obj.edit63:setType("number");
    obj.edit63:setMin(0);
    obj.edit63:setField("bonus2_1");
    obj.edit63:setName("edit63");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout15);
    obj.edit64:setLeft(240);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(30);
    obj.edit64:setHeight(25);
    obj.edit64:setType("number");
    obj.edit64:setMin(0);
    obj.edit64:setField("xp2_1");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout15);
    obj.edit65:setLeft(20);
    obj.edit65:setTop(28);
    obj.edit65:setWidth(250);
    obj.edit65:setHeight(20);
    obj.edit65:setField("espec2_1");
    obj.edit65:setName("edit65");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout14);
    obj.layout16:setLeft(5);
    obj.layout16:setTop(100);
    obj.layout16:setWidth(270);
    obj.layout16:setHeight(50);
    obj.layout16:setName("layout16");

    obj.radioButton27 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton27:setParent(obj.layout16);
    obj.radioButton27:setLeft(0);
    obj.radioButton27:setTop(0);
    obj.radioButton27:setGroupName("grupo1");
    obj.radioButton27:setField("dado1");
    obj.radioButton27:setFieldValue("total2_2");
    obj.radioButton27:setName("radioButton27");

    obj.radioButton28 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton28:setParent(obj.layout16);
    obj.radioButton28:setLeft(0);
    obj.radioButton28:setTop(15);
    obj.radioButton28:setGroupName("grupo2");
    obj.radioButton28:setField("dado2");
    obj.radioButton28:setFieldValue("total2_2");
    obj.radioButton28:setName("radioButton28");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout16);
    obj.edit66:setLeft(20);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(100);
    obj.edit66:setHeight(25);
    obj.edit66:setField("nome2_2");
    obj.edit66:setName("edit66");

    obj.rectangle16 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle16:setParent(obj.layout16);
    obj.rectangle16:setLeft(125);
    obj.rectangle16:setTop(0);
    obj.rectangle16:setWidth(40);
    obj.rectangle16:setHeight(25);
    obj.rectangle16:setColor("Black");
    obj.rectangle16:setStrokeColor("white");
    obj.rectangle16:setStrokeSize(1);
    obj.rectangle16:setName("rectangle16");

    obj.label26 = gui.fromHandle(_obj_newObject("label"));
    obj.label26:setParent(obj.layout16);
    obj.label26:setLeft(125);
    obj.label26:setTop(3);
    obj.label26:setWidth(40);
    obj.label26:setHeight(20);
    obj.label26:setField("total22_2");
    obj.label26:setHorzTextAlign("center");
    obj.label26:setName("label26");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout16);
    obj.edit67:setLeft(170);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(30);
    obj.edit67:setHeight(25);
    obj.edit67:setType("number");
    obj.edit67:setMin(0);
    obj.edit67:setField("base2_2");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout16);
    obj.edit68:setLeft(205);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(30);
    obj.edit68:setHeight(25);
    obj.edit68:setType("number");
    obj.edit68:setMin(0);
    obj.edit68:setField("bonus2_2");
    obj.edit68:setName("edit68");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout16);
    obj.edit69:setLeft(240);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(30);
    obj.edit69:setHeight(25);
    obj.edit69:setType("number");
    obj.edit69:setMin(0);
    obj.edit69:setField("xp2_2");
    obj.edit69:setName("edit69");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout16);
    obj.edit70:setLeft(20);
    obj.edit70:setTop(28);
    obj.edit70:setWidth(250);
    obj.edit70:setHeight(20);
    obj.edit70:setField("espec2_2");
    obj.edit70:setName("edit70");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout14);
    obj.layout17:setLeft(5);
    obj.layout17:setTop(150);
    obj.layout17:setWidth(270);
    obj.layout17:setHeight(50);
    obj.layout17:setName("layout17");

    obj.radioButton29 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton29:setParent(obj.layout17);
    obj.radioButton29:setLeft(0);
    obj.radioButton29:setTop(0);
    obj.radioButton29:setGroupName("grupo1");
    obj.radioButton29:setField("dado1");
    obj.radioButton29:setFieldValue("total2_3");
    obj.radioButton29:setName("radioButton29");

    obj.radioButton30 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton30:setParent(obj.layout17);
    obj.radioButton30:setLeft(0);
    obj.radioButton30:setTop(15);
    obj.radioButton30:setGroupName("grupo2");
    obj.radioButton30:setField("dado2");
    obj.radioButton30:setFieldValue("total2_3");
    obj.radioButton30:setName("radioButton30");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout17);
    obj.edit71:setLeft(20);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(100);
    obj.edit71:setHeight(25);
    obj.edit71:setField("nome2_3");
    obj.edit71:setName("edit71");

    obj.rectangle17 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle17:setParent(obj.layout17);
    obj.rectangle17:setLeft(125);
    obj.rectangle17:setTop(0);
    obj.rectangle17:setWidth(40);
    obj.rectangle17:setHeight(25);
    obj.rectangle17:setColor("Black");
    obj.rectangle17:setStrokeColor("white");
    obj.rectangle17:setStrokeSize(1);
    obj.rectangle17:setName("rectangle17");

    obj.label27 = gui.fromHandle(_obj_newObject("label"));
    obj.label27:setParent(obj.layout17);
    obj.label27:setLeft(125);
    obj.label27:setTop(3);
    obj.label27:setWidth(40);
    obj.label27:setHeight(20);
    obj.label27:setField("total22_3");
    obj.label27:setHorzTextAlign("center");
    obj.label27:setName("label27");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout17);
    obj.edit72:setLeft(170);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(30);
    obj.edit72:setHeight(25);
    obj.edit72:setType("number");
    obj.edit72:setMin(0);
    obj.edit72:setField("base2_3");
    obj.edit72:setName("edit72");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout17);
    obj.edit73:setLeft(205);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(30);
    obj.edit73:setHeight(25);
    obj.edit73:setType("number");
    obj.edit73:setMin(0);
    obj.edit73:setField("bonus2_3");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout17);
    obj.edit74:setLeft(240);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(30);
    obj.edit74:setHeight(25);
    obj.edit74:setType("number");
    obj.edit74:setMin(0);
    obj.edit74:setField("xp2_3");
    obj.edit74:setName("edit74");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout17);
    obj.edit75:setLeft(20);
    obj.edit75:setTop(28);
    obj.edit75:setWidth(250);
    obj.edit75:setHeight(20);
    obj.edit75:setField("espec2_3");
    obj.edit75:setName("edit75");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout14);
    obj.layout18:setLeft(5);
    obj.layout18:setTop(200);
    obj.layout18:setWidth(270);
    obj.layout18:setHeight(50);
    obj.layout18:setName("layout18");

    obj.radioButton31 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton31:setParent(obj.layout18);
    obj.radioButton31:setLeft(0);
    obj.radioButton31:setTop(0);
    obj.radioButton31:setGroupName("grupo1");
    obj.radioButton31:setField("dado1");
    obj.radioButton31:setFieldValue("total2_4");
    obj.radioButton31:setName("radioButton31");

    obj.radioButton32 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton32:setParent(obj.layout18);
    obj.radioButton32:setLeft(0);
    obj.radioButton32:setTop(15);
    obj.radioButton32:setGroupName("grupo2");
    obj.radioButton32:setField("dado2");
    obj.radioButton32:setFieldValue("total2_4");
    obj.radioButton32:setName("radioButton32");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout18);
    obj.edit76:setLeft(20);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(100);
    obj.edit76:setHeight(25);
    obj.edit76:setField("nome2_4");
    obj.edit76:setName("edit76");

    obj.rectangle18 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle18:setParent(obj.layout18);
    obj.rectangle18:setLeft(125);
    obj.rectangle18:setTop(0);
    obj.rectangle18:setWidth(40);
    obj.rectangle18:setHeight(25);
    obj.rectangle18:setColor("Black");
    obj.rectangle18:setStrokeColor("white");
    obj.rectangle18:setStrokeSize(1);
    obj.rectangle18:setName("rectangle18");

    obj.label28 = gui.fromHandle(_obj_newObject("label"));
    obj.label28:setParent(obj.layout18);
    obj.label28:setLeft(125);
    obj.label28:setTop(3);
    obj.label28:setWidth(40);
    obj.label28:setHeight(20);
    obj.label28:setField("total22_4");
    obj.label28:setHorzTextAlign("center");
    obj.label28:setName("label28");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout18);
    obj.edit77:setLeft(170);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(30);
    obj.edit77:setHeight(25);
    obj.edit77:setType("number");
    obj.edit77:setMin(0);
    obj.edit77:setField("base2_4");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout18);
    obj.edit78:setLeft(205);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(30);
    obj.edit78:setHeight(25);
    obj.edit78:setType("number");
    obj.edit78:setMin(0);
    obj.edit78:setField("bonus2_4");
    obj.edit78:setName("edit78");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout18);
    obj.edit79:setLeft(240);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(30);
    obj.edit79:setHeight(25);
    obj.edit79:setType("number");
    obj.edit79:setMin(0);
    obj.edit79:setField("xp2_4");
    obj.edit79:setName("edit79");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout18);
    obj.edit80:setLeft(20);
    obj.edit80:setTop(28);
    obj.edit80:setWidth(250);
    obj.edit80:setHeight(20);
    obj.edit80:setField("espec2_4");
    obj.edit80:setName("edit80");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout14);
    obj.layout19:setLeft(5);
    obj.layout19:setTop(250);
    obj.layout19:setWidth(270);
    obj.layout19:setHeight(50);
    obj.layout19:setName("layout19");

    obj.radioButton33 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton33:setParent(obj.layout19);
    obj.radioButton33:setLeft(0);
    obj.radioButton33:setTop(0);
    obj.radioButton33:setGroupName("grupo1");
    obj.radioButton33:setField("dado1");
    obj.radioButton33:setFieldValue("total2_5");
    obj.radioButton33:setName("radioButton33");

    obj.radioButton34 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton34:setParent(obj.layout19);
    obj.radioButton34:setLeft(0);
    obj.radioButton34:setTop(15);
    obj.radioButton34:setGroupName("grupo2");
    obj.radioButton34:setField("dado2");
    obj.radioButton34:setFieldValue("total2_5");
    obj.radioButton34:setName("radioButton34");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout19);
    obj.edit81:setLeft(20);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(100);
    obj.edit81:setHeight(25);
    obj.edit81:setField("nome2_5");
    obj.edit81:setName("edit81");

    obj.rectangle19 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle19:setParent(obj.layout19);
    obj.rectangle19:setLeft(125);
    obj.rectangle19:setTop(0);
    obj.rectangle19:setWidth(40);
    obj.rectangle19:setHeight(25);
    obj.rectangle19:setColor("Black");
    obj.rectangle19:setStrokeColor("white");
    obj.rectangle19:setStrokeSize(1);
    obj.rectangle19:setName("rectangle19");

    obj.label29 = gui.fromHandle(_obj_newObject("label"));
    obj.label29:setParent(obj.layout19);
    obj.label29:setLeft(125);
    obj.label29:setTop(3);
    obj.label29:setWidth(40);
    obj.label29:setHeight(20);
    obj.label29:setField("total22_5");
    obj.label29:setHorzTextAlign("center");
    obj.label29:setName("label29");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout19);
    obj.edit82:setLeft(170);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(30);
    obj.edit82:setHeight(25);
    obj.edit82:setType("number");
    obj.edit82:setMin(0);
    obj.edit82:setField("base2_5");
    obj.edit82:setName("edit82");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout19);
    obj.edit83:setLeft(205);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(30);
    obj.edit83:setHeight(25);
    obj.edit83:setType("number");
    obj.edit83:setMin(0);
    obj.edit83:setField("bonus2_5");
    obj.edit83:setName("edit83");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout19);
    obj.edit84:setLeft(240);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(30);
    obj.edit84:setHeight(25);
    obj.edit84:setType("number");
    obj.edit84:setMin(0);
    obj.edit84:setField("xp2_5");
    obj.edit84:setName("edit84");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout19);
    obj.edit85:setLeft(20);
    obj.edit85:setTop(28);
    obj.edit85:setWidth(250);
    obj.edit85:setHeight(20);
    obj.edit85:setField("espec2_5");
    obj.edit85:setName("edit85");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout14);
    obj.layout20:setLeft(5);
    obj.layout20:setTop(300);
    obj.layout20:setWidth(270);
    obj.layout20:setHeight(50);
    obj.layout20:setName("layout20");

    obj.radioButton35 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton35:setParent(obj.layout20);
    obj.radioButton35:setLeft(0);
    obj.radioButton35:setTop(0);
    obj.radioButton35:setGroupName("grupo1");
    obj.radioButton35:setField("dado1");
    obj.radioButton35:setFieldValue("total2_6");
    obj.radioButton35:setName("radioButton35");

    obj.radioButton36 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton36:setParent(obj.layout20);
    obj.radioButton36:setLeft(0);
    obj.radioButton36:setTop(15);
    obj.radioButton36:setGroupName("grupo2");
    obj.radioButton36:setField("dado2");
    obj.radioButton36:setFieldValue("total2_6");
    obj.radioButton36:setName("radioButton36");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout20);
    obj.edit86:setLeft(20);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(100);
    obj.edit86:setHeight(25);
    obj.edit86:setField("nome2_6");
    obj.edit86:setName("edit86");

    obj.rectangle20 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle20:setParent(obj.layout20);
    obj.rectangle20:setLeft(125);
    obj.rectangle20:setTop(0);
    obj.rectangle20:setWidth(40);
    obj.rectangle20:setHeight(25);
    obj.rectangle20:setColor("Black");
    obj.rectangle20:setStrokeColor("white");
    obj.rectangle20:setStrokeSize(1);
    obj.rectangle20:setName("rectangle20");

    obj.label30 = gui.fromHandle(_obj_newObject("label"));
    obj.label30:setParent(obj.layout20);
    obj.label30:setLeft(125);
    obj.label30:setTop(3);
    obj.label30:setWidth(40);
    obj.label30:setHeight(20);
    obj.label30:setField("total22_6");
    obj.label30:setHorzTextAlign("center");
    obj.label30:setName("label30");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout20);
    obj.edit87:setLeft(170);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(30);
    obj.edit87:setHeight(25);
    obj.edit87:setType("number");
    obj.edit87:setMin(0);
    obj.edit87:setField("base2_6");
    obj.edit87:setName("edit87");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout20);
    obj.edit88:setLeft(205);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(30);
    obj.edit88:setHeight(25);
    obj.edit88:setType("number");
    obj.edit88:setMin(0);
    obj.edit88:setField("bonus2_6");
    obj.edit88:setName("edit88");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout20);
    obj.edit89:setLeft(240);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(30);
    obj.edit89:setHeight(25);
    obj.edit89:setType("number");
    obj.edit89:setMin(0);
    obj.edit89:setField("xp2_6");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout20);
    obj.edit90:setLeft(20);
    obj.edit90:setTop(28);
    obj.edit90:setWidth(250);
    obj.edit90:setHeight(20);
    obj.edit90:setField("espec2_6");
    obj.edit90:setName("edit90");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout14);
    obj.layout21:setLeft(5);
    obj.layout21:setTop(350);
    obj.layout21:setWidth(270);
    obj.layout21:setHeight(50);
    obj.layout21:setName("layout21");

    obj.radioButton37 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton37:setParent(obj.layout21);
    obj.radioButton37:setLeft(0);
    obj.radioButton37:setTop(0);
    obj.radioButton37:setGroupName("grupo1");
    obj.radioButton37:setField("dado1");
    obj.radioButton37:setFieldValue("total2_7");
    obj.radioButton37:setName("radioButton37");

    obj.radioButton38 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton38:setParent(obj.layout21);
    obj.radioButton38:setLeft(0);
    obj.radioButton38:setTop(15);
    obj.radioButton38:setGroupName("grupo2");
    obj.radioButton38:setField("dado2");
    obj.radioButton38:setFieldValue("total2_7");
    obj.radioButton38:setName("radioButton38");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout21);
    obj.edit91:setLeft(20);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(100);
    obj.edit91:setHeight(25);
    obj.edit91:setField("nome2_7");
    obj.edit91:setName("edit91");

    obj.rectangle21 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle21:setParent(obj.layout21);
    obj.rectangle21:setLeft(125);
    obj.rectangle21:setTop(0);
    obj.rectangle21:setWidth(40);
    obj.rectangle21:setHeight(25);
    obj.rectangle21:setColor("Black");
    obj.rectangle21:setStrokeColor("white");
    obj.rectangle21:setStrokeSize(1);
    obj.rectangle21:setName("rectangle21");

    obj.label31 = gui.fromHandle(_obj_newObject("label"));
    obj.label31:setParent(obj.layout21);
    obj.label31:setLeft(125);
    obj.label31:setTop(3);
    obj.label31:setWidth(40);
    obj.label31:setHeight(20);
    obj.label31:setField("total22_7");
    obj.label31:setHorzTextAlign("center");
    obj.label31:setName("label31");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout21);
    obj.edit92:setLeft(170);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(30);
    obj.edit92:setHeight(25);
    obj.edit92:setType("number");
    obj.edit92:setMin(0);
    obj.edit92:setField("base2_7");
    obj.edit92:setName("edit92");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout21);
    obj.edit93:setLeft(205);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(30);
    obj.edit93:setHeight(25);
    obj.edit93:setType("number");
    obj.edit93:setMin(0);
    obj.edit93:setField("bonus2_7");
    obj.edit93:setName("edit93");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout21);
    obj.edit94:setLeft(240);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(30);
    obj.edit94:setHeight(25);
    obj.edit94:setType("number");
    obj.edit94:setMin(0);
    obj.edit94:setField("xp2_7");
    obj.edit94:setName("edit94");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout21);
    obj.edit95:setLeft(20);
    obj.edit95:setTop(28);
    obj.edit95:setWidth(250);
    obj.edit95:setHeight(20);
    obj.edit95:setField("espec2_7");
    obj.edit95:setName("edit95");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout14);
    obj.layout22:setLeft(5);
    obj.layout22:setTop(400);
    obj.layout22:setWidth(270);
    obj.layout22:setHeight(50);
    obj.layout22:setName("layout22");

    obj.radioButton39 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton39:setParent(obj.layout22);
    obj.radioButton39:setLeft(0);
    obj.radioButton39:setTop(0);
    obj.radioButton39:setGroupName("grupo1");
    obj.radioButton39:setField("dado1");
    obj.radioButton39:setFieldValue("total2_8");
    obj.radioButton39:setName("radioButton39");

    obj.radioButton40 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton40:setParent(obj.layout22);
    obj.radioButton40:setLeft(0);
    obj.radioButton40:setTop(15);
    obj.radioButton40:setGroupName("grupo2");
    obj.radioButton40:setField("dado2");
    obj.radioButton40:setFieldValue("total2_8");
    obj.radioButton40:setName("radioButton40");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout22);
    obj.edit96:setLeft(20);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(100);
    obj.edit96:setHeight(25);
    obj.edit96:setField("nome2_8");
    obj.edit96:setName("edit96");

    obj.rectangle22 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle22:setParent(obj.layout22);
    obj.rectangle22:setLeft(125);
    obj.rectangle22:setTop(0);
    obj.rectangle22:setWidth(40);
    obj.rectangle22:setHeight(25);
    obj.rectangle22:setColor("Black");
    obj.rectangle22:setStrokeColor("white");
    obj.rectangle22:setStrokeSize(1);
    obj.rectangle22:setName("rectangle22");

    obj.label32 = gui.fromHandle(_obj_newObject("label"));
    obj.label32:setParent(obj.layout22);
    obj.label32:setLeft(125);
    obj.label32:setTop(3);
    obj.label32:setWidth(40);
    obj.label32:setHeight(20);
    obj.label32:setField("total22_8");
    obj.label32:setHorzTextAlign("center");
    obj.label32:setName("label32");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout22);
    obj.edit97:setLeft(170);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(30);
    obj.edit97:setHeight(25);
    obj.edit97:setType("number");
    obj.edit97:setMin(0);
    obj.edit97:setField("base2_8");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout22);
    obj.edit98:setLeft(205);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(30);
    obj.edit98:setHeight(25);
    obj.edit98:setType("number");
    obj.edit98:setMin(0);
    obj.edit98:setField("bonus2_8");
    obj.edit98:setName("edit98");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout22);
    obj.edit99:setLeft(240);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(30);
    obj.edit99:setHeight(25);
    obj.edit99:setType("number");
    obj.edit99:setMin(0);
    obj.edit99:setField("xp2_8");
    obj.edit99:setName("edit99");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout22);
    obj.edit100:setLeft(20);
    obj.edit100:setTop(28);
    obj.edit100:setWidth(250);
    obj.edit100:setHeight(20);
    obj.edit100:setField("espec2_8");
    obj.edit100:setName("edit100");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout14);
    obj.layout23:setLeft(5);
    obj.layout23:setTop(450);
    obj.layout23:setWidth(270);
    obj.layout23:setHeight(50);
    obj.layout23:setName("layout23");

    obj.radioButton41 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton41:setParent(obj.layout23);
    obj.radioButton41:setLeft(0);
    obj.radioButton41:setTop(0);
    obj.radioButton41:setGroupName("grupo1");
    obj.radioButton41:setField("dado1");
    obj.radioButton41:setFieldValue("total2_9");
    obj.radioButton41:setName("radioButton41");

    obj.radioButton42 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton42:setParent(obj.layout23);
    obj.radioButton42:setLeft(0);
    obj.radioButton42:setTop(15);
    obj.radioButton42:setGroupName("grupo2");
    obj.radioButton42:setField("dado2");
    obj.radioButton42:setFieldValue("total2_9");
    obj.radioButton42:setName("radioButton42");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout23);
    obj.edit101:setLeft(20);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(100);
    obj.edit101:setHeight(25);
    obj.edit101:setField("nome2_9");
    obj.edit101:setName("edit101");

    obj.rectangle23 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle23:setParent(obj.layout23);
    obj.rectangle23:setLeft(125);
    obj.rectangle23:setTop(0);
    obj.rectangle23:setWidth(40);
    obj.rectangle23:setHeight(25);
    obj.rectangle23:setColor("Black");
    obj.rectangle23:setStrokeColor("white");
    obj.rectangle23:setStrokeSize(1);
    obj.rectangle23:setName("rectangle23");

    obj.label33 = gui.fromHandle(_obj_newObject("label"));
    obj.label33:setParent(obj.layout23);
    obj.label33:setLeft(125);
    obj.label33:setTop(3);
    obj.label33:setWidth(40);
    obj.label33:setHeight(20);
    obj.label33:setField("total22_9");
    obj.label33:setHorzTextAlign("center");
    obj.label33:setName("label33");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout23);
    obj.edit102:setLeft(170);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(30);
    obj.edit102:setHeight(25);
    obj.edit102:setType("number");
    obj.edit102:setMin(0);
    obj.edit102:setField("base2_9");
    obj.edit102:setName("edit102");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout23);
    obj.edit103:setLeft(205);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(30);
    obj.edit103:setHeight(25);
    obj.edit103:setType("number");
    obj.edit103:setMin(0);
    obj.edit103:setField("bonus2_9");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout23);
    obj.edit104:setLeft(240);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(30);
    obj.edit104:setHeight(25);
    obj.edit104:setType("number");
    obj.edit104:setMin(0);
    obj.edit104:setField("xp2_9");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout23);
    obj.edit105:setLeft(20);
    obj.edit105:setTop(28);
    obj.edit105:setWidth(250);
    obj.edit105:setHeight(20);
    obj.edit105:setField("espec2_9");
    obj.edit105:setName("edit105");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout14);
    obj.layout24:setLeft(5);
    obj.layout24:setTop(500);
    obj.layout24:setWidth(270);
    obj.layout24:setHeight(50);
    obj.layout24:setName("layout24");

    obj.radioButton43 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton43:setParent(obj.layout24);
    obj.radioButton43:setLeft(0);
    obj.radioButton43:setTop(0);
    obj.radioButton43:setGroupName("grupo1");
    obj.radioButton43:setField("dado1");
    obj.radioButton43:setFieldValue("total2_10");
    obj.radioButton43:setName("radioButton43");

    obj.radioButton44 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton44:setParent(obj.layout24);
    obj.radioButton44:setLeft(0);
    obj.radioButton44:setTop(15);
    obj.radioButton44:setGroupName("grupo2");
    obj.radioButton44:setField("dado2");
    obj.radioButton44:setFieldValue("total2_10");
    obj.radioButton44:setName("radioButton44");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout24);
    obj.edit106:setLeft(20);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(100);
    obj.edit106:setHeight(25);
    obj.edit106:setField("nome2_10");
    obj.edit106:setName("edit106");

    obj.rectangle24 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle24:setParent(obj.layout24);
    obj.rectangle24:setLeft(125);
    obj.rectangle24:setTop(0);
    obj.rectangle24:setWidth(40);
    obj.rectangle24:setHeight(25);
    obj.rectangle24:setColor("Black");
    obj.rectangle24:setStrokeColor("white");
    obj.rectangle24:setStrokeSize(1);
    obj.rectangle24:setName("rectangle24");

    obj.label34 = gui.fromHandle(_obj_newObject("label"));
    obj.label34:setParent(obj.layout24);
    obj.label34:setLeft(125);
    obj.label34:setTop(3);
    obj.label34:setWidth(40);
    obj.label34:setHeight(20);
    obj.label34:setField("total22_10");
    obj.label34:setHorzTextAlign("center");
    obj.label34:setName("label34");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout24);
    obj.edit107:setLeft(170);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(30);
    obj.edit107:setHeight(25);
    obj.edit107:setType("number");
    obj.edit107:setMin(0);
    obj.edit107:setField("base2_10");
    obj.edit107:setName("edit107");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout24);
    obj.edit108:setLeft(205);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(30);
    obj.edit108:setHeight(25);
    obj.edit108:setType("number");
    obj.edit108:setMin(0);
    obj.edit108:setField("bonus2_10");
    obj.edit108:setName("edit108");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout24);
    obj.edit109:setLeft(240);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(30);
    obj.edit109:setHeight(25);
    obj.edit109:setType("number");
    obj.edit109:setMin(0);
    obj.edit109:setField("xp2_10");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout24);
    obj.edit110:setLeft(20);
    obj.edit110:setTop(28);
    obj.edit110:setWidth(250);
    obj.edit110:setHeight(20);
    obj.edit110:setField("espec2_10");
    obj.edit110:setName("edit110");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.layout14);
    obj.layout25:setLeft(5);
    obj.layout25:setTop(550);
    obj.layout25:setWidth(270);
    obj.layout25:setHeight(50);
    obj.layout25:setName("layout25");

    obj.radioButton45 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton45:setParent(obj.layout25);
    obj.radioButton45:setLeft(0);
    obj.radioButton45:setTop(0);
    obj.radioButton45:setGroupName("grupo1");
    obj.radioButton45:setField("dado1");
    obj.radioButton45:setFieldValue("total2_11");
    obj.radioButton45:setName("radioButton45");

    obj.radioButton46 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton46:setParent(obj.layout25);
    obj.radioButton46:setLeft(0);
    obj.radioButton46:setTop(15);
    obj.radioButton46:setGroupName("grupo2");
    obj.radioButton46:setField("dado2");
    obj.radioButton46:setFieldValue("total2_11");
    obj.radioButton46:setName("radioButton46");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout25);
    obj.edit111:setLeft(20);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(100);
    obj.edit111:setHeight(25);
    obj.edit111:setField("nome2_11");
    obj.edit111:setName("edit111");

    obj.rectangle25 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle25:setParent(obj.layout25);
    obj.rectangle25:setLeft(125);
    obj.rectangle25:setTop(0);
    obj.rectangle25:setWidth(40);
    obj.rectangle25:setHeight(25);
    obj.rectangle25:setColor("Black");
    obj.rectangle25:setStrokeColor("white");
    obj.rectangle25:setStrokeSize(1);
    obj.rectangle25:setName("rectangle25");

    obj.label35 = gui.fromHandle(_obj_newObject("label"));
    obj.label35:setParent(obj.layout25);
    obj.label35:setLeft(125);
    obj.label35:setTop(3);
    obj.label35:setWidth(40);
    obj.label35:setHeight(20);
    obj.label35:setField("total22_11");
    obj.label35:setHorzTextAlign("center");
    obj.label35:setName("label35");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout25);
    obj.edit112:setLeft(170);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(30);
    obj.edit112:setHeight(25);
    obj.edit112:setType("number");
    obj.edit112:setMin(0);
    obj.edit112:setField("base2_11");
    obj.edit112:setName("edit112");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout25);
    obj.edit113:setLeft(205);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(30);
    obj.edit113:setHeight(25);
    obj.edit113:setType("number");
    obj.edit113:setMin(0);
    obj.edit113:setField("bonus2_11");
    obj.edit113:setName("edit113");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout25);
    obj.edit114:setLeft(240);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(30);
    obj.edit114:setHeight(25);
    obj.edit114:setType("number");
    obj.edit114:setMin(0);
    obj.edit114:setField("xp2_11");
    obj.edit114:setName("edit114");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout25);
    obj.edit115:setLeft(20);
    obj.edit115:setTop(28);
    obj.edit115:setWidth(250);
    obj.edit115:setHeight(20);
    obj.edit115:setField("espec2_11");
    obj.edit115:setName("edit115");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout14);
    obj.layout26:setLeft(5);
    obj.layout26:setTop(600);
    obj.layout26:setWidth(270);
    obj.layout26:setHeight(50);
    obj.layout26:setName("layout26");

    obj.radioButton47 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton47:setParent(obj.layout26);
    obj.radioButton47:setLeft(0);
    obj.radioButton47:setTop(0);
    obj.radioButton47:setGroupName("grupo1");
    obj.radioButton47:setField("dado1");
    obj.radioButton47:setFieldValue("total2_12");
    obj.radioButton47:setName("radioButton47");

    obj.radioButton48 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton48:setParent(obj.layout26);
    obj.radioButton48:setLeft(0);
    obj.radioButton48:setTop(15);
    obj.radioButton48:setGroupName("grupo2");
    obj.radioButton48:setField("dado2");
    obj.radioButton48:setFieldValue("total2_12");
    obj.radioButton48:setName("radioButton48");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout26);
    obj.edit116:setLeft(20);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(100);
    obj.edit116:setHeight(25);
    obj.edit116:setField("nome2_12");
    obj.edit116:setName("edit116");

    obj.rectangle26 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle26:setParent(obj.layout26);
    obj.rectangle26:setLeft(125);
    obj.rectangle26:setTop(0);
    obj.rectangle26:setWidth(40);
    obj.rectangle26:setHeight(25);
    obj.rectangle26:setColor("Black");
    obj.rectangle26:setStrokeColor("white");
    obj.rectangle26:setStrokeSize(1);
    obj.rectangle26:setName("rectangle26");

    obj.label36 = gui.fromHandle(_obj_newObject("label"));
    obj.label36:setParent(obj.layout26);
    obj.label36:setLeft(125);
    obj.label36:setTop(3);
    obj.label36:setWidth(40);
    obj.label36:setHeight(20);
    obj.label36:setField("total22_12");
    obj.label36:setHorzTextAlign("center");
    obj.label36:setName("label36");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout26);
    obj.edit117:setLeft(170);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(30);
    obj.edit117:setHeight(25);
    obj.edit117:setType("number");
    obj.edit117:setMin(0);
    obj.edit117:setField("base2_12");
    obj.edit117:setName("edit117");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout26);
    obj.edit118:setLeft(205);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(30);
    obj.edit118:setHeight(25);
    obj.edit118:setType("number");
    obj.edit118:setMin(0);
    obj.edit118:setField("bonus2_12");
    obj.edit118:setName("edit118");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout26);
    obj.edit119:setLeft(240);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(30);
    obj.edit119:setHeight(25);
    obj.edit119:setType("number");
    obj.edit119:setMin(0);
    obj.edit119:setField("xp2_12");
    obj.edit119:setName("edit119");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout26);
    obj.edit120:setLeft(20);
    obj.edit120:setTop(28);
    obj.edit120:setWidth(250);
    obj.edit120:setHeight(20);
    obj.edit120:setField("espec2_12");
    obj.edit120:setName("edit120");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.scrollBox1);
    obj.layout27:setLeft(600);
    obj.layout27:setTop(0);
    obj.layout27:setWidth(280);
    obj.layout27:setHeight(630);
    obj.layout27:setName("layout27");

    obj.rectangle27 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle27:setParent(obj.layout27);
    obj.rectangle27:setLeft(0);
    obj.rectangle27:setTop(0);
    obj.rectangle27:setWidth(280);
    obj.rectangle27:setHeight(630);
    obj.rectangle27:setColor("black");
    obj.rectangle27:setXradius(15);
    obj.rectangle27:setYradius(15);
    obj.rectangle27:setCornerType("round");
    obj.rectangle27:setName("rectangle27");

    obj.label37 = gui.fromHandle(_obj_newObject("label"));
    obj.label37:setParent(obj.layout27);
    obj.label37:setLeft(5);
    obj.label37:setTop(0);
    obj.label37:setWidth(240);
    obj.label37:setHeight(20);
    obj.label37:setText("TALENTOS MENTAIS");
    obj.label37:setHorzTextAlign("center");
    obj.label37:setName("label37");

    obj.label38 = gui.fromHandle(_obj_newObject("label"));
    obj.label38:setParent(obj.layout27);
    obj.label38:setLeft(25);
    obj.label38:setTop(25);
    obj.label38:setWidth(315);
    obj.label38:setHeight(20);
    obj.label38:setText(" Nome");
    obj.label38:setName("label38");

    obj.label39 = gui.fromHandle(_obj_newObject("label"));
    obj.label39:setParent(obj.layout27);
    obj.label39:setLeft(135);
    obj.label39:setTop(25);
    obj.label39:setWidth(315);
    obj.label39:setHeight(20);
    obj.label39:setText("Total");
    obj.label39:setName("label39");

    obj.label40 = gui.fromHandle(_obj_newObject("label"));
    obj.label40:setParent(obj.layout27);
    obj.label40:setLeft(170);
    obj.label40:setTop(25);
    obj.label40:setWidth(315);
    obj.label40:setHeight(20);
    obj.label40:setText(" Inic");
    obj.label40:setName("label40");

    obj.label41 = gui.fromHandle(_obj_newObject("label"));
    obj.label41:setParent(obj.layout27);
    obj.label41:setLeft(202);
    obj.label41:setTop(25);
    obj.label41:setWidth(315);
    obj.label41:setHeight(20);
    obj.label41:setText(" Apr.");
    obj.label41:setName("label41");

    obj.label42 = gui.fromHandle(_obj_newObject("label"));
    obj.label42:setParent(obj.layout27);
    obj.label42:setLeft(235);
    obj.label42:setTop(25);
    obj.label42:setWidth(315);
    obj.label42:setHeight(20);
    obj.label42:setText("  XP");
    obj.label42:setName("label42");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout27);
    obj.layout28:setLeft(5);
    obj.layout28:setTop(50);
    obj.layout28:setWidth(270);
    obj.layout28:setHeight(50);
    obj.layout28:setName("layout28");

    obj.radioButton49 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton49:setParent(obj.layout28);
    obj.radioButton49:setLeft(0);
    obj.radioButton49:setTop(0);
    obj.radioButton49:setGroupName("grupo1");
    obj.radioButton49:setField("dado1");
    obj.radioButton49:setFieldValue("total1_1");
    obj.radioButton49:setName("radioButton49");

    obj.radioButton50 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton50:setParent(obj.layout28);
    obj.radioButton50:setLeft(0);
    obj.radioButton50:setTop(15);
    obj.radioButton50:setGroupName("grupo2");
    obj.radioButton50:setField("dado2");
    obj.radioButton50:setFieldValue("total1_1");
    obj.radioButton50:setName("radioButton50");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout28);
    obj.edit121:setLeft(20);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(100);
    obj.edit121:setHeight(25);
    obj.edit121:setField("nome1_1");
    obj.edit121:setName("edit121");

    obj.rectangle28 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle28:setParent(obj.layout28);
    obj.rectangle28:setLeft(125);
    obj.rectangle28:setTop(0);
    obj.rectangle28:setWidth(40);
    obj.rectangle28:setHeight(25);
    obj.rectangle28:setColor("Black");
    obj.rectangle28:setStrokeColor("white");
    obj.rectangle28:setStrokeSize(1);
    obj.rectangle28:setName("rectangle28");

    obj.label43 = gui.fromHandle(_obj_newObject("label"));
    obj.label43:setParent(obj.layout28);
    obj.label43:setLeft(125);
    obj.label43:setTop(3);
    obj.label43:setWidth(40);
    obj.label43:setHeight(20);
    obj.label43:setField("total21_1");
    obj.label43:setHorzTextAlign("center");
    obj.label43:setName("label43");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout28);
    obj.edit122:setLeft(170);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(30);
    obj.edit122:setHeight(25);
    obj.edit122:setType("number");
    obj.edit122:setMin(0);
    obj.edit122:setField("base1_1");
    obj.edit122:setName("edit122");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout28);
    obj.edit123:setLeft(205);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(30);
    obj.edit123:setHeight(25);
    obj.edit123:setType("number");
    obj.edit123:setMin(0);
    obj.edit123:setField("bonus1_1");
    obj.edit123:setName("edit123");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout28);
    obj.edit124:setLeft(240);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(30);
    obj.edit124:setHeight(25);
    obj.edit124:setType("number");
    obj.edit124:setMin(0);
    obj.edit124:setField("xp1_1");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout28);
    obj.edit125:setLeft(20);
    obj.edit125:setTop(28);
    obj.edit125:setWidth(250);
    obj.edit125:setHeight(20);
    obj.edit125:setField("espec1_1");
    obj.edit125:setName("edit125");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout27);
    obj.layout29:setLeft(5);
    obj.layout29:setTop(100);
    obj.layout29:setWidth(270);
    obj.layout29:setHeight(50);
    obj.layout29:setName("layout29");

    obj.radioButton51 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton51:setParent(obj.layout29);
    obj.radioButton51:setLeft(0);
    obj.radioButton51:setTop(0);
    obj.radioButton51:setGroupName("grupo1");
    obj.radioButton51:setField("dado1");
    obj.radioButton51:setFieldValue("total1_2");
    obj.radioButton51:setName("radioButton51");

    obj.radioButton52 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton52:setParent(obj.layout29);
    obj.radioButton52:setLeft(0);
    obj.radioButton52:setTop(15);
    obj.radioButton52:setGroupName("grupo2");
    obj.radioButton52:setField("dado2");
    obj.radioButton52:setFieldValue("total1_2");
    obj.radioButton52:setName("radioButton52");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout29);
    obj.edit126:setLeft(20);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(100);
    obj.edit126:setHeight(25);
    obj.edit126:setField("nome1_2");
    obj.edit126:setName("edit126");

    obj.rectangle29 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle29:setParent(obj.layout29);
    obj.rectangle29:setLeft(125);
    obj.rectangle29:setTop(0);
    obj.rectangle29:setWidth(40);
    obj.rectangle29:setHeight(25);
    obj.rectangle29:setColor("Black");
    obj.rectangle29:setStrokeColor("white");
    obj.rectangle29:setStrokeSize(1);
    obj.rectangle29:setName("rectangle29");

    obj.label44 = gui.fromHandle(_obj_newObject("label"));
    obj.label44:setParent(obj.layout29);
    obj.label44:setLeft(125);
    obj.label44:setTop(3);
    obj.label44:setWidth(40);
    obj.label44:setHeight(20);
    obj.label44:setField("total21_2");
    obj.label44:setHorzTextAlign("center");
    obj.label44:setName("label44");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout29);
    obj.edit127:setLeft(170);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(30);
    obj.edit127:setHeight(25);
    obj.edit127:setType("number");
    obj.edit127:setMin(0);
    obj.edit127:setField("base1_2");
    obj.edit127:setName("edit127");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout29);
    obj.edit128:setLeft(205);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(30);
    obj.edit128:setHeight(25);
    obj.edit128:setType("number");
    obj.edit128:setMin(0);
    obj.edit128:setField("bonus1_2");
    obj.edit128:setName("edit128");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout29);
    obj.edit129:setLeft(240);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(30);
    obj.edit129:setHeight(25);
    obj.edit129:setType("number");
    obj.edit129:setMin(0);
    obj.edit129:setField("xp1_2");
    obj.edit129:setName("edit129");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout29);
    obj.edit130:setLeft(20);
    obj.edit130:setTop(28);
    obj.edit130:setWidth(250);
    obj.edit130:setHeight(20);
    obj.edit130:setField("espec1_2");
    obj.edit130:setName("edit130");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout27);
    obj.layout30:setLeft(5);
    obj.layout30:setTop(150);
    obj.layout30:setWidth(270);
    obj.layout30:setHeight(50);
    obj.layout30:setName("layout30");

    obj.radioButton53 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton53:setParent(obj.layout30);
    obj.radioButton53:setLeft(0);
    obj.radioButton53:setTop(0);
    obj.radioButton53:setGroupName("grupo1");
    obj.radioButton53:setField("dado1");
    obj.radioButton53:setFieldValue("total1_3");
    obj.radioButton53:setName("radioButton53");

    obj.radioButton54 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton54:setParent(obj.layout30);
    obj.radioButton54:setLeft(0);
    obj.radioButton54:setTop(15);
    obj.radioButton54:setGroupName("grupo2");
    obj.radioButton54:setField("dado2");
    obj.radioButton54:setFieldValue("total1_3");
    obj.radioButton54:setName("radioButton54");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout30);
    obj.edit131:setLeft(20);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(100);
    obj.edit131:setHeight(25);
    obj.edit131:setField("nome1_3");
    obj.edit131:setName("edit131");

    obj.rectangle30 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle30:setParent(obj.layout30);
    obj.rectangle30:setLeft(125);
    obj.rectangle30:setTop(0);
    obj.rectangle30:setWidth(40);
    obj.rectangle30:setHeight(25);
    obj.rectangle30:setColor("Black");
    obj.rectangle30:setStrokeColor("white");
    obj.rectangle30:setStrokeSize(1);
    obj.rectangle30:setName("rectangle30");

    obj.label45 = gui.fromHandle(_obj_newObject("label"));
    obj.label45:setParent(obj.layout30);
    obj.label45:setLeft(125);
    obj.label45:setTop(3);
    obj.label45:setWidth(40);
    obj.label45:setHeight(20);
    obj.label45:setField("total21_3");
    obj.label45:setHorzTextAlign("center");
    obj.label45:setName("label45");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout30);
    obj.edit132:setLeft(170);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(30);
    obj.edit132:setHeight(25);
    obj.edit132:setType("number");
    obj.edit132:setMin(0);
    obj.edit132:setField("base1_3");
    obj.edit132:setName("edit132");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout30);
    obj.edit133:setLeft(205);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(30);
    obj.edit133:setHeight(25);
    obj.edit133:setType("number");
    obj.edit133:setMin(0);
    obj.edit133:setField("bonus1_3");
    obj.edit133:setName("edit133");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout30);
    obj.edit134:setLeft(240);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(30);
    obj.edit134:setHeight(25);
    obj.edit134:setType("number");
    obj.edit134:setMin(0);
    obj.edit134:setField("xp1_3");
    obj.edit134:setName("edit134");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout30);
    obj.edit135:setLeft(20);
    obj.edit135:setTop(28);
    obj.edit135:setWidth(250);
    obj.edit135:setHeight(20);
    obj.edit135:setField("espec1_3");
    obj.edit135:setName("edit135");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout27);
    obj.layout31:setLeft(5);
    obj.layout31:setTop(200);
    obj.layout31:setWidth(270);
    obj.layout31:setHeight(50);
    obj.layout31:setName("layout31");

    obj.radioButton55 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton55:setParent(obj.layout31);
    obj.radioButton55:setLeft(0);
    obj.radioButton55:setTop(0);
    obj.radioButton55:setGroupName("grupo1");
    obj.radioButton55:setField("dado1");
    obj.radioButton55:setFieldValue("total1_4");
    obj.radioButton55:setName("radioButton55");

    obj.radioButton56 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton56:setParent(obj.layout31);
    obj.radioButton56:setLeft(0);
    obj.radioButton56:setTop(15);
    obj.radioButton56:setGroupName("grupo2");
    obj.radioButton56:setField("dado2");
    obj.radioButton56:setFieldValue("total1_4");
    obj.radioButton56:setName("radioButton56");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout31);
    obj.edit136:setLeft(20);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(100);
    obj.edit136:setHeight(25);
    obj.edit136:setField("nome1_4");
    obj.edit136:setName("edit136");

    obj.rectangle31 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle31:setParent(obj.layout31);
    obj.rectangle31:setLeft(125);
    obj.rectangle31:setTop(0);
    obj.rectangle31:setWidth(40);
    obj.rectangle31:setHeight(25);
    obj.rectangle31:setColor("Black");
    obj.rectangle31:setStrokeColor("white");
    obj.rectangle31:setStrokeSize(1);
    obj.rectangle31:setName("rectangle31");

    obj.label46 = gui.fromHandle(_obj_newObject("label"));
    obj.label46:setParent(obj.layout31);
    obj.label46:setLeft(125);
    obj.label46:setTop(3);
    obj.label46:setWidth(40);
    obj.label46:setHeight(20);
    obj.label46:setField("total21_4");
    obj.label46:setHorzTextAlign("center");
    obj.label46:setName("label46");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout31);
    obj.edit137:setLeft(170);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(30);
    obj.edit137:setHeight(25);
    obj.edit137:setType("number");
    obj.edit137:setMin(0);
    obj.edit137:setField("base1_4");
    obj.edit137:setName("edit137");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout31);
    obj.edit138:setLeft(205);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(30);
    obj.edit138:setHeight(25);
    obj.edit138:setType("number");
    obj.edit138:setMin(0);
    obj.edit138:setField("bonus1_4");
    obj.edit138:setName("edit138");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout31);
    obj.edit139:setLeft(240);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(30);
    obj.edit139:setHeight(25);
    obj.edit139:setType("number");
    obj.edit139:setMin(0);
    obj.edit139:setField("xp1_4");
    obj.edit139:setName("edit139");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout31);
    obj.edit140:setLeft(20);
    obj.edit140:setTop(28);
    obj.edit140:setWidth(250);
    obj.edit140:setHeight(20);
    obj.edit140:setField("espec1_4");
    obj.edit140:setName("edit140");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout27);
    obj.layout32:setLeft(5);
    obj.layout32:setTop(250);
    obj.layout32:setWidth(270);
    obj.layout32:setHeight(50);
    obj.layout32:setName("layout32");

    obj.radioButton57 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton57:setParent(obj.layout32);
    obj.radioButton57:setLeft(0);
    obj.radioButton57:setTop(0);
    obj.radioButton57:setGroupName("grupo1");
    obj.radioButton57:setField("dado1");
    obj.radioButton57:setFieldValue("total1_5");
    obj.radioButton57:setName("radioButton57");

    obj.radioButton58 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton58:setParent(obj.layout32);
    obj.radioButton58:setLeft(0);
    obj.radioButton58:setTop(15);
    obj.radioButton58:setGroupName("grupo2");
    obj.radioButton58:setField("dado2");
    obj.radioButton58:setFieldValue("total1_5");
    obj.radioButton58:setName("radioButton58");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout32);
    obj.edit141:setLeft(20);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(100);
    obj.edit141:setHeight(25);
    obj.edit141:setField("nome1_5");
    obj.edit141:setName("edit141");

    obj.rectangle32 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle32:setParent(obj.layout32);
    obj.rectangle32:setLeft(125);
    obj.rectangle32:setTop(0);
    obj.rectangle32:setWidth(40);
    obj.rectangle32:setHeight(25);
    obj.rectangle32:setColor("Black");
    obj.rectangle32:setStrokeColor("white");
    obj.rectangle32:setStrokeSize(1);
    obj.rectangle32:setName("rectangle32");

    obj.label47 = gui.fromHandle(_obj_newObject("label"));
    obj.label47:setParent(obj.layout32);
    obj.label47:setLeft(125);
    obj.label47:setTop(3);
    obj.label47:setWidth(40);
    obj.label47:setHeight(20);
    obj.label47:setField("total21_5");
    obj.label47:setHorzTextAlign("center");
    obj.label47:setName("label47");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout32);
    obj.edit142:setLeft(170);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(30);
    obj.edit142:setHeight(25);
    obj.edit142:setType("number");
    obj.edit142:setMin(0);
    obj.edit142:setField("base1_5");
    obj.edit142:setName("edit142");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout32);
    obj.edit143:setLeft(205);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(30);
    obj.edit143:setHeight(25);
    obj.edit143:setType("number");
    obj.edit143:setMin(0);
    obj.edit143:setField("bonus1_5");
    obj.edit143:setName("edit143");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout32);
    obj.edit144:setLeft(240);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(30);
    obj.edit144:setHeight(25);
    obj.edit144:setType("number");
    obj.edit144:setMin(0);
    obj.edit144:setField("xp1_5");
    obj.edit144:setName("edit144");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout32);
    obj.edit145:setLeft(20);
    obj.edit145:setTop(28);
    obj.edit145:setWidth(250);
    obj.edit145:setHeight(20);
    obj.edit145:setField("espec1_5");
    obj.edit145:setName("edit145");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout27);
    obj.layout33:setLeft(5);
    obj.layout33:setTop(300);
    obj.layout33:setWidth(270);
    obj.layout33:setHeight(50);
    obj.layout33:setName("layout33");

    obj.radioButton59 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton59:setParent(obj.layout33);
    obj.radioButton59:setLeft(0);
    obj.radioButton59:setTop(0);
    obj.radioButton59:setGroupName("grupo1");
    obj.radioButton59:setField("dado1");
    obj.radioButton59:setFieldValue("total1_6");
    obj.radioButton59:setName("radioButton59");

    obj.radioButton60 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton60:setParent(obj.layout33);
    obj.radioButton60:setLeft(0);
    obj.radioButton60:setTop(15);
    obj.radioButton60:setGroupName("grupo2");
    obj.radioButton60:setField("dado2");
    obj.radioButton60:setFieldValue("total1_6");
    obj.radioButton60:setName("radioButton60");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout33);
    obj.edit146:setLeft(20);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(100);
    obj.edit146:setHeight(25);
    obj.edit146:setField("nome1_6");
    obj.edit146:setName("edit146");

    obj.rectangle33 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle33:setParent(obj.layout33);
    obj.rectangle33:setLeft(125);
    obj.rectangle33:setTop(0);
    obj.rectangle33:setWidth(40);
    obj.rectangle33:setHeight(25);
    obj.rectangle33:setColor("Black");
    obj.rectangle33:setStrokeColor("white");
    obj.rectangle33:setStrokeSize(1);
    obj.rectangle33:setName("rectangle33");

    obj.label48 = gui.fromHandle(_obj_newObject("label"));
    obj.label48:setParent(obj.layout33);
    obj.label48:setLeft(125);
    obj.label48:setTop(3);
    obj.label48:setWidth(40);
    obj.label48:setHeight(20);
    obj.label48:setField("total21_6");
    obj.label48:setHorzTextAlign("center");
    obj.label48:setName("label48");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout33);
    obj.edit147:setLeft(170);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(30);
    obj.edit147:setHeight(25);
    obj.edit147:setType("number");
    obj.edit147:setMin(0);
    obj.edit147:setField("base1_6");
    obj.edit147:setName("edit147");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout33);
    obj.edit148:setLeft(205);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(30);
    obj.edit148:setHeight(25);
    obj.edit148:setType("number");
    obj.edit148:setMin(0);
    obj.edit148:setField("bonus1_6");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout33);
    obj.edit149:setLeft(240);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(30);
    obj.edit149:setHeight(25);
    obj.edit149:setType("number");
    obj.edit149:setMin(0);
    obj.edit149:setField("xp1_6");
    obj.edit149:setName("edit149");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout33);
    obj.edit150:setLeft(20);
    obj.edit150:setTop(28);
    obj.edit150:setWidth(250);
    obj.edit150:setHeight(20);
    obj.edit150:setField("espec1_6");
    obj.edit150:setName("edit150");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout27);
    obj.layout34:setLeft(5);
    obj.layout34:setTop(350);
    obj.layout34:setWidth(270);
    obj.layout34:setHeight(50);
    obj.layout34:setName("layout34");

    obj.radioButton61 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton61:setParent(obj.layout34);
    obj.radioButton61:setLeft(0);
    obj.radioButton61:setTop(0);
    obj.radioButton61:setGroupName("grupo1");
    obj.radioButton61:setField("dado1");
    obj.radioButton61:setFieldValue("total1_7");
    obj.radioButton61:setName("radioButton61");

    obj.radioButton62 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton62:setParent(obj.layout34);
    obj.radioButton62:setLeft(0);
    obj.radioButton62:setTop(15);
    obj.radioButton62:setGroupName("grupo2");
    obj.radioButton62:setField("dado2");
    obj.radioButton62:setFieldValue("total1_7");
    obj.radioButton62:setName("radioButton62");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout34);
    obj.edit151:setLeft(20);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(100);
    obj.edit151:setHeight(25);
    obj.edit151:setField("nome1_7");
    obj.edit151:setName("edit151");

    obj.rectangle34 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle34:setParent(obj.layout34);
    obj.rectangle34:setLeft(125);
    obj.rectangle34:setTop(0);
    obj.rectangle34:setWidth(40);
    obj.rectangle34:setHeight(25);
    obj.rectangle34:setColor("Black");
    obj.rectangle34:setStrokeColor("white");
    obj.rectangle34:setStrokeSize(1);
    obj.rectangle34:setName("rectangle34");

    obj.label49 = gui.fromHandle(_obj_newObject("label"));
    obj.label49:setParent(obj.layout34);
    obj.label49:setLeft(125);
    obj.label49:setTop(3);
    obj.label49:setWidth(40);
    obj.label49:setHeight(20);
    obj.label49:setField("total21_7");
    obj.label49:setHorzTextAlign("center");
    obj.label49:setName("label49");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout34);
    obj.edit152:setLeft(170);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(30);
    obj.edit152:setHeight(25);
    obj.edit152:setType("number");
    obj.edit152:setMin(0);
    obj.edit152:setField("base1_7");
    obj.edit152:setName("edit152");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout34);
    obj.edit153:setLeft(205);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(30);
    obj.edit153:setHeight(25);
    obj.edit153:setType("number");
    obj.edit153:setMin(0);
    obj.edit153:setField("bonus1_7");
    obj.edit153:setName("edit153");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout34);
    obj.edit154:setLeft(240);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(30);
    obj.edit154:setHeight(25);
    obj.edit154:setType("number");
    obj.edit154:setMin(0);
    obj.edit154:setField("xp1_7");
    obj.edit154:setName("edit154");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout34);
    obj.edit155:setLeft(20);
    obj.edit155:setTop(28);
    obj.edit155:setWidth(250);
    obj.edit155:setHeight(20);
    obj.edit155:setField("espec1_7");
    obj.edit155:setName("edit155");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout27);
    obj.layout35:setLeft(5);
    obj.layout35:setTop(400);
    obj.layout35:setWidth(270);
    obj.layout35:setHeight(50);
    obj.layout35:setName("layout35");

    obj.radioButton63 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton63:setParent(obj.layout35);
    obj.radioButton63:setLeft(0);
    obj.radioButton63:setTop(0);
    obj.radioButton63:setGroupName("grupo1");
    obj.radioButton63:setField("dado1");
    obj.radioButton63:setFieldValue("total1_8");
    obj.radioButton63:setName("radioButton63");

    obj.radioButton64 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton64:setParent(obj.layout35);
    obj.radioButton64:setLeft(0);
    obj.radioButton64:setTop(15);
    obj.radioButton64:setGroupName("grupo2");
    obj.radioButton64:setField("dado2");
    obj.radioButton64:setFieldValue("total1_8");
    obj.radioButton64:setName("radioButton64");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout35);
    obj.edit156:setLeft(20);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(100);
    obj.edit156:setHeight(25);
    obj.edit156:setField("nome1_8");
    obj.edit156:setName("edit156");

    obj.rectangle35 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle35:setParent(obj.layout35);
    obj.rectangle35:setLeft(125);
    obj.rectangle35:setTop(0);
    obj.rectangle35:setWidth(40);
    obj.rectangle35:setHeight(25);
    obj.rectangle35:setColor("Black");
    obj.rectangle35:setStrokeColor("white");
    obj.rectangle35:setStrokeSize(1);
    obj.rectangle35:setName("rectangle35");

    obj.label50 = gui.fromHandle(_obj_newObject("label"));
    obj.label50:setParent(obj.layout35);
    obj.label50:setLeft(125);
    obj.label50:setTop(3);
    obj.label50:setWidth(40);
    obj.label50:setHeight(20);
    obj.label50:setField("total21_8");
    obj.label50:setHorzTextAlign("center");
    obj.label50:setName("label50");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout35);
    obj.edit157:setLeft(170);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(30);
    obj.edit157:setHeight(25);
    obj.edit157:setType("number");
    obj.edit157:setMin(0);
    obj.edit157:setField("base1_8");
    obj.edit157:setName("edit157");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout35);
    obj.edit158:setLeft(205);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(30);
    obj.edit158:setHeight(25);
    obj.edit158:setType("number");
    obj.edit158:setMin(0);
    obj.edit158:setField("bonus1_8");
    obj.edit158:setName("edit158");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout35);
    obj.edit159:setLeft(240);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(30);
    obj.edit159:setHeight(25);
    obj.edit159:setType("number");
    obj.edit159:setMin(0);
    obj.edit159:setField("xp1_8");
    obj.edit159:setName("edit159");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout35);
    obj.edit160:setLeft(20);
    obj.edit160:setTop(28);
    obj.edit160:setWidth(250);
    obj.edit160:setHeight(20);
    obj.edit160:setField("espec1_8");
    obj.edit160:setName("edit160");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout27);
    obj.layout36:setLeft(5);
    obj.layout36:setTop(450);
    obj.layout36:setWidth(270);
    obj.layout36:setHeight(50);
    obj.layout36:setName("layout36");

    obj.radioButton65 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton65:setParent(obj.layout36);
    obj.radioButton65:setLeft(0);
    obj.radioButton65:setTop(0);
    obj.radioButton65:setGroupName("grupo1");
    obj.radioButton65:setField("dado1");
    obj.radioButton65:setFieldValue("total1_9");
    obj.radioButton65:setName("radioButton65");

    obj.radioButton66 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton66:setParent(obj.layout36);
    obj.radioButton66:setLeft(0);
    obj.radioButton66:setTop(15);
    obj.radioButton66:setGroupName("grupo2");
    obj.radioButton66:setField("dado2");
    obj.radioButton66:setFieldValue("total1_9");
    obj.radioButton66:setName("radioButton66");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout36);
    obj.edit161:setLeft(20);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(100);
    obj.edit161:setHeight(25);
    obj.edit161:setField("nome1_9");
    obj.edit161:setName("edit161");

    obj.rectangle36 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle36:setParent(obj.layout36);
    obj.rectangle36:setLeft(125);
    obj.rectangle36:setTop(0);
    obj.rectangle36:setWidth(40);
    obj.rectangle36:setHeight(25);
    obj.rectangle36:setColor("Black");
    obj.rectangle36:setStrokeColor("white");
    obj.rectangle36:setStrokeSize(1);
    obj.rectangle36:setName("rectangle36");

    obj.label51 = gui.fromHandle(_obj_newObject("label"));
    obj.label51:setParent(obj.layout36);
    obj.label51:setLeft(125);
    obj.label51:setTop(3);
    obj.label51:setWidth(40);
    obj.label51:setHeight(20);
    obj.label51:setField("total21_9");
    obj.label51:setHorzTextAlign("center");
    obj.label51:setName("label51");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout36);
    obj.edit162:setLeft(170);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(30);
    obj.edit162:setHeight(25);
    obj.edit162:setType("number");
    obj.edit162:setMin(0);
    obj.edit162:setField("base1_9");
    obj.edit162:setName("edit162");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout36);
    obj.edit163:setLeft(205);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(30);
    obj.edit163:setHeight(25);
    obj.edit163:setType("number");
    obj.edit163:setMin(0);
    obj.edit163:setField("bonus1_9");
    obj.edit163:setName("edit163");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout36);
    obj.edit164:setLeft(240);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(30);
    obj.edit164:setHeight(25);
    obj.edit164:setType("number");
    obj.edit164:setMin(0);
    obj.edit164:setField("xp1_9");
    obj.edit164:setName("edit164");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout36);
    obj.edit165:setLeft(20);
    obj.edit165:setTop(28);
    obj.edit165:setWidth(250);
    obj.edit165:setHeight(20);
    obj.edit165:setField("espec1_9");
    obj.edit165:setName("edit165");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout27);
    obj.layout37:setLeft(5);
    obj.layout37:setTop(500);
    obj.layout37:setWidth(270);
    obj.layout37:setHeight(50);
    obj.layout37:setName("layout37");

    obj.radioButton67 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton67:setParent(obj.layout37);
    obj.radioButton67:setLeft(0);
    obj.radioButton67:setTop(0);
    obj.radioButton67:setGroupName("grupo1");
    obj.radioButton67:setField("dado1");
    obj.radioButton67:setFieldValue("total1_10");
    obj.radioButton67:setName("radioButton67");

    obj.radioButton68 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton68:setParent(obj.layout37);
    obj.radioButton68:setLeft(0);
    obj.radioButton68:setTop(15);
    obj.radioButton68:setGroupName("grupo2");
    obj.radioButton68:setField("dado2");
    obj.radioButton68:setFieldValue("total1_10");
    obj.radioButton68:setName("radioButton68");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout37);
    obj.edit166:setLeft(20);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(100);
    obj.edit166:setHeight(25);
    obj.edit166:setField("nome1_10");
    obj.edit166:setName("edit166");

    obj.rectangle37 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle37:setParent(obj.layout37);
    obj.rectangle37:setLeft(125);
    obj.rectangle37:setTop(0);
    obj.rectangle37:setWidth(40);
    obj.rectangle37:setHeight(25);
    obj.rectangle37:setColor("Black");
    obj.rectangle37:setStrokeColor("white");
    obj.rectangle37:setStrokeSize(1);
    obj.rectangle37:setName("rectangle37");

    obj.label52 = gui.fromHandle(_obj_newObject("label"));
    obj.label52:setParent(obj.layout37);
    obj.label52:setLeft(125);
    obj.label52:setTop(3);
    obj.label52:setWidth(40);
    obj.label52:setHeight(20);
    obj.label52:setField("total21_10");
    obj.label52:setHorzTextAlign("center");
    obj.label52:setName("label52");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout37);
    obj.edit167:setLeft(170);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(30);
    obj.edit167:setHeight(25);
    obj.edit167:setType("number");
    obj.edit167:setMin(0);
    obj.edit167:setField("base1_10");
    obj.edit167:setName("edit167");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout37);
    obj.edit168:setLeft(205);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(30);
    obj.edit168:setHeight(25);
    obj.edit168:setType("number");
    obj.edit168:setMin(0);
    obj.edit168:setField("bonus1_10");
    obj.edit168:setName("edit168");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout37);
    obj.edit169:setLeft(240);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(30);
    obj.edit169:setHeight(25);
    obj.edit169:setType("number");
    obj.edit169:setMin(0);
    obj.edit169:setField("xp1_10");
    obj.edit169:setName("edit169");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout37);
    obj.edit170:setLeft(20);
    obj.edit170:setTop(28);
    obj.edit170:setWidth(250);
    obj.edit170:setHeight(20);
    obj.edit170:setField("espec1_10");
    obj.edit170:setName("edit170");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout27);
    obj.layout38:setLeft(5);
    obj.layout38:setTop(550);
    obj.layout38:setWidth(270);
    obj.layout38:setHeight(50);
    obj.layout38:setName("layout38");

    obj.radioButton69 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton69:setParent(obj.layout38);
    obj.radioButton69:setLeft(0);
    obj.radioButton69:setTop(0);
    obj.radioButton69:setGroupName("grupo1");
    obj.radioButton69:setField("dado1");
    obj.radioButton69:setFieldValue("total1_11");
    obj.radioButton69:setName("radioButton69");

    obj.radioButton70 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton70:setParent(obj.layout38);
    obj.radioButton70:setLeft(0);
    obj.radioButton70:setTop(15);
    obj.radioButton70:setGroupName("grupo2");
    obj.radioButton70:setField("dado2");
    obj.radioButton70:setFieldValue("total1_11");
    obj.radioButton70:setName("radioButton70");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout38);
    obj.edit171:setLeft(20);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(100);
    obj.edit171:setHeight(25);
    obj.edit171:setField("nome1_11");
    obj.edit171:setName("edit171");

    obj.rectangle38 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle38:setParent(obj.layout38);
    obj.rectangle38:setLeft(125);
    obj.rectangle38:setTop(0);
    obj.rectangle38:setWidth(40);
    obj.rectangle38:setHeight(25);
    obj.rectangle38:setColor("Black");
    obj.rectangle38:setStrokeColor("white");
    obj.rectangle38:setStrokeSize(1);
    obj.rectangle38:setName("rectangle38");

    obj.label53 = gui.fromHandle(_obj_newObject("label"));
    obj.label53:setParent(obj.layout38);
    obj.label53:setLeft(125);
    obj.label53:setTop(3);
    obj.label53:setWidth(40);
    obj.label53:setHeight(20);
    obj.label53:setField("total21_11");
    obj.label53:setHorzTextAlign("center");
    obj.label53:setName("label53");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout38);
    obj.edit172:setLeft(170);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(30);
    obj.edit172:setHeight(25);
    obj.edit172:setType("number");
    obj.edit172:setMin(0);
    obj.edit172:setField("base1_11");
    obj.edit172:setName("edit172");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout38);
    obj.edit173:setLeft(205);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(30);
    obj.edit173:setHeight(25);
    obj.edit173:setType("number");
    obj.edit173:setMin(0);
    obj.edit173:setField("bonus1_11");
    obj.edit173:setName("edit173");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout38);
    obj.edit174:setLeft(240);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(30);
    obj.edit174:setHeight(25);
    obj.edit174:setType("number");
    obj.edit174:setMin(0);
    obj.edit174:setField("xp1_11");
    obj.edit174:setName("edit174");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout38);
    obj.edit175:setLeft(20);
    obj.edit175:setTop(28);
    obj.edit175:setWidth(250);
    obj.edit175:setHeight(20);
    obj.edit175:setField("espec1_11");
    obj.edit175:setName("edit175");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout27);
    obj.layout39:setLeft(5);
    obj.layout39:setTop(600);
    obj.layout39:setWidth(270);
    obj.layout39:setHeight(50);
    obj.layout39:setName("layout39");

    obj.radioButton71 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton71:setParent(obj.layout39);
    obj.radioButton71:setLeft(0);
    obj.radioButton71:setTop(0);
    obj.radioButton71:setGroupName("grupo1");
    obj.radioButton71:setField("dado1");
    obj.radioButton71:setFieldValue("total1_12");
    obj.radioButton71:setName("radioButton71");

    obj.radioButton72 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton72:setParent(obj.layout39);
    obj.radioButton72:setLeft(0);
    obj.radioButton72:setTop(15);
    obj.radioButton72:setGroupName("grupo2");
    obj.radioButton72:setField("dado2");
    obj.radioButton72:setFieldValue("total1_12");
    obj.radioButton72:setName("radioButton72");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout39);
    obj.edit176:setLeft(20);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(100);
    obj.edit176:setHeight(25);
    obj.edit176:setField("nome1_12");
    obj.edit176:setName("edit176");

    obj.rectangle39 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle39:setParent(obj.layout39);
    obj.rectangle39:setLeft(125);
    obj.rectangle39:setTop(0);
    obj.rectangle39:setWidth(40);
    obj.rectangle39:setHeight(25);
    obj.rectangle39:setColor("Black");
    obj.rectangle39:setStrokeColor("white");
    obj.rectangle39:setStrokeSize(1);
    obj.rectangle39:setName("rectangle39");

    obj.label54 = gui.fromHandle(_obj_newObject("label"));
    obj.label54:setParent(obj.layout39);
    obj.label54:setLeft(125);
    obj.label54:setTop(3);
    obj.label54:setWidth(40);
    obj.label54:setHeight(20);
    obj.label54:setField("total21_12");
    obj.label54:setHorzTextAlign("center");
    obj.label54:setName("label54");

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout39);
    obj.edit177:setLeft(170);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(30);
    obj.edit177:setHeight(25);
    obj.edit177:setType("number");
    obj.edit177:setMin(0);
    obj.edit177:setField("base1_12");
    obj.edit177:setName("edit177");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout39);
    obj.edit178:setLeft(205);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(30);
    obj.edit178:setHeight(25);
    obj.edit178:setType("number");
    obj.edit178:setMin(0);
    obj.edit178:setField("bonus1_12");
    obj.edit178:setName("edit178");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout39);
    obj.edit179:setLeft(240);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(30);
    obj.edit179:setHeight(25);
    obj.edit179:setType("number");
    obj.edit179:setMin(0);
    obj.edit179:setField("xp1_12");
    obj.edit179:setName("edit179");

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout39);
    obj.edit180:setLeft(20);
    obj.edit180:setTop(28);
    obj.edit180:setWidth(250);
    obj.edit180:setHeight(20);
    obj.edit180:setField("espec1_12");
    obj.edit180:setName("edit180");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.scrollBox1);
    obj.layout40:setLeft(900);
    obj.layout40:setTop(0);
    obj.layout40:setWidth(280);
    obj.layout40:setHeight(630);
    obj.layout40:setName("layout40");

    obj.rectangle40 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle40:setParent(obj.layout40);
    obj.rectangle40:setLeft(0);
    obj.rectangle40:setTop(0);
    obj.rectangle40:setWidth(280);
    obj.rectangle40:setHeight(630);
    obj.rectangle40:setColor("black");
    obj.rectangle40:setXradius(15);
    obj.rectangle40:setYradius(15);
    obj.rectangle40:setCornerType("round");
    obj.rectangle40:setName("rectangle40");

    obj.label55 = gui.fromHandle(_obj_newObject("label"));
    obj.label55:setParent(obj.layout40);
    obj.label55:setLeft(5);
    obj.label55:setTop(0);
    obj.label55:setWidth(240);
    obj.label55:setHeight(20);
    obj.label55:setText("CONHECIMENTOS MENTAIS");
    obj.label55:setHorzTextAlign("center");
    obj.label55:setName("label55");

    obj.label56 = gui.fromHandle(_obj_newObject("label"));
    obj.label56:setParent(obj.layout40);
    obj.label56:setLeft(25);
    obj.label56:setTop(25);
    obj.label56:setWidth(315);
    obj.label56:setHeight(20);
    obj.label56:setText(" Nome");
    obj.label56:setName("label56");

    obj.label57 = gui.fromHandle(_obj_newObject("label"));
    obj.label57:setParent(obj.layout40);
    obj.label57:setLeft(135);
    obj.label57:setTop(25);
    obj.label57:setWidth(315);
    obj.label57:setHeight(20);
    obj.label57:setText("Total");
    obj.label57:setName("label57");

    obj.label58 = gui.fromHandle(_obj_newObject("label"));
    obj.label58:setParent(obj.layout40);
    obj.label58:setLeft(170);
    obj.label58:setTop(25);
    obj.label58:setWidth(315);
    obj.label58:setHeight(20);
    obj.label58:setText(" Inic");
    obj.label58:setName("label58");

    obj.label59 = gui.fromHandle(_obj_newObject("label"));
    obj.label59:setParent(obj.layout40);
    obj.label59:setLeft(202);
    obj.label59:setTop(25);
    obj.label59:setWidth(315);
    obj.label59:setHeight(20);
    obj.label59:setText(" Apr.");
    obj.label59:setName("label59");

    obj.label60 = gui.fromHandle(_obj_newObject("label"));
    obj.label60:setParent(obj.layout40);
    obj.label60:setLeft(235);
    obj.label60:setTop(25);
    obj.label60:setWidth(315);
    obj.label60:setHeight(20);
    obj.label60:setText("  XP");
    obj.label60:setName("label60");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout40);
    obj.layout41:setLeft(5);
    obj.layout41:setTop(50);
    obj.layout41:setWidth(270);
    obj.layout41:setHeight(50);
    obj.layout41:setName("layout41");

    obj.radioButton73 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton73:setParent(obj.layout41);
    obj.radioButton73:setLeft(0);
    obj.radioButton73:setTop(0);
    obj.radioButton73:setGroupName("grupo1");
    obj.radioButton73:setField("dado1");
    obj.radioButton73:setFieldValue("total3_1");
    obj.radioButton73:setName("radioButton73");

    obj.radioButton74 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton74:setParent(obj.layout41);
    obj.radioButton74:setLeft(0);
    obj.radioButton74:setTop(15);
    obj.radioButton74:setGroupName("grupo2");
    obj.radioButton74:setField("dado2");
    obj.radioButton74:setFieldValue("total3_1");
    obj.radioButton74:setName("radioButton74");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout41);
    obj.edit181:setLeft(20);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(100);
    obj.edit181:setHeight(25);
    obj.edit181:setField("nome3_1");
    obj.edit181:setName("edit181");

    obj.rectangle41 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle41:setParent(obj.layout41);
    obj.rectangle41:setLeft(125);
    obj.rectangle41:setTop(0);
    obj.rectangle41:setWidth(40);
    obj.rectangle41:setHeight(25);
    obj.rectangle41:setColor("Black");
    obj.rectangle41:setStrokeColor("white");
    obj.rectangle41:setStrokeSize(1);
    obj.rectangle41:setName("rectangle41");

    obj.label61 = gui.fromHandle(_obj_newObject("label"));
    obj.label61:setParent(obj.layout41);
    obj.label61:setLeft(125);
    obj.label61:setTop(3);
    obj.label61:setWidth(40);
    obj.label61:setHeight(20);
    obj.label61:setField("total23_1");
    obj.label61:setHorzTextAlign("center");
    obj.label61:setName("label61");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout41);
    obj.edit182:setLeft(170);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(30);
    obj.edit182:setHeight(25);
    obj.edit182:setType("number");
    obj.edit182:setMin(0);
    obj.edit182:setField("base3_1");
    obj.edit182:setName("edit182");

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout41);
    obj.edit183:setLeft(205);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(30);
    obj.edit183:setHeight(25);
    obj.edit183:setType("number");
    obj.edit183:setMin(0);
    obj.edit183:setField("bonus3_1");
    obj.edit183:setName("edit183");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout41);
    obj.edit184:setLeft(240);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(30);
    obj.edit184:setHeight(25);
    obj.edit184:setType("number");
    obj.edit184:setMin(0);
    obj.edit184:setField("xp3_1");
    obj.edit184:setName("edit184");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout41);
    obj.edit185:setLeft(20);
    obj.edit185:setTop(28);
    obj.edit185:setWidth(250);
    obj.edit185:setHeight(20);
    obj.edit185:setField("espec3_1");
    obj.edit185:setName("edit185");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout40);
    obj.layout42:setLeft(5);
    obj.layout42:setTop(100);
    obj.layout42:setWidth(270);
    obj.layout42:setHeight(50);
    obj.layout42:setName("layout42");

    obj.radioButton75 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton75:setParent(obj.layout42);
    obj.radioButton75:setLeft(0);
    obj.radioButton75:setTop(0);
    obj.radioButton75:setGroupName("grupo1");
    obj.radioButton75:setField("dado1");
    obj.radioButton75:setFieldValue("total3_2");
    obj.radioButton75:setName("radioButton75");

    obj.radioButton76 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton76:setParent(obj.layout42);
    obj.radioButton76:setLeft(0);
    obj.radioButton76:setTop(15);
    obj.radioButton76:setGroupName("grupo2");
    obj.radioButton76:setField("dado2");
    obj.radioButton76:setFieldValue("total3_2");
    obj.radioButton76:setName("radioButton76");

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout42);
    obj.edit186:setLeft(20);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(100);
    obj.edit186:setHeight(25);
    obj.edit186:setField("nome3_2");
    obj.edit186:setName("edit186");

    obj.rectangle42 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle42:setParent(obj.layout42);
    obj.rectangle42:setLeft(125);
    obj.rectangle42:setTop(0);
    obj.rectangle42:setWidth(40);
    obj.rectangle42:setHeight(25);
    obj.rectangle42:setColor("Black");
    obj.rectangle42:setStrokeColor("white");
    obj.rectangle42:setStrokeSize(1);
    obj.rectangle42:setName("rectangle42");

    obj.label62 = gui.fromHandle(_obj_newObject("label"));
    obj.label62:setParent(obj.layout42);
    obj.label62:setLeft(125);
    obj.label62:setTop(3);
    obj.label62:setWidth(40);
    obj.label62:setHeight(20);
    obj.label62:setField("total23_2");
    obj.label62:setHorzTextAlign("center");
    obj.label62:setName("label62");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout42);
    obj.edit187:setLeft(170);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(30);
    obj.edit187:setHeight(25);
    obj.edit187:setType("number");
    obj.edit187:setMin(0);
    obj.edit187:setField("base3_2");
    obj.edit187:setName("edit187");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout42);
    obj.edit188:setLeft(205);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(30);
    obj.edit188:setHeight(25);
    obj.edit188:setType("number");
    obj.edit188:setMin(0);
    obj.edit188:setField("bonus3_2");
    obj.edit188:setName("edit188");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout42);
    obj.edit189:setLeft(240);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(30);
    obj.edit189:setHeight(25);
    obj.edit189:setType("number");
    obj.edit189:setMin(0);
    obj.edit189:setField("xp3_2");
    obj.edit189:setName("edit189");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout42);
    obj.edit190:setLeft(20);
    obj.edit190:setTop(28);
    obj.edit190:setWidth(250);
    obj.edit190:setHeight(20);
    obj.edit190:setField("espec3_2");
    obj.edit190:setName("edit190");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout40);
    obj.layout43:setLeft(5);
    obj.layout43:setTop(150);
    obj.layout43:setWidth(270);
    obj.layout43:setHeight(50);
    obj.layout43:setName("layout43");

    obj.radioButton77 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton77:setParent(obj.layout43);
    obj.radioButton77:setLeft(0);
    obj.radioButton77:setTop(0);
    obj.radioButton77:setGroupName("grupo1");
    obj.radioButton77:setField("dado1");
    obj.radioButton77:setFieldValue("total3_3");
    obj.radioButton77:setName("radioButton77");

    obj.radioButton78 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton78:setParent(obj.layout43);
    obj.radioButton78:setLeft(0);
    obj.radioButton78:setTop(15);
    obj.radioButton78:setGroupName("grupo2");
    obj.radioButton78:setField("dado2");
    obj.radioButton78:setFieldValue("total3_3");
    obj.radioButton78:setName("radioButton78");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout43);
    obj.edit191:setLeft(20);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(100);
    obj.edit191:setHeight(25);
    obj.edit191:setField("nome3_3");
    obj.edit191:setName("edit191");

    obj.rectangle43 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle43:setParent(obj.layout43);
    obj.rectangle43:setLeft(125);
    obj.rectangle43:setTop(0);
    obj.rectangle43:setWidth(40);
    obj.rectangle43:setHeight(25);
    obj.rectangle43:setColor("Black");
    obj.rectangle43:setStrokeColor("white");
    obj.rectangle43:setStrokeSize(1);
    obj.rectangle43:setName("rectangle43");

    obj.label63 = gui.fromHandle(_obj_newObject("label"));
    obj.label63:setParent(obj.layout43);
    obj.label63:setLeft(125);
    obj.label63:setTop(3);
    obj.label63:setWidth(40);
    obj.label63:setHeight(20);
    obj.label63:setField("total23_3");
    obj.label63:setHorzTextAlign("center");
    obj.label63:setName("label63");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout43);
    obj.edit192:setLeft(170);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(30);
    obj.edit192:setHeight(25);
    obj.edit192:setType("number");
    obj.edit192:setMin(0);
    obj.edit192:setField("base3_3");
    obj.edit192:setName("edit192");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout43);
    obj.edit193:setLeft(205);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(30);
    obj.edit193:setHeight(25);
    obj.edit193:setType("number");
    obj.edit193:setMin(0);
    obj.edit193:setField("bonus3_3");
    obj.edit193:setName("edit193");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout43);
    obj.edit194:setLeft(240);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(30);
    obj.edit194:setHeight(25);
    obj.edit194:setType("number");
    obj.edit194:setMin(0);
    obj.edit194:setField("xp3_3");
    obj.edit194:setName("edit194");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout43);
    obj.edit195:setLeft(20);
    obj.edit195:setTop(28);
    obj.edit195:setWidth(250);
    obj.edit195:setHeight(20);
    obj.edit195:setField("espec3_3");
    obj.edit195:setName("edit195");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout40);
    obj.layout44:setLeft(5);
    obj.layout44:setTop(200);
    obj.layout44:setWidth(270);
    obj.layout44:setHeight(50);
    obj.layout44:setName("layout44");

    obj.radioButton79 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton79:setParent(obj.layout44);
    obj.radioButton79:setLeft(0);
    obj.radioButton79:setTop(0);
    obj.radioButton79:setGroupName("grupo1");
    obj.radioButton79:setField("dado1");
    obj.radioButton79:setFieldValue("total3_4");
    obj.radioButton79:setName("radioButton79");

    obj.radioButton80 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton80:setParent(obj.layout44);
    obj.radioButton80:setLeft(0);
    obj.radioButton80:setTop(15);
    obj.radioButton80:setGroupName("grupo2");
    obj.radioButton80:setField("dado2");
    obj.radioButton80:setFieldValue("total3_4");
    obj.radioButton80:setName("radioButton80");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout44);
    obj.edit196:setLeft(20);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(100);
    obj.edit196:setHeight(25);
    obj.edit196:setField("nome3_4");
    obj.edit196:setName("edit196");

    obj.rectangle44 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle44:setParent(obj.layout44);
    obj.rectangle44:setLeft(125);
    obj.rectangle44:setTop(0);
    obj.rectangle44:setWidth(40);
    obj.rectangle44:setHeight(25);
    obj.rectangle44:setColor("Black");
    obj.rectangle44:setStrokeColor("white");
    obj.rectangle44:setStrokeSize(1);
    obj.rectangle44:setName("rectangle44");

    obj.label64 = gui.fromHandle(_obj_newObject("label"));
    obj.label64:setParent(obj.layout44);
    obj.label64:setLeft(125);
    obj.label64:setTop(3);
    obj.label64:setWidth(40);
    obj.label64:setHeight(20);
    obj.label64:setField("total23_4");
    obj.label64:setHorzTextAlign("center");
    obj.label64:setName("label64");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout44);
    obj.edit197:setLeft(170);
    obj.edit197:setTop(0);
    obj.edit197:setWidth(30);
    obj.edit197:setHeight(25);
    obj.edit197:setType("number");
    obj.edit197:setMin(0);
    obj.edit197:setField("base3_4");
    obj.edit197:setName("edit197");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout44);
    obj.edit198:setLeft(205);
    obj.edit198:setTop(0);
    obj.edit198:setWidth(30);
    obj.edit198:setHeight(25);
    obj.edit198:setType("number");
    obj.edit198:setMin(0);
    obj.edit198:setField("bonus3_4");
    obj.edit198:setName("edit198");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout44);
    obj.edit199:setLeft(240);
    obj.edit199:setTop(0);
    obj.edit199:setWidth(30);
    obj.edit199:setHeight(25);
    obj.edit199:setType("number");
    obj.edit199:setMin(0);
    obj.edit199:setField("xp3_4");
    obj.edit199:setName("edit199");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout44);
    obj.edit200:setLeft(20);
    obj.edit200:setTop(28);
    obj.edit200:setWidth(250);
    obj.edit200:setHeight(20);
    obj.edit200:setField("espec3_4");
    obj.edit200:setName("edit200");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout40);
    obj.layout45:setLeft(5);
    obj.layout45:setTop(250);
    obj.layout45:setWidth(270);
    obj.layout45:setHeight(50);
    obj.layout45:setName("layout45");

    obj.radioButton81 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton81:setParent(obj.layout45);
    obj.radioButton81:setLeft(0);
    obj.radioButton81:setTop(0);
    obj.radioButton81:setGroupName("grupo1");
    obj.radioButton81:setField("dado1");
    obj.radioButton81:setFieldValue("total3_5");
    obj.radioButton81:setName("radioButton81");

    obj.radioButton82 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton82:setParent(obj.layout45);
    obj.radioButton82:setLeft(0);
    obj.radioButton82:setTop(15);
    obj.radioButton82:setGroupName("grupo2");
    obj.radioButton82:setField("dado2");
    obj.radioButton82:setFieldValue("total3_5");
    obj.radioButton82:setName("radioButton82");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout45);
    obj.edit201:setLeft(20);
    obj.edit201:setTop(0);
    obj.edit201:setWidth(100);
    obj.edit201:setHeight(25);
    obj.edit201:setField("nome3_5");
    obj.edit201:setName("edit201");

    obj.rectangle45 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle45:setParent(obj.layout45);
    obj.rectangle45:setLeft(125);
    obj.rectangle45:setTop(0);
    obj.rectangle45:setWidth(40);
    obj.rectangle45:setHeight(25);
    obj.rectangle45:setColor("Black");
    obj.rectangle45:setStrokeColor("white");
    obj.rectangle45:setStrokeSize(1);
    obj.rectangle45:setName("rectangle45");

    obj.label65 = gui.fromHandle(_obj_newObject("label"));
    obj.label65:setParent(obj.layout45);
    obj.label65:setLeft(125);
    obj.label65:setTop(3);
    obj.label65:setWidth(40);
    obj.label65:setHeight(20);
    obj.label65:setField("total23_5");
    obj.label65:setHorzTextAlign("center");
    obj.label65:setName("label65");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout45);
    obj.edit202:setLeft(170);
    obj.edit202:setTop(0);
    obj.edit202:setWidth(30);
    obj.edit202:setHeight(25);
    obj.edit202:setType("number");
    obj.edit202:setMin(0);
    obj.edit202:setField("base3_5");
    obj.edit202:setName("edit202");

    obj.edit203 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit203:setParent(obj.layout45);
    obj.edit203:setLeft(205);
    obj.edit203:setTop(0);
    obj.edit203:setWidth(30);
    obj.edit203:setHeight(25);
    obj.edit203:setType("number");
    obj.edit203:setMin(0);
    obj.edit203:setField("bonus3_5");
    obj.edit203:setName("edit203");

    obj.edit204 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit204:setParent(obj.layout45);
    obj.edit204:setLeft(240);
    obj.edit204:setTop(0);
    obj.edit204:setWidth(30);
    obj.edit204:setHeight(25);
    obj.edit204:setType("number");
    obj.edit204:setMin(0);
    obj.edit204:setField("xp3_5");
    obj.edit204:setName("edit204");

    obj.edit205 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit205:setParent(obj.layout45);
    obj.edit205:setLeft(20);
    obj.edit205:setTop(28);
    obj.edit205:setWidth(250);
    obj.edit205:setHeight(20);
    obj.edit205:setField("espec3_5");
    obj.edit205:setName("edit205");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout40);
    obj.layout46:setLeft(5);
    obj.layout46:setTop(300);
    obj.layout46:setWidth(270);
    obj.layout46:setHeight(50);
    obj.layout46:setName("layout46");

    obj.radioButton83 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton83:setParent(obj.layout46);
    obj.radioButton83:setLeft(0);
    obj.radioButton83:setTop(0);
    obj.radioButton83:setGroupName("grupo1");
    obj.radioButton83:setField("dado1");
    obj.radioButton83:setFieldValue("total3_6");
    obj.radioButton83:setName("radioButton83");

    obj.radioButton84 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton84:setParent(obj.layout46);
    obj.radioButton84:setLeft(0);
    obj.radioButton84:setTop(15);
    obj.radioButton84:setGroupName("grupo2");
    obj.radioButton84:setField("dado2");
    obj.radioButton84:setFieldValue("total3_6");
    obj.radioButton84:setName("radioButton84");

    obj.edit206 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit206:setParent(obj.layout46);
    obj.edit206:setLeft(20);
    obj.edit206:setTop(0);
    obj.edit206:setWidth(100);
    obj.edit206:setHeight(25);
    obj.edit206:setField("nome3_6");
    obj.edit206:setName("edit206");

    obj.rectangle46 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle46:setParent(obj.layout46);
    obj.rectangle46:setLeft(125);
    obj.rectangle46:setTop(0);
    obj.rectangle46:setWidth(40);
    obj.rectangle46:setHeight(25);
    obj.rectangle46:setColor("Black");
    obj.rectangle46:setStrokeColor("white");
    obj.rectangle46:setStrokeSize(1);
    obj.rectangle46:setName("rectangle46");

    obj.label66 = gui.fromHandle(_obj_newObject("label"));
    obj.label66:setParent(obj.layout46);
    obj.label66:setLeft(125);
    obj.label66:setTop(3);
    obj.label66:setWidth(40);
    obj.label66:setHeight(20);
    obj.label66:setField("total23_6");
    obj.label66:setHorzTextAlign("center");
    obj.label66:setName("label66");

    obj.edit207 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit207:setParent(obj.layout46);
    obj.edit207:setLeft(170);
    obj.edit207:setTop(0);
    obj.edit207:setWidth(30);
    obj.edit207:setHeight(25);
    obj.edit207:setType("number");
    obj.edit207:setMin(0);
    obj.edit207:setField("base3_6");
    obj.edit207:setName("edit207");

    obj.edit208 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit208:setParent(obj.layout46);
    obj.edit208:setLeft(205);
    obj.edit208:setTop(0);
    obj.edit208:setWidth(30);
    obj.edit208:setHeight(25);
    obj.edit208:setType("number");
    obj.edit208:setMin(0);
    obj.edit208:setField("bonus3_6");
    obj.edit208:setName("edit208");

    obj.edit209 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit209:setParent(obj.layout46);
    obj.edit209:setLeft(240);
    obj.edit209:setTop(0);
    obj.edit209:setWidth(30);
    obj.edit209:setHeight(25);
    obj.edit209:setType("number");
    obj.edit209:setMin(0);
    obj.edit209:setField("xp3_6");
    obj.edit209:setName("edit209");

    obj.edit210 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit210:setParent(obj.layout46);
    obj.edit210:setLeft(20);
    obj.edit210:setTop(28);
    obj.edit210:setWidth(250);
    obj.edit210:setHeight(20);
    obj.edit210:setField("espec3_6");
    obj.edit210:setName("edit210");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout40);
    obj.layout47:setLeft(5);
    obj.layout47:setTop(350);
    obj.layout47:setWidth(270);
    obj.layout47:setHeight(50);
    obj.layout47:setName("layout47");

    obj.radioButton85 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton85:setParent(obj.layout47);
    obj.radioButton85:setLeft(0);
    obj.radioButton85:setTop(0);
    obj.radioButton85:setGroupName("grupo1");
    obj.radioButton85:setField("dado1");
    obj.radioButton85:setFieldValue("total3_7");
    obj.radioButton85:setName("radioButton85");

    obj.radioButton86 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton86:setParent(obj.layout47);
    obj.radioButton86:setLeft(0);
    obj.radioButton86:setTop(15);
    obj.radioButton86:setGroupName("grupo2");
    obj.radioButton86:setField("dado2");
    obj.radioButton86:setFieldValue("total3_7");
    obj.radioButton86:setName("radioButton86");

    obj.edit211 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit211:setParent(obj.layout47);
    obj.edit211:setLeft(20);
    obj.edit211:setTop(0);
    obj.edit211:setWidth(100);
    obj.edit211:setHeight(25);
    obj.edit211:setField("nome3_7");
    obj.edit211:setName("edit211");

    obj.rectangle47 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle47:setParent(obj.layout47);
    obj.rectangle47:setLeft(125);
    obj.rectangle47:setTop(0);
    obj.rectangle47:setWidth(40);
    obj.rectangle47:setHeight(25);
    obj.rectangle47:setColor("Black");
    obj.rectangle47:setStrokeColor("white");
    obj.rectangle47:setStrokeSize(1);
    obj.rectangle47:setName("rectangle47");

    obj.label67 = gui.fromHandle(_obj_newObject("label"));
    obj.label67:setParent(obj.layout47);
    obj.label67:setLeft(125);
    obj.label67:setTop(3);
    obj.label67:setWidth(40);
    obj.label67:setHeight(20);
    obj.label67:setField("total23_7");
    obj.label67:setHorzTextAlign("center");
    obj.label67:setName("label67");

    obj.edit212 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit212:setParent(obj.layout47);
    obj.edit212:setLeft(170);
    obj.edit212:setTop(0);
    obj.edit212:setWidth(30);
    obj.edit212:setHeight(25);
    obj.edit212:setType("number");
    obj.edit212:setMin(0);
    obj.edit212:setField("base3_7");
    obj.edit212:setName("edit212");

    obj.edit213 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit213:setParent(obj.layout47);
    obj.edit213:setLeft(205);
    obj.edit213:setTop(0);
    obj.edit213:setWidth(30);
    obj.edit213:setHeight(25);
    obj.edit213:setType("number");
    obj.edit213:setMin(0);
    obj.edit213:setField("bonus3_7");
    obj.edit213:setName("edit213");

    obj.edit214 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit214:setParent(obj.layout47);
    obj.edit214:setLeft(240);
    obj.edit214:setTop(0);
    obj.edit214:setWidth(30);
    obj.edit214:setHeight(25);
    obj.edit214:setType("number");
    obj.edit214:setMin(0);
    obj.edit214:setField("xp3_7");
    obj.edit214:setName("edit214");

    obj.edit215 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit215:setParent(obj.layout47);
    obj.edit215:setLeft(20);
    obj.edit215:setTop(28);
    obj.edit215:setWidth(250);
    obj.edit215:setHeight(20);
    obj.edit215:setField("espec3_7");
    obj.edit215:setName("edit215");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout40);
    obj.layout48:setLeft(5);
    obj.layout48:setTop(400);
    obj.layout48:setWidth(270);
    obj.layout48:setHeight(50);
    obj.layout48:setName("layout48");

    obj.radioButton87 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton87:setParent(obj.layout48);
    obj.radioButton87:setLeft(0);
    obj.radioButton87:setTop(0);
    obj.radioButton87:setGroupName("grupo1");
    obj.radioButton87:setField("dado1");
    obj.radioButton87:setFieldValue("total3_8");
    obj.radioButton87:setName("radioButton87");

    obj.radioButton88 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton88:setParent(obj.layout48);
    obj.radioButton88:setLeft(0);
    obj.radioButton88:setTop(15);
    obj.radioButton88:setGroupName("grupo2");
    obj.radioButton88:setField("dado2");
    obj.radioButton88:setFieldValue("total3_8");
    obj.radioButton88:setName("radioButton88");

    obj.edit216 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit216:setParent(obj.layout48);
    obj.edit216:setLeft(20);
    obj.edit216:setTop(0);
    obj.edit216:setWidth(100);
    obj.edit216:setHeight(25);
    obj.edit216:setField("nome3_8");
    obj.edit216:setName("edit216");

    obj.rectangle48 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle48:setParent(obj.layout48);
    obj.rectangle48:setLeft(125);
    obj.rectangle48:setTop(0);
    obj.rectangle48:setWidth(40);
    obj.rectangle48:setHeight(25);
    obj.rectangle48:setColor("Black");
    obj.rectangle48:setStrokeColor("white");
    obj.rectangle48:setStrokeSize(1);
    obj.rectangle48:setName("rectangle48");

    obj.label68 = gui.fromHandle(_obj_newObject("label"));
    obj.label68:setParent(obj.layout48);
    obj.label68:setLeft(125);
    obj.label68:setTop(3);
    obj.label68:setWidth(40);
    obj.label68:setHeight(20);
    obj.label68:setField("total23_8");
    obj.label68:setHorzTextAlign("center");
    obj.label68:setName("label68");

    obj.edit217 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit217:setParent(obj.layout48);
    obj.edit217:setLeft(170);
    obj.edit217:setTop(0);
    obj.edit217:setWidth(30);
    obj.edit217:setHeight(25);
    obj.edit217:setType("number");
    obj.edit217:setMin(0);
    obj.edit217:setField("base3_8");
    obj.edit217:setName("edit217");

    obj.edit218 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit218:setParent(obj.layout48);
    obj.edit218:setLeft(205);
    obj.edit218:setTop(0);
    obj.edit218:setWidth(30);
    obj.edit218:setHeight(25);
    obj.edit218:setType("number");
    obj.edit218:setMin(0);
    obj.edit218:setField("bonus3_8");
    obj.edit218:setName("edit218");

    obj.edit219 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit219:setParent(obj.layout48);
    obj.edit219:setLeft(240);
    obj.edit219:setTop(0);
    obj.edit219:setWidth(30);
    obj.edit219:setHeight(25);
    obj.edit219:setType("number");
    obj.edit219:setMin(0);
    obj.edit219:setField("xp3_8");
    obj.edit219:setName("edit219");

    obj.edit220 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit220:setParent(obj.layout48);
    obj.edit220:setLeft(20);
    obj.edit220:setTop(28);
    obj.edit220:setWidth(250);
    obj.edit220:setHeight(20);
    obj.edit220:setField("espec3_8");
    obj.edit220:setName("edit220");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.layout40);
    obj.layout49:setLeft(5);
    obj.layout49:setTop(450);
    obj.layout49:setWidth(270);
    obj.layout49:setHeight(50);
    obj.layout49:setName("layout49");

    obj.radioButton89 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton89:setParent(obj.layout49);
    obj.radioButton89:setLeft(0);
    obj.radioButton89:setTop(0);
    obj.radioButton89:setGroupName("grupo1");
    obj.radioButton89:setField("dado1");
    obj.radioButton89:setFieldValue("total3_9");
    obj.radioButton89:setName("radioButton89");

    obj.radioButton90 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton90:setParent(obj.layout49);
    obj.radioButton90:setLeft(0);
    obj.radioButton90:setTop(15);
    obj.radioButton90:setGroupName("grupo2");
    obj.radioButton90:setField("dado2");
    obj.radioButton90:setFieldValue("total3_9");
    obj.radioButton90:setName("radioButton90");

    obj.edit221 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit221:setParent(obj.layout49);
    obj.edit221:setLeft(20);
    obj.edit221:setTop(0);
    obj.edit221:setWidth(100);
    obj.edit221:setHeight(25);
    obj.edit221:setField("nome3_9");
    obj.edit221:setName("edit221");

    obj.rectangle49 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle49:setParent(obj.layout49);
    obj.rectangle49:setLeft(125);
    obj.rectangle49:setTop(0);
    obj.rectangle49:setWidth(40);
    obj.rectangle49:setHeight(25);
    obj.rectangle49:setColor("Black");
    obj.rectangle49:setStrokeColor("white");
    obj.rectangle49:setStrokeSize(1);
    obj.rectangle49:setName("rectangle49");

    obj.label69 = gui.fromHandle(_obj_newObject("label"));
    obj.label69:setParent(obj.layout49);
    obj.label69:setLeft(125);
    obj.label69:setTop(3);
    obj.label69:setWidth(40);
    obj.label69:setHeight(20);
    obj.label69:setField("total23_9");
    obj.label69:setHorzTextAlign("center");
    obj.label69:setName("label69");

    obj.edit222 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit222:setParent(obj.layout49);
    obj.edit222:setLeft(170);
    obj.edit222:setTop(0);
    obj.edit222:setWidth(30);
    obj.edit222:setHeight(25);
    obj.edit222:setType("number");
    obj.edit222:setMin(0);
    obj.edit222:setField("base3_9");
    obj.edit222:setName("edit222");

    obj.edit223 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit223:setParent(obj.layout49);
    obj.edit223:setLeft(205);
    obj.edit223:setTop(0);
    obj.edit223:setWidth(30);
    obj.edit223:setHeight(25);
    obj.edit223:setType("number");
    obj.edit223:setMin(0);
    obj.edit223:setField("bonus3_9");
    obj.edit223:setName("edit223");

    obj.edit224 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit224:setParent(obj.layout49);
    obj.edit224:setLeft(240);
    obj.edit224:setTop(0);
    obj.edit224:setWidth(30);
    obj.edit224:setHeight(25);
    obj.edit224:setType("number");
    obj.edit224:setMin(0);
    obj.edit224:setField("xp3_9");
    obj.edit224:setName("edit224");

    obj.edit225 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit225:setParent(obj.layout49);
    obj.edit225:setLeft(20);
    obj.edit225:setTop(28);
    obj.edit225:setWidth(250);
    obj.edit225:setHeight(20);
    obj.edit225:setField("espec3_9");
    obj.edit225:setName("edit225");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout40);
    obj.layout50:setLeft(5);
    obj.layout50:setTop(500);
    obj.layout50:setWidth(270);
    obj.layout50:setHeight(50);
    obj.layout50:setName("layout50");

    obj.radioButton91 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton91:setParent(obj.layout50);
    obj.radioButton91:setLeft(0);
    obj.radioButton91:setTop(0);
    obj.radioButton91:setGroupName("grupo1");
    obj.radioButton91:setField("dado1");
    obj.radioButton91:setFieldValue("total3_10");
    obj.radioButton91:setName("radioButton91");

    obj.radioButton92 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton92:setParent(obj.layout50);
    obj.radioButton92:setLeft(0);
    obj.radioButton92:setTop(15);
    obj.radioButton92:setGroupName("grupo2");
    obj.radioButton92:setField("dado2");
    obj.radioButton92:setFieldValue("total3_10");
    obj.radioButton92:setName("radioButton92");

    obj.edit226 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit226:setParent(obj.layout50);
    obj.edit226:setLeft(20);
    obj.edit226:setTop(0);
    obj.edit226:setWidth(100);
    obj.edit226:setHeight(25);
    obj.edit226:setField("nome3_10");
    obj.edit226:setName("edit226");

    obj.rectangle50 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle50:setParent(obj.layout50);
    obj.rectangle50:setLeft(125);
    obj.rectangle50:setTop(0);
    obj.rectangle50:setWidth(40);
    obj.rectangle50:setHeight(25);
    obj.rectangle50:setColor("Black");
    obj.rectangle50:setStrokeColor("white");
    obj.rectangle50:setStrokeSize(1);
    obj.rectangle50:setName("rectangle50");

    obj.label70 = gui.fromHandle(_obj_newObject("label"));
    obj.label70:setParent(obj.layout50);
    obj.label70:setLeft(125);
    obj.label70:setTop(3);
    obj.label70:setWidth(40);
    obj.label70:setHeight(20);
    obj.label70:setField("total23_10");
    obj.label70:setHorzTextAlign("center");
    obj.label70:setName("label70");

    obj.edit227 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit227:setParent(obj.layout50);
    obj.edit227:setLeft(170);
    obj.edit227:setTop(0);
    obj.edit227:setWidth(30);
    obj.edit227:setHeight(25);
    obj.edit227:setType("number");
    obj.edit227:setMin(0);
    obj.edit227:setField("base3_10");
    obj.edit227:setName("edit227");

    obj.edit228 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit228:setParent(obj.layout50);
    obj.edit228:setLeft(205);
    obj.edit228:setTop(0);
    obj.edit228:setWidth(30);
    obj.edit228:setHeight(25);
    obj.edit228:setType("number");
    obj.edit228:setMin(0);
    obj.edit228:setField("bonus3_10");
    obj.edit228:setName("edit228");

    obj.edit229 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit229:setParent(obj.layout50);
    obj.edit229:setLeft(240);
    obj.edit229:setTop(0);
    obj.edit229:setWidth(30);
    obj.edit229:setHeight(25);
    obj.edit229:setType("number");
    obj.edit229:setMin(0);
    obj.edit229:setField("xp3_10");
    obj.edit229:setName("edit229");

    obj.edit230 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit230:setParent(obj.layout50);
    obj.edit230:setLeft(20);
    obj.edit230:setTop(28);
    obj.edit230:setWidth(250);
    obj.edit230:setHeight(20);
    obj.edit230:setField("espec3_10");
    obj.edit230:setName("edit230");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout40);
    obj.layout51:setLeft(5);
    obj.layout51:setTop(550);
    obj.layout51:setWidth(270);
    obj.layout51:setHeight(50);
    obj.layout51:setName("layout51");

    obj.radioButton93 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton93:setParent(obj.layout51);
    obj.radioButton93:setLeft(0);
    obj.radioButton93:setTop(0);
    obj.radioButton93:setGroupName("grupo1");
    obj.radioButton93:setField("dado1");
    obj.radioButton93:setFieldValue("total3_11");
    obj.radioButton93:setName("radioButton93");

    obj.radioButton94 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton94:setParent(obj.layout51);
    obj.radioButton94:setLeft(0);
    obj.radioButton94:setTop(15);
    obj.radioButton94:setGroupName("grupo2");
    obj.radioButton94:setField("dado2");
    obj.radioButton94:setFieldValue("total3_11");
    obj.radioButton94:setName("radioButton94");

    obj.edit231 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit231:setParent(obj.layout51);
    obj.edit231:setLeft(20);
    obj.edit231:setTop(0);
    obj.edit231:setWidth(100);
    obj.edit231:setHeight(25);
    obj.edit231:setField("nome3_11");
    obj.edit231:setName("edit231");

    obj.rectangle51 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle51:setParent(obj.layout51);
    obj.rectangle51:setLeft(125);
    obj.rectangle51:setTop(0);
    obj.rectangle51:setWidth(40);
    obj.rectangle51:setHeight(25);
    obj.rectangle51:setColor("Black");
    obj.rectangle51:setStrokeColor("white");
    obj.rectangle51:setStrokeSize(1);
    obj.rectangle51:setName("rectangle51");

    obj.label71 = gui.fromHandle(_obj_newObject("label"));
    obj.label71:setParent(obj.layout51);
    obj.label71:setLeft(125);
    obj.label71:setTop(3);
    obj.label71:setWidth(40);
    obj.label71:setHeight(20);
    obj.label71:setField("total23_11");
    obj.label71:setHorzTextAlign("center");
    obj.label71:setName("label71");

    obj.edit232 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit232:setParent(obj.layout51);
    obj.edit232:setLeft(170);
    obj.edit232:setTop(0);
    obj.edit232:setWidth(30);
    obj.edit232:setHeight(25);
    obj.edit232:setType("number");
    obj.edit232:setMin(0);
    obj.edit232:setField("base3_11");
    obj.edit232:setName("edit232");

    obj.edit233 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit233:setParent(obj.layout51);
    obj.edit233:setLeft(205);
    obj.edit233:setTop(0);
    obj.edit233:setWidth(30);
    obj.edit233:setHeight(25);
    obj.edit233:setType("number");
    obj.edit233:setMin(0);
    obj.edit233:setField("bonus3_11");
    obj.edit233:setName("edit233");

    obj.edit234 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit234:setParent(obj.layout51);
    obj.edit234:setLeft(240);
    obj.edit234:setTop(0);
    obj.edit234:setWidth(30);
    obj.edit234:setHeight(25);
    obj.edit234:setType("number");
    obj.edit234:setMin(0);
    obj.edit234:setField("xp3_11");
    obj.edit234:setName("edit234");

    obj.edit235 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit235:setParent(obj.layout51);
    obj.edit235:setLeft(20);
    obj.edit235:setTop(28);
    obj.edit235:setWidth(250);
    obj.edit235:setHeight(20);
    obj.edit235:setField("espec3_11");
    obj.edit235:setName("edit235");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout40);
    obj.layout52:setLeft(5);
    obj.layout52:setTop(600);
    obj.layout52:setWidth(270);
    obj.layout52:setHeight(50);
    obj.layout52:setName("layout52");

    obj.radioButton95 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton95:setParent(obj.layout52);
    obj.radioButton95:setLeft(0);
    obj.radioButton95:setTop(0);
    obj.radioButton95:setGroupName("grupo1");
    obj.radioButton95:setField("dado1");
    obj.radioButton95:setFieldValue("total3_12");
    obj.radioButton95:setName("radioButton95");

    obj.radioButton96 = gui.fromHandle(_obj_newObject("radioButton"));
    obj.radioButton96:setParent(obj.layout52);
    obj.radioButton96:setLeft(0);
    obj.radioButton96:setTop(15);
    obj.radioButton96:setGroupName("grupo2");
    obj.radioButton96:setField("dado2");
    obj.radioButton96:setFieldValue("total3_12");
    obj.radioButton96:setName("radioButton96");

    obj.edit236 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit236:setParent(obj.layout52);
    obj.edit236:setLeft(20);
    obj.edit236:setTop(0);
    obj.edit236:setWidth(100);
    obj.edit236:setHeight(25);
    obj.edit236:setField("nome3_12");
    obj.edit236:setName("edit236");

    obj.rectangle52 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle52:setParent(obj.layout52);
    obj.rectangle52:setLeft(125);
    obj.rectangle52:setTop(0);
    obj.rectangle52:setWidth(40);
    obj.rectangle52:setHeight(25);
    obj.rectangle52:setColor("Black");
    obj.rectangle52:setStrokeColor("white");
    obj.rectangle52:setStrokeSize(1);
    obj.rectangle52:setName("rectangle52");

    obj.label72 = gui.fromHandle(_obj_newObject("label"));
    obj.label72:setParent(obj.layout52);
    obj.label72:setLeft(125);
    obj.label72:setTop(3);
    obj.label72:setWidth(40);
    obj.label72:setHeight(20);
    obj.label72:setField("total23_12");
    obj.label72:setHorzTextAlign("center");
    obj.label72:setName("label72");

    obj.edit237 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit237:setParent(obj.layout52);
    obj.edit237:setLeft(170);
    obj.edit237:setTop(0);
    obj.edit237:setWidth(30);
    obj.edit237:setHeight(25);
    obj.edit237:setType("number");
    obj.edit237:setMin(0);
    obj.edit237:setField("base3_12");
    obj.edit237:setName("edit237");

    obj.edit238 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit238:setParent(obj.layout52);
    obj.edit238:setLeft(205);
    obj.edit238:setTop(0);
    obj.edit238:setWidth(30);
    obj.edit238:setHeight(25);
    obj.edit238:setType("number");
    obj.edit238:setMin(0);
    obj.edit238:setField("bonus3_12");
    obj.edit238:setName("edit238");

    obj.edit239 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit239:setParent(obj.layout52);
    obj.edit239:setLeft(240);
    obj.edit239:setTop(0);
    obj.edit239:setWidth(30);
    obj.edit239:setHeight(25);
    obj.edit239:setType("number");
    obj.edit239:setMin(0);
    obj.edit239:setField("xp3_12");
    obj.edit239:setName("edit239");

    obj.edit240 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit240:setParent(obj.layout52);
    obj.edit240:setLeft(20);
    obj.edit240:setTop(28);
    obj.edit240:setWidth(250);
    obj.edit240:setHeight(20);
    obj.edit240:setField("espec3_12");
    obj.edit240:setName("edit240");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.scrollBox1);
    obj.layout53:setLeft(1200);
    obj.layout53:setTop(0);
    obj.layout53:setWidth(110);
    obj.layout53:setHeight(230);
    obj.layout53:setName("layout53");

    obj.rectangle53 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle53:setParent(obj.layout53);
    obj.rectangle53:setLeft(0);
    obj.rectangle53:setTop(0);
    obj.rectangle53:setWidth(110);
    obj.rectangle53:setHeight(230);
    obj.rectangle53:setColor("black");
    obj.rectangle53:setXradius(15);
    obj.rectangle53:setYradius(15);
    obj.rectangle53:setCornerType("round");
    obj.rectangle53:setName("rectangle53");

    obj.label73 = gui.fromHandle(_obj_newObject("label"));
    obj.label73:setParent(obj.layout53);
    obj.label73:setLeft(5);
    obj.label73:setTop(10);
    obj.label73:setWidth(50);
    obj.label73:setHeight(20);
    obj.label73:setText("Dado 1");
    obj.label73:setName("label73");

    obj.rectangle54 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle54:setParent(obj.layout53);
    obj.rectangle54:setLeft(50);
    obj.rectangle54:setTop(8);
    obj.rectangle54:setWidth(35);
    obj.rectangle54:setHeight(25);
    obj.rectangle54:setColor("Black");
    obj.rectangle54:setStrokeColor("white");
    obj.rectangle54:setStrokeSize(1);
    obj.rectangle54:setName("rectangle54");

    obj.label74 = gui.fromHandle(_obj_newObject("label"));
    obj.label74:setParent(obj.layout53);
    obj.label74:setLeft(60);
    obj.label74:setTop(10);
    obj.label74:setWidth(30);
    obj.label74:setHeight(20);
    obj.label74:setField("num1");
    obj.label74:setText("val");
    obj.label74:setName("label74");

    obj.label75 = gui.fromHandle(_obj_newObject("label"));
    obj.label75:setParent(obj.layout53);
    obj.label75:setLeft(63);
    obj.label75:setTop(35);
    obj.label75:setWidth(10);
    obj.label75:setHeight(20);
    obj.label75:setText("+");
    obj.label75:setName("label75");

    obj.label76 = gui.fromHandle(_obj_newObject("label"));
    obj.label76:setParent(obj.layout53);
    obj.label76:setLeft(5);
    obj.label76:setTop(60);
    obj.label76:setWidth(50);
    obj.label76:setHeight(20);
    obj.label76:setText("Dado 2");
    obj.label76:setName("label76");

    obj.rectangle55 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle55:setParent(obj.layout53);
    obj.rectangle55:setLeft(50);
    obj.rectangle55:setTop(58);
    obj.rectangle55:setWidth(35);
    obj.rectangle55:setHeight(25);
    obj.rectangle55:setColor("Black");
    obj.rectangle55:setStrokeColor("white");
    obj.rectangle55:setStrokeSize(1);
    obj.rectangle55:setName("rectangle55");

    obj.label77 = gui.fromHandle(_obj_newObject("label"));
    obj.label77:setParent(obj.layout53);
    obj.label77:setLeft(60);
    obj.label77:setTop(60);
    obj.label77:setWidth(30);
    obj.label77:setHeight(20);
    obj.label77:setField("num2");
    obj.label77:setText("val");
    obj.label77:setName("label77");

    obj.label78 = gui.fromHandle(_obj_newObject("label"));
    obj.label78:setParent(obj.layout53);
    obj.label78:setLeft(63);
    obj.label78:setTop(85);
    obj.label78:setWidth(10);
    obj.label78:setHeight(20);
    obj.label78:setText("+");
    obj.label78:setName("label78");

    obj.label79 = gui.fromHandle(_obj_newObject("label"));
    obj.label79:setParent(obj.layout53);
    obj.label79:setLeft(5);
    obj.label79:setTop(110);
    obj.label79:setWidth(40);
    obj.label79:setHeight(20);
    obj.label79:setText("Especs");
    obj.label79:setName("label79");

    obj.comboBox1 = gui.fromHandle(_obj_newObject("comboBox"));
    obj.comboBox1:setParent(obj.layout53);
    obj.comboBox1:setLeft(50);
    obj.comboBox1:setTop(110);
    obj.comboBox1:setWidth(50);
    obj.comboBox1:setItems({'0', '1,5', '3'});
    obj.comboBox1:setValues({'0', '1', '2'});
    obj.comboBox1:setValue("0");
    obj.comboBox1:setField("especBonus");
    obj.comboBox1:setName("comboBox1");

    obj.label80 = gui.fromHandle(_obj_newObject("label"));
    obj.label80:setParent(obj.layout53);
    obj.label80:setLeft(5);
    obj.label80:setTop(135);
    obj.label80:setWidth(40);
    obj.label80:setHeight(20);
    obj.label80:setText("Extra");
    obj.label80:setName("label80");

    obj.edit241 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit241:setParent(obj.layout53);
    obj.edit241:setLeft(50);
    obj.edit241:setTop(135);
    obj.edit241:setWidth(30);
    obj.edit241:setHeight(25);
    obj.edit241:setField("extra");
    obj.edit241:setName("edit241");

    obj.label81 = gui.fromHandle(_obj_newObject("label"));
    obj.label81:setParent(obj.layout53);
    obj.label81:setLeft(5);
    obj.label81:setTop(165);
    obj.label81:setWidth(40);
    obj.label81:setHeight(20);
    obj.label81:setText("Dific.");
    obj.label81:setName("label81");

    obj.edit242 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit242:setParent(obj.layout53);
    obj.edit242:setLeft(50);
    obj.edit242:setTop(165);
    obj.edit242:setWidth(30);
    obj.edit242:setHeight(25);
    obj.edit242:setField("dificuldade");
    obj.edit242:setType("number");
    obj.edit242:setName("edit242");

    obj.button1 = gui.fromHandle(_obj_newObject("button"));
    obj.button1:setParent(obj.layout53);
    obj.button1:setLeft(30);
    obj.button1:setTop(195);
    obj.button1:setWidth(50);
    obj.button1:setText("ROLAR");
    obj.button1:setName("button1");

    obj._e_event0 = obj.radioButton1:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event1 = obj.radioButton2:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event2 = obj.edit2:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_1) or 0)+
            												(tonumber(sheet.bonus0_1) or 0)+
            												(tonumber(sheet.xp0_1) or 0);
            						sheet.total0_1 = mod / 2;
            						sheet.total20_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event3 = obj.edit3:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_1) or 0)+
            												(tonumber(sheet.bonus0_1) or 0)+
            												(tonumber(sheet.xp0_1) or 0);
            						sheet.total0_1 = mod / 2;
            						sheet.total20_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event4 = obj.edit4:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_1) or 0)+
            												(tonumber(sheet.bonus0_1) or 0)+
            												(tonumber(sheet.xp0_1) or 0);
            						sheet.total0_1 = mod / 2;
            						sheet.total20_1 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event5 = obj.radioButton3:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event6 = obj.radioButton4:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event7 = obj.edit7:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_2) or 0)+
            												(tonumber(sheet.bonus0_2) or 0)+
            												(tonumber(sheet.xp0_2) or 0);
            						sheet.total0_2 = mod / 2;
            						sheet.total20_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event8 = obj.edit8:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_2) or 0)+
            												(tonumber(sheet.bonus0_2) or 0)+
            												(tonumber(sheet.xp0_2) or 0);
            						sheet.total0_2 = mod / 2;
            						sheet.total20_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event9 = obj.edit9:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_2) or 0)+
            												(tonumber(sheet.bonus0_2) or 0)+
            												(tonumber(sheet.xp0_2) or 0);
            						sheet.total0_2 = mod / 2;
            						sheet.total20_2 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event10 = obj.radioButton5:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event11 = obj.radioButton6:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event12 = obj.edit12:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_3) or 0)+
            												(tonumber(sheet.bonus0_3) or 0)+
            												(tonumber(sheet.xp0_3) or 0);
            						sheet.total0_3 = mod / 2;
            						sheet.total20_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event13 = obj.edit13:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_3) or 0)+
            												(tonumber(sheet.bonus0_3) or 0)+
            												(tonumber(sheet.xp0_3) or 0);
            						sheet.total0_3 = mod / 2;
            						sheet.total20_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event14 = obj.edit14:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_3) or 0)+
            												(tonumber(sheet.bonus0_3) or 0)+
            												(tonumber(sheet.xp0_3) or 0);
            						sheet.total0_3 = mod / 2;
            						sheet.total20_3 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event15 = obj.radioButton7:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event16 = obj.radioButton8:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event17 = obj.edit17:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_4) or 0)+
            												(tonumber(sheet.bonus0_4) or 0)+
            												(tonumber(sheet.xp0_4) or 0);
            						sheet.total0_4 = mod / 2;
            						sheet.total20_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event18 = obj.edit18:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_4) or 0)+
            												(tonumber(sheet.bonus0_4) or 0)+
            												(tonumber(sheet.xp0_4) or 0);
            						sheet.total0_4 = mod / 2;
            						sheet.total20_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event19 = obj.edit19:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_4) or 0)+
            												(tonumber(sheet.bonus0_4) or 0)+
            												(tonumber(sheet.xp0_4) or 0);
            						sheet.total0_4 = mod / 2;
            						sheet.total20_4 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event20 = obj.radioButton9:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event21 = obj.radioButton10:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event22 = obj.edit22:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_5) or 0)+
            												(tonumber(sheet.bonus0_5) or 0)+
            												(tonumber(sheet.xp0_5) or 0);
            						sheet.total0_5 = mod / 2;
            						sheet.total20_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event23 = obj.edit23:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_5) or 0)+
            												(tonumber(sheet.bonus0_5) or 0)+
            												(tonumber(sheet.xp0_5) or 0);
            						sheet.total0_5 = mod / 2;
            						sheet.total20_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event24 = obj.edit24:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_5) or 0)+
            												(tonumber(sheet.bonus0_5) or 0)+
            												(tonumber(sheet.xp0_5) or 0);
            						sheet.total0_5 = mod / 2;
            						sheet.total20_5 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event25 = obj.radioButton11:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event26 = obj.radioButton12:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event27 = obj.edit27:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_6) or 0)+
            												(tonumber(sheet.bonus0_6) or 0)+
            												(tonumber(sheet.xp0_6) or 0);
            						sheet.total0_6 = mod / 2;
            						sheet.total20_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event28 = obj.edit28:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_6) or 0)+
            												(tonumber(sheet.bonus0_6) or 0)+
            												(tonumber(sheet.xp0_6) or 0);
            						sheet.total0_6 = mod / 2;
            						sheet.total20_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event29 = obj.edit29:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_6) or 0)+
            												(tonumber(sheet.bonus0_6) or 0)+
            												(tonumber(sheet.xp0_6) or 0);
            						sheet.total0_6 = mod / 2;
            						sheet.total20_6 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event30 = obj.radioButton13:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event31 = obj.radioButton14:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event32 = obj.edit32:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_7) or 0)+
            												(tonumber(sheet.bonus0_7) or 0)+
            												(tonumber(sheet.xp0_7) or 0);
            						sheet.total0_7 = mod / 2;
            						sheet.total20_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event33 = obj.edit33:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_7) or 0)+
            												(tonumber(sheet.bonus0_7) or 0)+
            												(tonumber(sheet.xp0_7) or 0);
            						sheet.total0_7 = mod / 2;
            						sheet.total20_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event34 = obj.edit34:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_7) or 0)+
            												(tonumber(sheet.bonus0_7) or 0)+
            												(tonumber(sheet.xp0_7) or 0);
            						sheet.total0_7 = mod / 2;
            						sheet.total20_7 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event35 = obj.radioButton15:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event36 = obj.radioButton16:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event37 = obj.edit37:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_8) or 0)+
            												(tonumber(sheet.bonus0_8) or 0)+
            												(tonumber(sheet.xp0_8) or 0);
            						sheet.total0_8 = mod / 2;
            						sheet.total20_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event38 = obj.edit38:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_8) or 0)+
            												(tonumber(sheet.bonus0_8) or 0)+
            												(tonumber(sheet.xp0_8) or 0);
            						sheet.total0_8 = mod / 2;
            						sheet.total20_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event39 = obj.edit39:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_8) or 0)+
            												(tonumber(sheet.bonus0_8) or 0)+
            												(tonumber(sheet.xp0_8) or 0);
            						sheet.total0_8 = mod / 2;
            						sheet.total20_8 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event40 = obj.radioButton17:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event41 = obj.radioButton18:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event42 = obj.edit42:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_9) or 0)+
            												(tonumber(sheet.bonus0_9) or 0)+
            												(tonumber(sheet.xp0_9) or 0);
            						sheet.total0_9 = mod / 2;
            						sheet.total20_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event43 = obj.edit43:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_9) or 0)+
            												(tonumber(sheet.bonus0_9) or 0)+
            												(tonumber(sheet.xp0_9) or 0);
            						sheet.total0_9 = mod / 2;
            						sheet.total20_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event44 = obj.edit44:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_9) or 0)+
            												(tonumber(sheet.bonus0_9) or 0)+
            												(tonumber(sheet.xp0_9) or 0);
            						sheet.total0_9 = mod / 2;
            						sheet.total20_9 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event45 = obj.radioButton19:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event46 = obj.radioButton20:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event47 = obj.edit47:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_10) or 0)+
            												(tonumber(sheet.bonus0_10) or 0)+
            												(tonumber(sheet.xp0_10) or 0);
            						sheet.total0_10 = mod / 2;
            						sheet.total20_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event48 = obj.edit48:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_10) or 0)+
            												(tonumber(sheet.bonus0_10) or 0)+
            												(tonumber(sheet.xp0_10) or 0);
            						sheet.total0_10 = mod / 2;
            						sheet.total20_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event49 = obj.edit49:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_10) or 0)+
            												(tonumber(sheet.bonus0_10) or 0)+
            												(tonumber(sheet.xp0_10) or 0);
            						sheet.total0_10 = mod / 2;
            						sheet.total20_10 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event50 = obj.radioButton21:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event51 = obj.radioButton22:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event52 = obj.edit52:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_11) or 0)+
            												(tonumber(sheet.bonus0_11) or 0)+
            												(tonumber(sheet.xp0_11) or 0);
            						sheet.total0_11 = mod / 2;
            						sheet.total20_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event53 = obj.edit53:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_11) or 0)+
            												(tonumber(sheet.bonus0_11) or 0)+
            												(tonumber(sheet.xp0_11) or 0);
            						sheet.total0_11 = mod / 2;
            						sheet.total20_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event54 = obj.edit54:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_11) or 0)+
            												(tonumber(sheet.bonus0_11) or 0)+
            												(tonumber(sheet.xp0_11) or 0);
            						sheet.total0_11 = mod / 2;
            						sheet.total20_11 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event55 = obj.radioButton23:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event56 = obj.radioButton24:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event57 = obj.edit57:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_12) or 0)+
            												(tonumber(sheet.bonus0_12) or 0)+
            												(tonumber(sheet.xp0_12) or 0);
            						sheet.total0_12 = mod / 2;
            						sheet.total20_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event58 = obj.edit58:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_12) or 0)+
            												(tonumber(sheet.bonus0_12) or 0)+
            												(tonumber(sheet.xp0_12) or 0);
            						sheet.total0_12 = mod / 2;
            						sheet.total20_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event59 = obj.edit59:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base0_12) or 0)+
            												(tonumber(sheet.bonus0_12) or 0)+
            												(tonumber(sheet.xp0_12) or 0);
            						sheet.total0_12 = mod / 2;
            						sheet.total20_12 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event60 = obj.radioButton25:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event61 = obj.radioButton26:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event62 = obj.edit62:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_1) or 0)+
            												(tonumber(sheet.bonus2_1) or 0)+
            												(tonumber(sheet.xp2_1) or 0);
            						sheet.total2_1 = mod / 2;
            						sheet.total22_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event63 = obj.edit63:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_1) or 0)+
            												(tonumber(sheet.bonus2_1) or 0)+
            												(tonumber(sheet.xp2_1) or 0);
            						sheet.total2_1 = mod / 2;
            						sheet.total22_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event64 = obj.edit64:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_1) or 0)+
            												(tonumber(sheet.bonus2_1) or 0)+
            												(tonumber(sheet.xp2_1) or 0);
            						sheet.total2_1 = mod / 2;
            						sheet.total22_1 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event65 = obj.radioButton27:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event66 = obj.radioButton28:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event67 = obj.edit67:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_2) or 0)+
            												(tonumber(sheet.bonus2_2) or 0)+
            												(tonumber(sheet.xp2_2) or 0);
            						sheet.total2_2 = mod / 2;
            						sheet.total22_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event68 = obj.edit68:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_2) or 0)+
            												(tonumber(sheet.bonus2_2) or 0)+
            												(tonumber(sheet.xp2_2) or 0);
            						sheet.total2_2 = mod / 2;
            						sheet.total22_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event69 = obj.edit69:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_2) or 0)+
            												(tonumber(sheet.bonus2_2) or 0)+
            												(tonumber(sheet.xp2_2) or 0);
            						sheet.total2_2 = mod / 2;
            						sheet.total22_2 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event70 = obj.radioButton29:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event71 = obj.radioButton30:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event72 = obj.edit72:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_3) or 0)+
            												(tonumber(sheet.bonus2_3) or 0)+
            												(tonumber(sheet.xp2_3) or 0);
            						sheet.total2_3 = mod / 2;
            						sheet.total22_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event73 = obj.edit73:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_3) or 0)+
            												(tonumber(sheet.bonus2_3) or 0)+
            												(tonumber(sheet.xp2_3) or 0);
            						sheet.total2_3 = mod / 2;
            						sheet.total22_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event74 = obj.edit74:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_3) or 0)+
            												(tonumber(sheet.bonus2_3) or 0)+
            												(tonumber(sheet.xp2_3) or 0);
            						sheet.total2_3 = mod / 2;
            						sheet.total22_3 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event75 = obj.radioButton31:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event76 = obj.radioButton32:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event77 = obj.edit77:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_4) or 0)+
            												(tonumber(sheet.bonus2_4) or 0)+
            												(tonumber(sheet.xp2_4) or 0);
            						sheet.total2_4 = mod / 2;
            						sheet.total22_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event78 = obj.edit78:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_4) or 0)+
            												(tonumber(sheet.bonus2_4) or 0)+
            												(tonumber(sheet.xp2_4) or 0);
            						sheet.total2_4 = mod / 2;
            						sheet.total22_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event79 = obj.edit79:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_4) or 0)+
            												(tonumber(sheet.bonus2_4) or 0)+
            												(tonumber(sheet.xp2_4) or 0);
            						sheet.total2_4 = mod / 2;
            						sheet.total22_4 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event80 = obj.radioButton33:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event81 = obj.radioButton34:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event82 = obj.edit82:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_5) or 0)+
            												(tonumber(sheet.bonus2_5) or 0)+
            												(tonumber(sheet.xp2_5) or 0);
            						sheet.total2_5 = mod / 2;
            						sheet.total22_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event83 = obj.edit83:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_5) or 0)+
            												(tonumber(sheet.bonus2_5) or 0)+
            												(tonumber(sheet.xp2_5) or 0);
            						sheet.total2_5 = mod / 2;
            						sheet.total22_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event84 = obj.edit84:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_5) or 0)+
            												(tonumber(sheet.bonus2_5) or 0)+
            												(tonumber(sheet.xp2_5) or 0);
            						sheet.total2_5 = mod / 2;
            						sheet.total22_5 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event85 = obj.radioButton35:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event86 = obj.radioButton36:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event87 = obj.edit87:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_6) or 0)+
            												(tonumber(sheet.bonus2_6) or 0)+
            												(tonumber(sheet.xp2_6) or 0);
            						sheet.total2_6 = mod / 2;
            						sheet.total22_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event88 = obj.edit88:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_6) or 0)+
            												(tonumber(sheet.bonus2_6) or 0)+
            												(tonumber(sheet.xp2_6) or 0);
            						sheet.total2_6 = mod / 2;
            						sheet.total22_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event89 = obj.edit89:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_6) or 0)+
            												(tonumber(sheet.bonus2_6) or 0)+
            												(tonumber(sheet.xp2_6) or 0);
            						sheet.total2_6 = mod / 2;
            						sheet.total22_6 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event90 = obj.radioButton37:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event91 = obj.radioButton38:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event92 = obj.edit92:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_7) or 0)+
            												(tonumber(sheet.bonus2_7) or 0)+
            												(tonumber(sheet.xp2_7) or 0);
            						sheet.total2_7 = mod / 2;
            						sheet.total22_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event93 = obj.edit93:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_7) or 0)+
            												(tonumber(sheet.bonus2_7) or 0)+
            												(tonumber(sheet.xp2_7) or 0);
            						sheet.total2_7 = mod / 2;
            						sheet.total22_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event94 = obj.edit94:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_7) or 0)+
            												(tonumber(sheet.bonus2_7) or 0)+
            												(tonumber(sheet.xp2_7) or 0);
            						sheet.total2_7 = mod / 2;
            						sheet.total22_7 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event95 = obj.radioButton39:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event96 = obj.radioButton40:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event97 = obj.edit97:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_8) or 0)+
            												(tonumber(sheet.bonus2_8) or 0)+
            												(tonumber(sheet.xp2_8) or 0);
            						sheet.total2_8 = mod / 2;
            						sheet.total22_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event98 = obj.edit98:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_8) or 0)+
            												(tonumber(sheet.bonus2_8) or 0)+
            												(tonumber(sheet.xp2_8) or 0);
            						sheet.total2_8 = mod / 2;
            						sheet.total22_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event99 = obj.edit99:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_8) or 0)+
            												(tonumber(sheet.bonus2_8) or 0)+
            												(tonumber(sheet.xp2_8) or 0);
            						sheet.total2_8 = mod / 2;
            						sheet.total22_8 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event100 = obj.radioButton41:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event101 = obj.radioButton42:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event102 = obj.edit102:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_9) or 0)+
            												(tonumber(sheet.bonus2_9) or 0)+
            												(tonumber(sheet.xp2_9) or 0);
            						sheet.total2_9 = mod / 2;
            						sheet.total22_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event103 = obj.edit103:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_9) or 0)+
            												(tonumber(sheet.bonus2_9) or 0)+
            												(tonumber(sheet.xp2_9) or 0);
            						sheet.total2_9 = mod / 2;
            						sheet.total22_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event104 = obj.edit104:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_9) or 0)+
            												(tonumber(sheet.bonus2_9) or 0)+
            												(tonumber(sheet.xp2_9) or 0);
            						sheet.total2_9 = mod / 2;
            						sheet.total22_9 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event105 = obj.radioButton43:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event106 = obj.radioButton44:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event107 = obj.edit107:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_10) or 0)+
            												(tonumber(sheet.bonus2_10) or 0)+
            												(tonumber(sheet.xp2_10) or 0);
            						sheet.total2_10 = mod / 2;
            						sheet.total22_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event108 = obj.edit108:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_10) or 0)+
            												(tonumber(sheet.bonus2_10) or 0)+
            												(tonumber(sheet.xp2_10) or 0);
            						sheet.total2_10 = mod / 2;
            						sheet.total22_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event109 = obj.edit109:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_10) or 0)+
            												(tonumber(sheet.bonus2_10) or 0)+
            												(tonumber(sheet.xp2_10) or 0);
            						sheet.total2_10 = mod / 2;
            						sheet.total22_10 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event110 = obj.radioButton45:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event111 = obj.radioButton46:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event112 = obj.edit112:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_11) or 0)+
            												(tonumber(sheet.bonus2_11) or 0)+
            												(tonumber(sheet.xp2_11) or 0);
            						sheet.total2_11 = mod / 2;
            						sheet.total22_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event113 = obj.edit113:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_11) or 0)+
            												(tonumber(sheet.bonus2_11) or 0)+
            												(tonumber(sheet.xp2_11) or 0);
            						sheet.total2_11 = mod / 2;
            						sheet.total22_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event114 = obj.edit114:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_11) or 0)+
            												(tonumber(sheet.bonus2_11) or 0)+
            												(tonumber(sheet.xp2_11) or 0);
            						sheet.total2_11 = mod / 2;
            						sheet.total22_11 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event115 = obj.radioButton47:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event116 = obj.radioButton48:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event117 = obj.edit117:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_12) or 0)+
            												(tonumber(sheet.bonus2_12) or 0)+
            												(tonumber(sheet.xp2_12) or 0);
            						sheet.total2_12 = mod / 2;
            						sheet.total22_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event118 = obj.edit118:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_12) or 0)+
            												(tonumber(sheet.bonus2_12) or 0)+
            												(tonumber(sheet.xp2_12) or 0);
            						sheet.total2_12 = mod / 2;
            						sheet.total22_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event119 = obj.edit119:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base2_12) or 0)+
            												(tonumber(sheet.bonus2_12) or 0)+
            												(tonumber(sheet.xp2_12) or 0);
            						sheet.total2_12 = mod / 2;
            						sheet.total22_12 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event120 = obj.radioButton49:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event121 = obj.radioButton50:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event122 = obj.edit122:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_1) or 0)+
            												(tonumber(sheet.bonus1_1) or 0)+
            												(tonumber(sheet.xp1_1) or 0);
            						sheet.total1_1 = mod / 2;
            						sheet.total21_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event123 = obj.edit123:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_1) or 0)+
            												(tonumber(sheet.bonus1_1) or 0)+
            												(tonumber(sheet.xp1_1) or 0);
            						sheet.total1_1 = mod / 2;
            						sheet.total21_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event124 = obj.edit124:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_1) or 0)+
            												(tonumber(sheet.bonus1_1) or 0)+
            												(tonumber(sheet.xp1_1) or 0);
            						sheet.total1_1 = mod / 2;
            						sheet.total21_1 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event125 = obj.radioButton51:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event126 = obj.radioButton52:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event127 = obj.edit127:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_2) or 0)+
            												(tonumber(sheet.bonus1_2) or 0)+
            												(tonumber(sheet.xp1_2) or 0);
            						sheet.total1_2 = mod / 2;
            						sheet.total21_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event128 = obj.edit128:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_2) or 0)+
            												(tonumber(sheet.bonus1_2) or 0)+
            												(tonumber(sheet.xp1_2) or 0);
            						sheet.total1_2 = mod / 2;
            						sheet.total21_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event129 = obj.edit129:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_2) or 0)+
            												(tonumber(sheet.bonus1_2) or 0)+
            												(tonumber(sheet.xp1_2) or 0);
            						sheet.total1_2 = mod / 2;
            						sheet.total21_2 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event130 = obj.radioButton53:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event131 = obj.radioButton54:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event132 = obj.edit132:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_3) or 0)+
            												(tonumber(sheet.bonus1_3) or 0)+
            												(tonumber(sheet.xp1_3) or 0);
            						sheet.total1_3 = mod / 2;
            						sheet.total21_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event133 = obj.edit133:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_3) or 0)+
            												(tonumber(sheet.bonus1_3) or 0)+
            												(tonumber(sheet.xp1_3) or 0);
            						sheet.total1_3 = mod / 2;
            						sheet.total21_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event134 = obj.edit134:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_3) or 0)+
            												(tonumber(sheet.bonus1_3) or 0)+
            												(tonumber(sheet.xp1_3) or 0);
            						sheet.total1_3 = mod / 2;
            						sheet.total21_3 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event135 = obj.radioButton55:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event136 = obj.radioButton56:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event137 = obj.edit137:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_4) or 0)+
            												(tonumber(sheet.bonus1_4) or 0)+
            												(tonumber(sheet.xp1_4) or 0);
            						sheet.total1_4 = mod / 2;
            						sheet.total21_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event138 = obj.edit138:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_4) or 0)+
            												(tonumber(sheet.bonus1_4) or 0)+
            												(tonumber(sheet.xp1_4) or 0);
            						sheet.total1_4 = mod / 2;
            						sheet.total21_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event139 = obj.edit139:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_4) or 0)+
            												(tonumber(sheet.bonus1_4) or 0)+
            												(tonumber(sheet.xp1_4) or 0);
            						sheet.total1_4 = mod / 2;
            						sheet.total21_4 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event140 = obj.radioButton57:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event141 = obj.radioButton58:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event142 = obj.edit142:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_5) or 0)+
            												(tonumber(sheet.bonus1_5) or 0)+
            												(tonumber(sheet.xp1_5) or 0);
            						sheet.total1_5 = mod / 2;
            						sheet.total21_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event143 = obj.edit143:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_5) or 0)+
            												(tonumber(sheet.bonus1_5) or 0)+
            												(tonumber(sheet.xp1_5) or 0);
            						sheet.total1_5 = mod / 2;
            						sheet.total21_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event144 = obj.edit144:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_5) or 0)+
            												(tonumber(sheet.bonus1_5) or 0)+
            												(tonumber(sheet.xp1_5) or 0);
            						sheet.total1_5 = mod / 2;
            						sheet.total21_5 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event145 = obj.radioButton59:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event146 = obj.radioButton60:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event147 = obj.edit147:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_6) or 0)+
            												(tonumber(sheet.bonus1_6) or 0)+
            												(tonumber(sheet.xp1_6) or 0);
            						sheet.total1_6 = mod / 2;
            						sheet.total21_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event148 = obj.edit148:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_6) or 0)+
            												(tonumber(sheet.bonus1_6) or 0)+
            												(tonumber(sheet.xp1_6) or 0);
            						sheet.total1_6 = mod / 2;
            						sheet.total21_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event149 = obj.edit149:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_6) or 0)+
            												(tonumber(sheet.bonus1_6) or 0)+
            												(tonumber(sheet.xp1_6) or 0);
            						sheet.total1_6 = mod / 2;
            						sheet.total21_6 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event150 = obj.radioButton61:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event151 = obj.radioButton62:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event152 = obj.edit152:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_7) or 0)+
            												(tonumber(sheet.bonus1_7) or 0)+
            												(tonumber(sheet.xp1_7) or 0);
            						sheet.total1_7 = mod / 2;
            						sheet.total21_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event153 = obj.edit153:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_7) or 0)+
            												(tonumber(sheet.bonus1_7) or 0)+
            												(tonumber(sheet.xp1_7) or 0);
            						sheet.total1_7 = mod / 2;
            						sheet.total21_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event154 = obj.edit154:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_7) or 0)+
            												(tonumber(sheet.bonus1_7) or 0)+
            												(tonumber(sheet.xp1_7) or 0);
            						sheet.total1_7 = mod / 2;
            						sheet.total21_7 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event155 = obj.radioButton63:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event156 = obj.radioButton64:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event157 = obj.edit157:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_8) or 0)+
            												(tonumber(sheet.bonus1_8) or 0)+
            												(tonumber(sheet.xp1_8) or 0);
            						sheet.total1_8 = mod / 2;
            						sheet.total21_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event158 = obj.edit158:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_8) or 0)+
            												(tonumber(sheet.bonus1_8) or 0)+
            												(tonumber(sheet.xp1_8) or 0);
            						sheet.total1_8 = mod / 2;
            						sheet.total21_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event159 = obj.edit159:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_8) or 0)+
            												(tonumber(sheet.bonus1_8) or 0)+
            												(tonumber(sheet.xp1_8) or 0);
            						sheet.total1_8 = mod / 2;
            						sheet.total21_8 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event160 = obj.radioButton65:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event161 = obj.radioButton66:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event162 = obj.edit162:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_9) or 0)+
            												(tonumber(sheet.bonus1_9) or 0)+
            												(tonumber(sheet.xp1_9) or 0);
            						sheet.total1_9 = mod / 2;
            						sheet.total21_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event163 = obj.edit163:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_9) or 0)+
            												(tonumber(sheet.bonus1_9) or 0)+
            												(tonumber(sheet.xp1_9) or 0);
            						sheet.total1_9 = mod / 2;
            						sheet.total21_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event164 = obj.edit164:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_9) or 0)+
            												(tonumber(sheet.bonus1_9) or 0)+
            												(tonumber(sheet.xp1_9) or 0);
            						sheet.total1_9 = mod / 2;
            						sheet.total21_9 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event165 = obj.radioButton67:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event166 = obj.radioButton68:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event167 = obj.edit167:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_10) or 0)+
            												(tonumber(sheet.bonus1_10) or 0)+
            												(tonumber(sheet.xp1_10) or 0);
            						sheet.total1_10 = mod / 2;
            						sheet.total21_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event168 = obj.edit168:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_10) or 0)+
            												(tonumber(sheet.bonus1_10) or 0)+
            												(tonumber(sheet.xp1_10) or 0);
            						sheet.total1_10 = mod / 2;
            						sheet.total21_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event169 = obj.edit169:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_10) or 0)+
            												(tonumber(sheet.bonus1_10) or 0)+
            												(tonumber(sheet.xp1_10) or 0);
            						sheet.total1_10 = mod / 2;
            						sheet.total21_10 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event170 = obj.radioButton69:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event171 = obj.radioButton70:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event172 = obj.edit172:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_11) or 0)+
            												(tonumber(sheet.bonus1_11) or 0)+
            												(tonumber(sheet.xp1_11) or 0);
            						sheet.total1_11 = mod / 2;
            						sheet.total21_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event173 = obj.edit173:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_11) or 0)+
            												(tonumber(sheet.bonus1_11) or 0)+
            												(tonumber(sheet.xp1_11) or 0);
            						sheet.total1_11 = mod / 2;
            						sheet.total21_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event174 = obj.edit174:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_11) or 0)+
            												(tonumber(sheet.bonus1_11) or 0)+
            												(tonumber(sheet.xp1_11) or 0);
            						sheet.total1_11 = mod / 2;
            						sheet.total21_11 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event175 = obj.radioButton71:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event176 = obj.radioButton72:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event177 = obj.edit177:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_12) or 0)+
            												(tonumber(sheet.bonus1_12) or 0)+
            												(tonumber(sheet.xp1_12) or 0);
            						sheet.total1_12 = mod / 2;
            						sheet.total21_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event178 = obj.edit178:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_12) or 0)+
            												(tonumber(sheet.bonus1_12) or 0)+
            												(tonumber(sheet.xp1_12) or 0);
            						sheet.total1_12 = mod / 2;
            						sheet.total21_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event179 = obj.edit179:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base1_12) or 0)+
            												(tonumber(sheet.bonus1_12) or 0)+
            												(tonumber(sheet.xp1_12) or 0);
            						sheet.total1_12 = mod / 2;
            						sheet.total21_12 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event180 = obj.radioButton73:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event181 = obj.radioButton74:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event182 = obj.edit182:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_1) or 0)+
            												(tonumber(sheet.bonus3_1) or 0)+
            												(tonumber(sheet.xp3_1) or 0);
            						sheet.total3_1 = mod / 2;
            						sheet.total23_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event183 = obj.edit183:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_1) or 0)+
            												(tonumber(sheet.bonus3_1) or 0)+
            												(tonumber(sheet.xp3_1) or 0);
            						sheet.total3_1 = mod / 2;
            						sheet.total23_1 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event184 = obj.edit184:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_1) or 0)+
            												(tonumber(sheet.bonus3_1) or 0)+
            												(tonumber(sheet.xp3_1) or 0);
            						sheet.total3_1 = mod / 2;
            						sheet.total23_1 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event185 = obj.radioButton75:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event186 = obj.radioButton76:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event187 = obj.edit187:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_2) or 0)+
            												(tonumber(sheet.bonus3_2) or 0)+
            												(tonumber(sheet.xp3_2) or 0);
            						sheet.total3_2 = mod / 2;
            						sheet.total23_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event188 = obj.edit188:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_2) or 0)+
            												(tonumber(sheet.bonus3_2) or 0)+
            												(tonumber(sheet.xp3_2) or 0);
            						sheet.total3_2 = mod / 2;
            						sheet.total23_2 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event189 = obj.edit189:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_2) or 0)+
            												(tonumber(sheet.bonus3_2) or 0)+
            												(tonumber(sheet.xp3_2) or 0);
            						sheet.total3_2 = mod / 2;
            						sheet.total23_2 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event190 = obj.radioButton77:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event191 = obj.radioButton78:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event192 = obj.edit192:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_3) or 0)+
            												(tonumber(sheet.bonus3_3) or 0)+
            												(tonumber(sheet.xp3_3) or 0);
            						sheet.total3_3 = mod / 2;
            						sheet.total23_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event193 = obj.edit193:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_3) or 0)+
            												(tonumber(sheet.bonus3_3) or 0)+
            												(tonumber(sheet.xp3_3) or 0);
            						sheet.total3_3 = mod / 2;
            						sheet.total23_3 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event194 = obj.edit194:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_3) or 0)+
            												(tonumber(sheet.bonus3_3) or 0)+
            												(tonumber(sheet.xp3_3) or 0);
            						sheet.total3_3 = mod / 2;
            						sheet.total23_3 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event195 = obj.radioButton79:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event196 = obj.radioButton80:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event197 = obj.edit197:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_4) or 0)+
            												(tonumber(sheet.bonus3_4) or 0)+
            												(tonumber(sheet.xp3_4) or 0);
            						sheet.total3_4 = mod / 2;
            						sheet.total23_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event198 = obj.edit198:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_4) or 0)+
            												(tonumber(sheet.bonus3_4) or 0)+
            												(tonumber(sheet.xp3_4) or 0);
            						sheet.total3_4 = mod / 2;
            						sheet.total23_4 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event199 = obj.edit199:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_4) or 0)+
            												(tonumber(sheet.bonus3_4) or 0)+
            												(tonumber(sheet.xp3_4) or 0);
            						sheet.total3_4 = mod / 2;
            						sheet.total23_4 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event200 = obj.radioButton81:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event201 = obj.radioButton82:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event202 = obj.edit202:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_5) or 0)+
            												(tonumber(sheet.bonus3_5) or 0)+
            												(tonumber(sheet.xp3_5) or 0);
            						sheet.total3_5 = mod / 2;
            						sheet.total23_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event203 = obj.edit203:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_5) or 0)+
            												(tonumber(sheet.bonus3_5) or 0)+
            												(tonumber(sheet.xp3_5) or 0);
            						sheet.total3_5 = mod / 2;
            						sheet.total23_5 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event204 = obj.edit204:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_5) or 0)+
            												(tonumber(sheet.bonus3_5) or 0)+
            												(tonumber(sheet.xp3_5) or 0);
            						sheet.total3_5 = mod / 2;
            						sheet.total23_5 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event205 = obj.radioButton83:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event206 = obj.radioButton84:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event207 = obj.edit207:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_6) or 0)+
            												(tonumber(sheet.bonus3_6) or 0)+
            												(tonumber(sheet.xp3_6) or 0);
            						sheet.total3_6 = mod / 2;
            						sheet.total23_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event208 = obj.edit208:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_6) or 0)+
            												(tonumber(sheet.bonus3_6) or 0)+
            												(tonumber(sheet.xp3_6) or 0);
            						sheet.total3_6 = mod / 2;
            						sheet.total23_6 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event209 = obj.edit209:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_6) or 0)+
            												(tonumber(sheet.bonus3_6) or 0)+
            												(tonumber(sheet.xp3_6) or 0);
            						sheet.total3_6 = mod / 2;
            						sheet.total23_6 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event210 = obj.radioButton85:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event211 = obj.radioButton86:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event212 = obj.edit212:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_7) or 0)+
            												(tonumber(sheet.bonus3_7) or 0)+
            												(tonumber(sheet.xp3_7) or 0);
            						sheet.total3_7 = mod / 2;
            						sheet.total23_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event213 = obj.edit213:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_7) or 0)+
            												(tonumber(sheet.bonus3_7) or 0)+
            												(tonumber(sheet.xp3_7) or 0);
            						sheet.total3_7 = mod / 2;
            						sheet.total23_7 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event214 = obj.edit214:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_7) or 0)+
            												(tonumber(sheet.bonus3_7) or 0)+
            												(tonumber(sheet.xp3_7) or 0);
            						sheet.total3_7 = mod / 2;
            						sheet.total23_7 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event215 = obj.radioButton87:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event216 = obj.radioButton88:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event217 = obj.edit217:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_8) or 0)+
            												(tonumber(sheet.bonus3_8) or 0)+
            												(tonumber(sheet.xp3_8) or 0);
            						sheet.total3_8 = mod / 2;
            						sheet.total23_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event218 = obj.edit218:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_8) or 0)+
            												(tonumber(sheet.bonus3_8) or 0)+
            												(tonumber(sheet.xp3_8) or 0);
            						sheet.total3_8 = mod / 2;
            						sheet.total23_8 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event219 = obj.edit219:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_8) or 0)+
            												(tonumber(sheet.bonus3_8) or 0)+
            												(tonumber(sheet.xp3_8) or 0);
            						sheet.total3_8 = mod / 2;
            						sheet.total23_8 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event220 = obj.radioButton89:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event221 = obj.radioButton90:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event222 = obj.edit222:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_9) or 0)+
            												(tonumber(sheet.bonus3_9) or 0)+
            												(tonumber(sheet.xp3_9) or 0);
            						sheet.total3_9 = mod / 2;
            						sheet.total23_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event223 = obj.edit223:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_9) or 0)+
            												(tonumber(sheet.bonus3_9) or 0)+
            												(tonumber(sheet.xp3_9) or 0);
            						sheet.total3_9 = mod / 2;
            						sheet.total23_9 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event224 = obj.edit224:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_9) or 0)+
            												(tonumber(sheet.bonus3_9) or 0)+
            												(tonumber(sheet.xp3_9) or 0);
            						sheet.total3_9 = mod / 2;
            						sheet.total23_9 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event225 = obj.radioButton91:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event226 = obj.radioButton92:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event227 = obj.edit227:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_10) or 0)+
            												(tonumber(sheet.bonus3_10) or 0)+
            												(tonumber(sheet.xp3_10) or 0);
            						sheet.total3_10 = mod / 2;
            						sheet.total23_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event228 = obj.edit228:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_10) or 0)+
            												(tonumber(sheet.bonus3_10) or 0)+
            												(tonumber(sheet.xp3_10) or 0);
            						sheet.total3_10 = mod / 2;
            						sheet.total23_10 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event229 = obj.edit229:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_10) or 0)+
            												(tonumber(sheet.bonus3_10) or 0)+
            												(tonumber(sheet.xp3_10) or 0);
            						sheet.total3_10 = mod / 2;
            						sheet.total23_10 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event230 = obj.radioButton93:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event231 = obj.radioButton94:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event232 = obj.edit232:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_11) or 0)+
            												(tonumber(sheet.bonus3_11) or 0)+
            												(tonumber(sheet.xp3_11) or 0);
            						sheet.total3_11 = mod / 2;
            						sheet.total23_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event233 = obj.edit233:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_11) or 0)+
            												(tonumber(sheet.bonus3_11) or 0)+
            												(tonumber(sheet.xp3_11) or 0);
            						sheet.total3_11 = mod / 2;
            						sheet.total23_11 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event234 = obj.edit234:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_11) or 0)+
            												(tonumber(sheet.bonus3_11) or 0)+
            												(tonumber(sheet.xp3_11) or 0);
            						sheet.total3_11 = mod / 2;
            						sheet.total23_11 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event235 = obj.radioButton95:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num1 = (tonumber(sheet[sheet.dado1]) or 0);
            					end;
        end, obj);

    obj._e_event236 = obj.radioButton96:addEventListener("onChange",
        function (self)
            if sheet~=nil then
            						sheet.num2 = (tonumber(sheet[sheet.dado2]) or 0);
            					end;
        end, obj);

    obj._e_event237 = obj.edit237:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_12) or 0)+
            												(tonumber(sheet.bonus3_12) or 0)+
            												(tonumber(sheet.xp3_12) or 0);
            						sheet.total3_12 = mod / 2;
            						sheet.total23_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event238 = obj.edit238:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_12) or 0)+
            												(tonumber(sheet.bonus3_12) or 0)+
            												(tonumber(sheet.xp3_12) or 0);
            						sheet.total3_12 = mod / 2;
            						sheet.total23_12 = mod .. " | " .. mod / 2;
            					end;
        end, obj);

    obj._e_event239 = obj.edit239:addEventListener("onChange",
        function (self)
            if sheet~= nil then
            						local mod = (tonumber(sheet.base3_12) or 0)+
            												(tonumber(sheet.bonus3_12) or 0)+
            												(tonumber(sheet.xp3_12) or 0);
            						sheet.total3_12 = mod / 2;
            						sheet.total23_12 = mod .. " | " .. mod / 2;
            						xpAptidoes();
            					end;
        end, obj);

    obj._e_event240 = obj.button1:addEventListener("onClick",
        function (self)
            rolar();
        end, obj);

    function obj:_releaseEvents()
        __o_rrpgObjs.removeEventListenerById(self._e_event240);
        __o_rrpgObjs.removeEventListenerById(self._e_event239);
        __o_rrpgObjs.removeEventListenerById(self._e_event238);
        __o_rrpgObjs.removeEventListenerById(self._e_event237);
        __o_rrpgObjs.removeEventListenerById(self._e_event236);
        __o_rrpgObjs.removeEventListenerById(self._e_event235);
        __o_rrpgObjs.removeEventListenerById(self._e_event234);
        __o_rrpgObjs.removeEventListenerById(self._e_event233);
        __o_rrpgObjs.removeEventListenerById(self._e_event232);
        __o_rrpgObjs.removeEventListenerById(self._e_event231);
        __o_rrpgObjs.removeEventListenerById(self._e_event230);
        __o_rrpgObjs.removeEventListenerById(self._e_event229);
        __o_rrpgObjs.removeEventListenerById(self._e_event228);
        __o_rrpgObjs.removeEventListenerById(self._e_event227);
        __o_rrpgObjs.removeEventListenerById(self._e_event226);
        __o_rrpgObjs.removeEventListenerById(self._e_event225);
        __o_rrpgObjs.removeEventListenerById(self._e_event224);
        __o_rrpgObjs.removeEventListenerById(self._e_event223);
        __o_rrpgObjs.removeEventListenerById(self._e_event222);
        __o_rrpgObjs.removeEventListenerById(self._e_event221);
        __o_rrpgObjs.removeEventListenerById(self._e_event220);
        __o_rrpgObjs.removeEventListenerById(self._e_event219);
        __o_rrpgObjs.removeEventListenerById(self._e_event218);
        __o_rrpgObjs.removeEventListenerById(self._e_event217);
        __o_rrpgObjs.removeEventListenerById(self._e_event216);
        __o_rrpgObjs.removeEventListenerById(self._e_event215);
        __o_rrpgObjs.removeEventListenerById(self._e_event214);
        __o_rrpgObjs.removeEventListenerById(self._e_event213);
        __o_rrpgObjs.removeEventListenerById(self._e_event212);
        __o_rrpgObjs.removeEventListenerById(self._e_event211);
        __o_rrpgObjs.removeEventListenerById(self._e_event210);
        __o_rrpgObjs.removeEventListenerById(self._e_event209);
        __o_rrpgObjs.removeEventListenerById(self._e_event208);
        __o_rrpgObjs.removeEventListenerById(self._e_event207);
        __o_rrpgObjs.removeEventListenerById(self._e_event206);
        __o_rrpgObjs.removeEventListenerById(self._e_event205);
        __o_rrpgObjs.removeEventListenerById(self._e_event204);
        __o_rrpgObjs.removeEventListenerById(self._e_event203);
        __o_rrpgObjs.removeEventListenerById(self._e_event202);
        __o_rrpgObjs.removeEventListenerById(self._e_event201);
        __o_rrpgObjs.removeEventListenerById(self._e_event200);
        __o_rrpgObjs.removeEventListenerById(self._e_event199);
        __o_rrpgObjs.removeEventListenerById(self._e_event198);
        __o_rrpgObjs.removeEventListenerById(self._e_event197);
        __o_rrpgObjs.removeEventListenerById(self._e_event196);
        __o_rrpgObjs.removeEventListenerById(self._e_event195);
        __o_rrpgObjs.removeEventListenerById(self._e_event194);
        __o_rrpgObjs.removeEventListenerById(self._e_event193);
        __o_rrpgObjs.removeEventListenerById(self._e_event192);
        __o_rrpgObjs.removeEventListenerById(self._e_event191);
        __o_rrpgObjs.removeEventListenerById(self._e_event190);
        __o_rrpgObjs.removeEventListenerById(self._e_event189);
        __o_rrpgObjs.removeEventListenerById(self._e_event188);
        __o_rrpgObjs.removeEventListenerById(self._e_event187);
        __o_rrpgObjs.removeEventListenerById(self._e_event186);
        __o_rrpgObjs.removeEventListenerById(self._e_event185);
        __o_rrpgObjs.removeEventListenerById(self._e_event184);
        __o_rrpgObjs.removeEventListenerById(self._e_event183);
        __o_rrpgObjs.removeEventListenerById(self._e_event182);
        __o_rrpgObjs.removeEventListenerById(self._e_event181);
        __o_rrpgObjs.removeEventListenerById(self._e_event180);
        __o_rrpgObjs.removeEventListenerById(self._e_event179);
        __o_rrpgObjs.removeEventListenerById(self._e_event178);
        __o_rrpgObjs.removeEventListenerById(self._e_event177);
        __o_rrpgObjs.removeEventListenerById(self._e_event176);
        __o_rrpgObjs.removeEventListenerById(self._e_event175);
        __o_rrpgObjs.removeEventListenerById(self._e_event174);
        __o_rrpgObjs.removeEventListenerById(self._e_event173);
        __o_rrpgObjs.removeEventListenerById(self._e_event172);
        __o_rrpgObjs.removeEventListenerById(self._e_event171);
        __o_rrpgObjs.removeEventListenerById(self._e_event170);
        __o_rrpgObjs.removeEventListenerById(self._e_event169);
        __o_rrpgObjs.removeEventListenerById(self._e_event168);
        __o_rrpgObjs.removeEventListenerById(self._e_event167);
        __o_rrpgObjs.removeEventListenerById(self._e_event166);
        __o_rrpgObjs.removeEventListenerById(self._e_event165);
        __o_rrpgObjs.removeEventListenerById(self._e_event164);
        __o_rrpgObjs.removeEventListenerById(self._e_event163);
        __o_rrpgObjs.removeEventListenerById(self._e_event162);
        __o_rrpgObjs.removeEventListenerById(self._e_event161);
        __o_rrpgObjs.removeEventListenerById(self._e_event160);
        __o_rrpgObjs.removeEventListenerById(self._e_event159);
        __o_rrpgObjs.removeEventListenerById(self._e_event158);
        __o_rrpgObjs.removeEventListenerById(self._e_event157);
        __o_rrpgObjs.removeEventListenerById(self._e_event156);
        __o_rrpgObjs.removeEventListenerById(self._e_event155);
        __o_rrpgObjs.removeEventListenerById(self._e_event154);
        __o_rrpgObjs.removeEventListenerById(self._e_event153);
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

        if self.edit213 ~= nil then self.edit213:destroy(); self.edit213 = nil; end;
        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.radioButton37 ~= nil then self.radioButton37:destroy(); self.radioButton37 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit233 ~= nil then self.edit233:destroy(); self.edit233 = nil; end;
        if self.edit226 ~= nil then self.edit226:destroy(); self.edit226 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.radioButton75 ~= nil then self.radioButton75:destroy(); self.radioButton75 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.label43 ~= nil then self.label43:destroy(); self.label43 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.radioButton93 ~= nil then self.radioButton93:destroy(); self.radioButton93 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.label77 ~= nil then self.label77:destroy(); self.label77 = nil; end;
        if self.rectangle35 ~= nil then self.rectangle35:destroy(); self.rectangle35 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.label45 ~= nil then self.label45:destroy(); self.label45 = nil; end;
        if self.rectangle46 ~= nil then self.rectangle46:destroy(); self.rectangle46 = nil; end;
        if self.radioButton48 ~= nil then self.radioButton48:destroy(); self.radioButton48 = nil; end;
        if self.radioButton72 ~= nil then self.radioButton72:destroy(); self.radioButton72 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.radioButton7 ~= nil then self.radioButton7:destroy(); self.radioButton7 = nil; end;
        if self.rectangle16 ~= nil then self.rectangle16:destroy(); self.rectangle16 = nil; end;
        if self.radioButton63 ~= nil then self.radioButton63:destroy(); self.radioButton63 = nil; end;
        if self.label75 ~= nil then self.label75:destroy(); self.label75 = nil; end;
        if self.rectangle47 ~= nil then self.rectangle47:destroy(); self.rectangle47 = nil; end;
        if self.label63 ~= nil then self.label63:destroy(); self.label63 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.radioButton35 ~= nil then self.radioButton35:destroy(); self.radioButton35 = nil; end;
        if self.radioButton56 ~= nil then self.radioButton56:destroy(); self.radioButton56 = nil; end;
        if self.radioButton6 ~= nil then self.radioButton6:destroy(); self.radioButton6 = nil; end;
        if self.label35 ~= nil then self.label35:destroy(); self.label35 = nil; end;
        if self.radioButton54 ~= nil then self.radioButton54:destroy(); self.radioButton54 = nil; end;
        if self.label70 ~= nil then self.label70:destroy(); self.label70 = nil; end;
        if self.edit236 ~= nil then self.edit236:destroy(); self.edit236 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.radioButton50 ~= nil then self.radioButton50:destroy(); self.radioButton50 = nil; end;
        if self.radioButton69 ~= nil then self.radioButton69:destroy(); self.radioButton69 = nil; end;
        if self.radioButton88 ~= nil then self.radioButton88:destroy(); self.radioButton88 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.radioButton79 ~= nil then self.radioButton79:destroy(); self.radioButton79 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.rectangle17 ~= nil then self.rectangle17:destroy(); self.rectangle17 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.radioButton41 ~= nil then self.radioButton41:destroy(); self.radioButton41 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.label49 ~= nil then self.label49:destroy(); self.label49 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.radioButton16 ~= nil then self.radioButton16:destroy(); self.radioButton16 = nil; end;
        if self.rectangle33 ~= nil then self.rectangle33:destroy(); self.rectangle33 = nil; end;
        if self.rectangle51 ~= nil then self.rectangle51:destroy(); self.rectangle51 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
        if self.label52 ~= nil then self.label52:destroy(); self.label52 = nil; end;
        if self.edit228 ~= nil then self.edit228:destroy(); self.edit228 = nil; end;
        if self.edit115 ~= nil then self.edit115:destroy(); self.edit115 = nil; end;
        if self.edit16 ~= nil then self.edit16:destroy(); self.edit16 = nil; end;
        if self.radioButton29 ~= nil then self.radioButton29:destroy(); self.radioButton29 = nil; end;
        if self.label47 ~= nil then self.label47:destroy(); self.label47 = nil; end;
        if self.edit205 ~= nil then self.edit205:destroy(); self.edit205 = nil; end;
        if self.label48 ~= nil then self.label48:destroy(); self.label48 = nil; end;
        if self.edit116 ~= nil then self.edit116:destroy(); self.edit116 = nil; end;
        if self.edit214 ~= nil then self.edit214:destroy(); self.edit214 = nil; end;
        if self.label76 ~= nil then self.label76:destroy(); self.label76 = nil; end;
        if self.edit77 ~= nil then self.edit77:destroy(); self.edit77 = nil; end;
        if self.edit52 ~= nil then self.edit52:destroy(); self.edit52 = nil; end;
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit220 ~= nil then self.edit220:destroy(); self.edit220 = nil; end;
        if self.rectangle55 ~= nil then self.rectangle55:destroy(); self.rectangle55 = nil; end;
        if self.radioButton85 ~= nil then self.radioButton85:destroy(); self.radioButton85 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.radioButton26 ~= nil then self.radioButton26:destroy(); self.radioButton26 = nil; end;
        if self.edit235 ~= nil then self.edit235:destroy(); self.edit235 = nil; end;
        if self.radioButton22 ~= nil then self.radioButton22:destroy(); self.radioButton22 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.rectangle48 ~= nil then self.rectangle48:destroy(); self.rectangle48 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.label29 ~= nil then self.label29:destroy(); self.label29 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.rectangle23 ~= nil then self.rectangle23:destroy(); self.rectangle23 = nil; end;
        if self.label30 ~= nil then self.label30:destroy(); self.label30 = nil; end;
        if self.radioButton24 ~= nil then self.radioButton24:destroy(); self.radioButton24 = nil; end;
        if self.label51 ~= nil then self.label51:destroy(); self.label51 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.radioButton66 ~= nil then self.radioButton66:destroy(); self.radioButton66 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.rectangle52 ~= nil then self.rectangle52:destroy(); self.rectangle52 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.rectangle12 ~= nil then self.rectangle12:destroy(); self.rectangle12 = nil; end;
        if self.rectangle50 ~= nil then self.rectangle50:destroy(); self.rectangle50 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit221 ~= nil then self.edit221:destroy(); self.edit221 = nil; end;
        if self.radioButton70 ~= nil then self.radioButton70:destroy(); self.radioButton70 = nil; end;
        if self.rectangle18 ~= nil then self.rectangle18:destroy(); self.rectangle18 = nil; end;
        if self.rectangle14 ~= nil then self.rectangle14:destroy(); self.rectangle14 = nil; end;
        if self.radioButton18 ~= nil then self.radioButton18:destroy(); self.radioButton18 = nil; end;
        if self.edit124 ~= nil then self.edit124:destroy(); self.edit124 = nil; end;
        if self.label2 ~= nil then self.label2:destroy(); self.label2 = nil; end;
        if self.radioButton23 ~= nil then self.radioButton23:destroy(); self.radioButton23 = nil; end;
        if self.edit157 ~= nil then self.edit157:destroy(); self.edit157 = nil; end;
        if self.edit83 ~= nil then self.edit83:destroy(); self.edit83 = nil; end;
        if self.label38 ~= nil then self.label38:destroy(); self.label38 = nil; end;
        if self.edit27 ~= nil then self.edit27:destroy(); self.edit27 = nil; end;
        if self.layout14 ~= nil then self.layout14:destroy(); self.layout14 = nil; end;
        if self.rectangle42 ~= nil then self.rectangle42:destroy(); self.rectangle42 = nil; end;
        if self.edit223 ~= nil then self.edit223:destroy(); self.edit223 = nil; end;
        if self.edit161 ~= nil then self.edit161:destroy(); self.edit161 = nil; end;
        if self.edit241 ~= nil then self.edit241:destroy(); self.edit241 = nil; end;
        if self.edit62 ~= nil then self.edit62:destroy(); self.edit62 = nil; end;
        if self.layout51 ~= nil then self.layout51:destroy(); self.layout51 = nil; end;
        if self.edit74 ~= nil then self.edit74:destroy(); self.edit74 = nil; end;
        if self.radioButton34 ~= nil then self.radioButton34:destroy(); self.radioButton34 = nil; end;
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.radioButton39 ~= nil then self.radioButton39:destroy(); self.radioButton39 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.rectangle9 ~= nil then self.rectangle9:destroy(); self.rectangle9 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.label73 ~= nil then self.label73:destroy(); self.label73 = nil; end;
        if self.radioButton19 ~= nil then self.radioButton19:destroy(); self.radioButton19 = nil; end;
        if self.radioButton3 ~= nil then self.radioButton3:destroy(); self.radioButton3 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.label23 ~= nil then self.label23:destroy(); self.label23 = nil; end;
        if self.label32 ~= nil then self.label32:destroy(); self.label32 = nil; end;
        if self.label24 ~= nil then self.label24:destroy(); self.label24 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.label61 ~= nil then self.label61:destroy(); self.label61 = nil; end;
        if self.rectangle10 ~= nil then self.rectangle10:destroy(); self.rectangle10 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.radioButton81 ~= nil then self.radioButton81:destroy(); self.radioButton81 = nil; end;
        if self.radioButton84 ~= nil then self.radioButton84:destroy(); self.radioButton84 = nil; end;
        if self.edit224 ~= nil then self.edit224:destroy(); self.edit224 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.radioButton14 ~= nil then self.radioButton14:destroy(); self.radioButton14 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.rectangle38 ~= nil then self.rectangle38:destroy(); self.rectangle38 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.radioButton38 ~= nil then self.radioButton38:destroy(); self.radioButton38 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.label37 ~= nil then self.label37:destroy(); self.label37 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit218 ~= nil then self.edit218:destroy(); self.edit218 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.edit208 ~= nil then self.edit208:destroy(); self.edit208 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.rectangle45 ~= nil then self.rectangle45:destroy(); self.rectangle45 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.radioButton67 ~= nil then self.radioButton67:destroy(); self.radioButton67 = nil; end;
        if self.radioButton51 ~= nil then self.radioButton51:destroy(); self.radioButton51 = nil; end;
        if self.label53 ~= nil then self.label53:destroy(); self.label53 = nil; end;
        if self.rectangle53 ~= nil then self.rectangle53:destroy(); self.rectangle53 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.label42 ~= nil then self.label42:destroy(); self.label42 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.rectangle20 ~= nil then self.rectangle20:destroy(); self.rectangle20 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.radioButton21 ~= nil then self.radioButton21:destroy(); self.radioButton21 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit225 ~= nil then self.edit225:destroy(); self.edit225 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.radioButton17 ~= nil then self.radioButton17:destroy(); self.radioButton17 = nil; end;
        if self.label81 ~= nil then self.label81:destroy(); self.label81 = nil; end;
        if self.radioButton80 ~= nil then self.radioButton80:destroy(); self.radioButton80 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.radioButton31 ~= nil then self.radioButton31:destroy(); self.radioButton31 = nil; end;
        if self.radioButton53 ~= nil then self.radioButton53:destroy(); self.radioButton53 = nil; end;
        if self.radioButton52 ~= nil then self.radioButton52:destroy(); self.radioButton52 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.radioButton86 ~= nil then self.radioButton86:destroy(); self.radioButton86 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.radioButton2 ~= nil then self.radioButton2:destroy(); self.radioButton2 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.radioButton49 ~= nil then self.radioButton49:destroy(); self.radioButton49 = nil; end;
        if self.rectangle30 ~= nil then self.rectangle30:destroy(); self.rectangle30 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.label39 ~= nil then self.label39:destroy(); self.label39 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.radioButton55 ~= nil then self.radioButton55:destroy(); self.radioButton55 = nil; end;
        if self.radioButton76 ~= nil then self.radioButton76:destroy(); self.radioButton76 = nil; end;
        if self.label79 ~= nil then self.label79:destroy(); self.label79 = nil; end;
        if self.radioButton77 ~= nil then self.radioButton77:destroy(); self.radioButton77 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.radioButton11 ~= nil then self.radioButton11:destroy(); self.radioButton11 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.radioButton60 ~= nil then self.radioButton60:destroy(); self.radioButton60 = nil; end;
        if self.rectangle40 ~= nil then self.rectangle40:destroy(); self.rectangle40 = nil; end;
        if self.edit211 ~= nil then self.edit211:destroy(); self.edit211 = nil; end;
        if self.edit240 ~= nil then self.edit240:destroy(); self.edit240 = nil; end;
        if self.rectangle36 ~= nil then self.rectangle36:destroy(); self.rectangle36 = nil; end;
        if self.radioButton82 ~= nil then self.radioButton82:destroy(); self.radioButton82 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.label50 ~= nil then self.label50:destroy(); self.label50 = nil; end;
        if self.radioButton12 ~= nil then self.radioButton12:destroy(); self.radioButton12 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit209 ~= nil then self.edit209:destroy(); self.edit209 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.radioButton94 ~= nil then self.radioButton94:destroy(); self.radioButton94 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.radioButton8 ~= nil then self.radioButton8:destroy(); self.radioButton8 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.radioButton5 ~= nil then self.radioButton5:destroy(); self.radioButton5 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit215 ~= nil then self.edit215:destroy(); self.edit215 = nil; end;
        if self.edit216 ~= nil then self.edit216:destroy(); self.edit216 = nil; end;
        if self.rectangle34 ~= nil then self.rectangle34:destroy(); self.rectangle34 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.radioButton40 ~= nil then self.radioButton40:destroy(); self.radioButton40 = nil; end;
        if self.edit222 ~= nil then self.edit222:destroy(); self.edit222 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.rectangle37 ~= nil then self.rectangle37:destroy(); self.rectangle37 = nil; end;
        if self.radioButton92 ~= nil then self.radioButton92:destroy(); self.radioButton92 = nil; end;
        if self.radioButton96 ~= nil then self.radioButton96:destroy(); self.radioButton96 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.label40 ~= nil then self.label40:destroy(); self.label40 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.label57 ~= nil then self.label57:destroy(); self.label57 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.label71 ~= nil then self.label71:destroy(); self.label71 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.radioButton91 ~= nil then self.radioButton91:destroy(); self.radioButton91 = nil; end;
        if self.radioButton30 ~= nil then self.radioButton30:destroy(); self.radioButton30 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.radioButton64 ~= nil then self.radioButton64:destroy(); self.radioButton64 = nil; end;
        if self.radioButton25 ~= nil then self.radioButton25:destroy(); self.radioButton25 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.radioButton10 ~= nil then self.radioButton10:destroy(); self.radioButton10 = nil; end;
        if self.label27 ~= nil then self.label27:destroy(); self.label27 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.label59 ~= nil then self.label59:destroy(); self.label59 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.label68 ~= nil then self.label68:destroy(); self.label68 = nil; end;
        if self.label67 ~= nil then self.label67:destroy(); self.label67 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.button1 ~= nil then self.button1:destroy(); self.button1 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.label69 ~= nil then self.label69:destroy(); self.label69 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.label31 ~= nil then self.label31:destroy(); self.label31 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.label34 ~= nil then self.label34:destroy(); self.label34 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.radioButton59 ~= nil then self.radioButton59:destroy(); self.radioButton59 = nil; end;
        if self.radioButton73 ~= nil then self.radioButton73:destroy(); self.radioButton73 = nil; end;
        if self.edit204 ~= nil then self.edit204:destroy(); self.edit204 = nil; end;
        if self.edit210 ~= nil then self.edit210:destroy(); self.edit210 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.label41 ~= nil then self.label41:destroy(); self.label41 = nil; end;
        if self.label72 ~= nil then self.label72:destroy(); self.label72 = nil; end;
        if self.rectangle15 ~= nil then self.rectangle15:destroy(); self.rectangle15 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.radioButton62 ~= nil then self.radioButton62:destroy(); self.radioButton62 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.rectangle28 ~= nil then self.rectangle28:destroy(); self.rectangle28 = nil; end;
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
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit242 ~= nil then self.edit242:destroy(); self.edit242 = nil; end;
        if self.edit231 ~= nil then self.edit231:destroy(); self.edit231 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.label58 ~= nil then self.label58:destroy(); self.label58 = nil; end;
        if self.comboBox1 ~= nil then self.comboBox1:destroy(); self.comboBox1 = nil; end;
        if self.rectangle44 ~= nil then self.rectangle44:destroy(); self.rectangle44 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.radioButton1 ~= nil then self.radioButton1:destroy(); self.radioButton1 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.label56 ~= nil then self.label56:destroy(); self.label56 = nil; end;
        if self.radioButton43 ~= nil then self.radioButton43:destroy(); self.radioButton43 = nil; end;
        if self.radioButton36 ~= nil then self.radioButton36:destroy(); self.radioButton36 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.radioButton32 ~= nil then self.radioButton32:destroy(); self.radioButton32 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.radioButton90 ~= nil then self.radioButton90:destroy(); self.radioButton90 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.radioButton95 ~= nil then self.radioButton95:destroy(); self.radioButton95 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit206 ~= nil then self.edit206:destroy(); self.edit206 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.label54 ~= nil then self.label54:destroy(); self.label54 = nil; end;
        if self.radioButton74 ~= nil then self.radioButton74:destroy(); self.radioButton74 = nil; end;
        if self.edit239 ~= nil then self.edit239:destroy(); self.edit239 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
        if self.edit6 ~= nil then self.edit6:destroy(); self.edit6 = nil; end;
        if self.edit230 ~= nil then self.edit230:destroy(); self.edit230 = nil; end;
        if self.edit90 ~= nil then self.edit90:destroy(); self.edit90 = nil; end;
        if self.label18 ~= nil then self.label18:destroy(); self.label18 = nil; end;
        if self.edit238 ~= nil then self.edit238:destroy(); self.edit238 = nil; end;
        if self.edit3 ~= nil then self.edit3:destroy(); self.edit3 = nil; end;
        if self.layout33 ~= nil then self.layout33:destroy(); self.layout33 = nil; end;
        if self.edit49 ~= nil then self.edit49:destroy(); self.edit49 = nil; end;
        if self.rectangle32 ~= nil then self.rectangle32:destroy(); self.rectangle32 = nil; end;
        if self.label62 ~= nil then self.label62:destroy(); self.label62 = nil; end;
        if self.radioButton46 ~= nil then self.radioButton46:destroy(); self.radioButton46 = nil; end;
        if self.layout16 ~= nil then self.layout16:destroy(); self.layout16 = nil; end;
        if self.layout21 ~= nil then self.layout21:destroy(); self.layout21 = nil; end;
        if self.edit140 ~= nil then self.edit140:destroy(); self.edit140 = nil; end;
        if self.edit18 ~= nil then self.edit18:destroy(); self.edit18 = nil; end;
        if self.edit25 ~= nil then self.edit25:destroy(); self.edit25 = nil; end;
        if self.scrollBox1 ~= nil then self.scrollBox1:destroy(); self.scrollBox1 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.label33 ~= nil then self.label33:destroy(); self.label33 = nil; end;
        if self.rectangle11 ~= nil then self.rectangle11:destroy(); self.rectangle11 = nil; end;
        if self.label44 ~= nil then self.label44:destroy(); self.label44 = nil; end;
        if self.radioButton13 ~= nil then self.radioButton13:destroy(); self.radioButton13 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.edit229 ~= nil then self.edit229:destroy(); self.edit229 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.edit207 ~= nil then self.edit207:destroy(); self.edit207 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.label55 ~= nil then self.label55:destroy(); self.label55 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.rectangle21 ~= nil then self.rectangle21:destroy(); self.rectangle21 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.radioButton4 ~= nil then self.radioButton4:destroy(); self.radioButton4 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.label26 ~= nil then self.label26:destroy(); self.label26 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.label66 ~= nil then self.label66:destroy(); self.label66 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.radioButton57 ~= nil then self.radioButton57:destroy(); self.radioButton57 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.rectangle19 ~= nil then self.rectangle19:destroy(); self.rectangle19 = nil; end;
        if self.radioButton44 ~= nil then self.radioButton44:destroy(); self.radioButton44 = nil; end;
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
        if self.radioButton87 ~= nil then self.radioButton87:destroy(); self.radioButton87 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.rectangle54 ~= nil then self.rectangle54:destroy(); self.rectangle54 = nil; end;
        if self.rectangle25 ~= nil then self.rectangle25:destroy(); self.rectangle25 = nil; end;
        if self.label74 ~= nil then self.label74:destroy(); self.label74 = nil; end;
        if self.radioButton27 ~= nil then self.radioButton27:destroy(); self.radioButton27 = nil; end;
        if self.radioButton68 ~= nil then self.radioButton68:destroy(); self.radioButton68 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.rectangle43 ~= nil then self.rectangle43:destroy(); self.rectangle43 = nil; end;
        if self.radioButton33 ~= nil then self.radioButton33:destroy(); self.radioButton33 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit232 ~= nil then self.edit232:destroy(); self.edit232 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.rectangle8 ~= nil then self.rectangle8:destroy(); self.rectangle8 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.label28 ~= nil then self.label28:destroy(); self.label28 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.edit217 ~= nil then self.edit217:destroy(); self.edit217 = nil; end;
        if self.edit234 ~= nil then self.edit234:destroy(); self.edit234 = nil; end;
        if self.edit237 ~= nil then self.edit237:destroy(); self.edit237 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.label80 ~= nil then self.label80:destroy(); self.label80 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.radioButton47 ~= nil then self.radioButton47:destroy(); self.radioButton47 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.radioButton65 ~= nil then self.radioButton65:destroy(); self.radioButton65 = nil; end;
        if self.radioButton20 ~= nil then self.radioButton20:destroy(); self.radioButton20 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.radioButton28 ~= nil then self.radioButton28:destroy(); self.radioButton28 = nil; end;
        if self.radioButton42 ~= nil then self.radioButton42:destroy(); self.radioButton42 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.radioButton83 ~= nil then self.radioButton83:destroy(); self.radioButton83 = nil; end;
        if self.rectangle49 ~= nil then self.rectangle49:destroy(); self.rectangle49 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.rectangle27 ~= nil then self.rectangle27:destroy(); self.rectangle27 = nil; end;
        if self.label36 ~= nil then self.label36:destroy(); self.label36 = nil; end;
        if self.edit203 ~= nil then self.edit203:destroy(); self.edit203 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.edit219 ~= nil then self.edit219:destroy(); self.edit219 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.radioButton89 ~= nil then self.radioButton89:destroy(); self.radioButton89 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.label46 ~= nil then self.label46:destroy(); self.label46 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.radioButton9 ~= nil then self.radioButton9:destroy(); self.radioButton9 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.radioButton15 ~= nil then self.radioButton15:destroy(); self.radioButton15 = nil; end;
        if self.rectangle31 ~= nil then self.rectangle31:destroy(); self.rectangle31 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.radioButton61 ~= nil then self.radioButton61:destroy(); self.radioButton61 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.label25 ~= nil then self.label25:destroy(); self.label25 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.radioButton78 ~= nil then self.radioButton78:destroy(); self.radioButton78 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.radioButton71 ~= nil then self.radioButton71:destroy(); self.radioButton71 = nil; end;
        if self.radioButton45 ~= nil then self.radioButton45:destroy(); self.radioButton45 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.rectangle13 ~= nil then self.rectangle13:destroy(); self.rectangle13 = nil; end;
        if self.radioButton58 ~= nil then self.radioButton58:destroy(); self.radioButton58 = nil; end;
        if self.rectangle39 ~= nil then self.rectangle39:destroy(); self.rectangle39 = nil; end;
        if self.rectangle41 ~= nil then self.rectangle41:destroy(); self.rectangle41 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit212 ~= nil then self.edit212:destroy(); self.edit212 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.rectangle24 ~= nil then self.rectangle24:destroy(); self.rectangle24 = nil; end;
        if self.edit227 ~= nil then self.edit227:destroy(); self.edit227 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmACN2 = {
    newEditor = newfrmACN2, 
    new = newfrmACN2, 
    name = "frmACN2", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmACN2 = _frmACN2;
rrpg.registrarForm(_frmACN2);

return _frmACN2;
