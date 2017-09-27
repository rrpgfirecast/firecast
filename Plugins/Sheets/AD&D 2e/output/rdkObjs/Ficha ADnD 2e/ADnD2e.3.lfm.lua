require("rrpg.lua");
local __o_rrpgObjs = require("rrpgObjs.lua");
require("rrpgGUI.lua");
require("rrpgDialogs.lua");
require("rrpgLFM.lua");
require("ndb.lua");

function newfrmADnD3()
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
    obj:setName("frmADnD3");
    obj:setAlign("client");
    obj:setTheme("dark");
    obj:setMargins({top=1});

    obj.scrollBox1 = gui.fromHandle(_obj_newObject("scrollBox"));
    obj.scrollBox1:setParent(obj);
    obj.scrollBox1:setAlign("client");
    obj.scrollBox1:setName("scrollBox1");


			local function sumCusto();
				if sheet~=nil then
					local mod = (tonumber(sheet.Equipamento_Custo_1_1) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_2) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_3) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_4) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_5) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_6) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_7) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_8) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_9) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_10) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_11) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_12) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_13) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_14) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_15) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_16) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_17) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_18) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_19) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_20) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_21) or 0) + 
								(tonumber(sheet.Equipamento_Custo_1_22) or 0) +
								(tonumber(sheet.Equipamento_Custo_2_1) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_2) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_3) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_4) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_5) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_6) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_7) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_8) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_9) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_10) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_11) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_12) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_13) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_14) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_15) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_16) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_17) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_18) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_19) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_20) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_21) or 0) + 
								(tonumber(sheet.Equipamento_Custo_2_22) or 0) +
								(tonumber(sheet.Equipamento_Custo_3_1) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_2) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_3) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_4) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_5) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_6) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_7) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_8) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_9) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_10) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_11) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_12) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_13) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_14) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_15) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_16) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_17) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_18) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_19) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_20) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_21) or 0) + 
								(tonumber(sheet.Equipamento_Custo_3_22) or 0);
					sheet.Custo_Total = mod;
				end;
			end;
		



			local function sumPeso();
				if sheet~=nil then
					local mod = (tonumber(sheet.Equipamento_Peso_1_1) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_2) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_3) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_4) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_5) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_6) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_7) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_8) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_9) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_10) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_11) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_12) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_13) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_14) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_15) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_16) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_17) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_18) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_19) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_20) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_21) or 0) + 
								(tonumber(sheet.Equipamento_Peso_1_22) or 0) +
								(tonumber(sheet.Equipamento_Peso_2_1) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_2) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_3) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_4) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_5) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_6) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_7) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_8) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_9) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_10) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_11) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_12) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_13) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_14) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_15) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_16) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_17) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_18) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_19) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_20) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_21) or 0) + 
								(tonumber(sheet.Equipamento_Peso_2_22) or 0) +
								(tonumber(sheet.Equipamento_Peso_3_1) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_2) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_3) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_4) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_5) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_6) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_7) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_8) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_9) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_10) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_11) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_12) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_13) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_14) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_15) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_16) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_17) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_18) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_19) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_20) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_21) or 0) + 
								(tonumber(sheet.Equipamento_Peso_3_22) or 0);
					sheet.Peso_Total = mod;
				end;
			end;
		


    obj.layout1 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout1:setParent(obj.scrollBox1);
    obj.layout1:setLeft(0);
    obj.layout1:setTop(0);
    obj.layout1:setWidth(300);
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
    obj.label1:setLeft(0);
    obj.label1:setTop(5);
    obj.label1:setWidth(300);
    obj.label1:setHeight(20);
    obj.label1:setText("EQUIPAMENTOS");
    obj.label1:setHorzTextAlign("center");
    obj.label1:setName("label1");

    obj.layout2 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout2:setParent(obj.layout1);
    obj.layout2:setLeft(0);
    obj.layout2:setTop(30);
    obj.layout2:setWidth(300);
    obj.layout2:setHeight(25);
    obj.layout2:setName("layout2");

    obj.label2 = gui.fromHandle(_obj_newObject("label"));
    obj.label2:setParent(obj.layout2);
    obj.label2:setLeft(5);
    obj.label2:setTop(0);
    obj.label2:setWidth(190);
    obj.label2:setHeight(25);
    obj.label2:setHorzTextAlign("center");
    obj.label2:setText("Item");
    obj.label2:setName("label2");

    obj.label3 = gui.fromHandle(_obj_newObject("label"));
    obj.label3:setParent(obj.layout2);
    obj.label3:setLeft(195);
    obj.label3:setTop(0);
    obj.label3:setWidth(50);
    obj.label3:setHeight(25);
    obj.label3:setHorzTextAlign("center");
    obj.label3:setText("Custo");
    obj.label3:setName("label3");

    obj.label4 = gui.fromHandle(_obj_newObject("label"));
    obj.label4:setParent(obj.layout2);
    obj.label4:setLeft(245);
    obj.label4:setTop(0);
    obj.label4:setWidth(50);
    obj.label4:setHeight(25);
    obj.label4:setHorzTextAlign("center");
    obj.label4:setText("Peso");
    obj.label4:setName("label4");

    obj.layout3 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout3:setParent(obj.layout1);
    obj.layout3:setLeft(0);
    obj.layout3:setTop(55);
    obj.layout3:setWidth(300);
    obj.layout3:setHeight(25);
    obj.layout3:setName("layout3");

    obj.edit1 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit1:setParent(obj.layout3);
    obj.edit1:setLeft(5);
    obj.edit1:setTop(0);
    obj.edit1:setWidth(190);
    obj.edit1:setHeight(25);
    obj.edit1:setField("Equipamento_1_1");
    obj.edit1:setName("edit1");

    obj.edit2 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit2:setParent(obj.layout3);
    obj.edit2:setLeft(195);
    obj.edit2:setTop(0);
    obj.edit2:setWidth(50);
    obj.edit2:setHeight(25);
    obj.edit2:setField("Equipamento_Custo_1_1");
    obj.edit2:setName("edit2");

    obj.edit3 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit3:setParent(obj.layout3);
    obj.edit3:setLeft(245);
    obj.edit3:setTop(0);
    obj.edit3:setWidth(50);
    obj.edit3:setHeight(25);
    obj.edit3:setField("Equipamento_Peso_1_1");
    obj.edit3:setName("edit3");

    obj.layout4 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout4:setParent(obj.layout1);
    obj.layout4:setLeft(0);
    obj.layout4:setTop(80);
    obj.layout4:setWidth(300);
    obj.layout4:setHeight(25);
    obj.layout4:setName("layout4");

    obj.edit4 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit4:setParent(obj.layout4);
    obj.edit4:setLeft(5);
    obj.edit4:setTop(0);
    obj.edit4:setWidth(190);
    obj.edit4:setHeight(25);
    obj.edit4:setField("Equipamento_1_2");
    obj.edit4:setName("edit4");

    obj.edit5 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit5:setParent(obj.layout4);
    obj.edit5:setLeft(195);
    obj.edit5:setTop(0);
    obj.edit5:setWidth(50);
    obj.edit5:setHeight(25);
    obj.edit5:setField("Equipamento_Custo_1_2");
    obj.edit5:setName("edit5");

    obj.edit6 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit6:setParent(obj.layout4);
    obj.edit6:setLeft(245);
    obj.edit6:setTop(0);
    obj.edit6:setWidth(50);
    obj.edit6:setHeight(25);
    obj.edit6:setField("Equipamento_Peso_1_2");
    obj.edit6:setName("edit6");

    obj.layout5 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout5:setParent(obj.layout1);
    obj.layout5:setLeft(0);
    obj.layout5:setTop(105);
    obj.layout5:setWidth(300);
    obj.layout5:setHeight(25);
    obj.layout5:setName("layout5");

    obj.edit7 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit7:setParent(obj.layout5);
    obj.edit7:setLeft(5);
    obj.edit7:setTop(0);
    obj.edit7:setWidth(190);
    obj.edit7:setHeight(25);
    obj.edit7:setField("Equipamento_1_3");
    obj.edit7:setName("edit7");

    obj.edit8 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit8:setParent(obj.layout5);
    obj.edit8:setLeft(195);
    obj.edit8:setTop(0);
    obj.edit8:setWidth(50);
    obj.edit8:setHeight(25);
    obj.edit8:setField("Equipamento_Custo_1_3");
    obj.edit8:setName("edit8");

    obj.edit9 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit9:setParent(obj.layout5);
    obj.edit9:setLeft(245);
    obj.edit9:setTop(0);
    obj.edit9:setWidth(50);
    obj.edit9:setHeight(25);
    obj.edit9:setField("Equipamento_Peso_1_3");
    obj.edit9:setName("edit9");

    obj.layout6 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout6:setParent(obj.layout1);
    obj.layout6:setLeft(0);
    obj.layout6:setTop(130);
    obj.layout6:setWidth(300);
    obj.layout6:setHeight(25);
    obj.layout6:setName("layout6");

    obj.edit10 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit10:setParent(obj.layout6);
    obj.edit10:setLeft(5);
    obj.edit10:setTop(0);
    obj.edit10:setWidth(190);
    obj.edit10:setHeight(25);
    obj.edit10:setField("Equipamento_1_4");
    obj.edit10:setName("edit10");

    obj.edit11 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit11:setParent(obj.layout6);
    obj.edit11:setLeft(195);
    obj.edit11:setTop(0);
    obj.edit11:setWidth(50);
    obj.edit11:setHeight(25);
    obj.edit11:setField("Equipamento_Custo_1_4");
    obj.edit11:setName("edit11");

    obj.edit12 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit12:setParent(obj.layout6);
    obj.edit12:setLeft(245);
    obj.edit12:setTop(0);
    obj.edit12:setWidth(50);
    obj.edit12:setHeight(25);
    obj.edit12:setField("Equipamento_Peso_1_4");
    obj.edit12:setName("edit12");

    obj.layout7 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout7:setParent(obj.layout1);
    obj.layout7:setLeft(0);
    obj.layout7:setTop(155);
    obj.layout7:setWidth(300);
    obj.layout7:setHeight(25);
    obj.layout7:setName("layout7");

    obj.edit13 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit13:setParent(obj.layout7);
    obj.edit13:setLeft(5);
    obj.edit13:setTop(0);
    obj.edit13:setWidth(190);
    obj.edit13:setHeight(25);
    obj.edit13:setField("Equipamento_1_5");
    obj.edit13:setName("edit13");

    obj.edit14 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit14:setParent(obj.layout7);
    obj.edit14:setLeft(195);
    obj.edit14:setTop(0);
    obj.edit14:setWidth(50);
    obj.edit14:setHeight(25);
    obj.edit14:setField("Equipamento_Custo_1_5");
    obj.edit14:setName("edit14");

    obj.edit15 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit15:setParent(obj.layout7);
    obj.edit15:setLeft(245);
    obj.edit15:setTop(0);
    obj.edit15:setWidth(50);
    obj.edit15:setHeight(25);
    obj.edit15:setField("Equipamento_Peso_1_5");
    obj.edit15:setName("edit15");

    obj.layout8 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout8:setParent(obj.layout1);
    obj.layout8:setLeft(0);
    obj.layout8:setTop(180);
    obj.layout8:setWidth(300);
    obj.layout8:setHeight(25);
    obj.layout8:setName("layout8");

    obj.edit16 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit16:setParent(obj.layout8);
    obj.edit16:setLeft(5);
    obj.edit16:setTop(0);
    obj.edit16:setWidth(190);
    obj.edit16:setHeight(25);
    obj.edit16:setField("Equipamento_1_6");
    obj.edit16:setName("edit16");

    obj.edit17 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit17:setParent(obj.layout8);
    obj.edit17:setLeft(195);
    obj.edit17:setTop(0);
    obj.edit17:setWidth(50);
    obj.edit17:setHeight(25);
    obj.edit17:setField("Equipamento_Custo_1_6");
    obj.edit17:setName("edit17");

    obj.edit18 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit18:setParent(obj.layout8);
    obj.edit18:setLeft(245);
    obj.edit18:setTop(0);
    obj.edit18:setWidth(50);
    obj.edit18:setHeight(25);
    obj.edit18:setField("Equipamento_Peso_1_6");
    obj.edit18:setName("edit18");

    obj.layout9 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout9:setParent(obj.layout1);
    obj.layout9:setLeft(0);
    obj.layout9:setTop(205);
    obj.layout9:setWidth(300);
    obj.layout9:setHeight(25);
    obj.layout9:setName("layout9");

    obj.edit19 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit19:setParent(obj.layout9);
    obj.edit19:setLeft(5);
    obj.edit19:setTop(0);
    obj.edit19:setWidth(190);
    obj.edit19:setHeight(25);
    obj.edit19:setField("Equipamento_1_7");
    obj.edit19:setName("edit19");

    obj.edit20 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit20:setParent(obj.layout9);
    obj.edit20:setLeft(195);
    obj.edit20:setTop(0);
    obj.edit20:setWidth(50);
    obj.edit20:setHeight(25);
    obj.edit20:setField("Equipamento_Custo_1_7");
    obj.edit20:setName("edit20");

    obj.edit21 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit21:setParent(obj.layout9);
    obj.edit21:setLeft(245);
    obj.edit21:setTop(0);
    obj.edit21:setWidth(50);
    obj.edit21:setHeight(25);
    obj.edit21:setField("Equipamento_Peso_1_7");
    obj.edit21:setName("edit21");

    obj.layout10 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout10:setParent(obj.layout1);
    obj.layout10:setLeft(0);
    obj.layout10:setTop(230);
    obj.layout10:setWidth(300);
    obj.layout10:setHeight(25);
    obj.layout10:setName("layout10");

    obj.edit22 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit22:setParent(obj.layout10);
    obj.edit22:setLeft(5);
    obj.edit22:setTop(0);
    obj.edit22:setWidth(190);
    obj.edit22:setHeight(25);
    obj.edit22:setField("Equipamento_1_8");
    obj.edit22:setName("edit22");

    obj.edit23 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit23:setParent(obj.layout10);
    obj.edit23:setLeft(195);
    obj.edit23:setTop(0);
    obj.edit23:setWidth(50);
    obj.edit23:setHeight(25);
    obj.edit23:setField("Equipamento_Custo_1_8");
    obj.edit23:setName("edit23");

    obj.edit24 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit24:setParent(obj.layout10);
    obj.edit24:setLeft(245);
    obj.edit24:setTop(0);
    obj.edit24:setWidth(50);
    obj.edit24:setHeight(25);
    obj.edit24:setField("Equipamento_Peso_1_8");
    obj.edit24:setName("edit24");

    obj.layout11 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout11:setParent(obj.layout1);
    obj.layout11:setLeft(0);
    obj.layout11:setTop(255);
    obj.layout11:setWidth(300);
    obj.layout11:setHeight(25);
    obj.layout11:setName("layout11");

    obj.edit25 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit25:setParent(obj.layout11);
    obj.edit25:setLeft(5);
    obj.edit25:setTop(0);
    obj.edit25:setWidth(190);
    obj.edit25:setHeight(25);
    obj.edit25:setField("Equipamento_1_9");
    obj.edit25:setName("edit25");

    obj.edit26 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit26:setParent(obj.layout11);
    obj.edit26:setLeft(195);
    obj.edit26:setTop(0);
    obj.edit26:setWidth(50);
    obj.edit26:setHeight(25);
    obj.edit26:setField("Equipamento_Custo_1_9");
    obj.edit26:setName("edit26");

    obj.edit27 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit27:setParent(obj.layout11);
    obj.edit27:setLeft(245);
    obj.edit27:setTop(0);
    obj.edit27:setWidth(50);
    obj.edit27:setHeight(25);
    obj.edit27:setField("Equipamento_Peso_1_9");
    obj.edit27:setName("edit27");

    obj.layout12 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout12:setParent(obj.layout1);
    obj.layout12:setLeft(0);
    obj.layout12:setTop(280);
    obj.layout12:setWidth(300);
    obj.layout12:setHeight(25);
    obj.layout12:setName("layout12");

    obj.edit28 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit28:setParent(obj.layout12);
    obj.edit28:setLeft(5);
    obj.edit28:setTop(0);
    obj.edit28:setWidth(190);
    obj.edit28:setHeight(25);
    obj.edit28:setField("Equipamento_1_10");
    obj.edit28:setName("edit28");

    obj.edit29 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit29:setParent(obj.layout12);
    obj.edit29:setLeft(195);
    obj.edit29:setTop(0);
    obj.edit29:setWidth(50);
    obj.edit29:setHeight(25);
    obj.edit29:setField("Equipamento_Custo_1_10");
    obj.edit29:setName("edit29");

    obj.edit30 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit30:setParent(obj.layout12);
    obj.edit30:setLeft(245);
    obj.edit30:setTop(0);
    obj.edit30:setWidth(50);
    obj.edit30:setHeight(25);
    obj.edit30:setField("Equipamento_Peso_1_10");
    obj.edit30:setName("edit30");

    obj.layout13 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout13:setParent(obj.layout1);
    obj.layout13:setLeft(0);
    obj.layout13:setTop(305);
    obj.layout13:setWidth(300);
    obj.layout13:setHeight(25);
    obj.layout13:setName("layout13");

    obj.edit31 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit31:setParent(obj.layout13);
    obj.edit31:setLeft(5);
    obj.edit31:setTop(0);
    obj.edit31:setWidth(190);
    obj.edit31:setHeight(25);
    obj.edit31:setField("Equipamento_1_11");
    obj.edit31:setName("edit31");

    obj.edit32 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit32:setParent(obj.layout13);
    obj.edit32:setLeft(195);
    obj.edit32:setTop(0);
    obj.edit32:setWidth(50);
    obj.edit32:setHeight(25);
    obj.edit32:setField("Equipamento_Custo_1_11");
    obj.edit32:setName("edit32");

    obj.edit33 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit33:setParent(obj.layout13);
    obj.edit33:setLeft(245);
    obj.edit33:setTop(0);
    obj.edit33:setWidth(50);
    obj.edit33:setHeight(25);
    obj.edit33:setField("Equipamento_Peso_1_11");
    obj.edit33:setName("edit33");

    obj.layout14 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout14:setParent(obj.layout1);
    obj.layout14:setLeft(0);
    obj.layout14:setTop(330);
    obj.layout14:setWidth(300);
    obj.layout14:setHeight(25);
    obj.layout14:setName("layout14");

    obj.edit34 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit34:setParent(obj.layout14);
    obj.edit34:setLeft(5);
    obj.edit34:setTop(0);
    obj.edit34:setWidth(190);
    obj.edit34:setHeight(25);
    obj.edit34:setField("Equipamento_1_12");
    obj.edit34:setName("edit34");

    obj.edit35 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit35:setParent(obj.layout14);
    obj.edit35:setLeft(195);
    obj.edit35:setTop(0);
    obj.edit35:setWidth(50);
    obj.edit35:setHeight(25);
    obj.edit35:setField("Equipamento_Custo_1_12");
    obj.edit35:setName("edit35");

    obj.edit36 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit36:setParent(obj.layout14);
    obj.edit36:setLeft(245);
    obj.edit36:setTop(0);
    obj.edit36:setWidth(50);
    obj.edit36:setHeight(25);
    obj.edit36:setField("Equipamento_Peso_1_12");
    obj.edit36:setName("edit36");

    obj.layout15 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout15:setParent(obj.layout1);
    obj.layout15:setLeft(0);
    obj.layout15:setTop(355);
    obj.layout15:setWidth(300);
    obj.layout15:setHeight(25);
    obj.layout15:setName("layout15");

    obj.edit37 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit37:setParent(obj.layout15);
    obj.edit37:setLeft(5);
    obj.edit37:setTop(0);
    obj.edit37:setWidth(190);
    obj.edit37:setHeight(25);
    obj.edit37:setField("Equipamento_1_13");
    obj.edit37:setName("edit37");

    obj.edit38 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit38:setParent(obj.layout15);
    obj.edit38:setLeft(195);
    obj.edit38:setTop(0);
    obj.edit38:setWidth(50);
    obj.edit38:setHeight(25);
    obj.edit38:setField("Equipamento_Custo_1_13");
    obj.edit38:setName("edit38");

    obj.edit39 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit39:setParent(obj.layout15);
    obj.edit39:setLeft(245);
    obj.edit39:setTop(0);
    obj.edit39:setWidth(50);
    obj.edit39:setHeight(25);
    obj.edit39:setField("Equipamento_Peso_1_13");
    obj.edit39:setName("edit39");

    obj.layout16 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout16:setParent(obj.layout1);
    obj.layout16:setLeft(0);
    obj.layout16:setTop(380);
    obj.layout16:setWidth(300);
    obj.layout16:setHeight(25);
    obj.layout16:setName("layout16");

    obj.edit40 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit40:setParent(obj.layout16);
    obj.edit40:setLeft(5);
    obj.edit40:setTop(0);
    obj.edit40:setWidth(190);
    obj.edit40:setHeight(25);
    obj.edit40:setField("Equipamento_1_14");
    obj.edit40:setName("edit40");

    obj.edit41 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit41:setParent(obj.layout16);
    obj.edit41:setLeft(195);
    obj.edit41:setTop(0);
    obj.edit41:setWidth(50);
    obj.edit41:setHeight(25);
    obj.edit41:setField("Equipamento_Custo_1_14");
    obj.edit41:setName("edit41");

    obj.edit42 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit42:setParent(obj.layout16);
    obj.edit42:setLeft(245);
    obj.edit42:setTop(0);
    obj.edit42:setWidth(50);
    obj.edit42:setHeight(25);
    obj.edit42:setField("Equipamento_Peso_1_14");
    obj.edit42:setName("edit42");

    obj.layout17 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout17:setParent(obj.layout1);
    obj.layout17:setLeft(0);
    obj.layout17:setTop(405);
    obj.layout17:setWidth(300);
    obj.layout17:setHeight(25);
    obj.layout17:setName("layout17");

    obj.edit43 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit43:setParent(obj.layout17);
    obj.edit43:setLeft(5);
    obj.edit43:setTop(0);
    obj.edit43:setWidth(190);
    obj.edit43:setHeight(25);
    obj.edit43:setField("Equipamento_1_15");
    obj.edit43:setName("edit43");

    obj.edit44 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit44:setParent(obj.layout17);
    obj.edit44:setLeft(195);
    obj.edit44:setTop(0);
    obj.edit44:setWidth(50);
    obj.edit44:setHeight(25);
    obj.edit44:setField("Equipamento_Custo_1_15");
    obj.edit44:setName("edit44");

    obj.edit45 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit45:setParent(obj.layout17);
    obj.edit45:setLeft(245);
    obj.edit45:setTop(0);
    obj.edit45:setWidth(50);
    obj.edit45:setHeight(25);
    obj.edit45:setField("Equipamento_Peso_1_15");
    obj.edit45:setName("edit45");

    obj.layout18 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout18:setParent(obj.layout1);
    obj.layout18:setLeft(0);
    obj.layout18:setTop(430);
    obj.layout18:setWidth(300);
    obj.layout18:setHeight(25);
    obj.layout18:setName("layout18");

    obj.edit46 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit46:setParent(obj.layout18);
    obj.edit46:setLeft(5);
    obj.edit46:setTop(0);
    obj.edit46:setWidth(190);
    obj.edit46:setHeight(25);
    obj.edit46:setField("Equipamento_1_16");
    obj.edit46:setName("edit46");

    obj.edit47 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit47:setParent(obj.layout18);
    obj.edit47:setLeft(195);
    obj.edit47:setTop(0);
    obj.edit47:setWidth(50);
    obj.edit47:setHeight(25);
    obj.edit47:setField("Equipamento_Custo_1_16");
    obj.edit47:setName("edit47");

    obj.edit48 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit48:setParent(obj.layout18);
    obj.edit48:setLeft(245);
    obj.edit48:setTop(0);
    obj.edit48:setWidth(50);
    obj.edit48:setHeight(25);
    obj.edit48:setField("Equipamento_Peso_1_16");
    obj.edit48:setName("edit48");

    obj.layout19 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout19:setParent(obj.layout1);
    obj.layout19:setLeft(0);
    obj.layout19:setTop(455);
    obj.layout19:setWidth(300);
    obj.layout19:setHeight(25);
    obj.layout19:setName("layout19");

    obj.edit49 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit49:setParent(obj.layout19);
    obj.edit49:setLeft(5);
    obj.edit49:setTop(0);
    obj.edit49:setWidth(190);
    obj.edit49:setHeight(25);
    obj.edit49:setField("Equipamento_1_17");
    obj.edit49:setName("edit49");

    obj.edit50 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit50:setParent(obj.layout19);
    obj.edit50:setLeft(195);
    obj.edit50:setTop(0);
    obj.edit50:setWidth(50);
    obj.edit50:setHeight(25);
    obj.edit50:setField("Equipamento_Custo_1_17");
    obj.edit50:setName("edit50");

    obj.edit51 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit51:setParent(obj.layout19);
    obj.edit51:setLeft(245);
    obj.edit51:setTop(0);
    obj.edit51:setWidth(50);
    obj.edit51:setHeight(25);
    obj.edit51:setField("Equipamento_Peso_1_17");
    obj.edit51:setName("edit51");

    obj.layout20 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout20:setParent(obj.layout1);
    obj.layout20:setLeft(0);
    obj.layout20:setTop(480);
    obj.layout20:setWidth(300);
    obj.layout20:setHeight(25);
    obj.layout20:setName("layout20");

    obj.edit52 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit52:setParent(obj.layout20);
    obj.edit52:setLeft(5);
    obj.edit52:setTop(0);
    obj.edit52:setWidth(190);
    obj.edit52:setHeight(25);
    obj.edit52:setField("Equipamento_1_18");
    obj.edit52:setName("edit52");

    obj.edit53 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit53:setParent(obj.layout20);
    obj.edit53:setLeft(195);
    obj.edit53:setTop(0);
    obj.edit53:setWidth(50);
    obj.edit53:setHeight(25);
    obj.edit53:setField("Equipamento_Custo_1_18");
    obj.edit53:setName("edit53");

    obj.edit54 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit54:setParent(obj.layout20);
    obj.edit54:setLeft(245);
    obj.edit54:setTop(0);
    obj.edit54:setWidth(50);
    obj.edit54:setHeight(25);
    obj.edit54:setField("Equipamento_Peso_1_18");
    obj.edit54:setName("edit54");

    obj.layout21 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout21:setParent(obj.layout1);
    obj.layout21:setLeft(0);
    obj.layout21:setTop(505);
    obj.layout21:setWidth(300);
    obj.layout21:setHeight(25);
    obj.layout21:setName("layout21");

    obj.edit55 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit55:setParent(obj.layout21);
    obj.edit55:setLeft(5);
    obj.edit55:setTop(0);
    obj.edit55:setWidth(190);
    obj.edit55:setHeight(25);
    obj.edit55:setField("Equipamento_1_19");
    obj.edit55:setName("edit55");

    obj.edit56 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit56:setParent(obj.layout21);
    obj.edit56:setLeft(195);
    obj.edit56:setTop(0);
    obj.edit56:setWidth(50);
    obj.edit56:setHeight(25);
    obj.edit56:setField("Equipamento_Custo_1_19");
    obj.edit56:setName("edit56");

    obj.edit57 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit57:setParent(obj.layout21);
    obj.edit57:setLeft(245);
    obj.edit57:setTop(0);
    obj.edit57:setWidth(50);
    obj.edit57:setHeight(25);
    obj.edit57:setField("Equipamento_Peso_1_19");
    obj.edit57:setName("edit57");

    obj.layout22 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout22:setParent(obj.layout1);
    obj.layout22:setLeft(0);
    obj.layout22:setTop(530);
    obj.layout22:setWidth(300);
    obj.layout22:setHeight(25);
    obj.layout22:setName("layout22");

    obj.edit58 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit58:setParent(obj.layout22);
    obj.edit58:setLeft(5);
    obj.edit58:setTop(0);
    obj.edit58:setWidth(190);
    obj.edit58:setHeight(25);
    obj.edit58:setField("Equipamento_1_20");
    obj.edit58:setName("edit58");

    obj.edit59 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit59:setParent(obj.layout22);
    obj.edit59:setLeft(195);
    obj.edit59:setTop(0);
    obj.edit59:setWidth(50);
    obj.edit59:setHeight(25);
    obj.edit59:setField("Equipamento_Custo_1_20");
    obj.edit59:setName("edit59");

    obj.edit60 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit60:setParent(obj.layout22);
    obj.edit60:setLeft(245);
    obj.edit60:setTop(0);
    obj.edit60:setWidth(50);
    obj.edit60:setHeight(25);
    obj.edit60:setField("Equipamento_Peso_1_20");
    obj.edit60:setName("edit60");

    obj.layout23 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout23:setParent(obj.layout1);
    obj.layout23:setLeft(0);
    obj.layout23:setTop(555);
    obj.layout23:setWidth(300);
    obj.layout23:setHeight(25);
    obj.layout23:setName("layout23");

    obj.edit61 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit61:setParent(obj.layout23);
    obj.edit61:setLeft(5);
    obj.edit61:setTop(0);
    obj.edit61:setWidth(190);
    obj.edit61:setHeight(25);
    obj.edit61:setField("Equipamento_1_21");
    obj.edit61:setName("edit61");

    obj.edit62 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit62:setParent(obj.layout23);
    obj.edit62:setLeft(195);
    obj.edit62:setTop(0);
    obj.edit62:setWidth(50);
    obj.edit62:setHeight(25);
    obj.edit62:setField("Equipamento_Custo_1_21");
    obj.edit62:setName("edit62");

    obj.edit63 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit63:setParent(obj.layout23);
    obj.edit63:setLeft(245);
    obj.edit63:setTop(0);
    obj.edit63:setWidth(50);
    obj.edit63:setHeight(25);
    obj.edit63:setField("Equipamento_Peso_1_21");
    obj.edit63:setName("edit63");

    obj.layout24 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout24:setParent(obj.layout1);
    obj.layout24:setLeft(0);
    obj.layout24:setTop(580);
    obj.layout24:setWidth(300);
    obj.layout24:setHeight(25);
    obj.layout24:setName("layout24");

    obj.edit64 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit64:setParent(obj.layout24);
    obj.edit64:setLeft(5);
    obj.edit64:setTop(0);
    obj.edit64:setWidth(190);
    obj.edit64:setHeight(25);
    obj.edit64:setField("Equipamento_1_22");
    obj.edit64:setName("edit64");

    obj.edit65 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit65:setParent(obj.layout24);
    obj.edit65:setLeft(195);
    obj.edit65:setTop(0);
    obj.edit65:setWidth(50);
    obj.edit65:setHeight(25);
    obj.edit65:setField("Equipamento_Custo_1_22");
    obj.edit65:setName("edit65");

    obj.edit66 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit66:setParent(obj.layout24);
    obj.edit66:setLeft(245);
    obj.edit66:setTop(0);
    obj.edit66:setWidth(50);
    obj.edit66:setHeight(25);
    obj.edit66:setField("Equipamento_Peso_1_22");
    obj.edit66:setName("edit66");

    obj.layout25 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout25:setParent(obj.scrollBox1);
    obj.layout25:setLeft(310);
    obj.layout25:setTop(0);
    obj.layout25:setWidth(300);
    obj.layout25:setHeight(610);
    obj.layout25:setName("layout25");

    obj.rectangle2 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle2:setParent(obj.layout25);
    obj.rectangle2:setAlign("client");
    obj.rectangle2:setColor("black");
    obj.rectangle2:setXradius(5);
    obj.rectangle2:setYradius(5);
    obj.rectangle2:setCornerType("round");
    obj.rectangle2:setName("rectangle2");

    obj.label5 = gui.fromHandle(_obj_newObject("label"));
    obj.label5:setParent(obj.layout25);
    obj.label5:setLeft(0);
    obj.label5:setTop(5);
    obj.label5:setWidth(300);
    obj.label5:setHeight(20);
    obj.label5:setText("EQUIPAMENTOS");
    obj.label5:setHorzTextAlign("center");
    obj.label5:setName("label5");

    obj.layout26 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout26:setParent(obj.layout25);
    obj.layout26:setLeft(0);
    obj.layout26:setTop(30);
    obj.layout26:setWidth(300);
    obj.layout26:setHeight(25);
    obj.layout26:setName("layout26");

    obj.label6 = gui.fromHandle(_obj_newObject("label"));
    obj.label6:setParent(obj.layout26);
    obj.label6:setLeft(5);
    obj.label6:setTop(0);
    obj.label6:setWidth(190);
    obj.label6:setHeight(25);
    obj.label6:setHorzTextAlign("center");
    obj.label6:setText("Item");
    obj.label6:setName("label6");

    obj.label7 = gui.fromHandle(_obj_newObject("label"));
    obj.label7:setParent(obj.layout26);
    obj.label7:setLeft(195);
    obj.label7:setTop(0);
    obj.label7:setWidth(50);
    obj.label7:setHeight(25);
    obj.label7:setHorzTextAlign("center");
    obj.label7:setText("Custo");
    obj.label7:setName("label7");

    obj.label8 = gui.fromHandle(_obj_newObject("label"));
    obj.label8:setParent(obj.layout26);
    obj.label8:setLeft(245);
    obj.label8:setTop(0);
    obj.label8:setWidth(50);
    obj.label8:setHeight(25);
    obj.label8:setHorzTextAlign("center");
    obj.label8:setText("Peso");
    obj.label8:setName("label8");

    obj.layout27 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout27:setParent(obj.layout25);
    obj.layout27:setLeft(0);
    obj.layout27:setTop(55);
    obj.layout27:setWidth(300);
    obj.layout27:setHeight(25);
    obj.layout27:setName("layout27");

    obj.edit67 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit67:setParent(obj.layout27);
    obj.edit67:setLeft(5);
    obj.edit67:setTop(0);
    obj.edit67:setWidth(190);
    obj.edit67:setHeight(25);
    obj.edit67:setField("Equipamento_2_1");
    obj.edit67:setName("edit67");

    obj.edit68 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit68:setParent(obj.layout27);
    obj.edit68:setLeft(195);
    obj.edit68:setTop(0);
    obj.edit68:setWidth(50);
    obj.edit68:setHeight(25);
    obj.edit68:setField("Equipamento_Custo_2_1");
    obj.edit68:setName("edit68");

    obj.edit69 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit69:setParent(obj.layout27);
    obj.edit69:setLeft(245);
    obj.edit69:setTop(0);
    obj.edit69:setWidth(50);
    obj.edit69:setHeight(25);
    obj.edit69:setField("Equipamento_Peso_2_1");
    obj.edit69:setName("edit69");

    obj.layout28 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout28:setParent(obj.layout25);
    obj.layout28:setLeft(0);
    obj.layout28:setTop(80);
    obj.layout28:setWidth(300);
    obj.layout28:setHeight(25);
    obj.layout28:setName("layout28");

    obj.edit70 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit70:setParent(obj.layout28);
    obj.edit70:setLeft(5);
    obj.edit70:setTop(0);
    obj.edit70:setWidth(190);
    obj.edit70:setHeight(25);
    obj.edit70:setField("Equipamento_2_2");
    obj.edit70:setName("edit70");

    obj.edit71 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit71:setParent(obj.layout28);
    obj.edit71:setLeft(195);
    obj.edit71:setTop(0);
    obj.edit71:setWidth(50);
    obj.edit71:setHeight(25);
    obj.edit71:setField("Equipamento_Custo_2_2");
    obj.edit71:setName("edit71");

    obj.edit72 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit72:setParent(obj.layout28);
    obj.edit72:setLeft(245);
    obj.edit72:setTop(0);
    obj.edit72:setWidth(50);
    obj.edit72:setHeight(25);
    obj.edit72:setField("Equipamento_Peso_2_2");
    obj.edit72:setName("edit72");

    obj.layout29 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout29:setParent(obj.layout25);
    obj.layout29:setLeft(0);
    obj.layout29:setTop(105);
    obj.layout29:setWidth(300);
    obj.layout29:setHeight(25);
    obj.layout29:setName("layout29");

    obj.edit73 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit73:setParent(obj.layout29);
    obj.edit73:setLeft(5);
    obj.edit73:setTop(0);
    obj.edit73:setWidth(190);
    obj.edit73:setHeight(25);
    obj.edit73:setField("Equipamento_2_3");
    obj.edit73:setName("edit73");

    obj.edit74 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit74:setParent(obj.layout29);
    obj.edit74:setLeft(195);
    obj.edit74:setTop(0);
    obj.edit74:setWidth(50);
    obj.edit74:setHeight(25);
    obj.edit74:setField("Equipamento_Custo_2_3");
    obj.edit74:setName("edit74");

    obj.edit75 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit75:setParent(obj.layout29);
    obj.edit75:setLeft(245);
    obj.edit75:setTop(0);
    obj.edit75:setWidth(50);
    obj.edit75:setHeight(25);
    obj.edit75:setField("Equipamento_Peso_2_3");
    obj.edit75:setName("edit75");

    obj.layout30 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout30:setParent(obj.layout25);
    obj.layout30:setLeft(0);
    obj.layout30:setTop(130);
    obj.layout30:setWidth(300);
    obj.layout30:setHeight(25);
    obj.layout30:setName("layout30");

    obj.edit76 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit76:setParent(obj.layout30);
    obj.edit76:setLeft(5);
    obj.edit76:setTop(0);
    obj.edit76:setWidth(190);
    obj.edit76:setHeight(25);
    obj.edit76:setField("Equipamento_2_4");
    obj.edit76:setName("edit76");

    obj.edit77 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit77:setParent(obj.layout30);
    obj.edit77:setLeft(195);
    obj.edit77:setTop(0);
    obj.edit77:setWidth(50);
    obj.edit77:setHeight(25);
    obj.edit77:setField("Equipamento_Custo_2_4");
    obj.edit77:setName("edit77");

    obj.edit78 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit78:setParent(obj.layout30);
    obj.edit78:setLeft(245);
    obj.edit78:setTop(0);
    obj.edit78:setWidth(50);
    obj.edit78:setHeight(25);
    obj.edit78:setField("Equipamento_Peso_2_4");
    obj.edit78:setName("edit78");

    obj.layout31 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout31:setParent(obj.layout25);
    obj.layout31:setLeft(0);
    obj.layout31:setTop(155);
    obj.layout31:setWidth(300);
    obj.layout31:setHeight(25);
    obj.layout31:setName("layout31");

    obj.edit79 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit79:setParent(obj.layout31);
    obj.edit79:setLeft(5);
    obj.edit79:setTop(0);
    obj.edit79:setWidth(190);
    obj.edit79:setHeight(25);
    obj.edit79:setField("Equipamento_2_5");
    obj.edit79:setName("edit79");

    obj.edit80 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit80:setParent(obj.layout31);
    obj.edit80:setLeft(195);
    obj.edit80:setTop(0);
    obj.edit80:setWidth(50);
    obj.edit80:setHeight(25);
    obj.edit80:setField("Equipamento_Custo_2_5");
    obj.edit80:setName("edit80");

    obj.edit81 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit81:setParent(obj.layout31);
    obj.edit81:setLeft(245);
    obj.edit81:setTop(0);
    obj.edit81:setWidth(50);
    obj.edit81:setHeight(25);
    obj.edit81:setField("Equipamento_Peso_2_5");
    obj.edit81:setName("edit81");

    obj.layout32 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout32:setParent(obj.layout25);
    obj.layout32:setLeft(0);
    obj.layout32:setTop(180);
    obj.layout32:setWidth(300);
    obj.layout32:setHeight(25);
    obj.layout32:setName("layout32");

    obj.edit82 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit82:setParent(obj.layout32);
    obj.edit82:setLeft(5);
    obj.edit82:setTop(0);
    obj.edit82:setWidth(190);
    obj.edit82:setHeight(25);
    obj.edit82:setField("Equipamento_2_6");
    obj.edit82:setName("edit82");

    obj.edit83 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit83:setParent(obj.layout32);
    obj.edit83:setLeft(195);
    obj.edit83:setTop(0);
    obj.edit83:setWidth(50);
    obj.edit83:setHeight(25);
    obj.edit83:setField("Equipamento_Custo_2_6");
    obj.edit83:setName("edit83");

    obj.edit84 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit84:setParent(obj.layout32);
    obj.edit84:setLeft(245);
    obj.edit84:setTop(0);
    obj.edit84:setWidth(50);
    obj.edit84:setHeight(25);
    obj.edit84:setField("Equipamento_Peso_2_6");
    obj.edit84:setName("edit84");

    obj.layout33 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout33:setParent(obj.layout25);
    obj.layout33:setLeft(0);
    obj.layout33:setTop(205);
    obj.layout33:setWidth(300);
    obj.layout33:setHeight(25);
    obj.layout33:setName("layout33");

    obj.edit85 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit85:setParent(obj.layout33);
    obj.edit85:setLeft(5);
    obj.edit85:setTop(0);
    obj.edit85:setWidth(190);
    obj.edit85:setHeight(25);
    obj.edit85:setField("Equipamento_2_7");
    obj.edit85:setName("edit85");

    obj.edit86 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit86:setParent(obj.layout33);
    obj.edit86:setLeft(195);
    obj.edit86:setTop(0);
    obj.edit86:setWidth(50);
    obj.edit86:setHeight(25);
    obj.edit86:setField("Equipamento_Custo_2_7");
    obj.edit86:setName("edit86");

    obj.edit87 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit87:setParent(obj.layout33);
    obj.edit87:setLeft(245);
    obj.edit87:setTop(0);
    obj.edit87:setWidth(50);
    obj.edit87:setHeight(25);
    obj.edit87:setField("Equipamento_Peso_2_7");
    obj.edit87:setName("edit87");

    obj.layout34 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout34:setParent(obj.layout25);
    obj.layout34:setLeft(0);
    obj.layout34:setTop(230);
    obj.layout34:setWidth(300);
    obj.layout34:setHeight(25);
    obj.layout34:setName("layout34");

    obj.edit88 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit88:setParent(obj.layout34);
    obj.edit88:setLeft(5);
    obj.edit88:setTop(0);
    obj.edit88:setWidth(190);
    obj.edit88:setHeight(25);
    obj.edit88:setField("Equipamento_2_8");
    obj.edit88:setName("edit88");

    obj.edit89 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit89:setParent(obj.layout34);
    obj.edit89:setLeft(195);
    obj.edit89:setTop(0);
    obj.edit89:setWidth(50);
    obj.edit89:setHeight(25);
    obj.edit89:setField("Equipamento_Custo_2_8");
    obj.edit89:setName("edit89");

    obj.edit90 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit90:setParent(obj.layout34);
    obj.edit90:setLeft(245);
    obj.edit90:setTop(0);
    obj.edit90:setWidth(50);
    obj.edit90:setHeight(25);
    obj.edit90:setField("Equipamento_Peso_2_8");
    obj.edit90:setName("edit90");

    obj.layout35 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout35:setParent(obj.layout25);
    obj.layout35:setLeft(0);
    obj.layout35:setTop(255);
    obj.layout35:setWidth(300);
    obj.layout35:setHeight(25);
    obj.layout35:setName("layout35");

    obj.edit91 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit91:setParent(obj.layout35);
    obj.edit91:setLeft(5);
    obj.edit91:setTop(0);
    obj.edit91:setWidth(190);
    obj.edit91:setHeight(25);
    obj.edit91:setField("Equipamento_2_9");
    obj.edit91:setName("edit91");

    obj.edit92 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit92:setParent(obj.layout35);
    obj.edit92:setLeft(195);
    obj.edit92:setTop(0);
    obj.edit92:setWidth(50);
    obj.edit92:setHeight(25);
    obj.edit92:setField("Equipamento_Custo_2_9");
    obj.edit92:setName("edit92");

    obj.edit93 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit93:setParent(obj.layout35);
    obj.edit93:setLeft(245);
    obj.edit93:setTop(0);
    obj.edit93:setWidth(50);
    obj.edit93:setHeight(25);
    obj.edit93:setField("Equipamento_Peso_2_9");
    obj.edit93:setName("edit93");

    obj.layout36 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout36:setParent(obj.layout25);
    obj.layout36:setLeft(0);
    obj.layout36:setTop(280);
    obj.layout36:setWidth(300);
    obj.layout36:setHeight(25);
    obj.layout36:setName("layout36");

    obj.edit94 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit94:setParent(obj.layout36);
    obj.edit94:setLeft(5);
    obj.edit94:setTop(0);
    obj.edit94:setWidth(190);
    obj.edit94:setHeight(25);
    obj.edit94:setField("Equipamento_2_10");
    obj.edit94:setName("edit94");

    obj.edit95 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit95:setParent(obj.layout36);
    obj.edit95:setLeft(195);
    obj.edit95:setTop(0);
    obj.edit95:setWidth(50);
    obj.edit95:setHeight(25);
    obj.edit95:setField("Equipamento_Custo_2_10");
    obj.edit95:setName("edit95");

    obj.edit96 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit96:setParent(obj.layout36);
    obj.edit96:setLeft(245);
    obj.edit96:setTop(0);
    obj.edit96:setWidth(50);
    obj.edit96:setHeight(25);
    obj.edit96:setField("Equipamento_Peso_2_10");
    obj.edit96:setName("edit96");

    obj.layout37 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout37:setParent(obj.layout25);
    obj.layout37:setLeft(0);
    obj.layout37:setTop(305);
    obj.layout37:setWidth(300);
    obj.layout37:setHeight(25);
    obj.layout37:setName("layout37");

    obj.edit97 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit97:setParent(obj.layout37);
    obj.edit97:setLeft(5);
    obj.edit97:setTop(0);
    obj.edit97:setWidth(190);
    obj.edit97:setHeight(25);
    obj.edit97:setField("Equipamento_2_11");
    obj.edit97:setName("edit97");

    obj.edit98 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit98:setParent(obj.layout37);
    obj.edit98:setLeft(195);
    obj.edit98:setTop(0);
    obj.edit98:setWidth(50);
    obj.edit98:setHeight(25);
    obj.edit98:setField("Equipamento_Custo_2_11");
    obj.edit98:setName("edit98");

    obj.edit99 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit99:setParent(obj.layout37);
    obj.edit99:setLeft(245);
    obj.edit99:setTop(0);
    obj.edit99:setWidth(50);
    obj.edit99:setHeight(25);
    obj.edit99:setField("Equipamento_Peso_2_11");
    obj.edit99:setName("edit99");

    obj.layout38 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout38:setParent(obj.layout25);
    obj.layout38:setLeft(0);
    obj.layout38:setTop(330);
    obj.layout38:setWidth(300);
    obj.layout38:setHeight(25);
    obj.layout38:setName("layout38");

    obj.edit100 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit100:setParent(obj.layout38);
    obj.edit100:setLeft(5);
    obj.edit100:setTop(0);
    obj.edit100:setWidth(190);
    obj.edit100:setHeight(25);
    obj.edit100:setField("Equipamento_2_12");
    obj.edit100:setName("edit100");

    obj.edit101 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit101:setParent(obj.layout38);
    obj.edit101:setLeft(195);
    obj.edit101:setTop(0);
    obj.edit101:setWidth(50);
    obj.edit101:setHeight(25);
    obj.edit101:setField("Equipamento_Custo_2_12");
    obj.edit101:setName("edit101");

    obj.edit102 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit102:setParent(obj.layout38);
    obj.edit102:setLeft(245);
    obj.edit102:setTop(0);
    obj.edit102:setWidth(50);
    obj.edit102:setHeight(25);
    obj.edit102:setField("Equipamento_Peso_2_12");
    obj.edit102:setName("edit102");

    obj.layout39 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout39:setParent(obj.layout25);
    obj.layout39:setLeft(0);
    obj.layout39:setTop(355);
    obj.layout39:setWidth(300);
    obj.layout39:setHeight(25);
    obj.layout39:setName("layout39");

    obj.edit103 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit103:setParent(obj.layout39);
    obj.edit103:setLeft(5);
    obj.edit103:setTop(0);
    obj.edit103:setWidth(190);
    obj.edit103:setHeight(25);
    obj.edit103:setField("Equipamento_2_13");
    obj.edit103:setName("edit103");

    obj.edit104 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit104:setParent(obj.layout39);
    obj.edit104:setLeft(195);
    obj.edit104:setTop(0);
    obj.edit104:setWidth(50);
    obj.edit104:setHeight(25);
    obj.edit104:setField("Equipamento_Custo_2_13");
    obj.edit104:setName("edit104");

    obj.edit105 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit105:setParent(obj.layout39);
    obj.edit105:setLeft(245);
    obj.edit105:setTop(0);
    obj.edit105:setWidth(50);
    obj.edit105:setHeight(25);
    obj.edit105:setField("Equipamento_Peso_2_13");
    obj.edit105:setName("edit105");

    obj.layout40 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout40:setParent(obj.layout25);
    obj.layout40:setLeft(0);
    obj.layout40:setTop(380);
    obj.layout40:setWidth(300);
    obj.layout40:setHeight(25);
    obj.layout40:setName("layout40");

    obj.edit106 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit106:setParent(obj.layout40);
    obj.edit106:setLeft(5);
    obj.edit106:setTop(0);
    obj.edit106:setWidth(190);
    obj.edit106:setHeight(25);
    obj.edit106:setField("Equipamento_2_14");
    obj.edit106:setName("edit106");

    obj.edit107 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit107:setParent(obj.layout40);
    obj.edit107:setLeft(195);
    obj.edit107:setTop(0);
    obj.edit107:setWidth(50);
    obj.edit107:setHeight(25);
    obj.edit107:setField("Equipamento_Custo_2_14");
    obj.edit107:setName("edit107");

    obj.edit108 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit108:setParent(obj.layout40);
    obj.edit108:setLeft(245);
    obj.edit108:setTop(0);
    obj.edit108:setWidth(50);
    obj.edit108:setHeight(25);
    obj.edit108:setField("Equipamento_Peso_2_14");
    obj.edit108:setName("edit108");

    obj.layout41 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout41:setParent(obj.layout25);
    obj.layout41:setLeft(0);
    obj.layout41:setTop(405);
    obj.layout41:setWidth(300);
    obj.layout41:setHeight(25);
    obj.layout41:setName("layout41");

    obj.edit109 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit109:setParent(obj.layout41);
    obj.edit109:setLeft(5);
    obj.edit109:setTop(0);
    obj.edit109:setWidth(190);
    obj.edit109:setHeight(25);
    obj.edit109:setField("Equipamento_2_15");
    obj.edit109:setName("edit109");

    obj.edit110 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit110:setParent(obj.layout41);
    obj.edit110:setLeft(195);
    obj.edit110:setTop(0);
    obj.edit110:setWidth(50);
    obj.edit110:setHeight(25);
    obj.edit110:setField("Equipamento_Custo_2_15");
    obj.edit110:setName("edit110");

    obj.edit111 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit111:setParent(obj.layout41);
    obj.edit111:setLeft(245);
    obj.edit111:setTop(0);
    obj.edit111:setWidth(50);
    obj.edit111:setHeight(25);
    obj.edit111:setField("Equipamento_Peso_2_15");
    obj.edit111:setName("edit111");

    obj.layout42 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout42:setParent(obj.layout25);
    obj.layout42:setLeft(0);
    obj.layout42:setTop(430);
    obj.layout42:setWidth(300);
    obj.layout42:setHeight(25);
    obj.layout42:setName("layout42");

    obj.edit112 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit112:setParent(obj.layout42);
    obj.edit112:setLeft(5);
    obj.edit112:setTop(0);
    obj.edit112:setWidth(190);
    obj.edit112:setHeight(25);
    obj.edit112:setField("Equipamento_2_16");
    obj.edit112:setName("edit112");

    obj.edit113 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit113:setParent(obj.layout42);
    obj.edit113:setLeft(195);
    obj.edit113:setTop(0);
    obj.edit113:setWidth(50);
    obj.edit113:setHeight(25);
    obj.edit113:setField("Equipamento_Custo_2_16");
    obj.edit113:setName("edit113");

    obj.edit114 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit114:setParent(obj.layout42);
    obj.edit114:setLeft(245);
    obj.edit114:setTop(0);
    obj.edit114:setWidth(50);
    obj.edit114:setHeight(25);
    obj.edit114:setField("Equipamento_Peso_2_16");
    obj.edit114:setName("edit114");

    obj.layout43 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout43:setParent(obj.layout25);
    obj.layout43:setLeft(0);
    obj.layout43:setTop(455);
    obj.layout43:setWidth(300);
    obj.layout43:setHeight(25);
    obj.layout43:setName("layout43");

    obj.edit115 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit115:setParent(obj.layout43);
    obj.edit115:setLeft(5);
    obj.edit115:setTop(0);
    obj.edit115:setWidth(190);
    obj.edit115:setHeight(25);
    obj.edit115:setField("Equipamento_2_17");
    obj.edit115:setName("edit115");

    obj.edit116 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit116:setParent(obj.layout43);
    obj.edit116:setLeft(195);
    obj.edit116:setTop(0);
    obj.edit116:setWidth(50);
    obj.edit116:setHeight(25);
    obj.edit116:setField("Equipamento_Custo_2_17");
    obj.edit116:setName("edit116");

    obj.edit117 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit117:setParent(obj.layout43);
    obj.edit117:setLeft(245);
    obj.edit117:setTop(0);
    obj.edit117:setWidth(50);
    obj.edit117:setHeight(25);
    obj.edit117:setField("Equipamento_Peso_2_17");
    obj.edit117:setName("edit117");

    obj.layout44 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout44:setParent(obj.layout25);
    obj.layout44:setLeft(0);
    obj.layout44:setTop(480);
    obj.layout44:setWidth(300);
    obj.layout44:setHeight(25);
    obj.layout44:setName("layout44");

    obj.edit118 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit118:setParent(obj.layout44);
    obj.edit118:setLeft(5);
    obj.edit118:setTop(0);
    obj.edit118:setWidth(190);
    obj.edit118:setHeight(25);
    obj.edit118:setField("Equipamento_2_18");
    obj.edit118:setName("edit118");

    obj.edit119 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit119:setParent(obj.layout44);
    obj.edit119:setLeft(195);
    obj.edit119:setTop(0);
    obj.edit119:setWidth(50);
    obj.edit119:setHeight(25);
    obj.edit119:setField("Equipamento_Custo_2_18");
    obj.edit119:setName("edit119");

    obj.edit120 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit120:setParent(obj.layout44);
    obj.edit120:setLeft(245);
    obj.edit120:setTop(0);
    obj.edit120:setWidth(50);
    obj.edit120:setHeight(25);
    obj.edit120:setField("Equipamento_Peso_2_18");
    obj.edit120:setName("edit120");

    obj.layout45 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout45:setParent(obj.layout25);
    obj.layout45:setLeft(0);
    obj.layout45:setTop(505);
    obj.layout45:setWidth(300);
    obj.layout45:setHeight(25);
    obj.layout45:setName("layout45");

    obj.edit121 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit121:setParent(obj.layout45);
    obj.edit121:setLeft(5);
    obj.edit121:setTop(0);
    obj.edit121:setWidth(190);
    obj.edit121:setHeight(25);
    obj.edit121:setField("Equipamento_2_19");
    obj.edit121:setName("edit121");

    obj.edit122 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit122:setParent(obj.layout45);
    obj.edit122:setLeft(195);
    obj.edit122:setTop(0);
    obj.edit122:setWidth(50);
    obj.edit122:setHeight(25);
    obj.edit122:setField("Equipamento_Custo_2_19");
    obj.edit122:setName("edit122");

    obj.edit123 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit123:setParent(obj.layout45);
    obj.edit123:setLeft(245);
    obj.edit123:setTop(0);
    obj.edit123:setWidth(50);
    obj.edit123:setHeight(25);
    obj.edit123:setField("Equipamento_Peso_2_19");
    obj.edit123:setName("edit123");

    obj.layout46 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout46:setParent(obj.layout25);
    obj.layout46:setLeft(0);
    obj.layout46:setTop(530);
    obj.layout46:setWidth(300);
    obj.layout46:setHeight(25);
    obj.layout46:setName("layout46");

    obj.edit124 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit124:setParent(obj.layout46);
    obj.edit124:setLeft(5);
    obj.edit124:setTop(0);
    obj.edit124:setWidth(190);
    obj.edit124:setHeight(25);
    obj.edit124:setField("Equipamento_2_20");
    obj.edit124:setName("edit124");

    obj.edit125 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit125:setParent(obj.layout46);
    obj.edit125:setLeft(195);
    obj.edit125:setTop(0);
    obj.edit125:setWidth(50);
    obj.edit125:setHeight(25);
    obj.edit125:setField("Equipamento_Custo_2_20");
    obj.edit125:setName("edit125");

    obj.edit126 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit126:setParent(obj.layout46);
    obj.edit126:setLeft(245);
    obj.edit126:setTop(0);
    obj.edit126:setWidth(50);
    obj.edit126:setHeight(25);
    obj.edit126:setField("Equipamento_Peso_2_20");
    obj.edit126:setName("edit126");

    obj.layout47 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout47:setParent(obj.layout25);
    obj.layout47:setLeft(0);
    obj.layout47:setTop(555);
    obj.layout47:setWidth(300);
    obj.layout47:setHeight(25);
    obj.layout47:setName("layout47");

    obj.edit127 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit127:setParent(obj.layout47);
    obj.edit127:setLeft(5);
    obj.edit127:setTop(0);
    obj.edit127:setWidth(190);
    obj.edit127:setHeight(25);
    obj.edit127:setField("Equipamento_2_21");
    obj.edit127:setName("edit127");

    obj.edit128 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit128:setParent(obj.layout47);
    obj.edit128:setLeft(195);
    obj.edit128:setTop(0);
    obj.edit128:setWidth(50);
    obj.edit128:setHeight(25);
    obj.edit128:setField("Equipamento_Custo_2_21");
    obj.edit128:setName("edit128");

    obj.edit129 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit129:setParent(obj.layout47);
    obj.edit129:setLeft(245);
    obj.edit129:setTop(0);
    obj.edit129:setWidth(50);
    obj.edit129:setHeight(25);
    obj.edit129:setField("Equipamento_Peso_2_21");
    obj.edit129:setName("edit129");

    obj.layout48 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout48:setParent(obj.layout25);
    obj.layout48:setLeft(0);
    obj.layout48:setTop(580);
    obj.layout48:setWidth(300);
    obj.layout48:setHeight(25);
    obj.layout48:setName("layout48");

    obj.edit130 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit130:setParent(obj.layout48);
    obj.edit130:setLeft(5);
    obj.edit130:setTop(0);
    obj.edit130:setWidth(190);
    obj.edit130:setHeight(25);
    obj.edit130:setField("Equipamento_2_22");
    obj.edit130:setName("edit130");

    obj.edit131 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit131:setParent(obj.layout48);
    obj.edit131:setLeft(195);
    obj.edit131:setTop(0);
    obj.edit131:setWidth(50);
    obj.edit131:setHeight(25);
    obj.edit131:setField("Equipamento_Custo_2_22");
    obj.edit131:setName("edit131");

    obj.edit132 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit132:setParent(obj.layout48);
    obj.edit132:setLeft(245);
    obj.edit132:setTop(0);
    obj.edit132:setWidth(50);
    obj.edit132:setHeight(25);
    obj.edit132:setField("Equipamento_Peso_2_22");
    obj.edit132:setName("edit132");

    obj.layout49 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout49:setParent(obj.scrollBox1);
    obj.layout49:setLeft(620);
    obj.layout49:setTop(0);
    obj.layout49:setWidth(300);
    obj.layout49:setHeight(610);
    obj.layout49:setName("layout49");

    obj.rectangle3 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle3:setParent(obj.layout49);
    obj.rectangle3:setAlign("client");
    obj.rectangle3:setColor("black");
    obj.rectangle3:setXradius(5);
    obj.rectangle3:setYradius(5);
    obj.rectangle3:setCornerType("round");
    obj.rectangle3:setName("rectangle3");

    obj.label9 = gui.fromHandle(_obj_newObject("label"));
    obj.label9:setParent(obj.layout49);
    obj.label9:setLeft(0);
    obj.label9:setTop(5);
    obj.label9:setWidth(300);
    obj.label9:setHeight(20);
    obj.label9:setText("EQUIPAMENTOS");
    obj.label9:setHorzTextAlign("center");
    obj.label9:setName("label9");

    obj.layout50 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout50:setParent(obj.layout49);
    obj.layout50:setLeft(0);
    obj.layout50:setTop(30);
    obj.layout50:setWidth(300);
    obj.layout50:setHeight(25);
    obj.layout50:setName("layout50");

    obj.label10 = gui.fromHandle(_obj_newObject("label"));
    obj.label10:setParent(obj.layout50);
    obj.label10:setLeft(5);
    obj.label10:setTop(0);
    obj.label10:setWidth(190);
    obj.label10:setHeight(25);
    obj.label10:setHorzTextAlign("center");
    obj.label10:setText("Item");
    obj.label10:setName("label10");

    obj.label11 = gui.fromHandle(_obj_newObject("label"));
    obj.label11:setParent(obj.layout50);
    obj.label11:setLeft(195);
    obj.label11:setTop(0);
    obj.label11:setWidth(50);
    obj.label11:setHeight(25);
    obj.label11:setHorzTextAlign("center");
    obj.label11:setText("Custo");
    obj.label11:setName("label11");

    obj.label12 = gui.fromHandle(_obj_newObject("label"));
    obj.label12:setParent(obj.layout50);
    obj.label12:setLeft(245);
    obj.label12:setTop(0);
    obj.label12:setWidth(50);
    obj.label12:setHeight(25);
    obj.label12:setHorzTextAlign("center");
    obj.label12:setText("Peso");
    obj.label12:setName("label12");

    obj.layout51 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout51:setParent(obj.layout49);
    obj.layout51:setLeft(0);
    obj.layout51:setTop(55);
    obj.layout51:setWidth(300);
    obj.layout51:setHeight(25);
    obj.layout51:setName("layout51");

    obj.edit133 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit133:setParent(obj.layout51);
    obj.edit133:setLeft(5);
    obj.edit133:setTop(0);
    obj.edit133:setWidth(190);
    obj.edit133:setHeight(25);
    obj.edit133:setField("Equipamento_3_1");
    obj.edit133:setName("edit133");

    obj.edit134 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit134:setParent(obj.layout51);
    obj.edit134:setLeft(195);
    obj.edit134:setTop(0);
    obj.edit134:setWidth(50);
    obj.edit134:setHeight(25);
    obj.edit134:setField("Equipamento_Custo_3_1");
    obj.edit134:setName("edit134");

    obj.edit135 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit135:setParent(obj.layout51);
    obj.edit135:setLeft(245);
    obj.edit135:setTop(0);
    obj.edit135:setWidth(50);
    obj.edit135:setHeight(25);
    obj.edit135:setField("Equipamento_Peso_3_1");
    obj.edit135:setName("edit135");

    obj.layout52 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout52:setParent(obj.layout49);
    obj.layout52:setLeft(0);
    obj.layout52:setTop(80);
    obj.layout52:setWidth(300);
    obj.layout52:setHeight(25);
    obj.layout52:setName("layout52");

    obj.edit136 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit136:setParent(obj.layout52);
    obj.edit136:setLeft(5);
    obj.edit136:setTop(0);
    obj.edit136:setWidth(190);
    obj.edit136:setHeight(25);
    obj.edit136:setField("Equipamento_3_2");
    obj.edit136:setName("edit136");

    obj.edit137 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit137:setParent(obj.layout52);
    obj.edit137:setLeft(195);
    obj.edit137:setTop(0);
    obj.edit137:setWidth(50);
    obj.edit137:setHeight(25);
    obj.edit137:setField("Equipamento_Custo_3_2");
    obj.edit137:setName("edit137");

    obj.edit138 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit138:setParent(obj.layout52);
    obj.edit138:setLeft(245);
    obj.edit138:setTop(0);
    obj.edit138:setWidth(50);
    obj.edit138:setHeight(25);
    obj.edit138:setField("Equipamento_Peso_3_2");
    obj.edit138:setName("edit138");

    obj.layout53 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout53:setParent(obj.layout49);
    obj.layout53:setLeft(0);
    obj.layout53:setTop(105);
    obj.layout53:setWidth(300);
    obj.layout53:setHeight(25);
    obj.layout53:setName("layout53");

    obj.edit139 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit139:setParent(obj.layout53);
    obj.edit139:setLeft(5);
    obj.edit139:setTop(0);
    obj.edit139:setWidth(190);
    obj.edit139:setHeight(25);
    obj.edit139:setField("Equipamento_3_3");
    obj.edit139:setName("edit139");

    obj.edit140 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit140:setParent(obj.layout53);
    obj.edit140:setLeft(195);
    obj.edit140:setTop(0);
    obj.edit140:setWidth(50);
    obj.edit140:setHeight(25);
    obj.edit140:setField("Equipamento_Custo_3_3");
    obj.edit140:setName("edit140");

    obj.edit141 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit141:setParent(obj.layout53);
    obj.edit141:setLeft(245);
    obj.edit141:setTop(0);
    obj.edit141:setWidth(50);
    obj.edit141:setHeight(25);
    obj.edit141:setField("Equipamento_Peso_3_3");
    obj.edit141:setName("edit141");

    obj.layout54 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout54:setParent(obj.layout49);
    obj.layout54:setLeft(0);
    obj.layout54:setTop(130);
    obj.layout54:setWidth(300);
    obj.layout54:setHeight(25);
    obj.layout54:setName("layout54");

    obj.edit142 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit142:setParent(obj.layout54);
    obj.edit142:setLeft(5);
    obj.edit142:setTop(0);
    obj.edit142:setWidth(190);
    obj.edit142:setHeight(25);
    obj.edit142:setField("Equipamento_3_4");
    obj.edit142:setName("edit142");

    obj.edit143 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit143:setParent(obj.layout54);
    obj.edit143:setLeft(195);
    obj.edit143:setTop(0);
    obj.edit143:setWidth(50);
    obj.edit143:setHeight(25);
    obj.edit143:setField("Equipamento_Custo_3_4");
    obj.edit143:setName("edit143");

    obj.edit144 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit144:setParent(obj.layout54);
    obj.edit144:setLeft(245);
    obj.edit144:setTop(0);
    obj.edit144:setWidth(50);
    obj.edit144:setHeight(25);
    obj.edit144:setField("Equipamento_Peso_3_4");
    obj.edit144:setName("edit144");

    obj.layout55 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout55:setParent(obj.layout49);
    obj.layout55:setLeft(0);
    obj.layout55:setTop(155);
    obj.layout55:setWidth(300);
    obj.layout55:setHeight(25);
    obj.layout55:setName("layout55");

    obj.edit145 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit145:setParent(obj.layout55);
    obj.edit145:setLeft(5);
    obj.edit145:setTop(0);
    obj.edit145:setWidth(190);
    obj.edit145:setHeight(25);
    obj.edit145:setField("Equipamento_3_5");
    obj.edit145:setName("edit145");

    obj.edit146 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit146:setParent(obj.layout55);
    obj.edit146:setLeft(195);
    obj.edit146:setTop(0);
    obj.edit146:setWidth(50);
    obj.edit146:setHeight(25);
    obj.edit146:setField("Equipamento_Custo_3_5");
    obj.edit146:setName("edit146");

    obj.edit147 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit147:setParent(obj.layout55);
    obj.edit147:setLeft(245);
    obj.edit147:setTop(0);
    obj.edit147:setWidth(50);
    obj.edit147:setHeight(25);
    obj.edit147:setField("Equipamento_Peso_3_5");
    obj.edit147:setName("edit147");

    obj.layout56 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout56:setParent(obj.layout49);
    obj.layout56:setLeft(0);
    obj.layout56:setTop(180);
    obj.layout56:setWidth(300);
    obj.layout56:setHeight(25);
    obj.layout56:setName("layout56");

    obj.edit148 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit148:setParent(obj.layout56);
    obj.edit148:setLeft(5);
    obj.edit148:setTop(0);
    obj.edit148:setWidth(190);
    obj.edit148:setHeight(25);
    obj.edit148:setField("Equipamento_3_6");
    obj.edit148:setName("edit148");

    obj.edit149 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit149:setParent(obj.layout56);
    obj.edit149:setLeft(195);
    obj.edit149:setTop(0);
    obj.edit149:setWidth(50);
    obj.edit149:setHeight(25);
    obj.edit149:setField("Equipamento_Custo_3_6");
    obj.edit149:setName("edit149");

    obj.edit150 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit150:setParent(obj.layout56);
    obj.edit150:setLeft(245);
    obj.edit150:setTop(0);
    obj.edit150:setWidth(50);
    obj.edit150:setHeight(25);
    obj.edit150:setField("Equipamento_Peso_3_6");
    obj.edit150:setName("edit150");

    obj.layout57 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout57:setParent(obj.layout49);
    obj.layout57:setLeft(0);
    obj.layout57:setTop(205);
    obj.layout57:setWidth(300);
    obj.layout57:setHeight(25);
    obj.layout57:setName("layout57");

    obj.edit151 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit151:setParent(obj.layout57);
    obj.edit151:setLeft(5);
    obj.edit151:setTop(0);
    obj.edit151:setWidth(190);
    obj.edit151:setHeight(25);
    obj.edit151:setField("Equipamento_3_7");
    obj.edit151:setName("edit151");

    obj.edit152 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit152:setParent(obj.layout57);
    obj.edit152:setLeft(195);
    obj.edit152:setTop(0);
    obj.edit152:setWidth(50);
    obj.edit152:setHeight(25);
    obj.edit152:setField("Equipamento_Custo_3_7");
    obj.edit152:setName("edit152");

    obj.edit153 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit153:setParent(obj.layout57);
    obj.edit153:setLeft(245);
    obj.edit153:setTop(0);
    obj.edit153:setWidth(50);
    obj.edit153:setHeight(25);
    obj.edit153:setField("Equipamento_Peso_3_7");
    obj.edit153:setName("edit153");

    obj.layout58 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout58:setParent(obj.layout49);
    obj.layout58:setLeft(0);
    obj.layout58:setTop(230);
    obj.layout58:setWidth(300);
    obj.layout58:setHeight(25);
    obj.layout58:setName("layout58");

    obj.edit154 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit154:setParent(obj.layout58);
    obj.edit154:setLeft(5);
    obj.edit154:setTop(0);
    obj.edit154:setWidth(190);
    obj.edit154:setHeight(25);
    obj.edit154:setField("Equipamento_3_8");
    obj.edit154:setName("edit154");

    obj.edit155 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit155:setParent(obj.layout58);
    obj.edit155:setLeft(195);
    obj.edit155:setTop(0);
    obj.edit155:setWidth(50);
    obj.edit155:setHeight(25);
    obj.edit155:setField("Equipamento_Custo_3_8");
    obj.edit155:setName("edit155");

    obj.edit156 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit156:setParent(obj.layout58);
    obj.edit156:setLeft(245);
    obj.edit156:setTop(0);
    obj.edit156:setWidth(50);
    obj.edit156:setHeight(25);
    obj.edit156:setField("Equipamento_Peso_3_8");
    obj.edit156:setName("edit156");

    obj.layout59 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout59:setParent(obj.layout49);
    obj.layout59:setLeft(0);
    obj.layout59:setTop(255);
    obj.layout59:setWidth(300);
    obj.layout59:setHeight(25);
    obj.layout59:setName("layout59");

    obj.edit157 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit157:setParent(obj.layout59);
    obj.edit157:setLeft(5);
    obj.edit157:setTop(0);
    obj.edit157:setWidth(190);
    obj.edit157:setHeight(25);
    obj.edit157:setField("Equipamento_3_9");
    obj.edit157:setName("edit157");

    obj.edit158 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit158:setParent(obj.layout59);
    obj.edit158:setLeft(195);
    obj.edit158:setTop(0);
    obj.edit158:setWidth(50);
    obj.edit158:setHeight(25);
    obj.edit158:setField("Equipamento_Custo_3_9");
    obj.edit158:setName("edit158");

    obj.edit159 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit159:setParent(obj.layout59);
    obj.edit159:setLeft(245);
    obj.edit159:setTop(0);
    obj.edit159:setWidth(50);
    obj.edit159:setHeight(25);
    obj.edit159:setField("Equipamento_Peso_3_9");
    obj.edit159:setName("edit159");

    obj.layout60 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout60:setParent(obj.layout49);
    obj.layout60:setLeft(0);
    obj.layout60:setTop(280);
    obj.layout60:setWidth(300);
    obj.layout60:setHeight(25);
    obj.layout60:setName("layout60");

    obj.edit160 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit160:setParent(obj.layout60);
    obj.edit160:setLeft(5);
    obj.edit160:setTop(0);
    obj.edit160:setWidth(190);
    obj.edit160:setHeight(25);
    obj.edit160:setField("Equipamento_3_10");
    obj.edit160:setName("edit160");

    obj.edit161 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit161:setParent(obj.layout60);
    obj.edit161:setLeft(195);
    obj.edit161:setTop(0);
    obj.edit161:setWidth(50);
    obj.edit161:setHeight(25);
    obj.edit161:setField("Equipamento_Custo_3_10");
    obj.edit161:setName("edit161");

    obj.edit162 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit162:setParent(obj.layout60);
    obj.edit162:setLeft(245);
    obj.edit162:setTop(0);
    obj.edit162:setWidth(50);
    obj.edit162:setHeight(25);
    obj.edit162:setField("Equipamento_Peso_3_10");
    obj.edit162:setName("edit162");

    obj.layout61 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout61:setParent(obj.layout49);
    obj.layout61:setLeft(0);
    obj.layout61:setTop(305);
    obj.layout61:setWidth(300);
    obj.layout61:setHeight(25);
    obj.layout61:setName("layout61");

    obj.edit163 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit163:setParent(obj.layout61);
    obj.edit163:setLeft(5);
    obj.edit163:setTop(0);
    obj.edit163:setWidth(190);
    obj.edit163:setHeight(25);
    obj.edit163:setField("Equipamento_3_11");
    obj.edit163:setName("edit163");

    obj.edit164 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit164:setParent(obj.layout61);
    obj.edit164:setLeft(195);
    obj.edit164:setTop(0);
    obj.edit164:setWidth(50);
    obj.edit164:setHeight(25);
    obj.edit164:setField("Equipamento_Custo_3_11");
    obj.edit164:setName("edit164");

    obj.edit165 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit165:setParent(obj.layout61);
    obj.edit165:setLeft(245);
    obj.edit165:setTop(0);
    obj.edit165:setWidth(50);
    obj.edit165:setHeight(25);
    obj.edit165:setField("Equipamento_Peso_3_11");
    obj.edit165:setName("edit165");

    obj.layout62 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout62:setParent(obj.layout49);
    obj.layout62:setLeft(0);
    obj.layout62:setTop(330);
    obj.layout62:setWidth(300);
    obj.layout62:setHeight(25);
    obj.layout62:setName("layout62");

    obj.edit166 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit166:setParent(obj.layout62);
    obj.edit166:setLeft(5);
    obj.edit166:setTop(0);
    obj.edit166:setWidth(190);
    obj.edit166:setHeight(25);
    obj.edit166:setField("Equipamento_3_12");
    obj.edit166:setName("edit166");

    obj.edit167 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit167:setParent(obj.layout62);
    obj.edit167:setLeft(195);
    obj.edit167:setTop(0);
    obj.edit167:setWidth(50);
    obj.edit167:setHeight(25);
    obj.edit167:setField("Equipamento_Custo_3_12");
    obj.edit167:setName("edit167");

    obj.edit168 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit168:setParent(obj.layout62);
    obj.edit168:setLeft(245);
    obj.edit168:setTop(0);
    obj.edit168:setWidth(50);
    obj.edit168:setHeight(25);
    obj.edit168:setField("Equipamento_Peso_3_12");
    obj.edit168:setName("edit168");

    obj.layout63 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout63:setParent(obj.layout49);
    obj.layout63:setLeft(0);
    obj.layout63:setTop(355);
    obj.layout63:setWidth(300);
    obj.layout63:setHeight(25);
    obj.layout63:setName("layout63");

    obj.edit169 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit169:setParent(obj.layout63);
    obj.edit169:setLeft(5);
    obj.edit169:setTop(0);
    obj.edit169:setWidth(190);
    obj.edit169:setHeight(25);
    obj.edit169:setField("Equipamento_3_13");
    obj.edit169:setName("edit169");

    obj.edit170 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit170:setParent(obj.layout63);
    obj.edit170:setLeft(195);
    obj.edit170:setTop(0);
    obj.edit170:setWidth(50);
    obj.edit170:setHeight(25);
    obj.edit170:setField("Equipamento_Custo_3_13");
    obj.edit170:setName("edit170");

    obj.edit171 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit171:setParent(obj.layout63);
    obj.edit171:setLeft(245);
    obj.edit171:setTop(0);
    obj.edit171:setWidth(50);
    obj.edit171:setHeight(25);
    obj.edit171:setField("Equipamento_Peso_3_13");
    obj.edit171:setName("edit171");

    obj.layout64 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout64:setParent(obj.layout49);
    obj.layout64:setLeft(0);
    obj.layout64:setTop(380);
    obj.layout64:setWidth(300);
    obj.layout64:setHeight(25);
    obj.layout64:setName("layout64");

    obj.edit172 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit172:setParent(obj.layout64);
    obj.edit172:setLeft(5);
    obj.edit172:setTop(0);
    obj.edit172:setWidth(190);
    obj.edit172:setHeight(25);
    obj.edit172:setField("Equipamento_3_14");
    obj.edit172:setName("edit172");

    obj.edit173 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit173:setParent(obj.layout64);
    obj.edit173:setLeft(195);
    obj.edit173:setTop(0);
    obj.edit173:setWidth(50);
    obj.edit173:setHeight(25);
    obj.edit173:setField("Equipamento_Custo_3_14");
    obj.edit173:setName("edit173");

    obj.edit174 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit174:setParent(obj.layout64);
    obj.edit174:setLeft(245);
    obj.edit174:setTop(0);
    obj.edit174:setWidth(50);
    obj.edit174:setHeight(25);
    obj.edit174:setField("Equipamento_Peso_3_14");
    obj.edit174:setName("edit174");

    obj.layout65 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout65:setParent(obj.layout49);
    obj.layout65:setLeft(0);
    obj.layout65:setTop(405);
    obj.layout65:setWidth(300);
    obj.layout65:setHeight(25);
    obj.layout65:setName("layout65");

    obj.edit175 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit175:setParent(obj.layout65);
    obj.edit175:setLeft(5);
    obj.edit175:setTop(0);
    obj.edit175:setWidth(190);
    obj.edit175:setHeight(25);
    obj.edit175:setField("Equipamento_3_15");
    obj.edit175:setName("edit175");

    obj.edit176 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit176:setParent(obj.layout65);
    obj.edit176:setLeft(195);
    obj.edit176:setTop(0);
    obj.edit176:setWidth(50);
    obj.edit176:setHeight(25);
    obj.edit176:setField("Equipamento_Custo_3_15");
    obj.edit176:setName("edit176");

    obj.edit177 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit177:setParent(obj.layout65);
    obj.edit177:setLeft(245);
    obj.edit177:setTop(0);
    obj.edit177:setWidth(50);
    obj.edit177:setHeight(25);
    obj.edit177:setField("Equipamento_Peso_3_15");
    obj.edit177:setName("edit177");

    obj.layout66 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout66:setParent(obj.layout49);
    obj.layout66:setLeft(0);
    obj.layout66:setTop(430);
    obj.layout66:setWidth(300);
    obj.layout66:setHeight(25);
    obj.layout66:setName("layout66");

    obj.edit178 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit178:setParent(obj.layout66);
    obj.edit178:setLeft(5);
    obj.edit178:setTop(0);
    obj.edit178:setWidth(190);
    obj.edit178:setHeight(25);
    obj.edit178:setField("Equipamento_3_16");
    obj.edit178:setName("edit178");

    obj.edit179 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit179:setParent(obj.layout66);
    obj.edit179:setLeft(195);
    obj.edit179:setTop(0);
    obj.edit179:setWidth(50);
    obj.edit179:setHeight(25);
    obj.edit179:setField("Equipamento_Custo_3_16");
    obj.edit179:setName("edit179");

    obj.edit180 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit180:setParent(obj.layout66);
    obj.edit180:setLeft(245);
    obj.edit180:setTop(0);
    obj.edit180:setWidth(50);
    obj.edit180:setHeight(25);
    obj.edit180:setField("Equipamento_Peso_3_16");
    obj.edit180:setName("edit180");

    obj.layout67 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout67:setParent(obj.layout49);
    obj.layout67:setLeft(0);
    obj.layout67:setTop(455);
    obj.layout67:setWidth(300);
    obj.layout67:setHeight(25);
    obj.layout67:setName("layout67");

    obj.edit181 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit181:setParent(obj.layout67);
    obj.edit181:setLeft(5);
    obj.edit181:setTop(0);
    obj.edit181:setWidth(190);
    obj.edit181:setHeight(25);
    obj.edit181:setField("Equipamento_3_17");
    obj.edit181:setName("edit181");

    obj.edit182 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit182:setParent(obj.layout67);
    obj.edit182:setLeft(195);
    obj.edit182:setTop(0);
    obj.edit182:setWidth(50);
    obj.edit182:setHeight(25);
    obj.edit182:setField("Equipamento_Custo_3_17");
    obj.edit182:setName("edit182");

    obj.edit183 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit183:setParent(obj.layout67);
    obj.edit183:setLeft(245);
    obj.edit183:setTop(0);
    obj.edit183:setWidth(50);
    obj.edit183:setHeight(25);
    obj.edit183:setField("Equipamento_Peso_3_17");
    obj.edit183:setName("edit183");

    obj.layout68 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout68:setParent(obj.layout49);
    obj.layout68:setLeft(0);
    obj.layout68:setTop(480);
    obj.layout68:setWidth(300);
    obj.layout68:setHeight(25);
    obj.layout68:setName("layout68");

    obj.edit184 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit184:setParent(obj.layout68);
    obj.edit184:setLeft(5);
    obj.edit184:setTop(0);
    obj.edit184:setWidth(190);
    obj.edit184:setHeight(25);
    obj.edit184:setField("Equipamento_3_18");
    obj.edit184:setName("edit184");

    obj.edit185 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit185:setParent(obj.layout68);
    obj.edit185:setLeft(195);
    obj.edit185:setTop(0);
    obj.edit185:setWidth(50);
    obj.edit185:setHeight(25);
    obj.edit185:setField("Equipamento_Custo_3_18");
    obj.edit185:setName("edit185");

    obj.edit186 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit186:setParent(obj.layout68);
    obj.edit186:setLeft(245);
    obj.edit186:setTop(0);
    obj.edit186:setWidth(50);
    obj.edit186:setHeight(25);
    obj.edit186:setField("Equipamento_Peso_3_18");
    obj.edit186:setName("edit186");

    obj.layout69 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout69:setParent(obj.layout49);
    obj.layout69:setLeft(0);
    obj.layout69:setTop(505);
    obj.layout69:setWidth(300);
    obj.layout69:setHeight(25);
    obj.layout69:setName("layout69");

    obj.edit187 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit187:setParent(obj.layout69);
    obj.edit187:setLeft(5);
    obj.edit187:setTop(0);
    obj.edit187:setWidth(190);
    obj.edit187:setHeight(25);
    obj.edit187:setField("Equipamento_3_19");
    obj.edit187:setName("edit187");

    obj.edit188 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit188:setParent(obj.layout69);
    obj.edit188:setLeft(195);
    obj.edit188:setTop(0);
    obj.edit188:setWidth(50);
    obj.edit188:setHeight(25);
    obj.edit188:setField("Equipamento_Custo_3_19");
    obj.edit188:setName("edit188");

    obj.edit189 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit189:setParent(obj.layout69);
    obj.edit189:setLeft(245);
    obj.edit189:setTop(0);
    obj.edit189:setWidth(50);
    obj.edit189:setHeight(25);
    obj.edit189:setField("Equipamento_Peso_3_19");
    obj.edit189:setName("edit189");

    obj.layout70 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout70:setParent(obj.layout49);
    obj.layout70:setLeft(0);
    obj.layout70:setTop(530);
    obj.layout70:setWidth(300);
    obj.layout70:setHeight(25);
    obj.layout70:setName("layout70");

    obj.edit190 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit190:setParent(obj.layout70);
    obj.edit190:setLeft(5);
    obj.edit190:setTop(0);
    obj.edit190:setWidth(190);
    obj.edit190:setHeight(25);
    obj.edit190:setField("Equipamento_3_20");
    obj.edit190:setName("edit190");

    obj.edit191 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit191:setParent(obj.layout70);
    obj.edit191:setLeft(195);
    obj.edit191:setTop(0);
    obj.edit191:setWidth(50);
    obj.edit191:setHeight(25);
    obj.edit191:setField("Equipamento_Custo_3_20");
    obj.edit191:setName("edit191");

    obj.edit192 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit192:setParent(obj.layout70);
    obj.edit192:setLeft(245);
    obj.edit192:setTop(0);
    obj.edit192:setWidth(50);
    obj.edit192:setHeight(25);
    obj.edit192:setField("Equipamento_Peso_3_20");
    obj.edit192:setName("edit192");

    obj.layout71 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout71:setParent(obj.layout49);
    obj.layout71:setLeft(0);
    obj.layout71:setTop(555);
    obj.layout71:setWidth(300);
    obj.layout71:setHeight(25);
    obj.layout71:setName("layout71");

    obj.edit193 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit193:setParent(obj.layout71);
    obj.edit193:setLeft(5);
    obj.edit193:setTop(0);
    obj.edit193:setWidth(190);
    obj.edit193:setHeight(25);
    obj.edit193:setField("Equipamento_3_21");
    obj.edit193:setName("edit193");

    obj.edit194 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit194:setParent(obj.layout71);
    obj.edit194:setLeft(195);
    obj.edit194:setTop(0);
    obj.edit194:setWidth(50);
    obj.edit194:setHeight(25);
    obj.edit194:setField("Equipamento_Custo_3_21");
    obj.edit194:setName("edit194");

    obj.edit195 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit195:setParent(obj.layout71);
    obj.edit195:setLeft(245);
    obj.edit195:setTop(0);
    obj.edit195:setWidth(50);
    obj.edit195:setHeight(25);
    obj.edit195:setField("Equipamento_Peso_3_21");
    obj.edit195:setName("edit195");

    obj.layout72 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout72:setParent(obj.layout49);
    obj.layout72:setLeft(0);
    obj.layout72:setTop(580);
    obj.layout72:setWidth(300);
    obj.layout72:setHeight(25);
    obj.layout72:setName("layout72");

    obj.edit196 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit196:setParent(obj.layout72);
    obj.edit196:setLeft(5);
    obj.edit196:setTop(0);
    obj.edit196:setWidth(190);
    obj.edit196:setHeight(25);
    obj.edit196:setField("Equipamento_3_22");
    obj.edit196:setName("edit196");

    obj.edit197 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit197:setParent(obj.layout72);
    obj.edit197:setLeft(195);
    obj.edit197:setTop(0);
    obj.edit197:setWidth(50);
    obj.edit197:setHeight(25);
    obj.edit197:setField("Equipamento_Custo_3_22");
    obj.edit197:setName("edit197");

    obj.edit198 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit198:setParent(obj.layout72);
    obj.edit198:setLeft(245);
    obj.edit198:setTop(0);
    obj.edit198:setWidth(50);
    obj.edit198:setHeight(25);
    obj.edit198:setField("Equipamento_Peso_3_22");
    obj.edit198:setName("edit198");

    obj.layout73 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout73:setParent(obj.scrollBox1);
    obj.layout73:setLeft(930);
    obj.layout73:setTop(0);
    obj.layout73:setWidth(300);
    obj.layout73:setHeight(115);
    obj.layout73:setName("layout73");

    obj.rectangle4 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle4:setParent(obj.layout73);
    obj.rectangle4:setAlign("client");
    obj.rectangle4:setColor("black");
    obj.rectangle4:setXradius(5);
    obj.rectangle4:setYradius(5);
    obj.rectangle4:setCornerType("round");
    obj.rectangle4:setName("rectangle4");

    obj.label13 = gui.fromHandle(_obj_newObject("label"));
    obj.label13:setParent(obj.layout73);
    obj.label13:setLeft(0);
    obj.label13:setTop(5);
    obj.label13:setWidth(300);
    obj.label13:setHeight(20);
    obj.label13:setText("DINHEIRO E CARGA");
    obj.label13:setHorzTextAlign("center");
    obj.label13:setName("label13");

    obj.label14 = gui.fromHandle(_obj_newObject("label"));
    obj.label14:setParent(obj.layout73);
    obj.label14:setLeft(5);
    obj.label14:setTop(55);
    obj.label14:setWidth(60);
    obj.label14:setHeight(20);
    obj.label14:setText("CARGA");
    obj.label14:setHorzTextAlign("trailing");
    obj.label14:setName("label14");

    obj.rectangle5 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle5:setParent(obj.layout73);
    obj.rectangle5:setLeft(70);
    obj.rectangle5:setTop(50);
    obj.rectangle5:setWidth(40);
    obj.rectangle5:setHeight(25);
    obj.rectangle5:setColor("Black");
    obj.rectangle5:setStrokeColor("white");
    obj.rectangle5:setStrokeSize(1);
    obj.rectangle5:setName("rectangle5");

    obj.label15 = gui.fromHandle(_obj_newObject("label"));
    obj.label15:setParent(obj.layout73);
    obj.label15:setLeft(70);
    obj.label15:setTop(50);
    obj.label15:setWidth(40);
    obj.label15:setHeight(25);
    obj.label15:setField("Peso_Total");
    obj.label15:setHorzTextAlign("center");
    obj.label15:setName("label15");

    obj.label16 = gui.fromHandle(_obj_newObject("label"));
    obj.label16:setParent(obj.layout73);
    obj.label16:setLeft(120);
    obj.label16:setTop(55);
    obj.label16:setWidth(60);
    obj.label16:setHeight(20);
    obj.label16:setText("GASTOS");
    obj.label16:setHorzTextAlign("trailing");
    obj.label16:setName("label16");

    obj.rectangle6 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle6:setParent(obj.layout73);
    obj.rectangle6:setLeft(185);
    obj.rectangle6:setTop(50);
    obj.rectangle6:setWidth(40);
    obj.rectangle6:setHeight(25);
    obj.rectangle6:setColor("Black");
    obj.rectangle6:setStrokeColor("white");
    obj.rectangle6:setStrokeSize(1);
    obj.rectangle6:setName("rectangle6");

    obj.label17 = gui.fromHandle(_obj_newObject("label"));
    obj.label17:setParent(obj.layout73);
    obj.label17:setLeft(185);
    obj.label17:setTop(50);
    obj.label17:setWidth(40);
    obj.label17:setHeight(25);
    obj.label17:setField("Custo_Total");
    obj.label17:setHorzTextAlign("center");
    obj.label17:setName("label17");

    obj.label18 = gui.fromHandle(_obj_newObject("label"));
    obj.label18:setParent(obj.layout73);
    obj.label18:setLeft(5);
    obj.label18:setTop(90);
    obj.label18:setWidth(20);
    obj.label18:setHeight(20);
    obj.label18:setText("PL");
    obj.label18:setHorzTextAlign("trailing");
    obj.label18:setName("label18");

    obj.edit199 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit199:setParent(obj.layout73);
    obj.edit199:setLeft(30);
    obj.edit199:setTop(85);
    obj.edit199:setWidth(40);
    obj.edit199:setHeight(25);
    obj.edit199:setField("PL");
    obj.edit199:setName("edit199");

    obj.label19 = gui.fromHandle(_obj_newObject("label"));
    obj.label19:setParent(obj.layout73);
    obj.label19:setLeft(70);
    obj.label19:setTop(90);
    obj.label19:setWidth(20);
    obj.label19:setHeight(20);
    obj.label19:setText("PO");
    obj.label19:setHorzTextAlign("trailing");
    obj.label19:setName("label19");

    obj.edit200 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit200:setParent(obj.layout73);
    obj.edit200:setLeft(95);
    obj.edit200:setTop(85);
    obj.edit200:setWidth(40);
    obj.edit200:setHeight(25);
    obj.edit200:setField("PO");
    obj.edit200:setName("edit200");

    obj.label20 = gui.fromHandle(_obj_newObject("label"));
    obj.label20:setParent(obj.layout73);
    obj.label20:setLeft(135);
    obj.label20:setTop(90);
    obj.label20:setWidth(20);
    obj.label20:setHeight(20);
    obj.label20:setText("PP");
    obj.label20:setHorzTextAlign("trailing");
    obj.label20:setName("label20");

    obj.edit201 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit201:setParent(obj.layout73);
    obj.edit201:setLeft(160);
    obj.edit201:setTop(85);
    obj.edit201:setWidth(40);
    obj.edit201:setHeight(25);
    obj.edit201:setField("PP");
    obj.edit201:setName("edit201");

    obj.label21 = gui.fromHandle(_obj_newObject("label"));
    obj.label21:setParent(obj.layout73);
    obj.label21:setLeft(200);
    obj.label21:setTop(90);
    obj.label21:setWidth(20);
    obj.label21:setHeight(20);
    obj.label21:setText("PC");
    obj.label21:setHorzTextAlign("trailing");
    obj.label21:setName("label21");

    obj.edit202 = gui.fromHandle(_obj_newObject("edit"));
    obj.edit202:setParent(obj.layout73);
    obj.edit202:setLeft(225);
    obj.edit202:setTop(85);
    obj.edit202:setWidth(40);
    obj.edit202:setHeight(25);
    obj.edit202:setField("PC");
    obj.edit202:setName("edit202");

    obj.layout74 = gui.fromHandle(_obj_newObject("layout"));
    obj.layout74:setParent(obj.scrollBox1);
    obj.layout74:setLeft(930);
    obj.layout74:setTop(120);
    obj.layout74:setWidth(300);
    obj.layout74:setHeight(490);
    obj.layout74:setName("layout74");

    obj.rectangle7 = gui.fromHandle(_obj_newObject("rectangle"));
    obj.rectangle7:setParent(obj.layout74);
    obj.rectangle7:setAlign("client");
    obj.rectangle7:setColor("black");
    obj.rectangle7:setXradius(5);
    obj.rectangle7:setYradius(5);
    obj.rectangle7:setCornerType("round");
    obj.rectangle7:setName("rectangle7");

    obj.label22 = gui.fromHandle(_obj_newObject("label"));
    obj.label22:setParent(obj.layout74);
    obj.label22:setLeft(0);
    obj.label22:setTop(5);
    obj.label22:setWidth(300);
    obj.label22:setHeight(20);
    obj.label22:setText("OUTROS");
    obj.label22:setHorzTextAlign("center");
    obj.label22:setName("label22");

    obj.textEditor1 = gui.fromHandle(_obj_newObject("textEditor"));
    obj.textEditor1:setParent(obj.layout74);
    obj.textEditor1:setLeft(5);
    obj.textEditor1:setTop(30);
    obj.textEditor1:setWidth(290);
    obj.textEditor1:setHeight(450);
    obj.textEditor1:setField("Equipamentos_Outros");
    obj.textEditor1:setName("textEditor1");

    obj.image1 = gui.fromHandle(_obj_newObject("image"));
    obj.image1:setParent(obj.scrollBox1);
    obj.image1:setAlign("client");
    obj.image1:setSRC("https://dl.dropboxusercontent.com/u/31086811/Plugins/Ficha%20ADnD%20releases/imagens/block.png");
    obj.image1:setStyle("autoFit");
    obj.image1:setName("image1");

    obj._e_event0 = obj.edit2:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event1 = obj.edit3:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event2 = obj.edit5:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event3 = obj.edit6:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event4 = obj.edit8:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event5 = obj.edit9:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event6 = obj.edit11:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event7 = obj.edit12:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event8 = obj.edit14:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event9 = obj.edit15:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event10 = obj.edit17:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event11 = obj.edit18:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event12 = obj.edit20:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event13 = obj.edit21:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event14 = obj.edit23:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event15 = obj.edit24:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event16 = obj.edit26:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event17 = obj.edit27:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event18 = obj.edit29:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event19 = obj.edit30:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event20 = obj.edit32:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event21 = obj.edit33:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event22 = obj.edit35:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event23 = obj.edit36:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event24 = obj.edit38:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event25 = obj.edit39:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event26 = obj.edit41:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event27 = obj.edit42:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event28 = obj.edit44:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event29 = obj.edit45:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event30 = obj.edit47:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event31 = obj.edit48:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event32 = obj.edit50:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event33 = obj.edit51:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event34 = obj.edit53:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event35 = obj.edit54:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event36 = obj.edit56:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event37 = obj.edit57:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event38 = obj.edit59:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event39 = obj.edit60:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event40 = obj.edit62:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event41 = obj.edit63:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event42 = obj.edit65:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event43 = obj.edit66:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event44 = obj.edit68:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event45 = obj.edit69:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event46 = obj.edit71:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event47 = obj.edit72:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event48 = obj.edit74:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event49 = obj.edit75:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event50 = obj.edit77:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event51 = obj.edit78:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event52 = obj.edit80:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event53 = obj.edit81:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event54 = obj.edit83:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event55 = obj.edit84:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event56 = obj.edit86:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event57 = obj.edit87:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event58 = obj.edit89:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event59 = obj.edit90:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event60 = obj.edit92:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event61 = obj.edit93:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event62 = obj.edit95:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event63 = obj.edit96:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event64 = obj.edit98:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event65 = obj.edit99:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event66 = obj.edit101:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event67 = obj.edit102:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event68 = obj.edit104:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event69 = obj.edit105:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event70 = obj.edit107:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event71 = obj.edit108:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event72 = obj.edit110:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event73 = obj.edit111:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event74 = obj.edit113:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event75 = obj.edit114:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event76 = obj.edit116:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event77 = obj.edit117:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event78 = obj.edit119:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event79 = obj.edit120:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event80 = obj.edit122:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event81 = obj.edit123:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event82 = obj.edit125:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event83 = obj.edit126:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event84 = obj.edit128:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event85 = obj.edit129:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event86 = obj.edit131:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event87 = obj.edit132:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event88 = obj.edit134:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event89 = obj.edit135:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event90 = obj.edit137:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event91 = obj.edit138:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event92 = obj.edit140:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event93 = obj.edit141:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event94 = obj.edit143:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event95 = obj.edit144:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event96 = obj.edit146:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event97 = obj.edit147:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event98 = obj.edit149:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event99 = obj.edit150:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event100 = obj.edit152:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event101 = obj.edit153:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event102 = obj.edit155:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event103 = obj.edit156:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event104 = obj.edit158:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event105 = obj.edit159:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event106 = obj.edit161:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event107 = obj.edit162:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event108 = obj.edit164:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event109 = obj.edit165:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event110 = obj.edit167:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event111 = obj.edit168:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event112 = obj.edit170:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event113 = obj.edit171:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event114 = obj.edit173:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event115 = obj.edit174:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event116 = obj.edit176:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event117 = obj.edit177:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event118 = obj.edit179:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event119 = obj.edit180:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event120 = obj.edit182:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event121 = obj.edit183:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event122 = obj.edit185:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event123 = obj.edit186:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event124 = obj.edit188:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event125 = obj.edit189:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event126 = obj.edit191:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event127 = obj.edit192:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event128 = obj.edit194:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event129 = obj.edit195:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    obj._e_event130 = obj.edit197:addEventListener("onChange",
        function (self)
            sumCusto();
        end, obj);

    obj._e_event131 = obj.edit198:addEventListener("onChange",
        function (self)
            sumPeso();
        end, obj);

    function obj:_releaseEvents()
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

        if self.edit150 ~= nil then self.edit150:destroy(); self.edit150 = nil; end;
        if self.label14 ~= nil then self.label14:destroy(); self.label14 = nil; end;
        if self.edit73 ~= nil then self.edit73:destroy(); self.edit73 = nil; end;
        if self.edit64 ~= nil then self.edit64:destroy(); self.edit64 = nil; end;
        if self.edit98 ~= nil then self.edit98:destroy(); self.edit98 = nil; end;
        if self.layout15 ~= nil then self.layout15:destroy(); self.layout15 = nil; end;
        if self.edit41 ~= nil then self.edit41:destroy(); self.edit41 = nil; end;
        if self.layout10 ~= nil then self.layout10:destroy(); self.layout10 = nil; end;
        if self.layout58 ~= nil then self.layout58:destroy(); self.layout58 = nil; end;
        if self.edit172 ~= nil then self.edit172:destroy(); self.edit172 = nil; end;
        if self.edit195 ~= nil then self.edit195:destroy(); self.edit195 = nil; end;
        if self.edit36 ~= nil then self.edit36:destroy(); self.edit36 = nil; end;
        if self.edit9 ~= nil then self.edit9:destroy(); self.edit9 = nil; end;
        if self.layout64 ~= nil then self.layout64:destroy(); self.layout64 = nil; end;
        if self.edit33 ~= nil then self.edit33:destroy(); self.edit33 = nil; end;
        if self.edit185 ~= nil then self.edit185:destroy(); self.edit185 = nil; end;
        if self.edit29 ~= nil then self.edit29:destroy(); self.edit29 = nil; end;
        if self.layout63 ~= nil then self.layout63:destroy(); self.layout63 = nil; end;
        if self.edit111 ~= nil then self.edit111:destroy(); self.edit111 = nil; end;
        if self.edit28 ~= nil then self.edit28:destroy(); self.edit28 = nil; end;
        if self.layout17 ~= nil then self.layout17:destroy(); self.layout17 = nil; end;
        if self.edit71 ~= nil then self.edit71:destroy(); self.edit71 = nil; end;
        if self.layout47 ~= nil then self.layout47:destroy(); self.layout47 = nil; end;
        if self.layout41 ~= nil then self.layout41:destroy(); self.layout41 = nil; end;
        if self.edit85 ~= nil then self.edit85:destroy(); self.edit85 = nil; end;
        if self.edit201 ~= nil then self.edit201:destroy(); self.edit201 = nil; end;
        if self.edit76 ~= nil then self.edit76:destroy(); self.edit76 = nil; end;
        if self.layout24 ~= nil then self.layout24:destroy(); self.layout24 = nil; end;
        if self.layout38 ~= nil then self.layout38:destroy(); self.layout38 = nil; end;
        if self.label22 ~= nil then self.label22:destroy(); self.label22 = nil; end;
        if self.layout13 ~= nil then self.layout13:destroy(); self.layout13 = nil; end;
        if self.edit192 ~= nil then self.edit192:destroy(); self.edit192 = nil; end;
        if self.label13 ~= nil then self.label13:destroy(); self.label13 = nil; end;
        if self.layout8 ~= nil then self.layout8:destroy(); self.layout8 = nil; end;
        if self.edit153 ~= nil then self.edit153:destroy(); self.edit153 = nil; end;
        if self.layout23 ~= nil then self.layout23:destroy(); self.layout23 = nil; end;
        if self.edit82 ~= nil then self.edit82:destroy(); self.edit82 = nil; end;
        if self.edit47 ~= nil then self.edit47:destroy(); self.edit47 = nil; end;
        if self.edit131 ~= nil then self.edit131:destroy(); self.edit131 = nil; end;
        if self.layout62 ~= nil then self.layout62:destroy(); self.layout62 = nil; end;
        if self.edit169 ~= nil then self.edit169:destroy(); self.edit169 = nil; end;
        if self.layout68 ~= nil then self.layout68:destroy(); self.layout68 = nil; end;
        if self.edit149 ~= nil then self.edit149:destroy(); self.edit149 = nil; end;
        if self.rectangle5 ~= nil then self.rectangle5:destroy(); self.rectangle5 = nil; end;
        if self.edit160 ~= nil then self.edit160:destroy(); self.edit160 = nil; end;
        if self.edit120 ~= nil then self.edit120:destroy(); self.edit120 = nil; end;
        if self.edit26 ~= nil then self.edit26:destroy(); self.edit26 = nil; end;
        if self.label8 ~= nil then self.label8:destroy(); self.label8 = nil; end;
        if self.edit112 ~= nil then self.edit112:destroy(); self.edit112 = nil; end;
        if self.edit34 ~= nil then self.edit34:destroy(); self.edit34 = nil; end;
        if self.edit11 ~= nil then self.edit11:destroy(); self.edit11 = nil; end;
        if self.layout9 ~= nil then self.layout9:destroy(); self.layout9 = nil; end;
        if self.edit19 ~= nil then self.edit19:destroy(); self.edit19 = nil; end;
        if self.edit114 ~= nil then self.edit114:destroy(); self.edit114 = nil; end;
        if self.image1 ~= nil then self.image1:destroy(); self.image1 = nil; end;
        if self.layout71 ~= nil then self.layout71:destroy(); self.layout71 = nil; end;
        if self.edit5 ~= nil then self.edit5:destroy(); self.edit5 = nil; end;
        if self.layout54 ~= nil then self.layout54:destroy(); self.layout54 = nil; end;
        if self.edit183 ~= nil then self.edit183:destroy(); self.edit183 = nil; end;
        if self.label15 ~= nil then self.label15:destroy(); self.label15 = nil; end;
        if self.layout50 ~= nil then self.layout50:destroy(); self.layout50 = nil; end;
        if self.layout32 ~= nil then self.layout32:destroy(); self.layout32 = nil; end;
        if self.edit156 ~= nil then self.edit156:destroy(); self.edit156 = nil; end;
        if self.layout37 ~= nil then self.layout37:destroy(); self.layout37 = nil; end;
        if self.label12 ~= nil then self.label12:destroy(); self.label12 = nil; end;
        if self.edit68 ~= nil then self.edit68:destroy(); self.edit68 = nil; end;
        if self.edit72 ~= nil then self.edit72:destroy(); self.edit72 = nil; end;
        if self.layout36 ~= nil then self.layout36:destroy(); self.layout36 = nil; end;
        if self.edit179 ~= nil then self.edit179:destroy(); self.edit179 = nil; end;
        if self.edit69 ~= nil then self.edit69:destroy(); self.edit69 = nil; end;
        if self.layout52 ~= nil then self.layout52:destroy(); self.layout52 = nil; end;
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
        if self.edit196 ~= nil then self.edit196:destroy(); self.edit196 = nil; end;
        if self.layout34 ~= nil then self.layout34:destroy(); self.layout34 = nil; end;
        if self.edit159 ~= nil then self.edit159:destroy(); self.edit159 = nil; end;
        if self.label1 ~= nil then self.label1:destroy(); self.label1 = nil; end;
        if self.layout4 ~= nil then self.layout4:destroy(); self.layout4 = nil; end;
        if self.edit175 ~= nil then self.edit175:destroy(); self.edit175 = nil; end;
        if self.rectangle7 ~= nil then self.rectangle7:destroy(); self.rectangle7 = nil; end;
        if self.edit101 ~= nil then self.edit101:destroy(); self.edit101 = nil; end;
        if self.edit58 ~= nil then self.edit58:destroy(); self.edit58 = nil; end;
        if self.layout42 ~= nil then self.layout42:destroy(); self.layout42 = nil; end;
        if self.layout61 ~= nil then self.layout61:destroy(); self.layout61 = nil; end;
        if self.edit164 ~= nil then self.edit164:destroy(); self.edit164 = nil; end;
        if self.edit66 ~= nil then self.edit66:destroy(); self.edit66 = nil; end;
        if self.layout5 ~= nil then self.layout5:destroy(); self.layout5 = nil; end;
        if self.layout20 ~= nil then self.layout20:destroy(); self.layout20 = nil; end;
        if self.edit23 ~= nil then self.edit23:destroy(); self.edit23 = nil; end;
        if self.layout55 ~= nil then self.layout55:destroy(); self.layout55 = nil; end;
        if self.layout18 ~= nil then self.layout18:destroy(); self.layout18 = nil; end;
        if self.edit129 ~= nil then self.edit129:destroy(); self.edit129 = nil; end;
        if self.edit142 ~= nil then self.edit142:destroy(); self.edit142 = nil; end;
        if self.rectangle2 ~= nil then self.rectangle2:destroy(); self.rectangle2 = nil; end;
        if self.edit139 ~= nil then self.edit139:destroy(); self.edit139 = nil; end;
        if self.rectangle6 ~= nil then self.rectangle6:destroy(); self.rectangle6 = nil; end;
        if self.edit122 ~= nil then self.edit122:destroy(); self.edit122 = nil; end;
        if self.label21 ~= nil then self.label21:destroy(); self.label21 = nil; end;
        if self.edit40 ~= nil then self.edit40:destroy(); self.edit40 = nil; end;
        if self.edit110 ~= nil then self.edit110:destroy(); self.edit110 = nil; end;
        if self.edit99 ~= nil then self.edit99:destroy(); self.edit99 = nil; end;
        if self.edit86 ~= nil then self.edit86:destroy(); self.edit86 = nil; end;
        if self.edit182 ~= nil then self.edit182:destroy(); self.edit182 = nil; end;
        if self.label19 ~= nil then self.label19:destroy(); self.label19 = nil; end;
        if self.edit38 ~= nil then self.edit38:destroy(); self.edit38 = nil; end;
        if self.edit123 ~= nil then self.edit123:destroy(); self.edit123 = nil; end;
        if self.edit67 ~= nil then self.edit67:destroy(); self.edit67 = nil; end;
        if self.layout49 ~= nil then self.layout49:destroy(); self.layout49 = nil; end;
        if self.edit143 ~= nil then self.edit143:destroy(); self.edit143 = nil; end;
        if self.edit176 ~= nil then self.edit176:destroy(); self.edit176 = nil; end;
        if self.edit105 ~= nil then self.edit105:destroy(); self.edit105 = nil; end;
        if self.layout35 ~= nil then self.layout35:destroy(); self.layout35 = nil; end;
        if self.layout11 ~= nil then self.layout11:destroy(); self.layout11 = nil; end;
        if self.edit137 ~= nil then self.edit137:destroy(); self.edit137 = nil; end;
        if self.textEditor1 ~= nil then self.textEditor1:destroy(); self.textEditor1 = nil; end;
        if self.edit146 ~= nil then self.edit146:destroy(); self.edit146 = nil; end;
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
        if self.layout7 ~= nil then self.layout7:destroy(); self.layout7 = nil; end;
        if self.edit60 ~= nil then self.edit60:destroy(); self.edit60 = nil; end;
        if self.edit94 ~= nil then self.edit94:destroy(); self.edit94 = nil; end;
        if self.edit167 ~= nil then self.edit167:destroy(); self.edit167 = nil; end;
        if self.edit189 ~= nil then self.edit189:destroy(); self.edit189 = nil; end;
        if self.edit134 ~= nil then self.edit134:destroy(); self.edit134 = nil; end;
        if self.layout39 ~= nil then self.layout39:destroy(); self.layout39 = nil; end;
        if self.edit46 ~= nil then self.edit46:destroy(); self.edit46 = nil; end;
        if self.layout43 ~= nil then self.layout43:destroy(); self.layout43 = nil; end;
        if self.layout69 ~= nil then self.layout69:destroy(); self.layout69 = nil; end;
        if self.edit121 ~= nil then self.edit121:destroy(); self.edit121 = nil; end;
        if self.edit163 ~= nil then self.edit163:destroy(); self.edit163 = nil; end;
        if self.edit199 ~= nil then self.edit199:destroy(); self.edit199 = nil; end;
        if self.edit104 ~= nil then self.edit104:destroy(); self.edit104 = nil; end;
        if self.layout30 ~= nil then self.layout30:destroy(); self.layout30 = nil; end;
        if self.edit7 ~= nil then self.edit7:destroy(); self.edit7 = nil; end;
        if self.layout57 ~= nil then self.layout57:destroy(); self.layout57 = nil; end;
        if self.edit108 ~= nil then self.edit108:destroy(); self.edit108 = nil; end;
        if self.layout60 ~= nil then self.layout60:destroy(); self.layout60 = nil; end;
        if self.edit12 ~= nil then self.edit12:destroy(); self.edit12 = nil; end;
        if self.edit80 ~= nil then self.edit80:destroy(); self.edit80 = nil; end;
        if self.edit95 ~= nil then self.edit95:destroy(); self.edit95 = nil; end;
        if self.layout59 ~= nil then self.layout59:destroy(); self.layout59 = nil; end;
        if self.edit35 ~= nil then self.edit35:destroy(); self.edit35 = nil; end;
        if self.edit171 ~= nil then self.edit171:destroy(); self.edit171 = nil; end;
        if self.layout65 ~= nil then self.layout65:destroy(); self.layout65 = nil; end;
        if self.edit92 ~= nil then self.edit92:destroy(); self.edit92 = nil; end;
        if self.edit186 ~= nil then self.edit186:destroy(); self.edit186 = nil; end;
        if self.edit97 ~= nil then self.edit97:destroy(); self.edit97 = nil; end;
        if self.layout72 ~= nil then self.layout72:destroy(); self.layout72 = nil; end;
        if self.edit57 ~= nil then self.edit57:destroy(); self.edit57 = nil; end;
        if self.edit147 ~= nil then self.edit147:destroy(); self.edit147 = nil; end;
        if self.layout3 ~= nil then self.layout3:destroy(); self.layout3 = nil; end;
        if self.edit54 ~= nil then self.edit54:destroy(); self.edit54 = nil; end;
        if self.edit63 ~= nil then self.edit63:destroy(); self.edit63 = nil; end;
        if self.edit100 ~= nil then self.edit100:destroy(); self.edit100 = nil; end;
        if self.layout1 ~= nil then self.layout1:destroy(); self.layout1 = nil; end;
        if self.edit61 ~= nil then self.edit61:destroy(); self.edit61 = nil; end;
        if self.rectangle1 ~= nil then self.rectangle1:destroy(); self.rectangle1 = nil; end;
        if self.edit50 ~= nil then self.edit50:destroy(); self.edit50 = nil; end;
        if self.edit84 ~= nil then self.edit84:destroy(); self.edit84 = nil; end;
        if self.layout45 ~= nil then self.layout45:destroy(); self.layout45 = nil; end;
        if self.edit24 ~= nil then self.edit24:destroy(); self.edit24 = nil; end;
        if self.edit59 ~= nil then self.edit59:destroy(); self.edit59 = nil; end;
        if self.layout12 ~= nil then self.layout12:destroy(); self.layout12 = nil; end;
        if self.edit14 ~= nil then self.edit14:destroy(); self.edit14 = nil; end;
        if self.edit88 ~= nil then self.edit88:destroy(); self.edit88 = nil; end;
        if self.layout46 ~= nil then self.layout46:destroy(); self.layout46 = nil; end;
        if self.edit4 ~= nil then self.edit4:destroy(); self.edit4 = nil; end;
        if self.edit44 ~= nil then self.edit44:destroy(); self.edit44 = nil; end;
        if self.layout25 ~= nil then self.layout25:destroy(); self.layout25 = nil; end;
        if self.layout56 ~= nil then self.layout56:destroy(); self.layout56 = nil; end;
        if self.edit89 ~= nil then self.edit89:destroy(); self.edit89 = nil; end;
        if self.edit198 ~= nil then self.edit198:destroy(); self.edit198 = nil; end;
        if self.label4 ~= nil then self.label4:destroy(); self.label4 = nil; end;
        if self.label6 ~= nil then self.label6:destroy(); self.label6 = nil; end;
        if self.edit128 ~= nil then self.edit128:destroy(); self.edit128 = nil; end;
        if self.layout66 ~= nil then self.layout66:destroy(); self.layout66 = nil; end;
        if self.edit200 ~= nil then self.edit200:destroy(); self.edit200 = nil; end;
        if self.edit187 ~= nil then self.edit187:destroy(); self.edit187 = nil; end;
        if self.edit103 ~= nil then self.edit103:destroy(); self.edit103 = nil; end;
        if self.edit127 ~= nil then self.edit127:destroy(); self.edit127 = nil; end;
        if self.edit148 ~= nil then self.edit148:destroy(); self.edit148 = nil; end;
        if self.edit165 ~= nil then self.edit165:destroy(); self.edit165 = nil; end;
        if self.layout26 ~= nil then self.layout26:destroy(); self.layout26 = nil; end;
        if self.edit45 ~= nil then self.edit45:destroy(); self.edit45 = nil; end;
        if self.edit8 ~= nil then self.edit8:destroy(); self.edit8 = nil; end;
        if self.layout27 ~= nil then self.layout27:destroy(); self.layout27 = nil; end;
        if self.edit53 ~= nil then self.edit53:destroy(); self.edit53 = nil; end;
        if self.edit180 ~= nil then self.edit180:destroy(); self.edit180 = nil; end;
        if self.edit145 ~= nil then self.edit145:destroy(); self.edit145 = nil; end;
        if self.layout28 ~= nil then self.layout28:destroy(); self.layout28 = nil; end;
        if self.layout44 ~= nil then self.layout44:destroy(); self.layout44 = nil; end;
        if self.edit181 ~= nil then self.edit181:destroy(); self.edit181 = nil; end;
        if self.layout19 ~= nil then self.layout19:destroy(); self.layout19 = nil; end;
        if self.edit2 ~= nil then self.edit2:destroy(); self.edit2 = nil; end;
        if self.edit96 ~= nil then self.edit96:destroy(); self.edit96 = nil; end;
        if self.edit107 ~= nil then self.edit107:destroy(); self.edit107 = nil; end;
        if self.label9 ~= nil then self.label9:destroy(); self.label9 = nil; end;
        if self.edit109 ~= nil then self.edit109:destroy(); self.edit109 = nil; end;
        if self.layout74 ~= nil then self.layout74:destroy(); self.layout74 = nil; end;
        if self.edit30 ~= nil then self.edit30:destroy(); self.edit30 = nil; end;
        if self.edit21 ~= nil then self.edit21:destroy(); self.edit21 = nil; end;
        if self.edit56 ~= nil then self.edit56:destroy(); self.edit56 = nil; end;
        if self.edit197 ~= nil then self.edit197:destroy(); self.edit197 = nil; end;
        if self.edit141 ~= nil then self.edit141:destroy(); self.edit141 = nil; end;
        if self.edit55 ~= nil then self.edit55:destroy(); self.edit55 = nil; end;
        if self.edit174 ~= nil then self.edit174:destroy(); self.edit174 = nil; end;
        if self.edit43 ~= nil then self.edit43:destroy(); self.edit43 = nil; end;
        if self.edit152 ~= nil then self.edit152:destroy(); self.edit152 = nil; end;
        if self.edit133 ~= nil then self.edit133:destroy(); self.edit133 = nil; end;
        if self.label17 ~= nil then self.label17:destroy(); self.label17 = nil; end;
        if self.edit75 ~= nil then self.edit75:destroy(); self.edit75 = nil; end;
        if self.edit193 ~= nil then self.edit193:destroy(); self.edit193 = nil; end;
        if self.edit65 ~= nil then self.edit65:destroy(); self.edit65 = nil; end;
        if self.edit93 ~= nil then self.edit93:destroy(); self.edit93 = nil; end;
        if self.edit126 ~= nil then self.edit126:destroy(); self.edit126 = nil; end;
        if self.edit13 ~= nil then self.edit13:destroy(); self.edit13 = nil; end;
        if self.edit39 ~= nil then self.edit39:destroy(); self.edit39 = nil; end;
        if self.edit130 ~= nil then self.edit130:destroy(); self.edit130 = nil; end;
        if self.layout53 ~= nil then self.layout53:destroy(); self.layout53 = nil; end;
        if self.edit81 ~= nil then self.edit81:destroy(); self.edit81 = nil; end;
        if self.edit177 ~= nil then self.edit177:destroy(); self.edit177 = nil; end;
        if self.edit144 ~= nil then self.edit144:destroy(); self.edit144 = nil; end;
        if self.edit166 ~= nil then self.edit166:destroy(); self.edit166 = nil; end;
        if self.rectangle3 ~= nil then self.rectangle3:destroy(); self.rectangle3 = nil; end;
        if self.edit37 ~= nil then self.edit37:destroy(); self.edit37 = nil; end;
        if self.edit151 ~= nil then self.edit151:destroy(); self.edit151 = nil; end;
        if self.edit132 ~= nil then self.edit132:destroy(); self.edit132 = nil; end;
        if self.edit184 ~= nil then self.edit184:destroy(); self.edit184 = nil; end;
        if self.edit188 ~= nil then self.edit188:destroy(); self.edit188 = nil; end;
        if self.layout70 ~= nil then self.layout70:destroy(); self.layout70 = nil; end;
        if self.layout31 ~= nil then self.layout31:destroy(); self.layout31 = nil; end;
        if self.label10 ~= nil then self.label10:destroy(); self.label10 = nil; end;
        if self.edit17 ~= nil then self.edit17:destroy(); self.edit17 = nil; end;
        if self.edit51 ~= nil then self.edit51:destroy(); self.edit51 = nil; end;
        if self.layout2 ~= nil then self.layout2:destroy(); self.layout2 = nil; end;
        if self.edit119 ~= nil then self.edit119:destroy(); self.edit119 = nil; end;
        if self.edit48 ~= nil then self.edit48:destroy(); self.edit48 = nil; end;
        if self.edit155 ~= nil then self.edit155:destroy(); self.edit155 = nil; end;
        if self.edit162 ~= nil then self.edit162:destroy(); self.edit162 = nil; end;
        if self.edit170 ~= nil then self.edit170:destroy(); self.edit170 = nil; end;
        if self.layout67 ~= nil then self.layout67:destroy(); self.layout67 = nil; end;
        if self.edit87 ~= nil then self.edit87:destroy(); self.edit87 = nil; end;
        if self.layout29 ~= nil then self.layout29:destroy(); self.layout29 = nil; end;
        if self.edit168 ~= nil then self.edit168:destroy(); self.edit168 = nil; end;
        if self.edit190 ~= nil then self.edit190:destroy(); self.edit190 = nil; end;
        if self.edit194 ~= nil then self.edit194:destroy(); self.edit194 = nil; end;
        if self.edit113 ~= nil then self.edit113:destroy(); self.edit113 = nil; end;
        if self.edit15 ~= nil then self.edit15:destroy(); self.edit15 = nil; end;
        if self.label11 ~= nil then self.label11:destroy(); self.label11 = nil; end;
        if self.label3 ~= nil then self.label3:destroy(); self.label3 = nil; end;
        if self.label20 ~= nil then self.label20:destroy(); self.label20 = nil; end;
        if self.edit78 ~= nil then self.edit78:destroy(); self.edit78 = nil; end;
        if self.layout40 ~= nil then self.layout40:destroy(); self.layout40 = nil; end;
        if self.edit138 ~= nil then self.edit138:destroy(); self.edit138 = nil; end;
        if self.edit202 ~= nil then self.edit202:destroy(); self.edit202 = nil; end;
        if self.edit91 ~= nil then self.edit91:destroy(); self.edit91 = nil; end;
        if self.edit70 ~= nil then self.edit70:destroy(); self.edit70 = nil; end;
        if self.label7 ~= nil then self.label7:destroy(); self.label7 = nil; end;
        if self.edit42 ~= nil then self.edit42:destroy(); self.edit42 = nil; end;
        if self.edit22 ~= nil then self.edit22:destroy(); self.edit22 = nil; end;
        if self.edit118 ~= nil then self.edit118:destroy(); self.edit118 = nil; end;
        if self.edit154 ~= nil then self.edit154:destroy(); self.edit154 = nil; end;
        if self.layout6 ~= nil then self.layout6:destroy(); self.layout6 = nil; end;
        if self.label5 ~= nil then self.label5:destroy(); self.label5 = nil; end;
        if self.layout22 ~= nil then self.layout22:destroy(); self.layout22 = nil; end;
        if self.layout48 ~= nil then self.layout48:destroy(); self.layout48 = nil; end;
        if self.layout73 ~= nil then self.layout73:destroy(); self.layout73 = nil; end;
        if self.rectangle4 ~= nil then self.rectangle4:destroy(); self.rectangle4 = nil; end;
        if self.edit135 ~= nil then self.edit135:destroy(); self.edit135 = nil; end;
        if self.edit191 ~= nil then self.edit191:destroy(); self.edit191 = nil; end;
        if self.edit32 ~= nil then self.edit32:destroy(); self.edit32 = nil; end;
        if self.edit136 ~= nil then self.edit136:destroy(); self.edit136 = nil; end;
        if self.edit102 ~= nil then self.edit102:destroy(); self.edit102 = nil; end;
        if self.edit178 ~= nil then self.edit178:destroy(); self.edit178 = nil; end;
        if self.edit173 ~= nil then self.edit173:destroy(); self.edit173 = nil; end;
        if self.edit117 ~= nil then self.edit117:destroy(); self.edit117 = nil; end;
        if self.edit20 ~= nil then self.edit20:destroy(); self.edit20 = nil; end;
        self:_oldLFMDestroy();
    end;

    obj:endUpdate();

     __o_rrpgObjs.endObjectsLoading();

    return obj;
end;

local _frmADnD3 = {
    newEditor = newfrmADnD3, 
    new = newfrmADnD3, 
    name = "frmADnD3", 
    dataType = "", 
    formType = "undefined", 
    formComponentName = "form", 
    title = "", 
    description=""};

frmADnD3 = _frmADnD3;
rrpg.registrarForm(_frmADnD3);

return _frmADnD3;
